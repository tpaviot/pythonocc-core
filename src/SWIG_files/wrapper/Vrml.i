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

class Vrml_VertexOrdering:
	Vrml_UNKNOWN_ORDERING = 0
	Vrml_CLOCKWISE = 1
	Vrml_COUNTERCLOCKWISE = 2

class Vrml_FontStyleFamily:
	Vrml_SERIF = 0
	Vrml_SANS = 1
	Vrml_TYPEWRITER = 2

class Vrml_SeparatorRenderCulling:
	Vrml_OFF = 0
	Vrml_ON = 1
	Vrml_AUTO = 2

class Vrml_Texture2Wrap:
	Vrml_REPEAT = 0
	Vrml_CLAMP = 1

class Vrml_FaceType:
	Vrml_UNKNOWN_FACE_TYPE = 0
	Vrml_CONVEX = 1

class Vrml_AsciiTextJustification:
	Vrml_LEFT = 0
	Vrml_CENTER = 1
	Vrml_RIGHT = 2

class Vrml_ConeParts:
	Vrml_ConeSIDES = 0
	Vrml_ConeBOTTOM = 1
	Vrml_ConeALL = 2

class Vrml_SFImageNumber:
	Vrml_NULL = 0
	Vrml_ONE = 1
	Vrml_TWO = 2
	Vrml_THREE = 3
	Vrml_FOUR = 4

class Vrml_MaterialBindingAndNormalBinding:
	Vrml_DEFAULT = 0
	Vrml_OVERALL = 1
	Vrml_PER_PART = 2
	Vrml_PER_PART_INDEXED = 3
	Vrml_PER_FACE = 4
	Vrml_PER_FACE_INDEXED = 5
	Vrml_PER_VERTEX = 6
	Vrml_PER_VERTEX_INDEXED = 7

class Vrml_ShapeType:
	Vrml_UNKNOWN_SHAPE_TYPE = 0
	Vrml_SOLID = 1

class Vrml_WWWAnchorMap:
	Vrml_MAP_NONE = 0
	Vrml_POINT = 1

class Vrml_CylinderParts:
	Vrml_CylinderSIDES = 0
	Vrml_CylinderTOP = 1
	Vrml_CylinderBOTTOM = 2
	Vrml_CylinderALL = 3

class Vrml_FontStyleStyle:
	Vrml_NONE = 0
	Vrml_BOLD = 1
	Vrml_ITALIC = 2
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
		%feature("compactdefaultargs") Vrml_AsciiText;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_AsciiText;
		 Vrml_AsciiText();

		/****************** Vrml_AsciiText ******************/
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
		%feature("compactdefaultargs") Spacing;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Spacing;
		Standard_Real Spacing();

		/****************** String ******************/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfAsciiString>
") String;
		opencascade::handle<TColStd_HArray1OfAsciiString> String();

		/****************** Width ******************/
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
		%feature("compactdefaultargs") BottomRadius;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") BottomRadius;
		Standard_Real BottomRadius();

		/****************** Height ******************/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Height;
		Standard_Real Height();

		/****************** Parts ******************/
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
		%feature("compactdefaultargs") Vrml_Coordinate3;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_Coordinate3;
		 Vrml_Coordinate3();

		/****************** Point ******************/
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
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Depth;
		Standard_Real Depth();

		/****************** Height ******************/
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
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Height;
		Standard_Real Height();

		/****************** Parts ******************/
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
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** SetHeight ******************/
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
		%feature("compactdefaultargs") Vrml_DirectionalLight;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_DirectionalLight;
		 Vrml_DirectionalLight();

		/****************** Vrml_DirectionalLight ******************/
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
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "No available documentation.

Returns
-------
Quantity_Color
") Color;
		Quantity_Color Color();

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") Direction;
		gp_Vec Direction();

		/****************** Intensity ******************/
		%feature("compactdefaultargs") Intensity;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Intensity;
		Standard_Real Intensity();

		/****************** OnOff ******************/
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
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Size;
		Standard_Real Size();

		/****************** Style ******************/
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
		%feature("compactdefaultargs") Vrml_IndexedFaceSet;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_IndexedFaceSet;
		 Vrml_IndexedFaceSet();

		/****************** CoordIndex ******************/
		%feature("compactdefaultargs") CoordIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfInteger>
") CoordIndex;
		opencascade::handle<TColStd_HArray1OfInteger> CoordIndex();

		/****************** MaterialIndex ******************/
		%feature("compactdefaultargs") MaterialIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfInteger>
") MaterialIndex;
		opencascade::handle<TColStd_HArray1OfInteger> MaterialIndex();

		/****************** NormalIndex ******************/
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
		%feature("compactdefaultargs") Vrml_IndexedLineSet;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_IndexedLineSet;
		 Vrml_IndexedLineSet();

		/****************** CoordIndex ******************/
		%feature("compactdefaultargs") CoordIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfInteger>
