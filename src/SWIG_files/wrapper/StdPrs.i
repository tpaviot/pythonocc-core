/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") StdPrs

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include StdPrs_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
typedef Prs3d_Point <TopoDS_Vertex , StdPrs_ToolVertex> StdPrs_Vertex;
typedef Prs3d_Point <Handle_Geom_Point , StdPrs_ToolPoint> StdPrs_Point;
/* end typedefs declaration */

/* public enums */
enum StdPrs_Volume {
	StdPrs_Volume_Autodetection = 0,
	StdPrs_Volume_Closed = 1,
	StdPrs_Volume_Opened = 2,
};

/* end public enums declaration */

class StdPrs_Curve : public Prs3d_Root {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds to the presentation aPresentation the drawing of the curve aCurve. The aspect is defined by LineAspect in aDrawer. If drawCurve equals Standard_False the curve will not be displayed, it is used if the curve is a part of some shape and PrimitiveArray visualization approach is activated (it is activated by default).

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aCurve:
	:type aCurve: Adaptor3d_Curve &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:param drawCurve: default value is Standard_True
	:type drawCurve: bool
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & aPresentation,const Adaptor3d_Curve & aCurve,const Handle_Prs3d_Drawer & aDrawer,const Standard_Boolean drawCurve = Standard_True);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds to the presentation aPresentation the drawing of the curve aCurve. The aspect is defined by LineAspect in aDrawer. The drawing will be limited between the points of parameter U1 and U2. If drawCurve equals Standard_False the curve will not be displayed, it is used if the curve is a part of some shape and PrimitiveArray visualization approach is activated (it is activated by default).

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aCurve:
	:type aCurve: Adaptor3d_Curve &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:param drawCurve: default value is Standard_True
	:type drawCurve: bool
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & aPresentation,const Adaptor3d_Curve & aCurve,const Standard_Real U1,const Standard_Real U2,const Handle_Prs3d_Drawer & aDrawer,const Standard_Boolean drawCurve = Standard_True);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* adds to the presentation aPresentation the drawing of the curve aCurve. The aspect is the current aspect. aDeflection is used in the circle case. Points give a sequence of curve points. If drawCurve equals Standard_False the curve will not be displayed, it is used if the curve is a part of some shape and PrimitiveArray visualization approach is activated (it is activated by default).

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aCurve:
	:type aCurve: Adaptor3d_Curve &
	:param aDeflection:
	:type aDeflection: Quantity_Length
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:param Points:
	:type Points: TColgp_SequenceOfPnt
	:param drawCurve: default value is Standard_True
	:type drawCurve: bool
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & aPresentation,const Adaptor3d_Curve & aCurve,const Quantity_Length aDeflection,const Handle_Prs3d_Drawer & aDrawer,TColgp_SequenceOfPnt & Points,const Standard_Boolean drawCurve = Standard_True);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* adds to the presentation aPresentation the drawing of the curve aCurve. The aspect is the current aspect. The drawing will be limited between the points of parameter U1 and U2. aDeflection is used in the circle case. Points give a sequence of curve points. If drawCurve equals Standard_False the curve will not be displayed, it is used if the curve is a part of some shape and PrimitiveArray visualization approach is activated (it is activated by default).

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aCurve:
	:type aCurve: Adaptor3d_Curve &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param aDeflection:
	:type aDeflection: Quantity_Length
	:param Points:
	:type Points: TColgp_SequenceOfPnt
	:param aNbPoints: default value is 30
	:type aNbPoints: int
	:param drawCurve: default value is Standard_True
	:type drawCurve: bool
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & aPresentation,const Adaptor3d_Curve & aCurve,const Standard_Real U1,const Standard_Real U2,const Quantity_Length aDeflection,TColgp_SequenceOfPnt & Points,const Standard_Integer aNbPoints = 30,const Standard_Boolean drawCurve = Standard_True);
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "	* returns true if the distance between the point (X,Y,Z) and the drawing of the curve is less than aDistance.

	:param X:
	:type X: Quantity_Length
	:param Y:
	:type Y: Quantity_Length
	:param Z:
	:type Z: Quantity_Length
	:param aDistance:
	:type aDistance: Quantity_Length
	:param aCurve:
	:type aCurve: Adaptor3d_Curve &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: bool
") Match;
		static Standard_Boolean Match (const Quantity_Length X,const Quantity_Length Y,const Quantity_Length Z,const Quantity_Length aDistance,const Adaptor3d_Curve & aCurve,const Handle_Prs3d_Drawer & aDrawer);
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "	* returns true if the distance between the point (X,Y,Z) and the drawing of the curve is less than aDistance.

	:param X:
	:type X: Quantity_Length
	:param Y:
	:type Y: Quantity_Length
	:param Z:
	:type Z: Quantity_Length
	:param aDistance:
	:type aDistance: Quantity_Length
	:param aCurve:
	:type aCurve: Adaptor3d_Curve &
	:param aDeflection:
	:type aDeflection: Quantity_Length
	:param aLimit:
	:type aLimit: float
	:param aNbPoints:
	:type aNbPoints: int
	:rtype: bool
