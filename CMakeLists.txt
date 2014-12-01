##Copyright (c) 2011-2014 Thomas Paviot (tpaviot@gmail.com)
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

# pythonOCC cmake build file
SET(PROJECT_NAME pythonOCC)
PROJECT(PYTHONOCC)

# set pythonOCC version
SET(PYTHONOCC_VERSION_MAJOR 0)
SET(PYTHONOCC_VERSION_MINOR 16)
SET(PYTHONOCC_VERSION_PATCH 1)
#  Empty for official releases, set to -dev, -rc1, etc for development releases
SET(PYTHONOCC_VERSION_DEVEL -dev)

CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

SET(CMAKE_BUILD_TYPE "MinSizeRel" CACHE STRING "Build type")
MESSAGE(STATUS " ${CMAKE_CXX_FLAGS}") 
SET(BUILD_SHARED_LIBS ON)
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR})
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/modules/")

#############################
# Option_With_Default macro #
#############################
MACRO( OPTION_WITH_DEFAULT OPTION_NAME OPTION_STRING OPTION_DEFAULT )
IF( NOT DEFINED ${OPTION_NAME} )
	SET( ${OPTION_NAME} ${OPTION_DEFAULT} )
ENDIF( NOT DEFINED ${OPTION_NAME} )
	OPTION( ${OPTION_NAME} "${OPTION_STRING}" ${${OPTION_NAME}} )
ENDMACRO( OPTION_WITH_DEFAULT OPTION_NAME OPTION_STRING OPTION_DEFAULT )

#############
# Languages #
#############
OPTION( BUILD_CSHARP "Build csharp wrapper" 0)
OPTION( BUILD_JAVA "Build csharp wrapper" 0)
OPTION( BUILD_PYTHON "Build csharp wrapper" 1)
if(BUILD_PYTHON)
  MESSAGE(STATUS "Building for python")
endif()
if(BUILD_JAVA)
  MESSAGE(STATUS "Building for java")
endif()
if(BUILD_CSHARP)
  MESSAGE(STATUS "Building for csharp")
endif()

##########
# Python #
##########
if (BUILD_PYTHON)
  FIND_PACKAGE(PythonInterp)
  FIND_PACKAGE(PythonLibs)
  INCLUDE_DIRECTORIES(${PYTHON_INCLUDE_PATH})
endif()

##############################################################
# 32/64 bit detection
###############################################################
IF(${CMAKE_SIZEOF_VOID_P} MATCHES "8")
	# If in 64bit mode, we have to define the _OCC64 variable
	ADD_DEFINITIONS(-D_OCC64)
	SET(CMAKE_SWIG_FLAGS ${CMAKE_SWIG_FLAGS} -D_OCC64)
	SET(BIT 64)
ELSE(${CMAKE_SIZEOF_VOID_P} MATCHES "8")
	SET(BIT 32)
ENDIF(${CMAKE_SIZEOF_VOID_P} MATCHES "8")
MESSAGE(STATUS "Build ${BIT}bit")

