/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_Vrml.html"
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

%rename(vrml) Vrml;
class Vrml {
	public:
		%feature("compactdefaultargs") CommentWriter;
		%feature("autodoc", "	:param aComment:
	:type aComment: char *
	:param anOStream:
	:type anOStream: Standard_OStream &
	:rtype: Standard_OStream
") CommentWriter;
		static Standard_OStream & CommentWriter (const char * aComment,Standard_OStream & anOStream);

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
%nodefaultctor Vrml_AsciiText;
class Vrml_AsciiText : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Justification;
		%feature("autodoc", "	:rtype: Vrml_AsciiTextJustification
") Justification;
		Vrml_AsciiTextJustification Justification ();

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") SetJustification;
		%feature("autodoc", "	:param aJustification:
	:type aJustification: Vrml_AsciiTextJustification
	:rtype: None
") SetJustification;
		void SetJustification (const Vrml_AsciiTextJustification aJustification);
		%feature("compactdefaultargs") SetSpacing;
		%feature("autodoc", "	:param aSpacing:
	:type aSpacing: float
	:rtype: None
") SetSpacing;
		void SetSpacing (const Standard_Real aSpacing);
		%feature("compactdefaultargs") SetString;
		%feature("autodoc", "	:param aString:
	:type aString: opencascade::handle<TColStd_HArray1OfAsciiString> &
	:rtype: None
") SetString;
		void SetString (const opencascade::handle<TColStd_HArray1OfAsciiString> & aString);
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "	:param aWidth:
	:type aWidth: float
	:rtype: None
") SetWidth;
		void SetWidth (const Standard_Real aWidth);
		%feature("compactdefaultargs") Spacing;
		%feature("autodoc", "	:rtype: float
") Spacing;
		Standard_Real Spacing ();
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	:rtype: opencascade::handle<TColStd_HArray1OfAsciiString>
") String;
		opencascade::handle<TColStd_HArray1OfAsciiString> String ();
		%feature("compactdefaultargs") Vrml_AsciiText;
		%feature("autodoc", "	:rtype: None
") Vrml_AsciiText;
		 Vrml_AsciiText ();
		%feature("compactdefaultargs") Vrml_AsciiText;
		%feature("autodoc", "	:param aString:
	:type aString: opencascade::handle<TColStd_HArray1OfAsciiString> &
	:param aSpacing:
	:type aSpacing: float
	:param aJustification:
	:type aJustification: Vrml_AsciiTextJustification
	:param aWidth:
	:type aWidth: float
	:rtype: None
") Vrml_AsciiText;
		 Vrml_AsciiText (const opencascade::handle<TColStd_HArray1OfAsciiString> & aString,const Standard_Real aSpacing,const Vrml_AsciiTextJustification aJustification,const Standard_Real aWidth);
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "	:rtype: float
") Width;
		Standard_Real Width ();
};


%make_alias(Vrml_AsciiText)

%extend Vrml_AsciiText {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_Cone;
class Vrml_Cone {
	public:
		%feature("compactdefaultargs") BottomRadius;
		%feature("autodoc", "	:rtype: float
") BottomRadius;
		Standard_Real BottomRadius ();
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "	:rtype: float
") Height;
		Standard_Real Height ();
		%feature("compactdefaultargs") Parts;
		%feature("autodoc", "	:rtype: Vrml_ConeParts
") Parts;
		Vrml_ConeParts Parts ();

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") SetBottomRadius;
		%feature("autodoc", "	:param aBottomRadius:
	:type aBottomRadius: float
	:rtype: None
") SetBottomRadius;
		void SetBottomRadius (const Standard_Real aBottomRadius);
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "	:param aHeight:
	:type aHeight: float
	:rtype: None
") SetHeight;
		void SetHeight (const Standard_Real aHeight);
		%feature("compactdefaultargs") SetParts;
		%feature("autodoc", "	:param aParts:
	:type aParts: Vrml_ConeParts
	:rtype: None
") SetParts;
		void SetParts (const Vrml_ConeParts aParts);
		%feature("compactdefaultargs") Vrml_Cone;
		%feature("autodoc", "	:param aParts: default value is Vrml_ConeALL
	:type aParts: Vrml_ConeParts
	:param aBottomRadius: default value is 1
	:type aBottomRadius: float
	:param aHeight: default value is 2
	:type aHeight: float
	:rtype: None
") Vrml_Cone;
		 Vrml_Cone (const Vrml_ConeParts aParts = Vrml_ConeALL,const Standard_Real aBottomRadius = 1,const Standard_Real aHeight = 2);
};


%extend Vrml_Cone {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_Coordinate3;
class Vrml_Coordinate3 : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:rtype: opencascade::handle<TColgp_HArray1OfVec>
") Point;
		opencascade::handle<TColgp_HArray1OfVec> Point ();

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "	:param aPoint:
	:type aPoint: opencascade::handle<TColgp_HArray1OfVec>
	:rtype: None
") SetPoint;
		void SetPoint (const opencascade::handle<TColgp_HArray1OfVec> & aPoint);
		%feature("compactdefaultargs") Vrml_Coordinate3;
		%feature("autodoc", "	:param aPoint:
	:type aPoint: opencascade::handle<TColgp_HArray1OfVec>
	:rtype: None
") Vrml_Coordinate3;
		 Vrml_Coordinate3 (const opencascade::handle<TColgp_HArray1OfVec> & aPoint);
		%feature("compactdefaultargs") Vrml_Coordinate3;
		%feature("autodoc", "	:rtype: None
") Vrml_Coordinate3;
		 Vrml_Coordinate3 ();
};


%make_alias(Vrml_Coordinate3)

%extend Vrml_Coordinate3 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_Cube;
class Vrml_Cube {
	public:
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "	:rtype: float
") Depth;
		Standard_Real Depth ();
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "	:rtype: float
") Height;
		Standard_Real Height ();

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") SetDepth;
		%feature("autodoc", "	:param aDepth:
	:type aDepth: float
	:rtype: None
") SetDepth;
		void SetDepth (const Standard_Real aDepth);
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "	:param aHeight:
	:type aHeight: float
	:rtype: None
") SetHeight;
		void SetHeight (const Standard_Real aHeight);
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "	:param aWidth:
	:type aWidth: float
	:rtype: None
") SetWidth;
		void SetWidth (const Standard_Real aWidth);
		%feature("compactdefaultargs") Vrml_Cube;
		%feature("autodoc", "	:param aWidth: default value is 2
	:type aWidth: float
	:param aHeight: default value is 2
	:type aHeight: float
	:param aDepth: default value is 2
	:type aDepth: float
	:rtype: None
") Vrml_Cube;
		 Vrml_Cube (const Standard_Real aWidth = 2,const Standard_Real aHeight = 2,const Standard_Real aDepth = 2);
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "	:rtype: float
") Width;
		Standard_Real Width ();
};


%extend Vrml_Cube {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_Cylinder;
class Vrml_Cylinder {
	public:
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "	:rtype: float
") Height;
		Standard_Real Height ();
		%feature("compactdefaultargs") Parts;
		%feature("autodoc", "	:rtype: Vrml_CylinderParts
") Parts;
		Vrml_CylinderParts Parts ();

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "	:rtype: float
") Radius;
		Standard_Real Radius ();
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "	:param aHeight:
	:type aHeight: float
	:rtype: None
") SetHeight;
		void SetHeight (const Standard_Real aHeight);
		%feature("compactdefaultargs") SetParts;
		%feature("autodoc", "	:param aParts:
	:type aParts: Vrml_CylinderParts
	:rtype: None
") SetParts;
		void SetParts (const Vrml_CylinderParts aParts);
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "	:param aRadius:
	:type aRadius: float
	:rtype: None
") SetRadius;
		void SetRadius (const Standard_Real aRadius);
		%feature("compactdefaultargs") Vrml_Cylinder;
		%feature("autodoc", "	:param aParts: default value is Vrml_CylinderALL
	:type aParts: Vrml_CylinderParts
	:param aRadius: default value is 1
	:type aRadius: float
	:param aHeight: default value is 2
	:type aHeight: float
	:rtype: None
") Vrml_Cylinder;
		 Vrml_Cylinder (const Vrml_CylinderParts aParts = Vrml_CylinderALL,const Standard_Real aRadius = 1,const Standard_Real aHeight = 2);
};


%extend Vrml_Cylinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_DirectionalLight;
class Vrml_DirectionalLight {
	public:
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	:rtype: Quantity_Color
") Color;
		Quantity_Color Color ();
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "	:rtype: gp_Vec
") Direction;
		gp_Vec Direction ();
		%feature("compactdefaultargs") Intensity;
		%feature("autodoc", "	:rtype: float
") Intensity;
		Standard_Real Intensity ();
		%feature("compactdefaultargs") OnOff;
		%feature("autodoc", "	:rtype: bool
") OnOff;
		Standard_Boolean OnOff ();

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & aColor);
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "	:param aDirection:
	:type aDirection: gp_Vec
	:rtype: None
") SetDirection;
		void SetDirection (const gp_Vec & aDirection);
		%feature("compactdefaultargs") SetIntensity;
		%feature("autodoc", "	:param aIntensity:
	:type aIntensity: float
	:rtype: None
") SetIntensity;
		void SetIntensity (const Standard_Real aIntensity);
		%feature("compactdefaultargs") SetOnOff;
		%feature("autodoc", "	:param aOnOff:
	:type aOnOff: bool
	:rtype: None
") SetOnOff;
		void SetOnOff (const Standard_Boolean aOnOff);
		%feature("compactdefaultargs") Vrml_DirectionalLight;
		%feature("autodoc", "	:rtype: None
") Vrml_DirectionalLight;
		 Vrml_DirectionalLight ();
		%feature("compactdefaultargs") Vrml_DirectionalLight;
		%feature("autodoc", "	:param aOnOff:
	:type aOnOff: bool
	:param aIntensity:
	:type aIntensity: float
	:param aColor:
	:type aColor: Quantity_Color &
	:param aDirection:
	:type aDirection: gp_Vec
	:rtype: None
") Vrml_DirectionalLight;
		 Vrml_DirectionalLight (const Standard_Boolean aOnOff,const Standard_Real aIntensity,const Quantity_Color & aColor,const gp_Vec & aDirection);
};


%extend Vrml_DirectionalLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_FontStyle;
class Vrml_FontStyle {
	public:
		%feature("compactdefaultargs") Family;
		%feature("autodoc", "	:rtype: Vrml_FontStyleFamily
") Family;
		Vrml_FontStyleFamily Family ();

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") SetFamily;
		%feature("autodoc", "	:param aFamily:
	:type aFamily: Vrml_FontStyleFamily
	:rtype: None
") SetFamily;
		void SetFamily (const Vrml_FontStyleFamily aFamily);
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "	:param aSize:
	:type aSize: float
	:rtype: None
") SetSize;
		void SetSize (const Standard_Real aSize);
		%feature("compactdefaultargs") SetStyle;
		%feature("autodoc", "	:param aStyle:
	:type aStyle: Vrml_FontStyleStyle
	:rtype: None
") SetStyle;
		void SetStyle (const Vrml_FontStyleStyle aStyle);
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "	:rtype: float
") Size;
		Standard_Real Size ();
		%feature("compactdefaultargs") Style;
		%feature("autodoc", "	:rtype: Vrml_FontStyleStyle
") Style;
		Vrml_FontStyleStyle Style ();
		%feature("compactdefaultargs") Vrml_FontStyle;
		%feature("autodoc", "	:param aSize: default value is 10
	:type aSize: float
	:param aFamily: default value is Vrml_SERIF
	:type aFamily: Vrml_FontStyleFamily
	:param aStyle: default value is Vrml_NONE
	:type aStyle: Vrml_FontStyleStyle
	:rtype: None
") Vrml_FontStyle;
		 Vrml_FontStyle (const Standard_Real aSize = 10,const Vrml_FontStyleFamily aFamily = Vrml_SERIF,const Vrml_FontStyleStyle aStyle = Vrml_NONE);
};


%extend Vrml_FontStyle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_Group;
class Vrml_Group {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Vrml_Group;
		%feature("autodoc", "	:rtype: None
") Vrml_Group;
		 Vrml_Group ();
};


%extend Vrml_Group {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_IndexedFaceSet;
class Vrml_IndexedFaceSet : public Standard_Transient {
	public:
		%feature("compactdefaultargs") CoordIndex;
		%feature("autodoc", "	:rtype: opencascade::handle<TColStd_HArray1OfInteger>
") CoordIndex;
		opencascade::handle<TColStd_HArray1OfInteger> CoordIndex ();
		%feature("compactdefaultargs") MaterialIndex;
		%feature("autodoc", "	:rtype: opencascade::handle<TColStd_HArray1OfInteger>
") MaterialIndex;
		opencascade::handle<TColStd_HArray1OfInteger> MaterialIndex ();
		%feature("compactdefaultargs") NormalIndex;
		%feature("autodoc", "	:rtype: opencascade::handle<TColStd_HArray1OfInteger>
") NormalIndex;
		opencascade::handle<TColStd_HArray1OfInteger> NormalIndex ();

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") SetCoordIndex;
		%feature("autodoc", "	:param aCoordIndex:
	:type aCoordIndex: opencascade::handle<TColStd_HArray1OfInteger> &
	:rtype: None
") SetCoordIndex;
		void SetCoordIndex (const opencascade::handle<TColStd_HArray1OfInteger> & aCoordIndex);
		%feature("compactdefaultargs") SetMaterialIndex;
		%feature("autodoc", "	:param aMaterialIndex:
	:type aMaterialIndex: opencascade::handle<TColStd_HArray1OfInteger> &
	:rtype: None
") SetMaterialIndex;
		void SetMaterialIndex (const opencascade::handle<TColStd_HArray1OfInteger> & aMaterialIndex);
		%feature("compactdefaultargs") SetNormalIndex;
		%feature("autodoc", "	:param aNormalIndex:
	:type aNormalIndex: opencascade::handle<TColStd_HArray1OfInteger> &
	:rtype: None
") SetNormalIndex;
		void SetNormalIndex (const opencascade::handle<TColStd_HArray1OfInteger> & aNormalIndex);
		%feature("compactdefaultargs") SetTextureCoordIndex;
		%feature("autodoc", "	:param aTextureCoordIndex:
	:type aTextureCoordIndex: opencascade::handle<TColStd_HArray1OfInteger> &
	:rtype: None
") SetTextureCoordIndex;
		void SetTextureCoordIndex (const opencascade::handle<TColStd_HArray1OfInteger> & aTextureCoordIndex);
		%feature("compactdefaultargs") TextureCoordIndex;
		%feature("autodoc", "	:rtype: opencascade::handle<TColStd_HArray1OfInteger>
") TextureCoordIndex;
		opencascade::handle<TColStd_HArray1OfInteger> TextureCoordIndex ();
		%feature("compactdefaultargs") Vrml_IndexedFaceSet;
		%feature("autodoc", "	:param aCoordIndex:
	:type aCoordIndex: opencascade::handle<TColStd_HArray1OfInteger> &
	:param aMaterialIndex:
	:type aMaterialIndex: opencascade::handle<TColStd_HArray1OfInteger> &
	:param aNormalIndex:
	:type aNormalIndex: opencascade::handle<TColStd_HArray1OfInteger> &
	:param aTextureCoordIndex:
	:type aTextureCoordIndex: opencascade::handle<TColStd_HArray1OfInteger> &
	:rtype: None
") Vrml_IndexedFaceSet;
		 Vrml_IndexedFaceSet (const opencascade::handle<TColStd_HArray1OfInteger> & aCoordIndex,const opencascade::handle<TColStd_HArray1OfInteger> & aMaterialIndex,const opencascade::handle<TColStd_HArray1OfInteger> & aNormalIndex,const opencascade::handle<TColStd_HArray1OfInteger> & aTextureCoordIndex);
		%feature("compactdefaultargs") Vrml_IndexedFaceSet;
		%feature("autodoc", "	:rtype: None
") Vrml_IndexedFaceSet;
		 Vrml_IndexedFaceSet ();
};


%make_alias(Vrml_IndexedFaceSet)

%extend Vrml_IndexedFaceSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_IndexedLineSet;
class Vrml_IndexedLineSet : public Standard_Transient {
	public:
		%feature("compactdefaultargs") CoordIndex;
		%feature("autodoc", "	:rtype: opencascade::handle<TColStd_HArray1OfInteger>
") CoordIndex;
		opencascade::handle<TColStd_HArray1OfInteger> CoordIndex ();
		%feature("compactdefaultargs") MaterialIndex;
		%feature("autodoc", "	:rtype: opencascade::handle<TColStd_HArray1OfInteger>
") MaterialIndex;
		opencascade::handle<TColStd_HArray1OfInteger> MaterialIndex ();
		%feature("compactdefaultargs") NormalIndex;
		%feature("autodoc", "	:rtype: opencascade::handle<TColStd_HArray1OfInteger>
") NormalIndex;
		opencascade::handle<TColStd_HArray1OfInteger> NormalIndex ();

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") SetCoordIndex;
		%feature("autodoc", "	:param aCoordIndex:
	:type aCoordIndex: opencascade::handle<TColStd_HArray1OfInteger> &
	:rtype: None
") SetCoordIndex;
		void SetCoordIndex (const opencascade::handle<TColStd_HArray1OfInteger> & aCoordIndex);
		%feature("compactdefaultargs") SetMaterialIndex;
		%feature("autodoc", "	:param aMaterialIndex:
	:type aMaterialIndex: opencascade::handle<TColStd_HArray1OfInteger> &
	:rtype: None
") SetMaterialIndex;
		void SetMaterialIndex (const opencascade::handle<TColStd_HArray1OfInteger> & aMaterialIndex);
		%feature("compactdefaultargs") SetNormalIndex;
		%feature("autodoc", "	:param aNormalIndex:
	:type aNormalIndex: opencascade::handle<TColStd_HArray1OfInteger> &
	:rtype: None
") SetNormalIndex;
		void SetNormalIndex (const opencascade::handle<TColStd_HArray1OfInteger> & aNormalIndex);
		%feature("compactdefaultargs") SetTextureCoordIndex;
		%feature("autodoc", "	:param aTextureCoordIndex:
	:type aTextureCoordIndex: opencascade::handle<TColStd_HArray1OfInteger> &
	:rtype: None
") SetTextureCoordIndex;
		void SetTextureCoordIndex (const opencascade::handle<TColStd_HArray1OfInteger> & aTextureCoordIndex);
		%feature("compactdefaultargs") TextureCoordIndex;
		%feature("autodoc", "	:rtype: opencascade::handle<TColStd_HArray1OfInteger>
") TextureCoordIndex;
		opencascade::handle<TColStd_HArray1OfInteger> TextureCoordIndex ();
		%feature("compactdefaultargs") Vrml_IndexedLineSet;
		%feature("autodoc", "	:param aCoordIndex:
	:type aCoordIndex: opencascade::handle<TColStd_HArray1OfInteger> &
	:param aMaterialIndex:
	:type aMaterialIndex: opencascade::handle<TColStd_HArray1OfInteger> &
	:param aNormalIndex:
	:type aNormalIndex: opencascade::handle<TColStd_HArray1OfInteger> &
	:param aTextureCoordIndex:
	:type aTextureCoordIndex: opencascade::handle<TColStd_HArray1OfInteger> &
	:rtype: None
") Vrml_IndexedLineSet;
		 Vrml_IndexedLineSet (const opencascade::handle<TColStd_HArray1OfInteger> & aCoordIndex,const opencascade::handle<TColStd_HArray1OfInteger> & aMaterialIndex,const opencascade::handle<TColStd_HArray1OfInteger> & aNormalIndex,const opencascade::handle<TColStd_HArray1OfInteger> & aTextureCoordIndex);
		%feature("compactdefaultargs") Vrml_IndexedLineSet;
		%feature("autodoc", "	:rtype: None
") Vrml_IndexedLineSet;
		 Vrml_IndexedLineSet ();
};


%make_alias(Vrml_IndexedLineSet)

%extend Vrml_IndexedLineSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_Info;
class Vrml_Info {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") SetString;
		%feature("autodoc", "	:param aString:
	:type aString: TCollection_AsciiString &
	:rtype: None
") SetString;
		void SetString (const TCollection_AsciiString & aString);
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
		%feature("compactdefaultargs") Vrml_Info;
		%feature("autodoc", "	:param aString: default value is '<Undefinedinfo>'
	:type aString: TCollection_AsciiString &
	:rtype: None
") Vrml_Info;
		 Vrml_Info (const TCollection_AsciiString & aString = "<Undefinedinfo>");
};


%extend Vrml_Info {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_Instancing;
class Vrml_Instancing {
	public:

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
        		%feature("compactdefaultargs") Vrml_Instancing;
		%feature("autodoc", "	* Adds 'DEF <myName>' in anOStream (VRML file).

	:param aString:
	:type aString: TCollection_AsciiString &
	:rtype: None
") Vrml_Instancing;
		 Vrml_Instancing (const TCollection_AsciiString & aString);
};


%extend Vrml_Instancing {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_LOD;
class Vrml_LOD : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "	:rtype: gp_Vec
") Center;
		gp_Vec Center ();

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Range;
		%feature("autodoc", "	:rtype: opencascade::handle<TColStd_HArray1OfReal>
") Range;
		opencascade::handle<TColStd_HArray1OfReal> Range ();
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "	:param aCenter:
	:type aCenter: gp_Vec
	:rtype: None
") SetCenter;
		void SetCenter (const gp_Vec & aCenter);
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "	:param aRange:
	:type aRange: opencascade::handle<TColStd_HArray1OfReal> &
	:rtype: None
") SetRange;
		void SetRange (const opencascade::handle<TColStd_HArray1OfReal> & aRange);
		%feature("compactdefaultargs") Vrml_LOD;
		%feature("autodoc", "	:rtype: None
") Vrml_LOD;
		 Vrml_LOD ();
		%feature("compactdefaultargs") Vrml_LOD;
		%feature("autodoc", "	:param aRange:
	:type aRange: opencascade::handle<TColStd_HArray1OfReal> &
	:param aCenter:
	:type aCenter: gp_Vec
	:rtype: None
") Vrml_LOD;
		 Vrml_LOD (const opencascade::handle<TColStd_HArray1OfReal> & aRange,const gp_Vec & aCenter);
};


%make_alias(Vrml_LOD)

%extend Vrml_LOD {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_Material;
class Vrml_Material : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AmbientColor;
		%feature("autodoc", "	:rtype: opencascade::handle<Quantity_HArray1OfColor>
") AmbientColor;
		opencascade::handle<Quantity_HArray1OfColor> AmbientColor ();
		%feature("compactdefaultargs") DiffuseColor;
		%feature("autodoc", "	:rtype: opencascade::handle<Quantity_HArray1OfColor>
") DiffuseColor;
		opencascade::handle<Quantity_HArray1OfColor> DiffuseColor ();
		%feature("compactdefaultargs") EmissiveColor;
		%feature("autodoc", "	:rtype: opencascade::handle<Quantity_HArray1OfColor>
") EmissiveColor;
		opencascade::handle<Quantity_HArray1OfColor> EmissiveColor ();

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") SetAmbientColor;
		%feature("autodoc", "	:param aAmbientColor:
	:type aAmbientColor: opencascade::handle<Quantity_HArray1OfColor> &
	:rtype: None
") SetAmbientColor;
		void SetAmbientColor (const opencascade::handle<Quantity_HArray1OfColor> & aAmbientColor);
		%feature("compactdefaultargs") SetDiffuseColor;
		%feature("autodoc", "	:param aDiffuseColor:
	:type aDiffuseColor: opencascade::handle<Quantity_HArray1OfColor> &
	:rtype: None
") SetDiffuseColor;
		void SetDiffuseColor (const opencascade::handle<Quantity_HArray1OfColor> & aDiffuseColor);
		%feature("compactdefaultargs") SetEmissiveColor;
		%feature("autodoc", "	:param aEmissiveColor:
	:type aEmissiveColor: opencascade::handle<Quantity_HArray1OfColor> &
	:rtype: None
") SetEmissiveColor;
		void SetEmissiveColor (const opencascade::handle<Quantity_HArray1OfColor> & aEmissiveColor);
		%feature("compactdefaultargs") SetShininess;
		%feature("autodoc", "	:param aShininess:
	:type aShininess: opencascade::handle<TColStd_HArray1OfReal> &
	:rtype: None
") SetShininess;
		void SetShininess (const opencascade::handle<TColStd_HArray1OfReal> & aShininess);
		%feature("compactdefaultargs") SetSpecularColor;
		%feature("autodoc", "	:param aSpecularColor:
	:type aSpecularColor: opencascade::handle<Quantity_HArray1OfColor> &
	:rtype: None
") SetSpecularColor;
		void SetSpecularColor (const opencascade::handle<Quantity_HArray1OfColor> & aSpecularColor);
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "	:param aTransparency:
	:type aTransparency: opencascade::handle<TColStd_HArray1OfReal> &
	:rtype: None
") SetTransparency;
		void SetTransparency (const opencascade::handle<TColStd_HArray1OfReal> & aTransparency);
		%feature("compactdefaultargs") Shininess;
		%feature("autodoc", "	:rtype: opencascade::handle<TColStd_HArray1OfReal>
") Shininess;
		opencascade::handle<TColStd_HArray1OfReal> Shininess ();
		%feature("compactdefaultargs") SpecularColor;
		%feature("autodoc", "	:rtype: opencascade::handle<Quantity_HArray1OfColor>
") SpecularColor;
		opencascade::handle<Quantity_HArray1OfColor> SpecularColor ();
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "	:rtype: opencascade::handle<TColStd_HArray1OfReal>
") Transparency;
		opencascade::handle<TColStd_HArray1OfReal> Transparency ();
		%feature("compactdefaultargs") Vrml_Material;
		%feature("autodoc", "	:param aAmbientColor:
	:type aAmbientColor: opencascade::handle<Quantity_HArray1OfColor> &
	:param aDiffuseColor:
	:type aDiffuseColor: opencascade::handle<Quantity_HArray1OfColor> &
	:param aSpecularColor:
	:type aSpecularColor: opencascade::handle<Quantity_HArray1OfColor> &
	:param aEmissiveColor:
	:type aEmissiveColor: opencascade::handle<Quantity_HArray1OfColor> &
	:param aShininess:
	:type aShininess: opencascade::handle<TColStd_HArray1OfReal> &
	:param aTransparency:
	:type aTransparency: opencascade::handle<TColStd_HArray1OfReal> &
	:rtype: None
") Vrml_Material;
		 Vrml_Material (const opencascade::handle<Quantity_HArray1OfColor> & aAmbientColor,const opencascade::handle<Quantity_HArray1OfColor> & aDiffuseColor,const opencascade::handle<Quantity_HArray1OfColor> & aSpecularColor,const opencascade::handle<Quantity_HArray1OfColor> & aEmissiveColor,const opencascade::handle<TColStd_HArray1OfReal> & aShininess,const opencascade::handle<TColStd_HArray1OfReal> & aTransparency);
		%feature("compactdefaultargs") Vrml_Material;
		%feature("autodoc", "	:rtype: None
") Vrml_Material;
		 Vrml_Material ();
};


%make_alias(Vrml_Material)

%extend Vrml_Material {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_MaterialBinding;
class Vrml_MaterialBinding {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param aValue:
	:type aValue: Vrml_MaterialBindingAndNormalBinding
	:rtype: None
") SetValue;
		void SetValue (const Vrml_MaterialBindingAndNormalBinding aValue);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Vrml_MaterialBindingAndNormalBinding
") Value;
		Vrml_MaterialBindingAndNormalBinding Value ();
		%feature("compactdefaultargs") Vrml_MaterialBinding;
		%feature("autodoc", "	:param aValue:
	:type aValue: Vrml_MaterialBindingAndNormalBinding
	:rtype: None
") Vrml_MaterialBinding;
		 Vrml_MaterialBinding (const Vrml_MaterialBindingAndNormalBinding aValue);
		%feature("compactdefaultargs") Vrml_MaterialBinding;
		%feature("autodoc", "	:rtype: None
") Vrml_MaterialBinding;
		 Vrml_MaterialBinding ();
};


%extend Vrml_MaterialBinding {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_MatrixTransform;
class Vrml_MatrixTransform {
	public:
		%feature("compactdefaultargs") Matrix;
		%feature("autodoc", "	:rtype: gp_Trsf
") Matrix;
		gp_Trsf Matrix ();

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") SetMatrix;
		%feature("autodoc", "	:param aMatrix:
	:type aMatrix: gp_Trsf
	:rtype: None
") SetMatrix;
		void SetMatrix (const gp_Trsf & aMatrix);
		%feature("compactdefaultargs") Vrml_MatrixTransform;
		%feature("autodoc", "	:rtype: None
") Vrml_MatrixTransform;
		 Vrml_MatrixTransform ();
		%feature("compactdefaultargs") Vrml_MatrixTransform;
		%feature("autodoc", "	:param aMatrix:
	:type aMatrix: gp_Trsf
	:rtype: None
") Vrml_MatrixTransform;
		 Vrml_MatrixTransform (const gp_Trsf & aMatrix);
};


%extend Vrml_MatrixTransform {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_Normal;
class Vrml_Normal : public Standard_Transient {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") SetVector;
		%feature("autodoc", "	:param aVector:
	:type aVector: opencascade::handle<TColgp_HArray1OfVec>
	:rtype: None
") SetVector;
		void SetVector (const opencascade::handle<TColgp_HArray1OfVec> & aVector);
		%feature("compactdefaultargs") Vector;
		%feature("autodoc", "	:rtype: opencascade::handle<TColgp_HArray1OfVec>
") Vector;
		opencascade::handle<TColgp_HArray1OfVec> Vector ();
		%feature("compactdefaultargs") Vrml_Normal;
		%feature("autodoc", "	:param aVector:
	:type aVector: opencascade::handle<TColgp_HArray1OfVec>
	:rtype: None
") Vrml_Normal;
		 Vrml_Normal (const opencascade::handle<TColgp_HArray1OfVec> & aVector);
		%feature("compactdefaultargs") Vrml_Normal;
		%feature("autodoc", "	:rtype: None
") Vrml_Normal;
		 Vrml_Normal ();
};


%make_alias(Vrml_Normal)

%extend Vrml_Normal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_NormalBinding;
class Vrml_NormalBinding {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param aValue:
	:type aValue: Vrml_MaterialBindingAndNormalBinding
	:rtype: None
") SetValue;
		void SetValue (const Vrml_MaterialBindingAndNormalBinding aValue);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Vrml_MaterialBindingAndNormalBinding
") Value;
		Vrml_MaterialBindingAndNormalBinding Value ();
		%feature("compactdefaultargs") Vrml_NormalBinding;
		%feature("autodoc", "	:param aValue:
	:type aValue: Vrml_MaterialBindingAndNormalBinding
	:rtype: None
") Vrml_NormalBinding;
		 Vrml_NormalBinding (const Vrml_MaterialBindingAndNormalBinding aValue);
		%feature("compactdefaultargs") Vrml_NormalBinding;
		%feature("autodoc", "	:rtype: None
") Vrml_NormalBinding;
		 Vrml_NormalBinding ();
};


%extend Vrml_NormalBinding {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_OrthographicCamera;
class Vrml_OrthographicCamera {
	public:
		%feature("compactdefaultargs") FocalDistance;
		%feature("autodoc", "	:rtype: float
") FocalDistance;
		Standard_Real FocalDistance ();
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "	:rtype: float
") Height;
		Standard_Real Height ();
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:rtype: Vrml_SFRotation
") Orientation;
		Vrml_SFRotation Orientation ();
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	:rtype: gp_Vec
") Position;
		gp_Vec Position ();

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") SetFocalDistance;
		%feature("autodoc", "	:param aFocalDistance:
	:type aFocalDistance: float
	:rtype: None
") SetFocalDistance;
		void SetFocalDistance (const Standard_Real aFocalDistance);
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "	:param aHeight:
	:type aHeight: float
	:rtype: None
") SetHeight;
		void SetHeight (const Standard_Real aHeight);
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "	:param aOrientation:
	:type aOrientation: Vrml_SFRotation &
	:rtype: None
") SetOrientation;
		void SetOrientation (const Vrml_SFRotation & aOrientation);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	:param aPosition:
	:type aPosition: gp_Vec
	:rtype: None
") SetPosition;
		void SetPosition (const gp_Vec & aPosition);
		%feature("compactdefaultargs") Vrml_OrthographicCamera;
		%feature("autodoc", "	:rtype: None
") Vrml_OrthographicCamera;
		 Vrml_OrthographicCamera ();
		%feature("compactdefaultargs") Vrml_OrthographicCamera;
		%feature("autodoc", "	:param aPosition:
	:type aPosition: gp_Vec
	:param aOrientation:
	:type aOrientation: Vrml_SFRotation &
	:param aFocalDistance:
	:type aFocalDistance: float
	:param aHeight:
	:type aHeight: float
	:rtype: None
") Vrml_OrthographicCamera;
		 Vrml_OrthographicCamera (const gp_Vec & aPosition,const Vrml_SFRotation & aOrientation,const Standard_Real aFocalDistance,const Standard_Real aHeight);
};


%extend Vrml_OrthographicCamera {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_PerspectiveCamera;
class Vrml_PerspectiveCamera {
	public:
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	:rtype: float
") Angle;
		Standard_Real Angle ();
		%feature("compactdefaultargs") FocalDistance;
		%feature("autodoc", "	:rtype: float
") FocalDistance;
		Standard_Real FocalDistance ();
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:rtype: Vrml_SFRotation
") Orientation;
		Vrml_SFRotation Orientation ();
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	:rtype: gp_Vec
") Position;
		gp_Vec Position ();

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "	:param aHeightAngle:
	:type aHeightAngle: float
	:rtype: None
") SetAngle;
		void SetAngle (const Standard_Real aHeightAngle);
		%feature("compactdefaultargs") SetFocalDistance;
		%feature("autodoc", "	:param aFocalDistance:
	:type aFocalDistance: float
	:rtype: None
") SetFocalDistance;
		void SetFocalDistance (const Standard_Real aFocalDistance);
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "	:param aOrientation:
	:type aOrientation: Vrml_SFRotation &
	:rtype: None
") SetOrientation;
		void SetOrientation (const Vrml_SFRotation & aOrientation);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	:param aPosition:
	:type aPosition: gp_Vec
	:rtype: None
") SetPosition;
		void SetPosition (const gp_Vec & aPosition);
		%feature("compactdefaultargs") Vrml_PerspectiveCamera;
		%feature("autodoc", "	:rtype: None
") Vrml_PerspectiveCamera;
		 Vrml_PerspectiveCamera ();
		%feature("compactdefaultargs") Vrml_PerspectiveCamera;
		%feature("autodoc", "	:param aPosition:
	:type aPosition: gp_Vec
	:param aOrientation:
	:type aOrientation: Vrml_SFRotation &
	:param aFocalDistance:
	:type aFocalDistance: float
	:param aHeightAngle:
	:type aHeightAngle: float
	:rtype: None
") Vrml_PerspectiveCamera;
		 Vrml_PerspectiveCamera (const gp_Vec & aPosition,const Vrml_SFRotation & aOrientation,const Standard_Real aFocalDistance,const Standard_Real aHeightAngle);
};


%extend Vrml_PerspectiveCamera {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_PointLight;
class Vrml_PointLight {
	public:
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	:rtype: Quantity_Color
") Color;
		Quantity_Color Color ();
		%feature("compactdefaultargs") Intensity;
		%feature("autodoc", "	:rtype: float
") Intensity;
		Standard_Real Intensity ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	:rtype: gp_Vec
") Location;
		gp_Vec Location ();
		%feature("compactdefaultargs") OnOff;
		%feature("autodoc", "	:rtype: bool
") OnOff;
		Standard_Boolean OnOff ();

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & aColor);
		%feature("compactdefaultargs") SetIntensity;
		%feature("autodoc", "	:param aIntensity:
	:type aIntensity: float
	:rtype: None
") SetIntensity;
		void SetIntensity (const Standard_Real aIntensity);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	:param aLocation:
	:type aLocation: gp_Vec
	:rtype: None
") SetLocation;
		void SetLocation (const gp_Vec & aLocation);
		%feature("compactdefaultargs") SetOnOff;
		%feature("autodoc", "	:param aOnOff:
	:type aOnOff: bool
	:rtype: None
") SetOnOff;
		void SetOnOff (const Standard_Boolean aOnOff);
		%feature("compactdefaultargs") Vrml_PointLight;
		%feature("autodoc", "	:rtype: None
") Vrml_PointLight;
		 Vrml_PointLight ();
		%feature("compactdefaultargs") Vrml_PointLight;
		%feature("autodoc", "	:param aOnOff:
	:type aOnOff: bool
	:param aIntensity:
	:type aIntensity: float
	:param aColor:
	:type aColor: Quantity_Color &
	:param aLocation:
	:type aLocation: gp_Vec
	:rtype: None
") Vrml_PointLight;
		 Vrml_PointLight (const Standard_Boolean aOnOff,const Standard_Real aIntensity,const Quantity_Color & aColor,const gp_Vec & aLocation);
};


%extend Vrml_PointLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_PointSet;
class Vrml_PointSet {
	public:
		%feature("compactdefaultargs") NumPoints;
		%feature("autodoc", "	:rtype: int
") NumPoints;
		Standard_Integer NumPoints ();

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") SetNumPoints;
		%feature("autodoc", "	:param aNumPoints:
	:type aNumPoints: int
	:rtype: None
") SetNumPoints;
		void SetNumPoints (const Standard_Integer aNumPoints);
		%feature("compactdefaultargs") SetStartIndex;
		%feature("autodoc", "	:param aStartIndex:
	:type aStartIndex: int
	:rtype: None
") SetStartIndex;
		void SetStartIndex (const Standard_Integer aStartIndex);
		%feature("compactdefaultargs") StartIndex;
		%feature("autodoc", "	:rtype: int
") StartIndex;
		Standard_Integer StartIndex ();
		%feature("compactdefaultargs") Vrml_PointSet;
		%feature("autodoc", "	:param aStartIndex: default value is 0
	:type aStartIndex: int
	:param aNumPoints: default value is -1
	:type aNumPoints: int
	:rtype: None
") Vrml_PointSet;
		 Vrml_PointSet (const Standard_Integer aStartIndex = 0,const Standard_Integer aNumPoints = -1);
};


%extend Vrml_PointSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_Rotation;
class Vrml_Rotation {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "	:rtype: Vrml_SFRotation
") Rotation;
		Vrml_SFRotation Rotation ();
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "	:param aRotation:
	:type aRotation: Vrml_SFRotation &
	:rtype: None
") SetRotation;
		void SetRotation (const Vrml_SFRotation & aRotation);
		%feature("compactdefaultargs") Vrml_Rotation;
		%feature("autodoc", "	:rtype: None
") Vrml_Rotation;
		 Vrml_Rotation ();
		%feature("compactdefaultargs") Vrml_Rotation;
		%feature("autodoc", "	:param aRotation:
	:type aRotation: Vrml_SFRotation &
	:rtype: None
") Vrml_Rotation;
		 Vrml_Rotation (const Vrml_SFRotation & aRotation);
};


%extend Vrml_Rotation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_SFImage;
class Vrml_SFImage : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Array;
		%feature("autodoc", "	:rtype: opencascade::handle<TColStd_HArray1OfInteger>
") Array;
		opencascade::handle<TColStd_HArray1OfInteger> Array ();
		%feature("compactdefaultargs") ArrayFlag;
		%feature("autodoc", "	:rtype: bool
") ArrayFlag;
		Standard_Boolean ArrayFlag ();
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "	:rtype: int
") Height;
		Standard_Integer Height ();
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "	:rtype: Vrml_SFImageNumber
") Number;
		Vrml_SFImageNumber Number ();
		%feature("compactdefaultargs") SetArray;
		%feature("autodoc", "	:param anArray:
	:type anArray: opencascade::handle<TColStd_HArray1OfInteger> &
	:rtype: None
") SetArray;
		void SetArray (const opencascade::handle<TColStd_HArray1OfInteger> & anArray);
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "	:param aHeight:
	:type aHeight: int
	:rtype: None
") SetHeight;
		void SetHeight (const Standard_Integer aHeight);
		%feature("compactdefaultargs") SetNumber;
		%feature("autodoc", "	:param aNumber:
	:type aNumber: Vrml_SFImageNumber
	:rtype: None
") SetNumber;
		void SetNumber (const Vrml_SFImageNumber aNumber);
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "	:param aWidth:
	:type aWidth: int
	:rtype: None
") SetWidth;
		void SetWidth (const Standard_Integer aWidth);
		%feature("compactdefaultargs") Vrml_SFImage;
		%feature("autodoc", "	:rtype: None
") Vrml_SFImage;
		 Vrml_SFImage ();
		%feature("compactdefaultargs") Vrml_SFImage;
		%feature("autodoc", "	:param aWidth:
	:type aWidth: int
	:param aHeight:
	:type aHeight: int
	:param aNumber:
	:type aNumber: Vrml_SFImageNumber
	:param anArray:
	:type anArray: opencascade::handle<TColStd_HArray1OfInteger> &
	:rtype: None
") Vrml_SFImage;
		 Vrml_SFImage (const Standard_Integer aWidth,const Standard_Integer aHeight,const Vrml_SFImageNumber aNumber,const opencascade::handle<TColStd_HArray1OfInteger> & anArray);
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "	:rtype: int
") Width;
		Standard_Integer Width ();
};


%make_alias(Vrml_SFImage)

%extend Vrml_SFImage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_SFRotation;
class Vrml_SFRotation {
	public:
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	:rtype: float
") Angle;
		Standard_Real Angle ();
		%feature("compactdefaultargs") RotationX;
		%feature("autodoc", "	:rtype: float
") RotationX;
		Standard_Real RotationX ();
		%feature("compactdefaultargs") RotationY;
		%feature("autodoc", "	:rtype: float
") RotationY;
		Standard_Real RotationY ();
		%feature("compactdefaultargs") RotationZ;
		%feature("autodoc", "	:rtype: float
") RotationZ;
		Standard_Real RotationZ ();
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "	:param anAngle:
	:type anAngle: float
	:rtype: None
") SetAngle;
		void SetAngle (const Standard_Real anAngle);
		%feature("compactdefaultargs") SetRotationX;
		%feature("autodoc", "	:param aRotationX:
	:type aRotationX: float
	:rtype: None
") SetRotationX;
		void SetRotationX (const Standard_Real aRotationX);
		%feature("compactdefaultargs") SetRotationY;
		%feature("autodoc", "	:param aRotationY:
	:type aRotationY: float
	:rtype: None
") SetRotationY;
		void SetRotationY (const Standard_Real aRotationY);
		%feature("compactdefaultargs") SetRotationZ;
		%feature("autodoc", "	:param aRotationZ:
	:type aRotationZ: float
	:rtype: None
") SetRotationZ;
		void SetRotationZ (const Standard_Real aRotationZ);
		%feature("compactdefaultargs") Vrml_SFRotation;
		%feature("autodoc", "	:rtype: None
") Vrml_SFRotation;
		 Vrml_SFRotation ();
		%feature("compactdefaultargs") Vrml_SFRotation;
		%feature("autodoc", "	:param aRotationX:
	:type aRotationX: float
	:param aRotationY:
	:type aRotationY: float
	:param aRotationZ:
	:type aRotationZ: float
	:param anAngle:
	:type anAngle: float
	:rtype: None
") Vrml_SFRotation;
		 Vrml_SFRotation (const Standard_Real aRotationX,const Standard_Real aRotationY,const Standard_Real aRotationZ,const Standard_Real anAngle);
};


%extend Vrml_SFRotation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_Scale;
class Vrml_Scale {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "	:rtype: gp_Vec
") ScaleFactor;
		gp_Vec ScaleFactor ();
		%feature("compactdefaultargs") SetScaleFactor;
		%feature("autodoc", "	:param aScaleFactor:
	:type aScaleFactor: gp_Vec
	:rtype: None
") SetScaleFactor;
		void SetScaleFactor (const gp_Vec & aScaleFactor);
		%feature("compactdefaultargs") Vrml_Scale;
		%feature("autodoc", "	:rtype: None
") Vrml_Scale;
		 Vrml_Scale ();
		%feature("compactdefaultargs") Vrml_Scale;
		%feature("autodoc", "	:param aScaleFactor:
	:type aScaleFactor: gp_Vec
	:rtype: None
") Vrml_Scale;
		 Vrml_Scale (const gp_Vec & aScaleFactor);
};


%extend Vrml_Scale {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_Separator;
class Vrml_Separator {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") RenderCulling;
		%feature("autodoc", "	:rtype: Vrml_SeparatorRenderCulling
") RenderCulling;
		Vrml_SeparatorRenderCulling RenderCulling ();
		%feature("compactdefaultargs") SetRenderCulling;
		%feature("autodoc", "	:param aRenderCulling:
	:type aRenderCulling: Vrml_SeparatorRenderCulling
	:rtype: None
") SetRenderCulling;
		void SetRenderCulling (const Vrml_SeparatorRenderCulling aRenderCulling);
		%feature("compactdefaultargs") Vrml_Separator;
		%feature("autodoc", "	:param aRenderCulling:
	:type aRenderCulling: Vrml_SeparatorRenderCulling
	:rtype: None
") Vrml_Separator;
		 Vrml_Separator (const Vrml_SeparatorRenderCulling aRenderCulling);
		%feature("compactdefaultargs") Vrml_Separator;
		%feature("autodoc", "	:rtype: None
") Vrml_Separator;
		 Vrml_Separator ();
};


%extend Vrml_Separator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_ShapeHints;
class Vrml_ShapeHints {
	public:
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	:rtype: float
") Angle;
		Standard_Real Angle ();
		%feature("compactdefaultargs") FaceType;
		%feature("autodoc", "	:rtype: Vrml_FaceType
") FaceType;
		Vrml_FaceType FaceType ();

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "	:param aAngle:
	:type aAngle: float
	:rtype: None
") SetAngle;
		void SetAngle (const Standard_Real aAngle);
		%feature("compactdefaultargs") SetFaceType;
		%feature("autodoc", "	:param aFaceType:
	:type aFaceType: Vrml_FaceType
	:rtype: None
") SetFaceType;
		void SetFaceType (const Vrml_FaceType aFaceType);
		%feature("compactdefaultargs") SetShapeType;
		%feature("autodoc", "	:param aShapeType:
	:type aShapeType: Vrml_ShapeType
	:rtype: None
") SetShapeType;
		void SetShapeType (const Vrml_ShapeType aShapeType);
		%feature("compactdefaultargs") SetVertexOrdering;
		%feature("autodoc", "	:param aVertexOrdering:
	:type aVertexOrdering: Vrml_VertexOrdering
	:rtype: None
") SetVertexOrdering;
		void SetVertexOrdering (const Vrml_VertexOrdering aVertexOrdering);
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "	:rtype: Vrml_ShapeType
") ShapeType;
		Vrml_ShapeType ShapeType ();
		%feature("compactdefaultargs") VertexOrdering;
		%feature("autodoc", "	:rtype: Vrml_VertexOrdering
") VertexOrdering;
		Vrml_VertexOrdering VertexOrdering ();
		%feature("compactdefaultargs") Vrml_ShapeHints;
		%feature("autodoc", "	:param aVertexOrdering: default value is Vrml_UNKNOWN_ORDERING
	:type aVertexOrdering: Vrml_VertexOrdering
	:param aShapeType: default value is Vrml_UNKNOWN_SHAPE_TYPE
	:type aShapeType: Vrml_ShapeType
	:param aFaceType: default value is Vrml_CONVEX
	:type aFaceType: Vrml_FaceType
	:param aAngle: default value is 0.5
	:type aAngle: float
	:rtype: None
") Vrml_ShapeHints;
		 Vrml_ShapeHints (const Vrml_VertexOrdering aVertexOrdering = Vrml_UNKNOWN_ORDERING,const Vrml_ShapeType aShapeType = Vrml_UNKNOWN_SHAPE_TYPE,const Vrml_FaceType aFaceType = Vrml_CONVEX,const Standard_Real aAngle = 0.5);
};


%extend Vrml_ShapeHints {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_Sphere;
class Vrml_Sphere {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "	:rtype: float
") Radius;
		Standard_Real Radius ();
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "	:param aRadius:
	:type aRadius: float
	:rtype: None
") SetRadius;
		void SetRadius (const Standard_Real aRadius);
		%feature("compactdefaultargs") Vrml_Sphere;
		%feature("autodoc", "	:param aRadius: default value is 1
	:type aRadius: float
	:rtype: None
") Vrml_Sphere;
		 Vrml_Sphere (const Standard_Real aRadius = 1);
};


%extend Vrml_Sphere {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_SpotLight;
class Vrml_SpotLight {
	public:
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	:rtype: Quantity_Color
") Color;
		Quantity_Color Color ();
		%feature("compactdefaultargs") CutOffAngle;
		%feature("autodoc", "	:rtype: float
") CutOffAngle;
		Standard_Real CutOffAngle ();
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "	:rtype: gp_Vec
") Direction;
		gp_Vec Direction ();
		%feature("compactdefaultargs") DropOffRate;
		%feature("autodoc", "	:rtype: float
") DropOffRate;
		Standard_Real DropOffRate ();
		%feature("compactdefaultargs") Intensity;
		%feature("autodoc", "	:rtype: float
") Intensity;
		Standard_Real Intensity ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	:rtype: gp_Vec
") Location;
		gp_Vec Location ();
		%feature("compactdefaultargs") OnOff;
		%feature("autodoc", "	:rtype: bool
") OnOff;
		Standard_Boolean OnOff ();

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & aColor);
		%feature("compactdefaultargs") SetCutOffAngle;
		%feature("autodoc", "	:param aCutOffAngle:
	:type aCutOffAngle: float
	:rtype: None
") SetCutOffAngle;
		void SetCutOffAngle (const Standard_Real aCutOffAngle);
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "	:param aDirection:
	:type aDirection: gp_Vec
	:rtype: None
") SetDirection;
		void SetDirection (const gp_Vec & aDirection);
		%feature("compactdefaultargs") SetDropOffRate;
		%feature("autodoc", "	:param aDropOffRate:
	:type aDropOffRate: float
	:rtype: None
") SetDropOffRate;
		void SetDropOffRate (const Standard_Real aDropOffRate);
		%feature("compactdefaultargs") SetIntensity;
		%feature("autodoc", "	:param aIntensity:
	:type aIntensity: float
	:rtype: None
") SetIntensity;
		void SetIntensity (const Standard_Real aIntensity);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	:param aLocation:
	:type aLocation: gp_Vec
	:rtype: None
") SetLocation;
		void SetLocation (const gp_Vec & aLocation);
		%feature("compactdefaultargs") SetOnOff;
		%feature("autodoc", "	:param anOnOff:
	:type anOnOff: bool
	:rtype: None
") SetOnOff;
		void SetOnOff (const Standard_Boolean anOnOff);
		%feature("compactdefaultargs") Vrml_SpotLight;
		%feature("autodoc", "	:rtype: None
") Vrml_SpotLight;
		 Vrml_SpotLight ();
		%feature("compactdefaultargs") Vrml_SpotLight;
		%feature("autodoc", "	:param aOnOff:
	:type aOnOff: bool
	:param aIntensity:
	:type aIntensity: float
	:param aColor:
	:type aColor: Quantity_Color &
	:param aLocation:
	:type aLocation: gp_Vec
	:param aDirection:
	:type aDirection: gp_Vec
	:param aDropOffRate:
	:type aDropOffRate: float
	:param aCutOffAngle:
	:type aCutOffAngle: float
	:rtype: None
") Vrml_SpotLight;
		 Vrml_SpotLight (const Standard_Boolean aOnOff,const Standard_Real aIntensity,const Quantity_Color & aColor,const gp_Vec & aLocation,const gp_Vec & aDirection,const Standard_Real aDropOffRate,const Standard_Real aCutOffAngle);
};


%extend Vrml_SpotLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_Switch;
class Vrml_Switch {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") SetWhichChild;
		%feature("autodoc", "	:param aWhichChild:
	:type aWhichChild: int
	:rtype: None
") SetWhichChild;
		void SetWhichChild (const Standard_Integer aWhichChild);
		%feature("compactdefaultargs") Vrml_Switch;
		%feature("autodoc", "	:param aWhichChild: default value is -1
	:type aWhichChild: int
	:rtype: None
") Vrml_Switch;
		 Vrml_Switch (const Standard_Integer aWhichChild = -1);
		%feature("compactdefaultargs") WhichChild;
		%feature("autodoc", "	:rtype: int
") WhichChild;
		Standard_Integer WhichChild ();
};


%extend Vrml_Switch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_Texture2;
class Vrml_Texture2 {
	public:
		%feature("compactdefaultargs") Filename;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Filename;
		TCollection_AsciiString Filename ();
		%feature("compactdefaultargs") Image;
		%feature("autodoc", "	:rtype: opencascade::handle<Vrml_SFImage>
") Image;
		opencascade::handle<Vrml_SFImage> Image ();

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") SetFilename;
		%feature("autodoc", "	:param aFilename:
	:type aFilename: TCollection_AsciiString &
	:rtype: None
") SetFilename;
		void SetFilename (const TCollection_AsciiString & aFilename);
		%feature("compactdefaultargs") SetImage;
		%feature("autodoc", "	:param aImage:
	:type aImage: opencascade::handle<Vrml_SFImage> &
	:rtype: None
") SetImage;
		void SetImage (const opencascade::handle<Vrml_SFImage> & aImage);
		%feature("compactdefaultargs") SetWrapS;
		%feature("autodoc", "	:param aWrapS:
	:type aWrapS: Vrml_Texture2Wrap
	:rtype: None
") SetWrapS;
		void SetWrapS (const Vrml_Texture2Wrap aWrapS);
		%feature("compactdefaultargs") SetWrapT;
		%feature("autodoc", "	:param aWrapT:
	:type aWrapT: Vrml_Texture2Wrap
	:rtype: None
") SetWrapT;
		void SetWrapT (const Vrml_Texture2Wrap aWrapT);
		%feature("compactdefaultargs") Vrml_Texture2;
		%feature("autodoc", "	:rtype: None
") Vrml_Texture2;
		 Vrml_Texture2 ();
		%feature("compactdefaultargs") Vrml_Texture2;
		%feature("autodoc", "	:param aFilename:
	:type aFilename: TCollection_AsciiString &
	:param aImage:
	:type aImage: opencascade::handle<Vrml_SFImage> &
	:param aWrapS:
	:type aWrapS: Vrml_Texture2Wrap
	:param aWrapT:
	:type aWrapT: Vrml_Texture2Wrap
	:rtype: None
") Vrml_Texture2;
		 Vrml_Texture2 (const TCollection_AsciiString & aFilename,const opencascade::handle<Vrml_SFImage> & aImage,const Vrml_Texture2Wrap aWrapS,const Vrml_Texture2Wrap aWrapT);
		%feature("compactdefaultargs") WrapS;
		%feature("autodoc", "	:rtype: Vrml_Texture2Wrap
") WrapS;
		Vrml_Texture2Wrap WrapS ();
		%feature("compactdefaultargs") WrapT;
		%feature("autodoc", "	:rtype: Vrml_Texture2Wrap
") WrapT;
		Vrml_Texture2Wrap WrapT ();
};


%extend Vrml_Texture2 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_Texture2Transform;
class Vrml_Texture2Transform {
	public:
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "	:rtype: gp_Vec2d
") Center;
		gp_Vec2d Center ();

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "	:rtype: float
") Rotation;
		Standard_Real Rotation ();
		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "	:rtype: gp_Vec2d
") ScaleFactor;
		gp_Vec2d ScaleFactor ();
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "	:param aCenter:
	:type aCenter: gp_Vec2d
	:rtype: None
") SetCenter;
		void SetCenter (const gp_Vec2d & aCenter);
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "	:param aRotation:
	:type aRotation: float
	:rtype: None
") SetRotation;
		void SetRotation (const Standard_Real aRotation);
		%feature("compactdefaultargs") SetScaleFactor;
		%feature("autodoc", "	:param aScaleFactor:
	:type aScaleFactor: gp_Vec2d
	:rtype: None
") SetScaleFactor;
		void SetScaleFactor (const gp_Vec2d & aScaleFactor);
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "	:param aTranslation:
	:type aTranslation: gp_Vec2d
	:rtype: None
") SetTranslation;
		void SetTranslation (const gp_Vec2d & aTranslation);
		%feature("compactdefaultargs") Translation;
		%feature("autodoc", "	:rtype: gp_Vec2d
") Translation;
		gp_Vec2d Translation ();
		%feature("compactdefaultargs") Vrml_Texture2Transform;
		%feature("autodoc", "	:rtype: None
") Vrml_Texture2Transform;
		 Vrml_Texture2Transform ();
		%feature("compactdefaultargs") Vrml_Texture2Transform;
		%feature("autodoc", "	:param aTranslation:
	:type aTranslation: gp_Vec2d
	:param aRotation:
	:type aRotation: float
	:param aScaleFactor:
	:type aScaleFactor: gp_Vec2d
	:param aCenter:
	:type aCenter: gp_Vec2d
	:rtype: None
") Vrml_Texture2Transform;
		 Vrml_Texture2Transform (const gp_Vec2d & aTranslation,const Standard_Real aRotation,const gp_Vec2d & aScaleFactor,const gp_Vec2d & aCenter);
};


%extend Vrml_Texture2Transform {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_TextureCoordinate2;
class Vrml_TextureCoordinate2 : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:rtype: opencascade::handle<TColgp_HArray1OfVec2d>
") Point;
		opencascade::handle<TColgp_HArray1OfVec2d> Point ();

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "	:param aPoint:
	:type aPoint: opencascade::handle<TColgp_HArray1OfVec2d>
	:rtype: None
") SetPoint;
		void SetPoint (const opencascade::handle<TColgp_HArray1OfVec2d> & aPoint);
		%feature("compactdefaultargs") Vrml_TextureCoordinate2;
		%feature("autodoc", "	:rtype: None
") Vrml_TextureCoordinate2;
		 Vrml_TextureCoordinate2 ();
		%feature("compactdefaultargs") Vrml_TextureCoordinate2;
		%feature("autodoc", "	:param aPoint:
	:type aPoint: opencascade::handle<TColgp_HArray1OfVec2d>
	:rtype: None
") Vrml_TextureCoordinate2;
		 Vrml_TextureCoordinate2 (const opencascade::handle<TColgp_HArray1OfVec2d> & aPoint);
};


%make_alias(Vrml_TextureCoordinate2)

%extend Vrml_TextureCoordinate2 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_Transform;
class Vrml_Transform {
	public:
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "	:rtype: gp_Vec
") Center;
		gp_Vec Center ();

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "	:rtype: Vrml_SFRotation
") Rotation;
		Vrml_SFRotation Rotation ();
		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "	:rtype: gp_Vec
") ScaleFactor;
		gp_Vec ScaleFactor ();
		%feature("compactdefaultargs") ScaleOrientation;
		%feature("autodoc", "	:rtype: Vrml_SFRotation
") ScaleOrientation;
		Vrml_SFRotation ScaleOrientation ();
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "	:param aCenter:
	:type aCenter: gp_Vec
	:rtype: None
") SetCenter;
		void SetCenter (const gp_Vec & aCenter);
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "	:param aRotation:
	:type aRotation: Vrml_SFRotation &
	:rtype: None
") SetRotation;
		void SetRotation (const Vrml_SFRotation & aRotation);
		%feature("compactdefaultargs") SetScaleFactor;
		%feature("autodoc", "	:param aScaleFactor:
	:type aScaleFactor: gp_Vec
	:rtype: None
") SetScaleFactor;
		void SetScaleFactor (const gp_Vec & aScaleFactor);
		%feature("compactdefaultargs") SetScaleOrientation;
		%feature("autodoc", "	:param aScaleOrientation:
	:type aScaleOrientation: Vrml_SFRotation &
	:rtype: None
") SetScaleOrientation;
		void SetScaleOrientation (const Vrml_SFRotation & aScaleOrientation);
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "	:param aTranslation:
	:type aTranslation: gp_Vec
	:rtype: None
") SetTranslation;
		void SetTranslation (const gp_Vec & aTranslation);
		%feature("compactdefaultargs") Translation;
		%feature("autodoc", "	:rtype: gp_Vec
") Translation;
		gp_Vec Translation ();
		%feature("compactdefaultargs") Vrml_Transform;
		%feature("autodoc", "	:rtype: None
") Vrml_Transform;
		 Vrml_Transform ();
		%feature("compactdefaultargs") Vrml_Transform;
		%feature("autodoc", "	:param aTranslation:
	:type aTranslation: gp_Vec
	:param aRotation:
	:type aRotation: Vrml_SFRotation &
	:param aScaleFactor:
	:type aScaleFactor: gp_Vec
	:param aScaleOrientation:
	:type aScaleOrientation: Vrml_SFRotation &
	:param aCenter:
	:type aCenter: gp_Vec
	:rtype: None
") Vrml_Transform;
		 Vrml_Transform (const gp_Vec & aTranslation,const Vrml_SFRotation & aRotation,const gp_Vec & aScaleFactor,const Vrml_SFRotation & aScaleOrientation,const gp_Vec & aCenter);
};


%extend Vrml_Transform {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_TransformSeparator;
class Vrml_TransformSeparator {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Vrml_TransformSeparator;
		%feature("autodoc", "	:rtype: None
") Vrml_TransformSeparator;
		 Vrml_TransformSeparator ();
};


%extend Vrml_TransformSeparator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_Translation;
class Vrml_Translation {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "	:param aTranslation:
	:type aTranslation: gp_Vec
	:rtype: None
") SetTranslation;
		void SetTranslation (const gp_Vec & aTranslation);
		%feature("compactdefaultargs") Translation;
		%feature("autodoc", "	:rtype: gp_Vec
") Translation;
		gp_Vec Translation ();
		%feature("compactdefaultargs") Vrml_Translation;
		%feature("autodoc", "	:rtype: None
") Vrml_Translation;
		 Vrml_Translation ();
		%feature("compactdefaultargs") Vrml_Translation;
		%feature("autodoc", "	:param aTranslation:
	:type aTranslation: gp_Vec
	:rtype: None
") Vrml_Translation;
		 Vrml_Translation (const gp_Vec & aTranslation);
};


%extend Vrml_Translation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_WWWAnchor;
class Vrml_WWWAnchor {
	public:
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Description;
		TCollection_AsciiString Description ();
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "	:rtype: Vrml_WWWAnchorMap
") Map;
		Vrml_WWWAnchorMap Map ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Name;
		TCollection_AsciiString Name ();

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	:param aDescription:
	:type aDescription: TCollection_AsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const TCollection_AsciiString & aDescription);
		%feature("compactdefaultargs") SetMap;
		%feature("autodoc", "	:param aMap:
	:type aMap: Vrml_WWWAnchorMap
	:rtype: None
") SetMap;
		void SetMap (const Vrml_WWWAnchorMap aMap);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: TCollection_AsciiString &
	:rtype: None
") SetName;
		void SetName (const TCollection_AsciiString & aName);
		%feature("compactdefaultargs") Vrml_WWWAnchor;
		%feature("autodoc", "	:param aName: default value is ""
	:type aName: TCollection_AsciiString &
	:param aDescription: default value is ""
	:type aDescription: TCollection_AsciiString &
	:param aMap: default value is Vrml_MAP_NONE
	:type aMap: Vrml_WWWAnchorMap
	:rtype: None
") Vrml_WWWAnchor;
		 Vrml_WWWAnchor (const TCollection_AsciiString & aName = "",const TCollection_AsciiString & aDescription = "",const Vrml_WWWAnchorMap aMap = Vrml_MAP_NONE);
};


%extend Vrml_WWWAnchor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Vrml_WWWInline;
class Vrml_WWWInline {
	public:
		%feature("compactdefaultargs") BboxCenter;
		%feature("autodoc", "	:rtype: gp_Vec
") BboxCenter;
		gp_Vec BboxCenter ();
		%feature("compactdefaultargs") BboxSize;
		%feature("autodoc", "	:rtype: gp_Vec
") BboxSize;
		gp_Vec BboxSize ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Name;
		TCollection_AsciiString Name ();

        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") SetBboxCenter;
		%feature("autodoc", "	:param aBboxCenter:
	:type aBboxCenter: gp_Vec
	:rtype: None
") SetBboxCenter;
		void SetBboxCenter (const gp_Vec & aBboxCenter);
		%feature("compactdefaultargs") SetBboxSize;
		%feature("autodoc", "	:param aBboxSize:
	:type aBboxSize: gp_Vec
	:rtype: None
") SetBboxSize;
		void SetBboxSize (const gp_Vec & aBboxSize);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: TCollection_AsciiString &
	:rtype: None
") SetName;
		void SetName (const TCollection_AsciiString & aName);
		%feature("compactdefaultargs") Vrml_WWWInline;
		%feature("autodoc", "	:rtype: None
") Vrml_WWWInline;
		 Vrml_WWWInline ();
		%feature("compactdefaultargs") Vrml_WWWInline;
		%feature("autodoc", "	:param aName:
	:type aName: TCollection_AsciiString &
	:param aBboxSize:
	:type aBboxSize: gp_Vec
	:param aBboxCenter:
	:type aBboxCenter: gp_Vec
	:rtype: None
") Vrml_WWWInline;
		 Vrml_WWWInline (const TCollection_AsciiString & aName,const gp_Vec & aBboxSize,const gp_Vec & aBboxCenter);
};


%extend Vrml_WWWInline {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