") Match;
		static Standard_Boolean Match (const Quantity_Length X,const Quantity_Length Y,const Quantity_Length Z,const Quantity_Length aDistance,const Adaptor3d_Curve & aCurve,const Quantity_Length aDeflection,const Standard_Real aLimit,const Standard_Integer aNbPoints);
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "	* returns true if the distance between the point (X,Y,Z) and the drawing of the curve aCurve is less than aDistance. The drawing is considered between the points of parameter U1 and U2;

	:param X:
	:type X: Quantity_Length
	:param Y:
	:type Y: Quantity_Length
	:param Z:
	:type Z: Quantity_Length
	:param aDistance:
	:type aDistance: Quantity_Length
	:param aCurve:
	:type aCurve: Adaptor3d_Curve &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: bool
") Match;
		static Standard_Boolean Match (const Quantity_Length X,const Quantity_Length Y,const Quantity_Length Z,const Quantity_Length aDistance,const Adaptor3d_Curve & aCurve,const Standard_Real U1,const Standard_Real U2,const Handle_Prs3d_Drawer & aDrawer);
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "	* returns true if the distance between the point (X,Y,Z) and the drawing of the curve aCurve is less than aDistance. The drawing is considered between the points of parameter U1 and U2;

	:param X:
	:type X: Quantity_Length
	:param Y:
	:type Y: Quantity_Length
	:param Z:
	:type Z: Quantity_Length
	:param aDistance:
	:type aDistance: Quantity_Length
	:param aCurve:
	:type aCurve: Adaptor3d_Curve &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param aDeflection:
	:type aDeflection: Quantity_Length
	:param aNbPoints:
	:type aNbPoints: int
	:rtype: bool
") Match;
		static Standard_Boolean Match (const Quantity_Length X,const Quantity_Length Y,const Quantity_Length Z,const Quantity_Length aDistance,const Adaptor3d_Curve & aCurve,const Standard_Real U1,const Standard_Real U2,const Quantity_Length aDeflection,const Standard_Integer aNbPoints);
};


%extend StdPrs_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class StdPrs_HLRPolyShape : public Prs3d_Root {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Defines the hidden line removal display of the topology aShape in the projection defined by aProjector. The shape and the projection are added to the display aPresentation, and the attributes of the elements present in the aPresentation are defined by the attribute manager aDrawer.

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:param aProjector:
	:type aProjector: Handle_Prs3d_Projector &
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & aPresentation,const TopoDS_Shape & aShape,const Handle_Prs3d_Drawer & aDrawer,const Handle_Prs3d_Projector & aProjector);
};


%extend StdPrs_HLRPolyShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class StdPrs_HLRShape : public Prs3d_Root {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param thePresentation:
	:type thePresentation: Handle_Prs3d_Presentation &
	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:param theProjector:
	:type theProjector: Handle_Prs3d_Projector &
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & thePresentation,const TopoDS_Shape & theShape,const Handle_Prs3d_Drawer & theDrawer,const Handle_Prs3d_Projector & theProjector);
};


