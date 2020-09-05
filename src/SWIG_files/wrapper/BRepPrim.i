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
from enum import IntEnum
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

class BRepPrim_Direction(IntEnum):
	BRepPrim_XMin = 0
	BRepPrim_XMax = 1
	BRepPrim_YMin = 2
	BRepPrim_YMax = 3
	BRepPrim_ZMin = 4
	BRepPrim_ZMax = 5
BRepPrim_XMin = BRepPrim_Direction.BRepPrim_XMin
BRepPrim_XMax = BRepPrim_Direction.BRepPrim_XMax
BRepPrim_YMin = BRepPrim_Direction.BRepPrim_YMin
BRepPrim_YMax = BRepPrim_Direction.BRepPrim_YMax
BRepPrim_ZMin = BRepPrim_Direction.BRepPrim_ZMin
BRepPrim_ZMax = BRepPrim_Direction.BRepPrim_ZMax
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
		/**** md5 signature: d39d0b6fde78f20a7504efe22c7e0763 ****/
		%feature("compactdefaultargs") BRepPrim_Builder;
		%feature("autodoc", "Creates an empty, useless builder. necesseray for compilation.

Returns
-------
None
") BRepPrim_Builder;
		 BRepPrim_Builder();

		/****************** BRepPrim_Builder ******************/
		/**** md5 signature: d35b9752dc1460a7c056a321b4d55ea1 ****/
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
		/**** md5 signature: 6f53515e7cce4cf475d8fb8d1dc2d077 ****/
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
		/**** md5 signature: e1f1f3259a33316b4b0620b5dc3101e6 ****/
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
		/**** md5 signature: 2a83461df737a0f4a3acdaf75556ee0e ****/
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
		/**** md5 signature: 14b9772b177e00751a82f1e6eb05d592 ****/
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
		/**** md5 signature: 35ba979185bf17962e695e9244060701 ****/
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
		/**** md5 signature: 0e400544facfe2a99c354fd61331d22b ****/
		%feature("compactdefaultargs") Builder;
		%feature("autodoc", "No available documentation.

Returns
-------
BRep_Builder
") Builder;
		const BRep_Builder & Builder();

		/****************** CompleteEdge ******************/
		/**** md5 signature: d730676546d85b4bd88605dd1599b062 ****/
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
		/**** md5 signature: 9fdae44dae4b2388e5169847accfb8d8 ****/
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
		/**** md5 signature: 2b94b7cc886da1f27ada604cd72b092c ****/
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
		/**** md5 signature: 53c17c6669114aebdc50b6c0031cfb8d ****/
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
		/**** md5 signature: 703a262cbf47cf2cc0cc8cbc76fb4997 ****/
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
		/**** md5 signature: 2acfeb2087ea3647f64fad71cb7d736c ****/
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
		/**** md5 signature: f3f9c90b34065966cff70f6a24c006e2 ****/
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
		/**** md5 signature: e4bfbfee4d4a2491c4c776a066dcd6e9 ****/
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
		/**** md5 signature: 2854985e778e4f5296d3dcce3926dae9 ****/
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
		/**** md5 signature: aea78d8a1e62c33f652543f4fdefc33c ****/
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
		/**** md5 signature: a7807363bff6d0d52ee9e63114e705f0 ****/
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
		/**** md5 signature: 170808229bc7fb43f109beb51219144c ****/
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
		/**** md5 signature: e65cb236e9d1dcb14460f8ffa09b72cb ****/
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
		/**** md5 signature: 3f5d6438734ac9ae64b3691e211f2fe1 ****/
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
		/**** md5 signature: 6e66ca01d676dd1712cfd0fbe3284460 ****/
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
		/**** md5 signature: e5c2f16c6f9bf82902e3c5354144fd14 ****/
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
		/**** md5 signature: 463f01a2bbda2d3518e3fa5d511804ca ****/
		%feature("compactdefaultargs") BRepPrim_FaceBuilder;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepPrim_FaceBuilder;
		 BRepPrim_FaceBuilder();

		/****************** BRepPrim_FaceBuilder ******************/
		/**** md5 signature: 11490bad0e7109bcdd92e1631f2eec5d ****/
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
		/**** md5 signature: 77807a8c6d982a6a0e34b40d3bba46a3 ****/
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
		/**** md5 signature: 42b39345502468321490e229b9ed050c ****/
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
		/**** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face();

		/****************** Init ******************/
		/**** md5 signature: 143ab27f30670d4a5bf356eb1f51531f ****/
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
		/**** md5 signature: 26f1dc48d1dcbc23d88fc45d428255ae ****/
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
		/**** md5 signature: 1cd4dfe5cbf55dbe74ca8c7dfb89999c ****/
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
		/**** md5 signature: e294f9bebd8cc9ff98c19af2e7410e35 ****/
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
		/**** md5 signature: 847889616a632de9ce27e3dfe094bb46 ****/
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
		/**** md5 signature: d334fb521e652e32b1e6156305b9756c ****/
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
		/**** md5 signature: 5cce2f6c839d20c7e40bd43ff35d90ff ****/
		%feature("compactdefaultargs") Axes;
		%feature("autodoc", "Returns the coordinates system from <self>.

Returns
-------
gp_Ax2
") Axes;
		gp_Ax2 Axes();

		/****************** Close ******************/
		/**** md5 signature: 8a6b334d6643de950e51d0dac3cf9567 ****/
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
		/**** md5 signature: 560d56d26d1414fcce336848602e1dc3 ****/
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
		/**** md5 signature: eb3c5e0095ca13cae1498f229df66063 ****/
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
		/**** md5 signature: babbbfd397c1efdc258884663a21c99b ****/
		%feature("compactdefaultargs") GetX2Max;
		%feature("autodoc", "Returns x2max value from <self>.

Returns
-------
float
") GetX2Max;
		Standard_Real GetX2Max();

		/****************** GetX2Min ******************/
		/**** md5 signature: 0a40c3c9c54ec4e54fecd27b53aa2d96 ****/
		%feature("compactdefaultargs") GetX2Min;
		%feature("autodoc", "Returns x2min value from <self>.

Returns
-------
float
") GetX2Min;
		Standard_Real GetX2Min();

		/****************** GetXMax ******************/
		/**** md5 signature: 89241f7ad0cd880ace7f0986ef5f9f69 ****/
		%feature("compactdefaultargs") GetXMax;
		%feature("autodoc", "Returns xmax value from <self>.

Returns
-------
float
") GetXMax;
		Standard_Real GetXMax();

		/****************** GetXMin ******************/
		/**** md5 signature: d7992ddefa160df5f96a2a3533191e53 ****/
		%feature("compactdefaultargs") GetXMin;
		%feature("autodoc", "Returns xmin value from <self>.

Returns
-------
float
") GetXMin;
		Standard_Real GetXMin();

		/****************** GetYMax ******************/
		/**** md5 signature: 58f0cd3a82eb7ddb0b0b6801d800b912 ****/
		%feature("compactdefaultargs") GetYMax;
		%feature("autodoc", "Returns ymax value from <self>.

Returns
-------
float
") GetYMax;
		Standard_Real GetYMax();

		/****************** GetYMin ******************/
		/**** md5 signature: 229d1cfe7ce27ed168565ce63df04039 ****/
		%feature("compactdefaultargs") GetYMin;
		%feature("autodoc", "Returns ymin value from <self>.

Returns
-------
float
") GetYMin;
		Standard_Real GetYMin();

		/****************** GetZ2Max ******************/
		/**** md5 signature: 3f6d0e8bc5842b300bcb476636139406 ****/
		%feature("compactdefaultargs") GetZ2Max;
		%feature("autodoc", "Returns z2max value from <self>.

Returns
-------
float
") GetZ2Max;
		Standard_Real GetZ2Max();

		/****************** GetZ2Min ******************/
		/**** md5 signature: abe08f96ee7133799469e33037af94cd ****/
		%feature("compactdefaultargs") GetZ2Min;
		%feature("autodoc", "Returns z2min value from <self>.

Returns
-------
float
") GetZ2Min;
		Standard_Real GetZ2Min();

		/****************** GetZMax ******************/
		/**** md5 signature: 32c33af83170b4d42ae02c8990ff8ea3 ****/
		%feature("compactdefaultargs") GetZMax;
		%feature("autodoc", "Returns zmax value from <self>.

Returns
-------
float
") GetZMax;
		Standard_Real GetZMax();

		/****************** GetZMin ******************/
		/**** md5 signature: a379616f1dee6c082c654e8c13891637 ****/
		%feature("compactdefaultargs") GetZMin;
		%feature("autodoc", "Returns zmin value from <self>.

Returns
-------
float
") GetZMin;
		Standard_Real GetZMin();

		/****************** HasEdge ******************/
		/**** md5 signature: 7739a38be24eb46408b92e60b3ed5c86 ****/
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
		/**** md5 signature: c9d41b14ac628ba1e79756dffee9967d ****/
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
		/**** md5 signature: eaac55ce26adfcac0a4f2a1f65c03aa5 ****/
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
		/**** md5 signature: 48fdc8573de4d5206e01f01f3e2e88c6 ****/
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
		/**** md5 signature: 84e23051e341ae0e7b22f457a416c2bd ****/
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
		/**** md5 signature: a1e5b46f6b4d553242cfea988954fad7 ****/
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
		/**** md5 signature: 2e0f8eb050fe600ffb46a7cdbe2bbb22 ****/
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
		/**** md5 signature: 51c67370aa0e64e1c9393357876cc1d4 ****/
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
		/**** md5 signature: 28c8bee4abcaab436e78c827c6244f30 ****/
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
		/**** md5 signature: 642de93edbb586600e27d55251851e8c ****/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "Returns the shell containing the faces of <self>.

Returns
-------
TopoDS_Shell
") Shell;
		const TopoDS_Shell Shell();

		/****************** Vertex ******************/
		/**** md5 signature: a17642c94fed62613aae4458cb0c69a7 ****/
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
		/**** md5 signature: d4a72ad4acfb0d921fa8869ec16c3131 ****/
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
		/**** md5 signature: dce50192c350c43b54f2e88e94e5372a ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Angle;
		Standard_Real Angle();

		/****************** Angle ******************/
		/**** md5 signature: 497ba1204f8a2afc37be082f6d813cb9 ****/
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
		/**** md5 signature: e675cba0965d216240eda82653f8ee1f ****/
		%feature("compactdefaultargs") Axes;
		%feature("autodoc", "Returns the ax2 from <self>.

Returns
-------
gp_Ax2
") Axes;
		const gp_Ax2 Axes();

		/****************** Axes ******************/
		/**** md5 signature: 7ccd426658d93b46bcc77db3a6b35786 ****/
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
		/**** md5 signature: 9d25327339f786a3ce86ab0e8f3c393e ****/
		%feature("compactdefaultargs") AxisBottomVertex;
		%feature("autodoc", "Returns the vertex at the bottom altitude on the axis.

Returns
-------
TopoDS_Vertex
") AxisBottomVertex;
		const TopoDS_Vertex AxisBottomVertex();

		/****************** AxisEdge ******************/
		/**** md5 signature: a0397f9fe3224f5fbcfaa8de9c47d870 ****/
		%feature("compactdefaultargs") AxisEdge;
		%feature("autodoc", "Returns the edge built along the axis and oriented on +z of the axis.

Returns
-------
TopoDS_Edge
") AxisEdge;
		const TopoDS_Edge AxisEdge();

		/****************** AxisEndWire ******************/
		/**** md5 signature: cfd7b259580fe79b5976240119bdbd2b ****/
		%feature("compactdefaultargs") AxisEndWire;
		%feature("autodoc", "Returns the wire in the end face with the axisedge.

Returns
-------
TopoDS_Wire
") AxisEndWire;
		const TopoDS_Wire AxisEndWire();

		/****************** AxisStartWire ******************/
		/**** md5 signature: 734f2956cf4b2f5718064af99f6e2417 ****/
		%feature("compactdefaultargs") AxisStartWire;
		%feature("autodoc", "Returns the wire in the start face with the axisedge.

Returns
-------
TopoDS_Wire
") AxisStartWire;
		const TopoDS_Wire AxisStartWire();

		/****************** AxisTopVertex ******************/
		/**** md5 signature: ba7bb81c2907acd2ca24825826289de8 ****/
		%feature("compactdefaultargs") AxisTopVertex;
		%feature("autodoc", "Returns the vertex at the top altitude on the axis.

Returns
-------
TopoDS_Vertex
") AxisTopVertex;
		const TopoDS_Vertex AxisTopVertex();

		/****************** BottomEdge ******************/
		/**** md5 signature: 4da4829810b02bba039fd3cb84054a3e ****/
		%feature("compactdefaultargs") BottomEdge;
		%feature("autodoc", "Returns the edge at vmin. if meridianclosed() the topedge and the bottomedge are the same edge.

Returns
-------
TopoDS_Edge
") BottomEdge;
		const TopoDS_Edge BottomEdge();

		/****************** BottomEndVertex ******************/
		/**** md5 signature: f01d0f77a1e34bbd806bac3659f37ecd ****/
		%feature("compactdefaultargs") BottomEndVertex;
		%feature("autodoc", "Returns the vertex (angle,vmax).

Returns
-------
TopoDS_Vertex
") BottomEndVertex;
		const TopoDS_Vertex BottomEndVertex();

		/****************** BottomFace ******************/
		/**** md5 signature: d868072c1474b9c120740f20d5db6dfe ****/
		%feature("compactdefaultargs") BottomFace;
		%feature("autodoc", "Returns the bottom planar face. it is oriented toward the -z axis (outside).

Returns
-------
TopoDS_Face
") BottomFace;
		const TopoDS_Face BottomFace();

		/****************** BottomStartVertex ******************/
		/**** md5 signature: 327ca1d77d810fbe1d3d371fb4113074 ****/
		%feature("compactdefaultargs") BottomStartVertex;
		%feature("autodoc", "Returns the vertex (0,vmin).

Returns
-------
TopoDS_Vertex
") BottomStartVertex;
		const TopoDS_Vertex BottomStartVertex();

		/****************** BottomWire ******************/
		/**** md5 signature: cdbee66603e77f7ebb4901f69d4de2f4 ****/
		%feature("compactdefaultargs") BottomWire;
		%feature("autodoc", "Returns the wire in the bottom face.

Returns
-------
TopoDS_Wire
") BottomWire;
		const TopoDS_Wire BottomWire();

		/****************** EndBottomEdge ******************/
		/**** md5 signature: b06c39f4d51e346e4a01a7c5b64f38a7 ****/
		%feature("compactdefaultargs") EndBottomEdge;
		%feature("autodoc", "Returns the linear edge between end face and bottom face.

Returns
-------
TopoDS_Edge
") EndBottomEdge;
		const TopoDS_Edge EndBottomEdge();

		/****************** EndEdge ******************/
		/**** md5 signature: 674c1c918955150164f59e70b53eb062 ****/
		%feature("compactdefaultargs") EndEdge;
		%feature("autodoc", "Returns the edge at angle angle. if !hassides() the startedge and the endedge are the same edge.

Returns
-------
TopoDS_Edge
") EndEdge;
		const TopoDS_Edge EndEdge();

		/****************** EndFace ******************/
		/**** md5 signature: 3d80e58583e16de7a28cd94972d4ce27 ****/
		%feature("compactdefaultargs") EndFace;
		%feature("autodoc", "Returns the face ending the slice, it is oriented toward the exterior of the primitive.

Returns
-------
TopoDS_Face
") EndFace;
		const TopoDS_Face EndFace();

		/****************** EndTopEdge ******************/
		/**** md5 signature: c8bcdde35414fa94db93c05ad703ed07 ****/
		%feature("compactdefaultargs") EndTopEdge;
		%feature("autodoc", "Returns the linear edge between end face and top face.

Returns
-------
TopoDS_Edge
") EndTopEdge;
		const TopoDS_Edge EndTopEdge();

		/****************** EndWire ******************/
		/**** md5 signature: 2af237ee40b2833e37a160fc0d52a268 ****/
		%feature("compactdefaultargs") EndWire;
		%feature("autodoc", "Returns the wire in the end face.

Returns
-------
TopoDS_Wire
") EndWire;
		const TopoDS_Wire EndWire();

		/****************** HasBottom ******************/
		/**** md5 signature: 67ebc11d924fceccdfa8e27bbbed4353 ****/
		%feature("compactdefaultargs") HasBottom;
		%feature("autodoc", "Returns true if there is a bottom face. //! that is neither : vmininfinite() meridianclosed() meridianonaxis(vmin).

Returns
-------
bool
") HasBottom;
		virtual Standard_Boolean HasBottom();

		/****************** HasSides ******************/
		/**** md5 signature: f5a003195b8808d511dd17deed132597 ****/
		%feature("compactdefaultargs") HasSides;
		%feature("autodoc", "Returns true if there are start and end faces. //! that is : 2*pi - angle > precision::angular().

Returns
-------
bool
") HasSides;
		virtual Standard_Boolean HasSides();

		/****************** HasTop ******************/
		/**** md5 signature: 577e87a04211a53eddde29543f98f3af ****/
		%feature("compactdefaultargs") HasTop;
		%feature("autodoc", "Returns true if there is a top face. //! that is neither : vmaxinfinite() meridianclosed() meridianonaxis(vmax).

Returns
-------
bool
") HasTop;
		virtual Standard_Boolean HasTop();

		/****************** LateralEndWire ******************/
		/**** md5 signature: 899f794d1a1347608997259354dd6495 ****/
		%feature("compactdefaultargs") LateralEndWire;
		%feature("autodoc", "Returns the wire with in lateral face with the end edge.

Returns
-------
TopoDS_Wire
") LateralEndWire;
		const TopoDS_Wire LateralEndWire();

		/****************** LateralFace ******************/
		/**** md5 signature: dd330acf3abf48dc33bbea1f7f940dde ****/
		%feature("compactdefaultargs") LateralFace;
		%feature("autodoc", "Returns the lateral face. it is oriented toward the outside of the primitive.

Returns
-------
TopoDS_Face
") LateralFace;
		const TopoDS_Face LateralFace();

		/****************** LateralStartWire ******************/
		/**** md5 signature: 3f37a9998a483da5be3239aa2061941b ****/
		%feature("compactdefaultargs") LateralStartWire;
		%feature("autodoc", "Returns the wire in the lateral face with the start edge.

Returns
-------
TopoDS_Wire
") LateralStartWire;
		const TopoDS_Wire LateralStartWire();

		/****************** LateralWire ******************/
		/**** md5 signature: c5a61106c726e9c71398e937f0a3a35f ****/
		%feature("compactdefaultargs") LateralWire;
		%feature("autodoc", "Returns the wire in the lateral face.

Returns
-------
TopoDS_Wire
") LateralWire;
		const TopoDS_Wire LateralWire();

		/****************** MakeEmptyLateralFace ******************/
		/**** md5 signature: b11e64ac863b45f01b201889e1d5bc0c ****/
		%feature("compactdefaultargs") MakeEmptyLateralFace;
		%feature("autodoc", "Returns a face with no edges. the surface is the lateral surface with normals pointing outward. the u parameter is the angle with the origin on the x axis. the v parameter is the parameter of the meridian.

Returns
-------
TopoDS_Face
") MakeEmptyLateralFace;
		virtual TopoDS_Face MakeEmptyLateralFace();

		/****************** MakeEmptyMeridianEdge ******************/
		/**** md5 signature: 630b1d866184613e5afe43bdb32460bf ****/
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
		/**** md5 signature: edc1439a02d2c9f36d6ec41c028c36f7 ****/
		%feature("compactdefaultargs") MeridianClosed;
		%feature("autodoc", "Returns true if the meridian is closed. default implementation  is meridianvalue(vmin).isequal(meridianvalue(vmax), precision::confusion()).

Returns
-------
bool
") MeridianClosed;
		virtual Standard_Boolean MeridianClosed();

		/****************** MeridianOnAxis ******************/
		/**** md5 signature: c56871a41603e5716c9059ee2b162ce6 ****/
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
		/**** md5 signature: 77bae71d5a4543ab091837bcde019a30 ****/
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
		/**** md5 signature: 57d60f2bbffbd56cb78726ee7410c7a5 ****/
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
		/**** md5 signature: f204da19ac16bdfcd6a614a239776158 ****/
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
		/**** md5 signature: 642de93edbb586600e27d55251851e8c ****/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "Returns the shell containing all the faces of the primitive.

Returns
-------
TopoDS_Shell
") Shell;
		const TopoDS_Shell Shell();

		/****************** StartBottomEdge ******************/
		/**** md5 signature: 37ff55111b1297cf786f259b8fbef721 ****/
		%feature("compactdefaultargs") StartBottomEdge;
		%feature("autodoc", "Returns the linear edge between start face and bottom face.

Returns
-------
TopoDS_Edge
") StartBottomEdge;
		const TopoDS_Edge StartBottomEdge();

		/****************** StartEdge ******************/
		/**** md5 signature: 4ff5c9d45d5f0785b08c7cd1ee9625eb ****/
		%feature("compactdefaultargs") StartEdge;
		%feature("autodoc", "Returns the edge at angle 0.

Returns
-------
TopoDS_Edge
") StartEdge;
		const TopoDS_Edge StartEdge();

		/****************** StartFace ******************/
		/**** md5 signature: c8fc504f031d7ae502cdd8218e7dc765 ****/
		%feature("compactdefaultargs") StartFace;
		%feature("autodoc", "Returns the face starting the slice, it is oriented toward the exterior of the primitive.

Returns
-------
TopoDS_Face
") StartFace;
		const TopoDS_Face StartFace();

		/****************** StartTopEdge ******************/
		/**** md5 signature: 20ccec7c0f151d4d1e43f1032396e6c4 ****/
		%feature("compactdefaultargs") StartTopEdge;
		%feature("autodoc", "Returns the linear edge between start face and top face.

Returns
-------
TopoDS_Edge
") StartTopEdge;
		const TopoDS_Edge StartTopEdge();

		/****************** StartWire ******************/
		/**** md5 signature: a18257594fa0e66c8cd528233d760e02 ****/
		%feature("compactdefaultargs") StartWire;
		%feature("autodoc", "Returns the wire in the start face.

Returns
-------
TopoDS_Wire
") StartWire;
		const TopoDS_Wire StartWire();

		/****************** TopEdge ******************/
		/**** md5 signature: e41c9e41a600f953c06e361e016249bf ****/
		%feature("compactdefaultargs") TopEdge;
		%feature("autodoc", "Returns the edge at vmax. if meridianclosed() the topedge and the bottomedge are the same edge.

Returns
-------
TopoDS_Edge
") TopEdge;
		const TopoDS_Edge TopEdge();

		/****************** TopEndVertex ******************/
		/**** md5 signature: ba2ba5c1632b55e9bc10837938ce0668 ****/
		%feature("compactdefaultargs") TopEndVertex;
		%feature("autodoc", "Returns the vertex (angle,vmax).

Returns
-------
TopoDS_Vertex
") TopEndVertex;
		const TopoDS_Vertex TopEndVertex();

		/****************** TopFace ******************/
		/**** md5 signature: dd32adf6486145b103460dda0a299106 ****/
		%feature("compactdefaultargs") TopFace;
		%feature("autodoc", "Returns the top planar face. it is oriented toward the +z axis (outside).

Returns
-------
TopoDS_Face
") TopFace;
		const TopoDS_Face TopFace();

		/****************** TopStartVertex ******************/
		/**** md5 signature: 7996dc2e958e3fddc2e0484b60ee14b1 ****/
		%feature("compactdefaultargs") TopStartVertex;
		%feature("autodoc", "Returns the vertex (0,vmax).

Returns
-------
TopoDS_Vertex
") TopStartVertex;
		const TopoDS_Vertex TopStartVertex();

		/****************** TopWire ******************/
		/**** md5 signature: a708eba831e170761a0bc25c468ccb83 ****/
		%feature("compactdefaultargs") TopWire;
		%feature("autodoc", "Returns the wire in the top face.

Returns
-------
TopoDS_Wire
") TopWire;
		const TopoDS_Wire TopWire();

		/****************** VMax ******************/
		/**** md5 signature: 6ba449f1673839cb57aa34cf35972dc8 ****/
		%feature("compactdefaultargs") VMax;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") VMax;
		Standard_Real VMax();

		/****************** VMax ******************/
		/**** md5 signature: 4d2ece54a3dcfaa75034890d806456d6 ****/
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
		/**** md5 signature: bc5e6bf58b2b94b7629b77aba92be11a ****/
		%feature("compactdefaultargs") VMaxInfinite;
		%feature("autodoc", "Returns true if vmax is infinite. default precision::ispositiveinfinite(vmax);.

Returns
-------
bool
") VMaxInfinite;
		virtual Standard_Boolean VMaxInfinite();

		/****************** VMin ******************/
		/**** md5 signature: 040bbb0b02e9760bd9cc365baf132106 ****/
		%feature("compactdefaultargs") VMin;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") VMin;
		Standard_Real VMin();

		/****************** VMin ******************/
		/**** md5 signature: 80c307fc99a90b90ba8114e32ab29e1c ****/
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
		/**** md5 signature: 27a668d561b75d084aa96ca8eb0fdb0c ****/
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
		/**** md5 signature: 5b1b3e93df885b1a31c4614f6b9d1d95 ****/
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
		/**** md5 signature: 738dd0904668b5ba6d89ecb17808ecaa ****/
		%feature("compactdefaultargs") MakeEmptyLateralFace;
		%feature("autodoc", "The surface normal should be directed towards the outside.

Returns
-------
TopoDS_Face
") MakeEmptyLateralFace;
		virtual TopoDS_Face MakeEmptyLateralFace();

		/****************** MakeEmptyMeridianEdge ******************/
		/**** md5 signature: 4d215bd790df5e01ce96f5dbaa5d1db7 ****/
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
		/**** md5 signature: 9d4d43f257bd22d9185c780792d00919 ****/
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
		/**** md5 signature: e37059cc6abb428a1b857783ea7e2db5 ****/
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
		/**** md5 signature: 271e307dbdf1baea793184df8b5a17db ****/
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
		/**** md5 signature: 540cdfd1a8a68594ffc6280824cadd02 ****/
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
		/**** md5 signature: c9d14cf56f80cb299d68a75d83cba983 ****/
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
		/**** md5 signature: ff8d3b1ee270eff718ccc66335fc7cbc ****/
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
		/**** md5 signature: c043b204d09754bd1015524e5a103d2a ****/
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
		/**** md5 signature: c0b45e6511e50885e9fcf84e237c5aa1 ****/
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
		/**** md5 signature: 6f65f34c26695c819b590ce393be91ba ****/
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
		/**** md5 signature: c4131a519320058db92d9b9b4a62b4e1 ****/
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
		/**** md5 signature: ba64b29b0668019a05dc949aab6770f7 ****/
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
		/**** md5 signature: a0f74a87d71dc02fbc406ad9fd16e941 ****/
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
		/**** md5 signature: b5adc273756debb03c54f3ada5247082 ****/
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
		/**** md5 signature: 2d8fc92ca4c80bbef73bb95de9c4fa4e ****/
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
		/**** md5 signature: ecc1d1a7f9b1d641e94a9b2cbeaf6532 ****/
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
		/**** md5 signature: fb91e5b01da7587cf83484e8f6b4331b ****/
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
		/**** md5 signature: c6ae35bea3254cadd17db7280137bea7 ****/
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
		/**** md5 signature: 70f6d404a95f20f5c7464246f08067a7 ****/
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
		/**** md5 signature: 6910efd5aeea5eed4574043c57b67161 ****/
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
		/**** md5 signature: b5adc273756debb03c54f3ada5247082 ****/
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
		/**** md5 signature: a69f71dc958ffcbd14404b395674a725 ****/
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
		/**** md5 signature: 40fe35bc704dd685fcd8f42947b874a9 ****/
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
		/**** md5 signature: 7ff355f910ca0fd149e933f970dbb666 ****/
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
		/**** md5 signature: b5adc273756debb03c54f3ada5247082 ****/
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
		/**** md5 signature: a73ba5d8cdf7a0859b5f42eec6316a19 ****/
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
		/**** md5 signature: 96236fbf921e8d6d410e179a02cc89de ****/
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
		/**** md5 signature: e161468c8e037f5911e3faeb41308f3b ****/
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
		/**** md5 signature: b5adc273756debb03c54f3ada5247082 ****/
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