IF ((NOT MSVC) OR (CMAKE_BUILD_TOOL STREQUAL "nmake"))
	IF( NOT DEFINED PYTHONOCC_BUILD_TYPE )
		SET( PYTHONOCC_BUILD_TYPE "MinSizeRel" CACHE STRING "Build type" ) # By default set release build
	ENDIF( NOT DEFINED PYTHONOCC_BUILD_TYPE )
	SET( CMAKE_BUILD_TYPE ${PYTHONOCC_BUILD_TYPE} CACHE INTERNAL "Build type,
		immutable" FORCE )
ENDIF((NOT MSVC) OR (CMAKE_BUILD_TOOL STREQUAL "nmake"))

########
# SWIG #
########
FIND_PACKAGE(SWIG)
INCLUDE(${SWIG_USE_FILE})
SET(SWIG_FILES_PATH src/SWIG_files/wrapper)
    
################################
# OCE include and lib location #
################################
SET(OCE_INCLUDE_PATH /usr/local/include/oce CACHE PATH "OCE include path" )
SET(OCE_LIB_PATH /usr/local/lib CACHE PATH "OCE lib path" )

##############################################
# Installation directory                     #
# by default, installed to site-packages/OCC #
##############################################
if (BUILD_PYTHON)
  EXECUTE_PROCESS(COMMAND python -c "from __future__ import print_function; from distutils.sysconfig import get_python_lib; import os;print(get_python_lib())" OUTPUT_VARIABLE python_lib OUTPUT_STRIP_TRAILING_WHITESPACE )
  SET(${PROJECT_NAME}_INSTALL_DIRECTORY ${python_lib}/OCC CACHE PATH "pythonOCC install directory" )
else()
  SET(${PROJECT_NAME}_INSTALL_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/install/OCC CACHE PATH "pythonOCC install directory" )
endif()

# List of OCE shared libraries to link with
# TODO: this should be build from the module list
SET(OCE_MODEL_LIBRARIES TKernel TKMath TKAdvTools TKG2d TKG3d TKGeomBase TKBRep TKGeomAlgo
                  TKTopAlgo TKPrim TKBO TKHLR TKMesh TKShHealing TKXMesh
                  TKBool TKFillet TKFeat TKOffset)
SET(OCE_VISUALIZATION_LIBRARIES TKService TKV3d TKMeshVS TKOpenGl)
SET(OCE_DATAEXCHANGE_LIBRARIES TKSTL TKXSBase TKSTEPBase TKIGES TKSTEPAttr TKSTEP209
                  TKSTEP TKVRML)
# Tells CMake where are the required headers
INCLUDE_DIRECTORIES(${PYTHON_INCLUDE_PATH})
INCLUDE_DIRECTORIES(${OCE_INCLUDE_PATH})
LINK_DIRECTORIES(${OCE_LIB_PATH})

######################################################
# Configure Build settings according to the platform #
######################################################
IF(UNIX)
  IF(APPLE)
    ######### MacOSX ###########
	SET(PLATFORM Darwin)
  ELSE(APPLE)
    ######### Unix/Linux ###########
    SET(PLATFORM Unix)
  ENDIF(APPLE)
  SET(CMAKE_SWIG_FLAGS -O -w302,401,314,509,512
        -DCSFDB -DHAVE_CONFIG_H -DOCC_CONVERT_SIGNALS)
  ADD_DEFINITIONS(-DHAVE_CONFIG_H -DCSFDB -DOCC_CONVERT_SIGNALS)
ELSE(UNIX)
  IF(WIN32)
    ######### Windows ###########
    ADD_DEFINITIONS(-DWNT -DWIN32 -D_WINDOWS -DCSFDB -DHAVE_CONFIG_H)
	# specific windows defines for python version >=2.6.0
	EXECUTE_PROCESS(COMMAND python -c "import sys;print (2,6)>=sys.version_info[:2]" OUTPUT_VARIABLE PYTHON_26_OR_HIGHER OUTPUT_STRIP_TRAILING_WHITESPACE)
	IF(${PYTHON_26_OR_HIGHER} MATCHES "True")
	  ADD_DEFINITIONS(-DHAVE_ACOSH -DHAVE_ASINH -DHAVE_ATANH)
	ENDIF(${PYTHON_26_OR_HIGHER} MATCHES "True")
    SET(CMAKE_SWIG_FLAGS -O -w302,401,314,509,512 -DCSFDB -DWIN32 -D_WINDOWS)
    SET(PLATFORM win)
  ELSE(WIN32)
    MESSAGE(STATUS "Unknown platform")
  ENDIF(WIN32)
ENDIF(UNIX)
MESSAGE(STATUS "Platform:" ${PLATFORM})

##################################
# Tells Swig to use py3k option  #
##################################
##################################
if (BUILD_PYTHON)
  IF(${PYTHON_VERSION_MAJOR} MATCHES "3")
    SET(CMAKE_SWIG_FLAGS ${CMAKE_SWIG_FLAGS} -py3)
  ENDIF(${PYTHON_VERSION_MAJOR} MATCHES "3")
endif()

################################################
# Define output path for generated libraries:  #
# platform/compiler-build_type-bits            #
# for instance:                                #
#     ./win32/bin/vc7.1-release-64             #
#     ./win32/bin/vc9-debug-32                 #
#     ./Unix/i386-debug-64                     #
################################################
IF(WIN32)
  IF(MSVC) # The compiler used is MSVC
    MESSAGE(STATUS "Found MSVC compiler: ${MSVC} ${MSVC_VERSION}")
    SET(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR}/bin/)
  ELSEIF (BORLAND) # The compiler used is BORLAND
    SET(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR}/win${BIT}/bin/${CMAKE_BUILD_TYPE})
  ELSE()
    SET(LIBRARY_OUTPUT_PATH win${BIT}/bin/${CMAKE_BUILD_TYPE})
  ENDIF()
  SET(EXECUTABLE_OUTPUT_PATH ${LIBRARY_OUTPUT_PATH})
