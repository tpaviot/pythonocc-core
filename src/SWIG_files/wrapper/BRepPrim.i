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
%define BREPPRIMDOCSTRING
"BRepPrim module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_brepprim.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
#include<Bnd_module.hxx>
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

/* python proxy classes for enums */
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
		/****** BRepPrim_Builder::BRepPrim_Builder ******/
		/****** md5 signature: d39d0b6fde78f20a7504efe22c7e0763 ******/
		%feature("compactdefaultargs") BRepPrim_Builder;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty, useless Builder. Necesseray for compilation.
") BRepPrim_Builder;
		 BRepPrim_Builder();

		/****** BRepPrim_Builder::BRepPrim_Builder ******/
		/****** md5 signature: d35b9752dc1460a7c056a321b4d55ea1 ******/
		%feature("compactdefaultargs") BRepPrim_Builder;
		%feature("autodoc", "
Parameters
----------
B: BRep_Builder

Return
-------
None

Description
-----------
Creates from a Builder.
") BRepPrim_Builder;
		 BRepPrim_Builder(const BRep_Builder & B);

		/****** BRepPrim_Builder::AddEdgeVertex ******/
		/****** md5 signature: 6f53515e7cce4cf475d8fb8d1dc2d077 ******/
		%feature("compactdefaultargs") AddEdgeVertex;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
V: TopoDS_Vertex
P: float
direct: bool

Return
-------
None

Description
-----------
Adds the Vertex <V> in the Edge <E>. <P> is the parameter of the vertex on the edge. If direct is False the Vertex is reversed.
") AddEdgeVertex;
		void AddEdgeVertex(TopoDS_Edge & E, const TopoDS_Vertex & V, const Standard_Real P, const Standard_Boolean direct);

		/****** BRepPrim_Builder::AddEdgeVertex ******/
		/****** md5 signature: e1f1f3259a33316b4b0620b5dc3101e6 ******/
		%feature("compactdefaultargs") AddEdgeVertex;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
V: TopoDS_Vertex
P1: float
P2: float

Return
-------
None

Description
-----------
Adds the Vertex <V> in the Edge <E>. <P1,P2> are the parameters of the vertex on the closed edge.
") AddEdgeVertex;
		void AddEdgeVertex(TopoDS_Edge & E, const TopoDS_Vertex & V, const Standard_Real P1, const Standard_Real P2);

		/****** BRepPrim_Builder::AddFaceWire ******/
		/****** md5 signature: 2a83461df737a0f4a3acdaf75556ee0e ******/
		%feature("compactdefaultargs") AddFaceWire;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
W: TopoDS_Wire

Return
-------
None

Description
-----------
Adds the Wire <W> in the Face <F>.
") AddFaceWire;
		void AddFaceWire(TopoDS_Face & F, const TopoDS_Wire & W);

		/****** BRepPrim_Builder::AddShellFace ******/
		/****** md5 signature: 14b9772b177e00751a82f1e6eb05d592 ******/
		%feature("compactdefaultargs") AddShellFace;
		%feature("autodoc", "
Parameters
----------
Sh: TopoDS_Shell
F: TopoDS_Face

Return
-------
None

Description
-----------
Adds the Face <F> in the Shell <Sh>.
") AddShellFace;
		void AddShellFace(TopoDS_Shell & Sh, const TopoDS_Face & F);

		/****** BRepPrim_Builder::AddWireEdge ******/
		/****** md5 signature: 35ba979185bf17962e695e9244060701 ******/
		%feature("compactdefaultargs") AddWireEdge;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire
E: TopoDS_Edge
direct: bool

Return
-------
None

Description
-----------
Adds the Edge <E> in the Wire <W>, if direct is False the Edge is reversed.
") AddWireEdge;
		void AddWireEdge(TopoDS_Wire & W, const TopoDS_Edge & E, const Standard_Boolean direct);

		/****** BRepPrim_Builder::Builder ******/
		/****** md5 signature: 0e400544facfe2a99c354fd61331d22b ******/
		%feature("compactdefaultargs") Builder;
		%feature("autodoc", "Return
-------
BRep_Builder

Description
-----------
No available documentation.
") Builder;
		const BRep_Builder & Builder();

		/****** BRepPrim_Builder::CompleteEdge ******/
		/****** md5 signature: d730676546d85b4bd88605dd1599b062 ******/
		%feature("compactdefaultargs") CompleteEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
None

Description
-----------
This is called once an edge is completed. It gives the opportunity to perform any post treatment.
") CompleteEdge;
		void CompleteEdge(TopoDS_Edge & E);

		/****** BRepPrim_Builder::CompleteFace ******/
		/****** md5 signature: 9fdae44dae4b2388e5169847accfb8d8 ******/
		%feature("compactdefaultargs") CompleteFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
None

Description
-----------
This is called once a face is completed. It gives the opportunity to perform any post treatment.
") CompleteFace;
		void CompleteFace(TopoDS_Face & F);

		/****** BRepPrim_Builder::CompleteShell ******/
		/****** md5 signature: 2b94b7cc886da1f27ada604cd72b092c ******/
		%feature("compactdefaultargs") CompleteShell;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shell

Return
-------
None

Description
-----------
This is called once a shell is completed. It gives the opportunity to perform any post treatment.
") CompleteShell;
		void CompleteShell(TopoDS_Shell & S);

		/****** BRepPrim_Builder::CompleteWire ******/
		/****** md5 signature: 53c17c6669114aebdc50b6c0031cfb8d ******/
		%feature("compactdefaultargs") CompleteWire;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire

Return
-------
None

Description
-----------
This is called once a wire is completed. It gives the opportunity to perform any post treatment.
") CompleteWire;
		void CompleteWire(TopoDS_Wire & W);

		/****** BRepPrim_Builder::MakeDegeneratedEdge ******/
		/****** md5 signature: 703a262cbf47cf2cc0cc8cbc76fb4997 ******/
		%feature("compactdefaultargs") MakeDegeneratedEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
None

Description
-----------
Returns in <E> a degenerated edge.
") MakeDegeneratedEdge;
		void MakeDegeneratedEdge(TopoDS_Edge & E);

		/****** BRepPrim_Builder::MakeEdge ******/
		/****** md5 signature: 2acfeb2087ea3647f64fad71cb7d736c ******/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
L: gp_Lin

Return
-------
None

Description
-----------
Returns in <E> an Edge built with the line equation <L>.
") MakeEdge;
		void MakeEdge(TopoDS_Edge & E, const gp_Lin & L);

		/****** BRepPrim_Builder::MakeEdge ******/
		/****** md5 signature: f3f9c90b34065966cff70f6a24c006e2 ******/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C: gp_Circ

Return
-------
None

Description
-----------
Returns in <E> an Edge built with the circle equation <C>.
") MakeEdge;
		void MakeEdge(TopoDS_Edge & E, const gp_Circ & C);

		/****** BRepPrim_Builder::MakeFace ******/
		/****** md5 signature: e4bfbfee4d4a2491c4c776a066dcd6e9 ******/
		%feature("compactdefaultargs") MakeFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
P: gp_Pln

Return
-------
None

Description
-----------
Returns in <F> a Face built with the plane equation <P>. Used by all primitives.
") MakeFace;
		void MakeFace(TopoDS_Face & F, const gp_Pln & P);

		/****** BRepPrim_Builder::MakeShell ******/
		/****** md5 signature: 2854985e778e4f5296d3dcce3926dae9 ******/
		%feature("compactdefaultargs") MakeShell;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shell

Return
-------
None

Description
-----------
Make a empty Shell.
") MakeShell;
		void MakeShell(TopoDS_Shell & S);

		/****** BRepPrim_Builder::MakeVertex ******/
		/****** md5 signature: aea78d8a1e62c33f652543f4fdefc33c ******/
		%feature("compactdefaultargs") MakeVertex;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
P: gp_Pnt

Return
-------
None

Description
-----------
Returns in <V> a Vertex built with the point <P>.
") MakeVertex;
		void MakeVertex(TopoDS_Vertex & V, const gp_Pnt & P);

		/****** BRepPrim_Builder::MakeWire ******/
		/****** md5 signature: a7807363bff6d0d52ee9e63114e705f0 ******/
		%feature("compactdefaultargs") MakeWire;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire

Return
-------
None

Description
-----------
Returns in <W> an empty Wire.
") MakeWire;
		void MakeWire(TopoDS_Wire & W);

		/****** BRepPrim_Builder::ReverseFace ******/
		/****** md5 signature: 170808229bc7fb43f109beb51219144c ******/
		%feature("compactdefaultargs") ReverseFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
None

Description
-----------
Reverses the Face <F>.
") ReverseFace;
		void ReverseFace(TopoDS_Face & F);

		/****** BRepPrim_Builder::SetPCurve ******/
		/****** md5 signature: e65cb236e9d1dcb14460f8ffa09b72cb ******/
		%feature("compactdefaultargs") SetPCurve;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
L: gp_Lin2d

Return
-------
None

Description
-----------
Sets the line <L> to be the curve representing the edge <E> in the parametric space of the surface of <F>.
") SetPCurve;
		void SetPCurve(TopoDS_Edge & E, const TopoDS_Face & F, const gp_Lin2d & L);

		/****** BRepPrim_Builder::SetPCurve ******/
		/****** md5 signature: 3f5d6438734ac9ae64b3691e211f2fe1 ******/
		%feature("compactdefaultargs") SetPCurve;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
L1: gp_Lin2d
L2: gp_Lin2d

Return
-------
None

Description
-----------
Sets the lines <L1,L2> to be the curves representing the edge <E> in the parametric space of the closed surface of <F>.
") SetPCurve;
		void SetPCurve(TopoDS_Edge & E, const TopoDS_Face & F, const gp_Lin2d & L1, const gp_Lin2d & L2);

		/****** BRepPrim_Builder::SetPCurve ******/
		/****** md5 signature: 6e66ca01d676dd1712cfd0fbe3284460 ******/
		%feature("compactdefaultargs") SetPCurve;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
C: gp_Circ2d

Return
-------
None

Description
-----------
Sets the circle <C> to be the curve representing the edge <E> in the parametric space of the surface of <F>.
") SetPCurve;
		void SetPCurve(TopoDS_Edge & E, const TopoDS_Face & F, const gp_Circ2d & C);

		/****** BRepPrim_Builder::SetParameters ******/
		/****** md5 signature: e5c2f16c6f9bf82902e3c5354144fd14 ******/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
V: TopoDS_Vertex
P1: float
P2: float

Return
-------
None

Description
-----------
<P1,P2> are the parameters of the vertex on the edge. The edge is a closed curve.
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
		/****** BRepPrim_FaceBuilder::BRepPrim_FaceBuilder ******/
		/****** md5 signature: 463f01a2bbda2d3518e3fa5d511804ca ******/
		%feature("compactdefaultargs") BRepPrim_FaceBuilder;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepPrim_FaceBuilder;
		 BRepPrim_FaceBuilder();

		/****** BRepPrim_FaceBuilder::BRepPrim_FaceBuilder ******/
		/****** md5 signature: 11490bad0e7109bcdd92e1631f2eec5d ******/
		%feature("compactdefaultargs") BRepPrim_FaceBuilder;
		%feature("autodoc", "
Parameters
----------
B: BRep_Builder
S: Geom_Surface

Return
-------
None

Description
-----------
No available documentation.
") BRepPrim_FaceBuilder;
		 BRepPrim_FaceBuilder(const BRep_Builder & B, const opencascade::handle<Geom_Surface> & S);

		/****** BRepPrim_FaceBuilder::BRepPrim_FaceBuilder ******/
		/****** md5 signature: 77807a8c6d982a6a0e34b40d3bba46a3 ******/
		%feature("compactdefaultargs") BRepPrim_FaceBuilder;
		%feature("autodoc", "
Parameters
----------
B: BRep_Builder
S: Geom_Surface
UMin: float
UMax: float
VMin: float
VMax: float

Return
-------
None

Description
-----------
No available documentation.
") BRepPrim_FaceBuilder;
		 BRepPrim_FaceBuilder(const BRep_Builder & B, const opencascade::handle<Geom_Surface> & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax);

		/****** BRepPrim_FaceBuilder::Edge ******/
		/****** md5 signature: 42b39345502468321490e229b9ed050c ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopoDS_Edge

Description
-----------
Returns the edge of index <I> 1 - Edge VMin 2 - Edge UMax 3 - Edge VMax 4 - Edge UMin.
") Edge;
		const TopoDS_Edge Edge(const Standard_Integer I);

		/****** BRepPrim_FaceBuilder::Face ******/
		/****** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") Face;
		const TopoDS_Face Face();

		/****** BRepPrim_FaceBuilder::Init ******/
		/****** md5 signature: 143ab27f30670d4a5bf356eb1f51531f ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
B: BRep_Builder
S: Geom_Surface

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const BRep_Builder & B, const opencascade::handle<Geom_Surface> & S);

		/****** BRepPrim_FaceBuilder::Init ******/
		/****** md5 signature: 26f1dc48d1dcbc23d88fc45d428255ae ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
B: BRep_Builder
S: Geom_Surface
UMin: float
UMax: float
VMin: float
VMax: float

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const BRep_Builder & B, const opencascade::handle<Geom_Surface> & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax);

		/****** BRepPrim_FaceBuilder::Vertex ******/
		/****** md5 signature: 1cd4dfe5cbf55dbe74ca8c7dfb89999c ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopoDS_Vertex

Description
-----------
Returns the vertex of index <I> 1 - Vertex UMin,VMin 2 - Vertex UMax,VMin 3 - Vertex UMax,VMax 4 - Vertex UMin,VMax.
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
		/****** BRepPrim_GWedge::BRepPrim_GWedge ******/
		/****** md5 signature: 5479b17d06f6204f33739da970ed3024 ******/
		%feature("compactdefaultargs") BRepPrim_GWedge;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor.
") BRepPrim_GWedge;
		 BRepPrim_GWedge();

		/****** BRepPrim_GWedge::BRepPrim_GWedge ******/
		/****** md5 signature: e294f9bebd8cc9ff98c19af2e7410e35 ******/
		%feature("compactdefaultargs") BRepPrim_GWedge;
		%feature("autodoc", "
Parameters
----------
B: BRepPrim_Builder
Axes: gp_Ax2
dx: float
dy: float
dz: float

Return
-------
None

Description
-----------
Creates a GWedge algorithm. <Axes> is the axis system for the primitive. //! XMin, YMin, ZMin are set to 0 XMax, YMax, ZMax are set to dx, dy, dz Z2Min = ZMin Z2Max = ZMax X2Min = XMin X2Max = XMax The result is a box dx,dy,dz should be positive.
") BRepPrim_GWedge;
		 BRepPrim_GWedge(const BRepPrim_Builder & B, const gp_Ax2 & Axes, const Standard_Real dx, const Standard_Real dy, const Standard_Real dz);

		/****** BRepPrim_GWedge::BRepPrim_GWedge ******/
		/****** md5 signature: 847889616a632de9ce27e3dfe094bb46 ******/
		%feature("compactdefaultargs") BRepPrim_GWedge;
		%feature("autodoc", "
Parameters
----------
B: BRepPrim_Builder
Axes: gp_Ax2
dx: float
dy: float
dz: float
ltx: float

Return
-------
None

Description
-----------
Creates a GWedge primitive. <Axes> is the axis system for the primitive. //! XMin, YMin, ZMin are set to 0 XMax, YMax, ZMax are set to dx, dy, dz Z2Min = ZMin Z2Max = ZMax X2Min = ltx X2Max = ltx The result is a STEP right angular wedge dx,dy,dz should be positive ltx should not be negative.
") BRepPrim_GWedge;
		 BRepPrim_GWedge(const BRepPrim_Builder & B, const gp_Ax2 & Axes, const Standard_Real dx, const Standard_Real dy, const Standard_Real dz, const Standard_Real ltx);

		/****** BRepPrim_GWedge::BRepPrim_GWedge ******/
		/****** md5 signature: d334fb521e652e32b1e6156305b9756c ******/
		%feature("compactdefaultargs") BRepPrim_GWedge;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Create a GWedge primitive. <Axes> is the axis system for the primitive. //! all the fields are set to the corresponding value XYZMax - XYZMin should be positive ZX2Max - ZX2Min should not be negative.
") BRepPrim_GWedge;
		 BRepPrim_GWedge(const BRepPrim_Builder & B, const gp_Ax2 & Axes, const Standard_Real xmin, const Standard_Real ymin, const Standard_Real zmin, const Standard_Real z2min, const Standard_Real x2min, const Standard_Real xmax, const Standard_Real ymax, const Standard_Real zmax, const Standard_Real z2max, const Standard_Real x2max);

		/****** BRepPrim_GWedge::Axes ******/
		/****** md5 signature: 5cce2f6c839d20c7e40bd43ff35d90ff ******/
		%feature("compactdefaultargs") Axes;
		%feature("autodoc", "Return
-------
gp_Ax2

Description
-----------
Returns the coordinates system from <self>.
") Axes;
		gp_Ax2 Axes();

		/****** BRepPrim_GWedge::Close ******/
		/****** md5 signature: 8a6b334d6643de950e51d0dac3cf9567 ******/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "
Parameters
----------
d1: BRepPrim_Direction

Return
-------
None

Description
-----------
Closes <self> in <d1> direction. A face and its edges or vertices are said existent.
") Close;
		void Close(const BRepPrim_Direction d1);

		/****** BRepPrim_GWedge::Edge ******/
		/****** md5 signature: 560d56d26d1414fcce336848602e1dc3 ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "
Parameters
----------
d1: BRepPrim_Direction
d2: BRepPrim_Direction

Return
-------
TopoDS_Edge

Description
-----------
Returns the Edge of <self> located in <d1><d2> direction.
") Edge;
		const TopoDS_Edge Edge(const BRepPrim_Direction d1, const BRepPrim_Direction d2);

		/****** BRepPrim_GWedge::Face ******/
		/****** md5 signature: eb3c5e0095ca13cae1498f229df66063 ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "
Parameters
----------
d1: BRepPrim_Direction

Return
-------
TopoDS_Face

Description
-----------
Returns the Face of <self> located in <d1> direction.
") Face;
		const TopoDS_Face Face(const BRepPrim_Direction d1);

		/****** BRepPrim_GWedge::GetX2Max ******/
		/****** md5 signature: babbbfd397c1efdc258884663a21c99b ******/
		%feature("compactdefaultargs") GetX2Max;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns X2Max value from <self>.
") GetX2Max;
		Standard_Real GetX2Max();

		/****** BRepPrim_GWedge::GetX2Min ******/
		/****** md5 signature: 0a40c3c9c54ec4e54fecd27b53aa2d96 ******/
		%feature("compactdefaultargs") GetX2Min;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns X2Min value from <self>.
") GetX2Min;
		Standard_Real GetX2Min();

		/****** BRepPrim_GWedge::GetXMax ******/
		/****** md5 signature: 89241f7ad0cd880ace7f0986ef5f9f69 ******/
		%feature("compactdefaultargs") GetXMax;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns XMax value from <self>.
") GetXMax;
		Standard_Real GetXMax();

		/****** BRepPrim_GWedge::GetXMin ******/
		/****** md5 signature: d7992ddefa160df5f96a2a3533191e53 ******/
		%feature("compactdefaultargs") GetXMin;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns Xmin value from <self>.
") GetXMin;
		Standard_Real GetXMin();

		/****** BRepPrim_GWedge::GetYMax ******/
		/****** md5 signature: 58f0cd3a82eb7ddb0b0b6801d800b912 ******/
		%feature("compactdefaultargs") GetYMax;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns YMax value from <self>.
") GetYMax;
		Standard_Real GetYMax();

		/****** BRepPrim_GWedge::GetYMin ******/
		/****** md5 signature: 229d1cfe7ce27ed168565ce63df04039 ******/
		%feature("compactdefaultargs") GetYMin;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns YMin value from <self>.
") GetYMin;
		Standard_Real GetYMin();

		/****** BRepPrim_GWedge::GetZ2Max ******/
		/****** md5 signature: 3f6d0e8bc5842b300bcb476636139406 ******/
		%feature("compactdefaultargs") GetZ2Max;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns Z2Max value from <self>.
") GetZ2Max;
		Standard_Real GetZ2Max();

		/****** BRepPrim_GWedge::GetZ2Min ******/
		/****** md5 signature: abe08f96ee7133799469e33037af94cd ******/
		%feature("compactdefaultargs") GetZ2Min;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns Z2Min value from <self>.
") GetZ2Min;
		Standard_Real GetZ2Min();

		/****** BRepPrim_GWedge::GetZMax ******/
		/****** md5 signature: 32c33af83170b4d42ae02c8990ff8ea3 ******/
		%feature("compactdefaultargs") GetZMax;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns ZMax value from <self>.
") GetZMax;
		Standard_Real GetZMax();

		/****** BRepPrim_GWedge::GetZMin ******/
		/****** md5 signature: a379616f1dee6c082c654e8c13891637 ******/
		%feature("compactdefaultargs") GetZMin;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns ZMin value from <self>.
") GetZMin;
		Standard_Real GetZMin();

		/****** BRepPrim_GWedge::HasEdge ******/
		/****** md5 signature: 7739a38be24eb46408b92e60b3ed5c86 ******/
		%feature("compactdefaultargs") HasEdge;
		%feature("autodoc", "
Parameters
----------
d1: BRepPrim_Direction
d2: BRepPrim_Direction

Return
-------
bool

Description
-----------
Returns True if <self> has an Edge in <d1><d2> direction.
") HasEdge;
		Standard_Boolean HasEdge(const BRepPrim_Direction d1, const BRepPrim_Direction d2);

		/****** BRepPrim_GWedge::HasFace ******/
		/****** md5 signature: c9d41b14ac628ba1e79756dffee9967d ******/
		%feature("compactdefaultargs") HasFace;
		%feature("autodoc", "
Parameters
----------
d1: BRepPrim_Direction

Return
-------
bool

Description
-----------
Returns True if <self> has a Face in <d1> direction.
") HasFace;
		Standard_Boolean HasFace(const BRepPrim_Direction d1);

		/****** BRepPrim_GWedge::HasVertex ******/
		/****** md5 signature: eaac55ce26adfcac0a4f2a1f65c03aa5 ******/
		%feature("compactdefaultargs") HasVertex;
		%feature("autodoc", "
Parameters
----------
d1: BRepPrim_Direction
d2: BRepPrim_Direction
d3: BRepPrim_Direction

Return
-------
bool

Description
-----------
Returns True if <self> has a Vertex in <d1><d2><d3> direction.
") HasVertex;
		Standard_Boolean HasVertex(const BRepPrim_Direction d1, const BRepPrim_Direction d2, const BRepPrim_Direction d3);

		/****** BRepPrim_GWedge::HasWire ******/
		/****** md5 signature: 48fdc8573de4d5206e01f01f3e2e88c6 ******/
		%feature("compactdefaultargs") HasWire;
		%feature("autodoc", "
Parameters
----------
d1: BRepPrim_Direction

Return
-------
bool

Description
-----------
Returns True if <self> has a Wire in <d1> direction.
") HasWire;
		Standard_Boolean HasWire(const BRepPrim_Direction d1);

		/****** BRepPrim_GWedge::IsDegeneratedShape ******/
		/****** md5 signature: bedacae663032f1f3a7887e26e731a50 ******/
		%feature("compactdefaultargs") IsDegeneratedShape;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks a shape on degeneracy 
Return: True if a shape is degenerated.
") IsDegeneratedShape;
		Standard_Boolean IsDegeneratedShape();

		/****** BRepPrim_GWedge::IsInfinite ******/
		/****** md5 signature: 84e23051e341ae0e7b22f457a416c2bd ******/
		%feature("compactdefaultargs") IsInfinite;
		%feature("autodoc", "
Parameters
----------
d1: BRepPrim_Direction

Return
-------
bool

Description
-----------
Returns True if <self> is open in <d1> direction.
") IsInfinite;
		Standard_Boolean IsInfinite(const BRepPrim_Direction d1);

		/****** BRepPrim_GWedge::Line ******/
		/****** md5 signature: a1e5b46f6b4d553242cfea988954fad7 ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
d1: BRepPrim_Direction
d2: BRepPrim_Direction

Return
-------
gp_Lin

Description
-----------
Returns the line of the Edge of <self> located in <d1><d2> direction.
") Line;
		gp_Lin Line(const BRepPrim_Direction d1, const BRepPrim_Direction d2);

		/****** BRepPrim_GWedge::Open ******/
		/****** md5 signature: 2e0f8eb050fe600ffb46a7cdbe2bbb22 ******/
		%feature("compactdefaultargs") Open;
		%feature("autodoc", "
Parameters
----------
d1: BRepPrim_Direction

Return
-------
None

Description
-----------
Opens <self> in <d1> direction. A face and its edges or vertices are said nonexistent.
") Open;
		void Open(const BRepPrim_Direction d1);

		/****** BRepPrim_GWedge::Plane ******/
		/****** md5 signature: 51c67370aa0e64e1c9393357876cc1d4 ******/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "
Parameters
----------
d1: BRepPrim_Direction

Return
-------
gp_Pln

Description
-----------
Returns the plane of the Face of <self> located in <d1> direction.
") Plane;
		gp_Pln Plane(const BRepPrim_Direction d1);

		/****** BRepPrim_GWedge::Point ******/
		/****** md5 signature: 28c8bee4abcaab436e78c827c6244f30 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
d1: BRepPrim_Direction
d2: BRepPrim_Direction
d3: BRepPrim_Direction

Return
-------
gp_Pnt

Description
-----------
Returns the point of the Vertex of <self> located in <d1><d2><d3> direction.
") Point;
		gp_Pnt Point(const BRepPrim_Direction d1, const BRepPrim_Direction d2, const BRepPrim_Direction d3);

		/****** BRepPrim_GWedge::Shell ******/
		/****** md5 signature: 642de93edbb586600e27d55251851e8c ******/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "Return
-------
TopoDS_Shell

Description
-----------
Returns the Shell containing the Faces of <self>.
") Shell;
		const TopoDS_Shell Shell();

		/****** BRepPrim_GWedge::Vertex ******/
		/****** md5 signature: a17642c94fed62613aae4458cb0c69a7 ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "
Parameters
----------
d1: BRepPrim_Direction
d2: BRepPrim_Direction
d3: BRepPrim_Direction

Return
-------
TopoDS_Vertex

Description
-----------
Returns the Vertex of <self> located in <d1><d2><d3> direction.
") Vertex;
		const TopoDS_Vertex Vertex(const BRepPrim_Direction d1, const BRepPrim_Direction d2, const BRepPrim_Direction d3);

		/****** BRepPrim_GWedge::Wire ******/
		/****** md5 signature: d4a72ad4acfb0d921fa8869ec16c3131 ******/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "
Parameters
----------
d1: BRepPrim_Direction

Return
-------
TopoDS_Wire

Description
-----------
Returns the Wire of <self> located in <d1> direction.
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
		/****** BRepPrim_OneAxis::Angle ******/
		/****** md5 signature: dce50192c350c43b54f2e88e94e5372a ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Angle;
		Standard_Real Angle();

		/****** BRepPrim_OneAxis::Angle ******/
		/****** md5 signature: 497ba1204f8a2afc37be082f6d813cb9 ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "
Parameters
----------
A: float

Return
-------
None

Description
-----------
No available documentation.
") Angle;
		void Angle(const Standard_Real A);

		/****** BRepPrim_OneAxis::Axes ******/
		/****** md5 signature: e675cba0965d216240eda82653f8ee1f ******/
		%feature("compactdefaultargs") Axes;
		%feature("autodoc", "Return
-------
gp_Ax2

Description
-----------
Returns the Ax2 from <self>.
") Axes;
		const gp_Ax2 Axes();

		/****** BRepPrim_OneAxis::Axes ******/
		/****** md5 signature: 7ccd426658d93b46bcc77db3a6b35786 ******/
		%feature("compactdefaultargs") Axes;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax2

Return
-------
None

Description
-----------
No available documentation.
") Axes;
		void Axes(const gp_Ax2 & A);

		/****** BRepPrim_OneAxis::AxisBottomVertex ******/
		/****** md5 signature: 9d25327339f786a3ce86ab0e8f3c393e ******/
		%feature("compactdefaultargs") AxisBottomVertex;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
Returns the Vertex at the Bottom altitude on the axis.
") AxisBottomVertex;
		const TopoDS_Vertex AxisBottomVertex();

		/****** BRepPrim_OneAxis::AxisEdge ******/
		/****** md5 signature: a0397f9fe3224f5fbcfaa8de9c47d870 ******/
		%feature("compactdefaultargs") AxisEdge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
Returns the Edge built along the Axis and oriented on +Z of the Axis.
") AxisEdge;
		const TopoDS_Edge AxisEdge();

		/****** BRepPrim_OneAxis::AxisEndWire ******/
		/****** md5 signature: cfd7b259580fe79b5976240119bdbd2b ******/
		%feature("compactdefaultargs") AxisEndWire;
		%feature("autodoc", "Return
-------
TopoDS_Wire

Description
-----------
Returns the Wire in the end face with the AxisEdge.
") AxisEndWire;
		const TopoDS_Wire AxisEndWire();

		/****** BRepPrim_OneAxis::AxisStartWire ******/
		/****** md5 signature: 734f2956cf4b2f5718064af99f6e2417 ******/
		%feature("compactdefaultargs") AxisStartWire;
		%feature("autodoc", "Return
-------
TopoDS_Wire

Description
-----------
Returns the wire in the start face with the AxisEdge.
") AxisStartWire;
		const TopoDS_Wire AxisStartWire();

		/****** BRepPrim_OneAxis::AxisTopVertex ******/
		/****** md5 signature: ba7bb81c2907acd2ca24825826289de8 ******/
		%feature("compactdefaultargs") AxisTopVertex;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
Returns the Vertex at the Top altitude on the axis.
") AxisTopVertex;
		const TopoDS_Vertex AxisTopVertex();

		/****** BRepPrim_OneAxis::BottomEdge ******/
		/****** md5 signature: 4da4829810b02bba039fd3cb84054a3e ******/
		%feature("compactdefaultargs") BottomEdge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
Returns the edge at VMin. If MeridianClosed() the TopEdge and the BottomEdge are the same edge.
") BottomEdge;
		const TopoDS_Edge BottomEdge();

		/****** BRepPrim_OneAxis::BottomEndVertex ******/
		/****** md5 signature: f01d0f77a1e34bbd806bac3659f37ecd ******/
		%feature("compactdefaultargs") BottomEndVertex;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
Returns the vertex (angle,VMax).
") BottomEndVertex;
		const TopoDS_Vertex BottomEndVertex();

		/****** BRepPrim_OneAxis::BottomFace ******/
		/****** md5 signature: d868072c1474b9c120740f20d5db6dfe ******/
		%feature("compactdefaultargs") BottomFace;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns the Bottom planar Face. It is Oriented toward the -Z axis (outside).
") BottomFace;
		const TopoDS_Face BottomFace();

		/****** BRepPrim_OneAxis::BottomStartVertex ******/
		/****** md5 signature: 327ca1d77d810fbe1d3d371fb4113074 ******/
		%feature("compactdefaultargs") BottomStartVertex;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
Returns the vertex (0,VMin).
") BottomStartVertex;
		const TopoDS_Vertex BottomStartVertex();

		/****** BRepPrim_OneAxis::BottomWire ******/
		/****** md5 signature: cdbee66603e77f7ebb4901f69d4de2f4 ******/
		%feature("compactdefaultargs") BottomWire;
		%feature("autodoc", "Return
-------
TopoDS_Wire

Description
-----------
Returns the wire in the bottom face.
") BottomWire;
		const TopoDS_Wire BottomWire();

		/****** BRepPrim_OneAxis::EndBottomEdge ******/
		/****** md5 signature: b06c39f4d51e346e4a01a7c5b64f38a7 ******/
		%feature("compactdefaultargs") EndBottomEdge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
Returns the linear Edge between end Face and bottom Face.
") EndBottomEdge;
		const TopoDS_Edge EndBottomEdge();

		/****** BRepPrim_OneAxis::EndEdge ******/
		/****** md5 signature: 674c1c918955150164f59e70b53eb062 ******/
		%feature("compactdefaultargs") EndEdge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
Returns the Edge at angle Angle. If !HasSides() the StartEdge and the EndEdge are the same edge.
") EndEdge;
		const TopoDS_Edge EndEdge();

		/****** BRepPrim_OneAxis::EndFace ******/
		/****** md5 signature: 3d80e58583e16de7a28cd94972d4ce27 ******/
		%feature("compactdefaultargs") EndFace;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns the Face ending the slice, it is oriented toward the exterior of the primitive.
") EndFace;
		const TopoDS_Face EndFace();

		/****** BRepPrim_OneAxis::EndTopEdge ******/
		/****** md5 signature: c8bcdde35414fa94db93c05ad703ed07 ******/
		%feature("compactdefaultargs") EndTopEdge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
Returns the linear Edge between end Face and top Face.
") EndTopEdge;
		const TopoDS_Edge EndTopEdge();

		/****** BRepPrim_OneAxis::EndWire ******/
		/****** md5 signature: 2af237ee40b2833e37a160fc0d52a268 ******/
		%feature("compactdefaultargs") EndWire;
		%feature("autodoc", "Return
-------
TopoDS_Wire

Description
-----------
Returns the Wire in the end face.
") EndWire;
		const TopoDS_Wire EndWire();

		/****** BRepPrim_OneAxis::HasBottom ******/
		/****** md5 signature: 67ebc11d924fceccdfa8e27bbbed4353 ******/
		%feature("compactdefaultargs") HasBottom;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is a bottom face. //! That is neither: VMinInfinite() MeridianClosed() MeridianOnAxis(VMin).
") HasBottom;
		virtual Standard_Boolean HasBottom();

		/****** BRepPrim_OneAxis::HasSides ******/
		/****** md5 signature: f5a003195b8808d511dd17deed132597 ******/
		%feature("compactdefaultargs") HasSides;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there are Start and End faces. //! That is: 2*PI - Angle > Precision::Angular().
") HasSides;
		virtual Standard_Boolean HasSides();

		/****** BRepPrim_OneAxis::HasTop ******/
		/****** md5 signature: 577e87a04211a53eddde29543f98f3af ******/
		%feature("compactdefaultargs") HasTop;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is a top face. //! That is neither: VMaxInfinite() MeridianClosed() MeridianOnAxis(VMax).
") HasTop;
		virtual Standard_Boolean HasTop();

		/****** BRepPrim_OneAxis::LateralEndWire ******/
		/****** md5 signature: 899f794d1a1347608997259354dd6495 ******/
		%feature("compactdefaultargs") LateralEndWire;
		%feature("autodoc", "Return
-------
TopoDS_Wire

Description
-----------
Returns the wire with in lateral face with the end edge.
") LateralEndWire;
		const TopoDS_Wire LateralEndWire();

		/****** BRepPrim_OneAxis::LateralFace ******/
		/****** md5 signature: dd330acf3abf48dc33bbea1f7f940dde ******/
		%feature("compactdefaultargs") LateralFace;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns the lateral Face. It is oriented toward the outside of the primitive.
") LateralFace;
		const TopoDS_Face LateralFace();

		/****** BRepPrim_OneAxis::LateralStartWire ******/
		/****** md5 signature: 3f37a9998a483da5be3239aa2061941b ******/
		%feature("compactdefaultargs") LateralStartWire;
		%feature("autodoc", "Return
-------
TopoDS_Wire

Description
-----------
Returns the wire in the lateral face with the start edge.
") LateralStartWire;
		const TopoDS_Wire LateralStartWire();

		/****** BRepPrim_OneAxis::LateralWire ******/
		/****** md5 signature: c5a61106c726e9c71398e937f0a3a35f ******/
		%feature("compactdefaultargs") LateralWire;
		%feature("autodoc", "Return
-------
TopoDS_Wire

Description
-----------
Returns the wire in the lateral face.
") LateralWire;
		const TopoDS_Wire LateralWire();

		/****** BRepPrim_OneAxis::MakeEmptyLateralFace ******/
		/****** md5 signature: b11e64ac863b45f01b201889e1d5bc0c ******/
		%feature("compactdefaultargs") MakeEmptyLateralFace;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns a face with no edges. The surface is the lateral surface with normals pointing outward. The U parameter is the angle with the origin on the X axis. The V parameter is the parameter of the meridian.
") MakeEmptyLateralFace;
		virtual TopoDS_Face MakeEmptyLateralFace();

		/****** BRepPrim_OneAxis::MakeEmptyMeridianEdge ******/
		/****** md5 signature: 630b1d866184613e5afe43bdb32460bf ******/
		%feature("compactdefaultargs") MakeEmptyMeridianEdge;
		%feature("autodoc", "
Parameters
----------
Ang: float

Return
-------
TopoDS_Edge

Description
-----------
Returns an edge with a 3D curve made from the meridian in the XZ plane rotated by <Ang> around the Z-axis. Ang may be 0 or myAngle.
") MakeEmptyMeridianEdge;
		virtual TopoDS_Edge MakeEmptyMeridianEdge(const Standard_Real Ang);

		/****** BRepPrim_OneAxis::MeridianClosed ******/
		/****** md5 signature: edc1439a02d2c9f36d6ec41c028c36f7 ******/
		%feature("compactdefaultargs") MeridianClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the meridian is closed. Default implementation  is MeridianValue(VMin).IsEqual(MeridianValue(VMax), Precision::Confusion()).
") MeridianClosed;
		virtual Standard_Boolean MeridianClosed();

		/****** BRepPrim_OneAxis::MeridianOnAxis ******/
		/****** md5 signature: c56871a41603e5716c9059ee2b162ce6 ******/
		%feature("compactdefaultargs") MeridianOnAxis;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
bool

Description
-----------
Returns True if the point of parameter <V> on the meridian is on the Axis. Default implementation is Abs(MeridianValue(V).X()) < Precision::Confusion().
") MeridianOnAxis;
		virtual Standard_Boolean MeridianOnAxis(const Standard_Real V);

		/****** BRepPrim_OneAxis::MeridianValue ******/
		/****** md5 signature: 77bae71d5a4543ab091837bcde019a30 ******/
		%feature("compactdefaultargs") MeridianValue;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
gp_Pnt2d

Description
-----------
Returns the meridian point at parameter <V> in the plane XZ.
") MeridianValue;
		virtual gp_Pnt2d MeridianValue(const Standard_Real V);

		/****** BRepPrim_OneAxis::SetMeridianOffset ******/
		/****** md5 signature: 57d60f2bbffbd56cb78726ee7410c7a5 ******/
		%feature("compactdefaultargs") SetMeridianOffset;
		%feature("autodoc", "
Parameters
----------
MeridianOffset: float (optional, default to 0)

Return
-------
None

Description
-----------
The MeridianOffset is added to the parameters on the meridian curve and to the V values of the pcurves. This is used for the sphere for example, to give a range on the meridian edge which is not VMin, VMax.
") SetMeridianOffset;
		void SetMeridianOffset(const Standard_Real MeridianOffset = 0);

		/****** BRepPrim_OneAxis::SetMeridianPCurve ******/
		/****** md5 signature: f204da19ac16bdfcd6a614a239776158 ******/
		%feature("compactdefaultargs") SetMeridianPCurve;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Return
-------
None

Description
-----------
Sets the parametric curve of the edge <E> in the face <F> to be the 2d representation of the meridian.
") SetMeridianPCurve;
		virtual void SetMeridianPCurve(TopoDS_Edge & E, const TopoDS_Face & F);

		/****** BRepPrim_OneAxis::Shell ******/
		/****** md5 signature: 642de93edbb586600e27d55251851e8c ******/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "Return
-------
TopoDS_Shell

Description
-----------
Returns the Shell containing all the Faces of the primitive.
") Shell;
		const TopoDS_Shell Shell();

		/****** BRepPrim_OneAxis::StartBottomEdge ******/
		/****** md5 signature: 37ff55111b1297cf786f259b8fbef721 ******/
		%feature("compactdefaultargs") StartBottomEdge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
Returns the linear Edge between start Face and bottom Face.
") StartBottomEdge;
		const TopoDS_Edge StartBottomEdge();

		/****** BRepPrim_OneAxis::StartEdge ******/
		/****** md5 signature: 4ff5c9d45d5f0785b08c7cd1ee9625eb ******/
		%feature("compactdefaultargs") StartEdge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
Returns the Edge at angle 0.
") StartEdge;
		const TopoDS_Edge StartEdge();

		/****** BRepPrim_OneAxis::StartFace ******/
		/****** md5 signature: c8fc504f031d7ae502cdd8218e7dc765 ******/
		%feature("compactdefaultargs") StartFace;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns the Face starting the slice, it is oriented toward the exterior of the primitive.
") StartFace;
		const TopoDS_Face StartFace();

		/****** BRepPrim_OneAxis::StartTopEdge ******/
		/****** md5 signature: 20ccec7c0f151d4d1e43f1032396e6c4 ******/
		%feature("compactdefaultargs") StartTopEdge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
Returns the linear Edge between start Face and top Face.
") StartTopEdge;
		const TopoDS_Edge StartTopEdge();

		/****** BRepPrim_OneAxis::StartWire ******/
		/****** md5 signature: a18257594fa0e66c8cd528233d760e02 ******/
		%feature("compactdefaultargs") StartWire;
		%feature("autodoc", "Return
-------
TopoDS_Wire

Description
-----------
Returns the wire in the start face.
") StartWire;
		const TopoDS_Wire StartWire();

		/****** BRepPrim_OneAxis::TopEdge ******/
		/****** md5 signature: e41c9e41a600f953c06e361e016249bf ******/
		%feature("compactdefaultargs") TopEdge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
Returns the edge at VMax. If MeridianClosed() the TopEdge and the BottomEdge are the same edge.
") TopEdge;
		const TopoDS_Edge TopEdge();

		/****** BRepPrim_OneAxis::TopEndVertex ******/
		/****** md5 signature: ba2ba5c1632b55e9bc10837938ce0668 ******/
		%feature("compactdefaultargs") TopEndVertex;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
Returns the vertex (angle,VMax).
") TopEndVertex;
		const TopoDS_Vertex TopEndVertex();

		/****** BRepPrim_OneAxis::TopFace ******/
		/****** md5 signature: dd32adf6486145b103460dda0a299106 ******/
		%feature("compactdefaultargs") TopFace;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns the top planar Face. It is Oriented toward the +Z axis (outside).
") TopFace;
		const TopoDS_Face TopFace();

		/****** BRepPrim_OneAxis::TopStartVertex ******/
		/****** md5 signature: 7996dc2e958e3fddc2e0484b60ee14b1 ******/
		%feature("compactdefaultargs") TopStartVertex;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
Returns the vertex (0,VMax).
") TopStartVertex;
		const TopoDS_Vertex TopStartVertex();

		/****** BRepPrim_OneAxis::TopWire ******/
		/****** md5 signature: a708eba831e170761a0bc25c468ccb83 ******/
		%feature("compactdefaultargs") TopWire;
		%feature("autodoc", "Return
-------
TopoDS_Wire

Description
-----------
Returns the wire in the top face.
") TopWire;
		const TopoDS_Wire TopWire();

		/****** BRepPrim_OneAxis::VMax ******/
		/****** md5 signature: 6ba449f1673839cb57aa34cf35972dc8 ******/
		%feature("compactdefaultargs") VMax;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") VMax;
		Standard_Real VMax();

		/****** BRepPrim_OneAxis::VMax ******/
		/****** md5 signature: 4d2ece54a3dcfaa75034890d806456d6 ******/
		%feature("compactdefaultargs") VMax;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
None

Description
-----------
No available documentation.
") VMax;
		void VMax(const Standard_Real V);

		/****** BRepPrim_OneAxis::VMaxInfinite ******/
		/****** md5 signature: bc5e6bf58b2b94b7629b77aba92be11a ******/
		%feature("compactdefaultargs") VMaxInfinite;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if VMax is infinite. Default Precision::IsPositiveInfinite(VMax);.
") VMaxInfinite;
		virtual Standard_Boolean VMaxInfinite();

		/****** BRepPrim_OneAxis::VMin ******/
		/****** md5 signature: 040bbb0b02e9760bd9cc365baf132106 ******/
		%feature("compactdefaultargs") VMin;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") VMin;
		Standard_Real VMin();

		/****** BRepPrim_OneAxis::VMin ******/
		/****** md5 signature: 80c307fc99a90b90ba8114e32ab29e1c ******/
		%feature("compactdefaultargs") VMin;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
None

Description
-----------
No available documentation.
") VMin;
		void VMin(const Standard_Real V);

		/****** BRepPrim_OneAxis::VMinInfinite ******/
		/****** md5 signature: 27a668d561b75d084aa96ca8eb0fdb0c ******/
		%feature("compactdefaultargs") VMinInfinite;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if VMin is infinite. Default Precision::IsNegativeInfinite(VMax);.
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
		/****** BRepPrim_Revolution::BRepPrim_Revolution ******/
		/****** md5 signature: 5b1b3e93df885b1a31c4614f6b9d1d95 ******/
		%feature("compactdefaultargs") BRepPrim_Revolution;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax2
VMin: float
VMax: float
M: Geom_Curve
PM: Geom2d_Curve

Return
-------
None

Description
-----------
Create a revolution body <M> is the meridian nd must be in the XZ plane of <A>. <PM> is the meridian in the XZ plane.
") BRepPrim_Revolution;
		 BRepPrim_Revolution(const gp_Ax2 & A, const Standard_Real VMin, const Standard_Real VMax, const opencascade::handle<Geom_Curve> & M, const opencascade::handle<Geom2d_Curve> & PM);

		/****** BRepPrim_Revolution::MakeEmptyLateralFace ******/
		/****** md5 signature: 738dd0904668b5ba6d89ecb17808ecaa ******/
		%feature("compactdefaultargs") MakeEmptyLateralFace;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
The surface normal should be directed towards the outside.
") MakeEmptyLateralFace;
		virtual TopoDS_Face MakeEmptyLateralFace();

		/****** BRepPrim_Revolution::MakeEmptyMeridianEdge ******/
		/****** md5 signature: 4d215bd790df5e01ce96f5dbaa5d1db7 ******/
		%feature("compactdefaultargs") MakeEmptyMeridianEdge;
		%feature("autodoc", "
Parameters
----------
Ang: float

Return
-------
TopoDS_Edge

Description
-----------
Returns an edge with a 3D curve made from the meridian in the XZ plane rotated by <Ang> around the Z-axis. Ang may be 0 or myAngle.
") MakeEmptyMeridianEdge;
		virtual TopoDS_Edge MakeEmptyMeridianEdge(const Standard_Real Ang);

		/****** BRepPrim_Revolution::MeridianValue ******/
		/****** md5 signature: 9d4d43f257bd22d9185c780792d00919 ******/
		%feature("compactdefaultargs") MeridianValue;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
gp_Pnt2d

Description
-----------
Returns the meridian point at parameter <V> in the plane XZ.
") MeridianValue;
		virtual gp_Pnt2d MeridianValue(const Standard_Real V);

		/****** BRepPrim_Revolution::SetMeridianPCurve ******/
		/****** md5 signature: e37059cc6abb428a1b857783ea7e2db5 ******/
		%feature("compactdefaultargs") SetMeridianPCurve;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Return
-------
None

Description
-----------
Sets the parametric urve of the edge <E> in the face <F> to be the 2d representation of the meridian.
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
		/****** BRepPrim_Wedge::BRepPrim_Wedge ******/
		/****** md5 signature: 273f01b42e689ba5af5064dc48d05f84 ******/
		%feature("compactdefaultargs") BRepPrim_Wedge;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor.
") BRepPrim_Wedge;
		 BRepPrim_Wedge();

		/****** BRepPrim_Wedge::BRepPrim_Wedge ******/
		/****** md5 signature: 271e307dbdf1baea793184df8b5a17db ******/
		%feature("compactdefaultargs") BRepPrim_Wedge;
		%feature("autodoc", "
Parameters
----------
Axes: gp_Ax2
dx: float
dy: float
dz: float

Return
-------
None

Description
-----------
Creates a Wedge algorithm. <Axes> is the axis system for the primitive. //! XMin, YMin, ZMin are set to 0 XMax, YMax, ZMax are set to dx, dy, dz Z2Min = ZMin Z2Max = ZMax X2Min = XMin X2Max = XMax The result is a box dx,dy,dz should be positive.
") BRepPrim_Wedge;
		 BRepPrim_Wedge(const gp_Ax2 & Axes, const Standard_Real dx, const Standard_Real dy, const Standard_Real dz);

		/****** BRepPrim_Wedge::BRepPrim_Wedge ******/
		/****** md5 signature: 540cdfd1a8a68594ffc6280824cadd02 ******/
		%feature("compactdefaultargs") BRepPrim_Wedge;
		%feature("autodoc", "
Parameters
----------
Axes: gp_Ax2
dx: float
dy: float
dz: float
ltx: float

Return
-------
None

Description
-----------
Creates a Wedge primitive. <Axes> is the axis system for the primitive. //! XMin, YMin, ZMin are set to 0 XMax, YMax, ZMax are set to dx, dy, dz Z2Min = ZMin Z2Max = ZMax X2Min = ltx X2Max = ltx The result is a STEP right angular wedge dx,dy,dz should be positive ltx should not be negative.
") BRepPrim_Wedge;
		 BRepPrim_Wedge(const gp_Ax2 & Axes, const Standard_Real dx, const Standard_Real dy, const Standard_Real dz, const Standard_Real ltx);

		/****** BRepPrim_Wedge::BRepPrim_Wedge ******/
		/****** md5 signature: c9d14cf56f80cb299d68a75d83cba983 ******/
		%feature("compactdefaultargs") BRepPrim_Wedge;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Create a Wedge primitive. <Axes> is the axis system for the primitive. //! all the fields are set to the corresponding value XYZMax - XYZMin should be positive ZX2Max - ZX2Min should not be negative.
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
		/****** BRepPrim_Cone::BRepPrim_Cone ******/
		/****** md5 signature: ff8d3b1ee270eff718ccc66335fc7cbc ******/
		%feature("compactdefaultargs") BRepPrim_Cone;
		%feature("autodoc", "
Parameters
----------
Angle: float
Position: gp_Ax2
Height: float
Radius: float (optional, default to 0)

Return
-------
None

Description
-----------
the STEP definition Angle = semi-angle of the cone Position: the coordinate system Height: height of the cone. Radius: radius of truncated face at z = 0 //! The apex is on z < 0 //! Errors: Height < Resolution Angle < Resolution / Height Angle > PI/2 - Resolution / Height.
") BRepPrim_Cone;
		 BRepPrim_Cone(const Standard_Real Angle, const gp_Ax2 & Position, const Standard_Real Height, const Standard_Real Radius = 0);

		/****** BRepPrim_Cone::BRepPrim_Cone ******/
		/****** md5 signature: c043b204d09754bd1015524e5a103d2a ******/
		%feature("compactdefaultargs") BRepPrim_Cone;
		%feature("autodoc", "
Parameters
----------
Angle: float

Return
-------
None

Description
-----------
infinite cone at origin on Z negative.
") BRepPrim_Cone;
		 BRepPrim_Cone(const Standard_Real Angle);

		/****** BRepPrim_Cone::BRepPrim_Cone ******/
		/****** md5 signature: c0b45e6511e50885e9fcf84e237c5aa1 ******/
		%feature("compactdefaultargs") BRepPrim_Cone;
		%feature("autodoc", "
Parameters
----------
Angle: float
Apex: gp_Pnt

Return
-------
None

Description
-----------
infinite cone at Apex on Z negative.
") BRepPrim_Cone;
		 BRepPrim_Cone(const Standard_Real Angle, const gp_Pnt & Apex);

		/****** BRepPrim_Cone::BRepPrim_Cone ******/
		/****** md5 signature: 6f65f34c26695c819b590ce393be91ba ******/
		%feature("compactdefaultargs") BRepPrim_Cone;
		%feature("autodoc", "
Parameters
----------
Angle: float
Axes: gp_Ax2

Return
-------
None

Description
-----------
infinite cone with Axes.
") BRepPrim_Cone;
		 BRepPrim_Cone(const Standard_Real Angle, const gp_Ax2 & Axes);

		/****** BRepPrim_Cone::BRepPrim_Cone ******/
		/****** md5 signature: c4131a519320058db92d9b9b4a62b4e1 ******/
		%feature("compactdefaultargs") BRepPrim_Cone;
		%feature("autodoc", "
Parameters
----------
R1: float
R2: float
H: float

Return
-------
None

Description
-----------
create a Cone at origin on Z axis, of height H, radius R1 at Z = 0, R2 at Z = H, X is the origin of angles. If R1 or R2 is 0 there is an apex. Otherwise, it is a truncated cone. //! Error: R1 and R2 < Resolution R1 or R2 negative Abs(R1-R2) < Resolution H < Resolution H negative.
") BRepPrim_Cone;
		 BRepPrim_Cone(const Standard_Real R1, const Standard_Real R2, const Standard_Real H);

		/****** BRepPrim_Cone::BRepPrim_Cone ******/
		/****** md5 signature: ba64b29b0668019a05dc949aab6770f7 ******/
		%feature("compactdefaultargs") BRepPrim_Cone;
		%feature("autodoc", "
Parameters
----------
Center: gp_Pnt
R1: float
R2: float
H: float

Return
-------
None

Description
-----------
same as above but at a given point.
") BRepPrim_Cone;
		 BRepPrim_Cone(const gp_Pnt & Center, const Standard_Real R1, const Standard_Real R2, const Standard_Real H);

		/****** BRepPrim_Cone::BRepPrim_Cone ******/
		/****** md5 signature: a0f74a87d71dc02fbc406ad9fd16e941 ******/
		%feature("compactdefaultargs") BRepPrim_Cone;
		%feature("autodoc", "
Parameters
----------
Axes: gp_Ax2
R1: float
R2: float
H: float

Return
-------
None

Description
-----------
same as above with given axes system.
") BRepPrim_Cone;
		 BRepPrim_Cone(const gp_Ax2 & Axes, const Standard_Real R1, const Standard_Real R2, const Standard_Real H);

		/****** BRepPrim_Cone::MakeEmptyLateralFace ******/
		/****** md5 signature: b5adc273756debb03c54f3ada5247082 ******/
		%feature("compactdefaultargs") MakeEmptyLateralFace;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
The surface normal should be directed towards the outside.
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
		/****** BRepPrim_Cylinder::BRepPrim_Cylinder ******/
		/****** md5 signature: 2d8fc92ca4c80bbef73bb95de9c4fa4e ******/
		%feature("compactdefaultargs") BRepPrim_Cylinder;
		%feature("autodoc", "
Parameters
----------
Position: gp_Ax2
Radius: float
Height: float

Return
-------
None

Description
-----------
the STEP definition Position: center of a Face and Axis Radius: radius of cylinder Height: distance between faces on positive side //! Errors: Height < Resolution Radius < Resolution.
") BRepPrim_Cylinder;
		 BRepPrim_Cylinder(const gp_Ax2 & Position, const Standard_Real Radius, const Standard_Real Height);

		/****** BRepPrim_Cylinder::BRepPrim_Cylinder ******/
		/****** md5 signature: ecc1d1a7f9b1d641e94a9b2cbeaf6532 ******/
		%feature("compactdefaultargs") BRepPrim_Cylinder;
		%feature("autodoc", "
Parameters
----------
Radius: float

Return
-------
None

Description
-----------
infinite Cylinder at origin on Z negative.
") BRepPrim_Cylinder;
		 BRepPrim_Cylinder(const Standard_Real Radius);

		/****** BRepPrim_Cylinder::BRepPrim_Cylinder ******/
		/****** md5 signature: fb91e5b01da7587cf83484e8f6b4331b ******/
		%feature("compactdefaultargs") BRepPrim_Cylinder;
		%feature("autodoc", "
Parameters
----------
Center: gp_Pnt
Radius: float

Return
-------
None

Description
-----------
infinite Cylinder at Center on Z negative.
") BRepPrim_Cylinder;
		 BRepPrim_Cylinder(const gp_Pnt & Center, const Standard_Real Radius);

		/****** BRepPrim_Cylinder::BRepPrim_Cylinder ******/
		/****** md5 signature: c6ae35bea3254cadd17db7280137bea7 ******/
		%feature("compactdefaultargs") BRepPrim_Cylinder;
		%feature("autodoc", "
Parameters
----------
Axes: gp_Ax2
Radius: float

Return
-------
None

Description
-----------
infinite Cylinder at Axes on Z negative.
") BRepPrim_Cylinder;
		 BRepPrim_Cylinder(const gp_Ax2 & Axes, const Standard_Real Radius);

		/****** BRepPrim_Cylinder::BRepPrim_Cylinder ******/
		/****** md5 signature: 70f6d404a95f20f5c7464246f08067a7 ******/
		%feature("compactdefaultargs") BRepPrim_Cylinder;
		%feature("autodoc", "
Parameters
----------
R: float
H: float

Return
-------
None

Description
-----------
create a Cylinder at origin on Z axis, of height H and radius R Error: Radius < Resolution H < Resolution H negative.
") BRepPrim_Cylinder;
		 BRepPrim_Cylinder(const Standard_Real R, const Standard_Real H);

		/****** BRepPrim_Cylinder::BRepPrim_Cylinder ******/
		/****** md5 signature: 6910efd5aeea5eed4574043c57b67161 ******/
		%feature("compactdefaultargs") BRepPrim_Cylinder;
		%feature("autodoc", "
Parameters
----------
Center: gp_Pnt
R: float
H: float

Return
-------
None

Description
-----------
same as above but at a given point.
") BRepPrim_Cylinder;
		 BRepPrim_Cylinder(const gp_Pnt & Center, const Standard_Real R, const Standard_Real H);

		/****** BRepPrim_Cylinder::MakeEmptyLateralFace ******/
		/****** md5 signature: b5adc273756debb03c54f3ada5247082 ******/
		%feature("compactdefaultargs") MakeEmptyLateralFace;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
The surface normal should be directed towards the outside.
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
		/****** BRepPrim_Sphere::BRepPrim_Sphere ******/
		/****** md5 signature: a69f71dc958ffcbd14404b395674a725 ******/
		%feature("compactdefaultargs") BRepPrim_Sphere;
		%feature("autodoc", "
Parameters
----------
Radius: float

Return
-------
None

Description
-----------
Creates a Sphere at origin with Radius. The axes of the sphere are the reference axes. An error is raised if the radius is < Resolution.
") BRepPrim_Sphere;
		 BRepPrim_Sphere(const Standard_Real Radius);

		/****** BRepPrim_Sphere::BRepPrim_Sphere ******/
		/****** md5 signature: 40fe35bc704dd685fcd8f42947b874a9 ******/
		%feature("compactdefaultargs") BRepPrim_Sphere;
		%feature("autodoc", "
Parameters
----------
Center: gp_Pnt
Radius: float

Return
-------
None

Description
-----------
Creates a Sphere with Center and Radius. Axes are the reference axes. This is the STEP constructor.
") BRepPrim_Sphere;
		 BRepPrim_Sphere(const gp_Pnt & Center, const Standard_Real Radius);

		/****** BRepPrim_Sphere::BRepPrim_Sphere ******/
		/****** md5 signature: 7ff355f910ca0fd149e933f970dbb666 ******/
		%feature("compactdefaultargs") BRepPrim_Sphere;
		%feature("autodoc", "
Parameters
----------
Axes: gp_Ax2
Radius: float

Return
-------
None

Description
-----------
Creates a sphere with given axes system.
") BRepPrim_Sphere;
		 BRepPrim_Sphere(const gp_Ax2 & Axes, const Standard_Real Radius);

		/****** BRepPrim_Sphere::MakeEmptyLateralFace ******/
		/****** md5 signature: b5adc273756debb03c54f3ada5247082 ******/
		%feature("compactdefaultargs") MakeEmptyLateralFace;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
The surface normal should be directed towards the outside.
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
		/****** BRepPrim_Torus::BRepPrim_Torus ******/
		/****** md5 signature: a73ba5d8cdf7a0859b5f42eec6316a19 ******/
		%feature("compactdefaultargs") BRepPrim_Torus;
		%feature("autodoc", "
Parameters
----------
Position: gp_Ax2
Major: float
Minor: float

Return
-------
None

Description
-----------
the STEP definition Position: center and axes Major, Minor: Radii //! Errors: Major < Resolution Minor < Resolution.
") BRepPrim_Torus;
		 BRepPrim_Torus(const gp_Ax2 & Position, const Standard_Real Major, const Standard_Real Minor);

		/****** BRepPrim_Torus::BRepPrim_Torus ******/
		/****** md5 signature: 96236fbf921e8d6d410e179a02cc89de ******/
		%feature("compactdefaultargs") BRepPrim_Torus;
		%feature("autodoc", "
Parameters
----------
Major: float
Minor: float

Return
-------
None

Description
-----------
Torus centered at origin.
") BRepPrim_Torus;
		 BRepPrim_Torus(const Standard_Real Major, const Standard_Real Minor);

		/****** BRepPrim_Torus::BRepPrim_Torus ******/
		/****** md5 signature: e161468c8e037f5911e3faeb41308f3b ******/
		%feature("compactdefaultargs") BRepPrim_Torus;
		%feature("autodoc", "
Parameters
----------
Center: gp_Pnt
Major: float
Minor: float

Return
-------
None

Description
-----------
Torus at Center.
") BRepPrim_Torus;
		 BRepPrim_Torus(const gp_Pnt & Center, const Standard_Real Major, const Standard_Real Minor);

		/****** BRepPrim_Torus::MakeEmptyLateralFace ******/
		/****** md5 signature: b5adc273756debb03c54f3ada5247082 ******/
		%feature("compactdefaultargs") MakeEmptyLateralFace;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
The surface normal should be directed towards the outside.
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
/* class aliases */
%pythoncode {
}
