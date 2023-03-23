/*
Copyright 2008-2022 Thomas Paviot (tpaviot@gmail.com)

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
%define STDPRSDOCSTRING
"StdPrs module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_stdprs.html"
%enddef
%module (package="OCC.Core", docstring=STDPRSDOCSTRING) StdPrs


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


%{
#include<StdPrs_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<Prs3d_module.hxx>
#include<TCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<gp_module.hxx>
#include<Graphic3d_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TColgp_module.hxx>
#include<HLRAlgo_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<TColStd_module.hxx>
#include<Poly_module.hxx>
#include<TopLoc_module.hxx>
#include<BRep_module.hxx>
#include<GeomAbs_module.hxx>
#include<Bnd_module.hxx>
#include<TopTools_module.hxx>
#include<TopAbs_module.hxx>
#include<Adaptor2d_module.hxx>
#include<BRepLib_module.hxx>
#include<Adaptor3d_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Message_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<Graphic3d_module.hxx>
#include<Quantity_module.hxx>
#include<TopTools_module.hxx>
#include<TShort_module.hxx>
#include<Aspect_module.hxx>
#include<V3d_module.hxx>
#include<SelectMgr_module.hxx>
#include<Select3D_module.hxx>
#include<Media_module.hxx>
#include<Prs3d_module.hxx>
#include<BRepTools_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom.i
%import Prs3d.i
%import TCollection.i
%import TopoDS.i
%import gp.i
%import Graphic3d.i
%import Adaptor3d.i
%import TColgp.i
%import HLRAlgo.i
%import BRepAdaptor.i
%import TColStd.i
%import Poly.i
%import TopLoc.i
%import BRep.i
%import GeomAbs.i
%import Bnd.i
%import TopTools.i
%import TopAbs.i
%import Adaptor2d.i
%import BRepLib.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum StdPrs_Volume {
	StdPrs_Volume_Autodetection = 0,
	StdPrs_Volume_Closed = 1,
	StdPrs_Volume_Opened = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class StdPrs_Volume(IntEnum):
	StdPrs_Volume_Autodetection = 0
	StdPrs_Volume_Closed = 1
	StdPrs_Volume_Opened = 2
StdPrs_Volume_Autodetection = StdPrs_Volume.StdPrs_Volume_Autodetection
StdPrs_Volume_Closed = StdPrs_Volume.StdPrs_Volume_Closed
StdPrs_Volume_Opened = StdPrs_Volume.StdPrs_Volume_Opened
};
/* end python proxy for enums */

/* handles */
%wrap_handle(StdPrs_BRepFont)
%wrap_handle(StdPrs_HLRShapeI)
%wrap_handle(StdPrs_HLRPolyShape)
%wrap_handle(StdPrs_HLRShape)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
typedef Prs3d_BndBox StdPrs_BndBox;
typedef Prs3d_Point <opencascade::handle <Geom_Point>, StdPrs_ToolPoint> StdPrs_Point;
typedef Prs3d_Point <TopoDS_Vertex, StdPrs_ToolVertex> StdPrs_Vertex;
/* end typedefs declaration */

/************************
* class StdPrs_BRepFont *
************************/
class StdPrs_BRepFont : public Standard_Transient {
	public:
		/****************** StdPrs_BRepFont ******************/
		/**** md5 signature: b34dca788fc27003f74bb1e4b42bbb20 ****/
		%feature("compactdefaultargs") StdPrs_BRepFont;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StdPrs_BRepFont;
		 StdPrs_BRepFont();

