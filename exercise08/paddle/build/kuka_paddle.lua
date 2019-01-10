print("KUKA")

gr_offset = 0.13;
paddle_r=.2;
l=3;
h=2;
meshes = {
  Base = {
    name = "Base",
    scale = { 1, 1, 1},
    color = { 0.1, 0.1, 0.1},
    src = "meshes/kuka.obj:base",
  },
  B1 = {
    name = "B1",
    color = { 0.9, 0.9, 0.9},
    translate = { 0, 0, -0.203},
    src = "meshes/kuka.obj:1",
  },
  B2 = {
    name = "B2",
    color = { 0.9, 0.9, 0.9},
    translate = { -0.075, 0, -0.335},
    src = "meshes/kuka.obj:2",
  },
  B3 = {
    name = "B3",
    color = { 0.9, 0.9, 0.9},
    translate = { -0.44, -0, -0.335},
    src = "meshes/kuka.obj:3",
  },
  B4 = {
    name = "B4",
    color = { 0.9, 0.9, 0.9},
    translate = { -0.648, -0, -0.425},
    src = "meshes/kuka.obj:4",
  },
  font = {
    name = "font",
    color = { 1, 0.419608, 0.141176},
    translate = { -0.648, -0, -0.425},
    src = "meshes/kuka.obj:font",
  },
  B5 = {
    name = "B5",
    color = { 0.9, 0.9, 0.9},
    translate = { -0.845, 0, -0.425},
    src = "meshes/kuka.obj:5",
  },
  B6 = {
    name = "B6",
    color = { 0.1, 0.1, 0.1},
    translate = { -0.925, 0, -0.425},
    src = "meshes/kuka.obj:6",
  },
  gr0 = {
    name = "gr0",
    color = { 0.65625, 0.613281, 0.0585938},
    translate = { -0.925-gr_offset, -0, -0.425},
    src = "meshes/kuka.obj:gr0",
  },
  gr1 = {
    name = "gr1",
    color = { 0.1, 0.1, 0.1},
    translate = { -0.925-gr_offset, 0, -0.425},
    src = "meshes/kuka.obj:gr1",
  },
  gr2 = {
    name = "gr2",
    color = { 0.1, 0.1, 0.1},
    translate = { -0.925-gr_offset, 0, -0.425},
    src = "meshes/kuka.obj:gr2",
  },
  gr1b = {
    name = "gr1b",
    color = { 0.7, 0.7, 0.7},
    translate = { -0.925-gr_offset, 0, -0.425},
    src = "meshes/kuka.obj:gr1b",
  },
  gr2b = {
    name = "gr2b",
    color = { 0.7, 0.7, 0.7},
translate = { -0.925-gr_offset, 0, -0.425},
    src = "meshes/kuka.obj:gr2b",
  },
  glass = {
    name = "glass",
    color = { 0.2, 0.2, 0.8},
    translate = { 0, 0, 0},
    src = "meshes/glass.obj",
  },
  table = {
    color = { 0.7, 0.7, 0.7},
    translate = { 0.1, 0, 0},
    src = "meshes/kuka_table.obj",
  },
  cage = {
    color = { 0.9, 0.9, 0.9},
    translate = { 0.1, 0, 0},
    src = "meshes/kuka_cage.obj",
  },
   
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
	 name = "wall",
	 parent = "ROOT",
	 -- :: kinematics
	 joint_frame = {
	    r = { 0, 0 , 0.0 },   
	 },
    },
    {
	 name = "Ballx",
	 parent = "ROOT",
	 -- :: kinematics
	 joint_frame = {
	    r = { 0, 0 , 0.0 },   
	 },
	 joint = { 
	    { 0.0, 0.0, 0.0, 1.0, 0.0, 0.0} -- 
	 },
    },
    {
	 name = "Bally",
	 parent = "Ballx",
	 -- :: kinematics
	 joint_frame = {
	    r = { 0, 0 , 0.0 },   
	 },
	joint = { 
	    { 0.0, 0.0, 0.0, 0.0, 1.0, 0.0} -- 
	 },

    },
    {
	 name = "Ball",
	 parent = "Bally",
	 -- :: kinematics
	 joint_frame = {
	    r = { 0, 0 , 0.0 },   
	 },
	joint = { 
	    { 0.0, 0.0, 0.0, 0.0, 0.0, 1.0} -- 
	 },
	 visuals = {
	    meshes.massA,
	 },
    },
    {
        name = "Base",
      parent = "ROOT",
      visuals = {
        meshes.Base,
        --~ meshes.table,
        --~ meshes.cage,
      },
      },
    {
	 name = "A1",
	 parent = "ROOT",
	 joint_frame = {
	    r = { 0, 0 , 0.203},    
	 },
	 joint = { 
	    { 0.0, 0.0, -1.0, 0.0, 0.0, 0.0} -- 
	 },
	 visuals = {
		meshes.B1,
	 },
    },
    {
	 name = "A2",
	 parent = "A1",
	 joint_frame = {
	    r = { 0.075, 0 , 0.132},    
	 },
	 joint = { 
	    { 0.0, 1.0, 0.0, 0.0, 0.0, 0.0} -- 
	 },
	 	 visuals = {
		meshes.B2,
	 },
    },
    {
	 name = "A3",
	 parent = "A2",
	 joint_frame = {
	    r = { 0.365, 0. , 0.},    
	 },
	 joint = { 
	    { 0.0, 1.0, 0.0, 0.0, 0.0, 0.0} -- 
	 },
	 	 visuals = {
		meshes.B3,
	 },
    },
    {
	 name = "A4",
	 parent = "A3",
	 joint_frame = {
	    r = { 0.208, 0. , 0.09},    
	 },
	 joint = { 
	    { -1.0, 0.0, 0.0, 0.0, 0.0, 0.0} -- 
	 },
	 	 visuals = {
		meshes.B4,
		meshes.font,
	 },
    },
    {
	 name = "A5",
	 parent = "A4",
	 joint_frame = {
	    r = { 0.197, 0. , 0.0},    
	 },
	 joint = { 
	    { 0.0, 1.0, 0.0, 0.0, 0.0, 0.0} -- 
	 },
	 	 visuals = {
		meshes.B5,
	 },
    },
    {
	 name = "A6",
	 parent = "A5",
	 joint_frame = {
	    r = { 0.080, 0. , 0.0},    
	 },
	 joint = { 
	    { 1.0, 0.0, 0.0, 0.0, 0.0, 0.0}
	 },
	 	visuals = {
		meshes.B6,
	 },
    },
        {
        	 joint_frame = {
	    r = { gr_offset, 0. , 0.0},    
	 },
      name = "TCP",
      parent = "A6",
      visuals = {
        meshes.gr0,
        meshes.gr1,
        meshes.gr2,
        meshes.gr1b,
        meshes.gr2b,
      },
      },
	{

	 name = "Paddle",
	 parent = "TCP",
	 -- :: kinematics
	 joint_frame = {
	    r = { paddle_r, 0 , 0.0 },   
	 },

	 visuals = {
	    meshes.paddlered,
	    meshes.paddleblack,
	 },
      }
 }

}

return model