%extend StdPrs_HLRShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdPrs_HLRToolShape;
class StdPrs_HLRToolShape {
	public:
		%feature("compactdefaultargs") StdPrs_HLRToolShape;
		%feature("autodoc", "	:param TheShape:
	:type TheShape: TopoDS_Shape &
	:param TheProjector:
	:type TheProjector: HLRAlgo_Projector &
	:rtype: None
") StdPrs_HLRToolShape;
		 StdPrs_HLRToolShape (const TopoDS_Shape & TheShape,const HLRAlgo_Projector & TheProjector);
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "	:rtype: int
") NbEdges;
		Standard_Integer NbEdges ();
		%feature("compactdefaultargs") InitVisible;
		%feature("autodoc", "	:param EdgeNumber:
	:type EdgeNumber: int
	:rtype: None
") InitVisible;
		void InitVisible (const Standard_Integer EdgeNumber);
		%feature("compactdefaultargs") MoreVisible;
		%feature("autodoc", "	:rtype: bool
") MoreVisible;
		Standard_Boolean MoreVisible ();
		%feature("compactdefaultargs") NextVisible;
		%feature("autodoc", "	:rtype: None
") NextVisible;
		void NextVisible ();
		%feature("compactdefaultargs") Visible;
		%feature("autodoc", "	:param TheEdge:
	:type TheEdge: BRepAdaptor_Curve &
	:param U1:
	:type U1: float &
	:param U2:
	:type U2: float &
	:rtype: None
") Visible;
		void Visible (BRepAdaptor_Curve & TheEdge,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") InitHidden;
		%feature("autodoc", "	:param EdgeNumber:
	:type EdgeNumber: int
	:rtype: None
") InitHidden;
		void InitHidden (const Standard_Integer EdgeNumber);
		%feature("compactdefaultargs") MoreHidden;
		%feature("autodoc", "	:rtype: bool
") MoreHidden;
		Standard_Boolean MoreHidden ();
		%feature("compactdefaultargs") NextHidden;
		%feature("autodoc", "	:rtype: None
") NextHidden;
		void NextHidden ();
		%feature("compactdefaultargs") Hidden;
		%feature("autodoc", "	:param TheEdge:
	:type TheEdge: BRepAdaptor_Curve &
	:param U1:
	:type U1: float &
	:param U2:
	:type U2: float &
	:rtype: None
") Hidden;
		void Hidden (BRepAdaptor_Curve & TheEdge,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend StdPrs_HLRToolShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class StdPrs_Plane : public Prs3d_Root {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Defines display of infinite planes. The infinite plane aPlane is added to the display aPresentation, and the attributes of the display are defined by the attribute manager aDrawer.

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aPlane:
	:type aPlane: Adaptor3d_Surface &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & aPresentation,const Adaptor3d_Surface & aPlane,const Handle_Prs3d_Drawer & aDrawer);
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "	* returns true if the distance between the point (X,Y,Z) and the plane is less than aDistance.

	:param X:
	:type X: Quantity_Length
	:param Y:
	:type Y: Quantity_Length
	:param Z:
	:type Z: Quantity_Length
	:param aDistance:
	:type aDistance: Quantity_Length
	:param aPlane:
	:type aPlane: Adaptor3d_Surface &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: bool
") Match;
		static Standard_Boolean Match (const Quantity_Length X,const Quantity_Length Y,const Quantity_Length Z,const Quantity_Length aDistance,const Adaptor3d_Surface & aPlane,const Handle_Prs3d_Drawer & aDrawer);
};


%extend StdPrs_Plane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class StdPrs_PoleCurve : public Prs3d_Root {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Defines display of BSpline and Bezier curves. Adds the 3D curve aCurve to the StdPrs_PoleCurve algorithm. This shape is found in the presentation object aPresentation, and its display attributes are set in the attribute manager aDrawer. The curve object from Adaptor3d provides data from a Geom curve. This makes it possible to use the surface in a geometric algorithm.

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aCurve:
	:type aCurve: Adaptor3d_Curve &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & aPresentation,const Adaptor3d_Curve & aCurve,const Handle_Prs3d_Drawer & aDrawer);
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "	* returns true if the distance between the point (X,Y,Z) and the broken line made of the poles is less then aDistance.

	:param X:
	:type X: Quantity_Length
	:param Y:
	:type Y: Quantity_Length
	:param Z:
	:type Z: Quantity_Length
	:param aDistance:
	:type aDistance: Quantity_Length
	:param aCurve:
	:type aCurve: Adaptor3d_Curve &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: bool
") Match;
		static Standard_Boolean Match (const Quantity_Length X,const Quantity_Length Y,const Quantity_Length Z,const Quantity_Length aDistance,const Adaptor3d_Curve & aCurve,const Handle_Prs3d_Drawer & aDrawer);
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "	* returns the pole the most near of the point (X,Y,Z) and returns its range. The distance between the pole and (X,Y,Z) must be less then aDistance. If no pole corresponds, 0 is returned.

	:param X:
	:type X: Quantity_Length
	:param Y:
	:type Y: Quantity_Length
	:param Z:
	:type Z: Quantity_Length
	:param aDistance:
	:type aDistance: Quantity_Length
	:param aCurve:
	:type aCurve: Adaptor3d_Curve &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: int
") Pick;
		static Standard_Integer Pick (const Quantity_Length X,const Quantity_Length Y,const Quantity_Length Z,const Quantity_Length aDistance,const Adaptor3d_Curve & aCurve,const Handle_Prs3d_Drawer & aDrawer);
};


%extend StdPrs_PoleCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class StdPrs_ShadedShape : public Prs3d_Root {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Shades <theShape>. @param theVolumeType defines the way how to interpret input shapes - as Closed volumes (to activate back-face culling and capping plane algorithms), as Open volumes (shells or solids with holes) or to perform Autodetection (would split input shape into two groups)

	:param thePresentation:
	:type thePresentation: Handle_Prs3d_Presentation &
	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:param theVolume: default value is StdPrs_Volume_Autodetection
	:type theVolume: StdPrs_Volume
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & thePresentation,const TopoDS_Shape & theShape,const Handle_Prs3d_Drawer & theDrawer,const StdPrs_Volume theVolume = StdPrs_Volume_Autodetection);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Shades <theShape> with texture coordinates. @param theVolumeType defines the way how to interpret input shapes - as Closed volumes (to activate back-face culling and capping plane algorithms), as Open volumes (shells or solids with holes) or to perform Autodetection (would split input shape into two groups)

	:param thePresentation:
	:type thePresentation: Handle_Prs3d_Presentation &
	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
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
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & thePresentation,const TopoDS_Shape & theShape,const Handle_Prs3d_Drawer & theDrawer,const Standard_Boolean theHasTexels,const gp_Pnt2d & theUVOrigin,const gp_Pnt2d & theUVRepeat,const gp_Pnt2d & theUVScale,const StdPrs_Volume theVolume = StdPrs_Volume_Autodetection);
		%feature("compactdefaultargs") Tessellate;
		%feature("autodoc", "	* Validates triangulation within the shape and performs tessellation if necessary.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") Tessellate;
		static void Tessellate (const TopoDS_Shape & theShape,const Handle_Prs3d_Drawer & theDrawer);
		%feature("compactdefaultargs") ExploreSolids;
		%feature("autodoc", "	* Searches closed and unclosed subshapes in shape structure and puts them into two compounds for separate processing of closed and unclosed sub-shapes

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theBuilder:
	:type theBuilder: BRep_Builder &
	:param theClosed:
	:type theClosed: TopoDS_Compound &
	:param theOpened:
	:type theOpened: TopoDS_Compound &
	:param theIgnore1DSubShape:
	:type theIgnore1DSubShape: bool
	:rtype: void
") ExploreSolids;
		static void ExploreSolids (const TopoDS_Shape & theShape,const BRep_Builder & theBuilder,TopoDS_Compound & theClosed,TopoDS_Compound & theOpened,const Standard_Boolean theIgnore1DSubShape);
};


%extend StdPrs_ShadedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class StdPrs_ShadedSurface : public Prs3d_Root {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the surface aSurface to the presentation object aPresentation. The surface's display attributes are set in the attribute manager aDrawer. The surface object from Adaptor3d provides data from a Geom surface in order to use the surface in an algorithm.

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aSurface:
	:type aSurface: Adaptor3d_Surface &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & aPresentation,const Adaptor3d_Surface & aSurface,const Handle_Prs3d_Drawer & aDrawer);
};


%extend StdPrs_ShadedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class StdPrs_ToolPoint {
	public:
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "	:param aPoint:
	:type aPoint: Handle_Geom_Point &
	:param X:
	:type X: Quantity_Length &
	:param Y:
	:type Y: Quantity_Length &
	:param Z:
	:type Z: Quantity_Length &
	:rtype: void
") Coord;
		static void Coord (const Handle_Geom_Point & aPoint,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend StdPrs_ToolPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdPrs_ToolRFace;
class StdPrs_ToolRFace {
	public:
		%feature("compactdefaultargs") StdPrs_ToolRFace;
		%feature("autodoc", "	:rtype: None
") StdPrs_ToolRFace;
		 StdPrs_ToolRFace ();
		%feature("compactdefaultargs") StdPrs_ToolRFace;
		%feature("autodoc", "	:param aSurface:
	:type aSurface: Handle_BRepAdaptor_HSurface &
	:rtype: None
") StdPrs_ToolRFace;
		 StdPrs_ToolRFace (const Handle_BRepAdaptor_HSurface & aSurface);
		%feature("compactdefaultargs") IsOriented;
		%feature("autodoc", "	:rtype: bool
") IsOriented;
		Standard_Boolean IsOriented ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:rtype: None
") Init;
		void Init ();
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Adaptor2d_Curve2dPtr
") Value;
		Adaptor2d_Curve2dPtr Value ();
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation ();
};


%extend StdPrs_ToolRFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class StdPrs_ToolShadedShape {
	public:
		%feature("compactdefaultargs") IsTriangulated;
		%feature("autodoc", "	* Similar to BRepTools::Triangulation() but without extra checks. returns true if all faces within shape are triangulated.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: bool
") IsTriangulated;
		static Standard_Boolean IsTriangulated (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "	* Checks back faces visibility for specified shape (to activate back-face culling). returns true if shape is closed manifold Solid or compound of such Solids.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: bool
") IsClosed;
		static Standard_Boolean IsClosed (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") Triangulation;
		%feature("autodoc", "	:param aFace:
	:type aFace: TopoDS_Face &
	:param loc:
	:type loc: TopLoc_Location &
	:rtype: Handle_Poly_Triangulation
") Triangulation;
		static Handle_Poly_Triangulation Triangulation (const TopoDS_Face & aFace,TopLoc_Location & loc);
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "	:param aFace:
	:type aFace: TopoDS_Face &
	:param PC:
	:type PC: Poly_Connect &
	:param Nor:
	:type Nor: TColgp_Array1OfDir
	:rtype: void
") Normal;
		static void Normal (const TopoDS_Face & aFace,Poly_Connect & PC,TColgp_Array1OfDir & Nor);
};


%extend StdPrs_ToolShadedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class StdPrs_ToolVertex {
	public:
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "	:param aPoint:
	:type aPoint: TopoDS_Vertex &
	:param X:
	:type X: Quantity_Length &
	:param Y:
	:type Y: Quantity_Length &
	:param Z:
	:type Z: Quantity_Length &
	:rtype: void
") Coord;
		static void Coord (const TopoDS_Vertex & aPoint,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend StdPrs_ToolVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class StdPrs_WFDeflectionRestrictedFace : public Prs3d_Root {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Defines a display featuring U and V isoparameters. Adds the surface aFace to the StdPrs_WFRestrictedFace algorithm. This face is found in a shape in the presentation object aPresentation, and its display attributes - in particular, the number of U and V isoparameters - are set in the attribute manager aDrawer. aFace is BRepAdaptor_HSurface surface created from a face in a topological shape. which is passed as an argument through the BRepAdaptor_HSurface surface created from it. This is what allows the topological face to be treated as a geometric surface.

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aFace:
	:type aFace: Handle_BRepAdaptor_HSurface &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & aPresentation,const Handle_BRepAdaptor_HSurface & aFace,const Handle_Prs3d_Drawer & aDrawer);
		%feature("compactdefaultargs") AddUIso;
		%feature("autodoc", "	* Defines a display featuring U isoparameters respectively. Add the surface aFace to the StdPrs_WFRestrictedFace algorithm. This face is found in a shape in the presentation object aPresentation, and its display attributes - in particular, the number of U isoparameters - are set in the attribute manager aDrawer. aFace is BRepAdaptor_HSurface surface created from a face in a topological shape. which is passed to the function as an argument through the BRepAdaptor_HSurface surface created from it. This is what allows the topological face to be treated as a geometric surface.

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aFace:
	:type aFace: Handle_BRepAdaptor_HSurface &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") AddUIso;
		static void AddUIso (const Handle_Prs3d_Presentation & aPresentation,const Handle_BRepAdaptor_HSurface & aFace,const Handle_Prs3d_Drawer & aDrawer);
		%feature("compactdefaultargs") AddVIso;
		%feature("autodoc", "	* Defines a display featuring V isoparameters respectively. Add the surface aFace to the StdPrs_WFRestrictedFace algorithm. This face is found in a shape in the presentation object aPresentation, and its display attributes - in particular, the number of V isoparameters - are set in the attribute manager aDrawer. aFace is BRepAdaptor_HSurface surface created from a face in a topological shape. which is passed to the function as an argument through the BRepAdaptor_HSurface surface created from it. This is what allows the topological face to be treated as a geometric surface.

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aFace:
	:type aFace: Handle_BRepAdaptor_HSurface &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") AddVIso;
		static void AddVIso (const Handle_Prs3d_Presentation & aPresentation,const Handle_BRepAdaptor_HSurface & aFace,const Handle_Prs3d_Drawer & aDrawer);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Defines a display of a delection-specified face. The display will feature U and V isoparameters. Adds the topology aShape to the StdPrs_WFRestrictedFace algorithm. This shape is found in the presentation object aPresentation, and its display attributes - except the number of U and V isoparameters - are set in the attribute manager aDrawer. The function sets the number of U and V isoparameters, NBUiso and NBViso, in the shape. To do this, the arguments DrawUIso and DrawVIso must be true. aFace is BRepAdaptor_HSurface surface created from a face in a topological shape. which is passed as an argument through the BRepAdaptor_HSurface surface created from it. This is what allows the topological face to be treated as a geometric surface. Curves give a sequence of face curves, it is used if the PrimitiveArray visualization approach is activated (it is activated by default).

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aFace:
	:type aFace: Handle_BRepAdaptor_HSurface &
	:param DrawUIso:
	:type DrawUIso: bool
	:param DrawVIso:
	:type DrawVIso: bool
	:param Deflection:
	:type Deflection: Quantity_Length
	:param NBUiso:
	:type NBUiso: int
	:param NBViso:
	:type NBViso: int
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:param Curves:
	:type Curves: Prs3d_NListOfSequenceOfPnt &
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & aPresentation,const Handle_BRepAdaptor_HSurface & aFace,const Standard_Boolean DrawUIso,const Standard_Boolean DrawVIso,const Quantity_Length Deflection,const Standard_Integer NBUiso,const Standard_Integer NBViso,const Handle_Prs3d_Drawer & aDrawer,Prs3d_NListOfSequenceOfPnt & Curves);
		%feature("compactdefaultargs") AddBox;
		%feature("autodoc", "	* Adds box as polyline to the presentation object

	:param thePrs:
	:type thePrs: Handle_Prs3d_Presentation &
	:param theBndBox:
	:type theBndBox: Bnd_Box &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") AddBox;
		static void AddBox (const Handle_Prs3d_Presentation & thePrs,const Bnd_Box & theBndBox,const Handle_Prs3d_Drawer & theDrawer);
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "	:param X:
	:type X: Quantity_Length
	:param Y:
	:type Y: Quantity_Length
	:param Z:
	:type Z: Quantity_Length
	:param aDistance:
	:type aDistance: Quantity_Length
	:param aFace:
	:type aFace: Handle_BRepAdaptor_HSurface &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: bool
") Match;
		static Standard_Boolean Match (const Quantity_Length X,const Quantity_Length Y,const Quantity_Length Z,const Quantity_Length aDistance,const Handle_BRepAdaptor_HSurface & aFace,const Handle_Prs3d_Drawer & aDrawer);
		%feature("compactdefaultargs") MatchUIso;
		%feature("autodoc", "	:param X:
	:type X: Quantity_Length
	:param Y:
	:type Y: Quantity_Length
	:param Z:
	:type Z: Quantity_Length
	:param aDistance:
	:type aDistance: Quantity_Length
	:param aFace:
	:type aFace: Handle_BRepAdaptor_HSurface &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: bool
") MatchUIso;
		static Standard_Boolean MatchUIso (const Quantity_Length X,const Quantity_Length Y,const Quantity_Length Z,const Quantity_Length aDistance,const Handle_BRepAdaptor_HSurface & aFace,const Handle_Prs3d_Drawer & aDrawer);
		%feature("compactdefaultargs") MatchVIso;
		%feature("autodoc", "	:param X:
	:type X: Quantity_Length
	:param Y:
	:type Y: Quantity_Length
	:param Z:
	:type Z: Quantity_Length
	:param aDistance:
	:type aDistance: Quantity_Length
	:param aFace:
	:type aFace: Handle_BRepAdaptor_HSurface &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: bool
") MatchVIso;
		static Standard_Boolean MatchVIso (const Quantity_Length X,const Quantity_Length Y,const Quantity_Length Z,const Quantity_Length aDistance,const Handle_BRepAdaptor_HSurface & aFace,const Handle_Prs3d_Drawer & aDrawer);
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "	:param X:
	:type X: Quantity_Length
	:param Y:
	:type Y: Quantity_Length
	:param Z:
	:type Z: Quantity_Length
	:param aDistance:
	:type aDistance: Quantity_Length
	:param aFace:
	:type aFace: Handle_BRepAdaptor_HSurface &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:param DrawUIso:
	:type DrawUIso: bool
	:param DrawVIso:
	:type DrawVIso: bool
	:param aDeflection:
	:type aDeflection: Quantity_Length
	:param NBUiso:
	:type NBUiso: int
	:param NBViso:
	:type NBViso: int
	:rtype: bool
") Match;
		static Standard_Boolean Match (const Quantity_Length X,const Quantity_Length Y,const Quantity_Length Z,const Quantity_Length aDistance,const Handle_BRepAdaptor_HSurface & aFace,const Handle_Prs3d_Drawer & aDrawer,const Standard_Boolean DrawUIso,const Standard_Boolean DrawVIso,const Quantity_Length aDeflection,const Standard_Integer NBUiso,const Standard_Integer NBViso);
};


%extend StdPrs_WFDeflectionRestrictedFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdPrs_WFDeflectionShape;
class StdPrs_WFDeflectionShape : public Prs3d_Root {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Add shape to presentation

	:param thePrs:
	:type thePrs: Handle_Prs3d_Presentation &
	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: inline void
") Add;
		static inline void Add (const Handle_Prs3d_Presentation & thePrs,const TopoDS_Shape & theShape,const Handle_Prs3d_Drawer & theDrawer);
		%feature("compactdefaultargs") PickCurve;
		%feature("autodoc", "	:param theX:
	:type theX: Quantity_Length
	:param theY:
	:type theY: Quantity_Length
	:param theZ:
	:type theZ: Quantity_Length
	:param theDistance:
	:type theDistance: Quantity_Length
	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: inline Handle_TopTools_HSequenceOfShape
") PickCurve;
		static inline Handle_TopTools_HSequenceOfShape PickCurve (const Quantity_Length theX,const Quantity_Length theY,const Quantity_Length theZ,const Quantity_Length theDistance,const TopoDS_Shape & theShape,const Handle_Prs3d_Drawer & theDrawer);
		%feature("compactdefaultargs") PickPatch;
		%feature("autodoc", "	:param theX:
	:type theX: Quantity_Length
	:param theY:
	:type theY: Quantity_Length
	:param theZ:
	:type theZ: Quantity_Length
	:param theDistance:
	:type theDistance: Quantity_Length
	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: inline Handle_TopTools_HSequenceOfShape
") PickPatch;
		static inline Handle_TopTools_HSequenceOfShape PickPatch (const Quantity_Length theX,const Quantity_Length theY,const Quantity_Length theZ,const Quantity_Length theDistance,const TopoDS_Shape & theShape,const Handle_Prs3d_Drawer & theDrawer);
};


%extend StdPrs_WFDeflectionShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class StdPrs_WFDeflectionSurface : public Prs3d_Root {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the surface aSurface to the presentation object aPresentation, and defines its boundaries and isoparameters. The shape's display attributes are set in the attribute manager aDrawer. These include whether deflection is absolute or relative to the size of the shape. The surface aSurface is a surface object from Adaptor, and provides data from a Geom surface. This makes it possible to use the surface in a geometric algorithm. Note that this surface object is manipulated by handles.

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aSurface:
	:type aSurface: Handle_Adaptor3d_HSurface &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & aPresentation,const Handle_Adaptor3d_HSurface & aSurface,const Handle_Prs3d_Drawer & aDrawer);
};


%extend StdPrs_WFDeflectionSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class StdPrs_WFPoleSurface : public Prs3d_Root {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the surface aSurface to the presentation object aPresentation. The shape's display attributes are set in the attribute manager aDrawer. The surface aSurface is a surface object from Adaptor3d, and provides data from a Geom surface. This makes it possible to use the surface in a geometric algorithm.

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aSurface:
	:type aSurface: Adaptor3d_Surface &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & aPresentation,const Adaptor3d_Surface & aSurface,const Handle_Prs3d_Drawer & aDrawer);
};


%extend StdPrs_WFPoleSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class StdPrs_WFRestrictedFace : public Prs3d_Root {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param thePresentation:
	:type thePresentation: Handle_Prs3d_Presentation &
	:param theFace:
	:type theFace: Handle_BRepAdaptor_HSurface &
	:param theDrawUIso:
	:type theDrawUIso: bool
	:param theDrawVIso:
	:type theDrawVIso: bool
	:param theDeflection:
	:type theDeflection: Quantity_Length
	:param theNbUIso:
	:type theNbUIso: int
	:param theNbVIso:
	:type theNbVIso: int
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:param theCurves:
	:type theCurves: Prs3d_NListOfSequenceOfPnt &
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & thePresentation,const Handle_BRepAdaptor_HSurface & theFace,const Standard_Boolean theDrawUIso,const Standard_Boolean theDrawVIso,const Quantity_Length theDeflection,const Standard_Integer theNbUIso,const Standard_Integer theNbVIso,const Handle_Prs3d_Drawer & theDrawer,Prs3d_NListOfSequenceOfPnt & theCurves);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param thePresentation:
	:type thePresentation: Handle_Prs3d_Presentation &
	:param theFace:
	:type theFace: Handle_BRepAdaptor_HSurface &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & thePresentation,const Handle_BRepAdaptor_HSurface & theFace,const Handle_Prs3d_Drawer & theDrawer);
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "	:param theX:
	:type theX: Quantity_Length
	:param theY:
	:type theY: Quantity_Length
	:param theZ:
	:type theZ: Quantity_Length
	:param theDistance:
	:type theDistance: Quantity_Length
	:param theFace:
	:type theFace: Handle_BRepAdaptor_HSurface &
	:param theDrawUIso:
	:type theDrawUIso: bool
	:param theDrawVIso:
	:type theDrawVIso: bool
	:param theDeflection:
	:type theDeflection: Quantity_Length
	:param theNbUIso:
	:type theNbUIso: int
	:param theNbVIso:
	:type theNbVIso: int
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: bool
") Match;
		static Standard_Boolean Match (const Quantity_Length theX,const Quantity_Length theY,const Quantity_Length theZ,const Quantity_Length theDistance,const Handle_BRepAdaptor_HSurface & theFace,const Standard_Boolean theDrawUIso,const Standard_Boolean theDrawVIso,const Quantity_Length theDeflection,const Standard_Integer theNbUIso,const Standard_Integer theNbVIso,const Handle_Prs3d_Drawer & theDrawer);
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "	:param theX:
	:type theX: Quantity_Length
	:param theY:
	:type theY: Quantity_Length
	:param theZ:
	:type theZ: Quantity_Length
	:param theDistance:
	:type theDistance: Quantity_Length
	:param theFace:
	:type theFace: Handle_BRepAdaptor_HSurface &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: bool
") Match;
		static Standard_Boolean Match (const Quantity_Length theX,const Quantity_Length theY,const Quantity_Length theZ,const Quantity_Length theDistance,const Handle_BRepAdaptor_HSurface & theFace,const Handle_Prs3d_Drawer & theDrawer);
		%feature("compactdefaultargs") MatchUIso;
		%feature("autodoc", "	:param theX:
	:type theX: Quantity_Length
	:param theY:
	:type theY: Quantity_Length
	:param theZ:
	:type theZ: Quantity_Length
	:param theDistance:
	:type theDistance: Quantity_Length
	:param theFace:
	:type theFace: Handle_BRepAdaptor_HSurface &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: bool
") MatchUIso;
		static Standard_Boolean MatchUIso (const Quantity_Length theX,const Quantity_Length theY,const Quantity_Length theZ,const Quantity_Length theDistance,const Handle_BRepAdaptor_HSurface & theFace,const Handle_Prs3d_Drawer & theDrawer);
		%feature("compactdefaultargs") MatchVIso;
		%feature("autodoc", "	:param theX:
	:type theX: Quantity_Length
	:param theY:
	:type theY: Quantity_Length
	:param theZ:
	:type theZ: Quantity_Length
	:param theDistance:
	:type theDistance: Quantity_Length
	:param theFace:
	:type theFace: Handle_BRepAdaptor_HSurface &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: bool
") MatchVIso;
		static Standard_Boolean MatchVIso (const Quantity_Length theX,const Quantity_Length theY,const Quantity_Length theZ,const Quantity_Length theDistance,const Handle_BRepAdaptor_HSurface & theFace,const Handle_Prs3d_Drawer & theDrawer);
		%feature("compactdefaultargs") AddUIso;
		%feature("autodoc", "	:param thePresentation:
	:type thePresentation: Handle_Prs3d_Presentation &
	:param theFace:
	:type theFace: Handle_BRepAdaptor_HSurface &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") AddUIso;
		static void AddUIso (const Handle_Prs3d_Presentation & thePresentation,const Handle_BRepAdaptor_HSurface & theFace,const Handle_Prs3d_Drawer & theDrawer);
		%feature("compactdefaultargs") AddVIso;
		%feature("autodoc", "	:param thePresentation:
	:type thePresentation: Handle_Prs3d_Presentation &
	:param theFace:
	:type theFace: Handle_BRepAdaptor_HSurface &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") AddVIso;
		static void AddVIso (const Handle_Prs3d_Presentation & thePresentation,const Handle_BRepAdaptor_HSurface & theFace,const Handle_Prs3d_Drawer & theDrawer);
};


%extend StdPrs_WFRestrictedFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdPrs_WFShape;
class StdPrs_WFShape : public Prs3d_Root {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Add shape to presentation

	:param thePrs:
	:type thePrs: Handle_Prs3d_Presentation &
	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: inline void
") Add;
		static inline void Add (const Handle_Prs3d_Presentation & thePrs,const TopoDS_Shape & theShape,const Handle_Prs3d_Drawer & theDrawer);
		%feature("compactdefaultargs") PickCurve;
		%feature("autodoc", "	:param theX:
	:type theX: Quantity_Length
	:param theY:
	:type theY: Quantity_Length
	:param theZ:
	:type theZ: Quantity_Length
	:param theDistance:
	:type theDistance: Quantity_Length
	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: inline Handle_TopTools_HSequenceOfShape
") PickCurve;
		static inline Handle_TopTools_HSequenceOfShape PickCurve (const Quantity_Length theX,const Quantity_Length theY,const Quantity_Length theZ,const Quantity_Length theDistance,const TopoDS_Shape & theShape,const Handle_Prs3d_Drawer & theDrawer);
		%feature("compactdefaultargs") PickPatch;
		%feature("autodoc", "	:param theX:
	:type theX: Quantity_Length
	:param theY:
	:type theY: Quantity_Length
	:param theZ:
	:type theZ: Quantity_Length
	:param theDistance:
	:type theDistance: Quantity_Length
	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: inline Handle_TopTools_HSequenceOfShape
") PickPatch;
		static inline Handle_TopTools_HSequenceOfShape PickPatch (const Quantity_Length theX,const Quantity_Length theY,const Quantity_Length theZ,const Quantity_Length theDistance,const TopoDS_Shape & theShape,const Handle_Prs3d_Drawer & theDrawer);
};


%extend StdPrs_WFShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class StdPrs_WFSurface : public Prs3d_Root {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Draws a surface by drawing the isoparametric curves with respect to a fixed number of points given by the Drawer. The number of isoparametric curves to be drawn and their color are controlled by the furnished Drawer.

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aSurface:
	:type aSurface: Handle_Adaptor3d_HSurface &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & aPresentation,const Handle_Adaptor3d_HSurface & aSurface,const Handle_Prs3d_Drawer & aDrawer);
};


%extend StdPrs_WFSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
