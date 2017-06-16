##Copyright (c) 2011-2017 Thomas Paviot (tpaviot@gmail.com)
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

project(PYTHONOCC)

# set pythonOCC version
set(PYTHONOCC_VERSION_MAJOR 0)
set(PYTHONOCC_VERSION_MINOR 18)
set(PYTHONOCC_VERSION_PATCH)
#  Empty for official releases, set to -dev, -rc1, etc for development releases
set(PYTHONOCC_VERSION_DEVEL)

cmake_minimum_required(VERSION 2.6)

set(CMAKE_BUILD_TYPE "MinSizeRel" CACHE STRING "Build type")
message(STATUS " ${CMAKE_CXX_FLAGS}") 
set(BUILD_SHARED_LIBS ON)
include_directories(${CMAKE_CURRENT_SOURCE_DIR})

if(APPLE)
  set(CMAKE_MACOSX_RPATH ON)
  set(CMAKE_SKIP_BUILD_RPATH FALSE)
  set(CMAKE_BUILD_WITH_INSTALL_RPATH FALSE)
  set(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib")
  set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)
endif(APPLE)

#############################
# Option_With_Default macro #
#############################
macro( option_with_default OPTION_NAME OPTION_STRING OPTION_DEFAULT )
if( NOT DEFINED ${OPTION_NAME} )
	set( ${OPTION_NAME} ${OPTION_DEFAULT} )
endif( NOT DEFINED ${OPTION_NAME} )
	OPTION( ${OPTION_NAME} "${OPTION_STRING}" ${${OPTION_NAME}} )
endmacro( option_with_default OPTION_NAME OPTION_STRING OPTION_DEFAULT )

##########
# Python #
##########
find_package(PythonInterp)
find_package(PythonLibs)
include_directories(${PYTHON_INCLUDE_PATH})

##############################################################
# 32/64 bit detection
###############################################################
if(${CMAKE_SIZEOF_VOID_P} MATCHES "8")
	# If in 64bit mode, we have to define the _OCC64 variable
	add_definitions(-D_OCC64)
	set(CMAKE_SWIG_FLAGS ${CMAKE_SWIG_FLAGS} -D_OCC64)
	set(BIT 64)
else(${CMAKE_SIZEOF_VOID_P} MATCHES "8")
	set(BIT 32)
endif(${CMAKE_SIZEOF_VOID_P} MATCHES "8")
message(STATUS "Build ${BIT}bit")

