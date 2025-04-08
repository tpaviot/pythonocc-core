/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_v3d.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<V3d_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Graphic3d_module.hxx>
#include<gp_module.hxx>
#include<Quantity_module.hxx>
#include<Aspect_module.hxx>
#include<Prs3d_module.hxx>
#include<TCollection_module.hxx>
#include<TColStd_module.hxx>
#include<Bnd_module.hxx>
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
%import Prs3d.i
%import TCollection.i
%import TColStd.i
%import Bnd.i
%import Image.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum V3d_StereoDumpOptions {
	V3d_SDO_MONO = 0,
	V3d_SDO_LEFT_EYE = 1,
	V3d_SDO_RIGHT_EYE = 2,
	V3d_SDO_BLENDED = 3,
};

enum V3d_TypeOfAxe {
	V3d_X = 0,
	V3d_Y = 1,
	V3d_Z = 2,
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

enum V3d_TypeOfView {
	V3d_ORTHOGRAPHIC = 0,
	V3d_PERSPECTIVE = 1,
};

enum V3d_TypeOfVisualization {
	V3d_WIREFRAME = 0,
	V3d_ZBUFFER = 1,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class V3d_StereoDumpOptions(IntEnum):
	V3d_SDO_MONO = 0
	V3d_SDO_LEFT_EYE = 1
	V3d_SDO_RIGHT_EYE = 2
	V3d_SDO_BLENDED = 3
V3d_SDO_MONO = V3d_StereoDumpOptions.V3d_SDO_MONO
V3d_SDO_LEFT_EYE = V3d_StereoDumpOptions.V3d_SDO_LEFT_EYE
V3d_SDO_RIGHT_EYE = V3d_StereoDumpOptions.V3d_SDO_RIGHT_EYE
V3d_SDO_BLENDED = V3d_StereoDumpOptions.V3d_SDO_BLENDED

class V3d_TypeOfAxe(IntEnum):
	V3d_X = 0
	V3d_Y = 1
	V3d_Z = 2
V3d_X = V3d_TypeOfAxe.V3d_X
V3d_Y = V3d_TypeOfAxe.V3d_Y
V3d_Z = V3d_TypeOfAxe.V3d_Z

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

class V3d_TypeOfView(IntEnum):
	V3d_ORTHOGRAPHIC = 0
	V3d_PERSPECTIVE = 1
V3d_ORTHOGRAPHIC = V3d_TypeOfView.V3d_ORTHOGRAPHIC
V3d_PERSPECTIVE = V3d_TypeOfView.V3d_PERSPECTIVE

class V3d_TypeOfVisualization(IntEnum):
	V3d_WIREFRAME = 0
	V3d_ZBUFFER = 1
V3d_WIREFRAME = V3d_TypeOfVisualization.V3d_WIREFRAME
V3d_ZBUFFER = V3d_TypeOfVisualization.V3d_ZBUFFER
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
typedef Graphic3d_CLight V3d_Light;
typedef NCollection_List<opencascade::handle<Graphic3d_CLight>> V3d_ListOfLight;
typedef V3d_ListOfLight::Iterator V3d_ListOfLightIterator;
typedef NCollection_List<opencascade::handle<V3d_View>> V3d_ListOfView;
typedef V3d_ListOfView::Iterator V3d_ListOfViewIterator;
typedef Graphic3d_TypeOfBackfacingModel V3d_TypeOfBackfacingModel;
typedef Graphic3d_TypeOfLightSource V3d_TypeOfLight;
typedef Graphic3d_TypeOfShadingModel V3d_TypeOfShadingModel;
typedef V3d_Viewer * V3d_ViewerPointer;
/* end typedefs declaration */

/************
* class V3d *
************/
%rename(v3d) V3d;
class V3d {
	public:
		/****** V3d::ArrowOfRadius ******/
		/****** md5 signature: 8ddc06fb0e722ac928195b2206ccf028 ******/
		%feature("compactdefaultargs") ArrowOfRadius;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Compute the graphic structure of arrow. X0,Y0,Z0: coordinate of the arrow. DX,DY,DZ: Direction of the arrow. Alpha: Angle of arrow. Lng: Length of arrow.
") ArrowOfRadius;
		static void ArrowOfRadius(const opencascade::handle<Graphic3d_Group> & garrow, const Standard_Real X0, const Standard_Real Y0, const Standard_Real Z0, const Standard_Real DX, const Standard_Real DY, const Standard_Real DZ, const Standard_Real Alpha, const Standard_Real Lng);

		/****** V3d::CircleInPlane ******/
		/****** md5 signature: 81f28238a0360e3e4b234fbafc05ada7 ******/
		%feature("compactdefaultargs") CircleInPlane;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Compute the graphic structure of circle. X0,Y0,Z0: Center of circle. VX,VY,VZ: Axis of circle. Radius: Radius of circle.
") CircleInPlane;
		static void CircleInPlane(const opencascade::handle<Graphic3d_Group> & gcircle, const Standard_Real X0, const Standard_Real Y0, const Standard_Real Z0, const Standard_Real VX, const Standard_Real VY, const Standard_Real VZ, const Standard_Real Radius);

