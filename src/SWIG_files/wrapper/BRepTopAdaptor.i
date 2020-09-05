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
%define BREPTOPADAPTORDOCSTRING
"BRepTopAdaptor module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_breptopadaptor.html"
%enddef
%module (package="OCC.Core", docstring=BREPTOPADAPTORDOCSTRING) BRepTopAdaptor


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
#include<BRepTopAdaptor_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColStd_module.hxx>
#include<TopoDS_module.hxx>
#include<gp_module.hxx>
#include<TopAbs_module.hxx>
#include<Adaptor3d_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<TopLoc_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColStd.i
%import TopoDS.i
%import gp.i
%import TopAbs.i
%import Adaptor3d.i
%import BRepAdaptor.i
%import Adaptor2d.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(BRepTopAdaptor_HVertex)
%wrap_handle(BRepTopAdaptor_TopolTool)
/* end handles declaration */

/* templates */
%template(BRepTopAdaptor_MapOfShapeTool) NCollection_DataMap<TopoDS_Shape,BRepTopAdaptor_Tool,TopTools_ShapeMapHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TopoDS_Shape, BRepTopAdaptor_Tool, TopTools_ShapeMapHasher>::Iterator BRepTopAdaptor_DataMapIteratorOfMapOfShapeTool;
typedef NCollection_DataMap<TopoDS_Shape, BRepTopAdaptor_Tool, TopTools_ShapeMapHasher> BRepTopAdaptor_MapOfShapeTool;
typedef TColStd_SequenceOfAddress BRepTopAdaptor_SeqOfPtr;
/* end typedefs declaration */

/********************************
* class BRepTopAdaptor_FClass2d *
********************************/
class BRepTopAdaptor_FClass2d {
	public:
		/****************** BRepTopAdaptor_FClass2d ******************/
		/**** md5 signature: a4ce3a90c05c77932758932c03e7b960 ****/
		%feature("compactdefaultargs") BRepTopAdaptor_FClass2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face
Tol: float

Returns
-------
None
") BRepTopAdaptor_FClass2d;
		 BRepTopAdaptor_FClass2d(const TopoDS_Face & F, const Standard_Real Tol);

		/****************** Copy ******************/
		/**** md5 signature: efc7d008bfae308e21078aca0811254c ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: BRepTopAdaptor_FClass2d

Returns
-------
BRepTopAdaptor_FClass2d
") Copy;
		const BRepTopAdaptor_FClass2d & Copy(const BRepTopAdaptor_FClass2d & Other);

		/****************** Destroy ******************/
		/**** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ****/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** Perform ******************/
		/**** md5 signature: 403774510e6e0c4bd249a27908ad88fd ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Puv: gp_Pnt2d
RecadreOnPeriodic: bool,optional
	default value is Standard_True

Returns
-------
TopAbs_State
") Perform;
		TopAbs_State Perform(const gp_Pnt2d & Puv, const Standard_Boolean RecadreOnPeriodic = Standard_True);

		/****************** PerformInfinitePoint ******************/
		/**** md5 signature: 372e31f938f00ae741d3664c08c086b5 ****/
		%feature("compactdefaultargs") PerformInfinitePoint;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_State
") PerformInfinitePoint;
		TopAbs_State PerformInfinitePoint();

		/****************** TestOnRestriction ******************/
		/**** md5 signature: 6c77262c5fd5c2462a11220de78e70e9 ****/
		%feature("compactdefaultargs") TestOnRestriction;
		%feature("autodoc", "Test a point with +- an offset (tol) and returns on if some points are out an some are in (caution: internal use . see the code for more details).

Parameters
----------
Puv: gp_Pnt2d
Tol: float
RecadreOnPeriodic: bool,optional
	default value is Standard_True

Returns
-------
TopAbs_State
") TestOnRestriction;
		TopAbs_State TestOnRestriction(const gp_Pnt2d & Puv, const Standard_Real Tol, const Standard_Boolean RecadreOnPeriodic = Standard_True);

};


%extend BRepTopAdaptor_FClass2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BRepTopAdaptor_HVertex *
*******************************/
class BRepTopAdaptor_HVertex : public Adaptor3d_HVertex {
	public:
		/****************** BRepTopAdaptor_HVertex ******************/
		/**** md5 signature: 074cc397ac377683fc7e5baeac36dca5 ****/
		%feature("compactdefaultargs") BRepTopAdaptor_HVertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
Vtx: TopoDS_Vertex
Curve: BRepAdaptor_HCurve2d

Returns
-------
None
") BRepTopAdaptor_HVertex;
		 BRepTopAdaptor_HVertex(const TopoDS_Vertex & Vtx, const opencascade::handle<BRepAdaptor_HCurve2d> & Curve);

