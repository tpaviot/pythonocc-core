/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

This file is part of pythonOCC.
pythonOCC is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pythonOCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
*/
%define V3DDOCSTRING
"V3d module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_v3d.html"
%enddef
%module (package="OCC.Core", docstring=V3DDOCSTRING) V3d


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<V3d_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Graphic3d_module.hxx>
#include<gp_module.hxx>
#include<Quantity_module.hxx>
#include<Aspect_module.hxx>
#include<TColStd_module.hxx>
#include<Bnd_module.hxx>
#include<TCollection_module.hxx>
#include<Image_module.hxx>
#include<TShort_module.hxx>
#include<TColQuantity_module.hxx>
#include<Bnd_module.hxx>
#include<Geom_module.hxx>
#include<BVH_module.hxx>
#include<TColgp_module.hxx>
#include<TopTools_module.hxx>
#include<SelectMgr_module.hxx>
#include<Poly_module.hxx>
#include<HLRAlgo_module.hxx>
#include<Select3D_module.hxx>
#include<Media_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Graphic3d.i
%import gp.i
%import Quantity.i
%import Aspect.i
%import TColStd.i
%import Bnd.i
%import TCollection.i
%import Image.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum V3d_TypeOfPickCamera {
	V3d_POSITIONCAMERA = 0,
	V3d_SPACECAMERA = 1,
	V3d_RADIUSTEXTCAMERA = 2,
	V3d_ExtRADIUSCAMERA = 3,
	V3d_IntRADIUSCAMERA = 4,
	V3d_NOTHINGCAMERA = 5,
};

enum V3d_TypeOfVisualization {
	V3d_WIREFRAME = 0,
	V3d_ZBUFFER = 1,
};

enum V3d_TypeOfView {
	V3d_ORTHOGRAPHIC = 0,
	V3d_PERSPECTIVE = 1,
};

enum V3d_StereoDumpOptions {
	V3d_SDO_MONO = 0,
	V3d_SDO_LEFT_EYE = 1,
	V3d_SDO_RIGHT_EYE = 2,
	V3d_SDO_BLENDED = 3,
};

enum V3d_TypeOfOrientation {
	V3d_Xpos = 0,
	V3d_Ypos = 1,
	V3d_Zpos = 2,
	V3d_Xneg = 3,
	V3d_Yneg = 4,
	V3d_Zneg = 5,
	V3d_XposYpos = 6,
	V3d_XposZpos = 7,
	V3d_YposZpos = 8,
	V3d_XnegYneg = 9,
	V3d_XnegYpos = 10,
	V3d_XnegZneg = 11,
	V3d_XnegZpos = 12,
	V3d_YnegZneg = 13,
	V3d_YnegZpos = 14,
	V3d_XposYneg = 15,
	V3d_XposZneg = 16,
	V3d_YposZneg = 17,
	V3d_XposYposZpos = 18,
	V3d_XposYnegZpos = 19,
	V3d_XposYposZneg = 20,
	V3d_XnegYposZpos = 21,
	V3d_XposYnegZneg = 22,
	V3d_XnegYposZneg = 23,
	V3d_XnegYnegZpos = 24,
	V3d_XnegYnegZneg = 25,
	V3d_TypeOfOrientation_Zup_AxoLeft = V3d_XnegYnegZpos,
	V3d_TypeOfOrientation_Zup_AxoRight = V3d_XposYnegZpos,
	V3d_TypeOfOrientation_Zup_Front = V3d_Yneg,
	V3d_TypeOfOrientation_Zup_Back = V3d_Ypos,
	V3d_TypeOfOrientation_Zup_Top = V3d_Zpos,
	V3d_TypeOfOrientation_Zup_Bottom = V3d_Zneg,
	V3d_TypeOfOrientation_Zup_Left = V3d_Xneg,
	V3d_TypeOfOrientation_Zup_Right = V3d_Xpos,
	V3d_TypeOfOrientation_Yup_AxoLeft = V3d_XnegYposZpos,
	V3d_TypeOfOrientation_Yup_AxoRight = V3d_XposYposZpos,
	V3d_TypeOfOrientation_Yup_Front = V3d_Zpos,
	V3d_TypeOfOrientation_Yup_Back = V3d_Zneg,
	V3d_TypeOfOrientation_Yup_Top = V3d_Ypos,
	V3d_TypeOfOrientation_Yup_Bottom = V3d_Yneg,
	V3d_TypeOfOrientation_Yup_Left = V3d_Xpos,
	V3d_TypeOfOrientation_Yup_Right = V3d_Xneg,
};

enum V3d_TypeOfAxe {
	V3d_X = 0,
	V3d_Y = 1,
	V3d_Z = 2,
};

enum V3d_TypeOfRepresentation {
	V3d_SIMPLE = 0,
	V3d_COMPLETE = 1,
	V3d_PARTIAL = 2,
	V3d_SAMELAST = 3,
};

enum V3d_TypeOfBackfacingModel {
	V3d_TOBM_AUTOMATIC = 0,
	V3d_TOBM_ALWAYS_DISPLAYED = 1,
	V3d_TOBM_NEVER_DISPLAYED = 2,
};

enum V3d_TypeOfPickLight {
	V3d_POSITIONLIGHT = 0,
	V3d_SPACELIGHT = 1,
	V3d_RADIUSTEXTLIGHT = 2,
	V3d_ExtRADIUSLIGHT = 3,
	V3d_IntRADIUSLIGHT = 4,
	V3d_NOTHING = 5,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class V3d_TypeOfPickCamera(IntEnum):
	V3d_POSITIONCAMERA = 0
	V3d_SPACECAMERA = 1
	V3d_RADIUSTEXTCAMERA = 2
	V3d_ExtRADIUSCAMERA = 3
	V3d_IntRADIUSCAMERA = 4
	V3d_NOTHINGCAMERA = 5
V3d_POSITIONCAMERA = V3d_TypeOfPickCamera.V3d_POSITIONCAMERA
V3d_SPACECAMERA = V3d_TypeOfPickCamera.V3d_SPACECAMERA
V3d_RADIUSTEXTCAMERA = V3d_TypeOfPickCamera.V3d_RADIUSTEXTCAMERA
V3d_ExtRADIUSCAMERA = V3d_TypeOfPickCamera.V3d_ExtRADIUSCAMERA
V3d_IntRADIUSCAMERA = V3d_TypeOfPickCamera.V3d_IntRADIUSCAMERA
V3d_NOTHINGCAMERA = V3d_TypeOfPickCamera.V3d_NOTHINGCAMERA

class V3d_TypeOfVisualization(IntEnum):
	V3d_WIREFRAME = 0
	V3d_ZBUFFER = 1
V3d_WIREFRAME = V3d_TypeOfVisualization.V3d_WIREFRAME
V3d_ZBUFFER = V3d_TypeOfVisualization.V3d_ZBUFFER

class V3d_TypeOfView(IntEnum):
	V3d_ORTHOGRAPHIC = 0
	V3d_PERSPECTIVE = 1
V3d_ORTHOGRAPHIC = V3d_TypeOfView.V3d_ORTHOGRAPHIC
V3d_PERSPECTIVE = V3d_TypeOfView.V3d_PERSPECTIVE

class V3d_StereoDumpOptions(IntEnum):
	V3d_SDO_MONO = 0
	V3d_SDO_LEFT_EYE = 1
	V3d_SDO_RIGHT_EYE = 2
	V3d_SDO_BLENDED = 3
V3d_SDO_MONO = V3d_StereoDumpOptions.V3d_SDO_MONO
V3d_SDO_LEFT_EYE = V3d_StereoDumpOptions.V3d_SDO_LEFT_EYE
V3d_SDO_RIGHT_EYE = V3d_StereoDumpOptions.V3d_SDO_RIGHT_EYE
V3d_SDO_BLENDED = V3d_StereoDumpOptions.V3d_SDO_BLENDED

class V3d_TypeOfOrientation(IntEnum):
	V3d_Xpos = 0
	V3d_Ypos = 1
	V3d_Zpos = 2
	V3d_Xneg = 3
	V3d_Yneg = 4
	V3d_Zneg = 5
	V3d_XposYpos = 6
	V3d_XposZpos = 7
	V3d_YposZpos = 8
	V3d_XnegYneg = 9
	V3d_XnegYpos = 10
	V3d_XnegZneg = 11
	V3d_XnegZpos = 12
	V3d_YnegZneg = 13
	V3d_YnegZpos = 14
	V3d_XposYneg = 15
	V3d_XposZneg = 16
	V3d_YposZneg = 17
	V3d_XposYposZpos = 18
	V3d_XposYnegZpos = 19
	V3d_XposYposZneg = 20
	V3d_XnegYposZpos = 21
	V3d_XposYnegZneg = 22
	V3d_XnegYposZneg = 23
	V3d_XnegYnegZpos = 24
	V3d_XnegYnegZneg = 25
	V3d_TypeOfOrientation_Zup_AxoLeft = V3d_XnegYnegZpos
	V3d_TypeOfOrientation_Zup_AxoRight = V3d_XposYnegZpos
	V3d_TypeOfOrientation_Zup_Front = V3d_Yneg
	V3d_TypeOfOrientation_Zup_Back = V3d_Ypos
	V3d_TypeOfOrientation_Zup_Top = V3d_Zpos
	V3d_TypeOfOrientation_Zup_Bottom = V3d_Zneg
	V3d_TypeOfOrientation_Zup_Left = V3d_Xneg
	V3d_TypeOfOrientation_Zup_Right = V3d_Xpos
	V3d_TypeOfOrientation_Yup_AxoLeft = V3d_XnegYposZpos
	V3d_TypeOfOrientation_Yup_AxoRight = V3d_XposYposZpos
	V3d_TypeOfOrientation_Yup_Front = V3d_Zpos
	V3d_TypeOfOrientation_Yup_Back = V3d_Zneg
	V3d_TypeOfOrientation_Yup_Top = V3d_Ypos
	V3d_TypeOfOrientation_Yup_Bottom = V3d_Yneg
	V3d_TypeOfOrientation_Yup_Left = V3d_Xpos
	V3d_TypeOfOrientation_Yup_Right = V3d_Xneg
V3d_Xpos = V3d_TypeOfOrientation.V3d_Xpos
V3d_Ypos = V3d_TypeOfOrientation.V3d_Ypos
V3d_Zpos = V3d_TypeOfOrientation.V3d_Zpos
V3d_Xneg = V3d_TypeOfOrientation.V3d_Xneg
V3d_Yneg = V3d_TypeOfOrientation.V3d_Yneg
V3d_Zneg = V3d_TypeOfOrientation.V3d_Zneg
V3d_XposYpos = V3d_TypeOfOrientation.V3d_XposYpos
V3d_XposZpos = V3d_TypeOfOrientation.V3d_XposZpos
V3d_YposZpos = V3d_TypeOfOrientation.V3d_YposZpos
V3d_XnegYneg = V3d_TypeOfOrientation.V3d_XnegYneg
V3d_XnegYpos = V3d_TypeOfOrientation.V3d_XnegYpos
V3d_XnegZneg = V3d_TypeOfOrientation.V3d_XnegZneg
V3d_XnegZpos = V3d_TypeOfOrientation.V3d_XnegZpos
V3d_YnegZneg = V3d_TypeOfOrientation.V3d_YnegZneg
V3d_YnegZpos = V3d_TypeOfOrientation.V3d_YnegZpos
V3d_XposYneg = V3d_TypeOfOrientation.V3d_XposYneg
V3d_XposZneg = V3d_TypeOfOrientation.V3d_XposZneg
V3d_YposZneg = V3d_TypeOfOrientation.V3d_YposZneg
V3d_XposYposZpos = V3d_TypeOfOrientation.V3d_XposYposZpos
V3d_XposYnegZpos = V3d_TypeOfOrientation.V3d_XposYnegZpos
V3d_XposYposZneg = V3d_TypeOfOrientation.V3d_XposYposZneg
V3d_XnegYposZpos = V3d_TypeOfOrientation.V3d_XnegYposZpos
V3d_XposYnegZneg = V3d_TypeOfOrientation.V3d_XposYnegZneg
V3d_XnegYposZneg = V3d_TypeOfOrientation.V3d_XnegYposZneg
V3d_XnegYnegZpos = V3d_TypeOfOrientation.V3d_XnegYnegZpos
V3d_XnegYnegZneg = V3d_TypeOfOrientation.V3d_XnegYnegZneg
V3d_TypeOfOrientation_Zup_AxoLeft = V3d_TypeOfOrientation.V3d_TypeOfOrientation_Zup_AxoLeft
V3d_TypeOfOrientation_Zup_AxoRight = V3d_TypeOfOrientation.V3d_TypeOfOrientation_Zup_AxoRight
V3d_TypeOfOrientation_Zup_Front = V3d_TypeOfOrientation.V3d_TypeOfOrientation_Zup_Front
V3d_TypeOfOrientation_Zup_Back = V3d_TypeOfOrientation.V3d_TypeOfOrientation_Zup_Back
V3d_TypeOfOrientation_Zup_Top = V3d_TypeOfOrientation.V3d_TypeOfOrientation_Zup_Top
V3d_TypeOfOrientation_Zup_Bottom = V3d_TypeOfOrientation.V3d_TypeOfOrientation_Zup_Bottom
V3d_TypeOfOrientation_Zup_Left = V3d_TypeOfOrientation.V3d_TypeOfOrientation_Zup_Left
V3d_TypeOfOrientation_Zup_Right = V3d_TypeOfOrientation.V3d_TypeOfOrientation_Zup_Right
V3d_TypeOfOrientation_Yup_AxoLeft = V3d_TypeOfOrientation.V3d_TypeOfOrientation_Yup_AxoLeft
V3d_TypeOfOrientation_Yup_AxoRight = V3d_TypeOfOrientation.V3d_TypeOfOrientation_Yup_AxoRight
V3d_TypeOfOrientation_Yup_Front = V3d_TypeOfOrientation.V3d_TypeOfOrientation_Yup_Front
V3d_TypeOfOrientation_Yup_Back = V3d_TypeOfOrientation.V3d_TypeOfOrientation_Yup_Back
V3d_TypeOfOrientation_Yup_Top = V3d_TypeOfOrientation.V3d_TypeOfOrientation_Yup_Top
V3d_TypeOfOrientation_Yup_Bottom = V3d_TypeOfOrientation.V3d_TypeOfOrientation_Yup_Bottom
V3d_TypeOfOrientation_Yup_Left = V3d_TypeOfOrientation.V3d_TypeOfOrientation_Yup_Left
V3d_TypeOfOrientation_Yup_Right = V3d_TypeOfOrientation.V3d_TypeOfOrientation_Yup_Right

class V3d_TypeOfAxe(IntEnum):
	V3d_X = 0
	V3d_Y = 1
	V3d_Z = 2
V3d_X = V3d_TypeOfAxe.V3d_X
V3d_Y = V3d_TypeOfAxe.V3d_Y
V3d_Z = V3d_TypeOfAxe.V3d_Z

class V3d_TypeOfRepresentation(IntEnum):
	V3d_SIMPLE = 0
	V3d_COMPLETE = 1
	V3d_PARTIAL = 2
	V3d_SAMELAST = 3
V3d_SIMPLE = V3d_TypeOfRepresentation.V3d_SIMPLE
V3d_COMPLETE = V3d_TypeOfRepresentation.V3d_COMPLETE
V3d_PARTIAL = V3d_TypeOfRepresentation.V3d_PARTIAL
V3d_SAMELAST = V3d_TypeOfRepresentation.V3d_SAMELAST

class V3d_TypeOfBackfacingModel(IntEnum):
	V3d_TOBM_AUTOMATIC = 0
	V3d_TOBM_ALWAYS_DISPLAYED = 1
	V3d_TOBM_NEVER_DISPLAYED = 2
V3d_TOBM_AUTOMATIC = V3d_TypeOfBackfacingModel.V3d_TOBM_AUTOMATIC
V3d_TOBM_ALWAYS_DISPLAYED = V3d_TypeOfBackfacingModel.V3d_TOBM_ALWAYS_DISPLAYED
V3d_TOBM_NEVER_DISPLAYED = V3d_TypeOfBackfacingModel.V3d_TOBM_NEVER_DISPLAYED

class V3d_TypeOfPickLight(IntEnum):
	V3d_POSITIONLIGHT = 0
	V3d_SPACELIGHT = 1
	V3d_RADIUSTEXTLIGHT = 2
	V3d_ExtRADIUSLIGHT = 3
	V3d_IntRADIUSLIGHT = 4
	V3d_NOTHING = 5
V3d_POSITIONLIGHT = V3d_TypeOfPickLight.V3d_POSITIONLIGHT
V3d_SPACELIGHT = V3d_TypeOfPickLight.V3d_SPACELIGHT
V3d_RADIUSTEXTLIGHT = V3d_TypeOfPickLight.V3d_RADIUSTEXTLIGHT
V3d_ExtRADIUSLIGHT = V3d_TypeOfPickLight.V3d_ExtRADIUSLIGHT
V3d_IntRADIUSLIGHT = V3d_TypeOfPickLight.V3d_IntRADIUSLIGHT
V3d_NOTHING = V3d_TypeOfPickLight.V3d_NOTHING
};
/* end python proxy for enums */

/* handles */
%wrap_handle(V3d_AmbientLight)
%wrap_handle(V3d_CircularGrid)
%wrap_handle(V3d_Plane)
%wrap_handle(V3d_PositionLight)
%wrap_handle(V3d_RectangularGrid)
%wrap_handle(V3d_Trihedron)
%wrap_handle(V3d_View)
%wrap_handle(V3d_Viewer)
%wrap_handle(V3d_DirectionalLight)
%wrap_handle(V3d_PositionalLight)
%wrap_handle(V3d_SpotLight)
/* end handles declaration */

/* templates */
%template(V3d_ListOfLight) NCollection_List<opencascade::handle<Graphic3d_CLight>>;

%extend NCollection_List<opencascade::handle<Graphic3d_CLight>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(V3d_ListOfView) NCollection_List<opencascade::handle<V3d_View>>;

%extend NCollection_List<opencascade::handle<V3d_View>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef Handle_Graphic3d_CLight Handle_V3d_Light;
typedef Standard_Real V3d_Coordinate;
typedef Graphic3d_CLight V3d_Light;
typedef NCollection_List<opencascade::handle<Graphic3d_CLight>> V3d_ListOfLight;
typedef V3d_ListOfLight::Iterator V3d_ListOfLightIterator;
typedef NCollection_List<opencascade::handle<V3d_View>> V3d_ListOfView;
typedef V3d_ListOfView::Iterator V3d_ListOfViewIterator;
typedef Standard_Real V3d_Parameter;
typedef Graphic3d_TypeOfLightSource V3d_TypeOfLight;
typedef Graphic3d_TypeOfShadingModel V3d_TypeOfShadingModel;
typedef V3d_View * V3d_ViewPointer;
typedef V3d_Viewer * V3d_ViewerPointer;
/* end typedefs declaration */

