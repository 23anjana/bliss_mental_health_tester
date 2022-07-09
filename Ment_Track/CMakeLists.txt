# CMakeList.txt : CMake project for Ment_Track, include source and define
# project specific logic here.
#
cmake_minimum_required (VERSION 3.8)

# Add source to this project's executable.
add_executable (Ment_Track "Ment_Track.cpp" "Ment_Track.h")

if (CMAKE_VERSION VERSION_GREATER 3.12)
  set_property(TARGET Ment_Track PROPERTY CXX_STANDARD 20)
endif()

# TODO: Add tests and install targets if needed.
