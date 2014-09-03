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
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty, useless  Builder. Necesseray for  
         compilation.") BRepPrim_Builder;
		 BRepPrim_Builder ();
		%feature("autodoc", "Args:
	B(BRep_Builder)

Returns:
	None

Creates from a Builder.") BRepPrim_Builder;
		 BRepPrim_Builder (const BRep_Builder & B);
		%feature("autodoc", "Args:
	None
Returns:
	BRep_Builder

No detailed docstring for this function.") Builder;
		const BRep_Builder & Builder ();
		%feature("autodoc", "Args:
	S(TopoDS_Shell)

Returns:
	None

Make a empty Shell.") MakeShell;
		void MakeShell (TopoDS_Shell & S);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	P(gp_Pln)

Returns:
	None

Returns in   <F> a  Face  built  with   the  plane  
         equation <P>. Used by all primitives.") MakeFace;
		void MakeFace (TopoDS_Face & F,const gp_Pln & P);
		%feature("autodoc", "Args:
	W(TopoDS_Wire)

Returns:
	None

Returns in <W> an empty Wire.") MakeWire;
		void MakeWire (TopoDS_Wire & W);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	None

Returns in <E> a degenerated edge.") MakeDegeneratedEdge;
		void MakeDegeneratedEdge (TopoDS_Edge & E);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	L(gp_Lin)

Returns:
	None

Returns   in <E>  an  Edge  built  with  the  line  
         equation  <L>.") MakeEdge;
		void MakeEdge (TopoDS_Edge & E,const gp_Lin & L);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	C(gp_Circ)

Returns:
	None

Returns  in <E>   an  Edge  built  with the circle  
         equation  <C>.") MakeEdge;
		void MakeEdge (TopoDS_Edge & E,const gp_Circ & C);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)
	L(gp_Lin2d)

Returns:
	None

Sets the line <L> to be the curve representing the  
         edge <E> in the parametric space of the surface of  
         <F>.") SetPCurve;
		void SetPCurve (TopoDS_Edge & E,const TopoDS_Face & F,const gp_Lin2d & L);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)
	L1(gp_Lin2d)
	L2(gp_Lin2d)

Returns:
	None

Sets the    lines  <L1,L2>  to   be     the curves  
         representing the edge <E>  in the parametric space  
         of the closed surface of <F>.") SetPCurve;
		void SetPCurve (TopoDS_Edge & E,const TopoDS_Face & F,const gp_Lin2d & L1,const gp_Lin2d & L2);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)
	C(gp_Circ2d)

Returns:
	None

Sets the  circle <C> to  be the curve representing  
         the  edge <E>  in   the  parametric  space of  the  
         surface of <F>.") SetPCurve;
		void SetPCurve (TopoDS_Edge & E,const TopoDS_Face & F,const gp_Circ2d & C);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	P(gp_Pnt)

Returns:
	None

Returns in <V> a Vertex built with the point <P>.") MakeVertex;
		void MakeVertex (TopoDS_Vertex & V,const gp_Pnt & P);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

Reverses the Face <F>.") ReverseFace;
		void ReverseFace (TopoDS_Face & F);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	V(TopoDS_Vertex)
	P(Standard_Real)
	direct(Standard_Boolean)

Returns:
	None

Adds the Vertex <V> in the Edge <E>.  <P> is the  
         parameter of the vertex on the  edge.  If direct  
         is False the Vertex is reversed.") AddEdgeVertex;
		void AddEdgeVertex (TopoDS_Edge & E,const TopoDS_Vertex & V,const Standard_Real P,const Standard_Boolean direct);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	V(TopoDS_Vertex)
	P1(Standard_Real)
	P2(Standard_Real)

Returns:
	None

Adds  the Vertex <V>  in the Edge <E>.   <P1,P2>  
         are the  parameters of the  vertex on the closed  
         edge.") AddEdgeVertex;
		void AddEdgeVertex (TopoDS_Edge & E,const TopoDS_Vertex & V,const Standard_Real P1,const Standard_Real P2);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	V(TopoDS_Vertex)
	P1(Standard_Real)
	P2(Standard_Real)

Returns:
	None

<P1,P2> are the parameters of the  vertex on the  
         edge.  The edge is a closed curve.") SetParameters;
		void SetParameters (TopoDS_Edge & E,const TopoDS_Vertex & V,const Standard_Real P1,const Standard_Real P2);
		%feature("autodoc", "Args:
	W(TopoDS_Wire)
	E(TopoDS_Edge)
	direct(Standard_Boolean)

Returns:
	None

Adds the Edge <E> in the  Wire <W>, if direct is  
         False the Edge is reversed.") AddWireEdge;
		void AddWireEdge (TopoDS_Wire & W,const TopoDS_Edge & E,const Standard_Boolean direct);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	W(TopoDS_Wire)

Returns:
	None

Adds the Wire <W> in  the Face <F>.") AddFaceWire;
		void AddFaceWire (TopoDS_Face & F,const TopoDS_Wire & W);
		%feature("autodoc", "Args:
	Sh(TopoDS_Shell)
	F(TopoDS_Face)

Returns:
	None

Adds the Face <F>  in the Shell <Sh>.") AddShellFace;
		void AddShellFace (TopoDS_Shell & Sh,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	None

This is called once an edge is completed. It gives  
         the opportunity to perform any post treatment.") CompleteEdge;
		void CompleteEdge (TopoDS_Edge & E);
		%feature("autodoc", "Args:
	W(TopoDS_Wire)

Returns:
	None

This is called once a wire is  completed. It gives  
         the opportunity to perform any post treatment.") CompleteWire;
		void CompleteWire (TopoDS_Wire & W);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

This is called once a face is  completed. It gives  
         the opportunity to perform any post treatment.") CompleteFace;
		void CompleteFace (TopoDS_Face & F);
		%feature("autodoc", "Args:
	S(TopoDS_Shell)

Returns:
	None

This is called once a shell is  completed. It gives  
         the opportunity to perform any post treatment.") CompleteShell;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepPrim_FaceBuilder;
		 BRepPrim_FaceBuilder ();
		%feature("autodoc", "Args:
	B(BRep_Builder)
	S(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") BRepPrim_FaceBuilder;
		 BRepPrim_FaceBuilder (const BRep_Builder & B,const Handle_Geom_Surface & S);
		%feature("autodoc", "Args:
	B(BRep_Builder)
	S(Handle_Geom_Surface)
	UMin(Standard_Real)
	UMax(Standard_Real)
	VMin(Standard_Real)
	VMax(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepPrim_FaceBuilder;
		 BRepPrim_FaceBuilder (const BRep_Builder & B,const Handle_Geom_Surface & S,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax);
		%feature("autodoc", "Args:
	B(BRep_Builder)
	S(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const BRep_Builder & B,const Handle_Geom_Surface & S);
		%feature("autodoc", "Args:
	B(BRep_Builder)
	S(Handle_Geom_Surface)
	UMin(Standard_Real)
	UMax(Standard_Real)
	VMin(Standard_Real)
	VMax(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const BRep_Builder & B,const Handle_Geom_Surface & S,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

No detailed docstring for this function.") Face;
		const TopoDS_Face & Face ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorTopoDS_Face;
		 operator TopoDS_Face ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Edge

Returns the edge of index <I>  
         1 - Edge VMin  
         2 - Edge UMax  
         3 - Edge VMax  
         4 - Edge UMin") Edge;
		const TopoDS_Edge & Edge (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Vertex

Returns the vertex of index <I>  
         1 - Vertex UMin,VMin  
         2 - Vertex UMax,VMin  
         3 - Vertex UMax,VMax  
         4 - Vertex UMin,VMax") Vertex;
		const TopoDS_Vertex & Vertex (const Standard_Integer I);
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
		%feature("autodoc", "Args:
	B(BRepPrim_Builder)
	Axes(gp_Ax2)
	dx(Standard_Real)
	dy(Standard_Real)
	dz(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepPrim_GWedge;
		 BRepPrim_GWedge (const BRepPrim_Builder & B,const gp_Ax2 & Axes,const Standard_Real dx,const Standard_Real dy,const Standard_Real dz);
		%feature("autodoc", "Args:
	B(BRepPrim_Builder)
	Axes(gp_Ax2)
	dx(Standard_Real)
	dy(Standard_Real)
	dz(Standard_Real)
	ltx(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepPrim_GWedge;
		 BRepPrim_GWedge (const BRepPrim_Builder & B,const gp_Ax2 & Axes,const Standard_Real dx,const Standard_Real dy,const Standard_Real dz,const Standard_Real ltx);
		%feature("autodoc", "Args:
	B(BRepPrim_Builder)
	Axes(gp_Ax2)
	xmin(Standard_Real)
	ymin(Standard_Real)
	zmin(Standard_Real)
	z2min(Standard_Real)
	x2min(Standard_Real)
	xmax(Standard_Real)
	ymax(Standard_Real)
	zmax(Standard_Real)
	z2max(Standard_Real)
	x2max(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepPrim_GWedge;
		 BRepPrim_GWedge (const BRepPrim_Builder & B,const gp_Ax2 & Axes,const Standard_Real xmin,const Standard_Real ymin,const Standard_Real zmin,const Standard_Real z2min,const Standard_Real x2min,const Standard_Real xmax,const Standard_Real ymax,const Standard_Real zmax,const Standard_Real z2max,const Standard_Real x2max);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax2

No detailed docstring for this function.") Axes;
		gp_Ax2 Axes ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") GetXMin;
		Standard_Real GetXMin ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") GetYMin;
		Standard_Real GetYMin ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") GetZMin;
		Standard_Real GetZMin ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") GetZ2Min;
		Standard_Real GetZ2Min ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") GetX2Min;
		Standard_Real GetX2Min ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") GetXMax;
		Standard_Real GetXMax ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") GetYMax;
		Standard_Real GetYMax ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") GetZMax;
		Standard_Real GetZMax ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") GetZ2Max;
		Standard_Real GetZ2Max ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") GetX2Max;
		Standard_Real GetX2Max ();
		%feature("autodoc", "Args:
	d1(Primitives_Direction)

Returns:
	None

No detailed docstring for this function.") Open;
		void Open (const Primitives_Direction d1);
		%feature("autodoc", "Args:
	d1(Primitives_Direction)

Returns:
	None

No detailed docstring for this function.") Close;
		void Close (const Primitives_Direction d1);
		%feature("autodoc", "Args:
	d1(Primitives_Direction)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsInfinite;
		Standard_Boolean IsInfinite (const Primitives_Direction d1);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shell

No detailed docstring for this function.") Shell;
		const TopoDS_Shell & Shell ();
		%feature("autodoc", "Args:
	d1(Primitives_Direction)

Returns:
	Standard_Boolean

No detailed docstring for this function.") HasFace;
		Standard_Boolean HasFace (const Primitives_Direction d1);
		%feature("autodoc", "Args:
	d1(Primitives_Direction)

Returns:
	TopoDS_Face

No detailed docstring for this function.") Face;
		const TopoDS_Face & Face (const Primitives_Direction d1);
		%feature("autodoc", "Args:
	d1(Primitives_Direction)

Returns:
	gp_Pln

No detailed docstring for this function.") Plane;
		gp_Pln Plane (const Primitives_Direction d1);
		%feature("autodoc", "Args:
	d1(Primitives_Direction)

Returns:
	Standard_Boolean

No detailed docstring for this function.") HasWire;
		Standard_Boolean HasWire (const Primitives_Direction d1);
		%feature("autodoc", "Args:
	d1(Primitives_Direction)

Returns:
	TopoDS_Wire

No detailed docstring for this function.") Wire;
		const TopoDS_Wire & Wire (const Primitives_Direction d1);
		%feature("autodoc", "Args:
	d1(Primitives_Direction)
	d2(Primitives_Direction)

Returns:
	Standard_Boolean

No detailed docstring for this function.") HasEdge;
		Standard_Boolean HasEdge (const Primitives_Direction d1,const Primitives_Direction d2);
		%feature("autodoc", "Args:
	d1(Primitives_Direction)
	d2(Primitives_Direction)

Returns:
	TopoDS_Edge

No detailed docstring for this function.") Edge;
		const TopoDS_Edge & Edge (const Primitives_Direction d1,const Primitives_Direction d2);
		%feature("autodoc", "Args:
	d1(Primitives_Direction)
	d2(Primitives_Direction)

Returns:
	gp_Lin

No detailed docstring for this function.") Line;
		gp_Lin Line (const Primitives_Direction d1,const Primitives_Direction d2);
		%feature("autodoc", "Args:
	d1(Primitives_Direction)
	d2(Primitives_Direction)
	d3(Primitives_Direction)

Returns:
	Standard_Boolean

No detailed docstring for this function.") HasVertex;
		Standard_Boolean HasVertex (const Primitives_Direction d1,const Primitives_Direction d2,const Primitives_Direction d3);
		%feature("autodoc", "Args:
	d1(Primitives_Direction)
	d2(Primitives_Direction)
	d3(Primitives_Direction)

Returns:
	TopoDS_Vertex

No detailed docstring for this function.") Vertex;
		const TopoDS_Vertex & Vertex (const Primitives_Direction d1,const Primitives_Direction d2,const Primitives_Direction d3);
		%feature("autodoc", "Args:
	d1(Primitives_Direction)
	d2(Primitives_Direction)
	d3(Primitives_Direction)

Returns:
	gp_Pnt

No detailed docstring for this function.") Point;
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
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Delete;
		virtual void Delete ();
		%feature("autodoc", "Args:
	MeridianOffset(Standard_Real)=0

Returns:
	None

No detailed docstring for this function.") SetMeridianOffset;
		void SetMeridianOffset (const Standard_Real MeridianOffset = 0);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax2

No detailed docstring for this function.") Axes;
		const gp_Ax2 & Axes ();
		%feature("autodoc", "Args:
	A(gp_Ax2)

Returns:
	None

No detailed docstring for this function.") Axes;
		void Axes (const gp_Ax2 & A);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Angle;
		Standard_Real Angle ();
		%feature("autodoc", "Args:
	A(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Angle;
		void Angle (const Standard_Real A);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") VMin;
		Standard_Real VMin ();
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	None

No detailed docstring for this function.") VMin;
		void VMin (const Standard_Real V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") VMax;
		Standard_Real VMax ();
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	None

No detailed docstring for this function.") VMax;
		void VMax (const Standard_Real V);
		%feature("autodoc", "Args:
	None
Returns:
	virtual TopoDS_Face

No detailed docstring for this function.") MakeEmptyLateralFace;
		virtual TopoDS_Face MakeEmptyLateralFace ();
		%feature("autodoc", "Args:
	Ang(Standard_Real)

Returns:
	virtual TopoDS_Edge

No detailed docstring for this function.") MakeEmptyMeridianEdge;
		virtual TopoDS_Edge MakeEmptyMeridianEdge (const Standard_Real Ang);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)

Returns:
	virtual void

No detailed docstring for this function.") SetMeridianPCurve;
		virtual void SetMeridianPCurve (TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	virtual gp_Pnt2d

No detailed docstring for this function.") MeridianValue;
		virtual gp_Pnt2d MeridianValue (const Standard_Real V);
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") MeridianOnAxis;
		virtual Standard_Boolean MeridianOnAxis (const Standard_Real V);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") MeridianClosed;
		virtual Standard_Boolean MeridianClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") VMaxInfinite;
		virtual Standard_Boolean VMaxInfinite ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") VMinInfinite;
		virtual Standard_Boolean VMinInfinite ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") HasTop;
		virtual Standard_Boolean HasTop ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") HasBottom;
		virtual Standard_Boolean HasBottom ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") HasSides;
		virtual Standard_Boolean HasSides ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shell

No detailed docstring for this function.") Shell;
		const TopoDS_Shell & Shell ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

No detailed docstring for this function.") LateralFace;
		const TopoDS_Face & LateralFace ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

No detailed docstring for this function.") TopFace;
		const TopoDS_Face & TopFace ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

No detailed docstring for this function.") BottomFace;
		const TopoDS_Face & BottomFace ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

No detailed docstring for this function.") StartFace;
		const TopoDS_Face & StartFace ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

No detailed docstring for this function.") EndFace;
		const TopoDS_Face & EndFace ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Wire

No detailed docstring for this function.") LateralWire;
		const TopoDS_Wire & LateralWire ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Wire

No detailed docstring for this function.") LateralStartWire;
		const TopoDS_Wire & LateralStartWire ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Wire

No detailed docstring for this function.") LateralEndWire;
		const TopoDS_Wire & LateralEndWire ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Wire

No detailed docstring for this function.") TopWire;
		const TopoDS_Wire & TopWire ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Wire

No detailed docstring for this function.") BottomWire;
		const TopoDS_Wire & BottomWire ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Wire

No detailed docstring for this function.") StartWire;
		const TopoDS_Wire & StartWire ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Wire

No detailed docstring for this function.") AxisStartWire;
		const TopoDS_Wire & AxisStartWire ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Wire

No detailed docstring for this function.") EndWire;
		const TopoDS_Wire & EndWire ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Wire

No detailed docstring for this function.") AxisEndWire;
		const TopoDS_Wire & AxisEndWire ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

No detailed docstring for this function.") AxisEdge;
		const TopoDS_Edge & AxisEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

No detailed docstring for this function.") StartEdge;
		const TopoDS_Edge & StartEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

No detailed docstring for this function.") EndEdge;
		const TopoDS_Edge & EndEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

No detailed docstring for this function.") StartTopEdge;
		const TopoDS_Edge & StartTopEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

No detailed docstring for this function.") StartBottomEdge;
		const TopoDS_Edge & StartBottomEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

No detailed docstring for this function.") EndTopEdge;
		const TopoDS_Edge & EndTopEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

No detailed docstring for this function.") EndBottomEdge;
		const TopoDS_Edge & EndBottomEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

No detailed docstring for this function.") TopEdge;
		const TopoDS_Edge & TopEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

No detailed docstring for this function.") BottomEdge;
		const TopoDS_Edge & BottomEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

No detailed docstring for this function.") AxisTopVertex;
		const TopoDS_Vertex & AxisTopVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

No detailed docstring for this function.") AxisBottomVertex;
		const TopoDS_Vertex & AxisBottomVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

No detailed docstring for this function.") TopStartVertex;
		const TopoDS_Vertex & TopStartVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

No detailed docstring for this function.") TopEndVertex;
		const TopoDS_Vertex & TopEndVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

No detailed docstring for this function.") BottomStartVertex;
		const TopoDS_Vertex & BottomStartVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

No detailed docstring for this function.") BottomEndVertex;
		const TopoDS_Vertex & BottomEndVertex ();
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
		%feature("autodoc", "Args:
	A(gp_Ax2)
	VMin(Standard_Real)
	VMax(Standard_Real)
	M(Handle_Geom_Curve)
	PM(Handle_Geom2d_Curve)

Returns:
	None

Create a  revolution body <M>  is the  meridian nd  
         must   be in the XZ  plane   of <A>. <PM>  is  the  
         meridian in the XZ plane.") BRepPrim_Revolution;
		 BRepPrim_Revolution (const gp_Ax2 & A,const Standard_Real VMin,const Standard_Real VMax,const Handle_Geom_Curve & M,const Handle_Geom2d_Curve & PM);
		%feature("autodoc", "Args:
	None
Returns:
	virtual TopoDS_Face

The surface normal should be directed  towards the  
         outside.") MakeEmptyLateralFace;
		virtual TopoDS_Face MakeEmptyLateralFace ();
		%feature("autodoc", "Args:
	Ang(Standard_Real)

Returns:
	virtual TopoDS_Edge

Returns  an  edge with  a 3D curve   made from the  
         meridian  in the XZ  plane rotated by <Ang> around  
         the Z-axis. Ang may be 0 or myAngle.") MakeEmptyMeridianEdge;
		virtual TopoDS_Edge MakeEmptyMeridianEdge (const Standard_Real Ang);
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	virtual gp_Pnt2d

Returns the meridian point at parameter <V> in the  
         plane XZ.") MeridianValue;
		virtual gp_Pnt2d MeridianValue (const Standard_Real V);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)

Returns:
	virtual void

Sets the  parametric urve of  the edge <E>  in the  
         face <F>   to be  the  2d  representation  of  the  
         meridian.") SetMeridianPCurve;
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
		%feature("autodoc", "Args:
	Axes(gp_Ax2)
	dx(Standard_Real)
	dy(Standard_Real)
	dz(Standard_Real)

Returns:
	None

Creates a  Wedge  algorithm.   <Axes> is  the axis  
         system for the primitive.  
 
         XMin, YMin, ZMin are set to 0  
         XMax, YMax, ZMax are set to dx, dy, dz  
         Z2Min = ZMin  
         Z2Max = ZMax  
         X2Min = XMin  
         X2Max = XMax  
         The result is a box  
         dx,dy,dz should be positive") BRepPrim_Wedge;
		 BRepPrim_Wedge (const gp_Ax2 & Axes,const Standard_Real dx,const Standard_Real dy,const Standard_Real dz);
		%feature("autodoc", "Args:
	Axes(gp_Ax2)
	dx(Standard_Real)
	dy(Standard_Real)
	dz(Standard_Real)
	ltx(Standard_Real)

Returns:
	None

Creates  a Wedge  primitive. <Axes> is   the  axis  
         system for the primitive.  
 
         XMin, YMin, ZMin are set to 0  
         XMax, YMax, ZMax are set to dx, dy, dz  
         Z2Min = ZMin  
         Z2Max = ZMax  
         X2Min = ltx  
         X2Max = ltx  
         The result is a STEP right angular wedge  
         dx,dy,dz should be positive  
         ltx should not be negative") BRepPrim_Wedge;
		 BRepPrim_Wedge (const gp_Ax2 & Axes,const Standard_Real dx,const Standard_Real dy,const Standard_Real dz,const Standard_Real ltx);
		%feature("autodoc", "Args:
	Axes(gp_Ax2)
	xmin(Standard_Real)
	ymin(Standard_Real)
	zmin(Standard_Real)
	z2min(Standard_Real)
	x2min(Standard_Real)
	xmax(Standard_Real)
	ymax(Standard_Real)
	zmax(Standard_Real)
	z2max(Standard_Real)
	x2max(Standard_Real)

Returns:
	None

Create  a Wedge primitive.   <Axes>  is  the  axis  
         system for the primitive.  
 
         all the fields are set to the corresponding value  
         XYZMax - XYZMin should be positive  
         ZX2Max - ZX2Min should not be negative") BRepPrim_Wedge;
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
		%feature("autodoc", "Args:
	Angle(Standard_Real)
	Position(gp_Ax2)
	Height(Standard_Real)
	Radius(Standard_Real)=0

Returns:
	None

the STEP definition  
         Angle = semi-angle of the cone  
         Position : the coordinate system  
         Height : height of the cone.  
         Radius : radius of truncated face at z = 0  
 
         The apex is on z < 0  
 
         Errors : Height < Resolution  
                   Angle < Resolution / Height  
                   Angle > PI/2 - Resolution / Height") BRepPrim_Cone;
		 BRepPrim_Cone (const Standard_Real Angle,const gp_Ax2 & Position,const Standard_Real Height,const Standard_Real Radius = 0);
		%feature("autodoc", "Args:
	Angle(Standard_Real)

Returns:
	None

infinite cone at origin on Z negative") BRepPrim_Cone;
		 BRepPrim_Cone (const Standard_Real Angle);
		%feature("autodoc", "Args:
	Angle(Standard_Real)
	Apex(gp_Pnt)

Returns:
	None

infinite cone at Apex on Z negative") BRepPrim_Cone;
		 BRepPrim_Cone (const Standard_Real Angle,const gp_Pnt & Apex);
		%feature("autodoc", "Args:
	Angle(Standard_Real)
	Axes(gp_Ax2)

Returns:
	None

infinite cone with Axes") BRepPrim_Cone;
		 BRepPrim_Cone (const Standard_Real Angle,const gp_Ax2 & Axes);
		%feature("autodoc", "Args:
	R1(Standard_Real)
	R2(Standard_Real)
	H(Standard_Real)

Returns:
	None

create a  Cone at origin  on Z axis, of height  H,  
         radius R1 at Z = 0, R2 at  Z = H, X is  the origin  
         of angles.  If R1 or  R2 is 0   there is  an apex.  
         Otherwise, it is a truncated cone.  
 
         Error  : R1 and R2  < Resolution  
                  R1 or R2 negative  
                  Abs(R1-R2) < Resolution  
                  H < Resolution  
                  H negative") BRepPrim_Cone;
		 BRepPrim_Cone (const Standard_Real R1,const Standard_Real R2,const Standard_Real H);
		%feature("autodoc", "Args:
	Center(gp_Pnt)
	R1(Standard_Real)
	R2(Standard_Real)
	H(Standard_Real)

Returns:
	None

same as above but at a given point") BRepPrim_Cone;
		 BRepPrim_Cone (const gp_Pnt & Center,const Standard_Real R1,const Standard_Real R2,const Standard_Real H);
		%feature("autodoc", "Args:
	Axes(gp_Ax2)
	R1(Standard_Real)
	R2(Standard_Real)
	H(Standard_Real)

Returns:
	None

same as above with given axes system.") BRepPrim_Cone;
		 BRepPrim_Cone (const gp_Ax2 & Axes,const Standard_Real R1,const Standard_Real R2,const Standard_Real H);
		%feature("autodoc", "Args:
	None
Returns:
	virtual TopoDS_Face

The surface normal should be directed  towards the  
         outside.") MakeEmptyLateralFace;
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
		%feature("autodoc", "Args:
	Position(gp_Ax2)
	Radius(Standard_Real)
	Height(Standard_Real)

Returns:
	None

the STEP definition  
         Position : center of a Face and Axis  
         Radius : radius of cylinder  
         Height : distance between faces  
                  on positive side  
 
         Errors : Height < Resolution  
                  Radius < Resolution") BRepPrim_Cylinder;
		 BRepPrim_Cylinder (const gp_Ax2 & Position,const Standard_Real Radius,const Standard_Real Height);
		%feature("autodoc", "Args:
	Radius(Standard_Real)

Returns:
	None

infinite Cylinder at origin on Z negative") BRepPrim_Cylinder;
		 BRepPrim_Cylinder (const Standard_Real Radius);
		%feature("autodoc", "Args:
	Center(gp_Pnt)
	Radius(Standard_Real)

Returns:
	None

infinite Cylinder at Center on Z negative") BRepPrim_Cylinder;
		 BRepPrim_Cylinder (const gp_Pnt & Center,const Standard_Real Radius);
		%feature("autodoc", "Args:
	Axes(gp_Ax2)
	Radius(Standard_Real)

Returns:
	None

infinite Cylinder at Axes on Z negative") BRepPrim_Cylinder;
		 BRepPrim_Cylinder (const gp_Ax2 & Axes,const Standard_Real Radius);
		%feature("autodoc", "Args:
	R(Standard_Real)
	H(Standard_Real)

Returns:
	None

create a Cylinder  at origin on Z  axis, of  
         height H and radius R  
         Error  : Radius  < Resolution  
                  H < Resolution  
                  H negative") BRepPrim_Cylinder;
		 BRepPrim_Cylinder (const Standard_Real R,const Standard_Real H);
		%feature("autodoc", "Args:
	Center(gp_Pnt)
	R(Standard_Real)
	H(Standard_Real)

Returns:
	None

same as above but at a given point") BRepPrim_Cylinder;
		 BRepPrim_Cylinder (const gp_Pnt & Center,const Standard_Real R,const Standard_Real H);
		%feature("autodoc", "Args:
	None
Returns:
	virtual TopoDS_Face

The surface normal should be directed  towards the  
         outside.") MakeEmptyLateralFace;
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
		%feature("autodoc", "Args:
	Radius(Standard_Real)

Returns:
	None

Creates a Sphere at  origin with  Radius. The axes  
         of the sphere are the  reference axes. An error is  
         raised if the radius is < Resolution.") BRepPrim_Sphere;
		 BRepPrim_Sphere (const Standard_Real Radius);
		%feature("autodoc", "Args:
	Center(gp_Pnt)
	Radius(Standard_Real)

Returns:
	None

Creates a Sphere with Center and Radius.  Axes are  
         the   referrence    axes.   This    is the    STEP  
         constructor.") BRepPrim_Sphere;
		 BRepPrim_Sphere (const gp_Pnt & Center,const Standard_Real Radius);
		%feature("autodoc", "Args:
	Axes(gp_Ax2)
	Radius(Standard_Real)

Returns:
	None

Creates a sphere with given axes system.") BRepPrim_Sphere;
		 BRepPrim_Sphere (const gp_Ax2 & Axes,const Standard_Real Radius);
		%feature("autodoc", "Args:
	None
Returns:
	virtual TopoDS_Face

The surface normal should be directed  towards the  
         outside.") MakeEmptyLateralFace;
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
		%feature("autodoc", "Args:
	Position(gp_Ax2)
	Major(Standard_Real)
	Minor(Standard_Real)

Returns:
	None

the STEP definition  
         Position : center and axes  
         Major, Minor : Radii  
 
         Errors : Major < Resolution  
                  Minor < Resolution") BRepPrim_Torus;
		 BRepPrim_Torus (const gp_Ax2 & Position,const Standard_Real Major,const Standard_Real Minor);
		%feature("autodoc", "Args:
	Major(Standard_Real)
	Minor(Standard_Real)

Returns:
	None

Torus centered at origin") BRepPrim_Torus;
		 BRepPrim_Torus (const Standard_Real Major,const Standard_Real Minor);
		%feature("autodoc", "Args:
	Center(gp_Pnt)
	Major(Standard_Real)
	Minor(Standard_Real)

Returns:
	None

Torus at Center") BRepPrim_Torus;
		 BRepPrim_Torus (const gp_Pnt & Center,const Standard_Real Major,const Standard_Real Minor);
		%feature("autodoc", "Args:
	None
Returns:
	virtual TopoDS_Face

The surface normal should be directed  towards the  
         outside.") MakeEmptyLateralFace;
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
