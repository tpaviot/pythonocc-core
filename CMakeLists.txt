##Copyright (c) 2011-2018 Thomas Paviot (tpaviot@gmail.com)
##
##This file is part of pythonOCC.
##
##pythonOCC is free software: you can redistribute it and/or modify
##it under the terms of the GNU General Public License as published by
##the Free Software Foundation, either version 3 of the License, or
##(at your option) any later version.
##
##pythonOCC is distributed in the hope that it will be useful,
##but WITHOUT ANY WARRANTY; without even the implied warranty of
##MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##GNU General Public License for more details.
##
##You should have received a copy of the GNU General Public License
##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

cmake_minimum_required(VERSION 3.12)
project(PYTHONOCC)

# set pythonOCC version
set(PYTHONOCC_VERSION_MAJOR 7)
set(PYTHONOCC_VERSION_MINOR 4)
set(PYTHONOCC_VERSION_PATCH 1)
#  Empty for official releases, set to -dev, -rc1, etc for development releases
set(PYTHONOCC_VERSION_DEVEL -dev)

set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake ${CMAKE_MODULE_PATH})

# for cmake 3.13 and newer, still use old swig style targets
cmake_policy(SET CMP0078 OLD)
cmake_policy(SET CMP0086 OLD)

## cmake policies
if (NOT CMAKE_VERSION VERSION_LESS "3.13")
    # CMP0077: option() honors normal variables
    # https://cmake.org/cmake/help/latest/policy/CMP0077.html
    cmake_policy(SET CMP0077 NEW)
    # CMP0078: UseSWIG generates standard target names.
    # https://cmake.org/cmake/help/latest/policy/CMP0078.html
    cmake_policy(SET CMP0078 OLD)
    # CMP0086: UseSWIG honors SWIG_MODULE_NAME via -module
    cmake_policy(SET CMP0086 OLD)
endif()

# Force C++ 11
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

if(NOT DEFINED PYTHONOCC_BUILD_TYPE)
  set(PYTHONOCC_BUILD_TYPE "Release" CACHE STRING "Build type") # By default set release build
endif(NOT DEFINED PYTHONOCC_BUILD_TYPE)
set(CMAKE_BUILD_TYPE ${PYTHONOCC_BUILD_TYPE} CACHE INTERNAL "Build type, immutable" FORCE)

message(STATUS " ${CMAKE_CXX_FLAGS}") 
set(BUILD_SHARED_LIBS ON)
include_directories(${CMAKE_CURRENT_SOURCE_DIR})

if(APPLE)
  set(CMAKE_MACOSX_RPATH ON)
  set(CMAKE_SKIP_BUILD_RPATH FALSE)
  set(CMAKE_BUILD_WITH_INSTALL_RPATH FALSE)
  set(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib;@loader_path/../../../")
  set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)
endif(APPLE)

#############################
# Option_With_Default macro #
#############################
macro(option_with_default OPTION_NAME OPTION_STRING OPTION_DEFAULT)
  option(${OPTION_NAME} ${OPTION_STRING} ${OPTION_DEFAULT})
endmacro(option_with_default OPTION_NAME OPTION_STRING OPTION_DEFAULT)

#####################################################################
# OpenGL. If available, enable compilation for Visualization module #
#####################################################################
find_package(OpenGL)
include_directories(OPENGL_INCLUDE_DIR)

#################
# Build options #
#################
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/OCE_Modules.cmake)
# add an option to choose toolkits to compile
if(OPENGL_FOUND)
  option_with_default(PYTHONOCC_WRAP_VISU "Compile Visualisation" ON)
else(OPENGL_FOUND)
  message(WARNING "OpenGL library not found, Visualization compilation is turned OFF")
  set(PYTHONOCC_WRAP_VISU "Compile Visualisation" OFF)
endif(OPENGL_FOUND)
option_with_default(PYTHONOCC_WRAP_DATAEXCHANGE "Compile DataExchange wrapper" ON)
option_with_default(PYTHONOCC_WRAP_OCAF "Compile OCE Application Framework wrapper" ON)
option_with_default(SWIG_HIDE_WARNINGS "Check this option if you want a less verbose swig output." ON)
option_with_default(OCE_HIDE_DEPRECATED "Check this option if you want a less verbose swig output." ON)

############
# Python 3 #
############
find_package(Python3 COMPONENTS Interpreter Development REQUIRED)
message(STATUS "Python3 interpreter:" ${Python3_EXECUTABLE})
message(STATUS "Python include directory: ${Python3_INCLUDE_DIR}")
message(STATUS "Python library release: ${Python3_LIBRARY_RELEASE}")

