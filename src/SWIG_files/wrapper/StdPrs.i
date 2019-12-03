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
#include<BRepAdaptor_module.hxx>
#include<HLRAlgo_module.hxx>
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
%import BRepAdaptor.i
%import HLRAlgo.i
%import TColStd.i
%import Poly.i
%import TopLoc.i
%import BRep.i
%import GeomAbs.i
%import TopAbs.i
%import Adaptor2d.i
/* public enums */
enum StdPrs_Volume {
	StdPrs_Volume_Autodetection = 0,
	StdPrs_Volume_Closed = 1,
	StdPrs_Volume_Opened = 2,
};

/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
%template(StdPrs_Point) Prs3d_Point <opencascade::handle <Geom_Point>, StdPrs_ToolPoint>;
%template(StdPrs_Vertex) Prs3d_Point <TopoDS_Vertex , StdPrs_ToolVertex>;
/* end templates declaration */

/* typedefs */
typedef Prs3d_Point <opencascade::handle <Geom_Point>, StdPrs_ToolPoint> StdPrs_Point;
typedef Prs3d_Point <TopoDS_Vertex , StdPrs_ToolVertex> StdPrs_Vertex;
/* end typedefs declaration */

/**********************
* class StdPrs_BndBox *
**********************/
%nodefaultctor StdPrs_BndBox;
class StdPrs_BndBox : public Prs3d_Root {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Computes presentation of a bounding box. @param thePresentation [in] the presentation. @param theBndBox [in] the bounding box. @param theDrawer [in] the drawer.
	:param thePresentation:
	:type thePresentation: Prs3d_Presentation
	:param theBndBox:
	:type theBndBox: Bnd_Box
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:rtype: void") Add;
		static void Add (const opencascade::handle<Prs3d_Presentation> & thePresentation,const Bnd_Box & theBndBox,const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Computes presentation of a bounding box. @param thePresentation [in] the presentation. @param theBndBox [in] the bounding box. @param theDrawer [in] the drawer.
	:param thePresentation:
	:type thePresentation: Prs3d_Presentation
	:param theBndBox:
	:type theBndBox: Bnd_OBB
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:rtype: void") Add;
		static void Add (const opencascade::handle<Prs3d_Presentation> & thePresentation,const Bnd_OBB & theBndBox,const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** FillSegments ******************/
		%feature("compactdefaultargs") FillSegments;
		%feature("autodoc", "* Create primitive array with line segments for displaying a box. @param theBox [in] the box to add
	:param theBox:
	:type theBox: Bnd_OBB
	:rtype: opencascade::handle<Graphic3d_ArrayOfSegments>") FillSegments;
		static opencascade::handle<Graphic3d_ArrayOfSegments> FillSegments (const Bnd_OBB & theBox);

		/****************** FillSegments ******************/
		%feature("compactdefaultargs") FillSegments;
		%feature("autodoc", "* Create primitive array with line segments for displaying a box. @param theBox [in] the box to add
	:param theBox:
	:type theBox: Bnd_Box
	:rtype: opencascade::handle<Graphic3d_ArrayOfSegments>") FillSegments;
		static opencascade::handle<Graphic3d_ArrayOfSegments> FillSegments (const Bnd_Box & theBox);

		/****************** FillSegments ******************/
		%feature("compactdefaultargs") FillSegments;
		%feature("autodoc", "* Create primitive array with line segments for displaying a box. @param theSegments [in] [out] primitive array to be filled;  should be at least 8 nodes and 24 edges in size @param theBox [in] the box to add
	:param theSegments:
	:type theSegments: Graphic3d_ArrayOfSegments
	:param theBox:
	:type theBox: Bnd_OBB
	:rtype: None") FillSegments;
		static void FillSegments (const opencascade::handle<Graphic3d_ArrayOfSegments> & theSegments,const Bnd_OBB & theBox);

		/****************** FillSegments ******************/
		%feature("compactdefaultargs") FillSegments;
		%feature("autodoc", "* Create primitive array with line segments for displaying a box. @param theSegments [in] [out] primitive array to be filled;  should be at least 8 nodes and 24 edges in size @param theBox [in] the box to add
	:param theSegments:
	:type theSegments: Graphic3d_ArrayOfSegments
	:param theBox:
	:type theBox: Bnd_Box
	:rtype: None") FillSegments;
		static void FillSegments (const opencascade::handle<Graphic3d_ArrayOfSegments> & theSegments,const Bnd_Box & theBox);

		/****************** fillSegments ******************/
		%feature("compactdefaultargs") fillSegments;
		%feature("autodoc", "* Create primitive array with line segments for displaying a box. @param theSegments [in] [out] primitive array to be filled;  should be at least 8 nodes and 24 edges in size @param theBox [in] the box to add
	:param theSegments:
	:type theSegments: Graphic3d_ArrayOfSegments
	:param theBox:
	:type theBox: gp_Pnt *
	:rtype: None") fillSegments;
		static void fillSegments (const opencascade::handle<Graphic3d_ArrayOfSegments> & theSegments,const gp_Pnt * theBox);

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
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds to the presentation aPresentation the drawing of the curve aCurve. The aspect is defined by LineAspect in aDrawer. If drawCurve equals Standard_False the curve will not be displayed, it is used if the curve is a part of some shape and PrimitiveArray visualization approach is activated (it is activated by default).
	:param aPresentation:
	:type aPresentation: Prs3d_Presentation
	:param aCurve:
	:type aCurve: Adaptor3d_Curve
	:param aDrawer:
	:type aDrawer: Prs3d_Drawer
	:param drawCurve: default value is Standard_True
	:type drawCurve: bool
	:rtype: void") Add;
		static void Add (const opencascade::handle<Prs3d_Presentation> & aPresentation,const Adaptor3d_Curve & aCurve,const opencascade::handle<Prs3d_Drawer> & aDrawer,const Standard_Boolean drawCurve = Standard_True);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds to the presentation aPresentation the drawing of the curve aCurve. The aspect is defined by LineAspect in aDrawer. The drawing will be limited between the points of parameter U1 and U2. If drawCurve equals Standard_False the curve will not be displayed, it is used if the curve is a part of some shape and PrimitiveArray visualization approach is activated (it is activated by default).
	:param aPresentation:
	:type aPresentation: Prs3d_Presentation
	:param aCurve:
	:type aCurve: Adaptor3d_Curve
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param aDrawer:
	:type aDrawer: Prs3d_Drawer
	:param drawCurve: default value is Standard_True
	:type drawCurve: bool
	:rtype: void") Add;
		static void Add (const opencascade::handle<Prs3d_Presentation> & aPresentation,const Adaptor3d_Curve & aCurve,const Standard_Real U1,const Standard_Real U2,const opencascade::handle<Prs3d_Drawer> & aDrawer,const Standard_Boolean drawCurve = Standard_True);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* adds to the presentation aPresentation the drawing of the curve aCurve. The aspect is the current aspect. aDeflection is used in the circle case. Points give a sequence of curve points. If drawCurve equals Standard_False the curve will not be displayed, it is used if the curve is a part of some shape and PrimitiveArray visualization approach is activated (it is activated by default).
	:param aPresentation:
	:type aPresentation: Prs3d_Presentation
	:param aCurve:
	:type aCurve: Adaptor3d_Curve
	:param aDrawer:
	:type aDrawer: Prs3d_Drawer
	:param Points:
	:type Points: TColgp_SequenceOfPnt
	:param drawCurve: default value is Standard_True
	:type drawCurve: bool
	:rtype: void") Add;
		static void Add (const opencascade::handle<Prs3d_Presentation> & aPresentation,const Adaptor3d_Curve & aCurve,const opencascade::handle<Prs3d_Drawer> & aDrawer,TColgp_SequenceOfPnt & Points,const Standard_Boolean drawCurve = Standard_True);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* adds to the presentation aPresentation the drawing of the curve aCurve. The aspect is the current aspect. The drawing will be limited between the points of parameter U1 and U2. aDeflection is used in the circle case. Points give a sequence of curve points. If drawCurve equals Standard_False the curve will not be displayed, it is used if the curve is a part of some shape and PrimitiveArray visualization approach is activated (it is activated by default).
	:param aPresentation:
	:type aPresentation: Prs3d_Presentation
	:param aCurve:
	:type aCurve: Adaptor3d_Curve
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Points:
	:type Points: TColgp_SequenceOfPnt
	:param aNbPoints: default value is 30
	:type aNbPoints: int
	:param drawCurve: default value is Standard_True
	:type drawCurve: bool
	:rtype: void") Add;
		static void Add (const opencascade::handle<Prs3d_Presentation> & aPresentation,const Adaptor3d_Curve & aCurve,const Standard_Real U1,const Standard_Real U2,TColgp_SequenceOfPnt & Points,const Standard_Integer aNbPoints = 30,const Standard_Boolean drawCurve = Standard_True);

		/****************** Match ******************/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "* returns true if the distance between the point (X,Y,Z) and the drawing of the curve is less than aDistance.
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param aDistance:
	:type aDistance: float
	:param aCurve:
	:type aCurve: Adaptor3d_Curve
	:param aDrawer:
	:type aDrawer: Prs3d_Drawer
	:rtype: bool") Match;
		static Standard_Boolean Match (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real aDistance,const Adaptor3d_Curve & aCurve,const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****************** Match ******************/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "* returns true if the distance between the point (X,Y,Z) and the drawing of the curve is less than aDistance.
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param aDistance:
	:type aDistance: float
	:param aCurve:
	:type aCurve: Adaptor3d_Curve
	:param aDeflection:
	:type aDeflection: float
	:param aLimit:
	:type aLimit: float
	:param aNbPoints:
	:type aNbPoints: int
	:rtype: bool") Match;
		static Standard_Boolean Match (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real aDistance,const Adaptor3d_Curve & aCurve,const Standard_Real aDeflection,const Standard_Real aLimit,const Standard_Integer aNbPoints);

		/****************** Match ******************/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "* returns true if the distance between the point (X,Y,Z) and the drawing of the curve aCurve is less than aDistance. The drawing is considered between the points of parameter U1 and U2;
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param aDistance:
	:type aDistance: float
	:param aCurve:
	:type aCurve: Adaptor3d_Curve
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param aDrawer:
	:type aDrawer: Prs3d_Drawer
	:rtype: bool") Match;
		static Standard_Boolean Match (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real aDistance,const Adaptor3d_Curve & aCurve,const Standard_Real U1,const Standard_Real U2,const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****************** Match ******************/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "* returns true if the distance between the point (X,Y,Z) and the drawing of the curve aCurve is less than aDistance. The drawing is considered between the points of parameter U1 and U2;
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param aDistance:
	:type aDistance: float
	:param aCurve:
	:type aCurve: Adaptor3d_Curve
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param aDeflection:
	:type aDeflection: float
	:param aNbPoints:
	:type aNbPoints: int
	:rtype: bool") Match;
		static Standard_Boolean Match (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real aDistance,const Adaptor3d_Curve & aCurve,const Standard_Real U1,const Standard_Real U2,const Standard_Real aDeflection,const Standard_Integer aNbPoints);

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
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Defines the hidden line removal display of the topology aShape in the projection defined by aProjector. The shape and the projection are added to the display aPresentation, and the attributes of the elements present in the aPresentation are defined by the attribute manager aDrawer.
	:param aPresentation:
	:type aPresentation: Prs3d_Presentation
	:param aShape:
	:type aShape: TopoDS_Shape
	:param aDrawer:
	:type aDrawer: Prs3d_Drawer
	:param aProjector:
	:type aProjector: Prs3d_Projector
	:rtype: void") Add;
		static void Add (const opencascade::handle<Prs3d_Presentation> & aPresentation,const TopoDS_Shape & aShape,const opencascade::handle<Prs3d_Drawer> & aDrawer,const opencascade::handle<Prs3d_Projector> & aProjector);

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
		%feature("compactdefaultargs") Add;
		%feature("autodoc", ":param thePresentation:
	:type thePresentation: Prs3d_Presentation
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:param theProjector:
	:type theProjector: Prs3d_Projector
	:rtype: void") Add;
		static void Add (const opencascade::handle<Prs3d_Presentation> & thePresentation,const TopoDS_Shape & theShape,const opencascade::handle<Prs3d_Drawer> & theDrawer,const opencascade::handle<Prs3d_Projector> & theProjector);

};


%extend StdPrs_HLRShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class StdPrs_HLRToolShape *
****************************/
%nodefaultctor StdPrs_HLRToolShape;
class StdPrs_HLRToolShape {
	public:
		/****************** Hidden ******************/
		%feature("compactdefaultargs") Hidden;
		%feature("autodoc", ":param TheEdge:
	:type TheEdge: BRepAdaptor_Curve
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: None") Hidden;
		void Hidden (BRepAdaptor_Curve & TheEdge,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** InitHidden ******************/
		%feature("compactdefaultargs") InitHidden;
		%feature("autodoc", ":param EdgeNumber:
	:type EdgeNumber: int
	:rtype: None") InitHidden;
		void InitHidden (const Standard_Integer EdgeNumber);

		/****************** InitVisible ******************/
		%feature("compactdefaultargs") InitVisible;
		%feature("autodoc", ":param EdgeNumber:
	:type EdgeNumber: int
	:rtype: None") InitVisible;
		void InitVisible (const Standard_Integer EdgeNumber);

		/****************** MoreHidden ******************/
		%feature("compactdefaultargs") MoreHidden;
		%feature("autodoc", ":rtype: bool") MoreHidden;
		Standard_Boolean MoreHidden ();

		/****************** MoreVisible ******************/
		%feature("compactdefaultargs") MoreVisible;
		%feature("autodoc", ":rtype: bool") MoreVisible;
		Standard_Boolean MoreVisible ();

		/****************** NbEdges ******************/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", ":rtype: int") NbEdges;
		Standard_Integer NbEdges ();

		/****************** NextHidden ******************/
		%feature("compactdefaultargs") NextHidden;
		%feature("autodoc", ":rtype: None") NextHidden;
		void NextHidden ();

		/****************** NextVisible ******************/
		%feature("compactdefaultargs") NextVisible;
		%feature("autodoc", ":rtype: None") NextVisible;
		void NextVisible ();

		/****************** StdPrs_HLRToolShape ******************/
		%feature("compactdefaultargs") StdPrs_HLRToolShape;
		%feature("autodoc", ":param TheShape:
	:type TheShape: TopoDS_Shape
	:param TheProjector:
	:type TheProjector: HLRAlgo_Projector
	:rtype: None") StdPrs_HLRToolShape;
		 StdPrs_HLRToolShape (const TopoDS_Shape & TheShape,const HLRAlgo_Projector & TheProjector);

		/****************** Visible ******************/
		%feature("compactdefaultargs") Visible;
		%feature("autodoc", ":param TheEdge:
	:type TheEdge: BRepAdaptor_Curve
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: None") Visible;
		void Visible (BRepAdaptor_Curve & TheEdge,Standard_Real &OutValue,Standard_Real &OutValue);

};


%extend StdPrs_HLRToolShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class StdPrs_Isolines *
************************/
%nodefaultctor StdPrs_Isolines;
class StdPrs_Isolines : public Prs3d_Root {
	public:
		class PntOnIso {};
		class SegOnIso {};
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Computes isolines presentation for a TopoDS face. This method chooses proper version of isoline builder algorithm : on triangulation or surface depending on the flag passed from Prs3d_Drawer attributes. This method is a default way to display isolines for a given TopoDS face. @param thePresentation [in] the presentation. @param theFace [in] the face. @param theDrawer [in] the display settings. @param theDeflection [in] the deflection for isolines-on-surface version.
	:param thePresentation:
	:type thePresentation: Prs3d_Presentation
	:param theFace:
	:type theFace: TopoDS_Face
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:param theDeflection:
	:type theDeflection: float
	:rtype: inline void") Add;
		inline static void Add (const opencascade::handle<Prs3d_Presentation> & thePresentation,const TopoDS_Face & theFace,const opencascade::handle<Prs3d_Drawer> & theDrawer,const Standard_Real theDeflection);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Computes isolines presentation for a TopoDS face. This method chooses proper version of isoline builder algorithm : on triangulation or surface depending on the flag passed from Prs3d_Drawer attributes. This method is a default way to display isolines for a given TopoDS face. @param theFace [in] the face. @param theDrawer [in] the display settings. @param theDeflection [in] the deflection for isolines-on-surface version.
	:param theFace:
	:type theFace: TopoDS_Face
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:param theDeflection:
	:type theDeflection: float
	:param theUPolylines:
	:type theUPolylines: Prs3d_NListOfSequenceOfPnt
	:param theVPolylines:
	:type theVPolylines: Prs3d_NListOfSequenceOfPnt
	:rtype: None") Add;
		static void Add (const TopoDS_Face & theFace,const opencascade::handle<Prs3d_Drawer> & theDrawer,const Standard_Real theDeflection,Prs3d_NListOfSequenceOfPnt & theUPolylines,Prs3d_NListOfSequenceOfPnt & theVPolylines);

		/****************** AddOnSurface ******************/
		%feature("compactdefaultargs") AddOnSurface;
		%feature("autodoc", "* Computes isolines on surface and adds them to presentation. @param thePresentation [in] the presentation. @param theFace [in] the face. @param theDrawer [in] the display settings. @param theDeflection [in] the deflection value.
	:param thePresentation:
	:type thePresentation: Prs3d_Presentation
	:param theFace:
	:type theFace: TopoDS_Face
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:param theDeflection:
	:type theDeflection: float
	:rtype: void") AddOnSurface;
		static void AddOnSurface (const opencascade::handle<Prs3d_Presentation> & thePresentation,const TopoDS_Face & theFace,const opencascade::handle<Prs3d_Drawer> & theDrawer,const Standard_Real theDeflection);

		/****************** AddOnSurface ******************/
		%feature("compactdefaultargs") AddOnSurface;
		%feature("autodoc", "* Computes isolines on surface and adds them to presentation. @param theFace [in] the face @param theDrawer [in] the display settings @param theDeflection [in] the deflection value @param theUPolylines [out] the sequence of result polylines @param theVPolylines [out] the sequence of result polylines
	:param theFace:
	:type theFace: TopoDS_Face
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:param theDeflection:
	:type theDeflection: float
	:param theUPolylines:
	:type theUPolylines: Prs3d_NListOfSequenceOfPnt
	:param theVPolylines:
	:type theVPolylines: Prs3d_NListOfSequenceOfPnt
	:rtype: void") AddOnSurface;
		static void AddOnSurface (const TopoDS_Face & theFace,const opencascade::handle<Prs3d_Drawer> & theDrawer,const Standard_Real theDeflection,Prs3d_NListOfSequenceOfPnt & theUPolylines,Prs3d_NListOfSequenceOfPnt & theVPolylines);

		/****************** AddOnSurface ******************/
		%feature("compactdefaultargs") AddOnSurface;
		%feature("autodoc", "* Computes isolines on surface and adds them to presentation. @param thePresentation [in] the presentation. @param theSurface [in] the surface. @param theDrawer [in] the display settings. @param theDeflection [in] the deflection value. @param theUIsoParams [in] the parameters of u isolines to compute. @param theVIsoParams [in] the parameters of v isolines to compute.
	:param thePresentation:
	:type thePresentation: Prs3d_Presentation
	:param theSurface:
	:type theSurface: BRepAdaptor_HSurface
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:param theDeflection:
	:type theDeflection: float
	:param theUIsoParams:
	:type theUIsoParams: TColStd_SequenceOfReal
	:param theVIsoParams:
	:type theVIsoParams: TColStd_SequenceOfReal
	:rtype: void") AddOnSurface;
		static void AddOnSurface (const opencascade::handle<Prs3d_Presentation> & thePresentation,const opencascade::handle<BRepAdaptor_HSurface> & theSurface,const opencascade::handle<Prs3d_Drawer> & theDrawer,const Standard_Real theDeflection,const TColStd_SequenceOfReal & theUIsoParams,const TColStd_SequenceOfReal & theVIsoParams);

		/****************** AddOnTriangulation ******************/
		%feature("compactdefaultargs") AddOnTriangulation;
		%feature("autodoc", "* Computes isolines on triangulation and adds them to a presentation. @param thePresentation [in] the presentation. @param theFace [in] the face. @param theDrawer [in] the display settings.
	:param thePresentation:
	:type thePresentation: Prs3d_Presentation
	:param theFace:
	:type theFace: TopoDS_Face
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:rtype: void") AddOnTriangulation;
		static void AddOnTriangulation (const opencascade::handle<Prs3d_Presentation> & thePresentation,const TopoDS_Face & theFace,const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** AddOnTriangulation ******************/
		%feature("compactdefaultargs") AddOnTriangulation;
		%feature("autodoc", "* Computes isolines on triangulation. @param theFace [in] the face. @param theDrawer [in] the display settings. @param theUPolylines [out] the sequence of result polylines @param theVPolylines [out] the sequence of result polylines
	:param theFace:
	:type theFace: TopoDS_Face
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:param theUPolylines:
	:type theUPolylines: Prs3d_NListOfSequenceOfPnt
	:param theVPolylines:
	:type theVPolylines: Prs3d_NListOfSequenceOfPnt
	:rtype: void") AddOnTriangulation;
		static void AddOnTriangulation (const TopoDS_Face & theFace,const opencascade::handle<Prs3d_Drawer> & theDrawer,Prs3d_NListOfSequenceOfPnt & theUPolylines,Prs3d_NListOfSequenceOfPnt & theVPolylines);

		/****************** AddOnTriangulation ******************/
		%feature("compactdefaultargs") AddOnTriangulation;
		%feature("autodoc", "* Computes isolines on triangulation and adds them to a presentation. @param thePresentation [in] the presentation. @param theTriangulation [in] the triangulation. @param theSurface [in] the definition of triangulated surface. The surface adapter is used to precisely evaluate isoline points using surface law and fit them on triangulation. If NULL is passed, the method will use linear interpolation of triangle node's UV coordinates to evaluate isoline points. @param theLocation [in] the location transformation defined for triangulation (surface). @param theDrawer [in] the display settings. @param theUIsoParams [in] the parameters of u isolines to compute. @param theVIsoParams [in] the parameters of v isolines to compute.
	:param thePresentation:
	:type thePresentation: Prs3d_Presentation
	:param theTriangulation:
	:type theTriangulation: Poly_Triangulation
	:param theSurface:
	:type theSurface: Geom_Surface
	:param theLocation:
	:type theLocation: TopLoc_Location
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:param theUIsoParams:
	:type theUIsoParams: TColStd_SequenceOfReal
	:param theVIsoParams:
	:type theVIsoParams: TColStd_SequenceOfReal
	:rtype: void") AddOnTriangulation;
		static void AddOnTriangulation (const opencascade::handle<Prs3d_Presentation> & thePresentation,const opencascade::handle<Poly_Triangulation> & theTriangulation,const opencascade::handle<Geom_Surface> & theSurface,const TopLoc_Location & theLocation,const opencascade::handle<Prs3d_Drawer> & theDrawer,const TColStd_SequenceOfReal & theUIsoParams,const TColStd_SequenceOfReal & theVIsoParams);

		/****************** UVIsoParameters ******************/
		%feature("compactdefaultargs") UVIsoParameters;
		%feature("autodoc", "* Evalute sequence of parameters for drawing uv isolines for a given face. @param theFace [in] the face. @param theNbIsoU [in] the number of u isolines. @param theNbIsoV [in] the number of v isolines. @param theUVLimit [in] the u, v parameter value limit. @param theUIsoParams [out] the sequence of u isoline parameters. @param theVIsoParams [out] the sequence of v isoline parameters. @param theUmin [out] the lower U boundary of theFace. @param theUmax [out] the upper U boundary of theFace. @param theVmin [out] the lower V boundary of theFace. @param theVmax [out] the upper V boundary of theFace.
	:param theFace:
	:type theFace: TopoDS_Face
	:param theNbIsoU:
	:type theNbIsoU: int
	:param theNbIsoV:
	:type theNbIsoV: int
	:param theUVLimit:
	:type theUVLimit: float
	:param theUIsoParams:
	:type theUIsoParams: TColStd_SequenceOfReal
	:param theVIsoParams:
	:type theVIsoParams: TColStd_SequenceOfReal
	:param theUmin:
	:type theUmin: float
	:param theUmax:
	:type theUmax: float
	:param theVmin:
	:type theVmin: float
	:param theVmax:
	:type theVmax: float
	:rtype: void") UVIsoParameters;
		static void UVIsoParameters (const TopoDS_Face & theFace,const Standard_Integer theNbIsoU,const Standard_Integer theNbIsoV,const Standard_Real theUVLimit,TColStd_SequenceOfReal & theUIsoParams,TColStd_SequenceOfReal & theVIsoParams,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

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
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Defines display of infinite planes. The infinite plane aPlane is added to the display aPresentation, and the attributes of the display are defined by the attribute manager aDrawer.
	:param aPresentation:
	:type aPresentation: Prs3d_Presentation
	:param aPlane:
	:type aPlane: Adaptor3d_Surface
	:param aDrawer:
	:type aDrawer: Prs3d_Drawer
	:rtype: void") Add;
		static void Add (const opencascade::handle<Prs3d_Presentation> & aPresentation,const Adaptor3d_Surface & aPlane,const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****************** Match ******************/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "* returns true if the distance between the point (X,Y,Z) and the plane is less than aDistance.
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param aDistance:
	:type aDistance: float
	:param aPlane:
	:type aPlane: Adaptor3d_Surface
	:param aDrawer:
	:type aDrawer: Prs3d_Drawer
	:rtype: bool") Match;
		static Standard_Boolean Match (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real aDistance,const Adaptor3d_Surface & aPlane,const opencascade::handle<Prs3d_Drawer> & aDrawer);

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
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Defines display of BSpline and Bezier curves. Adds the 3D curve aCurve to the StdPrs_PoleCurve algorithm. This shape is found in the presentation object aPresentation, and its display attributes are set in the attribute manager aDrawer. The curve object from Adaptor3d provides data from a Geom curve. This makes it possible to use the surface in a geometric algorithm.
	:param aPresentation:
	:type aPresentation: Prs3d_Presentation
	:param aCurve:
	:type aCurve: Adaptor3d_Curve
	:param aDrawer:
	:type aDrawer: Prs3d_Drawer
	:rtype: void") Add;
		static void Add (const opencascade::handle<Prs3d_Presentation> & aPresentation,const Adaptor3d_Curve & aCurve,const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****************** Match ******************/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "* returns true if the distance between the point (X,Y,Z) and the broken line made of the poles is less then aDistance.
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param aDistance:
	:type aDistance: float
	:param aCurve:
	:type aCurve: Adaptor3d_Curve
	:param aDrawer:
	:type aDrawer: Prs3d_Drawer
	:rtype: bool") Match;
		static Standard_Boolean Match (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real aDistance,const Adaptor3d_Curve & aCurve,const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****************** Pick ******************/
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "* returns the pole the most near of the point (X,Y,Z) and returns its range. The distance between the pole and (X,Y,Z) must be less then aDistance. If no pole corresponds, 0 is returned.
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param aDistance:
	:type aDistance: float
	:param aCurve:
	:type aCurve: Adaptor3d_Curve
	:param aDrawer:
	:type aDrawer: Prs3d_Drawer
	:rtype: int") Pick;
		static Standard_Integer Pick (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real aDistance,const Adaptor3d_Curve & aCurve,const opencascade::handle<Prs3d_Drawer> & aDrawer);

};


%extend StdPrs_PoleCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class StdPrs_ShadedShape *
***************************/
%nodefaultctor StdPrs_ShadedShape;
class StdPrs_ShadedShape : public Prs3d_Root {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Shades <theShape>. @param theVolumeType defines the way how to interpret input shapes - as Closed volumes (to activate back-face culling and capping plane algorithms), as Open volumes (shells or solids with holes) or to perform Autodetection (would split input shape into two groups)
	:param thePresentation:
	:type thePresentation: Prs3d_Presentation
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:param theVolume: default value is StdPrs_Volume_Autodetection
	:type theVolume: StdPrs_Volume
	:rtype: void") Add;
		static void Add (const opencascade::handle<Prs3d_Presentation> & thePresentation,const TopoDS_Shape & theShape,const opencascade::handle<Prs3d_Drawer> & theDrawer,const StdPrs_Volume theVolume = StdPrs_Volume_Autodetection);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Shades <theShape> with texture coordinates. @param theVolumeType defines the way how to interpret input shapes - as Closed volumes (to activate back-face culling and capping plane algorithms), as Open volumes (shells or solids with holes) or to perform Autodetection (would split input shape into two groups)
	:param thePresentation:
	:type thePresentation: Prs3d_Presentation
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:param theHasTexels:
	:type theHasTexels: bool
	:param theUVOrigin:
	:type theUVOrigin: gp_Pnt2d
	:param theUVRepeat:
	:type theUVRepeat: gp_Pnt2d
	:param theUVScale:
	:type theUVScale: gp_Pnt2d
	:param theVolume: default value is StdPrs_Volume_Autodetection
	:type theVolume: StdPrs_Volume
	:rtype: void") Add;
		static void Add (const opencascade::handle<Prs3d_Presentation> & thePresentation,const TopoDS_Shape & theShape,const opencascade::handle<Prs3d_Drawer> & theDrawer,const Standard_Boolean theHasTexels,const gp_Pnt2d & theUVOrigin,const gp_Pnt2d & theUVRepeat,const gp_Pnt2d & theUVScale,const StdPrs_Volume theVolume = StdPrs_Volume_Autodetection);

		/****************** AddWireframeForFacesWithoutTriangles ******************/
		%feature("compactdefaultargs") AddWireframeForFacesWithoutTriangles;
		%feature("autodoc", "* Computes special wireframe presentation for faces without triangulation.
	:param thePrs:
	:type thePrs: Prs3d_Presentation
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:rtype: void") AddWireframeForFacesWithoutTriangles;
		static void AddWireframeForFacesWithoutTriangles (const opencascade::handle<Prs3d_Presentation> & thePrs,const TopoDS_Shape & theShape,const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** AddWireframeForFreeElements ******************/
		%feature("compactdefaultargs") AddWireframeForFreeElements;
		%feature("autodoc", "* Computes wireframe presentation for free wires and vertices
	:param thePrs:
	:type thePrs: Prs3d_Presentation
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:rtype: void") AddWireframeForFreeElements;
		static void AddWireframeForFreeElements (const opencascade::handle<Prs3d_Presentation> & thePrs,const TopoDS_Shape & theShape,const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** ExploreSolids ******************/
		%feature("compactdefaultargs") ExploreSolids;
		%feature("autodoc", "* Searches closed and unclosed subshapes in shape structure and puts them into two compounds for separate processing of closed and unclosed sub-shapes
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theBuilder:
	:type theBuilder: BRep_Builder
	:param theClosed:
	:type theClosed: TopoDS_Compound
	:param theOpened:
	:type theOpened: TopoDS_Compound
	:param theIgnore1DSubShape:
	:type theIgnore1DSubShape: bool
	:rtype: void") ExploreSolids;
		static void ExploreSolids (const TopoDS_Shape & theShape,const BRep_Builder & theBuilder,TopoDS_Compound & theClosed,TopoDS_Compound & theOpened,const Standard_Boolean theIgnore1DSubShape);

		/****************** FillFaceBoundaries ******************/
		%feature("compactdefaultargs") FillFaceBoundaries;
		%feature("autodoc", "* Define primitive array of boundary segments for specified shape. @param theShape segments array or NULL if specified face does not have computed triangulation @param theUpperContinuity the most edge continuity class to be included to result (edges with more continuity will be ignored)
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theUpperContinuity: default value is GeomAbs_CN
	:type theUpperContinuity: GeomAbs_Shape
	:rtype: opencascade::handle<Graphic3d_ArrayOfSegments>") FillFaceBoundaries;
		static opencascade::handle<Graphic3d_ArrayOfSegments> FillFaceBoundaries (const TopoDS_Shape & theShape,GeomAbs_Shape theUpperContinuity = GeomAbs_CN);

		/****************** FillTriangles ******************/
		%feature("compactdefaultargs") FillTriangles;
		%feature("autodoc", "* Create primitive array with triangles for specified shape. @param theShape [in] the shape with precomputed triangulation
	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: opencascade::handle<Graphic3d_ArrayOfTriangles>") FillTriangles;
		static opencascade::handle<Graphic3d_ArrayOfTriangles> FillTriangles (const TopoDS_Shape & theShape);

		/****************** FillTriangles ******************/
		%feature("compactdefaultargs") FillTriangles;
		%feature("autodoc", "* Create primitive array of triangles for specified shape. @param theShape the shape with precomputed triangulation @param theHasTexels define UV coordinates in primitive array @param theUVOrigin origin for UV coordinates @param theUVRepeat repeat parameters for UV coordinates @param theUVScale scale coefficients for UV coordinates returns triangles array or NULL if specified face does not have computed triangulation
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theHasTexels:
	:type theHasTexels: bool
	:param theUVOrigin:
	:type theUVOrigin: gp_Pnt2d
	:param theUVRepeat:
	:type theUVRepeat: gp_Pnt2d
	:param theUVScale:
	:type theUVScale: gp_Pnt2d
	:rtype: opencascade::handle<Graphic3d_ArrayOfTriangles>") FillTriangles;
		static opencascade::handle<Graphic3d_ArrayOfTriangles> FillTriangles (const TopoDS_Shape & theShape,const Standard_Boolean theHasTexels,const gp_Pnt2d & theUVOrigin,const gp_Pnt2d & theUVRepeat,const gp_Pnt2d & theUVScale);

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
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds the surface aSurface to the presentation object aPresentation. The surface's display attributes are set in the attribute manager aDrawer. The surface object from Adaptor3d provides data from a Geom surface in order to use the surface in an algorithm.
	:param aPresentation:
	:type aPresentation: Prs3d_Presentation
	:param aSurface:
	:type aSurface: Adaptor3d_Surface
	:param aDrawer:
	:type aDrawer: Prs3d_Drawer
	:rtype: void") Add;
		static void Add (const opencascade::handle<Prs3d_Presentation> & aPresentation,const Adaptor3d_Surface & aSurface,const opencascade::handle<Prs3d_Drawer> & aDrawer);

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
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", ":param aPoint:
	:type aPoint: Geom_Point
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:rtype: void") Coord;
		static void Coord (const opencascade::handle<Geom_Point> & aPoint,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

};


%extend StdPrs_ToolPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class StdPrs_ToolRFace *
*************************/
%nodefaultctor StdPrs_ToolRFace;
class StdPrs_ToolRFace {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Move iterator to the first element.
	:rtype: None") Init;
		void Init ();

		/****************** IsInvalidGeometry ******************/
		%feature("compactdefaultargs") IsInvalidGeometry;
		%feature("autodoc", "* Return True if NULL curves have been skipped.
	:rtype: bool") IsInvalidGeometry;
		Standard_Boolean IsInvalidGeometry ();

		/****************** IsOriented ******************/
		%feature("compactdefaultargs") IsOriented;
		%feature("autodoc", "* Return True indicating that iterator looks only for oriented edges.
	:rtype: bool") IsOriented;
		Standard_Boolean IsOriented ();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "* Return True if iterator points to the curve.
	:rtype: bool") More;
		Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Go to the next curve in the face.
	:rtype: None") Next;
		void Next ();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "* Return current edge orientation.
	:rtype: TopAbs_Orientation") Orientation;
		TopAbs_Orientation Orientation ();

		/****************** StdPrs_ToolRFace ******************/
		%feature("compactdefaultargs") StdPrs_ToolRFace;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") StdPrs_ToolRFace;
		 StdPrs_ToolRFace ();

		/****************** StdPrs_ToolRFace ******************/
		%feature("compactdefaultargs") StdPrs_ToolRFace;
		%feature("autodoc", "* Constructor with initialization.
	:param aSurface:
	:type aSurface: BRepAdaptor_HSurface
	:rtype: None") StdPrs_ToolRFace;
		 StdPrs_ToolRFace (const opencascade::handle<BRepAdaptor_HSurface> & aSurface);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Return current curve.
	:rtype: Adaptor2d_Curve2d") Value;
		const Adaptor2d_Curve2d & Value ();

};


%extend StdPrs_ToolRFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StdPrs_ToolTriangulatedShape *
*************************************/
%nodefaultctor StdPrs_ToolTriangulatedShape;
class StdPrs_ToolTriangulatedShape {
	public:
		/****************** ClearOnOwnDeflectionChange ******************/
		%feature("compactdefaultargs") ClearOnOwnDeflectionChange;
		%feature("autodoc", "* If presentation has own deviation coefficient and IsAutoTriangulation() is true, function will compare actual coefficients with previous values and will clear triangulation on their change (regardless actual tessellation quality). Function is placed here for compatibility reasons - new code should avoid using IsAutoTriangulation(). @param theShape [in] the shape @param theDrawer [in] the display settings @param theToResetCoeff [in] updates coefficients in theDrawer to actual state to avoid redundant recomputations
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:param theToResetCoeff:
	:type theToResetCoeff: bool
	:rtype: void") ClearOnOwnDeflectionChange;
		static void ClearOnOwnDeflectionChange (const TopoDS_Shape & theShape,const opencascade::handle<Prs3d_Drawer> & theDrawer,const Standard_Boolean theToResetCoeff);

		/****************** ComputeNormals ******************/
		%feature("compactdefaultargs") ComputeNormals;
		%feature("autodoc", "* Computes nodal normals for Poly_Triangulation structure using UV coordinates and surface. Does nothing if triangulation already defines normals. @param theFace [in] the face @param theTris [in] the definition of a face triangulation
	:param theFace:
	:type theFace: TopoDS_Face
	:param theTris:
	:type theTris: Poly_Triangulation
	:rtype: None") ComputeNormals;
		static void ComputeNormals (const TopoDS_Face & theFace,const opencascade::handle<Poly_Triangulation> & theTris);

		/****************** ComputeNormals ******************/
		%feature("compactdefaultargs") ComputeNormals;
		%feature("autodoc", "* Computes nodal normals for Poly_Triangulation structure using UV coordinates and surface. Does nothing if triangulation already defines normals. @param theFace [in] the face @param theTris [in] the definition of a face triangulation @param thePolyConnect [in,out] optional, initialized tool for exploring triangulation
	:param theFace:
	:type theFace: TopoDS_Face
	:param theTris:
	:type theTris: Poly_Triangulation
	:param thePolyConnect:
	:type thePolyConnect: Poly_Connect
	:rtype: void") ComputeNormals;
		static void ComputeNormals (const TopoDS_Face & theFace,const opencascade::handle<Poly_Triangulation> & theTris,Poly_Connect & thePolyConnect);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "* Checks back faces visibility for specified shape (to activate back-face culling). returns true if shape is closed manifold Solid or compound of such Solids.
	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: bool") IsClosed;
		static Standard_Boolean IsClosed (const TopoDS_Shape & theShape);

		/****************** IsTessellated ******************/
		%feature("compactdefaultargs") IsTessellated;
		%feature("autodoc", "* Checks whether the shape is properly triangulated for a given display settings. @param theShape [in] the shape. @param theDrawer [in] the display settings.
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:rtype: bool") IsTessellated;
		static Standard_Boolean IsTessellated (const TopoDS_Shape & theShape,const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** IsTriangulated ******************/
		%feature("compactdefaultargs") IsTriangulated;
		%feature("autodoc", "* Similar to BRepTools::Triangulation() but without extra checks. returns true if all faces within shape are triangulated.
	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: bool") IsTriangulated;
		static Standard_Boolean IsTriangulated (const TopoDS_Shape & theShape);

		/****************** Normal ******************/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "* Evaluate normals for a triangle of a face. @param theFace [in] the face. @param thePolyConnect [in] the definition of a face triangulation. @param theNormal [out] the array of normals for each triangle.
	:param theFace:
	:type theFace: TopoDS_Face
	:param thePolyConnect:
	:type thePolyConnect: Poly_Connect
	:param theNormals:
	:type theNormals: TColgp_Array1OfDir
	:rtype: void") Normal;
		static void Normal (const TopoDS_Face & theFace,Poly_Connect & thePolyConnect,TColgp_Array1OfDir & theNormals);

		/****************** Tessellate ******************/
		%feature("compactdefaultargs") Tessellate;
		%feature("autodoc", "* Validates triangulation within the shape and performs tessellation if necessary. @param theShape [in] the shape. @param theDrawer [in] the display settings. returns true if tesselation was recomputed and false otherwise.
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:rtype: bool") Tessellate;
		static Standard_Boolean Tessellate (const TopoDS_Shape & theShape,const opencascade::handle<Prs3d_Drawer> & theDrawer);

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
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", ":param aPoint:
	:type aPoint: TopoDS_Vertex
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:rtype: void") Coord;
		static void Coord (const TopoDS_Vertex & aPoint,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

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
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Defines a display featuring U and V isoparameters. Adds the surface aFace to the StdPrs_WFRestrictedFace algorithm. This face is found in a shape in the presentation object aPresentation, and its display attributes - in particular, the number of U and V isoparameters - are set in the attribute manager aDrawer. aFace is BRepAdaptor_HSurface surface created from a face in a topological shape. which is passed as an argument through the BRepAdaptor_HSurface surface created from it. This is what allows the topological face to be treated as a geometric surface.
	:param aPresentation:
	:type aPresentation: Prs3d_Presentation
	:param aFace:
	:type aFace: BRepAdaptor_HSurface
	:param aDrawer:
	:type aDrawer: Prs3d_Drawer
	:rtype: void") Add;
		static void Add (const opencascade::handle<Prs3d_Presentation> & aPresentation,const opencascade::handle<BRepAdaptor_HSurface> & aFace,const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Defines a display of a delection-specified face. The display will feature U and V isoparameters. Adds the topology aShape to the StdPrs_WFRestrictedFace algorithm. This shape is found in the presentation object aPresentation, and its display attributes - except the number of U and V isoparameters - are set in the attribute manager aDrawer. The function sets the number of U and V isoparameters, NBUiso and NBViso, in the shape. To do this, the arguments DrawUIso and DrawVIso must be true. aFace is BRepAdaptor_HSurface surface created from a face in a topological shape. which is passed as an argument through the BRepAdaptor_HSurface surface created from it. This is what allows the topological face to be treated as a geometric surface. Curves give a sequence of face curves, it is used if the PrimitiveArray visualization approach is activated (it is activated by default).
	:param aPresentation:
	:type aPresentation: Prs3d_Presentation
	:param aFace:
	:type aFace: BRepAdaptor_HSurface
	:param DrawUIso:
	:type DrawUIso: bool
	:param DrawVIso:
	:type DrawVIso: bool
	:param Deflection:
	:type Deflection: float
	:param NBUiso:
	:type NBUiso: int
	:param NBViso:
	:type NBViso: int
	:param aDrawer:
	:type aDrawer: Prs3d_Drawer
	:param Curves:
	:type Curves: Prs3d_NListOfSequenceOfPnt
	:rtype: void") Add;
		static void Add (const opencascade::handle<Prs3d_Presentation> & aPresentation,const opencascade::handle<BRepAdaptor_HSurface> & aFace,const Standard_Boolean DrawUIso,const Standard_Boolean DrawVIso,const Standard_Real Deflection,const Standard_Integer NBUiso,const Standard_Integer NBViso,const opencascade::handle<Prs3d_Drawer> & aDrawer,Prs3d_NListOfSequenceOfPnt & Curves);

		/****************** AddUIso ******************/
		%feature("compactdefaultargs") AddUIso;
		%feature("autodoc", "* Defines a display featuring U isoparameters respectively. Add the surface aFace to the StdPrs_WFRestrictedFace algorithm. This face is found in a shape in the presentation object aPresentation, and its display attributes - in particular, the number of U isoparameters - are set in the attribute manager aDrawer. aFace is BRepAdaptor_HSurface surface created from a face in a topological shape. which is passed to the function as an argument through the BRepAdaptor_HSurface surface created from it. This is what allows the topological face to be treated as a geometric surface.
	:param aPresentation:
	:type aPresentation: Prs3d_Presentation
	:param aFace:
	:type aFace: BRepAdaptor_HSurface
	:param aDrawer:
	:type aDrawer: Prs3d_Drawer
	:rtype: void") AddUIso;
		static void AddUIso (const opencascade::handle<Prs3d_Presentation> & aPresentation,const opencascade::handle<BRepAdaptor_HSurface> & aFace,const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****************** AddVIso ******************/
		%feature("compactdefaultargs") AddVIso;
		%feature("autodoc", "* Defines a display featuring V isoparameters respectively. Add the surface aFace to the StdPrs_WFRestrictedFace algorithm. This face is found in a shape in the presentation object aPresentation, and its display attributes - in particular, the number of V isoparameters - are set in the attribute manager aDrawer. aFace is BRepAdaptor_HSurface surface created from a face in a topological shape. which is passed to the function as an argument through the BRepAdaptor_HSurface surface created from it. This is what allows the topological face to be treated as a geometric surface.
	:param aPresentation:
	:type aPresentation: Prs3d_Presentation
	:param aFace:
	:type aFace: BRepAdaptor_HSurface
	:param aDrawer:
	:type aDrawer: Prs3d_Drawer
	:rtype: void") AddVIso;
		static void AddVIso (const opencascade::handle<Prs3d_Presentation> & aPresentation,const opencascade::handle<BRepAdaptor_HSurface> & aFace,const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****************** Match ******************/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", ":param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param aDistance:
	:type aDistance: float
	:param aFace:
	:type aFace: BRepAdaptor_HSurface
	:param aDrawer:
	:type aDrawer: Prs3d_Drawer
	:rtype: bool") Match;
		static Standard_Boolean Match (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real aDistance,const opencascade::handle<BRepAdaptor_HSurface> & aFace,const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****************** Match ******************/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", ":param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param aDistance:
	:type aDistance: float
	:param aFace:
	:type aFace: BRepAdaptor_HSurface
	:param aDrawer:
	:type aDrawer: Prs3d_Drawer
	:param DrawUIso:
	:type DrawUIso: bool
	:param DrawVIso:
	:type DrawVIso: bool
	:param aDeflection:
	:type aDeflection: float
	:param NBUiso:
	:type NBUiso: int
	:param NBViso:
	:type NBViso: int
	:rtype: bool") Match;
		static Standard_Boolean Match (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real aDistance,const opencascade::handle<BRepAdaptor_HSurface> & aFace,const opencascade::handle<Prs3d_Drawer> & aDrawer,const Standard_Boolean DrawUIso,const Standard_Boolean DrawVIso,const Standard_Real aDeflection,const Standard_Integer NBUiso,const Standard_Integer NBViso);

		/****************** MatchUIso ******************/
		%feature("compactdefaultargs") MatchUIso;
		%feature("autodoc", ":param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param aDistance:
	:type aDistance: float
	:param aFace:
	:type aFace: BRepAdaptor_HSurface
	:param aDrawer:
	:type aDrawer: Prs3d_Drawer
	:rtype: bool") MatchUIso;
		static Standard_Boolean MatchUIso (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real aDistance,const opencascade::handle<BRepAdaptor_HSurface> & aFace,const opencascade::handle<Prs3d_Drawer> & aDrawer);

		/****************** MatchVIso ******************/
		%feature("compactdefaultargs") MatchVIso;
		%feature("autodoc", ":param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param aDistance:
	:type aDistance: float
	:param aFace:
	:type aFace: BRepAdaptor_HSurface
	:param aDrawer:
	:type aDrawer: Prs3d_Drawer
	:rtype: bool") MatchVIso;
		static Standard_Boolean MatchVIso (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real aDistance,const opencascade::handle<BRepAdaptor_HSurface> & aFace,const opencascade::handle<Prs3d_Drawer> & aDrawer);

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
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds the surface aSurface to the presentation object aPresentation, and defines its boundaries and isoparameters. The shape's display attributes are set in the attribute manager aDrawer. These include whether deflection is absolute or relative to the size of the shape. The surface aSurface is a surface object from Adaptor, and provides data from a Geom surface. This makes it possible to use the surface in a geometric algorithm. Note that this surface object is manipulated by handles.
	:param aPresentation:
	:type aPresentation: Prs3d_Presentation
	:param aSurface:
	:type aSurface: Adaptor3d_HSurface
	:param aDrawer:
	:type aDrawer: Prs3d_Drawer
	:rtype: void") Add;
		static void Add (const opencascade::handle<Prs3d_Presentation> & aPresentation,const opencascade::handle<Adaptor3d_HSurface> & aSurface,const opencascade::handle<Prs3d_Drawer> & aDrawer);

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
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds the surface aSurface to the presentation object aPresentation. The shape's display attributes are set in the attribute manager aDrawer. The surface aSurface is a surface object from Adaptor3d, and provides data from a Geom surface. This makes it possible to use the surface in a geometric algorithm.
	:param aPresentation:
	:type aPresentation: Prs3d_Presentation
	:param aSurface:
	:type aSurface: Adaptor3d_Surface
	:param aDrawer:
	:type aDrawer: Prs3d_Drawer
	:rtype: void") Add;
		static void Add (const opencascade::handle<Prs3d_Presentation> & aPresentation,const Adaptor3d_Surface & aSurface,const opencascade::handle<Prs3d_Drawer> & aDrawer);

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
		%feature("compactdefaultargs") Add;
		%feature("autodoc", ":param thePresentation:
	:type thePresentation: Prs3d_Presentation
	:param theFace:
	:type theFace: BRepAdaptor_HSurface
	:param theDrawUIso:
	:type theDrawUIso: bool
	:param theDrawVIso:
	:type theDrawVIso: bool
	:param theNbUIso:
	:type theNbUIso: int
	:param theNbVIso:
	:type theNbVIso: int
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:param theCurves:
	:type theCurves: Prs3d_NListOfSequenceOfPnt
	:rtype: void") Add;
		static void Add (const opencascade::handle<Prs3d_Presentation> & thePresentation,const opencascade::handle<BRepAdaptor_HSurface> & theFace,const Standard_Boolean theDrawUIso,const Standard_Boolean theDrawVIso,const Standard_Integer theNbUIso,const Standard_Integer theNbVIso,const opencascade::handle<Prs3d_Drawer> & theDrawer,Prs3d_NListOfSequenceOfPnt & theCurves);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", ":param thePresentation:
	:type thePresentation: Prs3d_Presentation
	:param theFace:
	:type theFace: BRepAdaptor_HSurface
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:rtype: void") Add;
		static void Add (const opencascade::handle<Prs3d_Presentation> & thePresentation,const opencascade::handle<BRepAdaptor_HSurface> & theFace,const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** AddUIso ******************/
		%feature("compactdefaultargs") AddUIso;
		%feature("autodoc", ":param thePresentation:
	:type thePresentation: Prs3d_Presentation
	:param theFace:
	:type theFace: BRepAdaptor_HSurface
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:rtype: void") AddUIso;
		static void AddUIso (const opencascade::handle<Prs3d_Presentation> & thePresentation,const opencascade::handle<BRepAdaptor_HSurface> & theFace,const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** AddVIso ******************/
		%feature("compactdefaultargs") AddVIso;
		%feature("autodoc", ":param thePresentation:
	:type thePresentation: Prs3d_Presentation
	:param theFace:
	:type theFace: BRepAdaptor_HSurface
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:rtype: void") AddVIso;
		static void AddVIso (const opencascade::handle<Prs3d_Presentation> & thePresentation,const opencascade::handle<BRepAdaptor_HSurface> & theFace,const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** Match ******************/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", ":param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:param theDistance:
	:type theDistance: float
	:param theFace:
	:type theFace: BRepAdaptor_HSurface
	:param theDrawUIso:
	:type theDrawUIso: bool
	:param theDrawVIso:
	:type theDrawVIso: bool
	:param theDeflection:
	:type theDeflection: float
	:param theNbUIso:
	:type theNbUIso: int
	:param theNbVIso:
	:type theNbVIso: int
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:rtype: bool") Match;
		static Standard_Boolean Match (const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ,const Standard_Real theDistance,const opencascade::handle<BRepAdaptor_HSurface> & theFace,const Standard_Boolean theDrawUIso,const Standard_Boolean theDrawVIso,const Standard_Real theDeflection,const Standard_Integer theNbUIso,const Standard_Integer theNbVIso,const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** Match ******************/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", ":param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:param theDistance:
	:type theDistance: float
	:param theFace:
	:type theFace: BRepAdaptor_HSurface
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:rtype: bool") Match;
		static Standard_Boolean Match (const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ,const Standard_Real theDistance,const opencascade::handle<BRepAdaptor_HSurface> & theFace,const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** MatchUIso ******************/
		%feature("compactdefaultargs") MatchUIso;
		%feature("autodoc", ":param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:param theDistance:
	:type theDistance: float
	:param theFace:
	:type theFace: BRepAdaptor_HSurface
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:rtype: bool") MatchUIso;
		static Standard_Boolean MatchUIso (const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ,const Standard_Real theDistance,const opencascade::handle<BRepAdaptor_HSurface> & theFace,const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** MatchVIso ******************/
		%feature("compactdefaultargs") MatchVIso;
		%feature("autodoc", ":param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:param theDistance:
	:type theDistance: float
	:param theFace:
	:type theFace: BRepAdaptor_HSurface
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:rtype: bool") MatchVIso;
		static Standard_Boolean MatchVIso (const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ,const Standard_Real theDistance,const opencascade::handle<BRepAdaptor_HSurface> & theFace,const opencascade::handle<Prs3d_Drawer> & theDrawer);

};


%extend StdPrs_WFRestrictedFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class StdPrs_WFShape *
***********************/
%nodefaultctor StdPrs_WFShape;
class StdPrs_WFShape : public Prs3d_Root {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Computes wireframe presentation of a shape. @param thePresentation [in] the presentation. @param theShape [in] the shape. @param theDrawer [in] the draw settings. @param theIsParallel [in] perform algorithm using multiple threads
	:param thePresentation:
	:type thePresentation: Prs3d_Presentation
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:param theIsParallel: default value is Standard_False
	:type theIsParallel: bool
	:rtype: void") Add;
		static void Add (const opencascade::handle<Prs3d_Presentation> & thePresentation,const TopoDS_Shape & theShape,const opencascade::handle<Prs3d_Drawer> & theDrawer,Standard_Boolean theIsParallel = Standard_False);

		/****************** AddAllEdges ******************/
		%feature("compactdefaultargs") AddAllEdges;
		%feature("autodoc", "* Compute all edges (wire, free, unfree) and put them into single primitive array. @param theShape [in] the shape @param theDrawer [in] the drawer settings (deviation angle and maximal parameter value)
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:rtype: opencascade::handle<Graphic3d_ArrayOfPrimitives>") AddAllEdges;
		static opencascade::handle<Graphic3d_ArrayOfPrimitives> AddAllEdges (const TopoDS_Shape & theShape,const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** AddEdgesOnTriangulation ******************/
		%feature("compactdefaultargs") AddEdgesOnTriangulation;
		%feature("autodoc", "* Compute free and boundary edges on a triangulation of each face in the given shape. @param theShape  [in] the list of triangulated faces @param theToExcludeGeometric [in] flag indicating that Faces with defined Surface should be skipped
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theToExcludeGeometric: default value is Standard_True
	:type theToExcludeGeometric: bool
	:rtype: opencascade::handle<Graphic3d_ArrayOfPrimitives>") AddEdgesOnTriangulation;
		static opencascade::handle<Graphic3d_ArrayOfPrimitives> AddEdgesOnTriangulation (const TopoDS_Shape & theShape,const Standard_Boolean theToExcludeGeometric = Standard_True);

		/****************** AddEdgesOnTriangulation ******************/
		%feature("compactdefaultargs") AddEdgesOnTriangulation;
		%feature("autodoc", "* Compute free and boundary edges on a triangulation of each face in the given shape. @param theSegments  [in] the sequence of points defining segments @param theShape  [in] the list of triangulated faces @param theToExcludeGeometric [in] flag indicating that Faces with defined Surface should be skipped
	:param theSegments:
	:type theSegments: TColgp_SequenceOfPnt
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theToExcludeGeometric: default value is Standard_True
	:type theToExcludeGeometric: bool
	:rtype: void") AddEdgesOnTriangulation;
		static void AddEdgesOnTriangulation (TColgp_SequenceOfPnt & theSegments,const TopoDS_Shape & theShape,const Standard_Boolean theToExcludeGeometric = Standard_True);

		/****************** AddVertexes ******************/
		%feature("compactdefaultargs") AddVertexes;
		%feature("autodoc", "* Compute vertex presentation for a shape. @param theShape [in] the shape @param theVertexMode [in] vertex filter
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theVertexMode:
	:type theVertexMode: Prs3d_VertexDrawMode
	:rtype: opencascade::handle<Graphic3d_ArrayOfPoints>") AddVertexes;
		static opencascade::handle<Graphic3d_ArrayOfPoints> AddVertexes (const TopoDS_Shape & theShape,Prs3d_VertexDrawMode theVertexMode);

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
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Draws a surface by drawing the isoparametric curves with respect to a fixed number of points given by the Drawer. The number of isoparametric curves to be drawn and their color are controlled by the furnished Drawer.
	:param aPresentation:
	:type aPresentation: Prs3d_Presentation
	:param aSurface:
	:type aSurface: Adaptor3d_HSurface
	:param aDrawer:
	:type aDrawer: Prs3d_Drawer
	:rtype: void") Add;
		static void Add (const opencascade::handle<Prs3d_Presentation> & aPresentation,const opencascade::handle<Adaptor3d_HSurface> & aSurface,const opencascade::handle<Prs3d_Drawer> & aDrawer);

};


%extend StdPrs_WFSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