		/****** V3d::GetProjAxis ******/
		/****** md5 signature: ff653ed0a2749aac4d9fc7a46f5eda14 ******/
		%feature("compactdefaultargs") GetProjAxis;
		%feature("autodoc", "
Parameters
----------
theOrientation: V3d_TypeOfOrientation

Return
-------
gp_Dir

Description
-----------
Determines the orientation vector corresponding to the predefined orientation type.
") GetProjAxis;
		static gp_Dir GetProjAxis(const V3d_TypeOfOrientation theOrientation);

		/****** V3d::SwitchViewsinWindow ******/
		/****** md5 signature: 69e03f24a31f9c3a9e1b75cb86322bd3 ******/
		%feature("compactdefaultargs") SwitchViewsinWindow;
		%feature("autodoc", "
Parameters
----------
aPreviousView: V3d_View
aNextView: V3d_View

Return
-------
None

Description
-----------
No available documentation.
") SwitchViewsinWindow;
		static void SwitchViewsinWindow(const opencascade::handle<V3d_View> & aPreviousView, const opencascade::handle<V3d_View> & aNextView);

		/****** V3d::TypeOfOrientationFromString ******/
		/****** md5 signature: 7ec9c0aeba08bec35b6ea6f180fb12c0 ******/
		%feature("compactdefaultargs") TypeOfOrientationFromString;
		%feature("autodoc", "
Parameters
----------
theTypeString: str

Return
-------
V3d_TypeOfOrientation

Description
-----------
Returns the orientation type from the given string identifier (using case-insensitive comparison). 
Parameter theTypeString string identifier 
Return: orientation type or V3d_TypeOfOrientation if string identifier is invalid.
") TypeOfOrientationFromString;
		static V3d_TypeOfOrientation TypeOfOrientationFromString(Standard_CString theTypeString);

		/****** V3d::TypeOfOrientationFromString ******/
		/****** md5 signature: 6b78449f8330edf458cfd27636ffc2e3 ******/
		%feature("compactdefaultargs") TypeOfOrientationFromString;
		%feature("autodoc", "
Parameters
----------
theTypeString: str

Return
-------
theType: V3d_TypeOfOrientation

Description
-----------
Determines the shape type from the given string identifier (using case-insensitive comparison). 
Parameter theTypeString string identifier 
Parameter theType detected shape type 
Return: True if string identifier is known.
") TypeOfOrientationFromString;
		static Standard_Boolean TypeOfOrientationFromString(Standard_CString theTypeString, V3d_TypeOfOrientation &OutValue);

		/****** V3d::TypeOfOrientationToString ******/
		/****** md5 signature: 73659bdc699005210713bf8f9d6fab86 ******/
		%feature("compactdefaultargs") TypeOfOrientationToString;
		%feature("autodoc", "
Parameters
----------
theType: V3d_TypeOfOrientation

Return
-------
str

Description
-----------
Returns the string name for a given orientation type. 
Parameter theType orientation type 
Return: string identifier from the list Xpos, Ypos, Zpos and others.
") TypeOfOrientationToString;
		static Standard_CString TypeOfOrientationToString(V3d_TypeOfOrientation theType);

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
		/****** V3d_AmbientLight::V3d_AmbientLight ******/
		/****** md5 signature: f5210cdcc1d0a5697d139dbb3062cbb2 ******/
		%feature("compactdefaultargs") V3d_AmbientLight;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color (optional, default to Quantity_NOC_WHITE)

Return
-------
None

Description
-----------
Constructs an ambient light source in the viewer. The default Color of this light source is WHITE.
") V3d_AmbientLight;
		 V3d_AmbientLight(const Quantity_Color & theColor = Quantity_NOC_WHITE);

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
		/****** V3d_CircularGrid::V3d_CircularGrid ******/
		/****** md5 signature: aca6a46fdaeebed44ac8c4780cab282d ******/
		%feature("compactdefaultargs") V3d_CircularGrid;
		%feature("autodoc", "
Parameters
----------
aViewer: V3d_ViewerPointer
aColor: Quantity_Color
aTenthColor: Quantity_Color

Return
-------
None

Description
-----------
No available documentation.
") V3d_CircularGrid;
		 V3d_CircularGrid(const V3d_ViewerPointer & aViewer, const Quantity_Color & aColor, const Quantity_Color & aTenthColor);

		/****** V3d_CircularGrid::Display ******/
		/****** md5 signature: 8281a554d1ac32b57d99a718ed554038 ******/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Display;
		void Display();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** V3d_CircularGrid::Erase ******/
		/****** md5 signature: 683e92afcb4dd44bd3a5c6cd77cd44d8 ******/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Erase;
		void Erase();

		/****** V3d_CircularGrid::GraphicValues ******/
		/****** md5 signature: b1d4700bfff10f15a14cf8c74ab10261 ******/
		%feature("compactdefaultargs") GraphicValues;
		%feature("autodoc", "
Parameters
----------

Return
-------
Radius: float
OffSet: float

Description
-----------
No available documentation.
") GraphicValues;
		void GraphicValues(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** V3d_CircularGrid::IsDisplayed ******/
		/****** md5 signature: 22924cd2b5318e241154a4a4dd3d4803 ******/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDisplayed;
		Standard_Boolean IsDisplayed();

		/****** V3d_CircularGrid::SetColors ******/
		/****** md5 signature: 7534a16d8d9fbd9bbe68e656a4272ad7 ******/
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "
Parameters
----------
aColor: Quantity_Color
aTenthColor: Quantity_Color

Return
-------
None

Description
-----------
No available documentation.
") SetColors;
		void SetColors(const Quantity_Color & aColor, const Quantity_Color & aTenthColor);

		/****** V3d_CircularGrid::SetGraphicValues ******/
		/****** md5 signature: 014c9a5fb6d894577cb3746edb9bdc5b ******/
		%feature("compactdefaultargs") SetGraphicValues;
		%feature("autodoc", "
Parameters
----------
Radius: float
OffSet: float

Return
-------
None

Description
-----------
No available documentation.
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
/******************
* class V3d_Plane *
******************/
class V3d_Plane : public Standard_Transient {
	public:
		/****** V3d_Plane::V3d_Plane ******/
		/****** md5 signature: 0312d266d9ef2810604382ef778c1f88 ******/
		%feature("compactdefaultargs") V3d_Plane;
		%feature("autodoc", "
Parameters
----------
theA: float (optional, default to 0.0)
theB: float (optional, default to 0.0)
theC: float (optional, default to 1.0)
theD: float (optional, default to 0.0)

Return
-------
None

Description
-----------
Creates a clipping plane from plane coefficients.
") V3d_Plane;
		 V3d_Plane(const Standard_Real theA = 0.0, const Standard_Real theB = 0.0, const Standard_Real theC = 1.0, const Standard_Real theD = 0.0);

		/****** V3d_Plane::ClipPlane ******/
		/****** md5 signature: 726bceb71c5417a0c5b0cf697adf308e ******/
		%feature("compactdefaultargs") ClipPlane;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_ClipPlane>

Description
-----------
Use this method to pass clipping plane implementation for standard clipping workflow. 
Return: clipping plane implementation handle.
") ClipPlane;
		const opencascade::handle<Graphic3d_ClipPlane> & ClipPlane();

		/****** V3d_Plane::Display ******/
		/****** md5 signature: 4dc525f17f40f087cacdd085902a90ab ******/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "
Parameters
----------
theView: V3d_View
theColor: Quantity_Color (optional, default to Quantity_NOC_GRAY)

Return
-------
None

Description
-----------
Display the plane representation in the chosen view.
") Display;
		virtual void Display(const opencascade::handle<V3d_View> & theView, const Quantity_Color & theColor = Quantity_NOC_GRAY);

		/****** V3d_Plane::Erase ******/
		/****** md5 signature: 8f2bc4e6df5b146535fbcd580dcae32c ******/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "Return
-------
None

Description
-----------
Erase the plane representation.
") Erase;
		void Erase();

		/****** V3d_Plane::IsDisplayed ******/
		/****** md5 signature: 04882eded547dac4e4f59f67e903fed8 ******/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when the plane representation is displayed.
") IsDisplayed;
		Standard_Boolean IsDisplayed();

		/****** V3d_Plane::Plane ******/
		/****** md5 signature: 5a71d0a06c1c48da691d3ec3cdc8498e ******/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "
Parameters
----------

Return
-------
theA: float
theB: float
theC: float
theD: float

Description
-----------
Returns the parameters of the plane.
") Plane;
		void Plane(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** V3d_Plane::SetPlane ******/
		/****** md5 signature: bc3101f33294b1ef9a720256755c12f9 ******/
		%feature("compactdefaultargs") SetPlane;
		%feature("autodoc", "
Parameters
----------
theA: float
theB: float
theC: float
theD: float

Return
-------
None

Description
-----------
Change plane equation.
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
		/****** V3d_RectangularGrid::V3d_RectangularGrid ******/
		/****** md5 signature: 4bfe3e7098281d02a88c12d3c127a1de ******/
		%feature("compactdefaultargs") V3d_RectangularGrid;
		%feature("autodoc", "
Parameters
----------
aViewer: V3d_ViewerPointer
aColor: Quantity_Color
aTenthColor: Quantity_Color

Return
-------
None

Description
-----------
No available documentation.
") V3d_RectangularGrid;
		 V3d_RectangularGrid(const V3d_ViewerPointer & aViewer, const Quantity_Color & aColor, const Quantity_Color & aTenthColor);

		/****** V3d_RectangularGrid::Display ******/
		/****** md5 signature: 869c346ea6117dea2e22059b972a14d6 ******/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Display;
		virtual void Display();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** V3d_RectangularGrid::Erase ******/
		/****** md5 signature: 44e4f7cb90f37153ccbcbc58390450d3 ******/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Erase;
		virtual void Erase();

		/****** V3d_RectangularGrid::GraphicValues ******/
		/****** md5 signature: be03824cdbf05cae65a43617bb8d97e3 ******/
		%feature("compactdefaultargs") GraphicValues;
		%feature("autodoc", "
Parameters
----------

Return
-------
XSize: float
YSize: float
OffSet: float

Description
-----------
No available documentation.
") GraphicValues;
		void GraphicValues(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** V3d_RectangularGrid::IsDisplayed ******/
		/****** md5 signature: dcb0c9b5518fcc6a7adfe5c2cf2d06c3 ******/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDisplayed;
		virtual Standard_Boolean IsDisplayed();

		/****** V3d_RectangularGrid::SetColors ******/
		/****** md5 signature: 9e45da8e1b80e60ef1ff0cde9ca414a8 ******/
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "
Parameters
----------
aColor: Quantity_Color
aTenthColor: Quantity_Color

Return
-------
None

Description
-----------
No available documentation.
") SetColors;
		virtual void SetColors(const Quantity_Color & aColor, const Quantity_Color & aTenthColor);

		/****** V3d_RectangularGrid::SetGraphicValues ******/
		/****** md5 signature: 21412a7d5826b7b44f86e4c1355280ec ******/
		%feature("compactdefaultargs") SetGraphicValues;
		%feature("autodoc", "
Parameters
----------
XSize: float
YSize: float
OffSet: float

Return
-------
None

Description
-----------
No available documentation.
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
		/****** V3d_Trihedron::V3d_Trihedron ******/
		/****** md5 signature: fddc5210356ebbc3d61efae997e05003 ******/
		%feature("compactdefaultargs") V3d_Trihedron;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a default trihedron.
") V3d_Trihedron;
		 V3d_Trihedron();

		/****** V3d_Trihedron::ArrowAspect ******/
		/****** md5 signature: 83baff8406de18ecb598939c082e7c98 ******/
		%feature("compactdefaultargs") ArrowAspect;
		%feature("autodoc", "
Parameters
----------
theAxis: V3d_TypeOfAxe

Return
-------
opencascade::handle<Prs3d_ShadingAspect>

Description
-----------
Return shading aspect for specified axis. 
Input parameter: theAxis axis index 
Return: shading aspect.
") ArrowAspect;
		const opencascade::handle<Prs3d_ShadingAspect> & ArrowAspect(V3d_TypeOfAxe theAxis);

		/****** V3d_Trihedron::ArrowDiameter ******/
		/****** md5 signature: 8cf626b6e8e6be25604ce22c0e17f051 ******/
		%feature("compactdefaultargs") ArrowDiameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return arrow diameter.
") ArrowDiameter;
		Standard_Real ArrowDiameter();

		/****** V3d_Trihedron::Display ******/
		/****** md5 signature: 42c2ef5e51bf295103c2f258b27a2422 ******/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "
Parameters
----------
theView: V3d_View

Return
-------
None

Description
-----------
Display trihedron.
") Display;
		void Display(const opencascade::handle<V3d_View> & theView);

		/****** V3d_Trihedron::Display ******/
		/****** md5 signature: 2bae79cabd98629a1614937c039a142a ******/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "
Parameters
----------
theView: V3d_View

Return
-------
None

Description
-----------
Display trihedron.
") Display;
		void Display(const V3d_View & theView);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** V3d_Trihedron::Erase ******/
		/****** md5 signature: 8f2bc4e6df5b146535fbcd580dcae32c ******/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "Return
-------
None

Description
-----------
Erase trihedron.
") Erase;
		void Erase();

		/****** V3d_Trihedron::IsWireframe ******/
		/****** md5 signature: 80fcc45160f20874f67947be21756c56 ******/
		%feature("compactdefaultargs") IsWireframe;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if wireframe presentation is set; False by default.
") IsWireframe;
		bool IsWireframe();

		/****** V3d_Trihedron::Label ******/
		/****** md5 signature: 3839a51c4a82f97b7a3db502d3596fa5 ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "
Parameters
----------
theAxis: V3d_TypeOfAxe

Return
-------
TCollection_AsciiString

Description
-----------
Return axis text. 
Input parameter: theAxis axis index 
Return: text of the label.
") Label;
		const TCollection_AsciiString & Label(V3d_TypeOfAxe theAxis);

		/****** V3d_Trihedron::LabelAspect ******/
		/****** md5 signature: 3cebd0912ae3832d59578142c1820ac3 ******/
		%feature("compactdefaultargs") LabelAspect;
		%feature("autodoc", "
Parameters
----------
theAxis: V3d_TypeOfAxe

Return
-------
opencascade::handle<Prs3d_TextAspect>

Description
-----------
Return text aspect for specified axis. 
Input parameter: theAxis axis index 
Return: text aspect.
") LabelAspect;
		const opencascade::handle<Prs3d_TextAspect> & LabelAspect(V3d_TypeOfAxe theAxis);

		/****** V3d_Trihedron::NbFacets ******/
		/****** md5 signature: f0a78c1b1a92f4693779c9637ca3a493 ******/
		%feature("compactdefaultargs") NbFacets;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return number of facets for tessellation.
") NbFacets;
		Standard_Integer NbFacets();

		/****** V3d_Trihedron::OriginAspect ******/
		/****** md5 signature: 81a6eb092b2a0e718e37986026d946c4 ******/
		%feature("compactdefaultargs") OriginAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_ShadingAspect>

Description
-----------
Return shading aspect of origin sphere.
") OriginAspect;
		const opencascade::handle<Prs3d_ShadingAspect> & OriginAspect();

		/****** V3d_Trihedron::Scale ******/
		/****** md5 signature: fff8b387c443c3e852a1bfc198a5a373 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return scale factor.
") Scale;
		Standard_Real Scale();

		/****** V3d_Trihedron::SetArrowDiameter ******/
		/****** md5 signature: 4c0619d2a8305d420bc1f36865af3099 ******/
		%feature("compactdefaultargs") SetArrowDiameter;
		%feature("autodoc", "
Parameters
----------
theDiam: float

Return
-------
None

Description
-----------
Setup the arrow diameter.
") SetArrowDiameter;
		void SetArrowDiameter(const Standard_Real theDiam);

		/****** V3d_Trihedron::SetArrowsColor ******/
		/****** md5 signature: 3947d4f96fefc9e2657dc0fdc9888373 ******/
		%feature("compactdefaultargs") SetArrowsColor;
		%feature("autodoc", "
Parameters
----------
theXColor: Quantity_Color
theYColor: Quantity_Color
theZColor: Quantity_Color

Return
-------
None

Description
-----------
Setup colors of arrows.
") SetArrowsColor;
		void SetArrowsColor(const Quantity_Color & theXColor, const Quantity_Color & theYColor, const Quantity_Color & theZColor);

		/****** V3d_Trihedron::SetLabels ******/
		/****** md5 signature: efe544ec018c24bb6a8f78658c7dddb9 ******/
		%feature("compactdefaultargs") SetLabels;
		%feature("autodoc", "
Parameters
----------
theX: str
theY: str
theZ: str

Return
-------
None

Description
-----------
Setup per-axis text.
") SetLabels;
		void SetLabels(TCollection_AsciiString theX, TCollection_AsciiString theY, TCollection_AsciiString theZ);

		/****** V3d_Trihedron::SetLabelsColor ******/
		/****** md5 signature: 2e294d0668cecdbabc01b2838203a9e2 ******/
		%feature("compactdefaultargs") SetLabelsColor;
		%feature("autodoc", "
Parameters
----------
theXColor: Quantity_Color
theYColor: Quantity_Color
theZColor: Quantity_Color

Return
-------
None

Description
-----------
Setup per-label color.
") SetLabelsColor;
		void SetLabelsColor(const Quantity_Color & theXColor, const Quantity_Color & theYColor, const Quantity_Color & theZColor);

		/****** V3d_Trihedron::SetLabelsColor ******/
		/****** md5 signature: 006a9f4a6dfc02d7949e81f4ddc4da24 ******/
		%feature("compactdefaultargs") SetLabelsColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Setup color of text labels.
") SetLabelsColor;
		void SetLabelsColor(const Quantity_Color & theColor);

		/****** V3d_Trihedron::SetNbFacets ******/
		/****** md5 signature: 5efbe53a806e2f2349d28a5ad826c749 ******/
		%feature("compactdefaultargs") SetNbFacets;
		%feature("autodoc", "
Parameters
----------
theNbFacets: int

Return
-------
None

Description
-----------
Setup the number of facets for tessellation.
") SetNbFacets;
		void SetNbFacets(const Standard_Integer theNbFacets);

		/****** V3d_Trihedron::SetPosition ******/
		/****** md5 signature: 800bcc8a066f1adf34c79426184d50c1 ******/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
thePosition: Aspect_TypeOfTriedronPosition

Return
-------
None

Description
-----------
Setup the corner to draw the trihedron.
") SetPosition;
		void SetPosition(const Aspect_TypeOfTriedronPosition thePosition);

		/****** V3d_Trihedron::SetScale ******/
		/****** md5 signature: 91bbbb1646dedfb8018b2c1849bc71ad ******/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "
Parameters
----------
theScale: float

Return
-------
None

Description
-----------
Setup the scale factor.
") SetScale;
		void SetScale(const Standard_Real theScale);

		/****** V3d_Trihedron::SetSizeRatio ******/
		/****** md5 signature: c04a64217473268454fb63fbf5499304 ******/
		%feature("compactdefaultargs") SetSizeRatio;
		%feature("autodoc", "
Parameters
----------
theRatio: float

Return
-------
None

Description
-----------
Setup the size ratio factor.
") SetSizeRatio;
		void SetSizeRatio(const Standard_Real theRatio);

		/****** V3d_Trihedron::SetWireframe ******/
		/****** md5 signature: 11febb98a3fceb574f5634008d3ccac4 ******/
		%feature("compactdefaultargs") SetWireframe;
		%feature("autodoc", "
Parameters
----------
theAsWireframe: bool

Return
-------
None

Description
-----------
Switch wireframe / shaded trihedron.
") SetWireframe;
		void SetWireframe(const Standard_Boolean theAsWireframe);

		/****** V3d_Trihedron::SizeRatio ******/
		/****** md5 signature: ecc16fdaec68cd0580ce5d85ea1f0908 ******/
		%feature("compactdefaultargs") SizeRatio;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return size ratio factor.
") SizeRatio;
		Standard_Real SizeRatio();

		/****** V3d_Trihedron::TransformPersistence ******/
		/****** md5 signature: d358c515ebf5e1ead4666e4a5cd605ce ******/
		%feature("compactdefaultargs") TransformPersistence;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_TransformPers>

Description
-----------
Return trihedron position.
") TransformPersistence;
		const opencascade::handle<Graphic3d_TransformPers> TransformPersistence();

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
		/****** V3d_View::V3d_View ******/
		/****** md5 signature: 8820a3bd6b7f0436d4c1059ccd9bd367 ******/
		%feature("compactdefaultargs") V3d_View;
		%feature("autodoc", "
Parameters
----------
theViewer: V3d_Viewer
theType: V3d_TypeOfView (optional, default to V3d_ORTHOGRAPHIC)

Return
-------
None

Description
-----------
Initializes the view.
") V3d_View;
		 V3d_View(const opencascade::handle<V3d_Viewer> & theViewer, const V3d_TypeOfView theType = V3d_ORTHOGRAPHIC);

		/****** V3d_View::V3d_View ******/
		/****** md5 signature: bbf725982f29cea54a2ed88199238a5c ******/
		%feature("compactdefaultargs") V3d_View;
		%feature("autodoc", "
Parameters
----------
theViewer: V3d_Viewer
theView: V3d_View

Return
-------
None

Description
-----------
Initializes the view by copying.
") V3d_View;
		 V3d_View(const opencascade::handle<V3d_Viewer> & theViewer, const opencascade::handle<V3d_View> & theView);

		/****** V3d_View::ActiveLight ******/
		/****** md5 signature: 7af2e71f89b94797e81a8b1c1a052d68 ******/
		%feature("compactdefaultargs") ActiveLight;
		%feature("autodoc", "Return
-------
opencascade::handle<V3d_Light>

Description
-----------
No available documentation.
") ActiveLight;
		const opencascade::handle<V3d_Light> & ActiveLight();

		/****** V3d_View::ActiveLightIterator ******/
		/****** md5 signature: 6fa6e98274fc8d44abfc6ab8d93a027d ******/
		%feature("compactdefaultargs") ActiveLightIterator;
		%feature("autodoc", "Return
-------
V3d_ListOfLightIterator

Description
-----------
Return iterator for defined lights.
") ActiveLightIterator;
		V3d_ListOfLightIterator ActiveLightIterator();

		/****** V3d_View::ActiveLights ******/
		/****** md5 signature: 046f4b2a5dbc3ae8d1d2b264382219be ******/
		%feature("compactdefaultargs") ActiveLights;
		%feature("autodoc", "Return
-------
V3d_ListOfLight

Description
-----------
Returns a list of active lights.
") ActiveLights;
		const V3d_ListOfLight & ActiveLights();

		/****** V3d_View::AddClipPlane ******/
		/****** md5 signature: 9f3c54e7cba60e479ad5b0eee5e5228c ******/
		%feature("compactdefaultargs") AddClipPlane;
		%feature("autodoc", "
Parameters
----------
thePlane: Graphic3d_ClipPlane

Return
-------
None

Description
-----------
Adds clip plane to the view. The composition of clip planes truncates the rendering space to convex volume. Number of supported clip planes can be consulted by PlaneLimit method of associated Graphic3d_GraphicDriver. Please be aware that the planes which exceed the limit are ignored during rendering. 
Input parameter: thePlane the clip plane to be added to view.
") AddClipPlane;
		virtual void AddClipPlane(const opencascade::handle<Graphic3d_ClipPlane> & thePlane);

		/****** V3d_View::AddSubview ******/
		/****** md5 signature: 49d415d9560118482695dd29dc13e13e ******/
		%feature("compactdefaultargs") AddSubview;
		%feature("autodoc", "
Parameters
----------
theView: V3d_View

Return
-------
None

Description
-----------
Add subview to the list.
") AddSubview;
		void AddSubview(const opencascade::handle<V3d_View> & theView);

		/****** V3d_View::At ******/
		/****** md5 signature: 5c17b55c9dc9e96e036d6f29354c6a9d ******/
		%feature("compactdefaultargs") At;
		%feature("autodoc", "
Parameters
----------

Return
-------
X: float
Y: float
Z: float

Description
-----------
Returns the position of the view point.
") At;
		void At(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** V3d_View::AutoZFit ******/
		/****** md5 signature: 6ae4b584d77cfd67e2525979ecfd389b ******/
		%feature("compactdefaultargs") AutoZFit;
		%feature("autodoc", "Return
-------
None

Description
-----------
If automatic z-range fitting is turned on, adjusts Z-min and Z-max projection volume planes with call to ZFitAll.
") AutoZFit;
		void AutoZFit();

		/****** V3d_View::AutoZFitMode ******/
		/****** md5 signature: b57c0da0561c9b0b0778ef1710bb14c3 ******/
		%feature("compactdefaultargs") AutoZFitMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if automatic z-fit mode is turned on.
") AutoZFitMode;
		Standard_Boolean AutoZFitMode();

		/****** V3d_View::AutoZFitScaleFactor ******/
		/****** md5 signature: 6257bed9c3571580a75e0ab98cd280b9 ******/
		%feature("compactdefaultargs") AutoZFitScaleFactor;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns scale factor parameter of automatic z-fit mode.
") AutoZFitScaleFactor;
		Standard_Real AutoZFitScaleFactor();

		/****** V3d_View::AxialScale ******/
		/****** md5 signature: a2b909a1a57dc5163dd4895ada91fd13 ******/
		%feature("compactdefaultargs") AxialScale;
		%feature("autodoc", "
Parameters
----------

Return
-------
Sx: float
Sy: float
Sz: float

Description
-----------
Returns the current values of the anisotropic (axial) scale factors.
") AxialScale;
		void AxialScale(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** V3d_View::AxialScale ******/
		/****** md5 signature: bfb43dfcf2c6206f166042bdbcd4b471 ******/
		%feature("compactdefaultargs") AxialScale;
		%feature("autodoc", "
Parameters
----------
Dx: int
Dy: int
Axis: V3d_TypeOfAxe

Return
-------
None

Description
-----------
Performs anisotropic scaling of <self> view along the given <Axis>. The scale factor is calculated on a basis of the mouse pointer displacement <Dx,Dy>. The calculated scale factor is then passed to SetAxialScale(Sx, Sy, Sz) method.
") AxialScale;
		void AxialScale(const Standard_Integer Dx, const Standard_Integer Dy, const V3d_TypeOfAxe Axis);

		/****** V3d_View::BackFacingModel ******/
		/****** md5 signature: f3593149121845487191e085f1d8af64 ******/
		%feature("compactdefaultargs") BackFacingModel;
		%feature("autodoc", "Return
-------
Graphic3d_TypeOfBackfacingModel

Description
-----------
Returns current state of the back faces display; Graphic3d_TypeOfBackfacingModel_Auto by default, which means that backface culling is defined by each presentation.
") BackFacingModel;
		Graphic3d_TypeOfBackfacingModel BackFacingModel();

		/****** V3d_View::BackgroundColor ******/
		/****** md5 signature: 496c0a03dfb1fb7b8076d2c2846a387c ******/
		%feature("compactdefaultargs") BackgroundColor;
		%feature("autodoc", "
Parameters
----------
Type: Quantity_TypeOfColor

Return
-------
V1: float
V2: float
V3: float

Description
-----------
Returns the Background color values of the view depending of the color Type.
") BackgroundColor;
		void BackgroundColor(const Quantity_TypeOfColor Type, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** V3d_View::BackgroundColor ******/
		/****** md5 signature: 3727e4517c165391df52fb7da81fb386 ******/
		%feature("compactdefaultargs") BackgroundColor;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Returns the Background color object of the view.
") BackgroundColor;
		Quantity_Color BackgroundColor();

		/****** V3d_View::BackgroundSkydome ******/
		/****** md5 signature: d7cf91d14be3f61f07eadf45a044328f ******/
		%feature("compactdefaultargs") BackgroundSkydome;
		%feature("autodoc", "Return
-------
Aspect_SkydomeBackground

Description
-----------
Returns skydome aspect;.
") BackgroundSkydome;
		const Aspect_SkydomeBackground & BackgroundSkydome();

		/****** V3d_View::Camera ******/
		/****** md5 signature: e0e8d00ee700afb9ca88da977e8b5747 ******/
		%feature("compactdefaultargs") Camera;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_Camera>

Description
-----------
Returns camera object of the view. 
Return:: handle to camera object, or NULL if 3D view does not use the camera approach.
") Camera;
		const opencascade::handle<Graphic3d_Camera> & Camera();

		/****** V3d_View::ChangeRenderingParams ******/
		/****** md5 signature: 0689d00d2ba998c88be3fbe15202695d ******/
		%feature("compactdefaultargs") ChangeRenderingParams;
		%feature("autodoc", "Return
-------
Graphic3d_RenderingParams

Description
-----------
Returns reference to current rendering parameters and effect settings.
") ChangeRenderingParams;
		Graphic3d_RenderingParams & ChangeRenderingParams();

		/****** V3d_View::ClearPBREnvironment ******/
		/****** md5 signature: ceb898c642bc368ae8e055ac8a0fd7bd ******/
		%feature("compactdefaultargs") ClearPBREnvironment;
		%feature("autodoc", "
Parameters
----------
theToUpdate: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Disables IBL from background cubemap; fills PBR specular probe and irradiance map with white color.
") ClearPBREnvironment;
		void ClearPBREnvironment(Standard_Boolean theToUpdate = Standard_False);

		/****** V3d_View::ClipPlanes ******/
		/****** md5 signature: 4f5f037b2c152f9713991c9904ccf618 ******/
		%feature("compactdefaultargs") ClipPlanes;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_SequenceOfHClipPlane>

Description
-----------
Get clip planes. 
Return: sequence clip planes that have been set for the view.
") ClipPlanes;
		const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & ClipPlanes();

		/****** V3d_View::ComputedMode ******/
		/****** md5 signature: 29bd402246d352389128afcb0486b75e ******/
		%feature("compactdefaultargs") ComputedMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the computed HLR mode state.
") ComputedMode;
		Standard_Boolean ComputedMode();

		/****** V3d_View::Convert ******/
		/****** md5 signature: a1d3281dca07164e571b608f5bc809b9 ******/
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "
Parameters
----------
Vp: int

Return
-------
float

Description
-----------
Converts the PIXEL value to a value in the projection plane.
") Convert;
		Standard_Real Convert(const Standard_Integer Vp);

		/****** V3d_View::Convert ******/
		/****** md5 signature: d15381827f797863bf8e51d376bc16c1 ******/
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "
Parameters
----------
Xp: int
Yp: int

Return
-------
Xv: float
Yv: float

Description
-----------
Converts the point PIXEL into a point projected in the reference frame of the projection plane.
") Convert;
		void Convert(const Standard_Integer Xp, const Standard_Integer Yp, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** V3d_View::Convert ******/
		/****** md5 signature: 7dd2a2a1ea24d8db91f157ae69129241 ******/
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "
Parameters
----------
Vv: float

Return
-------
int

Description
-----------
Converts tha value of the projection plane into a PIXEL value.
") Convert;
		Standard_Integer Convert(const Standard_Real Vv);

		/****** V3d_View::Convert ******/
		/****** md5 signature: 142cf6fe83017e2ab40a1b9b0fdfda91 ******/
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "
Parameters
----------
Xv: float
Yv: float

Return
-------
Xp: int
Yp: int

Description
-----------
Converts the point defined in the reference frame of the projection plane into a point PIXEL.
") Convert;
		void Convert(const Standard_Real Xv, const Standard_Real Yv, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** V3d_View::Convert ******/
		/****** md5 signature: 806b18b0f8f527526068db6c9b0f5582 ******/
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "
Parameters
----------
Xp: int
Yp: int

Return
-------
X: float
Y: float
Z: float

Description
-----------
Converts the projected point into a point in the reference frame of the view corresponding to the intersection with the projection plane of the eye/view point vector.
") Convert;
		void Convert(const Standard_Integer Xp, const Standard_Integer Yp, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** V3d_View::Convert ******/
		/****** md5 signature: 7fdd5667208d15821960cc400f3df3ff ******/
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "
Parameters
----------
X: float
Y: float
Z: float

Return
-------
Xp: int
Yp: int

Description
-----------
Projects the point defined in the reference frame of the view into the projected point in the associated window.
") Convert;
		void Convert(const Standard_Real X, const Standard_Real Y, const Standard_Real Z, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** V3d_View::ConvertToGrid ******/
		/****** md5 signature: b151fec13ddce5ba9a39630169ddc420 ******/
		%feature("compactdefaultargs") ConvertToGrid;
		%feature("autodoc", "
Parameters
----------
Xp: int
Yp: int

Return
-------
Xg: float
Yg: float
Zg: float

Description
-----------
Converts the projected point into the nearest grid point in the reference frame of the view corresponding to the intersection with the projection plane of the eye/view point vector and display the grid marker. Warning: When the grid is not active the result is identical to the above Convert() method. How to use: 1) Enable the grid echo display myViewer->SetGridEcho(Standard_True); 2) When application receive a move event: 2.1) Check if any object is detected if( myInteractiveContext->MoveTo(x,y) == AIS_SOD_Nothing ) { 2.2) Check if the grid is active if( myViewer->Grid()->IsActive() ) { 2.3) Display the grid echo and gets the grid point myView->ConvertToGrid(x,y,X,Y,Z); myView->Viewer()->ShowGridEcho (myView, Graphic3d_Vertex (X,Y,Z)); myView->RedrawImmediate(); 2.4) Else this is the standard case } else myView->Convert(x,y,X,Y,Z);.
") ConvertToGrid;
		void ConvertToGrid(const Standard_Integer Xp, const Standard_Integer Yp, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** V3d_View::ConvertToGrid ******/
		/****** md5 signature: 02d7737206cedc19485c15cdcb8910bc ******/
		%feature("compactdefaultargs") ConvertToGrid;
		%feature("autodoc", "
Parameters
----------
X: float
Y: float
Z: float

Return
-------
Xg: float
Yg: float
Zg: float

Description
-----------
Converts the point into the nearest grid point and display the grid marker.
") ConvertToGrid;
		void ConvertToGrid(const Standard_Real X, const Standard_Real Y, const Standard_Real Z, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** V3d_View::ConvertWithProj ******/
		/****** md5 signature: fdde209d2949440727be416aba98e504 ******/
		%feature("compactdefaultargs") ConvertWithProj;
		%feature("autodoc", "
Parameters
----------
Xp: int
Yp: int

Return
-------
X: float
Y: float
Z: float
Vx: float
Vy: float
Vz: float

Description
-----------
Converts the projected point into a point in the reference frame of the view corresponding to the intersection with the projection plane of the eye/view point vector and returns the projection ray for further computations.
") ConvertWithProj;
		void ConvertWithProj(const Standard_Integer Xp, const Standard_Integer Yp, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** V3d_View::DefaultCamera ******/
		/****** md5 signature: 3111186f8630eb9f3140ca00c449f778 ******/
		%feature("compactdefaultargs") DefaultCamera;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_Camera>

Description
-----------
Return default camera.
") DefaultCamera;
		const opencascade::handle<Graphic3d_Camera> & DefaultCamera();

		/****** V3d_View::Depth ******/
		/****** md5 signature: de7560cf701656c85d7ea3c1f074fd03 ******/
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the Distance between the Eye and View Point.
") Depth;
		Standard_Real Depth();

		/****** V3d_View::DepthFitAll ******/
		/****** md5 signature: e2a749741927ce07ea7511bac6bbb622 ******/
		%feature("compactdefaultargs") DepthFitAll;
		%feature("autodoc", "
Parameters
----------
Aspect: float (optional, default to 0.01)
Margin: float (optional, default to 0.01)

Return
-------
None

Description
-----------
Adjusts the viewing volume so as not to clip the displayed objects by front and back and back clipping planes. Also sets depth value automatically depending on the calculated Z size and Aspect parameter. NOTE than the original XY size of the view is NOT modified .
") DepthFitAll;
		void DepthFitAll(const Standard_Real Aspect = 0.01, const Standard_Real Margin = 0.01);

		/****** V3d_View::DiagnosticInformation ******/
		/****** md5 signature: ade68be5c6f35c39dc63903b1a795539 ******/
		%feature("compactdefaultargs") DiagnosticInformation;
		%feature("autodoc", "
Parameters
----------
theDict: TColStd_IndexedDataMapOfStringString
theFlags: Graphic3d_DiagnosticInfo

Return
-------
None

Description
-----------
Fill in the dictionary with diagnostic info. Should be called within rendering thread. //! This API should be used only for user output or for creating automated reports. The format of returned information (e.g. key-value layout) is NOT part of this API and can be changed at any time. Thus application should not parse returned information to weed out specific parameters. 
Parameter theDict destination map for information 
Parameter theFlags defines the information to be retrieved.
") DiagnosticInformation;
		void DiagnosticInformation(TColStd_IndexedDataMapOfStringString & theDict, Graphic3d_DiagnosticInfo theFlags);

		/****** V3d_View::DoMapping ******/
		/****** md5 signature: 5cc5996ccdd8fab65b150d9b8e0bea7c ******/
		%feature("compactdefaultargs") DoMapping;
		%feature("autodoc", "Return
-------
None

Description
-----------
Must be called when the window supporting the view is mapped or unmapped.
") DoMapping;
		void DoMapping();

		/****** V3d_View::Dump ******/
		/****** md5 signature: 6ccb0e58501968ab58e63cdfa15db02d ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
theFile: str
theBufferType: Graphic3d_BufferType (optional, default to Graphic3d_BT_RGB)

Return
-------
bool

Description
-----------
Dumps the full contents of the View into the image file. This is an alias for ToPixMap() with Image_AlienPixMap. 
Parameter theFile destination image file (image format is determined by file extension like .png, .bmp, .jpg) 
Parameter theBufferType buffer to dump 
Return: False when the dump has failed.
") Dump;
		Standard_Boolean Dump(Standard_CString theFile, const Graphic3d_BufferType & theBufferType = Graphic3d_BT_RGB);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** V3d_View::Eye ******/
		/****** md5 signature: 214dc5004bc1554dbed9750aa9efa7b8 ******/
		%feature("compactdefaultargs") Eye;
		%feature("autodoc", "
Parameters
----------

Return
-------
X: float
Y: float
Z: float

Description
-----------
Returns the position of the eye.
") Eye;
		void Eye(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** V3d_View::FitAll ******/
		/****** md5 signature: f975d988d1deb15b4c055158c6afc34b ******/
		%feature("compactdefaultargs") FitAll;
		%feature("autodoc", "
Parameters
----------
theMargin: float (optional, default to 0.01)
theToUpdate: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Adjust view parameters to fit the displayed scene, respecting height / width ratio. The Z clipping range (depth range) is fitted if AutoZFit flag is True. Throws program error exception if margin coefficient is < 0 or >= 1. Updates the view. 
Input parameter: theMargin the margin coefficient for view borders. 
Input parameter: theToUpdate flag to perform view update.
") FitAll;
		void FitAll(const Standard_Real theMargin = 0.01, const Standard_Boolean theToUpdate = Standard_True);

		/****** V3d_View::FitAll ******/
		/****** md5 signature: f3e0a8d0b602d603245f18a69b439c19 ******/
		%feature("compactdefaultargs") FitAll;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_Box
theMargin: float (optional, default to 0.01)
theToUpdate: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Adjust view parameters to fit the displayed scene, respecting height / width ratio according to the custom bounding box given. Throws program error exception if margin coefficient is < 0 or >= 1. Updates the view. 
Input parameter: theBox the custom bounding box to fit. 
Input parameter: theMargin the margin coefficient for view borders. 
Input parameter: theToUpdate flag to perform view update.
") FitAll;
		void FitAll(const Bnd_Box & theBox, const Standard_Real theMargin = 0.01, const Standard_Boolean theToUpdate = Standard_True);

		/****** V3d_View::FitAll ******/
		/****** md5 signature: cbf47697dc5067ba972e7e5e822fb525 ******/
		%feature("compactdefaultargs") FitAll;
		%feature("autodoc", "
Parameters
----------
theMinXv: float
theMinYv: float
theMaxXv: float
theMaxYv: float

Return
-------
None

Description
-----------
Centers the defined projection window so that it occupies the maximum space while respecting the initial height/width ratio. NOTE than the original Z size of the view is NOT modified .
") FitAll;
		void FitAll(const Standard_Real theMinXv, const Standard_Real theMinYv, const Standard_Real theMaxXv, const Standard_Real theMaxYv);

		/****** V3d_View::FitMinMax ******/
		/****** md5 signature: 5a3793d719ff4c2f2d2836e76d9f55bc ******/
		%feature("compactdefaultargs") FitMinMax;
		%feature("autodoc", "
Parameters
----------
theCamera: Graphic3d_Camera
theBox: Bnd_Box
theMargin: float
theResolution: float (optional, default to 0.0)
theToEnlargeIfLine: bool (optional, default to Standard_True)

Return
-------
bool

Description
-----------
Transform camera eye, center and scale to fit in the passed bounding box specified in WCS. 
Input parameter: theCamera the camera 
Input parameter: theBox the bounding box 
Input parameter: theMargin the margin coefficient for view borders 
Input parameter: theResolution the minimum size of projection of bounding box in Xv or Yv direction when it considered to be a thin plane or point (without a volume);  in this case only the center of camera is adjusted 
Input parameter: theToEnlargeIfLine when True - in cases when the whole bounding box projected into thin line going along Z-axis of screen,  the view plane is enlarged such thatwe see the whole line on  rotation, otherwise only the center of camera is adjusted. 
Return: True if the fit all operation can be done.
") FitMinMax;
		Standard_Boolean FitMinMax(const opencascade::handle<Graphic3d_Camera> & theCamera, const Bnd_Box & theBox, const Standard_Real theMargin, const Standard_Real theResolution = 0.0, const Standard_Boolean theToEnlargeIfLine = Standard_True);

		/****** V3d_View::FocalReferencePoint ******/
		/****** md5 signature: b502bf5bf2976b52d491b11719633a5e ******/
		%feature("compactdefaultargs") FocalReferencePoint;
		%feature("autodoc", "
Parameters
----------

Return
-------
X: float
Y: float
Z: float

Description
-----------
Returns the position of point which emanating the projections.
") FocalReferencePoint;
		void FocalReferencePoint(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** V3d_View::Focale ******/
		/****** md5 signature: d09c94eba7c048c5f1e5bdc7ded6a95a ******/
		%feature("compactdefaultargs") Focale;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the View Plane Distance for Perspective Views.
") Focale;
		Standard_Real Focale();

		/****** V3d_View::GeneratePBREnvironment ******/
		/****** md5 signature: 275e4d88c4784bc5b0db60d561af11c8 ******/
		%feature("compactdefaultargs") GeneratePBREnvironment;
		%feature("autodoc", "
Parameters
----------
theToUpdate: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Activates IBL from background cubemap.
") GeneratePBREnvironment;
		void GeneratePBREnvironment(Standard_Boolean theToUpdate = Standard_False);

		/****** V3d_View::GetGraduatedTrihedron ******/
		/****** md5 signature: 794e42c6b2c8242dbf3d37d05f637325 ******/
		%feature("compactdefaultargs") GetGraduatedTrihedron;
		%feature("autodoc", "Return
-------
Graphic3d_GraduatedTrihedron

Description
-----------
Returns data of a graduated trihedron.
") GetGraduatedTrihedron;
		const Graphic3d_GraduatedTrihedron & GetGraduatedTrihedron();

		/****** V3d_View::GradientBackground ******/
		/****** md5 signature: d48840592ec4f12118e8b8d065c33698 ******/
		%feature("compactdefaultargs") GradientBackground;
		%feature("autodoc", "Return
-------
Aspect_GradientBackground

Description
-----------
Returns the gradient background of the view.
") GradientBackground;
		Aspect_GradientBackground GradientBackground();

		/****** V3d_View::GradientBackgroundColors ******/
		/****** md5 signature: a52768bb2e579df3132db426f0602dc7 ******/
		%feature("compactdefaultargs") GradientBackgroundColors;
		%feature("autodoc", "
Parameters
----------
theColor1: Quantity_Color
theColor2: Quantity_Color

Return
-------
None

Description
-----------
Returns the gradient background colors of the view.
") GradientBackgroundColors;
		void GradientBackgroundColors(Quantity_Color & theColor1, Quantity_Color & theColor2);

		/****** V3d_View::GraduatedTrihedronDisplay ******/
		/****** md5 signature: dbf1f4106328e0eaeb68ba87df7d13fd ******/
		%feature("compactdefaultargs") GraduatedTrihedronDisplay;
		%feature("autodoc", "
Parameters
----------
theTrihedronData: Graphic3d_GraduatedTrihedron

Return
-------
None

Description
-----------
Displays a graduated trihedron.
") GraduatedTrihedronDisplay;
		void GraduatedTrihedronDisplay(const Graphic3d_GraduatedTrihedron & theTrihedronData);

		/****** V3d_View::GraduatedTrihedronErase ******/
		/****** md5 signature: 95c05899cb81d7c63eac53c98df564a6 ******/
		%feature("compactdefaultargs") GraduatedTrihedronErase;
		%feature("autodoc", "Return
-------
None

Description
-----------
Erases a graduated trihedron from the view.
") GraduatedTrihedronErase;
		void GraduatedTrihedronErase();

		/****** V3d_View::GravityPoint ******/
		/****** md5 signature: 004e900fb115ca106c6a5fcdd3ac1e07 ******/
		%feature("compactdefaultargs") GravityPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the Objects number and the gravity center of ALL viewable points in the view.
") GravityPoint;
		gp_Pnt GravityPoint();

		/****** V3d_View::IfMoreLights ******/
		/****** md5 signature: f43a715413579a7ba11da9f479d85caa ******/
		%feature("compactdefaultargs") IfMoreLights;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if One light more can be activated in this View.
") IfMoreLights;
		Standard_Boolean IfMoreLights();

		/****** V3d_View::IfWindow ******/
		/****** md5 signature: bf40a6fc869cb2eb0b91d5e1420b8857 ******/
		%feature("compactdefaultargs") IfWindow;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if MyView is associated with a window .
") IfWindow;
		Standard_Boolean IfWindow();

		/****** V3d_View::InitActiveLights ******/
		/****** md5 signature: 96e937460d9e6ec0513824da2242388a ******/
		%feature("compactdefaultargs") InitActiveLights;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitActiveLights;
		void InitActiveLights();

		/****** V3d_View::Invalidate ******/
		/****** md5 signature: 0ab0e2c678e575a4d179bf46b4d4d469 ******/
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "Return
-------
None

Description
-----------
Invalidates view content but does not redraw it.
") Invalidate;
		void Invalidate();

		/****** V3d_View::InvalidateImmediate ******/
		/****** md5 signature: af5f9e1933171915e9ecf1710ca73c90 ******/
		%feature("compactdefaultargs") InvalidateImmediate;
		%feature("autodoc", "Return
-------
None

Description
-----------
Invalidates view content within immediate layer but does not redraw it.
") InvalidateImmediate;
		void InvalidateImmediate();

		/****** V3d_View::IsActiveLight ******/
		/****** md5 signature: 1b7eecf8283a3900e6f00f48ff23eb43 ******/
		%feature("compactdefaultargs") IsActiveLight;
		%feature("autodoc", "
Parameters
----------
theLight: V3d_Light

Return
-------
bool

Description
-----------
Returns True when the light is active in this view.
") IsActiveLight;
		Standard_Boolean IsActiveLight(const opencascade::handle<V3d_Light> & theLight);

		/****** V3d_View::IsCullingEnabled ******/
		/****** md5 signature: 3c3ff9bdad3b548d6f8e34a24098347a ******/
		%feature("compactdefaultargs") IsCullingEnabled;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return: flag value of objects culling mechanism.
") IsCullingEnabled;
		Standard_Boolean IsCullingEnabled();

		/****** V3d_View::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the status of the view regarding the displayed structures inside Returns True is The View is empty.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** V3d_View::IsImageBasedLighting ******/
		/****** md5 signature: 8dbfce401659fd5ec60c2f81c736a1ca ******/
		%feature("compactdefaultargs") IsImageBasedLighting;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if IBL (Image Based Lighting) from background cubemap is enabled.
") IsImageBasedLighting;
		Standard_Boolean IsImageBasedLighting();

		/****** V3d_View::IsInvalidated ******/
		/****** md5 signature: ec866d0cff19cca721935f26d32ef8c3 ******/
		%feature("compactdefaultargs") IsInvalidated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if cached view content has been invalidated.
") IsInvalidated;
		Standard_Boolean IsInvalidated();

		/****** V3d_View::IsInvalidatedImmediate ******/
		/****** md5 signature: 246e4ead0b5a5b9e57fb79c2142261e4 ******/
		%feature("compactdefaultargs") IsInvalidatedImmediate;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if immediate layer content has been invalidated.
") IsInvalidatedImmediate;
		Standard_Boolean IsInvalidatedImmediate();

		/****** V3d_View::IsSubview ******/
		/****** md5 signature: e4786984f763125a6b3ee9d1975a34eb ******/
		%feature("compactdefaultargs") IsSubview;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if this is a subview of another view.
") IsSubview;
		bool IsSubview();

		/****** V3d_View::LightLimit ******/
		/****** md5 signature: b11a43a1516a029b988eec97675ac76a ******/
		%feature("compactdefaultargs") LightLimit;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the MAX number of light associated to the view.
") LightLimit;
		Standard_Integer LightLimit();

		/****** V3d_View::MoreActiveLights ******/
		/****** md5 signature: 159743d840ad62ed3830acf9e90ae539 ******/
		%feature("compactdefaultargs") MoreActiveLights;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreActiveLights;
		Standard_Boolean MoreActiveLights();

		/****** V3d_View::Move ******/
		/****** md5 signature: bfe8868b7ed23bccc6c6361fc9ab9ec9 ******/
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "
Parameters
----------
Dx: float
Dy: float
Dz: float
Start: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Movement of the eye parallel to the coordinate system of reference of the screen a distance relative to the initial position expressed by Start = Standard_True.
") Move;
		void Move(const Standard_Real Dx, const Standard_Real Dy, const Standard_Real Dz, const Standard_Boolean Start = Standard_True);

		/****** V3d_View::Move ******/
		/****** md5 signature: 2a8a67b2e4fd50fad4ebd15f76512979 ******/
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "
Parameters
----------
Axe: V3d_TypeOfAxe
Length: float
Start: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Movement of the eye parallel to one of the axes of the coordinate system of reference of the view a distance relative to the initial position expressed by Start = Standard_True.
") Move;
		void Move(const V3d_TypeOfAxe Axe, const Standard_Real Length, const Standard_Boolean Start = Standard_True);

		/****** V3d_View::Move ******/
		/****** md5 signature: aa69fe36271d81a3360019cc9df01e24 ******/
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "
Parameters
----------
Length: float
Start: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Movement of the eye parllel to the current axis a distance relative to the initial position expressed by Start = Standard_True.
") Move;
		void Move(const Standard_Real Length, const Standard_Boolean Start = Standard_True);

		/****** V3d_View::MustBeResized ******/
		/****** md5 signature: 6f5bcdd6dbbbbd1e8de0181e04dcdda7 ******/
		%feature("compactdefaultargs") MustBeResized;
		%feature("autodoc", "Return
-------
None

Description
-----------
Must be called when the window supporting the view changes size. if the view is not mapped on a window. Warning: The view is centered and resized to preserve the height/width ratio of the window.
") MustBeResized;
		void MustBeResized();

		/****** V3d_View::NextActiveLights ******/
		/****** md5 signature: 221700382f0fef8d1ac7d43635ea1bc5 ******/
		%feature("compactdefaultargs") NextActiveLights;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextActiveLights;
		void NextActiveLights();

		/****** V3d_View::Pan ******/
		/****** md5 signature: 2f7f5bf76c9662c45037f98619403207 ******/
		%feature("compactdefaultargs") Pan;
		%feature("autodoc", "
Parameters
----------
theDXp: int
theDYp: int
theZoomFactor: float (optional, default to 1)
theToStart: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Translates the center of the view along 'x' and 'y' axes of view projection. Can be used to perform interactive panning operation. In that case the DXp, DXp parameters specify panning relative to the point where the operation is started. 
Input parameter: theDXp the relative panning on 'x' axis of view projection, in pixels. 
Input parameter: theDYp the relative panning on 'y' axis of view projection, in pixels. 
Input parameter: theZoomFactor the zooming factor. 
Input parameter: theToStart pass True when starting panning to remember view state prior to panning for relative arguments. Passing 0 for relative panning parameter should return view panning to initial state. Performs update of view.
") Pan;
		void Pan(const Standard_Integer theDXp, const Standard_Integer theDYp, const Standard_Real theZoomFactor = 1, const Standard_Boolean theToStart = Standard_True);

		/****** V3d_View::Panning ******/
		/****** md5 signature: 49d9ae1d50ae7bbb92e9baf7a23733c1 ******/
		%feature("compactdefaultargs") Panning;
		%feature("autodoc", "
Parameters
----------
theDXv: float
theDYv: float
theZoomFactor: float (optional, default to 1)
theToStart: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Translates the center of the view along 'x' and 'y' axes of view projection. Can be used to perform interactive panning operation. In that case the DXv, DXy parameters specify panning relative to the point where the operation is started. 
Input parameter: theDXv the relative panning on 'x' axis of view projection, in view space coordinates. 
Input parameter: theDYv the relative panning on 'y' axis of view projection, in view space coordinates. 
Input parameter: theZoomFactor the zooming factor. 
Input parameter: theToStart pass True when starting panning to remember view state prior to panning for relative arguments. If panning is started, passing {0, 0} for {theDXv, theDYv} will return view to initial state. Performs update of view.
") Panning;
		void Panning(const Standard_Real theDXv, const Standard_Real theDYv, const Standard_Real theZoomFactor = 1, const Standard_Boolean theToStart = Standard_True);

		/****** V3d_View::ParentView ******/
		/****** md5 signature: 1fedb0f310727ce611da19aaba5cb0df ******/
		%feature("compactdefaultargs") ParentView;
		%feature("autodoc", "Return
-------
V3d_View *

Description
-----------
Return parent View or NULL if this is not a subview.
") ParentView;
		V3d_View * ParentView();

		/****** V3d_View::PickSubview ******/
		/****** md5 signature: ae3284197a75c2e344a9fb46d3fc2c53 ******/
		%feature("compactdefaultargs") PickSubview;
		%feature("autodoc", "
Parameters
----------
thePnt: Graphic3d_Vec2i

Return
-------
opencascade::handle<V3d_View>

Description
-----------
Pick subview from the given 2D point.
") PickSubview;
		opencascade::handle<V3d_View> PickSubview(const Graphic3d_Vec2i & thePnt);

		/****** V3d_View::Place ******/
		/****** md5 signature: 8b79579dde4d0cdc166a71e9b2247f26 ******/
		%feature("compactdefaultargs") Place;
		%feature("autodoc", "
Parameters
----------
theXp: int
theYp: int
theZoomFactor: float (optional, default to 1)

Return
-------
None

Description
-----------
places the point of the view corresponding at the pixel position x,y at the center of the window and updates the view.
") Place;
		void Place(const Standard_Integer theXp, const Standard_Integer theYp, const Standard_Real theZoomFactor = 1);

		/****** V3d_View::PlaneLimit ******/
		/****** md5 signature: 60ec8fb32171fff42258cb80cef67888 ******/
		%feature("compactdefaultargs") PlaneLimit;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the MAX number of clipping planes associated to the view.
") PlaneLimit;
		Standard_Integer PlaneLimit();

		/****** V3d_View::Proj ******/
		/****** md5 signature: a1a807294c0022302092b61e24ceaab5 ******/
		%feature("compactdefaultargs") Proj;
		%feature("autodoc", "
Parameters
----------

Return
-------
Vx: float
Vy: float
Vz: float

Description
-----------
Returns the projection vector.
") Proj;
		void Proj(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** V3d_View::ProjReferenceAxe ******/
		/****** md5 signature: 28f60e42b731f9b7748c5f667cf688cf ******/
		%feature("compactdefaultargs") ProjReferenceAxe;
		%feature("autodoc", "
Parameters
----------
Xpix: int
Ypix: int

Return
-------
XP: float
YP: float
ZP: float
VX: float
VY: float
VZ: float

Description
-----------
Returns the coordinate of the point (Xpix,Ypix) in the view (XP,YP,ZP), and the projection vector of the view passing by the point (for PerspectiveView).
") ProjReferenceAxe;
		void ProjReferenceAxe(const Standard_Integer Xpix, const Standard_Integer Ypix, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** V3d_View::Project ******/
		/****** md5 signature: c1560b7b11ea11b43fa11d6796d84982 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
theX: float
theY: float
theZ: float

Return
-------
theXp: float
theYp: float

Description
-----------
Converts the point defined in the user space of the view to the projection plane at the depth relative to theZ.
") Project;
		void Project(const Standard_Real theX, const Standard_Real theY, const Standard_Real theZ, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** V3d_View::Project ******/
		/****** md5 signature: ea216701af7b7d7e3a7e3741f1707328 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
theX: float
theY: float
theZ: float

Return
-------
theXp: float
theYp: float
theZp: float

Description
-----------
Converts the point defined in the user space of the view to the projection plane at the depth relative to theZ.
") Project;
		void Project(const Standard_Real theX, const Standard_Real theY, const Standard_Real theZ, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** V3d_View::Redraw ******/
		/****** md5 signature: d79a17dc7691c4758660ab9ea8765cba ******/
		%feature("compactdefaultargs") Redraw;
		%feature("autodoc", "Return
-------
None

Description
-----------
Redisplays the view even if there has not been any modification. Must be called if the view is shown. (Ex: DeIconification ) .
") Redraw;
		virtual void Redraw();

		/****** V3d_View::RedrawImmediate ******/
		/****** md5 signature: 590fb2b1bdf9e2935ef5496eaed0b837 ******/
		%feature("compactdefaultargs") RedrawImmediate;
		%feature("autodoc", "Return
-------
None

Description
-----------
Updates layer of immediate presentations.
") RedrawImmediate;
		virtual void RedrawImmediate();

		/****** V3d_View::Remove ******/
		/****** md5 signature: 0346504d7ac570fc8960fb72d5ad5f20 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Return
-------
None

Description
-----------
Destroys the view.
") Remove;
		void Remove();

		/****** V3d_View::RemoveClipPlane ******/
		/****** md5 signature: e644cc8dadfbe38b4691bed6b83a05f2 ******/
		%feature("compactdefaultargs") RemoveClipPlane;
		%feature("autodoc", "
Parameters
----------
thePlane: Graphic3d_ClipPlane

Return
-------
None

Description
-----------
Removes clip plane from the view. 
Input parameter: thePlane the clip plane to be removed from view.
") RemoveClipPlane;
		virtual void RemoveClipPlane(const opencascade::handle<Graphic3d_ClipPlane> & thePlane);

		/****** V3d_View::RemoveSubview ******/
		/****** md5 signature: 597a3f67c828ab5b584dae0746ef84d0 ******/
		%feature("compactdefaultargs") RemoveSubview;
		%feature("autodoc", "
Parameters
----------
theView: V3d_View *

Return
-------
bool

Description
-----------
Remove subview from the list.
") RemoveSubview;
		bool RemoveSubview(const V3d_View * theView);

		/****** V3d_View::RenderingParams ******/
		/****** md5 signature: d19e1c94557ee6d68fe1c775b8ab94f6 ******/
		%feature("compactdefaultargs") RenderingParams;
		%feature("autodoc", "Return
-------
Graphic3d_RenderingParams

Description
-----------
Returns current rendering parameters and effect settings. By default it returns default parameters of current viewer. To define view-specific settings use method V3d_View::ChangeRenderingParams(). 
See also: V3d_Viewer::DefaultRenderingParams().
") RenderingParams;
		const Graphic3d_RenderingParams & RenderingParams();

		/****** V3d_View::Reset ******/
		/****** md5 signature: 2ad89d69d035383548acf0fcb055a9d1 ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "
Parameters
----------
theToUpdate: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Resets the centering and the orientation of the view.
") Reset;
		void Reset(const Standard_Boolean theToUpdate = Standard_True);

		/****** V3d_View::ResetViewMapping ******/
		/****** md5 signature: 23069dec01b2a57a9aeda1c3be138f60 ******/
		%feature("compactdefaultargs") ResetViewMapping;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets the centering of the view. Updates the view.
") ResetViewMapping;
		void ResetViewMapping();

		/****** V3d_View::ResetViewOrientation ******/
		/****** md5 signature: d8951a9faded96e9feb9ee5df1086fe0 ******/
		%feature("compactdefaultargs") ResetViewOrientation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets the orientation of the view. Updates the view.
") ResetViewOrientation;
		void ResetViewOrientation();

		/****** V3d_View::Rotate ******/
		/****** md5 signature: 37ac43ec8d8fdf73c4b0708da2c367c9 ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
Ax: float
Ay: float
Az: float
Start: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Rotates the eye about the coordinate system of reference of the screen for which the origin is the view point of the projection, with a relative angular value in RADIANS with respect to the initial position expressed by Start = Standard_True Warning! raises BadValue from V3d If the eye, the view point, or the high point are aligned or confused.
") Rotate;
		void Rotate(const Standard_Real Ax, const Standard_Real Ay, const Standard_Real Az, const Standard_Boolean Start = Standard_True);

		/****** V3d_View::Rotate ******/
		/****** md5 signature: a8dd07c8f75821d1e2bbfbfe0279f86d ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
Ax: float
Ay: float
Az: float
X: float
Y: float
Z: float
Start: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Rotates the eye about the coordinate system of reference of the screen for which the origin is Gravity point {X,Y,Z}, with a relative angular value in RADIANS with respect to the initial position expressed by Start = Standard_True If the eye, the view point, or the high point are aligned or confused.
") Rotate;
		void Rotate(const Standard_Real Ax, const Standard_Real Ay, const Standard_Real Az, const Standard_Real X, const Standard_Real Y, const Standard_Real Z, const Standard_Boolean Start = Standard_True);

		/****** V3d_View::Rotate ******/
		/****** md5 signature: 1ca4c68b743a97ede65efaefd7467e64 ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
Axe: V3d_TypeOfAxe
Angle: float
X: float
Y: float
Z: float
Start: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Rotates the eye about one of the coordinate axes of of the view for which the origin is the Gravity point{X,Y,Z} with an relative angular value in RADIANS with respect to the initial position expressed by Start = Standard_True.
") Rotate;
		void Rotate(const V3d_TypeOfAxe Axe, const Standard_Real Angle, const Standard_Real X, const Standard_Real Y, const Standard_Real Z, const Standard_Boolean Start = Standard_True);

		/****** V3d_View::Rotate ******/
		/****** md5 signature: 1b8483bfbd971309de1de9f173ca987f ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
Axe: V3d_TypeOfAxe
Angle: float
Start: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Rotates the eye about one of the coordinate axes of of the view for which the origin is the view point of the projection with an relative angular value in RADIANS with respect to the initial position expressed by Start = Standard_True.
") Rotate;
		void Rotate(const V3d_TypeOfAxe Axe, const Standard_Real Angle, const Standard_Boolean Start = Standard_True);

		/****** V3d_View::Rotate ******/
		/****** md5 signature: 341432f896f476a8a798cf55be3fe4a7 ******/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
Angle: float
Start: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Rotates the eye around the current axis a relative angular value in RADIANS with respect to the initial position expressed by Start = Standard_True.
") Rotate;
		void Rotate(const Standard_Real Angle, const Standard_Boolean Start = Standard_True);

		/****** V3d_View::Rotation ******/
		/****** md5 signature: 05a729a5eb6c2fdb0999c3616dec3613 ******/
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "
Parameters
----------
X: int
Y: int

Return
-------
None

Description
-----------
Continues the rotation of the view with an angle computed from the last and new mouse position <X,Y>.
") Rotation;
		void Rotation(const Standard_Integer X, const Standard_Integer Y);

		/****** V3d_View::Scale ******/
		/****** md5 signature: 4c0fd48707c01e5a42b2a639ca08da30 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the current value of the zoom expressed with respect to SetViewMappingDefault().
") Scale;
		Standard_Real Scale();

		/****** V3d_View::SetAt ******/
		/****** md5 signature: 720ff09ebfa72fd1bced6b13fb670b4c ******/
		%feature("compactdefaultargs") SetAt;
		%feature("autodoc", "
Parameters
----------
X: float
Y: float
Z: float

Return
-------
None

Description
-----------
Defines the position of the view point.
") SetAt;
		void SetAt(const Standard_Real X, const Standard_Real Y, const Standard_Real Z);

		/****** V3d_View::SetAutoZFitMode ******/
		/****** md5 signature: 694f0e3240c97cee56f1da23059e80ec ******/
		%feature("compactdefaultargs") SetAutoZFitMode;
		%feature("autodoc", "
Parameters
----------
theIsOn: bool
theScaleFactor: float (optional, default to 1.0)

Return
-------
None

Description
-----------
Sets the automatic z-fit mode and its parameters. The auto z-fit has extra parameters which can controlled from application level to ensure that the size of viewing volume will be sufficiently large to cover the depth of unmanaged objects, for example, transformation persistent ones. 
Input parameter: theScaleFactor the scale factor for Z-range. The range between Z-min, Z-max projection volume planes evaluated by z fitting method will be scaled using this coefficient. Program error exception is thrown if negative or zero value is passed.
") SetAutoZFitMode;
		void SetAutoZFitMode(const Standard_Boolean theIsOn, const Standard_Real theScaleFactor = 1.0);

		/****** V3d_View::SetAxialScale ******/
		/****** md5 signature: 148c5e2b6e7d5a5a413d17f39128a26e ******/
		%feature("compactdefaultargs") SetAxialScale;
		%feature("autodoc", "
Parameters
----------
Sx: float
Sy: float
Sz: float

Return
-------
None

Description
-----------
Sets anisotropic (axial) scale factors <Sx>, <Sy>, <Sz> for view <self>. Anisotropic scaling operation is performed through multiplying the current view orientation matrix by a scaling matrix: || Sx 0 0 0 || || 0 Sy 0 0 || || 0 0 Sz 0 || || 0 0 0 1 || Updates the view.
") SetAxialScale;
		void SetAxialScale(const Standard_Real Sx, const Standard_Real Sy, const Standard_Real Sz);

		/****** V3d_View::SetAxis ******/
		/****** md5 signature: 94f04d722946b3d73aa71d7d5623cd07 ******/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "
Parameters
----------
X: float
Y: float
Z: float
Vx: float
Vy: float
Vz: float

Return
-------
None

Description
-----------
Definition of an axis from its origin and its orientation . This will be the current axis for rotations and movements. Warning! raises BadValue from V3d if the vector normal is NULL. .
") SetAxis;
		void SetAxis(const Standard_Real X, const Standard_Real Y, const Standard_Real Z, const Standard_Real Vx, const Standard_Real Vy, const Standard_Real Vz);

		/****** V3d_View::SetBackFacingModel ******/
		/****** md5 signature: 56ed000419d4071d1041855cec2bbe5f ******/
		%feature("compactdefaultargs") SetBackFacingModel;
		%feature("autodoc", "
Parameters
----------
theModel: Graphic3d_TypeOfBackfacingModel (optional, default to Graphic3d_TypeOfBackfacingModel_Auto)

Return
-------
None

Description
-----------
Manages display of the back faces.
") SetBackFacingModel;
		void SetBackFacingModel(const Graphic3d_TypeOfBackfacingModel theModel = Graphic3d_TypeOfBackfacingModel_Auto);

		/****** V3d_View::SetBackgroundColor ******/
		/****** md5 signature: b5a0d9f80a350764624098a365179a93 ******/
		%feature("compactdefaultargs") SetBackgroundColor;
		%feature("autodoc", "
Parameters
----------
theType: Quantity_TypeOfColor
theV1: float
theV2: float
theV3: float

Return
-------
None

Description
-----------
Defines the background color of the view by the color definition type and the three corresponding values.
") SetBackgroundColor;
		void SetBackgroundColor(const Quantity_TypeOfColor theType, const Standard_Real theV1, const Standard_Real theV2, const Standard_Real theV3);

		/****** V3d_View::SetBackgroundColor ******/
		/****** md5 signature: 59e6dfdc828d6e477040bf2ce9f26aaf ******/
		%feature("compactdefaultargs") SetBackgroundColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Defines the background color of the view.
") SetBackgroundColor;
		void SetBackgroundColor(const Quantity_Color & theColor);

		/****** V3d_View::SetBackgroundCubeMap ******/
		/****** md5 signature: 2c70bfeaeff2462250acde85f96d119b ******/
		%feature("compactdefaultargs") SetBackgroundCubeMap;
		%feature("autodoc", "
Parameters
----------
theCubeMap: Graphic3d_CubeMap
theToUpdatePBREnv: bool (optional, default to Standard_True)
theToUpdate: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Sets environment cubemap as background. 
Parameter theCubeMap cubemap source to be set as background 
Parameter theToUpdatePBREnv defines whether IBL maps will be generated or not (see 'GeneratePBREnvironment').
") SetBackgroundCubeMap;
		void SetBackgroundCubeMap(const opencascade::handle<Graphic3d_CubeMap> & theCubeMap, Standard_Boolean theToUpdatePBREnv = Standard_True, Standard_Boolean theToUpdate = Standard_False);

		/****** V3d_View::SetBackgroundImage ******/
		/****** md5 signature: 56244ced11a568c705352f7992e3c593 ******/
		%feature("compactdefaultargs") SetBackgroundImage;
		%feature("autodoc", "
Parameters
----------
theFileName: str
theFillStyle: Aspect_FillMethod (optional, default to Aspect_FM_CENTERED)
theToUpdate: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Defines the background texture of the view by supplying the texture image file name and fill method (centered by default).
") SetBackgroundImage;
		void SetBackgroundImage(Standard_CString theFileName, const Aspect_FillMethod theFillStyle = Aspect_FM_CENTERED, const Standard_Boolean theToUpdate = Standard_False);

		/****** V3d_View::SetBackgroundImage ******/
		/****** md5 signature: 4082281fe8d9c0c887d121ff7ee0f92c ******/
		%feature("compactdefaultargs") SetBackgroundImage;
		%feature("autodoc", "
Parameters
----------
theTexture: Graphic3d_Texture2D
theFillStyle: Aspect_FillMethod (optional, default to Aspect_FM_CENTERED)
theToUpdate: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Defines the background texture of the view by supplying the texture and fill method (centered by default).
") SetBackgroundImage;
		void SetBackgroundImage(const opencascade::handle<Graphic3d_Texture2D> & theTexture, const Aspect_FillMethod theFillStyle = Aspect_FM_CENTERED, const Standard_Boolean theToUpdate = Standard_False);

		/****** V3d_View::SetBackgroundSkydome ******/
		/****** md5 signature: 25ac38bc9b5749e5230aaefbd5f8cce1 ******/
		%feature("compactdefaultargs") SetBackgroundSkydome;
		%feature("autodoc", "
Parameters
----------
theAspect: Aspect_SkydomeBackground
theToUpdatePBREnv: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Sets skydome aspect 
Parameter theAspect cubemap generation parameters 
Parameter theToUpdatePBREnv defines whether IBL maps will be generated or not.
") SetBackgroundSkydome;
		void SetBackgroundSkydome(const Aspect_SkydomeBackground & theAspect, Standard_Boolean theToUpdatePBREnv = Standard_True);

		/****** V3d_View::SetBgGradientColors ******/
		/****** md5 signature: 3049343ce59ac7e41a044f16276d9ed3 ******/
		%feature("compactdefaultargs") SetBgGradientColors;
		%feature("autodoc", "
Parameters
----------
theColor1: Quantity_Color
theColor2: Quantity_Color
theFillStyle: Aspect_GradientFillMethod (optional, default to Aspect_GradientFillMethod_Horizontal)
theToUpdate: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Defines the gradient background colors of the view by supplying the colors and the fill method (horizontal by default).
") SetBgGradientColors;
		void SetBgGradientColors(const Quantity_Color & theColor1, const Quantity_Color & theColor2, const Aspect_GradientFillMethod theFillStyle = Aspect_GradientFillMethod_Horizontal, const Standard_Boolean theToUpdate = Standard_False);

		/****** V3d_View::SetBgGradientStyle ******/
		/****** md5 signature: 45ec7afa0094d85e0d4e8c7f3395a8f1 ******/
		%feature("compactdefaultargs") SetBgGradientStyle;
		%feature("autodoc", "
Parameters
----------
theMethod: Aspect_GradientFillMethod (optional, default to Aspect_GradientFillMethod_Horizontal)
theToUpdate: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Defines the gradient background fill method of the view.
") SetBgGradientStyle;
		void SetBgGradientStyle(const Aspect_GradientFillMethod theMethod = Aspect_GradientFillMethod_Horizontal, const Standard_Boolean theToUpdate = Standard_False);

		/****** V3d_View::SetBgImageStyle ******/
		/****** md5 signature: b2cd58264970b84f205845e49cfab5e5 ******/
		%feature("compactdefaultargs") SetBgImageStyle;
		%feature("autodoc", "
Parameters
----------
theFillStyle: Aspect_FillMethod
theToUpdate: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Defines the textured background fill method of the view.
") SetBgImageStyle;
		void SetBgImageStyle(const Aspect_FillMethod theFillStyle, const Standard_Boolean theToUpdate = Standard_False);

		/****** V3d_View::SetCamera ******/
		/****** md5 signature: feb4846a043de91d4d1b29714dfe3b70 ******/
		%feature("compactdefaultargs") SetCamera;
		%feature("autodoc", "
Parameters
----------
theCamera: Graphic3d_Camera

Return
-------
None

Description
-----------
Change camera used by view.
") SetCamera;
		void SetCamera(const opencascade::handle<Graphic3d_Camera> & theCamera);

		/****** V3d_View::SetCenter ******/
		/****** md5 signature: edab316f8dd9ae9296f0af644eddcedd ******/
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "
Parameters
----------
theXp: int
theYp: int

Return
-------
None

Description
-----------
Relocates center of screen to the point, determined by {Xp, Yp} pixel coordinates relative to the bottom-left corner of screen. To calculate pixel coordinates for any point from world coordinate space, it can be projected using 'Project'. 
Input parameter: theXp the x coordinate. 
Input parameter: theYp the y coordinate.
") SetCenter;
		void SetCenter(const Standard_Integer theXp, const Standard_Integer theYp);

		/****** V3d_View::SetClipPlanes ******/
		/****** md5 signature: 3a7856a5edcaa36a5327770acfe803b0 ******/
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "
Parameters
----------
thePlanes: Graphic3d_SequenceOfHClipPlane

Return
-------
None

Description
-----------
Sets sequence of clip planes to the view. The planes that have been set before are removed from the view. The composition of clip planes truncates the rendering space to convex volume. Number of supported clip planes can be consulted by InquirePlaneLimit method of Graphic3d_GraphicDriver. Please be aware that the planes that exceed the limit are ignored during rendering. 
Input parameter: thePlanes the clip planes to set.
") SetClipPlanes;
		void SetClipPlanes(const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & thePlanes);

		/****** V3d_View::SetComputedMode ******/
		/****** md5 signature: 269d3bae92efe31d98d859df0012cf4d ******/
		%feature("compactdefaultargs") SetComputedMode;
		%feature("autodoc", "
Parameters
----------
theMode: bool

Return
-------
None

Description
-----------
Switches computed HLR mode in the view.
") SetComputedMode;
		void SetComputedMode(const Standard_Boolean theMode);

		/****** V3d_View::SetDepth ******/
		/****** md5 signature: d425c957b63eb5a47c2e5afbe949ecb8 ******/
		%feature("compactdefaultargs") SetDepth;
		%feature("autodoc", "
Parameters
----------
Depth: float

Return
-------
None

Description
-----------
Defines the Depth of the eye from the view point without update the projection .
") SetDepth;
		void SetDepth(const Standard_Real Depth);

		/****** V3d_View::SetEye ******/
		/****** md5 signature: 853c91c04ecdde43f9f722eb2123b162 ******/
		%feature("compactdefaultargs") SetEye;
		%feature("autodoc", "
Parameters
----------
X: float
Y: float
Z: float

Return
-------
None

Description
-----------
Defines the position of the eye..
") SetEye;
		void SetEye(const Standard_Real X, const Standard_Real Y, const Standard_Real Z);

		/****** V3d_View::SetFocale ******/
		/****** md5 signature: fd6951ff72f1057400a656a38e12591e ******/
		%feature("compactdefaultargs") SetFocale;
		%feature("autodoc", "
Parameters
----------
Focale: float

Return
-------
None

Description
-----------
Change View Plane Distance for Perspective Views Warning! raises TypeMismatch from Standard if the view is not a perspective view.
") SetFocale;
		void SetFocale(const Standard_Real Focale);

		/****** V3d_View::SetFront ******/
		/****** md5 signature: 0bead267cee2c0fd25d14d75a33a7e30 ******/
		%feature("compactdefaultargs") SetFront;
		%feature("autodoc", "Return
-------
None

Description
-----------
modify the Projection of the view perpendicularly to the privileged plane of the viewer.
") SetFront;
		void SetFront();

		/****** V3d_View::SetFrustumCulling ******/
		/****** md5 signature: cd3bc7120d3702ea29315dd0146d05f4 ******/
		%feature("compactdefaultargs") SetFrustumCulling;
		%feature("autodoc", "
Parameters
----------
theMode: bool

Return
-------
None

Description
-----------
Turn on/off automatic culling of objects outside frustum (ON by default).
") SetFrustumCulling;
		void SetFrustumCulling(Standard_Boolean theMode);

		/****** V3d_View::SetGrid ******/
		/****** md5 signature: 0ba6c21ecdc3dc75968a47b2df6a7f10 ******/
		%feature("compactdefaultargs") SetGrid;
		%feature("autodoc", "
Parameters
----------
aPlane: gp_Ax3
aGrid: Aspect_Grid

Return
-------
None

Description
-----------
Defines or Updates the definition of the grid in <self>.
") SetGrid;
		void SetGrid(const gp_Ax3 & aPlane, const opencascade::handle<Aspect_Grid> & aGrid);

		/****** V3d_View::SetGridActivity ******/
		/****** md5 signature: cd3125bb63d4526b365a7efc378bafea ******/
		%feature("compactdefaultargs") SetGridActivity;
		%feature("autodoc", "
Parameters
----------
aFlag: bool

Return
-------
None

Description
-----------
Defines or Updates the activity of the grid in <self>.
") SetGridActivity;
		void SetGridActivity(const Standard_Boolean aFlag);

		/****** V3d_View::SetImageBasedLighting ******/
		/****** md5 signature: 560b4eb4d03f5ccdff44b61c15156a72 ******/
		%feature("compactdefaultargs") SetImageBasedLighting;
		%feature("autodoc", "
Parameters
----------
theToEnableIBL: bool
theToUpdate: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Enables or disables IBL (Image Based Lighting) from background cubemap. Has no effect if PBR is not used. 
Input parameter: theToEnableIBL enable or disable IBL from background cubemap 
Input parameter: theToUpdate redraw the view.
") SetImageBasedLighting;
		void SetImageBasedLighting(Standard_Boolean theToEnableIBL, Standard_Boolean theToUpdate = Standard_False);

		/****** V3d_View::SetImmediateUpdate ******/
		/****** md5 signature: b930e6c2cf96f1b5cd3b04092063cb66 ******/
		%feature("compactdefaultargs") SetImmediateUpdate;
		%feature("autodoc", "
Parameters
----------
theImmediateUpdate: bool

Return
-------
bool

Description
-----------
sets the immediate update mode and returns the previous one.
") SetImmediateUpdate;
		Standard_Boolean SetImmediateUpdate(const Standard_Boolean theImmediateUpdate);

		/****** V3d_View::SetLightOff ******/
		/****** md5 signature: 455cedd8ba3c305764630cd94d4a9d57 ******/
		%feature("compactdefaultargs") SetLightOff;
		%feature("autodoc", "
Parameters
----------
theLight: V3d_Light

Return
-------
None

Description
-----------
Deactivate theLight in this view.
") SetLightOff;
		void SetLightOff(const opencascade::handle<V3d_Light> & theLight);

		/****** V3d_View::SetLightOff ******/
		/****** md5 signature: bf38107f690adbb6b0f411e0bf63da48 ******/
		%feature("compactdefaultargs") SetLightOff;
		%feature("autodoc", "Return
-------
None

Description
-----------
Deactivate all the Lights defined in this view.
") SetLightOff;
		void SetLightOff();

		/****** V3d_View::SetLightOn ******/
		/****** md5 signature: d1efc51d1bc7b893aa6cd272504c6805 ******/
		%feature("compactdefaultargs") SetLightOn;
		%feature("autodoc", "
Parameters
----------
theLight: V3d_Light

Return
-------
None

Description
-----------
Activates theLight in the view.
") SetLightOn;
		void SetLightOn(const opencascade::handle<V3d_Light> & theLight);

		/****** V3d_View::SetLightOn ******/
		/****** md5 signature: 0dbd37321a0295b614d3d0d9cd0a3fe9 ******/
		%feature("compactdefaultargs") SetLightOn;
		%feature("autodoc", "Return
-------
None

Description
-----------
Activates all the lights defined in this view.
") SetLightOn;
		void SetLightOn();

		/****** V3d_View::SetMagnify ******/
		/****** md5 signature: 086f8ea9570231142c44b0f3ba3194cf ******/
		%feature("compactdefaultargs") SetMagnify;
		%feature("autodoc", "
Parameters
----------
theWindow: Aspect_Window
thePreviousView: V3d_View
theX1: int
theY1: int
theX2: int
theY2: int

Return
-------
None

Description
-----------
No available documentation.
") SetMagnify;
		void SetMagnify(const opencascade::handle<Aspect_Window> & theWindow, const opencascade::handle<V3d_View> & thePreviousView, const Standard_Integer theX1, const Standard_Integer theY1, const Standard_Integer theX2, const Standard_Integer theY2);

		/****** V3d_View::SetProj ******/
		/****** md5 signature: 26211bc22e4e16666a156f93f39342cd ******/
		%feature("compactdefaultargs") SetProj;
		%feature("autodoc", "
Parameters
----------
Vx: float
Vy: float
Vz: float

Return
-------
None

Description
-----------
Defines the orientation of the projection.
") SetProj;
		void SetProj(const Standard_Real Vx, const Standard_Real Vy, const Standard_Real Vz);

		/****** V3d_View::SetProj ******/
		/****** md5 signature: 7cab3829a1655bc373ac3398af7d8756 ******/
		%feature("compactdefaultargs") SetProj;
		%feature("autodoc", "
Parameters
----------
theOrientation: V3d_TypeOfOrientation
theIsYup: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Defines the orientation of the projection . 
Parameter theOrientation camera direction 
Parameter theIsYup flag indicating Y-up (True) or Z-up (False) convention.
") SetProj;
		void SetProj(const V3d_TypeOfOrientation theOrientation, const Standard_Boolean theIsYup = Standard_False);

		/****** V3d_View::SetScale ******/
		/****** md5 signature: 31aa804aa2f857f10bee711d83f73f9d ******/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "
Parameters
----------
Coef: float

Return
-------
None

Description
-----------
Zooms the view by a factor relative to the value initialised by SetViewMappingDefault(). Updates the view.
") SetScale;
		void SetScale(const Standard_Real Coef);

		/****** V3d_View::SetShadingModel ******/
		/****** md5 signature: 126435b0809b0e46e5c779eaa28d91a9 ******/
		%feature("compactdefaultargs") SetShadingModel;
		%feature("autodoc", "
Parameters
----------
theShadingModel: Graphic3d_TypeOfShadingModel

Return
-------
None

Description
-----------
Defines the shading model for the visualization.
") SetShadingModel;
		void SetShadingModel(const Graphic3d_TypeOfShadingModel theShadingModel);

		/****** V3d_View::SetSize ******/
		/****** md5 signature: 93bdf33a4c6cf5665958dc490a88ba2b ******/
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "
Parameters
----------
theSize: float

Return
-------
None

Description
-----------
Defines the view projection size in its maximum dimension, keeping the initial height/width ratio unchanged.
") SetSize;
		void SetSize(const Standard_Real theSize);

		/****** V3d_View::SetTextureEnv ******/
		/****** md5 signature: c8d500ab9ea731d5226a63daa46fcedd ******/
		%feature("compactdefaultargs") SetTextureEnv;
		%feature("autodoc", "
Parameters
----------
theTexture: Graphic3d_TextureEnv

Return
-------
None

Description
-----------
Sets the environment texture to use. No environment texture by default.
") SetTextureEnv;
		void SetTextureEnv(const opencascade::handle<Graphic3d_TextureEnv> & theTexture);

		/****** V3d_View::SetTwist ******/
		/****** md5 signature: 4d86e6456e0427b37d1df0b90e036cb5 ******/
		%feature("compactdefaultargs") SetTwist;
		%feature("autodoc", "
Parameters
----------
Angle: float

Return
-------
None

Description
-----------
Defines the angular position of the high point of the reference frame of the view with respect to the Y screen axis with an absolute angular value in RADIANS.
") SetTwist;
		void SetTwist(const Standard_Real Angle);

		/****** V3d_View::SetUp ******/
		/****** md5 signature: 92ea0c4c6be9a3eab8ad195c3ce5ef3e ******/
		%feature("compactdefaultargs") SetUp;
		%feature("autodoc", "
Parameters
----------
Vx: float
Vy: float
Vz: float

Return
-------
None

Description
-----------
Defines the orientation of the high point.
") SetUp;
		void SetUp(const Standard_Real Vx, const Standard_Real Vy, const Standard_Real Vz);

		/****** V3d_View::SetUp ******/
		/****** md5 signature: 8517d74f5cc263ecfa5b2569a74730df ******/
		%feature("compactdefaultargs") SetUp;
		%feature("autodoc", "
Parameters
----------
Orientation: V3d_TypeOfOrientation

Return
-------
None

Description
-----------
Defines the orientation(SO) of the high point.
") SetUp;
		void SetUp(const V3d_TypeOfOrientation Orientation);

		/****** V3d_View::SetViewMappingDefault ******/
		/****** md5 signature: 3155a7579ce0fbd9532617a42036d14d ******/
		%feature("compactdefaultargs") SetViewMappingDefault;
		%feature("autodoc", "Return
-------
None

Description
-----------
Saves the current view mapping. This will be the state returned from ResetViewmapping.
") SetViewMappingDefault;
		void SetViewMappingDefault();

		/****** V3d_View::SetViewOrientationDefault ******/
		/****** md5 signature: 558a7a5583365f0a3f4296a05563091e ******/
		%feature("compactdefaultargs") SetViewOrientationDefault;
		%feature("autodoc", "Return
-------
None

Description
-----------
Saves the current state of the orientation of the view which will be the return state at ResetViewOrientation.
") SetViewOrientationDefault;
		void SetViewOrientationDefault();

		/****** V3d_View::SetVisualization ******/
		/****** md5 signature: 694d401cc81bf0525b52579977043a91 ******/
		%feature("compactdefaultargs") SetVisualization;
		%feature("autodoc", "
Parameters
----------
theType: V3d_TypeOfVisualization

Return
-------
None

Description
-----------
Defines the visualization type in the view.
") SetVisualization;
		void SetVisualization(const V3d_TypeOfVisualization theType);

		/****** V3d_View::SetWindow ******/
		/****** md5 signature: 88542421f11e26bdd834c4f53a2bcc5d ******/
		%feature("compactdefaultargs") SetWindow;
		%feature("autodoc", "
Parameters
----------
theWindow: Aspect_Window
theContext: Aspect_RenderingContext (optional, default to NULL)

Return
-------
None

Description
-----------
Activates the view in the specified Window If <aContext> is not NULL the graphic context is used to draw something in this view. Otherwise an internal graphic context is created. Warning: The view is centered and resized to preserve the height/width ratio of the window.
") SetWindow;
		void SetWindow(const opencascade::handle<Aspect_Window> & theWindow, const Aspect_RenderingContext theContext = NULL);

		/****** V3d_View::SetWindow ******/
		/****** md5 signature: be3959fa21174d4532289a5d89b1b6fd ******/
		%feature("compactdefaultargs") SetWindow;
		%feature("autodoc", "
Parameters
----------
theParentView: V3d_View
theSize: Graphic3d_Vec2d
theCorner: Aspect_TypeOfTriedronPosition (optional, default to Aspect_TOTP_LEFT_UPPER)
theOffset: Graphic3d_Vec2d (optional, default to Graphic3d_Vec2d())
theMargins: Graphic3d_Vec2i (optional, default to Graphic3d_Vec2i())

Return
-------
None

Description
-----------
Activates the view as subview of another view. 
Input parameter: theParentView parent view to put subview into 
Input parameter: theSize subview dimensions;  values >= 2 define size in pixels,  values <= 1.0 define size as a fraction of parent view 
Input parameter: theCorner corner within parent view 
Input parameter: theOffset offset from the corner;  values >= 1 define offset in pixels,  values < 1.0 define offset as a fraction of parent view 
Input parameter: theMargins subview margins in pixels //! Example: to split parent view horizontally into 2 subview, define one subview with Size=(0.5,1.0),Offset=(0.0,0.0), and 2nd with Size=(0.5,1.0),Offset=(5.0,0.0);.
") SetWindow;
		void SetWindow(const opencascade::handle<V3d_View> & theParentView, const Graphic3d_Vec2d & theSize, Aspect_TypeOfTriedronPosition theCorner = Aspect_TOTP_LEFT_UPPER, const Graphic3d_Vec2d & theOffset = Graphic3d_Vec2d(), const Graphic3d_Vec2i & theMargins = Graphic3d_Vec2i());

		/****** V3d_View::SetZSize ******/
		/****** md5 signature: 7561e1378cbba3000055a4c19942c545 ******/
		%feature("compactdefaultargs") SetZSize;
		%feature("autodoc", "
Parameters
----------
SetZSize: float

Return
-------
None

Description
-----------
Defines the Depth size of the view Front Plane will be set to Size/2. Back Plane will be set to -Size/2. Any Object located Above the Front Plane or behind the Back Plane will be Clipped . NOTE than the XY Size of the View is NOT modified .
") SetZSize;
		void SetZSize(const Standard_Real SetZSize);

		/****** V3d_View::SetZoom ******/
		/****** md5 signature: bca05970b665fea8d5dba6189e5e776a ******/
		%feature("compactdefaultargs") SetZoom;
		%feature("autodoc", "
Parameters
----------
Coef: float
Start: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Zooms the view by a factor relative to the initial value expressed by Start = Standard_True Updates the view.
") SetZoom;
		void SetZoom(const Standard_Real Coef, const Standard_Boolean Start = Standard_True);

		/****** V3d_View::ShadingModel ******/
		/****** md5 signature: 79d21cf733a0311d63fb301f9c1a0521 ******/
		%feature("compactdefaultargs") ShadingModel;
		%feature("autodoc", "Return
-------
Graphic3d_TypeOfShadingModel

Description
-----------
Returns the current shading model; Graphic3d_TypeOfShadingModel_Phong by default.
") ShadingModel;
		Graphic3d_TypeOfShadingModel ShadingModel();

		/****** V3d_View::Size ******/
		/****** md5 signature: f0670a765261a8b64388fbbd56bfa574 ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "
Parameters
----------

Return
-------
Width: float
Height: float

Description
-----------
Returns the height and width of the view.
") Size;
		void Size(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** V3d_View::StartRotation ******/
		/****** md5 signature: 4e7b7c931641e3190c281fb4c327e49e ******/
		%feature("compactdefaultargs") StartRotation;
		%feature("autodoc", "
Parameters
----------
X: int
Y: int
zRotationThreshold: float (optional, default to 0.0)

Return
-------
None

Description
-----------
Begin the rotation of the view around the screen axis according to the mouse position <X,Y>. Warning: Enable rotation around the Z screen axis when <zRotationThreshold> factor is > 0 soon the distance from the start point and the center of the view is > (medium viewSize * <zRotationThreshold> ). Generally a value of 0.4 is usable to rotate around XY screen axis inside the circular threshold area and to rotate around Z screen axis outside this area.
") StartRotation;
		void StartRotation(const Standard_Integer X, const Standard_Integer Y, const Standard_Real zRotationThreshold = 0.0);

		/****** V3d_View::StartZoomAtPoint ******/
		/****** md5 signature: 64f3043ea094b3f7dec2f87e4696c552 ******/
		%feature("compactdefaultargs") StartZoomAtPoint;
		%feature("autodoc", "
Parameters
----------
theXp: int
theYp: int

Return
-------
None

Description
-----------
Defines starting point for ZoomAtPoint view operation. 
Input parameter: theXp the x mouse coordinate, in pixels. 
Input parameter: theYp the y mouse coordinate, in pixels.
") StartZoomAtPoint;
		void StartZoomAtPoint(const Standard_Integer theXp, const Standard_Integer theYp);

		/****** V3d_View::StatisticInformation ******/
		/****** md5 signature: 444dc7137469a967cc38cb224d06bebc ******/
		%feature("compactdefaultargs") StatisticInformation;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns string with statistic performance info.
") StatisticInformation;
		TCollection_AsciiString StatisticInformation();

		/****** V3d_View::StatisticInformation ******/
		/****** md5 signature: 54f56dd2c6701d6a6cca2a091f276074 ******/
		%feature("compactdefaultargs") StatisticInformation;
		%feature("autodoc", "
Parameters
----------
theDict: TColStd_IndexedDataMapOfStringString

Return
-------
None

Description
-----------
Fills in the dictionary with statistic performance info.
") StatisticInformation;
		void StatisticInformation(TColStd_IndexedDataMapOfStringString & theDict);

		/****** V3d_View::Subviews ******/
		/****** md5 signature: d3114f4bfa64a1d5149acdd6e8abd3a2 ******/
		%feature("compactdefaultargs") Subviews;
		%feature("autodoc", "Return
-------
NCollection_Sequence<opencascade::handle<V3d_View>>

Description
-----------
Return subview list.
") Subviews;
		const NCollection_Sequence<opencascade::handle<V3d_View>> & Subviews();

		/****** V3d_View::TextureEnv ******/
		/****** md5 signature: 11fc7995513bc89d61631d77ea5a1796 ******/
		%feature("compactdefaultargs") TextureEnv;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_TextureEnv>

Description
-----------
No available documentation.
") TextureEnv;
		opencascade::handle<Graphic3d_TextureEnv> TextureEnv();

		/****** V3d_View::ToPixMap ******/
		/****** md5 signature: f4afbd441d7f56cecd854bf81405751d ******/
		%feature("compactdefaultargs") ToPixMap;
		%feature("autodoc", "
Parameters
----------
theImage: Image_PixMap
theParams: V3d_ImageDumpOptions

Return
-------
bool

Description
-----------
Dumps the full contents of the view to a pixmap with specified parameters. Internally this method calls Redraw() with an offscreen render buffer of requested target size (theWidth x theHeight), so that there is no need resizing a window control for making a dump of different size.
") ToPixMap;
		Standard_Boolean ToPixMap(Image_PixMap & theImage, const V3d_ImageDumpOptions & theParams);

		/****** V3d_View::ToPixMap ******/
		/****** md5 signature: c9edd8e3ab67e0e714fb16602687f0cf ******/
		%feature("compactdefaultargs") ToPixMap;
		%feature("autodoc", "
Parameters
----------
theImage: Image_PixMap
theWidth: int
theHeight: int
theBufferType: Graphic3d_BufferType (optional, default to Graphic3d_BT_RGB)
theToAdjustAspect: bool (optional, default to Standard_True)
theTargetZLayerId: int (optional, default to Graphic3d_ZLayerId_BotOSD)
theIsSingleLayer: int (optional, default to Standard_False)
theStereoOptions: V3d_StereoDumpOptions (optional, default to V3d_SDO_MONO)
theLightName: str (optional, default to "")

Return
-------
bool

Description
-----------
Dumps the full contents of the view to a pixmap. Internally this method calls Redraw() with an offscreen render buffer of requested target size (theWidth x theHeight), so that there is no need resizing a window control for making a dump of different size. 
Parameter theImage target image, will be re-allocated to match theWidth x theHeight 
Parameter theWidth target image width 
Parameter theHeight target image height 
Parameter theBufferType type of the view buffer to dump (color / depth) 
Parameter theToAdjustAspect when true, active view aspect ratio will be overridden by (theWidth / theHeight) 
Parameter theStereoOptions how to dump stereographic camera.
") ToPixMap;
		Standard_Boolean ToPixMap(Image_PixMap & theImage, const Standard_Integer theWidth, const Standard_Integer theHeight, const Graphic3d_BufferType & theBufferType = Graphic3d_BT_RGB, const Standard_Boolean theToAdjustAspect = Standard_True, int theTargetZLayerId = Graphic3d_ZLayerId_BotOSD, const Standard_Integer theIsSingleLayer = Standard_False, const V3d_StereoDumpOptions theStereoOptions = V3d_SDO_MONO, Standard_CString theLightName = "");

		/****** V3d_View::Translate ******/
		/****** md5 signature: 6d30e9ad6e04686ac1e7e71d61abb03a ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
Dx: float
Dy: float
Dz: float
Start: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Movement of the ye and the view point parallel to the frame of reference of the screen a distance relative to the initial position expressed by Start = Standard_True.
") Translate;
		void Translate(const Standard_Real Dx, const Standard_Real Dy, const Standard_Real Dz, const Standard_Boolean Start = Standard_True);

		/****** V3d_View::Translate ******/
		/****** md5 signature: ad4691cf7ffabdbd8db6e15f796bb24e ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
Axe: V3d_TypeOfAxe
Length: float
Start: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Movement of the eye and the view point parallel to one of the axes of the fame of reference of the view a distance relative to the initial position expressed by Start = Standard_True.
") Translate;
		void Translate(const V3d_TypeOfAxe Axe, const Standard_Real Length, const Standard_Boolean Start = Standard_True);

		/****** V3d_View::Translate ******/
		/****** md5 signature: 4177f5224cc5f4934f54108b17291c95 ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
Length: float
Start: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Movement of the eye and view point parallel to the current axis a distance relative to the initial position expressed by Start = Standard_True.
") Translate;
		void Translate(const Standard_Real Length, const Standard_Boolean Start = Standard_True);

		/****** V3d_View::TriedronDisplay ******/
		/****** md5 signature: de6e0013aa0bfad258971d8c8e0a30f4 ******/
		%feature("compactdefaultargs") TriedronDisplay;
		%feature("autodoc", "
Parameters
----------
thePosition: Aspect_TypeOfTriedronPosition (optional, default to Aspect_TOTP_CENTER)
theColor: Quantity_Color (optional, default to Quantity_NOC_WHITE)
theScale: float (optional, default to 0.02)
theMode: V3d_TypeOfVisualization (optional, default to V3d_WIREFRAME)

Return
-------
None

Description
-----------
Display of the Triedron. Initialize position, color and length of Triedron axes. The scale is a percent of the window width.
") TriedronDisplay;
		void TriedronDisplay(const Aspect_TypeOfTriedronPosition thePosition = Aspect_TOTP_CENTER, const Quantity_Color & theColor = Quantity_NOC_WHITE, const Standard_Real theScale = 0.02, const V3d_TypeOfVisualization theMode = V3d_WIREFRAME);

		/****** V3d_View::TriedronErase ******/
		/****** md5 signature: 7f853325fd9818c65ebfc933096dc3a3 ******/
		%feature("compactdefaultargs") TriedronErase;
		%feature("autodoc", "Return
-------
None

Description
-----------
Erases the Triedron.
") TriedronErase;
		void TriedronErase();

		/****** V3d_View::Trihedron ******/
		/****** md5 signature: d2b86577fb9ee5b149ac9309e6b7a1fb ******/
		%feature("compactdefaultargs") Trihedron;
		%feature("autodoc", "
Parameters
----------
theToCreate: bool (optional, default to true)

Return
-------
opencascade::handle<V3d_Trihedron>

Description
-----------
Returns trihedron object.
") Trihedron;
		const opencascade::handle<V3d_Trihedron> & Trihedron(bool theToCreate = true);

		/****** V3d_View::Turn ******/
		/****** md5 signature: caf9640300c113b68ec729c85a8d5ab2 ******/
		%feature("compactdefaultargs") Turn;
		%feature("autodoc", "
Parameters
----------
Ax: float
Ay: float
Az: float
Start: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Rotation of the view point around the frame of reference of the screen for which the origin is the eye of the projection with a relative angular value in RADIANS with respect to the initial position expressed by Start = Standard_True.
") Turn;
		void Turn(const Standard_Real Ax, const Standard_Real Ay, const Standard_Real Az, const Standard_Boolean Start = Standard_True);

		/****** V3d_View::Turn ******/
		/****** md5 signature: a4f7f9e8b15cd89400e2298af754124e ******/
		%feature("compactdefaultargs") Turn;
		%feature("autodoc", "
Parameters
----------
Axe: V3d_TypeOfAxe
Angle: float
Start: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Rotation of the view point around one of the axes of the frame of reference of the view for which the origin is the eye of the projection with an angular value in RADIANS relative to the initial position expressed by Start = Standard_True.
") Turn;
		void Turn(const V3d_TypeOfAxe Axe, const Standard_Real Angle, const Standard_Boolean Start = Standard_True);

		/****** V3d_View::Turn ******/
		/****** md5 signature: 23315bda5a558e1ab562b502e66a6f9d ******/
		%feature("compactdefaultargs") Turn;
		%feature("autodoc", "
Parameters
----------
Angle: float
Start: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Rotation of the view point around the current axis an angular value in RADIANS relative to the initial position expressed by Start = Standard_True.
") Turn;
		void Turn(const Standard_Real Angle, const Standard_Boolean Start = Standard_True);

		/****** V3d_View::Twist ******/
		/****** md5 signature: 1a3b631044253a3065221b01e86cffef ******/
		%feature("compactdefaultargs") Twist;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns in RADIANS the orientation of the view around the visual axis measured from the Y axis of the screen.
") Twist;
		Standard_Real Twist();

		/****** V3d_View::Type ******/
		/****** md5 signature: ecff2c56954abf9f3e7f78498aaa58f7 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
V3d_TypeOfView

Description
-----------
Returns the Type of the View.
") Type;
		V3d_TypeOfView Type();

		/****** V3d_View::Up ******/
		/****** md5 signature: f3008a4c1208abfb3bc862299e03fbf5 ******/
		%feature("compactdefaultargs") Up;
		%feature("autodoc", "
Parameters
----------

Return
-------
Vx: float
Vy: float
Vz: float

Description
-----------
Returns the vector giving the position of the high point.
") Up;
		void Up(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** V3d_View::Update ******/
		/****** md5 signature: 254d448d1012d4fa968771bf451e27dd ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Return
-------
None

Description
-----------
Deprecated, Redraw() should be used instead.
") Update;
		void Update();

		/****** V3d_View::UpdateLights ******/
		/****** md5 signature: 9787d7b1225259ff747b49c8ee6c1203 ******/
		%feature("compactdefaultargs") UpdateLights;
		%feature("autodoc", "Return
-------
None

Description
-----------
Updates the lights of the view.
") UpdateLights;
		void UpdateLights();

		/****** V3d_View::View ******/
		/****** md5 signature: 70b6cfa36ca6a0cca5527abbf933a1a3 ******/
		%feature("compactdefaultargs") View;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_CView>

Description
-----------
Returns the associated Graphic3d view.
") View;
		const opencascade::handle<Graphic3d_CView> & View();

		/****** V3d_View::Viewer ******/
		/****** md5 signature: 8de79f0dc32e907f852e80c363ba50d8 ******/
		%feature("compactdefaultargs") Viewer;
		%feature("autodoc", "Return
-------
opencascade::handle<V3d_Viewer>

Description
-----------
Returns the viewer in which the view has been created.
") Viewer;
		opencascade::handle<V3d_Viewer> Viewer();

		/****** V3d_View::Visualization ******/
		/****** md5 signature: 69b1fe103f1ed24da346c50efa996976 ******/
		%feature("compactdefaultargs") Visualization;
		%feature("autodoc", "Return
-------
V3d_TypeOfVisualization

Description
-----------
Returns the current visualisation mode.
") Visualization;
		V3d_TypeOfVisualization Visualization();

		/****** V3d_View::Window ******/
		/****** md5 signature: 728fd6817e66dab00e2bb21f343deb70 ******/
		%feature("compactdefaultargs") Window;
		%feature("autodoc", "Return
-------
opencascade::handle<Aspect_Window>

Description
-----------
Returns the Aspect Window associated with the view.
") Window;
		const opencascade::handle<Aspect_Window> & Window();

		/****** V3d_View::WindowFit ******/
		/****** md5 signature: bc0e61f0b1c48780a137921835842602 ******/
		%feature("compactdefaultargs") WindowFit;
		%feature("autodoc", "
Parameters
----------
theMinXp: int
theMinYp: int
theMaxXp: int
theMaxYp: int

Return
-------
None

Description
-----------
Centers the defined PIXEL window so that it occupies the maximum space while respecting the initial height/width ratio. NOTE than the original Z size of the view is NOT modified. 
Input parameter: theMinXp pixel coordinates of minimal corner on x screen axis. 
Input parameter: theMinYp pixel coordinates of minimal corner on y screen axis. 
Input parameter: theMaxXp pixel coordinates of maximal corner on x screen axis. 
Input parameter: theMaxYp pixel coordinates of maximal corner on y screen axis.
") WindowFit;
		void WindowFit(const Standard_Integer theMinXp, const Standard_Integer theMinYp, const Standard_Integer theMaxXp, const Standard_Integer theMaxYp);

		/****** V3d_View::WindowFitAll ******/
		/****** md5 signature: 3905890f018873bb66593015cc92a925 ******/
		%feature("compactdefaultargs") WindowFitAll;
		%feature("autodoc", "
Parameters
----------
Xmin: int
Ymin: int
Xmax: int
Ymax: int

Return
-------
None

Description
-----------
idem than WindowFit.
") WindowFitAll;
		void WindowFitAll(const Standard_Integer Xmin, const Standard_Integer Ymin, const Standard_Integer Xmax, const Standard_Integer Ymax);

		/****** V3d_View::ZBufferTriedronSetup ******/
		/****** md5 signature: 72ed537b5b2aa41ae23236fb0669c852 ******/
		%feature("compactdefaultargs") ZBufferTriedronSetup;
		%feature("autodoc", "
Parameters
----------
theXColor: Quantity_Color (optional, default to Quantity_NOC_RED)
theYColor: Quantity_Color (optional, default to Quantity_NOC_GREEN)
theZColor: Quantity_Color (optional, default to Quantity_NOC_BLUE1)
theSizeRatio: float (optional, default to 0.8)
theAxisDiametr: float (optional, default to 0.05)
theNbFacettes: int (optional, default to 12)

Return
-------
None

Description
-----------
Customization of the ZBUFFER Triedron. XColor,YColor,ZColor - colors of axis SizeRatio - ratio of decreasing of the trihedron size when its physical position comes out of the view AxisDiametr - diameter relatively to axis length NbFacettes - number of facets of cylinders and cones.
") ZBufferTriedronSetup;
		void ZBufferTriedronSetup(const Quantity_Color & theXColor = Quantity_NOC_RED, const Quantity_Color & theYColor = Quantity_NOC_GREEN, const Quantity_Color & theZColor = Quantity_NOC_BLUE1, const Standard_Real theSizeRatio = 0.8, const Standard_Real theAxisDiametr = 0.05, const Standard_Integer theNbFacettes = 12);

		/****** V3d_View::ZFitAll ******/
		/****** md5 signature: dd238708d03b22848f6784d65aea3bce ******/
		%feature("compactdefaultargs") ZFitAll;
		%feature("autodoc", "
Parameters
----------
theScaleFactor: float (optional, default to 1.0)

Return
-------
None

Description
-----------
Change Z-min and Z-max planes of projection volume to match the displayed objects.
") ZFitAll;
		void ZFitAll(const Standard_Real theScaleFactor = 1.0);

		/****** V3d_View::ZSize ******/
		/****** md5 signature: 187d501555b38f4bbc375cc11cb950e2 ******/
		%feature("compactdefaultargs") ZSize;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the Depth of the view .
") ZSize;
		Standard_Real ZSize();

		/****** V3d_View::Zoom ******/
		/****** md5 signature: cc8b0f46863bbab262b11b8d9fe526ba ******/
		%feature("compactdefaultargs") Zoom;
		%feature("autodoc", "
Parameters
----------
theXp1: int
theYp1: int
theXp2: int
theYp2: int

Return
-------
None

Description
-----------
Zoom the view according to a zoom factor computed from the distance between the 2 mouse position. 
Input parameter: theXp1 the x coordinate of first mouse position, in pixels. 
Input parameter: theYp1 the y coordinate of first mouse position, in pixels. 
Input parameter: theXp2 the x coordinate of second mouse position, in pixels. 
Input parameter: theYp2 the y coordinate of second mouse position, in pixels.
") Zoom;
		void Zoom(const Standard_Integer theXp1, const Standard_Integer theYp1, const Standard_Integer theXp2, const Standard_Integer theYp2);

		/****** V3d_View::ZoomAtPoint ******/
		/****** md5 signature: 90d152337c45e762ff38902f4a359765 ******/
		%feature("compactdefaultargs") ZoomAtPoint;
		%feature("autodoc", "
Parameters
----------
theMouseStartX: int
theMouseStartY: int
theMouseEndX: int
theMouseEndY: int

Return
-------
None

Description
-----------
Zooms the model at a pixel defined by the method StartZoomAtPoint().
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
		/****** V3d_Viewer::V3d_Viewer ******/
		/****** md5 signature: 7164d130b975eb54ede0be07d962e066 ******/
		%feature("compactdefaultargs") V3d_Viewer;
		%feature("autodoc", "
Parameters
----------
theDriver: Graphic3d_GraphicDriver

Return
-------
None

Description
-----------
Create a Viewer with the given graphic driver and with default parameters: - View orientation: V3d_XposYnegZpos - View background: Quantity_NOC_GRAY30 - Shading model: V3d_GOURAUD.
") V3d_Viewer;
		 V3d_Viewer(const opencascade::handle<Graphic3d_GraphicDriver> & theDriver);

		/****** V3d_Viewer::ActivateGrid ******/
		/****** md5 signature: 00bc3f4c997ffd5dbf63fdf576318948 ******/
		%feature("compactdefaultargs") ActivateGrid;
		%feature("autodoc", "
Parameters
----------
aGridType: Aspect_GridType
aGridDrawMode: Aspect_GridDrawMode

Return
-------
None

Description
-----------
Activates the grid in all views of <self>.
") ActivateGrid;
		void ActivateGrid(const Aspect_GridType aGridType, const Aspect_GridDrawMode aGridDrawMode);

		/****** V3d_Viewer::ActiveLight ******/
		/****** md5 signature: 7af2e71f89b94797e81a8b1c1a052d68 ******/
		%feature("compactdefaultargs") ActiveLight;
		%feature("autodoc", "Return
-------
opencascade::handle<V3d_Light>

Description
-----------
No available documentation.
") ActiveLight;
		const opencascade::handle<V3d_Light> & ActiveLight();

		/****** V3d_Viewer::ActiveLightIterator ******/
		/****** md5 signature: 6fa6e98274fc8d44abfc6ab8d93a027d ******/
		%feature("compactdefaultargs") ActiveLightIterator;
		%feature("autodoc", "Return
-------
V3d_ListOfLightIterator

Description
-----------
Return an iterator for defined lights.
") ActiveLightIterator;
		V3d_ListOfLightIterator ActiveLightIterator();

		/****** V3d_Viewer::ActiveLights ******/
		/****** md5 signature: 046f4b2a5dbc3ae8d1d2b264382219be ******/
		%feature("compactdefaultargs") ActiveLights;
		%feature("autodoc", "Return
-------
V3d_ListOfLight

Description
-----------
Return a list of active lights.
") ActiveLights;
		const V3d_ListOfLight & ActiveLights();

		/****** V3d_Viewer::ActiveView ******/
		/****** md5 signature: 51c31c5b98d9861184e3beb9dd0957d2 ******/
		%feature("compactdefaultargs") ActiveView;
		%feature("autodoc", "Return
-------
opencascade::handle<V3d_View>

Description
-----------
No available documentation.
") ActiveView;
		const opencascade::handle<V3d_View> & ActiveView();

		/****** V3d_Viewer::ActiveViewIterator ******/
		/****** md5 signature: 574b0283da51acbb6d87557a35440216 ******/
		%feature("compactdefaultargs") ActiveViewIterator;
		%feature("autodoc", "Return
-------
V3d_ListOfViewIterator

Description
-----------
Return an iterator for active views.
") ActiveViewIterator;
		V3d_ListOfViewIterator ActiveViewIterator();

		/****** V3d_Viewer::ActiveViews ******/
		/****** md5 signature: c981bb535c895fc684f93f3f75e46627 ******/
		%feature("compactdefaultargs") ActiveViews;
		%feature("autodoc", "Return
-------
V3d_ListOfView

Description
-----------
Return a list of active views.
") ActiveViews;
		const V3d_ListOfView & ActiveViews();

		/****** V3d_Viewer::AddLight ******/
		/****** md5 signature: a790b9b06a29d0522e8dcef07a2fd4b7 ******/
		%feature("compactdefaultargs") AddLight;
		%feature("autodoc", "
Parameters
----------
theLight: V3d_Light

Return
-------
None

Description
-----------
Adds Light in Sequence Of Lights.
") AddLight;
		void AddLight(const opencascade::handle<V3d_Light> & theLight);

		/****** V3d_Viewer::AddZLayer ******/
		/****** md5 signature: b68a07f8f7714627f3c19816e24e14dc ******/
		%feature("compactdefaultargs") AddZLayer;
		%feature("autodoc", "
Parameters
----------
theLayerId: int OutValue
theSettings: Graphic3d_ZLayerSettings (optional, default to Graphic3d_ZLayerSettings())

Return
-------
bool

Description
-----------
Add a new top-level Z layer to all managed views and get its ID as <theLayerId> value. The Z layers are controlled entirely by viewer, it is not possible to add a layer to a particular view. Custom layers will be inserted before Graphic3d_ZLayerId_Top (e.g. between Graphic3d_ZLayerId_Default and before Graphic3d_ZLayerId_Top). @param[out] theLayerId id of created layer 
Input parameter: theSettings new layer settings 
Return: False if the layer can not be created.
") AddZLayer;
		Standard_Boolean AddZLayer(Standard_Integer &OutValue, const Graphic3d_ZLayerSettings & theSettings = Graphic3d_ZLayerSettings());

		/****** V3d_Viewer::CircularGridGraphicValues ******/
		/****** md5 signature: 3a811e27e917fb82e31d5ce9ddafdb6b ******/
		%feature("compactdefaultargs") CircularGridGraphicValues;
		%feature("autodoc", "
Parameters
----------

Return
-------
theRadius: float
theOffSet: float

Description
-----------
Returns the location and the size of the grid.
") CircularGridGraphicValues;
		void CircularGridGraphicValues(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** V3d_Viewer::CircularGridValues ******/
		/****** md5 signature: e3702606faa489726fa3c267357a58a5 ******/
		%feature("compactdefaultargs") CircularGridValues;
		%feature("autodoc", "
Parameters
----------

Return
-------
theXOrigin: float
theYOrigin: float
theRadiusStep: float
theDivisionNumber: int
theRotationAngle: float

Description
-----------
Returns the definition of the circular grid.
") CircularGridValues;
		void CircularGridValues(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****** V3d_Viewer::ComputedMode ******/
		/****** md5 signature: 47a490ca5aa934708fe6a7c8b60e9268 ******/
		%feature("compactdefaultargs") ComputedMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns true if the computed mode can be used.
") ComputedMode;
		Standard_Boolean ComputedMode();

		/****** V3d_Viewer::CreateView ******/
		/****** md5 signature: a32865abef765684ea877fbd326497ff ******/
		%feature("compactdefaultargs") CreateView;
		%feature("autodoc", "Return
-------
opencascade::handle<V3d_View>

Description
-----------
Creates a view in the viewer according to its default parameters.
") CreateView;
		opencascade::handle<V3d_View> CreateView();

		/****** V3d_Viewer::DeactivateGrid ******/
		/****** md5 signature: fb49cb8b3a2e9aa66e59c74ff923ae8d ******/
		%feature("compactdefaultargs") DeactivateGrid;
		%feature("autodoc", "Return
-------
None

Description
-----------
Deactivates the grid in all views of <self>.
") DeactivateGrid;
		void DeactivateGrid();

		/****** V3d_Viewer::DefaultBackgroundColor ******/
		/****** md5 signature: 34d03952cbbdb894c928fee375aa1559 ******/
		%feature("compactdefaultargs") DefaultBackgroundColor;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Returns the default background colour object.
") DefaultBackgroundColor;
		Quantity_Color DefaultBackgroundColor();

		/****** V3d_Viewer::DefaultBgGradientColors ******/
		/****** md5 signature: 7bb90d9db11de75077b503e1ad617543 ******/
		%feature("compactdefaultargs") DefaultBgGradientColors;
		%feature("autodoc", "
Parameters
----------
theColor1: Quantity_Color
theColor2: Quantity_Color

Return
-------
None

Description
-----------
Returns the gradient background colour objects of the view.
") DefaultBgGradientColors;
		void DefaultBgGradientColors(Quantity_Color & theColor1, Quantity_Color & theColor2);

		/****** V3d_Viewer::DefaultComputedMode ******/
		/****** md5 signature: d3c50e318cfcbb3fbf216a2966870f4f ******/
		%feature("compactdefaultargs") DefaultComputedMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns true if by default the computed mode must be used.
") DefaultComputedMode;
		Standard_Boolean DefaultComputedMode();

		/****** V3d_Viewer::DefaultRenderingParams ******/
		/****** md5 signature: 0d628909940f0fcdf3653e8e75ccea5c ******/
		%feature("compactdefaultargs") DefaultRenderingParams;
		%feature("autodoc", "Return
-------
Graphic3d_RenderingParams

Description
-----------
Return default Rendering Parameters. By default these parameters are set in a new V3d_View.
") DefaultRenderingParams;
		const Graphic3d_RenderingParams & DefaultRenderingParams();

		/****** V3d_Viewer::DefaultShadingModel ******/
		/****** md5 signature: bc3bfac8e702deb7740234263f9351ab ******/
		%feature("compactdefaultargs") DefaultShadingModel;
		%feature("autodoc", "Return
-------
Graphic3d_TypeOfShadingModel

Description
-----------
Returns the default type of Shading; Graphic3d_TypeOfShadingModel_Phong by default.
") DefaultShadingModel;
		Graphic3d_TypeOfShadingModel DefaultShadingModel();

		/****** V3d_Viewer::DefaultTypeOfView ******/
		/****** md5 signature: d5988324ca88382ae2c23a2d41b0e27f ******/
		%feature("compactdefaultargs") DefaultTypeOfView;
		%feature("autodoc", "Return
-------
V3d_TypeOfView

Description
-----------
Returns the default type of View (orthographic or perspective projection) to be returned by CreateView() method.
") DefaultTypeOfView;
		V3d_TypeOfView DefaultTypeOfView();

		/****** V3d_Viewer::DefaultViewProj ******/
		/****** md5 signature: 191df19ea493b948bf913653e28cd6a9 ******/
		%feature("compactdefaultargs") DefaultViewProj;
		%feature("autodoc", "Return
-------
V3d_TypeOfOrientation

Description
-----------
Returns the default Projection.
") DefaultViewProj;
		V3d_TypeOfOrientation DefaultViewProj();

		/****** V3d_Viewer::DefaultViewSize ******/
		/****** md5 signature: 8b5d67c5c8bd6ffbbf9099f47a14fc80 ******/
		%feature("compactdefaultargs") DefaultViewSize;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the default size of the view.
") DefaultViewSize;
		Standard_Real DefaultViewSize();

		/****** V3d_Viewer::DefaultVisualization ******/
		/****** md5 signature: 89fcbd31e3e47bcd5f2de7db627ccc84 ******/
		%feature("compactdefaultargs") DefaultVisualization;
		%feature("autodoc", "Return
-------
V3d_TypeOfVisualization

Description
-----------
Returns the default type of Visualization.
") DefaultVisualization;
		V3d_TypeOfVisualization DefaultVisualization();

		/****** V3d_Viewer::DefinedLight ******/
		/****** md5 signature: 6a0a48c158f9d263e67c5ee5a34704c6 ******/
		%feature("compactdefaultargs") DefinedLight;
		%feature("autodoc", "Return
-------
opencascade::handle<V3d_Light>

Description
-----------
No available documentation.
") DefinedLight;
		const opencascade::handle<V3d_Light> & DefinedLight();

		/****** V3d_Viewer::DefinedLightIterator ******/
		/****** md5 signature: eddeafaf0e73b1ef6846ff96f36f0722 ******/
		%feature("compactdefaultargs") DefinedLightIterator;
		%feature("autodoc", "Return
-------
V3d_ListOfLightIterator

Description
-----------
Return an iterator for defined lights.
") DefinedLightIterator;
		V3d_ListOfLightIterator DefinedLightIterator();

		/****** V3d_Viewer::DefinedLights ******/
		/****** md5 signature: 6ff6dff9bd047e02b6d25d4675131815 ******/
		%feature("compactdefaultargs") DefinedLights;
		%feature("autodoc", "Return
-------
V3d_ListOfLight

Description
-----------
Return a list of defined lights.
") DefinedLights;
		const V3d_ListOfLight & DefinedLights();

		/****** V3d_Viewer::DefinedView ******/
		/****** md5 signature: be2c70401aec7849d2bf409cd59dbee2 ******/
		%feature("compactdefaultargs") DefinedView;
		%feature("autodoc", "Return
-------
opencascade::handle<V3d_View>

Description
-----------
No available documentation.
") DefinedView;
		const opencascade::handle<V3d_View> & DefinedView();

		/****** V3d_Viewer::DefinedViewIterator ******/
		/****** md5 signature: ccf312ca450589f93a86c3c62efdbecc ******/
		%feature("compactdefaultargs") DefinedViewIterator;
		%feature("autodoc", "Return
-------
V3d_ListOfViewIterator

Description
-----------
Return an iterator for defined views.
") DefinedViewIterator;
		V3d_ListOfViewIterator DefinedViewIterator();

		/****** V3d_Viewer::DefinedViews ******/
		/****** md5 signature: 65fda7f60c45c6d453f50537532ac174 ******/
		%feature("compactdefaultargs") DefinedViews;
		%feature("autodoc", "Return
-------
V3d_ListOfView

Description
-----------
Return a list of defined views.
") DefinedViews;
		const V3d_ListOfView & DefinedViews();

		/****** V3d_Viewer::DelLight ******/
		/****** md5 signature: 41c87090c1f691ab05530e33b3599aaa ******/
		%feature("compactdefaultargs") DelLight;
		%feature("autodoc", "
Parameters
----------
theLight: V3d_Light

Return
-------
None

Description
-----------
Delete Light in Sequence Of Lights.
") DelLight;
		void DelLight(const opencascade::handle<V3d_Light> & theLight);

		/****** V3d_Viewer::DisplayPrivilegedPlane ******/
		/****** md5 signature: 405f1e98b9f139ef3c5536006d112ef5 ******/
		%feature("compactdefaultargs") DisplayPrivilegedPlane;
		%feature("autodoc", "
Parameters
----------
theOnOff: bool
theSize: float (optional, default to 1)

Return
-------
None

Description
-----------
No available documentation.
") DisplayPrivilegedPlane;
		void DisplayPrivilegedPlane(const Standard_Boolean theOnOff, const Standard_Real theSize = 1);

		/****** V3d_Viewer::Driver ******/
		/****** md5 signature: 4f7ae644d3e0836700806ee745978120 ******/
		%feature("compactdefaultargs") Driver;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_GraphicDriver>

Description
-----------
Return Graphic Driver instance.
") Driver;
		const opencascade::handle<Graphic3d_GraphicDriver> & Driver();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** V3d_Viewer::Erase ******/
		/****** md5 signature: 22f17cdf7e7984cb80d1d94de19c3493 ******/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "Return
-------
None

Description
-----------
Erase all Objects in All the views.
") Erase;
		void Erase();

		/****** V3d_Viewer::GetAllZLayers ******/
		/****** md5 signature: 37cf193a9a832c92f8389f0a240a7894 ******/
		%feature("compactdefaultargs") GetAllZLayers;
		%feature("autodoc", "
Parameters
----------
theLayerSeq: TColStd_SequenceOfInteger

Return
-------
None

Description
-----------
Return all Z layer ids in sequence ordered by overlay level from lowest layer to highest ( foreground ). The first layer ID in sequence is the default layer that can't be removed.
") GetAllZLayers;
		void GetAllZLayers(TColStd_SequenceOfInteger & theLayerSeq);

		/****** V3d_Viewer::GetGradientBackground ******/
		/****** md5 signature: 0f4e8e838a0ee15372af6735b7472134 ******/
		%feature("compactdefaultargs") GetGradientBackground;
		%feature("autodoc", "Return
-------
Aspect_GradientBackground

Description
-----------
Returns the gradient background of the view.
") GetGradientBackground;
		const Aspect_GradientBackground & GetGradientBackground();

		/****** V3d_Viewer::Grid ******/
		/****** md5 signature: 122c44dbfe7d925c5324eccbcec035e5 ******/
		%feature("compactdefaultargs") Grid;
		%feature("autodoc", "
Parameters
----------
theToCreate: bool (optional, default to true)

Return
-------
opencascade::handle<Aspect_Grid>

Description
-----------
Returns the defined grid in <self>.
") Grid;
		opencascade::handle<Aspect_Grid> Grid(bool theToCreate = true);

		/****** V3d_Viewer::Grid ******/
		/****** md5 signature: 6ce936b8de7dac3d84408efde095017d ******/
		%feature("compactdefaultargs") Grid;
		%feature("autodoc", "
Parameters
----------
theGridType: Aspect_GridType
theToCreate: bool (optional, default to true)

Return
-------
opencascade::handle<Aspect_Grid>

Description
-----------
Returns the defined grid in <self>.
") Grid;
		opencascade::handle<Aspect_Grid> Grid(Aspect_GridType theGridType, bool theToCreate = true);

		/****** V3d_Viewer::GridDrawMode ******/
		/****** md5 signature: bff7a5c472e52220fdbe56a05764b23f ******/
		%feature("compactdefaultargs") GridDrawMode;
		%feature("autodoc", "Return
-------
Aspect_GridDrawMode

Description
-----------
Returns the current grid draw mode defined in <self>.
") GridDrawMode;
		Aspect_GridDrawMode GridDrawMode();

		/****** V3d_Viewer::GridEcho ******/
		/****** md5 signature: 1b69a303effcf89fe06726c625c4cc4c ******/
		%feature("compactdefaultargs") GridEcho;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when grid echo must be displayed at hit point.
") GridEcho;
		Standard_Boolean GridEcho();

		/****** V3d_Viewer::GridType ******/
		/****** md5 signature: 72f8fd3c464adaef4a56774e6ded87c4 ******/
		%feature("compactdefaultargs") GridType;
		%feature("autodoc", "Return
-------
Aspect_GridType

Description
-----------
Returns the current grid type defined in <self>.
") GridType;
		Aspect_GridType GridType();

		/****** V3d_Viewer::HideGridEcho ******/
		/****** md5 signature: 558d06cdf268d39310448dbab8807228 ******/
		%feature("compactdefaultargs") HideGridEcho;
		%feature("autodoc", "
Parameters
----------
theView: V3d_View

Return
-------
None

Description
-----------
Temporarily hide grid echo.
") HideGridEcho;
		void HideGridEcho(const opencascade::handle<V3d_View> & theView);

		/****** V3d_Viewer::IfMoreViews ******/
		/****** md5 signature: d9e95d11fc8bbb3ead2a51876583845d ******/
		%feature("compactdefaultargs") IfMoreViews;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if One View more can be defined in this Viewer.
") IfMoreViews;
		Standard_Boolean IfMoreViews();

		/****** V3d_Viewer::InitActiveLights ******/
		/****** md5 signature: 96e937460d9e6ec0513824da2242388a ******/
		%feature("compactdefaultargs") InitActiveLights;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitActiveLights;
		void InitActiveLights();

		/****** V3d_Viewer::InitActiveViews ******/
		/****** md5 signature: 0f5b161970cd030f134b8d163838b783 ******/
		%feature("compactdefaultargs") InitActiveViews;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitActiveViews;
		void InitActiveViews();

		/****** V3d_Viewer::InitDefinedLights ******/
		/****** md5 signature: 09547c8701701afe8b71255794d46d60 ******/
		%feature("compactdefaultargs") InitDefinedLights;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitDefinedLights;
		void InitDefinedLights();

		/****** V3d_Viewer::InitDefinedViews ******/
		/****** md5 signature: 79e4140021518f570d3fe89c6d853005 ******/
		%feature("compactdefaultargs") InitDefinedViews;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitDefinedViews;
		void InitDefinedViews();

		/****** V3d_Viewer::InsertLayerAfter ******/
		/****** md5 signature: cdb5f8a68553c8e85ea4b1393d7b6ef3 ******/
		%feature("compactdefaultargs") InsertLayerAfter;
		%feature("autodoc", "
Parameters
----------
theNewLayerId: int OutValue
theSettings: Graphic3d_ZLayerSettings
theLayerBefore: int

Return
-------
bool

Description
-----------
Add a new top-level Z layer to all managed views and get its ID as <theLayerId> value. The Z layers are controlled entirely by viewer, it is not possible to add a layer to a particular view. Layer rendering order is defined by its position in list (altered by theLayerAfter) and IsImmediate() flag (all layers with IsImmediate() flag are drawn afterwards); @param[out] theNewLayerId id of created layer; layer id is arbitrary and does not depend on layer position in the list 
Input parameter: theSettings new layer settings 
Input parameter: theLayerBefore id of layer to append new layer after 
Return: False if the layer can not be created.
") InsertLayerAfter;
		Standard_Boolean InsertLayerAfter(Standard_Integer &OutValue, const Graphic3d_ZLayerSettings & theSettings, int theLayerBefore);

		/****** V3d_Viewer::InsertLayerBefore ******/
		/****** md5 signature: 3872bc120c665802f8ae7baae08f463c ******/
		%feature("compactdefaultargs") InsertLayerBefore;
		%feature("autodoc", "
Parameters
----------
theNewLayerId: int OutValue
theSettings: Graphic3d_ZLayerSettings
theLayerAfter: int

Return
-------
bool

Description
-----------
Add a new top-level Z layer to all managed views and get its ID as <theLayerId> value. The Z layers are controlled entirely by viewer, it is not possible to add a layer to a particular view. Layer rendering order is defined by its position in list (altered by theLayerAfter) and IsImmediate() flag (all layers with IsImmediate() flag are drawn afterwards); @param[out] theNewLayerId id of created layer; layer id is arbitrary and does not depend on layer position in the list 
Input parameter: theSettings new layer settings 
Input parameter: theLayerAfter id of layer to append new layer before 
Return: False if the layer can not be created.
") InsertLayerBefore;
		Standard_Boolean InsertLayerBefore(Standard_Integer &OutValue, const Graphic3d_ZLayerSettings & theSettings, int theLayerAfter);

		/****** V3d_Viewer::Invalidate ******/
		/****** md5 signature: 0ab0e2c678e575a4d179bf46b4d4d469 ******/
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "Return
-------
None

Description
-----------
Invalidates viewer content but does not redraw it.
") Invalidate;
		void Invalidate();

		/****** V3d_Viewer::IsActive ******/
		/****** md5 signature: 619177a77eb0e03f8c6370d0e90fb199 ******/
		%feature("compactdefaultargs") IsActive;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns Standard_True if a grid is activated in <self>.
") IsActive;
		Standard_Boolean IsActive();

		/****** V3d_Viewer::IsGlobalLight ******/
		/****** md5 signature: 77d05c02fd1db57bf7e317a6f2ceae3a ******/
		%feature("compactdefaultargs") IsGlobalLight;
		%feature("autodoc", "
Parameters
----------
TheLight: V3d_Light

Return
-------
bool

Description
-----------
No available documentation.
") IsGlobalLight;
		Standard_Boolean IsGlobalLight(const opencascade::handle<V3d_Light> & TheLight);

		/****** V3d_Viewer::IsGridActive ******/
		/****** md5 signature: f6375ecefe9307a6299a7081489055bd ******/
		%feature("compactdefaultargs") IsGridActive;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns Standard_True if a grid is activated in <self>.
") IsGridActive;
		Standard_Boolean IsGridActive();

		/****** V3d_Viewer::LastActiveView ******/
		/****** md5 signature: be5a39647b88665478a02d7cd3674cb7 ******/
		%feature("compactdefaultargs") LastActiveView;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns true if there is only one active view.
") LastActiveView;
		Standard_Boolean LastActiveView();

		/****** V3d_Viewer::MoreActiveLights ******/
		/****** md5 signature: 159743d840ad62ed3830acf9e90ae539 ******/
		%feature("compactdefaultargs") MoreActiveLights;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreActiveLights;
		Standard_Boolean MoreActiveLights();

		/****** V3d_Viewer::MoreActiveViews ******/
		/****** md5 signature: 59d67bac74721d905de58b553fe9996c ******/
		%feature("compactdefaultargs") MoreActiveViews;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreActiveViews;
		Standard_Boolean MoreActiveViews();

		/****** V3d_Viewer::MoreDefinedLights ******/
		/****** md5 signature: de453e5d448bec792bce0fe4445da325 ******/
		%feature("compactdefaultargs") MoreDefinedLights;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreDefinedLights;
		Standard_Boolean MoreDefinedLights();

		/****** V3d_Viewer::MoreDefinedViews ******/
		/****** md5 signature: 8307d307b155b516c3b1a54d7b96da53 ******/
		%feature("compactdefaultargs") MoreDefinedViews;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreDefinedViews;
		Standard_Boolean MoreDefinedViews();

		/****** V3d_Viewer::NextActiveLights ******/
		/****** md5 signature: 221700382f0fef8d1ac7d43635ea1bc5 ******/
		%feature("compactdefaultargs") NextActiveLights;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextActiveLights;
		void NextActiveLights();

		/****** V3d_Viewer::NextActiveViews ******/
		/****** md5 signature: 0477b4c7cc74b63505395536664807d2 ******/
		%feature("compactdefaultargs") NextActiveViews;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextActiveViews;
		void NextActiveViews();

		/****** V3d_Viewer::NextDefinedLights ******/
		/****** md5 signature: b6ccc487d14c8d8d99ba23bb34021630 ******/
		%feature("compactdefaultargs") NextDefinedLights;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextDefinedLights;
		void NextDefinedLights();

		/****** V3d_Viewer::NextDefinedViews ******/
		/****** md5 signature: d2b2e84e421362ae989de89fff66d208 ******/
		%feature("compactdefaultargs") NextDefinedViews;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextDefinedViews;
		void NextDefinedViews();

		/****** V3d_Viewer::PrivilegedPlane ******/
		/****** md5 signature: 5dfdae9a994a6d00bba77273741a9e43 ******/
		%feature("compactdefaultargs") PrivilegedPlane;
		%feature("autodoc", "Return
-------
gp_Ax3

Description
-----------
No available documentation.
") PrivilegedPlane;
		const gp_Ax3 PrivilegedPlane();

		/****** V3d_Viewer::RectangularGridGraphicValues ******/
		/****** md5 signature: dab8c1c46121d56f7c42d5007eda4bec ******/
		%feature("compactdefaultargs") RectangularGridGraphicValues;
		%feature("autodoc", "
Parameters
----------

Return
-------
theXSize: float
theYSize: float
theOffSet: float

Description
-----------
Returns the location and the size of the grid.
") RectangularGridGraphicValues;
		void RectangularGridGraphicValues(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** V3d_Viewer::RectangularGridValues ******/
		/****** md5 signature: 4850ce10bfca161d0b0a538c3df788bc ******/
		%feature("compactdefaultargs") RectangularGridValues;
		%feature("autodoc", "
Parameters
----------

Return
-------
theXOrigin: float
theYOrigin: float
theXStep: float
theYStep: float
theRotationAngle: float

Description
-----------
Returns the definition of the rectangular grid.
") RectangularGridValues;
		void RectangularGridValues(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** V3d_Viewer::Redraw ******/
		/****** md5 signature: 0dcadf2fbf820babd41e765f73c51c9a ******/
		%feature("compactdefaultargs") Redraw;
		%feature("autodoc", "Return
-------
None

Description
-----------
Redraws all the views of the Viewer even if no modification has taken place. Must be called if all the views of the Viewer are exposed, as for example in a global DeIconification.
") Redraw;
		void Redraw();

		/****** V3d_Viewer::RedrawImmediate ******/
		/****** md5 signature: 9f886ca53b0e4577db3b4ac8db079007 ******/
		%feature("compactdefaultargs") RedrawImmediate;
		%feature("autodoc", "Return
-------
None

Description
-----------
Updates layer of immediate presentations.
") RedrawImmediate;
		void RedrawImmediate();

		/****** V3d_Viewer::Remove ******/
		/****** md5 signature: 0346504d7ac570fc8960fb72d5ad5f20 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Return
-------
None

Description
-----------
Suppresses the Viewer.
") Remove;
		void Remove();

		/****** V3d_Viewer::RemoveZLayer ******/
		/****** md5 signature: 1a28f0b7cdff8987fcb6dd2d11797a2b ******/
		%feature("compactdefaultargs") RemoveZLayer;
		%feature("autodoc", "
Parameters
----------
theLayerId: int

Return
-------
bool

Description
-----------
Remove Z layer with ID <theLayerId>. Method returns Standard_False if the layer can not be removed or doesn't exists. By default, there are always default bottom-level layer that can't be removed.
") RemoveZLayer;
		Standard_Boolean RemoveZLayer(int theLayerId);

		/****** V3d_Viewer::SetCircularGridGraphicValues ******/
		/****** md5 signature: b67e0720f326efd720f20465738385e5 ******/
		%feature("compactdefaultargs") SetCircularGridGraphicValues;
		%feature("autodoc", "
Parameters
----------
Radius: float
OffSet: float

Return
-------
None

Description
-----------
Sets the location and the size of the grid. <XSize> defines the width of the grid. <YSize> defines the height of the grid. <OffSet> defines the displacement along the plane normal.
") SetCircularGridGraphicValues;
		void SetCircularGridGraphicValues(const Standard_Real Radius, const Standard_Real OffSet);

		/****** V3d_Viewer::SetCircularGridValues ******/
		/****** md5 signature: a18bcc242107e159b166d07e24c9ede7 ******/
		%feature("compactdefaultargs") SetCircularGridValues;
		%feature("autodoc", "
Parameters
----------
XOrigin: float
YOrigin: float
RadiusStep: float
DivisionNumber: int
RotationAngle: float

Return
-------
None

Description
-----------
Sets the definition of the circular grid. <XOrigin>, <YOrigin> defines the origin of the grid. <RadiusStep> defines the interval between 2 circles. <DivisionNumber> defines the section number of one half circle. <RotationAngle> defines the rotation angle of the grid.
") SetCircularGridValues;
		void SetCircularGridValues(const Standard_Real XOrigin, const Standard_Real YOrigin, const Standard_Real RadiusStep, const Standard_Integer DivisionNumber, const Standard_Real RotationAngle);

		/****** V3d_Viewer::SetComputedMode ******/
		/****** md5 signature: 43253006c9d2e7ee262337de8f5a72b3 ******/
		%feature("compactdefaultargs") SetComputedMode;
		%feature("autodoc", "
Parameters
----------
theMode: bool

Return
-------
None

Description
-----------
Set if the computed mode can be used.
") SetComputedMode;
		void SetComputedMode(const Standard_Boolean theMode);

		/****** V3d_Viewer::SetDefaultBackgroundColor ******/
		/****** md5 signature: 29f198cc43c26304a2fe19b0a4e5c4b3 ******/
		%feature("compactdefaultargs") SetDefaultBackgroundColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Defines the default background colour of views attached to the viewer by supplying the color object.
") SetDefaultBackgroundColor;
		void SetDefaultBackgroundColor(const Quantity_Color & theColor);

		/****** V3d_Viewer::SetDefaultBgGradientColors ******/
		/****** md5 signature: 4a9049f28b07f43729588e2b1cfd19f7 ******/
		%feature("compactdefaultargs") SetDefaultBgGradientColors;
		%feature("autodoc", "
Parameters
----------
theColor1: Quantity_Color
theColor2: Quantity_Color
theFillStyle: Aspect_GradientFillMethod (optional, default to Aspect_GradientFillMethod_Horizontal)

Return
-------
None

Description
-----------
Defines the default gradient background colours of views attached to the viewer by supplying the colour objects.
") SetDefaultBgGradientColors;
		void SetDefaultBgGradientColors(const Quantity_Color & theColor1, const Quantity_Color & theColor2, const Aspect_GradientFillMethod theFillStyle = Aspect_GradientFillMethod_Horizontal);

		/****** V3d_Viewer::SetDefaultComputedMode ******/
		/****** md5 signature: c46a840bb2514935564839772e61e616 ******/
		%feature("compactdefaultargs") SetDefaultComputedMode;
		%feature("autodoc", "
Parameters
----------
theMode: bool

Return
-------
None

Description
-----------
Set if by default the computed mode must be used.
") SetDefaultComputedMode;
		void SetDefaultComputedMode(const Standard_Boolean theMode);

		/****** V3d_Viewer::SetDefaultLights ******/
		/****** md5 signature: b4a267b5dfce1e27f8107f3e4fa518ca ******/
		%feature("compactdefaultargs") SetDefaultLights;
		%feature("autodoc", "Return
-------
None

Description
-----------
Defines default lights: positional-light 0.3 0. 0. directional-light V3d_XnegYposZpos directional-light V3d_XnegYneg ambient-light.
") SetDefaultLights;
		void SetDefaultLights();

		/****** V3d_Viewer::SetDefaultRenderingParams ******/
		/****** md5 signature: c5a40a336e471133b7be9683980255cb ******/
		%feature("compactdefaultargs") SetDefaultRenderingParams;
		%feature("autodoc", "
Parameters
----------
theParams: Graphic3d_RenderingParams

Return
-------
None

Description
-----------
Set default Rendering Parameters.
") SetDefaultRenderingParams;
		void SetDefaultRenderingParams(const Graphic3d_RenderingParams & theParams);

		/****** V3d_Viewer::SetDefaultShadingModel ******/
		/****** md5 signature: 2040e22386553d82560b0da60ee0c433 ******/
		%feature("compactdefaultargs") SetDefaultShadingModel;
		%feature("autodoc", "
Parameters
----------
theType: Graphic3d_TypeOfShadingModel

Return
-------
None

Description
-----------
Gives the default type of SHADING.
") SetDefaultShadingModel;
		void SetDefaultShadingModel(const Graphic3d_TypeOfShadingModel theType);

		/****** V3d_Viewer::SetDefaultTypeOfView ******/
		/****** md5 signature: 638bd84702f3a810edc2e84dff3514c2 ******/
		%feature("compactdefaultargs") SetDefaultTypeOfView;
		%feature("autodoc", "
Parameters
----------
theType: V3d_TypeOfView

Return
-------
None

Description
-----------
Set the default type of View (orthographic or perspective projection) to be returned by CreateView() method.
") SetDefaultTypeOfView;
		void SetDefaultTypeOfView(const V3d_TypeOfView theType);

		/****** V3d_Viewer::SetDefaultViewProj ******/
		/****** md5 signature: e15677a0e533d3aa67369e724923fd97 ******/
		%feature("compactdefaultargs") SetDefaultViewProj;
		%feature("autodoc", "
Parameters
----------
theOrientation: V3d_TypeOfOrientation

Return
-------
None

Description
-----------
Sets the default projection for creating views in the viewer.
") SetDefaultViewProj;
		void SetDefaultViewProj(const V3d_TypeOfOrientation theOrientation);

		/****** V3d_Viewer::SetDefaultViewSize ******/
		/****** md5 signature: d923eab190c632f0ff798b9c43517c47 ******/
		%feature("compactdefaultargs") SetDefaultViewSize;
		%feature("autodoc", "
Parameters
----------
theSize: float

Return
-------
None

Description
-----------
Gives a default size for the creation of views of the viewer.
") SetDefaultViewSize;
		void SetDefaultViewSize(const Standard_Real theSize);

		/****** V3d_Viewer::SetDefaultVisualization ******/
		/****** md5 signature: bccd9278c0b886d0c7b17c77f3c6c214 ******/
		%feature("compactdefaultargs") SetDefaultVisualization;
		%feature("autodoc", "
Parameters
----------
theType: V3d_TypeOfVisualization

Return
-------
None

Description
-----------
Gives the default visualization mode.
") SetDefaultVisualization;
		void SetDefaultVisualization(const V3d_TypeOfVisualization theType);

		/****** V3d_Viewer::SetGridEcho ******/
		/****** md5 signature: 705d6f6f11c80fa56180ba59c810633e ******/
		%feature("compactdefaultargs") SetGridEcho;
		%feature("autodoc", "
Parameters
----------
showGrid: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Show/Don't show grid echo to the hit point. If True,the grid echo will be shown at ConvertToGrid() time.
") SetGridEcho;
		void SetGridEcho(const Standard_Boolean showGrid = Standard_True);

		/****** V3d_Viewer::SetGridEcho ******/
		/****** md5 signature: 6be327c84c0ec063c637061469c58526 ******/
		%feature("compactdefaultargs") SetGridEcho;
		%feature("autodoc", "
Parameters
----------
aMarker: Graphic3d_AspectMarker3d

Return
-------
None

Description
-----------
Show grid echo <aMarker> to the hit point. Warning: When the grid echo marker is not set, a default marker is build with the attributes: marker type: Aspect_TOM_STAR marker color: Quantity_NOC_GRAY90 marker size: 3.0.
") SetGridEcho;
		void SetGridEcho(const opencascade::handle<Graphic3d_AspectMarker3d> & aMarker);

		/****** V3d_Viewer::SetLightOff ******/
		/****** md5 signature: 455cedd8ba3c305764630cd94d4a9d57 ******/
		%feature("compactdefaultargs") SetLightOff;
		%feature("autodoc", "
Parameters
----------
theLight: V3d_Light

Return
-------
None

Description
-----------
Deactivates MyLight in this viewer.
") SetLightOff;
		void SetLightOff(const opencascade::handle<V3d_Light> & theLight);

		/****** V3d_Viewer::SetLightOff ******/
		/****** md5 signature: bf38107f690adbb6b0f411e0bf63da48 ******/
		%feature("compactdefaultargs") SetLightOff;
		%feature("autodoc", "Return
-------
None

Description
-----------
Deactivate all the Lights defined in this viewer.
") SetLightOff;
		void SetLightOff();

		/****** V3d_Viewer::SetLightOn ******/
		/****** md5 signature: d1efc51d1bc7b893aa6cd272504c6805 ******/
		%feature("compactdefaultargs") SetLightOn;
		%feature("autodoc", "
Parameters
----------
theLight: V3d_Light

Return
-------
None

Description
-----------
Activates MyLight in the viewer.
") SetLightOn;
		void SetLightOn(const opencascade::handle<V3d_Light> & theLight);

		/****** V3d_Viewer::SetLightOn ******/
		/****** md5 signature: 0dbd37321a0295b614d3d0d9cd0a3fe9 ******/
		%feature("compactdefaultargs") SetLightOn;
		%feature("autodoc", "Return
-------
None

Description
-----------
Activates all the lights defined in this viewer.
") SetLightOn;
		void SetLightOn();

		/****** V3d_Viewer::SetPrivilegedPlane ******/
		/****** md5 signature: db95ed58bc82785957aa80274e7caa6a ******/
		%feature("compactdefaultargs") SetPrivilegedPlane;
		%feature("autodoc", "
Parameters
----------
thePlane: gp_Ax3

Return
-------
None

Description
-----------
No available documentation.
") SetPrivilegedPlane;
		void SetPrivilegedPlane(const gp_Ax3 & thePlane);

		/****** V3d_Viewer::SetRectangularGridGraphicValues ******/
		/****** md5 signature: fb9211cf5c9af2162da6e9308ad8eac6 ******/
		%feature("compactdefaultargs") SetRectangularGridGraphicValues;
		%feature("autodoc", "
Parameters
----------
XSize: float
YSize: float
OffSet: float

Return
-------
None

Description
-----------
Sets the location and the size of the grid. <XSize> defines the width of the grid. <YSize> defines the height of the grid. <OffSet> defines the displacement along the plane normal.
") SetRectangularGridGraphicValues;
		void SetRectangularGridGraphicValues(const Standard_Real XSize, const Standard_Real YSize, const Standard_Real OffSet);

		/****** V3d_Viewer::SetRectangularGridValues ******/
		/****** md5 signature: 97300a084d66505155684775481f80e9 ******/
		%feature("compactdefaultargs") SetRectangularGridValues;
		%feature("autodoc", "
Parameters
----------
XOrigin: float
YOrigin: float
XStep: float
YStep: float
RotationAngle: float

Return
-------
None

Description
-----------
Sets the definition of the rectangular grid. <XOrigin>, <YOrigin> defines the origin of the grid. <XStep> defines the interval between 2 vertical lines. <YStep> defines the interval between 2 horizontal lines. <RotationAngle> defines the rotation angle of the grid.
") SetRectangularGridValues;
		void SetRectangularGridValues(const Standard_Real XOrigin, const Standard_Real YOrigin, const Standard_Real XStep, const Standard_Real YStep, const Standard_Real RotationAngle);

		/****** V3d_Viewer::SetViewOff ******/
		/****** md5 signature: 1768aaae0afe897b5be0a8ca96ab5e6a ******/
		%feature("compactdefaultargs") SetViewOff;
		%feature("autodoc", "Return
-------
None

Description
-----------
Deactivates all the views of a Viewer attached to a window.
") SetViewOff;
		void SetViewOff();

		/****** V3d_Viewer::SetViewOff ******/
		/****** md5 signature: 45f41338fdf12e819a5c1f0eabb24945 ******/
		%feature("compactdefaultargs") SetViewOff;
		%feature("autodoc", "
Parameters
----------
theView: V3d_View

Return
-------
None

Description
-----------
Deactivates a particular view in the Viewer. Must be call if the Window attached to the view has been Iconified .
") SetViewOff;
		void SetViewOff(const opencascade::handle<V3d_View> & theView);

		/****** V3d_Viewer::SetViewOn ******/
		/****** md5 signature: 72744c1ad7386c470c494aa21d694cd5 ******/
		%feature("compactdefaultargs") SetViewOn;
		%feature("autodoc", "Return
-------
None

Description
-----------
Activates all of the views of a viewer attached to a window.
") SetViewOn;
		void SetViewOn();

		/****** V3d_Viewer::SetViewOn ******/
		/****** md5 signature: 2fd6e682d9d9250378de51173ccf4996 ******/
		%feature("compactdefaultargs") SetViewOn;
		%feature("autodoc", "
Parameters
----------
theView: V3d_View

Return
-------
None

Description
-----------
Activates a particular view in the Viewer. Must be call if the Window attached to the view has been Deiconified.
") SetViewOn;
		void SetViewOn(const opencascade::handle<V3d_View> & theView);

		/****** V3d_Viewer::SetZLayerSettings ******/
		/****** md5 signature: ac44dbb93e4d8146369b6dce06071238 ******/
		%feature("compactdefaultargs") SetZLayerSettings;
		%feature("autodoc", "
Parameters
----------
theLayerId: int
theSettings: Graphic3d_ZLayerSettings

Return
-------
None

Description
-----------
Sets the settings for a single Z layer.
") SetZLayerSettings;
		void SetZLayerSettings(int theLayerId, const Graphic3d_ZLayerSettings & theSettings);

		/****** V3d_Viewer::ShowGridEcho ******/
		/****** md5 signature: 79d60993c95eee3cd99815e76cd78fc2 ******/
		%feature("compactdefaultargs") ShowGridEcho;
		%feature("autodoc", "
Parameters
----------
theView: V3d_View
thePoint: Graphic3d_Vertex

Return
-------
None

Description
-----------
Display grid echo at requested point in the view.
") ShowGridEcho;
		void ShowGridEcho(const opencascade::handle<V3d_View> & theView, const Graphic3d_Vertex & thePoint);

		/****** V3d_Viewer::StructureManager ******/
		/****** md5 signature: 632b257b8f511bc5e6448d14470b491d ******/
		%feature("compactdefaultargs") StructureManager;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_StructureManager>

Description
-----------
Returns the structure manager associated to this viewer.
") StructureManager;
		opencascade::handle<Graphic3d_StructureManager> StructureManager();

		/****** V3d_Viewer::UnHighlight ******/
		/****** md5 signature: ff54423c40126b023ea779ec43b4ac64 ******/
		%feature("compactdefaultargs") UnHighlight;
		%feature("autodoc", "Return
-------
None

Description
-----------
UnHighlight all Objects in All the views.
") UnHighlight;
		void UnHighlight();

		/****** V3d_Viewer::Update ******/
		/****** md5 signature: 01ee7c04045625b8b5410511d5645d3d ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Return
-------
None

Description
-----------
Deprecated, Redraw() should be used instead.
") Update;
		void Update();

		/****** V3d_Viewer::UpdateLights ******/
		/****** md5 signature: 3715089476809c2ac92c40c50be2ca20 ******/
		%feature("compactdefaultargs") UpdateLights;
		%feature("autodoc", "Return
-------
None

Description
-----------
Updates the lights of all the views of a viewer.
") UpdateLights;
		void UpdateLights();

		/****** V3d_Viewer::ZLayerSettings ******/
		/****** md5 signature: 9c0de646b59df9fdf459d78e51b824ee ******/
		%feature("compactdefaultargs") ZLayerSettings;
		%feature("autodoc", "
Parameters
----------
theLayerId: int

Return
-------
Graphic3d_ZLayerSettings

Description
-----------
Returns the settings of a single Z layer.
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
		/****** V3d_DirectionalLight::V3d_DirectionalLight ******/
		/****** md5 signature: 0a7b98fd806efa175a6bd73f746c107d ******/
		%feature("compactdefaultargs") V3d_DirectionalLight;
		%feature("autodoc", "
Parameters
----------
theDirection: V3d_TypeOfOrientation (optional, default to V3d_XposYposZpos)
theColor: Quantity_Color (optional, default to Quantity_NOC_WHITE)
theIsHeadlight: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creates a directional light source in the viewer.
") V3d_DirectionalLight;
		 V3d_DirectionalLight(const V3d_TypeOfOrientation theDirection = V3d_XposYposZpos, const Quantity_Color & theColor = Quantity_NOC_WHITE, const Standard_Boolean theIsHeadlight = Standard_False);

		/****** V3d_DirectionalLight::V3d_DirectionalLight ******/
		/****** md5 signature: a924d2e44febaa27eb11500ba941c454 ******/
		%feature("compactdefaultargs") V3d_DirectionalLight;
		%feature("autodoc", "
Parameters
----------
theDirection: gp_Dir
theColor: Quantity_Color (optional, default to Quantity_NOC_WHITE)
theIsHeadlight: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creates a directional light source in the viewer.
") V3d_DirectionalLight;
		 V3d_DirectionalLight(const gp_Dir & theDirection, const Quantity_Color & theColor = Quantity_NOC_WHITE, const Standard_Boolean theIsHeadlight = Standard_False);

		/****** V3d_DirectionalLight::SetDirection ******/
		/****** md5 signature: 68f1a2f19e61e004b66a3eaf73e51686 ******/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "
Parameters
----------
theDirection: V3d_TypeOfOrientation

Return
-------
None

Description
-----------
Defines the direction of the light source by a predefined orientation.
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
		/****** V3d_PositionalLight::V3d_PositionalLight ******/
		/****** md5 signature: fd975c884e6e023ed79d1a3a49118ffe ******/
		%feature("compactdefaultargs") V3d_PositionalLight;
		%feature("autodoc", "
Parameters
----------
thePos: gp_Pnt
theColor: Quantity_Color (optional, default to Quantity_NOC_WHITE)

Return
-------
None

Description
-----------
Creates an isolated light source in the viewer with default attenuation factors (1.0, 0.0).
") V3d_PositionalLight;
		 V3d_PositionalLight(const gp_Pnt & thePos, const Quantity_Color & theColor = Quantity_NOC_WHITE);

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
		/****** V3d_SpotLight::V3d_SpotLight ******/
		/****** md5 signature: 897223a5e21849af53eadd79143ba6ea ******/
		%feature("compactdefaultargs") V3d_SpotLight;
		%feature("autodoc", "
Parameters
----------
thePos: gp_Pnt
theDirection: V3d_TypeOfOrientation (optional, default to V3d_XnegYnegZpos)
theColor: Quantity_Color (optional, default to Quantity_NOC_WHITE)

Return
-------
None

Description
-----------
Creates a light source of the Spot type in the viewer with default attenuation factors (1.0, 0.0), concentration factor 1.0 and spot angle 30 degrees.
") V3d_SpotLight;
		 V3d_SpotLight(const gp_Pnt & thePos, const V3d_TypeOfOrientation theDirection = V3d_XnegYnegZpos, const Quantity_Color & theColor = Quantity_NOC_WHITE);

		/****** V3d_SpotLight::V3d_SpotLight ******/
		/****** md5 signature: d6ff11b2eaba1d3ba0f9c7bacac83a04 ******/
		%feature("compactdefaultargs") V3d_SpotLight;
		%feature("autodoc", "
Parameters
----------
thePos: gp_Pnt
theDirection: gp_Dir
theColor: Quantity_Color (optional, default to Quantity_NOC_WHITE)

Return
-------
None

Description
-----------
Creates a light source of the Spot type in the viewer with default attenuation factors (1.0, 0.0), concentration factor 1.0 and spot angle 30 degrees.
") V3d_SpotLight;
		 V3d_SpotLight(const gp_Pnt & thePos, const gp_Dir & theDirection, const Quantity_Color & theColor = Quantity_NOC_WHITE);

		/****** V3d_SpotLight::SetDirection ******/
		/****** md5 signature: ec761b79b1038a9b23500884194f62d9 ******/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "
Parameters
----------
theOrientation: V3d_TypeOfOrientation

Return
-------
None

Description
-----------
Defines the direction of the light source according to a predefined directional vector.
") SetDirection;
		void SetDirection(V3d_TypeOfOrientation theOrientation);

};


%make_alias(V3d_SpotLight)

%extend V3d_SpotLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class V3d_ImageDumpOptions:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
V3d_Light=OCC.Core.Graphic3d.Graphic3d_CLight
V3d_TypeOfBackfacingModel=OCC.Core.Graphic3d.Graphic3d_TypeOfBackfacingModel
V3d_TypeOfLight=OCC.Core.Graphic3d.Graphic3d_TypeOfLightSource
V3d_TypeOfShadingModel=OCC.Core.Graphic3d.Graphic3d_TypeOfShadingModel
}
/* deprecated methods */
%pythoncode {
@deprecated
def v3d_ArrowOfRadius(*args):
	return v3d.ArrowOfRadius(*args)

@deprecated
def v3d_CircleInPlane(*args):
	return v3d.CircleInPlane(*args)

@deprecated
def v3d_GetProjAxis(*args):
	return v3d.GetProjAxis(*args)

@deprecated
def v3d_SwitchViewsinWindow(*args):
	return v3d.SwitchViewsinWindow(*args)

@deprecated
def v3d_TypeOfOrientationFromString(*args):
	return v3d.TypeOfOrientationFromString(*args)

@deprecated
def v3d_TypeOfOrientationFromString(*args):
	return v3d.TypeOfOrientationFromString(*args)

@deprecated
def v3d_TypeOfOrientationToString(*args):
	return v3d.TypeOfOrientationToString(*args)

}
