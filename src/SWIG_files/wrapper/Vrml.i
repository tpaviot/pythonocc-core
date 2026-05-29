/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_vrml.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
#include<IFSelect_module.hxx>
#include<TopTools_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<CDF_module.hxx>
#include<PCDM_module.hxx>
#include<TDF_module.hxx>
#include<MoniTool_module.hxx>
#include<Transfer_module.hxx>
#include<Interface_module.hxx>
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

enum Vrml_CylinderParts {
	Vrml_CylinderSIDES = 0,
	Vrml_CylinderTOP = 1,
	Vrml_CylinderBOTTOM = 2,
	Vrml_CylinderALL = 3,
};

enum Vrml_FaceType {
	Vrml_UNKNOWN_FACE_TYPE = 0,
	Vrml_CONVEX = 1,
};

enum Vrml_FontStyleFamily {
	Vrml_SERIF = 0,
	Vrml_SANS = 1,
	Vrml_TYPEWRITER = 2,
};

enum Vrml_FontStyleStyle {
	Vrml_NONE = 0,
	Vrml_BOLD = 1,
	Vrml_ITALIC = 2,
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

enum Vrml_SFImageNumber {
	Vrml_NULL = 0,
	Vrml_ONE = 1,
	Vrml_TWO = 2,
	Vrml_THREE = 3,
	Vrml_FOUR = 4,
};

enum Vrml_SeparatorRenderCulling {
	Vrml_OFF = 0,
	Vrml_ON = 1,
	Vrml_AUTO = 2,
};

enum Vrml_ShapeType {
	Vrml_UNKNOWN_SHAPE_TYPE = 0,
	Vrml_SOLID = 1,
};

enum Vrml_Texture2Wrap {
	Vrml_REPEAT = 0,
	Vrml_CLAMP = 1,
};

enum Vrml_VertexOrdering {
	Vrml_UNKNOWN_ORDERING = 0,
	Vrml_CLOCKWISE = 1,
	Vrml_COUNTERCLOCKWISE = 2,
};

enum Vrml_WWWAnchorMap {
	Vrml_MAP_NONE = 0,
	Vrml_POINT = 1,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

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

class Vrml_CylinderParts(IntEnum):
	Vrml_CylinderSIDES = 0
	Vrml_CylinderTOP = 1
	Vrml_CylinderBOTTOM = 2
	Vrml_CylinderALL = 3
Vrml_CylinderSIDES = Vrml_CylinderParts.Vrml_CylinderSIDES
Vrml_CylinderTOP = Vrml_CylinderParts.Vrml_CylinderTOP
Vrml_CylinderBOTTOM = Vrml_CylinderParts.Vrml_CylinderBOTTOM
Vrml_CylinderALL = Vrml_CylinderParts.Vrml_CylinderALL

class Vrml_FaceType(IntEnum):
	Vrml_UNKNOWN_FACE_TYPE = 0
	Vrml_CONVEX = 1
Vrml_UNKNOWN_FACE_TYPE = Vrml_FaceType.Vrml_UNKNOWN_FACE_TYPE
Vrml_CONVEX = Vrml_FaceType.Vrml_CONVEX

class Vrml_FontStyleFamily(IntEnum):
	Vrml_SERIF = 0
	Vrml_SANS = 1
	Vrml_TYPEWRITER = 2
Vrml_SERIF = Vrml_FontStyleFamily.Vrml_SERIF
Vrml_SANS = Vrml_FontStyleFamily.Vrml_SANS
Vrml_TYPEWRITER = Vrml_FontStyleFamily.Vrml_TYPEWRITER

class Vrml_FontStyleStyle(IntEnum):
	Vrml_NONE = 0
	Vrml_BOLD = 1
	Vrml_ITALIC = 2
Vrml_NONE = Vrml_FontStyleStyle.Vrml_NONE
Vrml_BOLD = Vrml_FontStyleStyle.Vrml_BOLD
Vrml_ITALIC = Vrml_FontStyleStyle.Vrml_ITALIC

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

class Vrml_SeparatorRenderCulling(IntEnum):
	Vrml_OFF = 0
	Vrml_ON = 1
	Vrml_AUTO = 2
Vrml_OFF = Vrml_SeparatorRenderCulling.Vrml_OFF
Vrml_ON = Vrml_SeparatorRenderCulling.Vrml_ON
Vrml_AUTO = Vrml_SeparatorRenderCulling.Vrml_AUTO

class Vrml_ShapeType(IntEnum):
	Vrml_UNKNOWN_SHAPE_TYPE = 0
	Vrml_SOLID = 1
Vrml_UNKNOWN_SHAPE_TYPE = Vrml_ShapeType.Vrml_UNKNOWN_SHAPE_TYPE
Vrml_SOLID = Vrml_ShapeType.Vrml_SOLID

class Vrml_Texture2Wrap(IntEnum):
	Vrml_REPEAT = 0
	Vrml_CLAMP = 1
Vrml_REPEAT = Vrml_Texture2Wrap.Vrml_REPEAT
Vrml_CLAMP = Vrml_Texture2Wrap.Vrml_CLAMP

class Vrml_VertexOrdering(IntEnum):
	Vrml_UNKNOWN_ORDERING = 0
	Vrml_CLOCKWISE = 1
	Vrml_COUNTERCLOCKWISE = 2
Vrml_UNKNOWN_ORDERING = Vrml_VertexOrdering.Vrml_UNKNOWN_ORDERING
Vrml_CLOCKWISE = Vrml_VertexOrdering.Vrml_CLOCKWISE
Vrml_COUNTERCLOCKWISE = Vrml_VertexOrdering.Vrml_COUNTERCLOCKWISE

class Vrml_WWWAnchorMap(IntEnum):
	Vrml_MAP_NONE = 0
	Vrml_POINT = 1
Vrml_MAP_NONE = Vrml_WWWAnchorMap.Vrml_MAP_NONE
Vrml_POINT = Vrml_WWWAnchorMap.Vrml_POINT
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
		/****** Vrml::CommentWriter ******/
		/****** md5 signature: 72caf3429e2d60e7ea9b25a36560f806 ******/
		%feature("compactdefaultargs") CommentWriter;
		%feature("autodoc", "
Parameters
----------
aComment: char *

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") CommentWriter;
		static Standard_OStream & CommentWriter(const char * const aComment, std::ostream &OutValue);

		/****** Vrml::VrmlHeaderWriter ******/
		/****** md5 signature: e0e105d95fec65a919874d86d7edc262 ******/
		%feature("compactdefaultargs") VrmlHeaderWriter;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
Writes a header in anOStream (VRML file). Writes one line of commentary in anOStream (VRML file).
") VrmlHeaderWriter;
		static Standard_OStream & VrmlHeaderWriter(std::ostream &OutValue);

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
		/****** Vrml_AsciiText::Vrml_AsciiText ******/
		/****** md5 signature: 8dcccbc17fe1fe239cb5057b37333b1d ******/
		%feature("compactdefaultargs") Vrml_AsciiText;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Vrml_AsciiText;
		 Vrml_AsciiText();

		/****** Vrml_AsciiText::Vrml_AsciiText ******/
		/****** md5 signature: 95b30242971c3a84f599fc11e5c0699d ******/
		%feature("compactdefaultargs") Vrml_AsciiText;
		%feature("autodoc", "
Parameters
----------
aString: TColStd_HArray1OfAsciiString
aSpacing: double
aJustification: Vrml_AsciiTextJustification
aWidth: double

Return
-------
None

Description
-----------
No available documentation.
") Vrml_AsciiText;
		 Vrml_AsciiText(const opencascade::handle<TColStd_HArray1OfAsciiString> & aString, const double aSpacing, const Vrml_AsciiTextJustification aJustification, const double aWidth);

		/****** Vrml_AsciiText::Justification ******/
		/****** md5 signature: f7b5f3dd5d19ad2211adcdc674352bea ******/
		%feature("compactdefaultargs") Justification;
		%feature("autodoc", "Return
-------
Vrml_AsciiTextJustification

Description
-----------
No available documentation.
") Justification;
		Vrml_AsciiTextJustification Justification();

		/****** Vrml_AsciiText::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_AsciiText::SetJustification ******/
		/****** md5 signature: 3950698a2301d05e87ab121d39eef7c5 ******/
		%feature("compactdefaultargs") SetJustification;
		%feature("autodoc", "
Parameters
----------
aJustification: Vrml_AsciiTextJustification

Return
-------
None

Description
-----------
No available documentation.
") SetJustification;
		void SetJustification(const Vrml_AsciiTextJustification aJustification);

		/****** Vrml_AsciiText::SetSpacing ******/
		/****** md5 signature: 2d940df4d9bb82a47393b09ef184e07d ******/
		%feature("compactdefaultargs") SetSpacing;
		%feature("autodoc", "
Parameters
----------
aSpacing: double

Return
-------
None

Description
-----------
No available documentation.
") SetSpacing;
		void SetSpacing(const double aSpacing);

		/****** Vrml_AsciiText::SetString ******/
		/****** md5 signature: 57edf56da254cf376b09ca87ca51ff95 ******/
		%feature("compactdefaultargs") SetString;
		%feature("autodoc", "
Parameters
----------
aString: TColStd_HArray1OfAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetString;
		void SetString(const opencascade::handle<TColStd_HArray1OfAsciiString> & aString);

		/****** Vrml_AsciiText::SetWidth ******/
		/****** md5 signature: ee0607ebb5cc5d325397bde68a8580c0 ******/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "
Parameters
----------
aWidth: double

Return
-------
None

Description
-----------
No available documentation.
") SetWidth;
		void SetWidth(const double aWidth);

		/****** Vrml_AsciiText::Spacing ******/
		/****** md5 signature: fd41852ed2c9deea5bc325aa062cc3af ******/
		%feature("compactdefaultargs") Spacing;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Spacing;
		double Spacing();

		/****** Vrml_AsciiText::String ******/
		/****** md5 signature: 308f6bcef7fb137ac908c51817653f5c ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfAsciiString>

Description
-----------
No available documentation.
") String;
		opencascade::handle<TColStd_HArray1OfAsciiString> String();

		/****** Vrml_AsciiText::Width ******/
		/****** md5 signature: 1fd4c6d3d33fbd8b282f769785a59bae ******/
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Width;
		double Width();

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
		/****** Vrml_Cone::Vrml_Cone ******/
		/****** md5 signature: 87f6d0fbd707bbb46cbad3c8d0bdde55 ******/
		%feature("compactdefaultargs") Vrml_Cone;
		%feature("autodoc", "
Parameters
----------
aParts: Vrml_ConeParts (optional, default to Vrml_ConeALL)
aBottomRadius: double (optional, default to 1)
aHeight: double (optional, default to 2)

Return
-------
None

Description
-----------
No available documentation.
") Vrml_Cone;
		 Vrml_Cone(const Vrml_ConeParts aParts = Vrml_ConeALL, const double aBottomRadius = 1, const double aHeight = 2);

		/****** Vrml_Cone::BottomRadius ******/
		/****** md5 signature: b4753df43cde8bf2a9784d1380b28205 ******/
		%feature("compactdefaultargs") BottomRadius;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") BottomRadius;
		double BottomRadius();

		/****** Vrml_Cone::Height ******/
		/****** md5 signature: 5c7d6acffa5c6358c6b35a05de7a5995 ******/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Height;
		double Height();

		/****** Vrml_Cone::Parts ******/
		/****** md5 signature: 26d39ad8de41c8a9d0752d74b268a6a7 ******/
		%feature("compactdefaultargs") Parts;
		%feature("autodoc", "Return
-------
Vrml_ConeParts

Description
-----------
No available documentation.
") Parts;
		Vrml_ConeParts Parts();

		/****** Vrml_Cone::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_Cone::SetBottomRadius ******/
		/****** md5 signature: 316e923ebf0b535c0c79e07ed16ba970 ******/
		%feature("compactdefaultargs") SetBottomRadius;
		%feature("autodoc", "
Parameters
----------
aBottomRadius: double

Return
-------
None

Description
-----------
No available documentation.
") SetBottomRadius;
		void SetBottomRadius(const double aBottomRadius);

		/****** Vrml_Cone::SetHeight ******/
		/****** md5 signature: 7c13e1b8ec1777da9517ca99bd3e24bd ******/
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "
Parameters
----------
aHeight: double

Return
-------
None

Description
-----------
No available documentation.
") SetHeight;
		void SetHeight(const double aHeight);

		/****** Vrml_Cone::SetParts ******/
		/****** md5 signature: fb601b0ea4acddc3c7126e1dd53f86fc ******/
		%feature("compactdefaultargs") SetParts;
		%feature("autodoc", "
Parameters
----------
aParts: Vrml_ConeParts

Return
-------
None

Description
-----------
No available documentation.
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
		/****** Vrml_Coordinate3::Vrml_Coordinate3 ******/
		/****** md5 signature: 4f65267e4e1d1cdc18ddb2e133f7a000 ******/
		%feature("compactdefaultargs") Vrml_Coordinate3;
		%feature("autodoc", "
Parameters
----------
aPoint: TColgp_HArray1OfVec

Return
-------
None

Description
-----------
No available documentation.
") Vrml_Coordinate3;
		 Vrml_Coordinate3(const opencascade::handle<TColgp_HArray1OfVec> & aPoint);

		/****** Vrml_Coordinate3::Vrml_Coordinate3 ******/
		/****** md5 signature: caa651195ec5275c95e9738226765ecf ******/
		%feature("compactdefaultargs") Vrml_Coordinate3;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Vrml_Coordinate3;
		 Vrml_Coordinate3();

		/****** Vrml_Coordinate3::Point ******/
		/****** md5 signature: 9138abf2e90d31b6a81e7adccdc2cf75 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
opencascade::handle<TColgp_HArray1OfVec>

Description
-----------
No available documentation.
") Point;
		opencascade::handle<TColgp_HArray1OfVec> Point();

		/****** Vrml_Coordinate3::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_Coordinate3::SetPoint ******/
		/****** md5 signature: 8bd673eef84aa712c4aff108c81ce111 ******/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "
Parameters
----------
aPoint: TColgp_HArray1OfVec

Return
-------
None

Description
-----------
No available documentation.
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
		/****** Vrml_Cube::Vrml_Cube ******/
		/****** md5 signature: d2e1c5da5d19f87830ad161ab322a8c1 ******/
		%feature("compactdefaultargs") Vrml_Cube;
		%feature("autodoc", "
Parameters
----------
aWidth: double (optional, default to 2)
aHeight: double (optional, default to 2)
aDepth: double (optional, default to 2)

Return
-------
None

Description
-----------
No available documentation.
") Vrml_Cube;
		 Vrml_Cube(const double aWidth = 2, const double aHeight = 2, const double aDepth = 2);

		/****** Vrml_Cube::Depth ******/
		/****** md5 signature: f37e2236448dd6d5b61209c188407c46 ******/
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Depth;
		double Depth();

		/****** Vrml_Cube::Height ******/
		/****** md5 signature: 5c7d6acffa5c6358c6b35a05de7a5995 ******/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Height;
		double Height();

		/****** Vrml_Cube::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_Cube::SetDepth ******/
		/****** md5 signature: 285382766a76a466304b3c8fcac77dba ******/
		%feature("compactdefaultargs") SetDepth;
		%feature("autodoc", "
Parameters
----------
aDepth: double

Return
-------
None

Description
-----------
No available documentation.
") SetDepth;
		void SetDepth(const double aDepth);

		/****** Vrml_Cube::SetHeight ******/
		/****** md5 signature: 7c13e1b8ec1777da9517ca99bd3e24bd ******/
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "
Parameters
----------
aHeight: double

Return
-------
None

Description
-----------
No available documentation.
") SetHeight;
		void SetHeight(const double aHeight);

		/****** Vrml_Cube::SetWidth ******/
		/****** md5 signature: ee0607ebb5cc5d325397bde68a8580c0 ******/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "
Parameters
----------
aWidth: double

Return
-------
None

Description
-----------
No available documentation.
") SetWidth;
		void SetWidth(const double aWidth);

		/****** Vrml_Cube::Width ******/
		/****** md5 signature: 1fd4c6d3d33fbd8b282f769785a59bae ******/
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Width;
		double Width();

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
		/****** Vrml_Cylinder::Vrml_Cylinder ******/
		/****** md5 signature: 75c92d4d33f48b78b8c05ee757507365 ******/
		%feature("compactdefaultargs") Vrml_Cylinder;
		%feature("autodoc", "
Parameters
----------
aParts: Vrml_CylinderParts (optional, default to Vrml_CylinderALL)
aRadius: double (optional, default to 1)
aHeight: double (optional, default to 2)

Return
-------
None

Description
-----------
No available documentation.
") Vrml_Cylinder;
		 Vrml_Cylinder(const Vrml_CylinderParts aParts = Vrml_CylinderALL, const double aRadius = 1, const double aHeight = 2);

		/****** Vrml_Cylinder::Height ******/
		/****** md5 signature: 5c7d6acffa5c6358c6b35a05de7a5995 ******/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Height;
		double Height();

		/****** Vrml_Cylinder::Parts ******/
		/****** md5 signature: f4df95d71d7d2c7655c6fc632b765144 ******/
		%feature("compactdefaultargs") Parts;
		%feature("autodoc", "Return
-------
Vrml_CylinderParts

Description
-----------
No available documentation.
") Parts;
		Vrml_CylinderParts Parts();

		/****** Vrml_Cylinder::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_Cylinder::Radius ******/
		/****** md5 signature: 3f212b2355d53c03baacfd2fb8e2678a ******/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Radius;
		double Radius();

		/****** Vrml_Cylinder::SetHeight ******/
		/****** md5 signature: 7c13e1b8ec1777da9517ca99bd3e24bd ******/
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "
Parameters
----------
aHeight: double

Return
-------
None

Description
-----------
No available documentation.
") SetHeight;
		void SetHeight(const double aHeight);

		/****** Vrml_Cylinder::SetParts ******/
		/****** md5 signature: 363ab2c780d68466100e4299ef8fa785 ******/
		%feature("compactdefaultargs") SetParts;
		%feature("autodoc", "
Parameters
----------
aParts: Vrml_CylinderParts

Return
-------
None

Description
-----------
No available documentation.
") SetParts;
		void SetParts(const Vrml_CylinderParts aParts);

		/****** Vrml_Cylinder::SetRadius ******/
		/****** md5 signature: f0566f0da6f39e1b404c168108c44985 ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
aRadius: double

Return
-------
None

Description
-----------
No available documentation.
") SetRadius;
		void SetRadius(const double aRadius);

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
		/****** Vrml_DirectionalLight::Vrml_DirectionalLight ******/
		/****** md5 signature: dbef6905ed9fd05596d93ca2a5b41127 ******/
		%feature("compactdefaultargs") Vrml_DirectionalLight;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Vrml_DirectionalLight;
		 Vrml_DirectionalLight();

		/****** Vrml_DirectionalLight::Vrml_DirectionalLight ******/
		/****** md5 signature: 26a302dcd49103600c88ab4a11fe57c9 ******/
		%feature("compactdefaultargs") Vrml_DirectionalLight;
		%feature("autodoc", "
Parameters
----------
aOnOff: bool
aIntensity: double
aColor: Quantity_Color
aDirection: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Vrml_DirectionalLight;
		 Vrml_DirectionalLight(const bool aOnOff, const double aIntensity, const Quantity_Color & aColor, const gp_Vec & aDirection);

		/****** Vrml_DirectionalLight::Color ******/
		/****** md5 signature: b37a2e584a895a08fcf8ead60940b246 ******/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
No available documentation.
") Color;
		Quantity_Color Color();

		/****** Vrml_DirectionalLight::Direction ******/
		/****** md5 signature: 36725d4d9370b25778d365a2d983c00e ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") Direction;
		gp_Vec Direction();

		/****** Vrml_DirectionalLight::Intensity ******/
		/****** md5 signature: 0efec0be4852a323f220a08b45a10290 ******/
		%feature("compactdefaultargs") Intensity;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Intensity;
		double Intensity();

		/****** Vrml_DirectionalLight::OnOff ******/
		/****** md5 signature: 81f9db50648440a668d188bd149dec81 ******/
		%feature("compactdefaultargs") OnOff;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") OnOff;
		bool OnOff();

		/****** Vrml_DirectionalLight::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_DirectionalLight::SetColor ******/
		/****** md5 signature: 5aebf70a123538e7dff670112c56db0d ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
aColor: Quantity_Color

Return
-------
None

Description
-----------
No available documentation.
") SetColor;
		void SetColor(const Quantity_Color & aColor);

		/****** Vrml_DirectionalLight::SetDirection ******/
		/****** md5 signature: 631fcce8229d14261aa80e6545acf64f ******/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "
Parameters
----------
aDirection: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") SetDirection;
		void SetDirection(const gp_Vec & aDirection);

		/****** Vrml_DirectionalLight::SetIntensity ******/
		/****** md5 signature: 21a812bfeb21857a4714e2e90fc4b7bd ******/
		%feature("compactdefaultargs") SetIntensity;
		%feature("autodoc", "
Parameters
----------
aIntensity: double

Return
-------
None

Description
-----------
No available documentation.
") SetIntensity;
		void SetIntensity(const double aIntensity);

		/****** Vrml_DirectionalLight::SetOnOff ******/
		/****** md5 signature: 33b5d48da02b5c7bf4f9cc2e05805dbb ******/
		%feature("compactdefaultargs") SetOnOff;
		%feature("autodoc", "
Parameters
----------
aOnOff: bool

Return
-------
None

Description
-----------
No available documentation.
") SetOnOff;
		void SetOnOff(const bool aOnOff);

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
		/****** Vrml_FontStyle::Vrml_FontStyle ******/
		/****** md5 signature: 1f29280dac8fa8bbc4faf16410650ca8 ******/
		%feature("compactdefaultargs") Vrml_FontStyle;
		%feature("autodoc", "
Parameters
----------
aSize: double (optional, default to 10)
aFamily: Vrml_FontStyleFamily (optional, default to Vrml_SERIF)
aStyle: Vrml_FontStyleStyle (optional, default to Vrml_NONE)

Return
-------
None

Description
-----------
No available documentation.
") Vrml_FontStyle;
		 Vrml_FontStyle(const double aSize = 10, const Vrml_FontStyleFamily aFamily = Vrml_SERIF, const Vrml_FontStyleStyle aStyle = Vrml_NONE);

		/****** Vrml_FontStyle::Family ******/
		/****** md5 signature: d1ecc1f19f57b4ada363cdf58dc7ba8d ******/
		%feature("compactdefaultargs") Family;
		%feature("autodoc", "Return
-------
Vrml_FontStyleFamily

Description
-----------
No available documentation.
") Family;
		Vrml_FontStyleFamily Family();

		/****** Vrml_FontStyle::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_FontStyle::SetFamily ******/
		/****** md5 signature: b0100e13b2e059fb2e8b420788ec2a61 ******/
		%feature("compactdefaultargs") SetFamily;
		%feature("autodoc", "
Parameters
----------
aFamily: Vrml_FontStyleFamily

Return
-------
None

Description
-----------
No available documentation.
") SetFamily;
		void SetFamily(const Vrml_FontStyleFamily aFamily);

		/****** Vrml_FontStyle::SetSize ******/
		/****** md5 signature: b690dc1cb3ecd35a66470a47c25f91e5 ******/
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "
Parameters
----------
aSize: double

Return
-------
None

Description
-----------
No available documentation.
") SetSize;
		void SetSize(const double aSize);

		/****** Vrml_FontStyle::SetStyle ******/
		/****** md5 signature: 844327ee819b53f260feccbfebd41096 ******/
		%feature("compactdefaultargs") SetStyle;
		%feature("autodoc", "
Parameters
----------
aStyle: Vrml_FontStyleStyle

Return
-------
None

Description
-----------
No available documentation.
") SetStyle;
		void SetStyle(const Vrml_FontStyleStyle aStyle);

		/****** Vrml_FontStyle::Size ******/
		/****** md5 signature: 06192572c9cdca54cf74477cdabdab63 ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Size;
		double Size();

		/****** Vrml_FontStyle::Style ******/
		/****** md5 signature: 52df975e76cc44f74da30207fc4e3cfc ******/
		%feature("compactdefaultargs") Style;
		%feature("autodoc", "Return
-------
Vrml_FontStyleStyle

Description
-----------
No available documentation.
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
		/****** Vrml_Group::Vrml_Group ******/
		/****** md5 signature: 47103d366ba33ef63abf34756e3930fc ******/
		%feature("compactdefaultargs") Vrml_Group;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Vrml_Group;
		 Vrml_Group();

		/****** Vrml_Group::Print ******/
		/****** md5 signature: a7a6d9b084f11fb866b7f1da61c9ed6a ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

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
		/****** Vrml_IndexedFaceSet::Vrml_IndexedFaceSet ******/
		/****** md5 signature: d9d544373ad44ef35f885d595c955057 ******/
		%feature("compactdefaultargs") Vrml_IndexedFaceSet;
		%feature("autodoc", "
Parameters
----------
aCoordIndex: TColStd_HArray1OfInteger
aMaterialIndex: TColStd_HArray1OfInteger
aNormalIndex: TColStd_HArray1OfInteger
aTextureCoordIndex: TColStd_HArray1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") Vrml_IndexedFaceSet;
		 Vrml_IndexedFaceSet(const opencascade::handle<TColStd_HArray1OfInteger> & aCoordIndex, const opencascade::handle<TColStd_HArray1OfInteger> & aMaterialIndex, const opencascade::handle<TColStd_HArray1OfInteger> & aNormalIndex, const opencascade::handle<TColStd_HArray1OfInteger> & aTextureCoordIndex);

		/****** Vrml_IndexedFaceSet::Vrml_IndexedFaceSet ******/
		/****** md5 signature: 50ef4121137fded12bf9eaedab6bc411 ******/
		%feature("compactdefaultargs") Vrml_IndexedFaceSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Vrml_IndexedFaceSet;
		 Vrml_IndexedFaceSet();

		/****** Vrml_IndexedFaceSet::CoordIndex ******/
		/****** md5 signature: bf3a1b35ee8898427271d36dd838250b ******/
		%feature("compactdefaultargs") CoordIndex;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
No available documentation.
") CoordIndex;
		opencascade::handle<TColStd_HArray1OfInteger> CoordIndex();

		/****** Vrml_IndexedFaceSet::MaterialIndex ******/
		/****** md5 signature: f1eb03fb4692c215dd2eac71926e91a4 ******/
		%feature("compactdefaultargs") MaterialIndex;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
No available documentation.
") MaterialIndex;
		opencascade::handle<TColStd_HArray1OfInteger> MaterialIndex();

		/****** Vrml_IndexedFaceSet::NormalIndex ******/
		/****** md5 signature: ae1a0bdfc1bc7d4c093a1547a7cfd79e ******/
		%feature("compactdefaultargs") NormalIndex;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
No available documentation.
") NormalIndex;
		opencascade::handle<TColStd_HArray1OfInteger> NormalIndex();

		/****** Vrml_IndexedFaceSet::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_IndexedFaceSet::SetCoordIndex ******/
		/****** md5 signature: 90c6ccbcd98836d665f4cadd6e2ec688 ******/
		%feature("compactdefaultargs") SetCoordIndex;
		%feature("autodoc", "
Parameters
----------
aCoordIndex: TColStd_HArray1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") SetCoordIndex;
		void SetCoordIndex(const opencascade::handle<TColStd_HArray1OfInteger> & aCoordIndex);

		/****** Vrml_IndexedFaceSet::SetMaterialIndex ******/
		/****** md5 signature: 98d0deb03bc31d666885092c78bfd060 ******/
		%feature("compactdefaultargs") SetMaterialIndex;
		%feature("autodoc", "
Parameters
----------
aMaterialIndex: TColStd_HArray1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") SetMaterialIndex;
		void SetMaterialIndex(const opencascade::handle<TColStd_HArray1OfInteger> & aMaterialIndex);

		/****** Vrml_IndexedFaceSet::SetNormalIndex ******/
		/****** md5 signature: 3d03b4ce2881c9f2ec84f23207971379 ******/
		%feature("compactdefaultargs") SetNormalIndex;
		%feature("autodoc", "
Parameters
----------
aNormalIndex: TColStd_HArray1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") SetNormalIndex;
		void SetNormalIndex(const opencascade::handle<TColStd_HArray1OfInteger> & aNormalIndex);

		/****** Vrml_IndexedFaceSet::SetTextureCoordIndex ******/
		/****** md5 signature: fae2a579c835a8fbce7f594c4b0a3464 ******/
		%feature("compactdefaultargs") SetTextureCoordIndex;
		%feature("autodoc", "
Parameters
----------
aTextureCoordIndex: TColStd_HArray1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") SetTextureCoordIndex;
		void SetTextureCoordIndex(const opencascade::handle<TColStd_HArray1OfInteger> & aTextureCoordIndex);

		/****** Vrml_IndexedFaceSet::TextureCoordIndex ******/
		/****** md5 signature: 53a857022e49bb187fdfa58782aa2400 ******/
		%feature("compactdefaultargs") TextureCoordIndex;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
No available documentation.
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
		/****** Vrml_IndexedLineSet::Vrml_IndexedLineSet ******/
		/****** md5 signature: 184a4b6d512b8275a92d7a8ea56dceed ******/
		%feature("compactdefaultargs") Vrml_IndexedLineSet;
		%feature("autodoc", "
Parameters
----------
aCoordIndex: TColStd_HArray1OfInteger
aMaterialIndex: TColStd_HArray1OfInteger
aNormalIndex: TColStd_HArray1OfInteger
aTextureCoordIndex: TColStd_HArray1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") Vrml_IndexedLineSet;
		 Vrml_IndexedLineSet(const opencascade::handle<TColStd_HArray1OfInteger> & aCoordIndex, const opencascade::handle<TColStd_HArray1OfInteger> & aMaterialIndex, const opencascade::handle<TColStd_HArray1OfInteger> & aNormalIndex, const opencascade::handle<TColStd_HArray1OfInteger> & aTextureCoordIndex);

		/****** Vrml_IndexedLineSet::Vrml_IndexedLineSet ******/
		/****** md5 signature: d1db7e38579850dce4baefc6cd4bee81 ******/
		%feature("compactdefaultargs") Vrml_IndexedLineSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Vrml_IndexedLineSet;
		 Vrml_IndexedLineSet();

		/****** Vrml_IndexedLineSet::CoordIndex ******/
		/****** md5 signature: bf3a1b35ee8898427271d36dd838250b ******/
		%feature("compactdefaultargs") CoordIndex;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
No available documentation.
") CoordIndex;
		opencascade::handle<TColStd_HArray1OfInteger> CoordIndex();

		/****** Vrml_IndexedLineSet::MaterialIndex ******/
		/****** md5 signature: f1eb03fb4692c215dd2eac71926e91a4 ******/
		%feature("compactdefaultargs") MaterialIndex;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
No available documentation.
") MaterialIndex;
		opencascade::handle<TColStd_HArray1OfInteger> MaterialIndex();

		/****** Vrml_IndexedLineSet::NormalIndex ******/
		/****** md5 signature: ae1a0bdfc1bc7d4c093a1547a7cfd79e ******/
		%feature("compactdefaultargs") NormalIndex;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
No available documentation.
") NormalIndex;
		opencascade::handle<TColStd_HArray1OfInteger> NormalIndex();

		/****** Vrml_IndexedLineSet::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_IndexedLineSet::SetCoordIndex ******/
		/****** md5 signature: 90c6ccbcd98836d665f4cadd6e2ec688 ******/
		%feature("compactdefaultargs") SetCoordIndex;
		%feature("autodoc", "
Parameters
----------
aCoordIndex: TColStd_HArray1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") SetCoordIndex;
		void SetCoordIndex(const opencascade::handle<TColStd_HArray1OfInteger> & aCoordIndex);

		/****** Vrml_IndexedLineSet::SetMaterialIndex ******/
		/****** md5 signature: 98d0deb03bc31d666885092c78bfd060 ******/
		%feature("compactdefaultargs") SetMaterialIndex;
		%feature("autodoc", "
Parameters
----------
aMaterialIndex: TColStd_HArray1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") SetMaterialIndex;
		void SetMaterialIndex(const opencascade::handle<TColStd_HArray1OfInteger> & aMaterialIndex);

		/****** Vrml_IndexedLineSet::SetNormalIndex ******/
		/****** md5 signature: 3d03b4ce2881c9f2ec84f23207971379 ******/
		%feature("compactdefaultargs") SetNormalIndex;
		%feature("autodoc", "
Parameters
----------
aNormalIndex: TColStd_HArray1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") SetNormalIndex;
		void SetNormalIndex(const opencascade::handle<TColStd_HArray1OfInteger> & aNormalIndex);

		/****** Vrml_IndexedLineSet::SetTextureCoordIndex ******/
		/****** md5 signature: fae2a579c835a8fbce7f594c4b0a3464 ******/
		%feature("compactdefaultargs") SetTextureCoordIndex;
		%feature("autodoc", "
Parameters
----------
aTextureCoordIndex: TColStd_HArray1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") SetTextureCoordIndex;
		void SetTextureCoordIndex(const opencascade::handle<TColStd_HArray1OfInteger> & aTextureCoordIndex);

		/****** Vrml_IndexedLineSet::TextureCoordIndex ******/
		/****** md5 signature: 53a857022e49bb187fdfa58782aa2400 ******/
		%feature("compactdefaultargs") TextureCoordIndex;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
No available documentation.
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
		/****** Vrml_Info::Vrml_Info ******/
		/****** md5 signature: bc877427b2199ce9ff5dfd3729d0383a ******/
		%feature("compactdefaultargs") Vrml_Info;
		%feature("autodoc", "
Parameters
----------
aString: str (optional, default to '<Undefinedinfo>')

Return
-------
None

Description
-----------
No available documentation.
") Vrml_Info;
		 Vrml_Info(TCollection_AsciiString aString = "<Undefinedinfo>");

		/****** Vrml_Info::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_Info::SetString ******/
		/****** md5 signature: 019f64b9292447922865012d29fa7284 ******/
		%feature("compactdefaultargs") SetString;
		%feature("autodoc", "
Parameters
----------
aString: str

Return
-------
None

Description
-----------
No available documentation.
") SetString;
		void SetString(TCollection_AsciiString aString);

		/****** Vrml_Info::String ******/
		/****** md5 signature: eff55c5ebef3b81579f35035613cf230 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
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
		/****** Vrml_Instancing::Vrml_Instancing ******/
		/****** md5 signature: 85b0e9f698136a9dfeb1083c400d74d4 ******/
		%feature("compactdefaultargs") Vrml_Instancing;
		%feature("autodoc", "
Parameters
----------
aString: str

Return
-------
None

Description
-----------
Adds 'DEF <myName>' in anOStream (VRML file).
") Vrml_Instancing;
		 Vrml_Instancing(TCollection_AsciiString aString);

		/****** Vrml_Instancing::DEF ******/
		/****** md5 signature: fe8bfe9657d4f251c355fca5a13dd2a4 ******/
		%feature("compactdefaultargs") DEF;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
Adds 'USE <myName>' in anOStream (VRML file).
") DEF;
		Standard_OStream & DEF(std::ostream &OutValue);

		/****** Vrml_Instancing::USE ******/
		/****** md5 signature: c92fba46c3b0b224b98b48141a9c9704 ******/
		%feature("compactdefaultargs") USE;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") USE;
		Standard_OStream & USE(std::ostream &OutValue);

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
		/****** Vrml_LOD::Vrml_LOD ******/
		/****** md5 signature: 527c528128c1662dea8cf2ce590d955d ******/
		%feature("compactdefaultargs") Vrml_LOD;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Vrml_LOD;
		 Vrml_LOD();

		/****** Vrml_LOD::Vrml_LOD ******/
		/****** md5 signature: 4b4c4e53dc936dc4da1cf579beeea095 ******/
		%feature("compactdefaultargs") Vrml_LOD;
		%feature("autodoc", "
Parameters
----------
aRange: TColStd_HArray1OfReal
aCenter: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Vrml_LOD;
		 Vrml_LOD(const opencascade::handle<TColStd_HArray1OfReal> & aRange, const gp_Vec & aCenter);

		/****** Vrml_LOD::Center ******/
		/****** md5 signature: 61ea9e63ca1b0195aa3037fd3c59632f ******/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") Center;
		gp_Vec Center();

		/****** Vrml_LOD::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_LOD::Range ******/
		/****** md5 signature: 57a24bfc5318522824ced1e0a38f2a9c ******/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
No available documentation.
") Range;
		opencascade::handle<TColStd_HArray1OfReal> Range();

		/****** Vrml_LOD::SetCenter ******/
		/****** md5 signature: a703ddf7cd16de3b4903371c8cb8e217 ******/
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "
Parameters
----------
aCenter: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") SetCenter;
		void SetCenter(const gp_Vec & aCenter);

		/****** Vrml_LOD::SetRange ******/
		/****** md5 signature: cca327cd49dc0d4064c18ded4877a991 ******/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "
Parameters
----------
aRange: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
No available documentation.
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
		/****** Vrml_Material::Vrml_Material ******/
		/****** md5 signature: 41386de85f87fe5bf4e2d20d6a8f1c6e ******/
		%feature("compactdefaultargs") Vrml_Material;
		%feature("autodoc", "
Parameters
----------
aAmbientColor: Quantity_HArray1OfColor
aDiffuseColor: Quantity_HArray1OfColor
aSpecularColor: Quantity_HArray1OfColor
aEmissiveColor: Quantity_HArray1OfColor
aShininess: TColStd_HArray1OfReal
aTransparency: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Vrml_Material;
		 Vrml_Material(const opencascade::handle<Quantity_HArray1OfColor> & aAmbientColor, const opencascade::handle<Quantity_HArray1OfColor> & aDiffuseColor, const opencascade::handle<Quantity_HArray1OfColor> & aSpecularColor, const opencascade::handle<Quantity_HArray1OfColor> & aEmissiveColor, const opencascade::handle<TColStd_HArray1OfReal> & aShininess, const opencascade::handle<TColStd_HArray1OfReal> & aTransparency);

		/****** Vrml_Material::Vrml_Material ******/
		/****** md5 signature: d9815f4a50eda7816ab5f7d8bebf8226 ******/
		%feature("compactdefaultargs") Vrml_Material;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Vrml_Material;
		 Vrml_Material();

		/****** Vrml_Material::AmbientColor ******/
		/****** md5 signature: 3226c6aaa029d908f0a19f0ef7ae8146 ******/
		%feature("compactdefaultargs") AmbientColor;
		%feature("autodoc", "Return
-------
opencascade::handle<Quantity_HArray1OfColor>

Description
-----------
No available documentation.
") AmbientColor;
		opencascade::handle<Quantity_HArray1OfColor> AmbientColor();

		/****** Vrml_Material::DiffuseColor ******/
		/****** md5 signature: 9a0f336a829e617b18f3c31503dfb8ea ******/
		%feature("compactdefaultargs") DiffuseColor;
		%feature("autodoc", "Return
-------
opencascade::handle<Quantity_HArray1OfColor>

Description
-----------
No available documentation.
") DiffuseColor;
		opencascade::handle<Quantity_HArray1OfColor> DiffuseColor();

		/****** Vrml_Material::EmissiveColor ******/
		/****** md5 signature: 9e394b9ab494f6388995f915fe8a986c ******/
		%feature("compactdefaultargs") EmissiveColor;
		%feature("autodoc", "Return
-------
opencascade::handle<Quantity_HArray1OfColor>

Description
-----------
No available documentation.
") EmissiveColor;
		opencascade::handle<Quantity_HArray1OfColor> EmissiveColor();

		/****** Vrml_Material::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_Material::SetAmbientColor ******/
		/****** md5 signature: f93466014d9e96aeee4c9ad7a07a53e1 ******/
		%feature("compactdefaultargs") SetAmbientColor;
		%feature("autodoc", "
Parameters
----------
aAmbientColor: Quantity_HArray1OfColor

Return
-------
None

Description
-----------
No available documentation.
") SetAmbientColor;
		void SetAmbientColor(const opencascade::handle<Quantity_HArray1OfColor> & aAmbientColor);

		/****** Vrml_Material::SetDiffuseColor ******/
		/****** md5 signature: b58b0417da580c3093e1a4c5eb55f047 ******/
		%feature("compactdefaultargs") SetDiffuseColor;
		%feature("autodoc", "
Parameters
----------
aDiffuseColor: Quantity_HArray1OfColor

Return
-------
None

Description
-----------
No available documentation.
") SetDiffuseColor;
		void SetDiffuseColor(const opencascade::handle<Quantity_HArray1OfColor> & aDiffuseColor);

		/****** Vrml_Material::SetEmissiveColor ******/
		/****** md5 signature: 1049295b3e8828295acc427807f9aebb ******/
		%feature("compactdefaultargs") SetEmissiveColor;
		%feature("autodoc", "
Parameters
----------
aEmissiveColor: Quantity_HArray1OfColor

Return
-------
None

Description
-----------
No available documentation.
") SetEmissiveColor;
		void SetEmissiveColor(const opencascade::handle<Quantity_HArray1OfColor> & aEmissiveColor);

		/****** Vrml_Material::SetShininess ******/
		/****** md5 signature: a9cc362cff912b35e471a44f5f9e4e38 ******/
		%feature("compactdefaultargs") SetShininess;
		%feature("autodoc", "
Parameters
----------
aShininess: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
No available documentation.
") SetShininess;
		void SetShininess(const opencascade::handle<TColStd_HArray1OfReal> & aShininess);

		/****** Vrml_Material::SetSpecularColor ******/
		/****** md5 signature: 9e09eab21a59d8060413c7a4b4e52b40 ******/
		%feature("compactdefaultargs") SetSpecularColor;
		%feature("autodoc", "
Parameters
----------
aSpecularColor: Quantity_HArray1OfColor

Return
-------
None

Description
-----------
No available documentation.
") SetSpecularColor;
		void SetSpecularColor(const opencascade::handle<Quantity_HArray1OfColor> & aSpecularColor);

		/****** Vrml_Material::SetTransparency ******/
		/****** md5 signature: 8b7b5431feefe88864e08b782c2ad5be ******/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "
Parameters
----------
aTransparency: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
No available documentation.
") SetTransparency;
		void SetTransparency(const opencascade::handle<TColStd_HArray1OfReal> & aTransparency);

		/****** Vrml_Material::Shininess ******/
		/****** md5 signature: b68e59091e55cd881aeee09d0ffd30bc ******/
		%feature("compactdefaultargs") Shininess;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
No available documentation.
") Shininess;
		opencascade::handle<TColStd_HArray1OfReal> Shininess();

		/****** Vrml_Material::SpecularColor ******/
		/****** md5 signature: 4c15257f24587a43add7e29be02f8e2b ******/
		%feature("compactdefaultargs") SpecularColor;
		%feature("autodoc", "Return
-------
opencascade::handle<Quantity_HArray1OfColor>

Description
-----------
No available documentation.
") SpecularColor;
		opencascade::handle<Quantity_HArray1OfColor> SpecularColor();

		/****** Vrml_Material::Transparency ******/
		/****** md5 signature: 36c921cd19c88a2da51fadf174ca34e7 ******/
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
No available documentation.
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
		/****** Vrml_MaterialBinding::Vrml_MaterialBinding ******/
		/****** md5 signature: 73a64930009b755119c085a6b4fe8bef ******/
		%feature("compactdefaultargs") Vrml_MaterialBinding;
		%feature("autodoc", "
Parameters
----------
aValue: Vrml_MaterialBindingAndNormalBinding

Return
-------
None

Description
-----------
No available documentation.
") Vrml_MaterialBinding;
		 Vrml_MaterialBinding(const Vrml_MaterialBindingAndNormalBinding aValue);

		/****** Vrml_MaterialBinding::Vrml_MaterialBinding ******/
		/****** md5 signature: c38a1cee5f610fa02fe3b8a01389e2d8 ******/
		%feature("compactdefaultargs") Vrml_MaterialBinding;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Vrml_MaterialBinding;
		 Vrml_MaterialBinding();

		/****** Vrml_MaterialBinding::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_MaterialBinding::SetValue ******/
		/****** md5 signature: 9a4a4ae4644775e0ec704e6ef977a484 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
aValue: Vrml_MaterialBindingAndNormalBinding

Return
-------
None

Description
-----------
No available documentation.
") SetValue;
		void SetValue(const Vrml_MaterialBindingAndNormalBinding aValue);

		/****** Vrml_MaterialBinding::Value ******/
		/****** md5 signature: f97d6d2149b81b42de43121fa47dc7ec ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
Vrml_MaterialBindingAndNormalBinding

Description
-----------
No available documentation.
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
		/****** Vrml_MatrixTransform::Vrml_MatrixTransform ******/
		/****** md5 signature: d62bdefabc38c0495ef7e9b0b8b13298 ******/
		%feature("compactdefaultargs") Vrml_MatrixTransform;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Vrml_MatrixTransform;
		 Vrml_MatrixTransform();

		/****** Vrml_MatrixTransform::Vrml_MatrixTransform ******/
		/****** md5 signature: 4d740a8a60a2a9a231ed7ca956114fc8 ******/
		%feature("compactdefaultargs") Vrml_MatrixTransform;
		%feature("autodoc", "
Parameters
----------
aMatrix: gp_Trsf

Return
-------
None

Description
-----------
No available documentation.
") Vrml_MatrixTransform;
		 Vrml_MatrixTransform(const gp_Trsf & aMatrix);

		/****** Vrml_MatrixTransform::Matrix ******/
		/****** md5 signature: ba31cb30d629721c047b11426f2d1516 ******/
		%feature("compactdefaultargs") Matrix;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
No available documentation.
") Matrix;
		gp_Trsf Matrix();

		/****** Vrml_MatrixTransform::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_MatrixTransform::SetMatrix ******/
		/****** md5 signature: f79b6bacc75e1dffe6f1d2919243ae9b ******/
		%feature("compactdefaultargs") SetMatrix;
		%feature("autodoc", "
Parameters
----------
aMatrix: gp_Trsf

Return
-------
None

Description
-----------
No available documentation.
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
		/****** Vrml_Normal::Vrml_Normal ******/
		/****** md5 signature: 81e4f2db16a3850bde40cd7ec23f7b13 ******/
		%feature("compactdefaultargs") Vrml_Normal;
		%feature("autodoc", "
Parameters
----------
aVector: TColgp_HArray1OfVec

Return
-------
None

Description
-----------
No available documentation.
") Vrml_Normal;
		 Vrml_Normal(const opencascade::handle<TColgp_HArray1OfVec> & aVector);

		/****** Vrml_Normal::Vrml_Normal ******/
		/****** md5 signature: aa55807a51549a727bc12f4475aa0b0d ******/
		%feature("compactdefaultargs") Vrml_Normal;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Vrml_Normal;
		 Vrml_Normal();

		/****** Vrml_Normal::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_Normal::SetVector ******/
		/****** md5 signature: f9f05305eac12adb14ed1bccb6cf602b ******/
		%feature("compactdefaultargs") SetVector;
		%feature("autodoc", "
Parameters
----------
aVector: TColgp_HArray1OfVec

Return
-------
None

Description
-----------
No available documentation.
") SetVector;
		void SetVector(const opencascade::handle<TColgp_HArray1OfVec> & aVector);

		/****** Vrml_Normal::Vector ******/
		/****** md5 signature: 65ead4acdd3eb2dbdf731b16908c0648 ******/
		%feature("compactdefaultargs") Vector;
		%feature("autodoc", "Return
-------
opencascade::handle<TColgp_HArray1OfVec>

Description
-----------
No available documentation.
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
		/****** Vrml_NormalBinding::Vrml_NormalBinding ******/
		/****** md5 signature: 9312ad5ebc4690d0962f17b398bec754 ******/
		%feature("compactdefaultargs") Vrml_NormalBinding;
		%feature("autodoc", "
Parameters
----------
aValue: Vrml_MaterialBindingAndNormalBinding

Return
-------
None

Description
-----------
No available documentation.
") Vrml_NormalBinding;
		 Vrml_NormalBinding(const Vrml_MaterialBindingAndNormalBinding aValue);

		/****** Vrml_NormalBinding::Vrml_NormalBinding ******/
		/****** md5 signature: 38167211d67630d3e2b31fe988d84664 ******/
		%feature("compactdefaultargs") Vrml_NormalBinding;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Vrml_NormalBinding;
		 Vrml_NormalBinding();

		/****** Vrml_NormalBinding::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_NormalBinding::SetValue ******/
		/****** md5 signature: 9a4a4ae4644775e0ec704e6ef977a484 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
aValue: Vrml_MaterialBindingAndNormalBinding

Return
-------
None

Description
-----------
No available documentation.
") SetValue;
		void SetValue(const Vrml_MaterialBindingAndNormalBinding aValue);

		/****** Vrml_NormalBinding::Value ******/
		/****** md5 signature: f97d6d2149b81b42de43121fa47dc7ec ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
Vrml_MaterialBindingAndNormalBinding

Description
-----------
No available documentation.
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
		/****** Vrml_OrthographicCamera::Vrml_OrthographicCamera ******/
		/****** md5 signature: f50c0af49a1cdb2ebd71fa92b053d29d ******/
		%feature("compactdefaultargs") Vrml_OrthographicCamera;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Vrml_OrthographicCamera;
		 Vrml_OrthographicCamera();

		/****** Vrml_OrthographicCamera::Vrml_OrthographicCamera ******/
		/****** md5 signature: 3524cf50b0a36fd758e67c57fdda1e72 ******/
		%feature("compactdefaultargs") Vrml_OrthographicCamera;
		%feature("autodoc", "
Parameters
----------
aPosition: gp_Vec
aOrientation: Vrml_SFRotation
aFocalDistance: double
aHeight: double

Return
-------
None

Description
-----------
No available documentation.
") Vrml_OrthographicCamera;
		 Vrml_OrthographicCamera(const gp_Vec & aPosition, const Vrml_SFRotation & aOrientation, const double aFocalDistance, const double aHeight);

		/****** Vrml_OrthographicCamera::FocalDistance ******/
		/****** md5 signature: ba6ab931bcda041bfeca9735ba154857 ******/
		%feature("compactdefaultargs") FocalDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FocalDistance;
		double FocalDistance();

		/****** Vrml_OrthographicCamera::Height ******/
		/****** md5 signature: 5c7d6acffa5c6358c6b35a05de7a5995 ******/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Height;
		double Height();

		/****** Vrml_OrthographicCamera::Orientation ******/
		/****** md5 signature: add97f23d9ae84534aa6ad8eda6b7515 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
Vrml_SFRotation

Description
-----------
No available documentation.
") Orientation;
		Vrml_SFRotation Orientation();

		/****** Vrml_OrthographicCamera::Position ******/
		/****** md5 signature: a90f95f065fb341b64623e06733a2197 ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") Position;
		gp_Vec Position();

		/****** Vrml_OrthographicCamera::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_OrthographicCamera::SetFocalDistance ******/
		/****** md5 signature: 8a578d7c4f516c0903c15e97802def9e ******/
		%feature("compactdefaultargs") SetFocalDistance;
		%feature("autodoc", "
Parameters
----------
aFocalDistance: double

Return
-------
None

Description
-----------
No available documentation.
") SetFocalDistance;
		void SetFocalDistance(const double aFocalDistance);

		/****** Vrml_OrthographicCamera::SetHeight ******/
		/****** md5 signature: 7c13e1b8ec1777da9517ca99bd3e24bd ******/
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "
Parameters
----------
aHeight: double

Return
-------
None

Description
-----------
No available documentation.
") SetHeight;
		void SetHeight(const double aHeight);

		/****** Vrml_OrthographicCamera::SetOrientation ******/
		/****** md5 signature: d695010f9be74c1befe149ca361b0799 ******/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "
Parameters
----------
aOrientation: Vrml_SFRotation

Return
-------
None

Description
-----------
No available documentation.
") SetOrientation;
		void SetOrientation(const Vrml_SFRotation & aOrientation);

		/****** Vrml_OrthographicCamera::SetPosition ******/
		/****** md5 signature: b826dc12ed791ae88239dec84aa8de17 ******/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
aPosition: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
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
		/****** Vrml_PerspectiveCamera::Vrml_PerspectiveCamera ******/
		/****** md5 signature: 6716a15bdd33457c41ccdfdf7b679968 ******/
		%feature("compactdefaultargs") Vrml_PerspectiveCamera;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Vrml_PerspectiveCamera;
		 Vrml_PerspectiveCamera();

		/****** Vrml_PerspectiveCamera::Vrml_PerspectiveCamera ******/
		/****** md5 signature: b5d150e6a936a019e6a87245b632725d ******/
		%feature("compactdefaultargs") Vrml_PerspectiveCamera;
		%feature("autodoc", "
Parameters
----------
aPosition: gp_Vec
aOrientation: Vrml_SFRotation
aFocalDistance: double
aHeightAngle: double

Return
-------
None

Description
-----------
No available documentation.
") Vrml_PerspectiveCamera;
		 Vrml_PerspectiveCamera(const gp_Vec & aPosition, const Vrml_SFRotation & aOrientation, const double aFocalDistance, const double aHeightAngle);

		/****** Vrml_PerspectiveCamera::Angle ******/
		/****** md5 signature: 2b9c11d59a1231fe171f8d4c440fc397 ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Angle;
		double Angle();

		/****** Vrml_PerspectiveCamera::FocalDistance ******/
		/****** md5 signature: ba6ab931bcda041bfeca9735ba154857 ******/
		%feature("compactdefaultargs") FocalDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FocalDistance;
		double FocalDistance();

		/****** Vrml_PerspectiveCamera::Orientation ******/
		/****** md5 signature: add97f23d9ae84534aa6ad8eda6b7515 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
Vrml_SFRotation

Description
-----------
No available documentation.
") Orientation;
		Vrml_SFRotation Orientation();

		/****** Vrml_PerspectiveCamera::Position ******/
		/****** md5 signature: a90f95f065fb341b64623e06733a2197 ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") Position;
		gp_Vec Position();

		/****** Vrml_PerspectiveCamera::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_PerspectiveCamera::SetAngle ******/
		/****** md5 signature: 4b84ba2f96b66a277c9fade54a63c02f ******/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "
Parameters
----------
aHeightAngle: double

Return
-------
None

Description
-----------
No available documentation.
") SetAngle;
		void SetAngle(const double aHeightAngle);

		/****** Vrml_PerspectiveCamera::SetFocalDistance ******/
		/****** md5 signature: 8a578d7c4f516c0903c15e97802def9e ******/
		%feature("compactdefaultargs") SetFocalDistance;
		%feature("autodoc", "
Parameters
----------
aFocalDistance: double

Return
-------
None

Description
-----------
No available documentation.
") SetFocalDistance;
		void SetFocalDistance(const double aFocalDistance);

		/****** Vrml_PerspectiveCamera::SetOrientation ******/
		/****** md5 signature: d695010f9be74c1befe149ca361b0799 ******/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "
Parameters
----------
aOrientation: Vrml_SFRotation

Return
-------
None

Description
-----------
No available documentation.
") SetOrientation;
		void SetOrientation(const Vrml_SFRotation & aOrientation);

		/****** Vrml_PerspectiveCamera::SetPosition ******/
		/****** md5 signature: b826dc12ed791ae88239dec84aa8de17 ******/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
aPosition: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
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
		/****** Vrml_PointLight::Vrml_PointLight ******/
		/****** md5 signature: 10210e4037649d9f1789b4c6500ff542 ******/
		%feature("compactdefaultargs") Vrml_PointLight;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Vrml_PointLight;
		 Vrml_PointLight();

		/****** Vrml_PointLight::Vrml_PointLight ******/
		/****** md5 signature: 701b8144f57a73643bf8340e3d75a41f ******/
		%feature("compactdefaultargs") Vrml_PointLight;
		%feature("autodoc", "
Parameters
----------
aOnOff: bool
aIntensity: double
aColor: Quantity_Color
aLocation: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Vrml_PointLight;
		 Vrml_PointLight(const bool aOnOff, const double aIntensity, const Quantity_Color & aColor, const gp_Vec & aLocation);

		/****** Vrml_PointLight::Color ******/
		/****** md5 signature: b37a2e584a895a08fcf8ead60940b246 ******/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
No available documentation.
") Color;
		Quantity_Color Color();

		/****** Vrml_PointLight::Intensity ******/
		/****** md5 signature: 0efec0be4852a323f220a08b45a10290 ******/
		%feature("compactdefaultargs") Intensity;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Intensity;
		double Intensity();

		/****** Vrml_PointLight::Location ******/
		/****** md5 signature: 0e5541000faade44ea734f501de7a6cf ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") Location;
		gp_Vec Location();

		/****** Vrml_PointLight::OnOff ******/
		/****** md5 signature: 81f9db50648440a668d188bd149dec81 ******/
		%feature("compactdefaultargs") OnOff;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") OnOff;
		bool OnOff();

		/****** Vrml_PointLight::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_PointLight::SetColor ******/
		/****** md5 signature: 5aebf70a123538e7dff670112c56db0d ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
aColor: Quantity_Color

Return
-------
None

Description
-----------
No available documentation.
") SetColor;
		void SetColor(const Quantity_Color & aColor);

		/****** Vrml_PointLight::SetIntensity ******/
		/****** md5 signature: 21a812bfeb21857a4714e2e90fc4b7bd ******/
		%feature("compactdefaultargs") SetIntensity;
		%feature("autodoc", "
Parameters
----------
aIntensity: double

Return
-------
None

Description
-----------
No available documentation.
") SetIntensity;
		void SetIntensity(const double aIntensity);

		/****** Vrml_PointLight::SetLocation ******/
		/****** md5 signature: dd6c082eff758bae985f720fd18c210c ******/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
aLocation: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") SetLocation;
		void SetLocation(const gp_Vec & aLocation);

		/****** Vrml_PointLight::SetOnOff ******/
		/****** md5 signature: 33b5d48da02b5c7bf4f9cc2e05805dbb ******/
		%feature("compactdefaultargs") SetOnOff;
		%feature("autodoc", "
Parameters
----------
aOnOff: bool

Return
-------
None

Description
-----------
No available documentation.
") SetOnOff;
		void SetOnOff(const bool aOnOff);

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
		/****** Vrml_PointSet::Vrml_PointSet ******/
		/****** md5 signature: bacbb80312c0115f0ed88cb993ab5e7e ******/
		%feature("compactdefaultargs") Vrml_PointSet;
		%feature("autodoc", "
Parameters
----------
aStartIndex: int (optional, default to 0)
aNumPoints: int (optional, default to -1)

Return
-------
None

Description
-----------
No available documentation.
") Vrml_PointSet;
		 Vrml_PointSet(const int aStartIndex = 0, const int aNumPoints = -1);

		/****** Vrml_PointSet::NumPoints ******/
		/****** md5 signature: 4de8c8e7e8a2cb1201358cbca48b187a ******/
		%feature("compactdefaultargs") NumPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NumPoints;
		int NumPoints();

		/****** Vrml_PointSet::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_PointSet::SetNumPoints ******/
		/****** md5 signature: e0bffd6a50d73a07a9f2f68f883ce72d ******/
		%feature("compactdefaultargs") SetNumPoints;
		%feature("autodoc", "
Parameters
----------
aNumPoints: int

Return
-------
None

Description
-----------
No available documentation.
") SetNumPoints;
		void SetNumPoints(const int aNumPoints);

		/****** Vrml_PointSet::SetStartIndex ******/
		/****** md5 signature: 0488036ae04b44121ab9f682e058037e ******/
		%feature("compactdefaultargs") SetStartIndex;
		%feature("autodoc", "
Parameters
----------
aStartIndex: int

Return
-------
None

Description
-----------
No available documentation.
") SetStartIndex;
		void SetStartIndex(const int aStartIndex);

		/****** Vrml_PointSet::StartIndex ******/
		/****** md5 signature: a20c0d24039a464cc4144cedf82a7eb6 ******/
		%feature("compactdefaultargs") StartIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") StartIndex;
		int StartIndex();

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
		/****** Vrml_Rotation::Vrml_Rotation ******/
		/****** md5 signature: 722362ae2aa1198d1f32f347404a4d68 ******/
		%feature("compactdefaultargs") Vrml_Rotation;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Vrml_Rotation;
		 Vrml_Rotation();

		/****** Vrml_Rotation::Vrml_Rotation ******/
		/****** md5 signature: 6358665aef7ca1c52898662442da9787 ******/
		%feature("compactdefaultargs") Vrml_Rotation;
		%feature("autodoc", "
Parameters
----------
aRotation: Vrml_SFRotation

Return
-------
None

Description
-----------
No available documentation.
") Vrml_Rotation;
		 Vrml_Rotation(const Vrml_SFRotation & aRotation);

		/****** Vrml_Rotation::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_Rotation::Rotation ******/
		/****** md5 signature: df13dcf1c8ca3c02d862abf4780b0be5 ******/
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "Return
-------
Vrml_SFRotation

Description
-----------
No available documentation.
") Rotation;
		Vrml_SFRotation Rotation();

		/****** Vrml_Rotation::SetRotation ******/
		/****** md5 signature: fcf8c48252e7d25114bede3ddb89b7f0 ******/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "
Parameters
----------
aRotation: Vrml_SFRotation

Return
-------
None

Description
-----------
No available documentation.
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
		/****** Vrml_SFImage::Vrml_SFImage ******/
		/****** md5 signature: b97ca3fe0c250ffa13e698c509dcb39c ******/
		%feature("compactdefaultargs") Vrml_SFImage;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Vrml_SFImage;
		 Vrml_SFImage();

		/****** Vrml_SFImage::Vrml_SFImage ******/
		/****** md5 signature: 7ab0e6ce6d44070b756e6e753a5fa592 ******/
		%feature("compactdefaultargs") Vrml_SFImage;
		%feature("autodoc", "
Parameters
----------
aWidth: int
aHeight: int
aNumber: Vrml_SFImageNumber
anArray: TColStd_HArray1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") Vrml_SFImage;
		 Vrml_SFImage(const int aWidth, const int aHeight, const Vrml_SFImageNumber aNumber, const opencascade::handle<TColStd_HArray1OfInteger> & anArray);

		/****** Vrml_SFImage::Array ******/
		/****** md5 signature: a4ab82958dee4fbf9f0f438d586b2273 ******/
		%feature("compactdefaultargs") Array;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
No available documentation.
") Array;
		opencascade::handle<TColStd_HArray1OfInteger> Array();

		/****** Vrml_SFImage::ArrayFlag ******/
		/****** md5 signature: 10e90dcab40cbe8de94091f89c446b91 ******/
		%feature("compactdefaultargs") ArrayFlag;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") ArrayFlag;
		bool ArrayFlag();

		/****** Vrml_SFImage::Height ******/
		/****** md5 signature: 2b9cd9b3060f676bec8aeb2a26e09d87 ******/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Height;
		int Height();

		/****** Vrml_SFImage::Number ******/
		/****** md5 signature: d32ee14e26e709ba98a99564ce000438 ******/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "Return
-------
Vrml_SFImageNumber

Description
-----------
No available documentation.
") Number;
		Vrml_SFImageNumber Number();

		/****** Vrml_SFImage::SetArray ******/
		/****** md5 signature: acd8cb58c5ac18a10f7b225b62a803c1 ******/
		%feature("compactdefaultargs") SetArray;
		%feature("autodoc", "
Parameters
----------
anArray: TColStd_HArray1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") SetArray;
		void SetArray(const opencascade::handle<TColStd_HArray1OfInteger> & anArray);

		/****** Vrml_SFImage::SetHeight ******/
		/****** md5 signature: 9518bb434f9db6c09008f2ef84317b6e ******/
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "
Parameters
----------
aHeight: int

Return
-------
None

Description
-----------
No available documentation.
") SetHeight;
		void SetHeight(const int aHeight);

		/****** Vrml_SFImage::SetNumber ******/
		/****** md5 signature: dd26cc02b3e32d3b7f733213164e6bae ******/
		%feature("compactdefaultargs") SetNumber;
		%feature("autodoc", "
Parameters
----------
aNumber: Vrml_SFImageNumber

Return
-------
None

Description
-----------
No available documentation.
") SetNumber;
		void SetNumber(const Vrml_SFImageNumber aNumber);

		/****** Vrml_SFImage::SetWidth ******/
		/****** md5 signature: 531ed30a49514c463e6acd562526b78b ******/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "
Parameters
----------
aWidth: int

Return
-------
None

Description
-----------
No available documentation.
") SetWidth;
		void SetWidth(const int aWidth);

		/****** Vrml_SFImage::Width ******/
		/****** md5 signature: a118218c547c36df7228be7a9c032ade ******/
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Width;
		int Width();

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
		/****** Vrml_SFRotation::Vrml_SFRotation ******/
		/****** md5 signature: 4a2d9df949bd8fedbfabdb56f80425a7 ******/
		%feature("compactdefaultargs") Vrml_SFRotation;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Vrml_SFRotation;
		 Vrml_SFRotation();

		/****** Vrml_SFRotation::Vrml_SFRotation ******/
		/****** md5 signature: 1a89e8701821240b390baf19c2a16e97 ******/
		%feature("compactdefaultargs") Vrml_SFRotation;
		%feature("autodoc", "
Parameters
----------
aRotationX: double
aRotationY: double
aRotationZ: double
anAngle: double

Return
-------
None

Description
-----------
No available documentation.
") Vrml_SFRotation;
		 Vrml_SFRotation(const double aRotationX, const double aRotationY, const double aRotationZ, const double anAngle);

		/****** Vrml_SFRotation::Angle ******/
		/****** md5 signature: 2b9c11d59a1231fe171f8d4c440fc397 ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Angle;
		double Angle();

		/****** Vrml_SFRotation::RotationX ******/
		/****** md5 signature: 2003b904ea1b75c8a6cf4a4456f12700 ******/
		%feature("compactdefaultargs") RotationX;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") RotationX;
		double RotationX();

		/****** Vrml_SFRotation::RotationY ******/
		/****** md5 signature: 54948df25b88cb91028a1b06f07d82b0 ******/
		%feature("compactdefaultargs") RotationY;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") RotationY;
		double RotationY();

		/****** Vrml_SFRotation::RotationZ ******/
		/****** md5 signature: 0087dce1f37a241ea3f6c5dedde727a9 ******/
		%feature("compactdefaultargs") RotationZ;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") RotationZ;
		double RotationZ();

		/****** Vrml_SFRotation::SetAngle ******/
		/****** md5 signature: 18f8ccf115a753efce515c140dec2db6 ******/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "
Parameters
----------
anAngle: double

Return
-------
None

Description
-----------
No available documentation.
") SetAngle;
		void SetAngle(const double anAngle);

		/****** Vrml_SFRotation::SetRotationX ******/
		/****** md5 signature: 126735a955258b6584112225265da7de ******/
		%feature("compactdefaultargs") SetRotationX;
		%feature("autodoc", "
Parameters
----------
aRotationX: double

Return
-------
None

Description
-----------
No available documentation.
") SetRotationX;
		void SetRotationX(const double aRotationX);

		/****** Vrml_SFRotation::SetRotationY ******/
		/****** md5 signature: c6b289569b0f2fab54e7eac7e357744d ******/
		%feature("compactdefaultargs") SetRotationY;
		%feature("autodoc", "
Parameters
----------
aRotationY: double

Return
-------
None

Description
-----------
No available documentation.
") SetRotationY;
		void SetRotationY(const double aRotationY);

		/****** Vrml_SFRotation::SetRotationZ ******/
		/****** md5 signature: 746e9d2739af5c1bb3bd8b57641f811a ******/
		%feature("compactdefaultargs") SetRotationZ;
		%feature("autodoc", "
Parameters
----------
aRotationZ: double

Return
-------
None

Description
-----------
No available documentation.
") SetRotationZ;
		void SetRotationZ(const double aRotationZ);

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
		/****** Vrml_Scale::Vrml_Scale ******/
		/****** md5 signature: d9e418559e521acf7162a133f47b05ec ******/
		%feature("compactdefaultargs") Vrml_Scale;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Vrml_Scale;
		 Vrml_Scale();

		/****** Vrml_Scale::Vrml_Scale ******/
		/****** md5 signature: 222440c2122d309ad1f3569ba98fb402 ******/
		%feature("compactdefaultargs") Vrml_Scale;
		%feature("autodoc", "
Parameters
----------
aScaleFactor: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Vrml_Scale;
		 Vrml_Scale(const gp_Vec & aScaleFactor);

		/****** Vrml_Scale::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_Scale::ScaleFactor ******/
		/****** md5 signature: ddee81c1cf7d4715bc12bd5fcf83ddcc ******/
		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") ScaleFactor;
		gp_Vec ScaleFactor();

		/****** Vrml_Scale::SetScaleFactor ******/
		/****** md5 signature: 89338895c96f60f9d732bd6b35f3e81e ******/
		%feature("compactdefaultargs") SetScaleFactor;
		%feature("autodoc", "
Parameters
----------
aScaleFactor: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
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
		/****** Vrml_Separator::Vrml_Separator ******/
		/****** md5 signature: ba0772caacb9071d6022d3cf7bf2d6de ******/
		%feature("compactdefaultargs") Vrml_Separator;
		%feature("autodoc", "
Parameters
----------
aRenderCulling: Vrml_SeparatorRenderCulling

Return
-------
None

Description
-----------
No available documentation.
") Vrml_Separator;
		 Vrml_Separator(const Vrml_SeparatorRenderCulling aRenderCulling);

		/****** Vrml_Separator::Vrml_Separator ******/
		/****** md5 signature: 70f77736b34e0266c9ad206ee4e45233 ******/
		%feature("compactdefaultargs") Vrml_Separator;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Vrml_Separator;
		 Vrml_Separator();

		/****** Vrml_Separator::Print ******/
		/****** md5 signature: a7a6d9b084f11fb866b7f1da61c9ed6a ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_Separator::RenderCulling ******/
		/****** md5 signature: 9c2b5b6ae8ed9c9a82906bd6ee4c0f5c ******/
		%feature("compactdefaultargs") RenderCulling;
		%feature("autodoc", "Return
-------
Vrml_SeparatorRenderCulling

Description
-----------
No available documentation.
") RenderCulling;
		Vrml_SeparatorRenderCulling RenderCulling();

		/****** Vrml_Separator::SetRenderCulling ******/
		/****** md5 signature: feb33785b8752bddc4d3dd0f296fb0b2 ******/
		%feature("compactdefaultargs") SetRenderCulling;
		%feature("autodoc", "
Parameters
----------
aRenderCulling: Vrml_SeparatorRenderCulling

Return
-------
None

Description
-----------
No available documentation.
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
		/****** Vrml_ShapeHints::Vrml_ShapeHints ******/
		/****** md5 signature: 0e24b113cf6695b9a071cfb086bc1696 ******/
		%feature("compactdefaultargs") Vrml_ShapeHints;
		%feature("autodoc", "
Parameters
----------
aVertexOrdering: Vrml_VertexOrdering (optional, default to Vrml_UNKNOWN_ORDERING)
aShapeType: Vrml_ShapeType (optional, default to Vrml_UNKNOWN_SHAPE_TYPE)
aFaceType: Vrml_FaceType (optional, default to Vrml_CONVEX)
aAngle: double (optional, default to 0.5)

Return
-------
None

Description
-----------
No available documentation.
") Vrml_ShapeHints;
		 Vrml_ShapeHints(const Vrml_VertexOrdering aVertexOrdering = Vrml_UNKNOWN_ORDERING, const Vrml_ShapeType aShapeType = Vrml_UNKNOWN_SHAPE_TYPE, const Vrml_FaceType aFaceType = Vrml_CONVEX, const double aAngle = 0.5);

		/****** Vrml_ShapeHints::Angle ******/
		/****** md5 signature: 2b9c11d59a1231fe171f8d4c440fc397 ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Angle;
		double Angle();

		/****** Vrml_ShapeHints::FaceType ******/
		/****** md5 signature: 797e15fa36f5374104546291099739af ******/
		%feature("compactdefaultargs") FaceType;
		%feature("autodoc", "Return
-------
Vrml_FaceType

Description
-----------
No available documentation.
") FaceType;
		Vrml_FaceType FaceType();

		/****** Vrml_ShapeHints::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_ShapeHints::SetAngle ******/
		/****** md5 signature: a18cf69e3e5110e0cc565bf671e960ae ******/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "
Parameters
----------
aAngle: double

Return
-------
None

Description
-----------
No available documentation.
") SetAngle;
		void SetAngle(const double aAngle);

		/****** Vrml_ShapeHints::SetFaceType ******/
		/****** md5 signature: 86e3947cfe6357aa6884b830b05ce939 ******/
		%feature("compactdefaultargs") SetFaceType;
		%feature("autodoc", "
Parameters
----------
aFaceType: Vrml_FaceType

Return
-------
None

Description
-----------
No available documentation.
") SetFaceType;
		void SetFaceType(const Vrml_FaceType aFaceType);

		/****** Vrml_ShapeHints::SetShapeType ******/
		/****** md5 signature: 8ad07cca0c48ecda497d0f812b4dd1e1 ******/
		%feature("compactdefaultargs") SetShapeType;
		%feature("autodoc", "
Parameters
----------
aShapeType: Vrml_ShapeType

Return
-------
None

Description
-----------
No available documentation.
") SetShapeType;
		void SetShapeType(const Vrml_ShapeType aShapeType);

		/****** Vrml_ShapeHints::SetVertexOrdering ******/
		/****** md5 signature: f57cc0ed6b575cec68ba6f9b1c42fdba ******/
		%feature("compactdefaultargs") SetVertexOrdering;
		%feature("autodoc", "
Parameters
----------
aVertexOrdering: Vrml_VertexOrdering

Return
-------
None

Description
-----------
No available documentation.
") SetVertexOrdering;
		void SetVertexOrdering(const Vrml_VertexOrdering aVertexOrdering);

		/****** Vrml_ShapeHints::ShapeType ******/
		/****** md5 signature: 28c1eef43817c6b5e5bd7ff416f1cb26 ******/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Return
-------
Vrml_ShapeType

Description
-----------
No available documentation.
") ShapeType;
		Vrml_ShapeType ShapeType();

		/****** Vrml_ShapeHints::VertexOrdering ******/
		/****** md5 signature: 764667aa72a8973be6d2279ca2edc992 ******/
		%feature("compactdefaultargs") VertexOrdering;
		%feature("autodoc", "Return
-------
Vrml_VertexOrdering

Description
-----------
No available documentation.
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
		/****** Vrml_Sphere::Vrml_Sphere ******/
		/****** md5 signature: 339de21234660f15c9861b7cb8790695 ******/
		%feature("compactdefaultargs") Vrml_Sphere;
		%feature("autodoc", "
Parameters
----------
aRadius: double (optional, default to 1)

Return
-------
None

Description
-----------
No available documentation.
") Vrml_Sphere;
		 Vrml_Sphere(const double aRadius = 1);

		/****** Vrml_Sphere::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_Sphere::Radius ******/
		/****** md5 signature: 3f212b2355d53c03baacfd2fb8e2678a ******/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Radius;
		double Radius();

		/****** Vrml_Sphere::SetRadius ******/
		/****** md5 signature: f0566f0da6f39e1b404c168108c44985 ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
aRadius: double

Return
-------
None

Description
-----------
No available documentation.
") SetRadius;
		void SetRadius(const double aRadius);

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
		/****** Vrml_SpotLight::Vrml_SpotLight ******/
		/****** md5 signature: e8b1bb33090c31894344be04b7effe95 ******/
		%feature("compactdefaultargs") Vrml_SpotLight;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Vrml_SpotLight;
		 Vrml_SpotLight();

		/****** Vrml_SpotLight::Vrml_SpotLight ******/
		/****** md5 signature: f63a6699d50d8b45ee1b470f625764b5 ******/
		%feature("compactdefaultargs") Vrml_SpotLight;
		%feature("autodoc", "
Parameters
----------
aOnOff: bool
aIntensity: double
aColor: Quantity_Color
aLocation: gp_Vec
aDirection: gp_Vec
aDropOffRate: double
aCutOffAngle: double

Return
-------
None

Description
-----------
No available documentation.
") Vrml_SpotLight;
		 Vrml_SpotLight(const bool aOnOff, const double aIntensity, const Quantity_Color & aColor, const gp_Vec & aLocation, const gp_Vec & aDirection, const double aDropOffRate, const double aCutOffAngle);

		/****** Vrml_SpotLight::Color ******/
		/****** md5 signature: b37a2e584a895a08fcf8ead60940b246 ******/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
No available documentation.
") Color;
		Quantity_Color Color();

		/****** Vrml_SpotLight::CutOffAngle ******/
		/****** md5 signature: 3225e5f4c9cddff525adc94b6e9a2e35 ******/
		%feature("compactdefaultargs") CutOffAngle;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") CutOffAngle;
		double CutOffAngle();

		/****** Vrml_SpotLight::Direction ******/
		/****** md5 signature: 36725d4d9370b25778d365a2d983c00e ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") Direction;
		gp_Vec Direction();

		/****** Vrml_SpotLight::DropOffRate ******/
		/****** md5 signature: 939b47c3d9fa01b2fa6c3ea9edd438e8 ******/
		%feature("compactdefaultargs") DropOffRate;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") DropOffRate;
		double DropOffRate();

		/****** Vrml_SpotLight::Intensity ******/
		/****** md5 signature: 0efec0be4852a323f220a08b45a10290 ******/
		%feature("compactdefaultargs") Intensity;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Intensity;
		double Intensity();

		/****** Vrml_SpotLight::Location ******/
		/****** md5 signature: 0e5541000faade44ea734f501de7a6cf ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") Location;
		gp_Vec Location();

		/****** Vrml_SpotLight::OnOff ******/
		/****** md5 signature: 81f9db50648440a668d188bd149dec81 ******/
		%feature("compactdefaultargs") OnOff;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") OnOff;
		bool OnOff();

		/****** Vrml_SpotLight::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_SpotLight::SetColor ******/
		/****** md5 signature: 5aebf70a123538e7dff670112c56db0d ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
aColor: Quantity_Color

Return
-------
None

Description
-----------
No available documentation.
") SetColor;
		void SetColor(const Quantity_Color & aColor);

		/****** Vrml_SpotLight::SetCutOffAngle ******/
		/****** md5 signature: 075746c4ea053fd2ad277b514bfb2fb0 ******/
		%feature("compactdefaultargs") SetCutOffAngle;
		%feature("autodoc", "
Parameters
----------
aCutOffAngle: double

Return
-------
None

Description
-----------
No available documentation.
") SetCutOffAngle;
		void SetCutOffAngle(const double aCutOffAngle);

		/****** Vrml_SpotLight::SetDirection ******/
		/****** md5 signature: 631fcce8229d14261aa80e6545acf64f ******/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "
Parameters
----------
aDirection: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") SetDirection;
		void SetDirection(const gp_Vec & aDirection);

		/****** Vrml_SpotLight::SetDropOffRate ******/
		/****** md5 signature: 687c1982010aa453a5915b407b4de788 ******/
		%feature("compactdefaultargs") SetDropOffRate;
		%feature("autodoc", "
Parameters
----------
aDropOffRate: double

Return
-------
None

Description
-----------
No available documentation.
") SetDropOffRate;
		void SetDropOffRate(const double aDropOffRate);

		/****** Vrml_SpotLight::SetIntensity ******/
		/****** md5 signature: 21a812bfeb21857a4714e2e90fc4b7bd ******/
		%feature("compactdefaultargs") SetIntensity;
		%feature("autodoc", "
Parameters
----------
aIntensity: double

Return
-------
None

Description
-----------
No available documentation.
") SetIntensity;
		void SetIntensity(const double aIntensity);

		/****** Vrml_SpotLight::SetLocation ******/
		/****** md5 signature: dd6c082eff758bae985f720fd18c210c ******/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
aLocation: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") SetLocation;
		void SetLocation(const gp_Vec & aLocation);

		/****** Vrml_SpotLight::SetOnOff ******/
		/****** md5 signature: 5b1d304015bba141bf840fc264620cd5 ******/
		%feature("compactdefaultargs") SetOnOff;
		%feature("autodoc", "
Parameters
----------
anOnOff: bool

Return
-------
None

Description
-----------
No available documentation.
") SetOnOff;
		void SetOnOff(const bool anOnOff);

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
		/****** Vrml_Switch::Vrml_Switch ******/
		/****** md5 signature: b4f6a292d8be5a9a34e7ae924fc1f090 ******/
		%feature("compactdefaultargs") Vrml_Switch;
		%feature("autodoc", "
Parameters
----------
aWhichChild: int (optional, default to -1)

Return
-------
None

Description
-----------
No available documentation.
") Vrml_Switch;
		 Vrml_Switch(const int aWhichChild = -1);

		/****** Vrml_Switch::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_Switch::SetWhichChild ******/
		/****** md5 signature: 0e1070cb4a327d7989df05e61deb565b ******/
		%feature("compactdefaultargs") SetWhichChild;
		%feature("autodoc", "
Parameters
----------
aWhichChild: int

Return
-------
None

Description
-----------
No available documentation.
") SetWhichChild;
		void SetWhichChild(const int aWhichChild);

		/****** Vrml_Switch::WhichChild ******/
		/****** md5 signature: 4efc2e6e0430c9be8a81a991adaf8941 ******/
		%feature("compactdefaultargs") WhichChild;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") WhichChild;
		int WhichChild();

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
		/****** Vrml_Texture2::Vrml_Texture2 ******/
		/****** md5 signature: b88858ed9502d4d714d22762b8ffe5d7 ******/
		%feature("compactdefaultargs") Vrml_Texture2;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Vrml_Texture2;
		 Vrml_Texture2();

		/****** Vrml_Texture2::Vrml_Texture2 ******/
		/****** md5 signature: 74b3330be268cc0ed9008cc0c03d7303 ******/
		%feature("compactdefaultargs") Vrml_Texture2;
		%feature("autodoc", "
Parameters
----------
aFilename: str
aImage: Vrml_SFImage
aWrapS: Vrml_Texture2Wrap
aWrapT: Vrml_Texture2Wrap

Return
-------
None

Description
-----------
No available documentation.
") Vrml_Texture2;
		 Vrml_Texture2(TCollection_AsciiString aFilename, const opencascade::handle<Vrml_SFImage> & aImage, const Vrml_Texture2Wrap aWrapS, const Vrml_Texture2Wrap aWrapT);

		/****** Vrml_Texture2::Filename ******/
		/****** md5 signature: 403f67c4638b8a808f68c91981c71440 ******/
		%feature("compactdefaultargs") Filename;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") Filename;
		TCollection_AsciiString Filename();

		/****** Vrml_Texture2::Image ******/
		/****** md5 signature: 80d0c2423e6826002c17c316d53d0b4a ******/
		%feature("compactdefaultargs") Image;
		%feature("autodoc", "Return
-------
opencascade::handle<Vrml_SFImage>

Description
-----------
No available documentation.
") Image;
		opencascade::handle<Vrml_SFImage> Image();

		/****** Vrml_Texture2::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_Texture2::SetFilename ******/
		/****** md5 signature: 6a233cc8b98d909eb32820cdf5db7e12 ******/
		%feature("compactdefaultargs") SetFilename;
		%feature("autodoc", "
Parameters
----------
aFilename: str

Return
-------
None

Description
-----------
No available documentation.
") SetFilename;
		void SetFilename(TCollection_AsciiString aFilename);

		/****** Vrml_Texture2::SetImage ******/
		/****** md5 signature: a9ae445e8b68c9036584f2fb4a7fd9f5 ******/
		%feature("compactdefaultargs") SetImage;
		%feature("autodoc", "
Parameters
----------
aImage: Vrml_SFImage

Return
-------
None

Description
-----------
No available documentation.
") SetImage;
		void SetImage(const opencascade::handle<Vrml_SFImage> & aImage);

		/****** Vrml_Texture2::SetWrapS ******/
		/****** md5 signature: ce0ce8998f021ecb2825d745daee5287 ******/
		%feature("compactdefaultargs") SetWrapS;
		%feature("autodoc", "
Parameters
----------
aWrapS: Vrml_Texture2Wrap

Return
-------
None

Description
-----------
No available documentation.
") SetWrapS;
		void SetWrapS(const Vrml_Texture2Wrap aWrapS);

		/****** Vrml_Texture2::SetWrapT ******/
		/****** md5 signature: be34905d7f08892853b0591d909845c7 ******/
		%feature("compactdefaultargs") SetWrapT;
		%feature("autodoc", "
Parameters
----------
aWrapT: Vrml_Texture2Wrap

Return
-------
None

Description
-----------
No available documentation.
") SetWrapT;
		void SetWrapT(const Vrml_Texture2Wrap aWrapT);

		/****** Vrml_Texture2::WrapS ******/
		/****** md5 signature: 7241e89c90bfb8685862873b2c815c1a ******/
		%feature("compactdefaultargs") WrapS;
		%feature("autodoc", "Return
-------
Vrml_Texture2Wrap

Description
-----------
No available documentation.
") WrapS;
		Vrml_Texture2Wrap WrapS();

		/****** Vrml_Texture2::WrapT ******/
		/****** md5 signature: f6a520c171ef88399fccc3604e2082a3 ******/
		%feature("compactdefaultargs") WrapT;
		%feature("autodoc", "Return
-------
Vrml_Texture2Wrap

Description
-----------
No available documentation.
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
		/****** Vrml_Texture2Transform::Vrml_Texture2Transform ******/
		/****** md5 signature: 1531e2e7d521a3b24bd3e7badd786618 ******/
		%feature("compactdefaultargs") Vrml_Texture2Transform;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Vrml_Texture2Transform;
		 Vrml_Texture2Transform();

		/****** Vrml_Texture2Transform::Vrml_Texture2Transform ******/
		/****** md5 signature: b3a6c60f8fdfca9e42dc4ac1b9a403ed ******/
		%feature("compactdefaultargs") Vrml_Texture2Transform;
		%feature("autodoc", "
Parameters
----------
aTranslation: gp_Vec2d
aRotation: double
aScaleFactor: gp_Vec2d
aCenter: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") Vrml_Texture2Transform;
		 Vrml_Texture2Transform(const gp_Vec2d & aTranslation, const double aRotation, const gp_Vec2d & aScaleFactor, const gp_Vec2d & aCenter);

		/****** Vrml_Texture2Transform::Center ******/
		/****** md5 signature: 254292cd89f895c357202578f32a5e7f ******/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Center;
		gp_Vec2d Center();

		/****** Vrml_Texture2Transform::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_Texture2Transform::Rotation ******/
		/****** md5 signature: b831d6eec89eb60018e13fa21a13171c ******/
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Rotation;
		double Rotation();

		/****** Vrml_Texture2Transform::ScaleFactor ******/
		/****** md5 signature: 06b1407f24f2bc56b40ebf2462970ffb ******/
		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") ScaleFactor;
		gp_Vec2d ScaleFactor();

		/****** Vrml_Texture2Transform::SetCenter ******/
		/****** md5 signature: 1293df907f77bfc212b3ba9a33ff36e7 ******/
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "
Parameters
----------
aCenter: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") SetCenter;
		void SetCenter(const gp_Vec2d & aCenter);

		/****** Vrml_Texture2Transform::SetRotation ******/
		/****** md5 signature: 28f1f7996ff57c8a9599e3a03d91a452 ******/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "
Parameters
----------
aRotation: double

Return
-------
None

Description
-----------
No available documentation.
") SetRotation;
		void SetRotation(const double aRotation);

		/****** Vrml_Texture2Transform::SetScaleFactor ******/
		/****** md5 signature: 8f2e685abe4915cee4e0f95d778cdd33 ******/
		%feature("compactdefaultargs") SetScaleFactor;
		%feature("autodoc", "
Parameters
----------
aScaleFactor: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") SetScaleFactor;
		void SetScaleFactor(const gp_Vec2d & aScaleFactor);

		/****** Vrml_Texture2Transform::SetTranslation ******/
		/****** md5 signature: 27ee36e7e39f15d2760e9aa9d20b02f6 ******/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "
Parameters
----------
aTranslation: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") SetTranslation;
		void SetTranslation(const gp_Vec2d & aTranslation);

		/****** Vrml_Texture2Transform::Translation ******/
		/****** md5 signature: 6d365b0aba4cd1d8134023b4cb40fa46 ******/
		%feature("compactdefaultargs") Translation;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
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
		/****** Vrml_TextureCoordinate2::Vrml_TextureCoordinate2 ******/
		/****** md5 signature: dd3a1d00ff469b3b045c41add7955ca0 ******/
		%feature("compactdefaultargs") Vrml_TextureCoordinate2;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Vrml_TextureCoordinate2;
		 Vrml_TextureCoordinate2();

		/****** Vrml_TextureCoordinate2::Vrml_TextureCoordinate2 ******/
		/****** md5 signature: 3d86802658ff15c628d3f227bd5bef34 ******/
		%feature("compactdefaultargs") Vrml_TextureCoordinate2;
		%feature("autodoc", "
Parameters
----------
aPoint: TColgp_HArray1OfVec2d

Return
-------
None

Description
-----------
No available documentation.
") Vrml_TextureCoordinate2;
		 Vrml_TextureCoordinate2(const opencascade::handle<TColgp_HArray1OfVec2d> & aPoint);

		/****** Vrml_TextureCoordinate2::Point ******/
		/****** md5 signature: 2b602943fa63d8973525f80ec05f22b7 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
opencascade::handle<TColgp_HArray1OfVec2d>

Description
-----------
No available documentation.
") Point;
		opencascade::handle<TColgp_HArray1OfVec2d> Point();

		/****** Vrml_TextureCoordinate2::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_TextureCoordinate2::SetPoint ******/
		/****** md5 signature: d9672d14aee0e472aa3d9ec771220fb6 ******/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "
Parameters
----------
aPoint: TColgp_HArray1OfVec2d

Return
-------
None

Description
-----------
No available documentation.
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
		/****** Vrml_Transform::Vrml_Transform ******/
		/****** md5 signature: 162f4b001926c53db828af0f93ec726e ******/
		%feature("compactdefaultargs") Vrml_Transform;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Vrml_Transform;
		 Vrml_Transform();

		/****** Vrml_Transform::Vrml_Transform ******/
		/****** md5 signature: 1958724dd030c21f3d5b26b056a42e29 ******/
		%feature("compactdefaultargs") Vrml_Transform;
		%feature("autodoc", "
Parameters
----------
aTranslation: gp_Vec
aRotation: Vrml_SFRotation
aScaleFactor: gp_Vec
aScaleOrientation: Vrml_SFRotation
aCenter: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Vrml_Transform;
		 Vrml_Transform(const gp_Vec & aTranslation, const Vrml_SFRotation & aRotation, const gp_Vec & aScaleFactor, const Vrml_SFRotation & aScaleOrientation, const gp_Vec & aCenter);

		/****** Vrml_Transform::Center ******/
		/****** md5 signature: 61ea9e63ca1b0195aa3037fd3c59632f ******/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") Center;
		gp_Vec Center();

		/****** Vrml_Transform::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_Transform::Rotation ******/
		/****** md5 signature: df13dcf1c8ca3c02d862abf4780b0be5 ******/
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "Return
-------
Vrml_SFRotation

Description
-----------
No available documentation.
") Rotation;
		Vrml_SFRotation Rotation();

		/****** Vrml_Transform::ScaleFactor ******/
		/****** md5 signature: ddee81c1cf7d4715bc12bd5fcf83ddcc ******/
		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") ScaleFactor;
		gp_Vec ScaleFactor();

		/****** Vrml_Transform::ScaleOrientation ******/
		/****** md5 signature: 458b4ae4df2a0ff913e67a873e40c728 ******/
		%feature("compactdefaultargs") ScaleOrientation;
		%feature("autodoc", "Return
-------
Vrml_SFRotation

Description
-----------
No available documentation.
") ScaleOrientation;
		Vrml_SFRotation ScaleOrientation();

		/****** Vrml_Transform::SetCenter ******/
		/****** md5 signature: a703ddf7cd16de3b4903371c8cb8e217 ******/
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "
Parameters
----------
aCenter: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") SetCenter;
		void SetCenter(const gp_Vec & aCenter);

		/****** Vrml_Transform::SetRotation ******/
		/****** md5 signature: fcf8c48252e7d25114bede3ddb89b7f0 ******/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "
Parameters
----------
aRotation: Vrml_SFRotation

Return
-------
None

Description
-----------
No available documentation.
") SetRotation;
		void SetRotation(const Vrml_SFRotation & aRotation);

		/****** Vrml_Transform::SetScaleFactor ******/
		/****** md5 signature: 89338895c96f60f9d732bd6b35f3e81e ******/
		%feature("compactdefaultargs") SetScaleFactor;
		%feature("autodoc", "
Parameters
----------
aScaleFactor: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") SetScaleFactor;
		void SetScaleFactor(const gp_Vec & aScaleFactor);

		/****** Vrml_Transform::SetScaleOrientation ******/
		/****** md5 signature: d5adf7f610887711c5812899faf36ad2 ******/
		%feature("compactdefaultargs") SetScaleOrientation;
		%feature("autodoc", "
Parameters
----------
aScaleOrientation: Vrml_SFRotation

Return
-------
None

Description
-----------
No available documentation.
") SetScaleOrientation;
		void SetScaleOrientation(const Vrml_SFRotation & aScaleOrientation);

		/****** Vrml_Transform::SetTranslation ******/
		/****** md5 signature: 1646e68b1d3f51460ff79d25f8092903 ******/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "
Parameters
----------
aTranslation: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") SetTranslation;
		void SetTranslation(const gp_Vec & aTranslation);

		/****** Vrml_Transform::Translation ******/
		/****** md5 signature: 1b9eaca0408443cfce0acd48c9a13edd ******/
		%feature("compactdefaultargs") Translation;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
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
		/****** Vrml_TransformSeparator::Vrml_TransformSeparator ******/
		/****** md5 signature: 6e328dc0e2f0dbdfa0c711c1c3924a6f ******/
		%feature("compactdefaultargs") Vrml_TransformSeparator;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Vrml_TransformSeparator;
		 Vrml_TransformSeparator();

		/****** Vrml_TransformSeparator::Print ******/
		/****** md5 signature: a7a6d9b084f11fb866b7f1da61c9ed6a ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

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
		/****** Vrml_Translation::Vrml_Translation ******/
		/****** md5 signature: 74221cc6631cfbb95b9f9a31926178e4 ******/
		%feature("compactdefaultargs") Vrml_Translation;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Vrml_Translation;
		 Vrml_Translation();

		/****** Vrml_Translation::Vrml_Translation ******/
		/****** md5 signature: 8870281dcaecbf101c7d86facd00a589 ******/
		%feature("compactdefaultargs") Vrml_Translation;
		%feature("autodoc", "
Parameters
----------
aTranslation: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Vrml_Translation;
		 Vrml_Translation(const gp_Vec & aTranslation);

		/****** Vrml_Translation::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_Translation::SetTranslation ******/
		/****** md5 signature: 1646e68b1d3f51460ff79d25f8092903 ******/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "
Parameters
----------
aTranslation: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") SetTranslation;
		void SetTranslation(const gp_Vec & aTranslation);

		/****** Vrml_Translation::Translation ******/
		/****** md5 signature: 1b9eaca0408443cfce0acd48c9a13edd ******/
		%feature("compactdefaultargs") Translation;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
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
		/****** Vrml_WWWAnchor::Vrml_WWWAnchor ******/
		/****** md5 signature: c462349c96d43cf7d5b75f58b59cd3ba ******/
		%feature("compactdefaultargs") Vrml_WWWAnchor;
		%feature("autodoc", "
Parameters
----------
aName: str (optional, default to "")
aDescription: str (optional, default to "")
aMap: Vrml_WWWAnchorMap (optional, default to Vrml_MAP_NONE)

Return
-------
None

Description
-----------
No available documentation.
") Vrml_WWWAnchor;
		 Vrml_WWWAnchor(TCollection_AsciiString aName = "", TCollection_AsciiString aDescription = "", const Vrml_WWWAnchorMap aMap = Vrml_MAP_NONE);

		/****** Vrml_WWWAnchor::Description ******/
		/****** md5 signature: b46267417d65ffb9a243344287317012 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") Description;
		TCollection_AsciiString Description();

		/****** Vrml_WWWAnchor::Map ******/
		/****** md5 signature: 30615bb64cdcbc46359830ff7d42fab6 ******/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "Return
-------
Vrml_WWWAnchorMap

Description
-----------
No available documentation.
") Map;
		Vrml_WWWAnchorMap Map();

		/****** Vrml_WWWAnchor::Name ******/
		/****** md5 signature: 4ede994349b8ea032efece942c57861d ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") Name;
		TCollection_AsciiString Name();

		/****** Vrml_WWWAnchor::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_WWWAnchor::SetDescription ******/
		/****** md5 signature: 24d19d040b0a10c936dfd6335381c7d8 ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
aDescription: str

Return
-------
None

Description
-----------
No available documentation.
") SetDescription;
		void SetDescription(TCollection_AsciiString aDescription);

		/****** Vrml_WWWAnchor::SetMap ******/
		/****** md5 signature: a39b8d7582c6facd13d1ca3c9a1bc659 ******/
		%feature("compactdefaultargs") SetMap;
		%feature("autodoc", "
Parameters
----------
aMap: Vrml_WWWAnchorMap

Return
-------
None

Description
-----------
No available documentation.
") SetMap;
		void SetMap(const Vrml_WWWAnchorMap aMap);

		/****** Vrml_WWWAnchor::SetName ******/
		/****** md5 signature: 3521bb701d54e60914d11a5ea23f03c3 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: str

Return
-------
None

Description
-----------
No available documentation.
") SetName;
		void SetName(TCollection_AsciiString aName);

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
		/****** Vrml_WWWInline::Vrml_WWWInline ******/
		/****** md5 signature: dac06a08d14367a068fb4f0f4f01edcd ******/
		%feature("compactdefaultargs") Vrml_WWWInline;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Vrml_WWWInline;
		 Vrml_WWWInline();

		/****** Vrml_WWWInline::Vrml_WWWInline ******/
		/****** md5 signature: bcc26a2e2cab6617dcbd7b02897d8c77 ******/
		%feature("compactdefaultargs") Vrml_WWWInline;
		%feature("autodoc", "
Parameters
----------
aName: str
aBboxSize: gp_Vec
aBboxCenter: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Vrml_WWWInline;
		 Vrml_WWWInline(TCollection_AsciiString aName, const gp_Vec & aBboxSize, const gp_Vec & aBboxCenter);

		/****** Vrml_WWWInline::BboxCenter ******/
		/****** md5 signature: 96c51f966aa30678cff38b2dd51e12fd ******/
		%feature("compactdefaultargs") BboxCenter;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") BboxCenter;
		gp_Vec BboxCenter();

		/****** Vrml_WWWInline::BboxSize ******/
		/****** md5 signature: 8b1c0289d06d7d8684875beb8317841d ******/
		%feature("compactdefaultargs") BboxSize;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") BboxSize;
		gp_Vec BboxSize();

		/****** Vrml_WWWInline::Name ******/
		/****** md5 signature: 4ede994349b8ea032efece942c57861d ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") Name;
		TCollection_AsciiString Name();

		/****** Vrml_WWWInline::Print ******/
		/****** md5 signature: fb65164879bb8268c90b67d68359a682 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Print;
		Standard_OStream & Print(std::ostream &OutValue);

		/****** Vrml_WWWInline::SetBboxCenter ******/
		/****** md5 signature: 75eefe6a1bfe942ba05eca3afdd6a9bf ******/
		%feature("compactdefaultargs") SetBboxCenter;
		%feature("autodoc", "
Parameters
----------
aBboxCenter: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") SetBboxCenter;
		void SetBboxCenter(const gp_Vec & aBboxCenter);

		/****** Vrml_WWWInline::SetBboxSize ******/
		/****** md5 signature: 5251c867816c19e5b0a1c82e4077912d ******/
		%feature("compactdefaultargs") SetBboxSize;
		%feature("autodoc", "
Parameters
----------
aBboxSize: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") SetBboxSize;
		void SetBboxSize(const gp_Vec & aBboxSize);

		/****** Vrml_WWWInline::SetName ******/
		/****** md5 signature: 3521bb701d54e60914d11a5ea23f03c3 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: str

Return
-------
None

Description
-----------
No available documentation.
") SetName;
		void SetName(TCollection_AsciiString aName);

};


%extend Vrml_WWWInline {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def vrml_CommentWriter(*args):
	return vrml.CommentWriter(*args)

@deprecated
def vrml_VrmlHeaderWriter(*args):
	return vrml.VrmlHeaderWriter(*args)

}
