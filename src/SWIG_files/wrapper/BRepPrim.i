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
%define BREPPRIMDOCSTRING
"BRepPrim module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_brepprim.html"
%enddef
%module (package="OCC.Core", docstring=BREPPRIMDOCSTRING) BRepPrim


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
#include<BRepPrim_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BRep_module.hxx>
#include<TopoDS_module.hxx>
#include<gp_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<TopLoc_module.hxx>
#include<Message_module.hxx>
#include<Poly_module.hxx>
#include<TShort_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import BRep.i
%import TopoDS.i
%import gp.i
%import Geom.i
%import Geom2d.i

%pythoncode {
from OCC.Core.Exception import *
};

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

/* python proy classes for enums */
%pythoncode {

class BRepPrim_Direction:
	BRepPrim_XMin = 0
	BRepPrim_XMax = 1
	BRepPrim_YMin = 2
	BRepPrim_YMax = 3
	BRepPrim_ZMin = 4
	BRepPrim_ZMax = 5
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*************************
* class BRepPrim_Builder *
*************************/
class BRepPrim_Builder {
	public:
		/****************** BRepPrim_Builder ******************/
		%feature("compactdefaultargs") BRepPrim_Builder;
		%feature("autodoc", "Creates an empty, useless builder. necesseray for compilation.

Returns
-------
None
") BRepPrim_Builder;
		 BRepPrim_Builder();

		/****************** BRepPrim_Builder ******************/
		%feature("compactdefaultargs") BRepPrim_Builder;
		%feature("autodoc", "Creates from a builder.

Parameters
----------
B: BRep_Builder

Returns
-------
None
") BRepPrim_Builder;
		 BRepPrim_Builder(const BRep_Builder & B);

		/****************** AddEdgeVertex ******************/
		%feature("compactdefaultargs") AddEdgeVertex;
		%feature("autodoc", "Adds the vertex <v> in the edge <e>. <p> is the parameter of the vertex on the edge. if direct is false the vertex is reversed.

Parameters
----------
E: TopoDS_Edge
V: TopoDS_Vertex
P: float
direct: bool

Returns
-------
None
") AddEdgeVertex;
		void AddEdgeVertex(TopoDS_Edge & E, const TopoDS_Vertex & V, const Standard_Real P, const Standard_Boolean direct);

		/****************** AddEdgeVertex ******************/
		%feature("compactdefaultargs") AddEdgeVertex;
		%feature("autodoc", "Adds the vertex <v> in the edge <e>. <p1,p2> are the parameters of the vertex on the closed edge.

Parameters
----------
E: TopoDS_Edge
V: TopoDS_Vertex
P1: float
P2: float

Returns
-------
None
") AddEdgeVertex;
		void AddEdgeVertex(TopoDS_Edge & E, const TopoDS_Vertex & V, const Standard_Real P1, const Standard_Real P2);

		/****************** AddFaceWire ******************/
		%feature("compactdefaultargs") AddFaceWire;
		%feature("autodoc", "Adds the wire <w> in the face <f>.

Parameters
----------
F: TopoDS_Face
W: TopoDS_Wire

Returns
-------
None
") AddFaceWire;
		void AddFaceWire(TopoDS_Face & F, const TopoDS_Wire & W);

		/****************** AddShellFace ******************/
		%feature("compactdefaultargs") AddShellFace;
		%feature("autodoc", "Adds the face <f> in the shell <sh>.

Parameters
----------
Sh: TopoDS_Shell
F: TopoDS_Face

Returns
-------
None
") AddShellFace;
		void AddShellFace(TopoDS_Shell & Sh, const TopoDS_Face & F);

		/****************** AddWireEdge ******************/
		%feature("compactdefaultargs") AddWireEdge;
		%feature("autodoc", "Adds the edge <e> in the wire <w>, if direct is false the edge is reversed.

Parameters
----------
W: TopoDS_Wire
E: TopoDS_Edge
direct: bool

Returns
-------
None
") AddWireEdge;
		void AddWireEdge(TopoDS_Wire & W, const TopoDS_Edge & E, const Standard_Boolean direct);

		/****************** Builder ******************/
		%feature("compactdefaultargs") Builder;
		%feature("autodoc", "No available documentation.

Returns
-------
BRep_Builder
") Builder;
		const BRep_Builder & Builder();

		/****************** CompleteEdge ******************/
		%feature("compactdefaultargs") CompleteEdge;
		%feature("autodoc", "This is called once an edge is completed. it gives the opportunity to perform any post treatment.

Parameters
----------
E: TopoDS_Edge

Returns
-------
None
") CompleteEdge;
		void CompleteEdge(TopoDS_Edge & E);

		/****************** CompleteFace ******************/
		%feature("compactdefaultargs") CompleteFace;
		%feature("autodoc", "This is called once a face is completed. it gives the opportunity to perform any post treatment.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") CompleteFace;
		void CompleteFace(TopoDS_Face & F);

		/****************** CompleteShell ******************/
		%feature("compactdefaultargs") CompleteShell;
		%feature("autodoc", "This is called once a shell is completed. it gives the opportunity to perform any post treatment.

Parameters
----------
S: TopoDS_Shell

Returns
-------
None
") CompleteShell;
		void CompleteShell(TopoDS_Shell & S);

		/****************** CompleteWire ******************/
		%feature("compactdefaultargs") CompleteWire;
		%feature("autodoc", "This is called once a wire is completed. it gives the opportunity to perform any post treatment.

Parameters
----------
W: TopoDS_Wire

Returns
-------
None
") CompleteWire;
		void CompleteWire(TopoDS_Wire & W);

		/****************** MakeDegeneratedEdge ******************/
		%feature("compactdefaultargs") MakeDegeneratedEdge;
		%feature("autodoc", "Returns in <e> a degenerated edge.

Parameters
----------
E: TopoDS_Edge

Returns
-------
None
") MakeDegeneratedEdge;
		void MakeDegeneratedEdge(TopoDS_Edge & E);

		/****************** MakeEdge ******************/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "Returns in <e> an edge built with the line equation <l>.

Parameters
----------
E: TopoDS_Edge
L: gp_Lin

Returns
-------
None
") MakeEdge;
		void MakeEdge(TopoDS_Edge & E, const gp_Lin & L);

		/****************** MakeEdge ******************/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "Returns in <e> an edge built with the circle equation <c>.

Parameters
----------
E: TopoDS_Edge
C: gp_Circ

Returns
-------
None
") MakeEdge;
		void MakeEdge(TopoDS_Edge & E, const gp_Circ & C);

		/****************** MakeFace ******************/
		%feature("compactdefaultargs") MakeFace;
		%feature("autodoc", "Returns in <f> a face built with the plane equation <p>. used by all primitives.

Parameters
----------
F: TopoDS_Face
P: gp_Pln

Returns
-------
None
") MakeFace;
		void MakeFace(TopoDS_Face & F, const gp_Pln & P);

		/****************** MakeShell ******************/
		%feature("compactdefaultargs") MakeShell;
		%feature("autodoc", "Make a empty shell.

Parameters
----------
S: TopoDS_Shell

Returns
-------
None
") MakeShell;
		void MakeShell(TopoDS_Shell & S);

		/****************** MakeVertex ******************/
		%feature("compactdefaultargs") MakeVertex;
		%feature("autodoc", "Returns in <v> a vertex built with the point <p>.

Parameters
----------
V: TopoDS_Vertex
P: gp_Pnt

Returns
-------
None
") MakeVertex;
		void MakeVertex(TopoDS_Vertex & V, const gp_Pnt & P);

		/****************** MakeWire ******************/
		%feature("compactdefaultargs") MakeWire;
		%feature("autodoc", "Returns in <w> an empty wire.

Parameters
----------
W: TopoDS_Wire

Returns
-------
None
") MakeWire;
		void MakeWire(TopoDS_Wire & W);

		/****************** ReverseFace ******************/
		%feature("compactdefaultargs") ReverseFace;
		%feature("autodoc", "Reverses the face <f>.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") ReverseFace;
		void ReverseFace(TopoDS_Face & F);

		/****************** SetPCurve ******************/
		%feature("compactdefaultargs") SetPCurve;
		%feature("autodoc", "Sets the line <l> to be the curve representing the edge <e> in the parametric space of the surface of <f>.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
L: gp_Lin2d

Returns
-------
None
") SetPCurve;
		void SetPCurve(TopoDS_Edge & E, const TopoDS_Face & F, const gp_Lin2d & L);

		/****************** SetPCurve ******************/
		%feature("compactdefaultargs") SetPCurve;
		%feature("autodoc", "Sets the lines <l1,l2> to be the curves representing the edge <e> in the parametric space of the closed surface of <f>.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
L1: gp_Lin2d
L2: gp_Lin2d

Returns
-------
None
") SetPCurve;
		void SetPCurve(TopoDS_Edge & E, const TopoDS_Face & F, const gp_Lin2d & L1, const gp_Lin2d & L2);

		/****************** SetPCurve ******************/
		%feature("compactdefaultargs") SetPCurve;
		%feature("autodoc", "Sets the circle <c> to be the curve representing the edge <e> in the parametric space of the surface of <f>.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
C: gp_Circ2d

Returns
-------
None
") SetPCurve;
		void SetPCurve(TopoDS_Edge & E, const TopoDS_Face & F, const gp_Circ2d & C);

		/****************** SetParameters ******************/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "<p1,p2> are the parameters of the vertex on the edge. the edge is a closed curve.

Parameters
----------
E: TopoDS_Edge
V: TopoDS_Vertex
P1: float
P2: float

Returns
-------
None
") SetParameters;
		void SetParameters(TopoDS_Edge & E, const TopoDS_Vertex & V, const Standard_Real P1, const Standard_Real P2);

};


%extend BRepPrim_Builder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BRepPrim_FaceBuilder *
*****************************/
class BRepPrim_FaceBuilder {
	public:
		/****************** BRepPrim_FaceBuilder ******************/
		%feature("compactdefaultargs") BRepPrim_FaceBuilder;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepPrim_FaceBuilder;
		 BRepPrim_FaceBuilder();

		/****************** BRepPrim_FaceBuilder ******************/
		%feature("compactdefaultargs") BRepPrim_FaceBuilder;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: BRep_Builder
S: Geom_Surface

Returns
-------
None
") BRepPrim_FaceBuilder;
		 BRepPrim_FaceBuilder(const BRep_Builder & B, const opencascade::handle<Geom_Surface> & S);

		/****************** BRepPrim_FaceBuilder ******************/
		%feature("compactdefaultargs") BRepPrim_FaceBuilder;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: BRep_Builder
S: Geom_Surface
UMin: float
UMax: float
VMin: float
VMax: float

Returns
-------
None
") BRepPrim_FaceBuilder;
		 BRepPrim_FaceBuilder(const BRep_Builder & B, const opencascade::handle<Geom_Surface> & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Returns the edge of index <i> 1 - edge vmin 2 - edge umax 3 - edge vmax 4 - edge umin.

Parameters
----------
I: int

Returns
-------
TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge(const Standard_Integer I);

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: BRep_Builder
S: Geom_Surface

Returns
-------
None
") Init;
		void Init(const BRep_Builder & B, const opencascade::handle<Geom_Surface> & S);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: BRep_Builder
S: Geom_Surface
UMin: float
UMax: float
VMin: float
VMax: float

Returns
-------
None
") Init;
		void Init(const BRep_Builder & B, const opencascade::handle<Geom_Surface> & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax);

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Returns the vertex of index <i> 1 - vertex umin,vmin 2 - vertex umax,vmin 3 - vertex umax,vmax 4 - vertex umin,vmax.

Parameters
----------
I: int

Returns
-------
TopoDS_Vertex
") Vertex;
		const TopoDS_Vertex Vertex(const Standard_Integer I);

};


%extend BRepPrim_FaceBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class BRepPrim_GWedge *
************************/
class BRepPrim_GWedge {
	public:
		/****************** BRepPrim_GWedge ******************/
		%feature("compactdefaultargs") BRepPrim_GWedge;
		%feature("autodoc", "Creates a gwedge algorithm. <axes> is the axis system for the primitive. //! xmin, ymin, zmin are set to 0 xmax, ymax, zmax are set to dx, dy, dz z2min = zmin z2max = zmax x2min = xmin x2max = xmax the result is a box dx,dy,dz should be positive.

Parameters
----------
B: BRepPrim_Builder
Axes: gp_Ax2
dx: float
dy: float
dz: float

Returns
-------
None
") BRepPrim_GWedge;
		 BRepPrim_GWedge(const BRepPrim_Builder & B, const gp_Ax2 & Axes, const Standard_Real dx, const Standard_Real dy, const Standard_Real dz);

		/****************** BRepPrim_GWedge ******************/
		%feature("compactdefaultargs") BRepPrim_GWedge;
		%feature("autodoc", "Creates a gwedge primitive. <axes> is the axis system for the primitive. //! xmin, ymin, zmin are set to 0 xmax, ymax, zmax are set to dx, dy, dz z2min = zmin z2max = zmax x2min = ltx x2max = ltx the result is a step right angular wedge dx,dy,dz should be positive ltx should not be negative.

Parameters
----------
B: BRepPrim_Builder
Axes: gp_Ax2
dx: float
dy: float
dz: float
ltx: float

Returns
-------
None
") BRepPrim_GWedge;
		 BRepPrim_GWedge(const BRepPrim_Builder & B, const gp_Ax2 & Axes, const Standard_Real dx, const Standard_Real dy, const Standard_Real dz, const Standard_Real ltx);

		/****************** BRepPrim_GWedge ******************/
		%feature("compactdefaultargs") BRepPrim_GWedge;
		%feature("autodoc", "Create a gwedge primitive. <axes> is the axis system for the primitive. //! all the fields are set to the corresponding value xyzmax - xyzmin should be positive zx2max - zx2min should not be negative.

Parameters
----------
B: BRepPrim_Builder
Axes: gp_Ax2
xmin: float
ymin: float
zmin: float
z2min: float
x2min: float
xmax: float
ymax: float
zmax: float
z2max: float
x2max: float

Returns
-------
None
") BRepPrim_GWedge;
		 BRepPrim_GWedge(const BRepPrim_Builder & B, const gp_Ax2 & Axes, const Standard_Real xmin, const Standard_Real ymin, const Standard_Real zmin, const Standard_Real z2min, const Standard_Real x2min, const Standard_Real xmax, const Standard_Real ymax, const Standard_Real zmax, const Standard_Real z2max, const Standard_Real x2max);

		/****************** Axes ******************/
		%feature("compactdefaultargs") Axes;
		%feature("autodoc", "Returns the coordinates system from <self>.

Returns
-------
gp_Ax2
") Axes;
		gp_Ax2 Axes();

		/****************** Close ******************/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "Closes <self> in <d1> direction. a face and its edges or vertices are said existant.

Parameters
----------
d1: BRepPrim_Direction

Returns
-------
None
") Close;
		void Close(const BRepPrim_Direction d1);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Returns the edge of <self> located in <d1><d2> direction.

Parameters
----------
d1: BRepPrim_Direction
d2: BRepPrim_Direction

Returns
-------
TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge(const BRepPrim_Direction d1, const BRepPrim_Direction d2);

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Returns the face of <self> located in <d1> direction.

Parameters
----------
d1: BRepPrim_Direction

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face(const BRepPrim_Direction d1);

		/****************** GetX2Max ******************/
		%feature("compactdefaultargs") GetX2Max;
		%feature("autodoc", "Returns x2max value from <self>.

Returns
-------
float
") GetX2Max;
		Standard_Real GetX2Max();

		/****************** GetX2Min ******************/
		%feature("compactdefaultargs") GetX2Min;
		%feature("autodoc", "Returns x2min value from <self>.

Returns
-------
float
") GetX2Min;
		Standard_Real GetX2Min();

		/****************** GetXMax ******************/
		%feature("compactdefaultargs") GetXMax;
		%feature("autodoc", "Returns xmax value from <self>.

Returns
-------
float
") GetXMax;
		Standard_Real GetXMax();

		/****************** GetXMin ******************/
		%feature("compactdefaultargs") GetXMin;
		%feature("autodoc", "Returns xmin value from <self>.

Returns
-------
float
") GetXMin;
		Standard_Real GetXMin();

		/****************** GetYMax ******************/
		%feature("compactdefaultargs") GetYMax;
		%feature("autodoc", "Returns ymax value from <self>.

Returns
-------
float
") GetYMax;
		Standard_Real GetYMax();

		/****************** GetYMin ******************/
		%feature("compactdefaultargs") GetYMin;
		%feature("autodoc", "Returns ymin value from <self>.

Returns
-------
float
") GetYMin;
		Standard_Real GetYMin();

		/****************** GetZ2Max ******************/
		%feature("compactdefaultargs") GetZ2Max;
		%feature("autodoc", "Returns z2max value from <self>.

Returns
-------
float
") GetZ2Max;
		Standard_Real GetZ2Max();

		/****************** GetZ2Min ******************/
		%feature("compactdefaultargs") GetZ2Min;
		%feature("autodoc", "Returns z2min value from <self>.

Returns
-------
float
") GetZ2Min;
		Standard_Real GetZ2Min();

		/****************** GetZMax ******************/
		%feature("compactdefaultargs") GetZMax;
		%feature("autodoc", "Returns zmax value from <self>.

Returns
-------
float
") GetZMax;
		Standard_Real GetZMax();

		/****************** GetZMin ******************/
		%feature("compactdefaultargs") GetZMin;
		%feature("autodoc", "Returns zmin value from <self>.

Returns
-------
float
") GetZMin;
		Standard_Real GetZMin();

		/****************** HasEdge ******************/
		%feature("compactdefaultargs") HasEdge;
		%feature("autodoc", "Returns true if <self> has an edge in <d1><d2> direction.

Parameters
----------
d1: BRepPrim_Direction
d2: BRepPrim_Direction

Returns
-------
bool
") HasEdge;
		Standard_Boolean HasEdge(const BRepPrim_Direction d1, const BRepPrim_Direction d2);

		/****************** HasFace ******************/
		%feature("compactdefaultargs") HasFace;
		%feature("autodoc", "Returns true if <self> has a face in <d1> direction.

Parameters
----------
d1: BRepPrim_Direction

Returns
-------
bool
") HasFace;
		Standard_Boolean HasFace(const BRepPrim_Direction d1);

		/****************** HasVertex ******************/
		%feature("compactdefaultargs") HasVertex;
		%feature("autodoc", "Returns true if <self> has a vertex in <d1><d2><d3> direction.

Parameters
----------
d1: BRepPrim_Direction
d2: BRepPrim_Direction
d3: BRepPrim_Direction

Returns
-------
bool
") HasVertex;
		Standard_Boolean HasVertex(const BRepPrim_Direction d1, const BRepPrim_Direction d2, const BRepPrim_Direction d3);

		/****************** HasWire ******************/
		%feature("compactdefaultargs") HasWire;
		%feature("autodoc", "Returns true if <self> has a wire in <d1> direction.

Parameters
----------
d1: BRepPrim_Direction

Returns
-------
bool
") HasWire;
		Standard_Boolean HasWire(const BRepPrim_Direction d1);

		/****************** IsInfinite ******************/
		%feature("compactdefaultargs") IsInfinite;
		%feature("autodoc", "Returns true if <self> is open in <d1> direction.

Parameters
----------
d1: BRepPrim_Direction

Returns
-------
bool
") IsInfinite;
		Standard_Boolean IsInfinite(const BRepPrim_Direction d1);

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Returns the line of the edge of <self> located in <d1><d2> direction.

Parameters
----------
d1: BRepPrim_Direction
d2: BRepPrim_Direction

Returns
-------
gp_Lin
") Line;
		gp_Lin Line(const BRepPrim_Direction d1, const BRepPrim_Direction d2);

		/****************** Open ******************/
		%feature("compactdefaultargs") Open;
		%feature("autodoc", "Opens <self> in <d1> direction. a face and its edges or vertices are said nonexistant.

Parameters
----------
d1: BRepPrim_Direction

Returns
-------
None
") Open;
		void Open(const BRepPrim_Direction d1);

		/****************** Plane ******************/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Returns the plane of the face of <self> located in <d1> direction.

Parameters
----------
d1: BRepPrim_Direction

Returns
-------
gp_Pln
") Plane;
		gp_Pln Plane(const BRepPrim_Direction d1);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the vertex of <self> located in <d1><d2><d3> direction.

Parameters
----------
d1: BRepPrim_Direction
d2: BRepPrim_Direction
d3: BRepPrim_Direction

Returns
-------
gp_Pnt
") Point;
		gp_Pnt Point(const BRepPrim_Direction d1, const BRepPrim_Direction d2, const BRepPrim_Direction d3);

		/****************** Shell ******************/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "Returns the shell containing the faces of <self>.

Returns
-------
TopoDS_Shell
") Shell;
		const TopoDS_Shell Shell();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Returns the vertex of <self> located in <d1><d2><d3> direction.

Parameters
----------
d1: BRepPrim_Direction
d2: BRepPrim_Direction
d3: BRepPrim_Direction

Returns
-------
TopoDS_Vertex
") Vertex;
		const TopoDS_Vertex Vertex(const BRepPrim_Direction d1, const BRepPrim_Direction d2, const BRepPrim_Direction d3);

		/****************** Wire ******************/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "Returns the wire of <self> located in <d1> direction.

Parameters
----------
d1: BRepPrim_Direction

Returns
-------
TopoDS_Wire
") Wire;
		const TopoDS_Wire Wire(const BRepPrim_Direction d1);

};


%extend BRepPrim_GWedge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BRepPrim_OneAxis *
*************************/
%nodefaultctor BRepPrim_OneAxis;
class BRepPrim_OneAxis {
	public:
		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Angle;
		Standard_Real Angle();

		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: float

Returns
-------
None
") Angle;
		void Angle(const Standard_Real A);

		/****************** Axes ******************/
		%feature("compactdefaultargs") Axes;
		%feature("autodoc", "Returns the ax2 from <self>.

Returns
-------
gp_Ax2
") Axes;
		const gp_Ax2 Axes();

		/****************** Axes ******************/
		%feature("compactdefaultargs") Axes;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: gp_Ax2

Returns
-------
None
") Axes;
		void Axes(const gp_Ax2 & A);

		/****************** AxisBottomVertex ******************/
		%feature("compactdefaultargs") AxisBottomVertex;
		%feature("autodoc", "Returns the vertex at the bottom altitude on the axis.

Returns
-------
TopoDS_Vertex
") AxisBottomVertex;
		const TopoDS_Vertex AxisBottomVertex();

		/****************** AxisEdge ******************/
		%feature("compactdefaultargs") AxisEdge;
		%feature("autodoc", "Returns the edge built along the axis and oriented on +z of the axis.

Returns
-------
TopoDS_Edge
") AxisEdge;
		const TopoDS_Edge AxisEdge();

		/****************** AxisEndWire ******************/
		%feature("compactdefaultargs") AxisEndWire;
		%feature("autodoc", "Returns the wire in the end face with the axisedge.

Returns
-------
TopoDS_Wire
") AxisEndWire;
		const TopoDS_Wire AxisEndWire();

		/****************** AxisStartWire ******************/
		%feature("compactdefaultargs") AxisStartWire;
		%feature("autodoc", "Returns the wire in the start face with the axisedge.

Returns
-------
TopoDS_Wire
") AxisStartWire;
		const TopoDS_Wire AxisStartWire();

		/****************** AxisTopVertex ******************/
		%feature("compactdefaultargs") AxisTopVertex;
		%feature("autodoc", "Returns the vertex at the top altitude on the axis.

Returns
-------
TopoDS_Vertex
") AxisTopVertex;
		const TopoDS_Vertex AxisTopVertex();

		/****************** BottomEdge ******************/
		%feature("compactdefaultargs") BottomEdge;
		%feature("autodoc", "Returns the edge at vmin. if meridianclosed() the topedge and the bottomedge are the same edge.

Returns
-------
TopoDS_Edge
") BottomEdge;
		const TopoDS_Edge BottomEdge();

		/****************** BottomEndVertex ******************/
		%feature("compactdefaultargs") BottomEndVertex;
		%feature("autodoc", "Returns the vertex (angle,vmax).

Returns
-------
TopoDS_Vertex
") BottomEndVertex;
		const TopoDS_Vertex BottomEndVertex();

		/****************** BottomFace ******************/
		%feature("compactdefaultargs") BottomFace;
		%feature("autodoc", "Returns the bottom planar face. it is oriented toward the -z axis (outside).

Returns
-------
TopoDS_Face
") BottomFace;
		const TopoDS_Face BottomFace();

		/****************** BottomStartVertex ******************/
		%feature("compactdefaultargs") BottomStartVertex;
		%feature("autodoc", "Returns the vertex (0,vmin).

Returns
-------
TopoDS_Vertex
") BottomStartVertex;
		const TopoDS_Vertex BottomStartVertex();

		/****************** BottomWire ******************/
		%feature("compactdefaultargs") BottomWire;
		%feature("autodoc", "Returns the wire in the bottom face.

Returns
-------
TopoDS_Wire
") BottomWire;
		const TopoDS_Wire BottomWire();

		/****************** EndBottomEdge ******************/
		%feature("compactdefaultargs") EndBottomEdge;
		%feature("autodoc", "Returns the linear edge between end face and bottom face.

Returns
-------
TopoDS_Edge
") EndBottomEdge;
		const TopoDS_Edge EndBottomEdge();

		/****************** EndEdge ******************/
		%feature("compactdefaultargs") EndEdge;
		%feature("autodoc", "Returns the edge at angle angle. if !hassides() the startedge and the endedge are the same edge.

Returns
-------
TopoDS_Edge
") EndEdge;
		const TopoDS_Edge EndEdge();

		/****************** EndFace ******************/
		%feature("compactdefaultargs") EndFace;
		%feature("autodoc", "Returns the face ending the slice, it is oriented toward the exterior of the primitive.

Returns
-------
TopoDS_Face
") EndFace;
		const TopoDS_Face EndFace();

		/****************** EndTopEdge ******************/
		%feature("compactdefaultargs") EndTopEdge;
		%feature("autodoc", "Returns the linear edge between end face and top face.

Returns
-------
TopoDS_Edge
") EndTopEdge;
		const TopoDS_Edge EndTopEdge();

		/****************** EndWire ******************/
		%feature("compactdefaultargs") EndWire;
		%feature("autodoc", "Returns the wire in the end face.

Returns
-------
TopoDS_Wire
") EndWire;
		const TopoDS_Wire EndWire();

		/****************** HasBottom ******************/
		%feature("compactdefaultargs") HasBottom;
		%feature("autodoc", "Returns true if there is a bottom face. //! that is neither : vmininfinite() meridianclosed() meridianonaxis(vmin).

Returns
-------
bool
") HasBottom;
		virtual Standard_Boolean HasBottom();

		/****************** HasSides ******************/
		%feature("compactdefaultargs") HasSides;
		%feature("autodoc", "Returns true if there are start and end faces. //! that is : 2*pi - angle > precision::angular().

Returns
-------
bool
") HasSides;
		virtual Standard_Boolean HasSides();

		/****************** HasTop ******************/
		%feature("compactdefaultargs") HasTop;
		%feature("autodoc", "Returns true if there is a top face. //! that is neither : vmaxinfinite() meridianclosed() meridianonaxis(vmax).

Returns
-------
bool
") HasTop;
		virtual Standard_Boolean HasTop();

		/****************** LateralEndWire ******************/
		%feature("compactdefaultargs") LateralEndWire;
		%feature("autodoc", "Returns the wire with in lateral face with the end edge.

Returns
-------
TopoDS_Wire
") LateralEndWire;
		const TopoDS_Wire LateralEndWire();

		/****************** LateralFace ******************/
		%feature("compactdefaultargs") LateralFace;
		%feature("autodoc", "Returns the lateral face. it is oriented toward the outside of the primitive.

Returns
-------
TopoDS_Face
") LateralFace;
		const TopoDS_Face LateralFace();

		/****************** LateralStartWire ******************/
		%feature("compactdefaultargs") LateralStartWire;
		%feature("autodoc", "Returns the wire in the lateral face with the start edge.

Returns
-------
TopoDS_Wire
") LateralStartWire;
		const TopoDS_Wire LateralStartWire();

		/****************** LateralWire ******************/
		%feature("compactdefaultargs") LateralWire;
		%feature("autodoc", "Returns the wire in the lateral face.

Returns
-------
TopoDS_Wire
") LateralWire;
		const TopoDS_Wire LateralWire();

		/****************** MakeEmptyLateralFace ******************/
		%feature("compactdefaultargs") MakeEmptyLateralFace;
		%feature("autodoc", "Returns a face with no edges. the surface is the lateral surface with normals pointing outward. the u parameter is the angle with the origin on the x axis. the v parameter is the parameter of the meridian.

Returns
-------
TopoDS_Face
") MakeEmptyLateralFace;
		virtual TopoDS_Face MakeEmptyLateralFace();

		/****************** MakeEmptyMeridianEdge ******************/
		%feature("compactdefaultargs") MakeEmptyMeridianEdge;
		%feature("autodoc", "Returns an edge with a 3d curve made from the meridian in the xz plane rotated by <ang> around the z-axis. ang may be 0 or myangle.

Parameters
----------
Ang: float

Returns
-------
TopoDS_Edge
") MakeEmptyMeridianEdge;
		virtual TopoDS_Edge MakeEmptyMeridianEdge(const Standard_Real Ang);

		/****************** MeridianClosed ******************/
		%feature("compactdefaultargs") MeridianClosed;
		%feature("autodoc", "Returns true if the meridian is closed. default implementation  is meridianvalue(vmin).isequal(meridianvalue(vmax), precision::confusion()).

Returns
-------
bool
") MeridianClosed;
		virtual Standard_Boolean MeridianClosed();

		/****************** MeridianOnAxis ******************/
		%feature("compactdefaultargs") MeridianOnAxis;
		%feature("autodoc", "Returns true if the point of parameter <v> on the meridian is on the axis. default implementation is abs(meridianvalue(v).x()) < precision::confusion().

Parameters
----------
V: float

Returns
-------
bool
") MeridianOnAxis;
		virtual Standard_Boolean MeridianOnAxis(const Standard_Real V);

		/****************** MeridianValue ******************/
		%feature("compactdefaultargs") MeridianValue;
		%feature("autodoc", "Returns the meridian point at parameter <v> in the plane xz.

Parameters
----------
V: float

Returns
-------
gp_Pnt2d
") MeridianValue;
		virtual gp_Pnt2d MeridianValue(const Standard_Real V);

		/****************** SetMeridianOffset ******************/
		%feature("compactdefaultargs") SetMeridianOffset;
		%feature("autodoc", "The meridianoffset is added to the parameters on the meridian curve and to the v values of the pcurves. this is used for the sphere for example, to give a range on the meridian edge which is not vmin, vmax.

Parameters
----------
MeridianOffset: float,optional
	default value is 0

Returns
-------
None
") SetMeridianOffset;
		void SetMeridianOffset(const Standard_Real MeridianOffset = 0);

		/****************** SetMeridianPCurve ******************/
		%feature("compactdefaultargs") SetMeridianPCurve;
		%feature("autodoc", "Sets the parametric curve of the edge <e> in the face <f> to be the 2d representation of the meridian.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Returns
-------
None
") SetMeridianPCurve;
		virtual void SetMeridianPCurve(TopoDS_Edge & E, const TopoDS_Face & F);

		/****************** Shell ******************/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "Returns the shell containing all the faces of the primitive.

Returns
-------
TopoDS_Shell
") Shell;
		const TopoDS_Shell Shell();

		/****************** StartBottomEdge ******************/
		%feature("compactdefaultargs") StartBottomEdge;
		%feature("autodoc", "Returns the linear edge between start face and bottom face.

Returns
-------
TopoDS_Edge
") StartBottomEdge;
		const TopoDS_Edge StartBottomEdge();

		/****************** StartEdge ******************/
		%feature("compactdefaultargs") StartEdge;
		%feature("autodoc", "Returns the edge at angle 0.

Returns
-------
TopoDS_Edge
") StartEdge;
		const TopoDS_Edge StartEdge();

		/****************** StartFace ******************/
		%feature("compactdefaultargs") StartFace;
		%feature("autodoc", "Returns the face starting the slice, it is oriented toward the exterior of the primitive.

Returns
-------
TopoDS_Face
") StartFace;
		const TopoDS_Face StartFace();

		/****************** StartTopEdge ******************/
		%feature("compactdefaultargs") StartTopEdge;
		%feature("autodoc", "Returns the linear edge between start face and top face.

Returns
-------
TopoDS_Edge
") StartTopEdge;
		const TopoDS_Edge StartTopEdge();

		/****************** StartWire ******************/
		%feature("compactdefaultargs") StartWire;
		%feature("autodoc", "Returns the wire in the start face.

Returns
-------
TopoDS_Wire
") StartWire;
		const TopoDS_Wire StartWire();

		/****************** TopEdge ******************/
		%feature("compactdefaultargs") TopEdge;
		%feature("autodoc", "Returns the edge at vmax. if meridianclosed() the topedge and the bottomedge are the same edge.

Returns
-------
TopoDS_Edge
") TopEdge;
		const TopoDS_Edge TopEdge();

		/****************** TopEndVertex ******************/
		%feature("compactdefaultargs") TopEndVertex;
		%feature("autodoc", "Returns the vertex (angle,vmax).

Returns
-------
TopoDS_Vertex
") TopEndVertex;
		const TopoDS_Vertex TopEndVertex();

		/****************** TopFace ******************/
		%feature("compactdefaultargs") TopFace;
		%feature("autodoc", "Returns the top planar face. it is oriented toward the +z axis (outside).

Returns
-------
TopoDS_Face
") TopFace;
		const TopoDS_Face TopFace();

		/****************** TopStartVertex ******************/
		%feature("compactdefaultargs") TopStartVertex;
		%feature("autodoc", "Returns the vertex (0,vmax).

Returns
-------
TopoDS_Vertex
") TopStartVertex;
		const TopoDS_Vertex TopStartVertex();

		/****************** TopWire ******************/
		%feature("compactdefaultargs") TopWire;
		%feature("autodoc", "Returns the wire in the top face.

Returns
-------
TopoDS_Wire
") TopWire;
		const TopoDS_Wire TopWire();

		/****************** VMax ******************/
		%feature("compactdefaultargs") VMax;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") VMax;
		Standard_Real VMax();

		/****************** VMax ******************/
		%feature("compactdefaultargs") VMax;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: float

Returns
-------
None
") VMax;
		void VMax(const Standard_Real V);

		/****************** VMaxInfinite ******************/
		%feature("compactdefaultargs") VMaxInfinite;
		%feature("autodoc", "Returns true if vmax is infinite. default precision::ispositiveinfinite(vmax);.

Returns
-------
bool
") VMaxInfinite;
		virtual Standard_Boolean VMaxInfinite();

		/****************** VMin ******************/
		%feature("compactdefaultargs") VMin;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") VMin;
		Standard_Real VMin();

		/****************** VMin ******************/
		%feature("compactdefaultargs") VMin;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: float

Returns
-------
None
") VMin;
		void VMin(const Standard_Real V);

		/****************** VMinInfinite ******************/
		%feature("compactdefaultargs") VMinInfinite;
		%feature("autodoc", "Returns true if vmin is infinite. default precision::isnegativeinfinite(vmax);.

Returns
-------
bool
") VMinInfinite;
		virtual Standard_Boolean VMinInfinite();

};


%extend BRepPrim_OneAxis {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepPrim_Revolution *
****************************/
class BRepPrim_Revolution : public BRepPrim_OneAxis {
	public:
		/****************** BRepPrim_Revolution ******************/
		%feature("compactdefaultargs") BRepPrim_Revolution;
		%feature("autodoc", "Create a revolution body <m> is the meridian nd must be in the xz plane of <a>. <pm> is the meridian in the xz plane.

Parameters
----------
A: gp_Ax2
VMin: float
VMax: float
M: Geom_Curve
PM: Geom2d_Curve

Returns
-------
None
") BRepPrim_Revolution;
		 BRepPrim_Revolution(const gp_Ax2 & A, const Standard_Real VMin, const Standard_Real VMax, const opencascade::handle<Geom_Curve> & M, const opencascade::handle<Geom2d_Curve> & PM);

		/****************** MakeEmptyLateralFace ******************/
		%feature("compactdefaultargs") MakeEmptyLateralFace;
		%feature("autodoc", "The surface normal should be directed towards the outside.

Returns
-------
TopoDS_Face
") MakeEmptyLateralFace;
		virtual TopoDS_Face MakeEmptyLateralFace();

		/****************** MakeEmptyMeridianEdge ******************/
		%feature("compactdefaultargs") MakeEmptyMeridianEdge;
		%feature("autodoc", "Returns an edge with a 3d curve made from the meridian in the xz plane rotated by <ang> around the z-axis. ang may be 0 or myangle.

Parameters
----------
Ang: float

Returns
-------
TopoDS_Edge
") MakeEmptyMeridianEdge;
		virtual TopoDS_Edge MakeEmptyMeridianEdge(const Standard_Real Ang);

		/****************** MeridianValue ******************/
		%feature("compactdefaultargs") MeridianValue;
		%feature("autodoc", "Returns the meridian point at parameter <v> in the plane xz.

Parameters
----------
V: float

Returns
-------
gp_Pnt2d
") MeridianValue;
		virtual gp_Pnt2d MeridianValue(const Standard_Real V);

		/****************** SetMeridianPCurve ******************/
		%feature("compactdefaultargs") SetMeridianPCurve;
		%feature("autodoc", "Sets the parametric urve of the edge <e> in the face <f> to be the 2d representation of the meridian.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Returns
-------
None
") SetMeridianPCurve;
		virtual void SetMeridianPCurve(TopoDS_Edge & E, const TopoDS_Face & F);

};


%extend BRepPrim_Revolution {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class BRepPrim_Wedge *
***********************/
class BRepPrim_Wedge : public BRepPrim_GWedge {
	public:
		/****************** BRepPrim_Wedge ******************/
		%feature("compactdefaultargs") BRepPrim_Wedge;
		%feature("autodoc", "Creates a wedge algorithm. <axes> is the axis system for the primitive. //! xmin, ymin, zmin are set to 0 xmax, ymax, zmax are set to dx, dy, dz z2min = zmin z2max = zmax x2min = xmin x2max = xmax the result is a box dx,dy,dz should be positive.

Parameters
----------
Axes: gp_Ax2
dx: float
dy: float
dz: float

Returns
-------
None
") BRepPrim_Wedge;
		 BRepPrim_Wedge(const gp_Ax2 & Axes, const Standard_Real dx, const Standard_Real dy, const Standard_Real dz);

		/****************** BRepPrim_Wedge ******************/
		%feature("compactdefaultargs") BRepPrim_Wedge;
		%feature("autodoc", "Creates a wedge primitive. <axes> is the axis system for the primitive. //! xmin, ymin, zmin are set to 0 xmax, ymax, zmax are set to dx, dy, dz z2min = zmin z2max = zmax x2min = ltx x2max = ltx the result is a step right angular wedge dx,dy,dz should be positive ltx should not be negative.

Parameters
----------
Axes: gp_Ax2
dx: float
dy: float
dz: float
ltx: float

Returns
-------
None
") BRepPrim_Wedge;
		 BRepPrim_Wedge(const gp_Ax2 & Axes, const Standard_Real dx, const Standard_Real dy, const Standard_Real dz, const Standard_Real ltx);

		/****************** BRepPrim_Wedge ******************/
		%feature("compactdefaultargs") BRepPrim_Wedge;
		%feature("autodoc", "Create a wedge primitive. <axes> is the axis system for the primitive. //! all the fields are set to the corresponding value xyzmax - xyzmin should be positive zx2max - zx2min should not be negative.

Parameters
----------
Axes: gp_Ax2
xmin: float
ymin: float
zmin: float
z2min: float
x2min: float
xmax: float
ymax: float
zmax: float
z2max: float
x2max: float

Returns
-------
None
") BRepPrim_Wedge;
		 BRepPrim_Wedge(const gp_Ax2 & Axes, const Standard_Real xmin, const Standard_Real ymin, const Standard_Real zmin, const Standard_Real z2min, const Standard_Real x2min, const Standard_Real xmax, const Standard_Real ymax, const Standard_Real zmax, const Standard_Real z2max, const Standard_Real x2max);

};


%extend BRepPrim_Wedge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class BRepPrim_Cone *
**********************/
class BRepPrim_Cone : public BRepPrim_Revolution {
	public:
		/****************** BRepPrim_Cone ******************/
		%feature("compactdefaultargs") BRepPrim_Cone;
		%feature("autodoc", "The step definition angle = semi-angle of the cone position : the coordinate system height : height of the cone. radius : radius of truncated face at z = 0 //! the apex is on z < 0 //! errors : height < resolution angle < resolution / height angle > pi/2 - resolution / height.

Parameters
----------
Angle: float
Position: gp_Ax2
Height: float
Radius: float,optional
	default value is 0

Returns
-------
None
") BRepPrim_Cone;
		 BRepPrim_Cone(const Standard_Real Angle, const gp_Ax2 & Position, const Standard_Real Height, const Standard_Real Radius = 0);

		/****************** BRepPrim_Cone ******************/
		%feature("compactdefaultargs") BRepPrim_Cone;
		%feature("autodoc", "Infinite cone at origin on z negative.

Parameters
----------
Angle: float

Returns
-------
None
") BRepPrim_Cone;
		 BRepPrim_Cone(const Standard_Real Angle);

		/****************** BRepPrim_Cone ******************/
		%feature("compactdefaultargs") BRepPrim_Cone;
		%feature("autodoc", "Infinite cone at apex on z negative.

Parameters
----------
Angle: float
Apex: gp_Pnt

Returns
-------
None
") BRepPrim_Cone;
		 BRepPrim_Cone(const Standard_Real Angle, const gp_Pnt & Apex);

		/****************** BRepPrim_Cone ******************/
		%feature("compactdefaultargs") BRepPrim_Cone;
		%feature("autodoc", "Infinite cone with axes.

Parameters
----------
Angle: float
Axes: gp_Ax2

Returns
-------
None
") BRepPrim_Cone;
		 BRepPrim_Cone(const Standard_Real Angle, const gp_Ax2 & Axes);

		/****************** BRepPrim_Cone ******************/
		%feature("compactdefaultargs") BRepPrim_Cone;
		%feature("autodoc", "Create a cone at origin on z axis, of height h, radius r1 at z = 0, r2 at z = h, x is the origin of angles. if r1 or r2 is 0 there is an apex. otherwise, it is a truncated cone. //! error : r1 and r2 < resolution r1 or r2 negative abs(r1-r2) < resolution h < resolution h negative.

Parameters
----------
R1: float
R2: float
H: float

Returns
-------
None
") BRepPrim_Cone;
		 BRepPrim_Cone(const Standard_Real R1, const Standard_Real R2, const Standard_Real H);

		/****************** BRepPrim_Cone ******************/
		%feature("compactdefaultargs") BRepPrim_Cone;
		%feature("autodoc", "Same as above but at a given point.

Parameters
----------
Center: gp_Pnt
R1: float
R2: float
H: float

Returns
-------
None
") BRepPrim_Cone;
		 BRepPrim_Cone(const gp_Pnt & Center, const Standard_Real R1, const Standard_Real R2, const Standard_Real H);

		/****************** BRepPrim_Cone ******************/
		%feature("compactdefaultargs") BRepPrim_Cone;
		%feature("autodoc", "Same as above with given axes system.

Parameters
----------
Axes: gp_Ax2
R1: float
R2: float
H: float

Returns
-------
None
") BRepPrim_Cone;
		 BRepPrim_Cone(const gp_Ax2 & Axes, const Standard_Real R1, const Standard_Real R2, const Standard_Real H);

		/****************** MakeEmptyLateralFace ******************/
		%feature("compactdefaultargs") MakeEmptyLateralFace;
		%feature("autodoc", "The surface normal should be directed towards the outside.

Returns
-------
TopoDS_Face
") MakeEmptyLateralFace;
		virtual TopoDS_Face MakeEmptyLateralFace();

};


%extend BRepPrim_Cone {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepPrim_Cylinder *
**************************/
class BRepPrim_Cylinder : public BRepPrim_Revolution {
	public:
		/****************** BRepPrim_Cylinder ******************/
		%feature("compactdefaultargs") BRepPrim_Cylinder;
		%feature("autodoc", "The step definition position : center of a face and axis radius : radius of cylinder height : distance between faces on positive side //! errors : height < resolution radius < resolution.

Parameters
----------
Position: gp_Ax2
Radius: float
Height: float

Returns
-------
None
") BRepPrim_Cylinder;
		 BRepPrim_Cylinder(const gp_Ax2 & Position, const Standard_Real Radius, const Standard_Real Height);

		/****************** BRepPrim_Cylinder ******************/
		%feature("compactdefaultargs") BRepPrim_Cylinder;
		%feature("autodoc", "Infinite cylinder at origin on z negative.

Parameters
----------
Radius: float

Returns
-------
None
") BRepPrim_Cylinder;
		 BRepPrim_Cylinder(const Standard_Real Radius);

		/****************** BRepPrim_Cylinder ******************/
		%feature("compactdefaultargs") BRepPrim_Cylinder;
		%feature("autodoc", "Infinite cylinder at center on z negative.

Parameters
----------
Center: gp_Pnt
Radius: float

Returns
-------
None
") BRepPrim_Cylinder;
		 BRepPrim_Cylinder(const gp_Pnt & Center, const Standard_Real Radius);

		/****************** BRepPrim_Cylinder ******************/
		%feature("compactdefaultargs") BRepPrim_Cylinder;
		%feature("autodoc", "Infinite cylinder at axes on z negative.

Parameters
----------
Axes: gp_Ax2
Radius: float

Returns
-------
None
") BRepPrim_Cylinder;
		 BRepPrim_Cylinder(const gp_Ax2 & Axes, const Standard_Real Radius);

		/****************** BRepPrim_Cylinder ******************/
		%feature("compactdefaultargs") BRepPrim_Cylinder;
		%feature("autodoc", "Create a cylinder at origin on z axis, of height h and radius r error : radius < resolution h < resolution h negative.

Parameters
----------
R: float
H: float

Returns
-------
None
") BRepPrim_Cylinder;
		 BRepPrim_Cylinder(const Standard_Real R, const Standard_Real H);

		/****************** BRepPrim_Cylinder ******************/
		%feature("compactdefaultargs") BRepPrim_Cylinder;
		%feature("autodoc", "Same as above but at a given point.

Parameters
----------
Center: gp_Pnt
R: float
H: float

Returns
-------
None
") BRepPrim_Cylinder;
		 BRepPrim_Cylinder(const gp_Pnt & Center, const Standard_Real R, const Standard_Real H);

		/****************** MakeEmptyLateralFace ******************/
		%feature("compactdefaultargs") MakeEmptyLateralFace;
		%feature("autodoc", "The surface normal should be directed towards the outside.

Returns
-------
TopoDS_Face
") MakeEmptyLateralFace;
		virtual TopoDS_Face MakeEmptyLateralFace();

};


%extend BRepPrim_Cylinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class BRepPrim_Sphere *
************************/
class BRepPrim_Sphere : public BRepPrim_Revolution {
	public:
		/****************** BRepPrim_Sphere ******************/
		%feature("compactdefaultargs") BRepPrim_Sphere;
		%feature("autodoc", "Creates a sphere at origin with radius. the axes of the sphere are the reference axes. an error is raised if the radius is < resolution.

Parameters
----------
Radius: float

Returns
-------
None
") BRepPrim_Sphere;
		 BRepPrim_Sphere(const Standard_Real Radius);

		/****************** BRepPrim_Sphere ******************/
		%feature("compactdefaultargs") BRepPrim_Sphere;
		%feature("autodoc", "Creates a sphere with center and radius. axes are the referrence axes. this is the step constructor.

Parameters
----------
Center: gp_Pnt
Radius: float

Returns
-------
None
") BRepPrim_Sphere;
		 BRepPrim_Sphere(const gp_Pnt & Center, const Standard_Real Radius);

		/****************** BRepPrim_Sphere ******************/
		%feature("compactdefaultargs") BRepPrim_Sphere;
		%feature("autodoc", "Creates a sphere with given axes system.

Parameters
----------
Axes: gp_Ax2
Radius: float

Returns
-------
None
") BRepPrim_Sphere;
		 BRepPrim_Sphere(const gp_Ax2 & Axes, const Standard_Real Radius);

		/****************** MakeEmptyLateralFace ******************/
		%feature("compactdefaultargs") MakeEmptyLateralFace;
		%feature("autodoc", "The surface normal should be directed towards the outside.

Returns
-------
TopoDS_Face
") MakeEmptyLateralFace;
		virtual TopoDS_Face MakeEmptyLateralFace();

};


%extend BRepPrim_Sphere {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class BRepPrim_Torus *
***********************/
class BRepPrim_Torus : public BRepPrim_Revolution {
	public:
		/****************** BRepPrim_Torus ******************/
		%feature("compactdefaultargs") BRepPrim_Torus;
		%feature("autodoc", "The step definition position : center and axes major, minor : radii //! errors : major < resolution minor < resolution.

Parameters
----------
Position: gp_Ax2
Major: float
Minor: float

Returns
-------
None
") BRepPrim_Torus;
		 BRepPrim_Torus(const gp_Ax2 & Position, const Standard_Real Major, const Standard_Real Minor);

		/****************** BRepPrim_Torus ******************/
		%feature("compactdefaultargs") BRepPrim_Torus;
		%feature("autodoc", "Torus centered at origin.

Parameters
----------
Major: float
Minor: float

Returns
-------
None
") BRepPrim_Torus;
		 BRepPrim_Torus(const Standard_Real Major, const Standard_Real Minor);

		/****************** BRepPrim_Torus ******************/
		%feature("compactdefaultargs") BRepPrim_Torus;
		%feature("autodoc", "Torus at center.

Parameters
----------
Center: gp_Pnt
Major: float
Minor: float

Returns
-------
None
") BRepPrim_Torus;
		 BRepPrim_Torus(const gp_Pnt & Center, const Standard_Real Major, const Standard_Real Minor);

		/****************** MakeEmptyLateralFace ******************/
		%feature("compactdefaultargs") MakeEmptyLateralFace;
		%feature("autodoc", "The surface normal should be directed towards the outside.

Returns
-------
TopoDS_Face
") MakeEmptyLateralFace;
		virtual TopoDS_Face MakeEmptyLateralFace();

};


%extend BRepPrim_Torus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
