
math = require('math')
paddle_r=.2;

meshes = {
   paddlered = {
      name = "Paddle",
      color = { 1.0, 0.0, 0.0}, 
      src = "meshes/cylinder.obj",
      dimensions = { paddle_r*2,paddle_r*2,0.01 }, 
      mesh_center = { 0, 0.0, -0.005 },
   },
   paddleblack = {
      name = "Paddle",
      color = { 0.3, 0.3, 0.3}, 
      src = "meshes/cylinder.obj",
      dimensions = { paddle_r*2,paddle_r*2,0.01 }, 
      mesh_center = { 0, 0.0, -0.015 },
},
   massA = {
      name = "MassA",
      color = { 0.0, 0.0, 1.0}, 
      src = "meshes/unit_sphere_medres.obj",
      dimensions = { .1,.1,.1 }, 
      mesh_center = { 0, 0.0, 0 },
   },
}


model = {

   configuration = {
      axis_front = { 1, 0, 0 },
      axis_up    = { 0, 0, 1 },
      axis_right = { 0, -1, 0 },
      rotation_order = { 2, 1, 0},
   },

  
   frames = {
   
      {

	 name = "Ball",
	 parent = "ROOT",
	 -- :: kinematics
	 joint_frame = {
	    r = { 0, 0 , 0.0 },   
	 },

	 visuals = {
	    meshes.massA,
	 },
      },
      {

	 name = "Paddle",
	 parent = "ROOT",
	 -- :: kinematics
	 joint_frame = {
	    r = { 0, 0 , 0.0 },   
	 },

	 visuals = {
	    meshes.paddlered,
	    meshes.paddleblack,
	 },
      }
   }
}

-- ||-----------------------------------------------------------------||

return model
