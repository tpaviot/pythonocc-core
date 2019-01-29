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
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=BREPTOPADAPTORDOCSTRING) BRepTopAdaptor

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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


%include BRepTopAdaptor_headers.i

/* templates */
%template(BRepTopAdaptor_MapOfShapeTool) NCollection_DataMap <TopoDS_Shape , BRepTopAdaptor_Tool , TopTools_ShapeMapHasher>;
/* end templates declaration */


/* typedefs */
typedef NCollection_DataMap <TopoDS_Shape , BRepTopAdaptor_Tool , TopTools_ShapeMapHasher> BRepTopAdaptor_MapOfShapeTool;
typedef NCollection_DataMap <TopoDS_Shape , BRepTopAdaptor_Tool , TopTools_ShapeMapHasher>::Iterator BRepTopAdaptor_DataMapIteratorOfMapOfShapeTool;
typedef TColStd_SequenceOfAddress BRepTopAdaptor_SeqOfPtr;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%wrap_handle(BRepTopAdaptor_HVertex)
%wrap_handle(BRepTopAdaptor_TopolTool)

%nodefaultctor BRepTopAdaptor_FClass2d;
class BRepTopAdaptor_FClass2d {
	public:
		%feature("compactdefaultargs") BRepTopAdaptor_FClass2d;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param Tol:
	:type Tol: float
	:rtype: None
") BRepTopAdaptor_FClass2d;
		 BRepTopAdaptor_FClass2d (const TopoDS_Face & F,const Standard_Real Tol);
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	:param Other:
	:type Other: BRepTopAdaptor_FClass2d &
	:rtype: BRepTopAdaptor_FClass2d
") Copy;
		const BRepTopAdaptor_FClass2d & Copy (const BRepTopAdaptor_FClass2d & Other);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Puv:
	:type Puv: gp_Pnt2d
	:param RecadreOnPeriodic: default value is Standard_True
	:type RecadreOnPeriodic: bool
	:rtype: TopAbs_State
") Perform;
		TopAbs_State Perform (const gp_Pnt2d & Puv,const Standard_Boolean RecadreOnPeriodic = Standard_True);
		%feature("compactdefaultargs") PerformInfinitePoint;
		%feature("autodoc", "	:rtype: TopAbs_State
") PerformInfinitePoint;
		TopAbs_State PerformInfinitePoint ();
		%feature("compactdefaultargs") TestOnRestriction;
		%feature("autodoc", "	* Test a point with +- an offset (Tol) and returns On if some points are OUT an some are IN (Caution: Internal use . see the code for more details)

	:param Puv:
	:type Puv: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:param RecadreOnPeriodic: default value is Standard_True
	:type RecadreOnPeriodic: bool
	:rtype: TopAbs_State
") TestOnRestriction;
		TopAbs_State TestOnRestriction (const gp_Pnt2d & Puv,const Standard_Real Tol,const Standard_Boolean RecadreOnPeriodic = Standard_True);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepTopAdaptor_FClass2d &
	:rtype: BRepTopAdaptor_FClass2d
") operator =;
		const BRepTopAdaptor_FClass2d & operator = (const BRepTopAdaptor_FClass2d & Other);
};


%extend BRepTopAdaptor_FClass2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepTopAdaptor_HVertex;
class BRepTopAdaptor_HVertex : public Adaptor3d_HVertex {
	public:
		%feature("compactdefaultargs") BRepTopAdaptor_HVertex;
		%feature("autodoc", "	:param Vtx:
	:type Vtx: TopoDS_Vertex &
	:param Curve:
	:type Curve: Handle_BRepAdaptor_HCurve2d &
	:rtype: None
") BRepTopAdaptor_HVertex;
		 BRepTopAdaptor_HVertex (const TopoDS_Vertex & Vtx,const Handle_BRepAdaptor_HCurve2d & Curve);
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") ChangeVertex;
		TopoDS_Vertex  ChangeVertex ();
		%feature("compactdefaultargs") IsSame;
		%feature("autodoc", "	:param Other:
	:type Other: Handle_Adaptor3d_HVertex &
	:rtype: bool
") IsSame;
		virtual Standard_Boolean IsSame (const Handle_Adaptor3d_HVertex & Other);
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") Orientation;
		virtual TopAbs_Orientation Orientation ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: float
") Parameter;
		virtual Standard_Real Parameter (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	* Parametric resolution (2d).

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: float
") Resolution;
		virtual Standard_Real Resolution (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: gp_Pnt2d
") Value;
		virtual gp_Pnt2d Value ();
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") Vertex;
		const TopoDS_Vertex  Vertex ();
};


%make_alias(BRepTopAdaptor_HVertex)

%extend BRepTopAdaptor_HVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepTopAdaptor_Tool;
class BRepTopAdaptor_Tool {
	public:
		%feature("compactdefaultargs") BRepTopAdaptor_Tool;
		%feature("autodoc", "	:rtype: None
") BRepTopAdaptor_Tool;
		 BRepTopAdaptor_Tool ();
		%feature("compactdefaultargs") BRepTopAdaptor_Tool;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param Tol2d:
	:type Tol2d: float
	:rtype: None
") BRepTopAdaptor_Tool;
		 BRepTopAdaptor_Tool (const TopoDS_Face & F,const Standard_Real Tol2d);
		%feature("compactdefaultargs") BRepTopAdaptor_Tool;
		%feature("autodoc", "	:param Surface:
	:type Surface: Handle_Adaptor3d_HSurface &
	:param Tol2d:
	:type Tol2d: float
	:rtype: None
") BRepTopAdaptor_Tool;
		 BRepTopAdaptor_Tool (const Handle_Adaptor3d_HSurface & Surface,const Standard_Real Tol2d);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") GetSurface;
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HSurface
") GetSurface;
		Handle_Adaptor3d_HSurface GetSurface ();
		%feature("compactdefaultargs") GetTopolTool;
		%feature("autodoc", "	:rtype: Handle_BRepTopAdaptor_TopolTool
") GetTopolTool;
		Handle_BRepTopAdaptor_TopolTool GetTopolTool ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param Tol2d:
	:type Tol2d: float
	:rtype: None
") Init;
		void Init (const TopoDS_Face & F,const Standard_Real Tol2d);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Surface:
	:type Surface: Handle_Adaptor3d_HSurface &
	:param Tol2d:
	:type Tol2d: float
	:rtype: None
") Init;
		void Init (const Handle_Adaptor3d_HSurface & Surface,const Standard_Real Tol2d);
		%feature("compactdefaultargs") SetTopolTool;
		%feature("autodoc", "	:param TT:
	:type TT: Handle_BRepTopAdaptor_TopolTool &
	:rtype: None
") SetTopolTool;
		void SetTopolTool (const Handle_BRepTopAdaptor_TopolTool & TT);
};


%extend BRepTopAdaptor_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepTopAdaptor_TopolTool;
class BRepTopAdaptor_TopolTool : public Adaptor3d_TopolTool {
	public:
		%feature("compactdefaultargs") BRepTopAdaptor_TopolTool;
		%feature("autodoc", "	:rtype: None
") BRepTopAdaptor_TopolTool;
		 BRepTopAdaptor_TopolTool ();
		%feature("compactdefaultargs") BRepTopAdaptor_TopolTool;
		%feature("autodoc", "	:param Surface:
	:type Surface: Handle_Adaptor3d_HSurface &
	:rtype: None
") BRepTopAdaptor_TopolTool;
		 BRepTopAdaptor_TopolTool (const Handle_Adaptor3d_HSurface & Surface);
		%feature("compactdefaultargs") Classify;
		%feature("autodoc", "	:param P2d:
	:type P2d: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:param RecadreOnPeriodic: default value is Standard_True
	:type RecadreOnPeriodic: bool
	:rtype: TopAbs_State
") Classify;
		virtual TopAbs_State Classify (const gp_Pnt2d & P2d,const Standard_Real Tol,const Standard_Boolean RecadreOnPeriodic = Standard_True);
		%feature("compactdefaultargs") ComputeSamplePoints;
		%feature("autodoc", "	:rtype: void
") ComputeSamplePoints;
		virtual void ComputeSamplePoints ();
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") DomainIsInfinite;
		%feature("autodoc", "	:rtype: bool
") DomainIsInfinite;
		virtual Standard_Boolean DomainIsInfinite ();
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	:rtype: Standard_Address
") Edge;
		virtual Standard_Address Edge ();
		%feature("compactdefaultargs") Has3d;
		%feature("autodoc", "	* answers if arcs and vertices may have 3d representations, so that we could use Tol3d and Pnt methods.

	:rtype: bool
") Has3d;
		virtual Standard_Boolean Has3d ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:rtype: void
") Init;
		virtual void Init ();
		%feature("compactdefaultargs") InitVertexIterator;
		%feature("autodoc", "	:rtype: void
") InitVertexIterator;
		virtual void InitVertexIterator ();
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:rtype: void
") Initialize;
		virtual void Initialize ();
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: void
") Initialize;
		virtual void Initialize (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param Curve:
	:type Curve: Handle_Adaptor2d_HCurve2d &
	:rtype: void
") Initialize;
		virtual void Initialize (const Handle_Adaptor2d_HCurve2d & Curve);
		%feature("compactdefaultargs") IsThePointOn;
		%feature("autodoc", "	* see the code for specifications)

	:param P2d:
	:type P2d: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:param RecadreOnPeriodic: default value is Standard_True
	:type RecadreOnPeriodic: bool
	:rtype: bool
") IsThePointOn;
		virtual Standard_Boolean IsThePointOn (const gp_Pnt2d & P2d,const Standard_Real Tol,const Standard_Boolean RecadreOnPeriodic = Standard_True);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		virtual Standard_Boolean More ();
		%feature("compactdefaultargs") MoreVertex;
		%feature("autodoc", "	:rtype: bool
") MoreVertex;
		virtual Standard_Boolean MoreVertex ();
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "	* compute the sample-points for the intersections algorithms

	:rtype: int
") NbSamples;
		virtual Standard_Integer NbSamples ();
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "	* compute the sample-points for the intersections algorithms

	:rtype: int
") NbSamplesU;
		virtual Standard_Integer NbSamplesU ();
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "	* compute the sample-points for the intersections algorithms

	:rtype: int
") NbSamplesV;
		virtual Standard_Integer NbSamplesV ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: void
") Next;
		virtual void Next ();
		%feature("compactdefaultargs") NextVertex;
		%feature("autodoc", "	:rtype: void
") NextVertex;
		virtual void NextVertex ();
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	* If the function returns the orientation of the arc. If the orientation is FORWARD or REVERSED, the arc is a 'real' limit of the surface. If the orientation is INTERNAL or EXTERNAL, the arc is considered as an arc on the surface.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: TopAbs_Orientation
") Orientation;
		virtual TopAbs_Orientation Orientation (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	* If the function returns the orientation of the arc. If the orientation is FORWARD or REVERSED, the arc is a 'real' limit of the surface. If the orientation is INTERNAL or EXTERNAL, the arc is considered as an arc on the surface.

	:param C:
	:type C: Handle_Adaptor3d_HVertex &
	:rtype: TopAbs_Orientation
") Orientation;
		virtual TopAbs_Orientation Orientation (const Handle_Adaptor3d_HVertex & C);
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "	* returns 3d point of the vertex V

	:param V:
	:type V: Handle_Adaptor3d_HVertex &
	:rtype: gp_Pnt
") Pnt;
		virtual gp_Pnt Pnt (const Handle_Adaptor3d_HVertex & V);
		%feature("compactdefaultargs") SamplePoint;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param P2d:
	:type P2d: gp_Pnt2d
	:param P3d:
	:type P3d: gp_Pnt
	:rtype: void
") SamplePoint;
		virtual void SamplePoint (const Standard_Integer Index,gp_Pnt2d & P2d,gp_Pnt & P3d);
		%feature("compactdefaultargs") Tol3d;
		%feature("autodoc", "	* returns 3d tolerance of the arc C

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: float
") Tol3d;
		virtual Standard_Real Tol3d (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") Tol3d;
		%feature("autodoc", "	* returns 3d tolerance of the vertex V

	:param V:
	:type V: Handle_Adaptor3d_HVertex &
	:rtype: float
") Tol3d;
		virtual Standard_Real Tol3d (const Handle_Adaptor3d_HVertex & V);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Adaptor2d_HCurve2d
") Value;
		virtual Handle_Adaptor2d_HCurve2d Value ();
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HVertex
") Vertex;
		virtual Handle_Adaptor3d_HVertex Vertex ();
};


%make_alias(BRepTopAdaptor_TopolTool)

%extend BRepTopAdaptor_TopolTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