") CoordIndex;
		opencascade::handle<TColStd_HArray1OfInteger> CoordIndex();

		/****************** MaterialIndex ******************/
		%feature("compactdefaultargs") MaterialIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfInteger>
") MaterialIndex;
		opencascade::handle<TColStd_HArray1OfInteger> MaterialIndex();

		/****************** NormalIndex ******************/
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
		%feature("compactdefaultargs") Vrml_LOD;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_LOD;
		 Vrml_LOD();

		/****************** Vrml_LOD ******************/
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
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") Range;
		opencascade::handle<TColStd_HArray1OfReal> Range();

		/****************** SetCenter ******************/
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
		%feature("compactdefaultargs") Vrml_Material;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_Material;
		 Vrml_Material();

		/****************** AmbientColor ******************/
		%feature("compactdefaultargs") AmbientColor;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Quantity_HArray1OfColor>
") AmbientColor;
		opencascade::handle<Quantity_HArray1OfColor> AmbientColor();

		/****************** DiffuseColor ******************/
		%feature("compactdefaultargs") DiffuseColor;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Quantity_HArray1OfColor>
") DiffuseColor;
		opencascade::handle<Quantity_HArray1OfColor> DiffuseColor();

		/****************** EmissiveColor ******************/
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
		%feature("compactdefaultargs") Shininess;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") Shininess;
		opencascade::handle<TColStd_HArray1OfReal> Shininess();

		/****************** SpecularColor ******************/
		%feature("compactdefaultargs") SpecularColor;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Quantity_HArray1OfColor>
") SpecularColor;
		opencascade::handle<Quantity_HArray1OfColor> SpecularColor();

		/****************** Transparency ******************/
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
		%feature("compactdefaultargs") Vrml_MatrixTransform;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_MatrixTransform;
		 Vrml_MatrixTransform();

		/****************** Vrml_MatrixTransform ******************/
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
		%feature("compactdefaultargs") Vrml_OrthographicCamera;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_OrthographicCamera;
		 Vrml_OrthographicCamera();

		/****************** Vrml_OrthographicCamera ******************/
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
		%feature("compactdefaultargs") FocalDistance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FocalDistance;
		Standard_Real FocalDistance();

		/****************** Height ******************/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Height;
		Standard_Real Height();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
Vrml_SFRotation
") Orientation;
		Vrml_SFRotation Orientation();

		/****************** Position ******************/
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
		%feature("compactdefaultargs") Vrml_PerspectiveCamera;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_PerspectiveCamera;
		 Vrml_PerspectiveCamera();

		/****************** Vrml_PerspectiveCamera ******************/
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
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Angle;
		Standard_Real Angle();

		/****************** FocalDistance ******************/
		%feature("compactdefaultargs") FocalDistance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FocalDistance;
		Standard_Real FocalDistance();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
Vrml_SFRotation
") Orientation;
		Vrml_SFRotation Orientation();

		/****************** Position ******************/
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
		%feature("compactdefaultargs") Vrml_PointLight;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_PointLight;
		 Vrml_PointLight();

		/****************** Vrml_PointLight ******************/
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
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "No available documentation.

Returns
-------
Quantity_Color
") Color;
		Quantity_Color Color();

		/****************** Intensity ******************/
		%feature("compactdefaultargs") Intensity;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Intensity;
		Standard_Real Intensity();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") Location;
		gp_Vec Location();

		/****************** OnOff ******************/
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
		%feature("compactdefaultargs") Vrml_Rotation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_Rotation;
		 Vrml_Rotation();

		/****************** Vrml_Rotation ******************/
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
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "No available documentation.

Returns
-------
Vrml_SFRotation
") Rotation;
		Vrml_SFRotation Rotation();

		/****************** SetRotation ******************/
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
		%feature("compactdefaultargs") Vrml_SFImage;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_SFImage;
		 Vrml_SFImage();

		/****************** Vrml_SFImage ******************/
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
		%feature("compactdefaultargs") Array;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfInteger>
") Array;
		opencascade::handle<TColStd_HArray1OfInteger> Array();

		/****************** ArrayFlag ******************/
		%feature("compactdefaultargs") ArrayFlag;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") ArrayFlag;
		Standard_Boolean ArrayFlag();

		/****************** Height ******************/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Height;
		Standard_Integer Height();

		/****************** Number ******************/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "No available documentation.

