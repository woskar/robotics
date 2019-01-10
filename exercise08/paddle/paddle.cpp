
#include "paddle.h"
#include <cmath>

using namespace Eigen;


Paddle::Paddle() : orientation( Eigen::Matrix3d::Identity()), position(0.,0.,0.){

}
Paddle::~Paddle() {

}

Eigen::Vector3d Paddle::getEulerAngles() {
	return orientation.transpose().eulerAngles(2, 0, 2); 
}

bool Paddle::canHitBall(Eigen::Vector3d pos, Eigen::Vector3d v) {

	// and pos[1] <= std::sqrt(paddle_r * paddle_r) and pos[3] <= std::sqrt(paddle_r * paddle_r)
	double xPos = pos[0]-position[0];
	double yPos = pos[1]-position[1];
	double sPaddle = paddle_r * paddle_r;

	return (pos[2] < position[2] and v[2] < 0 
		and xPos * xPos < sPaddle 
		and yPos * yPos < sPaddle
		); //<- Replace this 
	
}

Eigen::Vector3d Paddle::reflect(Eigen::Vector3d v) {
			Eigen::Vector3d local = orientation * v;

			//Put your reflection matrix here
			Eigen::Matrix<double,3,3> refl;
			refl <<	1, 0, 0,
				0, 1, 0,
				0, 0, -1;
			Eigen::Vector3d localReflected = refl * local;
			
			// return refl * v; //<- Replace this Adjust this line
			return  orientation.transpose() * localReflected; 
}
