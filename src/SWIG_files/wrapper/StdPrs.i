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
%define STDPRSDOCSTRING
"StdPrs module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_stdprs.html"
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
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
#include<Adaptor2d_module.hxx>
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
typedef Prs3d_Point<opencascade::handle<Geom_Point>, StdPrs_ToolPoint> StdPrs_Point;
typedef Prs3d_Point<TopoDS_Vertex, StdPrs_ToolVertex> StdPrs_Vertex;
/* end typedefs declaration */

/************************
* class StdPrs_BRepFont *
************************/
class StdPrs_BRepFont : public Standard_Transient {
	public:
		/****** StdPrs_BRepFont::StdPrs_BRepFont ******/
		/****** md5 signature: b34dca788fc27003f74bb1e4b42bbb20 ******/
		%feature("compactdefaultargs") StdPrs_BRepFont;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StdPrs_BRepFont;
		 StdPrs_BRepFont();

		/****** StdPrs_BRepFont::StdPrs_BRepFont ******/
		/****** md5 signature: be40ea26c61925f1c177bbec908f56a1 ******/
		%feature("compactdefaultargs") StdPrs_BRepFont;
		%feature("autodoc", "
Parameters
----------
theFontPath: NCollection_String
theSize: float
theFaceId: int (optional, default to 0)

Return
-------
None

Description
-----------
Constructor with initialization. 
Parameter theFontPath FULL path to the font 
Parameter theSize the face size in model units 
Parameter theFaceId face id within the file (0 by default).
") StdPrs_BRepFont;
		 StdPrs_BRepFont(const NCollection_String & theFontPath, const Standard_Real theSize, const Standard_Integer theFaceId = 0);

		/****** StdPrs_BRepFont::StdPrs_BRepFont ******/
		/****** md5 signature: a3ba9975ca459684aea303f32cffc2b9 ******/
		%feature("compactdefaultargs") StdPrs_BRepFont;
		%feature("autodoc", "
Parameters
----------
theFontName: NCollection_String
theFontAspect: Font_FontAspect
theSize: float
theStrictLevel: Font_StrictLevel (optional, default to Font_StrictLevel_Any)

Return
-------
None

Description
-----------
Constructor with initialization. 
Parameter theFontName the font name 
Parameter theFontAspect the font style 
Parameter theSize the face size in model units 
Parameter theStrictLevel search strict level for using aliases and fallback.
") StdPrs_BRepFont;
		 StdPrs_BRepFont(const NCollection_String & theFontName, const Font_FontAspect theFontAspect, const Standard_Real theSize, const Font_StrictLevel theStrictLevel = Font_StrictLevel_Any);

		/****** StdPrs_BRepFont::AdvanceX ******/
		/****** md5 signature: 4c75b0edceff5f5f44dcaec3b54bea94 ******/
		%feature("compactdefaultargs") AdvanceX;
		%feature("autodoc", "
Parameters
----------
theUCharNext: Standard_Utf32Char

Return
-------
float

Description
-----------
Compute advance to the next character with kerning applied when applicable. Assuming text rendered horizontally.
") AdvanceX;
		Standard_Real AdvanceX(const Standard_Utf32Char theUCharNext);

		/****** StdPrs_BRepFont::AdvanceX ******/
		/****** md5 signature: db64718620b242f6bb6fcdbcae8836a5 ******/
		%feature("compactdefaultargs") AdvanceX;
		%feature("autodoc", "
Parameters
----------
theUChar: Standard_Utf32Char
theUCharNext: Standard_Utf32Char

Return
-------
float

Description
-----------
Compute advance to the next character with kerning applied when applicable. Assuming text rendered horizontally.
") AdvanceX;
		Standard_Real AdvanceX(const Standard_Utf32Char theUChar, const Standard_Utf32Char theUCharNext);

		/****** StdPrs_BRepFont::AdvanceY ******/
		/****** md5 signature: ddeb2265cd2bd26fe363410dd3b7e6e0 ******/
		%feature("compactdefaultargs") AdvanceY;
		%feature("autodoc", "
Parameters
----------
theUCharNext: Standard_Utf32Char

Return
-------
float

Description
-----------
Compute advance to the next character with kerning applied when applicable. Assuming text rendered vertically.
") AdvanceY;
		Standard_Real AdvanceY(const Standard_Utf32Char theUCharNext);

		/****** StdPrs_BRepFont::AdvanceY ******/
		/****** md5 signature: e611b288bad1f8a6d972468a7836ee16 ******/
		%feature("compactdefaultargs") AdvanceY;
		%feature("autodoc", "
Parameters
----------
theUChar: Standard_Utf32Char
theUCharNext: Standard_Utf32Char

Return
-------
float

Description
-----------
Compute advance to the next character with kerning applied when applicable. Assuming text rendered vertically.
") AdvanceY;
		Standard_Real AdvanceY(const Standard_Utf32Char theUChar, const Standard_Utf32Char theUCharNext);

		/****** StdPrs_BRepFont::Ascender ******/
		/****** md5 signature: 557783a64aa70a912a1e70d3023e6b77 ******/
		%feature("compactdefaultargs") Ascender;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return: vertical distance from the horizontal baseline to the highest character coordinate.
") Ascender;
		Standard_Real Ascender();

		/****** StdPrs_BRepFont::Descender ******/
		/****** md5 signature: 1ac5f46c4e3c54b4ea51e2bc3b666449 ******/
		%feature("compactdefaultargs") Descender;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return: vertical distance from the horizontal baseline to the lowest character coordinate.
") Descender;
		Standard_Real Descender();

		/****** StdPrs_BRepFont::FTFont ******/
		/****** md5 signature: 4d514b718d712295641b4c0cc60834d8 ******/
		%feature("compactdefaultargs") FTFont;
		%feature("autodoc", "Return
-------
opencascade::handle<Font_FTFont>

Description
-----------
Return wrapper over FreeType font.
") FTFont;
		const opencascade::handle<Font_FTFont> & FTFont();

		/****** StdPrs_BRepFont::FindAndCreate ******/
		/****** md5 signature: 372fe3fc63150aec0ee289ddf806595a ******/
		%feature("compactdefaultargs") FindAndCreate;
		%feature("autodoc", "
Parameters
----------
theFontName: str
theFontAspect: Font_FontAspect
theSize: float
theStrictLevel: Font_StrictLevel (optional, default to Font_StrictLevel_Any)

Return
-------
opencascade::handle<StdPrs_BRepFont>

Description
-----------
Find the font Initialize the font. 
Parameter theFontName the font name 
Parameter theFontAspect the font style 
Parameter theSize the face size in model units 
Parameter theStrictLevel search strict level for using aliases and fallback 
Return: true on success.
") FindAndCreate;
		static opencascade::handle<StdPrs_BRepFont> FindAndCreate(TCollection_AsciiString theFontName, const Font_FontAspect theFontAspect, const Standard_Real theSize, const Font_StrictLevel theStrictLevel = Font_StrictLevel_Any);

		/****** StdPrs_BRepFont::FindAndInit ******/
		/****** md5 signature: 33bf264db4f7fb13be769117703cf8e4 ******/
		%feature("compactdefaultargs") FindAndInit;
		%feature("autodoc", "
Parameters
----------
theFontName: str
theFontAspect: Font_FontAspect
theSize: float
theStrictLevel: Font_StrictLevel (optional, default to Font_StrictLevel_Any)

Return
-------
bool

Description
-----------
Find (using Font_FontMgr) and initialize the font from the given name. Please take into account that size is specified NOT in typography points (pt.). If you need to specify size in points, value should be converted. Formula for pt. -> m conversion: aSizeMeters = 0.0254 * theSizePt / 72.0 
Parameter theFontName the font name 
Parameter theFontAspect the font style 
Parameter theSize the face size in model units 
Parameter theStrictLevel search strict level for using aliases and fallback 
Return: true on success.
") FindAndInit;
		bool FindAndInit(TCollection_AsciiString theFontName, const Font_FontAspect theFontAspect, const Standard_Real theSize, const Font_StrictLevel theStrictLevel = Font_StrictLevel_Any);

		/****** StdPrs_BRepFont::Init ******/
		/****** md5 signature: 14deab12f664b3e6a0b208965809fe62 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theFontPath: NCollection_String
theSize: float
theFaceId: int

Return
-------
bool

Description
-----------
Initialize the font. 
Parameter theFontPath FULL path to the font 
Parameter theSize the face size in model units 
Parameter theFaceId face id within the file (0 by default) 
Return: true on success.
") Init;
		bool Init(const NCollection_String & theFontPath, const Standard_Real theSize, const Standard_Integer theFaceId);

		/****** StdPrs_BRepFont::Init ******/
		/****** md5 signature: 5ed045caef5b4cad065c651482b98255 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theFontName: NCollection_String
theFontAspect: Font_FontAspect
theSize: float

Return
-------
bool

Description
-----------
Find (using Font_FontMgr) and initialize the font from the given name. Alias for FindAndInit() for backward compatibility.
") Init;
		bool Init(const NCollection_String & theFontName, const Font_FontAspect theFontAspect, const Standard_Real theSize);

		/****** StdPrs_BRepFont::LineSpacing ******/
		/****** md5 signature: 3f893468c66eb56fd7ce68c882d953c8 ******/
		%feature("compactdefaultargs") LineSpacing;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return: default line spacing (the baseline-to-baseline distance).
") LineSpacing;
		Standard_Real LineSpacing();

		/****** StdPrs_BRepFont::Mutex ******/
		/****** md5 signature: 902e13b2343e132a88f2b4c5433ad6d8 ******/
		%feature("compactdefaultargs") Mutex;
		%feature("autodoc", "Return
-------
Standard_Mutex

Description
-----------
Returns mutex.
") Mutex;
		Standard_Mutex & Mutex();

		/****** StdPrs_BRepFont::PointSize ******/
		/****** md5 signature: a9867d84cde33572abbc3c90ffa97681 ******/
		%feature("compactdefaultargs") PointSize;
		%feature("autodoc", "Return
-------
float

Description
-----------
Configured point size.
") PointSize;
		Standard_Real PointSize();

		/****** StdPrs_BRepFont::Release ******/
		/****** md5 signature: b6fd00166214731bccdaabb58b7e4102 ******/
		%feature("compactdefaultargs") Release;
		%feature("autodoc", "Return
-------
None

Description
-----------
Release currently loaded font.
") Release;
		virtual void Release();

		/****** StdPrs_BRepFont::RenderGlyph ******/
		/****** md5 signature: 2951ebf93713dc5641da578f21061f63 ******/
		%feature("compactdefaultargs") RenderGlyph;
		%feature("autodoc", "
Parameters
----------
theChar: Standard_Utf32Char

Return
-------
TopoDS_Shape

Description
-----------
Render single glyph as TopoDS_Shape. 
Parameter theChar glyph identifier 
Return: rendered glyph within cache, might be NULL shape.
") RenderGlyph;
		TopoDS_Shape RenderGlyph(const Standard_Utf32Char & theChar);

		/****** StdPrs_BRepFont::Scale ******/
		/****** md5 signature: fff8b387c443c3e852a1bfc198a5a373 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns scaling factor for current font size.
") Scale;
		Standard_Real Scale();

		/****** StdPrs_BRepFont::SetCompositeCurveMode ******/
		/****** md5 signature: 8ce8079e93dd55c18a3ec2e70ee280d6 ******/
		%feature("compactdefaultargs") SetCompositeCurveMode;
		%feature("autodoc", "
Parameters
----------
theToConcatenate: bool

Return
-------
None

Description
-----------
Setup glyph geometry construction mode. By default algorithm creates independent TopoDS_Edge for each original curve in the glyph (line segment or Bezie curve). Algorithm might optionally create composite BSpline curve for each contour which reduces memory footprint but limits curve class to C0. Notice that altering this flag clears currently accumulated cache!.
") SetCompositeCurveMode;
		void SetCompositeCurveMode(const Standard_Boolean theToConcatenate);

		/****** StdPrs_BRepFont::SetWidthScaling ******/
		/****** md5 signature: 04deb132fe6b213fa451e36d262acdbd ******/
		%feature("compactdefaultargs") SetWidthScaling;
		%feature("autodoc", "
Parameters
----------
theScaleFactor: float

Return
-------
None

Description
-----------
Setup glyph scaling along X-axis. By default glyphs are not scaled (scaling factor = 1.0).
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
		/****** StdPrs_BRepTextBuilder::Perform ******/
		/****** md5 signature: facc6a1fc84ac3434277cfed9d55f021 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theFont: StdPrs_BRepFont
theFormatter: Font_TextFormatter
thePenLoc: gp_Ax3 (optional, default to gp_Ax3())

Return
-------
TopoDS_Shape

Description
-----------
Render text as BRep shape. 
Parameter theFormatter formatter which defines aligned text 
Parameter thePenLoc start position and orientation on the baseline 
Return: result shape with pen transformation applied as shape location.
") Perform;
		TopoDS_Shape Perform(StdPrs_BRepFont & theFont, const opencascade::handle<Font_TextFormatter> & theFormatter, const gp_Ax3 & thePenLoc = gp_Ax3());

		/****** StdPrs_BRepTextBuilder::Perform ******/
		/****** md5 signature: eac7909f64fbc8be0df2a0aba1c2b658 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theFont: StdPrs_BRepFont
theString: NCollection_String
thePenLoc: gp_Ax3 (optional, default to gp_Ax3())
theHAlign: Graphic3d_HorizontalTextAlignment (optional, default to Graphic3d_HTA_LEFT)
theVAlign: Graphic3d_VerticalTextAlignment (optional, default to Graphic3d_VTA_BOTTOM)

Return
-------
TopoDS_Shape

Description
-----------
Render text as BRep shape. 
Parameter theString text in UTF-8 encoding 
Parameter thePenLoc start position and orientation on the baseline 
Parameter theHAlign horizontal alignment of the text 
Parameter theVAlign vertical alignment of the text 
Return: result shape with pen transformation applied as shape location.
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
		/****** StdPrs_Curve::Add ******/
		/****** md5 signature: ecd0a0350b8a63aec33bccaa23d19556 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aPresentation: Prs3d_Presentation
aCurve: Adaptor3d_Curve
aDrawer: Prs3d_Drawer
drawCurve: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Adds to the presentation aPresentation the drawing of the curve aCurve. The aspect is defined by LineAspect in aDrawer. If drawCurve equals Standard_False the curve will not be displayed, it is used if the curve is a part of some shape and PrimitiveArray visualization approach is activated (it is activated by default).
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & aPresentation, const Adaptor3d_Curve & aCurve, const opencascade::handle<Prs3d_Drawer> & aDrawer, const Standard_Boolean drawCurve = Standard_True);

		/****** StdPrs_Curve::Add ******/
		/****** md5 signature: d8dde21367418e11a33b31c5c3f950dd ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aPresentation: Prs3d_Presentation
aCurve: Adaptor3d_Curve
U1: float
U2: float
aDrawer: Prs3d_Drawer
drawCurve: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Adds to the presentation aPresentation the drawing of the curve aCurve. The aspect is defined by LineAspect in aDrawer. The drawing will be limited between the points of parameter U1 and U2. If drawCurve equals Standard_False the curve will not be displayed, it is used if the curve is a part of some shape and PrimitiveArray visualization approach is activated (it is activated by default).
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & aPresentation, const Adaptor3d_Curve & aCurve, const Standard_Real U1, const Standard_Real U2, const opencascade::handle<Prs3d_Drawer> & aDrawer, const Standard_Boolean drawCurve = Standard_True);

		/****** StdPrs_Curve::Add ******/
		/****** md5 signature: 17b8aa9fa3fbb8163ed09605f5f1a057 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aPresentation: Prs3d_Presentation
aCurve: Adaptor3d_Curve
aDrawer: Prs3d_Drawer
Points: TColgp_SequenceOfPnt
drawCurve: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
adds to the presentation aPresentation the drawing of the curve aCurve. The aspect is the current aspect. aDeflection is used in the circle case. Points give a sequence of curve points. If drawCurve equals Standard_False the curve will not be displayed, it is used if the curve is a part of some shape and PrimitiveArray visualization approach is activated (it is activated by default).
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & aPresentation, const Adaptor3d_Curve & aCurve, const opencascade::handle<Prs3d_Drawer> & aDrawer, TColgp_SequenceOfPnt & Points, const Standard_Boolean drawCurve = Standard_True);

		/****** StdPrs_Curve::Add ******/
		/****** md5 signature: cf52a609a5fb4eb4b458dba149dadd40 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aPresentation: Prs3d_Presentation
aCurve: Adaptor3d_Curve
U1: float
U2: float
Points: TColgp_SequenceOfPnt
aNbPoints: int (optional, default to 30)
drawCurve: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
adds to the presentation aPresentation the drawing of the curve aCurve. The aspect is the current aspect. The drawing will be limited between the points of parameter U1 and U2. aDeflection is used in the circle case. Points give a sequence of curve points. If drawCurve equals Standard_False the curve will not be displayed, it is used if the curve is a part of some shape and PrimitiveArray visualization approach is activated (it is activated by default).
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & aPresentation, const Adaptor3d_Curve & aCurve, const Standard_Real U1, const Standard_Real U2, TColgp_SequenceOfPnt & Points, const Standard_Integer aNbPoints = 30, const Standard_Boolean drawCurve = Standard_True);

		/****** StdPrs_Curve::Match ******/
		/****** md5 signature: 4edef5e09e28fc3f4977319a2a5c96b3 ******/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "
Parameters
----------
X: float
Y: float
Z: float
aDistance: float
aCurve: Adaptor3d_Curve
aDrawer: Prs3d_Drawer

Return
-------
bool

Description
-----------
returns true if the distance between the point (X,Y,Z) and the drawing of the curve is less than aDistance.
") Match;
		static Standard_Boolean Match(const Standard_Real X, const Standard_Real Y, const Standard_Real Z, const Standard_Real aDistance, const Adaptor3d_Curve & aCurve, const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****** StdPrs_Curve::Match ******/
		/****** md5 signature: 2fc416047c48db14019e95b5eb6bce1c ******/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "
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

Return
-------
bool

Description
-----------
returns true if the distance between the point (X,Y,Z) and the drawing of the curve is less than aDistance.
") Match;
		static Standard_Boolean Match(const Standard_Real X, const Standard_Real Y, const Standard_Real Z, const Standard_Real aDistance, const Adaptor3d_Curve & aCurve, const Standard_Real aDeflection, const Standard_Real aLimit, const Standard_Integer aNbPoints);

		/****** StdPrs_Curve::Match ******/
		/****** md5 signature: bdc9e4d32789999c268047db86dbb9da ******/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "
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

Return
-------
bool

Description
-----------
returns true if the distance between the point (X,Y,Z) and the drawing of the curve aCurve is less than aDistance. The drawing is considered between the points of parameter U1 and U2;.
") Match;
		static Standard_Boolean Match(const Standard_Real X, const Standard_Real Y, const Standard_Real Z, const Standard_Real aDistance, const Adaptor3d_Curve & aCurve, const Standard_Real U1, const Standard_Real U2, const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****** StdPrs_Curve::Match ******/
		/****** md5 signature: 7878a79a49cb16a7e3a81c9bceaeb037 ******/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "
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

Return
-------
bool

Description
-----------
returns true if the distance between the point (X,Y,Z) and the drawing of the curve aCurve is less than aDistance. The drawing is considered between the points of parameter U1 and U2;.
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
		/****** StdPrs_HLRShapeI::ComputeHLR ******/
		/****** md5 signature: ed8d67b024e7d5529491da79ff84ac31 ******/
		%feature("compactdefaultargs") ComputeHLR;
		%feature("autodoc", "
Parameters
----------
thePrs: Prs3d_Presentation
theShape: TopoDS_Shape
theDrawer: Prs3d_Drawer
theProjector: Graphic3d_Camera

Return
-------
None

Description
-----------
Compute presentation for specified shape.
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
		/****** StdPrs_HLRToolShape::StdPrs_HLRToolShape ******/
		/****** md5 signature: c53fe71882e835afad0e889fbf7e146b ******/
		%feature("compactdefaultargs") StdPrs_HLRToolShape;
		%feature("autodoc", "
Parameters
----------
TheShape: TopoDS_Shape
TheProjector: HLRAlgo_Projector

Return
-------
None

Description
-----------
No available documentation.
") StdPrs_HLRToolShape;
		 StdPrs_HLRToolShape(const TopoDS_Shape & TheShape, const HLRAlgo_Projector & TheProjector);

		/****** StdPrs_HLRToolShape::Hidden ******/
		/****** md5 signature: 608caa8ffc41ac4b6b1a899608b1940c ******/
		%feature("compactdefaultargs") Hidden;
		%feature("autodoc", "
Parameters
----------
TheEdge: BRepAdaptor_Curve

Return
-------
U1: float
U2: float

Description
-----------
No available documentation.
") Hidden;
		void Hidden(BRepAdaptor_Curve & TheEdge, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** StdPrs_HLRToolShape::InitHidden ******/
		/****** md5 signature: e773bda49c18e0f29137e21c2658a5e8 ******/
		%feature("compactdefaultargs") InitHidden;
		%feature("autodoc", "
Parameters
----------
EdgeNumber: int

Return
-------
None

Description
-----------
No available documentation.
") InitHidden;
		void InitHidden(const Standard_Integer EdgeNumber);

		/****** StdPrs_HLRToolShape::InitVisible ******/
		/****** md5 signature: d6020b6b1d02e2782cfa8398847f0258 ******/
		%feature("compactdefaultargs") InitVisible;
		%feature("autodoc", "
Parameters
----------
EdgeNumber: int

Return
-------
None

Description
-----------
No available documentation.
") InitVisible;
		void InitVisible(const Standard_Integer EdgeNumber);

		/****** StdPrs_HLRToolShape::MoreHidden ******/
		/****** md5 signature: 3b15b62a78bddb9bfa7464762d6947d6 ******/
		%feature("compactdefaultargs") MoreHidden;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreHidden;
		Standard_Boolean MoreHidden();

		/****** StdPrs_HLRToolShape::MoreVisible ******/
		/****** md5 signature: 7cca41fab7d11924952196a9afb1cb46 ******/
		%feature("compactdefaultargs") MoreVisible;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreVisible;
		Standard_Boolean MoreVisible();

		/****** StdPrs_HLRToolShape::NbEdges ******/
		/****** md5 signature: b4dae8fc9e9992109d200aaac9bd9ada ******/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbEdges;
		Standard_Integer NbEdges();

		/****** StdPrs_HLRToolShape::NextHidden ******/
		/****** md5 signature: e264eab7635073c92511d973f449cac3 ******/
		%feature("compactdefaultargs") NextHidden;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextHidden;
		void NextHidden();

		/****** StdPrs_HLRToolShape::NextVisible ******/
		/****** md5 signature: 58f9164627fb81fb53c82fbb8a4e698b ******/
		%feature("compactdefaultargs") NextVisible;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextVisible;
		void NextVisible();

		/****** StdPrs_HLRToolShape::Visible ******/
		/****** md5 signature: 92f628a6a81a08729ea3a539b7dd9728 ******/
		%feature("compactdefaultargs") Visible;
		%feature("autodoc", "
Parameters
----------
TheEdge: BRepAdaptor_Curve

Return
-------
U1: float
U2: float

Description
-----------
No available documentation.
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
		/****** StdPrs_Isolines::Add ******/
		/****** md5 signature: 01f40ed4679e1484c088196742d4b41a ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
thePresentation: Prs3d_Presentation
theFace: TopoDS_Face
theDrawer: Prs3d_Drawer
theDeflection: float

Return
-------
None

Description
-----------
Computes isolines presentation for a TopoDS face. This method chooses proper version of isoline builder algorithm: on triangulation or surface depending on the flag passed from Prs3d_Drawer attributes. This method is a default way to display isolines for a given TopoDS face. 
Input parameter: thePresentation the presentation. 
Input parameter: theFace the face. 
Input parameter: theDrawer the display settings. 
Input parameter: theDeflection the deflection for isolines-on-surface version.
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & thePresentation, const TopoDS_Face & theFace, const opencascade::handle<Prs3d_Drawer> & theDrawer, const Standard_Real theDeflection);

		/****** StdPrs_Isolines::Add ******/
		/****** md5 signature: 5de803694dec54609521ff59e1207e6a ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theDrawer: Prs3d_Drawer
theDeflection: float
theUPolylines: Prs3d_NListOfSequenceOfPnt
theVPolylines: Prs3d_NListOfSequenceOfPnt

Return
-------
None

Description
-----------
Computes isolines presentation for a TopoDS face. This method chooses proper version of isoline builder algorithm: on triangulation or surface depending on the flag passed from Prs3d_Drawer attributes. This method is a default way to display isolines for a given TopoDS face. 
Input parameter: theFace the face. 
Input parameter: theDrawer the display settings. 
Input parameter: theDeflection the deflection for isolines-on-surface version.
") Add;
		static void Add(const TopoDS_Face & theFace, const opencascade::handle<Prs3d_Drawer> & theDrawer, const Standard_Real theDeflection, Prs3d_NListOfSequenceOfPnt & theUPolylines, Prs3d_NListOfSequenceOfPnt & theVPolylines);

		/****** StdPrs_Isolines::AddOnSurface ******/
		/****** md5 signature: 5eb1a603556cd8cc0d70c55c9e3429fa ******/
		%feature("compactdefaultargs") AddOnSurface;
		%feature("autodoc", "
Parameters
----------
thePresentation: Prs3d_Presentation
theFace: TopoDS_Face
theDrawer: Prs3d_Drawer
theDeflection: float

Return
-------
None

Description
-----------
Computes isolines on surface and adds them to presentation. 
Input parameter: thePresentation the presentation. 
Input parameter: theFace the face. 
Input parameter: theDrawer the display settings. 
Input parameter: theDeflection the deflection value.
") AddOnSurface;
		static void AddOnSurface(const opencascade::handle<Prs3d_Presentation> & thePresentation, const TopoDS_Face & theFace, const opencascade::handle<Prs3d_Drawer> & theDrawer, const Standard_Real theDeflection);

		/****** StdPrs_Isolines::AddOnSurface ******/
		/****** md5 signature: de23598b27c666694d6ad57b6ac01a3b ******/
		%feature("compactdefaultargs") AddOnSurface;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theDrawer: Prs3d_Drawer
theDeflection: float
theUPolylines: Prs3d_NListOfSequenceOfPnt
theVPolylines: Prs3d_NListOfSequenceOfPnt

Return
-------
None

Description
-----------
Computes isolines on surface and adds them to presentation. 
Input parameter: theFace the face 
Input parameter: theDrawer the display settings 
Input parameter: theDeflection the deflection value @param[out] theUPolylines the sequence of result polylines @param[out] theVPolylines the sequence of result polylines.
") AddOnSurface;
		static void AddOnSurface(const TopoDS_Face & theFace, const opencascade::handle<Prs3d_Drawer> & theDrawer, const Standard_Real theDeflection, Prs3d_NListOfSequenceOfPnt & theUPolylines, Prs3d_NListOfSequenceOfPnt & theVPolylines);

		/****** StdPrs_Isolines::AddOnSurface ******/
		/****** md5 signature: df3d10afd0ae22442b9d52062f1fc4a4 ******/
		%feature("compactdefaultargs") AddOnSurface;
		%feature("autodoc", "
Parameters
----------
thePresentation: Prs3d_Presentation
theSurface: BRepAdaptor_Surface
theDrawer: Prs3d_Drawer
theDeflection: float
theUIsoParams: TColStd_SequenceOfReal
theVIsoParams: TColStd_SequenceOfReal

Return
-------
None

Description
-----------
Computes isolines on surface and adds them to presentation. 
Input parameter: thePresentation the presentation. 
Input parameter: theSurface the surface. 
Input parameter: theDrawer the display settings. 
Input parameter: theDeflection the deflection value. 
Input parameter: theUIsoParams the parameters of u isolines to compute. 
Input parameter: theVIsoParams the parameters of v isolines to compute.
") AddOnSurface;
		static void AddOnSurface(const opencascade::handle<Prs3d_Presentation> & thePresentation, const opencascade::handle<BRepAdaptor_Surface> & theSurface, const opencascade::handle<Prs3d_Drawer> & theDrawer, const Standard_Real theDeflection, const TColStd_SequenceOfReal & theUIsoParams, const TColStd_SequenceOfReal & theVIsoParams);

		/****** StdPrs_Isolines::AddOnTriangulation ******/
		/****** md5 signature: edc7640cc9248e14e63a44d5f239dbf2 ******/
		%feature("compactdefaultargs") AddOnTriangulation;
		%feature("autodoc", "
Parameters
----------
thePresentation: Prs3d_Presentation
theFace: TopoDS_Face
theDrawer: Prs3d_Drawer

Return
-------
None

Description
-----------
Computes isolines on triangulation and adds them to a presentation. 
Input parameter: thePresentation the presentation. 
Input parameter: theFace the face. 
Input parameter: theDrawer the display settings.
") AddOnTriangulation;
		static void AddOnTriangulation(const opencascade::handle<Prs3d_Presentation> & thePresentation, const TopoDS_Face & theFace, const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****** StdPrs_Isolines::AddOnTriangulation ******/
		/****** md5 signature: 2a1e1df2f916fded41ad5b7bd67fd011 ******/
		%feature("compactdefaultargs") AddOnTriangulation;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theDrawer: Prs3d_Drawer
theUPolylines: Prs3d_NListOfSequenceOfPnt
theVPolylines: Prs3d_NListOfSequenceOfPnt

Return
-------
None

Description
-----------
Computes isolines on triangulation. 
Input parameter: theFace the face. 
Input parameter: theDrawer the display settings. @param[out] theUPolylines the sequence of result polylines @param[out] theVPolylines the sequence of result polylines.
") AddOnTriangulation;
		static void AddOnTriangulation(const TopoDS_Face & theFace, const opencascade::handle<Prs3d_Drawer> & theDrawer, Prs3d_NListOfSequenceOfPnt & theUPolylines, Prs3d_NListOfSequenceOfPnt & theVPolylines);

		/****** StdPrs_Isolines::AddOnTriangulation ******/
		/****** md5 signature: 23b63c464969b08203f007b023922e4c ******/
		%feature("compactdefaultargs") AddOnTriangulation;
		%feature("autodoc", "
Parameters
----------
thePresentation: Prs3d_Presentation
theTriangulation: Poly_Triangulation
theSurface: Geom_Surface
theLocation: TopLoc_Location
theDrawer: Prs3d_Drawer
theUIsoParams: TColStd_SequenceOfReal
theVIsoParams: TColStd_SequenceOfReal

Return
-------
None

Description
-----------
Computes isolines on triangulation and adds them to a presentation. 
Input parameter: thePresentation the presentation. 
Input parameter: theTriangulation the triangulation. 
Input parameter: theSurface the definition of triangulated surface. The surface adapter is used to precisely evaluate isoline points using surface law and fit them on triangulation. If NULL is passed, the method will use linear interpolation of triangle node's UV coordinates to evaluate isoline points. 
Input parameter: theLocation the location transformation defined for triangulation (surface). 
Input parameter: theDrawer the display settings. 
Input parameter: theUIsoParams the parameters of u isolines to compute. 
Input parameter: theVIsoParams the parameters of v isolines to compute.
") AddOnTriangulation;
		static void AddOnTriangulation(const opencascade::handle<Prs3d_Presentation> & thePresentation, const opencascade::handle<Poly_Triangulation> & theTriangulation, const opencascade::handle<Geom_Surface> & theSurface, const TopLoc_Location & theLocation, const opencascade::handle<Prs3d_Drawer> & theDrawer, const TColStd_SequenceOfReal & theUIsoParams, const TColStd_SequenceOfReal & theVIsoParams);

		/****** StdPrs_Isolines::UVIsoParameters ******/
		/****** md5 signature: 624d137e5f58c70fc47c9a4a74925873 ******/
		%feature("compactdefaultargs") UVIsoParameters;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theNbIsoU: int
theNbIsoV: int
theUVLimit: float
theUIsoParams: TColStd_SequenceOfReal
theVIsoParams: TColStd_SequenceOfReal

Return
-------
theUmin: float
theUmax: float
theVmin: float
theVmax: float

Description
-----------
Evaluate sequence of parameters for drawing uv isolines for a given face. 
Input parameter: theFace the face. 
Input parameter: theNbIsoU the number of u isolines. 
Input parameter: theNbIsoV the number of v isolines. 
Input parameter: theUVLimit the u, v parameter value limit. @param[out] theUIsoParams the sequence of u isoline parameters. @param[out] theVIsoParams the sequence of v isoline parameters. @param[out] theUmin the lower U boundary of theFace. @param[out] theUmax the upper U boundary of theFace. @param[out] theVmin the lower V boundary of theFace. @param[out] theVmax the upper V boundary of theFace.
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
		/****** StdPrs_Plane::Add ******/
		/****** md5 signature: 53550c107b88614e5cb49b350ae75131 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aPresentation: Prs3d_Presentation
aPlane: Adaptor3d_Surface
aDrawer: Prs3d_Drawer

Return
-------
None

Description
-----------
Defines display of infinite planes. The infinite plane aPlane is added to the display aPresentation, and the attributes of the display are defined by the attribute manager aDrawer.
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & aPresentation, const Adaptor3d_Surface & aPlane, const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****** StdPrs_Plane::Match ******/
		/****** md5 signature: 7b7156f4fe814b1640708e811a47f58e ******/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "
Parameters
----------
X: float
Y: float
Z: float
aDistance: float
aPlane: Adaptor3d_Surface
aDrawer: Prs3d_Drawer

Return
-------
bool

Description
-----------
returns true if the distance between the point (X,Y,Z) and the plane is less than aDistance.
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
		/****** StdPrs_PoleCurve::Add ******/
		/****** md5 signature: 9daca4a2363925180e48bad4d47cb26d ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aPresentation: Prs3d_Presentation
aCurve: Adaptor3d_Curve
aDrawer: Prs3d_Drawer

Return
-------
None

Description
-----------
Defines display of BSpline and Bezier curves. Adds the 3D curve aCurve to the StdPrs_PoleCurve algorithm. This shape is found in the presentation object aPresentation, and its display attributes are set in the attribute manager aDrawer. The curve object from Adaptor3d provides data from a Geom curve. This makes it possible to use the surface in a geometric algorithm.
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & aPresentation, const Adaptor3d_Curve & aCurve, const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****** StdPrs_PoleCurve::Match ******/
		/****** md5 signature: 4edef5e09e28fc3f4977319a2a5c96b3 ******/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "
Parameters
----------
X: float
Y: float
Z: float
aDistance: float
aCurve: Adaptor3d_Curve
aDrawer: Prs3d_Drawer

Return
-------
bool

Description
-----------
returns true if the distance between the point (X,Y,Z) and the broken line made of the poles is less then aDistance.
") Match;
		static Standard_Boolean Match(const Standard_Real X, const Standard_Real Y, const Standard_Real Z, const Standard_Real aDistance, const Adaptor3d_Curve & aCurve, const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****** StdPrs_PoleCurve::Pick ******/
		/****** md5 signature: 110350faab9ea047534f7a57de6d598c ******/
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "
Parameters
----------
X: float
Y: float
Z: float
aDistance: float
aCurve: Adaptor3d_Curve
aDrawer: Prs3d_Drawer

Return
-------
int

Description
-----------
returns the pole the most near of the point (X,Y,Z) and returns its range. The distance between the pole and (X,Y,Z) must be less then aDistance. If no pole corresponds, 0 is returned.
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
		/****** StdPrs_ShadedShape::Add ******/
		/****** md5 signature: eb25cffb7e72ca49100cdcc43a05ee8c ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
thePresentation: Prs3d_Presentation
theShape: TopoDS_Shape
theDrawer: Prs3d_Drawer
theVolume: StdPrs_Volume (optional, default to StdPrs_Volume_Autodetection)
theGroup: Graphic3d_Group (optional, default to NULL)

Return
-------
None

Description
-----------
Shades <theShape>. 
Parameter theVolumeType defines the way how to interpret input shapes - as Closed volumes (to activate back-face culling and capping plane algorithms), as Open volumes (shells or solids with holes) or to perform Autodetection (would split input shape into two groups).
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & thePresentation, const TopoDS_Shape & theShape, const opencascade::handle<Prs3d_Drawer> & theDrawer, const StdPrs_Volume theVolume = StdPrs_Volume_Autodetection, const opencascade::handle<Graphic3d_Group> & theGroup = NULL);

		/****** StdPrs_ShadedShape::Add ******/
		/****** md5 signature: c2784d9b78f332340fcb1d6c9293a2a1 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
thePresentation: Prs3d_Presentation
theShape: TopoDS_Shape
theDrawer: Prs3d_Drawer
theHasTexels: bool
theUVOrigin: gp_Pnt2d
theUVRepeat: gp_Pnt2d
theUVScale: gp_Pnt2d
theVolume: StdPrs_Volume (optional, default to StdPrs_Volume_Autodetection)
theGroup: Graphic3d_Group (optional, default to NULL)

Return
-------
None

Description
-----------
Shades <theShape> with texture coordinates. 
Parameter theVolumeType defines the way how to interpret input shapes - as Closed volumes (to activate back-face culling and capping plane algorithms), as Open volumes (shells or solids with holes) or to perform Autodetection (would split input shape into two groups).
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & thePresentation, const TopoDS_Shape & theShape, const opencascade::handle<Prs3d_Drawer> & theDrawer, const Standard_Boolean theHasTexels, const gp_Pnt2d & theUVOrigin, const gp_Pnt2d & theUVRepeat, const gp_Pnt2d & theUVScale, const StdPrs_Volume theVolume = StdPrs_Volume_Autodetection, const opencascade::handle<Graphic3d_Group> & theGroup = NULL);

		/****** StdPrs_ShadedShape::AddWireframeForFacesWithoutTriangles ******/
		/****** md5 signature: 2399101e036cd3b0540bfa37732d6fc1 ******/
		%feature("compactdefaultargs") AddWireframeForFacesWithoutTriangles;
		%feature("autodoc", "
Parameters
----------
thePrs: Prs3d_Presentation
theShape: TopoDS_Shape
theDrawer: Prs3d_Drawer

Return
-------
None

Description
-----------
Computes special wireframe presentation for faces without triangulation.
") AddWireframeForFacesWithoutTriangles;
		static void AddWireframeForFacesWithoutTriangles(const opencascade::handle<Prs3d_Presentation> & thePrs, const TopoDS_Shape & theShape, const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****** StdPrs_ShadedShape::AddWireframeForFreeElements ******/
		/****** md5 signature: 4a6b6d1e9376f6a4071ba3fddb19b6e7 ******/
		%feature("compactdefaultargs") AddWireframeForFreeElements;
		%feature("autodoc", "
Parameters
----------
thePrs: Prs3d_Presentation
theShape: TopoDS_Shape
theDrawer: Prs3d_Drawer

Return
-------
None

Description
-----------
Computes wireframe presentation for free wires and vertices.
") AddWireframeForFreeElements;
		static void AddWireframeForFreeElements(const opencascade::handle<Prs3d_Presentation> & thePrs, const TopoDS_Shape & theShape, const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****** StdPrs_ShadedShape::ExploreSolids ******/
		/****** md5 signature: 0f56ef8bb3796d73330266647168b092 ******/
		%feature("compactdefaultargs") ExploreSolids;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theBuilder: BRep_Builder
theClosed: TopoDS_Compound
theOpened: TopoDS_Compound
theIgnore1DSubShape: bool

Return
-------
None

Description
-----------
Searches closed and unclosed subshapes in shape structure and puts them into two compounds for separate processing of closed and unclosed sub-shapes.
") ExploreSolids;
		static void ExploreSolids(const TopoDS_Shape & theShape, const BRep_Builder & theBuilder, TopoDS_Compound & theClosed, TopoDS_Compound & theOpened, const Standard_Boolean theIgnore1DSubShape);

		/****** StdPrs_ShadedShape::FillFaceBoundaries ******/
		/****** md5 signature: c71acba81e6e66888a517542dedd393f ******/
		%feature("compactdefaultargs") FillFaceBoundaries;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theUpperContinuity: GeomAbs_Shape (optional, default to GeomAbs_CN)

Return
-------
opencascade::handle<Graphic3d_ArrayOfSegments>

Description
-----------
Define primitive array of boundary segments for specified shape. 
Parameter theShape segments array or NULL if specified face does not have computed triangulation 
Parameter theUpperContinuity the most edge continuity class to be included to result (edges with more continuity will be ignored).
") FillFaceBoundaries;
		static opencascade::handle<Graphic3d_ArrayOfSegments> FillFaceBoundaries(const TopoDS_Shape & theShape, GeomAbs_Shape theUpperContinuity = GeomAbs_CN);

		/****** StdPrs_ShadedShape::FillTriangles ******/
		/****** md5 signature: e16449a471e532f571ac21e2c069aae7 ******/
		%feature("compactdefaultargs") FillTriangles;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
opencascade::handle<Graphic3d_ArrayOfTriangles>

Description
-----------
Create primitive array with triangles for specified shape. 
Input parameter: theShape the shape with precomputed triangulation.
") FillTriangles;
		static opencascade::handle<Graphic3d_ArrayOfTriangles> FillTriangles(const TopoDS_Shape & theShape);

		/****** StdPrs_ShadedShape::FillTriangles ******/
		/****** md5 signature: 419ad4ac31337bdc5a11e70e08df782e ******/
		%feature("compactdefaultargs") FillTriangles;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theHasTexels: bool
theUVOrigin: gp_Pnt2d
theUVRepeat: gp_Pnt2d
theUVScale: gp_Pnt2d

Return
-------
opencascade::handle<Graphic3d_ArrayOfTriangles>

Description
-----------
Create primitive array of triangles for specified shape. 
Parameter theShape the shape with precomputed triangulation 
Parameter theHasTexels define UV coordinates in primitive array 
Parameter theUVOrigin origin for UV coordinates 
Parameter theUVRepeat repeat parameters for UV coordinates 
Parameter theUVScale scale coefficients for UV coordinates 
Return: triangles array or NULL if specified face does not have computed triangulation.
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
		/****** StdPrs_ShadedSurface::Add ******/
		/****** md5 signature: 99d22d631390f82303e47347333bc1c0 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aPresentation: Prs3d_Presentation
aSurface: Adaptor3d_Surface
aDrawer: Prs3d_Drawer

Return
-------
None

Description
-----------
Adds the surface aSurface to the presentation object aPresentation. The surface's display attributes are set in the attribute manager aDrawer. The surface object from Adaptor3d provides data from a Geom surface in order to use the surface in an algorithm.
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
		/****** StdPrs_ShapeTool::StdPrs_ShapeTool ******/
		/****** md5 signature: b1cfe601c9ce69d7ecf53050fd390572 ******/
		%feature("compactdefaultargs") StdPrs_ShapeTool;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theAllVertices: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Constructs the tool and initializes it using theShape and theAllVertices (optional) arguments. By default, only isolated and internal vertices are considered, however if theAllVertices argument is equal to True, all shape's vertices are taken into account.
") StdPrs_ShapeTool;
		 StdPrs_ShapeTool(const TopoDS_Shape & theShape, const Standard_Boolean theAllVertices = Standard_False);

		/****** StdPrs_ShapeTool::CurrentTriangulation ******/
		/****** md5 signature: e174edc94303c301ad3d548683d6e8cf ******/
		%feature("compactdefaultargs") CurrentTriangulation;
		%feature("autodoc", "
Parameters
----------
l: TopLoc_Location

Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
No available documentation.
") CurrentTriangulation;
		opencascade::handle<Poly_Triangulation> CurrentTriangulation(TopLoc_Location & l);

		/****** StdPrs_ShapeTool::CurveBound ******/
		/****** md5 signature: 26827d6be3ffbbdaf33493171ed02d7d ******/
		%feature("compactdefaultargs") CurveBound;
		%feature("autodoc", "Return
-------
Bnd_Box

Description
-----------
No available documentation.
") CurveBound;
		Bnd_Box CurveBound();

		/****** StdPrs_ShapeTool::FaceBound ******/
		/****** md5 signature: f856e3a5aaaa04bd47251b5baf43000b ******/
		%feature("compactdefaultargs") FaceBound;
		%feature("autodoc", "Return
-------
Bnd_Box

Description
-----------
No available documentation.
") FaceBound;
		Bnd_Box FaceBound();

		/****** StdPrs_ShapeTool::FacesOfEdge ******/
		/****** md5 signature: 89082386bc651a78938e536e5113de7e ******/
		%feature("compactdefaultargs") FacesOfEdge;
		%feature("autodoc", "Return
-------
opencascade::handle<TopTools_HSequenceOfShape>

Description
-----------
No available documentation.
") FacesOfEdge;
		opencascade::handle<TopTools_HSequenceOfShape> FacesOfEdge();

		/****** StdPrs_ShapeTool::GetCurve ******/
		/****** md5 signature: ccf034d9f6867e07e3c267d12089ab5c ******/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
No available documentation.
") GetCurve;
		const TopoDS_Edge GetCurve();

		/****** StdPrs_ShapeTool::GetFace ******/
		/****** md5 signature: 24f906fe04f44088d93eb51a09d709c8 ******/
		%feature("compactdefaultargs") GetFace;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") GetFace;
		const TopoDS_Face GetFace();

		/****** StdPrs_ShapeTool::GetVertex ******/
		/****** md5 signature: e20d7c379b1b760b74a12ac040adc908 ******/
		%feature("compactdefaultargs") GetVertex;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
No available documentation.
") GetVertex;
		const TopoDS_Vertex GetVertex();

		/****** StdPrs_ShapeTool::HasCurve ******/
		/****** md5 signature: 24512d68611f1b569c1022347b56d2ba ******/
		%feature("compactdefaultargs") HasCurve;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasCurve;
		Standard_Boolean HasCurve();

		/****** StdPrs_ShapeTool::HasSurface ******/
		/****** md5 signature: e1636f96e3c29ca0e588fc628f12d790 ******/
		%feature("compactdefaultargs") HasSurface;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasSurface;
		Standard_Boolean HasSurface();

		/****** StdPrs_ShapeTool::InitCurve ******/
		/****** md5 signature: 623075abc819963427ae812711cc9f03 ******/
		%feature("compactdefaultargs") InitCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitCurve;
		void InitCurve();

		/****** StdPrs_ShapeTool::InitFace ******/
		/****** md5 signature: 431fdd4f7fe99cf2478ea6019e7b815d ******/
		%feature("compactdefaultargs") InitFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitFace;
		void InitFace();

		/****** StdPrs_ShapeTool::InitVertex ******/
		/****** md5 signature: 43387ca117473a5285f9b82f191285d3 ******/
		%feature("compactdefaultargs") InitVertex;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitVertex;
		void InitVertex();

		/****** StdPrs_ShapeTool::IsPlanarFace ******/
		/****** md5 signature: 6b8c88789eed31202251b15ca3358b7f ******/
		%feature("compactdefaultargs") IsPlanarFace;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPlanarFace;
		Standard_Boolean IsPlanarFace();

		/****** StdPrs_ShapeTool::IsPlanarFace ******/
		/****** md5 signature: dbd07f0e3771524116dd33a19d098b26 ******/
		%feature("compactdefaultargs") IsPlanarFace;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face

Return
-------
bool

Description
-----------
No available documentation.
") IsPlanarFace;
		static Standard_Boolean IsPlanarFace(const TopoDS_Face & theFace);

		/****** StdPrs_ShapeTool::MoreCurve ******/
		/****** md5 signature: 294b10d8505b397b80557f3ffd3abb0a ******/
		%feature("compactdefaultargs") MoreCurve;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreCurve;
		Standard_Boolean MoreCurve();

		/****** StdPrs_ShapeTool::MoreFace ******/
		/****** md5 signature: 22c1aefb1ce1d474b93921421f857dc9 ******/
		%feature("compactdefaultargs") MoreFace;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreFace;
		Standard_Boolean MoreFace();

		/****** StdPrs_ShapeTool::MoreVertex ******/
		/****** md5 signature: b1415b97c2e4eb4b2c3aafb5017477a3 ******/
		%feature("compactdefaultargs") MoreVertex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreVertex;
		Standard_Boolean MoreVertex();

		/****** StdPrs_ShapeTool::Neighbours ******/
		/****** md5 signature: f7632ca6a981fecfee9d23781ab8df33 ******/
		%feature("compactdefaultargs") Neighbours;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Neighbours;
		Standard_Integer Neighbours();

		/****** StdPrs_ShapeTool::NextCurve ******/
		/****** md5 signature: c84098e0d5846ddc5c1ef3cd9db559ef ******/
		%feature("compactdefaultargs") NextCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextCurve;
		void NextCurve();

		/****** StdPrs_ShapeTool::NextFace ******/
		/****** md5 signature: 70c1b251ca2c3b6097d728cd3445088e ******/
		%feature("compactdefaultargs") NextFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextFace;
		void NextFace();

		/****** StdPrs_ShapeTool::NextVertex ******/
		/****** md5 signature: ea714e35bf0fb8ca7ba7bf859d121153 ******/
		%feature("compactdefaultargs") NextVertex;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextVertex;
		void NextVertex();

		/****** StdPrs_ShapeTool::Polygon3D ******/
		/****** md5 signature: 3b403e8330a44f3bb52392ce5d5be05c ******/
		%feature("compactdefaultargs") Polygon3D;
		%feature("autodoc", "
Parameters
----------
l: TopLoc_Location

Return
-------
opencascade::handle<Poly_Polygon3D>

Description
-----------
No available documentation.
") Polygon3D;
		opencascade::handle<Poly_Polygon3D> Polygon3D(TopLoc_Location & l);

		/****** StdPrs_ShapeTool::PolygonOnTriangulation ******/
		/****** md5 signature: 86ca6ba9c814d8c843f2ef01be368f3b ******/
		%feature("compactdefaultargs") PolygonOnTriangulation;
		%feature("autodoc", "
Parameters
----------
Indices: Poly_PolygonOnTriangulation
T: Poly_Triangulation
l: TopLoc_Location

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StdPrs_ToolPoint::Coord ******/
		/****** md5 signature: e463034c9e9a03b9aaa89aab3731cce5 ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------
aPoint: Geom_Point

Return
-------
X: float
Y: float
Z: float

Description
-----------
No available documentation.
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
		/****** StdPrs_ToolRFace::StdPrs_ToolRFace ******/
		/****** md5 signature: f7aaeabc68c454c73e58a8d2488e1f21 ******/
		%feature("compactdefaultargs") StdPrs_ToolRFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StdPrs_ToolRFace;
		 StdPrs_ToolRFace();

		/****** StdPrs_ToolRFace::StdPrs_ToolRFace ******/
		/****** md5 signature: e7bc0fa23547e41ba692892564fc2893 ******/
		%feature("compactdefaultargs") StdPrs_ToolRFace;
		%feature("autodoc", "
Parameters
----------
aSurface: BRepAdaptor_Surface

Return
-------
None

Description
-----------
Constructor with initialization.
") StdPrs_ToolRFace;
		 StdPrs_ToolRFace(const opencascade::handle<BRepAdaptor_Surface> & aSurface);

		/****** StdPrs_ToolRFace::Edge ******/
		/****** md5 signature: be590cff987799d8b7c28083399d0e9f ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
Return current edge.
") Edge;
		const TopoDS_Edge Edge();

		/****** StdPrs_ToolRFace::Init ******/
		/****** md5 signature: ca2feb116ce485f3e8278f79ba5f5d53 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
Move iterator to the first element.
") Init;
		void Init();

		/****** StdPrs_ToolRFace::IsInvalidGeometry ******/
		/****** md5 signature: 0b90e0298ec2724bd48811a3a15e33a7 ******/
		%feature("compactdefaultargs") IsInvalidGeometry;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if NULL curves have been skipped.
") IsInvalidGeometry;
		Standard_Boolean IsInvalidGeometry();

		/****** StdPrs_ToolRFace::IsOriented ******/
		/****** md5 signature: ed5befe37b618bc14c188e7a5b194e85 ******/
		%feature("compactdefaultargs") IsOriented;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True indicating that iterator looks only for oriented edges.
") IsOriented;
		Standard_Boolean IsOriented();

		/****** StdPrs_ToolRFace::More ******/
		/****** md5 signature: cff271d3b32940da94bada40648f9096 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if iterator points to the curve.
") More;
		Standard_Boolean More();

		/****** StdPrs_ToolRFace::Next ******/
		/****** md5 signature: 1201a55f750036045cd397a65f07fc7d ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Go to the next curve in the face.
") Next;
		void Next();

		/****** StdPrs_ToolRFace::Orientation ******/
		/****** md5 signature: 03010048da537511bfd11160d3c898dc ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
Return current edge orientation.
") Orientation;
		TopAbs_Orientation Orientation();

		/****** StdPrs_ToolRFace::Value ******/
		/****** md5 signature: c4884397ce5b70aa76efc7c7db26e94e ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
Adaptor2d_Curve2d

Description
-----------
Return current curve.
") Value;
		Adaptor2d_Curve2d Value();

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
		/****** StdPrs_ToolTriangulatedShape::ClearOnOwnDeflectionChange ******/
		/****** md5 signature: 98477340457ba32a3ffb2857a082605a ******/
		%feature("compactdefaultargs") ClearOnOwnDeflectionChange;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theDrawer: Prs3d_Drawer
theToResetCoeff: bool

Return
-------
None

Description
-----------
If presentation has own deviation coefficient and IsAutoTriangulation() is true, function will compare actual coefficients with previous values and will clear triangulation on their change (regardless actual tessellation quality). Function is placed here for compatibility reasons - new code should avoid using IsAutoTriangulation(). 
Input parameter: theShape the shape 
Input parameter: theDrawer the display settings 
Input parameter: theToResetCoeff updates coefficients in theDrawer to actual state to avoid redundant recomputations.
") ClearOnOwnDeflectionChange;
		static void ClearOnOwnDeflectionChange(const TopoDS_Shape & theShape, const opencascade::handle<Prs3d_Drawer> & theDrawer, const Standard_Boolean theToResetCoeff);

		/****** StdPrs_ToolTriangulatedShape::GetDeflection ******/
		/****** md5 signature: 32d565d6bf5769fcd44726cec516a592 ******/
		%feature("compactdefaultargs") GetDeflection;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theDrawer: Prs3d_Drawer

Return
-------
float

Description
-----------
Computes the absolute deflection value depending on the type of deflection in theDrawer: <ul> <li><b>Aspect_TOD_RELATIVE</b>: the absolute deflection is computed using the relative deviation coefficient from theDrawer and the shape's bounding box;</li> <li><b>Aspect_TOD_ABSOLUTE</b>: the maximal chordial deviation from theDrawer is returned.</li> </ul> In case of the type of deflection in theDrawer computed relative deflection for shape is stored as absolute deflection. It is necessary to use it later on for sub-shapes. This function should always be used to compute the deflection value for building discrete representations of the shape (triangulation, wireframe) to avoid inconsistencies between different representations of the shape and undesirable visual artifacts.
") GetDeflection;
		static Standard_Real GetDeflection(const TopoDS_Shape & theShape, const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****** StdPrs_ToolTriangulatedShape::IsClosed ******/
		/****** md5 signature: 73cb802be974f5dd2d8d647431bb4edd ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
bool

Description
-----------
Checks back faces visibility for specified shape (to activate back-face culling). 
Return: true if shape is closed manifold Solid or compound of such Solids. .
") IsClosed;
		static Standard_Boolean IsClosed(const TopoDS_Shape & theShape);

		/****** StdPrs_ToolTriangulatedShape::IsTessellated ******/
		/****** md5 signature: 41b76557e8a81abcef9c6092a4dd18ec ******/
		%feature("compactdefaultargs") IsTessellated;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theDrawer: Prs3d_Drawer

Return
-------
bool

Description
-----------
Checks whether the shape is properly triangulated for a given display settings. 
Input parameter: theShape the shape. 
Input parameter: theDrawer the display settings.
") IsTessellated;
		static Standard_Boolean IsTessellated(const TopoDS_Shape & theShape, const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****** StdPrs_ToolTriangulatedShape::IsTriangulated ******/
		/****** md5 signature: 65cde82b83d68e98dc536757110f538b ******/
		%feature("compactdefaultargs") IsTriangulated;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
bool

Description
-----------
Similar to BRepTools::Triangulation() but without extra checks. 
Return: true if all faces within shape are triangulated.
") IsTriangulated;
		static Standard_Boolean IsTriangulated(const TopoDS_Shape & theShape);

		/****** StdPrs_ToolTriangulatedShape::Tessellate ******/
		/****** md5 signature: 4e3c55da546073fdfff034a5fa73f78a ******/
		%feature("compactdefaultargs") Tessellate;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theDrawer: Prs3d_Drawer

Return
-------
bool

Description
-----------
Validates triangulation within the shape and performs tessellation if necessary. 
Input parameter: theShape the shape. 
Input parameter: theDrawer the display settings. 
Return: true if tessellation was recomputed and false otherwise.
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
		/****** StdPrs_ToolVertex::Coord ******/
		/****** md5 signature: 11b62f4bf7e33fabbb0e6f02db287c74 ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------
aPoint: TopoDS_Vertex

Return
-------
X: float
Y: float
Z: float

Description
-----------
No available documentation.
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
		/****** StdPrs_WFDeflectionRestrictedFace::Add ******/
		/****** md5 signature: d12972390c3d49174724abd88e035741 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aPresentation: Prs3d_Presentation
aFace: BRepAdaptor_Surface
aDrawer: Prs3d_Drawer

Return
-------
None

Description
-----------
Defines a display featuring U and V isoparameters. Adds the surface aFace to the StdPrs_WFRestrictedFace algorithm. This face is found in a shape in the presentation object aPresentation, and its display attributes - in particular, the number of U and V isoparameters - are set in the attribute manager aDrawer. aFace is BRepAdaptor_Surface surface created from a face in a topological shape. which is passed as an argument through the BRepAdaptor_Surface surface created from it. This is what allows the topological face to be treated as a geometric surface.
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & aPresentation, const opencascade::handle<BRepAdaptor_Surface> & aFace, const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****** StdPrs_WFDeflectionRestrictedFace::Add ******/
		/****** md5 signature: a43b9cb76c2452baca5c8f7ad5d11599 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Defines a display of a delection-specified face. The display will feature U and V isoparameters. Adds the topology aShape to the StdPrs_WFRestrictedFace algorithm. This shape is found in the presentation object aPresentation, and its display attributes - except the number of U and V isoparameters - are set in the attribute manager aDrawer. The function sets the number of U and V isoparameters, NBUiso and NBViso, in the shape. To do this, the arguments DrawUIso and DrawVIso must be true. aFace is BRepAdaptor_Surface surface created from a face in a topological shape. which is passed as an argument through the BRepAdaptor_Surface surface created from it. This is what allows the topological face to be treated as a geometric surface. Curves give a sequence of face curves, it is used if the PrimitiveArray visualization approach is activated (it is activated by default).
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & aPresentation, const opencascade::handle<BRepAdaptor_Surface> & aFace, const Standard_Boolean DrawUIso, const Standard_Boolean DrawVIso, const Standard_Real Deflection, const Standard_Integer NBUiso, const Standard_Integer NBViso, const opencascade::handle<Prs3d_Drawer> & aDrawer, Prs3d_NListOfSequenceOfPnt & Curves);

		/****** StdPrs_WFDeflectionRestrictedFace::AddUIso ******/
		/****** md5 signature: abfa66a39e010c944e7999fccfbc51bc ******/
		%feature("compactdefaultargs") AddUIso;
		%feature("autodoc", "
Parameters
----------
aPresentation: Prs3d_Presentation
aFace: BRepAdaptor_Surface
aDrawer: Prs3d_Drawer

Return
-------
None

Description
-----------
Defines a display featuring U isoparameters respectively. Add the surface aFace to the StdPrs_WFRestrictedFace algorithm. This face is found in a shape in the presentation object aPresentation, and its display attributes - in particular, the number of U isoparameters - are set in the attribute manager aDrawer. aFace is BRepAdaptor_Surface surface created from a face in a topological shape. which is passed to the function as an argument through the BRepAdaptor_Surface surface created from it. This is what allows the topological face to be treated as a geometric surface.
") AddUIso;
		static void AddUIso(const opencascade::handle<Prs3d_Presentation> & aPresentation, const opencascade::handle<BRepAdaptor_Surface> & aFace, const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****** StdPrs_WFDeflectionRestrictedFace::AddVIso ******/
		/****** md5 signature: ab3ca8960e5f458613d750c65aa59839 ******/
		%feature("compactdefaultargs") AddVIso;
		%feature("autodoc", "
Parameters
----------
aPresentation: Prs3d_Presentation
aFace: BRepAdaptor_Surface
aDrawer: Prs3d_Drawer

Return
-------
None

Description
-----------
Defines a display featuring V isoparameters respectively. Add the surface aFace to the StdPrs_WFRestrictedFace algorithm. This face is found in a shape in the presentation object aPresentation, and its display attributes - in particular, the number of V isoparameters - are set in the attribute manager aDrawer. aFace is BRepAdaptor_Surface surface created from a face in a topological shape. which is passed to the function as an argument through the BRepAdaptor_Surface surface created from it. This is what allows the topological face to be treated as a geometric surface.
") AddVIso;
		static void AddVIso(const opencascade::handle<Prs3d_Presentation> & aPresentation, const opencascade::handle<BRepAdaptor_Surface> & aFace, const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****** StdPrs_WFDeflectionRestrictedFace::Match ******/
		/****** md5 signature: 36064271588fe17924d682737e08c090 ******/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "
Parameters
----------
X: float
Y: float
Z: float
aDistance: float
aFace: BRepAdaptor_Surface
aDrawer: Prs3d_Drawer

Return
-------
bool

Description
-----------
No available documentation.
") Match;
		static Standard_Boolean Match(const Standard_Real X, const Standard_Real Y, const Standard_Real Z, const Standard_Real aDistance, const opencascade::handle<BRepAdaptor_Surface> & aFace, const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****** StdPrs_WFDeflectionRestrictedFace::Match ******/
		/****** md5 signature: 647e7386d58dcbc030ed16f372590bd3 ******/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "
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

Return
-------
bool

Description
-----------
No available documentation.
") Match;
		static Standard_Boolean Match(const Standard_Real X, const Standard_Real Y, const Standard_Real Z, const Standard_Real aDistance, const opencascade::handle<BRepAdaptor_Surface> & aFace, const opencascade::handle<Prs3d_Drawer> & aDrawer, const Standard_Boolean DrawUIso, const Standard_Boolean DrawVIso, const Standard_Real aDeflection, const Standard_Integer NBUiso, const Standard_Integer NBViso);

		/****** StdPrs_WFDeflectionRestrictedFace::MatchUIso ******/
		/****** md5 signature: c8686c8ec60c7dfe1d0960364542d7a9 ******/
		%feature("compactdefaultargs") MatchUIso;
		%feature("autodoc", "
Parameters
----------
X: float
Y: float
Z: float
aDistance: float
aFace: BRepAdaptor_Surface
aDrawer: Prs3d_Drawer

Return
-------
bool

Description
-----------
No available documentation.
") MatchUIso;
		static Standard_Boolean MatchUIso(const Standard_Real X, const Standard_Real Y, const Standard_Real Z, const Standard_Real aDistance, const opencascade::handle<BRepAdaptor_Surface> & aFace, const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****** StdPrs_WFDeflectionRestrictedFace::MatchVIso ******/
		/****** md5 signature: 7ed1a209bfc944df2831a03220e9bbdd ******/
		%feature("compactdefaultargs") MatchVIso;
		%feature("autodoc", "
Parameters
----------
X: float
Y: float
Z: float
aDistance: float
aFace: BRepAdaptor_Surface
aDrawer: Prs3d_Drawer

Return
-------
bool

Description
-----------
No available documentation.
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
		/****** StdPrs_WFDeflectionSurface::Add ******/
		/****** md5 signature: 22102598190948bd248c9eed6e92b2c5 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aPresentation: Prs3d_Presentation
aSurface: Adaptor3d_Surface
aDrawer: Prs3d_Drawer

Return
-------
None

Description
-----------
Adds the surface aSurface to the presentation object aPresentation, and defines its boundaries and isoparameters. The shape's display attributes are set in the attribute manager aDrawer. These include whether deflection is absolute or relative to the size of the shape. The surface aSurface is a surface object from Adaptor, and provides data from a Geom surface. This makes it possible to use the surface in a geometric algorithm. Note that this surface object is manipulated by handles.
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
		/****** StdPrs_WFPoleSurface::Add ******/
		/****** md5 signature: 99d22d631390f82303e47347333bc1c0 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aPresentation: Prs3d_Presentation
aSurface: Adaptor3d_Surface
aDrawer: Prs3d_Drawer

Return
-------
None

Description
-----------
Adds the surface aSurface to the presentation object aPresentation. The shape's display attributes are set in the attribute manager aDrawer. The surface aSurface is a surface object from Adaptor3d, and provides data from a Geom surface. This makes it possible to use the surface in a geometric algorithm.
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
		/****** StdPrs_WFRestrictedFace::Add ******/
		/****** md5 signature: 997ef5408fc0674910ccf2fdf2cd6526 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
thePresentation: Prs3d_Presentation
theFace: BRepAdaptor_Surface
theDrawUIso: bool
theDrawVIso: bool
theNbUIso: int
theNbVIso: int
theDrawer: Prs3d_Drawer
theCurves: Prs3d_NListOfSequenceOfPnt

Return
-------
None

Description
-----------
No available documentation.
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & thePresentation, const opencascade::handle<BRepAdaptor_Surface> & theFace, const Standard_Boolean theDrawUIso, const Standard_Boolean theDrawVIso, const Standard_Integer theNbUIso, const Standard_Integer theNbVIso, const opencascade::handle<Prs3d_Drawer> & theDrawer, Prs3d_NListOfSequenceOfPnt & theCurves);

		/****** StdPrs_WFRestrictedFace::Add ******/
		/****** md5 signature: c9cfe87ac0d1f4614d3646ecf19658e1 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
thePresentation: Prs3d_Presentation
theFace: BRepAdaptor_Surface
theDrawer: Prs3d_Drawer

Return
-------
None

Description
-----------
No available documentation.
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & thePresentation, const opencascade::handle<BRepAdaptor_Surface> & theFace, const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****** StdPrs_WFRestrictedFace::AddUIso ******/
		/****** md5 signature: 7650dbfe259fdac7aa81c318906e354e ******/
		%feature("compactdefaultargs") AddUIso;
		%feature("autodoc", "
Parameters
----------
thePresentation: Prs3d_Presentation
theFace: BRepAdaptor_Surface
theDrawer: Prs3d_Drawer

Return
-------
None

Description
-----------
No available documentation.
") AddUIso;
		static void AddUIso(const opencascade::handle<Prs3d_Presentation> & thePresentation, const opencascade::handle<BRepAdaptor_Surface> & theFace, const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****** StdPrs_WFRestrictedFace::AddVIso ******/
		/****** md5 signature: de55bde426284c0abdb3f783d7f42fa9 ******/
		%feature("compactdefaultargs") AddVIso;
		%feature("autodoc", "
Parameters
----------
thePresentation: Prs3d_Presentation
theFace: BRepAdaptor_Surface
theDrawer: Prs3d_Drawer

Return
-------
None

Description
-----------
No available documentation.
") AddVIso;
		static void AddVIso(const opencascade::handle<Prs3d_Presentation> & thePresentation, const opencascade::handle<BRepAdaptor_Surface> & theFace, const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****** StdPrs_WFRestrictedFace::Match ******/
		/****** md5 signature: 73807c62eed49a19c080d0ed89c7ee6e ******/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "
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

Return
-------
bool

Description
-----------
No available documentation.
") Match;
		static Standard_Boolean Match(const Standard_Real theX, const Standard_Real theY, const Standard_Real theZ, const Standard_Real theDistance, const opencascade::handle<BRepAdaptor_Surface> & theFace, const Standard_Boolean theDrawUIso, const Standard_Boolean theDrawVIso, const Standard_Real theDeflection, const Standard_Integer theNbUIso, const Standard_Integer theNbVIso, const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****** StdPrs_WFRestrictedFace::Match ******/
		/****** md5 signature: 891c8b650f703671fbbe03256a120ad1 ******/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "
Parameters
----------
theX: float
theY: float
theZ: float
theDistance: float
theFace: BRepAdaptor_Surface
theDrawer: Prs3d_Drawer

Return
-------
bool

Description
-----------
No available documentation.
") Match;
		static Standard_Boolean Match(const Standard_Real theX, const Standard_Real theY, const Standard_Real theZ, const Standard_Real theDistance, const opencascade::handle<BRepAdaptor_Surface> & theFace, const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****** StdPrs_WFRestrictedFace::MatchUIso ******/
		/****** md5 signature: 69e7da890dd62dbded01cce9b3c2ae5d ******/
		%feature("compactdefaultargs") MatchUIso;
		%feature("autodoc", "
Parameters
----------
theX: float
theY: float
theZ: float
theDistance: float
theFace: BRepAdaptor_Surface
theDrawer: Prs3d_Drawer

Return
-------
bool

Description
-----------
No available documentation.
") MatchUIso;
		static Standard_Boolean MatchUIso(const Standard_Real theX, const Standard_Real theY, const Standard_Real theZ, const Standard_Real theDistance, const opencascade::handle<BRepAdaptor_Surface> & theFace, const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****** StdPrs_WFRestrictedFace::MatchVIso ******/
		/****** md5 signature: 74aa6ea3dafef67728512fa99d853098 ******/
		%feature("compactdefaultargs") MatchVIso;
		%feature("autodoc", "
Parameters
----------
theX: float
theY: float
theZ: float
theDistance: float
theFace: BRepAdaptor_Surface
theDrawer: Prs3d_Drawer

Return
-------
bool

Description
-----------
No available documentation.
") MatchVIso;
		static Standard_Boolean MatchVIso(const Standard_Real theX, const Standard_Real theY, const Standard_Real theZ, const Standard_Real theDistance, const opencascade::handle<BRepAdaptor_Surface> & theFace, const opencascade::handle<Prs3d_Drawer> & theDrawer);

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
		/****** StdPrs_WFShape::Add ******/
		/****** md5 signature: d3a473601c5ce8dbbf12badedbed254c ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
thePresentation: Prs3d_Presentation
theShape: TopoDS_Shape
theDrawer: Prs3d_Drawer
theIsParallel: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Computes wireframe presentation of a shape. 
Input parameter: thePresentation the presentation. 
Input parameter: theShape the shape. 
Input parameter: theDrawer the draw settings. 
Input parameter: theIsParallel perform algorithm using multiple threads.
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & thePresentation, const TopoDS_Shape & theShape, const opencascade::handle<Prs3d_Drawer> & theDrawer, Standard_Boolean theIsParallel = Standard_False);

		/****** StdPrs_WFShape::AddAllEdges ******/
		/****** md5 signature: 4d7e4bc00715dfdf3c2311bb197c8859 ******/
		%feature("compactdefaultargs") AddAllEdges;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theDrawer: Prs3d_Drawer

Return
-------
opencascade::handle<Graphic3d_ArrayOfPrimitives>

Description
-----------
Compute all edges (wire, free, unfree) and put them into single primitive array. 
Input parameter: theShape the shape 
Input parameter: theDrawer the drawer settings (deviation angle and maximal parameter value).
") AddAllEdges;
		static opencascade::handle<Graphic3d_ArrayOfPrimitives> AddAllEdges(const TopoDS_Shape & theShape, const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****** StdPrs_WFShape::AddEdgesOnTriangulation ******/
		/****** md5 signature: 5a4f39d298356ea43f58252e77fcd7d8 ******/
		%feature("compactdefaultargs") AddEdgesOnTriangulation;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theToExcludeGeometric: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<Graphic3d_ArrayOfPrimitives>

Description
-----------
Compute free and boundary edges on a triangulation of each face in the given shape. 
Input parameter: theShape the list of triangulated faces 
Input parameter: theToExcludeGeometric flag indicating that Faces with defined Surface should be skipped.
") AddEdgesOnTriangulation;
		static opencascade::handle<Graphic3d_ArrayOfPrimitives> AddEdgesOnTriangulation(const TopoDS_Shape & theShape, const Standard_Boolean theToExcludeGeometric = Standard_True);

		/****** StdPrs_WFShape::AddEdgesOnTriangulation ******/
		/****** md5 signature: 818f22c08fe5d4d3cf4085b1ea82ad0a ******/
		%feature("compactdefaultargs") AddEdgesOnTriangulation;
		%feature("autodoc", "
Parameters
----------
theSegments: TColgp_SequenceOfPnt
theShape: TopoDS_Shape
theToExcludeGeometric: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Compute free and boundary edges on a triangulation of each face in the given shape. 
Input parameter: theSegments the sequence of points defining segments 
Input parameter: theShape the list of triangulated faces 
Input parameter: theToExcludeGeometric flag indicating that Faces with defined Surface should be skipped.
") AddEdgesOnTriangulation;
		static void AddEdgesOnTriangulation(TColgp_SequenceOfPnt & theSegments, const TopoDS_Shape & theShape, const Standard_Boolean theToExcludeGeometric = Standard_True);

		/****** StdPrs_WFShape::AddVertexes ******/
		/****** md5 signature: d1b2dca7db78c7cfdddec40caebf910c ******/
		%feature("compactdefaultargs") AddVertexes;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theVertexMode: Prs3d_VertexDrawMode

Return
-------
opencascade::handle<Graphic3d_ArrayOfPoints>

Description
-----------
Compute vertex presentation for a shape. 
Input parameter: theShape the shape 
Input parameter: theVertexMode vertex filter.
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
		/****** StdPrs_WFSurface::Add ******/
		/****** md5 signature: 22102598190948bd248c9eed6e92b2c5 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aPresentation: Prs3d_Presentation
aSurface: Adaptor3d_Surface
aDrawer: Prs3d_Drawer

Return
-------
None

Description
-----------
Draws a surface by drawing the isoparametric curves with respect to a fixed number of points given by the Drawer. The number of isoparametric curves to be drawn and their color are controlled by the furnished Drawer.
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
		/****** StdPrs_HLRPolyShape::ComputeHLR ******/
		/****** md5 signature: dbee7d283c675e79a09ba59bad299adc ******/
		%feature("compactdefaultargs") ComputeHLR;
		%feature("autodoc", "
Parameters
----------
thePrs: Prs3d_Presentation
theShape: TopoDS_Shape
theDrawer: Prs3d_Drawer
theProjector: Graphic3d_Camera

Return
-------
None

Description
-----------
Compute presentation for specified shape.
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
		/****** StdPrs_HLRShape::ComputeHLR ******/
		/****** md5 signature: dbee7d283c675e79a09ba59bad299adc ******/
		%feature("compactdefaultargs") ComputeHLR;
		%feature("autodoc", "
Parameters
----------
thePrs: Prs3d_Presentation
theShape: TopoDS_Shape
theDrawer: Prs3d_Drawer
theProjector: Graphic3d_Camera

Return
-------
None

Description
-----------
Compute presentation for specified shape.
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
/* deprecated methods */
%pythoncode {
@deprecated
def StdPrs_BRepFont_FindAndCreate(*args):
	return StdPrs_BRepFont.FindAndCreate(*args)

@deprecated
def StdPrs_Curve_Add(*args):
	return StdPrs_Curve.Add(*args)

@deprecated
def StdPrs_Curve_Add(*args):
	return StdPrs_Curve.Add(*args)

@deprecated
def StdPrs_Curve_Add(*args):
	return StdPrs_Curve.Add(*args)

@deprecated
def StdPrs_Curve_Add(*args):
	return StdPrs_Curve.Add(*args)

@deprecated
def StdPrs_Curve_Match(*args):
	return StdPrs_Curve.Match(*args)

@deprecated
def StdPrs_Curve_Match(*args):
	return StdPrs_Curve.Match(*args)

@deprecated
def StdPrs_Curve_Match(*args):
	return StdPrs_Curve.Match(*args)

@deprecated
def StdPrs_Curve_Match(*args):
	return StdPrs_Curve.Match(*args)

@deprecated
def StdPrs_Isolines_Add(*args):
	return StdPrs_Isolines.Add(*args)

@deprecated
def StdPrs_Isolines_Add(*args):
	return StdPrs_Isolines.Add(*args)

@deprecated
def StdPrs_Isolines_AddOnSurface(*args):
	return StdPrs_Isolines.AddOnSurface(*args)

@deprecated
def StdPrs_Isolines_AddOnSurface(*args):
	return StdPrs_Isolines.AddOnSurface(*args)

@deprecated
def StdPrs_Isolines_AddOnSurface(*args):
	return StdPrs_Isolines.AddOnSurface(*args)

@deprecated
def StdPrs_Isolines_AddOnTriangulation(*args):
	return StdPrs_Isolines.AddOnTriangulation(*args)

@deprecated
def StdPrs_Isolines_AddOnTriangulation(*args):
	return StdPrs_Isolines.AddOnTriangulation(*args)

@deprecated
def StdPrs_Isolines_AddOnTriangulation(*args):
	return StdPrs_Isolines.AddOnTriangulation(*args)

@deprecated
def StdPrs_Isolines_UVIsoParameters(*args):
	return StdPrs_Isolines.UVIsoParameters(*args)

@deprecated
def StdPrs_Plane_Add(*args):
	return StdPrs_Plane.Add(*args)

@deprecated
def StdPrs_Plane_Match(*args):
	return StdPrs_Plane.Match(*args)

@deprecated
def StdPrs_PoleCurve_Add(*args):
	return StdPrs_PoleCurve.Add(*args)

@deprecated
def StdPrs_PoleCurve_Match(*args):
	return StdPrs_PoleCurve.Match(*args)

@deprecated
def StdPrs_PoleCurve_Pick(*args):
	return StdPrs_PoleCurve.Pick(*args)

@deprecated
def StdPrs_ShadedShape_Add(*args):
	return StdPrs_ShadedShape.Add(*args)

@deprecated
def StdPrs_ShadedShape_Add(*args):
	return StdPrs_ShadedShape.Add(*args)

@deprecated
def StdPrs_ShadedShape_AddWireframeForFacesWithoutTriangles(*args):
	return StdPrs_ShadedShape.AddWireframeForFacesWithoutTriangles(*args)

@deprecated
def StdPrs_ShadedShape_AddWireframeForFreeElements(*args):
	return StdPrs_ShadedShape.AddWireframeForFreeElements(*args)

@deprecated
def StdPrs_ShadedShape_ExploreSolids(*args):
	return StdPrs_ShadedShape.ExploreSolids(*args)

@deprecated
def StdPrs_ShadedShape_FillFaceBoundaries(*args):
	return StdPrs_ShadedShape.FillFaceBoundaries(*args)

@deprecated
def StdPrs_ShadedShape_FillTriangles(*args):
	return StdPrs_ShadedShape.FillTriangles(*args)

@deprecated
def StdPrs_ShadedShape_FillTriangles(*args):
	return StdPrs_ShadedShape.FillTriangles(*args)

@deprecated
def StdPrs_ShadedSurface_Add(*args):
	return StdPrs_ShadedSurface.Add(*args)

@deprecated
def StdPrs_ShapeTool_IsPlanarFace(*args):
	return StdPrs_ShapeTool.IsPlanarFace(*args)

@deprecated
def StdPrs_ToolPoint_Coord(*args):
	return StdPrs_ToolPoint.Coord(*args)

@deprecated
def StdPrs_ToolTriangulatedShape_ClearOnOwnDeflectionChange(*args):
	return StdPrs_ToolTriangulatedShape.ClearOnOwnDeflectionChange(*args)

@deprecated
def StdPrs_ToolTriangulatedShape_GetDeflection(*args):
	return StdPrs_ToolTriangulatedShape.GetDeflection(*args)

@deprecated
def StdPrs_ToolTriangulatedShape_IsClosed(*args):
	return StdPrs_ToolTriangulatedShape.IsClosed(*args)

@deprecated
def StdPrs_ToolTriangulatedShape_IsTessellated(*args):
	return StdPrs_ToolTriangulatedShape.IsTessellated(*args)

@deprecated
def StdPrs_ToolTriangulatedShape_IsTriangulated(*args):
	return StdPrs_ToolTriangulatedShape.IsTriangulated(*args)

@deprecated
def StdPrs_ToolTriangulatedShape_Tessellate(*args):
	return StdPrs_ToolTriangulatedShape.Tessellate(*args)

@deprecated
def StdPrs_ToolVertex_Coord(*args):
	return StdPrs_ToolVertex.Coord(*args)

@deprecated
def StdPrs_WFDeflectionRestrictedFace_Add(*args):
	return StdPrs_WFDeflectionRestrictedFace.Add(*args)

@deprecated
def StdPrs_WFDeflectionRestrictedFace_Add(*args):
	return StdPrs_WFDeflectionRestrictedFace.Add(*args)

@deprecated
def StdPrs_WFDeflectionRestrictedFace_AddUIso(*args):
	return StdPrs_WFDeflectionRestrictedFace.AddUIso(*args)

@deprecated
def StdPrs_WFDeflectionRestrictedFace_AddVIso(*args):
	return StdPrs_WFDeflectionRestrictedFace.AddVIso(*args)

@deprecated
def StdPrs_WFDeflectionRestrictedFace_Match(*args):
	return StdPrs_WFDeflectionRestrictedFace.Match(*args)

@deprecated
def StdPrs_WFDeflectionRestrictedFace_Match(*args):
	return StdPrs_WFDeflectionRestrictedFace.Match(*args)

@deprecated
def StdPrs_WFDeflectionRestrictedFace_MatchUIso(*args):
	return StdPrs_WFDeflectionRestrictedFace.MatchUIso(*args)

@deprecated
def StdPrs_WFDeflectionRestrictedFace_MatchVIso(*args):
	return StdPrs_WFDeflectionRestrictedFace.MatchVIso(*args)

@deprecated
def StdPrs_WFDeflectionSurface_Add(*args):
	return StdPrs_WFDeflectionSurface.Add(*args)

@deprecated
def StdPrs_WFPoleSurface_Add(*args):
	return StdPrs_WFPoleSurface.Add(*args)

@deprecated
def StdPrs_WFRestrictedFace_Add(*args):
	return StdPrs_WFRestrictedFace.Add(*args)

@deprecated
def StdPrs_WFRestrictedFace_Add(*args):
	return StdPrs_WFRestrictedFace.Add(*args)

@deprecated
def StdPrs_WFRestrictedFace_AddUIso(*args):
	return StdPrs_WFRestrictedFace.AddUIso(*args)

@deprecated
def StdPrs_WFRestrictedFace_AddVIso(*args):
	return StdPrs_WFRestrictedFace.AddVIso(*args)

@deprecated
def StdPrs_WFRestrictedFace_Match(*args):
	return StdPrs_WFRestrictedFace.Match(*args)

@deprecated
def StdPrs_WFRestrictedFace_Match(*args):
	return StdPrs_WFRestrictedFace.Match(*args)

@deprecated
def StdPrs_WFRestrictedFace_MatchUIso(*args):
	return StdPrs_WFRestrictedFace.MatchUIso(*args)

@deprecated
def StdPrs_WFRestrictedFace_MatchVIso(*args):
	return StdPrs_WFRestrictedFace.MatchVIso(*args)

@deprecated
def StdPrs_WFShape_Add(*args):
	return StdPrs_WFShape.Add(*args)

@deprecated
def StdPrs_WFShape_AddAllEdges(*args):
	return StdPrs_WFShape.AddAllEdges(*args)

@deprecated
def StdPrs_WFShape_AddEdgesOnTriangulation(*args):
	return StdPrs_WFShape.AddEdgesOnTriangulation(*args)

@deprecated
def StdPrs_WFShape_AddEdgesOnTriangulation(*args):
	return StdPrs_WFShape.AddEdgesOnTriangulation(*args)

@deprecated
def StdPrs_WFShape_AddVertexes(*args):
	return StdPrs_WFShape.AddVertexes(*args)

@deprecated
def StdPrs_WFSurface_Add(*args):
	return StdPrs_WFSurface.Add(*args)

}