/************
* class V3d *
************/
%rename(v3d) V3d;
class V3d {
	public:
		/****************** ArrowOfRadius ******************/
		/**** md5 signature: 8ddc06fb0e722ac928195b2206ccf028 ****/
		%feature("compactdefaultargs") ArrowOfRadius;
		%feature("autodoc", "Compute the graphic structure of arrow. x0,y0,z0 : coordinate of the arrow. dx,dy,dz : direction of the arrow. alpha : angle of arrow. lng : length of arrow.

Parameters
----------
garrow: Graphic3d_Group
X0: float
Y0: float
Z0: float
DX: float
DY: float
DZ: float
Alpha: float
Lng: float

Returns
-------
None
") ArrowOfRadius;
		static void ArrowOfRadius(const opencascade::handle<Graphic3d_Group> & garrow, const Standard_Real X0, const Standard_Real Y0, const Standard_Real Z0, const Standard_Real DX, const Standard_Real DY, const Standard_Real DZ, const Standard_Real Alpha, const Standard_Real Lng);

		/****************** CircleInPlane ******************/
		/**** md5 signature: 81f28238a0360e3e4b234fbafc05ada7 ****/
		%feature("compactdefaultargs") CircleInPlane;
		%feature("autodoc", "Compute the graphic structure of circle. x0,y0,z0 : center of circle. vx,vy,vz : axis of circle. radius : radius of circle.

Parameters
----------
gcircle: Graphic3d_Group
X0: float
Y0: float
Z0: float
VX: float
VY: float
VZ: float
Radius: float

Returns
-------
None
") CircleInPlane;
		static void CircleInPlane(const opencascade::handle<Graphic3d_Group> & gcircle, const Standard_Real X0, const Standard_Real Y0, const Standard_Real Z0, const Standard_Real VX, const Standard_Real VY, const Standard_Real VZ, const Standard_Real Radius);

		/****************** GetProjAxis ******************/
		/**** md5 signature: ff653ed0a2749aac4d9fc7a46f5eda14 ****/
		%feature("compactdefaultargs") GetProjAxis;
		%feature("autodoc", "Determines the orientation vector corresponding to the predefined orientation type.

Parameters
----------
theOrientation: V3d_TypeOfOrientation

Returns
-------
gp_Dir
") GetProjAxis;
		static gp_Dir GetProjAxis(const V3d_TypeOfOrientation theOrientation);

		/****************** SwitchViewsinWindow ******************/
		/**** md5 signature: 69e03f24a31f9c3a9e1b75cb86322bd3 ****/
		%feature("compactdefaultargs") SwitchViewsinWindow;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPreviousView: V3d_View
aNextView: V3d_View

Returns
-------
None
") SwitchViewsinWindow;
		static void SwitchViewsinWindow(const opencascade::handle<V3d_View> & aPreviousView, const opencascade::handle<V3d_View> & aNextView);

		/****************** TypeOfOrientationFromString ******************/
		/**** md5 signature: 7ec9c0aeba08bec35b6ea6f180fb12c0 ****/
		%feature("compactdefaultargs") TypeOfOrientationFromString;
		%feature("autodoc", "Returns the orientation type from the given string identifier (using case-insensitive comparison). @param thetypestring string identifier returns orientation type or v3d_typeoforientation if string identifier is invalid.

Parameters
----------
theTypeString: char *

Returns
-------
V3d_TypeOfOrientation
") TypeOfOrientationFromString;
		static V3d_TypeOfOrientation TypeOfOrientationFromString(const char * theTypeString);

		/****************** TypeOfOrientationFromString ******************/
		/**** md5 signature: 6b78449f8330edf458cfd27636ffc2e3 ****/
		%feature("compactdefaultargs") TypeOfOrientationFromString;
		%feature("autodoc", "Determines the shape type from the given string identifier (using case-insensitive comparison). @param thetypestring string identifier @param thetype detected shape type returns true if string identifier is known.

Parameters
----------
theTypeString: char *
theType: V3d_TypeOfOrientation

Returns
-------
bool
") TypeOfOrientationFromString;
		static Standard_Boolean TypeOfOrientationFromString(const char * theTypeString, V3d_TypeOfOrientation & theType);

		/****************** TypeOfOrientationToString ******************/
		/**** md5 signature: 73659bdc699005210713bf8f9d6fab86 ****/
		%feature("compactdefaultargs") TypeOfOrientationToString;
		%feature("autodoc", "Returns the string name for a given orientation type. @param thetype orientation type returns string identifier from the list xpos, ypos, zpos and others.

Parameters
----------
theType: V3d_TypeOfOrientation

Returns
-------
char *
") TypeOfOrientationToString;
		static const char * TypeOfOrientationToString(V3d_TypeOfOrientation theType);

};


%extend V3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class V3d_AmbientLight *
*************************/
class V3d_AmbientLight : public Graphic3d_CLight {
	public:
		/****************** V3d_AmbientLight ******************/
		/**** md5 signature: f5210cdcc1d0a5697d139dbb3062cbb2 ****/
		%feature("compactdefaultargs") V3d_AmbientLight;
		%feature("autodoc", "Constructs an ambient light source in the viewer. the default color of this light source is white.

Parameters
----------
theColor: Quantity_Color,optional
	default value is Quantity_NOC_WHITE

Returns
-------
None
") V3d_AmbientLight;
		 V3d_AmbientLight(const Quantity_Color & theColor = Quantity_NOC_WHITE);

		/****************** V3d_AmbientLight ******************/
		/**** md5 signature: e86fec41d80e1af987517155e90ca149 ****/
		%feature("compactdefaultargs") V3d_AmbientLight;
		%feature("autodoc", "Constructs an ambient light source in the viewer. the default color of this light source is white.

Parameters
----------
theViewer: V3d_Viewer
theColor: Quantity_Color,optional
	default value is Quantity_NOC_WHITE

Returns
-------
None
") V3d_AmbientLight;
		 V3d_AmbientLight(const opencascade::handle<V3d_Viewer> & theViewer, const Quantity_Color & theColor = Quantity_NOC_WHITE);

};


%make_alias(V3d_AmbientLight)

%extend V3d_AmbientLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class V3d_CircularGrid *
*************************/
class V3d_CircularGrid : public Aspect_CircularGrid {
	public:
		/****************** V3d_CircularGrid ******************/
		/**** md5 signature: aca6a46fdaeebed44ac8c4780cab282d ****/
		%feature("compactdefaultargs") V3d_CircularGrid;
		%feature("autodoc", "No available documentation.

Parameters
----------
aViewer: V3d_ViewerPointer
aColor: Quantity_Color
aTenthColor: Quantity_Color

Returns
-------
None
") V3d_CircularGrid;
		 V3d_CircularGrid(const V3d_ViewerPointer & aViewer, const Quantity_Color & aColor, const Quantity_Color & aTenthColor);

		/****************** Display ******************/
		/**** md5 signature: 8281a554d1ac32b57d99a718ed554038 ****/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Display;
		void Display();

		/****************** Erase ******************/
		/**** md5 signature: 683e92afcb4dd44bd3a5c6cd77cd44d8 ****/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Erase;
		void Erase();

		/****************** GraphicValues ******************/
		/**** md5 signature: b1d4700bfff10f15a14cf8c74ab10261 ****/
		%feature("compactdefaultargs") GraphicValues;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
Radius: float
OffSet: float
") GraphicValues;
		void GraphicValues(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** IsDisplayed ******************/
		/**** md5 signature: 22924cd2b5318e241154a4a4dd3d4803 ****/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDisplayed;
		Standard_Boolean IsDisplayed();

		/****************** SetColors ******************/
		/**** md5 signature: 7534a16d8d9fbd9bbe68e656a4272ad7 ****/
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "No available documentation.

Parameters
----------
aColor: Quantity_Color
aTenthColor: Quantity_Color

Returns
-------
None
") SetColors;
		void SetColors(const Quantity_Color & aColor, const Quantity_Color & aTenthColor);

		/****************** SetGraphicValues ******************/
		/**** md5 signature: 014c9a5fb6d894577cb3746edb9bdc5b ****/
		%feature("compactdefaultargs") SetGraphicValues;
		%feature("autodoc", "No available documentation.

Parameters
----------
Radius: float
OffSet: float

Returns
-------
None
") SetGraphicValues;
		void SetGraphicValues(const Standard_Real Radius, const Standard_Real OffSet);

};


%make_alias(V3d_CircularGrid)

%extend V3d_CircularGrid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class V3d_ImageDumpOptions *
*****************************/
class V3d_ImageDumpOptions {
	public:
		int Width;
		int Height;
		Graphic3d_BufferType BufferType;
		V3d_StereoDumpOptions StereoOptions;
		int TileSize;
		bool ToAdjustAspect;
		/****************** V3d_ImageDumpOptions ******************/
		/**** md5 signature: 76f5aa893839bb4a2f4519e2b5549b24 ****/
		%feature("compactdefaultargs") V3d_ImageDumpOptions;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") V3d_ImageDumpOptions;
		 V3d_ImageDumpOptions();

};


%extend V3d_ImageDumpOptions {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class V3d_Plane *
******************/
class V3d_Plane : public Standard_Transient {
	public:
		/****************** V3d_Plane ******************/
		/**** md5 signature: 0312d266d9ef2810604382ef778c1f88 ****/
		%feature("compactdefaultargs") V3d_Plane;
		%feature("autodoc", "Creates a clipping plane from plane coefficients.

Parameters
----------
theA: float,optional
	default value is 0.0
theB: float,optional
	default value is 0.0
theC: float,optional
	default value is 1.0
theD: float,optional
	default value is 0.0

Returns
-------
None
") V3d_Plane;
		 V3d_Plane(const Standard_Real theA = 0.0, const Standard_Real theB = 0.0, const Standard_Real theC = 1.0, const Standard_Real theD = 0.0);

		/****************** ClipPlane ******************/
		/**** md5 signature: 726bceb71c5417a0c5b0cf697adf308e ****/
		%feature("compactdefaultargs") ClipPlane;
		%feature("autodoc", "Use this method to pass clipping plane implementation for standard clipping workflow. returns clipping plane implementation handle.

Returns
-------
opencascade::handle<Graphic3d_ClipPlane>
") ClipPlane;
		const opencascade::handle<Graphic3d_ClipPlane> & ClipPlane();

		/****************** Display ******************/
		/**** md5 signature: 4dc525f17f40f087cacdd085902a90ab ****/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "Display the plane representation in the choosen view.

Parameters
----------
theView: V3d_View
theColor: Quantity_Color,optional
	default value is Quantity_NOC_GRAY

Returns
-------
None
") Display;
		virtual void Display(const opencascade::handle<V3d_View> & theView, const Quantity_Color & theColor = Quantity_NOC_GRAY);

		/****************** Erase ******************/
		/**** md5 signature: 8f2bc4e6df5b146535fbcd580dcae32c ****/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "Erase the plane representation.

Returns
-------
None
") Erase;
		void Erase();

		/****************** IsDisplayed ******************/
		/**** md5 signature: 04882eded547dac4e4f59f67e903fed8 ****/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "Returns true when the plane representation is displayed.

Returns
-------
bool
") IsDisplayed;
		Standard_Boolean IsDisplayed();

		/****************** Plane ******************/
		/**** md5 signature: 5a71d0a06c1c48da691d3ec3cdc8498e ****/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Returns the parameters of the plane.

Parameters
----------

Returns
-------
theA: float
theB: float
theC: float
theD: float
") Plane;
		void Plane(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SetPlane ******************/
		/**** md5 signature: bc3101f33294b1ef9a720256755c12f9 ****/
		%feature("compactdefaultargs") SetPlane;
		%feature("autodoc", "Change plane equation.

Parameters
----------
theA: float
theB: float
theC: float
theD: float

Returns
-------
None
") SetPlane;
		void SetPlane(const Standard_Real theA, const Standard_Real theB, const Standard_Real theC, const Standard_Real theD);

};


%make_alias(V3d_Plane)

%extend V3d_Plane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class V3d_PositionLight *
**************************/
%nodefaultctor V3d_PositionLight;
class V3d_PositionLight : public Graphic3d_CLight {
	public:
};


%make_alias(V3d_PositionLight)

%extend V3d_PositionLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class V3d_RectangularGrid *
****************************/
class V3d_RectangularGrid : public Aspect_RectangularGrid {
	public:
		/****************** V3d_RectangularGrid ******************/
		/**** md5 signature: 4bfe3e7098281d02a88c12d3c127a1de ****/
		%feature("compactdefaultargs") V3d_RectangularGrid;
		%feature("autodoc", "No available documentation.

Parameters
----------
aViewer: V3d_ViewerPointer
aColor: Quantity_Color
aTenthColor: Quantity_Color

Returns
-------
None
") V3d_RectangularGrid;
		 V3d_RectangularGrid(const V3d_ViewerPointer & aViewer, const Quantity_Color & aColor, const Quantity_Color & aTenthColor);

		/****************** Display ******************/
		/**** md5 signature: 869c346ea6117dea2e22059b972a14d6 ****/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Display;
		virtual void Display();

		/****************** Erase ******************/
		/**** md5 signature: 44e4f7cb90f37153ccbcbc58390450d3 ****/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Erase;
		virtual void Erase();

		/****************** GraphicValues ******************/
		/**** md5 signature: be03824cdbf05cae65a43617bb8d97e3 ****/
		%feature("compactdefaultargs") GraphicValues;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
XSize: float
YSize: float
OffSet: float
") GraphicValues;
		void GraphicValues(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** IsDisplayed ******************/
		/**** md5 signature: dcb0c9b5518fcc6a7adfe5c2cf2d06c3 ****/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDisplayed;
		virtual Standard_Boolean IsDisplayed();

		/****************** SetColors ******************/
		/**** md5 signature: 9e45da8e1b80e60ef1ff0cde9ca414a8 ****/
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "No available documentation.

Parameters
----------
aColor: Quantity_Color
aTenthColor: Quantity_Color

Returns
-------
None
") SetColors;
		virtual void SetColors(const Quantity_Color & aColor, const Quantity_Color & aTenthColor);

		/****************** SetGraphicValues ******************/
		/**** md5 signature: 21412a7d5826b7b44f86e4c1355280ec ****/
		%feature("compactdefaultargs") SetGraphicValues;
		%feature("autodoc", "No available documentation.

Parameters
----------
XSize: float
YSize: float
OffSet: float

Returns
-------
None
") SetGraphicValues;
		void SetGraphicValues(const Standard_Real XSize, const Standard_Real YSize, const Standard_Real OffSet);

};


%make_alias(V3d_RectangularGrid)

%extend V3d_RectangularGrid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class V3d_Trihedron *
**********************/
class V3d_Trihedron : public Standard_Transient {
	public:
		/****************** V3d_Trihedron ******************/
		/**** md5 signature: fddc5210356ebbc3d61efae997e05003 ****/
		%feature("compactdefaultargs") V3d_Trihedron;
		%feature("autodoc", "Creates a default trihedron.

Returns
-------
None
") V3d_Trihedron;
		 V3d_Trihedron();

		/****************** Display ******************/
		/**** md5 signature: 2bae79cabd98629a1614937c039a142a ****/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "Display trihedron.

Parameters
----------
theView: V3d_View

Returns
-------
None
") Display;
		void Display(const V3d_View & theView);

		/****************** Erase ******************/
		/**** md5 signature: 8f2bc4e6df5b146535fbcd580dcae32c ****/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "Erase trihedron.

Returns
-------
None
") Erase;
		void Erase();

		/****************** SetArrowDiameter ******************/
		/**** md5 signature: 4c0619d2a8305d420bc1f36865af3099 ****/
		%feature("compactdefaultargs") SetArrowDiameter;
		%feature("autodoc", "Setup the arrow diameter.

Parameters
----------
theDiam: float

Returns
-------
None
") SetArrowDiameter;
		void SetArrowDiameter(const Standard_Real theDiam);

		/****************** SetArrowsColor ******************/
		/**** md5 signature: 3947d4f96fefc9e2657dc0fdc9888373 ****/
		%feature("compactdefaultargs") SetArrowsColor;
		%feature("autodoc", "Setup colors of arrows.

Parameters
----------
theXColor: Quantity_Color
theYColor: Quantity_Color
theZColor: Quantity_Color

Returns
-------
None
") SetArrowsColor;
		void SetArrowsColor(const Quantity_Color & theXColor, const Quantity_Color & theYColor, const Quantity_Color & theZColor);

		/****************** SetLabelsColor ******************/
		/**** md5 signature: 006a9f4a6dfc02d7949e81f4ddc4da24 ****/
		%feature("compactdefaultargs") SetLabelsColor;
		%feature("autodoc", "Setup color of text labels.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetLabelsColor;
		void SetLabelsColor(const Quantity_Color & theColor);

		/****************** SetNbFacets ******************/
		/**** md5 signature: 5efbe53a806e2f2349d28a5ad826c749 ****/
		%feature("compactdefaultargs") SetNbFacets;
		%feature("autodoc", "Setup the number of facets for tessellation.

Parameters
----------
theNbFacets: int

Returns
-------
None
") SetNbFacets;
		void SetNbFacets(const Standard_Integer theNbFacets);

		/****************** SetPosition ******************/
		/**** md5 signature: 800bcc8a066f1adf34c79426184d50c1 ****/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "Setup the corner to draw the trihedron.

Parameters
----------
thePosition: Aspect_TypeOfTriedronPosition

Returns
-------
None
") SetPosition;
		void SetPosition(const Aspect_TypeOfTriedronPosition thePosition);

		/****************** SetScale ******************/
		/**** md5 signature: 91bbbb1646dedfb8018b2c1849bc71ad ****/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "Setup the scale factor.

Parameters
----------
theScale: float

Returns
-------
None
") SetScale;
		void SetScale(const Standard_Real theScale);

		/****************** SetSizeRatio ******************/
		/**** md5 signature: c04a64217473268454fb63fbf5499304 ****/
		%feature("compactdefaultargs") SetSizeRatio;
		%feature("autodoc", "Setup the size ratio factor.

Parameters
----------
theRatio: float

Returns
-------
None
") SetSizeRatio;
		void SetSizeRatio(const Standard_Real theRatio);

		/****************** SetWireframe ******************/
		/**** md5 signature: 11febb98a3fceb574f5634008d3ccac4 ****/
		%feature("compactdefaultargs") SetWireframe;
		%feature("autodoc", "Switch wireframe / shaded trihedron.

Parameters
----------
theAsWireframe: bool

Returns
-------
None
") SetWireframe;
		void SetWireframe(const Standard_Boolean theAsWireframe);

};


%make_alias(V3d_Trihedron)

%extend V3d_Trihedron {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class V3d_View *
*****************/
class V3d_View : public Standard_Transient {
	public:
		/****************** V3d_View ******************/
		/**** md5 signature: 8820a3bd6b7f0436d4c1059ccd9bd367 ****/
		%feature("compactdefaultargs") V3d_View;
		%feature("autodoc", "Initializes the view.

Parameters
----------
theViewer: V3d_Viewer
theType: V3d_TypeOfView,optional
	default value is V3d_ORTHOGRAPHIC

Returns
-------
None
") V3d_View;
		 V3d_View(const opencascade::handle<V3d_Viewer> & theViewer, const V3d_TypeOfView theType = V3d_ORTHOGRAPHIC);

		/****************** V3d_View ******************/
		/**** md5 signature: bbf725982f29cea54a2ed88199238a5c ****/
		%feature("compactdefaultargs") V3d_View;
		%feature("autodoc", "Initializes the view by copying.

Parameters
----------
theViewer: V3d_Viewer
theView: V3d_View

Returns
-------
None
") V3d_View;
		 V3d_View(const opencascade::handle<V3d_Viewer> & theViewer, const opencascade::handle<V3d_View> & theView);

		/****************** ActiveLight ******************/
		/**** md5 signature: 7af2e71f89b94797e81a8b1c1a052d68 ****/
		%feature("compactdefaultargs") ActiveLight;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<V3d_Light>
") ActiveLight;
		const opencascade::handle<V3d_Light> & ActiveLight();

		/****************** ActiveLightIterator ******************/
		/**** md5 signature: 6fa6e98274fc8d44abfc6ab8d93a027d ****/
		%feature("compactdefaultargs") ActiveLightIterator;
		%feature("autodoc", "Return iterator for defined lights.

Returns
-------
V3d_ListOfLightIterator
") ActiveLightIterator;
		V3d_ListOfLightIterator ActiveLightIterator();

		/****************** AddClipPlane ******************/
		/**** md5 signature: 9f3c54e7cba60e479ad5b0eee5e5228c ****/
		%feature("compactdefaultargs") AddClipPlane;
		%feature("autodoc", "Adds clip plane to the view. the composition of clip planes truncates the rendering space to convex volume. number of supported clip planes can be consulted by planelimit method of associated graphic3d_graphicdriver. please be aware that the planes which exceed the limit are ignored during rendering. @param theplane [in] the clip plane to be added to view.

Parameters
----------
thePlane: Graphic3d_ClipPlane

Returns
-------
None
") AddClipPlane;
		virtual void AddClipPlane(const opencascade::handle<Graphic3d_ClipPlane> & thePlane);

		/****************** At ******************/
		/**** md5 signature: 5c17b55c9dc9e96e036d6f29354c6a9d ****/
		%feature("compactdefaultargs") At;
		%feature("autodoc", "Returns the position of the view point.

Parameters
----------

Returns
-------
X: float
Y: float
Z: float
") At;
		void At(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** AutoZFit ******************/
		/**** md5 signature: 6ae4b584d77cfd67e2525979ecfd389b ****/
		%feature("compactdefaultargs") AutoZFit;
		%feature("autodoc", "If automatic z-range fitting is turned on, adjusts z-min and z-max projection volume planes with call to zfitall.

Returns
-------
None
") AutoZFit;
		void AutoZFit();

		/****************** AutoZFitMode ******************/
		/**** md5 signature: b57c0da0561c9b0b0778ef1710bb14c3 ****/
		%feature("compactdefaultargs") AutoZFitMode;
		%feature("autodoc", "Returns true if automatic z-fit mode is turned on.

Returns
-------
bool
") AutoZFitMode;
		Standard_Boolean AutoZFitMode();

		/****************** AutoZFitScaleFactor ******************/
		/**** md5 signature: 6257bed9c3571580a75e0ab98cd280b9 ****/
		%feature("compactdefaultargs") AutoZFitScaleFactor;
		%feature("autodoc", "Returns scale factor parameter of automatic z-fit mode.

Returns
-------
float
") AutoZFitScaleFactor;
		Standard_Real AutoZFitScaleFactor();

		/****************** AxialScale ******************/
		/**** md5 signature: a2b909a1a57dc5163dd4895ada91fd13 ****/
		%feature("compactdefaultargs") AxialScale;
		%feature("autodoc", "Returns the current values of the anisotropic (axial) scale factors.

Parameters
----------

Returns
-------
Sx: float
Sy: float
Sz: float
") AxialScale;
		void AxialScale(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** AxialScale ******************/
		/**** md5 signature: bfb43dfcf2c6206f166042bdbcd4b471 ****/
		%feature("compactdefaultargs") AxialScale;
		%feature("autodoc", "Performs anisotropic scaling of <self> view along the given <axis>. the scale factor is calculated on a basis of the mouse pointer displacement <dx,dy>. the calculated scale factor is then passed to setaxialscale(sx, sy, sz) method.

Parameters
----------
Dx: int
Dy: int
Axis: V3d_TypeOfAxe

Returns
-------
None
") AxialScale;
		void AxialScale(const Standard_Integer Dx, const Standard_Integer Dy, const V3d_TypeOfAxe Axis);

		/****************** BackFacingModel ******************/
		/**** md5 signature: 1ec7876cad7f7c2370e67cc7b55e118f ****/
		%feature("compactdefaultargs") BackFacingModel;
		%feature("autodoc", "Returns current state of the back faces display.

Returns
-------
V3d_TypeOfBackfacingModel
") BackFacingModel;
		V3d_TypeOfBackfacingModel BackFacingModel();

		/****************** BackgroundColor ******************/
		/**** md5 signature: 496c0a03dfb1fb7b8076d2c2846a387c ****/
		%feature("compactdefaultargs") BackgroundColor;
		%feature("autodoc", "Returns the background color values of the view depending of the color type.

Parameters
----------
Type: Quantity_TypeOfColor

Returns
-------
V1: float
V2: float
V3: float
") BackgroundColor;
		void BackgroundColor(const Quantity_TypeOfColor Type, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** BackgroundColor ******************/
		/**** md5 signature: 3727e4517c165391df52fb7da81fb386 ****/
		%feature("compactdefaultargs") BackgroundColor;
		%feature("autodoc", "Returns the background color object of the view.

Returns
-------
Quantity_Color
") BackgroundColor;
		Quantity_Color BackgroundColor();

		/****************** Camera ******************/
		/**** md5 signature: e0e8d00ee700afb9ca88da977e8b5747 ****/
		%feature("compactdefaultargs") Camera;
		%feature("autodoc", "Returns camera object of the view. returns: handle to camera object, or null if 3d view does not use the camera approach.

Returns
-------
opencascade::handle<Graphic3d_Camera>
") Camera;
		const opencascade::handle<Graphic3d_Camera> & Camera();

		/****************** ChangeRenderingParams ******************/
		/**** md5 signature: 0689d00d2ba998c88be3fbe15202695d ****/
		%feature("compactdefaultargs") ChangeRenderingParams;
		%feature("autodoc", "Returns reference to current rendering parameters and effect settings.

Returns
-------
Graphic3d_RenderingParams
") ChangeRenderingParams;
		Graphic3d_RenderingParams & ChangeRenderingParams();

		/****************** ClipPlanes ******************/
		/**** md5 signature: 4f5f037b2c152f9713991c9904ccf618 ****/
		%feature("compactdefaultargs") ClipPlanes;
		%feature("autodoc", "Get clip planes. returns sequence clip planes that have been set for the view.

Returns
-------
opencascade::handle<Graphic3d_SequenceOfHClipPlane>
") ClipPlanes;
		const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & ClipPlanes();

		/****************** ComputedMode ******************/
		/**** md5 signature: 29bd402246d352389128afcb0486b75e ****/
		%feature("compactdefaultargs") ComputedMode;
		%feature("autodoc", "Returns the computed hlr mode state.

Returns
-------
bool
") ComputedMode;
		Standard_Boolean ComputedMode();

		/****************** Convert ******************/
		/**** md5 signature: a1d3281dca07164e571b608f5bc809b9 ****/
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "Converts the pixel value to a value in the projection plane.

Parameters
----------
Vp: int

Returns
-------
float
") Convert;
		Standard_Real Convert(const Standard_Integer Vp);

		/****************** Convert ******************/
		/**** md5 signature: d15381827f797863bf8e51d376bc16c1 ****/
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "Converts the point pixel into a point projected in the reference frame of the projection plane.

Parameters
----------
Xp: int
Yp: int

Returns
-------
Xv: float
Yv: float
") Convert;
		void Convert(const Standard_Integer Xp, const Standard_Integer Yp, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Convert ******************/
		/**** md5 signature: 7dd2a2a1ea24d8db91f157ae69129241 ****/
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "Converts tha value of the projection plane into a pixel value.

Parameters
----------
Vv: float

Returns
-------
int
") Convert;
		Standard_Integer Convert(const Standard_Real Vv);

		/****************** Convert ******************/
		/**** md5 signature: 142cf6fe83017e2ab40a1b9b0fdfda91 ****/
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "Converts the point defined in the reference frame of the projection plane into a point pixel.

Parameters
----------
Xv: float
Yv: float

Returns
-------
Xp: int
Yp: int
") Convert;
		void Convert(const Standard_Real Xv, const Standard_Real Yv, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Convert ******************/
		/**** md5 signature: 806b18b0f8f527526068db6c9b0f5582 ****/
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "Converts the projected point into a point in the reference frame of the view corresponding to the intersection with the projection plane of the eye/view point vector.

Parameters
----------
Xp: int
Yp: int

Returns
-------
X: float
Y: float
Z: float
") Convert;
		void Convert(const Standard_Integer Xp, const Standard_Integer Yp, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Convert ******************/
		/**** md5 signature: 7fdd5667208d15821960cc400f3df3ff ****/
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "Projects the point defined in the reference frame of the view into the projected point in the associated window.

Parameters
----------
X: float
Y: float
Z: float

Returns
-------
Xp: int
Yp: int
") Convert;
		void Convert(const Standard_Real X, const Standard_Real Y, const Standard_Real Z, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** ConvertToGrid ******************/
		/**** md5 signature: b151fec13ddce5ba9a39630169ddc420 ****/
		%feature("compactdefaultargs") ConvertToGrid;
		%feature("autodoc", "Converts the projected point into the nearest grid point in the reference frame of the view corresponding to the intersection with the projection plane of the eye/view point vector and display the grid marker. warning: when the grid is not active the result is identical to the above convert() method. how to use: 1) enable the grid echo display myviewer->setgridecho(standard_true); 2) when application receive a move event: 2.1) check if any object is detected if( myinteractivecontext->moveto(x,y) == ais_sod_nothing ) { 2.2) check if the grid is active if( myviewer->grid()->isactive() ) { 2.3) display the grid echo and gets the grid point myview->converttogrid(x,y,x,y,z); myview->viewer()->showgridecho (myview, graphic3d_vertex (x,y,z)); myview->redrawimmediate(); 2.4) else this is the standard case } else myview->convert(x,y,x,y,z);.

Parameters
----------
Xp: int
Yp: int

Returns
-------
Xg: float
Yg: float
Zg: float
") ConvertToGrid;
		void ConvertToGrid(const Standard_Integer Xp, const Standard_Integer Yp, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ConvertToGrid ******************/
		/**** md5 signature: 02d7737206cedc19485c15cdcb8910bc ****/
		%feature("compactdefaultargs") ConvertToGrid;
		%feature("autodoc", "Converts the point into the nearest grid point and display the grid marker.

Parameters
----------
X: float
Y: float
Z: float

Returns
-------
Xg: float
Yg: float
Zg: float
") ConvertToGrid;
		void ConvertToGrid(const Standard_Real X, const Standard_Real Y, const Standard_Real Z, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ConvertWithProj ******************/
		/**** md5 signature: fdde209d2949440727be416aba98e504 ****/
		%feature("compactdefaultargs") ConvertWithProj;
		%feature("autodoc", "Converts the projected point into a point in the reference frame of the view corresponding to the intersection with the projection plane of the eye/view point vector and returns the projection ray for further computations.

Parameters
----------
Xp: int
Yp: int

Returns
-------
X: float
Y: float
Z: float
Vx: float
Vy: float
Vz: float
") ConvertWithProj;
		void ConvertWithProj(const Standard_Integer Xp, const Standard_Integer Yp, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** DefaultCamera ******************/
		/**** md5 signature: 3111186f8630eb9f3140ca00c449f778 ****/
		%feature("compactdefaultargs") DefaultCamera;
		%feature("autodoc", "Return default camera.

Returns
-------
opencascade::handle<Graphic3d_Camera>
") DefaultCamera;
		const opencascade::handle<Graphic3d_Camera> & DefaultCamera();

		/****************** Depth ******************/
		/**** md5 signature: de7560cf701656c85d7ea3c1f074fd03 ****/
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "Returns the distance between the eye and view point.

Returns
-------
float
") Depth;
		Standard_Real Depth();

		/****************** DepthFitAll ******************/
		/**** md5 signature: e2a749741927ce07ea7511bac6bbb622 ****/
		%feature("compactdefaultargs") DepthFitAll;
		%feature("autodoc", "Adjusts the viewing volume so as not to clip the displayed objects by front and back and back clipping planes. also sets depth value automatically depending on the calculated z size and aspect parameter. note than the original xy size of the view is not modified .

Parameters
----------
Aspect: float,optional
	default value is 0.01
Margin: float,optional
	default value is 0.01

Returns
-------
None
") DepthFitAll;
		void DepthFitAll(const Standard_Real Aspect = 0.01, const Standard_Real Margin = 0.01);

		/****************** DiagnosticInformation ******************/
		/**** md5 signature: ade68be5c6f35c39dc63903b1a795539 ****/
		%feature("compactdefaultargs") DiagnosticInformation;
		%feature("autodoc", "Fill in the dictionary with diagnostic info. should be called within rendering thread. //! this api should be used only for user output or for creating automated reports. the format of returned information (e.g. key-value layout) is not part of this api and can be changed at any time. thus application should not parse returned information to weed out specific parameters. @param thedict destination map for information @param theflags defines the information to be retrieved.

Parameters
----------
theDict: TColStd_IndexedDataMapOfStringString
theFlags: Graphic3d_DiagnosticInfo

Returns
-------
None
") DiagnosticInformation;
		void DiagnosticInformation(TColStd_IndexedDataMapOfStringString & theDict, Graphic3d_DiagnosticInfo theFlags);

		/****************** DoMapping ******************/
		/**** md5 signature: 5cc5996ccdd8fab65b150d9b8e0bea7c ****/
		%feature("compactdefaultargs") DoMapping;
		%feature("autodoc", "Must be called when the window supporting the view is mapped or unmapped.

Returns
-------
None
") DoMapping;
		void DoMapping();

		/****************** Dump ******************/
		/**** md5 signature: 6ccb0e58501968ab58e63cdfa15db02d ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Dumps the full contents of the view into the image file. this is an alias for topixmap() with image_alienpixmap. @param thefile destination image file (image format is determined by file extension like .png, .bmp, .jpg) @param thebuffertype buffer to dump returns false when the dump has failed.

Parameters
----------
theFile: char *
theBufferType: Graphic3d_BufferType,optional
	default value is Graphic3d_BT_RGB

Returns
-------
bool
") Dump;
		Standard_Boolean Dump(const char * theFile, const Graphic3d_BufferType & theBufferType = Graphic3d_BT_RGB);

		/****************** Eye ******************/
		/**** md5 signature: 214dc5004bc1554dbed9750aa9efa7b8 ****/
		%feature("compactdefaultargs") Eye;
		%feature("autodoc", "Returns the position of the eye.

Parameters
----------

Returns
-------
X: float
Y: float
Z: float
") Eye;
		void Eye(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** FitAll ******************/
		/**** md5 signature: f975d988d1deb15b4c055158c6afc34b ****/
		%feature("compactdefaultargs") FitAll;
		%feature("autodoc", "Adjust view parameters to fit the displayed scene, respecting height / width ratio. the z clipping range (depth range) is fitted if autozfit flag is true. throws program error exception if margin coefficient is < 0 or >= 1. updates the view. @param themargin [in] the margin coefficient for view borders. @param thetoupdate [in] flag to perform view update.

Parameters
----------
theMargin: float,optional
	default value is 0.01
theToUpdate: bool,optional
	default value is Standard_True

Returns
-------
None
") FitAll;
		void FitAll(const Standard_Real theMargin = 0.01, const Standard_Boolean theToUpdate = Standard_True);

		/****************** FitAll ******************/
		/**** md5 signature: f3e0a8d0b602d603245f18a69b439c19 ****/
		%feature("compactdefaultargs") FitAll;
		%feature("autodoc", "Adjust view parameters to fit the displayed scene, respecting height / width ratio according to the custom bounding box given. throws program error exception if margin coefficient is < 0 or >= 1. updates the view. @param thebox [in] the custom bounding box to fit. @param themargin [in] the margin coefficient for view borders. @param thetoupdate [in] flag to perform view update.

Parameters
----------
theBox: Bnd_Box
theMargin: float,optional
	default value is 0.01
theToUpdate: bool,optional
	default value is Standard_True

Returns
-------
None
") FitAll;
		void FitAll(const Bnd_Box & theBox, const Standard_Real theMargin = 0.01, const Standard_Boolean theToUpdate = Standard_True);

		/****************** FitAll ******************/
		/**** md5 signature: cbf47697dc5067ba972e7e5e822fb525 ****/
		%feature("compactdefaultargs") FitAll;
		%feature("autodoc", "Centers the defined projection window so that it occupies the maximum space while respecting the initial height/width ratio. note than the original z size of the view is not modified .

Parameters
----------
theMinXv: float
theMinYv: float
theMaxXv: float
theMaxYv: float

Returns
-------
None
") FitAll;
		void FitAll(const Standard_Real theMinXv, const Standard_Real theMinYv, const Standard_Real theMaxXv, const Standard_Real theMaxYv);

		/****************** FitMinMax ******************/
		/**** md5 signature: 5a3793d719ff4c2f2d2836e76d9f55bc ****/
		%feature("compactdefaultargs") FitMinMax;
		%feature("autodoc", "Transform camera eye, center and scale to fit in the passed bounding box specified in wcs. @param thecamera [in] the camera @param thebox [in] the bounding box @param themargin [in] the margin coefficient for view borders @param theresolution [in] the minimum size of projection of bounding box in xv or yv direction when it considered to be a thin plane or point (without a volume);  in this case only the center of camera is adjusted @param thetoenlargeifline [in] when true - in cases when the whole bounding box projected into thin line going along z-axis of screen,  the view plane is enlarged such thatwe see the whole line on rotation, otherwise only the center of camera is adjusted. returns true if the fit all operation can be done.

Parameters
----------
theCamera: Graphic3d_Camera
theBox: Bnd_Box
theMargin: float
theResolution: float,optional
	default value is 0.0
theToEnlargeIfLine: bool,optional
	default value is Standard_True

Returns
-------
bool
") FitMinMax;
		Standard_Boolean FitMinMax(const opencascade::handle<Graphic3d_Camera> & theCamera, const Bnd_Box & theBox, const Standard_Real theMargin, const Standard_Real theResolution = 0.0, const Standard_Boolean theToEnlargeIfLine = Standard_True);

		/****************** FocalReferencePoint ******************/
		/**** md5 signature: b502bf5bf2976b52d491b11719633a5e ****/
		%feature("compactdefaultargs") FocalReferencePoint;
		%feature("autodoc", "Returns the position of point which emanating the projections.

Parameters
----------

Returns
-------
X: float
Y: float
Z: float
") FocalReferencePoint;
		void FocalReferencePoint(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Focale ******************/
		/**** md5 signature: d09c94eba7c048c5f1e5bdc7ded6a95a ****/
		%feature("compactdefaultargs") Focale;
		%feature("autodoc", "Returns the view plane distance for perspective views.

Returns
-------
float
") Focale;
		Standard_Real Focale();

		/****************** GetGraduatedTrihedron ******************/
		/**** md5 signature: 794e42c6b2c8242dbf3d37d05f637325 ****/
		%feature("compactdefaultargs") GetGraduatedTrihedron;
		%feature("autodoc", "Returns data of a graduated trihedron.

Returns
-------
Graphic3d_GraduatedTrihedron
") GetGraduatedTrihedron;
		const Graphic3d_GraduatedTrihedron & GetGraduatedTrihedron();

		/****************** GradientBackground ******************/
		/**** md5 signature: d48840592ec4f12118e8b8d065c33698 ****/
		%feature("compactdefaultargs") GradientBackground;
		%feature("autodoc", "Returns the gradient background of the view.

Returns
-------
Aspect_GradientBackground
") GradientBackground;
		Aspect_GradientBackground GradientBackground();

		/****************** GradientBackgroundColors ******************/
		/**** md5 signature: a52768bb2e579df3132db426f0602dc7 ****/
		%feature("compactdefaultargs") GradientBackgroundColors;
		%feature("autodoc", "Returns the gradient background colors of the view.

Parameters
----------
theColor1: Quantity_Color
theColor2: Quantity_Color

Returns
-------
None
") GradientBackgroundColors;
		void GradientBackgroundColors(Quantity_Color & theColor1, Quantity_Color & theColor2);

		/****************** GraduatedTrihedronDisplay ******************/
		/**** md5 signature: dbf1f4106328e0eaeb68ba87df7d13fd ****/
		%feature("compactdefaultargs") GraduatedTrihedronDisplay;
		%feature("autodoc", "Displays a graduated trihedron.

Parameters
----------
theTrihedronData: Graphic3d_GraduatedTrihedron

Returns
-------
None
") GraduatedTrihedronDisplay;
		void GraduatedTrihedronDisplay(const Graphic3d_GraduatedTrihedron & theTrihedronData);

		/****************** GraduatedTrihedronErase ******************/
		/**** md5 signature: 95c05899cb81d7c63eac53c98df564a6 ****/
		%feature("compactdefaultargs") GraduatedTrihedronErase;
		%feature("autodoc", "Erases a graduated trihedron from the view.

Returns
-------
None
") GraduatedTrihedronErase;
		void GraduatedTrihedronErase();

		/****************** GravityPoint ******************/
		/**** md5 signature: 004e900fb115ca106c6a5fcdd3ac1e07 ****/
		%feature("compactdefaultargs") GravityPoint;
		%feature("autodoc", "Returns the objects number and the gravity center of all viewable points in the view.

Returns
-------
gp_Pnt
") GravityPoint;
		gp_Pnt GravityPoint();

		/****************** IfMoreLights ******************/
		/**** md5 signature: f43a715413579a7ba11da9f479d85caa ****/
		%feature("compactdefaultargs") IfMoreLights;
		%feature("autodoc", "Returns true if one light more can be activated in this view.

Returns
-------
bool
") IfMoreLights;
		Standard_Boolean IfMoreLights();

		/****************** IfWindow ******************/
		/**** md5 signature: bf40a6fc869cb2eb0b91d5e1420b8857 ****/
		%feature("compactdefaultargs") IfWindow;
		%feature("autodoc", "Returns true if myview is associated with a window .

Returns
-------
bool
") IfWindow;
		Standard_Boolean IfWindow();

		/****************** InitActiveLights ******************/
		/**** md5 signature: 96e937460d9e6ec0513824da2242388a ****/
		%feature("compactdefaultargs") InitActiveLights;
		%feature("autodoc", "Initializes an iteration on the active lights.

Returns
-------
None
") InitActiveLights;
		void InitActiveLights();

		/****************** Invalidate ******************/
		/**** md5 signature: 0ab0e2c678e575a4d179bf46b4d4d469 ****/
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "Invalidates view content but does not redraw it.

Returns
-------
None
") Invalidate;
		void Invalidate();

		/****************** InvalidateImmediate ******************/
		/**** md5 signature: af5f9e1933171915e9ecf1710ca73c90 ****/
		%feature("compactdefaultargs") InvalidateImmediate;
		%feature("autodoc", "Invalidates view content within immediate layer but does not redraw it.

Returns
-------
None
") InvalidateImmediate;
		void InvalidateImmediate();

		/****************** IsActiveLight ******************/
		/**** md5 signature: 1b7eecf8283a3900e6f00f48ff23eb43 ****/
		%feature("compactdefaultargs") IsActiveLight;
		%feature("autodoc", "Returns true when the light is active in this view.

Parameters
----------
theLight: V3d_Light

Returns
-------
bool
") IsActiveLight;
		Standard_Boolean IsActiveLight(const opencascade::handle<V3d_Light> & theLight);

		/****************** IsCullingEnabled ******************/
		/**** md5 signature: 3c3ff9bdad3b548d6f8e34a24098347a ****/
		%feature("compactdefaultargs") IsCullingEnabled;
		%feature("autodoc", "Returns flag value of objects culling mechanism.

Returns
-------
bool
") IsCullingEnabled;
		Standard_Boolean IsCullingEnabled();

		/****************** IsEmpty ******************/
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns the status of the view regarding the displayed structures inside returns true is the view is empty.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** IsInvalidated ******************/
		/**** md5 signature: ec866d0cff19cca721935f26d32ef8c3 ****/
		%feature("compactdefaultargs") IsInvalidated;
		%feature("autodoc", "Returns true if cached view content has been invalidated.

Returns
-------
bool
") IsInvalidated;
		Standard_Boolean IsInvalidated();

		/****************** IsInvalidatedImmediate ******************/
		/**** md5 signature: 246e4ead0b5a5b9e57fb79c2142261e4 ****/
		%feature("compactdefaultargs") IsInvalidatedImmediate;
		%feature("autodoc", "Returns true if immediate layer content has been invalidated.

Returns
-------
bool
") IsInvalidatedImmediate;
		Standard_Boolean IsInvalidatedImmediate();

		/****************** LightLimit ******************/
		/**** md5 signature: b11a43a1516a029b988eec97675ac76a ****/
		%feature("compactdefaultargs") LightLimit;
		%feature("autodoc", "Returns the max number of light associated to the view.

Returns
-------
int
") LightLimit;
		Standard_Integer LightLimit();

		/****************** MoreActiveLights ******************/
		/**** md5 signature: 159743d840ad62ed3830acf9e90ae539 ****/
		%feature("compactdefaultargs") MoreActiveLights;
		%feature("autodoc", "Returns true if there are more active light(s) to return.

Returns
-------
bool
") MoreActiveLights;
		Standard_Boolean MoreActiveLights();

		/****************** Move ******************/
		/**** md5 signature: bfe8868b7ed23bccc6c6361fc9ab9ec9 ****/
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "Movement of the eye parallel to the coordinate system of reference of the screen a distance relative to the initial position expressed by start = standard_true.

Parameters
----------
Dx: float
Dy: float
Dz: float
Start: bool,optional
	default value is Standard_True

Returns
-------
None
") Move;
		void Move(const Standard_Real Dx, const Standard_Real Dy, const Standard_Real Dz, const Standard_Boolean Start = Standard_True);

		/****************** Move ******************/
		/**** md5 signature: 2a8a67b2e4fd50fad4ebd15f76512979 ****/
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "Movement of the eye parallel to one of the axes of the coordinate system of reference of the view a distance relative to the initial position expressed by start = standard_true.

Parameters
----------
Axe: V3d_TypeOfAxe
Length: float
Start: bool,optional
	default value is Standard_True

Returns
-------
None
") Move;
		void Move(const V3d_TypeOfAxe Axe, const Standard_Real Length, const Standard_Boolean Start = Standard_True);

		/****************** Move ******************/
		/**** md5 signature: aa69fe36271d81a3360019cc9df01e24 ****/
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "Movement of the eye parllel to the current axis a distance relative to the initial position expressed by start = standard_true.

Parameters
----------
Length: float
Start: bool,optional
	default value is Standard_True

Returns
-------
None
") Move;
		void Move(const Standard_Real Length, const Standard_Boolean Start = Standard_True);

		/****************** MustBeResized ******************/
		/**** md5 signature: 6f5bcdd6dbbbbd1e8de0181e04dcdda7 ****/
		%feature("compactdefaultargs") MustBeResized;
		%feature("autodoc", "Must be called when the window supporting the view changes size. if the view is not mapped on a window. warning: the view is centered and resized to preserve the height/width ratio of the window.

Returns
-------
None
") MustBeResized;
		void MustBeResized();

		/****************** NextActiveLights ******************/
		/**** md5 signature: 221700382f0fef8d1ac7d43635ea1bc5 ****/
		%feature("compactdefaultargs") NextActiveLights;
		%feature("autodoc", "Go to the next active light (if there is not, activelight will raise an exception).

Returns
-------
None
") NextActiveLights;
		void NextActiveLights();

		/****************** Pan ******************/
		/**** md5 signature: 2f7f5bf76c9662c45037f98619403207 ****/
		%feature("compactdefaultargs") Pan;
		%feature("autodoc", "Translates the center of the view along 'x' and 'y' axes of view projection. can be used to perform interactive panning operation. in that case the dxp, dxp parameters specify panning relative to the point where the operation is started. @param thedxp [in] the relative panning on 'x' axis of view projection, in pixels. @param thedyp [in] the relative panning on 'y' axis of view projection, in pixels. @param thezoomfactor [in] the zooming factor. @param thetostart [in] pass true when starting panning to remember view state prior to panning for relative arguments. passing 0 for relative panning parameter should return view panning to initial state. performs update of view.

Parameters
----------
theDXp: int
theDYp: int
theZoomFactor: float,optional
	default value is 1
theToStart: bool,optional
	default value is Standard_True

Returns
-------
None
") Pan;
		void Pan(const Standard_Integer theDXp, const Standard_Integer theDYp, const Standard_Real theZoomFactor = 1, const Standard_Boolean theToStart = Standard_True);

		/****************** Panning ******************/
		/**** md5 signature: 49d9ae1d50ae7bbb92e9baf7a23733c1 ****/
		%feature("compactdefaultargs") Panning;
		%feature("autodoc", "Translates the center of the view along 'x' and 'y' axes of view projection. can be used to perform interactive panning operation. in that case the dxv, dxy parameters specify panning relative to the point where the operation is started. @param thedxv [in] the relative panning on 'x' axis of view projection, in view space coordinates. @param thedyv [in] the relative panning on 'y' axis of view projection, in view space coordinates. @param thezoomfactor [in] the zooming factor. @param thetostart [in] pass true when starting panning to remember view state prior to panning for relative arguments. if panning is started, passing {0, 0} for {thedxv, thedyv} will return view to initial state. performs update of view.

Parameters
----------
theDXv: float
theDYv: float
theZoomFactor: float,optional
	default value is 1
theToStart: bool,optional
	default value is Standard_True

Returns
-------
None
") Panning;
		void Panning(const Standard_Real theDXv, const Standard_Real theDYv, const Standard_Real theZoomFactor = 1, const Standard_Boolean theToStart = Standard_True);

		/****************** Place ******************/
		/**** md5 signature: 8b79579dde4d0cdc166a71e9b2247f26 ****/
		%feature("compactdefaultargs") Place;
		%feature("autodoc", "Places the point of the view corresponding at the pixel position x,y at the center of the window and updates the view.

Parameters
----------
theXp: int
theYp: int
theZoomFactor: float,optional
	default value is 1

Returns
-------
None
") Place;
		void Place(const Standard_Integer theXp, const Standard_Integer theYp, const Standard_Real theZoomFactor = 1);

		/****************** PlaneLimit ******************/
		/**** md5 signature: 60ec8fb32171fff42258cb80cef67888 ****/
		%feature("compactdefaultargs") PlaneLimit;
		%feature("autodoc", "Returns the max number of clipping planes associated to the view.

Returns
-------
int
") PlaneLimit;
		Standard_Integer PlaneLimit();

		/****************** Proj ******************/
		/**** md5 signature: a1a807294c0022302092b61e24ceaab5 ****/
		%feature("compactdefaultargs") Proj;
		%feature("autodoc", "Returns the projection vector.

Parameters
----------

Returns
-------
Vx: float
Vy: float
Vz: float
") Proj;
		void Proj(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ProjReferenceAxe ******************/
		/**** md5 signature: 28f60e42b731f9b7748c5f667cf688cf ****/
		%feature("compactdefaultargs") ProjReferenceAxe;
		%feature("autodoc", "Returns the coordinate of the point (xpix,ypix) in the view (xp,yp,zp), and the projection vector of the view passing by the point (for perspectiveview).

Parameters
----------
Xpix: int
Ypix: int

Returns
-------
XP: float
YP: float
ZP: float
VX: float
VY: float
VZ: float
") ProjReferenceAxe;
		void ProjReferenceAxe(const Standard_Integer Xpix, const Standard_Integer Ypix, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Project ******************/
		/**** md5 signature: c1560b7b11ea11b43fa11d6796d84982 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "Converts the point defined in the user space of the view to the projection plane at the depth relative to thez.

Parameters
----------
theX: float
theY: float
theZ: float

Returns
-------
theXp: float
theYp: float
") Project;
		void Project(const Standard_Real theX, const Standard_Real theY, const Standard_Real theZ, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Project ******************/
		/**** md5 signature: ea216701af7b7d7e3a7e3741f1707328 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "Converts the point defined in the user space of the view to the projection plane at the depth relative to thez.

Parameters
----------
theX: float
theY: float
theZ: float

Returns
-------
theXp: float
theYp: float
theZp: float
") Project;
		void Project(const Standard_Real theX, const Standard_Real theY, const Standard_Real theZ, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Redraw ******************/
		/**** md5 signature: d79a17dc7691c4758660ab9ea8765cba ****/
		%feature("compactdefaultargs") Redraw;
		%feature("autodoc", "Redisplays the view even if there has not been any modification. must be called if the view is shown. (ex: deiconification ) .

Returns
-------
None
") Redraw;
		virtual void Redraw();

		/****************** RedrawImmediate ******************/
		/**** md5 signature: 590fb2b1bdf9e2935ef5496eaed0b837 ****/
		%feature("compactdefaultargs") RedrawImmediate;
		%feature("autodoc", "Updates layer of immediate presentations.

Returns
-------
None
") RedrawImmediate;
		virtual void RedrawImmediate();

		/****************** Remove ******************/
		/**** md5 signature: 68f9a7e257a5149d50e9cf0219513119 ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Destroys the view.

Returns
-------
None
") Remove;
		void Remove();

		/****************** RemoveClipPlane ******************/
		/**** md5 signature: e644cc8dadfbe38b4691bed6b83a05f2 ****/
		%feature("compactdefaultargs") RemoveClipPlane;
		%feature("autodoc", "Removes clip plane from the view. @param theplane [in] the clip plane to be removed from view.

Parameters
----------
thePlane: Graphic3d_ClipPlane

Returns
-------
None
") RemoveClipPlane;
		virtual void RemoveClipPlane(const opencascade::handle<Graphic3d_ClipPlane> & thePlane);

		/****************** RenderingParams ******************/
		/**** md5 signature: d19e1c94557ee6d68fe1c775b8ab94f6 ****/
		%feature("compactdefaultargs") RenderingParams;
		%feature("autodoc", "Returns current rendering parameters and effect settings. by default it returns default parameters of current viewer. to define view-specific settings use method v3d_view::changerenderingparams(). @sa v3d_viewer::defaultrenderingparams().

Returns
-------
Graphic3d_RenderingParams
") RenderingParams;
		const Graphic3d_RenderingParams & RenderingParams();

		/****************** Reset ******************/
		/**** md5 signature: 2ad89d69d035383548acf0fcb055a9d1 ****/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Resets the centering and the orientation of the view.

Parameters
----------
theToUpdate: bool,optional
	default value is Standard_True

Returns
-------
None
") Reset;
		void Reset(const Standard_Boolean theToUpdate = Standard_True);

		/****************** ResetViewMapping ******************/
		/**** md5 signature: 23069dec01b2a57a9aeda1c3be138f60 ****/
		%feature("compactdefaultargs") ResetViewMapping;
		%feature("autodoc", "Resets the centering of the view. updates the view.

Returns
-------
None
") ResetViewMapping;
		void ResetViewMapping();

		/****************** ResetViewOrientation ******************/
		/**** md5 signature: d8951a9faded96e9feb9ee5df1086fe0 ****/
		%feature("compactdefaultargs") ResetViewOrientation;
		%feature("autodoc", "Resets the orientation of the view. updates the view.

Returns
-------
None
") ResetViewOrientation;
		void ResetViewOrientation();

		/****************** Rotate ******************/
		/**** md5 signature: 37ac43ec8d8fdf73c4b0708da2c367c9 ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "Rotates the eye about the coordinate system of reference of the screen for which the origin is the view point of the projection, with a relative angular value in radians with respect to the initial position expressed by start = standard_true warning! raises badvalue from v3d if the eye, the view point, or the high point are aligned or confused.

Parameters
----------
Ax: float
Ay: float
Az: float
Start: bool,optional
	default value is Standard_True

Returns
-------
None
") Rotate;
		void Rotate(const Standard_Real Ax, const Standard_Real Ay, const Standard_Real Az, const Standard_Boolean Start = Standard_True);

		/****************** Rotate ******************/
		/**** md5 signature: a8dd07c8f75821d1e2bbfbfe0279f86d ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "Rotates the eye about the coordinate system of reference of the screen for which the origin is gravity point {x,y,z}, with a relative angular value in radians with respect to the initial position expressed by start = standard_true if the eye, the view point, or the high point are aligned or confused.

Parameters
----------
Ax: float
Ay: float
Az: float
X: float
Y: float
Z: float
Start: bool,optional
	default value is Standard_True

Returns
-------
None
") Rotate;
		void Rotate(const Standard_Real Ax, const Standard_Real Ay, const Standard_Real Az, const Standard_Real X, const Standard_Real Y, const Standard_Real Z, const Standard_Boolean Start = Standard_True);

		/****************** Rotate ******************/
		/**** md5 signature: 1ca4c68b743a97ede65efaefd7467e64 ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "Rotates the eye about one of the coordinate axes of of the view for which the origin is the gravity point{x,y,z} with an relative angular value in radians with respect to the initial position expressed by start = standard_true.

Parameters
----------
Axe: V3d_TypeOfAxe
Angle: float
X: float
Y: float
Z: float
Start: bool,optional
	default value is Standard_True

Returns
-------
None
") Rotate;
		void Rotate(const V3d_TypeOfAxe Axe, const Standard_Real Angle, const Standard_Real X, const Standard_Real Y, const Standard_Real Z, const Standard_Boolean Start = Standard_True);

		/****************** Rotate ******************/
		/**** md5 signature: 1b8483bfbd971309de1de9f173ca987f ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "Rotates the eye about one of the coordinate axes of of the view for which the origin is the view point of the projection with an relative angular value in radians with respect to the initial position expressed by start = standard_true.

Parameters
----------
Axe: V3d_TypeOfAxe
Angle: float
Start: bool,optional
	default value is Standard_True

Returns
-------
None
") Rotate;
		void Rotate(const V3d_TypeOfAxe Axe, const Standard_Real Angle, const Standard_Boolean Start = Standard_True);

		/****************** Rotate ******************/
		/**** md5 signature: 341432f896f476a8a798cf55be3fe4a7 ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "Rotates the eye around the current axis a relative angular value in radians with respect to the initial position expressed by start = standard_true.

Parameters
----------
Angle: float
Start: bool,optional
	default value is Standard_True

Returns
-------
None
") Rotate;
		void Rotate(const Standard_Real Angle, const Standard_Boolean Start = Standard_True);

		/****************** Rotation ******************/
		/**** md5 signature: 05a729a5eb6c2fdb0999c3616dec3613 ****/
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "Continues the rotation of the view with an angle computed from the last and new mouse position <x,y>.

Parameters
----------
X: int
Y: int

Returns
-------
None
") Rotation;
		void Rotation(const Standard_Integer X, const Standard_Integer Y);

		/****************** Scale ******************/
		/**** md5 signature: 4c0fd48707c01e5a42b2a639ca08da30 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "Returns the current value of the zoom expressed with respect to setviewmappingdefault().

Returns
-------
float
") Scale;
		Standard_Real Scale();

		/****************** SetAt ******************/
		/**** md5 signature: 720ff09ebfa72fd1bced6b13fb670b4c ****/
		%feature("compactdefaultargs") SetAt;
		%feature("autodoc", "Defines the position of the view point.

Parameters
----------
X: float
Y: float
Z: float

Returns
-------
None
") SetAt;
		void SetAt(const Standard_Real X, const Standard_Real Y, const Standard_Real Z);

		/****************** SetAutoZFitMode ******************/
		/**** md5 signature: 694f0e3240c97cee56f1da23059e80ec ****/
		%feature("compactdefaultargs") SetAutoZFitMode;
		%feature("autodoc", "Sets the automatic z-fit mode and its parameters. the auto z-fit has extra parameters which can controlled from application level to ensure that the size of viewing volume will be sufficiently large to cover the depth of unmanaged objects, for example, transformation persistent ones. @param thescalefactor [in] the scale factor for z-range. the range between z-min, z-max projection volume planes evaluated by z fitting method will be scaled using this coefficient. program error exception is thrown if negative or zero value is passed.

Parameters
----------
theIsOn: bool
theScaleFactor: float,optional
	default value is 1.0

Returns
-------
None
") SetAutoZFitMode;
		void SetAutoZFitMode(const Standard_Boolean theIsOn, const Standard_Real theScaleFactor = 1.0);

		/****************** SetAxialScale ******************/
		/**** md5 signature: 148c5e2b6e7d5a5a413d17f39128a26e ****/
		%feature("compactdefaultargs") SetAxialScale;
		%feature("autodoc", "Sets anisotropic (axial) scale factors <sx>, <sy>, <sz> for view <self>. anisotropic scaling operation is performed through multiplying the current view orientation matrix by a scaling matrix: || sx 0 0 0 || || 0 sy 0 0 || || 0 0 sz 0 || || 0 0 0 1 || updates the view.

Parameters
----------
Sx: float
Sy: float
Sz: float

Returns
-------
None
") SetAxialScale;
		void SetAxialScale(const Standard_Real Sx, const Standard_Real Sy, const Standard_Real Sz);

		/****************** SetAxis ******************/
		/**** md5 signature: 94f04d722946b3d73aa71d7d5623cd07 ****/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "Definition of an axis from its origin and its orientation . this will be the current axis for rotations and movements. warning! raises badvalue from v3d if the vector normal is null. .

Parameters
----------
X: float
Y: float
Z: float
Vx: float
Vy: float
Vz: float

Returns
-------
None
") SetAxis;
		void SetAxis(const Standard_Real X, const Standard_Real Y, const Standard_Real Z, const Standard_Real Vx, const Standard_Real Vy, const Standard_Real Vz);

		/****************** SetBackFacingModel ******************/
		/**** md5 signature: 30c0e59124d52b71521a2d2406c785bc ****/
		%feature("compactdefaultargs") SetBackFacingModel;
		%feature("autodoc", "Manages display of the back faces when <amodel> is tobm_automatic the object backfaces are displayed only for surface objects and never displayed for solid objects. this was the previous mode. <amodel> is tobm_always_displayed the object backfaces are always displayed both for surfaces or solids. <amodel> is tobm_never_displayed the object backfaces are never displayed.

Parameters
----------
theModel: V3d_TypeOfBackfacingModel,optional
	default value is V3d_TOBM_AUTOMATIC

Returns
-------
None
") SetBackFacingModel;
		void SetBackFacingModel(const V3d_TypeOfBackfacingModel theModel = V3d_TOBM_AUTOMATIC);

		/****************** SetBackgroundColor ******************/
		/**** md5 signature: b5a0d9f80a350764624098a365179a93 ****/
		%feature("compactdefaultargs") SetBackgroundColor;
		%feature("autodoc", "Defines the background color of the view by the color definition type and the three corresponding values.

Parameters
----------
theType: Quantity_TypeOfColor
theV1: float
theV2: float
theV3: float

Returns
-------
None
") SetBackgroundColor;
		void SetBackgroundColor(const Quantity_TypeOfColor theType, const Standard_Real theV1, const Standard_Real theV2, const Standard_Real theV3);

		/****************** SetBackgroundColor ******************/
		/**** md5 signature: 59e6dfdc828d6e477040bf2ce9f26aaf ****/
		%feature("compactdefaultargs") SetBackgroundColor;
		%feature("autodoc", "Defines the background color of the view.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetBackgroundColor;
		void SetBackgroundColor(const Quantity_Color & theColor);

		/****************** SetBackgroundCubeMap ******************/
		/**** md5 signature: f6777560786543b17a38965b81c004cc ****/
		%feature("compactdefaultargs") SetBackgroundCubeMap;
		%feature("autodoc", "Sets environment cubemap as interactive background.

Parameters
----------
theCubeMap: Graphic3d_CubeMap
theToUpdate: bool,optional
	default value is Standard_False

Returns
-------
None
") SetBackgroundCubeMap;
		void SetBackgroundCubeMap(const opencascade::handle<Graphic3d_CubeMap> & theCubeMap, Standard_Boolean theToUpdate = Standard_False);

		/****************** SetBackgroundImage ******************/
		/**** md5 signature: 56244ced11a568c705352f7992e3c593 ****/
		%feature("compactdefaultargs") SetBackgroundImage;
		%feature("autodoc", "Defines the background texture of the view by supplying the texture image file name and fill method (centered by default).

Parameters
----------
theFileName: char *
theFillStyle: Aspect_FillMethod,optional
	default value is Aspect_FM_CENTERED
theToUpdate: bool,optional
	default value is Standard_False

Returns
-------
None
") SetBackgroundImage;
		void SetBackgroundImage(const char * theFileName, const Aspect_FillMethod theFillStyle = Aspect_FM_CENTERED, const Standard_Boolean theToUpdate = Standard_False);

		/****************** SetBgGradientColors ******************/
		/**** md5 signature: 70e7f0659696f72c3b6eb6ae9487a67f ****/
		%feature("compactdefaultargs") SetBgGradientColors;
		%feature("autodoc", "Defines the gradient background colors of the view by supplying the colors and the fill method (horizontal by default).

Parameters
----------
theColor1: Quantity_Color
theColor2: Quantity_Color
theFillStyle: Aspect_GradientFillMethod,optional
	default value is Aspect_GFM_HOR
theToUpdate: bool,optional
	default value is Standard_False

Returns
-------
None
") SetBgGradientColors;
		void SetBgGradientColors(const Quantity_Color & theColor1, const Quantity_Color & theColor2, const Aspect_GradientFillMethod theFillStyle = Aspect_GFM_HOR, const Standard_Boolean theToUpdate = Standard_False);

		/****************** SetBgGradientStyle ******************/
		/**** md5 signature: d6e6564ac4fa074ae7a9d23e8d722922 ****/
		%feature("compactdefaultargs") SetBgGradientStyle;
		%feature("autodoc", "Defines the gradient background fill method of the view.

Parameters
----------
theMethod: Aspect_GradientFillMethod,optional
	default value is Aspect_GFM_HOR
theToUpdate: bool,optional
	default value is Standard_False

Returns
-------
None
") SetBgGradientStyle;
		void SetBgGradientStyle(const Aspect_GradientFillMethod theMethod = Aspect_GFM_HOR, const Standard_Boolean theToUpdate = Standard_False);

		/****************** SetBgImageStyle ******************/
		/**** md5 signature: b2cd58264970b84f205845e49cfab5e5 ****/
		%feature("compactdefaultargs") SetBgImageStyle;
		%feature("autodoc", "Defines the textured background fill method of the view.

Parameters
----------
theFillStyle: Aspect_FillMethod
theToUpdate: bool,optional
	default value is Standard_False

Returns
-------
None
") SetBgImageStyle;
		void SetBgImageStyle(const Aspect_FillMethod theFillStyle, const Standard_Boolean theToUpdate = Standard_False);

		/****************** SetCamera ******************/
		/**** md5 signature: feb4846a043de91d4d1b29714dfe3b70 ****/
		%feature("compactdefaultargs") SetCamera;
		%feature("autodoc", "Change camera used by view.

Parameters
----------
theCamera: Graphic3d_Camera

Returns
-------
None
") SetCamera;
		void SetCamera(const opencascade::handle<Graphic3d_Camera> & theCamera);

		/****************** SetCenter ******************/
		/**** md5 signature: edab316f8dd9ae9296f0af644eddcedd ****/
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "Relocates center of screen to the point, determined by {xp, yp} pixel coordinates relative to the bottom-left corner of screen. to calculate pixel coordinates for any point from world coordinate space, it can be projected using 'project'. @param thexp [in] the x coordinate. @param theyp [in] the y coordinate.

Parameters
----------
theXp: int
theYp: int

Returns
-------
None
") SetCenter;
		void SetCenter(const Standard_Integer theXp, const Standard_Integer theYp);

		/****************** SetClipPlanes ******************/
		/**** md5 signature: 3a7856a5edcaa36a5327770acfe803b0 ****/
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "Sets sequence of clip planes to the view. the planes that have been set before are removed from the view. the composition of clip planes truncates the rendering space to convex volume. number of supported clip planes can be consulted by inquireplanelimit method of graphic3d_graphicdriver. please be aware that the planes that exceed the limit are ignored during rendering. @param theplanes [in] the clip planes to set.

Parameters
----------
thePlanes: Graphic3d_SequenceOfHClipPlane

Returns
-------
None
") SetClipPlanes;
		void SetClipPlanes(const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & thePlanes);

		/****************** SetClipPlanes ******************/
		/**** md5 signature: 07b77eb94c54463d3580213e6e88f118 ****/
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePlanes: Graphic3d_SequenceOfHClipPlane

Returns
-------
None
") SetClipPlanes;
		void SetClipPlanes(const Graphic3d_SequenceOfHClipPlane & thePlanes);

		/****************** SetComputedMode ******************/
		/**** md5 signature: 269d3bae92efe31d98d859df0012cf4d ****/
		%feature("compactdefaultargs") SetComputedMode;
		%feature("autodoc", "Switches computed hlr mode in the view.

Parameters
----------
theMode: bool

Returns
-------
None
") SetComputedMode;
		void SetComputedMode(const Standard_Boolean theMode);

		/****************** SetDepth ******************/
		/**** md5 signature: d425c957b63eb5a47c2e5afbe949ecb8 ****/
		%feature("compactdefaultargs") SetDepth;
		%feature("autodoc", "Defines the depth of the eye from the view point without update the projection .

Parameters
----------
Depth: float

Returns
-------
None
") SetDepth;
		void SetDepth(const Standard_Real Depth);

		/****************** SetEye ******************/
		/**** md5 signature: 853c91c04ecdde43f9f722eb2123b162 ****/
		%feature("compactdefaultargs") SetEye;
		%feature("autodoc", "Defines the position of the eye..

Parameters
----------
X: float
Y: float
Z: float

Returns
-------
None
") SetEye;
		void SetEye(const Standard_Real X, const Standard_Real Y, const Standard_Real Z);

		/****************** SetFocale ******************/
		/**** md5 signature: fd6951ff72f1057400a656a38e12591e ****/
		%feature("compactdefaultargs") SetFocale;
		%feature("autodoc", "Change view plane distance for perspective views warning! raises typemismatch from standard if the view is not a perspective view.

Parameters
----------
Focale: float

Returns
-------
None
") SetFocale;
		void SetFocale(const Standard_Real Focale);

		/****************** SetFront ******************/
		/**** md5 signature: 0bead267cee2c0fd25d14d75a33a7e30 ****/
		%feature("compactdefaultargs") SetFront;
		%feature("autodoc", "Modify the projection of the view perpendicularly to the privileged plane of the viewer.

Returns
-------
None
") SetFront;
		void SetFront();

		/****************** SetFrustumCulling ******************/
		/**** md5 signature: cd3bc7120d3702ea29315dd0146d05f4 ****/
		%feature("compactdefaultargs") SetFrustumCulling;
		%feature("autodoc", "Turn on/off automatic culling of objects outside frustum (on by default).

Parameters
----------
theMode: bool

Returns
-------
None
") SetFrustumCulling;
		void SetFrustumCulling(Standard_Boolean theMode);

		/****************** SetGrid ******************/
		/**** md5 signature: 0ba6c21ecdc3dc75968a47b2df6a7f10 ****/
		%feature("compactdefaultargs") SetGrid;
		%feature("autodoc", "Defines or updates the definition of the grid in <self>.

Parameters
----------
aPlane: gp_Ax3
aGrid: Aspect_Grid

Returns
-------
None
") SetGrid;
		void SetGrid(const gp_Ax3 & aPlane, const opencascade::handle<Aspect_Grid> & aGrid);

		/****************** SetGridActivity ******************/
		/**** md5 signature: cd3125bb63d4526b365a7efc378bafea ****/
		%feature("compactdefaultargs") SetGridActivity;
		%feature("autodoc", "Defines or updates the activity of the grid in <self>.

Parameters
----------
aFlag: bool

Returns
-------
None
") SetGridActivity;
		void SetGridActivity(const Standard_Boolean aFlag);

		/****************** SetImmediateUpdate ******************/
		/**** md5 signature: b930e6c2cf96f1b5cd3b04092063cb66 ****/
		%feature("compactdefaultargs") SetImmediateUpdate;
		%feature("autodoc", "Sets the immediate update mode and returns the previous one.

Parameters
----------
theImmediateUpdate: bool

Returns
-------
bool
") SetImmediateUpdate;
		Standard_Boolean SetImmediateUpdate(const Standard_Boolean theImmediateUpdate);

		/****************** SetLightOff ******************/
		/**** md5 signature: 455cedd8ba3c305764630cd94d4a9d57 ****/
		%feature("compactdefaultargs") SetLightOff;
		%feature("autodoc", "Deactivate thelight in this view.

Parameters
----------
theLight: V3d_Light

Returns
-------
None
") SetLightOff;
		void SetLightOff(const opencascade::handle<V3d_Light> & theLight);

		/****************** SetLightOff ******************/
		/**** md5 signature: bf38107f690adbb6b0f411e0bf63da48 ****/
		%feature("compactdefaultargs") SetLightOff;
		%feature("autodoc", "Deactivate all the lights defined in this view.

Returns
-------
None
") SetLightOff;
		void SetLightOff();

		/****************** SetLightOn ******************/
		/**** md5 signature: d1efc51d1bc7b893aa6cd272504c6805 ****/
		%feature("compactdefaultargs") SetLightOn;
		%feature("autodoc", "Activates thelight in the view.

Parameters
----------
theLight: V3d_Light

Returns
-------
None
") SetLightOn;
		void SetLightOn(const opencascade::handle<V3d_Light> & theLight);

		/****************** SetLightOn ******************/
		/**** md5 signature: 0dbd37321a0295b614d3d0d9cd0a3fe9 ****/
		%feature("compactdefaultargs") SetLightOn;
		%feature("autodoc", "Activates all the lights defined in this view.

Returns
-------
None
") SetLightOn;
		void SetLightOn();

		/****************** SetMagnify ******************/
		/**** md5 signature: 086f8ea9570231142c44b0f3ba3194cf ****/
		%feature("compactdefaultargs") SetMagnify;
		%feature("autodoc", "No available documentation.

Parameters
----------
theWindow: Aspect_Window
thePreviousView: V3d_View
theX1: int
theY1: int
theX2: int
theY2: int

Returns
-------
None
") SetMagnify;
		void SetMagnify(const opencascade::handle<Aspect_Window> & theWindow, const opencascade::handle<V3d_View> & thePreviousView, const Standard_Integer theX1, const Standard_Integer theY1, const Standard_Integer theX2, const Standard_Integer theY2);

		/****************** SetProj ******************/
		/**** md5 signature: 26211bc22e4e16666a156f93f39342cd ****/
		%feature("compactdefaultargs") SetProj;
		%feature("autodoc", "Defines the orientation of the projection.

Parameters
----------
Vx: float
Vy: float
Vz: float

Returns
-------
None
") SetProj;
		void SetProj(const Standard_Real Vx, const Standard_Real Vy, const Standard_Real Vz);

		/****************** SetProj ******************/
		/**** md5 signature: 7cab3829a1655bc373ac3398af7d8756 ****/
		%feature("compactdefaultargs") SetProj;
		%feature("autodoc", "Defines the orientation of the projection . @param theorientation camera direction @param theisyup flag indicating y-up (true) or z-up (false) convention.

Parameters
----------
theOrientation: V3d_TypeOfOrientation
theIsYup: bool,optional
	default value is Standard_False

Returns
-------
None
") SetProj;
		void SetProj(const V3d_TypeOfOrientation theOrientation, const Standard_Boolean theIsYup = Standard_False);

		/****************** SetScale ******************/
		/**** md5 signature: 31aa804aa2f857f10bee711d83f73f9d ****/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "Zooms the view by a factor relative to the value initialised by setviewmappingdefault(). updates the view.

Parameters
----------
Coef: float

Returns
-------
None
") SetScale;
		void SetScale(const Standard_Real Coef);

		/****************** SetShadingModel ******************/
		/**** md5 signature: 126435b0809b0e46e5c779eaa28d91a9 ****/
		%feature("compactdefaultargs") SetShadingModel;
		%feature("autodoc", "Defines the shading model for the visualization. various models are available.

Parameters
----------
theShadingModel: Graphic3d_TypeOfShadingModel

Returns
-------
None
") SetShadingModel;
		void SetShadingModel(const Graphic3d_TypeOfShadingModel theShadingModel);

		/****************** SetSize ******************/
		/**** md5 signature: 93bdf33a4c6cf5665958dc490a88ba2b ****/
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "Defines the view projection size in its maximum dimension, keeping the inital height/width ratio unchanged.

Parameters
----------
theSize: float

Returns
-------
None
") SetSize;
		void SetSize(const Standard_Real theSize);

		/****************** SetTextureEnv ******************/
		/**** md5 signature: c8d500ab9ea731d5226a63daa46fcedd ****/
		%feature("compactdefaultargs") SetTextureEnv;
		%feature("autodoc", "Sets the environment texture to use. no environment texture by default.

Parameters
----------
theTexture: Graphic3d_TextureEnv

Returns
-------
None
") SetTextureEnv;
		void SetTextureEnv(const opencascade::handle<Graphic3d_TextureEnv> & theTexture);

		/****************** SetTwist ******************/
		/**** md5 signature: 4d86e6456e0427b37d1df0b90e036cb5 ****/
		%feature("compactdefaultargs") SetTwist;
		%feature("autodoc", "Defines the angular position of the high point of the reference frame of the view with respect to the y screen axis with an absolute angular value in radians.

Parameters
----------
Angle: float

Returns
-------
None
") SetTwist;
		void SetTwist(const Standard_Real Angle);

		/****************** SetUp ******************/
		/**** md5 signature: 92ea0c4c6be9a3eab8ad195c3ce5ef3e ****/
		%feature("compactdefaultargs") SetUp;
		%feature("autodoc", "Defines the orientation of the high point.

Parameters
----------
Vx: float
Vy: float
Vz: float

Returns
-------
None
") SetUp;
		void SetUp(const Standard_Real Vx, const Standard_Real Vy, const Standard_Real Vz);

		/****************** SetUp ******************/
		/**** md5 signature: 8517d74f5cc263ecfa5b2569a74730df ****/
		%feature("compactdefaultargs") SetUp;
		%feature("autodoc", "Defines the orientation(so) of the high point.

Parameters
----------
Orientation: V3d_TypeOfOrientation

Returns
-------
None
") SetUp;
		void SetUp(const V3d_TypeOfOrientation Orientation);

		/****************** SetViewMappingDefault ******************/
		/**** md5 signature: 3155a7579ce0fbd9532617a42036d14d ****/
		%feature("compactdefaultargs") SetViewMappingDefault;
		%feature("autodoc", "Saves the current view mapping. this will be the state returned from resetviewmapping.

Returns
-------
None
") SetViewMappingDefault;
		void SetViewMappingDefault();

		/****************** SetViewOrientationDefault ******************/
		/**** md5 signature: 558a7a5583365f0a3f4296a05563091e ****/
		%feature("compactdefaultargs") SetViewOrientationDefault;
		%feature("autodoc", "Saves the current state of the orientation of the view which will be the return state at resetvieworientation.

Returns
-------
None
") SetViewOrientationDefault;
		void SetViewOrientationDefault();

		/****************** SetVisualization ******************/
		/**** md5 signature: 694d401cc81bf0525b52579977043a91 ****/
		%feature("compactdefaultargs") SetVisualization;
		%feature("autodoc", "Defines the visualization type in the view.

Parameters
----------
theType: V3d_TypeOfVisualization

Returns
-------
None
") SetVisualization;
		void SetVisualization(const V3d_TypeOfVisualization theType);

		/****************** SetWindow ******************/
		/**** md5 signature: 88542421f11e26bdd834c4f53a2bcc5d ****/
		%feature("compactdefaultargs") SetWindow;
		%feature("autodoc", "Activates the view in the specified window if <acontext> is not null the graphic context is used to draw something in this view. otherwise an internal graphic context is created. warning: the view is centered and resized to preserve the height/width ratio of the window.

Parameters
----------
theWindow: Aspect_Window
theContext: Aspect_RenderingContext,optional
	default value is NULL

Returns
-------
None
") SetWindow;
		void SetWindow(const opencascade::handle<Aspect_Window> & theWindow, const Aspect_RenderingContext theContext = NULL);

		/****************** SetZSize ******************/
		/**** md5 signature: 7561e1378cbba3000055a4c19942c545 ****/
		%feature("compactdefaultargs") SetZSize;
		%feature("autodoc", "Defines the depth size of the view front plane will be set to size/2. back plane will be set to -size/2. any object located above the front plane or behind the back plane will be clipped . note than the xy size of the view is not modified .

Parameters
----------
SetZSize: float

Returns
-------
None
") SetZSize;
		void SetZSize(const Standard_Real SetZSize);

		/****************** SetZoom ******************/
		/**** md5 signature: bca05970b665fea8d5dba6189e5e776a ****/
		%feature("compactdefaultargs") SetZoom;
		%feature("autodoc", "Zooms the view by a factor relative to the initial value expressed by start = standard_true updates the view.

Parameters
----------
Coef: float
Start: bool,optional
	default value is Standard_True

Returns
-------
None
") SetZoom;
		void SetZoom(const Standard_Real Coef, const Standard_Boolean Start = Standard_True);

		/****************** ShadingModel ******************/
		/**** md5 signature: 79d21cf733a0311d63fb301f9c1a0521 ****/
		%feature("compactdefaultargs") ShadingModel;
		%feature("autodoc", "Returns the current shading model.

Returns
-------
Graphic3d_TypeOfShadingModel
") ShadingModel;
		Graphic3d_TypeOfShadingModel ShadingModel();

		/****************** Size ******************/
		/**** md5 signature: f0670a765261a8b64388fbbd56bfa574 ****/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Returns the height and width of the view.

Parameters
----------

Returns
-------
Width: float
Height: float
") Size;
		void Size(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** StartRotation ******************/
		/**** md5 signature: 4e7b7c931641e3190c281fb4c327e49e ****/
		%feature("compactdefaultargs") StartRotation;
		%feature("autodoc", "Begin the rotation of the view around the screen axis according to the mouse position <x,y>. warning: enable rotation around the z screen axis when <zrotationthreshold> factor is > 0 soon the distance from the start point and the center of the view is > (medium viewsize * <zrotationthreshold> ). generally a value of 0.4 is usable to rotate around xy screen axis inside the circular threshold area and to rotate around z screen axis outside this area.

Parameters
----------
X: int
Y: int
zRotationThreshold: float,optional
	default value is 0.0

Returns
-------
None
") StartRotation;
		void StartRotation(const Standard_Integer X, const Standard_Integer Y, const Standard_Real zRotationThreshold = 0.0);

		/****************** StartZoomAtPoint ******************/
		/**** md5 signature: 64f3043ea094b3f7dec2f87e4696c552 ****/
		%feature("compactdefaultargs") StartZoomAtPoint;
		%feature("autodoc", "Defines starting point for zoomatpoint view operation. @param thexp [in] the x mouse coordinate, in pixels. @param theyp [in] the y mouse coordinate, in pixels.

Parameters
----------
theXp: int
theYp: int

Returns
-------
None
") StartZoomAtPoint;
		void StartZoomAtPoint(const Standard_Integer theXp, const Standard_Integer theYp);

		/****************** StatisticInformation ******************/
		/**** md5 signature: 444dc7137469a967cc38cb224d06bebc ****/
		%feature("compactdefaultargs") StatisticInformation;
		%feature("autodoc", "Returns string with statistic performance info.

Returns
-------
TCollection_AsciiString
") StatisticInformation;
		TCollection_AsciiString StatisticInformation();

		/****************** StatisticInformation ******************/
		/**** md5 signature: 54f56dd2c6701d6a6cca2a091f276074 ****/
		%feature("compactdefaultargs") StatisticInformation;
		%feature("autodoc", "Fills in the dictionary with statistic performance info.

Parameters
----------
theDict: TColStd_IndexedDataMapOfStringString

Returns
-------
None
") StatisticInformation;
		void StatisticInformation(TColStd_IndexedDataMapOfStringString & theDict);

		/****************** TextureEnv ******************/
		/**** md5 signature: 11fc7995513bc89d61631d77ea5a1796 ****/
		%feature("compactdefaultargs") TextureEnv;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Graphic3d_TextureEnv>
") TextureEnv;
		opencascade::handle<Graphic3d_TextureEnv> TextureEnv();

		/****************** ToPixMap ******************/
		/**** md5 signature: f4afbd441d7f56cecd854bf81405751d ****/
		%feature("compactdefaultargs") ToPixMap;
		%feature("autodoc", "Dumps the full contents of the view to a pixmap with specified parameters. internally this method calls redraw() with an offscreen render buffer of requested target size (thewidth x theheight), so that there is no need resizing a window control for making a dump of different size.

Parameters
----------
theImage: Image_PixMap
theParams: V3d_ImageDumpOptions

Returns
-------
bool
") ToPixMap;
		Standard_Boolean ToPixMap(Image_PixMap & theImage, const V3d_ImageDumpOptions & theParams);

		/****************** ToPixMap ******************/
		/**** md5 signature: d512e23c394006d2a24ec70403284595 ****/
		%feature("compactdefaultargs") ToPixMap;
		%feature("autodoc", "Dumps the full contents of the view to a pixmap. internally this method calls redraw() with an offscreen render buffer of requested target size (thewidth x theheight), so that there is no need resizing a window control for making a dump of different size. @param theimage target image, will be re-allocated to match thewidth x theheight @param thewidth target image width @param theheight target image height @param thebuffertype type of the view buffer to dump (color / depth) @param thetoadjustaspect when true, active view aspect ratio will be overridden by (thewidth / theheight) @param thestereooptions how to dump stereographic camera.

Parameters
----------
theImage: Image_PixMap
theWidth: int
theHeight: int
theBufferType: Graphic3d_BufferType,optional
	default value is Graphic3d_BT_RGB
theToAdjustAspect: bool,optional
	default value is Standard_True
theStereoOptions: V3d_StereoDumpOptions,optional
	default value is V3d_SDO_MONO

Returns
-------
bool
") ToPixMap;
		Standard_Boolean ToPixMap(Image_PixMap & theImage, const Standard_Integer theWidth, const Standard_Integer theHeight, const Graphic3d_BufferType & theBufferType = Graphic3d_BT_RGB, const Standard_Boolean theToAdjustAspect = Standard_True, const V3d_StereoDumpOptions theStereoOptions = V3d_SDO_MONO);

		/****************** Translate ******************/
		/**** md5 signature: 6d30e9ad6e04686ac1e7e71d61abb03a ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "Movement of the ye and the view point parallel to the frame of reference of the screen a distance relative to the initial position expressed by start = standard_true.

Parameters
----------
Dx: float
Dy: float
Dz: float
Start: bool,optional
	default value is Standard_True

Returns
-------
None
") Translate;
		void Translate(const Standard_Real Dx, const Standard_Real Dy, const Standard_Real Dz, const Standard_Boolean Start = Standard_True);

		/****************** Translate ******************/
		/**** md5 signature: ad4691cf7ffabdbd8db6e15f796bb24e ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "Movement of the eye and the view point parallel to one of the axes of the fame of reference of the view a distance relative to the initial position expressed by start = standard_true.

Parameters
----------
Axe: V3d_TypeOfAxe
Length: float
Start: bool,optional
	default value is Standard_True

Returns
-------
None
") Translate;
		void Translate(const V3d_TypeOfAxe Axe, const Standard_Real Length, const Standard_Boolean Start = Standard_True);

		/****************** Translate ******************/
		/**** md5 signature: 4177f5224cc5f4934f54108b17291c95 ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "Movement of the eye and view point parallel to the current axis a distance relative to the initial position expressed by start = standard_true.

Parameters
----------
Length: float
Start: bool,optional
	default value is Standard_True

Returns
-------
None
") Translate;
		void Translate(const Standard_Real Length, const Standard_Boolean Start = Standard_True);

		/****************** TriedronDisplay ******************/
		/**** md5 signature: de6e0013aa0bfad258971d8c8e0a30f4 ****/
		%feature("compactdefaultargs") TriedronDisplay;
		%feature("autodoc", "Display of the triedron. initialize position, color and length of triedron axes. the scale is a percent of the window width.

Parameters
----------
thePosition: Aspect_TypeOfTriedronPosition,optional
	default value is Aspect_TOTP_CENTER
theColor: Quantity_Color,optional
	default value is Quantity_NOC_WHITE
theScale: float,optional
	default value is 0.02
theMode: V3d_TypeOfVisualization,optional
	default value is V3d_WIREFRAME

Returns
-------
None
") TriedronDisplay;
		void TriedronDisplay(const Aspect_TypeOfTriedronPosition thePosition = Aspect_TOTP_CENTER, const Quantity_Color & theColor = Quantity_NOC_WHITE, const Standard_Real theScale = 0.02, const V3d_TypeOfVisualization theMode = V3d_WIREFRAME);

		/****************** TriedronErase ******************/
		/**** md5 signature: 7f853325fd9818c65ebfc933096dc3a3 ****/
		%feature("compactdefaultargs") TriedronErase;
		%feature("autodoc", "Erases the triedron.

Returns
-------
None
") TriedronErase;
		void TriedronErase();

		/****************** Turn ******************/
		/**** md5 signature: caf9640300c113b68ec729c85a8d5ab2 ****/
		%feature("compactdefaultargs") Turn;
		%feature("autodoc", "Rotation of the view point around the frame of reference of the screen for which the origin is the eye of the projection with a relative angular value in radians with respect to the initial position expressed by start = standard_true.

Parameters
----------
Ax: float
Ay: float
Az: float
Start: bool,optional
	default value is Standard_True

Returns
-------
None
") Turn;
		void Turn(const Standard_Real Ax, const Standard_Real Ay, const Standard_Real Az, const Standard_Boolean Start = Standard_True);

		/****************** Turn ******************/
		/**** md5 signature: a4f7f9e8b15cd89400e2298af754124e ****/
		%feature("compactdefaultargs") Turn;
		%feature("autodoc", "Rotation of the view point around one of the axes of the frame of reference of the view for which the origin is the eye of the projection with an angular value in radians relative to the initial position expressed by start = standard_true.

Parameters
----------
Axe: V3d_TypeOfAxe
Angle: float
Start: bool,optional
	default value is Standard_True

Returns
-------
None
") Turn;
		void Turn(const V3d_TypeOfAxe Axe, const Standard_Real Angle, const Standard_Boolean Start = Standard_True);

		/****************** Turn ******************/
		/**** md5 signature: 23315bda5a558e1ab562b502e66a6f9d ****/
		%feature("compactdefaultargs") Turn;
		%feature("autodoc", "Rotation of the view point around the current axis an angular value in radians relative to the initial position expressed by start = standard_true.

Parameters
----------
Angle: float
Start: bool,optional
	default value is Standard_True

Returns
-------
None
") Turn;
		void Turn(const Standard_Real Angle, const Standard_Boolean Start = Standard_True);

		/****************** Twist ******************/
		/**** md5 signature: 1a3b631044253a3065221b01e86cffef ****/
		%feature("compactdefaultargs") Twist;
		%feature("autodoc", "Returns in radians the orientation of the view around the visual axis measured from the y axis of the screen.

Returns
-------
float
") Twist;
		Standard_Real Twist();

		/****************** Type ******************/
		/**** md5 signature: ecff2c56954abf9f3e7f78498aaa58f7 ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns the type of the view.

Returns
-------
V3d_TypeOfView
") Type;
		V3d_TypeOfView Type();

		/****************** Up ******************/
		/**** md5 signature: f3008a4c1208abfb3bc862299e03fbf5 ****/
		%feature("compactdefaultargs") Up;
		%feature("autodoc", "Returns the vector giving the position of the high point.

Parameters
----------

Returns
-------
Vx: float
Vy: float
Vz: float
") Up;
		void Up(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Update ******************/
		/**** md5 signature: 254d448d1012d4fa968771bf451e27dd ****/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Deprecated, redraw() should be used instead.

Returns
-------
None
") Update;
		void Update();

		/****************** UpdateLights ******************/
		/**** md5 signature: 9787d7b1225259ff747b49c8ee6c1203 ****/
		%feature("compactdefaultargs") UpdateLights;
		%feature("autodoc", "Updates the lights of the view.

Returns
-------
None
") UpdateLights;
		void UpdateLights();

		/****************** View ******************/
		/**** md5 signature: 70b6cfa36ca6a0cca5527abbf933a1a3 ****/
		%feature("compactdefaultargs") View;
		%feature("autodoc", "Returns the associated graphic3d view.

Returns
-------
opencascade::handle<Graphic3d_CView>
") View;
		const opencascade::handle<Graphic3d_CView> & View();

		/****************** Viewer ******************/
		/**** md5 signature: 8de79f0dc32e907f852e80c363ba50d8 ****/
		%feature("compactdefaultargs") Viewer;
		%feature("autodoc", "Returns the viewer in which the view has been created.

Returns
-------
opencascade::handle<V3d_Viewer>
") Viewer;
		opencascade::handle<V3d_Viewer> Viewer();

		/****************** Visualization ******************/
		/**** md5 signature: 69b1fe103f1ed24da346c50efa996976 ****/
		%feature("compactdefaultargs") Visualization;
		%feature("autodoc", "Returns the current visualisation mode.

Returns
-------
V3d_TypeOfVisualization
") Visualization;
		V3d_TypeOfVisualization Visualization();

		/****************** Window ******************/
		/**** md5 signature: 728fd6817e66dab00e2bb21f343deb70 ****/
		%feature("compactdefaultargs") Window;
		%feature("autodoc", "Returns the aspect window associated with the view.

Returns
-------
opencascade::handle<Aspect_Window>
") Window;
		const opencascade::handle<Aspect_Window> & Window();

		/****************** WindowFit ******************/
		/**** md5 signature: bc0e61f0b1c48780a137921835842602 ****/
		%feature("compactdefaultargs") WindowFit;
		%feature("autodoc", "Centers the defined pixel window so that it occupies the maximum space while respecting the initial height/width ratio. note than the original z size of the view is not modified. @param theminxp [in] pixel coordinates of minimal corner on x screen axis. @param theminyp [in] pixel coordinates of minimal corner on y screen axis. @param themaxxp [in] pixel coordinates of maximal corner on x screen axis. @param themaxyp [in] pixel coordinates of maximal corner on y screen axis.

Parameters
----------
theMinXp: int
theMinYp: int
theMaxXp: int
theMaxYp: int

Returns
-------
None
") WindowFit;
		void WindowFit(const Standard_Integer theMinXp, const Standard_Integer theMinYp, const Standard_Integer theMaxXp, const Standard_Integer theMaxYp);

		/****************** WindowFitAll ******************/
		/**** md5 signature: 3905890f018873bb66593015cc92a925 ****/
		%feature("compactdefaultargs") WindowFitAll;
		%feature("autodoc", "Idem than windowfit.

Parameters
----------
Xmin: int
Ymin: int
Xmax: int
Ymax: int

Returns
-------
None
") WindowFitAll;
		void WindowFitAll(const Standard_Integer Xmin, const Standard_Integer Ymin, const Standard_Integer Xmax, const Standard_Integer Ymax);

		/****************** ZBufferTriedronSetup ******************/
		/**** md5 signature: 72ed537b5b2aa41ae23236fb0669c852 ****/
		%feature("compactdefaultargs") ZBufferTriedronSetup;
		%feature("autodoc", "Customization of the zbuffer triedron. xcolor,ycolor,zcolor - colors of axis sizeratio - ratio of decreasing of the trihedron size when its physical position comes out of the view axisdiametr - diameter relatively to axis length nbfacettes - number of facets of cylinders and cones.

Parameters
----------
theXColor: Quantity_Color,optional
	default value is Quantity_NOC_RED
theYColor: Quantity_Color,optional
	default value is Quantity_NOC_GREEN
theZColor: Quantity_Color,optional
	default value is Quantity_NOC_BLUE1
theSizeRatio: float,optional
	default value is 0.8
theAxisDiametr: float,optional
	default value is 0.05
theNbFacettes: int,optional
	default value is 12

Returns
-------
None
") ZBufferTriedronSetup;
		void ZBufferTriedronSetup(const Quantity_Color & theXColor = Quantity_NOC_RED, const Quantity_Color & theYColor = Quantity_NOC_GREEN, const Quantity_Color & theZColor = Quantity_NOC_BLUE1, const Standard_Real theSizeRatio = 0.8, const Standard_Real theAxisDiametr = 0.05, const Standard_Integer theNbFacettes = 12);

		/****************** ZFitAll ******************/
		/**** md5 signature: dd238708d03b22848f6784d65aea3bce ****/
		%feature("compactdefaultargs") ZFitAll;
		%feature("autodoc", "Change z-min and z-max planes of projection volume to match the displayed objects.

Parameters
----------
theScaleFactor: float,optional
	default value is 1.0

Returns
-------
None
") ZFitAll;
		void ZFitAll(const Standard_Real theScaleFactor = 1.0);

		/****************** ZSize ******************/
		/**** md5 signature: 187d501555b38f4bbc375cc11cb950e2 ****/
		%feature("compactdefaultargs") ZSize;
		%feature("autodoc", "Returns the depth of the view .

Returns
-------
float
") ZSize;
		Standard_Real ZSize();

		/****************** Zoom ******************/
		/**** md5 signature: cc8b0f46863bbab262b11b8d9fe526ba ****/
		%feature("compactdefaultargs") Zoom;
		%feature("autodoc", "Zoom the view according to a zoom factor computed from the distance between the 2 mouse position. @param thexp1 [in] the x coordinate of first mouse position, in pixels. @param theyp1 [in] the y coordinate of first mouse position, in pixels. @param thexp2 [in] the x coordinate of second mouse position, in pixels. @param theyp2 [in] the y coordinate of second mouse position, in pixels.

Parameters
----------
theXp1: int
theYp1: int
theXp2: int
theYp2: int

Returns
-------
None
") Zoom;
		void Zoom(const Standard_Integer theXp1, const Standard_Integer theYp1, const Standard_Integer theXp2, const Standard_Integer theYp2);

		/****************** ZoomAtPoint ******************/
		/**** md5 signature: 90d152337c45e762ff38902f4a359765 ****/
		%feature("compactdefaultargs") ZoomAtPoint;
		%feature("autodoc", "Zooms the model at a pixel defined by the method startzoomatpoint().

Parameters
----------
theMouseStartX: int
theMouseStartY: int
theMouseEndX: int
theMouseEndY: int

Returns
-------
None
") ZoomAtPoint;
		void ZoomAtPoint(const Standard_Integer theMouseStartX, const Standard_Integer theMouseStartY, const Standard_Integer theMouseEndX, const Standard_Integer theMouseEndY);

};


%make_alias(V3d_View)

%extend V3d_View {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Print(self):
		pass
	}
};

/*******************
* class V3d_Viewer *
*******************/
class V3d_Viewer : public Standard_Transient {
	public:
		/****************** V3d_Viewer ******************/
		/**** md5 signature: 7164d130b975eb54ede0be07d962e066 ****/
		%feature("compactdefaultargs") V3d_Viewer;
		%feature("autodoc", "Create a viewer with the given graphic driver and with default parameters: - view orientation: v3d_xposynegzpos - view background: quantity_noc_gray30 - shading model: v3d_gouraud.

Parameters
----------
theDriver: Graphic3d_GraphicDriver

Returns
-------
None
") V3d_Viewer;
		 V3d_Viewer(const opencascade::handle<Graphic3d_GraphicDriver> & theDriver);

		/****************** V3d_Viewer ******************/
		/**** md5 signature: 4a8b671d69f357536c855bb0546e7003 ****/
		%feature("compactdefaultargs") V3d_Viewer;
		%feature("autodoc", "No available documentation.

Parameters
----------
theDriver: Graphic3d_GraphicDriver
theName: Standard_ExtString
theDomain: char *,optional
	default value is ""
theViewSize: float,optional
	default value is 1000.0
theViewProj: V3d_TypeOfOrientation,optional
	default value is V3d_XposYnegZpos
theViewBackground: Quantity_Color,optional
	default value is Quantity_NOC_GRAY30
theVisualization: V3d_TypeOfVisualization,optional
	default value is V3d_ZBUFFER
theShadingModel: Graphic3d_TypeOfShadingModel,optional
	default value is Graphic3d_TOSM_VERTEX
theComputedMode: bool,optional
	default value is Standard_True
theDefaultComputedMode: bool,optional
	default value is Standard_True

Returns
-------
None
") V3d_Viewer;
		 V3d_Viewer(const opencascade::handle<Graphic3d_GraphicDriver> & theDriver, const Standard_ExtString theName, const char * theDomain = "", const Standard_Real theViewSize = 1000.0, const V3d_TypeOfOrientation theViewProj = V3d_XposYnegZpos, const Quantity_Color & theViewBackground = Quantity_NOC_GRAY30, const V3d_TypeOfVisualization theVisualization = V3d_ZBUFFER, const Graphic3d_TypeOfShadingModel theShadingModel = Graphic3d_TOSM_VERTEX, const Standard_Boolean theComputedMode = Standard_True, const Standard_Boolean theDefaultComputedMode = Standard_True);

		/****************** ActivateGrid ******************/
		/**** md5 signature: 00bc3f4c997ffd5dbf63fdf576318948 ****/
		%feature("compactdefaultargs") ActivateGrid;
		%feature("autodoc", "Activates the grid in all views of <self>.

Parameters
----------
aGridType: Aspect_GridType
aGridDrawMode: Aspect_GridDrawMode

Returns
-------
None
") ActivateGrid;
		void ActivateGrid(const Aspect_GridType aGridType, const Aspect_GridDrawMode aGridDrawMode);

		/****************** ActiveLight ******************/
		/**** md5 signature: 7af2e71f89b94797e81a8b1c1a052d68 ****/
		%feature("compactdefaultargs") ActiveLight;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<V3d_Light>
") ActiveLight;
		const opencascade::handle<V3d_Light> & ActiveLight();

		/****************** ActiveLightIterator ******************/
		/**** md5 signature: 6fa6e98274fc8d44abfc6ab8d93a027d ****/
		%feature("compactdefaultargs") ActiveLightIterator;
		%feature("autodoc", "Return an iterator for defined lights.

Returns
-------
V3d_ListOfLightIterator
") ActiveLightIterator;
		V3d_ListOfLightIterator ActiveLightIterator();

		/****************** ActiveView ******************/
		/**** md5 signature: 51c31c5b98d9861184e3beb9dd0957d2 ****/
		%feature("compactdefaultargs") ActiveView;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<V3d_View>
") ActiveView;
		const opencascade::handle<V3d_View> & ActiveView();

		/****************** ActiveViewIterator ******************/
		/**** md5 signature: 574b0283da51acbb6d87557a35440216 ****/
		%feature("compactdefaultargs") ActiveViewIterator;
		%feature("autodoc", "Return an iterator for active views.

Returns
-------
V3d_ListOfViewIterator
") ActiveViewIterator;
		V3d_ListOfViewIterator ActiveViewIterator();

		/****************** AddLight ******************/
		/**** md5 signature: a790b9b06a29d0522e8dcef07a2fd4b7 ****/
		%feature("compactdefaultargs") AddLight;
		%feature("autodoc", "Adds light in sequence of lights.

Parameters
----------
theLight: V3d_Light

Returns
-------
None
") AddLight;
		void AddLight(const opencascade::handle<V3d_Light> & theLight);

		/****************** AddZLayer ******************/
		/**** md5 signature: b68a07f8f7714627f3c19816e24e14dc ****/
		%feature("compactdefaultargs") AddZLayer;
		%feature("autodoc", "Add a new top-level z layer to all managed views and get its id as <thelayerid> value. the z layers are controlled entirely by viewer, it is not possible to add a layer to a particular view. custom layers will be inserted before graphic3d_zlayerid_top (e.g. between graphic3d_zlayerid_default and before graphic3d_zlayerid_top). @param thelayerid [out] id of created layer @param thesettings [in] new layer settings returns false if the layer can not be created.

Parameters
----------
theLayerId: int OutValue
theSettings: Graphic3d_ZLayerSettings,optional
	default value is Graphic3d_ZLayerSettings()

Returns
-------
bool
") AddZLayer;
		Standard_Boolean AddZLayer(Standard_Integer &OutValue, const Graphic3d_ZLayerSettings & theSettings = Graphic3d_ZLayerSettings());

		/****************** CircularGridGraphicValues ******************/
		/**** md5 signature: 7c300954e18ef90e055a30c0ceed3cc8 ****/
		%feature("compactdefaultargs") CircularGridGraphicValues;
		%feature("autodoc", "Returns the location and the size of the grid.

Parameters
----------

Returns
-------
Radius: float
OffSet: float
") CircularGridGraphicValues;
		void CircularGridGraphicValues(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** CircularGridValues ******************/
		/**** md5 signature: 2164f90264ca7c1420684d06c8f5a231 ****/
		%feature("compactdefaultargs") CircularGridValues;
		%feature("autodoc", "Returns the definition of the circular grid.

Parameters
----------

Returns
-------
XOrigin: float
YOrigin: float
RadiusStep: float
DivisionNumber: int
RotationAngle: float
") CircularGridValues;
		void CircularGridValues(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****************** ComputedMode ******************/
		/**** md5 signature: 47a490ca5aa934708fe6a7c8b60e9268 ****/
		%feature("compactdefaultargs") ComputedMode;
		%feature("autodoc", "Returns true if the computed mode can be used.

Returns
-------
bool
") ComputedMode;
		Standard_Boolean ComputedMode();

		/****************** CreateView ******************/
		/**** md5 signature: a32865abef765684ea877fbd326497ff ****/
		%feature("compactdefaultargs") CreateView;
		%feature("autodoc", "Creates a view in the viewer according to its default parameters.

Returns
-------
opencascade::handle<V3d_View>
") CreateView;
		opencascade::handle<V3d_View> CreateView();

		/****************** DeactivateGrid ******************/
		/**** md5 signature: fb49cb8b3a2e9aa66e59c74ff923ae8d ****/
		%feature("compactdefaultargs") DeactivateGrid;
		%feature("autodoc", "Deactivates the grid in all views of <self>.

Returns
-------
None
") DeactivateGrid;
		void DeactivateGrid();

		/****************** DefaultBackgroundColor ******************/
		/**** md5 signature: 34d03952cbbdb894c928fee375aa1559 ****/
		%feature("compactdefaultargs") DefaultBackgroundColor;
		%feature("autodoc", "Returns the default background colour object.

Returns
-------
Quantity_Color
") DefaultBackgroundColor;
		Quantity_Color DefaultBackgroundColor();

		/****************** DefaultBackgroundColor ******************/
		/**** md5 signature: cabb3b9108f07a8992885f498ac07920 ****/
		%feature("compactdefaultargs") DefaultBackgroundColor;
		%feature("autodoc", "No available documentation.

Parameters
----------
theType: Quantity_TypeOfColor

Returns
-------
theV1: float
theV2: float
theV3: float
") DefaultBackgroundColor;
		void DefaultBackgroundColor(const Quantity_TypeOfColor theType, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** DefaultBgGradientColors ******************/
		/**** md5 signature: 7bb90d9db11de75077b503e1ad617543 ****/
		%feature("compactdefaultargs") DefaultBgGradientColors;
		%feature("autodoc", "Returns the gradient background colour objects of the view.

Parameters
----------
theColor1: Quantity_Color
theColor2: Quantity_Color

Returns
-------
None
") DefaultBgGradientColors;
		void DefaultBgGradientColors(Quantity_Color & theColor1, Quantity_Color & theColor2);

		/****************** DefaultComputedMode ******************/
		/**** md5 signature: d3c50e318cfcbb3fbf216a2966870f4f ****/
		%feature("compactdefaultargs") DefaultComputedMode;
		%feature("autodoc", "Returns true if by default the computed mode must be used.

Returns
-------
bool
") DefaultComputedMode;
		Standard_Boolean DefaultComputedMode();

		/****************** DefaultRenderingParams ******************/
		/**** md5 signature: 0d628909940f0fcdf3653e8e75ccea5c ****/
		%feature("compactdefaultargs") DefaultRenderingParams;
		%feature("autodoc", "Return default rendering parameters. by default these parameters are set in a new v3d_view.

Returns
-------
Graphic3d_RenderingParams
") DefaultRenderingParams;
		const Graphic3d_RenderingParams & DefaultRenderingParams();

		/****************** DefaultShadingModel ******************/
		/**** md5 signature: bc3bfac8e702deb7740234263f9351ab ****/
		%feature("compactdefaultargs") DefaultShadingModel;
		%feature("autodoc", "Returns the default type of shading.

Returns
-------
Graphic3d_TypeOfShadingModel
") DefaultShadingModel;
		Graphic3d_TypeOfShadingModel DefaultShadingModel();

		/****************** DefaultTypeOfView ******************/
		/**** md5 signature: d5988324ca88382ae2c23a2d41b0e27f ****/
		%feature("compactdefaultargs") DefaultTypeOfView;
		%feature("autodoc", "Returns the default type of view (orthographic or perspective projection) to be returned by createview() method.

Returns
-------
V3d_TypeOfView
") DefaultTypeOfView;
		V3d_TypeOfView DefaultTypeOfView();

		/****************** DefaultViewProj ******************/
		/**** md5 signature: 191df19ea493b948bf913653e28cd6a9 ****/
		%feature("compactdefaultargs") DefaultViewProj;
		%feature("autodoc", "Returns the default projection.

Returns
-------
V3d_TypeOfOrientation
") DefaultViewProj;
		V3d_TypeOfOrientation DefaultViewProj();

		/****************** DefaultViewSize ******************/
		/**** md5 signature: 8b5d67c5c8bd6ffbbf9099f47a14fc80 ****/
		%feature("compactdefaultargs") DefaultViewSize;
		%feature("autodoc", "Returns the default size of the view.

Returns
-------
float
") DefaultViewSize;
		Standard_Real DefaultViewSize();

		/****************** DefaultVisualization ******************/
		/**** md5 signature: 89fcbd31e3e47bcd5f2de7db627ccc84 ****/
		%feature("compactdefaultargs") DefaultVisualization;
		%feature("autodoc", "Returns the default type of visualization.

Returns
-------
V3d_TypeOfVisualization
") DefaultVisualization;
		V3d_TypeOfVisualization DefaultVisualization();

		/****************** DefinedLight ******************/
		/**** md5 signature: 6a0a48c158f9d263e67c5ee5a34704c6 ****/
		%feature("compactdefaultargs") DefinedLight;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<V3d_Light>
") DefinedLight;
		const opencascade::handle<V3d_Light> & DefinedLight();

		/****************** DefinedLightIterator ******************/
		/**** md5 signature: eddeafaf0e73b1ef6846ff96f36f0722 ****/
		%feature("compactdefaultargs") DefinedLightIterator;
		%feature("autodoc", "Return an iterator for defined lights.

Returns
-------
V3d_ListOfLightIterator
") DefinedLightIterator;
		V3d_ListOfLightIterator DefinedLightIterator();

		/****************** DefinedView ******************/
		/**** md5 signature: be2c70401aec7849d2bf409cd59dbee2 ****/
		%feature("compactdefaultargs") DefinedView;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<V3d_View>
") DefinedView;
		const opencascade::handle<V3d_View> & DefinedView();

		/****************** DefinedViewIterator ******************/
		/**** md5 signature: ccf312ca450589f93a86c3c62efdbecc ****/
		%feature("compactdefaultargs") DefinedViewIterator;
		%feature("autodoc", "Return an iterator for defined views.

Returns
-------
V3d_ListOfViewIterator
") DefinedViewIterator;
		V3d_ListOfViewIterator DefinedViewIterator();

		/****************** DelLight ******************/
		/**** md5 signature: 41c87090c1f691ab05530e33b3599aaa ****/
		%feature("compactdefaultargs") DelLight;
		%feature("autodoc", "Delete light in sequence of lights.

Parameters
----------
theLight: V3d_Light

Returns
-------
None
") DelLight;
		void DelLight(const opencascade::handle<V3d_Light> & theLight);

		/****************** DisplayPrivilegedPlane ******************/
		/**** md5 signature: 405f1e98b9f139ef3c5536006d112ef5 ****/
		%feature("compactdefaultargs") DisplayPrivilegedPlane;
		%feature("autodoc", "No available documentation.

Parameters
----------
theOnOff: bool
theSize: float,optional
	default value is 1

Returns
-------
None
") DisplayPrivilegedPlane;
		void DisplayPrivilegedPlane(const Standard_Boolean theOnOff, const Standard_Real theSize = 1);

		/****************** Driver ******************/
		/**** md5 signature: 4f7ae644d3e0836700806ee745978120 ****/
		%feature("compactdefaultargs") Driver;
		%feature("autodoc", "Return graphic driver instance.

Returns
-------
opencascade::handle<Graphic3d_GraphicDriver>
") Driver;
		const opencascade::handle<Graphic3d_GraphicDriver> & Driver();

		/****************** Erase ******************/
		/**** md5 signature: 22f17cdf7e7984cb80d1d94de19c3493 ****/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "Erase all objects in all the views.

Returns
-------
None
") Erase;
		void Erase();

		/****************** GetAllZLayers ******************/
		/**** md5 signature: 37cf193a9a832c92f8389f0a240a7894 ****/
		%feature("compactdefaultargs") GetAllZLayers;
		%feature("autodoc", "Return all z layer ids in sequence ordered by overlay level from lowest layer to highest ( foreground ). the first layer id in sequence is the default layer that can't be removed.

Parameters
----------
theLayerSeq: TColStd_SequenceOfInteger

Returns
-------
None
") GetAllZLayers;
		void GetAllZLayers(TColStd_SequenceOfInteger & theLayerSeq);

		/****************** GetGradientBackground ******************/
		/**** md5 signature: 0f4e8e838a0ee15372af6735b7472134 ****/
		%feature("compactdefaultargs") GetGradientBackground;
		%feature("autodoc", "Returns the gradient background of the view.

Returns
-------
Aspect_GradientBackground
") GetGradientBackground;
		const Aspect_GradientBackground & GetGradientBackground();

		/****************** Grid ******************/
		/**** md5 signature: 0b328bc7e0dbb5bbec734058a8a9d7ef ****/
		%feature("compactdefaultargs") Grid;
		%feature("autodoc", "Returns the defined grid in <self>.

Returns
-------
opencascade::handle<Aspect_Grid>
") Grid;
		opencascade::handle<Aspect_Grid> Grid();

		/****************** GridDrawMode ******************/
		/**** md5 signature: 7caebe8f5a319f1a85b12c8cf075c731 ****/
		%feature("compactdefaultargs") GridDrawMode;
		%feature("autodoc", "Returns the current grid draw mode defined in <self>.

Returns
-------
Aspect_GridDrawMode
") GridDrawMode;
		Aspect_GridDrawMode GridDrawMode();

		/****************** GridEcho ******************/
		/**** md5 signature: 1b69a303effcf89fe06726c625c4cc4c ****/
		%feature("compactdefaultargs") GridEcho;
		%feature("autodoc", "Returns true when grid echo must be displayed at hit point.

Returns
-------
bool
") GridEcho;
		Standard_Boolean GridEcho();

		/****************** GridType ******************/
		/**** md5 signature: 72f8fd3c464adaef4a56774e6ded87c4 ****/
		%feature("compactdefaultargs") GridType;
		%feature("autodoc", "Returns the current grid type defined in <self>.

Returns
-------
Aspect_GridType
") GridType;
		Aspect_GridType GridType();

		/****************** HideGridEcho ******************/
		/**** md5 signature: 558d06cdf268d39310448dbab8807228 ****/
		%feature("compactdefaultargs") HideGridEcho;
		%feature("autodoc", "Temporarly hide grid echo.

Parameters
----------
theView: V3d_View

Returns
-------
None
") HideGridEcho;
		void HideGridEcho(const opencascade::handle<V3d_View> & theView);

		/****************** IfMoreViews ******************/
		/**** md5 signature: d9e95d11fc8bbb3ead2a51876583845d ****/
		%feature("compactdefaultargs") IfMoreViews;
		%feature("autodoc", "Returns true if one view more can be defined in this viewer.

Returns
-------
bool
") IfMoreViews;
		Standard_Boolean IfMoreViews();

		/****************** InitActiveLights ******************/
		/**** md5 signature: 96e937460d9e6ec0513824da2242388a ****/
		%feature("compactdefaultargs") InitActiveLights;
		%feature("autodoc", "Initializes an internal iteratator on the active lights.

Returns
-------
None
") InitActiveLights;
		void InitActiveLights();

		/****************** InitActiveViews ******************/
		/**** md5 signature: 0f5b161970cd030f134b8d163838b783 ****/
		%feature("compactdefaultargs") InitActiveViews;
		%feature("autodoc", "Initializes an internal iterator on the active views.

Returns
-------
None
") InitActiveViews;
		void InitActiveViews();

		/****************** InitDefinedLights ******************/
		/**** md5 signature: 09547c8701701afe8b71255794d46d60 ****/
		%feature("compactdefaultargs") InitDefinedLights;
		%feature("autodoc", "Initializes an internal iterattor on the defined lights.

Returns
-------
None
") InitDefinedLights;
		void InitDefinedLights();

		/****************** InitDefinedViews ******************/
		/**** md5 signature: 79e4140021518f570d3fe89c6d853005 ****/
		%feature("compactdefaultargs") InitDefinedViews;
		%feature("autodoc", "Initializes an internal iterator on the defined views.

Returns
-------
None
") InitDefinedViews;
		void InitDefinedViews();

		/****************** InsertLayerAfter ******************/
		/**** md5 signature: cdb5f8a68553c8e85ea4b1393d7b6ef3 ****/
		%feature("compactdefaultargs") InsertLayerAfter;
		%feature("autodoc", "Add a new top-level z layer to all managed views and get its id as <thelayerid> value. the z layers are controlled entirely by viewer, it is not possible to add a layer to a particular view. layer rendering order is defined by its position in list (altered by thelayerafter) and isimmediate() flag (all layers with isimmediate() flag are drawn afterwards); @param thenewlayerid [out] id of created layer; layer id is arbitrary and does not depend on layer position in the list @param thesettings [in] new layer settings @param thelayerbefore [in] id of layer to append new layer after returns false if the layer can not be created.

Parameters
----------
theNewLayerId: int OutValue
theSettings: Graphic3d_ZLayerSettings
theLayerBefore: int

Returns
-------
bool
") InsertLayerAfter;
		Standard_Boolean InsertLayerAfter(Standard_Integer &OutValue, const Graphic3d_ZLayerSettings & theSettings, int theLayerBefore);

		/****************** InsertLayerBefore ******************/
		/**** md5 signature: 3872bc120c665802f8ae7baae08f463c ****/
		%feature("compactdefaultargs") InsertLayerBefore;
		%feature("autodoc", "Add a new top-level z layer to all managed views and get its id as <thelayerid> value. the z layers are controlled entirely by viewer, it is not possible to add a layer to a particular view. layer rendering order is defined by its position in list (altered by thelayerafter) and isimmediate() flag (all layers with isimmediate() flag are drawn afterwards); @param thenewlayerid [out] id of created layer; layer id is arbitrary and does not depend on layer position in the list @param thesettings [in] new layer settings @param thelayerafter [in] id of layer to append new layer before returns false if the layer can not be created.

Parameters
----------
theNewLayerId: int OutValue
theSettings: Graphic3d_ZLayerSettings
theLayerAfter: int

Returns
-------
bool
") InsertLayerBefore;
		Standard_Boolean InsertLayerBefore(Standard_Integer &OutValue, const Graphic3d_ZLayerSettings & theSettings, int theLayerAfter);

		/****************** Invalidate ******************/
		/**** md5 signature: 0ab0e2c678e575a4d179bf46b4d4d469 ****/
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "Invalidates viewer content but does not redraw it.

Returns
-------
None
") Invalidate;
		void Invalidate();

		/****************** IsActive ******************/
		/**** md5 signature: 476abafc82a8bb87ac904f5a77e179a3 ****/
		%feature("compactdefaultargs") IsActive;
		%feature("autodoc", "Returns standard_true if a grid is activated in <self>.

Returns
-------
bool
") IsActive;
		Standard_Boolean IsActive();

		/****************** IsGlobalLight ******************/
		/**** md5 signature: 77d05c02fd1db57bf7e317a6f2ceae3a ****/
		%feature("compactdefaultargs") IsGlobalLight;
		%feature("autodoc", "No available documentation.

Parameters
----------
TheLight: V3d_Light

Returns
-------
bool
") IsGlobalLight;
		Standard_Boolean IsGlobalLight(const opencascade::handle<V3d_Light> & TheLight);

		/****************** LastActiveView ******************/
		/**** md5 signature: be5a39647b88665478a02d7cd3674cb7 ****/
		%feature("compactdefaultargs") LastActiveView;
		%feature("autodoc", "Returns true if there is only one active view.

Returns
-------
bool
") LastActiveView;
		Standard_Boolean LastActiveView();

		/****************** MoreActiveLights ******************/
		/**** md5 signature: 159743d840ad62ed3830acf9e90ae539 ****/
		%feature("compactdefaultargs") MoreActiveLights;
		%feature("autodoc", "Returns true if there are more active light(s) to return.

Returns
-------
bool
") MoreActiveLights;
		Standard_Boolean MoreActiveLights();

		/****************** MoreActiveViews ******************/
		/**** md5 signature: 59d67bac74721d905de58b553fe9996c ****/
		%feature("compactdefaultargs") MoreActiveViews;
		%feature("autodoc", "Returns true if there are more active view(s) to return.

Returns
-------
bool
") MoreActiveViews;
		Standard_Boolean MoreActiveViews();

		/****************** MoreDefinedLights ******************/
		/**** md5 signature: de453e5d448bec792bce0fe4445da325 ****/
		%feature("compactdefaultargs") MoreDefinedLights;
		%feature("autodoc", "Returns true if there are more defined light(s) to return.

Returns
-------
bool
") MoreDefinedLights;
		Standard_Boolean MoreDefinedLights();

		/****************** MoreDefinedViews ******************/
		/**** md5 signature: 8307d307b155b516c3b1a54d7b96da53 ****/
		%feature("compactdefaultargs") MoreDefinedViews;
		%feature("autodoc", "Returns true if there are more defined view(s) to return.

Returns
-------
bool
") MoreDefinedViews;
		Standard_Boolean MoreDefinedViews();

		/****************** NextActiveLights ******************/
		/**** md5 signature: 221700382f0fef8d1ac7d43635ea1bc5 ****/
		%feature("compactdefaultargs") NextActiveLights;
		%feature("autodoc", "Go to the next active light (if there is not, activelight() will raise an exception).

Returns
-------
None
") NextActiveLights;
		void NextActiveLights();

		/****************** NextActiveViews ******************/
		/**** md5 signature: 0477b4c7cc74b63505395536664807d2 ****/
		%feature("compactdefaultargs") NextActiveViews;
		%feature("autodoc", "Go to the next active view (if there is not, activeview will raise an exception).

Returns
-------
None
") NextActiveViews;
		void NextActiveViews();

		/****************** NextDefinedLights ******************/
		/**** md5 signature: b6ccc487d14c8d8d99ba23bb34021630 ****/
		%feature("compactdefaultargs") NextDefinedLights;
		%feature("autodoc", "Go to the next defined light (if there is not, definedlight() will raise an exception).

Returns
-------
None
") NextDefinedLights;
		void NextDefinedLights();

		/****************** NextDefinedViews ******************/
		/**** md5 signature: d2b2e84e421362ae989de89fff66d208 ****/
		%feature("compactdefaultargs") NextDefinedViews;
		%feature("autodoc", "Go to the next defined view (if there is not, definedview will raise an exception).

Returns
-------
None
") NextDefinedViews;
		void NextDefinedViews();

		/****************** PrivilegedPlane ******************/
		/**** md5 signature: 5dfdae9a994a6d00bba77273741a9e43 ****/
		%feature("compactdefaultargs") PrivilegedPlane;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Ax3
") PrivilegedPlane;
		const gp_Ax3 PrivilegedPlane();

		/****************** RectangularGridGraphicValues ******************/
		/**** md5 signature: 4e5826fa16eec33df789f200ebe67385 ****/
		%feature("compactdefaultargs") RectangularGridGraphicValues;
		%feature("autodoc", "Returns the location and the size of the grid.

Parameters
----------

Returns
-------
XSize: float
YSize: float
OffSet: float
") RectangularGridGraphicValues;
		void RectangularGridGraphicValues(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** RectangularGridValues ******************/
		/**** md5 signature: 2b1ae335b7ffea8303765d8655a5b47c ****/
		%feature("compactdefaultargs") RectangularGridValues;
		%feature("autodoc", "Returns the definition of the rectangular grid.

Parameters
----------

Returns
-------
XOrigin: float
YOrigin: float
XStep: float
YStep: float
RotationAngle: float
") RectangularGridValues;
		void RectangularGridValues(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Redraw ******************/
		/**** md5 signature: 0dcadf2fbf820babd41e765f73c51c9a ****/
		%feature("compactdefaultargs") Redraw;
		%feature("autodoc", "Redraws all the views of the viewer even if no modification has taken place. must be called if all the views of the viewer are exposed, as for example in a global deiconification.

Returns
-------
None
") Redraw;
		void Redraw();

		/****************** RedrawImmediate ******************/
		/**** md5 signature: 9f886ca53b0e4577db3b4ac8db079007 ****/
		%feature("compactdefaultargs") RedrawImmediate;
		%feature("autodoc", "Updates layer of immediate presentations.

Returns
-------
None
") RedrawImmediate;
		void RedrawImmediate();

		/****************** Remove ******************/
		/**** md5 signature: 0346504d7ac570fc8960fb72d5ad5f20 ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Suppresses the viewer.

Returns
-------
None
") Remove;
		void Remove();

		/****************** RemoveZLayer ******************/
		/**** md5 signature: 1a28f0b7cdff8987fcb6dd2d11797a2b ****/
		%feature("compactdefaultargs") RemoveZLayer;
		%feature("autodoc", "Remove z layer with id <thelayerid>. method returns standard_false if the layer can not be removed or doesn't exists. by default, there are always default bottom-level layer that can't be removed.

Parameters
----------
theLayerId: int

Returns
-------
bool
") RemoveZLayer;
		Standard_Boolean RemoveZLayer(int theLayerId);

		/****************** SetCircularGridGraphicValues ******************/
		/**** md5 signature: b67e0720f326efd720f20465738385e5 ****/
		%feature("compactdefaultargs") SetCircularGridGraphicValues;
		%feature("autodoc", "Sets the location and the size of the grid. <xsize> defines the width of the grid. <ysize> defines the height of the grid. <offset> defines the displacement along the plane normal.

Parameters
----------
Radius: float
OffSet: float

Returns
-------
None
") SetCircularGridGraphicValues;
		void SetCircularGridGraphicValues(const Standard_Real Radius, const Standard_Real OffSet);

		/****************** SetCircularGridValues ******************/
		/**** md5 signature: a18bcc242107e159b166d07e24c9ede7 ****/
		%feature("compactdefaultargs") SetCircularGridValues;
		%feature("autodoc", "Sets the definition of the circular grid. <xorigin>, <yorigin> defines the origin of the grid. <radiusstep> defines the interval between 2 circles. <divisionnumber> defines the section number of one half circle. <rotationangle> defines the rotation angle of the grid.

Parameters
----------
XOrigin: float
YOrigin: float
RadiusStep: float
DivisionNumber: int
RotationAngle: float

Returns
-------
None
") SetCircularGridValues;
		void SetCircularGridValues(const Standard_Real XOrigin, const Standard_Real YOrigin, const Standard_Real RadiusStep, const Standard_Integer DivisionNumber, const Standard_Real RotationAngle);

		/****************** SetComputedMode ******************/
		/**** md5 signature: 43253006c9d2e7ee262337de8f5a72b3 ****/
		%feature("compactdefaultargs") SetComputedMode;
		%feature("autodoc", "Set if the computed mode can be used.

Parameters
----------
theMode: bool

Returns
-------
None
") SetComputedMode;
		void SetComputedMode(const Standard_Boolean theMode);

		/****************** SetDefaultBackgroundColor ******************/
		/**** md5 signature: 29f198cc43c26304a2fe19b0a4e5c4b3 ****/
		%feature("compactdefaultargs") SetDefaultBackgroundColor;
		%feature("autodoc", "Defines the default background colour of views attached to the viewer by supplying the color object.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetDefaultBackgroundColor;
		void SetDefaultBackgroundColor(const Quantity_Color & theColor);

		/****************** SetDefaultBackgroundColor ******************/
		/**** md5 signature: 3d5447c6691b23a4e614313dff25a68b ****/
		%feature("compactdefaultargs") SetDefaultBackgroundColor;
		%feature("autodoc", "Defines the default base colour of views attached to the viewer by supplying the type of colour definition and the three component values.

Parameters
----------
theType: Quantity_TypeOfColor
theV1: float
theV2: float
theV3: float

Returns
-------
None
") SetDefaultBackgroundColor;
		void SetDefaultBackgroundColor(const Quantity_TypeOfColor theType, const Standard_Real theV1, const Standard_Real theV2, const Standard_Real theV3);

		/****************** SetDefaultBgGradientColors ******************/
		/**** md5 signature: 238fa80e1f14e34bed78f1afa04572d6 ****/
		%feature("compactdefaultargs") SetDefaultBgGradientColors;
		%feature("autodoc", "Defines the default gradient background colours of views attached to the viewer by supplying the colour objects.

Parameters
----------
theColor1: Quantity_Color
theColor2: Quantity_Color
theFillStyle: Aspect_GradientFillMethod,optional
	default value is Aspect_GFM_HOR

Returns
-------
None
") SetDefaultBgGradientColors;
		void SetDefaultBgGradientColors(const Quantity_Color & theColor1, const Quantity_Color & theColor2, const Aspect_GradientFillMethod theFillStyle = Aspect_GFM_HOR);

		/****************** SetDefaultComputedMode ******************/
		/**** md5 signature: c46a840bb2514935564839772e61e616 ****/
		%feature("compactdefaultargs") SetDefaultComputedMode;
		%feature("autodoc", "Set if by default the computed mode must be used.

Parameters
----------
theMode: bool

Returns
-------
None
") SetDefaultComputedMode;
		void SetDefaultComputedMode(const Standard_Boolean theMode);

		/****************** SetDefaultLights ******************/
		/**** md5 signature: b4a267b5dfce1e27f8107f3e4fa518ca ****/
		%feature("compactdefaultargs") SetDefaultLights;
		%feature("autodoc", "Defines default lights: positional-light 0.3 0. 0. directional-light v3d_xnegyposzpos directional-light v3d_xnegyneg ambient-light.

Returns
-------
None
") SetDefaultLights;
		void SetDefaultLights();

		/****************** SetDefaultRenderingParams ******************/
		/**** md5 signature: c5a40a336e471133b7be9683980255cb ****/
		%feature("compactdefaultargs") SetDefaultRenderingParams;
		%feature("autodoc", "Set default rendering parameters.

Parameters
----------
theParams: Graphic3d_RenderingParams

Returns
-------
None
") SetDefaultRenderingParams;
		void SetDefaultRenderingParams(const Graphic3d_RenderingParams & theParams);

		/****************** SetDefaultShadingModel ******************/
		/**** md5 signature: 2040e22386553d82560b0da60ee0c433 ****/
		%feature("compactdefaultargs") SetDefaultShadingModel;
		%feature("autodoc", "Gives the default type of shading.

Parameters
----------
theType: Graphic3d_TypeOfShadingModel

Returns
-------
None
") SetDefaultShadingModel;
		void SetDefaultShadingModel(const Graphic3d_TypeOfShadingModel theType);

		/****************** SetDefaultTypeOfView ******************/
		/**** md5 signature: 638bd84702f3a810edc2e84dff3514c2 ****/
		%feature("compactdefaultargs") SetDefaultTypeOfView;
		%feature("autodoc", "Set the default type of view (orthographic or perspective projection) to be returned by createview() method.

Parameters
----------
theType: V3d_TypeOfView

Returns
-------
None
") SetDefaultTypeOfView;
		void SetDefaultTypeOfView(const V3d_TypeOfView theType);

		/****************** SetDefaultViewProj ******************/
		/**** md5 signature: e15677a0e533d3aa67369e724923fd97 ****/
		%feature("compactdefaultargs") SetDefaultViewProj;
		%feature("autodoc", "Sets the default projection for creating views in the viewer.

Parameters
----------
theOrientation: V3d_TypeOfOrientation

Returns
-------
None
") SetDefaultViewProj;
		void SetDefaultViewProj(const V3d_TypeOfOrientation theOrientation);

		/****************** SetDefaultViewSize ******************/
		/**** md5 signature: d923eab190c632f0ff798b9c43517c47 ****/
		%feature("compactdefaultargs") SetDefaultViewSize;
		%feature("autodoc", "Gives a default size for the creation of views of the viewer.

Parameters
----------
theSize: float

Returns
-------
None
") SetDefaultViewSize;
		void SetDefaultViewSize(const Standard_Real theSize);

		/****************** SetDefaultVisualization ******************/
		/**** md5 signature: bccd9278c0b886d0c7b17c77f3c6c214 ****/
		%feature("compactdefaultargs") SetDefaultVisualization;
		%feature("autodoc", "Gives the default visualization mode.

Parameters
----------
theType: V3d_TypeOfVisualization

Returns
-------
None
") SetDefaultVisualization;
		void SetDefaultVisualization(const V3d_TypeOfVisualization theType);

		/****************** SetGridEcho ******************/
		/**** md5 signature: 705d6f6f11c80fa56180ba59c810633e ****/
		%feature("compactdefaultargs") SetGridEcho;
		%feature("autodoc", "Show/don't show grid echo to the hit point. if true,the grid echo will be shown at converttogrid() time.

Parameters
----------
showGrid: bool,optional
	default value is Standard_True

Returns
-------
None
") SetGridEcho;
		void SetGridEcho(const Standard_Boolean showGrid = Standard_True);

		/****************** SetGridEcho ******************/
		/**** md5 signature: 6be327c84c0ec063c637061469c58526 ****/
		%feature("compactdefaultargs") SetGridEcho;
		%feature("autodoc", "Show grid echo <amarker> to the hit point. warning: when the grid echo marker is not set, a default marker is build with the attributes: marker type : aspect_tom_star marker color : quantity_noc_gray90 marker size : 3.0.

Parameters
----------
aMarker: Graphic3d_AspectMarker3d

Returns
-------
None
") SetGridEcho;
		void SetGridEcho(const opencascade::handle<Graphic3d_AspectMarker3d> & aMarker);

		/****************** SetLightOff ******************/
		/**** md5 signature: 455cedd8ba3c305764630cd94d4a9d57 ****/
		%feature("compactdefaultargs") SetLightOff;
		%feature("autodoc", "Deactivates mylight in this viewer.

Parameters
----------
theLight: V3d_Light

Returns
-------
None
") SetLightOff;
		void SetLightOff(const opencascade::handle<V3d_Light> & theLight);

		/****************** SetLightOff ******************/
		/**** md5 signature: bf38107f690adbb6b0f411e0bf63da48 ****/
		%feature("compactdefaultargs") SetLightOff;
		%feature("autodoc", "Deactivate all the lights defined in this viewer.

Returns
-------
None
") SetLightOff;
		void SetLightOff();

		/****************** SetLightOn ******************/
		/**** md5 signature: d1efc51d1bc7b893aa6cd272504c6805 ****/
		%feature("compactdefaultargs") SetLightOn;
		%feature("autodoc", "Activates mylight in the viewer.

Parameters
----------
theLight: V3d_Light

Returns
-------
None
") SetLightOn;
		void SetLightOn(const opencascade::handle<V3d_Light> & theLight);

		/****************** SetLightOn ******************/
		/**** md5 signature: 0dbd37321a0295b614d3d0d9cd0a3fe9 ****/
		%feature("compactdefaultargs") SetLightOn;
		%feature("autodoc", "Activates all the lights defined in this viewer.

Returns
-------
None
") SetLightOn;
		void SetLightOn();

		/****************** SetPrivilegedPlane ******************/
		/**** md5 signature: db95ed58bc82785957aa80274e7caa6a ****/
		%feature("compactdefaultargs") SetPrivilegedPlane;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePlane: gp_Ax3

Returns
-------
None
") SetPrivilegedPlane;
		void SetPrivilegedPlane(const gp_Ax3 & thePlane);

		/****************** SetRectangularGridGraphicValues ******************/
		/**** md5 signature: fb9211cf5c9af2162da6e9308ad8eac6 ****/
		%feature("compactdefaultargs") SetRectangularGridGraphicValues;
		%feature("autodoc", "Sets the location and the size of the grid. <xsize> defines the width of the grid. <ysize> defines the height of the grid. <offset> defines the displacement along the plane normal.

Parameters
----------
XSize: float
YSize: float
OffSet: float

Returns
-------
None
") SetRectangularGridGraphicValues;
		void SetRectangularGridGraphicValues(const Standard_Real XSize, const Standard_Real YSize, const Standard_Real OffSet);

		/****************** SetRectangularGridValues ******************/
		/**** md5 signature: 97300a084d66505155684775481f80e9 ****/
		%feature("compactdefaultargs") SetRectangularGridValues;
		%feature("autodoc", "Sets the definition of the rectangular grid. <xorigin>, <yorigin> defines the origin of the grid. <xstep> defines the interval between 2 vertical lines. <ystep> defines the interval between 2 horizontal lines. <rotationangle> defines the rotation angle of the grid.

Parameters
----------
XOrigin: float
YOrigin: float
XStep: float
YStep: float
RotationAngle: float

Returns
-------
None
") SetRectangularGridValues;
		void SetRectangularGridValues(const Standard_Real XOrigin, const Standard_Real YOrigin, const Standard_Real XStep, const Standard_Real YStep, const Standard_Real RotationAngle);

		/****************** SetViewOff ******************/
		/**** md5 signature: 1768aaae0afe897b5be0a8ca96ab5e6a ****/
		%feature("compactdefaultargs") SetViewOff;
		%feature("autodoc", "Deactivates all the views of a viewer attached to a window.

Returns
-------
None
") SetViewOff;
		void SetViewOff();

		/****************** SetViewOff ******************/
		/**** md5 signature: 45f41338fdf12e819a5c1f0eabb24945 ****/
		%feature("compactdefaultargs") SetViewOff;
		%feature("autodoc", "Deactivates a particular view in the viewer. must be call if the window attached to the view has been iconified .

Parameters
----------
theView: V3d_View

Returns
-------
None
") SetViewOff;
		void SetViewOff(const opencascade::handle<V3d_View> & theView);

		/****************** SetViewOn ******************/
		/**** md5 signature: 72744c1ad7386c470c494aa21d694cd5 ****/
		%feature("compactdefaultargs") SetViewOn;
		%feature("autodoc", "Activates all of the views of a viewer attached to a window.

Returns
-------
None
") SetViewOn;
		void SetViewOn();

		/****************** SetViewOn ******************/
		/**** md5 signature: 2fd6e682d9d9250378de51173ccf4996 ****/
		%feature("compactdefaultargs") SetViewOn;
		%feature("autodoc", "Activates a particular view in the viewer. must be call if the window attached to the view has been deiconified.

Parameters
----------
theView: V3d_View

Returns
-------
None
") SetViewOn;
		void SetViewOn(const opencascade::handle<V3d_View> & theView);

		/****************** SetZLayerSettings ******************/
		/**** md5 signature: ac44dbb93e4d8146369b6dce06071238 ****/
		%feature("compactdefaultargs") SetZLayerSettings;
		%feature("autodoc", "Sets the settings for a single z layer.

Parameters
----------
theLayerId: int
theSettings: Graphic3d_ZLayerSettings

Returns
-------
None
") SetZLayerSettings;
		void SetZLayerSettings(int theLayerId, const Graphic3d_ZLayerSettings & theSettings);

		/****************** ShowGridEcho ******************/
		/**** md5 signature: 79d60993c95eee3cd99815e76cd78fc2 ****/
		%feature("compactdefaultargs") ShowGridEcho;
		%feature("autodoc", "Display grid echo at requested point in the view.

Parameters
----------
theView: V3d_View
thePoint: Graphic3d_Vertex

Returns
-------
None
") ShowGridEcho;
		void ShowGridEcho(const opencascade::handle<V3d_View> & theView, const Graphic3d_Vertex & thePoint);

		/****************** StructureManager ******************/
		/**** md5 signature: 632b257b8f511bc5e6448d14470b491d ****/
		%feature("compactdefaultargs") StructureManager;
		%feature("autodoc", "Returns the structure manager associated to this viewer.

Returns
-------
opencascade::handle<Graphic3d_StructureManager>
") StructureManager;
		opencascade::handle<Graphic3d_StructureManager> StructureManager();

		/****************** UnHighlight ******************/
		/**** md5 signature: ff54423c40126b023ea779ec43b4ac64 ****/
		%feature("compactdefaultargs") UnHighlight;
		%feature("autodoc", "Unhighlight all objects in all the views.

Returns
-------
None
") UnHighlight;
		void UnHighlight();

		/****************** Update ******************/
		/**** md5 signature: 01ee7c04045625b8b5410511d5645d3d ****/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Deprecated, redraw() should be used instead.

Returns
-------
None
") Update;
		void Update();

		/****************** UpdateLights ******************/
		/**** md5 signature: 3715089476809c2ac92c40c50be2ca20 ****/
		%feature("compactdefaultargs") UpdateLights;
		%feature("autodoc", "Updates the lights of all the views of a viewer.

Returns
-------
None
") UpdateLights;
		void UpdateLights();

		/****************** ZLayerSettings ******************/
		/**** md5 signature: 9c0de646b59df9fdf459d78e51b824ee ****/
		%feature("compactdefaultargs") ZLayerSettings;
		%feature("autodoc", "Returns the settings of a single z layer.

Parameters
----------
theLayerId: int

Returns
-------
Graphic3d_ZLayerSettings
") ZLayerSettings;
		const Graphic3d_ZLayerSettings & ZLayerSettings(int theLayerId);

};


%make_alias(V3d_Viewer)

%extend V3d_Viewer {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Print(self):
		pass
	}
};

/*****************************
* class V3d_DirectionalLight *
*****************************/
class V3d_DirectionalLight : public V3d_PositionLight {
	public:
		/****************** V3d_DirectionalLight ******************/
		/**** md5 signature: 0a7b98fd806efa175a6bd73f746c107d ****/
		%feature("compactdefaultargs") V3d_DirectionalLight;
		%feature("autodoc", "Creates a directional light source in the viewer.

Parameters
----------
theDirection: V3d_TypeOfOrientation,optional
	default value is V3d_XposYposZpos
theColor: Quantity_Color,optional
	default value is Quantity_NOC_WHITE
theIsHeadlight: bool,optional
	default value is Standard_False

Returns
-------
None
") V3d_DirectionalLight;
		 V3d_DirectionalLight(const V3d_TypeOfOrientation theDirection = V3d_XposYposZpos, const Quantity_Color & theColor = Quantity_NOC_WHITE, const Standard_Boolean theIsHeadlight = Standard_False);

		/****************** V3d_DirectionalLight ******************/
		/**** md5 signature: a924d2e44febaa27eb11500ba941c454 ****/
		%feature("compactdefaultargs") V3d_DirectionalLight;
		%feature("autodoc", "Creates a directional light source in the viewer.

Parameters
----------
theDirection: gp_Dir
theColor: Quantity_Color,optional
	default value is Quantity_NOC_WHITE
theIsHeadlight: bool,optional
	default value is Standard_False

Returns
-------
None
") V3d_DirectionalLight;
		 V3d_DirectionalLight(const gp_Dir & theDirection, const Quantity_Color & theColor = Quantity_NOC_WHITE, const Standard_Boolean theIsHeadlight = Standard_False);

		/****************** V3d_DirectionalLight ******************/
		/**** md5 signature: c576b894741b8da21a8ce92fda9aac77 ****/
		%feature("compactdefaultargs") V3d_DirectionalLight;
		%feature("autodoc", "No available documentation.

Parameters
----------
theViewer: V3d_Viewer
theDirection: V3d_TypeOfOrientation,optional
	default value is V3d_XposYposZpos
theColor: Quantity_Color,optional
	default value is Quantity_NOC_WHITE
theIsHeadlight: bool,optional
	default value is Standard_False

Returns
-------
None
") V3d_DirectionalLight;
		 V3d_DirectionalLight(const opencascade::handle<V3d_Viewer> & theViewer, const V3d_TypeOfOrientation theDirection = V3d_XposYposZpos, const Quantity_Color & theColor = Quantity_NOC_WHITE, const Standard_Boolean theIsHeadlight = Standard_False);

		/****************** V3d_DirectionalLight ******************/
		/**** md5 signature: f22fa6c151547559d041daa54095c5db ****/
		%feature("compactdefaultargs") V3d_DirectionalLight;
		%feature("autodoc", "Creates a directional light source in the viewer. thext, theyt, thezt : coordinate of light source target. thexp, theyp, thezp : coordinate of light source position. the others parameters describe before.

Parameters
----------
theViewer: V3d_Viewer
theXt: float
theYt: float
theZt: float
theXp: float
theYp: float
theZp: float
theColor: Quantity_Color,optional
	default value is Quantity_NOC_WHITE
theIsHeadlight: bool,optional
	default value is Standard_False

Returns
-------
None
") V3d_DirectionalLight;
		 V3d_DirectionalLight(const opencascade::handle<V3d_Viewer> & theViewer, const Standard_Real theXt, const Standard_Real theYt, const Standard_Real theZt, const Standard_Real theXp, const Standard_Real theYp, const Standard_Real theZp, const Quantity_Color & theColor = Quantity_NOC_WHITE, const Standard_Boolean theIsHeadlight = Standard_False);

		/****************** SetDirection ******************/
		/**** md5 signature: 68f1a2f19e61e004b66a3eaf73e51686 ****/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "Defines the direction of the light source by a predefined orientation.

Parameters
----------
theDirection: V3d_TypeOfOrientation

Returns
-------
None
") SetDirection;
		void SetDirection(V3d_TypeOfOrientation theDirection);

};


%make_alias(V3d_DirectionalLight)

%extend V3d_DirectionalLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class V3d_PositionalLight *
****************************/
class V3d_PositionalLight : public V3d_PositionLight {
	public:
		/****************** V3d_PositionalLight ******************/
		/**** md5 signature: fd975c884e6e023ed79d1a3a49118ffe ****/
		%feature("compactdefaultargs") V3d_PositionalLight;
		%feature("autodoc", "Creates an isolated light source in the viewer with default attenuation factors (1.0, 0.0).

Parameters
----------
thePos: gp_Pnt
theColor: Quantity_Color,optional
	default value is Quantity_NOC_WHITE

Returns
-------
None
") V3d_PositionalLight;
		 V3d_PositionalLight(const gp_Pnt & thePos, const Quantity_Color & theColor = Quantity_NOC_WHITE);

		/****************** V3d_PositionalLight ******************/
		/**** md5 signature: f3f903689b3f3be882fa68b5819e17db ****/
		%feature("compactdefaultargs") V3d_PositionalLight;
		%feature("autodoc", "No available documentation.

Parameters
----------
theViewer: V3d_Viewer
theX: float
theY: float
theZ: float
theColor: Quantity_Color,optional
	default value is Quantity_NOC_WHITE
theConstAttenuation: float,optional
	default value is 1.0
theLinearAttenuation: float,optional
	default value is 0.0

Returns
-------
None
") V3d_PositionalLight;
		 V3d_PositionalLight(const opencascade::handle<V3d_Viewer> & theViewer, const Standard_Real theX, const Standard_Real theY, const Standard_Real theZ, const Quantity_Color & theColor = Quantity_NOC_WHITE, const Standard_Real theConstAttenuation = 1.0, const Standard_Real theLinearAttenuation = 0.0);

};


%make_alias(V3d_PositionalLight)

%extend V3d_PositionalLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class V3d_SpotLight *
**********************/
class V3d_SpotLight : public V3d_PositionLight {
	public:
		/****************** V3d_SpotLight ******************/
		/**** md5 signature: 897223a5e21849af53eadd79143ba6ea ****/
		%feature("compactdefaultargs") V3d_SpotLight;
		%feature("autodoc", "Creates a light source of the spot type in the viewer with default attenuation factors (1.0, 0.0), concentration factor 1.0 and spot angle 30 degrees.

Parameters
----------
thePos: gp_Pnt
theDirection: V3d_TypeOfOrientation,optional
	default value is V3d_XnegYnegZpos
theColor: Quantity_Color,optional
	default value is Quantity_NOC_WHITE

Returns
-------
None
") V3d_SpotLight;
		 V3d_SpotLight(const gp_Pnt & thePos, const V3d_TypeOfOrientation theDirection = V3d_XnegYnegZpos, const Quantity_Color & theColor = Quantity_NOC_WHITE);

		/****************** V3d_SpotLight ******************/
		/**** md5 signature: d6ff11b2eaba1d3ba0f9c7bacac83a04 ****/
		%feature("compactdefaultargs") V3d_SpotLight;
		%feature("autodoc", "Creates a light source of the spot type in the viewer with default attenuation factors (1.0, 0.0), concentration factor 1.0 and spot angle 30 degrees.

Parameters
----------
thePos: gp_Pnt
theDirection: gp_Dir
theColor: Quantity_Color,optional
	default value is Quantity_NOC_WHITE

Returns
-------
None
") V3d_SpotLight;
		 V3d_SpotLight(const gp_Pnt & thePos, const gp_Dir & theDirection, const Quantity_Color & theColor = Quantity_NOC_WHITE);

		/****************** V3d_SpotLight ******************/
		/**** md5 signature: 282f86aea260cdb925b753db9b900371 ****/
		%feature("compactdefaultargs") V3d_SpotLight;
		%feature("autodoc", "No available documentation.

Parameters
----------
theViewer: V3d_Viewer
theX: float
theY: float
theZ: float
theDirection: V3d_TypeOfOrientation,optional
	default value is V3d_XnegYnegZpos
theColor: Quantity_Color,optional
	default value is Quantity_NOC_WHITE
theConstAttenuation: float,optional
	default value is 1.0
theLinearAttenuation: float,optional
	default value is 0.0
theConcentration: float,optional
	default value is 1.0
theAngle: float,optional
	default value is 0.523599

Returns
-------
None
") V3d_SpotLight;
		 V3d_SpotLight(const opencascade::handle<V3d_Viewer> & theViewer, const Standard_Real theX, const Standard_Real theY, const Standard_Real theZ, const V3d_TypeOfOrientation theDirection = V3d_XnegYnegZpos, const Quantity_Color & theColor = Quantity_NOC_WHITE, const Standard_Real theConstAttenuation = 1.0, const Standard_Real theLinearAttenuation = 0.0, const Standard_Real theConcentration = 1.0, const Standard_Real theAngle = 0.523599);

		/****************** V3d_SpotLight ******************/
		/**** md5 signature: ecfce74918977e746d8d0cff10e18e1f ****/
		%feature("compactdefaultargs") V3d_SpotLight;
		%feature("autodoc", "Thext, theyt, thezt : coordinate of light source target. thexp, theyp, thezp : coordinate of light source position.

Parameters
----------
theViewer: V3d_Viewer
theXt: float
theYt: float
theZt: float
theXp: float
theYp: float
theZp: float
theColor: Quantity_Color,optional
	default value is Quantity_NOC_WHITE
theConstAttenuation: float,optional
	default value is 1.0
theLinearAttenuation: float,optional
	default value is 0.0
theConcentration: float,optional
	default value is 1.0
theAngle: float,optional
	default value is 0.523599

Returns
-------
None
") V3d_SpotLight;
		 V3d_SpotLight(const opencascade::handle<V3d_Viewer> & theViewer, const Standard_Real theXt, const Standard_Real theYt, const Standard_Real theZt, const Standard_Real theXp, const Standard_Real theYp, const Standard_Real theZp, const Quantity_Color & theColor = Quantity_NOC_WHITE, const Standard_Real theConstAttenuation = 1.0, const Standard_Real theLinearAttenuation = 0.0, const Standard_Real theConcentration = 1.0, const Standard_Real theAngle = 0.523599);

		/****************** SetDirection ******************/
		/**** md5 signature: ec761b79b1038a9b23500884194f62d9 ****/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "Defines the direction of the light source according to a predefined directional vector.

Parameters
----------
theOrientation: V3d_TypeOfOrientation

Returns
-------
None
") SetDirection;
		void SetDirection(V3d_TypeOfOrientation theOrientation);

};


%make_alias(V3d_SpotLight)

%extend V3d_SpotLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