		/****************** ChangeVertex ******************/
		/**** md5 signature: 656bb17afe52454f9a05f1376056a6f2 ****/
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Vertex
") ChangeVertex;
		TopoDS_Vertex ChangeVertex();

		/****************** IsSame ******************/
		/**** md5 signature: f2a9a396e56097829ed82cdf7f82bd65 ****/
		%feature("compactdefaultargs") IsSame;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: Adaptor3d_HVertex

Returns
-------
bool
") IsSame;
		virtual Standard_Boolean IsSame(const opencascade::handle<Adaptor3d_HVertex> & Other);

		/****************** Orientation ******************/
		/**** md5 signature: b943e1badc1c2450950702cc0e44d65d ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") Orientation;
		virtual TopAbs_Orientation Orientation();

		/****************** Parameter ******************/
		/**** md5 signature: 94a7d8e3950c1b6cd8601beea6d797e5 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
float
") Parameter;
		virtual Standard_Real Parameter(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Resolution ******************/
		/**** md5 signature: 58ffcfda77fcb1f2307c4d27d217e5fc ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Parametric resolution (2d).

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
float
") Resolution;
		virtual Standard_Real Resolution(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Value ******************/
		/**** md5 signature: 554738eb7febee95dce3c7ca7bc631d6 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt2d
") Value;
		virtual gp_Pnt2d Value();

		/****************** Vertex ******************/
		/**** md5 signature: 84212ff79cd7d64cd0ebfa6f17214e90 ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Vertex
") Vertex;
		const TopoDS_Vertex Vertex();

};


%make_alias(BRepTopAdaptor_HVertex)

%extend BRepTopAdaptor_HVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepTopAdaptor_Tool *
****************************/
class BRepTopAdaptor_Tool {
	public:
		/****************** BRepTopAdaptor_Tool ******************/
		/**** md5 signature: e6b2a6be90b6ee74514e96d96a5af8e3 ****/
		%feature("compactdefaultargs") BRepTopAdaptor_Tool;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepTopAdaptor_Tool;
		 BRepTopAdaptor_Tool();

		/****************** BRepTopAdaptor_Tool ******************/
		/**** md5 signature: b1c7d0803f25616e45e53f7ee3ec33c3 ****/
		%feature("compactdefaultargs") BRepTopAdaptor_Tool;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face
Tol2d: float

Returns
-------
None
") BRepTopAdaptor_Tool;
		 BRepTopAdaptor_Tool(const TopoDS_Face & F, const Standard_Real Tol2d);

