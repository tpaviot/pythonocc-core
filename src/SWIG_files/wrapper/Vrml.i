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
%define VRMLDOCSTRING
"Vrml module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_vrml.html"
%enddef
%module (package="OCC.Core", docstring=VRMLDOCSTRING) Vrml


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
#include<Vrml_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColStd_module.hxx>
#include<TColgp_module.hxx>
#include<Quantity_module.hxx>
#include<gp_module.hxx>
#include<TCollection_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColStd.i
%import TColgp.i
%import Quantity.i
%import gp.i
%import TCollection.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum Vrml_VertexOrdering {
	Vrml_UNKNOWN_ORDERING = 0,
	Vrml_CLOCKWISE = 1,
	Vrml_COUNTERCLOCKWISE = 2,
};

enum Vrml_FontStyleFamily {
	Vrml_SERIF = 0,
	Vrml_SANS = 1,
	Vrml_TYPEWRITER = 2,
};

enum Vrml_SeparatorRenderCulling {
	Vrml_OFF = 0,
	Vrml_ON = 1,
	Vrml_AUTO = 2,
};

enum Vrml_Texture2Wrap {
	Vrml_REPEAT = 0,
	Vrml_CLAMP = 1,
};

enum Vrml_FaceType {
	Vrml_UNKNOWN_FACE_TYPE = 0,
	Vrml_CONVEX = 1,
};

enum Vrml_AsciiTextJustification {
	Vrml_LEFT = 0,
	Vrml_CENTER = 1,
	Vrml_RIGHT = 2,
};

enum Vrml_ConeParts {
	Vrml_ConeSIDES = 0,
	Vrml_ConeBOTTOM = 1,
	Vrml_ConeALL = 2,
};

enum Vrml_SFImageNumber {
	Vrml_NULL = 0,
	Vrml_ONE = 1,
	Vrml_TWO = 2,
	Vrml_THREE = 3,
	Vrml_FOUR = 4,
};

enum Vrml_MaterialBindingAndNormalBinding {
	Vrml_DEFAULT = 0,
	Vrml_OVERALL = 1,
	Vrml_PER_PART = 2,
	Vrml_PER_PART_INDEXED = 3,
	Vrml_PER_FACE = 4,
	Vrml_PER_FACE_INDEXED = 5,
	Vrml_PER_VERTEX = 6,
	Vrml_PER_VERTEX_INDEXED = 7,
};

enum Vrml_ShapeType {
	Vrml_UNKNOWN_SHAPE_TYPE = 0,
	Vrml_SOLID = 1,
};

enum Vrml_WWWAnchorMap {
	Vrml_MAP_NONE = 0,
	Vrml_POINT = 1,
};

enum Vrml_CylinderParts {
	Vrml_CylinderSIDES = 0,
	Vrml_CylinderTOP = 1,
	Vrml_CylinderBOTTOM = 2,
	Vrml_CylinderALL = 3,
};

enum Vrml_FontStyleStyle {
	Vrml_NONE = 0,
	Vrml_BOLD = 1,
	Vrml_ITALIC = 2,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class Vrml_VertexOrdering(IntEnum):
	Vrml_UNKNOWN_ORDERING = 0
	Vrml_CLOCKWISE = 1
	Vrml_COUNTERCLOCKWISE = 2
Vrml_UNKNOWN_ORDERING = Vrml_VertexOrdering.Vrml_UNKNOWN_ORDERING
Vrml_CLOCKWISE = Vrml_VertexOrdering.Vrml_CLOCKWISE
Vrml_COUNTERCLOCKWISE = Vrml_VertexOrdering.Vrml_COUNTERCLOCKWISE

class Vrml_FontStyleFamily(IntEnum):
	Vrml_SERIF = 0
	Vrml_SANS = 1
	Vrml_TYPEWRITER = 2
Vrml_SERIF = Vrml_FontStyleFamily.Vrml_SERIF
Vrml_SANS = Vrml_FontStyleFamily.Vrml_SANS
Vrml_TYPEWRITER = Vrml_FontStyleFamily.Vrml_TYPEWRITER

class Vrml_SeparatorRenderCulling(IntEnum):
	Vrml_OFF = 0
	Vrml_ON = 1
	Vrml_AUTO = 2
Vrml_OFF = Vrml_SeparatorRenderCulling.Vrml_OFF
Vrml_ON = Vrml_SeparatorRenderCulling.Vrml_ON
Vrml_AUTO = Vrml_SeparatorRenderCulling.Vrml_AUTO

class Vrml_Texture2Wrap(IntEnum):
	Vrml_REPEAT = 0
	Vrml_CLAMP = 1
Vrml_REPEAT = Vrml_Texture2Wrap.Vrml_REPEAT
Vrml_CLAMP = Vrml_Texture2Wrap.Vrml_CLAMP

class Vrml_FaceType(IntEnum):
	Vrml_UNKNOWN_FACE_TYPE = 0
	Vrml_CONVEX = 1
Vrml_UNKNOWN_FACE_TYPE = Vrml_FaceType.Vrml_UNKNOWN_FACE_TYPE
Vrml_CONVEX = Vrml_FaceType.Vrml_CONVEX

class Vrml_AsciiTextJustification(IntEnum):
	Vrml_LEFT = 0
	Vrml_CENTER = 1
	Vrml_RIGHT = 2
Vrml_LEFT = Vrml_AsciiTextJustification.Vrml_LEFT
Vrml_CENTER = Vrml_AsciiTextJustification.Vrml_CENTER
Vrml_RIGHT = Vrml_AsciiTextJustification.Vrml_RIGHT

class Vrml_ConeParts(IntEnum):
	Vrml_ConeSIDES = 0
	Vrml_ConeBOTTOM = 1
	Vrml_ConeALL = 2
Vrml_ConeSIDES = Vrml_ConeParts.Vrml_ConeSIDES
Vrml_ConeBOTTOM = Vrml_ConeParts.Vrml_ConeBOTTOM
Vrml_ConeALL = Vrml_ConeParts.Vrml_ConeALL

class Vrml_SFImageNumber(IntEnum):
	Vrml_NULL = 0
	Vrml_ONE = 1
	Vrml_TWO = 2
	Vrml_THREE = 3
	Vrml_FOUR = 4
Vrml_NULL = Vrml_SFImageNumber.Vrml_NULL
Vrml_ONE = Vrml_SFImageNumber.Vrml_ONE
Vrml_TWO = Vrml_SFImageNumber.Vrml_TWO
Vrml_THREE = Vrml_SFImageNumber.Vrml_THREE
Vrml_FOUR = Vrml_SFImageNumber.Vrml_FOUR

class Vrml_MaterialBindingAndNormalBinding(IntEnum):
	Vrml_DEFAULT = 0
	Vrml_OVERALL = 1
	Vrml_PER_PART = 2
	Vrml_PER_PART_INDEXED = 3
	Vrml_PER_FACE = 4
	Vrml_PER_FACE_INDEXED = 5
	Vrml_PER_VERTEX = 6
	Vrml_PER_VERTEX_INDEXED = 7
Vrml_DEFAULT = Vrml_MaterialBindingAndNormalBinding.Vrml_DEFAULT
Vrml_OVERALL = Vrml_MaterialBindingAndNormalBinding.Vrml_OVERALL
Vrml_PER_PART = Vrml_MaterialBindingAndNormalBinding.Vrml_PER_PART
Vrml_PER_PART_INDEXED = Vrml_MaterialBindingAndNormalBinding.Vrml_PER_PART_INDEXED
Vrml_PER_FACE = Vrml_MaterialBindingAndNormalBinding.Vrml_PER_FACE
Vrml_PER_FACE_INDEXED = Vrml_MaterialBindingAndNormalBinding.Vrml_PER_FACE_INDEXED
Vrml_PER_VERTEX = Vrml_MaterialBindingAndNormalBinding.Vrml_PER_VERTEX
Vrml_PER_VERTEX_INDEXED = Vrml_MaterialBindingAndNormalBinding.Vrml_PER_VERTEX_INDEXED

class Vrml_ShapeType(IntEnum):
	Vrml_UNKNOWN_SHAPE_TYPE = 0
	Vrml_SOLID = 1
Vrml_UNKNOWN_SHAPE_TYPE = Vrml_ShapeType.Vrml_UNKNOWN_SHAPE_TYPE
Vrml_SOLID = Vrml_ShapeType.Vrml_SOLID

class Vrml_WWWAnchorMap(IntEnum):
	Vrml_MAP_NONE = 0
	Vrml_POINT = 1
Vrml_MAP_NONE = Vrml_WWWAnchorMap.Vrml_MAP_NONE
Vrml_POINT = Vrml_WWWAnchorMap.Vrml_POINT

class Vrml_CylinderParts(IntEnum):
	Vrml_CylinderSIDES = 0
	Vrml_CylinderTOP = 1
	Vrml_CylinderBOTTOM = 2
	Vrml_CylinderALL = 3
Vrml_CylinderSIDES = Vrml_CylinderParts.Vrml_CylinderSIDES
Vrml_CylinderTOP = Vrml_CylinderParts.Vrml_CylinderTOP
Vrml_CylinderBOTTOM = Vrml_CylinderParts.Vrml_CylinderBOTTOM
Vrml_CylinderALL = Vrml_CylinderParts.Vrml_CylinderALL

class Vrml_FontStyleStyle(IntEnum):
	Vrml_NONE = 0
	Vrml_BOLD = 1
	Vrml_ITALIC = 2
Vrml_NONE = Vrml_FontStyleStyle.Vrml_NONE
Vrml_BOLD = Vrml_FontStyleStyle.Vrml_BOLD
Vrml_ITALIC = Vrml_FontStyleStyle.Vrml_ITALIC
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Vrml_AsciiText)
%wrap_handle(Vrml_Coordinate3)
%wrap_handle(Vrml_IndexedFaceSet)
%wrap_handle(Vrml_IndexedLineSet)
%wrap_handle(Vrml_LOD)
%wrap_handle(Vrml_Material)
%wrap_handle(Vrml_Normal)
%wrap_handle(Vrml_SFImage)
%wrap_handle(Vrml_TextureCoordinate2)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*************
* class Vrml *
*************/
%rename(vrml) Vrml;
class Vrml {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string VrmlHeaderWriterToString() {
            std::stringstream s;
            self->VrmlHeaderWriter(s);
            return s.str();}
        };
};


