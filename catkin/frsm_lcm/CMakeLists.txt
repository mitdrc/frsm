cmake_minimum_required(VERSION 2.8.3)
project(frsm_lcm)
find_package(catkin REQUIRED COMPONENTS
  frsm
  frsm_lcmtypes
  bot_core
  bot_lcmgl
)


catkin_package(
  INCLUDE_DIRS  ${GLIB2_INCLUDE_DIRS}
  LIBRARIES frsm_lcm
  CATKIN_DEPENDS bot_core frsm frsm_lcmtypes bot_lcmgl
  DEPENDS GLIB2
#  CFG_EXTRAS bot-core-includes.cmake
)

#add_definitions(-std=gnu99)

include_directories(${catkin_INCLUDE_DIRS})

add_executable(frsm_lcm ../../src/frsm-lcm/frsm-lcm.cpp)

#file(GLOB c_files ../../src/libfrsm/*.cpp)
#file(GLOB h_files ../../src/libfrsm/*.h*)#



#add_library(frsm SHARED ${c_files})
target_link_libraries(frsm_lcm ${catkin_LIBRARIES})# ${GLIB2_LIBRARIES} m)
#set_property(TARGET frsm APPEND_STRING PROPERTY COMPILE_FLAGS -Wno-unused-result )

#install(TARGETS frsm
#        ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
#        LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
#        RUNTIME DESTINATION ${CATKIN_GLOBAL_BIN_DESTINATION})

#install(FILES ${h_files}
#        DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION})