		/****************** BRepTopAdaptor_Tool ******************/
		/**** md5 signature: 7e1124fd43a8913e3a2a0735609d729d ****/
		%feature("compactdefaultargs") BRepTopAdaptor_Tool;
		%feature("autodoc", "No available documentation.

Parameters
----------
Surface: Adaptor3d_HSurface
Tol2d: float

Returns
-------
None
") BRepTopAdaptor_Tool;
		 BRepTopAdaptor_Tool(const opencascade::handle<Adaptor3d_HSurface> & Surface, const Standard_Real Tol2d);

		/****************** Destroy ******************/
		/**** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ****/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** GetSurface ******************/
		/**** md5 signature: 50d06de8d329a03e7154431f35fe4ef4 ****/
		%feature("compactdefaultargs") GetSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") GetSurface;
		opencascade::handle<Adaptor3d_HSurface> GetSurface();

		/****************** GetTopolTool ******************/
		/**** md5 signature: ff64aa4100d21790bf932c85946a7eac ****/
		%feature("compactdefaultargs") GetTopolTool;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<BRepTopAdaptor_TopolTool>
") GetTopolTool;
		opencascade::handle<BRepTopAdaptor_TopolTool> GetTopolTool();

		/****************** Init ******************/
		/**** md5 signature: 5bec524469c25172c545bf8ac42938a6 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face
Tol2d: float

Returns
-------
None
") Init;
		void Init(const TopoDS_Face & F, const Standard_Real Tol2d);

		/****************** Init ******************/
		/**** md5 signature: 3f726d32ba85e51e2e5ccbc5160ec527 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Surface: Adaptor3d_HSurface
Tol2d: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Adaptor3d_HSurface> & Surface, const Standard_Real Tol2d);

		/****************** SetTopolTool ******************/
		/**** md5 signature: 3bffbb5885a2ed968b12bd808603632f ****/
		%feature("compactdefaultargs") SetTopolTool;
		%feature("autodoc", "No available documentation.

Parameters
----------
TT: BRepTopAdaptor_TopolTool

Returns
-------
None
") SetTopolTool;
		void SetTopolTool(const opencascade::handle<BRepTopAdaptor_TopolTool> & TT);

};


%extend BRepTopAdaptor_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepTopAdaptor_TopolTool *
*********************************/
class BRepTopAdaptor_TopolTool : public Adaptor3d_TopolTool {
	public:
		/****************** BRepTopAdaptor_TopolTool ******************/
		/**** md5 signature: 41ec4c16be305a9785129796032fadeb ****/
		%feature("compactdefaultargs") BRepTopAdaptor_TopolTool;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepTopAdaptor_TopolTool;
		 BRepTopAdaptor_TopolTool();

		/****************** BRepTopAdaptor_TopolTool ******************/
		/**** md5 signature: 56c628c8df694ad801f941b658a0b9c7 ****/
		%feature("compactdefaultargs") BRepTopAdaptor_TopolTool;
		%feature("autodoc", "No available documentation.

Parameters
----------
Surface: Adaptor3d_HSurface

Returns
-------
None
") BRepTopAdaptor_TopolTool;
		 BRepTopAdaptor_TopolTool(const opencascade::handle<Adaptor3d_HSurface> & Surface);

		/****************** Classify ******************/
		/**** md5 signature: a7bbbaec3e65fcebf225d366fb51ee9a ****/
		%feature("compactdefaultargs") Classify;
		%feature("autodoc", "No available documentation.

Parameters
----------
P2d: gp_Pnt2d
Tol: float
RecadreOnPeriodic: bool,optional
	default value is Standard_True

Returns
-------
TopAbs_State
") Classify;
		virtual TopAbs_State Classify(const gp_Pnt2d & P2d, const Standard_Real Tol, const Standard_Boolean RecadreOnPeriodic = Standard_True);

		/****************** ComputeSamplePoints ******************/
		/**** md5 signature: 940d159b31fac83590ed8721227cec02 ****/
		%feature("compactdefaultargs") ComputeSamplePoints;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ComputeSamplePoints;
		virtual void ComputeSamplePoints();

		/****************** Destroy ******************/
		/**** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ****/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** DomainIsInfinite ******************/
		/**** md5 signature: 20f793796242ffe67750f39c7f6cb147 ****/
		%feature("compactdefaultargs") DomainIsInfinite;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") DomainIsInfinite;
		virtual Standard_Boolean DomainIsInfinite();

		/****************** Edge ******************/
		/**** md5 signature: 6967230b5b5db55425e95b1692b26f70 ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_Address
") Edge;
		virtual Standard_Address Edge();

		/****************** Has3d ******************/
		/**** md5 signature: ebbbfa66b9e47ba91b38a042ef3df5e9 ****/
		%feature("compactdefaultargs") Has3d;
		%feature("autodoc", "Answers if arcs and vertices may have 3d representations, so that we could use tol3d and pnt methods.

Returns
-------
bool
") Has3d;
		virtual Standard_Boolean Has3d();

		/****************** Init ******************/
		/**** md5 signature: c4c556a6328bedec1d8a123a7f91b797 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Init;
		virtual void Init();

		/****************** InitVertexIterator ******************/
		/**** md5 signature: 47f3e7aba8ec0b8bbcee04b21e73023c ****/
		%feature("compactdefaultargs") InitVertexIterator;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitVertexIterator;
		virtual void InitVertexIterator();

		/****************** Initialize ******************/
		/**** md5 signature: c1406d3f37ede5ce5f7bca787b95af63 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Initialize;
		virtual void Initialize();

		/****************** Initialize ******************/
		/**** md5 signature: 9212cd79a1f58670bacb19f92e754ac8 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface

Returns
-------
None
") Initialize;
		virtual void Initialize(const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** Initialize ******************/
		/**** md5 signature: 02cf97bc3b844688e9ba73e26b230254 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

Parameters
----------
Curve: Adaptor2d_HCurve2d

Returns
-------
None
") Initialize;
		virtual void Initialize(const opencascade::handle<Adaptor2d_HCurve2d> & Curve);

		/****************** IsThePointOn ******************/
		/**** md5 signature: a8af42c0c4037ab93f856b0272aaeeac ****/
		%feature("compactdefaultargs") IsThePointOn;
		%feature("autodoc", "See the code for specifications).

Parameters
----------
P2d: gp_Pnt2d
Tol: float
RecadreOnPeriodic: bool,optional
	default value is Standard_True

Returns
-------
bool
") IsThePointOn;
		virtual Standard_Boolean IsThePointOn(const gp_Pnt2d & P2d, const Standard_Real Tol, const Standard_Boolean RecadreOnPeriodic = Standard_True);

		/****************** More ******************/
		/**** md5 signature: bda1e82f93f14763348ea8e5cf741569 ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") More;
		virtual Standard_Boolean More();

		/****************** MoreVertex ******************/
		/**** md5 signature: 6742f4bff9005368b8f6a53f0e30838a ****/
		%feature("compactdefaultargs") MoreVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreVertex;
		virtual Standard_Boolean MoreVertex();

		/****************** NbSamples ******************/
		/**** md5 signature: cd99f1dfd0ef40a4d961f9638d39e555 ****/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "Compute the sample-points for the intersections algorithms.

Returns
-------
int
") NbSamples;
		virtual Standard_Integer NbSamples();

		/****************** NbSamplesU ******************/
		/**** md5 signature: 9402b5b7fe65eb10df77f3437e175357 ****/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "Compute the sample-points for the intersections algorithms.

Returns
-------
int
") NbSamplesU;
		virtual Standard_Integer NbSamplesU();

		/****************** NbSamplesV ******************/
		/**** md5 signature: d6f9b32ddea97452b8d6f7035907d24a ****/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "Compute the sample-points for the intersections algorithms.

Returns
-------
int
") NbSamplesV;
		virtual Standard_Integer NbSamplesV();

		/****************** Next ******************/
		/**** md5 signature: b63ea944a01b0e386a7cb8b02e8cfefd ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Next;
		virtual void Next();

		/****************** NextVertex ******************/
		/**** md5 signature: fc0d0c2b80a2501fa63795a7b7c92e53 ****/
		%feature("compactdefaultargs") NextVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextVertex;
		virtual void NextVertex();

		/****************** Orientation ******************/
		/**** md5 signature: ec4e6aeda890fe65be6f21abdaf8d1ae ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "If the function returns the orientation of the arc. if the orientation is forward or reversed, the arc is a 'real' limit of the surface. if the orientation is internal or external, the arc is considered as an arc on the surface.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
TopAbs_Orientation
") Orientation;
		virtual TopAbs_Orientation Orientation(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Orientation ******************/
		/**** md5 signature: 1e1d1ced6b52c356f59b839a0952b3b6 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "If the function returns the orientation of the arc. if the orientation is forward or reversed, the arc is a 'real' limit of the surface. if the orientation is internal or external, the arc is considered as an arc on the surface.

Parameters
----------
C: Adaptor3d_HVertex

Returns
-------
TopAbs_Orientation
") Orientation;
		virtual TopAbs_Orientation Orientation(const opencascade::handle<Adaptor3d_HVertex> & C);

		/****************** Pnt ******************/
		/**** md5 signature: 07c48c1ccc9352adfa820bedabe41ab1 ****/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "Returns 3d point of the vertex v.

Parameters
----------
V: Adaptor3d_HVertex

Returns
-------
gp_Pnt
") Pnt;
		virtual gp_Pnt Pnt(const opencascade::handle<Adaptor3d_HVertex> & V);

		/****************** SamplePoint ******************/
		/**** md5 signature: bc5c941f9b59752a7a36373d9a170420 ****/
		%feature("compactdefaultargs") SamplePoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int
P2d: gp_Pnt2d
P3d: gp_Pnt

Returns
-------
None
") SamplePoint;
		virtual void SamplePoint(const Standard_Integer Index, gp_Pnt2d & P2d, gp_Pnt & P3d);

		/****************** Tol3d ******************/
		/**** md5 signature: 5c555615a0871a252a6a0c4ef1849f7f ****/
		%feature("compactdefaultargs") Tol3d;
		%feature("autodoc", "Returns 3d tolerance of the arc c.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
float
") Tol3d;
		virtual Standard_Real Tol3d(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Tol3d ******************/
		/**** md5 signature: 36153ba1d394ad94701849f935fac318 ****/
		%feature("compactdefaultargs") Tol3d;
		%feature("autodoc", "Returns 3d tolerance of the vertex v.

Parameters
----------
V: Adaptor3d_HVertex

Returns
-------
float
") Tol3d;
		virtual Standard_Real Tol3d(const opencascade::handle<Adaptor3d_HVertex> & V);

		/****************** Value ******************/
		/**** md5 signature: b6d378a3136fff8867d9ec8b6d114b11 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") Value;
		virtual opencascade::handle<Adaptor2d_HCurve2d> Value();

		/****************** Vertex ******************/
		/**** md5 signature: 6c366dfe7165527233236e7fbb6bdce6 ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HVertex>
") Vertex;
		virtual opencascade::handle<Adaptor3d_HVertex> Vertex();

};


%make_alias(BRepTopAdaptor_TopolTool)

%extend BRepTopAdaptor_TopolTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