if ((NOT MSVC) OR (CMAKE_BUILD_TOOL STREQUAL "nmake"))
	if( NOT DEFINED PYTHONOCC_BUILD_TYPE )
		set( PYTHONOCC_BUILD_TYPE "MinSizeRel" CACHE STRING "Build type" ) # By default set release build
	endif( NOT DEFINED PYTHONOCC_BUILD_TYPE )
	set( CMAKE_BUILD_TYPE ${PYTHONOCC_BUILD_TYPE} CACHE INTERNAL "Build type,
		immutable" FORCE )
endif((NOT MSVC) OR (CMAKE_BUILD_TOOL STREQUAL "nmake"))

# Mingw64 needs MS_WIN64 to be defined (otherwise link failures)
if(MINGW)
	message(STATUS "MinGW:")
	if(BIT MATCHES "64")
		add_definitions(-DMS_WIN64)
	endif(BIT MATCHES "64")
endif(MINGW)

########
# SWIG #
########
find_package(SWIG 3.0.9)
include(${SWIG_USE_FILE})
set(SWIG_FILES_PATH src/SWIG_files/wrapper)


############
# FreeType #
############
find_package(Freetype REQUIRED)
include_directories(${FREETYPE_INCLUDE_DIRS})
    
################################
# OCE include and lib location #
################################
if(DEFINED OCE_INCLUDE_PATH)
  if(NOT DEFINED OCE_LIB_PATH)
    message(FATAL_ERROR "OCE_LIB_PATH must be defined")
  endif (NOT DEFINED OCE_LIB_PATH)
  set(OCE_INCLUDE_PATH ${OCE_INCLUDE_PATH} CACHE PATH "OCE include path")
  set(OCE_LIB_PATH ${OCE_LIB_PATH} CACHE PATH "OCE lib path")
  include_directories(${OCE_INCLUDE_PATH})
  link_directories(${OCE_LIB_PATH})
# if OCE_INCLUDE_PATH is not passed at command line,
# find OCE automatically
else(OCE_INCLUDE_PATH)
  find_package(OCE 0.18 REQUIRED)
  set(CMAKE_SWIG_FLAGS ${CMAKE_SWIG_FLAGS} -DOCC_VERSION_HEX=0x060901) # oce0.17.2
  if(OCE_FOUND)
    message(STATUS "OpenCASCADE Community Edition (OCE) found.")
    include_directories(${OCE_INCLUDE_DIRS})
  else()  # set default paths
    set(OCE_INCLUDE_PATH /usr/local/include/oce CACHE PATH "OCE include path")
    set(OCE_LIB_PATH /usr/local/lib CACHE PATH "OCE lib path")
    include_directories(${OCE_INCLUDE_PATH})
    link_directories(${OCE_LIB_PATH})
  endif(OCE_FOUND)
endif(DEFINED OCE_INCLUDE_PATH)

################################
# OCE include and lib location #
################################
if(PYTHONOCC_WRAP_SMESH)
  set(SMESH_INCLUDE_PATH /usr/local/include/smesh CACHE PATH "SMESH include path")
  set(SMESH_LIB_PATH /usr/local/lib CACHE PATH "SMESH lib path")
  include_directories(${SMESH_INCLUDE_PATH})
  link_directories(${SMESH_LIB_PATH})
  set(SMESH_LIBRARIES DriverDAT Driver DriverSTL DriverUNV SMESHDS SMDS StdMeshers SMESH)
  if(PYTHONOCC_WRAP_SMESH_NETGENPLUGIN)
    set(SMESH_LIBRARIES NETGENPlugin ${SMESH_LIBRARIES})
  endif(PYTHONOCC_WRAP_SMESH_NETGENPLUGIN)
endif(PYTHONOCC_WRAP_SMESH)

##############################################
# Installation directory                     #
# by default, installed to site-packages/OCC #
##############################################
execute_process(COMMAND ${PYTHON_EXECUTABLE} -c "from distutils.sysconfig import get_python_lib; import os;print(get_python_lib())" OUTPUT_VARIABLE python_lib OUTPUT_STRIP_TRAILING_WHITESPACE )
set(PYTHONOCC_INSTALL_DIRECTORY ${python_lib}/OCC CACHE PATH "pythonOCC install directory" )

# List of OCE shared libraries to link with
# TODO: this should be build from the module list
set(OCE_MODEL_LIBRARIES TKernel TKMath TKG2d TKG3d TKGeomBase TKBRep TKGeomAlgo
    TKTopAlgo TKPrim TKBO TKHLR TKMesh TKShHealing TKXMesh TKBool TKFillet TKFeat TKOffset)
set(OCE_VISUALIZATION_LIBRARIES TKService TKV3d TKMeshVS TKOpenGl TKVoxel TKNIS)
set(OCE_DATAEXCHANGE_LIBRARIES TKSTL TKXSBase TKSTEPBase TKIGES TKSTEPAttr TKSTEP209
    TKSTEP TKVRML)
set(OCE_OCAF_LIBRARIES TKLCAF TKXCAF TKXDESTEP TKXDEIGES TKXSBase TKV3d)

######################################################
# Configure Build settings according to the platform #
######################################################
if(UNIX)
  if(APPLE)
    ######### MacOSX ###########
	set(PLATFORM Darwin)
  else(APPLE)
    ######### Unix/Linux ###########
    set(PLATFORM Unix)
  endif(APPLE)
  set(CMAKE_SWIG_FLAGS -O -w302,401,314,509,512
        -DCSFDB -DHAVE_CONFIG_H -DOCC_CONVERT_SIGNALS)
  add_definitions(-DHAVE_CONFIG_H -DCSFDB -DOCC_CONVERT_SIGNALS)
else(UNIX)
  if(WIN32)
    ######### Windows ###########
    add_definitions(-DWNT -DWIN32 -D_WINDOWS -DCSFDB -DHAVE_CONFIG_H)
	# specific windows defines for python version >=2.6.0
	execute_process(COMMAND python -c "import sys;print (2,6)>=sys.version_info[:2]" OUTPUT_VARIABLE PYTHON_26_OR_HIGHER OUTPUT_STRIP_TRAILING_WHITESPACE)
	if(${PYTHON_26_OR_HIGHER} MATCHES "True")
	  add_definitions(-DHAVE_ACOSH -DHAVE_ASINH -DHAVE_ATANH)
	endif(${PYTHON_26_OR_HIGHER} MATCHES "True")
    set(CMAKE_SWIG_FLAGS -O -w302,401,314,509,512 -DCSFDB -DWIN32 -D_WINDOWS)
    set(PLATFORM win)
  else(WIN32)
    message(STATUS "Unknown platform")
  endif(WIN32)
endif(UNIX)
message(STATUS "Platform:" ${PLATFORM})

##################################
# Tells Swig to use py3k option  #
##################################
execute_process(COMMAND ${PYTHON_EXECUTABLE} -c "from __future__ import print_function; import sys; print(sys.version_info.major)" OUTPUT_VARIABLE python_version_major OUTPUT_STRIP_TRAILING_WHITESPACE )

if(${python_version_major} MATCHES "3")
  set(CMAKE_SWIG_FLAGS ${CMAKE_SWIG_FLAGS} -py3)
endif(${python_version_major} MATCHES "3")

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
message(STATUS "output_path: ${LIBRARY_OUTPUT_PATH}")

############################
# OpenCASCADE Modules list #
############################
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/OCE_Modules.cmake)
# add an option to choose toolkits to compile
option_with_default(PYTHONOCC_WRAP_VISU "Compile Visualisation" TRUE)
option_with_default(PYTHONOCC_WRAP_DATAEXCHANGE "Compile DataExchange wrapper" TRUE)
option_with_default(PYTHONOCC_WRAP_OCAF "Compile OCE Application Framework wrapper" TRUE)
option_with_default(PYTHONOCC_WRAP_SMESH "Compile SMESH wrapper" FALSE)