########
# SWIG #
########
find_package(SWIG 3.0.11 REQUIRED)
include(${SWIG_USE_FILE})
set(SWIG_FILES_PATH src/SWIG_files/wrapper)
set(CMAKE_SWIG_FLAGS ${CMAKE_SWIG_FLAGS} -fvirtual -py3)
if(SWIG_HIDE_WARNINGS)
  message(STATUS "Disabled SWIG warnings")
  set(CMAKE_SWIG_FLAGS ${CMAKE_SWIG_FLAGS} -w302,401,402,412,314,509,512,504,325,503,520,350,351,383,389,394,395,404)
endif()
    
################################
# OCE include and lib location #
################################
if(OCE_HIDE_DEPRECATED)
  message(STATUS "Disabled deprecation warnings for oce")
  add_definitions(-DOCCT_NO_DEPRECATED)
endif(OCE_HIDE_DEPRECATED)

if(DEFINED OCE_INCLUDE_PATH)
  if(NOT DEFINED OCE_LIB_PATH)
    message(FATAL_ERROR "OCE_LIB_PATH must be defined")
  endif(NOT DEFINED OCE_LIB_PATH)
  set(OCE_INCLUDE_PATH ${OCE_INCLUDE_PATH} CACHE PATH "OCE include path")
  set(OCE_LIB_PATH ${OCE_LIB_PATH} CACHE PATH "OCE lib path")
  include_directories(${OCE_INCLUDE_PATH})
  link_directories(${OCE_LIB_PATH})
# if OCE_INCLUDE_PATH is not passed at command line,
# find OCE automatically
else(OCE_INCLUDE_PATH)
  find_package(OpenCASCADE 7.4.0 REQUIRED)
  
  include_directories(${OpenCASCADE_INCLUDE_DIR})
  if(OpenCASCADE_FOUND)
    message(STATUS "OpenCASCADE found.")
    include_directories(${OCE_INCLUDE_DIRS})
  else(OpenCASCADE_FOUND)  # set default paths
    set(OCE_INCLUDE_PATH /usr/local/include/oce CACHE PATH "OCE include path")
    set(OCE_LIB_PATH /usr/local/lib CACHE PATH "OCE lib path")
    include_directories(${OCE_INCLUDE_PATH})
    link_directories(${OCE_LIB_PATH})
  endif(OpenCASCADE_FOUND)
endif(DEFINED OCE_INCLUDE_PATH)

##############################################
# Installation directory                     #
# by default, installed to site-packages/OCC #
##############################################
if(DEFINED ENV{SP_DIR} AND WIN32)
  # TODO: following hack is azure specific, a recent update in azure
  # prevent cmake to find correct paths of python3 on windows
  # this should be removed as soon as possible
  message(STATUS "conda-build running, using $ENV{SP_DIR} as install dir")
  set(PYTHONOCC_INSTALL_DIRECTORY $ENV{SP_DIR}/OCC CACHE PATH "pythonOCC install directory")
else(DEFINED ENV{SP_DIR} AND WIN32)
  execute_process(COMMAND ${Python3_EXECUTABLE} -c "from distutils.sysconfig import get_python_lib; import os;print(get_python_lib())" OUTPUT_VARIABLE python_lib OUTPUT_STRIP_TRAILING_WHITESPACE)
  set(PYTHONOCC_INSTALL_DIRECTORY ${python_lib}/OCC CACHE PATH "pythonOCC install directory")
endif(DEFINED ENV{SP_DIR} AND WIN32)
message(STATUS "pythonOCC modules will be installed to: ${PYTHONOCC_INSTALL_DIRECTORY}")

#############################################
# List of OCE shared libraries to link with #
#############################################
set(OCE_MODEL_LIBRARIES TKernel TKMath TKBRep TKG2d TKG3d TKGeomBase TKBO
                        TKBool TKFeat TKFillet TKGeomAlgo TKHLR TKMesh TKOffset
                        TKPrim TKShHealing TKTopAlgo TKXMesh)
set(OCE_VISUALIZATION_LIBRARIES TKService TKV3d TKOpenGl TKMeshVS)
set(OCE_DATAEXCHANGE_LIBRARIES TKBinXCAF TKIGES TKRWMesh TKSTEP TKSTEP209 TKSTEPAttr
                               TKSTEPBase TKSTL TKVRML TKXCAF TKXDEIGES TKXDESTEP TKXSBase
                               TKXmlXCAF)
