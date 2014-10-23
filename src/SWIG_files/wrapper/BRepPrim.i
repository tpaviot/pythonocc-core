/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include BRepPrim_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor BRepPrim_Builder;
class BRepPrim_Builder {
	public:
		%feature("autodoc", "	* Creates an empty, useless Builder. Necesseray for compilation.

	:rtype: None
") BRepPrim_Builder;
		 BRepPrim_Builder ();
		%feature("autodoc", "	* Creates from a Builder.

	:param B:
	:type B: BRep_Builder &
	:rtype: None
") BRepPrim_Builder;
		 BRepPrim_Builder (const BRep_Builder & B);
		%feature("autodoc", "	:rtype: BRep_Builder
") Builder;
		const BRep_Builder & Builder ();
		%feature("autodoc", "	* Make a empty Shell.

	:param S:
	:type S: TopoDS_Shell &
	:rtype: None
") MakeShell;
		void MakeShell (TopoDS_Shell & S);
		%feature("autodoc", "	* Returns in <F> a Face built with the plane equation <P>. Used by all primitives.

	:param F:
	:type F: TopoDS_Face &
	:param P:
	:type P: gp_Pln
	:rtype: None
") MakeFace;
		void MakeFace (TopoDS_Face & F,const gp_Pln & P);
		%feature("autodoc", "	* Returns in <W> an empty Wire.

	:param W:
	:type W: TopoDS_Wire &
	:rtype: None
") MakeWire;
		void MakeWire (TopoDS_Wire & W);
		%feature("autodoc", "	* Returns in <E> a degenerated edge.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") MakeDegeneratedEdge;
		void MakeDegeneratedEdge (TopoDS_Edge & E);
		%feature("autodoc", "	* Returns in <E> an Edge built with the line equation <L>.

	:param E:
	:type E: TopoDS_Edge &
	:param L:
	:type L: gp_Lin
	:rtype: None
") MakeEdge;
		void MakeEdge (TopoDS_Edge & E,const gp_Lin & L);
		%feature("autodoc", "	* Returns in <E> an Edge built with the circle equation <C>.

	:param E:
	:type E: TopoDS_Edge &
	:param C:
	:type C: gp_Circ
	:rtype: None
") MakeEdge;
		void MakeEdge (TopoDS_Edge & E,const gp_Circ & C);
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
		%feature("autodoc", "	* Returns in <V> a Vertex built with the point <P>.

	:param V:
	:type V: TopoDS_Vertex &
	:param P:
	:type P: gp_Pnt
	:rtype: None
") MakeVertex;
		void MakeVertex (TopoDS_Vertex & V,const gp_Pnt & P);
		%feature("autodoc", "	* Reverses the Face <F>.

	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") ReverseFace;
		void ReverseFace (TopoDS_Face & F);
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
		%feature("autodoc", "	* Adds the Wire <W> in the Face <F>.

	:param F:
	:type F: TopoDS_Face &
	:param W:
	:type W: TopoDS_Wire &
	:rtype: None
") AddFaceWire;
		void AddFaceWire (TopoDS_Face & F,const TopoDS_Wire & W);
		%feature("autodoc", "	* Adds the Face <F> in the Shell <Sh>.

	:param Sh:
	:type Sh: TopoDS_Shell &
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") AddShellFace;
		void AddShellFace (TopoDS_Shell & Sh,const TopoDS_Face & F);
		%feature("autodoc", "	* This is called once an edge is completed. It gives the opportunity to perform any post treatment.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") CompleteEdge;
		void CompleteEdge (TopoDS_Edge & E);
		%feature("autodoc", "	* This is called once a wire is completed. It gives the opportunity to perform any post treatment.

	:param W:
	:type W: TopoDS_Wire &
	:rtype: None
") CompleteWire;
		void CompleteWire (TopoDS_Wire & W);
		%feature("autodoc", "	* This is called once a face is completed. It gives the opportunity to perform any post treatment.

	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") CompleteFace;
		void CompleteFace (TopoDS_Face & F);
		%feature("autodoc", "	* This is called once a shell is completed. It gives the opportunity to perform any post treatment.

	:param S:
	:type S: TopoDS_Shell &
	:rtype: None
") CompleteShell;
		void CompleteShell (TopoDS_Shell & S);
};


%feature("shadow") BRepPrim_Builder::~BRepPrim_Builder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepPrim_Builder {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepPrim_FaceBuilder;
class BRepPrim_FaceBuilder {
	public:
		%feature("autodoc", "	:rtype: None
") BRepPrim_FaceBuilder;
		 BRepPrim_FaceBuilder ();
		%feature("autodoc", "	:param B:
	:type B: BRep_Builder &
	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: None
") BRepPrim_FaceBuilder;
		 BRepPrim_FaceBuilder (const BRep_Builder & B,const Handle_Geom_Surface & S);
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
		%feature("autodoc", "	:param B:
	:type B: BRep_Builder &
	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: None
") Init;
		void Init (const BRep_Builder & B,const Handle_Geom_Surface & S);
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
		%feature("autodoc", "	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face  Face ();
		%feature("autodoc", "	:rtype: 
") operatorTopoDS_Face;
		 operator TopoDS_Face ();
		%feature("autodoc", "	* Returns the edge of index <I> 1 - Edge VMin 2 - Edge UMax 3 - Edge VMax 4 - Edge UMin

	:param I:
	:type I: Standard_Integer
	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge  Edge (const Standard_Integer I);
		%feature("autodoc", "	* Returns the vertex of index <I> 1 - Vertex UMin,VMin 2 - Vertex UMax,VMin 3 - Vertex UMax,VMax 4 - Vertex UMin,VMax

	:param I:
	:type I: Standard_Integer
	:rtype: TopoDS_Vertex
") Vertex;
		const TopoDS_Vertex  Vertex (const Standard_Integer I);
};


%feature("shadow") BRepPrim_FaceBuilder::~BRepPrim_FaceBuilder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepPrim_FaceBuilder {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepPrim_GWedge;
class BRepPrim_GWedge {
	public:
		%feature("autodoc", "	:param B:
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
		%feature("autodoc", "	:param B:
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
		%feature("autodoc", "	:param B:
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
		%feature("autodoc", "	:rtype: gp_Ax2
") Axes;
		gp_Ax2 Axes ();
		%feature("autodoc", "	:rtype: float
") GetXMin;
		Standard_Real GetXMin ();
		%feature("autodoc", "	:rtype: float
") GetYMin;
		Standard_Real GetYMin ();
		%feature("autodoc", "	:rtype: float
") GetZMin;
		Standard_Real GetZMin ();
		%feature("autodoc", "	:rtype: float
") GetZ2Min;
		Standard_Real GetZ2Min ();
		%feature("autodoc", "	:rtype: float
") GetX2Min;
		Standard_Real GetX2Min ();
		%feature("autodoc", "	:rtype: float
") GetXMax;
		Standard_Real GetXMax ();
		%feature("autodoc", "	:rtype: float
") GetYMax;
		Standard_Real GetYMax ();
		%feature("autodoc", "	:rtype: float
") GetZMax;
		Standard_Real GetZMax ();
		%feature("autodoc", "	:rtype: float
") GetZ2Max;
		Standard_Real GetZ2Max ();
		%feature("autodoc", "	:rtype: float
") GetX2Max;
		Standard_Real GetX2Max ();
		%feature("autodoc", "	:param d1:
	:type d1: Primitives_Direction
	:rtype: None
") Open;
		void Open (const Primitives_Direction d1);
		%feature("autodoc", "	:param d1:
	:type d1: Primitives_Direction
	:rtype: None
") Close;
		void Close (const Primitives_Direction d1);
		%feature("autodoc", "	:param d1:
	:type d1: Primitives_Direction
	:rtype: bool
") IsInfinite;
		Standard_Boolean IsInfinite (const Primitives_Direction d1);
		%feature("autodoc", "	:rtype: TopoDS_Shell
") Shell;
		const TopoDS_Shell  Shell ();
		%feature("autodoc", "	:param d1:
	:type d1: Primitives_Direction
	:rtype: bool
") HasFace;
		Standard_Boolean HasFace (const Primitives_Direction d1);
		%feature("autodoc", "	:param d1:
	:type d1: Primitives_Direction
	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face  Face (const Primitives_Direction d1);
		%feature("autodoc", "	:param d1:
	:type d1: Primitives_Direction
	:rtype: gp_Pln
") Plane;
		gp_Pln Plane (const Primitives_Direction d1);
		%feature("autodoc", "	:param d1:
	:type d1: Primitives_Direction
	:rtype: bool
") HasWire;
		Standard_Boolean HasWire (const Primitives_Direction d1);
		%feature("autodoc", "	:param d1:
	:type d1: Primitives_Direction
	:rtype: TopoDS_Wire
") Wire;
		const TopoDS_Wire  Wire (const Primitives_Direction d1);
		%feature("autodoc", "	:param d1:
	:type d1: Primitives_Direction
	:param d2:
	:type d2: Primitives_Direction
	:rtype: bool
") HasEdge;
		Standard_Boolean HasEdge (const Primitives_Direction d1,const Primitives_Direction d2);
		%feature("autodoc", "	:param d1:
	:type d1: Primitives_Direction
	:param d2:
	:type d2: Primitives_Direction
	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge  Edge (const Primitives_Direction d1,const Primitives_Direction d2);
		%feature("autodoc", "	:param d1:
	:type d1: Primitives_Direction
	:param d2:
	:type d2: Primitives_Direction
	:rtype: gp_Lin
") Line;
		gp_Lin Line (const Primitives_Direction d1,const Primitives_Direction d2);
		%feature("autodoc", "	:param d1:
	:type d1: Primitives_Direction
	:param d2:
	:type d2: Primitives_Direction
	:param d3:
	:type d3: Primitives_Direction
	:rtype: bool
") HasVertex;
		Standard_Boolean HasVertex (const Primitives_Direction d1,const Primitives_Direction d2,const Primitives_Direction d3);
		%feature("autodoc", "	:param d1:
	:type d1: Primitives_Direction
	:param d2:
	:type d2: Primitives_Direction
	:param d3:
	:type d3: Primitives_Direction
	:rtype: TopoDS_Vertex
") Vertex;
		const TopoDS_Vertex  Vertex (const Primitives_Direction d1,const Primitives_Direction d2,const Primitives_Direction d3);
		%feature("autodoc", "	:param d1:
	:type d1: Primitives_Direction
	:param d2:
	:type d2: Primitives_Direction
	:param d3:
	:type d3: Primitives_Direction
	:rtype: gp_Pnt
") Point;
		gp_Pnt Point (const Primitives_Direction d1,const Primitives_Direction d2,const Primitives_Direction d3);
};


%feature("shadow") BRepPrim_GWedge::~BRepPrim_GWedge %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepPrim_GWedge {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepPrim_OneAxis;
class BRepPrim_OneAxis {
	public:
		%feature("autodoc", "	:rtype: void
") Delete;
		virtual void Delete ();
		%feature("autodoc", "	:param MeridianOffset: default value is 0
	:type MeridianOffset: float
	:rtype: None
") SetMeridianOffset;
		void SetMeridianOffset (const Standard_Real MeridianOffset = 0);
		%feature("autodoc", "	:rtype: gp_Ax2
") Axes;
		const gp_Ax2  Axes ();
		%feature("autodoc", "	:param A:
	:type A: gp_Ax2
	:rtype: None
") Axes;
		void Axes (const gp_Ax2 & A);
		%feature("autodoc", "	:rtype: float
") Angle;
		Standard_Real Angle ();
		%feature("autodoc", "	:param A:
	:type A: float
	:rtype: None
") Angle;
		void Angle (const Standard_Real A);
		%feature("autodoc", "	:rtype: float
") VMin;
		Standard_Real VMin ();
		%feature("autodoc", "	:param V:
	:type V: float
	:rtype: None
") VMin;
		void VMin (const Standard_Real V);
		%feature("autodoc", "	:rtype: float
") VMax;
		Standard_Real VMax ();
		%feature("autodoc", "	:param V:
	:type V: float
	:rtype: None
") VMax;
		void VMax (const Standard_Real V);
		%feature("autodoc", "	:rtype: TopoDS_Face
") MakeEmptyLateralFace;
		virtual TopoDS_Face MakeEmptyLateralFace ();
		%feature("autodoc", "	:param Ang:
	:type Ang: float
	:rtype: TopoDS_Edge
") MakeEmptyMeridianEdge;
		virtual TopoDS_Edge MakeEmptyMeridianEdge (const Standard_Real Ang);
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:rtype: void
") SetMeridianPCurve;
		virtual void SetMeridianPCurve (TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "	:param V:
	:type V: float
	:rtype: gp_Pnt2d
") MeridianValue;
		virtual gp_Pnt2d MeridianValue (const Standard_Real V);
		%feature("autodoc", "	:param V:
	:type V: float
	:rtype: bool
") MeridianOnAxis;
		virtual Standard_Boolean MeridianOnAxis (const Standard_Real V);
		%feature("autodoc", "	:rtype: bool
") MeridianClosed;
		virtual Standard_Boolean MeridianClosed ();
		%feature("autodoc", "	:rtype: bool
") VMaxInfinite;
		virtual Standard_Boolean VMaxInfinite ();
		%feature("autodoc", "	:rtype: bool
") VMinInfinite;
		virtual Standard_Boolean VMinInfinite ();
		%feature("autodoc", "	:rtype: bool
") HasTop;
		virtual Standard_Boolean HasTop ();
		%feature("autodoc", "	:rtype: bool
") HasBottom;
		virtual Standard_Boolean HasBottom ();
		%feature("autodoc", "	:rtype: bool
") HasSides;
		virtual Standard_Boolean HasSides ();
		%feature("autodoc", "	:rtype: TopoDS_Shell
") Shell;
		const TopoDS_Shell  Shell ();
		%feature("autodoc", "	:rtype: TopoDS_Face
") LateralFace;
		const TopoDS_Face  LateralFace ();
		%feature("autodoc", "	:rtype: TopoDS_Face
") TopFace;
		const TopoDS_Face  TopFace ();
		%feature("autodoc", "	:rtype: TopoDS_Face
") BottomFace;
		const TopoDS_Face  BottomFace ();
		%feature("autodoc", "	:rtype: TopoDS_Face
") StartFace;
		const TopoDS_Face  StartFace ();
		%feature("autodoc", "	:rtype: TopoDS_Face
") EndFace;
		const TopoDS_Face  EndFace ();
		%feature("autodoc", "	:rtype: TopoDS_Wire
") LateralWire;
		const TopoDS_Wire  LateralWire ();
		%feature("autodoc", "	:rtype: TopoDS_Wire
") LateralStartWire;
		const TopoDS_Wire  LateralStartWire ();
		%feature("autodoc", "	:rtype: TopoDS_Wire
") LateralEndWire;
		const TopoDS_Wire  LateralEndWire ();
		%feature("autodoc", "	:rtype: TopoDS_Wire
") TopWire;
		const TopoDS_Wire  TopWire ();
		%feature("autodoc", "	:rtype: TopoDS_Wire
") BottomWire;
		const TopoDS_Wire  BottomWire ();
		%feature("autodoc", "	:rtype: TopoDS_Wire
") StartWire;
		const TopoDS_Wire  StartWire ();
		%feature("autodoc", "	:rtype: TopoDS_Wire
") AxisStartWire;
		const TopoDS_Wire  AxisStartWire ();
		%feature("autodoc", "	:rtype: TopoDS_Wire
") EndWire;
		const TopoDS_Wire  EndWire ();
		%feature("autodoc", "	:rtype: TopoDS_Wire
") AxisEndWire;
		const TopoDS_Wire  AxisEndWire ();
		%feature("autodoc", "	:rtype: TopoDS_Edge
") AxisEdge;
		const TopoDS_Edge  AxisEdge ();
		%feature("autodoc", "	:rtype: TopoDS_Edge
") StartEdge;
		const TopoDS_Edge  StartEdge ();
		%feature("autodoc", "	:rtype: TopoDS_Edge
") EndEdge;
		const TopoDS_Edge  EndEdge ();
		%feature("autodoc", "	:rtype: TopoDS_Edge
") StartTopEdge;
		const TopoDS_Edge  StartTopEdge ();
		%feature("autodoc", "	:rtype: TopoDS_Edge
") StartBottomEdge;
		const TopoDS_Edge  StartBottomEdge ();
		%feature("autodoc", "	:rtype: TopoDS_Edge
") EndTopEdge;
		const TopoDS_Edge  EndTopEdge ();
		%feature("autodoc", "	:rtype: TopoDS_Edge
") EndBottomEdge;
		const TopoDS_Edge  EndBottomEdge ();
		%feature("autodoc", "	:rtype: TopoDS_Edge
") TopEdge;
		const TopoDS_Edge  TopEdge ();
		%feature("autodoc", "	:rtype: TopoDS_Edge
") BottomEdge;
		const TopoDS_Edge  BottomEdge ();
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") AxisTopVertex;
		const TopoDS_Vertex  AxisTopVertex ();
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") AxisBottomVertex;
		const TopoDS_Vertex  AxisBottomVertex ();
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") TopStartVertex;
		const TopoDS_Vertex  TopStartVertex ();
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") TopEndVertex;
		const TopoDS_Vertex  TopEndVertex ();
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") BottomStartVertex;
		const TopoDS_Vertex  BottomStartVertex ();
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") BottomEndVertex;
		const TopoDS_Vertex  BottomEndVertex ();
};


%feature("shadow") BRepPrim_OneAxis::~BRepPrim_OneAxis %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepPrim_OneAxis {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepPrim_Revolution;
class BRepPrim_Revolution : public BRepPrim_OneAxis {
	public:
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
		%feature("autodoc", "	* The surface normal should be directed towards the outside.

	:rtype: TopoDS_Face
") MakeEmptyLateralFace;
		virtual TopoDS_Face MakeEmptyLateralFace ();
		%feature("autodoc", "	* Returns an edge with a 3D curve made from the meridian in the XZ plane rotated by <Ang> around the Z-axis. Ang may be 0 or myAngle.

	:param Ang:
	:type Ang: float
	:rtype: TopoDS_Edge
") MakeEmptyMeridianEdge;
		virtual TopoDS_Edge MakeEmptyMeridianEdge (const Standard_Real Ang);
		%feature("autodoc", "	* Returns the meridian point at parameter <V> in the plane XZ.

	:param V:
	:type V: float
	:rtype: gp_Pnt2d
") MeridianValue;
		virtual gp_Pnt2d MeridianValue (const Standard_Real V);
		%feature("autodoc", "	* Sets the parametric urve of the edge <E> in the face <F> to be the 2d representation of the meridian.

	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:rtype: void
") SetMeridianPCurve;
		virtual void SetMeridianPCurve (TopoDS_Edge & E,const TopoDS_Face & F);
};


%feature("shadow") BRepPrim_Revolution::~BRepPrim_Revolution %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepPrim_Revolution {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepPrim_Wedge;
class BRepPrim_Wedge : public BRepPrim_GWedge {
	public:
		%feature("autodoc", "	* Creates a Wedge algorithm. <Axes> is the axis system for the primitive.  XMin, YMin, ZMin are set to 0 XMax, YMax, ZMax are set to dx, dy, dz Z2Min = ZMin Z2Max = ZMax X2Min = XMin X2Max = XMax The result is a box dx,dy,dz should be positive

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
		%feature("autodoc", "	* Creates a Wedge primitive. <Axes> is the axis system for the primitive.  XMin, YMin, ZMin are set to 0 XMax, YMax, ZMax are set to dx, dy, dz Z2Min = ZMin Z2Max = ZMax X2Min = ltx X2Max = ltx The result is a STEP right angular wedge dx,dy,dz should be positive ltx should not be negative

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
		%feature("autodoc", "	* Create a Wedge primitive. <Axes> is the axis system for the primitive.  all the fields are set to the corresponding value XYZMax - XYZMin should be positive ZX2Max - ZX2Min should not be negative

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


%feature("shadow") BRepPrim_Wedge::~BRepPrim_Wedge %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepPrim_Wedge {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepPrim_Cone;
class BRepPrim_Cone : public BRepPrim_Revolution {
	public:
		%feature("autodoc", "	* the STEP definition Angle = semi-angle of the cone Position : the coordinate system Height : height of the cone. Radius : radius of truncated face at z = 0  The apex is on z < 0  Errors : Height < Resolution  Angle < Resolution / Height  Angle > PI/2 - Resolution / Height

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
		%feature("autodoc", "	* infinite cone at origin on Z negative

	:param Angle:
	:type Angle: float
	:rtype: None
") BRepPrim_Cone;
		 BRepPrim_Cone (const Standard_Real Angle);
		%feature("autodoc", "	* infinite cone at Apex on Z negative

	:param Angle:
	:type Angle: float
	:param Apex:
	:type Apex: gp_Pnt
	:rtype: None
") BRepPrim_Cone;
		 BRepPrim_Cone (const Standard_Real Angle,const gp_Pnt & Apex);
		%feature("autodoc", "	* infinite cone with Axes

	:param Angle:
	:type Angle: float
	:param Axes:
	:type Axes: gp_Ax2
	:rtype: None
") BRepPrim_Cone;
		 BRepPrim_Cone (const Standard_Real Angle,const gp_Ax2 & Axes);
		%feature("autodoc", "	* create a Cone at origin on Z axis, of height H, radius R1 at Z = 0, R2 at Z = H, X is the origin of angles. If R1 or R2 is 0 there is an apex. Otherwise, it is a truncated cone.  Error : R1 and R2 < Resolution R1 or R2 negative Abs(R1-R2) < Resolution H < Resolution H negative

	:param R1:
	:type R1: float
	:param R2:
	:type R2: float
	:param H:
	:type H: float
	:rtype: None
") BRepPrim_Cone;
		 BRepPrim_Cone (const Standard_Real R1,const Standard_Real R2,const Standard_Real H);
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
		%feature("autodoc", "	* The surface normal should be directed towards the outside.

	:rtype: TopoDS_Face
") MakeEmptyLateralFace;
		virtual TopoDS_Face MakeEmptyLateralFace ();
};


%feature("shadow") BRepPrim_Cone::~BRepPrim_Cone %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepPrim_Cone {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepPrim_Cylinder;
class BRepPrim_Cylinder : public BRepPrim_Revolution {
	public:
		%feature("autodoc", "	* the STEP definition Position : center of a Face and Axis Radius : radius of cylinder Height : distance between faces on positive side  Errors : Height < Resolution Radius < Resolution

	:param Position:
	:type Position: gp_Ax2
	:param Radius:
	:type Radius: float
	:param Height:
	:type Height: float
	:rtype: None
") BRepPrim_Cylinder;
		 BRepPrim_Cylinder (const gp_Ax2 & Position,const Standard_Real Radius,const Standard_Real Height);
		%feature("autodoc", "	* infinite Cylinder at origin on Z negative

	:param Radius:
	:type Radius: float
	:rtype: None
") BRepPrim_Cylinder;
		 BRepPrim_Cylinder (const Standard_Real Radius);
		%feature("autodoc", "	* infinite Cylinder at Center on Z negative

	:param Center:
	:type Center: gp_Pnt
	:param Radius:
	:type Radius: float
	:rtype: None
") BRepPrim_Cylinder;
		 BRepPrim_Cylinder (const gp_Pnt & Center,const Standard_Real Radius);
		%feature("autodoc", "	* infinite Cylinder at Axes on Z negative

	:param Axes:
	:type Axes: gp_Ax2
	:param Radius:
	:type Radius: float
	:rtype: None
") BRepPrim_Cylinder;
		 BRepPrim_Cylinder (const gp_Ax2 & Axes,const Standard_Real Radius);
		%feature("autodoc", "	* create a Cylinder at origin on Z axis, of height H and radius R Error : Radius < Resolution H < Resolution H negative

	:param R:
	:type R: float
	:param H:
	:type H: float
	:rtype: None
") BRepPrim_Cylinder;
		 BRepPrim_Cylinder (const Standard_Real R,const Standard_Real H);
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
		%feature("autodoc", "	* The surface normal should be directed towards the outside.

	:rtype: TopoDS_Face
") MakeEmptyLateralFace;
		virtual TopoDS_Face MakeEmptyLateralFace ();
};


%feature("shadow") BRepPrim_Cylinder::~BRepPrim_Cylinder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepPrim_Cylinder {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepPrim_Sphere;
class BRepPrim_Sphere : public BRepPrim_Revolution {
	public:
		%feature("autodoc", "	* Creates a Sphere at origin with Radius. The axes of the sphere are the reference axes. An error is raised if the radius is < Resolution.

	:param Radius:
	:type Radius: float
	:rtype: None
") BRepPrim_Sphere;
		 BRepPrim_Sphere (const Standard_Real Radius);
		%feature("autodoc", "	* Creates a Sphere with Center and Radius. Axes are the referrence axes. This is the STEP constructor.

	:param Center:
	:type Center: gp_Pnt
	:param Radius:
	:type Radius: float
	:rtype: None
") BRepPrim_Sphere;
		 BRepPrim_Sphere (const gp_Pnt & Center,const Standard_Real Radius);
		%feature("autodoc", "	* Creates a sphere with given axes system.

	:param Axes:
	:type Axes: gp_Ax2
	:param Radius:
	:type Radius: float
	:rtype: None
") BRepPrim_Sphere;
		 BRepPrim_Sphere (const gp_Ax2 & Axes,const Standard_Real Radius);
		%feature("autodoc", "	* The surface normal should be directed towards the outside.

	:rtype: TopoDS_Face
") MakeEmptyLateralFace;
		virtual TopoDS_Face MakeEmptyLateralFace ();
};


%feature("shadow") BRepPrim_Sphere::~BRepPrim_Sphere %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepPrim_Sphere {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepPrim_Torus;
class BRepPrim_Torus : public BRepPrim_Revolution {
	public:
		%feature("autodoc", "	* the STEP definition Position : center and axes Major, Minor : Radii  Errors : Major < Resolution Minor < Resolution

	:param Position:
	:type Position: gp_Ax2
	:param Major:
	:type Major: float
	:param Minor:
	:type Minor: float
	:rtype: None
") BRepPrim_Torus;
		 BRepPrim_Torus (const gp_Ax2 & Position,const Standard_Real Major,const Standard_Real Minor);
		%feature("autodoc", "	* Torus centered at origin

	:param Major:
	:type Major: float
	:param Minor:
	:type Minor: float
	:rtype: None
") BRepPrim_Torus;
		 BRepPrim_Torus (const Standard_Real Major,const Standard_Real Minor);
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
		%feature("autodoc", "	* The surface normal should be directed towards the outside.

	:rtype: TopoDS_Face
") MakeEmptyLateralFace;
		virtual TopoDS_Face MakeEmptyLateralFace ();
};


%feature("shadow") BRepPrim_Torus::~BRepPrim_Torus %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepPrim_Torus {
	void _kill_pointed() {
		delete $self;
	}
};