######################
# SMESH Modules list #
######################
if(PYTHONOCC_WRAP_SMESH)
  option_with_default(PYTHONOCC_WRAP_SMESH_NETGENPLUGIN "Compile NETGENPlugin wrapper" FALSE)
  include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/SMESH_Modules.cmake)
  # need vtk headers to compile
  #find_package(VTK COMPONENTS vtkCommonCore vtkCommonDataModel vtkIOLegacy vtkFiltersVerdict)
  #include_directories(${VTK_INCLUDE_DIRS})
endif(PYTHONOCC_WRAP_SMESH)

###################
# Wrapper Modules #
###################

##################
# MODEL Toolkits #
##################
file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/${SWIG_FILES_PATH})
foreach(OCE_MODULE ${OCE_TOOLKIT_MODEL})
	set(FILE ${SWIG_FILES_PATH}/${OCE_MODULE}.i)
	set_source_files_properties(${FILE} PROPERTIES CPLUSPLUS ON)
  swig_add_module(${OCE_MODULE} python ${FILE})
  swig_link_libraries(${OCE_MODULE} ${PYTHON_LIBRARIES} ${OCE_MODEL_LIBRARIES})
endforeach(OCE_MODULE)

#################
# Visualisation #
#################
if(PYTHONOCC_WRAP_VISU)
  foreach(OCE_MODULE ${OCE_TOOLKIT_VISUALIZATION})
    set(FILE ${SWIG_FILES_PATH}/${OCE_MODULE}.i)
    set_source_files_properties(${FILE} PROPERTIES CPLUSPLUS ON)
    swig_add_module(${OCE_MODULE} python ${FILE})
    swig_link_libraries(${OCE_MODULE} ${PYTHON_LIBRARIES} ${OCE_MODEL_LIBRARIES} ${OCE_VISUALIZATION_LIBRARIES})
  endforeach(OCE_MODULE)
  # Build third part modules
  # TODO : the following line is strange but necessary
  execute_process(COMMAND ${CMAKE_COMMAND} -E make_directory src/Visualization)
  set_source_files_properties(${CMAKE_CURRENT_SOURCE_DIR}/src/Visualization/Visualization.i PROPERTIES CPLUSPLUS ON)
  include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src/Visualization)
  set(VISUALIZATION_SOURCE_FILES
  	${CMAKE_CURRENT_SOURCE_DIR}/src/Visualization/Visualization.i
  	${CMAKE_CURRENT_SOURCE_DIR}/src/Visualization/Display3d.cpp
  	${CMAKE_CURRENT_SOURCE_DIR}/src/Visualization/Tesselator.cpp
  	)
  swig_add_module(Visualization python ${VISUALIZATION_SOURCE_FILES})
  if(APPLE)
    # on OSX, always add /System/Library/Frameworks/Cocoa.framework, even
    # if GLX is enabled
    swig_link_libraries(Visualization ${PYTHON_LIBRARIES} ${OCE_MODEL_LIBRARIES} ${OCE_VISUALIZATION_LIBRARIES} /System/Library/Frameworks/Cocoa.framework)
  else(APPLE)
    swig_link_libraries(Visualization ${PYTHON_LIBRARIES} ${OCE_MODEL_LIBRARIES} ${OCE_VISUALIZATION_LIBRARIES})
  endif(APPLE)
