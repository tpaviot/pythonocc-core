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
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(BRepTopAdaptor_HVertex)
%wrap_handle(BRepTopAdaptor_TopolTool)
/* end handles declaration */

/* templates */
%template(BRepTopAdaptor_MapOfShapeTool) NCollection_DataMap <TopoDS_Shape , BRepTopAdaptor_Tool , TopTools_ShapeMapHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap <TopoDS_Shape , BRepTopAdaptor_Tool , TopTools_ShapeMapHasher> BRepTopAdaptor_MapOfShapeTool;
typedef NCollection_DataMap <TopoDS_Shape , BRepTopAdaptor_Tool , TopTools_ShapeMapHasher>::Iterator BRepTopAdaptor_DataMapIteratorOfMapOfShapeTool;
typedef TColStd_SequenceOfAddress BRepTopAdaptor_SeqOfPtr;
/* end typedefs declaration */

/********************************
* class BRepTopAdaptor_FClass2d *
********************************/
class BRepTopAdaptor_FClass2d {
	public:
		/****************** BRepTopAdaptor_FClass2d ******************/
		%feature("compactdefaultargs") BRepTopAdaptor_FClass2d;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:param Tol:
	:type Tol: float
	:rtype: None") BRepTopAdaptor_FClass2d;
		 BRepTopAdaptor_FClass2d (const TopoDS_Face & F,const Standard_Real Tol);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", ":param Other:
	:type Other: BRepTopAdaptor_FClass2d
	:rtype: BRepTopAdaptor_FClass2d") Copy;
		const BRepTopAdaptor_FClass2d & Copy (const BRepTopAdaptor_FClass2d & Other);

		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", ":rtype: None") Destroy;
		void Destroy ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param Puv:
	:type Puv: gp_Pnt2d
	:param RecadreOnPeriodic: default value is Standard_True
	:type RecadreOnPeriodic: bool
	:rtype: TopAbs_State") Perform;
		TopAbs_State Perform (const gp_Pnt2d & Puv,const Standard_Boolean RecadreOnPeriodic = Standard_True);

		/****************** PerformInfinitePoint ******************/
		%feature("compactdefaultargs") PerformInfinitePoint;
		%feature("autodoc", ":rtype: TopAbs_State") PerformInfinitePoint;
		TopAbs_State PerformInfinitePoint ();