set(OCE_OCAF_LIBRARIES TKCDF TKLCAF TKCAF TKBinL TKXmlL TKBin TKXml TKStdL
                       TKStd TKTObj TKBinTObj TKXmlTObj TKVCAF)

################
# Headers path #
################
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src/SWIG_files/headers)

######################################################
# Configure Build settings according to the platform #
######################################################

# Mingw64 needs MS_WIN64 to be defined (otherwise link failures)
if(MINGW)
  message(STATUS "MinGW:")
  if(${CMAKE_SIZEOF_VOID_P} MATCHES "8")  # 64 bit check
      add_definitions(-DMS_WIN64)
  endif(${CMAKE_SIZEOF_VOID_P} MATCHES "8")
endif(MINGW)

# MACOSX_DEPLOYEMENT_TARGET
# explicit link to libc++ for recent osx versions
if(APPLE)
  message(STATUS "Explicitely link to libc++ on modern osx versions")
  add_definitions(-stdlib=libc++)
endif(APPLE)

if(UNIX)
  if(APPLE)
    ######### MacOSX ###########
    set(PLATFORM Darwin)
  else(APPLE)
    ######### Unix/Linux ###########
    set(PLATFORM Unix)
  endif(APPLE)
  set(CMAKE_SWIG_FLAGS ${CMAKE_SWIG_FLAGS} -DCSFDB -DHAVE_CONFIG_H)
  add_definitions(-DHAVE_CONFIG_H -DCSFDB)
else(UNIX)
  if(WIN32)
    ######### Windows ###########
    add_definitions(-DWNT -DWIN32 -D_WINDOWS -DCSFDB -DHAVE_CONFIG_H)
    set(CMAKE_SWIG_FLAGS ${CMAKE_SWIG_FLAGS} -DCSFDB -DWIN32 -D_WINDOWS)
    set(PLATFORM win)
  else(WIN32)
    message(STATUS "Unknown platform")
  endif(WIN32)
endif(UNIX)

################################################
# Define output path for generated libraries:  #
# platform/compiler-build_type-bits            #
# for instance:                                #
#     ./win32/bin/vc7.1-release-64             #
#     ./win32/bin/vc9-debug-32                 #
#     ./Unix/i386-debug-64                     #
################################################
if(WIN32)
  if(MSVC) # The compiler used is MSVC
    message(STATUS "Found MSVC compiler: ${MSVC} ${MSVC_VERSION}")
    set(LIBRARY_OUTPUT_PATH bin/)
    # prevent bigobj fatal error C1148 issue, and remove C4244 verbose warning
    add_definitions("/bigobj /wd4244 /wd4251 /wd4275 /wd4290")
  elseif (BORLAND) # The compiler used is BORLAND
    set(LIBRARY_OUTPUT_PATH win${BIT}/bin/${CMAKE_BUILD_TYPE})
  else()
    set(LIBRARY_OUTPUT_PATH win${BIT}/bin/${CMAKE_BUILD_TYPE})
  endif()
  set(EXECUTABLE_OUTPUT_PATH ${LIBRARY_OUTPUT_PATH})
else(WIN32)
  set(LIBRARY_OUTPUT_PATH ${PLATFORM}/${CMAKE_SYSTEM_PROCESSOR}-${CMAKE_BUILD_TYPE}-${BIT})
endif(WIN32)
set(CMAKE_SWIG_OUTDIR ${LIBRARY_OUTPUT_PATH})

##################
# MODEL Toolkits #
##################
file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/${SWIG_FILES_PATH})
foreach(OCE_MODULE ${OCE_TOOLKIT_MODEL})
    set(FILE ${SWIG_FILES_PATH}/${OCE_MODULE}.i)
    set_source_files_properties(${FILE} PROPERTIES CPLUSPLUS ON)
    swig_add_library (${OCE_MODULE} LANGUAGE python SOURCES ${FILE} TYPE MODULE)
    swig_link_libraries(${OCE_MODULE} ${OCE_MODEL_LIBRARIES} Python3::Module)
endforeach(OCE_MODULE)

##############
# Tesselator #
##############
execute_process(COMMAND ${CMAKE_COMMAND} -E make_directory src/Tesselator)
set_source_files_properties(${CMAKE_CURRENT_SOURCE_DIR}/src/Tesselator/Tesselator.i PROPERTIES CPLUSPLUS ON)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src/Tesselator)
set(TESSELATOR_SOURCE_FILES
  ${CMAKE_CURRENT_SOURCE_DIR}/src/Tesselator/Tesselator.i
  ${CMAKE_CURRENT_SOURCE_DIR}/src/Tesselator/ShapeTesselator.cpp)