endif(PYTHONOCC_WRAP_VISU)

##########
# Addons #
##########
execute_process(COMMAND ${CMAKE_COMMAND} -E make_directory src/Addons)
set_source_files_properties(${CMAKE_CURRENT_SOURCE_DIR}/src/Addons/Addons.i PROPERTIES CPLUSPLUS ON)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src/Addons)
set(ADDONS_SOURCE_FILES
${CMAKE_CURRENT_SOURCE_DIR}/src/Addons/Addons.i
${CMAKE_CURRENT_SOURCE_DIR}/src/Addons/Font3d.cpp
)
swig_add_module(Addons python ${ADDONS_SOURCE_FILES})
swig_link_libraries(Addons ${PYTHON_LIBRARIES} ${OCE_MODEL_LIBRARIES} ${OCE_VISUALIZATION_LIBRARIES})

############
# Splitter #
############
execute_process(COMMAND ${CMAKE_COMMAND} -E make_directory src/Splitter)
set_source_files_properties(${CMAKE_CURRENT_SOURCE_DIR}/src/Splitter/GEOMAlgo.i PROPERTIES CPLUSPLUS ON)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src/Splitter)
set(SPLITTER_SOURCE_FILES
${CMAKE_CURRENT_SOURCE_DIR}/src/Splitter/GEOMAlgo.i
${CMAKE_CURRENT_SOURCE_DIR}/src/Splitter/GEOMAlgo_Splitter.cxx
)
swig_add_module(GEOMAlgo python ${SPLITTER_SOURCE_FILES})
swig_link_libraries(GEOMAlgo ${PYTHON_LIBRARIES} ${OCE_MODEL_LIBRARIES} ${OCE_VISUALIZATION_LIBRARIES})

################
# DataExchange #
################
if(PYTHONOCC_WRAP_DATAEXCHANGE)
  foreach(OCE_MODULE ${OCE_TOOLKIT_DATAEXCHANGE})
    set(FILE ${SWIG_FILES_PATH}/${OCE_MODULE}.i)
    set_source_files_properties(${FILE} PROPERTIES CPLUSPLUS ON)
    swig_add_module(${OCE_MODULE} python ${FILE})
    swig_link_libraries(${OCE_MODULE} ${PYTHON_LIBRARIES} ${OCE_MODEL_LIBRARIES} ${OCE_DATAEXCHANGE_LIBRARIES})
  endforeach(OCE_MODULE)
endif(PYTHONOCC_WRAP_DATAEXCHANGE)

########
# OCAF #
########
if(PYTHONOCC_WRAP_OCAF)
  foreach(OCE_MODULE ${OCE_TOOLKIT_OCAF})
    set(FILE ${SWIG_FILES_PATH}/${OCE_MODULE}.i)
    set_source_files_properties(${FILE} PROPERTIES CPLUSPLUS ON)
    swig_add_module(${OCE_MODULE} python ${FILE})
    swig_link_libraries(${OCE_MODULE} ${PYTHON_LIBRARIES} ${OCE_MODEL_LIBRARIES} ${OCE_OCAF_LIBRARIES})
  endforeach(OCE_MODULE)
endif(PYTHONOCC_WRAP_OCAF)

#########
# SMESH #
#########
if(PYTHONOCC_WRAP_SMESH)
  foreach(SMESH_MODULE ${SMESH_TOOLKIT})
    set(FILE ${SWIG_FILES_PATH}/${SMESH_MODULE}.i)
    set_source_files_properties(${FILE} PROPERTIES CPLUSPLUS ON)
    swig_add_module(${SMESH_MODULE} python ${FILE})
    swig_link_libraries(${SMESH_MODULE} ${PYTHON_LIBRARIES} ${OCE_MODEL_LIBRARIES} ${OCE_VISUALIZATION_LIBRARIES} ${OCE_OCAF_LIBRARIES} ${SMESH_LIBRARIES})
  endforeach(SMESH_MODULE)
