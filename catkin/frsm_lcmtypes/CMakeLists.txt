cmake_minimum_required(VERSION 2.8.3)
project(frsm_lcmtypes)

find_package(catkin REQUIRED COMPONENTS
lcm_catkin
)

catkin_package(
  LIBRARIES ${PROJECT_NAME}
  CATKIN_DEPENDS lcm_catkin
)

FindLCM(../../)

AddLCM(
frsm_pixel_map_t
frsm_planar_lidar_t
frsm_pose_t
frsm_rigid_transform_2d_t
)

GenerateLCM()

catkin_package(LIBRARIES ${PROJECT_NAME}
  CATKIN_DEPENDS lcm_catkin
  INCLUDE_DIRS ${CATKIN_DEVEL_PREFIX}/include)
