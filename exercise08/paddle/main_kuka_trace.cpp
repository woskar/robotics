#include <iostream>
#include <Eigen/Core>
#include <Eigen/Dense>
#include <Eigen/Geometry> 

#include <fstream>
#include <vector>
#include <string>

#include <rbdl/rbdl.h>
#ifndef RBDL_BUILD_ADDON_LUAMODEL
	#error "Error: RBDL addon LuaModel not enabled."
#endif
#include <rbdl/addons/luamodel/luamodel.h>

using namespace RigidBodyDynamics;

using namespace Eigen;


#include "paddle.h"

using namespace Eigen;
const double g = 9.81;
const int dim=6;


// Define a few types to make it easier
typedef VectorXd (*rhsFuncPtr) (const double, const VectorXd&);
typedef VectorXd (*integratorFuncPtr) (const double, const VectorXd&, const double, rhsFuncPtr);



VectorXd heun_integrator (const double t, const VectorXd &y, const double h, rhsFuncPtr rhs) {
	return 0.5 * (rhs (t, y) + rhs (t + h, y + h * rhs(t, y)));
}
VectorXd rk4_integrator (const double t, const VectorXd &y, const double h, rhsFuncPtr rhs) {
	VectorXd k1 = rhs (t, y);
	VectorXd k2 = rhs (t + (double) 0.5 * h, y + (double) 0.5 * h * k1);
	VectorXd k3 = rhs (t + (double) 0.5 * h, y + (double) 0.5 * h * k2);
	VectorXd k4 = rhs (t + h, y + h * k3);

	return (double) 1. / 6. * (k1 + (double) 2. * k2 + (double) 2. * k3 + k4);
}

VectorXd euler_integrator (const double t, const VectorXd &y, const double h, rhsFuncPtr rhs) {
	return rhs (t, y);
}


VectorXd rhs (double t, const VectorXd &y) {
	assert (y.size() == dim);

	VectorXd res = VectorXd::Zero(dim);
	res[0] = y[3];
	res[1] = y[4];
	res[2] = y[5];
	res[3] = 0;
	res[4] = 0;
	res[5] = -g;

	return res;
}


int main(int argc, char *argv[]) {

	Model model;
	if (!Addons::LuaModelReadFromFile ("kuka_paddle.lua", &model, false)) {
		std::cerr << "Error loading lua file" << std::endl;
		abort();
	}
	Paddle paddle;

	// Initial values
	// x,y,z,v_x,v_y,v_z
	VectorXd y0  = VectorXd::Zero(dim);
	y0[0] = 1.2;
	y0[1] = 0.0;
	y0[2] = 1;
	y0[3] = -0.15;
	y0[4] = 0.1;
	y0[5] = 0;
	double t0 = 0.;

	double tf = 20.0;
	double h = 0.005;
		
	double t = t0;
	VectorXd y = y0;
	
	VectorXd q(9);
	q << 0, 0, 0, 0, 0, 0, 0, 0, 0;

	std::ofstream of("animation_kuka_trace.csv");

	int paddle_id = model.GetBodyId("Paddle");

	while (t <= tf) {

		Eigen::Ref<Eigen::VectorXd> pos = y.segment(0, 3);
		Eigen::Ref<Eigen::VectorXd> v = y.segment(3, 3);


		// Set up your constraints here <-----------
		InverseKinematicsConstraintSet cs;
		//cs.AddPointConstraint (paddle_id, Vector3d(0,0,0), desiredPosition);
		//cs.AddOrientationConstraint(paddle_id, desiredOrientation);
		
		
		// run Inverse Kinematic
		VectorXd q_new(9);
        	if( InverseKinematics(model, q, cs, q_new)) {
			q = q_new;
		}

		// forward kinematics to obtain the paddle position and orientation
		paddle.position =  CalcBodyToBaseCoordinates(model, q, 
					paddle_id, Vector3d(0,0,0), true);
		paddle.orientation = CalcBodyWoldOrientation(model, q, paddle_id, false);


		of << t << ", " << pos[0] << ", " << pos[1] << ", " << pos[2];
		of <<  ", " << q[3] << ", " << q[4] << ", " << q[5] <<  ", " << q[6] << ", " << q[7] << ", " << q[8] << "\n";

		y = y + h * rk4_integrator (t, y, h, rhs);
		t = t + h;

		
		if (paddle.canHitBall(pos,v)) {
			v = paddle.reflect(v);
			
		}

		// floor
		if (pos[2] < ball_r && v[2] < 0) {
			v[2] *=-1;
		}
	}

	of.close();
	return 0;
}
