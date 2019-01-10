#ifndef PADDLE_H
#define PADDLE_H

#include <iostream>
#include <Eigen/Core>
#include <Eigen/Dense>
#include <Eigen/Geometry> 

const double ball_r=0./2.;
const double paddle_r=0.2;
const double room_l=3;


class Paddle {
public:
Paddle();
~Paddle();

bool canHitBall(Eigen::Vector3d pos, Eigen::Vector3d v);
Eigen::Vector3d reflect(Eigen::Vector3d v);

Eigen::Vector3d getEulerAngles();


Eigen::Matrix<double,3,3> orientation;
Eigen::Vector3d position;


};
#endif //PADDLE_H