ELSE(WIN32)
  SET(LIBRARY_OUTPUT_PATH ${PLATFORM}/${CMAKE_SYSTEM_PROCESSOR}-${CMAKE_BUILD_TYPE}-${BIT})
ENDIF(WIN32)
SET(CMAKE_SWIG_OUTDIR ${LIBRARY_OUTPUT_PATH})
MESSAGE(STATUS "output_path: ${LIBRARY_OUTPUT_PATH}")

############################
# OpenCASCADE Modules list #
############################
INCLUDE(${CMAKE_CURRENT_SOURCE_DIR}/cmake/OCE_Modules.cmake)
# add an option to choose toolkits to compile
OPTION_WITH_DEFAULT(PYTHONOCC_WRAP_MODEL "Compile Foundation/Model" TRUE)
OPTION_WITH_DEFAULT(PYTHONOCC_WRAP_VISU "Compile Visualisation" TRUE)
OPTION_WITH_DEFAULT(PYTHONOCC_WRAP_DATAEXCHANGE "Compile Data Exchange" TRUE)

###################
# Wrapper Modules #
###################

if (BUILD_JAVA)
  FIND_PACKAGE(JNI)
  find_package(Java REQUIRED COMPONENTS Runtime Development)
  MESSAGE(STATUS "Java include in : ${JAVA_INCLUDE_PATH}")
  MESSAGE(STATUS "Java include2 in : ${JAVA_INCLUDE_PATH}")
  INCLUDE_DIRECTORIES(${JAVA_INCLUDE_PATH})
  INCLUDE_DIRECTORIES("${JAVA_INCLUDE_PATH2}")
endif()
if (BUILD_CSHARP)
  FIND_PACKAGE(Mono)
endif()

# MODEL Toolkits
FILE(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/${SWIG_FILES_PATH})
FOREACH(OCE_MODULE ${OCE_TOOLKIT_MODEL})
	SET(FILE ${SWIG_FILES_PATH}/${OCE_MODULE}.i)
	SET_SOURCE_FILES_PROPERTIES(${FILE} PROPERTIES CPLUSPLUS ON)
    if (BUILD_PYTHON)
      SWIG_ADD_MODULE(${OCE_MODULE} python ${FILE})
      SWIG_LINK_LIBRARIES(${OCE_MODULE} ${PYTHON_LIBRARIES} ${OCE_MODEL_LIBRARIES})
      SWIG_LINK_LIBRARIES(${OCE_MODULE} ${OCE_MODEL_LIBRARIES})
    endif()
    if (BUILD_JAVA)
      SWIG_ADD_MODULE(${OCE_MODULE} java ${FILE})
      SWIG_LINK_LIBRARIES(${OCE_MODULE} ${OCE_MODEL_LIBRARIES})
    endif()
    if (BUILD_CSHARP)
       SWIG_ADD_MODULE(${OCE_MODULE} csharp ${FILE})
       SWIG_LINK_LIBRARIES(${OCE_MODULE} ${MONO_LIBRARIES} ${OCE_MODEL_LIBRARIES})
       SWIG_LINK_LIBRARIES(${OCE_MODULE} ${OCE_MODEL_LIBRARIES})
    endif()