swig_add_library(Tesselator LANGUAGE python SOURCES ${TESSELATOR_SOURCE_FILES} TYPE MODULE)
swig_link_libraries(Tesselator ${OCE_MODEL_LIBRARIES} Python3::Module)

#################
# Visualisation #
#################
if(PYTHONOCC_WRAP_VISU)
    find_package(OpenGL REQUIRED)
    include_directories(OPENGL_INCLUDE_DIR)

    foreach(OCE_MODULE ${OCE_TOOLKIT_VISUALIZATION})
      set(FILE ${SWIG_FILES_PATH}/${OCE_MODULE}.i)
      set_source_files_properties(${FILE} PROPERTIES CPLUSPLUS ON)
      swig_add_library (${OCE_MODULE} LANGUAGE python SOURCES ${FILE} TYPE MODULE)
      swig_link_libraries(${OCE_MODULE} ${OCE_MODEL_LIBRARIES} ${OCE_VISUALIZATION_LIBRARIES} Python3::Module)
    endforeach(OCE_MODULE)

  # Build third part modules
  # TODO : the following line is strange but necessary
  execute_process(COMMAND ${CMAKE_COMMAND} -E make_directory src/Visualization)
  set_source_files_properties(${CMAKE_CURRENT_SOURCE_DIR}/src/Visualization/Visualization.i PROPERTIES CPLUSPLUS ON)
  include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src/Visualization)
  set(VISUALIZATION_SOURCE_FILES
      ${CMAKE_CURRENT_SOURCE_DIR}/src/Visualization/Visualization.i
      ${CMAKE_CURRENT_SOURCE_DIR}/src/Visualization/Display3d.cpp)

    swig_add_library(Visualization LANGUAGE python SOURCES ${VISUALIZATION_SOURCE_FILES} TYPE MODULE)
    swig_link_libraries(Visualization ${OCE_MODEL_LIBRARIES} ${OCE_VISUALIZATION_LIBRARIES} Python3::Module)

  if(APPLE)
    # on OSX, always add /System/Library/Frameworks/Cocoa.framework, even
    # if GLX is enabled
    swig_link_libraries(Visualization /System/Library/Frameworks/Cocoa.framework)
  endif(APPLE)

endif(PYTHONOCC_WRAP_VISU)

################
# DataExchange #
################
if(PYTHONOCC_WRAP_DATAEXCHANGE)
  foreach(OCE_MODULE ${OCE_TOOLKIT_DATAEXCHANGE})
    set(FILE ${SWIG_FILES_PATH}/${OCE_MODULE}.i)
    set_source_files_properties(${FILE} PROPERTIES CPLUSPLUS ON)
    swig_add_library(${OCE_MODULE} LANGUAGE python SOURCES ${FILE} TYPE MODULE)
    swig_link_libraries(${OCE_MODULE} ${OCE_MODEL_LIBRARIES} ${OCE_DATAEXCHANGE_LIBRARIES} Python3::Module)
  endforeach(OCE_MODULE)
endif(PYTHONOCC_WRAP_DATAEXCHANGE)

########
# OCAF #
########
if(PYTHONOCC_WRAP_OCAF)
  foreach(OCE_MODULE ${OCE_TOOLKIT_OCAF})
    set(FILE ${SWIG_FILES_PATH}/${OCE_MODULE}.i)
    set_source_files_properties(${FILE} PROPERTIES CPLUSPLUS ON)
    swig_add_library(${OCE_MODULE} LANGUAGE python SOURCES ${FILE} TYPE MODULE)
    swig_link_libraries(${OCE_MODULE} ${OCE_MODEL_LIBRARIES} ${OCE_OCAF_LIBRARIES} Python3::Module)
  endforeach(OCE_MODULE)
endif(PYTHONOCC_WRAP_OCAF)

