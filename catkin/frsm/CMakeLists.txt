cmake_minimum_required(VERSION 2.8.3)
project(frsm)
find_package(catkin REQUIRED COMPONENTS
  frsm_lcmtypes
  bot_core
  bot_lcmgl
)


catkin_package(
  INCLUDE_DIRS ../../src/libfrsm ${GLIB2_INCLUDE_DIRS}
  LIBRARIES frsm
  CATKIN_DEPENDS bot_core frsm_lcmtypes bot_lcmgl
  DEPENDS GLIB2
#  CFG_EXTRAS bot-core-includes.cmake
)

add_definitions(-std=gnu99)

file(GLOB c_files ../../src/libfrsm/*.cpp)
file(GLOB h_files ../../src/libfrsm/*.h*)

include_directories(../../src/libfrsm/ ${GLIB2_INCLUDE_DIRS} ${catkin_INCLUDE_DIRS})

add_library(frsm SHARED ${c_files})
target_link_libraries(frsm ${catkin_LIBRARIES} ${GLIB2_LIBRARIES} m)
set_property(TARGET frsm APPEND_STRING PROPERTY COMPILE_FLAGS -Wno-unused-result )

install(TARGETS frsm
        ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
        LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
        RUNTIME DESTINATION ${CATKIN_GLOBAL_BIN_DESTINATION})

install(FILES ${h_files}
        DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION})