		/****************** StdPrs_BRepFont ******************/
		/**** md5 signature: be40ea26c61925f1c177bbec908f56a1 ****/
		%feature("compactdefaultargs") StdPrs_BRepFont;
		%feature("autodoc", "Constructor with initialization. @param thefontpath full path to the font @param thesize the face size in model units @param thefaceid face id within the file (0 by default).

Parameters
----------
theFontPath: NCollection_String
theSize: float
theFaceId: int,optional
	default value is 0

Returns
-------
None
") StdPrs_BRepFont;
		 StdPrs_BRepFont(const NCollection_String & theFontPath, const Standard_Real theSize, const Standard_Integer theFaceId = 0);

		/****************** StdPrs_BRepFont ******************/
		/**** md5 signature: a3ba9975ca459684aea303f32cffc2b9 ****/
		%feature("compactdefaultargs") StdPrs_BRepFont;
		%feature("autodoc", "Constructor with initialization. @param thefontname the font name @param thefontaspect the font style @param thesize the face size in model units @param thestrictlevel search strict level for using aliases and fallback.

Parameters
----------
theFontName: NCollection_String
theFontAspect: Font_FontAspect
theSize: float
theStrictLevel: Font_StrictLevel,optional
	default value is Font_StrictLevel_Any

Returns
-------
None
") StdPrs_BRepFont;
		 StdPrs_BRepFont(const NCollection_String & theFontName, const Font_FontAspect theFontAspect, const Standard_Real theSize, const Font_StrictLevel theStrictLevel = Font_StrictLevel_Any);

		/****************** AdvanceX ******************/
		/**** md5 signature: 4c75b0edceff5f5f44dcaec3b54bea94 ****/
		%feature("compactdefaultargs") AdvanceX;
		%feature("autodoc", "Compute advance to the next character with kerning applied when applicable. assuming text rendered horizontally.

Parameters
----------
theUCharNext: Standard_Utf32Char

Returns
-------
float
") AdvanceX;
		Standard_Real AdvanceX(const Standard_Utf32Char theUCharNext);

		/****************** AdvanceX ******************/
		/**** md5 signature: db64718620b242f6bb6fcdbcae8836a5 ****/
		%feature("compactdefaultargs") AdvanceX;
		%feature("autodoc", "Compute advance to the next character with kerning applied when applicable. assuming text rendered horizontally.

Parameters
----------
theUChar: Standard_Utf32Char
theUCharNext: Standard_Utf32Char

Returns
-------
float
") AdvanceX;
		Standard_Real AdvanceX(const Standard_Utf32Char theUChar, const Standard_Utf32Char theUCharNext);

		/****************** AdvanceY ******************/
		/**** md5 signature: ddeb2265cd2bd26fe363410dd3b7e6e0 ****/
		%feature("compactdefaultargs") AdvanceY;
		%feature("autodoc", "Compute advance to the next character with kerning applied when applicable. assuming text rendered vertically.

Parameters
----------
theUCharNext: Standard_Utf32Char

Returns
-------
float
") AdvanceY;
		Standard_Real AdvanceY(const Standard_Utf32Char theUCharNext);

		/****************** AdvanceY ******************/
		/**** md5 signature: e611b288bad1f8a6d972468a7836ee16 ****/
		%feature("compactdefaultargs") AdvanceY;
		%feature("autodoc", "Compute advance to the next character with kerning applied when applicable. assuming text rendered vertically.

Parameters
----------
theUChar: Standard_Utf32Char
theUCharNext: Standard_Utf32Char

Returns
-------
float
") AdvanceY;
		Standard_Real AdvanceY(const Standard_Utf32Char theUChar, const Standard_Utf32Char theUCharNext);

		/****************** Ascender ******************/
		/**** md5 signature: 557783a64aa70a912a1e70d3023e6b77 ****/
		%feature("compactdefaultargs") Ascender;
		%feature("autodoc", "Returns vertical distance from the horizontal baseline to the highest character coordinate.

Returns
-------
float
") Ascender;
		Standard_Real Ascender();

		/****************** Descender ******************/
		/**** md5 signature: 1ac5f46c4e3c54b4ea51e2bc3b666449 ****/
		%feature("compactdefaultargs") Descender;
		%feature("autodoc", "Returns vertical distance from the horizontal baseline to the lowest character coordinate.

Returns
-------
float
") Descender;
		Standard_Real Descender();

		/****************** FTFont ******************/
		/**** md5 signature: 4d514b718d712295641b4c0cc60834d8 ****/
		%feature("compactdefaultargs") FTFont;
		%feature("autodoc", "Return wrapper over freetype font.

Returns
-------
opencascade::handle<Font_FTFont>
") FTFont;
		const opencascade::handle<Font_FTFont> & FTFont();

		/****************** FindAndCreate ******************/
		/**** md5 signature: 372fe3fc63150aec0ee289ddf806595a ****/
		%feature("compactdefaultargs") FindAndCreate;
		%feature("autodoc", "Find the font initialize the font. @param thefontname the font name @param thefontaspect the font style @param thesize the face size in model units @param thestrictlevel search strict level for using aliases and fallback returns true on success.

Parameters
----------
theFontName: str
theFontAspect: Font_FontAspect
theSize: float
theStrictLevel: Font_StrictLevel,optional
	default value is Font_StrictLevel_Any

Returns
-------
opencascade::handle<StdPrs_BRepFont>
") FindAndCreate;
		static opencascade::handle<StdPrs_BRepFont> FindAndCreate(TCollection_AsciiString theFontName, const Font_FontAspect theFontAspect, const Standard_Real theSize, const Font_StrictLevel theStrictLevel = Font_StrictLevel_Any);

		/****************** FindAndInit ******************/
		/**** md5 signature: 33bf264db4f7fb13be769117703cf8e4 ****/
		%feature("compactdefaultargs") FindAndInit;
		%feature("autodoc", "Find (using font_fontmgr) and initialize the font from the given name. please take into account that size is specified not in typography points (pt.). if you need to specify size in points, value should be converted. formula for pt. -> m conversion: asizemeters = 0.0254 * thesizept / 72.0 @param thefontname the font name @param thefontaspect the font style @param thesize the face size in model units @param thestrictlevel search strict level for using aliases and fallback returns true on success.

Parameters
----------
theFontName: str
theFontAspect: Font_FontAspect
theSize: float
theStrictLevel: Font_StrictLevel,optional
	default value is Font_StrictLevel_Any

Returns
-------
bool
") FindAndInit;
		bool FindAndInit(TCollection_AsciiString theFontName, const Font_FontAspect theFontAspect, const Standard_Real theSize, const Font_StrictLevel theStrictLevel = Font_StrictLevel_Any);

		/****************** Init ******************/
		/**** md5 signature: 14deab12f664b3e6a0b208965809fe62 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize the font. @param thefontpath full path to the font @param thesize the face size in model units @param thefaceid face id within the file (0 by default) returns true on success.

Parameters
----------
theFontPath: NCollection_String
theSize: float
theFaceId: int

Returns
-------
bool
") Init;
		bool Init(const NCollection_String & theFontPath, const Standard_Real theSize, const Standard_Integer theFaceId);

		/****************** Init ******************/
		/**** md5 signature: 5ed045caef5b4cad065c651482b98255 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Find (using font_fontmgr) and initialize the font from the given name. alias for findandinit() for backward compatibility.

Parameters
----------
theFontName: NCollection_String
theFontAspect: Font_FontAspect
theSize: float

Returns
-------
bool
") Init;
		bool Init(const NCollection_String & theFontName, const Font_FontAspect theFontAspect, const Standard_Real theSize);

		/****************** LineSpacing ******************/
		/**** md5 signature: 3f893468c66eb56fd7ce68c882d953c8 ****/
		%feature("compactdefaultargs") LineSpacing;
		%feature("autodoc", "Returns default line spacing (the baseline-to-baseline distance).

Returns
-------
float
") LineSpacing;
		Standard_Real LineSpacing();

		/****************** Mutex ******************/
		/**** md5 signature: 902e13b2343e132a88f2b4c5433ad6d8 ****/
		%feature("compactdefaultargs") Mutex;
		%feature("autodoc", "Returns mutex.

Returns
-------
Standard_Mutex
") Mutex;
		Standard_Mutex & Mutex();

		/****************** PointSize ******************/
		/**** md5 signature: a9867d84cde33572abbc3c90ffa97681 ****/
		%feature("compactdefaultargs") PointSize;
		%feature("autodoc", "Configured point size.

Returns
-------
float
") PointSize;
		Standard_Real PointSize();

		/****************** Release ******************/
		/**** md5 signature: b6fd00166214731bccdaabb58b7e4102 ****/
		%feature("compactdefaultargs") Release;
		%feature("autodoc", "Release currently loaded font.

Returns
-------
None
") Release;
		virtual void Release();

		/****************** RenderGlyph ******************/
		/**** md5 signature: 2951ebf93713dc5641da578f21061f63 ****/
		%feature("compactdefaultargs") RenderGlyph;
		%feature("autodoc", "Render single glyph as topods_shape. @param thechar glyph identifier returns rendered glyph within cache, might be null shape.

Parameters
----------
theChar: Standard_Utf32Char

Returns
-------
TopoDS_Shape
") RenderGlyph;
		TopoDS_Shape RenderGlyph(const Standard_Utf32Char & theChar);

		/****************** Scale ******************/
		/**** md5 signature: fff8b387c443c3e852a1bfc198a5a373 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "Returns scaling factor for current font size.

Returns
-------
float
") Scale;
		Standard_Real Scale();

		/****************** SetCompositeCurveMode ******************/
		/**** md5 signature: 8ce8079e93dd55c18a3ec2e70ee280d6 ****/
		%feature("compactdefaultargs") SetCompositeCurveMode;
		%feature("autodoc", "Setup glyph geometry construction mode. by default algorithm creates independent topods_edge for each original curve in the glyph (line segment or bezie curve). algorithm might optionally create composite bspline curve for each contour which reduces memory footprint but limits curve class to c0. notice that altering this flag clears currently accumulated cache!.

Parameters
----------
theToConcatenate: bool

Returns
-------
None
") SetCompositeCurveMode;
		void SetCompositeCurveMode(const Standard_Boolean theToConcatenate);

		/****************** SetWidthScaling ******************/
		/**** md5 signature: 04deb132fe6b213fa451e36d262acdbd ****/
		%feature("compactdefaultargs") SetWidthScaling;
		%feature("autodoc", "Setup glyph scaling along x-axis. by default glyphs are not scaled (scaling factor = 1.0).

Parameters
----------
theScaleFactor: float

Returns
-------
None
") SetWidthScaling;
		void SetWidthScaling(const float theScaleFactor);

};


%make_alias(StdPrs_BRepFont)

%extend StdPrs_BRepFont {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StdPrs_BRepTextBuilder *
*******************************/
class StdPrs_BRepTextBuilder {
	public:
		/****************** Perform ******************/
		/**** md5 signature: facc6a1fc84ac3434277cfed9d55f021 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Render text as brep shape. @param theformatter formatter which defines aligned text @param thepenloc start position and orientation on the baseline returns result shape with pen transformation applied as shape location.

Parameters
----------
theFont: StdPrs_BRepFont
theFormatter: Font_TextFormatter
thePenLoc: gp_Ax3,optional
	default value is gp_Ax3()

Returns
-------
TopoDS_Shape
") Perform;
		TopoDS_Shape Perform(StdPrs_BRepFont & theFont, const opencascade::handle<Font_TextFormatter> & theFormatter, const gp_Ax3 & thePenLoc = gp_Ax3());

		/****************** Perform ******************/
		/**** md5 signature: eac7909f64fbc8be0df2a0aba1c2b658 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Render text as brep shape. @param thestring text in utf-8 encoding @param thepenloc start position and orientation on the baseline @param thehalign horizontal alignment of the text @param thevalign vertical alignment of the text returns result shape with pen transformation applied as shape location.

Parameters
----------
theFont: StdPrs_BRepFont
theString: NCollection_String
thePenLoc: gp_Ax3,optional
	default value is gp_Ax3()
theHAlign: Graphic3d_HorizontalTextAlignment,optional
	default value is Graphic3d_HTA_LEFT
theVAlign: Graphic3d_VerticalTextAlignment,optional
	default value is Graphic3d_VTA_BOTTOM

Returns
-------
TopoDS_Shape
") Perform;
		TopoDS_Shape Perform(StdPrs_BRepFont & theFont, const NCollection_String & theString, const gp_Ax3 & thePenLoc = gp_Ax3(), const Graphic3d_HorizontalTextAlignment theHAlign = Graphic3d_HTA_LEFT, const Graphic3d_VerticalTextAlignment theVAlign = Graphic3d_VTA_BOTTOM);

};


%extend StdPrs_BRepTextBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class StdPrs_Curve *
*********************/
class StdPrs_Curve : public Prs3d_Root {
	public:
		/****************** Add ******************/
		/**** md5 signature: ecd0a0350b8a63aec33bccaa23d19556 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds to the presentation apresentation the drawing of the curve acurve. the aspect is defined by lineaspect in adrawer. if drawcurve equals standard_false the curve will not be displayed, it is used if the curve is a part of some shape and primitivearray visualization approach is activated (it is activated by default).

Parameters
----------
aPresentation: Prs3d_Presentation
aCurve: Adaptor3d_Curve
aDrawer: Prs3d_Drawer
drawCurve: bool,optional
	default value is Standard_True

Returns
-------
void
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & aPresentation, const Adaptor3d_Curve & aCurve, const opencascade::handle<Prs3d_Drawer> & aDrawer, const Standard_Boolean drawCurve = Standard_True);

		/****************** Add ******************/
		/**** md5 signature: d8dde21367418e11a33b31c5c3f950dd ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds to the presentation apresentation the drawing of the curve acurve. the aspect is defined by lineaspect in adrawer. the drawing will be limited between the points of parameter u1 and u2. if drawcurve equals standard_false the curve will not be displayed, it is used if the curve is a part of some shape and primitivearray visualization approach is activated (it is activated by default).

Parameters
----------
aPresentation: Prs3d_Presentation
aCurve: Adaptor3d_Curve
U1: float
U2: float
aDrawer: Prs3d_Drawer
drawCurve: bool,optional
	default value is Standard_True

Returns
-------
void
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & aPresentation, const Adaptor3d_Curve & aCurve, const Standard_Real U1, const Standard_Real U2, const opencascade::handle<Prs3d_Drawer> & aDrawer, const Standard_Boolean drawCurve = Standard_True);

		/****************** Add ******************/
		/**** md5 signature: 17b8aa9fa3fbb8163ed09605f5f1a057 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds to the presentation apresentation the drawing of the curve acurve. the aspect is the current aspect. adeflection is used in the circle case. points give a sequence of curve points. if drawcurve equals standard_false the curve will not be displayed, it is used if the curve is a part of some shape and primitivearray visualization approach is activated (it is activated by default).

Parameters
----------
aPresentation: Prs3d_Presentation
aCurve: Adaptor3d_Curve
aDrawer: Prs3d_Drawer
Points: TColgp_SequenceOfPnt
drawCurve: bool,optional
	default value is Standard_True

Returns
-------
void
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & aPresentation, const Adaptor3d_Curve & aCurve, const opencascade::handle<Prs3d_Drawer> & aDrawer, TColgp_SequenceOfPnt & Points, const Standard_Boolean drawCurve = Standard_True);

		/****************** Add ******************/
		/**** md5 signature: cf52a609a5fb4eb4b458dba149dadd40 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds to the presentation apresentation the drawing of the curve acurve. the aspect is the current aspect. the drawing will be limited between the points of parameter u1 and u2. adeflection is used in the circle case. points give a sequence of curve points. if drawcurve equals standard_false the curve will not be displayed, it is used if the curve is a part of some shape and primitivearray visualization approach is activated (it is activated by default).

Parameters
----------
aPresentation: Prs3d_Presentation
aCurve: Adaptor3d_Curve
U1: float
U2: float
Points: TColgp_SequenceOfPnt
aNbPoints: int,optional
	default value is 30
drawCurve: bool,optional
	default value is Standard_True

Returns
-------
void
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & aPresentation, const Adaptor3d_Curve & aCurve, const Standard_Real U1, const Standard_Real U2, TColgp_SequenceOfPnt & Points, const Standard_Integer aNbPoints = 30, const Standard_Boolean drawCurve = Standard_True);

		/****************** Match ******************/
		/**** md5 signature: 4edef5e09e28fc3f4977319a2a5c96b3 ****/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "Returns true if the distance between the point (x,y,z) and the drawing of the curve is less than adistance.

Parameters
----------
X: float
Y: float
Z: float
aDistance: float
aCurve: Adaptor3d_Curve
aDrawer: Prs3d_Drawer

Returns
-------
bool
") Match;
		static Standard_Boolean Match(const Standard_Real X, const Standard_Real Y, const Standard_Real Z, const Standard_Real aDistance, const Adaptor3d_Curve & aCurve, const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****************** Match ******************/
		/**** md5 signature: 2fc416047c48db14019e95b5eb6bce1c ****/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "Returns true if the distance between the point (x,y,z) and the drawing of the curve is less than adistance.

Parameters
----------
X: float
Y: float
Z: float
aDistance: float
aCurve: Adaptor3d_Curve
aDeflection: float
aLimit: float
aNbPoints: int

Returns
-------
bool
") Match;
		static Standard_Boolean Match(const Standard_Real X, const Standard_Real Y, const Standard_Real Z, const Standard_Real aDistance, const Adaptor3d_Curve & aCurve, const Standard_Real aDeflection, const Standard_Real aLimit, const Standard_Integer aNbPoints);

		/****************** Match ******************/
		/**** md5 signature: bdc9e4d32789999c268047db86dbb9da ****/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "Returns true if the distance between the point (x,y,z) and the drawing of the curve acurve is less than adistance. the drawing is considered between the points of parameter u1 and u2;.

Parameters
----------
X: float
Y: float
Z: float
aDistance: float
aCurve: Adaptor3d_Curve
U1: float
U2: float
aDrawer: Prs3d_Drawer

Returns
-------
bool
") Match;
		static Standard_Boolean Match(const Standard_Real X, const Standard_Real Y, const Standard_Real Z, const Standard_Real aDistance, const Adaptor3d_Curve & aCurve, const Standard_Real U1, const Standard_Real U2, const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****************** Match ******************/
		/**** md5 signature: 7878a79a49cb16a7e3a81c9bceaeb037 ****/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "Returns true if the distance between the point (x,y,z) and the drawing of the curve acurve is less than adistance. the drawing is considered between the points of parameter u1 and u2;.

Parameters
----------
X: float
Y: float
Z: float
aDistance: float
aCurve: Adaptor3d_Curve
U1: float
U2: float
aDeflection: float
aNbPoints: int

Returns
-------
bool
") Match;
		static Standard_Boolean Match(const Standard_Real X, const Standard_Real Y, const Standard_Real Z, const Standard_Real aDistance, const Adaptor3d_Curve & aCurve, const Standard_Real U1, const Standard_Real U2, const Standard_Real aDeflection, const Standard_Integer aNbPoints);

};


%extend StdPrs_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StdPrs_DeflectionCurve *
*******************************/
/*************************
* class StdPrs_HLRShapeI *
*************************/
%nodefaultctor StdPrs_HLRShapeI;
class StdPrs_HLRShapeI : public Standard_Transient {
	public:
		/****************** ComputeHLR ******************/
		/**** md5 signature: ed8d67b024e7d5529491da79ff84ac31 ****/
		%feature("compactdefaultargs") ComputeHLR;
		%feature("autodoc", "Compute presentation for specified shape.

Parameters
----------
thePrs: Prs3d_Presentation
theShape: TopoDS_Shape
theDrawer: Prs3d_Drawer
theProjector: Graphic3d_Camera

Returns
-------
None
") ComputeHLR;
		virtual void ComputeHLR(const opencascade::handle<Prs3d_Presentation> & thePrs, const TopoDS_Shape & theShape, const opencascade::handle<Prs3d_Drawer> & theDrawer, const opencascade::handle<Graphic3d_Camera> & theProjector);

};


%make_alias(StdPrs_HLRShapeI)

%extend StdPrs_HLRShapeI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class StdPrs_HLRToolShape *
****************************/
class StdPrs_HLRToolShape {
	public:
		/****************** StdPrs_HLRToolShape ******************/
		/**** md5 signature: c53fe71882e835afad0e889fbf7e146b ****/
		%feature("compactdefaultargs") StdPrs_HLRToolShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
TheShape: TopoDS_Shape
TheProjector: HLRAlgo_Projector

Returns
-------
None
") StdPrs_HLRToolShape;
		 StdPrs_HLRToolShape(const TopoDS_Shape & TheShape, const HLRAlgo_Projector & TheProjector);

		/****************** Hidden ******************/
		/**** md5 signature: 608caa8ffc41ac4b6b1a899608b1940c ****/
		%feature("compactdefaultargs") Hidden;
		%feature("autodoc", "No available documentation.

Parameters
----------
TheEdge: BRepAdaptor_Curve

Returns
-------
U1: float
U2: float
") Hidden;
		void Hidden(BRepAdaptor_Curve & TheEdge, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** InitHidden ******************/
		/**** md5 signature: e773bda49c18e0f29137e21c2658a5e8 ****/
		%feature("compactdefaultargs") InitHidden;
		%feature("autodoc", "No available documentation.

Parameters
----------
EdgeNumber: int

Returns
-------
None
") InitHidden;
		void InitHidden(const Standard_Integer EdgeNumber);

		/****************** InitVisible ******************/
		/**** md5 signature: d6020b6b1d02e2782cfa8398847f0258 ****/
		%feature("compactdefaultargs") InitVisible;
		%feature("autodoc", "No available documentation.

Parameters
----------
EdgeNumber: int

Returns
-------
None
") InitVisible;
		void InitVisible(const Standard_Integer EdgeNumber);

		/****************** MoreHidden ******************/
		/**** md5 signature: 3b15b62a78bddb9bfa7464762d6947d6 ****/
		%feature("compactdefaultargs") MoreHidden;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreHidden;
		Standard_Boolean MoreHidden();

		/****************** MoreVisible ******************/
		/**** md5 signature: 7cca41fab7d11924952196a9afb1cb46 ****/
		%feature("compactdefaultargs") MoreVisible;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreVisible;
		Standard_Boolean MoreVisible();

		/****************** NbEdges ******************/
		/**** md5 signature: b4dae8fc9e9992109d200aaac9bd9ada ****/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEdges;
		Standard_Integer NbEdges();

		/****************** NextHidden ******************/
		/**** md5 signature: e264eab7635073c92511d973f449cac3 ****/
		%feature("compactdefaultargs") NextHidden;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextHidden;
		void NextHidden();

		/****************** NextVisible ******************/
		/**** md5 signature: 58f9164627fb81fb53c82fbb8a4e698b ****/
		%feature("compactdefaultargs") NextVisible;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextVisible;
		void NextVisible();

		/****************** Visible ******************/
		/**** md5 signature: 92f628a6a81a08729ea3a539b7dd9728 ****/
		%feature("compactdefaultargs") Visible;
		%feature("autodoc", "No available documentation.

Parameters
----------
TheEdge: BRepAdaptor_Curve

Returns
-------
U1: float
U2: float
") Visible;
		void Visible(BRepAdaptor_Curve & TheEdge, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend StdPrs_HLRToolShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class StdPrs_Isolines *
************************/
class StdPrs_Isolines : public Prs3d_Root {
	public:
		class PntOnIso {};
		class SegOnIso {};
		/****************** Add ******************/
		/**** md5 signature: 01f40ed4679e1484c088196742d4b41a ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Computes isolines presentation for a topods face. this method chooses proper version of isoline builder algorithm : on triangulation or surface depending on the flag passed from prs3d_drawer attributes. this method is a default way to display isolines for a given topods face. @param thepresentation [in] the presentation. @param theface [in] the face. @param thedrawer [in] the display settings. @param thedeflection [in] the deflection for isolines-on-surface version.

Parameters
----------
thePresentation: Prs3d_Presentation
theFace: TopoDS_Face
theDrawer: Prs3d_Drawer
theDeflection: float

Returns
-------
inline void
") Add;
		inline static void Add(const opencascade::handle<Prs3d_Presentation> & thePresentation, const TopoDS_Face & theFace, const opencascade::handle<Prs3d_Drawer> & theDrawer, const Standard_Real theDeflection);

		/****************** Add ******************/
		/**** md5 signature: 5de803694dec54609521ff59e1207e6a ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Computes isolines presentation for a topods face. this method chooses proper version of isoline builder algorithm : on triangulation or surface depending on the flag passed from prs3d_drawer attributes. this method is a default way to display isolines for a given topods face. @param theface [in] the face. @param thedrawer [in] the display settings. @param thedeflection [in] the deflection for isolines-on-surface version.

Parameters
----------
theFace: TopoDS_Face
theDrawer: Prs3d_Drawer
theDeflection: float
theUPolylines: Prs3d_NListOfSequenceOfPnt
theVPolylines: Prs3d_NListOfSequenceOfPnt

Returns
-------
void
") Add;
		static void Add(const TopoDS_Face & theFace, const opencascade::handle<Prs3d_Drawer> & theDrawer, const Standard_Real theDeflection, Prs3d_NListOfSequenceOfPnt & theUPolylines, Prs3d_NListOfSequenceOfPnt & theVPolylines);

		/****************** AddOnSurface ******************/
		/**** md5 signature: 5eb1a603556cd8cc0d70c55c9e3429fa ****/
		%feature("compactdefaultargs") AddOnSurface;
		%feature("autodoc", "Computes isolines on surface and adds them to presentation. @param thepresentation [in] the presentation. @param theface [in] the face. @param thedrawer [in] the display settings. @param thedeflection [in] the deflection value.

Parameters
----------
thePresentation: Prs3d_Presentation
theFace: TopoDS_Face
theDrawer: Prs3d_Drawer
theDeflection: float

Returns
-------
void
") AddOnSurface;
		static void AddOnSurface(const opencascade::handle<Prs3d_Presentation> & thePresentation, const TopoDS_Face & theFace, const opencascade::handle<Prs3d_Drawer> & theDrawer, const Standard_Real theDeflection);

		/****************** AddOnSurface ******************/
		/**** md5 signature: de23598b27c666694d6ad57b6ac01a3b ****/
		%feature("compactdefaultargs") AddOnSurface;
		%feature("autodoc", "Computes isolines on surface and adds them to presentation. @param theface [in] the face @param thedrawer [in] the display settings @param thedeflection [in] the deflection value @param theupolylines [out] the sequence of result polylines @param thevpolylines [out] the sequence of result polylines.

Parameters
----------
theFace: TopoDS_Face
theDrawer: Prs3d_Drawer
theDeflection: float
theUPolylines: Prs3d_NListOfSequenceOfPnt
theVPolylines: Prs3d_NListOfSequenceOfPnt

Returns
-------
void
") AddOnSurface;
		static void AddOnSurface(const TopoDS_Face & theFace, const opencascade::handle<Prs3d_Drawer> & theDrawer, const Standard_Real theDeflection, Prs3d_NListOfSequenceOfPnt & theUPolylines, Prs3d_NListOfSequenceOfPnt & theVPolylines);

		/****************** AddOnSurface ******************/
		/**** md5 signature: df3d10afd0ae22442b9d52062f1fc4a4 ****/
		%feature("compactdefaultargs") AddOnSurface;
		%feature("autodoc", "Computes isolines on surface and adds them to presentation. @param thepresentation [in] the presentation. @param thesurface [in] the surface. @param thedrawer [in] the display settings. @param thedeflection [in] the deflection value. @param theuisoparams [in] the parameters of u isolines to compute. @param thevisoparams [in] the parameters of v isolines to compute.

Parameters
----------
thePresentation: Prs3d_Presentation
theSurface: BRepAdaptor_Surface
theDrawer: Prs3d_Drawer
theDeflection: float
theUIsoParams: TColStd_SequenceOfReal
theVIsoParams: TColStd_SequenceOfReal

Returns
-------
void
") AddOnSurface;
		static void AddOnSurface(const opencascade::handle<Prs3d_Presentation> & thePresentation, const opencascade::handle<BRepAdaptor_Surface> & theSurface, const opencascade::handle<Prs3d_Drawer> & theDrawer, const Standard_Real theDeflection, const TColStd_SequenceOfReal & theUIsoParams, const TColStd_SequenceOfReal & theVIsoParams);

		/****************** AddOnTriangulation ******************/
		/**** md5 signature: edc7640cc9248e14e63a44d5f239dbf2 ****/
		%feature("compactdefaultargs") AddOnTriangulation;
		%feature("autodoc", "Computes isolines on triangulation and adds them to a presentation. @param thepresentation [in] the presentation. @param theface [in] the face. @param thedrawer [in] the display settings.

Parameters
----------
thePresentation: Prs3d_Presentation
theFace: TopoDS_Face
theDrawer: Prs3d_Drawer

Returns
-------
void
") AddOnTriangulation;
		static void AddOnTriangulation(const opencascade::handle<Prs3d_Presentation> & thePresentation, const TopoDS_Face & theFace, const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** AddOnTriangulation ******************/
		/**** md5 signature: 2a1e1df2f916fded41ad5b7bd67fd011 ****/
		%feature("compactdefaultargs") AddOnTriangulation;
		%feature("autodoc", "Computes isolines on triangulation. @param theface [in] the face. @param thedrawer [in] the display settings. @param theupolylines [out] the sequence of result polylines @param thevpolylines [out] the sequence of result polylines.

Parameters
----------
theFace: TopoDS_Face
theDrawer: Prs3d_Drawer
theUPolylines: Prs3d_NListOfSequenceOfPnt
theVPolylines: Prs3d_NListOfSequenceOfPnt

Returns
-------
void
") AddOnTriangulation;
		static void AddOnTriangulation(const TopoDS_Face & theFace, const opencascade::handle<Prs3d_Drawer> & theDrawer, Prs3d_NListOfSequenceOfPnt & theUPolylines, Prs3d_NListOfSequenceOfPnt & theVPolylines);

		/****************** AddOnTriangulation ******************/
		/**** md5 signature: 23b63c464969b08203f007b023922e4c ****/
		%feature("compactdefaultargs") AddOnTriangulation;
		%feature("autodoc", "Computes isolines on triangulation and adds them to a presentation. @param thepresentation [in] the presentation. @param thetriangulation [in] the triangulation. @param thesurface [in] the definition of triangulated surface. the surface adapter is used to precisely evaluate isoline points using surface law and fit them on triangulation. if null is passed, the method will use linear interpolation of triangle node's uv coordinates to evaluate isoline points. @param thelocation [in] the location transformation defined for triangulation (surface). @param thedrawer [in] the display settings. @param theuisoparams [in] the parameters of u isolines to compute. @param thevisoparams [in] the parameters of v isolines to compute.

Parameters
----------
thePresentation: Prs3d_Presentation
theTriangulation: Poly_Triangulation
theSurface: Geom_Surface
theLocation: TopLoc_Location
theDrawer: Prs3d_Drawer
theUIsoParams: TColStd_SequenceOfReal
theVIsoParams: TColStd_SequenceOfReal

Returns
-------
void
") AddOnTriangulation;
		static void AddOnTriangulation(const opencascade::handle<Prs3d_Presentation> & thePresentation, const opencascade::handle<Poly_Triangulation> & theTriangulation, const opencascade::handle<Geom_Surface> & theSurface, const TopLoc_Location & theLocation, const opencascade::handle<Prs3d_Drawer> & theDrawer, const TColStd_SequenceOfReal & theUIsoParams, const TColStd_SequenceOfReal & theVIsoParams);

		/****************** UVIsoParameters ******************/
		/**** md5 signature: 624d137e5f58c70fc47c9a4a74925873 ****/
		%feature("compactdefaultargs") UVIsoParameters;
		%feature("autodoc", "Evaluate sequence of parameters for drawing uv isolines for a given face. @param theface [in] the face. @param thenbisou [in] the number of u isolines. @param thenbisov [in] the number of v isolines. @param theuvlimit [in] the u, v parameter value limit. @param theuisoparams [out] the sequence of u isoline parameters. @param thevisoparams [out] the sequence of v isoline parameters. @param theumin [out] the lower u boundary of theface. @param theumax [out] the upper u boundary of theface. @param thevmin [out] the lower v boundary of theface. @param thevmax [out] the upper v boundary of theface.

Parameters
----------
theFace: TopoDS_Face
theNbIsoU: int
theNbIsoV: int
theUVLimit: float
theUIsoParams: TColStd_SequenceOfReal
theVIsoParams: TColStd_SequenceOfReal

Returns
-------
theUmin: float
theUmax: float
theVmin: float
theVmax: float
") UVIsoParameters;
		static void UVIsoParameters(const TopoDS_Face & theFace, const Standard_Integer theNbIsoU, const Standard_Integer theNbIsoV, const Standard_Real theUVLimit, TColStd_SequenceOfReal & theUIsoParams, TColStd_SequenceOfReal & theVIsoParams, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend StdPrs_Isolines {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class StdPrs_Plane *
*********************/
class StdPrs_Plane : public Prs3d_Root {
	public:
		/****************** Add ******************/
		/**** md5 signature: 53550c107b88614e5cb49b350ae75131 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Defines display of infinite planes. the infinite plane aplane is added to the display apresentation, and the attributes of the display are defined by the attribute manager adrawer.

Parameters
----------
aPresentation: Prs3d_Presentation
aPlane: Adaptor3d_Surface
aDrawer: Prs3d_Drawer

Returns
-------
void
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & aPresentation, const Adaptor3d_Surface & aPlane, const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****************** Match ******************/
		/**** md5 signature: 7b7156f4fe814b1640708e811a47f58e ****/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "Returns true if the distance between the point (x,y,z) and the plane is less than adistance.

Parameters
----------
X: float
Y: float
Z: float
aDistance: float
aPlane: Adaptor3d_Surface
aDrawer: Prs3d_Drawer

Returns
-------
bool
") Match;
		static Standard_Boolean Match(const Standard_Real X, const Standard_Real Y, const Standard_Real Z, const Standard_Real aDistance, const Adaptor3d_Surface & aPlane, const opencascade::handle<Prs3d_Drawer> & aDrawer);

};


%extend StdPrs_Plane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class StdPrs_PoleCurve *
*************************/
class StdPrs_PoleCurve : public Prs3d_Root {
	public:
		/****************** Add ******************/
		/**** md5 signature: 9daca4a2363925180e48bad4d47cb26d ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Defines display of bspline and bezier curves. adds the 3d curve acurve to the stdprs_polecurve algorithm. this shape is found in the presentation object apresentation, and its display attributes are set in the attribute manager adrawer. the curve object from adaptor3d provides data from a geom curve. this makes it possible to use the surface in a geometric algorithm.

Parameters
----------
aPresentation: Prs3d_Presentation
aCurve: Adaptor3d_Curve
aDrawer: Prs3d_Drawer

Returns
-------
void
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & aPresentation, const Adaptor3d_Curve & aCurve, const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****************** Match ******************/
		/**** md5 signature: 4edef5e09e28fc3f4977319a2a5c96b3 ****/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "Returns true if the distance between the point (x,y,z) and the broken line made of the poles is less then adistance.

Parameters
----------
X: float
Y: float
Z: float
aDistance: float
aCurve: Adaptor3d_Curve
aDrawer: Prs3d_Drawer

Returns
-------
bool
") Match;
		static Standard_Boolean Match(const Standard_Real X, const Standard_Real Y, const Standard_Real Z, const Standard_Real aDistance, const Adaptor3d_Curve & aCurve, const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****************** Pick ******************/
		/**** md5 signature: 110350faab9ea047534f7a57de6d598c ****/
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "Returns the pole the most near of the point (x,y,z) and returns its range. the distance between the pole and (x,y,z) must be less then adistance. if no pole corresponds, 0 is returned.

Parameters
----------
X: float
Y: float
Z: float
aDistance: float
aCurve: Adaptor3d_Curve
aDrawer: Prs3d_Drawer

Returns
-------
int
") Pick;
		static Standard_Integer Pick(const Standard_Real X, const Standard_Real Y, const Standard_Real Z, const Standard_Real aDistance, const Adaptor3d_Curve & aCurve, const opencascade::handle<Prs3d_Drawer> & aDrawer);

};


%extend StdPrs_PoleCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class StdPrs_ShadedShape *
***************************/
class StdPrs_ShadedShape : public Prs3d_Root {
	public:
		/****************** Add ******************/
		/**** md5 signature: 4361c97ebfd2d178620c977d5eabb386 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Shades <theshape>. @param thevolumetype defines the way how to interpret input shapes - as closed volumes (to activate back-face culling and capping plane algorithms), as open volumes (shells or solids with holes) or to perform autodetection (would split input shape into two groups).

Parameters
----------
thePresentation: Prs3d_Presentation
theShape: TopoDS_Shape
theDrawer: Prs3d_Drawer
theVolume: StdPrs_Volume,optional
	default value is StdPrs_Volume_Autodetection

Returns
-------
void
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & thePresentation, const TopoDS_Shape & theShape, const opencascade::handle<Prs3d_Drawer> & theDrawer, const StdPrs_Volume theVolume = StdPrs_Volume_Autodetection);

		/****************** Add ******************/
		/**** md5 signature: c21dc028b4eb82bb3707a6e95d6e5c3b ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Shades <theshape> with texture coordinates. @param thevolumetype defines the way how to interpret input shapes - as closed volumes (to activate back-face culling and capping plane algorithms), as open volumes (shells or solids with holes) or to perform autodetection (would split input shape into two groups).

Parameters
----------
thePresentation: Prs3d_Presentation
theShape: TopoDS_Shape
theDrawer: Prs3d_Drawer
theHasTexels: bool
theUVOrigin: gp_Pnt2d
theUVRepeat: gp_Pnt2d
theUVScale: gp_Pnt2d
theVolume: StdPrs_Volume,optional
	default value is StdPrs_Volume_Autodetection

Returns
-------
void
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & thePresentation, const TopoDS_Shape & theShape, const opencascade::handle<Prs3d_Drawer> & theDrawer, const Standard_Boolean theHasTexels, const gp_Pnt2d & theUVOrigin, const gp_Pnt2d & theUVRepeat, const gp_Pnt2d & theUVScale, const StdPrs_Volume theVolume = StdPrs_Volume_Autodetection);

		/****************** AddWireframeForFacesWithoutTriangles ******************/
		/**** md5 signature: 2399101e036cd3b0540bfa37732d6fc1 ****/
		%feature("compactdefaultargs") AddWireframeForFacesWithoutTriangles;
		%feature("autodoc", "Computes special wireframe presentation for faces without triangulation.

Parameters
----------
thePrs: Prs3d_Presentation
theShape: TopoDS_Shape
theDrawer: Prs3d_Drawer

Returns
-------
void
") AddWireframeForFacesWithoutTriangles;
		static void AddWireframeForFacesWithoutTriangles(const opencascade::handle<Prs3d_Presentation> & thePrs, const TopoDS_Shape & theShape, const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** AddWireframeForFreeElements ******************/
		/**** md5 signature: 4a6b6d1e9376f6a4071ba3fddb19b6e7 ****/
		%feature("compactdefaultargs") AddWireframeForFreeElements;
		%feature("autodoc", "Computes wireframe presentation for free wires and vertices.

Parameters
----------
thePrs: Prs3d_Presentation
theShape: TopoDS_Shape
theDrawer: Prs3d_Drawer

Returns
-------
void
") AddWireframeForFreeElements;
		static void AddWireframeForFreeElements(const opencascade::handle<Prs3d_Presentation> & thePrs, const TopoDS_Shape & theShape, const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** ExploreSolids ******************/
		/**** md5 signature: 0f56ef8bb3796d73330266647168b092 ****/
		%feature("compactdefaultargs") ExploreSolids;
		%feature("autodoc", "Searches closed and unclosed subshapes in shape structure and puts them into two compounds for separate processing of closed and unclosed sub-shapes.

Parameters
----------
theShape: TopoDS_Shape
theBuilder: BRep_Builder
theClosed: TopoDS_Compound
theOpened: TopoDS_Compound
theIgnore1DSubShape: bool

Returns
-------
void
") ExploreSolids;
		static void ExploreSolids(const TopoDS_Shape & theShape, const BRep_Builder & theBuilder, TopoDS_Compound & theClosed, TopoDS_Compound & theOpened, const Standard_Boolean theIgnore1DSubShape);

		/****************** FillFaceBoundaries ******************/
		/**** md5 signature: c71acba81e6e66888a517542dedd393f ****/
		%feature("compactdefaultargs") FillFaceBoundaries;
		%feature("autodoc", "Define primitive array of boundary segments for specified shape. @param theshape segments array or null if specified face does not have computed triangulation @param theuppercontinuity the most edge continuity class to be included to result (edges with more continuity will be ignored).

Parameters
----------
theShape: TopoDS_Shape
theUpperContinuity: GeomAbs_Shape,optional
	default value is GeomAbs_CN

Returns
-------
opencascade::handle<Graphic3d_ArrayOfSegments>
") FillFaceBoundaries;
		static opencascade::handle<Graphic3d_ArrayOfSegments> FillFaceBoundaries(const TopoDS_Shape & theShape, GeomAbs_Shape theUpperContinuity = GeomAbs_CN);

		/****************** FillTriangles ******************/
		/**** md5 signature: e16449a471e532f571ac21e2c069aae7 ****/
		%feature("compactdefaultargs") FillTriangles;
		%feature("autodoc", "Create primitive array with triangles for specified shape. @param theshape [in] the shape with precomputed triangulation.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
opencascade::handle<Graphic3d_ArrayOfTriangles>
") FillTriangles;
		static opencascade::handle<Graphic3d_ArrayOfTriangles> FillTriangles(const TopoDS_Shape & theShape);

		/****************** FillTriangles ******************/
		/**** md5 signature: 419ad4ac31337bdc5a11e70e08df782e ****/
		%feature("compactdefaultargs") FillTriangles;
		%feature("autodoc", "Create primitive array of triangles for specified shape. @param theshape the shape with precomputed triangulation @param thehastexels define uv coordinates in primitive array @param theuvorigin origin for uv coordinates @param theuvrepeat repeat parameters for uv coordinates @param theuvscale scale coefficients for uv coordinates returns triangles array or null if specified face does not have computed triangulation.

Parameters
----------
theShape: TopoDS_Shape
theHasTexels: bool
theUVOrigin: gp_Pnt2d
theUVRepeat: gp_Pnt2d
theUVScale: gp_Pnt2d

Returns
-------
opencascade::handle<Graphic3d_ArrayOfTriangles>
") FillTriangles;
		static opencascade::handle<Graphic3d_ArrayOfTriangles> FillTriangles(const TopoDS_Shape & theShape, const Standard_Boolean theHasTexels, const gp_Pnt2d & theUVOrigin, const gp_Pnt2d & theUVRepeat, const gp_Pnt2d & theUVScale);

};


%extend StdPrs_ShadedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class StdPrs_ShadedSurface *
*****************************/
class StdPrs_ShadedSurface : public Prs3d_Root {
	public:
		/****************** Add ******************/
		/**** md5 signature: 99d22d631390f82303e47347333bc1c0 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the surface asurface to the presentation object apresentation. the surface's display attributes are set in the attribute manager adrawer. the surface object from adaptor3d provides data from a geom surface in order to use the surface in an algorithm.

Parameters
----------
aPresentation: Prs3d_Presentation
aSurface: Adaptor3d_Surface
aDrawer: Prs3d_Drawer

Returns
-------
void
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & aPresentation, const Adaptor3d_Surface & aSurface, const opencascade::handle<Prs3d_Drawer> & aDrawer);

};


%extend StdPrs_ShadedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class StdPrs_ShapeTool *
*************************/
class StdPrs_ShapeTool {
	public:
		/****************** StdPrs_ShapeTool ******************/
		/**** md5 signature: b1cfe601c9ce69d7ecf53050fd390572 ****/
		%feature("compactdefaultargs") StdPrs_ShapeTool;
		%feature("autodoc", "Constructs the tool and initializes it using theshape and theallvertices (optional) arguments. by default, only isolated and internal vertices are considered, however if theallvertices argument is equal to true, all shape's vertices are taken into account.

Parameters
----------
theShape: TopoDS_Shape
theAllVertices: bool,optional
	default value is Standard_False

Returns
-------
None
") StdPrs_ShapeTool;
		 StdPrs_ShapeTool(const TopoDS_Shape & theShape, const Standard_Boolean theAllVertices = Standard_False);

		/****************** CurrentTriangulation ******************/
		/**** md5 signature: e174edc94303c301ad3d548683d6e8cf ****/
		%feature("compactdefaultargs") CurrentTriangulation;
		%feature("autodoc", "No available documentation.

Parameters
----------
l: TopLoc_Location

Returns
-------
opencascade::handle<Poly_Triangulation>
") CurrentTriangulation;
		opencascade::handle<Poly_Triangulation> CurrentTriangulation(TopLoc_Location & l);

		/****************** CurveBound ******************/
		/**** md5 signature: 26827d6be3ffbbdaf33493171ed02d7d ****/
		%feature("compactdefaultargs") CurveBound;
		%feature("autodoc", "No available documentation.

Returns
-------
Bnd_Box
") CurveBound;
		Bnd_Box CurveBound();

		/****************** FaceBound ******************/
		/**** md5 signature: f856e3a5aaaa04bd47251b5baf43000b ****/
		%feature("compactdefaultargs") FaceBound;
		%feature("autodoc", "No available documentation.

Returns
-------
Bnd_Box
") FaceBound;
		Bnd_Box FaceBound();

		/****************** FacesOfEdge ******************/
		/**** md5 signature: 89082386bc651a78938e536e5113de7e ****/
		%feature("compactdefaultargs") FacesOfEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopTools_HSequenceOfShape>
") FacesOfEdge;
		opencascade::handle<TopTools_HSequenceOfShape> FacesOfEdge();

		/****************** GetCurve ******************/
		/**** md5 signature: ccf034d9f6867e07e3c267d12089ab5c ****/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Edge
") GetCurve;
		const TopoDS_Edge GetCurve();

		/****************** GetFace ******************/
		/**** md5 signature: 24f906fe04f44088d93eb51a09d709c8 ****/
		%feature("compactdefaultargs") GetFace;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") GetFace;
		const TopoDS_Face GetFace();

		/****************** GetVertex ******************/
		/**** md5 signature: e20d7c379b1b760b74a12ac040adc908 ****/
		%feature("compactdefaultargs") GetVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Vertex
") GetVertex;
		const TopoDS_Vertex GetVertex();

		/****************** HasCurve ******************/
		/**** md5 signature: 24512d68611f1b569c1022347b56d2ba ****/
		%feature("compactdefaultargs") HasCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasCurve;
		Standard_Boolean HasCurve();

		/****************** HasSurface ******************/
		/**** md5 signature: e1636f96e3c29ca0e588fc628f12d790 ****/
		%feature("compactdefaultargs") HasSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasSurface;
		Standard_Boolean HasSurface();

		/****************** InitCurve ******************/
		/**** md5 signature: 623075abc819963427ae812711cc9f03 ****/
		%feature("compactdefaultargs") InitCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitCurve;
		void InitCurve();

		/****************** InitFace ******************/
		/**** md5 signature: 431fdd4f7fe99cf2478ea6019e7b815d ****/
		%feature("compactdefaultargs") InitFace;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitFace;
		void InitFace();

		/****************** InitVertex ******************/
		/**** md5 signature: 43387ca117473a5285f9b82f191285d3 ****/
		%feature("compactdefaultargs") InitVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitVertex;
		void InitVertex();

		/****************** IsPlanarFace ******************/
		/**** md5 signature: 6b8c88789eed31202251b15ca3358b7f ****/
		%feature("compactdefaultargs") IsPlanarFace;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPlanarFace;
		Standard_Boolean IsPlanarFace();

		/****************** IsPlanarFace ******************/
		/**** md5 signature: dbd07f0e3771524116dd33a19d098b26 ****/
		%feature("compactdefaultargs") IsPlanarFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
theFace: TopoDS_Face

Returns
-------
bool
") IsPlanarFace;
		static Standard_Boolean IsPlanarFace(const TopoDS_Face & theFace);

		/****************** MoreCurve ******************/
		/**** md5 signature: 294b10d8505b397b80557f3ffd3abb0a ****/
		%feature("compactdefaultargs") MoreCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreCurve;
		Standard_Boolean MoreCurve();

		/****************** MoreFace ******************/
		/**** md5 signature: 22c1aefb1ce1d474b93921421f857dc9 ****/
		%feature("compactdefaultargs") MoreFace;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreFace;
		Standard_Boolean MoreFace();

		/****************** MoreVertex ******************/
		/**** md5 signature: b1415b97c2e4eb4b2c3aafb5017477a3 ****/
		%feature("compactdefaultargs") MoreVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreVertex;
		Standard_Boolean MoreVertex();

		/****************** Neighbours ******************/
		/**** md5 signature: f7632ca6a981fecfee9d23781ab8df33 ****/
		%feature("compactdefaultargs") Neighbours;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Neighbours;
		Standard_Integer Neighbours();

		/****************** NextCurve ******************/
		/**** md5 signature: c84098e0d5846ddc5c1ef3cd9db559ef ****/
		%feature("compactdefaultargs") NextCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextCurve;
		void NextCurve();

		/****************** NextFace ******************/
		/**** md5 signature: 70c1b251ca2c3b6097d728cd3445088e ****/
		%feature("compactdefaultargs") NextFace;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextFace;
		void NextFace();

		/****************** NextVertex ******************/
		/**** md5 signature: ea714e35bf0fb8ca7ba7bf859d121153 ****/
		%feature("compactdefaultargs") NextVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextVertex;
		void NextVertex();

		/****************** Polygon3D ******************/
		/**** md5 signature: 3b403e8330a44f3bb52392ce5d5be05c ****/
		%feature("compactdefaultargs") Polygon3D;
		%feature("autodoc", "No available documentation.

Parameters
----------
l: TopLoc_Location

Returns
-------
opencascade::handle<Poly_Polygon3D>
") Polygon3D;
		opencascade::handle<Poly_Polygon3D> Polygon3D(TopLoc_Location & l);

		/****************** PolygonOnTriangulation ******************/
		/**** md5 signature: 86ca6ba9c814d8c843f2ef01be368f3b ****/
		%feature("compactdefaultargs") PolygonOnTriangulation;
		%feature("autodoc", "No available documentation.

Parameters
----------
Indices: Poly_PolygonOnTriangulation
T: Poly_Triangulation
l: TopLoc_Location

Returns
-------
None
") PolygonOnTriangulation;
		void PolygonOnTriangulation(opencascade::handle<Poly_PolygonOnTriangulation> & Indices, opencascade::handle<Poly_Triangulation> & T, TopLoc_Location & l);

};


%extend StdPrs_ShapeTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class StdPrs_ToolPoint *
*************************/
class StdPrs_ToolPoint {
	public:
		/****************** Coord ******************/
		/**** md5 signature: e463034c9e9a03b9aaa89aab3731cce5 ****/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPoint: Geom_Point

Returns
-------
X: float
Y: float
Z: float
") Coord;
		static void Coord(const opencascade::handle<Geom_Point> & aPoint, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend StdPrs_ToolPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class StdPrs_ToolRFace *
*************************/
class StdPrs_ToolRFace {
	public:
		/****************** StdPrs_ToolRFace ******************/
		/**** md5 signature: f7aaeabc68c454c73e58a8d2488e1f21 ****/
		%feature("compactdefaultargs") StdPrs_ToolRFace;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StdPrs_ToolRFace;
		 StdPrs_ToolRFace();

		/****************** StdPrs_ToolRFace ******************/
		/**** md5 signature: e7bc0fa23547e41ba692892564fc2893 ****/
		%feature("compactdefaultargs") StdPrs_ToolRFace;
		%feature("autodoc", "Constructor with initialization.

Parameters
----------
aSurface: BRepAdaptor_Surface

Returns
-------
None
") StdPrs_ToolRFace;
		 StdPrs_ToolRFace(const opencascade::handle<BRepAdaptor_Surface> & aSurface);

		/****************** Edge ******************/
		/**** md5 signature: be590cff987799d8b7c28083399d0e9f ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return current edge.

Returns
-------
TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge();

		/****************** Init ******************/
		/**** md5 signature: ca2feb116ce485f3e8278f79ba5f5d53 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Move iterator to the first element.

Returns
-------
None
") Init;
		void Init();

		/****************** IsInvalidGeometry ******************/
		/**** md5 signature: 0b90e0298ec2724bd48811a3a15e33a7 ****/
		%feature("compactdefaultargs") IsInvalidGeometry;
		%feature("autodoc", "Return true if null curves have been skipped.

Returns
-------
bool
") IsInvalidGeometry;
		Standard_Boolean IsInvalidGeometry();

		/****************** IsOriented ******************/
		/**** md5 signature: ed5befe37b618bc14c188e7a5b194e85 ****/
		%feature("compactdefaultargs") IsOriented;
		%feature("autodoc", "Return true indicating that iterator looks only for oriented edges.

Returns
-------
bool
") IsOriented;
		Standard_Boolean IsOriented();

		/****************** More ******************/
		/**** md5 signature: cff271d3b32940da94bada40648f9096 ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return true if iterator points to the curve.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: 1201a55f750036045cd397a65f07fc7d ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Go to the next curve in the face.

Returns
-------
None
") Next;
		void Next();

		/****************** Orientation ******************/
		/**** md5 signature: 03010048da537511bfd11160d3c898dc ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return current edge orientation.

Returns
-------
TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation();

		/****************** Value ******************/
		/**** md5 signature: c4884397ce5b70aa76efc7c7db26e94e ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return current curve.

Returns
-------
Adaptor2d_Curve2d
") Value;
		const Adaptor2d_Curve2d & Value();

};


%extend StdPrs_ToolRFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StdPrs_ToolTriangulatedShape *
*************************************/
class StdPrs_ToolTriangulatedShape : public BRepLib_ToolTriangulatedShape {
	public:
		/****************** ClearOnOwnDeflectionChange ******************/
		/**** md5 signature: 98477340457ba32a3ffb2857a082605a ****/
		%feature("compactdefaultargs") ClearOnOwnDeflectionChange;
		%feature("autodoc", "If presentation has own deviation coefficient and isautotriangulation() is true, function will compare actual coefficients with previous values and will clear triangulation on their change (regardless actual tessellation quality). function is placed here for compatibility reasons - new code should avoid using isautotriangulation(). @param theshape [in] the shape @param thedrawer [in] the display settings @param thetoresetcoeff [in] updates coefficients in thedrawer to actual state to avoid redundant recomputations.

Parameters
----------
theShape: TopoDS_Shape
theDrawer: Prs3d_Drawer
theToResetCoeff: bool

Returns
-------
void
") ClearOnOwnDeflectionChange;
		static void ClearOnOwnDeflectionChange(const TopoDS_Shape & theShape, const opencascade::handle<Prs3d_Drawer> & theDrawer, const Standard_Boolean theToResetCoeff);

		/****************** GetDeflection ******************/
		/**** md5 signature: 32d565d6bf5769fcd44726cec516a592 ****/
		%feature("compactdefaultargs") GetDeflection;
		%feature("autodoc", "Computes the absolute deflection value depending on the type of deflection in thedrawer: <ul> <li><b>aspect_tod_relative</b>: the absolute deflection is computed using the relative deviation coefficient from thedrawer and the shape's bounding box;</li> <li><b>aspect_tod_absolute</b>: the maximal chordial deviation from thedrawer is returned.</li> </ul> in case of the type of deflection in thedrawer computed relative deflection for shape is stored as absolute deflection. it is necessary to use it later on for sub-shapes. this function should always be used to compute the deflection value for building discrete representations of the shape (triangulation, wireframe) to avoid inconsistencies between different representations of the shape and undesirable visual artifacts.

Parameters
----------
theShape: TopoDS_Shape
theDrawer: Prs3d_Drawer

Returns
-------
float
") GetDeflection;
		static Standard_Real GetDeflection(const TopoDS_Shape & theShape, const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** IsClosed ******************/
		/**** md5 signature: 73cb802be974f5dd2d8d647431bb4edd ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Checks back faces visibility for specified shape (to activate back-face culling). returns true if shape is closed manifold solid or compound of such solids. .

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
bool
") IsClosed;
		static Standard_Boolean IsClosed(const TopoDS_Shape & theShape);

		/****************** IsTessellated ******************/
		/**** md5 signature: 41b76557e8a81abcef9c6092a4dd18ec ****/
		%feature("compactdefaultargs") IsTessellated;
		%feature("autodoc", "Checks whether the shape is properly triangulated for a given display settings. @param theshape [in] the shape. @param thedrawer [in] the display settings.

Parameters
----------
theShape: TopoDS_Shape
theDrawer: Prs3d_Drawer

Returns
-------
bool
") IsTessellated;
		static Standard_Boolean IsTessellated(const TopoDS_Shape & theShape, const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** IsTriangulated ******************/
		/**** md5 signature: 65cde82b83d68e98dc536757110f538b ****/
		%feature("compactdefaultargs") IsTriangulated;
		%feature("autodoc", "Similar to breptools::triangulation() but without extra checks. returns true if all faces within shape are triangulated.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
bool
") IsTriangulated;
		static Standard_Boolean IsTriangulated(const TopoDS_Shape & theShape);

		/****************** Tessellate ******************/
		/**** md5 signature: 4e3c55da546073fdfff034a5fa73f78a ****/
		%feature("compactdefaultargs") Tessellate;
		%feature("autodoc", "Validates triangulation within the shape and performs tessellation if necessary. @param theshape [in] the shape. @param thedrawer [in] the display settings. returns true if tessellation was recomputed and false otherwise.

Parameters
----------
theShape: TopoDS_Shape
theDrawer: Prs3d_Drawer

Returns
-------
bool
") Tessellate;
		static Standard_Boolean Tessellate(const TopoDS_Shape & theShape, const opencascade::handle<Prs3d_Drawer> & theDrawer);

};


%extend StdPrs_ToolTriangulatedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class StdPrs_ToolVertex *
**************************/
class StdPrs_ToolVertex {
	public:
		/****************** Coord ******************/
		/**** md5 signature: 11b62f4bf7e33fabbb0e6f02db287c74 ****/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPoint: TopoDS_Vertex

Returns
-------
X: float
Y: float
Z: float
") Coord;
		static void Coord(const TopoDS_Vertex & aPoint, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend StdPrs_ToolVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StdPrs_WFDeflectionRestrictedFace *
******************************************/
class StdPrs_WFDeflectionRestrictedFace : public Prs3d_Root {
	public:
		/****************** Add ******************/
		/**** md5 signature: d12972390c3d49174724abd88e035741 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Defines a display featuring u and v isoparameters. adds the surface aface to the stdprs_wfrestrictedface algorithm. this face is found in a shape in the presentation object apresentation, and its display attributes - in particular, the number of u and v isoparameters - are set in the attribute manager adrawer. aface is brepadaptor_surface surface created from a face in a topological shape. which is passed as an argument through the brepadaptor_surface surface created from it. this is what allows the topological face to be treated as a geometric surface.

Parameters
----------
aPresentation: Prs3d_Presentation
aFace: BRepAdaptor_Surface
aDrawer: Prs3d_Drawer

Returns
-------
void
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & aPresentation, const opencascade::handle<BRepAdaptor_Surface> & aFace, const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****************** Add ******************/
		/**** md5 signature: a43b9cb76c2452baca5c8f7ad5d11599 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Defines a display of a delection-specified face. the display will feature u and v isoparameters. adds the topology ashape to the stdprs_wfrestrictedface algorithm. this shape is found in the presentation object apresentation, and its display attributes - except the number of u and v isoparameters - are set in the attribute manager adrawer. the function sets the number of u and v isoparameters, nbuiso and nbviso, in the shape. to do this, the arguments drawuiso and drawviso must be true. aface is brepadaptor_surface surface created from a face in a topological shape. which is passed as an argument through the brepadaptor_surface surface created from it. this is what allows the topological face to be treated as a geometric surface. curves give a sequence of face curves, it is used if the primitivearray visualization approach is activated (it is activated by default).

Parameters
----------
aPresentation: Prs3d_Presentation
aFace: BRepAdaptor_Surface
DrawUIso: bool
DrawVIso: bool
Deflection: float
NBUiso: int
NBViso: int
aDrawer: Prs3d_Drawer
Curves: Prs3d_NListOfSequenceOfPnt

Returns
-------
void
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & aPresentation, const opencascade::handle<BRepAdaptor_Surface> & aFace, const Standard_Boolean DrawUIso, const Standard_Boolean DrawVIso, const Standard_Real Deflection, const Standard_Integer NBUiso, const Standard_Integer NBViso, const opencascade::handle<Prs3d_Drawer> & aDrawer, Prs3d_NListOfSequenceOfPnt & Curves);

		/****************** AddUIso ******************/
		/**** md5 signature: abfa66a39e010c944e7999fccfbc51bc ****/
		%feature("compactdefaultargs") AddUIso;
		%feature("autodoc", "Defines a display featuring u isoparameters respectively. add the surface aface to the stdprs_wfrestrictedface algorithm. this face is found in a shape in the presentation object apresentation, and its display attributes - in particular, the number of u isoparameters - are set in the attribute manager adrawer. aface is brepadaptor_surface surface created from a face in a topological shape. which is passed to the function as an argument through the brepadaptor_surface surface created from it. this is what allows the topological face to be treated as a geometric surface.

Parameters
----------
aPresentation: Prs3d_Presentation
aFace: BRepAdaptor_Surface
aDrawer: Prs3d_Drawer

Returns
-------
void
") AddUIso;
		static void AddUIso(const opencascade::handle<Prs3d_Presentation> & aPresentation, const opencascade::handle<BRepAdaptor_Surface> & aFace, const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****************** AddVIso ******************/
		/**** md5 signature: ab3ca8960e5f458613d750c65aa59839 ****/
		%feature("compactdefaultargs") AddVIso;
		%feature("autodoc", "Defines a display featuring v isoparameters respectively. add the surface aface to the stdprs_wfrestrictedface algorithm. this face is found in a shape in the presentation object apresentation, and its display attributes - in particular, the number of v isoparameters - are set in the attribute manager adrawer. aface is brepadaptor_surface surface created from a face in a topological shape. which is passed to the function as an argument through the brepadaptor_surface surface created from it. this is what allows the topological face to be treated as a geometric surface.

Parameters
----------
aPresentation: Prs3d_Presentation
aFace: BRepAdaptor_Surface
aDrawer: Prs3d_Drawer

Returns
-------
void
") AddVIso;
		static void AddVIso(const opencascade::handle<Prs3d_Presentation> & aPresentation, const opencascade::handle<BRepAdaptor_Surface> & aFace, const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****************** Match ******************/
		/**** md5 signature: 36064271588fe17924d682737e08c090 ****/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: float
Y: float
Z: float
aDistance: float
aFace: BRepAdaptor_Surface
aDrawer: Prs3d_Drawer

Returns
-------
bool
") Match;
		static Standard_Boolean Match(const Standard_Real X, const Standard_Real Y, const Standard_Real Z, const Standard_Real aDistance, const opencascade::handle<BRepAdaptor_Surface> & aFace, const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****************** Match ******************/
		/**** md5 signature: 647e7386d58dcbc030ed16f372590bd3 ****/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: float
Y: float
Z: float
aDistance: float
aFace: BRepAdaptor_Surface
aDrawer: Prs3d_Drawer
DrawUIso: bool
DrawVIso: bool
aDeflection: float
NBUiso: int
NBViso: int

Returns
-------
bool
") Match;
		static Standard_Boolean Match(const Standard_Real X, const Standard_Real Y, const Standard_Real Z, const Standard_Real aDistance, const opencascade::handle<BRepAdaptor_Surface> & aFace, const opencascade::handle<Prs3d_Drawer> & aDrawer, const Standard_Boolean DrawUIso, const Standard_Boolean DrawVIso, const Standard_Real aDeflection, const Standard_Integer NBUiso, const Standard_Integer NBViso);

		/****************** MatchUIso ******************/
		/**** md5 signature: c8686c8ec60c7dfe1d0960364542d7a9 ****/
		%feature("compactdefaultargs") MatchUIso;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: float
Y: float
Z: float
aDistance: float
aFace: BRepAdaptor_Surface
aDrawer: Prs3d_Drawer

Returns
-------
bool
") MatchUIso;
		static Standard_Boolean MatchUIso(const Standard_Real X, const Standard_Real Y, const Standard_Real Z, const Standard_Real aDistance, const opencascade::handle<BRepAdaptor_Surface> & aFace, const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****************** MatchVIso ******************/
		/**** md5 signature: 7ed1a209bfc944df2831a03220e9bbdd ****/
		%feature("compactdefaultargs") MatchVIso;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: float
Y: float
Z: float
aDistance: float
aFace: BRepAdaptor_Surface
aDrawer: Prs3d_Drawer

Returns
-------
bool
") MatchVIso;
		static Standard_Boolean MatchVIso(const Standard_Real X, const Standard_Real Y, const Standard_Real Z, const Standard_Real aDistance, const opencascade::handle<BRepAdaptor_Surface> & aFace, const opencascade::handle<Prs3d_Drawer> & aDrawer);

};


%extend StdPrs_WFDeflectionRestrictedFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StdPrs_WFDeflectionSurface *
***********************************/
class StdPrs_WFDeflectionSurface : public Prs3d_Root {
	public:
		/****************** Add ******************/
		/**** md5 signature: 22102598190948bd248c9eed6e92b2c5 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the surface asurface to the presentation object apresentation, and defines its boundaries and isoparameters. the shape's display attributes are set in the attribute manager adrawer. these include whether deflection is absolute or relative to the size of the shape. the surface asurface is a surface object from adaptor, and provides data from a geom surface. this makes it possible to use the surface in a geometric algorithm. note that this surface object is manipulated by handles.

Parameters
----------
aPresentation: Prs3d_Presentation
aSurface: Adaptor3d_Surface
aDrawer: Prs3d_Drawer

Returns
-------
void
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & aPresentation, const opencascade::handle<Adaptor3d_Surface> & aSurface, const opencascade::handle<Prs3d_Drawer> & aDrawer);

};


%extend StdPrs_WFDeflectionSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class StdPrs_WFPoleSurface *
*****************************/
class StdPrs_WFPoleSurface : public Prs3d_Root {
	public:
		/****************** Add ******************/
		/**** md5 signature: 99d22d631390f82303e47347333bc1c0 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the surface asurface to the presentation object apresentation. the shape's display attributes are set in the attribute manager adrawer. the surface asurface is a surface object from adaptor3d, and provides data from a geom surface. this makes it possible to use the surface in a geometric algorithm.

Parameters
----------
aPresentation: Prs3d_Presentation
aSurface: Adaptor3d_Surface
aDrawer: Prs3d_Drawer

Returns
-------
void
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & aPresentation, const Adaptor3d_Surface & aSurface, const opencascade::handle<Prs3d_Drawer> & aDrawer);

};


%extend StdPrs_WFPoleSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StdPrs_WFRestrictedFace *
********************************/
class StdPrs_WFRestrictedFace : public Prs3d_Root {
	public:
		/****************** Add ******************/
		/**** md5 signature: 076538b85d4e03db1c26729f0039250d ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePresentation: Handle(Prs3d_Presentation)
theFace: BRepAdaptor_Surface
theDrawUIso: bool
theDrawVIso: bool
theNbUIso: int
theNbVIso: int
theDrawer: Prs3d_Drawer
theCurves: Prs3d_NListOfSequenceOfPnt

Returns
-------
void
") Add;
		static void Add(const Handle(Prs3d_Presentation) & thePresentation, const opencascade::handle<BRepAdaptor_Surface> & theFace, const Standard_Boolean theDrawUIso, const Standard_Boolean theDrawVIso, const Standard_Integer theNbUIso, const Standard_Integer theNbVIso, const opencascade::handle<Prs3d_Drawer> & theDrawer, Prs3d_NListOfSequenceOfPnt & theCurves);

		/****************** Add ******************/
		/**** md5 signature: e45d54c16977319468756914ccb16f96 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePresentation: Handle(Prs3d_Presentation)
theFace: BRepAdaptor_Surface
theDrawer: Handle(Prs3d_Drawer)

Returns
-------
void
") Add;
		static void Add(const Handle(Prs3d_Presentation) & thePresentation, const opencascade::handle<BRepAdaptor_Surface> & theFace, const Handle(Prs3d_Drawer) & theDrawer);

		/****************** AddUIso ******************/
		/**** md5 signature: 691ce66b22bdadce9b0791ceff26e3e6 ****/
		%feature("compactdefaultargs") AddUIso;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePresentation: Handle(Prs3d_Presentation)
theFace: BRepAdaptor_Surface
theDrawer: Handle(Prs3d_Drawer)

Returns
-------
void
") AddUIso;
		static void AddUIso(const Handle(Prs3d_Presentation) & thePresentation, const opencascade::handle<BRepAdaptor_Surface> & theFace, const Handle(Prs3d_Drawer) & theDrawer);

		/****************** AddVIso ******************/
		/**** md5 signature: e4053cb34cfa26f718bd0aac8e5ab0c8 ****/
		%feature("compactdefaultargs") AddVIso;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePresentation: Handle(Prs3d_Presentation)
theFace: BRepAdaptor_Surface
theDrawer: Handle(Prs3d_Drawer)

Returns
-------
void
") AddVIso;
		static void AddVIso(const Handle(Prs3d_Presentation) & thePresentation, const opencascade::handle<BRepAdaptor_Surface> & theFace, const Handle(Prs3d_Drawer) & theDrawer);

		/****************** Match ******************/
		/**** md5 signature: 73807c62eed49a19c080d0ed89c7ee6e ****/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "No available documentation.

Parameters
----------
theX: float
theY: float
theZ: float
theDistance: float
theFace: BRepAdaptor_Surface
theDrawUIso: bool
theDrawVIso: bool
theDeflection: float
theNbUIso: int
theNbVIso: int
theDrawer: Prs3d_Drawer

Returns
-------
bool
") Match;
		static Standard_Boolean Match(const Standard_Real theX, const Standard_Real theY, const Standard_Real theZ, const Standard_Real theDistance, const opencascade::handle<BRepAdaptor_Surface> & theFace, const Standard_Boolean theDrawUIso, const Standard_Boolean theDrawVIso, const Standard_Real theDeflection, const Standard_Integer theNbUIso, const Standard_Integer theNbVIso, const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** Match ******************/
		/**** md5 signature: 1c3eff0f811bf265e1062653bc20f999 ****/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "No available documentation.

Parameters
----------
theX: float
theY: float
theZ: float
theDistance: float
theFace: BRepAdaptor_Surface
theDrawer: Handle(Prs3d_Drawer)

Returns
-------
bool
") Match;
		static Standard_Boolean Match(const Standard_Real theX, const Standard_Real theY, const Standard_Real theZ, const Standard_Real theDistance, const opencascade::handle<BRepAdaptor_Surface> & theFace, const Handle(Prs3d_Drawer) & theDrawer);

		/****************** MatchUIso ******************/
		/**** md5 signature: 285b5f5fb51f89038ecfc31952642b0e ****/
		%feature("compactdefaultargs") MatchUIso;
		%feature("autodoc", "No available documentation.

Parameters
----------
theX: float
theY: float
theZ: float
theDistance: float
theFace: BRepAdaptor_Surface
theDrawer: Handle(Prs3d_Drawer)

Returns
-------
bool
") MatchUIso;
		static Standard_Boolean MatchUIso(const Standard_Real theX, const Standard_Real theY, const Standard_Real theZ, const Standard_Real theDistance, const opencascade::handle<BRepAdaptor_Surface> & theFace, const Handle(Prs3d_Drawer) & theDrawer);

		/****************** MatchVIso ******************/
		/**** md5 signature: 8add17f73e226b549cfb6f2f022faec1 ****/
		%feature("compactdefaultargs") MatchVIso;
		%feature("autodoc", "No available documentation.

Parameters
----------
theX: float
theY: float
theZ: float
theDistance: float
theFace: BRepAdaptor_Surface
theDrawer: Handle(Prs3d_Drawer)

Returns
-------
bool
") MatchVIso;
		static Standard_Boolean MatchVIso(const Standard_Real theX, const Standard_Real theY, const Standard_Real theZ, const Standard_Real theDistance, const opencascade::handle<BRepAdaptor_Surface> & theFace, const Handle(Prs3d_Drawer) & theDrawer);

};


%extend StdPrs_WFRestrictedFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class StdPrs_WFShape *
***********************/
class StdPrs_WFShape : public Prs3d_Root {
	public:
		/****************** Add ******************/
		/**** md5 signature: d3a473601c5ce8dbbf12badedbed254c ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Computes wireframe presentation of a shape. @param thepresentation [in] the presentation. @param theshape [in] the shape. @param thedrawer [in] the draw settings. @param theisparallel [in] perform algorithm using multiple threads.

Parameters
----------
thePresentation: Prs3d_Presentation
theShape: TopoDS_Shape
theDrawer: Prs3d_Drawer
theIsParallel: bool,optional
	default value is Standard_False

Returns
-------
void
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & thePresentation, const TopoDS_Shape & theShape, const opencascade::handle<Prs3d_Drawer> & theDrawer, Standard_Boolean theIsParallel = Standard_False);

		/****************** AddAllEdges ******************/
		/**** md5 signature: 4d7e4bc00715dfdf3c2311bb197c8859 ****/
		%feature("compactdefaultargs") AddAllEdges;
		%feature("autodoc", "Compute all edges (wire, free, unfree) and put them into single primitive array. @param theshape [in] the shape @param thedrawer [in] the drawer settings (deviation angle and maximal parameter value).

Parameters
----------
theShape: TopoDS_Shape
theDrawer: Prs3d_Drawer

Returns
-------
opencascade::handle<Graphic3d_ArrayOfPrimitives>
") AddAllEdges;
		static opencascade::handle<Graphic3d_ArrayOfPrimitives> AddAllEdges(const TopoDS_Shape & theShape, const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** AddEdgesOnTriangulation ******************/
		/**** md5 signature: 5a4f39d298356ea43f58252e77fcd7d8 ****/
		%feature("compactdefaultargs") AddEdgesOnTriangulation;
		%feature("autodoc", "Compute free and boundary edges on a triangulation of each face in the given shape. @param theshape  [in] the list of triangulated faces @param thetoexcludegeometric [in] flag indicating that faces with defined surface should be skipped.

Parameters
----------
theShape: TopoDS_Shape
theToExcludeGeometric: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<Graphic3d_ArrayOfPrimitives>
") AddEdgesOnTriangulation;
		static opencascade::handle<Graphic3d_ArrayOfPrimitives> AddEdgesOnTriangulation(const TopoDS_Shape & theShape, const Standard_Boolean theToExcludeGeometric = Standard_True);

		/****************** AddEdgesOnTriangulation ******************/
		/**** md5 signature: 818f22c08fe5d4d3cf4085b1ea82ad0a ****/
		%feature("compactdefaultargs") AddEdgesOnTriangulation;
		%feature("autodoc", "Compute free and boundary edges on a triangulation of each face in the given shape. @param thesegments  [in] the sequence of points defining segments @param theshape  [in] the list of triangulated faces @param thetoexcludegeometric [in] flag indicating that faces with defined surface should be skipped.

Parameters
----------
theSegments: TColgp_SequenceOfPnt
theShape: TopoDS_Shape
theToExcludeGeometric: bool,optional
	default value is Standard_True

Returns
-------
void
") AddEdgesOnTriangulation;
		static void AddEdgesOnTriangulation(TColgp_SequenceOfPnt & theSegments, const TopoDS_Shape & theShape, const Standard_Boolean theToExcludeGeometric = Standard_True);

		/****************** AddVertexes ******************/
		/**** md5 signature: d1b2dca7db78c7cfdddec40caebf910c ****/
		%feature("compactdefaultargs") AddVertexes;
		%feature("autodoc", "Compute vertex presentation for a shape. @param theshape [in] the shape @param thevertexmode [in] vertex filter.

Parameters
----------
theShape: TopoDS_Shape
theVertexMode: Prs3d_VertexDrawMode

Returns
-------
opencascade::handle<Graphic3d_ArrayOfPoints>
") AddVertexes;
		static opencascade::handle<Graphic3d_ArrayOfPoints> AddVertexes(const TopoDS_Shape & theShape, Prs3d_VertexDrawMode theVertexMode);

};


%extend StdPrs_WFShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class StdPrs_WFSurface *
*************************/
class StdPrs_WFSurface : public Prs3d_Root {
	public:
		/****************** Add ******************/
		/**** md5 signature: 22102598190948bd248c9eed6e92b2c5 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Draws a surface by drawing the isoparametric curves with respect to a fixed number of points given by the drawer. the number of isoparametric curves to be drawn and their color are controlled by the furnished drawer.

Parameters
----------
aPresentation: Prs3d_Presentation
aSurface: Adaptor3d_Surface
aDrawer: Prs3d_Drawer

Returns
-------
void
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & aPresentation, const opencascade::handle<Adaptor3d_Surface> & aSurface, const opencascade::handle<Prs3d_Drawer> & aDrawer);

};


%extend StdPrs_WFSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class StdPrs_HLRPolyShape *
****************************/
class StdPrs_HLRPolyShape : public StdPrs_HLRShapeI {
	public:
		/****************** ComputeHLR ******************/
		/**** md5 signature: dbee7d283c675e79a09ba59bad299adc ****/
		%feature("compactdefaultargs") ComputeHLR;
		%feature("autodoc", "Compute presentation for specified shape.

Parameters
----------
thePrs: Prs3d_Presentation
theShape: TopoDS_Shape
theDrawer: Prs3d_Drawer
theProjector: Graphic3d_Camera

Returns
-------
None
") ComputeHLR;
		virtual void ComputeHLR(const opencascade::handle<Prs3d_Presentation> & thePrs, const TopoDS_Shape & theShape, const opencascade::handle<Prs3d_Drawer> & theDrawer, const opencascade::handle<Graphic3d_Camera> & theProjector);

};


%make_alias(StdPrs_HLRPolyShape)

%extend StdPrs_HLRPolyShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class StdPrs_HLRShape *
************************/
class StdPrs_HLRShape : public StdPrs_HLRShapeI {
	public:
		/****************** ComputeHLR ******************/
		/**** md5 signature: dbee7d283c675e79a09ba59bad299adc ****/
		%feature("compactdefaultargs") ComputeHLR;
		%feature("autodoc", "Compute presentation for specified shape.

Parameters
----------
thePrs: Prs3d_Presentation
theShape: TopoDS_Shape
theDrawer: Prs3d_Drawer
theProjector: Graphic3d_Camera

Returns
-------
None
") ComputeHLR;
		virtual void ComputeHLR(const opencascade::handle<Prs3d_Presentation> & thePrs, const TopoDS_Shape & theShape, const opencascade::handle<Prs3d_Drawer> & theDrawer, const opencascade::handle<Graphic3d_Camera> & theProjector);

};


%make_alias(StdPrs_HLRShape)

%extend StdPrs_HLRShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class StdPrs_DeflectionCurve:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
StdPrs_BndBox=OCC.Core.Prs3d.Prs3d_BndBox
}