##########
# Addons #
##########
execute_process(COMMAND ${CMAKE_COMMAND} -E make_directory src/Addons)
set_source_files_properties(${CMAKE_CURRENT_SOURCE_DIR}/src/Addons/Addons.i PROPERTIES CPLUSPLUS ON)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src/Addons)
set(ADDONS_SOURCE_FILES
${CMAKE_CURRENT_SOURCE_DIR}/src/Addons/Addons.i
${CMAKE_CURRENT_SOURCE_DIR}/src/Addons/Font3d.cpp
#${CMAKE_CURRENT_SOURCE_DIR}/src/Addons/TextItem.cpp
#${CMAKE_CURRENT_SOURCE_DIR}/src/Addons/LineItem.cpp
#${CMAKE_CURRENT_SOURCE_DIR}/src/Addons/TextureItem.cpp
)

swig_add_library(Addons LANGUAGE python SOURCES ${ADDONS_SOURCE_FILES} TYPE MODULE)
swig_link_libraries(Addons ${OCE_MODEL_LIBRARIES} ${OCE_VISUALIZATION_LIBRARIES} Python3::Module)
#if (APPLE)
#  set_target_properties(${SWIG_MODULE_Addons_REAL_NAME} PROPERTIES COMPILE_FLAGS ${PYTHON_CFLAGS})
#  set_target_properties(${SWIG_MODULE_Addons_REAL_NAME} PROPERTIES LINK_FLAGS ${PYTHON_LDFLAGS})
#  swig_link_libraries(Addons ${OPENGL_LIBRARIES})
#else(APPLE)
#  swig_link_libraries(Addons ${PYTHON_LIBRARIES})
#endif(APPLE)

################
# Installation #
################
if(WIN32)
    set(EXTENSION "pyd")
else(WIN32)
    set(EXTENSION "so")
endif(WIN32)
set(BUILD_DIR ${CMAKE_BINARY_DIR}/${LIBRARY_OUTPUT_PATH})

# install pythonOCC modules
foreach(OCE_MODULE ${OCE_TOOLKIT_MODEL})
    install(FILES ${BUILD_DIR}/${OCE_MODULE}.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
    install(TARGETS _${OCE_MODULE} DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
    install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/SWIG_files/wrapper/${OCE_MODULE}.pyi DESTINATION 
    ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
endforeach(OCE_MODULE)

# install tesselator
install(FILES ${BUILD_DIR}/Tesselator.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
install(TARGETS _Tesselator DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core)

if(PYTHONOCC_WRAP_VISU)
foreach(OCE_MODULE ${OCE_TOOLKIT_VISUALIZATION})
    install(FILES ${BUILD_DIR}/${OCE_MODULE}.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
    install(TARGETS _${OCE_MODULE} DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
    install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/SWIG_files/wrapper/${OCE_MODULE}.pyi DESTINATION 
    ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
endforeach(OCE_MODULE)
endif(PYTHONOCC_WRAP_VISU)

if(PYTHONOCC_WRAP_DATAEXCHANGE)
foreach(OCE_MODULE ${OCE_TOOLKIT_DATAEXCHANGE})
    install(FILES ${BUILD_DIR}/${OCE_MODULE}.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
    install(TARGETS _${OCE_MODULE} DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
    install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/SWIG_files/wrapper/${OCE_MODULE}.pyi DESTINATION 
    ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
endforeach(OCE_MODULE)
endif(PYTHONOCC_WRAP_DATAEXCHANGE)

if(PYTHONOCC_WRAP_OCAF)
foreach(OCE_MODULE ${OCE_TOOLKIT_OCAF})
    # install the python interface file (python module)
    install(FILES ${BUILD_DIR}/${OCE_MODULE}.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
    install(TARGETS _${OCE_MODULE} DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
    install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/SWIG_files/wrapper/${OCE_MODULE}.pyi DESTINATION 
    ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
endforeach(OCE_MODULE)
endif(PYTHONOCC_WRAP_OCAF)

# install third part modules
if(PYTHONOCC_WRAP_VISU)
    install(FILES ${BUILD_DIR}/Visualization.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
    install(TARGETS _Visualization DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
endif(PYTHONOCC_WRAP_VISU)

# install addons
install(FILES ${BUILD_DIR}/Addons.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core )
install(TARGETS _Addons DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core )
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/src/Display DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )

# install Display
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/src/Display DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY})

# install LICENSE file
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/LICENSE DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY})

# install AUTHORS file
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/AUTHORS DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY})

# install Exception.py, __init__ and py.typed
# install __init__.py file
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/PkgBase/__init__.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY})
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/PkgBase/__init__.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/PkgBase/Exception.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
# following file is necessary to mypy to use .pyi stub files
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/PkgBase/py.typed DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core)

# install Extend
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/src/Extend DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY})

# install Wrapper utils
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/src/Wrapper DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY})
