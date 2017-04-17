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
%module (package="OCC") ChFiDS

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


%include ChFiDS_headers.i


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
enum ChFiDS_ChamfMethod {
	ChFiDS_Sym = 0,
	ChFiDS_TwoDist = 1,
	ChFiDS_DistAngle = 2,
};

enum ChFiDS_ErrorStatus {
	ChFiDS_Ok = 0,
	ChFiDS_Error = 1,
	ChFiDS_WalkingFailure = 2,
	ChFiDS_StartsolFailure = 3,
	ChFiDS_TwistedSurface = 4,
};

enum ChFiDS_State {
	ChFiDS_OnSame = 0,
	ChFiDS_OnDiff = 1,
	ChFiDS_AllSame = 2,
	ChFiDS_BreakPoint = 3,
	ChFiDS_FreeBoundary = 4,
	ChFiDS_Closed = 5,
	ChFiDS_Tangent = 6,
};

/* end public enums declaration */

%nodefaultctor ChFiDS_CircSection;
class ChFiDS_CircSection {
	public:
		%feature("compactdefaultargs") ChFiDS_CircSection;
		%feature("autodoc", "	:rtype: None
") ChFiDS_CircSection;
		 ChFiDS_CircSection ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param C:
	:type C: gp_Circ
	:param F:
	:type F: float
	:param L:
	:type L: float
	:rtype: None
") Set;
		void Set (const gp_Circ & C,const Standard_Real F,const Standard_Real L);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:param F:
	:type F: float
	:param L:
	:type L: float
	:rtype: None
") Set;
		void Set (const gp_Lin & C,const Standard_Real F,const Standard_Real L);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	:param C:
	:type C: gp_Circ
	:param F:
	:type F: float &
	:param L:
	:type L: float &
	:rtype: None
") Get;
		void Get (gp_Circ & C,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:param F:
	:type F: float &
	:param L:
	:type L: float &
	:rtype: None
") Get;
		void Get (gp_Lin & C,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend ChFiDS_CircSection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiDS_CommonPoint;
class ChFiDS_CommonPoint {
	public:
		%feature("compactdefaultargs") ChFiDS_CommonPoint;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") ChFiDS_CommonPoint;
		 ChFiDS_CommonPoint ();
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "	* default value for all fields

	:rtype: None
") Reset;
		void Reset ();
		%feature("compactdefaultargs") SetVertex;
		%feature("autodoc", "	* Sets the values of a point which is a vertex on the initial facet of restriction of one of the surface.

	:param V:
	:type V: TopoDS_Vertex &
	:rtype: None
") SetVertex;
		void SetVertex (const TopoDS_Vertex & V);
		%feature("compactdefaultargs") SetArc;
		%feature("autodoc", "	* Sets the values of a point which is on the arc A, at parameter Param.

	:param Tol:
	:type Tol: float
	:param A:
	:type A: TopoDS_Edge &
	:param Param:
	:type Param: float
	:param TArc:
	:type TArc: TopAbs_Orientation
	:rtype: None
") SetArc;
		void SetArc (const Standard_Real Tol,const TopoDS_Edge & A,const Standard_Real Param,const TopAbs_Orientation TArc);
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "	* Sets the value of the parameter on the spine

	:param Param:
	:type Param: float
	:rtype: None
") SetParameter;
		void SetParameter (const Standard_Real Param);
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "	* Set the 3d point for a commonpoint that is not a vertex or on an arc.

	:param Point:
	:type Point: gp_Pnt
	:rtype: None
") SetPoint;
		void SetPoint (const gp_Pnt & Point);
		%feature("compactdefaultargs") SetVector;
		%feature("autodoc", "	* Set the output 3d vector

	:param Vector:
	:type Vector: gp_Vec
	:rtype: None
") SetVector;
		void SetVector (const gp_Vec & Vector);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	* This method set the fuzziness on the point.

	:param Tol:
	:type Tol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real Tol);
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	* This method returns the fuzziness on the point.

	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "	* Returns True if the point is a vertex on the initial restriction facet of the surface.

	:rtype: bool
") IsVertex;
		Standard_Boolean IsVertex ();
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	* Returns the information about the point when it is on the domain of the first patch, i-e when the function IsVertex returns True. Otherwise, an exception is raised.

	:rtype: TopoDS_Vertex
") Vertex;
		const TopoDS_Vertex  Vertex ();
		%feature("compactdefaultargs") IsOnArc;
		%feature("autodoc", "	* Returns True if the point is a on an edge of the initial restriction facet of the surface.

	:rtype: bool
") IsOnArc;
		Standard_Boolean IsOnArc ();
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "	* Returns the arc of restriction containing the vertex.

	:rtype: TopoDS_Edge
") Arc;
		const TopoDS_Edge  Arc ();
		%feature("compactdefaultargs") TransitionOnArc;
		%feature("autodoc", "	* Returns the transition of the point on the arc returned by Arc().

	:rtype: TopAbs_Orientation
") TransitionOnArc;
		TopAbs_Orientation TransitionOnArc ();
		%feature("compactdefaultargs") ParameterOnArc;
		%feature("autodoc", "	* Returns the parameter of the point on the arc returned by the method Arc().

	:rtype: float
") ParameterOnArc;
		Standard_Real ParameterOnArc ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Returns the parameter the paramter on the spine

	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the 3d point

	:rtype: gp_Pnt
") Point;
		const gp_Pnt  Point ();
		%feature("compactdefaultargs") HasVector;
		%feature("autodoc", "	* Returns True if the output vector is stored.

	:rtype: bool
") HasVector;
		Standard_Boolean HasVector ();
		%feature("compactdefaultargs") Vector;
		%feature("autodoc", "	* Returns the output 3d vector

	:rtype: gp_Vec
") Vector;
		const gp_Vec  Vector ();
};


%extend ChFiDS_CommonPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiDS_ElSpine;
class ChFiDS_ElSpine : public Adaptor3d_Curve {
	public:
		%feature("compactdefaultargs") ChFiDS_ElSpine;
		%feature("autodoc", "	:rtype: None
") ChFiDS_ElSpine;
		 ChFiDS_ElSpine ();
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	:rtype: float
") FirstParameter;
		virtual Standard_Real FirstParameter ();
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	:rtype: float
") LastParameter;
		virtual Standard_Real LastParameter ();
		%feature("compactdefaultargs") GetSavedFirstParameter;
		%feature("autodoc", "	:rtype: float
") GetSavedFirstParameter;
		Standard_Real GetSavedFirstParameter ();
		%feature("compactdefaultargs") GetSavedLastParameter;
		%feature("autodoc", "	:rtype: float
") GetSavedLastParameter;
		Standard_Real GetSavedLastParameter ();
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "	* Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: Handle_Adaptor3d_HCurve
") Trim;
		virtual Handle_Adaptor3d_HCurve Trim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		virtual Standard_Real Resolution (const Standard_Real R3d);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	:rtype: GeomAbs_CurveType
") GetType;
		virtual GeomAbs_CurveType GetType ();
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "	:rtype: bool
") IsPeriodic;
		virtual Standard_Boolean IsPeriodic ();
		%feature("compactdefaultargs") SetPeriodic;
		%feature("autodoc", "	:param I:
	:type I: bool
	:rtype: None
") SetPeriodic;
		void SetPeriodic (const Standard_Boolean I);
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "	:rtype: float
") Period;
		virtual Standard_Real Period ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param AbsC:
	:type AbsC: float
	:rtype: gp_Pnt
") Value;
		virtual gp_Pnt Value (const Standard_Real AbsC);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	:param AbsC:
	:type AbsC: float
	:param P:
	:type P: gp_Pnt
	:rtype: void
") D0;
		virtual void D0 (const Standard_Real AbsC,gp_Pnt & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param AbsC:
	:type AbsC: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: void
") D1;
		virtual void D1 (const Standard_Real AbsC,gp_Pnt & P,gp_Vec & V1);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param AbsC:
	:type AbsC: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: void
") D2;
		virtual void D2 (const Standard_Real AbsC,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	:param AbsC:
	:type AbsC: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:param V3:
	:type V3: gp_Vec
	:rtype: void
") D3;
		virtual void D3 (const Standard_Real AbsC,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	:param P:
	:type P: float
	:rtype: None
") FirstParameter;
		void FirstParameter (const Standard_Real P);
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	:param P:
	:type P: float
	:rtype: None
") LastParameter;
		void LastParameter (const Standard_Real P);
		%feature("compactdefaultargs") SaveFirstParameter;
		%feature("autodoc", "	:rtype: None
") SaveFirstParameter;
		void SaveFirstParameter ();
		%feature("compactdefaultargs") SaveLastParameter;
		%feature("autodoc", "	:rtype: None
") SaveLastParameter;
		void SaveLastParameter ();
		%feature("compactdefaultargs") SetOrigin;
		%feature("autodoc", "	:param O:
	:type O: float
	:rtype: None
") SetOrigin;
		void SetOrigin (const Standard_Real O);
		%feature("compactdefaultargs") FirstPointAndTgt;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param T:
	:type T: gp_Vec
	:rtype: None
") FirstPointAndTgt;
		void FirstPointAndTgt (gp_Pnt & P,gp_Vec & T);
		%feature("compactdefaultargs") LastPointAndTgt;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param T:
	:type T: gp_Vec
	:rtype: None
") LastPointAndTgt;
		void LastPointAndTgt (gp_Pnt & P,gp_Vec & T);
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", "	:rtype: int
") NbVertices;
		Standard_Integer NbVertices ();
		%feature("compactdefaultargs") VertexWithTangent;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Ax1
") VertexWithTangent;
		const gp_Ax1  VertexWithTangent (const Standard_Integer Index);
		%feature("compactdefaultargs") SetFirstPointAndTgt;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param T:
	:type T: gp_Vec
	:rtype: None
") SetFirstPointAndTgt;
		void SetFirstPointAndTgt (const gp_Pnt & P,const gp_Vec & T);
		%feature("compactdefaultargs") SetLastPointAndTgt;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param T:
	:type T: gp_Vec
	:rtype: None
") SetLastPointAndTgt;
		void SetLastPointAndTgt (const gp_Pnt & P,const gp_Vec & T);
		%feature("compactdefaultargs") AddVertexWithTangent;
		%feature("autodoc", "	:param anAx1:
	:type anAx1: gp_Ax1
	:rtype: None
") AddVertexWithTangent;
		void AddVertexWithTangent (const gp_Ax1 & anAx1);
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Curve &
	:rtype: None
") SetCurve;
		void SetCurve (const Handle_Geom_Curve & C);
		%feature("compactdefaultargs") Previous;
		%feature("autodoc", "	:rtype: Handle_ChFiDS_SurfData
") Previous;
		Handle_ChFiDS_SurfData Previous ();
		%feature("compactdefaultargs") ChangePrevious;
		%feature("autodoc", "	:rtype: Handle_ChFiDS_SurfData
") ChangePrevious;
		Handle_ChFiDS_SurfData ChangePrevious ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: Handle_ChFiDS_SurfData
") Next;
		Handle_ChFiDS_SurfData Next ();
		%feature("compactdefaultargs") ChangeNext;
		%feature("autodoc", "	:rtype: Handle_ChFiDS_SurfData
") ChangeNext;
		Handle_ChFiDS_SurfData ChangeNext ();
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	:rtype: gp_Lin
") Line;
		gp_Lin Line ();
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	:rtype: gp_Circ
") Circle;
		gp_Circ Circle ();
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "	:rtype: gp_Elips
") Ellipse;
		gp_Elips Ellipse ();
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "	:rtype: gp_Hypr
") Hyperbola;
		gp_Hypr Hyperbola ();
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "	:rtype: gp_Parab
") Parabola;
		gp_Parab Parabola ();
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "	:rtype: Handle_Geom_BezierCurve
") Bezier;
		Handle_Geom_BezierCurve Bezier ();
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "	:rtype: Handle_Geom_BSplineCurve
") BSpline;
		Handle_Geom_BSplineCurve BSpline ();
};


%extend ChFiDS_ElSpine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiDS_FaceInterference;
class ChFiDS_FaceInterference {
	public:
		%feature("compactdefaultargs") ChFiDS_FaceInterference;
		%feature("autodoc", "	:rtype: None
") ChFiDS_FaceInterference;
		 ChFiDS_FaceInterference ();
		%feature("compactdefaultargs") SetInterference;
		%feature("autodoc", "	:param LineIndex:
	:type LineIndex: int
	:param Trans:
	:type Trans: TopAbs_Orientation
	:param PCurv1:
	:type PCurv1: Handle_Geom2d_Curve &
	:param PCurv2:
	:type PCurv2: Handle_Geom2d_Curve &
	:rtype: None
") SetInterference;
		void SetInterference (const Standard_Integer LineIndex,const TopAbs_Orientation Trans,const Handle_Geom2d_Curve & PCurv1,const Handle_Geom2d_Curve & PCurv2);
		%feature("compactdefaultargs") SetTransition;
		%feature("autodoc", "	:param Trans:
	:type Trans: TopAbs_Orientation
	:rtype: None
") SetTransition;
		void SetTransition (const TopAbs_Orientation Trans);
		%feature("compactdefaultargs") SetFirstParameter;
		%feature("autodoc", "	:param U1:
	:type U1: float
	:rtype: None
") SetFirstParameter;
		void SetFirstParameter (const Standard_Real U1);
		%feature("compactdefaultargs") SetLastParameter;
		%feature("autodoc", "	:param U1:
	:type U1: float
	:rtype: None
") SetLastParameter;
		void SetLastParameter (const Standard_Real U1);
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "	:param U1:
	:type U1: float
	:param IsFirst:
	:type IsFirst: bool
	:rtype: None
") SetParameter;
		void SetParameter (const Standard_Real U1,const Standard_Boolean IsFirst);
		%feature("compactdefaultargs") LineIndex;
		%feature("autodoc", "	:rtype: int
") LineIndex;
		Standard_Integer LineIndex ();
		%feature("compactdefaultargs") SetLineIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: None
") SetLineIndex;
		void SetLineIndex (const Standard_Integer I);
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") Transition;
		TopAbs_Orientation Transition ();
		%feature("compactdefaultargs") PCurveOnFace;
		%feature("autodoc", "	:rtype: Handle_Geom2d_Curve
") PCurveOnFace;
		Handle_Geom2d_Curve PCurveOnFace ();
		%feature("compactdefaultargs") PCurveOnSurf;
		%feature("autodoc", "	:rtype: Handle_Geom2d_Curve
") PCurveOnSurf;
		Handle_Geom2d_Curve PCurveOnSurf ();
		%feature("compactdefaultargs") ChangePCurveOnFace;
		%feature("autodoc", "	:rtype: Handle_Geom2d_Curve
") ChangePCurveOnFace;
		Handle_Geom2d_Curve ChangePCurveOnFace ();
		%feature("compactdefaultargs") ChangePCurveOnSurf;
		%feature("autodoc", "	:rtype: Handle_Geom2d_Curve
") ChangePCurveOnSurf;
		Handle_Geom2d_Curve ChangePCurveOnSurf ();
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:param IsFirst:
	:type IsFirst: bool
	:rtype: float
") Parameter;
		Standard_Real Parameter (const Standard_Boolean IsFirst);
};


%extend ChFiDS_FaceInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiDS_HData;
class ChFiDS_HData : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") ChFiDS_HData;
		%feature("autodoc", "	:rtype: None
") ChFiDS_HData;
		 ChFiDS_HData ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_ChFiDS_SurfData &
	:rtype: None
") Append;
		void Append (const Handle_ChFiDS_SurfData & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_ChFiDS_HData &
	:rtype: None
") Append;
		void Append (const Handle_ChFiDS_HData & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_ChFiDS_SurfData &
	:rtype: None
") Prepend;
		void Prepend (const Handle_ChFiDS_SurfData & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_ChFiDS_HData &
	:rtype: None
") Prepend;
		void Prepend (const Handle_ChFiDS_HData & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_ChFiDS_SurfData &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_ChFiDS_SurfData & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_ChFiDS_HData &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_ChFiDS_HData & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_ChFiDS_SurfData &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_ChFiDS_SurfData & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_ChFiDS_HData &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_ChFiDS_HData & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_ChFiDS_HData
") Split;
		Handle_ChFiDS_HData Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_ChFiDS_SurfData &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_ChFiDS_SurfData & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_ChFiDS_SurfData
") Value;
		Handle_ChFiDS_SurfData Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_ChFiDS_SurfData
") ChangeValue;
		Handle_ChFiDS_SurfData ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: ChFiDS_SequenceOfSurfData
") Sequence;
		const ChFiDS_SequenceOfSurfData & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: ChFiDS_SequenceOfSurfData
") ChangeSequence;
		ChFiDS_SequenceOfSurfData & ChangeSequence ();
};


%extend ChFiDS_HData {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ChFiDS_HData(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ChFiDS_HData::Handle_ChFiDS_HData %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ChFiDS_HData;
class Handle_ChFiDS_HData : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_ChFiDS_HData();
        Handle_ChFiDS_HData(const Handle_ChFiDS_HData &aHandle);
        Handle_ChFiDS_HData(const ChFiDS_HData *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ChFiDS_HData DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ChFiDS_HData {
    ChFiDS_HData* _get_reference() {
    return (ChFiDS_HData*)$self->Access();
    }
};

%extend Handle_ChFiDS_HData {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ChFiDS_HData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiDS_HElSpine;
class ChFiDS_HElSpine : public Adaptor3d_HCurve {
	public:
		%feature("compactdefaultargs") ChFiDS_HElSpine;
		%feature("autodoc", "	:rtype: None
") ChFiDS_HElSpine;
		 ChFiDS_HElSpine ();
		%feature("compactdefaultargs") ChFiDS_HElSpine;
		%feature("autodoc", "	:param C:
	:type C: ChFiDS_ElSpine &
	:rtype: None
") ChFiDS_HElSpine;
		 ChFiDS_HElSpine (const ChFiDS_ElSpine & C);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param C:
	:type C: ChFiDS_ElSpine &
	:rtype: None
") Set;
		void Set (const ChFiDS_ElSpine & C);
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	:rtype: Adaptor3d_Curve
") Curve;
		const Adaptor3d_Curve & Curve ();
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "	:rtype: Adaptor3d_Curve
") GetCurve;
		Adaptor3d_Curve & GetCurve ();
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "	:rtype: ChFiDS_ElSpine
") ChangeCurve;
		ChFiDS_ElSpine & ChangeCurve ();
};


%extend ChFiDS_HElSpine {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ChFiDS_HElSpine(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ChFiDS_HElSpine::Handle_ChFiDS_HElSpine %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ChFiDS_HElSpine;
class Handle_ChFiDS_HElSpine : public Handle_Adaptor3d_HCurve {

    public:
        // constructors
        Handle_ChFiDS_HElSpine();
        Handle_ChFiDS_HElSpine(const Handle_ChFiDS_HElSpine &aHandle);
        Handle_ChFiDS_HElSpine(const ChFiDS_HElSpine *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ChFiDS_HElSpine DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ChFiDS_HElSpine {
    ChFiDS_HElSpine* _get_reference() {
    return (ChFiDS_HElSpine*)$self->Access();
    }
};

%extend Handle_ChFiDS_HElSpine {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ChFiDS_HElSpine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe;
class ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe;
		%feature("autodoc", "	:param K1:
	:type K1: TopoDS_Vertex &
	:param K2:
	:type K2: int
	:param I:
	:type I: ChFiDS_ListOfStripe &
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe;
		 ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe (const TopoDS_Vertex & K1,const Standard_Integer K2,const ChFiDS_ListOfStripe & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("compactdefaultargs") Key1;
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") Key1;
		TopoDS_Vertex  Key1 ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey2() {
                return (Standard_Integer) $self->Key2();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey2(Standard_Integer value ) {
                $self->Key2()=value;
                }
            };
            		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: ChFiDS_ListOfStripe
") Value;
		ChFiDS_ListOfStripe & Value ();
};


%extend ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe::Handle_ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe;
class Handle_ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe();
        Handle_ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe(const Handle_ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe &aHandle);
        Handle_ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe(const ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe {
    ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe* _get_reference() {
    return (ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe*)$self->Access();
    }
};

%extend Handle_ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiDS_IndexedDataMapOfVertexListOfStripe;
class ChFiDS_IndexedDataMapOfVertexListOfStripe : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") ChFiDS_IndexedDataMapOfVertexListOfStripe;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") ChFiDS_IndexedDataMapOfVertexListOfStripe;
		 ChFiDS_IndexedDataMapOfVertexListOfStripe (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_IndexedDataMapOfVertexListOfStripe &
	:rtype: ChFiDS_IndexedDataMapOfVertexListOfStripe
") Assign;
		ChFiDS_IndexedDataMapOfVertexListOfStripe & Assign (const ChFiDS_IndexedDataMapOfVertexListOfStripe & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_IndexedDataMapOfVertexListOfStripe &
	:rtype: ChFiDS_IndexedDataMapOfVertexListOfStripe
") operator =;
		ChFiDS_IndexedDataMapOfVertexListOfStripe & operator = (const ChFiDS_IndexedDataMapOfVertexListOfStripe & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Vertex &
	:param I:
	:type I: ChFiDS_ListOfStripe &
	:rtype: int
") Add;
		Standard_Integer Add (const TopoDS_Vertex & K,const ChFiDS_ListOfStripe & I);
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "	:param I:
	:type I: int
	:param K:
	:type K: TopoDS_Vertex &
	:param T:
	:type T: ChFiDS_ListOfStripe &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Vertex & K,const ChFiDS_ListOfStripe & T);
		%feature("compactdefaultargs") RemoveLast;
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Vertex &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TopoDS_Vertex & K);
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopoDS_Vertex
") FindKey;
		const TopoDS_Vertex  FindKey (const Standard_Integer I);
		%feature("compactdefaultargs") FindFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: ChFiDS_ListOfStripe
") FindFromIndex;
		const ChFiDS_ListOfStripe & FindFromIndex (const Standard_Integer I);
		%feature("compactdefaultargs") ChangeFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: ChFiDS_ListOfStripe
") ChangeFromIndex;
		ChFiDS_ListOfStripe & ChangeFromIndex (const Standard_Integer I);
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Vertex &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Vertex & K);
		%feature("compactdefaultargs") FindFromKey;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Vertex &
	:rtype: ChFiDS_ListOfStripe
") FindFromKey;
		const ChFiDS_ListOfStripe & FindFromKey (const TopoDS_Vertex & K);
		%feature("compactdefaultargs") ChangeFromKey;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Vertex &
	:rtype: ChFiDS_ListOfStripe
") ChangeFromKey;
		ChFiDS_ListOfStripe & ChangeFromKey (const TopoDS_Vertex & K);
		%feature("compactdefaultargs") FindFromKey1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Vertex &
	:rtype: Standard_Address
") FindFromKey1;
		Standard_Address FindFromKey1 (const TopoDS_Vertex & K);
		%feature("compactdefaultargs") ChangeFromKey1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Vertex &
	:rtype: Standard_Address
") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const TopoDS_Vertex & K);
};


%extend ChFiDS_IndexedDataMapOfVertexListOfStripe {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiDS_ListIteratorOfListOfHElSpine;
class ChFiDS_ListIteratorOfListOfHElSpine {
	public:
		%feature("compactdefaultargs") ChFiDS_ListIteratorOfListOfHElSpine;
		%feature("autodoc", "	:rtype: None
") ChFiDS_ListIteratorOfListOfHElSpine;
		 ChFiDS_ListIteratorOfListOfHElSpine ();
		%feature("compactdefaultargs") ChFiDS_ListIteratorOfListOfHElSpine;
		%feature("autodoc", "	:param L:
	:type L: ChFiDS_ListOfHElSpine &
	:rtype: None
") ChFiDS_ListIteratorOfListOfHElSpine;
		 ChFiDS_ListIteratorOfListOfHElSpine (const ChFiDS_ListOfHElSpine & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: ChFiDS_ListOfHElSpine &
	:rtype: None
") Initialize;
		void Initialize (const ChFiDS_ListOfHElSpine & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_ChFiDS_HElSpine
") Value;
		Handle_ChFiDS_HElSpine Value ();
};


%extend ChFiDS_ListIteratorOfListOfHElSpine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiDS_ListIteratorOfListOfStripe;
class ChFiDS_ListIteratorOfListOfStripe {
	public:
		%feature("compactdefaultargs") ChFiDS_ListIteratorOfListOfStripe;
		%feature("autodoc", "	:rtype: None
") ChFiDS_ListIteratorOfListOfStripe;
		 ChFiDS_ListIteratorOfListOfStripe ();
		%feature("compactdefaultargs") ChFiDS_ListIteratorOfListOfStripe;
		%feature("autodoc", "	:param L:
	:type L: ChFiDS_ListOfStripe &
	:rtype: None
") ChFiDS_ListIteratorOfListOfStripe;
		 ChFiDS_ListIteratorOfListOfStripe (const ChFiDS_ListOfStripe & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: ChFiDS_ListOfStripe &
	:rtype: None
") Initialize;
		void Initialize (const ChFiDS_ListOfStripe & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_ChFiDS_Stripe
") Value;
		Handle_ChFiDS_Stripe Value ();
};


%extend ChFiDS_ListIteratorOfListOfStripe {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiDS_ListIteratorOfRegularities;
class ChFiDS_ListIteratorOfRegularities {
	public:
		%feature("compactdefaultargs") ChFiDS_ListIteratorOfRegularities;
		%feature("autodoc", "	:rtype: None
") ChFiDS_ListIteratorOfRegularities;
		 ChFiDS_ListIteratorOfRegularities ();
		%feature("compactdefaultargs") ChFiDS_ListIteratorOfRegularities;
		%feature("autodoc", "	:param L:
	:type L: ChFiDS_Regularities &
	:rtype: None
") ChFiDS_ListIteratorOfRegularities;
		 ChFiDS_ListIteratorOfRegularities (const ChFiDS_Regularities & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: ChFiDS_Regularities &
	:rtype: None
") Initialize;
		void Initialize (const ChFiDS_Regularities & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: ChFiDS_Regul
") Value;
		ChFiDS_Regul & Value ();
};


%extend ChFiDS_ListIteratorOfRegularities {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiDS_ListNodeOfListOfHElSpine;
class ChFiDS_ListNodeOfListOfHElSpine : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") ChFiDS_ListNodeOfListOfHElSpine;
		%feature("autodoc", "	:param I:
	:type I: Handle_ChFiDS_HElSpine &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") ChFiDS_ListNodeOfListOfHElSpine;
		 ChFiDS_ListNodeOfListOfHElSpine (const Handle_ChFiDS_HElSpine & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_ChFiDS_HElSpine
") Value;
		Handle_ChFiDS_HElSpine Value ();
};


%extend ChFiDS_ListNodeOfListOfHElSpine {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ChFiDS_ListNodeOfListOfHElSpine(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ChFiDS_ListNodeOfListOfHElSpine::Handle_ChFiDS_ListNodeOfListOfHElSpine %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ChFiDS_ListNodeOfListOfHElSpine;
class Handle_ChFiDS_ListNodeOfListOfHElSpine : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_ChFiDS_ListNodeOfListOfHElSpine();
        Handle_ChFiDS_ListNodeOfListOfHElSpine(const Handle_ChFiDS_ListNodeOfListOfHElSpine &aHandle);
        Handle_ChFiDS_ListNodeOfListOfHElSpine(const ChFiDS_ListNodeOfListOfHElSpine *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ChFiDS_ListNodeOfListOfHElSpine DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ChFiDS_ListNodeOfListOfHElSpine {
    ChFiDS_ListNodeOfListOfHElSpine* _get_reference() {
    return (ChFiDS_ListNodeOfListOfHElSpine*)$self->Access();
    }
};

%extend Handle_ChFiDS_ListNodeOfListOfHElSpine {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ChFiDS_ListNodeOfListOfHElSpine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiDS_ListNodeOfListOfStripe;
class ChFiDS_ListNodeOfListOfStripe : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") ChFiDS_ListNodeOfListOfStripe;
		%feature("autodoc", "	:param I:
	:type I: Handle_ChFiDS_Stripe &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") ChFiDS_ListNodeOfListOfStripe;
		 ChFiDS_ListNodeOfListOfStripe (const Handle_ChFiDS_Stripe & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_ChFiDS_Stripe
") Value;
		Handle_ChFiDS_Stripe Value ();
};


%extend ChFiDS_ListNodeOfListOfStripe {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ChFiDS_ListNodeOfListOfStripe(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ChFiDS_ListNodeOfListOfStripe::Handle_ChFiDS_ListNodeOfListOfStripe %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ChFiDS_ListNodeOfListOfStripe;
class Handle_ChFiDS_ListNodeOfListOfStripe : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_ChFiDS_ListNodeOfListOfStripe();
        Handle_ChFiDS_ListNodeOfListOfStripe(const Handle_ChFiDS_ListNodeOfListOfStripe &aHandle);
        Handle_ChFiDS_ListNodeOfListOfStripe(const ChFiDS_ListNodeOfListOfStripe *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ChFiDS_ListNodeOfListOfStripe DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ChFiDS_ListNodeOfListOfStripe {
    ChFiDS_ListNodeOfListOfStripe* _get_reference() {
    return (ChFiDS_ListNodeOfListOfStripe*)$self->Access();
    }
};

%extend Handle_ChFiDS_ListNodeOfListOfStripe {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ChFiDS_ListNodeOfListOfStripe {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiDS_ListNodeOfRegularities;
class ChFiDS_ListNodeOfRegularities : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") ChFiDS_ListNodeOfRegularities;
		%feature("autodoc", "	:param I:
	:type I: ChFiDS_Regul &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") ChFiDS_ListNodeOfRegularities;
		 ChFiDS_ListNodeOfRegularities (const ChFiDS_Regul & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: ChFiDS_Regul
") Value;
		ChFiDS_Regul & Value ();
};


%extend ChFiDS_ListNodeOfRegularities {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ChFiDS_ListNodeOfRegularities(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ChFiDS_ListNodeOfRegularities::Handle_ChFiDS_ListNodeOfRegularities %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ChFiDS_ListNodeOfRegularities;
class Handle_ChFiDS_ListNodeOfRegularities : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_ChFiDS_ListNodeOfRegularities();
        Handle_ChFiDS_ListNodeOfRegularities(const Handle_ChFiDS_ListNodeOfRegularities &aHandle);
        Handle_ChFiDS_ListNodeOfRegularities(const ChFiDS_ListNodeOfRegularities *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ChFiDS_ListNodeOfRegularities DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ChFiDS_ListNodeOfRegularities {
    ChFiDS_ListNodeOfRegularities* _get_reference() {
    return (ChFiDS_ListNodeOfRegularities*)$self->Access();
    }
};

%extend Handle_ChFiDS_ListNodeOfRegularities {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ChFiDS_ListNodeOfRegularities {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiDS_ListOfHElSpine;
class ChFiDS_ListOfHElSpine {
	public:
		%feature("compactdefaultargs") ChFiDS_ListOfHElSpine;
		%feature("autodoc", "	:rtype: None
") ChFiDS_ListOfHElSpine;
		 ChFiDS_ListOfHElSpine ();
		%feature("compactdefaultargs") ChFiDS_ListOfHElSpine;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_ListOfHElSpine &
	:rtype: None
") ChFiDS_ListOfHElSpine;
		 ChFiDS_ListOfHElSpine (const ChFiDS_ListOfHElSpine & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_ListOfHElSpine &
	:rtype: None
") Assign;
		void Assign (const ChFiDS_ListOfHElSpine & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_ListOfHElSpine &
	:rtype: None
") operator =;
		void operator = (const ChFiDS_ListOfHElSpine & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_ChFiDS_HElSpine &
	:rtype: None
") Prepend;
		void Prepend (const Handle_ChFiDS_HElSpine & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_ChFiDS_HElSpine &
	:param theIt:
	:type theIt: ChFiDS_ListIteratorOfListOfHElSpine &
	:rtype: None
") Prepend;
		void Prepend (const Handle_ChFiDS_HElSpine & I,ChFiDS_ListIteratorOfListOfHElSpine & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_ListOfHElSpine &
	:rtype: None
") Prepend;
		void Prepend (ChFiDS_ListOfHElSpine & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_ChFiDS_HElSpine &
	:rtype: None
") Append;
		void Append (const Handle_ChFiDS_HElSpine & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_ChFiDS_HElSpine &
	:param theIt:
	:type theIt: ChFiDS_ListIteratorOfListOfHElSpine &
	:rtype: None
") Append;
		void Append (const Handle_ChFiDS_HElSpine & I,ChFiDS_ListIteratorOfListOfHElSpine & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_ListOfHElSpine &
	:rtype: None
") Append;
		void Append (ChFiDS_ListOfHElSpine & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_ChFiDS_HElSpine
") First;
		Handle_ChFiDS_HElSpine First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_ChFiDS_HElSpine
") Last;
		Handle_ChFiDS_HElSpine Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: ChFiDS_ListIteratorOfListOfHElSpine &
	:rtype: None
") Remove;
		void Remove (ChFiDS_ListIteratorOfListOfHElSpine & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: Handle_ChFiDS_HElSpine &
	:param It:
	:type It: ChFiDS_ListIteratorOfListOfHElSpine &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Handle_ChFiDS_HElSpine & I,ChFiDS_ListIteratorOfListOfHElSpine & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_ListOfHElSpine &
	:param It:
	:type It: ChFiDS_ListIteratorOfListOfHElSpine &
	:rtype: None
") InsertBefore;
		void InsertBefore (ChFiDS_ListOfHElSpine & Other,ChFiDS_ListIteratorOfListOfHElSpine & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: Handle_ChFiDS_HElSpine &
	:param It:
	:type It: ChFiDS_ListIteratorOfListOfHElSpine &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Handle_ChFiDS_HElSpine & I,ChFiDS_ListIteratorOfListOfHElSpine & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_ListOfHElSpine &
	:param It:
	:type It: ChFiDS_ListIteratorOfListOfHElSpine &
	:rtype: None
") InsertAfter;
		void InsertAfter (ChFiDS_ListOfHElSpine & Other,ChFiDS_ListIteratorOfListOfHElSpine & It);
};


%extend ChFiDS_ListOfHElSpine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiDS_ListOfStripe;
class ChFiDS_ListOfStripe {
	public:
		%feature("compactdefaultargs") ChFiDS_ListOfStripe;
		%feature("autodoc", "	:rtype: None
") ChFiDS_ListOfStripe;
		 ChFiDS_ListOfStripe ();
		%feature("compactdefaultargs") ChFiDS_ListOfStripe;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_ListOfStripe &
	:rtype: None
") ChFiDS_ListOfStripe;
		 ChFiDS_ListOfStripe (const ChFiDS_ListOfStripe & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_ListOfStripe &
	:rtype: None
") Assign;
		void Assign (const ChFiDS_ListOfStripe & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_ListOfStripe &
	:rtype: None
") operator =;
		void operator = (const ChFiDS_ListOfStripe & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_ChFiDS_Stripe &
	:rtype: None
") Prepend;
		void Prepend (const Handle_ChFiDS_Stripe & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_ChFiDS_Stripe &
	:param theIt:
	:type theIt: ChFiDS_ListIteratorOfListOfStripe &
	:rtype: None
") Prepend;
		void Prepend (const Handle_ChFiDS_Stripe & I,ChFiDS_ListIteratorOfListOfStripe & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_ListOfStripe &
	:rtype: None
") Prepend;
		void Prepend (ChFiDS_ListOfStripe & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_ChFiDS_Stripe &
	:rtype: None
") Append;
		void Append (const Handle_ChFiDS_Stripe & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_ChFiDS_Stripe &
	:param theIt:
	:type theIt: ChFiDS_ListIteratorOfListOfStripe &
	:rtype: None
") Append;
		void Append (const Handle_ChFiDS_Stripe & I,ChFiDS_ListIteratorOfListOfStripe & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_ListOfStripe &
	:rtype: None
") Append;
		void Append (ChFiDS_ListOfStripe & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_ChFiDS_Stripe
") First;
		Handle_ChFiDS_Stripe First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_ChFiDS_Stripe
") Last;
		Handle_ChFiDS_Stripe Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: ChFiDS_ListIteratorOfListOfStripe &
	:rtype: None
") Remove;
		void Remove (ChFiDS_ListIteratorOfListOfStripe & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: Handle_ChFiDS_Stripe &
	:param It:
	:type It: ChFiDS_ListIteratorOfListOfStripe &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Handle_ChFiDS_Stripe & I,ChFiDS_ListIteratorOfListOfStripe & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_ListOfStripe &
	:param It:
	:type It: ChFiDS_ListIteratorOfListOfStripe &
	:rtype: None
") InsertBefore;
		void InsertBefore (ChFiDS_ListOfStripe & Other,ChFiDS_ListIteratorOfListOfStripe & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: Handle_ChFiDS_Stripe &
	:param It:
	:type It: ChFiDS_ListIteratorOfListOfStripe &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Handle_ChFiDS_Stripe & I,ChFiDS_ListIteratorOfListOfStripe & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_ListOfStripe &
	:param It:
	:type It: ChFiDS_ListIteratorOfListOfStripe &
	:rtype: None
") InsertAfter;
		void InsertAfter (ChFiDS_ListOfStripe & Other,ChFiDS_ListIteratorOfListOfStripe & It);
};


%extend ChFiDS_ListOfStripe {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiDS_Map;
class ChFiDS_Map {
	public:
		%feature("compactdefaultargs") ChFiDS_Map;
		%feature("autodoc", "	* Create an empty Map

	:rtype: None
") ChFiDS_Map;
		 ChFiDS_Map ();
		%feature("compactdefaultargs") Fill;
		%feature("autodoc", "	* Fills the map with the subshapes of type T1 as keys and the list of ancestors of type T2 as items.

	:param S:
	:type S: TopoDS_Shape &
	:param T1:
	:type T1: TopAbs_ShapeEnum
	:param T2:
	:type T2: TopAbs_ShapeEnum
	:rtype: None
") Fill;
		void Fill (const TopoDS_Shape & S,const TopAbs_ShapeEnum T1,const TopAbs_ShapeEnum T2);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & S);
		%feature("compactdefaultargs") FindFromKey;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") FindFromKey;
		const TopTools_ListOfShape & FindFromKey (const TopoDS_Shape & S);
		%feature("compactdefaultargs") FindFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopTools_ListOfShape
") FindFromIndex;
		const TopTools_ListOfShape & FindFromIndex (const Standard_Integer I);
};


%extend ChFiDS_Map {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiDS_Regul;
class ChFiDS_Regul {
	public:
		%feature("compactdefaultargs") ChFiDS_Regul;
		%feature("autodoc", "	:rtype: None
") ChFiDS_Regul;
		 ChFiDS_Regul ();
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "	:param IC:
	:type IC: int
	:rtype: None
") SetCurve;
		void SetCurve (const Standard_Integer IC);
		%feature("compactdefaultargs") SetS1;
		%feature("autodoc", "	:param IS1:
	:type IS1: int
	:param IsFace: default value is Standard_True
	:type IsFace: bool
	:rtype: None
") SetS1;
		void SetS1 (const Standard_Integer IS1,const Standard_Boolean IsFace = Standard_True);
		%feature("compactdefaultargs") SetS2;
		%feature("autodoc", "	:param IS2:
	:type IS2: int
	:param IsFace: default value is Standard_True
	:type IsFace: bool
	:rtype: None
") SetS2;
		void SetS2 (const Standard_Integer IS2,const Standard_Boolean IsFace = Standard_True);
		%feature("compactdefaultargs") IsSurface1;
		%feature("autodoc", "	:rtype: bool
") IsSurface1;
		Standard_Boolean IsSurface1 ();
		%feature("compactdefaultargs") IsSurface2;
		%feature("autodoc", "	:rtype: bool
") IsSurface2;
		Standard_Boolean IsSurface2 ();
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	:rtype: int
") Curve;
		Standard_Integer Curve ();
		%feature("compactdefaultargs") S1;
		%feature("autodoc", "	:rtype: int
") S1;
		Standard_Integer S1 ();
		%feature("compactdefaultargs") S2;
		%feature("autodoc", "	:rtype: int
") S2;
		Standard_Integer S2 ();
};


%extend ChFiDS_Regul {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiDS_Regularities;
class ChFiDS_Regularities {
	public:
		%feature("compactdefaultargs") ChFiDS_Regularities;
		%feature("autodoc", "	:rtype: None
") ChFiDS_Regularities;
		 ChFiDS_Regularities ();
		%feature("compactdefaultargs") ChFiDS_Regularities;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_Regularities &
	:rtype: None
") ChFiDS_Regularities;
		 ChFiDS_Regularities (const ChFiDS_Regularities & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_Regularities &
	:rtype: None
") Assign;
		void Assign (const ChFiDS_Regularities & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_Regularities &
	:rtype: None
") operator =;
		void operator = (const ChFiDS_Regularities & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: ChFiDS_Regul &
	:rtype: None
") Prepend;
		void Prepend (const ChFiDS_Regul & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: ChFiDS_Regul &
	:param theIt:
	:type theIt: ChFiDS_ListIteratorOfRegularities &
	:rtype: None
") Prepend;
		void Prepend (const ChFiDS_Regul & I,ChFiDS_ListIteratorOfRegularities & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_Regularities &
	:rtype: None
") Prepend;
		void Prepend (ChFiDS_Regularities & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: ChFiDS_Regul &
	:rtype: None
") Append;
		void Append (const ChFiDS_Regul & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: ChFiDS_Regul &
	:param theIt:
	:type theIt: ChFiDS_ListIteratorOfRegularities &
	:rtype: None
") Append;
		void Append (const ChFiDS_Regul & I,ChFiDS_ListIteratorOfRegularities & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_Regularities &
	:rtype: None
") Append;
		void Append (ChFiDS_Regularities & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: ChFiDS_Regul
") First;
		ChFiDS_Regul & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: ChFiDS_Regul
") Last;
		ChFiDS_Regul & Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: ChFiDS_ListIteratorOfRegularities &
	:rtype: None
") Remove;
		void Remove (ChFiDS_ListIteratorOfRegularities & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: ChFiDS_Regul &
	:param It:
	:type It: ChFiDS_ListIteratorOfRegularities &
	:rtype: None
") InsertBefore;
		void InsertBefore (const ChFiDS_Regul & I,ChFiDS_ListIteratorOfRegularities & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_Regularities &
	:param It:
	:type It: ChFiDS_ListIteratorOfRegularities &
	:rtype: None
") InsertBefore;
		void InsertBefore (ChFiDS_Regularities & Other,ChFiDS_ListIteratorOfRegularities & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: ChFiDS_Regul &
	:param It:
	:type It: ChFiDS_ListIteratorOfRegularities &
	:rtype: None
") InsertAfter;
		void InsertAfter (const ChFiDS_Regul & I,ChFiDS_ListIteratorOfRegularities & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_Regularities &
	:param It:
	:type It: ChFiDS_ListIteratorOfRegularities &
	:rtype: None
") InsertAfter;
		void InsertAfter (ChFiDS_Regularities & Other,ChFiDS_ListIteratorOfRegularities & It);
};


%extend ChFiDS_Regularities {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiDS_SecArray1;
class ChFiDS_SecArray1 {
	public:
		%feature("compactdefaultargs") ChFiDS_SecArray1;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") ChFiDS_SecArray1;
		 ChFiDS_SecArray1 (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") ChFiDS_SecArray1;
		%feature("autodoc", "	:param Item:
	:type Item: ChFiDS_CircSection &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") ChFiDS_SecArray1;
		 ChFiDS_SecArray1 (const ChFiDS_CircSection & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: ChFiDS_CircSection &
	:rtype: None
") Init;
		void Init (const ChFiDS_CircSection & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_SecArray1 &
	:rtype: ChFiDS_SecArray1
") Assign;
		const ChFiDS_SecArray1 & Assign (const ChFiDS_SecArray1 & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_SecArray1 &
	:rtype: ChFiDS_SecArray1
") operator =;
		const ChFiDS_SecArray1 & operator = (const ChFiDS_SecArray1 & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: ChFiDS_CircSection &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const ChFiDS_CircSection & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: ChFiDS_CircSection
") Value;
		const ChFiDS_CircSection & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: ChFiDS_CircSection
") ChangeValue;
		ChFiDS_CircSection & ChangeValue (const Standard_Integer Index);
};


%extend ChFiDS_SecArray1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiDS_SecHArray1;
class ChFiDS_SecHArray1 : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") ChFiDS_SecHArray1;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") ChFiDS_SecHArray1;
		 ChFiDS_SecHArray1 (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") ChFiDS_SecHArray1;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: ChFiDS_CircSection &
	:rtype: None
") ChFiDS_SecHArray1;
		 ChFiDS_SecHArray1 (const Standard_Integer Low,const Standard_Integer Up,const ChFiDS_CircSection & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: ChFiDS_CircSection &
	:rtype: None
") Init;
		void Init (const ChFiDS_CircSection & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: ChFiDS_CircSection &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const ChFiDS_CircSection & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: ChFiDS_CircSection
") Value;
		const ChFiDS_CircSection & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: ChFiDS_CircSection
") ChangeValue;
		ChFiDS_CircSection & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: ChFiDS_SecArray1
") Array1;
		const ChFiDS_SecArray1 & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: ChFiDS_SecArray1
") ChangeArray1;
		ChFiDS_SecArray1 & ChangeArray1 ();
};


%extend ChFiDS_SecHArray1 {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ChFiDS_SecHArray1(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ChFiDS_SecHArray1::Handle_ChFiDS_SecHArray1 %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ChFiDS_SecHArray1;
class Handle_ChFiDS_SecHArray1 : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_ChFiDS_SecHArray1();
        Handle_ChFiDS_SecHArray1(const Handle_ChFiDS_SecHArray1 &aHandle);
        Handle_ChFiDS_SecHArray1(const ChFiDS_SecHArray1 *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ChFiDS_SecHArray1 DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ChFiDS_SecHArray1 {
    ChFiDS_SecHArray1* _get_reference() {
    return (ChFiDS_SecHArray1*)$self->Access();
    }
};

%extend Handle_ChFiDS_SecHArray1 {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ChFiDS_SecHArray1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiDS_SequenceNodeOfSequenceOfSpine;
class ChFiDS_SequenceNodeOfSequenceOfSpine : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") ChFiDS_SequenceNodeOfSequenceOfSpine;
		%feature("autodoc", "	:param I:
	:type I: Handle_ChFiDS_Spine &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") ChFiDS_SequenceNodeOfSequenceOfSpine;
		 ChFiDS_SequenceNodeOfSequenceOfSpine (const Handle_ChFiDS_Spine & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_ChFiDS_Spine
") Value;
		Handle_ChFiDS_Spine Value ();
};


%extend ChFiDS_SequenceNodeOfSequenceOfSpine {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ChFiDS_SequenceNodeOfSequenceOfSpine(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ChFiDS_SequenceNodeOfSequenceOfSpine::Handle_ChFiDS_SequenceNodeOfSequenceOfSpine %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ChFiDS_SequenceNodeOfSequenceOfSpine;
class Handle_ChFiDS_SequenceNodeOfSequenceOfSpine : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_ChFiDS_SequenceNodeOfSequenceOfSpine();
        Handle_ChFiDS_SequenceNodeOfSequenceOfSpine(const Handle_ChFiDS_SequenceNodeOfSequenceOfSpine &aHandle);
        Handle_ChFiDS_SequenceNodeOfSequenceOfSpine(const ChFiDS_SequenceNodeOfSequenceOfSpine *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ChFiDS_SequenceNodeOfSequenceOfSpine DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ChFiDS_SequenceNodeOfSequenceOfSpine {
    ChFiDS_SequenceNodeOfSequenceOfSpine* _get_reference() {
    return (ChFiDS_SequenceNodeOfSequenceOfSpine*)$self->Access();
    }
};

%extend Handle_ChFiDS_SequenceNodeOfSequenceOfSpine {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ChFiDS_SequenceNodeOfSequenceOfSpine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiDS_SequenceNodeOfSequenceOfSurfData;
class ChFiDS_SequenceNodeOfSequenceOfSurfData : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") ChFiDS_SequenceNodeOfSequenceOfSurfData;
		%feature("autodoc", "	:param I:
	:type I: Handle_ChFiDS_SurfData &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") ChFiDS_SequenceNodeOfSequenceOfSurfData;
		 ChFiDS_SequenceNodeOfSequenceOfSurfData (const Handle_ChFiDS_SurfData & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_ChFiDS_SurfData
") Value;
		Handle_ChFiDS_SurfData Value ();
};


%extend ChFiDS_SequenceNodeOfSequenceOfSurfData {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ChFiDS_SequenceNodeOfSequenceOfSurfData(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ChFiDS_SequenceNodeOfSequenceOfSurfData::Handle_ChFiDS_SequenceNodeOfSequenceOfSurfData %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ChFiDS_SequenceNodeOfSequenceOfSurfData;
class Handle_ChFiDS_SequenceNodeOfSequenceOfSurfData : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_ChFiDS_SequenceNodeOfSequenceOfSurfData();
        Handle_ChFiDS_SequenceNodeOfSequenceOfSurfData(const Handle_ChFiDS_SequenceNodeOfSequenceOfSurfData &aHandle);
        Handle_ChFiDS_SequenceNodeOfSequenceOfSurfData(const ChFiDS_SequenceNodeOfSequenceOfSurfData *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ChFiDS_SequenceNodeOfSequenceOfSurfData DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ChFiDS_SequenceNodeOfSequenceOfSurfData {
    ChFiDS_SequenceNodeOfSequenceOfSurfData* _get_reference() {
    return (ChFiDS_SequenceNodeOfSequenceOfSurfData*)$self->Access();
    }
};

%extend Handle_ChFiDS_SequenceNodeOfSequenceOfSurfData {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ChFiDS_SequenceNodeOfSequenceOfSurfData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiDS_SequenceOfSpine;
class ChFiDS_SequenceOfSpine : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") ChFiDS_SequenceOfSpine;
		%feature("autodoc", "	:rtype: None
") ChFiDS_SequenceOfSpine;
		 ChFiDS_SequenceOfSpine ();
		%feature("compactdefaultargs") ChFiDS_SequenceOfSpine;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_SequenceOfSpine &
	:rtype: None
") ChFiDS_SequenceOfSpine;
		 ChFiDS_SequenceOfSpine (const ChFiDS_SequenceOfSpine & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_SequenceOfSpine &
	:rtype: ChFiDS_SequenceOfSpine
") Assign;
		const ChFiDS_SequenceOfSpine & Assign (const ChFiDS_SequenceOfSpine & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_SequenceOfSpine &
	:rtype: ChFiDS_SequenceOfSpine
") operator =;
		const ChFiDS_SequenceOfSpine & operator = (const ChFiDS_SequenceOfSpine & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_ChFiDS_Spine &
	:rtype: None
") Append;
		void Append (const Handle_ChFiDS_Spine & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: ChFiDS_SequenceOfSpine &
	:rtype: None
") Append;
		void Append (ChFiDS_SequenceOfSpine & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_ChFiDS_Spine &
	:rtype: None
") Prepend;
		void Prepend (const Handle_ChFiDS_Spine & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: ChFiDS_SequenceOfSpine &
	:rtype: None
") Prepend;
		void Prepend (ChFiDS_SequenceOfSpine & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_ChFiDS_Spine &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_ChFiDS_Spine & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: ChFiDS_SequenceOfSpine &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,ChFiDS_SequenceOfSpine & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_ChFiDS_Spine &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_ChFiDS_Spine & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: ChFiDS_SequenceOfSpine &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,ChFiDS_SequenceOfSpine & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_ChFiDS_Spine
") First;
		Handle_ChFiDS_Spine First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_ChFiDS_Spine
") Last;
		Handle_ChFiDS_Spine Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: ChFiDS_SequenceOfSpine &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,ChFiDS_SequenceOfSpine & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_ChFiDS_Spine
") Value;
		Handle_ChFiDS_Spine Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_ChFiDS_Spine &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_ChFiDS_Spine & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_ChFiDS_Spine
") ChangeValue;
		Handle_ChFiDS_Spine ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend ChFiDS_SequenceOfSpine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiDS_SequenceOfSurfData;
class ChFiDS_SequenceOfSurfData : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") ChFiDS_SequenceOfSurfData;
		%feature("autodoc", "	:rtype: None
") ChFiDS_SequenceOfSurfData;
		 ChFiDS_SequenceOfSurfData ();
		%feature("compactdefaultargs") ChFiDS_SequenceOfSurfData;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_SequenceOfSurfData &
	:rtype: None
") ChFiDS_SequenceOfSurfData;
		 ChFiDS_SequenceOfSurfData (const ChFiDS_SequenceOfSurfData & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_SequenceOfSurfData &
	:rtype: ChFiDS_SequenceOfSurfData
") Assign;
		const ChFiDS_SequenceOfSurfData & Assign (const ChFiDS_SequenceOfSurfData & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_SequenceOfSurfData &
	:rtype: ChFiDS_SequenceOfSurfData
") operator =;
		const ChFiDS_SequenceOfSurfData & operator = (const ChFiDS_SequenceOfSurfData & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_ChFiDS_SurfData &
	:rtype: None
") Append;
		void Append (const Handle_ChFiDS_SurfData & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: ChFiDS_SequenceOfSurfData &
	:rtype: None
") Append;
		void Append (ChFiDS_SequenceOfSurfData & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_ChFiDS_SurfData &
	:rtype: None
") Prepend;
		void Prepend (const Handle_ChFiDS_SurfData & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: ChFiDS_SequenceOfSurfData &
	:rtype: None
") Prepend;
		void Prepend (ChFiDS_SequenceOfSurfData & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_ChFiDS_SurfData &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_ChFiDS_SurfData & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: ChFiDS_SequenceOfSurfData &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,ChFiDS_SequenceOfSurfData & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_ChFiDS_SurfData &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_ChFiDS_SurfData & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: ChFiDS_SequenceOfSurfData &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,ChFiDS_SequenceOfSurfData & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_ChFiDS_SurfData
") First;
		Handle_ChFiDS_SurfData First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_ChFiDS_SurfData
") Last;
		Handle_ChFiDS_SurfData Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: ChFiDS_SequenceOfSurfData &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,ChFiDS_SequenceOfSurfData & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_ChFiDS_SurfData
") Value;
		Handle_ChFiDS_SurfData Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_ChFiDS_SurfData &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_ChFiDS_SurfData & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_ChFiDS_SurfData
") ChangeValue;
		Handle_ChFiDS_SurfData ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend ChFiDS_SequenceOfSurfData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiDS_Spine;
class ChFiDS_Spine : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") ChFiDS_Spine;
		%feature("autodoc", "	:rtype: None
") ChFiDS_Spine;
		 ChFiDS_Spine ();
		%feature("compactdefaultargs") ChFiDS_Spine;
		%feature("autodoc", "	:param Tol:
	:type Tol: float
	:rtype: None
") ChFiDS_Spine;
		 ChFiDS_Spine (const Standard_Real Tol);
		%feature("compactdefaultargs") SetEdges;
		%feature("autodoc", "	* store edges composing the guideline

	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") SetEdges;
		void SetEdges (const TopoDS_Edge & E);
		%feature("compactdefaultargs") PutInFirst;
		%feature("autodoc", "	* store the edge at the first position before all others

	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") PutInFirst;
		void PutInFirst (const TopoDS_Edge & E);
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "	:rtype: int
") NbEdges;
		Standard_Integer NbEdges ();
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopoDS_Edge
") Edges;
		const TopoDS_Edge  Edges (const Standard_Integer I);
		%feature("compactdefaultargs") SetFirstStatus;
		%feature("autodoc", "	* stores if the start of a set of edges starts on a section of free border or forms a closed contour

	:param S:
	:type S: ChFiDS_State
	:rtype: None
") SetFirstStatus;
		void SetFirstStatus (const ChFiDS_State S);
		%feature("compactdefaultargs") SetLastStatus;
		%feature("autodoc", "	* stores if the end of a set of edges starts on a section of free border or forms a closed contour

	:param S:
	:type S: ChFiDS_State
	:rtype: None
") SetLastStatus;
		void SetLastStatus (const ChFiDS_State S);
		%feature("compactdefaultargs") AppendElSpine;
		%feature("autodoc", "	:param Els:
	:type Els: Handle_ChFiDS_HElSpine &
	:rtype: void
") AppendElSpine;
		virtual void AppendElSpine (const Handle_ChFiDS_HElSpine & Els);
		%feature("compactdefaultargs") ElSpine;
		%feature("autodoc", "	:param IE:
	:type IE: int
	:rtype: Handle_ChFiDS_HElSpine
") ElSpine;
		Handle_ChFiDS_HElSpine ElSpine (const Standard_Integer IE);
		%feature("compactdefaultargs") ElSpine;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:rtype: Handle_ChFiDS_HElSpine
") ElSpine;
		Handle_ChFiDS_HElSpine ElSpine (const TopoDS_Edge & E);
		%feature("compactdefaultargs") ElSpine;
		%feature("autodoc", "	:param W:
	:type W: float
	:rtype: Handle_ChFiDS_HElSpine
") ElSpine;
		Handle_ChFiDS_HElSpine ElSpine (const Standard_Real W);
		%feature("compactdefaultargs") ChangeElSpines;
		%feature("autodoc", "	:rtype: ChFiDS_ListOfHElSpine
") ChangeElSpines;
		ChFiDS_ListOfHElSpine & ChangeElSpines ();
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "	:param AllData: default value is Standard_False
	:type AllData: bool
	:rtype: void
") Reset;
		virtual void Reset (const Standard_Boolean AllData = Standard_False);
		%feature("compactdefaultargs") SplitDone;
		%feature("autodoc", "	:rtype: bool
") SplitDone;
		Standard_Boolean SplitDone ();
		%feature("compactdefaultargs") SplitDone;
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") SplitDone;
		void SplitDone (const Standard_Boolean B);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* prepare the guideline depending on the edges that are elementary arks (take parameters from a single curvilinear abscissa); to be able to call methods on the geometry (first,last,value,d1,d2) it is necessary to start with preparation otherwise an exception will be raised

	:rtype: None
") Load;
		void Load ();
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("compactdefaultargs") SetFirstParameter;
		%feature("autodoc", "	:param Par:
	:type Par: float
	:rtype: None
") SetFirstParameter;
		void SetFirstParameter (const Standard_Real Par);
		%feature("compactdefaultargs") SetLastParameter;
		%feature("autodoc", "	:param Par:
	:type Par: float
	:rtype: None
") SetLastParameter;
		void SetLastParameter (const Standard_Real Par);
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	* gives the total length of all arcs before the number IndexSp

	:param IndexSpine:
	:type IndexSpine: int
	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter (const Standard_Integer IndexSpine);
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	* gives the total length till the ark with number IndexSpine (inclus)

	:param IndexSpine:
	:type IndexSpine: int
	:rtype: float
") LastParameter;
		Standard_Real LastParameter (const Standard_Integer IndexSpine);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* gives the length of ark with number IndexSp

	:param IndexSpine:
	:type IndexSpine: int
	:rtype: float
") Length;
		Standard_Real Length (const Standard_Integer IndexSpine);
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "	:rtype: float
") Period;
		Standard_Real Period ();
		%feature("compactdefaultargs") Absc;
		%feature("autodoc", "	:param U:
	:type U: float
	:rtype: float
") Absc;
		Standard_Real Absc (const Standard_Real U);
		%feature("compactdefaultargs") Absc;
		%feature("autodoc", "	:param U:
	:type U: float
	:param I:
	:type I: int
	:rtype: float
") Absc;
		Standard_Real Absc (const Standard_Real U,const Standard_Integer I);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:param AbsC:
	:type AbsC: float
	:param U:
	:type U: float &
	:param Oriented: default value is Standard_True
	:type Oriented: bool
	:rtype: None
") Parameter;
		void Parameter (const Standard_Real AbsC,Standard_Real &OutValue,const Standard_Boolean Oriented = Standard_True);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param AbsC:
	:type AbsC: float
	:param U:
	:type U: float &
	:param Oriented: default value is Standard_True
	:type Oriented: bool
	:rtype: None
") Parameter;
		void Parameter (const Standard_Integer Index,const Standard_Real AbsC,Standard_Real &OutValue,const Standard_Boolean Oriented = Standard_True);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param AbsC:
	:type AbsC: float
	:rtype: gp_Pnt
") Value;
		gp_Pnt Value (const Standard_Real AbsC);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	:param AbsC:
	:type AbsC: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") D0;
		void D0 (const Standard_Real AbsC,gp_Pnt & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param AbsC:
	:type AbsC: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: None
") D1;
		void D1 (const Standard_Real AbsC,gp_Pnt & P,gp_Vec & V1);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param AbsC:
	:type AbsC: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: None
") D2;
		void D2 (const Standard_Real AbsC,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("compactdefaultargs") SetCurrent;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") SetCurrent;
		void SetCurrent (const Standard_Integer Index);
		%feature("compactdefaultargs") CurrentElementarySpine;
		%feature("autodoc", "	* sets the current curve and returns it

	:param Index:
	:type Index: int
	:rtype: BRepAdaptor_Curve
") CurrentElementarySpine;
		const BRepAdaptor_Curve & CurrentElementarySpine (const Standard_Integer Index);
		%feature("compactdefaultargs") CurrentIndexOfElementarySpine;
		%feature("autodoc", "	:rtype: int
") CurrentIndexOfElementarySpine;
		Standard_Integer CurrentIndexOfElementarySpine ();
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	:rtype: GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType ();
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	:rtype: gp_Lin
") Line;
		gp_Lin Line ();
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	:rtype: gp_Circ
") Circle;
		gp_Circ Circle ();
		%feature("compactdefaultargs") FirstStatus;
		%feature("autodoc", "	* returns if the set of edges starts on a free boundary or if the first vertex is a breakpoint or if the set is closed

	:rtype: ChFiDS_State
") FirstStatus;
		ChFiDS_State FirstStatus ();
		%feature("compactdefaultargs") LastStatus;
		%feature("autodoc", "	* returns the state at the end of the set

	:rtype: ChFiDS_State
") LastStatus;
		ChFiDS_State LastStatus ();
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	:param IsFirst:
	:type IsFirst: bool
	:rtype: ChFiDS_State
") Status;
		ChFiDS_State Status (const Standard_Boolean IsFirst);
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "	:param S:
	:type S: ChFiDS_State
	:param IsFirst:
	:type IsFirst: bool
	:rtype: None
") SetStatus;
		void SetStatus (const ChFiDS_State S,const Standard_Boolean IsFirst);
		%feature("compactdefaultargs") IsTangencyExtremity;
		%feature("autodoc", "	* returns if the set of edges starts (or end) on Tangency point.

	:param IsFirst:
	:type IsFirst: bool
	:rtype: bool
") IsTangencyExtremity;
		Standard_Boolean IsTangencyExtremity (const Standard_Boolean IsFirst);
		%feature("compactdefaultargs") SetTangencyExtremity;
		%feature("autodoc", "	:param IsTangency:
	:type IsTangency: bool
	:param IsFirst:
	:type IsFirst: bool
	:rtype: None
") SetTangencyExtremity;
		void SetTangencyExtremity (const Standard_Boolean IsTangency,const Standard_Boolean IsFirst);
		%feature("compactdefaultargs") Absc;
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Vertex &
	:rtype: float
") Absc;
		Standard_Real Absc (const TopoDS_Vertex & V);
		%feature("compactdefaultargs") FirstVertex;
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") FirstVertex;
		TopoDS_Vertex FirstVertex ();
		%feature("compactdefaultargs") LastVertex;
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") LastVertex;
		TopoDS_Vertex LastVertex ();
		%feature("compactdefaultargs") SetFirstTgt;
		%feature("autodoc", "	:param W:
	:type W: float
	:rtype: None
") SetFirstTgt;
		void SetFirstTgt (const Standard_Real W);
		%feature("compactdefaultargs") SetLastTgt;
		%feature("autodoc", "	:param W:
	:type W: float
	:rtype: None
") SetLastTgt;
		void SetLastTgt (const Standard_Real W);
		%feature("compactdefaultargs") HasFirstTgt;
		%feature("autodoc", "	:rtype: bool
") HasFirstTgt;
		Standard_Boolean HasFirstTgt ();
		%feature("compactdefaultargs") HasLastTgt;
		%feature("autodoc", "	:rtype: bool
") HasLastTgt;
		Standard_Boolean HasLastTgt ();
		%feature("compactdefaultargs") SetReference;
		%feature("autodoc", "	* set a parameter reference for the approx.

	:param W:
	:type W: float
	:rtype: None
") SetReference;
		void SetReference (const Standard_Real W);
		%feature("compactdefaultargs") SetReference;
		%feature("autodoc", "	* set a parameter reference for the approx, at the middle of edge I.

	:param I:
	:type I: int
	:rtype: None
") SetReference;
		void SetReference (const Standard_Integer I);
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	:param W:
	:type W: float
	:param Forward: default value is Standard_True
	:type Forward: bool
	:rtype: int
") Index;
		Standard_Integer Index (const Standard_Real W,const Standard_Boolean Forward = Standard_True);
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:rtype: int
") Index;
		Standard_Integer Index (const TopoDS_Edge & E);
		%feature("compactdefaultargs") UnsetReference;
		%feature("autodoc", "	:rtype: None
") UnsetReference;
		void UnsetReference ();
		%feature("compactdefaultargs") SetErrorStatus;
		%feature("autodoc", "	:param state:
	:type state: ChFiDS_ErrorStatus
	:rtype: None
") SetErrorStatus;
		void SetErrorStatus (const ChFiDS_ErrorStatus state);
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "	:rtype: ChFiDS_ErrorStatus
") ErrorStatus;
		ChFiDS_ErrorStatus ErrorStatus ();
};


%extend ChFiDS_Spine {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ChFiDS_Spine(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ChFiDS_Spine::Handle_ChFiDS_Spine %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ChFiDS_Spine;
class Handle_ChFiDS_Spine : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_ChFiDS_Spine();
        Handle_ChFiDS_Spine(const Handle_ChFiDS_Spine &aHandle);
        Handle_ChFiDS_Spine(const ChFiDS_Spine *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ChFiDS_Spine DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ChFiDS_Spine {
    ChFiDS_Spine* _get_reference() {
    return (ChFiDS_Spine*)$self->Access();
    }
};

%extend Handle_ChFiDS_Spine {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ChFiDS_Spine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiDS_Stripe;
class ChFiDS_Stripe : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") ChFiDS_Stripe;
		%feature("autodoc", "	:rtype: None
") ChFiDS_Stripe;
		 ChFiDS_Stripe ();
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "	* Reset everything except Spine.

	:rtype: None
") Reset;
		void Reset ();
		%feature("compactdefaultargs") SetOfSurfData;
		%feature("autodoc", "	:rtype: Handle_ChFiDS_HData
") SetOfSurfData;
		Handle_ChFiDS_HData SetOfSurfData ();
		%feature("compactdefaultargs") Spine;
		%feature("autodoc", "	:rtype: Handle_ChFiDS_Spine
") Spine;
		Handle_ChFiDS_Spine Spine ();
		%feature("compactdefaultargs") OrientationOnFace1;
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") OrientationOnFace1;
		TopAbs_Orientation OrientationOnFace1 ();
		%feature("compactdefaultargs") OrientationOnFace2;
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") OrientationOnFace2;
		TopAbs_Orientation OrientationOnFace2 ();
		%feature("compactdefaultargs") Choix;
		%feature("autodoc", "	:rtype: int
") Choix;
		Standard_Integer Choix ();
		%feature("compactdefaultargs") ChangeSetOfSurfData;
		%feature("autodoc", "	:rtype: Handle_ChFiDS_HData
") ChangeSetOfSurfData;
		Handle_ChFiDS_HData ChangeSetOfSurfData ();
		%feature("compactdefaultargs") ChangeSpine;
		%feature("autodoc", "	:rtype: Handle_ChFiDS_Spine
") ChangeSpine;
		Handle_ChFiDS_Spine ChangeSpine ();
		%feature("compactdefaultargs") OrientationOnFace1;
		%feature("autodoc", "	:param Or1:
	:type Or1: TopAbs_Orientation
	:rtype: None
") OrientationOnFace1;
		void OrientationOnFace1 (const TopAbs_Orientation Or1);
		%feature("compactdefaultargs") OrientationOnFace2;
		%feature("autodoc", "	:param Or2:
	:type Or2: TopAbs_Orientation
	:rtype: None
") OrientationOnFace2;
		void OrientationOnFace2 (const TopAbs_Orientation Or2);
		%feature("compactdefaultargs") Choix;
		%feature("autodoc", "	:param C:
	:type C: int
	:rtype: None
") Choix;
		void Choix (const Standard_Integer C);
		%feature("compactdefaultargs") FirstParameters;
		%feature("autodoc", "	:param Pdeb:
	:type Pdeb: float &
	:param Pfin:
	:type Pfin: float &
	:rtype: None
") FirstParameters;
		void FirstParameters (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") LastParameters;
		%feature("autodoc", "	:param Pdeb:
	:type Pdeb: float &
	:param Pfin:
	:type Pfin: float &
	:rtype: None
") LastParameters;
		void LastParameters (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") ChangeFirstParameters;
		%feature("autodoc", "	:param Pdeb:
	:type Pdeb: float
	:param Pfin:
	:type Pfin: float
	:rtype: None
") ChangeFirstParameters;
		void ChangeFirstParameters (const Standard_Real Pdeb,const Standard_Real Pfin);
		%feature("compactdefaultargs") ChangeLastParameters;
		%feature("autodoc", "	:param Pdeb:
	:type Pdeb: float
	:param Pfin:
	:type Pfin: float
	:rtype: None
") ChangeLastParameters;
		void ChangeLastParameters (const Standard_Real Pdeb,const Standard_Real Pfin);
		%feature("compactdefaultargs") FirstCurve;
		%feature("autodoc", "	:rtype: int
") FirstCurve;
		Standard_Integer FirstCurve ();
		%feature("compactdefaultargs") LastCurve;
		%feature("autodoc", "	:rtype: int
") LastCurve;
		Standard_Integer LastCurve ();
		%feature("compactdefaultargs") ChangeFirstCurve;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") ChangeFirstCurve;
		void ChangeFirstCurve (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeLastCurve;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") ChangeLastCurve;
		void ChangeLastCurve (const Standard_Integer Index);
		%feature("compactdefaultargs") FirstPCurve;
		%feature("autodoc", "	:rtype: Handle_Geom2d_Curve
") FirstPCurve;
		Handle_Geom2d_Curve FirstPCurve ();
		%feature("compactdefaultargs") LastPCurve;
		%feature("autodoc", "	:rtype: Handle_Geom2d_Curve
") LastPCurve;
		Handle_Geom2d_Curve LastPCurve ();
		%feature("compactdefaultargs") ChangeFirstPCurve;
		%feature("autodoc", "	:rtype: Handle_Geom2d_Curve
") ChangeFirstPCurve;
		Handle_Geom2d_Curve ChangeFirstPCurve ();
		%feature("compactdefaultargs") ChangeLastPCurve;
		%feature("autodoc", "	:rtype: Handle_Geom2d_Curve
") ChangeLastPCurve;
		Handle_Geom2d_Curve ChangeLastPCurve ();
		%feature("compactdefaultargs") FirstPCurveOrientation;
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") FirstPCurveOrientation;
		TopAbs_Orientation FirstPCurveOrientation ();
		%feature("compactdefaultargs") LastPCurveOrientation;
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") LastPCurveOrientation;
		TopAbs_Orientation LastPCurveOrientation ();
		%feature("compactdefaultargs") FirstPCurveOrientation;
		%feature("autodoc", "	:param O:
	:type O: TopAbs_Orientation
	:rtype: None
") FirstPCurveOrientation;
		void FirstPCurveOrientation (const TopAbs_Orientation O);
		%feature("compactdefaultargs") LastPCurveOrientation;
		%feature("autodoc", "	:param O:
	:type O: TopAbs_Orientation
	:rtype: None
") LastPCurveOrientation;
		void LastPCurveOrientation (const TopAbs_Orientation O);
		%feature("compactdefaultargs") IndexFirstPointOnS1;
		%feature("autodoc", "	:rtype: int
") IndexFirstPointOnS1;
		Standard_Integer IndexFirstPointOnS1 ();
		%feature("compactdefaultargs") IndexFirstPointOnS2;
		%feature("autodoc", "	:rtype: int
") IndexFirstPointOnS2;
		Standard_Integer IndexFirstPointOnS2 ();
		%feature("compactdefaultargs") IndexLastPointOnS1;
		%feature("autodoc", "	:rtype: int
") IndexLastPointOnS1;
		Standard_Integer IndexLastPointOnS1 ();
		%feature("compactdefaultargs") IndexLastPointOnS2;
		%feature("autodoc", "	:rtype: int
") IndexLastPointOnS2;
		Standard_Integer IndexLastPointOnS2 ();
		%feature("compactdefaultargs") ChangeIndexFirstPointOnS1;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") ChangeIndexFirstPointOnS1;
		void ChangeIndexFirstPointOnS1 (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeIndexFirstPointOnS2;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") ChangeIndexFirstPointOnS2;
		void ChangeIndexFirstPointOnS2 (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeIndexLastPointOnS1;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") ChangeIndexLastPointOnS1;
		void ChangeIndexLastPointOnS1 (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeIndexLastPointOnS2;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") ChangeIndexLastPointOnS2;
		void ChangeIndexLastPointOnS2 (const Standard_Integer Index);
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	:param First:
	:type First: bool
	:param Pdeb:
	:type Pdeb: float &
	:param Pfin:
	:type Pfin: float &
	:rtype: None
") Parameters;
		void Parameters (const Standard_Boolean First,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "	:param First:
	:type First: bool
	:param Pdeb:
	:type Pdeb: float
	:param Pfin:
	:type Pfin: float
	:rtype: None
") SetParameters;
		void SetParameters (const Standard_Boolean First,const Standard_Real Pdeb,const Standard_Real Pfin);
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	:param First:
	:type First: bool
	:rtype: int
") Curve;
		Standard_Integer Curve (const Standard_Boolean First);
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param First:
	:type First: bool
	:rtype: None
") SetCurve;
		void SetCurve (const Standard_Integer Index,const Standard_Boolean First);
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "	:param First:
	:type First: bool
	:rtype: Handle_Geom2d_Curve
") PCurve;
		Handle_Geom2d_Curve PCurve (const Standard_Boolean First);
		%feature("compactdefaultargs") ChangePCurve;
		%feature("autodoc", "	:param First:
	:type First: bool
	:rtype: Handle_Geom2d_Curve
") ChangePCurve;
		Handle_Geom2d_Curve ChangePCurve (const Standard_Boolean First);
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:param OnS:
	:type OnS: int
	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation (const Standard_Integer OnS);
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "	:param Or:
	:type Or: TopAbs_Orientation
	:param OnS:
	:type OnS: int
	:rtype: None
") SetOrientation;
		void SetOrientation (const TopAbs_Orientation Or,const Standard_Integer OnS);
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:param First:
	:type First: bool
	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation (const Standard_Boolean First);
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "	:param Or:
	:type Or: TopAbs_Orientation
	:param First:
	:type First: bool
	:rtype: None
") SetOrientation;
		void SetOrientation (const TopAbs_Orientation Or,const Standard_Boolean First);
		%feature("compactdefaultargs") IndexPoint;
		%feature("autodoc", "	:param First:
	:type First: bool
	:param OnS:
	:type OnS: int
	:rtype: int
") IndexPoint;
		Standard_Integer IndexPoint (const Standard_Boolean First,const Standard_Integer OnS);
		%feature("compactdefaultargs") SetIndexPoint;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param First:
	:type First: bool
	:param OnS:
	:type OnS: int
	:rtype: None
") SetIndexPoint;
		void SetIndexPoint (const Standard_Integer Index,const Standard_Boolean First,const Standard_Integer OnS);
		%feature("compactdefaultargs") SolidIndex;
		%feature("autodoc", "	:rtype: int
") SolidIndex;
		Standard_Integer SolidIndex ();
		%feature("compactdefaultargs") SetSolidIndex;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") SetSolidIndex;
		void SetSolidIndex (const Standard_Integer Index);
		%feature("compactdefaultargs") InDS;
		%feature("autodoc", "	* Set nb of SurfData's at end put in DS

	:param First:
	:type First: bool
	:param Nb: default value is 1
	:type Nb: int
	:rtype: None
") InDS;
		void InDS (const Standard_Boolean First,const Standard_Integer Nb = 1);
		%feature("compactdefaultargs") IsInDS;
		%feature("autodoc", "	* Returns nb of SurfData's at end being in DS

	:param First:
	:type First: bool
	:rtype: int
") IsInDS;
		Standard_Integer IsInDS (const Standard_Boolean First);
};


%extend ChFiDS_Stripe {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ChFiDS_Stripe(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ChFiDS_Stripe::Handle_ChFiDS_Stripe %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ChFiDS_Stripe;
class Handle_ChFiDS_Stripe : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_ChFiDS_Stripe();
        Handle_ChFiDS_Stripe(const Handle_ChFiDS_Stripe &aHandle);
        Handle_ChFiDS_Stripe(const ChFiDS_Stripe *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ChFiDS_Stripe DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ChFiDS_Stripe {
    ChFiDS_Stripe* _get_reference() {
    return (ChFiDS_Stripe*)$self->Access();
    }
};

%extend Handle_ChFiDS_Stripe {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ChFiDS_Stripe {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiDS_StripeArray1;
class ChFiDS_StripeArray1 {
	public:
		%feature("compactdefaultargs") ChFiDS_StripeArray1;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") ChFiDS_StripeArray1;
		 ChFiDS_StripeArray1 (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") ChFiDS_StripeArray1;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_ChFiDS_Stripe &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") ChFiDS_StripeArray1;
		 ChFiDS_StripeArray1 (const Handle_ChFiDS_Stripe & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_ChFiDS_Stripe &
	:rtype: None
") Init;
		void Init (const Handle_ChFiDS_Stripe & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_StripeArray1 &
	:rtype: ChFiDS_StripeArray1
") Assign;
		const ChFiDS_StripeArray1 & Assign (const ChFiDS_StripeArray1 & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_StripeArray1 &
	:rtype: ChFiDS_StripeArray1
") operator =;
		const ChFiDS_StripeArray1 & operator = (const ChFiDS_StripeArray1 & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_ChFiDS_Stripe &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_ChFiDS_Stripe & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_ChFiDS_Stripe
") Value;
		Handle_ChFiDS_Stripe Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_ChFiDS_Stripe
") ChangeValue;
		Handle_ChFiDS_Stripe ChangeValue (const Standard_Integer Index);
};


%extend ChFiDS_StripeArray1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiDS_StripeMap;
class ChFiDS_StripeMap {
	public:
		%feature("compactdefaultargs") ChFiDS_StripeMap;
		%feature("autodoc", "	:rtype: None
") ChFiDS_StripeMap;
		 ChFiDS_StripeMap ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Vertex &
	:param F:
	:type F: Handle_ChFiDS_Stripe &
	:rtype: None
") Add;
		void Add (const TopoDS_Vertex & V,const Handle_ChFiDS_Stripe & F);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") FindFromKey;
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Vertex &
	:rtype: ChFiDS_ListOfStripe
") FindFromKey;
		const ChFiDS_ListOfStripe & FindFromKey (const TopoDS_Vertex & V);
		%feature("compactdefaultargs") FindFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: ChFiDS_ListOfStripe
") FindFromIndex;
		const ChFiDS_ListOfStripe & FindFromIndex (const Standard_Integer I);
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopoDS_Vertex
") FindKey;
		const TopoDS_Vertex  FindKey (const Standard_Integer I);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
};


%extend ChFiDS_StripeMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiDS_SurfData;
class ChFiDS_SurfData : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") ChFiDS_SurfData;
		%feature("autodoc", "	:rtype: None
") ChFiDS_SurfData;
		 ChFiDS_SurfData ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	:param Other:
	:type Other: Handle_ChFiDS_SurfData &
	:rtype: None
") Copy;
		void Copy (const Handle_ChFiDS_SurfData & Other);
		%feature("compactdefaultargs") IndexOfS1;
		%feature("autodoc", "	:rtype: int
") IndexOfS1;
		Standard_Integer IndexOfS1 ();
		%feature("compactdefaultargs") IndexOfS2;
		%feature("autodoc", "	:rtype: int
") IndexOfS2;
		Standard_Integer IndexOfS2 ();
		%feature("compactdefaultargs") IsOnCurve1;
		%feature("autodoc", "	:rtype: bool
") IsOnCurve1;
		Standard_Boolean IsOnCurve1 ();
		%feature("compactdefaultargs") IsOnCurve2;
		%feature("autodoc", "	:rtype: bool
") IsOnCurve2;
		Standard_Boolean IsOnCurve2 ();
		%feature("compactdefaultargs") IndexOfC1;
		%feature("autodoc", "	:rtype: int
") IndexOfC1;
		Standard_Integer IndexOfC1 ();
		%feature("compactdefaultargs") IndexOfC2;
		%feature("autodoc", "	:rtype: int
") IndexOfC2;
		Standard_Integer IndexOfC2 ();
		%feature("compactdefaultargs") Surf;
		%feature("autodoc", "	:rtype: int
") Surf;
		Standard_Integer Surf ();
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation ();
		%feature("compactdefaultargs") InterferenceOnS1;
		%feature("autodoc", "	:rtype: ChFiDS_FaceInterference
") InterferenceOnS1;
		const ChFiDS_FaceInterference & InterferenceOnS1 ();
		%feature("compactdefaultargs") InterferenceOnS2;
		%feature("autodoc", "	:rtype: ChFiDS_FaceInterference
") InterferenceOnS2;
		const ChFiDS_FaceInterference & InterferenceOnS2 ();
		%feature("compactdefaultargs") VertexFirstOnS1;
		%feature("autodoc", "	:rtype: ChFiDS_CommonPoint
") VertexFirstOnS1;
		const ChFiDS_CommonPoint & VertexFirstOnS1 ();
		%feature("compactdefaultargs") VertexFirstOnS2;
		%feature("autodoc", "	:rtype: ChFiDS_CommonPoint
") VertexFirstOnS2;
		const ChFiDS_CommonPoint & VertexFirstOnS2 ();
		%feature("compactdefaultargs") VertexLastOnS1;
		%feature("autodoc", "	:rtype: ChFiDS_CommonPoint
") VertexLastOnS1;
		const ChFiDS_CommonPoint & VertexLastOnS1 ();
		%feature("compactdefaultargs") VertexLastOnS2;
		%feature("autodoc", "	:rtype: ChFiDS_CommonPoint
") VertexLastOnS2;
		const ChFiDS_CommonPoint & VertexLastOnS2 ();
		%feature("compactdefaultargs") ChangeIndexOfS1;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") ChangeIndexOfS1;
		void ChangeIndexOfS1 (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeIndexOfS2;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") ChangeIndexOfS2;
		void ChangeIndexOfS2 (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeSurf;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") ChangeSurf;
		void ChangeSurf (const Standard_Integer Index);
		%feature("compactdefaultargs") SetIndexOfC1;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") SetIndexOfC1;
		void SetIndexOfC1 (const Standard_Integer Index);
		%feature("compactdefaultargs") SetIndexOfC2;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") SetIndexOfC2;
		void SetIndexOfC2 (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeOrientation;
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") ChangeOrientation;
		TopAbs_Orientation & ChangeOrientation ();
		%feature("compactdefaultargs") ChangeInterferenceOnS1;
		%feature("autodoc", "	:rtype: ChFiDS_FaceInterference
") ChangeInterferenceOnS1;
		ChFiDS_FaceInterference & ChangeInterferenceOnS1 ();
		%feature("compactdefaultargs") ChangeInterferenceOnS2;
		%feature("autodoc", "	:rtype: ChFiDS_FaceInterference
") ChangeInterferenceOnS2;
		ChFiDS_FaceInterference & ChangeInterferenceOnS2 ();
		%feature("compactdefaultargs") ChangeVertexFirstOnS1;
		%feature("autodoc", "	:rtype: ChFiDS_CommonPoint
") ChangeVertexFirstOnS1;
		ChFiDS_CommonPoint & ChangeVertexFirstOnS1 ();
		%feature("compactdefaultargs") ChangeVertexFirstOnS2;
		%feature("autodoc", "	:rtype: ChFiDS_CommonPoint
") ChangeVertexFirstOnS2;
		ChFiDS_CommonPoint & ChangeVertexFirstOnS2 ();
		%feature("compactdefaultargs") ChangeVertexLastOnS1;
		%feature("autodoc", "	:rtype: ChFiDS_CommonPoint
") ChangeVertexLastOnS1;
		ChFiDS_CommonPoint & ChangeVertexLastOnS1 ();
		%feature("compactdefaultargs") ChangeVertexLastOnS2;
		%feature("autodoc", "	:rtype: ChFiDS_CommonPoint
") ChangeVertexLastOnS2;
		ChFiDS_CommonPoint & ChangeVertexLastOnS2 ();
		%feature("compactdefaultargs") Interference;
		%feature("autodoc", "	:param OnS:
	:type OnS: int
	:rtype: ChFiDS_FaceInterference
") Interference;
		const ChFiDS_FaceInterference & Interference (const Standard_Integer OnS);
		%feature("compactdefaultargs") ChangeInterference;
		%feature("autodoc", "	:param OnS:
	:type OnS: int
	:rtype: ChFiDS_FaceInterference
") ChangeInterference;
		ChFiDS_FaceInterference & ChangeInterference (const Standard_Integer OnS);
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	:param OfS:
	:type OfS: int
	:rtype: int
") Index;
		Standard_Integer Index (const Standard_Integer OfS);
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	* returns one of the four vertices wether First is true or wrong and OnS equals 1 or 2.

	:param First:
	:type First: bool
	:param OnS:
	:type OnS: int
	:rtype: ChFiDS_CommonPoint
") Vertex;
		const ChFiDS_CommonPoint & Vertex (const Standard_Boolean First,const Standard_Integer OnS);
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", "	* returns one of the four vertices wether First is true or wrong and OnS equals 1 or 2.

	:param First:
	:type First: bool
	:param OnS:
	:type OnS: int
	:rtype: ChFiDS_CommonPoint
") ChangeVertex;
		ChFiDS_CommonPoint & ChangeVertex (const Standard_Boolean First,const Standard_Integer OnS);
		%feature("compactdefaultargs") IsOnCurve;
		%feature("autodoc", "	:param OnS:
	:type OnS: int
	:rtype: bool
") IsOnCurve;
		Standard_Boolean IsOnCurve (const Standard_Integer OnS);
		%feature("compactdefaultargs") IndexOfC;
		%feature("autodoc", "	:param OnS:
	:type OnS: int
	:rtype: int
") IndexOfC;
		Standard_Integer IndexOfC (const Standard_Integer OnS);
		%feature("compactdefaultargs") FirstSpineParam;
		%feature("autodoc", "	:rtype: float
") FirstSpineParam;
		Standard_Real FirstSpineParam ();
		%feature("compactdefaultargs") LastSpineParam;
		%feature("autodoc", "	:rtype: float
") LastSpineParam;
		Standard_Real LastSpineParam ();
		%feature("compactdefaultargs") FirstSpineParam;
		%feature("autodoc", "	:param Par:
	:type Par: float
	:rtype: None
") FirstSpineParam;
		void FirstSpineParam (const Standard_Real Par);
		%feature("compactdefaultargs") LastSpineParam;
		%feature("autodoc", "	:param Par:
	:type Par: float
	:rtype: None
") LastSpineParam;
		void LastSpineParam (const Standard_Real Par);
		%feature("compactdefaultargs") FirstExtensionValue;
		%feature("autodoc", "	:rtype: float
") FirstExtensionValue;
		Standard_Real FirstExtensionValue ();
		%feature("compactdefaultargs") LastExtensionValue;
		%feature("autodoc", "	:rtype: float
") LastExtensionValue;
		Standard_Real LastExtensionValue ();
		%feature("compactdefaultargs") FirstExtensionValue;
		%feature("autodoc", "	:param Extend:
	:type Extend: float
	:rtype: None
") FirstExtensionValue;
		void FirstExtensionValue (const Standard_Real Extend);
		%feature("compactdefaultargs") LastExtensionValue;
		%feature("autodoc", "	:param Extend:
	:type Extend: float
	:rtype: None
") LastExtensionValue;
		void LastExtensionValue (const Standard_Real Extend);
		%feature("compactdefaultargs") Simul;
		%feature("autodoc", "	:rtype: Handle_MMgt_TShared
") Simul;
		Handle_MMgt_TShared Simul ();
		%feature("compactdefaultargs") SetSimul;
		%feature("autodoc", "	:param S:
	:type S: Handle_MMgt_TShared &
	:rtype: None
") SetSimul;
		void SetSimul (const Handle_MMgt_TShared & S);
		%feature("compactdefaultargs") ResetSimul;
		%feature("autodoc", "	:rtype: None
") ResetSimul;
		void ResetSimul ();
		%feature("compactdefaultargs") Get2dPoints;
		%feature("autodoc", "	:param First:
	:type First: bool
	:param OnS:
	:type OnS: int
	:rtype: gp_Pnt2d
") Get2dPoints;
		gp_Pnt2d Get2dPoints (const Standard_Boolean First,const Standard_Integer OnS);
		%feature("compactdefaultargs") Get2dPoints;
		%feature("autodoc", "	:param P2df1:
	:type P2df1: gp_Pnt2d
	:param P2dl1:
	:type P2dl1: gp_Pnt2d
	:param P2df2:
	:type P2df2: gp_Pnt2d
	:param P2dl2:
	:type P2dl2: gp_Pnt2d
	:rtype: None
") Get2dPoints;
		void Get2dPoints (gp_Pnt2d & P2df1,gp_Pnt2d & P2dl1,gp_Pnt2d & P2df2,gp_Pnt2d & P2dl2);
		%feature("compactdefaultargs") Set2dPoints;
		%feature("autodoc", "	:param P2df1:
	:type P2df1: gp_Pnt2d
	:param P2dl1:
	:type P2dl1: gp_Pnt2d
	:param P2df2:
	:type P2df2: gp_Pnt2d
	:param P2dl2:
	:type P2dl2: gp_Pnt2d
	:rtype: None
") Set2dPoints;
		void Set2dPoints (const gp_Pnt2d & P2df1,const gp_Pnt2d & P2dl1,const gp_Pnt2d & P2df2,const gp_Pnt2d & P2dl2);
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", "	:rtype: bool
") TwistOnS1;
		Standard_Boolean TwistOnS1 ();
		%feature("compactdefaultargs") TwistOnS2;
		%feature("autodoc", "	:rtype: bool
") TwistOnS2;
		Standard_Boolean TwistOnS2 ();
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", "	:param T:
	:type T: bool
	:rtype: None
") TwistOnS1;
		void TwistOnS1 (const Standard_Boolean T);
		%feature("compactdefaultargs") TwistOnS2;
		%feature("autodoc", "	:param T:
	:type T: bool
	:rtype: None
") TwistOnS2;
		void TwistOnS2 (const Standard_Boolean T);
};


%extend ChFiDS_SurfData {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ChFiDS_SurfData(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ChFiDS_SurfData::Handle_ChFiDS_SurfData %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ChFiDS_SurfData;
class Handle_ChFiDS_SurfData : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_ChFiDS_SurfData();
        Handle_ChFiDS_SurfData(const Handle_ChFiDS_SurfData &aHandle);
        Handle_ChFiDS_SurfData(const ChFiDS_SurfData *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ChFiDS_SurfData DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ChFiDS_SurfData {
    ChFiDS_SurfData* _get_reference() {
    return (ChFiDS_SurfData*)$self->Access();
    }
};

%extend Handle_ChFiDS_SurfData {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ChFiDS_SurfData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiDS_ChamfSpine;
class ChFiDS_ChamfSpine : public ChFiDS_Spine {
	public:
		%feature("compactdefaultargs") ChFiDS_ChamfSpine;
		%feature("autodoc", "	:rtype: None
") ChFiDS_ChamfSpine;
		 ChFiDS_ChamfSpine ();
		%feature("compactdefaultargs") ChFiDS_ChamfSpine;
		%feature("autodoc", "	:param Tol:
	:type Tol: float
	:rtype: None
") ChFiDS_ChamfSpine;
		 ChFiDS_ChamfSpine (const Standard_Real Tol);
		%feature("compactdefaultargs") SetDist;
		%feature("autodoc", "	:param Dis:
	:type Dis: float
	:rtype: None
") SetDist;
		void SetDist (const Standard_Real Dis);
		%feature("compactdefaultargs") GetDist;
		%feature("autodoc", "	:param Dis:
	:type Dis: float &
	:rtype: None
") GetDist;
		void GetDist (Standard_Real &OutValue);
		%feature("compactdefaultargs") SetDists;
		%feature("autodoc", "	:param Dis1:
	:type Dis1: float
	:param Dis2:
	:type Dis2: float
	:rtype: None
") SetDists;
		void SetDists (const Standard_Real Dis1,const Standard_Real Dis2);
		%feature("compactdefaultargs") Dists;
		%feature("autodoc", "	:param Dis1:
	:type Dis1: float &
	:param Dis2:
	:type Dis2: float &
	:rtype: None
") Dists;
		void Dists (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetDistAngle;
		%feature("autodoc", "	:param Dis:
	:type Dis: float &
	:param Angle:
	:type Angle: float &
	:param DisOnF1:
	:type DisOnF1: bool
	:rtype: None
") GetDistAngle;
		void GetDistAngle (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") SetDistAngle;
		%feature("autodoc", "	:param Dis:
	:type Dis: float
	:param Angle:
	:type Angle: float
	:param DisOnF1:
	:type DisOnF1: bool
	:rtype: None
") SetDistAngle;
		void SetDistAngle (const Standard_Real Dis,const Standard_Real Angle,const Standard_Boolean DisOnF1);
		%feature("compactdefaultargs") IsChamfer;
		%feature("autodoc", "	* Return the method of chamfers used

	:rtype: ChFiDS_ChamfMethod
") IsChamfer;
		ChFiDS_ChamfMethod IsChamfer ();
};


%extend ChFiDS_ChamfSpine {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ChFiDS_ChamfSpine(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ChFiDS_ChamfSpine::Handle_ChFiDS_ChamfSpine %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ChFiDS_ChamfSpine;
class Handle_ChFiDS_ChamfSpine : public Handle_ChFiDS_Spine {

    public:
        // constructors
        Handle_ChFiDS_ChamfSpine();
        Handle_ChFiDS_ChamfSpine(const Handle_ChFiDS_ChamfSpine &aHandle);
        Handle_ChFiDS_ChamfSpine(const ChFiDS_ChamfSpine *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ChFiDS_ChamfSpine DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ChFiDS_ChamfSpine {
    ChFiDS_ChamfSpine* _get_reference() {
    return (ChFiDS_ChamfSpine*)$self->Access();
    }
};

%extend Handle_ChFiDS_ChamfSpine {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ChFiDS_ChamfSpine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ChFiDS_FilSpine;
class ChFiDS_FilSpine : public ChFiDS_Spine {
	public:
		%feature("compactdefaultargs") ChFiDS_FilSpine;
		%feature("autodoc", "	:rtype: None
") ChFiDS_FilSpine;
		 ChFiDS_FilSpine ();
		%feature("compactdefaultargs") ChFiDS_FilSpine;
		%feature("autodoc", "	:param Tol:
	:type Tol: float
	:rtype: None
") ChFiDS_FilSpine;
		 ChFiDS_FilSpine (const Standard_Real Tol);
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "	:param AllData: default value is Standard_False
	:type AllData: bool
	:rtype: void
") Reset;
		virtual void Reset (const Standard_Boolean AllData = Standard_False);
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "	* initializes the constant vector on edge E.

	:param Radius:
	:type Radius: float
	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") SetRadius;
		void SetRadius (const Standard_Real Radius,const TopoDS_Edge & E);
		%feature("compactdefaultargs") UnSetRadius;
		%feature("autodoc", "	* resets the constant vector on edge E.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") UnSetRadius;
		void UnSetRadius (const TopoDS_Edge & E);
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "	* initializes the vector on Vertex V.

	:param Radius:
	:type Radius: float
	:param V:
	:type V: TopoDS_Vertex &
	:rtype: None
") SetRadius;
		void SetRadius (const Standard_Real Radius,const TopoDS_Vertex & V);
		%feature("compactdefaultargs") UnSetRadius;
		%feature("autodoc", "	* resets the vector on Vertex V.

	:param V:
	:type V: TopoDS_Vertex &
	:rtype: None
") UnSetRadius;
		void UnSetRadius (const TopoDS_Vertex & V);
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "	* initializes the vector on the point of parameter W.

	:param UandR:
	:type UandR: gp_XY
	:param IinC:
	:type IinC: int
	:rtype: None
") SetRadius;
		void SetRadius (const gp_XY & UandR,const Standard_Integer IinC);
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "	* initializes the constant vector on all spine.

	:param Radius:
	:type Radius: float
	:rtype: None
") SetRadius;
		void SetRadius (const Standard_Real Radius);
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "	* initializes the rule of evolution on all spine.

	:param C:
	:type C: Handle_Law_Function &
	:param IinC:
	:type IinC: int
	:rtype: None
") SetRadius;
		void SetRadius (const Handle_Law_Function & C,const Standard_Integer IinC);
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "	* returns true if the radius is constant all along the spine.

	:rtype: bool
") IsConstant;
		Standard_Boolean IsConstant ();
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "	* returns true if the radius is constant all along the edge E.

	:param IE:
	:type IE: int
	:rtype: bool
") IsConstant;
		Standard_Boolean IsConstant (const Standard_Integer IE);
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "	* returns the radius if the fillet is constant all along the spine.

	:rtype: float
") Radius;
		Standard_Real Radius ();
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "	* returns the radius if the fillet is constant all along the edge E.

	:param IE:
	:type IE: int
	:rtype: float
") Radius;
		Standard_Real Radius (const Standard_Integer IE);
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "	* returns the radius if the fillet is constant all along the edge E.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: float
") Radius;
		Standard_Real Radius (const TopoDS_Edge & E);
		%feature("compactdefaultargs") AppendElSpine;
		%feature("autodoc", "	:param Els:
	:type Els: Handle_ChFiDS_HElSpine &
	:rtype: void
") AppendElSpine;
		virtual void AppendElSpine (const Handle_ChFiDS_HElSpine & Els);
		%feature("compactdefaultargs") Law;
		%feature("autodoc", "	:param Els:
	:type Els: Handle_ChFiDS_HElSpine &
	:rtype: Handle_Law_Composite
") Law;
		Handle_Law_Composite Law (const Handle_ChFiDS_HElSpine & Els);
		%feature("compactdefaultargs") ChangeLaw;
		%feature("autodoc", "	* returns the elementary law

	:param E:
	:type E: TopoDS_Edge &
	:rtype: Handle_Law_Function
") ChangeLaw;
		Handle_Law_Function ChangeLaw (const TopoDS_Edge & E);
		%feature("compactdefaultargs") MaxRadFromSeqAndLaws;
		%feature("autodoc", "	* returns the maximum radius if the fillet is non-constant

	:rtype: float
") MaxRadFromSeqAndLaws;
		Standard_Real MaxRadFromSeqAndLaws ();
};


%extend ChFiDS_FilSpine {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ChFiDS_FilSpine(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ChFiDS_FilSpine::Handle_ChFiDS_FilSpine %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ChFiDS_FilSpine;
class Handle_ChFiDS_FilSpine : public Handle_ChFiDS_Spine {

    public:
        // constructors
        Handle_ChFiDS_FilSpine();
        Handle_ChFiDS_FilSpine(const Handle_ChFiDS_FilSpine &aHandle);
        Handle_ChFiDS_FilSpine(const ChFiDS_FilSpine *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ChFiDS_FilSpine DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ChFiDS_FilSpine {
    ChFiDS_FilSpine* _get_reference() {
    return (ChFiDS_FilSpine*)$self->Access();
    }
};

%extend Handle_ChFiDS_FilSpine {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ChFiDS_FilSpine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
