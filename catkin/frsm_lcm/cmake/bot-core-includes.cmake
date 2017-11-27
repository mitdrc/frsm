find_package(PkgConfig REQUIRED)
pkg_check_modules(GLIB2 glib-2.0)

include_directories(${GLIB2_INCLUDE_DIRS})
