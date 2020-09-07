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
%define STDPRSDOCSTRING
"StdPrs module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_stdprs.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<StdPrs_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<Prs3d_module.hxx>
#include<Bnd_module.hxx>
#include<Graphic3d_module.hxx>
#include<gp_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TColgp_module.hxx>
#include<TopoDS_module.hxx>
#include<HLRAlgo_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<TColStd_module.hxx>
#include<Poly_module.hxx>
#include<TopLoc_module.hxx>
#include<BRep_module.hxx>
#include<GeomAbs_module.hxx>
#include<TopAbs_module.hxx>
#include<Adaptor2d_module.hxx>
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
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom.i
%import Prs3d.i
%import Bnd.i
%import Graphic3d.i
%import gp.i
%import Adaptor3d.i
%import TColgp.i
%import TopoDS.i
%import HLRAlgo.i
%import BRepAdaptor.i
%import TColStd.i
%import Poly.i
%import TopLoc.i
%import BRep.i
%import GeomAbs.i
%import TopAbs.i
%import Adaptor2d.i

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

/* python proy classes for enums */
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
/* end handles declaration */

/* templates */
%template(StdPrs_Point) Prs3d_Point<opencascade::handle<Geom_Point>,StdPrs_ToolPoint>;
%template(StdPrs_Vertex) Prs3d_Point<TopoDS_Vertex,StdPrs_ToolVertex>;
/* end templates declaration */

/* typedefs */
typedef Prs3d_Point<opencascade::handle<Geom_Point>, StdPrs_ToolPoint> StdPrs_Point;
typedef Prs3d_Point<TopoDS_Vertex, StdPrs_ToolVertex> StdPrs_Vertex;
/* end typedefs declaration */