ENDFOREACH(OCE_MODULE)

# Visualisation
IF(PYTHONOCC_WRAP_VISU)
FOREACH(OCE_MODULE ${OCE_TOOLKIT_VISUALIZATION})
    SET(FILE ${SWIG_FILES_PATH}/${OCE_MODULE}.i)
    SET_SOURCE_FILES_PROPERTIES(${FILE} PROPERTIES CPLUSPLUS ON)
    if (BUILD_PYTHON)
      SWIG_ADD_MODULE(${OCE_MODULE} python ${FILE})
      SWIG_LINK_LIBRARIES(${OCE_MODULE} ${PYTHON_LIBRARIES} ${OCE_MODEL_LIBRARIES} ${OCE_VISUALIZATION_LIBRARIES})
      SWIG_LINK_LIBRARIES(${OCE_MODULE} ${OCE_MODEL_LIBRARIES})
    endif()
    if (BUILD_JAVA)
      SWIG_ADD_MODULE(${OCE_MODULE} java ${FILE})
      SWIG_LINK_LIBRARIES(${OCE_MODULE} ${OCE_MODEL_LIBRARIES} ${OCE_VISUALIZATION_LIBRARIES})
    endif()
    if (BUILD_CSHARP)
       SWIG_ADD_MODULE(${OCE_MODULE} csharp ${FILE})
       SWIG_LINK_LIBRARIES(${OCE_MODULE} ${MONO_LIBRARIES} ${OCE_MODEL_LIBRARIES} ${OCE_VISUALIZATION_LIBRARIES})
       SWIG_LINK_LIBRARIES(${OCE_MODULE} ${OCE_MODEL_LIBRARIES})
    endif()
ENDFOREACH(OCE_MODULE)
ENDIF(PYTHONOCC_WRAP_VISU)

IF(PYTHONOCC_WRAP_VISU)
# Build third part modules
# TODO : the following line is strange but necessary
EXECUTE_PROCESS(COMMAND ${CMAKE_COMMAND} -E make_directory src/Visualization)
SET_SOURCE_FILES_PROPERTIES(${CMAKE_CURRENT_SOURCE_DIR}/src/Visualization/Visualization.i PROPERTIES CPLUSPLUS ON)
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR}/src/Visualization)
SET(VISUALIZATION_SOURCE_FILES
	${CMAKE_CURRENT_SOURCE_DIR}/src/Visualization/Visualization.i
	${CMAKE_CURRENT_SOURCE_DIR}/src/Visualization/Display3d.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/src/Visualization/Tesselator.cpp
	)
if (BUILD_PYTHON)
  SWIG_ADD_MODULE(Visualization python ${VISUALIZATION_SOURCE_FILES})
  IF(APPLE)
	# on OSX, always add /System/Library/Frameworks/Cocoa.framework, even
	# if GLX is enabled
	  SWIG_LINK_LIBRARIES(Visualization ${PYTHON_LIBRARIES} ${OCE_MODEL_LIBRARIES} ${OCE_VISUALIZATION_LIBRARIES} /System/Library/Frameworks/Cocoa.framework)
  ELSE(APPLE)
	  SWIG_LINK_LIBRARIES(Visualization ${PYTHON_LIBRARIES} ${OCE_MODEL_LIBRARIES} ${OCE_VISUALIZATION_LIBRARIES})
  ENDIF(APPLE)
endif()
if (BUILD_JAVA)
  SWIG_ADD_MODULE(Visualization java ${VISUALIZATION_SOURCE_FILES})
endif()
if (BUILD_CSHARP)
   SWIG_ADD_MODULE(Visualization csharp ${VISUALIZATION_SOURCE_FILES})
endif()
ENDIF(PYTHONOCC_WRAP_VISU)

