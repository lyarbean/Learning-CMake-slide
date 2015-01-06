cmake_minimum_required(VERSION 3.0)
project(TestProject)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR}/cmake/) 

option(BUILD_DOC "Enable generate handbook" OFF)

add_subdirectory(ComponentA)
add_subdirectory(ComponentB)
add_subdirectory(ComponentC)
add_subdirectory(ComponentD)

add_subdirectory(autotest)

if(BUILD_DOC)
    add_subdirectory(doc)
endif()