/**********************
* class StdPrs_BndBox *
**********************/
class StdPrs_BndBox : public Prs3d_Root {
	public:
		/****************** Add ******************/
		/**** md5 signature: c54a75d50bfd4e7f1fb12cf7497bfbd8 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Computes presentation of a bounding box. @param thepresentation [in] the presentation. @param thebndbox [in] the bounding box. @param thedrawer [in] the drawer.

Parameters
----------
thePresentation: Prs3d_Presentation
theBndBox: Bnd_Box
theDrawer: Prs3d_Drawer

Returns
-------
None
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & thePresentation, const Bnd_Box & theBndBox, const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** Add ******************/
		/**** md5 signature: 6b808f8029d0bc7d27373b55eaa80cd4 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Computes presentation of a bounding box. @param thepresentation [in] the presentation. @param thebndbox [in] the bounding box. @param thedrawer [in] the drawer.

Parameters
----------
thePresentation: Prs3d_Presentation
theBndBox: Bnd_OBB
theDrawer: Prs3d_Drawer

Returns
-------
None
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & thePresentation, const Bnd_OBB & theBndBox, const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** FillSegments ******************/
		/**** md5 signature: 5fb83e6b4c177d72797ad20d5dbb573c ****/
		%feature("compactdefaultargs") FillSegments;
		%feature("autodoc", "Create primitive array with line segments for displaying a box. @param thebox [in] the box to add.

Parameters
----------
theBox: Bnd_OBB

Returns
-------
opencascade::handle<Graphic3d_ArrayOfSegments>
") FillSegments;
		static opencascade::handle<Graphic3d_ArrayOfSegments> FillSegments(const Bnd_OBB & theBox);

		/****************** FillSegments ******************/
		/**** md5 signature: 40a5714e880ddcdb51b116ed7e7d58a3 ****/
		%feature("compactdefaultargs") FillSegments;
		%feature("autodoc", "Create primitive array with line segments for displaying a box. @param thebox [in] the box to add.

Parameters
----------
theBox: Bnd_Box

Returns
-------
opencascade::handle<Graphic3d_ArrayOfSegments>
") FillSegments;
		static opencascade::handle<Graphic3d_ArrayOfSegments> FillSegments(const Bnd_Box & theBox);

		/****************** FillSegments ******************/
		/**** md5 signature: 6c2926015dd63abf7dfca1e5b0f1dee0 ****/
		%feature("compactdefaultargs") FillSegments;
		%feature("autodoc", "Create primitive array with line segments for displaying a box. @param thesegments [in] [out] primitive array to be filled;  should be at least 8 nodes and 24 edges in size @param thebox [in] the box to add.

Parameters
----------
theSegments: Graphic3d_ArrayOfSegments
theBox: Bnd_OBB

Returns
-------
None
") FillSegments;
		static void FillSegments(const opencascade::handle<Graphic3d_ArrayOfSegments> & theSegments, const Bnd_OBB & theBox);

		/****************** FillSegments ******************/
		/**** md5 signature: 1dfe28468b5ba72dd334e07d0ac3116c ****/
		%feature("compactdefaultargs") FillSegments;
		%feature("autodoc", "Create primitive array with line segments for displaying a box. @param thesegments [in] [out] primitive array to be filled;  should be at least 8 nodes and 24 edges in size @param thebox [in] the box to add.

Parameters
----------
theSegments: Graphic3d_ArrayOfSegments
theBox: Bnd_Box

Returns
-------
None
") FillSegments;
		static void FillSegments(const opencascade::handle<Graphic3d_ArrayOfSegments> & theSegments, const Bnd_Box & theBox);

		/****************** fillSegments ******************/
		/**** md5 signature: c902020df6559486e6ed2711d0bcc3d9 ****/
		%feature("compactdefaultargs") fillSegments;
		%feature("autodoc", "Create primitive array with line segments for displaying a box. @param thesegments [in] [out] primitive array to be filled;  should be at least 8 nodes and 24 edges in size @param thebox [in] the box to add.

Parameters
----------
theSegments: Graphic3d_ArrayOfSegments
theBox: gp_Pnt *

Returns
-------
None
") fillSegments;
		static void fillSegments(const opencascade::handle<Graphic3d_ArrayOfSegments> & theSegments, const gp_Pnt * theBox);

};


%extend StdPrs_BndBox {
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
None
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
None
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
None
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
None
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
/****************************
* class StdPrs_HLRPolyShape *
****************************/
class StdPrs_HLRPolyShape : public Prs3d_Root {
	public:
		/****************** Add ******************/
		/**** md5 signature: 46a730d18eb5867085f0444bb4cd3ff0 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Defines the hidden line removal display of the topology ashape in the projection defined by aprojector. the shape and the projection are added to the display apresentation, and the attributes of the elements present in the apresentation are defined by the attribute manager adrawer.

Parameters
----------
aPresentation: Prs3d_Presentation
aShape: TopoDS_Shape
aDrawer: Prs3d_Drawer
aProjector: Prs3d_Projector

Returns
-------
None
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & aPresentation, const TopoDS_Shape & aShape, const opencascade::handle<Prs3d_Drawer> & aDrawer, const opencascade::handle<Prs3d_Projector> & aProjector);

};


%extend StdPrs_HLRPolyShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class StdPrs_HLRShape *
************************/
class StdPrs_HLRShape : public Prs3d_Root {
	public:
		/****************** Add ******************/
		/**** md5 signature: 63c4c20ee0c2a5d035bdee5d7b03608c ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePresentation: Prs3d_Presentation
theShape: TopoDS_Shape
theDrawer: Prs3d_Drawer
theProjector: Prs3d_Projector

Returns
-------
None
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & thePresentation, const TopoDS_Shape & theShape, const opencascade::handle<Prs3d_Drawer> & theDrawer, const opencascade::handle<Prs3d_Projector> & theProjector);

};


%extend StdPrs_HLRShape {
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
void
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & thePresentation, const TopoDS_Face & theFace, const opencascade::handle<Prs3d_Drawer> & theDrawer, const Standard_Real theDeflection);

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
None
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
None
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
None
") AddOnSurface;
		static void AddOnSurface(const TopoDS_Face & theFace, const opencascade::handle<Prs3d_Drawer> & theDrawer, const Standard_Real theDeflection, Prs3d_NListOfSequenceOfPnt & theUPolylines, Prs3d_NListOfSequenceOfPnt & theVPolylines);

		/****************** AddOnSurface ******************/
		/**** md5 signature: 2a39018c9ad850bc04d4002ce676b267 ****/
		%feature("compactdefaultargs") AddOnSurface;
		%feature("autodoc", "Computes isolines on surface and adds them to presentation. @param thepresentation [in] the presentation. @param thesurface [in] the surface. @param thedrawer [in] the display settings. @param thedeflection [in] the deflection value. @param theuisoparams [in] the parameters of u isolines to compute. @param thevisoparams [in] the parameters of v isolines to compute.

Parameters
----------
thePresentation: Prs3d_Presentation
theSurface: BRepAdaptor_HSurface
theDrawer: Prs3d_Drawer
theDeflection: float
theUIsoParams: TColStd_SequenceOfReal
theVIsoParams: TColStd_SequenceOfReal

Returns
-------
None
") AddOnSurface;
		static void AddOnSurface(const opencascade::handle<Prs3d_Presentation> & thePresentation, const opencascade::handle<BRepAdaptor_HSurface> & theSurface, const opencascade::handle<Prs3d_Drawer> & theDrawer, const Standard_Real theDeflection, const TColStd_SequenceOfReal & theUIsoParams, const TColStd_SequenceOfReal & theVIsoParams);

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
None
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
None
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
None
") AddOnTriangulation;
		static void AddOnTriangulation(const opencascade::handle<Prs3d_Presentation> & thePresentation, const opencascade::handle<Poly_Triangulation> & theTriangulation, const opencascade::handle<Geom_Surface> & theSurface, const TopLoc_Location & theLocation, const opencascade::handle<Prs3d_Drawer> & theDrawer, const TColStd_SequenceOfReal & theUIsoParams, const TColStd_SequenceOfReal & theVIsoParams);

		/****************** UVIsoParameters ******************/
		/**** md5 signature: 624d137e5f58c70fc47c9a4a74925873 ****/
		%feature("compactdefaultargs") UVIsoParameters;
		%feature("autodoc", "Evalute sequence of parameters for drawing uv isolines for a given face. @param theface [in] the face. @param thenbisou [in] the number of u isolines. @param thenbisov [in] the number of v isolines. @param theuvlimit [in] the u, v parameter value limit. @param theuisoparams [out] the sequence of u isoline parameters. @param thevisoparams [out] the sequence of v isoline parameters. @param theumin [out] the lower u boundary of theface. @param theumax [out] the upper u boundary of theface. @param thevmin [out] the lower v boundary of theface. @param thevmax [out] the upper v boundary of theface.

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
None
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
None
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
None
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
None
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
None
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
None
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
None
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
None
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & aPresentation, const Adaptor3d_Surface & aSurface, const opencascade::handle<Prs3d_Drawer> & aDrawer);

};


%extend StdPrs_ShadedSurface {
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
		/**** md5 signature: 983555aabecb3bc77e3e28a1ffd5c0a3 ****/
		%feature("compactdefaultargs") StdPrs_ToolRFace;
		%feature("autodoc", "Constructor with initialization.

Parameters
----------
aSurface: BRepAdaptor_HSurface

Returns
-------
None
") StdPrs_ToolRFace;
		 StdPrs_ToolRFace(const opencascade::handle<BRepAdaptor_HSurface> & aSurface);

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
class StdPrs_ToolTriangulatedShape {
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
None
") ClearOnOwnDeflectionChange;
		static void ClearOnOwnDeflectionChange(const TopoDS_Shape & theShape, const opencascade::handle<Prs3d_Drawer> & theDrawer, const Standard_Boolean theToResetCoeff);

		/****************** ComputeNormals ******************/
		/**** md5 signature: 2d57466090fe2926dca8ad73827190c2 ****/
		%feature("compactdefaultargs") ComputeNormals;
		%feature("autodoc", "Computes nodal normals for poly_triangulation structure using uv coordinates and surface. does nothing if triangulation already defines normals. @param theface [in] the face @param thetris [in] the definition of a face triangulation.

Parameters
----------
theFace: TopoDS_Face
theTris: Poly_Triangulation

Returns
-------
None
") ComputeNormals;
		static void ComputeNormals(const TopoDS_Face & theFace, const opencascade::handle<Poly_Triangulation> & theTris);

		/****************** ComputeNormals ******************/
		/**** md5 signature: ff5b08874a5db62c157e96e68689a5a4 ****/
		%feature("compactdefaultargs") ComputeNormals;
		%feature("autodoc", "Computes nodal normals for poly_triangulation structure using uv coordinates and surface. does nothing if triangulation already defines normals. @param theface [in] the face @param thetris [in] the definition of a face triangulation @param thepolyconnect [in,out] optional, initialized tool for exploring triangulation.

Parameters
----------
theFace: TopoDS_Face
theTris: Poly_Triangulation
thePolyConnect: Poly_Connect

Returns
-------
None
") ComputeNormals;
		static void ComputeNormals(const TopoDS_Face & theFace, const opencascade::handle<Poly_Triangulation> & theTris, Poly_Connect & thePolyConnect);

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

		/****************** Normal ******************/
		/**** md5 signature: b04d071f25e8a4fa6f4986e009a71f93 ****/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "Evaluate normals for a triangle of a face. @param theface [in] the face. @param thepolyconnect [in] the definition of a face triangulation. @param thenormal [out] the array of normals for each triangle.

Parameters
----------
theFace: TopoDS_Face
thePolyConnect: Poly_Connect
theNormals: TColgp_Array1OfDir

Returns
-------
None
") Normal;
		static void Normal(const TopoDS_Face & theFace, Poly_Connect & thePolyConnect, TColgp_Array1OfDir & theNormals);

		/****************** Tessellate ******************/
		/**** md5 signature: 4e3c55da546073fdfff034a5fa73f78a ****/
		%feature("compactdefaultargs") Tessellate;
		%feature("autodoc", "Validates triangulation within the shape and performs tessellation if necessary. @param theshape [in] the shape. @param thedrawer [in] the display settings. returns true if tesselation was recomputed and false otherwise.

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
		/**** md5 signature: c3779aab39acf244c115012e93a7b53f ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Defines a display featuring u and v isoparameters. adds the surface aface to the stdprs_wfrestrictedface algorithm. this face is found in a shape in the presentation object apresentation, and its display attributes - in particular, the number of u and v isoparameters - are set in the attribute manager adrawer. aface is brepadaptor_hsurface surface created from a face in a topological shape. which is passed as an argument through the brepadaptor_hsurface surface created from it. this is what allows the topological face to be treated as a geometric surface.

Parameters
----------
aPresentation: Prs3d_Presentation
aFace: BRepAdaptor_HSurface
aDrawer: Prs3d_Drawer

Returns
-------
None
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & aPresentation, const opencascade::handle<BRepAdaptor_HSurface> & aFace, const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****************** Add ******************/
		/**** md5 signature: bd67831026bf2f8410d269d4d216516e ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Defines a display of a delection-specified face. the display will feature u and v isoparameters. adds the topology ashape to the stdprs_wfrestrictedface algorithm. this shape is found in the presentation object apresentation, and its display attributes - except the number of u and v isoparameters - are set in the attribute manager adrawer. the function sets the number of u and v isoparameters, nbuiso and nbviso, in the shape. to do this, the arguments drawuiso and drawviso must be true. aface is brepadaptor_hsurface surface created from a face in a topological shape. which is passed as an argument through the brepadaptor_hsurface surface created from it. this is what allows the topological face to be treated as a geometric surface. curves give a sequence of face curves, it is used if the primitivearray visualization approach is activated (it is activated by default).

Parameters
----------
aPresentation: Prs3d_Presentation
aFace: BRepAdaptor_HSurface
DrawUIso: bool
DrawVIso: bool
Deflection: float
NBUiso: int
NBViso: int
aDrawer: Prs3d_Drawer
Curves: Prs3d_NListOfSequenceOfPnt

Returns
-------
None
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & aPresentation, const opencascade::handle<BRepAdaptor_HSurface> & aFace, const Standard_Boolean DrawUIso, const Standard_Boolean DrawVIso, const Standard_Real Deflection, const Standard_Integer NBUiso, const Standard_Integer NBViso, const opencascade::handle<Prs3d_Drawer> & aDrawer, Prs3d_NListOfSequenceOfPnt & Curves);

		/****************** AddUIso ******************/
		/**** md5 signature: c7bc1083953eb55ee37830dae7cc0d08 ****/
		%feature("compactdefaultargs") AddUIso;
		%feature("autodoc", "Defines a display featuring u isoparameters respectively. add the surface aface to the stdprs_wfrestrictedface algorithm. this face is found in a shape in the presentation object apresentation, and its display attributes - in particular, the number of u isoparameters - are set in the attribute manager adrawer. aface is brepadaptor_hsurface surface created from a face in a topological shape. which is passed to the function as an argument through the brepadaptor_hsurface surface created from it. this is what allows the topological face to be treated as a geometric surface.

Parameters
----------
aPresentation: Prs3d_Presentation
aFace: BRepAdaptor_HSurface
aDrawer: Prs3d_Drawer

Returns
-------
None
") AddUIso;
		static void AddUIso(const opencascade::handle<Prs3d_Presentation> & aPresentation, const opencascade::handle<BRepAdaptor_HSurface> & aFace, const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****************** AddVIso ******************/
		/**** md5 signature: 3454b5eb78296ec3fe63fd100e981573 ****/
		%feature("compactdefaultargs") AddVIso;
		%feature("autodoc", "Defines a display featuring v isoparameters respectively. add the surface aface to the stdprs_wfrestrictedface algorithm. this face is found in a shape in the presentation object apresentation, and its display attributes - in particular, the number of v isoparameters - are set in the attribute manager adrawer. aface is brepadaptor_hsurface surface created from a face in a topological shape. which is passed to the function as an argument through the brepadaptor_hsurface surface created from it. this is what allows the topological face to be treated as a geometric surface.

Parameters
----------
aPresentation: Prs3d_Presentation
aFace: BRepAdaptor_HSurface
aDrawer: Prs3d_Drawer

Returns
-------
None
") AddVIso;
		static void AddVIso(const opencascade::handle<Prs3d_Presentation> & aPresentation, const opencascade::handle<BRepAdaptor_HSurface> & aFace, const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****************** Match ******************/
		/**** md5 signature: ba1a38f9bdbfa9e5b5bdd906c65a82b1 ****/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: float
Y: float
Z: float
aDistance: float
aFace: BRepAdaptor_HSurface
aDrawer: Prs3d_Drawer

Returns
-------
bool
") Match;
		static Standard_Boolean Match(const Standard_Real X, const Standard_Real Y, const Standard_Real Z, const Standard_Real aDistance, const opencascade::handle<BRepAdaptor_HSurface> & aFace, const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****************** Match ******************/
		/**** md5 signature: 80e712bfb9a326d9059eafb824fa08d0 ****/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: float
Y: float
Z: float
aDistance: float
aFace: BRepAdaptor_HSurface
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
		static Standard_Boolean Match(const Standard_Real X, const Standard_Real Y, const Standard_Real Z, const Standard_Real aDistance, const opencascade::handle<BRepAdaptor_HSurface> & aFace, const opencascade::handle<Prs3d_Drawer> & aDrawer, const Standard_Boolean DrawUIso, const Standard_Boolean DrawVIso, const Standard_Real aDeflection, const Standard_Integer NBUiso, const Standard_Integer NBViso);

		/****************** MatchUIso ******************/
		/**** md5 signature: 25c861dd6b719e861a8671b67433efc4 ****/
		%feature("compactdefaultargs") MatchUIso;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: float
Y: float
Z: float
aDistance: float
aFace: BRepAdaptor_HSurface
aDrawer: Prs3d_Drawer

Returns
-------
bool
") MatchUIso;
		static Standard_Boolean MatchUIso(const Standard_Real X, const Standard_Real Y, const Standard_Real Z, const Standard_Real aDistance, const opencascade::handle<BRepAdaptor_HSurface> & aFace, const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****************** MatchVIso ******************/
		/**** md5 signature: b4aa459088ca23619268888f5e3cc21e ****/
		%feature("compactdefaultargs") MatchVIso;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: float
Y: float
Z: float
aDistance: float
aFace: BRepAdaptor_HSurface
aDrawer: Prs3d_Drawer

Returns
-------
bool
") MatchVIso;
		static Standard_Boolean MatchVIso(const Standard_Real X, const Standard_Real Y, const Standard_Real Z, const Standard_Real aDistance, const opencascade::handle<BRepAdaptor_HSurface> & aFace, const opencascade::handle<Prs3d_Drawer> & aDrawer);

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
		/**** md5 signature: 42666969419c36293cf76b80c7e1a7bc ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the surface asurface to the presentation object apresentation, and defines its boundaries and isoparameters. the shape's display attributes are set in the attribute manager adrawer. these include whether deflection is absolute or relative to the size of the shape. the surface asurface is a surface object from adaptor, and provides data from a geom surface. this makes it possible to use the surface in a geometric algorithm. note that this surface object is manipulated by handles.

Parameters
----------
aPresentation: Prs3d_Presentation
aSurface: Adaptor3d_HSurface
aDrawer: Prs3d_Drawer

Returns
-------
None
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & aPresentation, const opencascade::handle<Adaptor3d_HSurface> & aSurface, const opencascade::handle<Prs3d_Drawer> & aDrawer);

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
None
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
		/**** md5 signature: 18dd5b60438ad5bbde64376bd4de6291 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePresentation: Handle ( Prs3d_Presentation )
theFace: BRepAdaptor_HSurface
theDrawUIso: bool
theDrawVIso: bool
theNbUIso: int
theNbVIso: int
theDrawer: Prs3d_Drawer
theCurves: Prs3d_NListOfSequenceOfPnt

Returns
-------
None
") Add;
		static void Add(const Handle ( Prs3d_Presentation ) & thePresentation, const opencascade::handle<BRepAdaptor_HSurface> & theFace, const Standard_Boolean theDrawUIso, const Standard_Boolean theDrawVIso, const Standard_Integer theNbUIso, const Standard_Integer theNbVIso, const opencascade::handle<Prs3d_Drawer> & theDrawer, Prs3d_NListOfSequenceOfPnt & theCurves);

		/****************** Add ******************/
		/**** md5 signature: 1fe61a26cdc16ffabfe9b8ef70da3e88 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePresentation: Handle ( Prs3d_Presentation )
theFace: BRepAdaptor_HSurface
theDrawer: Handle ( Prs3d_Drawer )

Returns
-------
None
") Add;
		static void Add(const Handle ( Prs3d_Presentation ) & thePresentation, const opencascade::handle<BRepAdaptor_HSurface> & theFace, const Handle ( Prs3d_Drawer ) & theDrawer);

		/****************** AddUIso ******************/
		/**** md5 signature: f92a0a6b19543688630f4bad6580345b ****/
		%feature("compactdefaultargs") AddUIso;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePresentation: Handle ( Prs3d_Presentation )
theFace: BRepAdaptor_HSurface
theDrawer: Handle ( Prs3d_Drawer )

Returns
-------
None
") AddUIso;
		static void AddUIso(const Handle ( Prs3d_Presentation ) & thePresentation, const opencascade::handle<BRepAdaptor_HSurface> & theFace, const Handle ( Prs3d_Drawer ) & theDrawer);

		/****************** AddVIso ******************/
		/**** md5 signature: aea5fb11d169fe06d0173b15b7abd569 ****/
		%feature("compactdefaultargs") AddVIso;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePresentation: Handle ( Prs3d_Presentation )
theFace: BRepAdaptor_HSurface
theDrawer: Handle ( Prs3d_Drawer )

Returns
-------
None
") AddVIso;
		static void AddVIso(const Handle ( Prs3d_Presentation ) & thePresentation, const opencascade::handle<BRepAdaptor_HSurface> & theFace, const Handle ( Prs3d_Drawer ) & theDrawer);

		/****************** Match ******************/
		/**** md5 signature: e6cd786e533b89c47314d7d5673dbac8 ****/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "No available documentation.

Parameters
----------
theX: float
theY: float
theZ: float
theDistance: float
theFace: BRepAdaptor_HSurface
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
		static Standard_Boolean Match(const Standard_Real theX, const Standard_Real theY, const Standard_Real theZ, const Standard_Real theDistance, const opencascade::handle<BRepAdaptor_HSurface> & theFace, const Standard_Boolean theDrawUIso, const Standard_Boolean theDrawVIso, const Standard_Real theDeflection, const Standard_Integer theNbUIso, const Standard_Integer theNbVIso, const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** Match ******************/
		/**** md5 signature: 20f30b2bb19ebd10743c635e848c4b52 ****/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "No available documentation.

Parameters
----------
theX: float
theY: float
theZ: float
theDistance: float
theFace: BRepAdaptor_HSurface
theDrawer: Handle ( Prs3d_Drawer )

Returns
-------
bool
") Match;
		static Standard_Boolean Match(const Standard_Real theX, const Standard_Real theY, const Standard_Real theZ, const Standard_Real theDistance, const opencascade::handle<BRepAdaptor_HSurface> & theFace, const Handle ( Prs3d_Drawer ) & theDrawer);

		/****************** MatchUIso ******************/
		/**** md5 signature: a8c999afb264c4c071200195a057f928 ****/
		%feature("compactdefaultargs") MatchUIso;
		%feature("autodoc", "No available documentation.

Parameters
----------
theX: float
theY: float
theZ: float
theDistance: float
theFace: BRepAdaptor_HSurface
theDrawer: Handle ( Prs3d_Drawer )

Returns
-------
bool
") MatchUIso;
		static Standard_Boolean MatchUIso(const Standard_Real theX, const Standard_Real theY, const Standard_Real theZ, const Standard_Real theDistance, const opencascade::handle<BRepAdaptor_HSurface> & theFace, const Handle ( Prs3d_Drawer ) & theDrawer);

		/****************** MatchVIso ******************/
		/**** md5 signature: 7118dd075c642266a9771b2aa81d2b73 ****/
		%feature("compactdefaultargs") MatchVIso;
		%feature("autodoc", "No available documentation.

Parameters
----------
theX: float
theY: float
theZ: float
theDistance: float
theFace: BRepAdaptor_HSurface
theDrawer: Handle ( Prs3d_Drawer )

Returns
-------
bool
") MatchVIso;
		static Standard_Boolean MatchVIso(const Standard_Real theX, const Standard_Real theY, const Standard_Real theZ, const Standard_Real theDistance, const opencascade::handle<BRepAdaptor_HSurface> & theFace, const Handle ( Prs3d_Drawer ) & theDrawer);

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
None
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
None
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
		/**** md5 signature: 42666969419c36293cf76b80c7e1a7bc ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Draws a surface by drawing the isoparametric curves with respect to a fixed number of points given by the drawer. the number of isoparametric curves to be drawn and their color are controlled by the furnished drawer.

Parameters
----------
aPresentation: Prs3d_Presentation
aSurface: Adaptor3d_HSurface
aDrawer: Prs3d_Drawer

Returns
-------
None
") Add;
		static void Add(const opencascade::handle<Prs3d_Presentation> & aPresentation, const opencascade::handle<Adaptor3d_HSurface> & aSurface, const opencascade::handle<Prs3d_Drawer> & aDrawer);

};


%extend StdPrs_WFSurface {
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