Returns
-------
Vrml_SFImageNumber
") Number;
		Vrml_SFImageNumber Number();

		/****************** SetArray ******************/
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
		%feature("compactdefaultargs") Vrml_SFRotation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_SFRotation;
		 Vrml_SFRotation();

		/****************** Vrml_SFRotation ******************/
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
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Angle;
		Standard_Real Angle();

		/****************** RotationX ******************/
		%feature("compactdefaultargs") RotationX;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") RotationX;
		Standard_Real RotationX();

		/****************** RotationY ******************/
		%feature("compactdefaultargs") RotationY;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") RotationY;
		Standard_Real RotationY();

		/****************** RotationZ ******************/
		%feature("compactdefaultargs") RotationZ;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") RotationZ;
		Standard_Real RotationZ();

		/****************** SetAngle ******************/
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
		%feature("compactdefaultargs") Vrml_Scale;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_Scale;
		 Vrml_Scale();

		/****************** Vrml_Scale ******************/
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
		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") ScaleFactor;
		gp_Vec ScaleFactor();

		/****************** SetScaleFactor ******************/
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
		%feature("compactdefaultargs") RenderCulling;
		%feature("autodoc", "No available documentation.

Returns
-------
Vrml_SeparatorRenderCulling
") RenderCulling;
		Vrml_SeparatorRenderCulling RenderCulling();

		/****************** SetRenderCulling ******************/
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
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Angle;
		Standard_Real Angle();

		/****************** FaceType ******************/
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
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "No available documentation.

Returns
-------
Vrml_ShapeType
") ShapeType;
		Vrml_ShapeType ShapeType();

		/****************** VertexOrdering ******************/
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
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** SetRadius ******************/
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
		%feature("compactdefaultargs") Vrml_SpotLight;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_SpotLight;
		 Vrml_SpotLight();

		/****************** Vrml_SpotLight ******************/
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
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "No available documentation.

Returns
-------
Quantity_Color
") Color;
		Quantity_Color Color();

		/****************** CutOffAngle ******************/
		%feature("compactdefaultargs") CutOffAngle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") CutOffAngle;
		Standard_Real CutOffAngle();

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") Direction;
		gp_Vec Direction();

		/****************** DropOffRate ******************/
		%feature("compactdefaultargs") DropOffRate;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") DropOffRate;
		Standard_Real DropOffRate();

		/****************** Intensity ******************/
		%feature("compactdefaultargs") Intensity;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Intensity;
		Standard_Real Intensity();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") Location;
		gp_Vec Location();

		/****************** OnOff ******************/
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
		%feature("compactdefaultargs") Vrml_Texture2;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_Texture2;
		 Vrml_Texture2();

		/****************** Vrml_Texture2 ******************/
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
		%feature("compactdefaultargs") Filename;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_AsciiString
") Filename;
		TCollection_AsciiString Filename();

		/****************** Image ******************/
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
		%feature("compactdefaultargs") WrapS;
		%feature("autodoc", "No available documentation.

Returns
-------
Vrml_Texture2Wrap
") WrapS;
		Vrml_Texture2Wrap WrapS();

		/****************** WrapT ******************/
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
		%feature("compactdefaultargs") Vrml_Texture2Transform;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_Texture2Transform;
		 Vrml_Texture2Transform();

		/****************** Vrml_Texture2Transform ******************/
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
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Rotation;
		Standard_Real Rotation();

		/****************** ScaleFactor ******************/
		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") ScaleFactor;
		gp_Vec2d ScaleFactor();

		/****************** SetCenter ******************/
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
		%feature("compactdefaultargs") Vrml_TextureCoordinate2;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_TextureCoordinate2;
		 Vrml_TextureCoordinate2();

		/****************** Vrml_TextureCoordinate2 ******************/
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
		%feature("compactdefaultargs") Vrml_Transform;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_Transform;
		 Vrml_Transform();

		/****************** Vrml_Transform ******************/
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
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "No available documentation.

Returns
-------
Vrml_SFRotation
") Rotation;
		Vrml_SFRotation Rotation();

		/****************** ScaleFactor ******************/
		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") ScaleFactor;
		gp_Vec ScaleFactor();

		/****************** ScaleOrientation ******************/
		%feature("compactdefaultargs") ScaleOrientation;
		%feature("autodoc", "No available documentation.

Returns
-------
Vrml_SFRotation
") ScaleOrientation;
		Vrml_SFRotation ScaleOrientation();

		/****************** SetCenter ******************/
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
		%feature("compactdefaultargs") Vrml_Translation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_Translation;
		 Vrml_Translation();

		/****************** Vrml_Translation ******************/
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
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_AsciiString
") Description;
		TCollection_AsciiString Description();

		/****************** Map ******************/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "No available documentation.

Returns
-------
Vrml_WWWAnchorMap
") Map;
		Vrml_WWWAnchorMap Map();

		/****************** Name ******************/
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
		%feature("compactdefaultargs") Vrml_WWWInline;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Vrml_WWWInline;
		 Vrml_WWWInline();

		/****************** Vrml_WWWInline ******************/
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
		%feature("compactdefaultargs") BboxCenter;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") BboxCenter;
		gp_Vec BboxCenter();

		/****************** BboxSize ******************/
		%feature("compactdefaultargs") BboxSize;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") BboxSize;
		gp_Vec BboxSize();

		/****************** Name ******************/
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
