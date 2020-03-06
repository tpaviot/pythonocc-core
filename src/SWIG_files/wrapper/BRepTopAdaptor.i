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
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") PerformInfinitePoint;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_State
") PerformInfinitePoint;
		TopAbs_State PerformInfinitePoint();

		/****************** TestOnRestriction ******************/
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
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Vertex
") ChangeVertex;
		TopoDS_Vertex ChangeVertex();

		/****************** IsSame ******************/
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
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") Orientation;
		virtual TopAbs_Orientation Orientation();

		/****************** Parameter ******************/
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
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt2d
") Value;
		virtual gp_Pnt2d Value();

		/****************** Vertex ******************/
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
		%feature("compactdefaultargs") BRepTopAdaptor_Tool;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepTopAdaptor_Tool;
		 BRepTopAdaptor_Tool();

		/****************** BRepTopAdaptor_Tool ******************/
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
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** GetSurface ******************/
		%feature("compactdefaultargs") GetSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") GetSurface;
		opencascade::handle<Adaptor3d_HSurface> GetSurface();

		/****************** GetTopolTool ******************/
		%feature("compactdefaultargs") GetTopolTool;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<BRepTopAdaptor_TopolTool>
") GetTopolTool;
		opencascade::handle<BRepTopAdaptor_TopolTool> GetTopolTool();

		/****************** Init ******************/
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
		%feature("compactdefaultargs") BRepTopAdaptor_TopolTool;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepTopAdaptor_TopolTool;
		 BRepTopAdaptor_TopolTool();

		/****************** BRepTopAdaptor_TopolTool ******************/
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
		%feature("compactdefaultargs") ComputeSamplePoints;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ComputeSamplePoints;
		virtual void ComputeSamplePoints();

		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** DomainIsInfinite ******************/
		%feature("compactdefaultargs") DomainIsInfinite;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") DomainIsInfinite;
		virtual Standard_Boolean DomainIsInfinite();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_Address
") Edge;
		virtual Standard_Address Edge();

		/****************** Has3d ******************/
		%feature("compactdefaultargs") Has3d;
		%feature("autodoc", "Answers if arcs and vertices may have 3d representations, so that we could use tol3d and pnt methods.

Returns
-------
bool
") Has3d;
		virtual Standard_Boolean Has3d();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Init;
		virtual void Init();

		/****************** InitVertexIterator ******************/
		%feature("compactdefaultargs") InitVertexIterator;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitVertexIterator;
		virtual void InitVertexIterator();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Initialize;
		virtual void Initialize();

		/****************** Initialize ******************/
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
		%feature("compactdefaultargs") More;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") More;
		virtual Standard_Boolean More();

		/****************** MoreVertex ******************/
		%feature("compactdefaultargs") MoreVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreVertex;
		virtual Standard_Boolean MoreVertex();

		/****************** NbSamples ******************/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "Compute the sample-points for the intersections algorithms.

Returns
-------
int
") NbSamples;
		virtual Standard_Integer NbSamples();

		/****************** NbSamplesU ******************/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "Compute the sample-points for the intersections algorithms.

Returns
-------
int
") NbSamplesU;
		virtual Standard_Integer NbSamplesU();

		/****************** NbSamplesV ******************/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "Compute the sample-points for the intersections algorithms.

Returns
-------
int
") NbSamplesV;
		virtual Standard_Integer NbSamplesV();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Next;
		virtual void Next();

		/****************** NextVertex ******************/
		%feature("compactdefaultargs") NextVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextVertex;
		virtual void NextVertex();

		/****************** Orientation ******************/
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
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") Value;
		virtual opencascade::handle<Adaptor2d_HCurve2d> Value();

		/****************** Vertex ******************/
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
