cmake_minimum_required(VERSION 3.5)

set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,--no-undefined -Wl,--as-needed")

find_package(ncnn REQUIRED)
find_package(OpenCV REQUIRED)

add_executable(retinaface retinaface.cpp)
target_link_libraries(retinaface ncnn ${OpenCV_LIBRARIES})
