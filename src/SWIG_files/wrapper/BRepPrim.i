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
%module (package="OCC") BRepPrim

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


%include BRepPrim_headers.i


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
/* end typedefs declaration */

/* public enums */
enum BRepPrim_Direction {
	BRepPrim_XMin = 0,
	BRepPrim_XMax = 1,
	BRepPrim_YMin = 2,
	BRepPrim_YMax = 3,
	BRepPrim_ZMin = 4,
	BRepPrim_ZMax = 5,
};

/* end public enums declaration */

%nodefaultctor BRepPrim_Builder;
class BRepPrim_Builder {
	public:
		%feature("compactdefaultargs") BRepPrim_Builder;
		%feature("autodoc", "	* Creates an empty, useless Builder. Necesseray for compilation.

	:rtype: None
") BRepPrim_Builder;
		 BRepPrim_Builder ();
		%feature("compactdefaultargs") BRepPrim_Builder;
		%feature("autodoc", "	* Creates from a Builder.

	:param B:
	:type B: BRep_Builder &
	:rtype: None
") BRepPrim_Builder;
		 BRepPrim_Builder (const BRep_Builder & B);
		%feature("compactdefaultargs") Builder;
		%feature("autodoc", "	:rtype: BRep_Builder
") Builder;
		const BRep_Builder & Builder ();
		%feature("compactdefaultargs") MakeShell;
		%feature("autodoc", "	* Make a empty Shell.

	:param S:
	:type S: TopoDS_Shell &
	:rtype: None
") MakeShell;
		void MakeShell (TopoDS_Shell & S);
		%feature("compactdefaultargs") MakeFace;
		%feature("autodoc", "	* Returns in <F> a Face built with the plane equation <P>. Used by all primitives.

	:param F:
	:type F: TopoDS_Face &
	:param P:
	:type P: gp_Pln
	:rtype: None
") MakeFace;
		void MakeFace (TopoDS_Face & F,const gp_Pln & P);
		%feature("compactdefaultargs") MakeWire;
		%feature("autodoc", "	* Returns in <W> an empty Wire.

	:param W:
	:type W: TopoDS_Wire &
	:rtype: None
") MakeWire;
		void MakeWire (TopoDS_Wire & W);
		%feature("compactdefaultargs") MakeDegeneratedEdge;
		%feature("autodoc", "	* Returns in <E> a degenerated edge.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") MakeDegeneratedEdge;
		void MakeDegeneratedEdge (TopoDS_Edge & E);
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "	* Returns in <E> an Edge built with the line equation <L>.

	:param E:
	:type E: TopoDS_Edge &
	:param L:
	:type L: gp_Lin
	:rtype: None
") MakeEdge;
		void MakeEdge (TopoDS_Edge & E,const gp_Lin & L);
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "	* Returns in <E> an Edge built with the circle equation <C>.

	:param E:
	:type E: TopoDS_Edge &
	:param C:
	:type C: gp_Circ
	:rtype: None
") MakeEdge;
		void MakeEdge (TopoDS_Edge & E,const gp_Circ & C);
		%feature("compactdefaultargs") SetPCurve;
		%feature("autodoc", "	* Sets the line <L> to be the curve representing the edge <E> in the parametric space of the surface of <F>.

	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:param L:
	:type L: gp_Lin2d
	:rtype: None
") SetPCurve;
		void SetPCurve (TopoDS_Edge & E,const TopoDS_Face & F,const gp_Lin2d & L);
		%feature("compactdefaultargs") SetPCurve;
		%feature("autodoc", "	* Sets the lines <L1,L2> to be the curves representing the edge <E> in the parametric space of the closed surface of <F>.

	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:param L1:
	:type L1: gp_Lin2d
	:param L2:
	:type L2: gp_Lin2d
	:rtype: None
") SetPCurve;
		void SetPCurve (TopoDS_Edge & E,const TopoDS_Face & F,const gp_Lin2d & L1,const gp_Lin2d & L2);
		%feature("compactdefaultargs") SetPCurve;
		%feature("autodoc", "	* Sets the circle <C> to be the curve representing the edge <E> in the parametric space of the surface of <F>.

	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:param C:
	:type C: gp_Circ2d
	:rtype: None
") SetPCurve;
		void SetPCurve (TopoDS_Edge & E,const TopoDS_Face & F,const gp_Circ2d & C);
		%feature("compactdefaultargs") MakeVertex;
		%feature("autodoc", "	* Returns in <V> a Vertex built with the point <P>.

	:param V:
	:type V: TopoDS_Vertex &
	:param P:
	:type P: gp_Pnt
	:rtype: None
") MakeVertex;
		void MakeVertex (TopoDS_Vertex & V,const gp_Pnt & P);
		%feature("compactdefaultargs") ReverseFace;
		%feature("autodoc", "	* Reverses the Face <F>.

	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") ReverseFace;
		void ReverseFace (TopoDS_Face & F);
		%feature("compactdefaultargs") AddEdgeVertex;
		%feature("autodoc", "	* Adds the Vertex <V> in the Edge <E>. <P> is the parameter of the vertex on the edge. If direct is False the Vertex is reversed.

	:param E:
	:type E: TopoDS_Edge &
	:param V:
	:type V: TopoDS_Vertex &
	:param P:
	:type P: float
	:param direct:
	:type direct: bool
	:rtype: None
") AddEdgeVertex;
		void AddEdgeVertex (TopoDS_Edge & E,const TopoDS_Vertex & V,const Standard_Real P,const Standard_Boolean direct);
		%feature("compactdefaultargs") AddEdgeVertex;
		%feature("autodoc", "	* Adds the Vertex <V> in the Edge <E>. <P1,P2> are the parameters of the vertex on the closed edge.

	:param E:
	:type E: TopoDS_Edge &
	:param V:
	:type V: TopoDS_Vertex &
	:param P1:
	:type P1: float
	:param P2:
	:type P2: float
	:rtype: None
") AddEdgeVertex;
		void AddEdgeVertex (TopoDS_Edge & E,const TopoDS_Vertex & V,const Standard_Real P1,const Standard_Real P2);
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "	* <P1,P2> are the parameters of the vertex on the edge. The edge is a closed curve.

	:param E:
	:type E: TopoDS_Edge &
	:param V:
	:type V: TopoDS_Vertex &
	:param P1:
	:type P1: float
	:param P2:
	:type P2: float
	:rtype: None
") SetParameters;
		void SetParameters (TopoDS_Edge & E,const TopoDS_Vertex & V,const Standard_Real P1,const Standard_Real P2);
		%feature("compactdefaultargs") AddWireEdge;
		%feature("autodoc", "	* Adds the Edge <E> in the Wire <W>, if direct is False the Edge is reversed.

	:param W:
	:type W: TopoDS_Wire &
	:param E:
	:type E: TopoDS_Edge &
	:param direct:
	:type direct: bool
	:rtype: None
") AddWireEdge;
		void AddWireEdge (TopoDS_Wire & W,const TopoDS_Edge & E,const Standard_Boolean direct);
		%feature("compactdefaultargs") AddFaceWire;
		%feature("autodoc", "	* Adds the Wire <W> in the Face <F>.

	:param F:
	:type F: TopoDS_Face &
	:param W:
	:type W: TopoDS_Wire &
	:rtype: None
") AddFaceWire;
		void AddFaceWire (TopoDS_Face & F,const TopoDS_Wire & W);
		%feature("compactdefaultargs") AddShellFace;
		%feature("autodoc", "	* Adds the Face <F> in the Shell <Sh>.

	:param Sh:
	:type Sh: TopoDS_Shell &
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") AddShellFace;
		void AddShellFace (TopoDS_Shell & Sh,const TopoDS_Face & F);
		%feature("compactdefaultargs") CompleteEdge;
		%feature("autodoc", "	* This is called once an edge is completed. It gives the opportunity to perform any post treatment.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") CompleteEdge;
		void CompleteEdge (TopoDS_Edge & E);
		%feature("compactdefaultargs") CompleteWire;
		%feature("autodoc", "	* This is called once a wire is completed. It gives the opportunity to perform any post treatment.

	:param W:
	:type W: TopoDS_Wire &
	:rtype: None
") CompleteWire;
		void CompleteWire (TopoDS_Wire & W);
		%feature("compactdefaultargs") CompleteFace;
		%feature("autodoc", "	* This is called once a face is completed. It gives the opportunity to perform any post treatment.

	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") CompleteFace;
		void CompleteFace (TopoDS_Face & F);
		%feature("compactdefaultargs") CompleteShell;
		%feature("autodoc", "	* This is called once a shell is completed. It gives the opportunity to perform any post treatment.

	:param S:
	:type S: TopoDS_Shell &
	:rtype: None
") CompleteShell;
		void CompleteShell (TopoDS_Shell & S);
};


%extend BRepPrim_Builder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepPrim_FaceBuilder;
class BRepPrim_FaceBuilder {
	public:
		%feature("compactdefaultargs") BRepPrim_FaceBuilder;
		%feature("autodoc", "	:rtype: None
") BRepPrim_FaceBuilder;
		 BRepPrim_FaceBuilder ();
		%feature("compactdefaultargs") BRepPrim_FaceBuilder;
		%feature("autodoc", "	:param B:
	:type B: BRep_Builder &
	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: None
") BRepPrim_FaceBuilder;
		 BRepPrim_FaceBuilder (const BRep_Builder & B,const Handle_Geom_Surface & S);
		%feature("compactdefaultargs") BRepPrim_FaceBuilder;
		%feature("autodoc", "	:param B:
	:type B: BRep_Builder &
	:param S:
	:type S: Handle_Geom_Surface &
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:rtype: None
") BRepPrim_FaceBuilder;
		 BRepPrim_FaceBuilder (const BRep_Builder & B,const Handle_Geom_Surface & S,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param B:
	:type B: BRep_Builder &
	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: None
") Init;
		void Init (const BRep_Builder & B,const Handle_Geom_Surface & S);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param B:
	:type B: BRep_Builder &
	:param S:
	:type S: Handle_Geom_Surface &
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:rtype: None
") Init;
		void Init (const BRep_Builder & B,const Handle_Geom_Surface & S,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax);
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face  Face ();
		%feature("compactdefaultargs") operator TopoDS_Face;
		%feature("autodoc", "	:rtype: 
") operator TopoDS_Face;
		 operator TopoDS_Face ();
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	* Returns the edge of index <I> 1 - Edge VMin 2 - Edge UMax 3 - Edge VMax 4 - Edge UMin

	:param I:
	:type I: int
	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge  Edge (const Standard_Integer I);
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	* Returns the vertex of index <I> 1 - Vertex UMin,VMin 2 - Vertex UMax,VMin 3 - Vertex UMax,VMax 4 - Vertex UMin,VMax

	:param I:
	:type I: int
	:rtype: TopoDS_Vertex
") Vertex;
		const TopoDS_Vertex  Vertex (const Standard_Integer I);
};


%extend BRepPrim_FaceBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepPrim_GWedge;
class BRepPrim_GWedge {
	public:
		%feature("compactdefaultargs") BRepPrim_GWedge;
		%feature("autodoc", "	* Creates a GWedge algorithm. <Axes> is the axis system for the primitive. //! XMin, YMin, ZMin are set to 0 XMax, YMax, ZMax are set to dx, dy, dz Z2Min = ZMin Z2Max = ZMax X2Min = XMin X2Max = XMax The result is a box dx,dy,dz should be positive

	:param B:
	:type B: BRepPrim_Builder &
	:param Axes:
	:type Axes: gp_Ax2
	:param dx:
	:type dx: float
	:param dy:
	:type dy: float
	:param dz:
	:type dz: float
	:rtype: None
") BRepPrim_GWedge;
		 BRepPrim_GWedge (const BRepPrim_Builder & B,const gp_Ax2 & Axes,const Standard_Real dx,const Standard_Real dy,const Standard_Real dz);
		%feature("compactdefaultargs") BRepPrim_GWedge;
		%feature("autodoc", "	* Creates a GWedge primitive. <Axes> is the axis system for the primitive. //! XMin, YMin, ZMin are set to 0 XMax, YMax, ZMax are set to dx, dy, dz Z2Min = ZMin Z2Max = ZMax X2Min = ltx X2Max = ltx The result is a STEP right angular wedge dx,dy,dz should be positive ltx should not be negative

	:param B:
	:type B: BRepPrim_Builder &
	:param Axes:
	:type Axes: gp_Ax2
	:param dx:
	:type dx: float
	:param dy:
	:type dy: float
	:param dz:
	:type dz: float
	:param ltx:
	:type ltx: float
	:rtype: None
") BRepPrim_GWedge;
		 BRepPrim_GWedge (const BRepPrim_Builder & B,const gp_Ax2 & Axes,const Standard_Real dx,const Standard_Real dy,const Standard_Real dz,const Standard_Real ltx);
		%feature("compactdefaultargs") BRepPrim_GWedge;
		%feature("autodoc", "	* Create a GWedge primitive. <Axes> is the axis system for the primitive. //! all the fields are set to the corresponding value XYZMax - XYZMin should be positive ZX2Max - ZX2Min should not be negative

	:param B:
	:type B: BRepPrim_Builder &
	:param Axes:
	:type Axes: gp_Ax2
	:param xmin:
	:type xmin: float
	:param ymin:
	:type ymin: float
	:param zmin:
	:type zmin: float
	:param z2min:
	:type z2min: float
	:param x2min:
	:type x2min: float
	:param xmax:
	:type xmax: float
	:param ymax:
	:type ymax: float
	:param zmax:
	:type zmax: float
	:param z2max:
	:type z2max: float
	:param x2max:
	:type x2max: float
	:rtype: None
") BRepPrim_GWedge;
		 BRepPrim_GWedge (const BRepPrim_Builder & B,const gp_Ax2 & Axes,const Standard_Real xmin,const Standard_Real ymin,const Standard_Real zmin,const Standard_Real z2min,const Standard_Real x2min,const Standard_Real xmax,const Standard_Real ymax,const Standard_Real zmax,const Standard_Real z2max,const Standard_Real x2max);
		%feature("compactdefaultargs") Axes;
		%feature("autodoc", "	* Returns the coordinates system from <self>.

	:rtype: gp_Ax2
") Axes;
		gp_Ax2 Axes ();
		%feature("compactdefaultargs") GetXMin;
		%feature("autodoc", "	* Returns Xmin value from <self>.

	:rtype: float
") GetXMin;
		Standard_Real GetXMin ();
		%feature("compactdefaultargs") GetYMin;
		%feature("autodoc", "	* Returns YMin value from <self>.

	:rtype: float
") GetYMin;
		Standard_Real GetYMin ();
		%feature("compactdefaultargs") GetZMin;
		%feature("autodoc", "	* Returns ZMin value from <self>.

	:rtype: float
") GetZMin;
		Standard_Real GetZMin ();
		%feature("compactdefaultargs") GetZ2Min;
		%feature("autodoc", "	* Returns Z2Min value from <self>.

	:rtype: float
") GetZ2Min;
		Standard_Real GetZ2Min ();
		%feature("compactdefaultargs") GetX2Min;
		%feature("autodoc", "	* Returns X2Min value from <self>.

	:rtype: float
") GetX2Min;
		Standard_Real GetX2Min ();
		%feature("compactdefaultargs") GetXMax;
		%feature("autodoc", "	* Returns XMax value from <self>.

	:rtype: float
") GetXMax;
		Standard_Real GetXMax ();
		%feature("compactdefaultargs") GetYMax;
		%feature("autodoc", "	* Returns YMax value from <self>.

	:rtype: float
") GetYMax;
		Standard_Real GetYMax ();
		%feature("compactdefaultargs") GetZMax;
		%feature("autodoc", "	* Returns ZMax value from <self>.

	:rtype: float
") GetZMax;
		Standard_Real GetZMax ();
		%feature("compactdefaultargs") GetZ2Max;
		%feature("autodoc", "	* Returns Z2Max value from <self>.

	:rtype: float
") GetZ2Max;
		Standard_Real GetZ2Max ();
		%feature("compactdefaultargs") GetX2Max;
		%feature("autodoc", "	* Returns X2Max value from <self>.

	:rtype: float
") GetX2Max;
		Standard_Real GetX2Max ();
		%feature("compactdefaultargs") Open;
		%feature("autodoc", "	* Opens <self> in <d1> direction. A face and its edges or vertices are said nonexistant.

	:param d1:
	:type d1: BRepPrim_Direction
	:rtype: None
") Open;
		void Open (const BRepPrim_Direction d1);
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "	* Closes <self> in <d1> direction. A face and its edges or vertices are said existant.

	:param d1:
	:type d1: BRepPrim_Direction
	:rtype: None
") Close;
		void Close (const BRepPrim_Direction d1);
		%feature("compactdefaultargs") IsInfinite;
		%feature("autodoc", "	* Returns True if <self> is open in <d1> direction.

	:param d1:
	:type d1: BRepPrim_Direction
	:rtype: bool
") IsInfinite;
		Standard_Boolean IsInfinite (const BRepPrim_Direction d1);
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "	* Returns the Shell containing the Faces of <self>.

	:rtype: TopoDS_Shell
") Shell;
		const TopoDS_Shell  Shell ();
		%feature("compactdefaultargs") HasFace;
		%feature("autodoc", "	* Returns True if <self> has a Face in <d1> direction.

	:param d1:
	:type d1: BRepPrim_Direction
	:rtype: bool
") HasFace;
		Standard_Boolean HasFace (const BRepPrim_Direction d1);
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	* Returns the Face of <self> located in <d1> direction.

	:param d1:
	:type d1: BRepPrim_Direction
	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face  Face (const BRepPrim_Direction d1);
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "	* Returns the plane of the Face of <self> located in <d1> direction.

	:param d1:
	:type d1: BRepPrim_Direction
	:rtype: gp_Pln
") Plane;
		gp_Pln Plane (const BRepPrim_Direction d1);
		%feature("compactdefaultargs") HasWire;
		%feature("autodoc", "	* Returns True if <self> has a Wire in <d1> direction.

	:param d1:
	:type d1: BRepPrim_Direction
	:rtype: bool
") HasWire;
		Standard_Boolean HasWire (const BRepPrim_Direction d1);
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "	* Returns the Wire of <self> located in <d1> direction.

	:param d1:
	:type d1: BRepPrim_Direction
	:rtype: TopoDS_Wire
") Wire;
		const TopoDS_Wire  Wire (const BRepPrim_Direction d1);
		%feature("compactdefaultargs") HasEdge;
		%feature("autodoc", "	* Returns True if <self> has an Edge in <d1><d2> direction.

	:param d1:
	:type d1: BRepPrim_Direction
	:param d2:
	:type d2: BRepPrim_Direction
	:rtype: bool
") HasEdge;
		Standard_Boolean HasEdge (const BRepPrim_Direction d1,const BRepPrim_Direction d2);
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	* Returns the Edge of <self> located in <d1><d2> direction.

	:param d1:
	:type d1: BRepPrim_Direction
	:param d2:
	:type d2: BRepPrim_Direction
	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge  Edge (const BRepPrim_Direction d1,const BRepPrim_Direction d2);
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	* Returns the line of the Edge of <self> located in <d1><d2> direction.

	:param d1:
	:type d1: BRepPrim_Direction
	:param d2:
	:type d2: BRepPrim_Direction
	:rtype: gp_Lin
") Line;
		gp_Lin Line (const BRepPrim_Direction d1,const BRepPrim_Direction d2);
		%feature("compactdefaultargs") HasVertex;
		%feature("autodoc", "	* Returns True if <self> has a Vertex in <d1><d2><d3> direction.

	:param d1:
	:type d1: BRepPrim_Direction
	:param d2:
	:type d2: BRepPrim_Direction
	:param d3:
	:type d3: BRepPrim_Direction
	:rtype: bool
") HasVertex;
		Standard_Boolean HasVertex (const BRepPrim_Direction d1,const BRepPrim_Direction d2,const BRepPrim_Direction d3);
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	* Returns the Vertex of <self> located in <d1><d2><d3> direction.

	:param d1:
	:type d1: BRepPrim_Direction
	:param d2:
	:type d2: BRepPrim_Direction
	:param d3:
	:type d3: BRepPrim_Direction
	:rtype: TopoDS_Vertex
") Vertex;
		const TopoDS_Vertex  Vertex (const BRepPrim_Direction d1,const BRepPrim_Direction d2,const BRepPrim_Direction d3);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of the Vertex of <self> located in <d1><d2><d3> direction.

	:param d1:
	:type d1: BRepPrim_Direction
	:param d2:
	:type d2: BRepPrim_Direction
	:param d3:
	:type d3: BRepPrim_Direction
	:rtype: gp_Pnt
") Point;
		gp_Pnt Point (const BRepPrim_Direction d1,const BRepPrim_Direction d2,const BRepPrim_Direction d3);
};


%extend BRepPrim_GWedge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepPrim_OneAxis;
class BRepPrim_OneAxis {
	public:
		%feature("compactdefaultargs") SetMeridianOffset;
		%feature("autodoc", "	* The MeridianOffset is added to the parameters on the meridian curve and to the V values of the pcurves. This is used for the sphere for example, to give a range on the meridian edge which is not VMin, VMax.

	:param MeridianOffset: default value is 0
	:type MeridianOffset: float
	:rtype: None
") SetMeridianOffset;
		void SetMeridianOffset (const Standard_Real MeridianOffset = 0);
		%feature("compactdefaultargs") Axes;
		%feature("autodoc", "	* Returns the Ax2 from <self>.

	:rtype: gp_Ax2
") Axes;
		const gp_Ax2  Axes ();
		%feature("compactdefaultargs") Axes;
		%feature("autodoc", "	:param A:
	:type A: gp_Ax2
	:rtype: None
") Axes;
		void Axes (const gp_Ax2 & A);
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	:rtype: float
") Angle;
		Standard_Real Angle ();
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	:param A:
	:type A: float
	:rtype: None
") Angle;
		void Angle (const Standard_Real A);
		%feature("compactdefaultargs") VMin;
		%feature("autodoc", "	:rtype: float
") VMin;
		Standard_Real VMin ();
		%feature("compactdefaultargs") VMin;
		%feature("autodoc", "	:param V:
	:type V: float
	:rtype: None
") VMin;
		void VMin (const Standard_Real V);
		%feature("compactdefaultargs") VMax;
		%feature("autodoc", "	:rtype: float
") VMax;
		Standard_Real VMax ();
		%feature("compactdefaultargs") VMax;
		%feature("autodoc", "	:param V:
	:type V: float
	:rtype: None
") VMax;
		void VMax (const Standard_Real V);
		%feature("compactdefaultargs") MakeEmptyLateralFace;
		%feature("autodoc", "	* Returns a face with no edges. The surface is the lateral surface with normals pointing outward. The U parameter is the angle with the origin on the X axis. The V parameter is the parameter of the meridian.

	:rtype: TopoDS_Face
") MakeEmptyLateralFace;
		virtual TopoDS_Face MakeEmptyLateralFace ();
		%feature("compactdefaultargs") MakeEmptyMeridianEdge;
		%feature("autodoc", "	* Returns an edge with a 3D curve made from the meridian in the XZ plane rotated by <Ang> around the Z-axis. Ang may be 0 or myAngle.

	:param Ang:
	:type Ang: float
	:rtype: TopoDS_Edge
") MakeEmptyMeridianEdge;
		virtual TopoDS_Edge MakeEmptyMeridianEdge (const Standard_Real Ang);
		%feature("compactdefaultargs") SetMeridianPCurve;
		%feature("autodoc", "	* Sets the parametric curve of the edge <E> in the face <F> to be the 2d representation of the meridian.

	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:rtype: void
") SetMeridianPCurve;
		virtual void SetMeridianPCurve (TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("compactdefaultargs") MeridianValue;
		%feature("autodoc", "	* Returns the meridian point at parameter <V> in the plane XZ.

	:param V:
	:type V: float
	:rtype: gp_Pnt2d
") MeridianValue;
		virtual gp_Pnt2d MeridianValue (const Standard_Real V);
		%feature("compactdefaultargs") MeridianOnAxis;
		%feature("autodoc", "	* Returns True if the point of parameter <V> on the meridian is on the Axis. Default implementation is Abs(MeridianValue(V).X()) < Precision::Confusion()

	:param V:
	:type V: float
	:rtype: bool
") MeridianOnAxis;
		virtual Standard_Boolean MeridianOnAxis (const Standard_Real V);
		%feature("compactdefaultargs") MeridianClosed;
		%feature("autodoc", "	* Returns True if the meridian is closed. Default implementation  is MeridianValue(VMin).IsEqual(MeridianValue(VMax), Precision::Confusion())

	:rtype: bool
") MeridianClosed;
		virtual Standard_Boolean MeridianClosed ();
		%feature("compactdefaultargs") VMaxInfinite;
		%feature("autodoc", "	* Returns True if VMax is infinite. Default Precision::IsPositiveInfinite(VMax);

	:rtype: bool
") VMaxInfinite;
		virtual Standard_Boolean VMaxInfinite ();
		%feature("compactdefaultargs") VMinInfinite;
		%feature("autodoc", "	* Returns True if VMin is infinite. Default Precision::IsNegativeInfinite(VMax);

	:rtype: bool
") VMinInfinite;
		virtual Standard_Boolean VMinInfinite ();
		%feature("compactdefaultargs") HasTop;
		%feature("autodoc", "	* Returns True if there is a top face. //! That is neither : VMaxInfinite() MeridianClosed() MeridianOnAxis(VMax)

	:rtype: bool
") HasTop;
		virtual Standard_Boolean HasTop ();
		%feature("compactdefaultargs") HasBottom;
		%feature("autodoc", "	* Returns True if there is a bottom face. //! That is neither : VMinInfinite() MeridianClosed() MeridianOnAxis(VMin)

	:rtype: bool
") HasBottom;
		virtual Standard_Boolean HasBottom ();
		%feature("compactdefaultargs") HasSides;
		%feature("autodoc", "	* Returns True if there are Start and End faces. //! That is : 2*PI - Angle > Precision::Angular()

	:rtype: bool
") HasSides;
		virtual Standard_Boolean HasSides ();
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "	* Returns the Shell containing all the Faces of the primitive.

	:rtype: TopoDS_Shell
") Shell;
		const TopoDS_Shell  Shell ();
		%feature("compactdefaultargs") LateralFace;
		%feature("autodoc", "	* Returns the lateral Face. It is oriented toward the outside of the primitive.

	:rtype: TopoDS_Face
") LateralFace;
		const TopoDS_Face  LateralFace ();
		%feature("compactdefaultargs") TopFace;
		%feature("autodoc", "	* Returns the top planar Face. It is Oriented toward the +Z axis (outside).

	:rtype: TopoDS_Face
") TopFace;
		const TopoDS_Face  TopFace ();
		%feature("compactdefaultargs") BottomFace;
		%feature("autodoc", "	* Returns the Bottom planar Face. It is Oriented toward the -Z axis (outside).

	:rtype: TopoDS_Face
") BottomFace;
		const TopoDS_Face  BottomFace ();
		%feature("compactdefaultargs") StartFace;
		%feature("autodoc", "	* Returns the Face starting the slice, it is oriented toward the exterior of the primitive.

	:rtype: TopoDS_Face
") StartFace;
		const TopoDS_Face  StartFace ();
		%feature("compactdefaultargs") EndFace;
		%feature("autodoc", "	* Returns the Face ending the slice, it is oriented toward the exterior of the primitive.

	:rtype: TopoDS_Face
") EndFace;
		const TopoDS_Face  EndFace ();
		%feature("compactdefaultargs") LateralWire;
		%feature("autodoc", "	* Returns the wire in the lateral face.

	:rtype: TopoDS_Wire
") LateralWire;
		const TopoDS_Wire  LateralWire ();
		%feature("compactdefaultargs") LateralStartWire;
		%feature("autodoc", "	* Returns the wire in the lateral face with the start edge.

	:rtype: TopoDS_Wire
") LateralStartWire;
		const TopoDS_Wire  LateralStartWire ();
		%feature("compactdefaultargs") LateralEndWire;
		%feature("autodoc", "	* Returns the wire with in lateral face with the end edge.

	:rtype: TopoDS_Wire
") LateralEndWire;
		const TopoDS_Wire  LateralEndWire ();
		%feature("compactdefaultargs") TopWire;
		%feature("autodoc", "	* Returns the wire in the top face.

	:rtype: TopoDS_Wire
") TopWire;
		const TopoDS_Wire  TopWire ();
		%feature("compactdefaultargs") BottomWire;
		%feature("autodoc", "	* Returns the wire in the bottom face.

	:rtype: TopoDS_Wire
") BottomWire;
		const TopoDS_Wire  BottomWire ();
		%feature("compactdefaultargs") StartWire;
		%feature("autodoc", "	* Returns the wire in the start face.

	:rtype: TopoDS_Wire
") StartWire;
		const TopoDS_Wire  StartWire ();
		%feature("compactdefaultargs") AxisStartWire;
		%feature("autodoc", "	* Returns the wire in the start face with the AxisEdge.

	:rtype: TopoDS_Wire
") AxisStartWire;
		const TopoDS_Wire  AxisStartWire ();
		%feature("compactdefaultargs") EndWire;
		%feature("autodoc", "	* Returns the Wire in the end face.

	:rtype: TopoDS_Wire
") EndWire;
		const TopoDS_Wire  EndWire ();
		%feature("compactdefaultargs") AxisEndWire;
		%feature("autodoc", "	* Returns the Wire in the end face with the AxisEdge.

	:rtype: TopoDS_Wire
") AxisEndWire;
		const TopoDS_Wire  AxisEndWire ();
		%feature("compactdefaultargs") AxisEdge;
		%feature("autodoc", "	* Returns the Edge built along the Axis and oriented on +Z of the Axis.

	:rtype: TopoDS_Edge
") AxisEdge;
		const TopoDS_Edge  AxisEdge ();
		%feature("compactdefaultargs") StartEdge;
		%feature("autodoc", "	* Returns the Edge at angle 0.

	:rtype: TopoDS_Edge
") StartEdge;
		const TopoDS_Edge  StartEdge ();
		%feature("compactdefaultargs") EndEdge;
		%feature("autodoc", "	* Returns the Edge at angle Angle. If !HasSides() the StartEdge and the EndEdge are the same edge.

	:rtype: TopoDS_Edge
") EndEdge;
		const TopoDS_Edge  EndEdge ();
		%feature("compactdefaultargs") StartTopEdge;
		%feature("autodoc", "	* Returns the linear Edge between start Face and top Face.

	:rtype: TopoDS_Edge
") StartTopEdge;
		const TopoDS_Edge  StartTopEdge ();
		%feature("compactdefaultargs") StartBottomEdge;
		%feature("autodoc", "	* Returns the linear Edge between start Face and bottom Face.

	:rtype: TopoDS_Edge
") StartBottomEdge;
		const TopoDS_Edge  StartBottomEdge ();
		%feature("compactdefaultargs") EndTopEdge;
		%feature("autodoc", "	* Returns the linear Edge between end Face and top Face.

	:rtype: TopoDS_Edge
") EndTopEdge;
		const TopoDS_Edge  EndTopEdge ();
		%feature("compactdefaultargs") EndBottomEdge;
		%feature("autodoc", "	* Returns the linear Edge between end Face and bottom Face.

	:rtype: TopoDS_Edge
") EndBottomEdge;
		const TopoDS_Edge  EndBottomEdge ();
		%feature("compactdefaultargs") TopEdge;
		%feature("autodoc", "	* Returns the edge at VMax. If MeridianClosed() the TopEdge and the BottomEdge are the same edge.

	:rtype: TopoDS_Edge
") TopEdge;
		const TopoDS_Edge  TopEdge ();
		%feature("compactdefaultargs") BottomEdge;
		%feature("autodoc", "	* Returns the edge at VMin. If MeridianClosed() the TopEdge and the BottomEdge are the same edge.

	:rtype: TopoDS_Edge
") BottomEdge;
		const TopoDS_Edge  BottomEdge ();
		%feature("compactdefaultargs") AxisTopVertex;
		%feature("autodoc", "	* Returns the Vertex at the Top altitude on the axis.

	:rtype: TopoDS_Vertex
") AxisTopVertex;
		const TopoDS_Vertex  AxisTopVertex ();
		%feature("compactdefaultargs") AxisBottomVertex;
		%feature("autodoc", "	* Returns the Vertex at the Bottom altitude on the axis.

	:rtype: TopoDS_Vertex
") AxisBottomVertex;
		const TopoDS_Vertex  AxisBottomVertex ();
		%feature("compactdefaultargs") TopStartVertex;
		%feature("autodoc", "	* Returns the vertex (0,VMax)

	:rtype: TopoDS_Vertex
") TopStartVertex;
		const TopoDS_Vertex  TopStartVertex ();
		%feature("compactdefaultargs") TopEndVertex;
		%feature("autodoc", "	* Returns the vertex (angle,VMax)

	:rtype: TopoDS_Vertex
") TopEndVertex;
		const TopoDS_Vertex  TopEndVertex ();
		%feature("compactdefaultargs") BottomStartVertex;
		%feature("autodoc", "	* Returns the vertex (0,VMin)

	:rtype: TopoDS_Vertex
") BottomStartVertex;
		const TopoDS_Vertex  BottomStartVertex ();
		%feature("compactdefaultargs") BottomEndVertex;
		%feature("autodoc", "	* Returns the vertex (angle,VMax)

	:rtype: TopoDS_Vertex
") BottomEndVertex;
		const TopoDS_Vertex  BottomEndVertex ();
};


%extend BRepPrim_OneAxis {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepPrim_Revolution;
class BRepPrim_Revolution : public BRepPrim_OneAxis {
	public:
		%feature("compactdefaultargs") BRepPrim_Revolution;
		%feature("autodoc", "	* Create a revolution body <M> is the meridian nd must be in the XZ plane of <A>. <PM> is the meridian in the XZ plane.

	:param A:
	:type A: gp_Ax2
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:param M:
	:type M: Handle_Geom_Curve &
	:param PM:
	:type PM: Handle_Geom2d_Curve &
	:rtype: None
") BRepPrim_Revolution;
		 BRepPrim_Revolution (const gp_Ax2 & A,const Standard_Real VMin,const Standard_Real VMax,const Handle_Geom_Curve & M,const Handle_Geom2d_Curve & PM);
		%feature("compactdefaultargs") MakeEmptyLateralFace;
		%feature("autodoc", "	* The surface normal should be directed towards the outside.

	:rtype: TopoDS_Face
") MakeEmptyLateralFace;
		virtual TopoDS_Face MakeEmptyLateralFace ();
		%feature("compactdefaultargs") MakeEmptyMeridianEdge;
		%feature("autodoc", "	* Returns an edge with a 3D curve made from the meridian in the XZ plane rotated by <Ang> around the Z-axis. Ang may be 0 or myAngle.

	:param Ang:
	:type Ang: float
	:rtype: TopoDS_Edge
") MakeEmptyMeridianEdge;
		virtual TopoDS_Edge MakeEmptyMeridianEdge (const Standard_Real Ang);
		%feature("compactdefaultargs") MeridianValue;
		%feature("autodoc", "	* Returns the meridian point at parameter <V> in the plane XZ.

	:param V:
	:type V: float
	:rtype: gp_Pnt2d
") MeridianValue;
		virtual gp_Pnt2d MeridianValue (const Standard_Real V);
		%feature("compactdefaultargs") SetMeridianPCurve;
		%feature("autodoc", "	* Sets the parametric urve of the edge <E> in the face <F> to be the 2d representation of the meridian.

	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:rtype: void
") SetMeridianPCurve;
		virtual void SetMeridianPCurve (TopoDS_Edge & E,const TopoDS_Face & F);
};


%extend BRepPrim_Revolution {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepPrim_Wedge;
class BRepPrim_Wedge : public BRepPrim_GWedge {
	public:
		%feature("compactdefaultargs") BRepPrim_Wedge;
		%feature("autodoc", "	* Creates a Wedge algorithm. <Axes> is the axis system for the primitive. //! XMin, YMin, ZMin are set to 0 XMax, YMax, ZMax are set to dx, dy, dz Z2Min = ZMin Z2Max = ZMax X2Min = XMin X2Max = XMax The result is a box dx,dy,dz should be positive

	:param Axes:
	:type Axes: gp_Ax2
	:param dx:
	:type dx: float
	:param dy:
	:type dy: float
	:param dz:
	:type dz: float
	:rtype: None
") BRepPrim_Wedge;
		 BRepPrim_Wedge (const gp_Ax2 & Axes,const Standard_Real dx,const Standard_Real dy,const Standard_Real dz);
		%feature("compactdefaultargs") BRepPrim_Wedge;
		%feature("autodoc", "	* Creates a Wedge primitive. <Axes> is the axis system for the primitive. //! XMin, YMin, ZMin are set to 0 XMax, YMax, ZMax are set to dx, dy, dz Z2Min = ZMin Z2Max = ZMax X2Min = ltx X2Max = ltx The result is a STEP right angular wedge dx,dy,dz should be positive ltx should not be negative

	:param Axes:
	:type Axes: gp_Ax2
	:param dx:
	:type dx: float
	:param dy:
	:type dy: float
	:param dz:
	:type dz: float
	:param ltx:
	:type ltx: float
	:rtype: None
") BRepPrim_Wedge;
		 BRepPrim_Wedge (const gp_Ax2 & Axes,const Standard_Real dx,const Standard_Real dy,const Standard_Real dz,const Standard_Real ltx);
		%feature("compactdefaultargs") BRepPrim_Wedge;
		%feature("autodoc", "	* Create a Wedge primitive. <Axes> is the axis system for the primitive. //! all the fields are set to the corresponding value XYZMax - XYZMin should be positive ZX2Max - ZX2Min should not be negative

	:param Axes:
	:type Axes: gp_Ax2
	:param xmin:
	:type xmin: float
	:param ymin:
	:type ymin: float
	:param zmin:
	:type zmin: float
	:param z2min:
	:type z2min: float
	:param x2min:
	:type x2min: float
	:param xmax:
	:type xmax: float
	:param ymax:
	:type ymax: float
	:param zmax:
	:type zmax: float
	:param z2max:
	:type z2max: float
	:param x2max:
	:type x2max: float
	:rtype: None
") BRepPrim_Wedge;
		 BRepPrim_Wedge (const gp_Ax2 & Axes,const Standard_Real xmin,const Standard_Real ymin,const Standard_Real zmin,const Standard_Real z2min,const Standard_Real x2min,const Standard_Real xmax,const Standard_Real ymax,const Standard_Real zmax,const Standard_Real z2max,const Standard_Real x2max);
};


%extend BRepPrim_Wedge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepPrim_Cone;
class BRepPrim_Cone : public BRepPrim_Revolution {
	public:
		%feature("compactdefaultargs") BRepPrim_Cone;
		%feature("autodoc", "	* the STEP definition Angle = semi-angle of the cone Position : the coordinate system Height : height of the cone. Radius : radius of truncated face at z = 0 //! The apex is on z < 0 //! Errors : Height < Resolution Angle < Resolution / Height Angle > PI/2 - Resolution / Height

	:param Angle:
	:type Angle: float
	:param Position:
	:type Position: gp_Ax2
	:param Height:
	:type Height: float
	:param Radius: default value is 0
	:type Radius: float
	:rtype: None
") BRepPrim_Cone;
		 BRepPrim_Cone (const Standard_Real Angle,const gp_Ax2 & Position,const Standard_Real Height,const Standard_Real Radius = 0);
		%feature("compactdefaultargs") BRepPrim_Cone;
		%feature("autodoc", "	* infinite cone at origin on Z negative

	:param Angle:
	:type Angle: float
	:rtype: None
") BRepPrim_Cone;
		 BRepPrim_Cone (const Standard_Real Angle);
		%feature("compactdefaultargs") BRepPrim_Cone;
		%feature("autodoc", "	* infinite cone at Apex on Z negative

	:param Angle:
	:type Angle: float
	:param Apex:
	:type Apex: gp_Pnt
	:rtype: None
") BRepPrim_Cone;
		 BRepPrim_Cone (const Standard_Real Angle,const gp_Pnt & Apex);
		%feature("compactdefaultargs") BRepPrim_Cone;
		%feature("autodoc", "	* infinite cone with Axes

	:param Angle:
	:type Angle: float
	:param Axes:
	:type Axes: gp_Ax2
	:rtype: None
") BRepPrim_Cone;
		 BRepPrim_Cone (const Standard_Real Angle,const gp_Ax2 & Axes);
		%feature("compactdefaultargs") BRepPrim_Cone;
		%feature("autodoc", "	* create a Cone at origin on Z axis, of height H, radius R1 at Z = 0, R2 at Z = H, X is the origin of angles. If R1 or R2 is 0 there is an apex. Otherwise, it is a truncated cone. //! Error : R1 and R2 < Resolution R1 or R2 negative Abs(R1-R2) < Resolution H < Resolution H negative

	:param R1:
	:type R1: float
	:param R2:
	:type R2: float
	:param H:
	:type H: float
	:rtype: None
") BRepPrim_Cone;
		 BRepPrim_Cone (const Standard_Real R1,const Standard_Real R2,const Standard_Real H);
		%feature("compactdefaultargs") BRepPrim_Cone;
		%feature("autodoc", "	* same as above but at a given point

	:param Center:
	:type Center: gp_Pnt
	:param R1:
	:type R1: float
	:param R2:
	:type R2: float
	:param H:
	:type H: float
	:rtype: None
") BRepPrim_Cone;
		 BRepPrim_Cone (const gp_Pnt & Center,const Standard_Real R1,const Standard_Real R2,const Standard_Real H);
		%feature("compactdefaultargs") BRepPrim_Cone;
		%feature("autodoc", "	* same as above with given axes system.

	:param Axes:
	:type Axes: gp_Ax2
	:param R1:
	:type R1: float
	:param R2:
	:type R2: float
	:param H:
	:type H: float
	:rtype: None
") BRepPrim_Cone;
		 BRepPrim_Cone (const gp_Ax2 & Axes,const Standard_Real R1,const Standard_Real R2,const Standard_Real H);
		%feature("compactdefaultargs") MakeEmptyLateralFace;
		%feature("autodoc", "	* The surface normal should be directed towards the outside.

	:rtype: TopoDS_Face
") MakeEmptyLateralFace;
		virtual TopoDS_Face MakeEmptyLateralFace ();
};


%extend BRepPrim_Cone {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepPrim_Cylinder;
class BRepPrim_Cylinder : public BRepPrim_Revolution {
	public:
		%feature("compactdefaultargs") BRepPrim_Cylinder;
		%feature("autodoc", "	* the STEP definition Position : center of a Face and Axis Radius : radius of cylinder Height : distance between faces on positive side //! Errors : Height < Resolution Radius < Resolution

	:param Position:
	:type Position: gp_Ax2
	:param Radius:
	:type Radius: float
	:param Height:
	:type Height: float
	:rtype: None
") BRepPrim_Cylinder;
		 BRepPrim_Cylinder (const gp_Ax2 & Position,const Standard_Real Radius,const Standard_Real Height);
		%feature("compactdefaultargs") BRepPrim_Cylinder;
		%feature("autodoc", "	* infinite Cylinder at origin on Z negative

	:param Radius:
	:type Radius: float
	:rtype: None
") BRepPrim_Cylinder;
		 BRepPrim_Cylinder (const Standard_Real Radius);
		%feature("compactdefaultargs") BRepPrim_Cylinder;
		%feature("autodoc", "	* infinite Cylinder at Center on Z negative

	:param Center:
	:type Center: gp_Pnt
	:param Radius:
	:type Radius: float
	:rtype: None
") BRepPrim_Cylinder;
		 BRepPrim_Cylinder (const gp_Pnt & Center,const Standard_Real Radius);
		%feature("compactdefaultargs") BRepPrim_Cylinder;
		%feature("autodoc", "	* infinite Cylinder at Axes on Z negative

	:param Axes:
	:type Axes: gp_Ax2
	:param Radius:
	:type Radius: float
	:rtype: None
") BRepPrim_Cylinder;
		 BRepPrim_Cylinder (const gp_Ax2 & Axes,const Standard_Real Radius);
		%feature("compactdefaultargs") BRepPrim_Cylinder;
		%feature("autodoc", "	* create a Cylinder at origin on Z axis, of height H and radius R Error : Radius < Resolution H < Resolution H negative

	:param R:
	:type R: float
	:param H:
	:type H: float
	:rtype: None
") BRepPrim_Cylinder;
		 BRepPrim_Cylinder (const Standard_Real R,const Standard_Real H);
		%feature("compactdefaultargs") BRepPrim_Cylinder;
		%feature("autodoc", "	* same as above but at a given point

	:param Center:
	:type Center: gp_Pnt
	:param R:
	:type R: float
	:param H:
	:type H: float
	:rtype: None
") BRepPrim_Cylinder;
		 BRepPrim_Cylinder (const gp_Pnt & Center,const Standard_Real R,const Standard_Real H);
		%feature("compactdefaultargs") MakeEmptyLateralFace;
		%feature("autodoc", "	* The surface normal should be directed towards the outside.

	:rtype: TopoDS_Face
") MakeEmptyLateralFace;
		virtual TopoDS_Face MakeEmptyLateralFace ();
};


%extend BRepPrim_Cylinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepPrim_Sphere;
class BRepPrim_Sphere : public BRepPrim_Revolution {
	public:
		%feature("compactdefaultargs") BRepPrim_Sphere;
		%feature("autodoc", "	* Creates a Sphere at origin with Radius. The axes of the sphere are the reference axes. An error is raised if the radius is < Resolution.

	:param Radius:
	:type Radius: float
	:rtype: None
") BRepPrim_Sphere;
		 BRepPrim_Sphere (const Standard_Real Radius);
		%feature("compactdefaultargs") BRepPrim_Sphere;
		%feature("autodoc", "	* Creates a Sphere with Center and Radius. Axes are the referrence axes. This is the STEP constructor.

	:param Center:
	:type Center: gp_Pnt
	:param Radius:
	:type Radius: float
	:rtype: None
") BRepPrim_Sphere;
		 BRepPrim_Sphere (const gp_Pnt & Center,const Standard_Real Radius);
		%feature("compactdefaultargs") BRepPrim_Sphere;
		%feature("autodoc", "	* Creates a sphere with given axes system.

	:param Axes:
	:type Axes: gp_Ax2
	:param Radius:
	:type Radius: float
	:rtype: None
") BRepPrim_Sphere;
		 BRepPrim_Sphere (const gp_Ax2 & Axes,const Standard_Real Radius);
		%feature("compactdefaultargs") MakeEmptyLateralFace;
		%feature("autodoc", "	* The surface normal should be directed towards the outside.

	:rtype: TopoDS_Face
") MakeEmptyLateralFace;
		virtual TopoDS_Face MakeEmptyLateralFace ();
};


%extend BRepPrim_Sphere {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepPrim_Torus;
class BRepPrim_Torus : public BRepPrim_Revolution {
	public:
		%feature("compactdefaultargs") BRepPrim_Torus;
		%feature("autodoc", "	* the STEP definition Position : center and axes Major, Minor : Radii //! Errors : Major < Resolution Minor < Resolution

	:param Position:
	:type Position: gp_Ax2
	:param Major:
	:type Major: float
	:param Minor:
	:type Minor: float
	:rtype: None
") BRepPrim_Torus;
		 BRepPrim_Torus (const gp_Ax2 & Position,const Standard_Real Major,const Standard_Real Minor);
		%feature("compactdefaultargs") BRepPrim_Torus;
		%feature("autodoc", "	* Torus centered at origin

	:param Major:
	:type Major: float
	:param Minor:
	:type Minor: float
	:rtype: None
") BRepPrim_Torus;
		 BRepPrim_Torus (const Standard_Real Major,const Standard_Real Minor);
		%feature("compactdefaultargs") BRepPrim_Torus;
		%feature("autodoc", "	* Torus at Center

	:param Center:
	:type Center: gp_Pnt
	:param Major:
	:type Major: float
	:param Minor:
	:type Minor: float
	:rtype: None
") BRepPrim_Torus;
		 BRepPrim_Torus (const gp_Pnt & Center,const Standard_Real Major,const Standard_Real Minor);
		%feature("compactdefaultargs") MakeEmptyLateralFace;
		%feature("autodoc", "	* The surface normal should be directed towards the outside.

	:rtype: TopoDS_Face
") MakeEmptyLateralFace;
		virtual TopoDS_Face MakeEmptyLateralFace ();
};


%extend BRepPrim_Torus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