# DataExchange
IF(PYTHONOCC_WRAP_DATAEXCHANGE)
FOREACH(OCE_MODULE ${OCE_TOOLKIT_DATAEXCHANGE})
    SET(FILE ${SWIG_FILES_PATH}/${OCE_MODULE}.i)
    SET_SOURCE_FILES_PROPERTIES(${FILE} PROPERTIES CPLUSPLUS ON)
    if (BUILD_PYTHON)
      SWIG_ADD_MODULE(${OCE_MODULE} python ${FILE})
      SWIG_LINK_LIBRARIES(${OCE_MODULE} ${PYTHON_LIBRARIES} ${OCE_MODEL_LIBRARIES} ${OCE_VISUALIZATION_LIBRARIES} ${OCE_DATAEXCHANGE_LIBRARIES})
      SWIG_LINK_LIBRARIES(${OCE_MODULE} ${OCE_MODEL_LIBRARIES})
    endif()
    if (BUILD_JAVA)
      SWIG_ADD_MODULE(${OCE_MODULE} java ${FILE})
      SWIG_LINK_LIBRARIES(${OCE_MODULE} ${OCE_MODEL_LIBRARIES} ${OCE_VISUALIZATION_LIBRARIES} ${OCE_DATAEXCHANGE_LIBRARIES})
    endif()
    if (BUILD_CSHARP)
       SWIG_ADD_MODULE(${OCE_MODULE} csharp ${FILE})
       SWIG_LINK_LIBRARIES(${OCE_MODULE} ${MONO_LIBRARIES} ${OCE_MODEL_LIBRARIES} ${OCE_VISUALIZATION_LIBRARIES} ${OCE_DATAEXCHANGE_LIBRARIES})
       SWIG_LINK_LIBRARIES(${OCE_MODULE} ${OCE_MODEL_LIBRARIES})
    endif()
ENDFOREACH(OCE_MODULE)
ENDIF(PYTHONOCC_WRAP_DATAEXCHANGE)

################
# Installation #
################
IF(WIN32)
    if (BUILD_PYTHON)
      SET(EXTENSION "pyd")
    endif()
    if (BUILD_CSHARP)
      SET(EXTENSION "dll")
    endif()
ELSE(WIN32)
	SET(EXTENSION "so")
ENDIF(WIN32)
if (BUILD_JAVA)
  SET(EXTENSION "jar")    
endif()

SET(BUILD_DIR ${CMAKE_BINARY_DIR}/${LIBRARY_OUTPUT_PATH})

