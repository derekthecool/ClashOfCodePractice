cmake_minimum_required(VERSION  3.10.2)

#Set debug mode
set(CMAKE_BUILD_TYPE Debug)

#Export compile commands json file, this is needed for project autocomplete
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

#Set variable to use for project name and main file
set(ProjectBasename "clash")
set(MainSource "clash.cpp")

#Set project name and specify C compiler
project(${ProjectBasename} CXX)

#Set executable
add_executable(${ProjectBasename} ${MainSource})