		/****************** TestOnRestriction ******************/
		%feature("compactdefaultargs") TestOnRestriction;
		%feature("autodoc", "* Test a point with +- an offset (Tol) and returns On if some points are OUT an some are IN (Caution: Internal use . see the code for more details)
	:param Puv:
	:type Puv: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:param RecadreOnPeriodic: default value is Standard_True
	:type RecadreOnPeriodic: bool
	:rtype: TopAbs_State") TestOnRestriction;
		TopAbs_State TestOnRestriction (const gp_Pnt2d & Puv,const Standard_Real Tol,const Standard_Boolean RecadreOnPeriodic = Standard_True);

		/****************** operator = ******************/
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", ":param Other:
	:type Other: BRepTopAdaptor_FClass2d
	:rtype: BRepTopAdaptor_FClass2d") operator =;
		const BRepTopAdaptor_FClass2d & operator = (const BRepTopAdaptor_FClass2d & Other);

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
		%feature("autodoc", ":param Vtx:
	:type Vtx: TopoDS_Vertex
	:param Curve:
	:type Curve: BRepAdaptor_HCurve2d
	:rtype: None") BRepTopAdaptor_HVertex;
		 BRepTopAdaptor_HVertex (const TopoDS_Vertex & Vtx,const opencascade::handle<BRepAdaptor_HCurve2d> & Curve);

		/****************** ChangeVertex ******************/
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", ":rtype: TopoDS_Vertex") ChangeVertex;
		TopoDS_Vertex  ChangeVertex ();

		/****************** IsSame ******************/
		%feature("compactdefaultargs") IsSame;
		%feature("autodoc", ":param Other:
	:type Other: Adaptor3d_HVertex
	:rtype: bool") IsSame;
		virtual Standard_Boolean IsSame (const opencascade::handle<Adaptor3d_HVertex> & Other);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", ":rtype: TopAbs_Orientation") Orientation;
		virtual TopAbs_Orientation Orientation ();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", ":param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: float") Parameter;
		virtual Standard_Real Parameter (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "* Parametric resolution (2d).
	:param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: float") Resolution;
		virtual Standard_Real Resolution (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: gp_Pnt2d") Value;
		virtual gp_Pnt2d Value ();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", ":rtype: TopoDS_Vertex") Vertex;
		const TopoDS_Vertex  Vertex ();

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
		%feature("autodoc", ":rtype: None") BRepTopAdaptor_Tool;
		 BRepTopAdaptor_Tool ();

		/****************** BRepTopAdaptor_Tool ******************/
		%feature("compactdefaultargs") BRepTopAdaptor_Tool;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:param Tol2d:
	:type Tol2d: float
	:rtype: None") BRepTopAdaptor_Tool;
		 BRepTopAdaptor_Tool (const TopoDS_Face & F,const Standard_Real Tol2d);

		/****************** BRepTopAdaptor_Tool ******************/
		%feature("compactdefaultargs") BRepTopAdaptor_Tool;
		%feature("autodoc", ":param Surface:
	:type Surface: Adaptor3d_HSurface
	:param Tol2d:
	:type Tol2d: float
	:rtype: None") BRepTopAdaptor_Tool;
		 BRepTopAdaptor_Tool (const opencascade::handle<Adaptor3d_HSurface> & Surface,const Standard_Real Tol2d);

		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", ":rtype: None") Destroy;
		void Destroy ();

		/****************** GetSurface ******************/
		%feature("compactdefaultargs") GetSurface;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor3d_HSurface>") GetSurface;
		opencascade::handle<Adaptor3d_HSurface> GetSurface ();

		/****************** GetTopolTool ******************/
		%feature("compactdefaultargs") GetTopolTool;
		%feature("autodoc", ":rtype: opencascade::handle<BRepTopAdaptor_TopolTool>") GetTopolTool;
		opencascade::handle<BRepTopAdaptor_TopolTool> GetTopolTool ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:param Tol2d:
	:type Tol2d: float
	:rtype: None") Init;
		void Init (const TopoDS_Face & F,const Standard_Real Tol2d);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param Surface:
	:type Surface: Adaptor3d_HSurface
	:param Tol2d:
	:type Tol2d: float
	:rtype: None") Init;
		void Init (const opencascade::handle<Adaptor3d_HSurface> & Surface,const Standard_Real Tol2d);

		/****************** SetTopolTool ******************/
		%feature("compactdefaultargs") SetTopolTool;
		%feature("autodoc", ":param TT:
	:type TT: BRepTopAdaptor_TopolTool
	:rtype: None") SetTopolTool;
		void SetTopolTool (const opencascade::handle<BRepTopAdaptor_TopolTool> & TT);

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
		%feature("autodoc", ":rtype: None") BRepTopAdaptor_TopolTool;
		 BRepTopAdaptor_TopolTool ();

		/****************** BRepTopAdaptor_TopolTool ******************/
		%feature("compactdefaultargs") BRepTopAdaptor_TopolTool;
		%feature("autodoc", ":param Surface:
	:type Surface: Adaptor3d_HSurface
	:rtype: None") BRepTopAdaptor_TopolTool;
		 BRepTopAdaptor_TopolTool (const opencascade::handle<Adaptor3d_HSurface> & Surface);

		/****************** Classify ******************/
		%feature("compactdefaultargs") Classify;
		%feature("autodoc", ":param P2d:
	:type P2d: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:param RecadreOnPeriodic: default value is Standard_True
	:type RecadreOnPeriodic: bool
	:rtype: TopAbs_State") Classify;
		virtual TopAbs_State Classify (const gp_Pnt2d & P2d,const Standard_Real Tol,const Standard_Boolean RecadreOnPeriodic = Standard_True);

		/****************** ComputeSamplePoints ******************/
		%feature("compactdefaultargs") ComputeSamplePoints;
		%feature("autodoc", ":rtype: void") ComputeSamplePoints;
		virtual void ComputeSamplePoints ();

		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", ":rtype: None") Destroy;
		void Destroy ();

		/****************** DomainIsInfinite ******************/
		%feature("compactdefaultargs") DomainIsInfinite;
		%feature("autodoc", ":rtype: bool") DomainIsInfinite;
		virtual Standard_Boolean DomainIsInfinite ();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", ":rtype: Standard_Address") Edge;
		virtual Standard_Address Edge ();

		/****************** Has3d ******************/
		%feature("compactdefaultargs") Has3d;
		%feature("autodoc", "* answers if arcs and vertices may have 3d representations, so that we could use Tol3d and Pnt methods.
	:rtype: bool") Has3d;
		virtual Standard_Boolean Has3d ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":rtype: void") Init;
		virtual void Init ();

		/****************** InitVertexIterator ******************/
		%feature("compactdefaultargs") InitVertexIterator;
		%feature("autodoc", ":rtype: void") InitVertexIterator;
		virtual void InitVertexIterator ();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", ":rtype: void") Initialize;
		virtual void Initialize ();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: void") Initialize;
		virtual void Initialize (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", ":param Curve:
	:type Curve: Adaptor2d_HCurve2d
	:rtype: void") Initialize;
		virtual void Initialize (const opencascade::handle<Adaptor2d_HCurve2d> & Curve);

		/****************** IsThePointOn ******************/
		%feature("compactdefaultargs") IsThePointOn;
		%feature("autodoc", "* see the code for specifications)
	:param P2d:
	:type P2d: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:param RecadreOnPeriodic: default value is Standard_True
	:type RecadreOnPeriodic: bool
	:rtype: bool") IsThePointOn;
		virtual Standard_Boolean IsThePointOn (const gp_Pnt2d & P2d,const Standard_Real Tol,const Standard_Boolean RecadreOnPeriodic = Standard_True);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", ":rtype: bool") More;
		virtual Standard_Boolean More ();

		/****************** MoreVertex ******************/
		%feature("compactdefaultargs") MoreVertex;
		%feature("autodoc", ":rtype: bool") MoreVertex;
		virtual Standard_Boolean MoreVertex ();

		/****************** NbSamples ******************/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "* compute the sample-points for the intersections algorithms
	:rtype: int") NbSamples;
		virtual Standard_Integer NbSamples ();

		/****************** NbSamplesU ******************/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "* compute the sample-points for the intersections algorithms
	:rtype: int") NbSamplesU;
		virtual Standard_Integer NbSamplesU ();

		/****************** NbSamplesV ******************/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "* compute the sample-points for the intersections algorithms
	:rtype: int") NbSamplesV;
		virtual Standard_Integer NbSamplesV ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", ":rtype: void") Next;
		virtual void Next ();

		/****************** NextVertex ******************/
		%feature("compactdefaultargs") NextVertex;
		%feature("autodoc", ":rtype: void") NextVertex;
		virtual void NextVertex ();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "* If the function returns the orientation of the arc. If the orientation is FORWARD or REVERSED, the arc is a 'real' limit of the surface. If the orientation is INTERNAL or EXTERNAL, the arc is considered as an arc on the surface.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: TopAbs_Orientation") Orientation;
		virtual TopAbs_Orientation Orientation (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "* If the function returns the orientation of the arc. If the orientation is FORWARD or REVERSED, the arc is a 'real' limit of the surface. If the orientation is INTERNAL or EXTERNAL, the arc is considered as an arc on the surface.
	:param C:
	:type C: Adaptor3d_HVertex
	:rtype: TopAbs_Orientation") Orientation;
		virtual TopAbs_Orientation Orientation (const opencascade::handle<Adaptor3d_HVertex> & C);

		/****************** Pnt ******************/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "* returns 3d point of the vertex V
	:param V:
	:type V: Adaptor3d_HVertex
	:rtype: gp_Pnt") Pnt;
		virtual gp_Pnt Pnt (const opencascade::handle<Adaptor3d_HVertex> & V);

		/****************** SamplePoint ******************/
		%feature("compactdefaultargs") SamplePoint;
		%feature("autodoc", ":param Index:
	:type Index: int
	:param P2d:
	:type P2d: gp_Pnt2d
	:param P3d:
	:type P3d: gp_Pnt
	:rtype: void") SamplePoint;
		virtual void SamplePoint (const Standard_Integer Index,gp_Pnt2d & P2d,gp_Pnt & P3d);

		/****************** Tol3d ******************/
		%feature("compactdefaultargs") Tol3d;
		%feature("autodoc", "* returns 3d tolerance of the arc C
	:param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: float") Tol3d;
		virtual Standard_Real Tol3d (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Tol3d ******************/
		%feature("compactdefaultargs") Tol3d;
		%feature("autodoc", "* returns 3d tolerance of the vertex V
	:param V:
	:type V: Adaptor3d_HVertex
	:rtype: float") Tol3d;
		virtual Standard_Real Tol3d (const opencascade::handle<Adaptor3d_HVertex> & V);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor2d_HCurve2d>") Value;
		virtual opencascade::handle<Adaptor2d_HCurve2d> Value ();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor3d_HVertex>") Vertex;
		virtual opencascade::handle<Adaptor3d_HVertex> Vertex ();

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
