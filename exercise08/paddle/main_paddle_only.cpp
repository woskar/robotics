#include <iostream>
#include <Eigen/Core>
#include <Eigen/Dense>
#include <Eigen/Geometry> 

#include <fstream>
#include <vector>
#include <string>


#include "paddle.h"

using namespace Eigen;
const double g = 9.81;

const double f=0.01;

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

	Paddle paddle;

	// Initial values
	// x,y,z,v_x,v_y,v_z
	VectorXd y0  = VectorXd::Zero(dim);
	y0[0] = .0;
	y0[1] = 0.0;
	y0[2] = 1.0;
	y0[3] = -0.1;
	y0[4] = 0.0;
	y0[5] = 0.0;
	double t0 = 0.;

	double tf = 5.0;
	double h = 0.005;
		
	double t = t0;
	VectorXd y = y0;

	std::ofstream of("animation_paddle_only.csv");

	paddle.orientation = AngleAxisd(0.1*M_PI, Vector3d::UnitX());
	
	paddle.position=Vector3d(0,0,0);

	while (t <= tf) {
		Eigen::Ref<Eigen::VectorXd> pos = y.segment(0, 3);
		Eigen::Ref<Eigen::VectorXd> v = y.segment(3, 3);
		Vector3d ea = paddle.getEulerAngles();
		
		of << t << ", " << pos[0] << ", " << pos[1] << ", " << pos[2];
		of <<  ", " << paddle.position[0] << ", " << paddle.position[1] << ", " << paddle.position[2] ;
		of <<  ", " << ea[0] << ", " << ea[1] << ", " << ea[2] << "\n";
		y = y + h * rk4_integrator (t, y, h, rhs);
		t = t + h;

		if (paddle.canHitBall(pos,v)) {
			v = paddle.reflect(v);
			
		}
			
	}

	of.close();
	return 0;
}