endif(PYTHONOCC_WRAP_SMESH)

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
	install(FILES ${BUILD_DIR}/${OCE_MODULE}.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
	install(TARGETS _${OCE_MODULE} DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
endforeach(OCE_MODULE)
if(PYTHONOCC_WRAP_VISU)
foreach(OCE_MODULE ${OCE_TOOLKIT_VISUALIZATION})
    install(FILES ${BUILD_DIR}/${OCE_MODULE}.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
    install(TARGETS _${OCE_MODULE} DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
endforeach(OCE_MODULE)
endif(PYTHONOCC_WRAP_VISU)
if(PYTHONOCC_WRAP_DATAEXCHANGE)
foreach(OCE_MODULE ${OCE_TOOLKIT_DATAEXCHANGE})
    install(FILES ${BUILD_DIR}/${OCE_MODULE}.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
    install(TARGETS _${OCE_MODULE} DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
endforeach(OCE_MODULE)
endif(PYTHONOCC_WRAP_DATAEXCHANGE)
if(PYTHONOCC_WRAP_OCAF)
foreach(OCE_MODULE ${OCE_TOOLKIT_OCAF})
    install(FILES ${BUILD_DIR}/${OCE_MODULE}.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
    install(TARGETS _${OCE_MODULE} DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
endforeach(OCE_MODULE)
endif(PYTHONOCC_WRAP_OCAF)

# install third part modules
if(PYTHONOCC_WRAP_VISU)
install(FILES ${BUILD_DIR}/Visualization.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
install(TARGETS _Visualization DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
endif(PYTHONOCC_WRAP_VISU)

# instal SMESH
if(PYTHONOCC_WRAP_SMESH)
foreach(SMESH_MODULE ${SMESH_TOOLKIT})
    install(FILES ${BUILD_DIR}/${SMESH_MODULE}.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
    install(FILES ${BUILD_DIR}/_${SMESH_MODULE}.${EXTENSION} DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
endforeach(SMESH_MODULE)
endif(PYTHONOCC_WRAP_SMESH)

# install addons
install(FILES ${BUILD_DIR}/Addons.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
install(TARGETS _Addons DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/src/Display DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
# install LICENSE file
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/LICENSE DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
# install AUTHORS file
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/AUTHORS DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
# install __init__.py file
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/cmake/__init__.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
# install Splitter
install(FILES ${BUILD_DIR}/GEOMAlgo.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )
install(TARGETS _GEOMAlgo DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )

#######################
# pythonOCC Packaging #
# $ make package      #
#######################
if(UNIX)
  include(InstallRequiredSystemLibraries)
endif(UNIX)
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "pythonOCC")
set(CPACK_PACKAGE_VENDOR "Thomas Paviot (tpaviot@gmail.com)")
set(CPACK_SET_DESTDIR "ON")
set(CPACK_PACKAGE_DESCRIPTION "A 3D CAD/CAM python package")
set(CPACK_PACKAGE_VERSION "0.16.0")
set(CPACK_PACKAGE_VERSION_MAJOR ${PYTHONOCC_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${PYTHONOCC_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${PYTHONOCC_VERSION_PATCH})
set(CPACK_PACKAGE_NAME PYTHONOCC)
set(CPACK_RESOURCE_FILE_LICENSE ${CMAKE_CURRENT_SOURCE_DIR}/LICENSE)
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "A 3D CAD/CAM python package")
set(CPACK_PACKAGE_CONTACT "pythonocc googlegroup <pythonocc@googlegroups.com>")

##########
# Debian #
##########
set(CPACK_GENERATOR "DEB")
set(CPACK_DEBIAN_PACKAGE_NAME "pythonocc")
set(CPACK_DEBIAN_PACKAGE_SECTION "devel")
set(CPACK_DEBIAN_PACKAGE_PRIORITY "optional")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Thomas Paviot (tpaviot@gmail.com)")
set(CPACK_DEBIAN_PACKAGE_HOMEPAGE "http://www.pythonocc.org")
include(CPack)