%extend Vrml {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Vrml_AsciiText *
***********************/
class Vrml_AsciiText : public Standard_Transient {
	public:
		/****************** Vrml_AsciiText ******************/
		/**** md5 signature: 8dcccbc17fe1fe239cb5057b37333b1d ****/
		%feature("compactdefaultargs") Vrml_AsciiText;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_AsciiText;
		 Vrml_AsciiText();

		/****************** Vrml_AsciiText ******************/
		/**** md5 signature: bbb43e550b8479d736d23ce227048e15 ****/
		%feature("compactdefaultargs") Vrml_AsciiText;
		%feature("autodoc", "No available documentation.

Parameters
----------
aString: TColStd_HArray1OfAsciiString
aSpacing: float
aJustification: Vrml_AsciiTextJustification
aWidth: float

Returns
-------
None
") Vrml_AsciiText;
		 Vrml_AsciiText(const opencascade::handle<TColStd_HArray1OfAsciiString> & aString, const Standard_Real aSpacing, const Vrml_AsciiTextJustification aJustification, const Standard_Real aWidth);

		/****************** Justification ******************/
		/**** md5 signature: f7b5f3dd5d19ad2211adcdc674352bea ****/
		%feature("compactdefaultargs") Justification;
		%feature("autodoc", "No available documentation.

Returns
-------
Vrml_AsciiTextJustification
") Justification;
		Vrml_AsciiTextJustification Justification();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** SetJustification ******************/
		/**** md5 signature: 3950698a2301d05e87ab121d39eef7c5 ****/
		%feature("compactdefaultargs") SetJustification;
		%feature("autodoc", "No available documentation.

Parameters
----------
aJustification: Vrml_AsciiTextJustification

Returns
-------
None
") SetJustification;
		void SetJustification(const Vrml_AsciiTextJustification aJustification);

		/****************** SetSpacing ******************/
		/**** md5 signature: 31e734ea4ff25bcb9f6be99f255fddd4 ****/
		%feature("compactdefaultargs") SetSpacing;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSpacing: float

Returns
-------
None
") SetSpacing;
		void SetSpacing(const Standard_Real aSpacing);

		/****************** SetString ******************/
		/**** md5 signature: 3013cd908c644f50fca1a170ab3334fd ****/
		%feature("compactdefaultargs") SetString;
		%feature("autodoc", "No available documentation.

Parameters
----------
aString: TColStd_HArray1OfAsciiString

Returns
-------
None
") SetString;
		void SetString(const opencascade::handle<TColStd_HArray1OfAsciiString> & aString);

		/****************** SetWidth ******************/
		/**** md5 signature: 241a01ddb40e85ceaaa56807348390c6 ****/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "No available documentation.

Parameters
----------
aWidth: float

Returns
-------
None
") SetWidth;
		void SetWidth(const Standard_Real aWidth);

		/****************** Spacing ******************/
		/**** md5 signature: b6f003770198f9bf94078999d47973f8 ****/
		%feature("compactdefaultargs") Spacing;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Spacing;
		Standard_Real Spacing();

		/****************** String ******************/
		/**** md5 signature: d0b8635a778118e1767640e3dfd7f5e3 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfAsciiString>
") String;
		opencascade::handle<TColStd_HArray1OfAsciiString> String();

		/****************** Width ******************/
		/**** md5 signature: e40fe8cb5cdcf41ad2ab06ede13e859b ****/
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Width;
		Standard_Real Width();

};


%make_alias(Vrml_AsciiText)

%extend Vrml_AsciiText {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class Vrml_Cone *
******************/
class Vrml_Cone {
	public:
		/****************** Vrml_Cone ******************/
		/**** md5 signature: 2bdbeb285d459aa794efa8629d0df067 ****/
		%feature("compactdefaultargs") Vrml_Cone;
		%feature("autodoc", "No available documentation.

Parameters
----------
aParts: Vrml_ConeParts,optional
	default value is Vrml_ConeALL
aBottomRadius: float,optional
	default value is 1
aHeight: float,optional
	default value is 2

Returns
-------
None
") Vrml_Cone;
		 Vrml_Cone(const Vrml_ConeParts aParts = Vrml_ConeALL, const Standard_Real aBottomRadius = 1, const Standard_Real aHeight = 2);

		/****************** BottomRadius ******************/
		/**** md5 signature: 4cdf2fe7f415a79ecb78d4ee1a2e2e22 ****/
		%feature("compactdefaultargs") BottomRadius;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") BottomRadius;
		Standard_Real BottomRadius();

		/****************** Height ******************/
		/**** md5 signature: b7486e9db42a6b5d4ef64408e52d8a4b ****/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Height;
		Standard_Real Height();

		/****************** Parts ******************/
		/**** md5 signature: 26d39ad8de41c8a9d0752d74b268a6a7 ****/
		%feature("compactdefaultargs") Parts;
		%feature("autodoc", "No available documentation.

Returns
-------
Vrml_ConeParts
") Parts;
		Vrml_ConeParts Parts();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** SetBottomRadius ******************/
		/**** md5 signature: 83831c7af161fbeed20e59efdcef6cc9 ****/
		%feature("compactdefaultargs") SetBottomRadius;
		%feature("autodoc", "No available documentation.

Parameters
----------
aBottomRadius: float

Returns
-------
None
") SetBottomRadius;
		void SetBottomRadius(const Standard_Real aBottomRadius);

		/****************** SetHeight ******************/
		/**** md5 signature: b595945ce652624ed7910bc5ffdf66ae ****/
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "No available documentation.

Parameters
----------
aHeight: float

Returns
-------
None
") SetHeight;
		void SetHeight(const Standard_Real aHeight);

		/****************** SetParts ******************/
		/**** md5 signature: fb601b0ea4acddc3c7126e1dd53f86fc ****/
		%feature("compactdefaultargs") SetParts;
		%feature("autodoc", "No available documentation.

Parameters
----------
aParts: Vrml_ConeParts

Returns
-------
None
") SetParts;
		void SetParts(const Vrml_ConeParts aParts);

};


%extend Vrml_Cone {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Vrml_Coordinate3 *
*************************/
class Vrml_Coordinate3 : public Standard_Transient {
	public:
		/****************** Vrml_Coordinate3 ******************/
		/**** md5 signature: ecce689dbb99e4c529f7f2dd3ad54c90 ****/
		%feature("compactdefaultargs") Vrml_Coordinate3;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPoint: TColgp_HArray1OfVec

Returns
-------
None
") Vrml_Coordinate3;
		 Vrml_Coordinate3(const opencascade::handle<TColgp_HArray1OfVec> & aPoint);

		/****************** Vrml_Coordinate3 ******************/
		/**** md5 signature: caa651195ec5275c95e9738226765ecf ****/
		%feature("compactdefaultargs") Vrml_Coordinate3;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_Coordinate3;
		 Vrml_Coordinate3();

		/****************** Point ******************/
		/**** md5 signature: 835b1d5946610661596b6845f23da1e3 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColgp_HArray1OfVec>
") Point;
		opencascade::handle<TColgp_HArray1OfVec> Point();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** SetPoint ******************/
		/**** md5 signature: 2531979fc318076a2efdf95b81e431c9 ****/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPoint: TColgp_HArray1OfVec

Returns
-------
None
") SetPoint;
		void SetPoint(const opencascade::handle<TColgp_HArray1OfVec> & aPoint);

};


%make_alias(Vrml_Coordinate3)

%extend Vrml_Coordinate3 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class Vrml_Cube *
******************/
class Vrml_Cube {
	public:
		/****************** Vrml_Cube ******************/
		/**** md5 signature: 4d6aed10ba67bc4d2a31947736f2a9c1 ****/
		%feature("compactdefaultargs") Vrml_Cube;
		%feature("autodoc", "No available documentation.

Parameters
----------
aWidth: float,optional
	default value is 2
aHeight: float,optional
	default value is 2
aDepth: float,optional
	default value is 2

Returns
-------
None
") Vrml_Cube;
		 Vrml_Cube(const Standard_Real aWidth = 2, const Standard_Real aHeight = 2, const Standard_Real aDepth = 2);

		/****************** Depth ******************/
		/**** md5 signature: de7560cf701656c85d7ea3c1f074fd03 ****/
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Depth;
		Standard_Real Depth();

		/****************** Height ******************/
		/**** md5 signature: b7486e9db42a6b5d4ef64408e52d8a4b ****/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Height;
		Standard_Real Height();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** SetDepth ******************/
		/**** md5 signature: 4ed376ce95444c7357cf149677ef5fde ****/
		%feature("compactdefaultargs") SetDepth;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDepth: float

Returns
-------
None
") SetDepth;
		void SetDepth(const Standard_Real aDepth);

		/****************** SetHeight ******************/
		/**** md5 signature: b595945ce652624ed7910bc5ffdf66ae ****/
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "No available documentation.

Parameters
----------
aHeight: float

Returns
-------
None
") SetHeight;
		void SetHeight(const Standard_Real aHeight);

		/****************** SetWidth ******************/
		/**** md5 signature: 241a01ddb40e85ceaaa56807348390c6 ****/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "No available documentation.

Parameters
----------
aWidth: float

Returns
-------
None
") SetWidth;
		void SetWidth(const Standard_Real aWidth);

		/****************** Width ******************/
		/**** md5 signature: e40fe8cb5cdcf41ad2ab06ede13e859b ****/
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Width;
		Standard_Real Width();

};


%extend Vrml_Cube {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Vrml_Cylinder *
**********************/
class Vrml_Cylinder {
	public:
		/****************** Vrml_Cylinder ******************/
		/**** md5 signature: 23454f7be81bee10c0cfe928b9593bb0 ****/
		%feature("compactdefaultargs") Vrml_Cylinder;
		%feature("autodoc", "No available documentation.

Parameters
----------
aParts: Vrml_CylinderParts,optional
	default value is Vrml_CylinderALL
aRadius: float,optional
	default value is 1
aHeight: float,optional
	default value is 2

Returns
-------
None
") Vrml_Cylinder;
		 Vrml_Cylinder(const Vrml_CylinderParts aParts = Vrml_CylinderALL, const Standard_Real aRadius = 1, const Standard_Real aHeight = 2);

		/****************** Height ******************/
		/**** md5 signature: b7486e9db42a6b5d4ef64408e52d8a4b ****/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Height;
		Standard_Real Height();

		/****************** Parts ******************/
		/**** md5 signature: f4df95d71d7d2c7655c6fc632b765144 ****/
		%feature("compactdefaultargs") Parts;
		%feature("autodoc", "No available documentation.

Returns
-------
Vrml_CylinderParts
") Parts;
		Vrml_CylinderParts Parts();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** Radius ******************/
		/**** md5 signature: 506a8dc1140a54bd4146c24bb5357fbf ****/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** SetHeight ******************/
		/**** md5 signature: b595945ce652624ed7910bc5ffdf66ae ****/
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "No available documentation.

Parameters
----------
aHeight: float

Returns
-------
None
") SetHeight;
		void SetHeight(const Standard_Real aHeight);

		/****************** SetParts ******************/
		/**** md5 signature: 363ab2c780d68466100e4299ef8fa785 ****/
		%feature("compactdefaultargs") SetParts;
		%feature("autodoc", "No available documentation.

Parameters
----------
aParts: Vrml_CylinderParts

Returns
-------
None
") SetParts;
		void SetParts(const Vrml_CylinderParts aParts);

		/****************** SetRadius ******************/
		/**** md5 signature: 75bdaaca53fe512f9758601eef8521b0 ****/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRadius: float

Returns
-------
None
") SetRadius;
		void SetRadius(const Standard_Real aRadius);

};


%extend Vrml_Cylinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Vrml_DirectionalLight *
******************************/
class Vrml_DirectionalLight {
	public:
		/****************** Vrml_DirectionalLight ******************/
		/**** md5 signature: dbef6905ed9fd05596d93ca2a5b41127 ****/
		%feature("compactdefaultargs") Vrml_DirectionalLight;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_DirectionalLight;
		 Vrml_DirectionalLight();

		/****************** Vrml_DirectionalLight ******************/
		/**** md5 signature: 9a6698874f5180376609c4dd677f0935 ****/
		%feature("compactdefaultargs") Vrml_DirectionalLight;
		%feature("autodoc", "No available documentation.

Parameters
----------
aOnOff: bool
aIntensity: float
aColor: Quantity_Color
aDirection: gp_Vec

Returns
-------
None
") Vrml_DirectionalLight;
		 Vrml_DirectionalLight(const Standard_Boolean aOnOff, const Standard_Real aIntensity, const Quantity_Color & aColor, const gp_Vec & aDirection);

		/****************** Color ******************/
		/**** md5 signature: b37a2e584a895a08fcf8ead60940b246 ****/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "No available documentation.

Returns
-------
Quantity_Color
") Color;
		Quantity_Color Color();

		/****************** Direction ******************/
		/**** md5 signature: 36725d4d9370b25778d365a2d983c00e ****/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") Direction;
		gp_Vec Direction();

		/****************** Intensity ******************/
		/**** md5 signature: ce9240a693f5bdfdaa91a711de325222 ****/
		%feature("compactdefaultargs") Intensity;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Intensity;
		Standard_Real Intensity();

		/****************** OnOff ******************/
		/**** md5 signature: 1623cdf1315a616b653a683621672f41 ****/
		%feature("compactdefaultargs") OnOff;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") OnOff;
		Standard_Boolean OnOff();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** SetColor ******************/
		/**** md5 signature: 5aebf70a123538e7dff670112c56db0d ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "No available documentation.

Parameters
----------
aColor: Quantity_Color

Returns
-------
None
") SetColor;
		void SetColor(const Quantity_Color & aColor);

		/****************** SetDirection ******************/
		/**** md5 signature: 631fcce8229d14261aa80e6545acf64f ****/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDirection: gp_Vec

Returns
-------
None
") SetDirection;
		void SetDirection(const gp_Vec & aDirection);

		/****************** SetIntensity ******************/
		/**** md5 signature: d83199c26d505783e2f37c8e7ca17011 ****/
		%feature("compactdefaultargs") SetIntensity;
		%feature("autodoc", "No available documentation.

Parameters
----------
aIntensity: float

Returns
-------
None
") SetIntensity;
		void SetIntensity(const Standard_Real aIntensity);

		/****************** SetOnOff ******************/
		/**** md5 signature: ec2f3be555932b38580e5b4a2d50b4c2 ****/
		%feature("compactdefaultargs") SetOnOff;
		%feature("autodoc", "No available documentation.

Parameters
----------
aOnOff: bool

Returns
-------
None
") SetOnOff;
		void SetOnOff(const Standard_Boolean aOnOff);

};


%extend Vrml_DirectionalLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Vrml_FontStyle *
***********************/
class Vrml_FontStyle {
	public:
		/****************** Vrml_FontStyle ******************/
		/**** md5 signature: b18ca7ff2c2af3e2100c7bbc4c170798 ****/
		%feature("compactdefaultargs") Vrml_FontStyle;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSize: float,optional
	default value is 10
aFamily: Vrml_FontStyleFamily,optional
	default value is Vrml_SERIF
aStyle: Vrml_FontStyleStyle,optional
	default value is Vrml_NONE

Returns
-------
None
") Vrml_FontStyle;
		 Vrml_FontStyle(const Standard_Real aSize = 10, const Vrml_FontStyleFamily aFamily = Vrml_SERIF, const Vrml_FontStyleStyle aStyle = Vrml_NONE);

		/****************** Family ******************/
		/**** md5 signature: d1ecc1f19f57b4ada363cdf58dc7ba8d ****/
		%feature("compactdefaultargs") Family;
		%feature("autodoc", "No available documentation.

Returns
-------
Vrml_FontStyleFamily
") Family;
		Vrml_FontStyleFamily Family();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** SetFamily ******************/
		/**** md5 signature: b0100e13b2e059fb2e8b420788ec2a61 ****/
		%feature("compactdefaultargs") SetFamily;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFamily: Vrml_FontStyleFamily

Returns
-------
None
") SetFamily;
		void SetFamily(const Vrml_FontStyleFamily aFamily);

		/****************** SetSize ******************/
		/**** md5 signature: aaab85e4d810aa4f2c968d98c7e6942e ****/
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSize: float

Returns
-------
None
") SetSize;
		void SetSize(const Standard_Real aSize);

		/****************** SetStyle ******************/
		/**** md5 signature: 844327ee819b53f260feccbfebd41096 ****/
		%feature("compactdefaultargs") SetStyle;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStyle: Vrml_FontStyleStyle

Returns
-------
None
") SetStyle;
		void SetStyle(const Vrml_FontStyleStyle aStyle);

		/****************** Size ******************/
		/**** md5 signature: a8e9905382c3964d697ee929ccdb9562 ****/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Size;
		Standard_Real Size();

		/****************** Style ******************/
		/**** md5 signature: 52df975e76cc44f74da30207fc4e3cfc ****/
		%feature("compactdefaultargs") Style;
		%feature("autodoc", "No available documentation.

Returns
-------
Vrml_FontStyleStyle
") Style;
		Vrml_FontStyleStyle Style();

};


%extend Vrml_FontStyle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class Vrml_Group *
*******************/
class Vrml_Group {
	public:
		/****************** Vrml_Group ******************/
		/**** md5 signature: 47103d366ba33ef63abf34756e3930fc ****/
		%feature("compactdefaultargs") Vrml_Group;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_Group;
		 Vrml_Group();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
};


%extend Vrml_Group {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Vrml_IndexedFaceSet *
****************************/
class Vrml_IndexedFaceSet : public Standard_Transient {
	public:
		/****************** Vrml_IndexedFaceSet ******************/
		/**** md5 signature: 52dbfb6e15b45ad06dc22cf9c835ce09 ****/
		%feature("compactdefaultargs") Vrml_IndexedFaceSet;
		%feature("autodoc", "No available documentation.

Parameters
----------
aCoordIndex: TColStd_HArray1OfInteger
aMaterialIndex: TColStd_HArray1OfInteger
aNormalIndex: TColStd_HArray1OfInteger
aTextureCoordIndex: TColStd_HArray1OfInteger

Returns
-------
None
") Vrml_IndexedFaceSet;
		 Vrml_IndexedFaceSet(const opencascade::handle<TColStd_HArray1OfInteger> & aCoordIndex, const opencascade::handle<TColStd_HArray1OfInteger> & aMaterialIndex, const opencascade::handle<TColStd_HArray1OfInteger> & aNormalIndex, const opencascade::handle<TColStd_HArray1OfInteger> & aTextureCoordIndex);

		/****************** Vrml_IndexedFaceSet ******************/
		/**** md5 signature: 50ef4121137fded12bf9eaedab6bc411 ****/
		%feature("compactdefaultargs") Vrml_IndexedFaceSet;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_IndexedFaceSet;
		 Vrml_IndexedFaceSet();

		/****************** CoordIndex ******************/
		/**** md5 signature: b0c698b923ddf2c5f3eb869ea9ffaa5e ****/
		%feature("compactdefaultargs") CoordIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfInteger>
") CoordIndex;
		opencascade::handle<TColStd_HArray1OfInteger> CoordIndex();

		/****************** MaterialIndex ******************/
		/**** md5 signature: 743de42134bcbaa41199998f13a6fb5a ****/
		%feature("compactdefaultargs") MaterialIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfInteger>
") MaterialIndex;
		opencascade::handle<TColStd_HArray1OfInteger> MaterialIndex();

		/****************** NormalIndex ******************/
		/**** md5 signature: 7005e8887cf8a878dc47379a1a2f115f ****/
		%feature("compactdefaultargs") NormalIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfInteger>
") NormalIndex;
		opencascade::handle<TColStd_HArray1OfInteger> NormalIndex();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** SetCoordIndex ******************/
		/**** md5 signature: 8aac1fe12bc1ddfc66bc94e00112273c ****/
		%feature("compactdefaultargs") SetCoordIndex;
		%feature("autodoc", "No available documentation.

Parameters
----------
aCoordIndex: TColStd_HArray1OfInteger

Returns
-------
None
") SetCoordIndex;
		void SetCoordIndex(const opencascade::handle<TColStd_HArray1OfInteger> & aCoordIndex);

		/****************** SetMaterialIndex ******************/
		/**** md5 signature: b519ba6144c721dfe16c03654288c8c3 ****/
		%feature("compactdefaultargs") SetMaterialIndex;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMaterialIndex: TColStd_HArray1OfInteger

Returns
-------
None
") SetMaterialIndex;
		void SetMaterialIndex(const opencascade::handle<TColStd_HArray1OfInteger> & aMaterialIndex);

		/****************** SetNormalIndex ******************/
		/**** md5 signature: 3d86b3efe364adf38df4fc2f2d570e60 ****/
		%feature("compactdefaultargs") SetNormalIndex;
		%feature("autodoc", "No available documentation.

Parameters
----------
aNormalIndex: TColStd_HArray1OfInteger

Returns
-------
None
") SetNormalIndex;
		void SetNormalIndex(const opencascade::handle<TColStd_HArray1OfInteger> & aNormalIndex);

		/****************** SetTextureCoordIndex ******************/
		/**** md5 signature: 4ff25115e630fb57b81ece90f54083dd ****/
		%feature("compactdefaultargs") SetTextureCoordIndex;
		%feature("autodoc", "No available documentation.

Parameters
----------
aTextureCoordIndex: TColStd_HArray1OfInteger

Returns
-------
None
") SetTextureCoordIndex;
		void SetTextureCoordIndex(const opencascade::handle<TColStd_HArray1OfInteger> & aTextureCoordIndex);

		/****************** TextureCoordIndex ******************/
		/**** md5 signature: ddb123225e48c68375519e67052f5ee0 ****/
		%feature("compactdefaultargs") TextureCoordIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfInteger>
") TextureCoordIndex;
		opencascade::handle<TColStd_HArray1OfInteger> TextureCoordIndex();

};


%make_alias(Vrml_IndexedFaceSet)

%extend Vrml_IndexedFaceSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Vrml_IndexedLineSet *
****************************/
class Vrml_IndexedLineSet : public Standard_Transient {
	public:
		/****************** Vrml_IndexedLineSet ******************/
		/**** md5 signature: b044ce6b5bdafc7ebd91d941102c5d9d ****/
		%feature("compactdefaultargs") Vrml_IndexedLineSet;
		%feature("autodoc", "No available documentation.

Parameters
----------
aCoordIndex: TColStd_HArray1OfInteger
aMaterialIndex: TColStd_HArray1OfInteger
aNormalIndex: TColStd_HArray1OfInteger
aTextureCoordIndex: TColStd_HArray1OfInteger

Returns
-------
None
") Vrml_IndexedLineSet;
		 Vrml_IndexedLineSet(const opencascade::handle<TColStd_HArray1OfInteger> & aCoordIndex, const opencascade::handle<TColStd_HArray1OfInteger> & aMaterialIndex, const opencascade::handle<TColStd_HArray1OfInteger> & aNormalIndex, const opencascade::handle<TColStd_HArray1OfInteger> & aTextureCoordIndex);

		/****************** Vrml_IndexedLineSet ******************/
		/**** md5 signature: d1db7e38579850dce4baefc6cd4bee81 ****/
		%feature("compactdefaultargs") Vrml_IndexedLineSet;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_IndexedLineSet;
		 Vrml_IndexedLineSet();

		/****************** CoordIndex ******************/
		/**** md5 signature: b0c698b923ddf2c5f3eb869ea9ffaa5e ****/
		%feature("compactdefaultargs") CoordIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfInteger>
") CoordIndex;
		opencascade::handle<TColStd_HArray1OfInteger> CoordIndex();

		/****************** MaterialIndex ******************/
		/**** md5 signature: 743de42134bcbaa41199998f13a6fb5a ****/
		%feature("compactdefaultargs") MaterialIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfInteger>
") MaterialIndex;
		opencascade::handle<TColStd_HArray1OfInteger> MaterialIndex();

		/****************** NormalIndex ******************/
		/**** md5 signature: 7005e8887cf8a878dc47379a1a2f115f ****/
		%feature("compactdefaultargs") NormalIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfInteger>
") NormalIndex;
		opencascade::handle<TColStd_HArray1OfInteger> NormalIndex();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** SetCoordIndex ******************/
		/**** md5 signature: 8aac1fe12bc1ddfc66bc94e00112273c ****/
		%feature("compactdefaultargs") SetCoordIndex;
		%feature("autodoc", "No available documentation.

Parameters
----------
aCoordIndex: TColStd_HArray1OfInteger

Returns
-------
None
") SetCoordIndex;
		void SetCoordIndex(const opencascade::handle<TColStd_HArray1OfInteger> & aCoordIndex);

		/****************** SetMaterialIndex ******************/
		/**** md5 signature: b519ba6144c721dfe16c03654288c8c3 ****/
		%feature("compactdefaultargs") SetMaterialIndex;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMaterialIndex: TColStd_HArray1OfInteger

Returns
-------
None
") SetMaterialIndex;
		void SetMaterialIndex(const opencascade::handle<TColStd_HArray1OfInteger> & aMaterialIndex);

		/****************** SetNormalIndex ******************/
		/**** md5 signature: 3d86b3efe364adf38df4fc2f2d570e60 ****/
		%feature("compactdefaultargs") SetNormalIndex;
		%feature("autodoc", "No available documentation.

Parameters
----------
aNormalIndex: TColStd_HArray1OfInteger

Returns
-------
None
") SetNormalIndex;
		void SetNormalIndex(const opencascade::handle<TColStd_HArray1OfInteger> & aNormalIndex);

		/****************** SetTextureCoordIndex ******************/
		/**** md5 signature: 4ff25115e630fb57b81ece90f54083dd ****/
		%feature("compactdefaultargs") SetTextureCoordIndex;
		%feature("autodoc", "No available documentation.

Parameters
----------
aTextureCoordIndex: TColStd_HArray1OfInteger

Returns
-------
None
") SetTextureCoordIndex;
		void SetTextureCoordIndex(const opencascade::handle<TColStd_HArray1OfInteger> & aTextureCoordIndex);

		/****************** TextureCoordIndex ******************/
		/**** md5 signature: ddb123225e48c68375519e67052f5ee0 ****/
		%feature("compactdefaultargs") TextureCoordIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfInteger>
") TextureCoordIndex;
		opencascade::handle<TColStd_HArray1OfInteger> TextureCoordIndex();

};


%make_alias(Vrml_IndexedLineSet)

%extend Vrml_IndexedLineSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class Vrml_Info *
******************/
class Vrml_Info {
	public:
		/****************** Vrml_Info ******************/
		/**** md5 signature: bc877427b2199ce9ff5dfd3729d0383a ****/
		%feature("compactdefaultargs") Vrml_Info;
		%feature("autodoc", "No available documentation.

Parameters
----------
aString: TCollection_AsciiString,optional
	default value is '<Undefinedinfo>'

Returns
-------
None
") Vrml_Info;
		 Vrml_Info(const TCollection_AsciiString & aString = "<Undefinedinfo>");


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** SetString ******************/
		/**** md5 signature: 019f64b9292447922865012d29fa7284 ****/
		%feature("compactdefaultargs") SetString;
		%feature("autodoc", "No available documentation.

Parameters
----------
aString: TCollection_AsciiString

Returns
-------
None
") SetString;
		void SetString(const TCollection_AsciiString & aString);

		/****************** String ******************/
		/**** md5 signature: eff55c5ebef3b81579f35035613cf230 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_AsciiString
") String;
		TCollection_AsciiString String();

};


%extend Vrml_Info {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Vrml_Instancing *
************************/
class Vrml_Instancing {
	public:
		/****************** Vrml_Instancing ******************/
		/**** md5 signature: 85b0e9f698136a9dfeb1083c400d74d4 ****/
		%feature("compactdefaultargs") Vrml_Instancing;
		%feature("autodoc", "Adds 'def <myname>' in anostream (vrml file).

Parameters
----------
aString: TCollection_AsciiString

Returns
-------
None
") Vrml_Instancing;
		 Vrml_Instancing(const TCollection_AsciiString & aString);


        %feature("autodoc", "1");
        %extend{
            std::string DEFToString() {
            std::stringstream s;
            self->DEF(s);
            return s.str();}
        };

        %feature("autodoc", "1");
        %extend{
            std::string USEToString() {
            std::stringstream s;
            self->USE(s);
            return s.str();}
        };
};


%extend Vrml_Instancing {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class Vrml_LOD *
*****************/
class Vrml_LOD : public Standard_Transient {
	public:
		/****************** Vrml_LOD ******************/
		/**** md5 signature: 527c528128c1662dea8cf2ce590d955d ****/
		%feature("compactdefaultargs") Vrml_LOD;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_LOD;
		 Vrml_LOD();

		/****************** Vrml_LOD ******************/
		/**** md5 signature: 62bc60c83d4806ec16b1a396adf6f9e1 ****/
		%feature("compactdefaultargs") Vrml_LOD;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRange: TColStd_HArray1OfReal
aCenter: gp_Vec

Returns
-------
None
") Vrml_LOD;
		 Vrml_LOD(const opencascade::handle<TColStd_HArray1OfReal> & aRange, const gp_Vec & aCenter);

		/****************** Center ******************/
		/**** md5 signature: 61ea9e63ca1b0195aa3037fd3c59632f ****/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") Center;
		gp_Vec Center();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** Range ******************/
		/**** md5 signature: bef409c2278798ac43ffa883362425bc ****/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") Range;
		opencascade::handle<TColStd_HArray1OfReal> Range();

		/****************** SetCenter ******************/
		/**** md5 signature: a703ddf7cd16de3b4903371c8cb8e217 ****/
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "No available documentation.

Parameters
----------
aCenter: gp_Vec

Returns
-------
None
") SetCenter;
		void SetCenter(const gp_Vec & aCenter);

		/****************** SetRange ******************/
		/**** md5 signature: bf3fdbcd072544cb97370fb2ca496ee1 ****/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRange: TColStd_HArray1OfReal

Returns
-------
None
") SetRange;
		void SetRange(const opencascade::handle<TColStd_HArray1OfReal> & aRange);

};


%make_alias(Vrml_LOD)

%extend Vrml_LOD {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Vrml_Material *
**********************/
class Vrml_Material : public Standard_Transient {
	public:
		/****************** Vrml_Material ******************/
		/**** md5 signature: fc5891972bc6bcfa22f767dc9cbaa5b3 ****/
		%feature("compactdefaultargs") Vrml_Material;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAmbientColor: Quantity_HArray1OfColor
aDiffuseColor: Quantity_HArray1OfColor
aSpecularColor: Quantity_HArray1OfColor
aEmissiveColor: Quantity_HArray1OfColor
aShininess: TColStd_HArray1OfReal
aTransparency: TColStd_HArray1OfReal

Returns
-------
None
") Vrml_Material;
		 Vrml_Material(const opencascade::handle<Quantity_HArray1OfColor> & aAmbientColor, const opencascade::handle<Quantity_HArray1OfColor> & aDiffuseColor, const opencascade::handle<Quantity_HArray1OfColor> & aSpecularColor, const opencascade::handle<Quantity_HArray1OfColor> & aEmissiveColor, const opencascade::handle<TColStd_HArray1OfReal> & aShininess, const opencascade::handle<TColStd_HArray1OfReal> & aTransparency);

		/****************** Vrml_Material ******************/
		/**** md5 signature: d9815f4a50eda7816ab5f7d8bebf8226 ****/
		%feature("compactdefaultargs") Vrml_Material;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_Material;
		 Vrml_Material();

		/****************** AmbientColor ******************/
		/**** md5 signature: 0f45578f937e203ca177fe48529e0ea4 ****/
		%feature("compactdefaultargs") AmbientColor;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Quantity_HArray1OfColor>
") AmbientColor;
		opencascade::handle<Quantity_HArray1OfColor> AmbientColor();

		/****************** DiffuseColor ******************/
		/**** md5 signature: 6bf474fb593b837a3704daf5d638946f ****/
		%feature("compactdefaultargs") DiffuseColor;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Quantity_HArray1OfColor>
") DiffuseColor;
		opencascade::handle<Quantity_HArray1OfColor> DiffuseColor();

		/****************** EmissiveColor ******************/
		/**** md5 signature: b7ca2bdf838107d5e4a264d1ccb1e122 ****/
		%feature("compactdefaultargs") EmissiveColor;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Quantity_HArray1OfColor>
") EmissiveColor;
		opencascade::handle<Quantity_HArray1OfColor> EmissiveColor();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** SetAmbientColor ******************/
		/**** md5 signature: 7a2810fd7bedaae7bea499eb43ecaf68 ****/
		%feature("compactdefaultargs") SetAmbientColor;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAmbientColor: Quantity_HArray1OfColor

Returns
-------
None
") SetAmbientColor;
		void SetAmbientColor(const opencascade::handle<Quantity_HArray1OfColor> & aAmbientColor);

		/****************** SetDiffuseColor ******************/
		/**** md5 signature: 5d1708707ef429ff87f51d6f5e8102fa ****/
		%feature("compactdefaultargs") SetDiffuseColor;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDiffuseColor: Quantity_HArray1OfColor

Returns
-------
None
") SetDiffuseColor;
		void SetDiffuseColor(const opencascade::handle<Quantity_HArray1OfColor> & aDiffuseColor);

		/****************** SetEmissiveColor ******************/
		/**** md5 signature: c19b5023da6c67750532dedebe793ee7 ****/
		%feature("compactdefaultargs") SetEmissiveColor;
		%feature("autodoc", "No available documentation.

Parameters
----------
aEmissiveColor: Quantity_HArray1OfColor

Returns
-------
None
") SetEmissiveColor;
		void SetEmissiveColor(const opencascade::handle<Quantity_HArray1OfColor> & aEmissiveColor);

		/****************** SetShininess ******************/
		/**** md5 signature: 200abe81afb34ecb5c92f7b6e77f41ae ****/
		%feature("compactdefaultargs") SetShininess;
		%feature("autodoc", "No available documentation.

Parameters
----------
aShininess: TColStd_HArray1OfReal

Returns
-------
None
") SetShininess;
		void SetShininess(const opencascade::handle<TColStd_HArray1OfReal> & aShininess);

		/****************** SetSpecularColor ******************/
		/**** md5 signature: 81954339a4ca4e01a5727990f4a2f100 ****/
		%feature("compactdefaultargs") SetSpecularColor;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSpecularColor: Quantity_HArray1OfColor

Returns
-------
None
") SetSpecularColor;
		void SetSpecularColor(const opencascade::handle<Quantity_HArray1OfColor> & aSpecularColor);

		/****************** SetTransparency ******************/
		/**** md5 signature: 683fbea2011164a4a3ced587e6cccdfa ****/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "No available documentation.

Parameters
----------
aTransparency: TColStd_HArray1OfReal

Returns
-------
None
") SetTransparency;
		void SetTransparency(const opencascade::handle<TColStd_HArray1OfReal> & aTransparency);

		/****************** Shininess ******************/
		/**** md5 signature: 670f89ce7f4a780dd0f753074b8eb31f ****/
		%feature("compactdefaultargs") Shininess;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") Shininess;
		opencascade::handle<TColStd_HArray1OfReal> Shininess();

		/****************** SpecularColor ******************/
		/**** md5 signature: fc7935d41d9d6c7d322d60ccf72421a2 ****/
		%feature("compactdefaultargs") SpecularColor;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Quantity_HArray1OfColor>
") SpecularColor;
		opencascade::handle<Quantity_HArray1OfColor> SpecularColor();

		/****************** Transparency ******************/
		/**** md5 signature: 1191c5d42e1446bee4bdcc4fa69c7767 ****/
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") Transparency;
		opencascade::handle<TColStd_HArray1OfReal> Transparency();

};


%make_alias(Vrml_Material)

%extend Vrml_Material {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Vrml_MaterialBinding *
*****************************/
class Vrml_MaterialBinding {
	public:
		/****************** Vrml_MaterialBinding ******************/
		/**** md5 signature: 73a64930009b755119c085a6b4fe8bef ****/
		%feature("compactdefaultargs") Vrml_MaterialBinding;
		%feature("autodoc", "No available documentation.

Parameters
----------
aValue: Vrml_MaterialBindingAndNormalBinding

Returns
-------
None
") Vrml_MaterialBinding;
		 Vrml_MaterialBinding(const Vrml_MaterialBindingAndNormalBinding aValue);

		/****************** Vrml_MaterialBinding ******************/
		/**** md5 signature: c38a1cee5f610fa02fe3b8a01389e2d8 ****/
		%feature("compactdefaultargs") Vrml_MaterialBinding;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_MaterialBinding;
		 Vrml_MaterialBinding();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** SetValue ******************/
		/**** md5 signature: 9a4a4ae4644775e0ec704e6ef977a484 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
aValue: Vrml_MaterialBindingAndNormalBinding

Returns
-------
None
") SetValue;
		void SetValue(const Vrml_MaterialBindingAndNormalBinding aValue);

		/****************** Value ******************/
		/**** md5 signature: f97d6d2149b81b42de43121fa47dc7ec ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
Vrml_MaterialBindingAndNormalBinding
") Value;
		Vrml_MaterialBindingAndNormalBinding Value();

};


%extend Vrml_MaterialBinding {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Vrml_MatrixTransform *
*****************************/
class Vrml_MatrixTransform {
	public:
		/****************** Vrml_MatrixTransform ******************/
		/**** md5 signature: d62bdefabc38c0495ef7e9b0b8b13298 ****/
		%feature("compactdefaultargs") Vrml_MatrixTransform;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_MatrixTransform;
		 Vrml_MatrixTransform();

		/****************** Vrml_MatrixTransform ******************/
		/**** md5 signature: 4d740a8a60a2a9a231ed7ca956114fc8 ****/
		%feature("compactdefaultargs") Vrml_MatrixTransform;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMatrix: gp_Trsf

Returns
-------
None
") Vrml_MatrixTransform;
		 Vrml_MatrixTransform(const gp_Trsf & aMatrix);

		/****************** Matrix ******************/
		/**** md5 signature: ba31cb30d629721c047b11426f2d1516 ****/
		%feature("compactdefaultargs") Matrix;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Trsf
") Matrix;
		gp_Trsf Matrix();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** SetMatrix ******************/
		/**** md5 signature: f79b6bacc75e1dffe6f1d2919243ae9b ****/
		%feature("compactdefaultargs") SetMatrix;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMatrix: gp_Trsf

Returns
-------
None
") SetMatrix;
		void SetMatrix(const gp_Trsf & aMatrix);

};


%extend Vrml_MatrixTransform {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Vrml_Normal *
********************/
class Vrml_Normal : public Standard_Transient {
	public:
		/****************** Vrml_Normal ******************/
		/**** md5 signature: 3f5862dc13acc90de932cc8cf7777414 ****/
		%feature("compactdefaultargs") Vrml_Normal;
		%feature("autodoc", "No available documentation.

Parameters
----------
aVector: TColgp_HArray1OfVec

Returns
-------
None
") Vrml_Normal;
		 Vrml_Normal(const opencascade::handle<TColgp_HArray1OfVec> & aVector);

		/****************** Vrml_Normal ******************/
		/**** md5 signature: aa55807a51549a727bc12f4475aa0b0d ****/
		%feature("compactdefaultargs") Vrml_Normal;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_Normal;
		 Vrml_Normal();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** SetVector ******************/
		/**** md5 signature: b29dd66700a7c683cf81610080b02141 ****/
		%feature("compactdefaultargs") SetVector;
		%feature("autodoc", "No available documentation.

Parameters
----------
aVector: TColgp_HArray1OfVec

Returns
-------
None
") SetVector;
		void SetVector(const opencascade::handle<TColgp_HArray1OfVec> & aVector);

		/****************** Vector ******************/
		/**** md5 signature: 51abe9f806fea3ca3bb9895ced3da977 ****/
		%feature("compactdefaultargs") Vector;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColgp_HArray1OfVec>
") Vector;
		opencascade::handle<TColgp_HArray1OfVec> Vector();

};


%make_alias(Vrml_Normal)

%extend Vrml_Normal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Vrml_NormalBinding *
***************************/
class Vrml_NormalBinding {
	public:
		/****************** Vrml_NormalBinding ******************/
		/**** md5 signature: 9312ad5ebc4690d0962f17b398bec754 ****/
		%feature("compactdefaultargs") Vrml_NormalBinding;
		%feature("autodoc", "No available documentation.

Parameters
----------
aValue: Vrml_MaterialBindingAndNormalBinding

Returns
-------
None
") Vrml_NormalBinding;
		 Vrml_NormalBinding(const Vrml_MaterialBindingAndNormalBinding aValue);

		/****************** Vrml_NormalBinding ******************/
		/**** md5 signature: 38167211d67630d3e2b31fe988d84664 ****/
		%feature("compactdefaultargs") Vrml_NormalBinding;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_NormalBinding;
		 Vrml_NormalBinding();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** SetValue ******************/
		/**** md5 signature: 9a4a4ae4644775e0ec704e6ef977a484 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
aValue: Vrml_MaterialBindingAndNormalBinding

Returns
-------
None
") SetValue;
		void SetValue(const Vrml_MaterialBindingAndNormalBinding aValue);

		/****************** Value ******************/
		/**** md5 signature: f97d6d2149b81b42de43121fa47dc7ec ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
Vrml_MaterialBindingAndNormalBinding
") Value;
		Vrml_MaterialBindingAndNormalBinding Value();

};


%extend Vrml_NormalBinding {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Vrml_OrthographicCamera *
********************************/
class Vrml_OrthographicCamera {
	public:
		/****************** Vrml_OrthographicCamera ******************/
		/**** md5 signature: f50c0af49a1cdb2ebd71fa92b053d29d ****/
		%feature("compactdefaultargs") Vrml_OrthographicCamera;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_OrthographicCamera;
		 Vrml_OrthographicCamera();

		/****************** Vrml_OrthographicCamera ******************/
		/**** md5 signature: 0eef0f2c8752b223d1c67b674d8634de ****/
		%feature("compactdefaultargs") Vrml_OrthographicCamera;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPosition: gp_Vec
aOrientation: Vrml_SFRotation
aFocalDistance: float
aHeight: float

Returns
-------
None
") Vrml_OrthographicCamera;
		 Vrml_OrthographicCamera(const gp_Vec & aPosition, const Vrml_SFRotation & aOrientation, const Standard_Real aFocalDistance, const Standard_Real aHeight);

		/****************** FocalDistance ******************/
		/**** md5 signature: 7e55a83620d991c74488a9052052d6e7 ****/
		%feature("compactdefaultargs") FocalDistance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FocalDistance;
		Standard_Real FocalDistance();

		/****************** Height ******************/
		/**** md5 signature: b7486e9db42a6b5d4ef64408e52d8a4b ****/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Height;
		Standard_Real Height();

		/****************** Orientation ******************/
		/**** md5 signature: add97f23d9ae84534aa6ad8eda6b7515 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
Vrml_SFRotation
") Orientation;
		Vrml_SFRotation Orientation();

		/****************** Position ******************/
		/**** md5 signature: a90f95f065fb341b64623e06733a2197 ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") Position;
		gp_Vec Position();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** SetFocalDistance ******************/
		/**** md5 signature: a4382c9d94c6cdb3a408a0da734eb053 ****/
		%feature("compactdefaultargs") SetFocalDistance;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFocalDistance: float

Returns
-------
None
") SetFocalDistance;
		void SetFocalDistance(const Standard_Real aFocalDistance);

		/****************** SetHeight ******************/
		/**** md5 signature: b595945ce652624ed7910bc5ffdf66ae ****/
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "No available documentation.

Parameters
----------
aHeight: float

Returns
-------
None
") SetHeight;
		void SetHeight(const Standard_Real aHeight);

		/****************** SetOrientation ******************/
		/**** md5 signature: d695010f9be74c1befe149ca361b0799 ****/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aOrientation: Vrml_SFRotation

Returns
-------
None
") SetOrientation;
		void SetOrientation(const Vrml_SFRotation & aOrientation);

		/****************** SetPosition ******************/
		/**** md5 signature: b826dc12ed791ae88239dec84aa8de17 ****/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPosition: gp_Vec

Returns
-------
None
") SetPosition;
		void SetPosition(const gp_Vec & aPosition);

};


%extend Vrml_OrthographicCamera {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Vrml_PerspectiveCamera *
*******************************/
class Vrml_PerspectiveCamera {
	public:
		/****************** Vrml_PerspectiveCamera ******************/
		/**** md5 signature: 6716a15bdd33457c41ccdfdf7b679968 ****/
		%feature("compactdefaultargs") Vrml_PerspectiveCamera;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_PerspectiveCamera;
		 Vrml_PerspectiveCamera();

		/****************** Vrml_PerspectiveCamera ******************/
		/**** md5 signature: 482062ecd5554d4b2fe392b08b46eace ****/
		%feature("compactdefaultargs") Vrml_PerspectiveCamera;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPosition: gp_Vec
aOrientation: Vrml_SFRotation
aFocalDistance: float
aHeightAngle: float

Returns
-------
None
") Vrml_PerspectiveCamera;
		 Vrml_PerspectiveCamera(const gp_Vec & aPosition, const Vrml_SFRotation & aOrientation, const Standard_Real aFocalDistance, const Standard_Real aHeightAngle);

		/****************** Angle ******************/
		/**** md5 signature: dce50192c350c43b54f2e88e94e5372a ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Angle;
		Standard_Real Angle();

		/****************** FocalDistance ******************/
		/**** md5 signature: 7e55a83620d991c74488a9052052d6e7 ****/
		%feature("compactdefaultargs") FocalDistance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FocalDistance;
		Standard_Real FocalDistance();

		/****************** Orientation ******************/
		/**** md5 signature: add97f23d9ae84534aa6ad8eda6b7515 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
Vrml_SFRotation
") Orientation;
		Vrml_SFRotation Orientation();

		/****************** Position ******************/
		/**** md5 signature: a90f95f065fb341b64623e06733a2197 ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") Position;
		gp_Vec Position();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** SetAngle ******************/
		/**** md5 signature: bb3d72a5f4b071f4f97fb610aca9900b ****/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "No available documentation.

Parameters
----------
aHeightAngle: float

Returns
-------
None
") SetAngle;
		void SetAngle(const Standard_Real aHeightAngle);

		/****************** SetFocalDistance ******************/
		/**** md5 signature: a4382c9d94c6cdb3a408a0da734eb053 ****/
		%feature("compactdefaultargs") SetFocalDistance;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFocalDistance: float

Returns
-------
None
") SetFocalDistance;
		void SetFocalDistance(const Standard_Real aFocalDistance);

		/****************** SetOrientation ******************/
		/**** md5 signature: d695010f9be74c1befe149ca361b0799 ****/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aOrientation: Vrml_SFRotation

Returns
-------
None
") SetOrientation;
		void SetOrientation(const Vrml_SFRotation & aOrientation);

		/****************** SetPosition ******************/
		/**** md5 signature: b826dc12ed791ae88239dec84aa8de17 ****/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPosition: gp_Vec

Returns
-------
None
") SetPosition;
		void SetPosition(const gp_Vec & aPosition);

};


%extend Vrml_PerspectiveCamera {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Vrml_PointLight *
************************/
class Vrml_PointLight {
	public:
		/****************** Vrml_PointLight ******************/
		/**** md5 signature: 10210e4037649d9f1789b4c6500ff542 ****/
		%feature("compactdefaultargs") Vrml_PointLight;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_PointLight;
		 Vrml_PointLight();

		/****************** Vrml_PointLight ******************/
		/**** md5 signature: d9fc0917aa01d79b223892ffc2e6bee9 ****/
		%feature("compactdefaultargs") Vrml_PointLight;
		%feature("autodoc", "No available documentation.

Parameters
----------
aOnOff: bool
aIntensity: float
aColor: Quantity_Color
aLocation: gp_Vec

Returns
-------
None
") Vrml_PointLight;
		 Vrml_PointLight(const Standard_Boolean aOnOff, const Standard_Real aIntensity, const Quantity_Color & aColor, const gp_Vec & aLocation);

		/****************** Color ******************/
		/**** md5 signature: b37a2e584a895a08fcf8ead60940b246 ****/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "No available documentation.

Returns
-------
Quantity_Color
") Color;
		Quantity_Color Color();

		/****************** Intensity ******************/
		/**** md5 signature: ce9240a693f5bdfdaa91a711de325222 ****/
		%feature("compactdefaultargs") Intensity;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Intensity;
		Standard_Real Intensity();

		/****************** Location ******************/
		/**** md5 signature: 0e5541000faade44ea734f501de7a6cf ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") Location;
		gp_Vec Location();

		/****************** OnOff ******************/
		/**** md5 signature: 1623cdf1315a616b653a683621672f41 ****/
		%feature("compactdefaultargs") OnOff;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") OnOff;
		Standard_Boolean OnOff();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** SetColor ******************/
		/**** md5 signature: 5aebf70a123538e7dff670112c56db0d ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "No available documentation.

Parameters
----------
aColor: Quantity_Color

Returns
-------
None
") SetColor;
		void SetColor(const Quantity_Color & aColor);

		/****************** SetIntensity ******************/
		/**** md5 signature: d83199c26d505783e2f37c8e7ca17011 ****/
		%feature("compactdefaultargs") SetIntensity;
		%feature("autodoc", "No available documentation.

Parameters
----------
aIntensity: float

Returns
-------
None
") SetIntensity;
		void SetIntensity(const Standard_Real aIntensity);

		/****************** SetLocation ******************/
		/**** md5 signature: dd6c082eff758bae985f720fd18c210c ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aLocation: gp_Vec

Returns
-------
None
") SetLocation;
		void SetLocation(const gp_Vec & aLocation);

		/****************** SetOnOff ******************/
		/**** md5 signature: ec2f3be555932b38580e5b4a2d50b4c2 ****/
		%feature("compactdefaultargs") SetOnOff;
		%feature("autodoc", "No available documentation.

Parameters
----------
aOnOff: bool

Returns
-------
None
") SetOnOff;
		void SetOnOff(const Standard_Boolean aOnOff);

};


%extend Vrml_PointLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Vrml_PointSet *
**********************/
class Vrml_PointSet {
	public:
		/****************** Vrml_PointSet ******************/
		/**** md5 signature: b1ecc67635ef11022d23ae77aae9f60b ****/
		%feature("compactdefaultargs") Vrml_PointSet;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStartIndex: int,optional
	default value is 0
aNumPoints: int,optional
	default value is -1

Returns
-------
None
") Vrml_PointSet;
		 Vrml_PointSet(const Standard_Integer aStartIndex = 0, const Standard_Integer aNumPoints = -1);

		/****************** NumPoints ******************/
		/**** md5 signature: 6a99c3bbb22d311fc5d1be9c52821c05 ****/
		%feature("compactdefaultargs") NumPoints;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NumPoints;
		Standard_Integer NumPoints();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** SetNumPoints ******************/
		/**** md5 signature: 2c8c0cd8de922cf96b80a152f2efbd3b ****/
		%feature("compactdefaultargs") SetNumPoints;
		%feature("autodoc", "No available documentation.

Parameters
----------
aNumPoints: int

Returns
-------
None
") SetNumPoints;
		void SetNumPoints(const Standard_Integer aNumPoints);

		/****************** SetStartIndex ******************/
		/**** md5 signature: c53e6b0e6b8aa2b31620a6556ed15927 ****/
		%feature("compactdefaultargs") SetStartIndex;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStartIndex: int

Returns
-------
None
") SetStartIndex;
		void SetStartIndex(const Standard_Integer aStartIndex);

		/****************** StartIndex ******************/
		/**** md5 signature: 667fbc1e143954a2a4a0b4adebda9d89 ****/
		%feature("compactdefaultargs") StartIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") StartIndex;
		Standard_Integer StartIndex();

};


%extend Vrml_PointSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Vrml_Rotation *
**********************/
class Vrml_Rotation {
	public:
		/****************** Vrml_Rotation ******************/
		/**** md5 signature: 722362ae2aa1198d1f32f347404a4d68 ****/
		%feature("compactdefaultargs") Vrml_Rotation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_Rotation;
		 Vrml_Rotation();

		/****************** Vrml_Rotation ******************/
		/**** md5 signature: 6358665aef7ca1c52898662442da9787 ****/
		%feature("compactdefaultargs") Vrml_Rotation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRotation: Vrml_SFRotation

Returns
-------
None
") Vrml_Rotation;
		 Vrml_Rotation(const Vrml_SFRotation & aRotation);


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** Rotation ******************/
		/**** md5 signature: df13dcf1c8ca3c02d862abf4780b0be5 ****/
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "No available documentation.

Returns
-------
Vrml_SFRotation
") Rotation;
		Vrml_SFRotation Rotation();

		/****************** SetRotation ******************/
		/**** md5 signature: fcf8c48252e7d25114bede3ddb89b7f0 ****/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRotation: Vrml_SFRotation

Returns
-------
None
") SetRotation;
		void SetRotation(const Vrml_SFRotation & aRotation);

};


%extend Vrml_Rotation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Vrml_SFImage *
*********************/
class Vrml_SFImage : public Standard_Transient {
	public:
		/****************** Vrml_SFImage ******************/
		/**** md5 signature: b97ca3fe0c250ffa13e698c509dcb39c ****/
		%feature("compactdefaultargs") Vrml_SFImage;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_SFImage;
		 Vrml_SFImage();

		/****************** Vrml_SFImage ******************/
		/**** md5 signature: 0702c8e46b9ec4bef53bd20eb164b87f ****/
		%feature("compactdefaultargs") Vrml_SFImage;
		%feature("autodoc", "No available documentation.

Parameters
----------
aWidth: int
aHeight: int
aNumber: Vrml_SFImageNumber
anArray: TColStd_HArray1OfInteger

Returns
-------
None
") Vrml_SFImage;
		 Vrml_SFImage(const Standard_Integer aWidth, const Standard_Integer aHeight, const Vrml_SFImageNumber aNumber, const opencascade::handle<TColStd_HArray1OfInteger> & anArray);

		/****************** Array ******************/
		/**** md5 signature: f8f98163d33e1e4ab36bb87ca7ecb26a ****/
		%feature("compactdefaultargs") Array;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfInteger>
") Array;
		opencascade::handle<TColStd_HArray1OfInteger> Array();

		/****************** ArrayFlag ******************/
		/**** md5 signature: 64affbc48ec5d5d5fe3d780dccdbb2b5 ****/
		%feature("compactdefaultargs") ArrayFlag;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") ArrayFlag;
		Standard_Boolean ArrayFlag();

		/****************** Height ******************/
		/**** md5 signature: d981fba03da5b96e3da97e6c8c7c57ba ****/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Height;
		Standard_Integer Height();

		/****************** Number ******************/
		/**** md5 signature: d32ee14e26e709ba98a99564ce000438 ****/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "No available documentation.

Returns
-------
Vrml_SFImageNumber
") Number;
		Vrml_SFImageNumber Number();

		/****************** SetArray ******************/
		/**** md5 signature: 02cb96990841b569eec46de71fe173a1 ****/
		%feature("compactdefaultargs") SetArray;
		%feature("autodoc", "No available documentation.

Parameters
----------
anArray: TColStd_HArray1OfInteger

Returns
-------
None
") SetArray;
		void SetArray(const opencascade::handle<TColStd_HArray1OfInteger> & anArray);

		/****************** SetHeight ******************/
		/**** md5 signature: e57769657b31956e9fa2f111ffec52c2 ****/
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "No available documentation.

Parameters
----------
aHeight: int

Returns
-------
None
") SetHeight;
		void SetHeight(const Standard_Integer aHeight);

		/****************** SetNumber ******************/
		/**** md5 signature: dd26cc02b3e32d3b7f733213164e6bae ****/
		%feature("compactdefaultargs") SetNumber;
		%feature("autodoc", "No available documentation.

Parameters
----------
aNumber: Vrml_SFImageNumber

Returns
-------
None
") SetNumber;
		void SetNumber(const Vrml_SFImageNumber aNumber);

		/****************** SetWidth ******************/
		/**** md5 signature: 00dac6875966e7ac19b35ac220f862d1 ****/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "No available documentation.

Parameters
----------
aWidth: int

Returns
-------
None
") SetWidth;
		void SetWidth(const Standard_Integer aWidth);

		/****************** Width ******************/
		/**** md5 signature: fcf113de9ea8c617e9091d4b9094173a ****/
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Width;
		Standard_Integer Width();

};


%make_alias(Vrml_SFImage)

%extend Vrml_SFImage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Vrml_SFRotation *
************************/
class Vrml_SFRotation {
	public:
		/****************** Vrml_SFRotation ******************/
		/**** md5 signature: 4a2d9df949bd8fedbfabdb56f80425a7 ****/
		%feature("compactdefaultargs") Vrml_SFRotation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_SFRotation;
		 Vrml_SFRotation();

		/****************** Vrml_SFRotation ******************/
		/**** md5 signature: 9ddee70e1d0bb895bf55f1e2eff1a50f ****/
		%feature("compactdefaultargs") Vrml_SFRotation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRotationX: float
aRotationY: float
aRotationZ: float
anAngle: float

Returns
-------
None
") Vrml_SFRotation;
		 Vrml_SFRotation(const Standard_Real aRotationX, const Standard_Real aRotationY, const Standard_Real aRotationZ, const Standard_Real anAngle);

		/****************** Angle ******************/
		/**** md5 signature: dce50192c350c43b54f2e88e94e5372a ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Angle;
		Standard_Real Angle();

		/****************** RotationX ******************/
		/**** md5 signature: ab3c87cfae8d94d118359d98c76ab4fb ****/
		%feature("compactdefaultargs") RotationX;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") RotationX;
		Standard_Real RotationX();

		/****************** RotationY ******************/
		/**** md5 signature: e95edf0f1282423c93196c1ab9e0cb0b ****/
		%feature("compactdefaultargs") RotationY;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") RotationY;
		Standard_Real RotationY();

		/****************** RotationZ ******************/
		/**** md5 signature: 3d34ff1a37887f30933f4ae244b7724b ****/
		%feature("compactdefaultargs") RotationZ;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") RotationZ;
		Standard_Real RotationZ();

		/****************** SetAngle ******************/
		/**** md5 signature: eb58abb1f2735255b52070d752bb180a ****/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "No available documentation.

Parameters
----------
anAngle: float

Returns
-------
None
") SetAngle;
		void SetAngle(const Standard_Real anAngle);

		/****************** SetRotationX ******************/
		/**** md5 signature: b67d7d27600d8e18cbe548303aeb91a0 ****/
		%feature("compactdefaultargs") SetRotationX;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRotationX: float

Returns
-------
None
") SetRotationX;
		void SetRotationX(const Standard_Real aRotationX);

		/****************** SetRotationY ******************/
		/**** md5 signature: 2ef4d3f1bd3d28751351d4dc516c1db9 ****/
		%feature("compactdefaultargs") SetRotationY;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRotationY: float

Returns
-------
None
") SetRotationY;
		void SetRotationY(const Standard_Real aRotationY);

		/****************** SetRotationZ ******************/
		/**** md5 signature: c60b9fa6b2dc21e7705fbf1d8f3f6886 ****/
		%feature("compactdefaultargs") SetRotationZ;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRotationZ: float

Returns
-------
None
") SetRotationZ;
		void SetRotationZ(const Standard_Real aRotationZ);

};


%extend Vrml_SFRotation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class Vrml_Scale *
*******************/
class Vrml_Scale {
	public:
		/****************** Vrml_Scale ******************/
		/**** md5 signature: d9e418559e521acf7162a133f47b05ec ****/
		%feature("compactdefaultargs") Vrml_Scale;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_Scale;
		 Vrml_Scale();

		/****************** Vrml_Scale ******************/
		/**** md5 signature: 222440c2122d309ad1f3569ba98fb402 ****/
		%feature("compactdefaultargs") Vrml_Scale;
		%feature("autodoc", "No available documentation.

Parameters
----------
aScaleFactor: gp_Vec

Returns
-------
None
") Vrml_Scale;
		 Vrml_Scale(const gp_Vec & aScaleFactor);


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** ScaleFactor ******************/
		/**** md5 signature: ddee81c1cf7d4715bc12bd5fcf83ddcc ****/
		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") ScaleFactor;
		gp_Vec ScaleFactor();

		/****************** SetScaleFactor ******************/
		/**** md5 signature: 89338895c96f60f9d732bd6b35f3e81e ****/
		%feature("compactdefaultargs") SetScaleFactor;
		%feature("autodoc", "No available documentation.

Parameters
----------
aScaleFactor: gp_Vec

Returns
-------
None
") SetScaleFactor;
		void SetScaleFactor(const gp_Vec & aScaleFactor);

};


%extend Vrml_Scale {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Vrml_Separator *
***********************/
class Vrml_Separator {
	public:
		/****************** Vrml_Separator ******************/
		/**** md5 signature: ba0772caacb9071d6022d3cf7bf2d6de ****/
		%feature("compactdefaultargs") Vrml_Separator;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRenderCulling: Vrml_SeparatorRenderCulling

Returns
-------
None
") Vrml_Separator;
		 Vrml_Separator(const Vrml_SeparatorRenderCulling aRenderCulling);

		/****************** Vrml_Separator ******************/
		/**** md5 signature: 70f77736b34e0266c9ad206ee4e45233 ****/
		%feature("compactdefaultargs") Vrml_Separator;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_Separator;
		 Vrml_Separator();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** RenderCulling ******************/
		/**** md5 signature: 9c2b5b6ae8ed9c9a82906bd6ee4c0f5c ****/
		%feature("compactdefaultargs") RenderCulling;
		%feature("autodoc", "No available documentation.

Returns
-------
Vrml_SeparatorRenderCulling
") RenderCulling;
		Vrml_SeparatorRenderCulling RenderCulling();

		/****************** SetRenderCulling ******************/
		/**** md5 signature: feb33785b8752bddc4d3dd0f296fb0b2 ****/
		%feature("compactdefaultargs") SetRenderCulling;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRenderCulling: Vrml_SeparatorRenderCulling

Returns
-------
None
") SetRenderCulling;
		void SetRenderCulling(const Vrml_SeparatorRenderCulling aRenderCulling);

};


%extend Vrml_Separator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Vrml_ShapeHints *
************************/
class Vrml_ShapeHints {
	public:
		/****************** Vrml_ShapeHints ******************/
		/**** md5 signature: 0ba1fbebda048525b38135ac36f3ee30 ****/
		%feature("compactdefaultargs") Vrml_ShapeHints;
		%feature("autodoc", "No available documentation.

Parameters
----------
aVertexOrdering: Vrml_VertexOrdering,optional
	default value is Vrml_UNKNOWN_ORDERING
aShapeType: Vrml_ShapeType,optional
	default value is Vrml_UNKNOWN_SHAPE_TYPE
aFaceType: Vrml_FaceType,optional
	default value is Vrml_CONVEX
aAngle: float,optional
	default value is 0.5

Returns
-------
None
") Vrml_ShapeHints;
		 Vrml_ShapeHints(const Vrml_VertexOrdering aVertexOrdering = Vrml_UNKNOWN_ORDERING, const Vrml_ShapeType aShapeType = Vrml_UNKNOWN_SHAPE_TYPE, const Vrml_FaceType aFaceType = Vrml_CONVEX, const Standard_Real aAngle = 0.5);

		/****************** Angle ******************/
		/**** md5 signature: dce50192c350c43b54f2e88e94e5372a ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Angle;
		Standard_Real Angle();

		/****************** FaceType ******************/
		/**** md5 signature: 797e15fa36f5374104546291099739af ****/
		%feature("compactdefaultargs") FaceType;
		%feature("autodoc", "No available documentation.

Returns
-------
Vrml_FaceType
") FaceType;
		Vrml_FaceType FaceType();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** SetAngle ******************/
		/**** md5 signature: bae7a4d675d363cefe680523e72e869e ****/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAngle: float

Returns
-------
None
") SetAngle;
		void SetAngle(const Standard_Real aAngle);

		/****************** SetFaceType ******************/
		/**** md5 signature: 86e3947cfe6357aa6884b830b05ce939 ****/
		%feature("compactdefaultargs") SetFaceType;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFaceType: Vrml_FaceType

Returns
-------
None
") SetFaceType;
		void SetFaceType(const Vrml_FaceType aFaceType);

		/****************** SetShapeType ******************/
		/**** md5 signature: 8ad07cca0c48ecda497d0f812b4dd1e1 ****/
		%feature("compactdefaultargs") SetShapeType;
		%feature("autodoc", "No available documentation.

Parameters
----------
aShapeType: Vrml_ShapeType

Returns
-------
None
") SetShapeType;
		void SetShapeType(const Vrml_ShapeType aShapeType);

		/****************** SetVertexOrdering ******************/
		/**** md5 signature: f57cc0ed6b575cec68ba6f9b1c42fdba ****/
		%feature("compactdefaultargs") SetVertexOrdering;
		%feature("autodoc", "No available documentation.

Parameters
----------
aVertexOrdering: Vrml_VertexOrdering

Returns
-------
None
") SetVertexOrdering;
		void SetVertexOrdering(const Vrml_VertexOrdering aVertexOrdering);

		/****************** ShapeType ******************/
		/**** md5 signature: 28c1eef43817c6b5e5bd7ff416f1cb26 ****/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "No available documentation.

Returns
-------
Vrml_ShapeType
") ShapeType;
		Vrml_ShapeType ShapeType();

		/****************** VertexOrdering ******************/
		/**** md5 signature: 764667aa72a8973be6d2279ca2edc992 ****/
		%feature("compactdefaultargs") VertexOrdering;
		%feature("autodoc", "No available documentation.

Returns
-------
Vrml_VertexOrdering
") VertexOrdering;
		Vrml_VertexOrdering VertexOrdering();

};


%extend Vrml_ShapeHints {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Vrml_Sphere *
********************/
class Vrml_Sphere {
	public:
		/****************** Vrml_Sphere ******************/
		/**** md5 signature: 9b33b06167acebab2f474ff780a2c50f ****/
		%feature("compactdefaultargs") Vrml_Sphere;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRadius: float,optional
	default value is 1

Returns
-------
None
") Vrml_Sphere;
		 Vrml_Sphere(const Standard_Real aRadius = 1);


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** Radius ******************/
		/**** md5 signature: 506a8dc1140a54bd4146c24bb5357fbf ****/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** SetRadius ******************/
		/**** md5 signature: 75bdaaca53fe512f9758601eef8521b0 ****/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRadius: float

Returns
-------
None
") SetRadius;
		void SetRadius(const Standard_Real aRadius);

};


%extend Vrml_Sphere {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Vrml_SpotLight *
***********************/
class Vrml_SpotLight {
	public:
		/****************** Vrml_SpotLight ******************/
		/**** md5 signature: e8b1bb33090c31894344be04b7effe95 ****/
		%feature("compactdefaultargs") Vrml_SpotLight;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_SpotLight;
		 Vrml_SpotLight();

		/****************** Vrml_SpotLight ******************/
		/**** md5 signature: 9f911d236ac7163ece0570ae2bcc27a7 ****/
		%feature("compactdefaultargs") Vrml_SpotLight;
		%feature("autodoc", "No available documentation.

Parameters
----------
aOnOff: bool
aIntensity: float
aColor: Quantity_Color
aLocation: gp_Vec
aDirection: gp_Vec
aDropOffRate: float
aCutOffAngle: float

Returns
-------
None
") Vrml_SpotLight;
		 Vrml_SpotLight(const Standard_Boolean aOnOff, const Standard_Real aIntensity, const Quantity_Color & aColor, const gp_Vec & aLocation, const gp_Vec & aDirection, const Standard_Real aDropOffRate, const Standard_Real aCutOffAngle);

		/****************** Color ******************/
		/**** md5 signature: b37a2e584a895a08fcf8ead60940b246 ****/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "No available documentation.

Returns
-------
Quantity_Color
") Color;
		Quantity_Color Color();

		/****************** CutOffAngle ******************/
		/**** md5 signature: eb49b3259be99acc4c3b002cf8fd78c9 ****/
		%feature("compactdefaultargs") CutOffAngle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") CutOffAngle;
		Standard_Real CutOffAngle();

		/****************** Direction ******************/
		/**** md5 signature: 36725d4d9370b25778d365a2d983c00e ****/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") Direction;
		gp_Vec Direction();

		/****************** DropOffRate ******************/
		/**** md5 signature: a290b21e8a614aa4453a2333c8d95fd3 ****/
		%feature("compactdefaultargs") DropOffRate;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") DropOffRate;
		Standard_Real DropOffRate();

		/****************** Intensity ******************/
		/**** md5 signature: ce9240a693f5bdfdaa91a711de325222 ****/
		%feature("compactdefaultargs") Intensity;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Intensity;
		Standard_Real Intensity();

		/****************** Location ******************/
		/**** md5 signature: 0e5541000faade44ea734f501de7a6cf ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") Location;
		gp_Vec Location();

		/****************** OnOff ******************/
		/**** md5 signature: 1623cdf1315a616b653a683621672f41 ****/
		%feature("compactdefaultargs") OnOff;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") OnOff;
		Standard_Boolean OnOff();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** SetColor ******************/
		/**** md5 signature: 5aebf70a123538e7dff670112c56db0d ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "No available documentation.

Parameters
----------
aColor: Quantity_Color

Returns
-------
None
") SetColor;
		void SetColor(const Quantity_Color & aColor);

		/****************** SetCutOffAngle ******************/
		/**** md5 signature: 55517e1e463db76181ad7e29484a7355 ****/
		%feature("compactdefaultargs") SetCutOffAngle;
		%feature("autodoc", "No available documentation.

Parameters
----------
aCutOffAngle: float

Returns
-------
None
") SetCutOffAngle;
		void SetCutOffAngle(const Standard_Real aCutOffAngle);

		/****************** SetDirection ******************/
		/**** md5 signature: 631fcce8229d14261aa80e6545acf64f ****/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDirection: gp_Vec

Returns
-------
None
") SetDirection;
		void SetDirection(const gp_Vec & aDirection);

		/****************** SetDropOffRate ******************/
		/**** md5 signature: f59d6646334001cd2b1eddbbacaab530 ****/
		%feature("compactdefaultargs") SetDropOffRate;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDropOffRate: float

Returns
-------
None
") SetDropOffRate;
		void SetDropOffRate(const Standard_Real aDropOffRate);

		/****************** SetIntensity ******************/
		/**** md5 signature: d83199c26d505783e2f37c8e7ca17011 ****/
		%feature("compactdefaultargs") SetIntensity;
		%feature("autodoc", "No available documentation.

Parameters
----------
aIntensity: float

Returns
-------
None
") SetIntensity;
		void SetIntensity(const Standard_Real aIntensity);

		/****************** SetLocation ******************/
		/**** md5 signature: dd6c082eff758bae985f720fd18c210c ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aLocation: gp_Vec

Returns
-------
None
") SetLocation;
		void SetLocation(const gp_Vec & aLocation);

		/****************** SetOnOff ******************/
		/**** md5 signature: 9021e1a0e25a098d2439898fa805b2e3 ****/
		%feature("compactdefaultargs") SetOnOff;
		%feature("autodoc", "No available documentation.

Parameters
----------
anOnOff: bool

Returns
-------
None
") SetOnOff;
		void SetOnOff(const Standard_Boolean anOnOff);

};


%extend Vrml_SpotLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Vrml_Switch *
********************/
class Vrml_Switch {
	public:
		/****************** Vrml_Switch ******************/
		/**** md5 signature: 8dcb8078f4da7693af8a1db487b62856 ****/
		%feature("compactdefaultargs") Vrml_Switch;
		%feature("autodoc", "No available documentation.

Parameters
----------
aWhichChild: int,optional
	default value is -1

Returns
-------
None
") Vrml_Switch;
		 Vrml_Switch(const Standard_Integer aWhichChild = -1);


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** SetWhichChild ******************/
		/**** md5 signature: 903116d3053cda016d7b4d8c736e11f8 ****/
		%feature("compactdefaultargs") SetWhichChild;
		%feature("autodoc", "No available documentation.

Parameters
----------
aWhichChild: int

Returns
-------
None
") SetWhichChild;
		void SetWhichChild(const Standard_Integer aWhichChild);

		/****************** WhichChild ******************/
		/**** md5 signature: 9cc7a1e5ef6d2fbc142d4b6ae3b47afd ****/
		%feature("compactdefaultargs") WhichChild;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") WhichChild;
		Standard_Integer WhichChild();

};


%extend Vrml_Switch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Vrml_Texture2 *
**********************/
class Vrml_Texture2 {
	public:
		/****************** Vrml_Texture2 ******************/
		/**** md5 signature: b88858ed9502d4d714d22762b8ffe5d7 ****/
		%feature("compactdefaultargs") Vrml_Texture2;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_Texture2;
		 Vrml_Texture2();

		/****************** Vrml_Texture2 ******************/
		/**** md5 signature: 74b3330be268cc0ed9008cc0c03d7303 ****/
		%feature("compactdefaultargs") Vrml_Texture2;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFilename: TCollection_AsciiString
aImage: Vrml_SFImage
aWrapS: Vrml_Texture2Wrap
aWrapT: Vrml_Texture2Wrap

Returns
-------
None
") Vrml_Texture2;
		 Vrml_Texture2(const TCollection_AsciiString & aFilename, const opencascade::handle<Vrml_SFImage> & aImage, const Vrml_Texture2Wrap aWrapS, const Vrml_Texture2Wrap aWrapT);

		/****************** Filename ******************/
		/**** md5 signature: 403f67c4638b8a808f68c91981c71440 ****/
		%feature("compactdefaultargs") Filename;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_AsciiString
") Filename;
		TCollection_AsciiString Filename();

		/****************** Image ******************/
		/**** md5 signature: 80d0c2423e6826002c17c316d53d0b4a ****/
		%feature("compactdefaultargs") Image;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Vrml_SFImage>
") Image;
		opencascade::handle<Vrml_SFImage> Image();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** SetFilename ******************/
		/**** md5 signature: 6a233cc8b98d909eb32820cdf5db7e12 ****/
		%feature("compactdefaultargs") SetFilename;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFilename: TCollection_AsciiString

Returns
-------
None
") SetFilename;
		void SetFilename(const TCollection_AsciiString & aFilename);

		/****************** SetImage ******************/
		/**** md5 signature: a9ae445e8b68c9036584f2fb4a7fd9f5 ****/
		%feature("compactdefaultargs") SetImage;
		%feature("autodoc", "No available documentation.

Parameters
----------
aImage: Vrml_SFImage

Returns
-------
None
") SetImage;
		void SetImage(const opencascade::handle<Vrml_SFImage> & aImage);

		/****************** SetWrapS ******************/
		/**** md5 signature: ce0ce8998f021ecb2825d745daee5287 ****/
		%feature("compactdefaultargs") SetWrapS;
		%feature("autodoc", "No available documentation.

Parameters
----------
aWrapS: Vrml_Texture2Wrap

Returns
-------
None
") SetWrapS;
		void SetWrapS(const Vrml_Texture2Wrap aWrapS);

		/****************** SetWrapT ******************/
		/**** md5 signature: be34905d7f08892853b0591d909845c7 ****/
		%feature("compactdefaultargs") SetWrapT;
		%feature("autodoc", "No available documentation.

Parameters
----------
aWrapT: Vrml_Texture2Wrap

Returns
-------
None
") SetWrapT;
		void SetWrapT(const Vrml_Texture2Wrap aWrapT);

		/****************** WrapS ******************/
		/**** md5 signature: 7241e89c90bfb8685862873b2c815c1a ****/
		%feature("compactdefaultargs") WrapS;
		%feature("autodoc", "No available documentation.

Returns
-------
Vrml_Texture2Wrap
") WrapS;
		Vrml_Texture2Wrap WrapS();

		/****************** WrapT ******************/
		/**** md5 signature: f6a520c171ef88399fccc3604e2082a3 ****/
		%feature("compactdefaultargs") WrapT;
		%feature("autodoc", "No available documentation.

Returns
-------
Vrml_Texture2Wrap
") WrapT;
		Vrml_Texture2Wrap WrapT();

};


%extend Vrml_Texture2 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Vrml_Texture2Transform *
*******************************/
class Vrml_Texture2Transform {
	public:
		/****************** Vrml_Texture2Transform ******************/
		/**** md5 signature: 1531e2e7d521a3b24bd3e7badd786618 ****/
		%feature("compactdefaultargs") Vrml_Texture2Transform;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_Texture2Transform;
		 Vrml_Texture2Transform();

		/****************** Vrml_Texture2Transform ******************/
		/**** md5 signature: 634167654fa4d1fb9ffb89b827d27d54 ****/
		%feature("compactdefaultargs") Vrml_Texture2Transform;
		%feature("autodoc", "No available documentation.

Parameters
----------
aTranslation: gp_Vec2d
aRotation: float
aScaleFactor: gp_Vec2d
aCenter: gp_Vec2d

Returns
-------
None
") Vrml_Texture2Transform;
		 Vrml_Texture2Transform(const gp_Vec2d & aTranslation, const Standard_Real aRotation, const gp_Vec2d & aScaleFactor, const gp_Vec2d & aCenter);

		/****************** Center ******************/
		/**** md5 signature: 254292cd89f895c357202578f32a5e7f ****/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Center;
		gp_Vec2d Center();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** Rotation ******************/
		/**** md5 signature: 88f76ec12684cd0cd3209460634d1bdf ****/
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Rotation;
		Standard_Real Rotation();

		/****************** ScaleFactor ******************/
		/**** md5 signature: 06b1407f24f2bc56b40ebf2462970ffb ****/
		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") ScaleFactor;
		gp_Vec2d ScaleFactor();

		/****************** SetCenter ******************/
		/**** md5 signature: 1293df907f77bfc212b3ba9a33ff36e7 ****/
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "No available documentation.

Parameters
----------
aCenter: gp_Vec2d

Returns
-------
None
") SetCenter;
		void SetCenter(const gp_Vec2d & aCenter);

		/****************** SetRotation ******************/
		/**** md5 signature: ece1c036e824881d5c56f056b4d6cd46 ****/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRotation: float

Returns
-------
None
") SetRotation;
		void SetRotation(const Standard_Real aRotation);

		/****************** SetScaleFactor ******************/
		/**** md5 signature: 8f2e685abe4915cee4e0f95d778cdd33 ****/
		%feature("compactdefaultargs") SetScaleFactor;
		%feature("autodoc", "No available documentation.

Parameters
----------
aScaleFactor: gp_Vec2d

Returns
-------
None
") SetScaleFactor;
		void SetScaleFactor(const gp_Vec2d & aScaleFactor);

		/****************** SetTranslation ******************/
		/**** md5 signature: 27ee36e7e39f15d2760e9aa9d20b02f6 ****/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aTranslation: gp_Vec2d

Returns
-------
None
") SetTranslation;
		void SetTranslation(const gp_Vec2d & aTranslation);

		/****************** Translation ******************/
		/**** md5 signature: 6d365b0aba4cd1d8134023b4cb40fa46 ****/
		%feature("compactdefaultargs") Translation;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Translation;
		gp_Vec2d Translation();

};


%extend Vrml_Texture2Transform {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Vrml_TextureCoordinate2 *
********************************/
class Vrml_TextureCoordinate2 : public Standard_Transient {
	public:
		/****************** Vrml_TextureCoordinate2 ******************/
		/**** md5 signature: dd3a1d00ff469b3b045c41add7955ca0 ****/
		%feature("compactdefaultargs") Vrml_TextureCoordinate2;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_TextureCoordinate2;
		 Vrml_TextureCoordinate2();

		/****************** Vrml_TextureCoordinate2 ******************/
		/**** md5 signature: ad23cc311cc4996ea622e9f7212fe542 ****/
		%feature("compactdefaultargs") Vrml_TextureCoordinate2;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPoint: TColgp_HArray1OfVec2d

Returns
-------
None
") Vrml_TextureCoordinate2;
		 Vrml_TextureCoordinate2(const opencascade::handle<TColgp_HArray1OfVec2d> & aPoint);

		/****************** Point ******************/
		/**** md5 signature: b912b8ee07a83e69d49ac6076c5d19e0 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColgp_HArray1OfVec2d>
") Point;
		opencascade::handle<TColgp_HArray1OfVec2d> Point();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** SetPoint ******************/
		/**** md5 signature: 576fe8b6b9484adc1a8a9d7148ed1d10 ****/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPoint: TColgp_HArray1OfVec2d

Returns
-------
None
") SetPoint;
		void SetPoint(const opencascade::handle<TColgp_HArray1OfVec2d> & aPoint);

};


%make_alias(Vrml_TextureCoordinate2)

%extend Vrml_TextureCoordinate2 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Vrml_Transform *
***********************/
class Vrml_Transform {
	public:
		/****************** Vrml_Transform ******************/
		/**** md5 signature: 162f4b001926c53db828af0f93ec726e ****/
		%feature("compactdefaultargs") Vrml_Transform;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_Transform;
		 Vrml_Transform();

		/****************** Vrml_Transform ******************/
		/**** md5 signature: 1958724dd030c21f3d5b26b056a42e29 ****/
		%feature("compactdefaultargs") Vrml_Transform;
		%feature("autodoc", "No available documentation.

Parameters
----------
aTranslation: gp_Vec
aRotation: Vrml_SFRotation
aScaleFactor: gp_Vec
aScaleOrientation: Vrml_SFRotation
aCenter: gp_Vec

Returns
-------
None
") Vrml_Transform;
		 Vrml_Transform(const gp_Vec & aTranslation, const Vrml_SFRotation & aRotation, const gp_Vec & aScaleFactor, const Vrml_SFRotation & aScaleOrientation, const gp_Vec & aCenter);

		/****************** Center ******************/
		/**** md5 signature: 61ea9e63ca1b0195aa3037fd3c59632f ****/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") Center;
		gp_Vec Center();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** Rotation ******************/
		/**** md5 signature: df13dcf1c8ca3c02d862abf4780b0be5 ****/
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "No available documentation.

Returns
-------
Vrml_SFRotation
") Rotation;
		Vrml_SFRotation Rotation();

		/****************** ScaleFactor ******************/
		/**** md5 signature: ddee81c1cf7d4715bc12bd5fcf83ddcc ****/
		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") ScaleFactor;
		gp_Vec ScaleFactor();

		/****************** ScaleOrientation ******************/
		/**** md5 signature: 458b4ae4df2a0ff913e67a873e40c728 ****/
		%feature("compactdefaultargs") ScaleOrientation;
		%feature("autodoc", "No available documentation.

Returns
-------
Vrml_SFRotation
") ScaleOrientation;
		Vrml_SFRotation ScaleOrientation();

		/****************** SetCenter ******************/
		/**** md5 signature: a703ddf7cd16de3b4903371c8cb8e217 ****/
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "No available documentation.

Parameters
----------
aCenter: gp_Vec

Returns
-------
None
") SetCenter;
		void SetCenter(const gp_Vec & aCenter);

		/****************** SetRotation ******************/
		/**** md5 signature: fcf8c48252e7d25114bede3ddb89b7f0 ****/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRotation: Vrml_SFRotation

Returns
-------
None
") SetRotation;
		void SetRotation(const Vrml_SFRotation & aRotation);

		/****************** SetScaleFactor ******************/
		/**** md5 signature: 89338895c96f60f9d732bd6b35f3e81e ****/
		%feature("compactdefaultargs") SetScaleFactor;
		%feature("autodoc", "No available documentation.

Parameters
----------
aScaleFactor: gp_Vec

Returns
-------
None
") SetScaleFactor;
		void SetScaleFactor(const gp_Vec & aScaleFactor);

		/****************** SetScaleOrientation ******************/
		/**** md5 signature: d5adf7f610887711c5812899faf36ad2 ****/
		%feature("compactdefaultargs") SetScaleOrientation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aScaleOrientation: Vrml_SFRotation

Returns
-------
None
") SetScaleOrientation;
		void SetScaleOrientation(const Vrml_SFRotation & aScaleOrientation);

		/****************** SetTranslation ******************/
		/**** md5 signature: 1646e68b1d3f51460ff79d25f8092903 ****/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aTranslation: gp_Vec

Returns
-------
None
") SetTranslation;
		void SetTranslation(const gp_Vec & aTranslation);

		/****************** Translation ******************/
		/**** md5 signature: 1b9eaca0408443cfce0acd48c9a13edd ****/
		%feature("compactdefaultargs") Translation;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") Translation;
		gp_Vec Translation();

};


%extend Vrml_Transform {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Vrml_TransformSeparator *
********************************/
class Vrml_TransformSeparator {
	public:
		/****************** Vrml_TransformSeparator ******************/
		/**** md5 signature: 6e328dc0e2f0dbdfa0c711c1c3924a6f ****/
		%feature("compactdefaultargs") Vrml_TransformSeparator;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_TransformSeparator;
		 Vrml_TransformSeparator();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
};


%extend Vrml_TransformSeparator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Vrml_Translation *
*************************/
class Vrml_Translation {
	public:
		/****************** Vrml_Translation ******************/
		/**** md5 signature: 74221cc6631cfbb95b9f9a31926178e4 ****/
		%feature("compactdefaultargs") Vrml_Translation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_Translation;
		 Vrml_Translation();

		/****************** Vrml_Translation ******************/
		/**** md5 signature: 8870281dcaecbf101c7d86facd00a589 ****/
		%feature("compactdefaultargs") Vrml_Translation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aTranslation: gp_Vec

Returns
-------
None
") Vrml_Translation;
		 Vrml_Translation(const gp_Vec & aTranslation);


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** SetTranslation ******************/
		/**** md5 signature: 1646e68b1d3f51460ff79d25f8092903 ****/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aTranslation: gp_Vec

Returns
-------
None
") SetTranslation;
		void SetTranslation(const gp_Vec & aTranslation);

		/****************** Translation ******************/
		/**** md5 signature: 1b9eaca0408443cfce0acd48c9a13edd ****/
		%feature("compactdefaultargs") Translation;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") Translation;
		gp_Vec Translation();

};


%extend Vrml_Translation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Vrml_WWWAnchor *
***********************/
class Vrml_WWWAnchor {
	public:
		/****************** Vrml_WWWAnchor ******************/
		/**** md5 signature: c462349c96d43cf7d5b75f58b59cd3ba ****/
		%feature("compactdefaultargs") Vrml_WWWAnchor;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_AsciiString,optional
	default value is ""
aDescription: TCollection_AsciiString,optional
	default value is ""
aMap: Vrml_WWWAnchorMap,optional
	default value is Vrml_MAP_NONE

Returns
-------
None
") Vrml_WWWAnchor;
		 Vrml_WWWAnchor(const TCollection_AsciiString & aName = "", const TCollection_AsciiString & aDescription = "", const Vrml_WWWAnchorMap aMap = Vrml_MAP_NONE);

		/****************** Description ******************/
		/**** md5 signature: b46267417d65ffb9a243344287317012 ****/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_AsciiString
") Description;
		TCollection_AsciiString Description();

		/****************** Map ******************/
		/**** md5 signature: 30615bb64cdcbc46359830ff7d42fab6 ****/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "No available documentation.

Returns
-------
Vrml_WWWAnchorMap
") Map;
		Vrml_WWWAnchorMap Map();

		/****************** Name ******************/
		/**** md5 signature: 4ede994349b8ea032efece942c57861d ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_AsciiString
") Name;
		TCollection_AsciiString Name();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** SetDescription ******************/
		/**** md5 signature: 24d19d040b0a10c936dfd6335381c7d8 ****/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDescription: TCollection_AsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const TCollection_AsciiString & aDescription);

		/****************** SetMap ******************/
		/**** md5 signature: a39b8d7582c6facd13d1ca3c9a1bc659 ****/
		%feature("compactdefaultargs") SetMap;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMap: Vrml_WWWAnchorMap

Returns
-------
None
") SetMap;
		void SetMap(const Vrml_WWWAnchorMap aMap);

		/****************** SetName ******************/
		/**** md5 signature: 3521bb701d54e60914d11a5ea23f03c3 ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_AsciiString

Returns
-------
None
") SetName;
		void SetName(const TCollection_AsciiString & aName);

};


%extend Vrml_WWWAnchor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Vrml_WWWInline *
***********************/
class Vrml_WWWInline {
	public:
		/****************** Vrml_WWWInline ******************/
		/**** md5 signature: dac06a08d14367a068fb4f0f4f01edcd ****/
		%feature("compactdefaultargs") Vrml_WWWInline;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_WWWInline;
		 Vrml_WWWInline();

		/****************** Vrml_WWWInline ******************/
		/**** md5 signature: bcc26a2e2cab6617dcbd7b02897d8c77 ****/
		%feature("compactdefaultargs") Vrml_WWWInline;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_AsciiString
aBboxSize: gp_Vec
aBboxCenter: gp_Vec

Returns
-------
None
") Vrml_WWWInline;
		 Vrml_WWWInline(const TCollection_AsciiString & aName, const gp_Vec & aBboxSize, const gp_Vec & aBboxCenter);

		/****************** BboxCenter ******************/
		/**** md5 signature: 96c51f966aa30678cff38b2dd51e12fd ****/
		%feature("compactdefaultargs") BboxCenter;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") BboxCenter;
		gp_Vec BboxCenter();

		/****************** BboxSize ******************/
		/**** md5 signature: 8b1c0289d06d7d8684875beb8317841d ****/
		%feature("compactdefaultargs") BboxSize;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") BboxSize;
		gp_Vec BboxSize();

		/****************** Name ******************/
		/**** md5 signature: 4ede994349b8ea032efece942c57861d ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_AsciiString
") Name;
		TCollection_AsciiString Name();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** SetBboxCenter ******************/
		/**** md5 signature: 75eefe6a1bfe942ba05eca3afdd6a9bf ****/
		%feature("compactdefaultargs") SetBboxCenter;
		%feature("autodoc", "No available documentation.

Parameters
----------
aBboxCenter: gp_Vec

Returns
-------
None
") SetBboxCenter;
		void SetBboxCenter(const gp_Vec & aBboxCenter);

		/****************** SetBboxSize ******************/
		/**** md5 signature: 5251c867816c19e5b0a1c82e4077912d ****/
		%feature("compactdefaultargs") SetBboxSize;
		%feature("autodoc", "No available documentation.

Parameters
----------
aBboxSize: gp_Vec

Returns
-------
None
") SetBboxSize;
		void SetBboxSize(const gp_Vec & aBboxSize);

		/****************** SetName ******************/
		/**** md5 signature: 3521bb701d54e60914d11a5ea23f03c3 ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_AsciiString

Returns
-------
None
") SetName;
		void SetName(const TCollection_AsciiString & aName);

};


%extend Vrml_WWWInline {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