# install pythonOCC modules
FOREACH(OCE_MODULE ${OCE_TOOLKIT_MODEL})
    if (BUILD_PYTHON)
      INSTALL(FILES ${BUILD_DIR}/${OCE_MODULE}.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
    endif()
    if (BUILD_JAVA)
      INSTALL(FILES ${BUILD_DIR}/${OCE_MODULE}.java DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
    endif()    
    if (BUILD_CSHARP)
      INSTALL(FILES ${BUILD_DIR}/${OCE_MODULE}.cs DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
    endif()
	INSTALL(FILES ${BUILD_DIR}/_${OCE_MODULE}.${EXTENSION} DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
ENDFOREACH(OCE_MODULE)
IF(PYTHONOCC_WRAP_VISU)
FOREACH(OCE_MODULE ${OCE_TOOLKIT_VISUALIZATION})
    if (BUILD_PYTHON)
      INSTALL(FILES ${BUILD_DIR}/${OCE_MODULE}.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
    endif()
    if (BUILD_JAVA)
      INSTALL(FILES ${BUILD_DIR}/${OCE_MODULE}.java DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
    endif()    
    if (BUILD_CSHARP)
      INSTALL(FILES ${BUILD_DIR}/${OCE_MODULE}.cs DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
    endif()
    INSTALL(FILES ${BUILD_DIR}/_${OCE_MODULE}.${EXTENSION} DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
ENDFOREACH(OCE_MODULE)
ENDIF(PYTHONOCC_WRAP_VISU)
IF(PYTHONOCC_WRAP_DATAEXCHANGE)
FOREACH(OCE_MODULE ${OCE_TOOLKIT_DATAEXCHANGE})
    if (BUILD_PYTHON)
      INSTALL(FILES ${BUILD_DIR}/${OCE_MODULE}.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
    endif()
    if (BUILD_JAVA)
      INSTALL(FILES ${BUILD_DIR}/${OCE_MODULE}.java DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
    endif()    
    if (BUILD_CSHARP)
      INSTALL(FILES ${BUILD_DIR}/${OCE_MODULE}.cs DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
    endif()
    INSTALL(FILES ${BUILD_DIR}/_${OCE_MODULE}.${EXTENSION} DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
ENDFOREACH(OCE_MODULE)
ENDIF(PYTHONOCC_WRAP_DATAEXCHANGE)

# install third part modules
IF(PYTHONOCC_WRAP_VISU)
    if (BUILD_PYTHON)
      INSTALL(FILES ${BUILD_DIR}/Visualization.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
    endif()
    if (BUILD_JAVA)
      INSTALL(FILES ${BUILD_DIR}/Visualization.java DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
    endif()    
    if (BUILD_CSHARP)
      INSTALL(FILES ${BUILD_DIR}/Visualization.cs DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
    endif()
INSTALL(FILES ${BUILD_DIR}/_Visualization.${EXTENSION} DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
ENDIF(PYTHONOCC_WRAP_VISU)

# install GC
if (BUILD_PYTHON)
  INSTALL(FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/GarbageCollector.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
endif()
if (BUILD_JAVA)
  INSTALL(FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/GarbageCollector.java DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
endif()    
if (BUILD_CSHARP)
  INSTALL(FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/GarbageCollector.cs DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
endif()
# install addons
INSTALL(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/src/addons/Display DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
# install LICENSE file
INSTALL(FILES ${CMAKE_CURRENT_SOURCE_DIR}/LICENSE DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
# install AUTHORS file
INSTALL(FILES ${CMAKE_CURRENT_SOURCE_DIR}/AUTHORS DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
# install __init__.py file
if (BUILD_PYTHON)
  INSTALL(FILES ${CMAKE_CURRENT_SOURCE_DIR}/cmake/__init__.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
endif()

#######################
# pythonOCC Packaging #
# $ make package      #
#######################
IF(UNIX)
  INCLUDE(InstallRequiredSystemLibraries)
ENDIF(UNIX)
SET(CPACK_PACKAGE_DESCRIPTION_SUMMARY "pythonOCC")
SET(CPACK_PACKAGE_VENDOR "Thomas Paviot (tpaviot@gmail.com)")
SET(CPACK_SET_DESTDIR "ON")
SET(CPACK_PACKAGE_DESCRIPTION "A 3D CAD/CAM python package")
SET(CPACK_PACKAGE_VERSION "0.16.0")
SET(CPACK_PACKAGE_VERSION_MAJOR ${PYTHONOCC_VERSION_MAJOR})
SET(CPACK_PACKAGE_VERSION_MINOR ${PYTHONOCC_VERSION_MINOR})
SET(CPACK_PACKAGE_VERSION_PATCH ${PYTHONOCC_VERSION_PATCH})
SET(CPACK_PACKAGE_NAME PYTHONOCC)
SET(CPACK_RESOURCE_FILE_LICENSE ${CMAKE_CURRENT_SOURCE_DIR}/LICENSE)
SET(CPACK_PACKAGE_DESCRIPTION_SUMMARY "A 3D CAD/CAM python package")
SET(CPACK_PACKAGE_CONTACT "pythonocc googlegroup <pythonocc@googlegroups.com>")

##########
# Debian #
##########
SET(CPACK_GENERATOR "DEB")
SET(CPACK_DEBIAN_PACKAGE_NAME "pythonocc")
SET(CPACK_DEBIAN_PACKAGE_SECTION "devel")
SET(CPACK_DEBIAN_PACKAGE_PRIORITY "optional")
SET(CPACK_DEBIAN_PACKAGE_MAINTAINER "Thomas Paviot (tpaviot@gmail.com)")
SET(CPACK_DEBIAN_PACKAGE_HOMEPAGE "http://www.pythonocc.org")
INCLUDE(CPack)
