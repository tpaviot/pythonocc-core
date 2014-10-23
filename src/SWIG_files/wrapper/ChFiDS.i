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
%module (package="OCC") ChFiDS

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

%include ChFiDS_headers.i

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
		%feature("autodoc", "	:rtype: None
") ChFiDS_CircSection;
		 ChFiDS_CircSection ();
		%feature("autodoc", "	:param C:
	:type C: gp_Circ
	:param F:
	:type F: float
	:param L:
	:type L: float
	:rtype: None
") Set;
		void Set (const gp_Circ & C,const Standard_Real F,const Standard_Real L);
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:param F:
	:type F: float
	:param L:
	:type L: float
	:rtype: None
") Set;
		void Set (const gp_Lin & C,const Standard_Real F,const Standard_Real L);
		%feature("autodoc", "	:param C:
	:type C: gp_Circ
	:param F:
	:type F: float &
	:param L:
	:type L: float &
	:rtype: None
") Get;
		void Get (gp_Circ & C,Standard_Real &OutValue,Standard_Real &OutValue);
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


%feature("shadow") ChFiDS_CircSection::~ChFiDS_CircSection %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiDS_CircSection {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ChFiDS_CommonPoint;
class ChFiDS_CommonPoint {
	public:
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") ChFiDS_CommonPoint;
		 ChFiDS_CommonPoint ();
		%feature("autodoc", "	* default value for all fields

	:rtype: None
") Reset;
		void Reset ();
		%feature("autodoc", "	* Sets the values of a point which is a vertex on the initial facet of restriction of one of the surface.

	:param V:
	:type V: TopoDS_Vertex &
	:rtype: None
") SetVertex;
		void SetVertex (const TopoDS_Vertex & V);
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
		%feature("autodoc", "	* Sets the value of the parameter on the spine

	:param Param:
	:type Param: float
	:rtype: None
") SetParameter;
		void SetParameter (const Standard_Real Param);
		%feature("autodoc", "	* Set the 3d point for a commonpoint that is not a vertex or on an arc.

	:param Point:
	:type Point: gp_Pnt
	:rtype: None
") SetPoint;
		void SetPoint (const gp_Pnt & Point);
		%feature("autodoc", "	* Set the output 3d vector

	:param Vector:
	:type Vector: gp_Vec
	:rtype: None
") SetVector;
		void SetVector (const gp_Vec & Vector);
		%feature("autodoc", "	* This method set the fuzziness on the point.

	:param Tol:
	:type Tol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real Tol);
		%feature("autodoc", "	* This method returns the fuzziness on the point.

	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "	* Returns True if the point is a vertex on the initial restriction facet of the surface.

	:rtype: bool
") IsVertex;
		Standard_Boolean IsVertex ();
		%feature("autodoc", "	* Returns the information about the point when it is on the domain of the first patch, i-e when the function IsVertex returns True. Otherwise, an exception is raised.

	:rtype: TopoDS_Vertex
") Vertex;
		const TopoDS_Vertex  Vertex ();
		%feature("autodoc", "	* Returns True if the point is a on an edge of the initial restriction facet of the surface.

	:rtype: bool
") IsOnArc;
		Standard_Boolean IsOnArc ();
		%feature("autodoc", "	* Returns the arc of restriction containing the vertex.

	:rtype: TopoDS_Edge
") Arc;
		const TopoDS_Edge  Arc ();
		%feature("autodoc", "	* Returns the transition of the point on the arc returned by Arc().

	:rtype: TopAbs_Orientation
") TransitionOnArc;
		TopAbs_Orientation TransitionOnArc ();
		%feature("autodoc", "	* Returns the parameter of the point on the arc returned by the method Arc().

	:rtype: float
") ParameterOnArc;
		Standard_Real ParameterOnArc ();
		%feature("autodoc", "	* Returns the parameter the paramter on the spine

	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "	* Returns the 3d point

	:rtype: gp_Pnt
") Point;
		const gp_Pnt  Point ();
		%feature("autodoc", "	* Returns True if the output vector is stored.

	:rtype: bool
") HasVector;
		Standard_Boolean HasVector ();
		%feature("autodoc", "	* Returns the output 3d vector

	:rtype: gp_Vec
") Vector;
		const gp_Vec  Vector ();
};


%feature("shadow") ChFiDS_CommonPoint::~ChFiDS_CommonPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiDS_CommonPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ChFiDS_ElSpine;
class ChFiDS_ElSpine : public Adaptor3d_Curve {
	public:
		%feature("autodoc", "	:rtype: None
") ChFiDS_ElSpine;
		 ChFiDS_ElSpine ();
		%feature("autodoc", "	:rtype: float
") FirstParameter;
		virtual Standard_Real FirstParameter ();
		%feature("autodoc", "	:rtype: float
") LastParameter;
		virtual Standard_Real LastParameter ();
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
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
		%feature("autodoc", "	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		virtual Standard_Real Resolution (const Standard_Real R3d);
		%feature("autodoc", "	:rtype: GeomAbs_CurveType
") GetType;
		virtual GeomAbs_CurveType GetType ();
		%feature("autodoc", "	:rtype: bool
") IsPeriodic;
		virtual Standard_Boolean IsPeriodic ();
		%feature("autodoc", "	:param I:
	:type I: bool
	:rtype: None
") SetPeriodic;
		void SetPeriodic (const Standard_Boolean I);
		%feature("autodoc", "	:rtype: float
") Period;
		virtual Standard_Real Period ();
		%feature("autodoc", "	:param AbsC:
	:type AbsC: float
	:rtype: gp_Pnt
") Value;
		virtual gp_Pnt Value (const Standard_Real AbsC);
		%feature("autodoc", "	:param AbsC:
	:type AbsC: float
	:param P:
	:type P: gp_Pnt
	:rtype: void
") D0;
		virtual void D0 (const Standard_Real AbsC,gp_Pnt & P);
		%feature("autodoc", "	:param AbsC:
	:type AbsC: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: void
") D1;
		virtual void D1 (const Standard_Real AbsC,gp_Pnt & P,gp_Vec & V1);
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
		%feature("autodoc", "	:param P:
	:type P: float
	:rtype: None
") FirstParameter;
		void FirstParameter (const Standard_Real P);
		%feature("autodoc", "	:param P:
	:type P: float
	:rtype: None
") LastParameter;
		void LastParameter (const Standard_Real P);
		%feature("autodoc", "	:param O:
	:type O: float
	:rtype: None
") SetOrigin;
		void SetOrigin (const Standard_Real O);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param T:
	:type T: gp_Vec
	:rtype: None
") FirstPointAndTgt;
		void FirstPointAndTgt (gp_Pnt & P,gp_Vec & T);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param T:
	:type T: gp_Vec
	:rtype: None
") LastPointAndTgt;
		void LastPointAndTgt (gp_Pnt & P,gp_Vec & T);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param T:
	:type T: gp_Vec
	:rtype: None
") SetFirstPointAndTgt;
		void SetFirstPointAndTgt (const gp_Pnt & P,const gp_Vec & T);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param T:
	:type T: gp_Vec
	:rtype: None
") SetLastPointAndTgt;
		void SetLastPointAndTgt (const gp_Pnt & P,const gp_Vec & T);
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Curve &
	:rtype: None
") SetCurve;
		void SetCurve (const Handle_Geom_Curve & C);
		%feature("autodoc", "	:rtype: Handle_ChFiDS_SurfData
") Previous;
		const Handle_ChFiDS_SurfData & Previous ();
		%feature("autodoc", "	:rtype: Handle_ChFiDS_SurfData
") ChangePrevious;
		Handle_ChFiDS_SurfData & ChangePrevious ();
		%feature("autodoc", "	:rtype: Handle_ChFiDS_SurfData
") Next;
		const Handle_ChFiDS_SurfData & Next ();
		%feature("autodoc", "	:rtype: Handle_ChFiDS_SurfData
") ChangeNext;
		Handle_ChFiDS_SurfData & ChangeNext ();
		%feature("autodoc", "	:rtype: gp_Lin
") Line;
		gp_Lin Line ();
		%feature("autodoc", "	:rtype: gp_Circ
") Circle;
		gp_Circ Circle ();
		%feature("autodoc", "	:rtype: gp_Elips
") Ellipse;
		gp_Elips Ellipse ();
		%feature("autodoc", "	:rtype: gp_Hypr
") Hyperbola;
		gp_Hypr Hyperbola ();
		%feature("autodoc", "	:rtype: gp_Parab
") Parabola;
		gp_Parab Parabola ();
		%feature("autodoc", "	:rtype: Handle_Geom_BezierCurve
") Bezier;
		Handle_Geom_BezierCurve Bezier ();
		%feature("autodoc", "	:rtype: Handle_Geom_BSplineCurve
") BSpline;
		Handle_Geom_BSplineCurve BSpline ();
};


%feature("shadow") ChFiDS_ElSpine::~ChFiDS_ElSpine %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiDS_ElSpine {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ChFiDS_FaceInterference;
class ChFiDS_FaceInterference {
	public:
		%feature("autodoc", "	:rtype: None
") ChFiDS_FaceInterference;
		 ChFiDS_FaceInterference ();
		%feature("autodoc", "	:param LineIndex:
	:type LineIndex: Standard_Integer
	:param Trans:
	:type Trans: TopAbs_Orientation
	:param PCurv1:
	:type PCurv1: Handle_Geom2d_Curve &
	:param PCurv2:
	:type PCurv2: Handle_Geom2d_Curve &
	:rtype: None
") SetInterference;
		void SetInterference (const Standard_Integer LineIndex,const TopAbs_Orientation Trans,const Handle_Geom2d_Curve & PCurv1,const Handle_Geom2d_Curve & PCurv2);
		%feature("autodoc", "	:param Trans:
	:type Trans: TopAbs_Orientation
	:rtype: None
") SetTransition;
		void SetTransition (const TopAbs_Orientation Trans);
		%feature("autodoc", "	:param U1:
	:type U1: float
	:rtype: None
") SetFirstParameter;
		void SetFirstParameter (const Standard_Real U1);
		%feature("autodoc", "	:param U1:
	:type U1: float
	:rtype: None
") SetLastParameter;
		void SetLastParameter (const Standard_Real U1);
		%feature("autodoc", "	:param U1:
	:type U1: float
	:param IsFirst:
	:type IsFirst: bool
	:rtype: None
") SetParameter;
		void SetParameter (const Standard_Real U1,const Standard_Boolean IsFirst);
		%feature("autodoc", "	:rtype: int
") LineIndex;
		Standard_Integer LineIndex ();
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: None
") SetLineIndex;
		void SetLineIndex (const Standard_Integer I);
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") Transition;
		TopAbs_Orientation Transition ();
		%feature("autodoc", "	:rtype: Handle_Geom2d_Curve
") PCurveOnFace;
		const Handle_Geom2d_Curve & PCurveOnFace ();
		%feature("autodoc", "	:rtype: Handle_Geom2d_Curve
") PCurveOnSurf;
		const Handle_Geom2d_Curve & PCurveOnSurf ();
		%feature("autodoc", "	:rtype: Handle_Geom2d_Curve
") ChangePCurveOnFace;
		Handle_Geom2d_Curve & ChangePCurveOnFace ();
		%feature("autodoc", "	:rtype: Handle_Geom2d_Curve
") ChangePCurveOnSurf;
		Handle_Geom2d_Curve & ChangePCurveOnSurf ();
		%feature("autodoc", "	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "	:param IsFirst:
	:type IsFirst: bool
	:rtype: float
") Parameter;
		Standard_Real Parameter (const Standard_Boolean IsFirst);
};


%feature("shadow") ChFiDS_FaceInterference::~ChFiDS_FaceInterference %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiDS_FaceInterference {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ChFiDS_HData;
class ChFiDS_HData : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") ChFiDS_HData;
		 ChFiDS_HData ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_ChFiDS_SurfData &
	:rtype: None
") Append;
		void Append (const Handle_ChFiDS_SurfData & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_ChFiDS_HData &
	:rtype: None
") Append;
		void Append (const Handle_ChFiDS_HData & aSequence);
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_ChFiDS_SurfData &
	:rtype: None
") Prepend;
		void Prepend (const Handle_ChFiDS_SurfData & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_ChFiDS_HData &
	:rtype: None
") Prepend;
		void Prepend (const Handle_ChFiDS_HData & aSequence);
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_ChFiDS_SurfData &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_ChFiDS_SurfData & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_ChFiDS_HData &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_ChFiDS_HData & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_ChFiDS_SurfData &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_ChFiDS_SurfData & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_ChFiDS_HData &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_ChFiDS_HData & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anOtherIndex:
	:type anOtherIndex: Standard_Integer
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_ChFiDS_HData
") Split;
		Handle_ChFiDS_HData Split (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_ChFiDS_SurfData &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_ChFiDS_SurfData & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_ChFiDS_SurfData
") Value;
		const Handle_ChFiDS_SurfData & Value (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_ChFiDS_SurfData
") ChangeValue;
		Handle_ChFiDS_SurfData & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: Standard_Integer
	:param toIndex:
	:type toIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "	:rtype: ChFiDS_SequenceOfSurfData
") Sequence;
		const ChFiDS_SequenceOfSurfData & Sequence ();
		%feature("autodoc", "	:rtype: ChFiDS_SequenceOfSurfData
") ChangeSequence;
		ChFiDS_SequenceOfSurfData & ChangeSequence ();
		%feature("autodoc", "	:rtype: Handle_ChFiDS_HData
") ShallowCopy;
		Handle_ChFiDS_HData ShallowCopy ();
};


%feature("shadow") ChFiDS_HData::~ChFiDS_HData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiDS_HData {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ChFiDS_HData {
	Handle_ChFiDS_HData GetHandle() {
	return *(Handle_ChFiDS_HData*) &$self;
	}
};

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
    ChFiDS_HData* GetObject() {
    return (ChFiDS_HData*)$self->Access();
    }
};
%feature("shadow") Handle_ChFiDS_HData::~Handle_ChFiDS_HData %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ChFiDS_HData {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ChFiDS_HElSpine;
class ChFiDS_HElSpine : public Adaptor3d_HCurve {
	public:
		%feature("autodoc", "	:rtype: None
") ChFiDS_HElSpine;
		 ChFiDS_HElSpine ();
		%feature("autodoc", "	:param C:
	:type C: ChFiDS_ElSpine &
	:rtype: None
") ChFiDS_HElSpine;
		 ChFiDS_HElSpine (const ChFiDS_ElSpine & C);
		%feature("autodoc", "	:param C:
	:type C: ChFiDS_ElSpine &
	:rtype: None
") Set;
		void Set (const ChFiDS_ElSpine & C);
		%feature("autodoc", "	:rtype: Adaptor3d_Curve
") Curve;
		const Adaptor3d_Curve & Curve ();
		%feature("autodoc", "	:rtype: Adaptor3d_Curve
") GetCurve;
		Adaptor3d_Curve & GetCurve ();
		%feature("autodoc", "	:rtype: ChFiDS_ElSpine
") ChangeCurve;
		ChFiDS_ElSpine & ChangeCurve ();
};


%feature("shadow") ChFiDS_HElSpine::~ChFiDS_HElSpine %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiDS_HElSpine {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ChFiDS_HElSpine {
	Handle_ChFiDS_HElSpine GetHandle() {
	return *(Handle_ChFiDS_HElSpine*) &$self;
	}
};

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
    ChFiDS_HElSpine* GetObject() {
    return (ChFiDS_HElSpine*)$self->Access();
    }
};
%feature("shadow") Handle_ChFiDS_HElSpine::~Handle_ChFiDS_HElSpine %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ChFiDS_HElSpine {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe;
class ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param K1:
	:type K1: TopoDS_Vertex &
	:param K2:
	:type K2: Standard_Integer
	:param I:
	:type I: ChFiDS_ListOfStripe &
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe;
		 ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe (const TopoDS_Vertex & K1,const Standard_Integer K2,const ChFiDS_ListOfStripe & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
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
            		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("autodoc", "	:rtype: ChFiDS_ListOfStripe
") Value;
		ChFiDS_ListOfStripe & Value ();
};


%feature("shadow") ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe::~ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe {
	Handle_ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe GetHandle() {
	return *(Handle_ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe*) &$self;
	}
};

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
    ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe* GetObject() {
    return (ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe*)$self->Access();
    }
};
%feature("shadow") Handle_ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe::~Handle_ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ChFiDS_IndexedDataMapOfVertexListOfStripe;
class ChFiDS_IndexedDataMapOfVertexListOfStripe : public TCollection_BasicMap {
	public:
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") ChFiDS_IndexedDataMapOfVertexListOfStripe;
		 ChFiDS_IndexedDataMapOfVertexListOfStripe (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_IndexedDataMapOfVertexListOfStripe &
	:rtype: ChFiDS_IndexedDataMapOfVertexListOfStripe
") Assign;
		ChFiDS_IndexedDataMapOfVertexListOfStripe & Assign (const ChFiDS_IndexedDataMapOfVertexListOfStripe & Other);
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_IndexedDataMapOfVertexListOfStripe &
	:rtype: ChFiDS_IndexedDataMapOfVertexListOfStripe
") operator=;
		ChFiDS_IndexedDataMapOfVertexListOfStripe & operator = (const ChFiDS_IndexedDataMapOfVertexListOfStripe & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Vertex &
	:param I:
	:type I: ChFiDS_ListOfStripe &
	:rtype: int
") Add;
		Standard_Integer Add (const TopoDS_Vertex & K,const ChFiDS_ListOfStripe & I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:param K:
	:type K: TopoDS_Vertex &
	:param T:
	:type T: ChFiDS_ListOfStripe &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Vertex & K,const ChFiDS_ListOfStripe & T);
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Vertex &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TopoDS_Vertex & K);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopoDS_Vertex
") FindKey;
		const TopoDS_Vertex  FindKey (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: ChFiDS_ListOfStripe
") FindFromIndex;
		const ChFiDS_ListOfStripe & FindFromIndex (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: ChFiDS_ListOfStripe
") ChangeFromIndex;
		ChFiDS_ListOfStripe & ChangeFromIndex (const Standard_Integer I);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Vertex &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Vertex & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Vertex &
	:rtype: ChFiDS_ListOfStripe
") FindFromKey;
		const ChFiDS_ListOfStripe & FindFromKey (const TopoDS_Vertex & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Vertex &
	:rtype: ChFiDS_ListOfStripe
") ChangeFromKey;
		ChFiDS_ListOfStripe & ChangeFromKey (const TopoDS_Vertex & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Vertex &
	:rtype: Standard_Address
") FindFromKey1;
		Standard_Address FindFromKey1 (const TopoDS_Vertex & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Vertex &
	:rtype: Standard_Address
") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const TopoDS_Vertex & K);
};


%feature("shadow") ChFiDS_IndexedDataMapOfVertexListOfStripe::~ChFiDS_IndexedDataMapOfVertexListOfStripe %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiDS_IndexedDataMapOfVertexListOfStripe {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ChFiDS_ListIteratorOfListOfHElSpine;
class ChFiDS_ListIteratorOfListOfHElSpine {
	public:
		%feature("autodoc", "	:rtype: None
") ChFiDS_ListIteratorOfListOfHElSpine;
		 ChFiDS_ListIteratorOfListOfHElSpine ();
		%feature("autodoc", "	:param L:
	:type L: ChFiDS_ListOfHElSpine &
	:rtype: None
") ChFiDS_ListIteratorOfListOfHElSpine;
		 ChFiDS_ListIteratorOfListOfHElSpine (const ChFiDS_ListOfHElSpine & L);
		%feature("autodoc", "	:param L:
	:type L: ChFiDS_ListOfHElSpine &
	:rtype: None
") Initialize;
		void Initialize (const ChFiDS_ListOfHElSpine & L);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: Handle_ChFiDS_HElSpine
") Value;
		Handle_ChFiDS_HElSpine & Value ();
};


%feature("shadow") ChFiDS_ListIteratorOfListOfHElSpine::~ChFiDS_ListIteratorOfListOfHElSpine %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiDS_ListIteratorOfListOfHElSpine {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ChFiDS_ListIteratorOfListOfStripe;
class ChFiDS_ListIteratorOfListOfStripe {
	public:
		%feature("autodoc", "	:rtype: None
") ChFiDS_ListIteratorOfListOfStripe;
		 ChFiDS_ListIteratorOfListOfStripe ();
		%feature("autodoc", "	:param L:
	:type L: ChFiDS_ListOfStripe &
	:rtype: None
") ChFiDS_ListIteratorOfListOfStripe;
		 ChFiDS_ListIteratorOfListOfStripe (const ChFiDS_ListOfStripe & L);
		%feature("autodoc", "	:param L:
	:type L: ChFiDS_ListOfStripe &
	:rtype: None
") Initialize;
		void Initialize (const ChFiDS_ListOfStripe & L);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: Handle_ChFiDS_Stripe
") Value;
		Handle_ChFiDS_Stripe & Value ();
};


%feature("shadow") ChFiDS_ListIteratorOfListOfStripe::~ChFiDS_ListIteratorOfListOfStripe %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiDS_ListIteratorOfListOfStripe {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ChFiDS_ListIteratorOfRegularities;
class ChFiDS_ListIteratorOfRegularities {
	public:
		%feature("autodoc", "	:rtype: None
") ChFiDS_ListIteratorOfRegularities;
		 ChFiDS_ListIteratorOfRegularities ();
		%feature("autodoc", "	:param L:
	:type L: ChFiDS_Regularities &
	:rtype: None
") ChFiDS_ListIteratorOfRegularities;
		 ChFiDS_ListIteratorOfRegularities (const ChFiDS_Regularities & L);
		%feature("autodoc", "	:param L:
	:type L: ChFiDS_Regularities &
	:rtype: None
") Initialize;
		void Initialize (const ChFiDS_Regularities & L);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: ChFiDS_Regul
") Value;
		ChFiDS_Regul & Value ();
};


%feature("shadow") ChFiDS_ListIteratorOfRegularities::~ChFiDS_ListIteratorOfRegularities %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiDS_ListIteratorOfRegularities {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ChFiDS_ListNodeOfListOfHElSpine;
class ChFiDS_ListNodeOfListOfHElSpine : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Handle_ChFiDS_HElSpine &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") ChFiDS_ListNodeOfListOfHElSpine;
		 ChFiDS_ListNodeOfListOfHElSpine (const Handle_ChFiDS_HElSpine & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: Handle_ChFiDS_HElSpine
") Value;
		Handle_ChFiDS_HElSpine & Value ();
};


%feature("shadow") ChFiDS_ListNodeOfListOfHElSpine::~ChFiDS_ListNodeOfListOfHElSpine %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiDS_ListNodeOfListOfHElSpine {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ChFiDS_ListNodeOfListOfHElSpine {
	Handle_ChFiDS_ListNodeOfListOfHElSpine GetHandle() {
	return *(Handle_ChFiDS_ListNodeOfListOfHElSpine*) &$self;
	}
};

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
    ChFiDS_ListNodeOfListOfHElSpine* GetObject() {
    return (ChFiDS_ListNodeOfListOfHElSpine*)$self->Access();
    }
};
%feature("shadow") Handle_ChFiDS_ListNodeOfListOfHElSpine::~Handle_ChFiDS_ListNodeOfListOfHElSpine %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ChFiDS_ListNodeOfListOfHElSpine {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ChFiDS_ListNodeOfListOfStripe;
class ChFiDS_ListNodeOfListOfStripe : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Handle_ChFiDS_Stripe &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") ChFiDS_ListNodeOfListOfStripe;
		 ChFiDS_ListNodeOfListOfStripe (const Handle_ChFiDS_Stripe & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: Handle_ChFiDS_Stripe
") Value;
		Handle_ChFiDS_Stripe & Value ();
};


%feature("shadow") ChFiDS_ListNodeOfListOfStripe::~ChFiDS_ListNodeOfListOfStripe %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiDS_ListNodeOfListOfStripe {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ChFiDS_ListNodeOfListOfStripe {
	Handle_ChFiDS_ListNodeOfListOfStripe GetHandle() {
	return *(Handle_ChFiDS_ListNodeOfListOfStripe*) &$self;
	}
};

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
    ChFiDS_ListNodeOfListOfStripe* GetObject() {
    return (ChFiDS_ListNodeOfListOfStripe*)$self->Access();
    }
};
%feature("shadow") Handle_ChFiDS_ListNodeOfListOfStripe::~Handle_ChFiDS_ListNodeOfListOfStripe %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ChFiDS_ListNodeOfListOfStripe {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ChFiDS_ListNodeOfRegularities;
class ChFiDS_ListNodeOfRegularities : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: ChFiDS_Regul &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") ChFiDS_ListNodeOfRegularities;
		 ChFiDS_ListNodeOfRegularities (const ChFiDS_Regul & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: ChFiDS_Regul
") Value;
		ChFiDS_Regul & Value ();
};


%feature("shadow") ChFiDS_ListNodeOfRegularities::~ChFiDS_ListNodeOfRegularities %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiDS_ListNodeOfRegularities {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ChFiDS_ListNodeOfRegularities {
	Handle_ChFiDS_ListNodeOfRegularities GetHandle() {
	return *(Handle_ChFiDS_ListNodeOfRegularities*) &$self;
	}
};

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
    ChFiDS_ListNodeOfRegularities* GetObject() {
    return (ChFiDS_ListNodeOfRegularities*)$self->Access();
    }
};
%feature("shadow") Handle_ChFiDS_ListNodeOfRegularities::~Handle_ChFiDS_ListNodeOfRegularities %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ChFiDS_ListNodeOfRegularities {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ChFiDS_ListOfHElSpine;
class ChFiDS_ListOfHElSpine {
	public:
		%feature("autodoc", "	:rtype: None
") ChFiDS_ListOfHElSpine;
		 ChFiDS_ListOfHElSpine ();
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_ListOfHElSpine &
	:rtype: None
") Assign;
		void Assign (const ChFiDS_ListOfHElSpine & Other);
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_ListOfHElSpine &
	:rtype: None
") operator=;
		void operator = (const ChFiDS_ListOfHElSpine & Other);
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:param I:
	:type I: Handle_ChFiDS_HElSpine &
	:rtype: None
") Prepend;
		void Prepend (const Handle_ChFiDS_HElSpine & I);
		%feature("autodoc", "	:param I:
	:type I: Handle_ChFiDS_HElSpine &
	:param theIt:
	:type theIt: ChFiDS_ListIteratorOfListOfHElSpine &
	:rtype: None
") Prepend;
		void Prepend (const Handle_ChFiDS_HElSpine & I,ChFiDS_ListIteratorOfListOfHElSpine & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_ListOfHElSpine &
	:rtype: None
") Prepend;
		void Prepend (ChFiDS_ListOfHElSpine & Other);
		%feature("autodoc", "	:param I:
	:type I: Handle_ChFiDS_HElSpine &
	:rtype: None
") Append;
		void Append (const Handle_ChFiDS_HElSpine & I);
		%feature("autodoc", "	:param I:
	:type I: Handle_ChFiDS_HElSpine &
	:param theIt:
	:type theIt: ChFiDS_ListIteratorOfListOfHElSpine &
	:rtype: None
") Append;
		void Append (const Handle_ChFiDS_HElSpine & I,ChFiDS_ListIteratorOfListOfHElSpine & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_ListOfHElSpine &
	:rtype: None
") Append;
		void Append (ChFiDS_ListOfHElSpine & Other);
		%feature("autodoc", "	:rtype: Handle_ChFiDS_HElSpine
") First;
		Handle_ChFiDS_HElSpine & First ();
		%feature("autodoc", "	:rtype: Handle_ChFiDS_HElSpine
") Last;
		Handle_ChFiDS_HElSpine & Last ();
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "	:param It:
	:type It: ChFiDS_ListIteratorOfListOfHElSpine &
	:rtype: None
") Remove;
		void Remove (ChFiDS_ListIteratorOfListOfHElSpine & It);
		%feature("autodoc", "	:param I:
	:type I: Handle_ChFiDS_HElSpine &
	:param It:
	:type It: ChFiDS_ListIteratorOfListOfHElSpine &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Handle_ChFiDS_HElSpine & I,ChFiDS_ListIteratorOfListOfHElSpine & It);
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_ListOfHElSpine &
	:param It:
	:type It: ChFiDS_ListIteratorOfListOfHElSpine &
	:rtype: None
") InsertBefore;
		void InsertBefore (ChFiDS_ListOfHElSpine & Other,ChFiDS_ListIteratorOfListOfHElSpine & It);
		%feature("autodoc", "	:param I:
	:type I: Handle_ChFiDS_HElSpine &
	:param It:
	:type It: ChFiDS_ListIteratorOfListOfHElSpine &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Handle_ChFiDS_HElSpine & I,ChFiDS_ListIteratorOfListOfHElSpine & It);
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_ListOfHElSpine &
	:param It:
	:type It: ChFiDS_ListIteratorOfListOfHElSpine &
	:rtype: None
") InsertAfter;
		void InsertAfter (ChFiDS_ListOfHElSpine & Other,ChFiDS_ListIteratorOfListOfHElSpine & It);
};


%feature("shadow") ChFiDS_ListOfHElSpine::~ChFiDS_ListOfHElSpine %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiDS_ListOfHElSpine {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ChFiDS_ListOfStripe;
class ChFiDS_ListOfStripe {
	public:
		%feature("autodoc", "	:rtype: None
") ChFiDS_ListOfStripe;
		 ChFiDS_ListOfStripe ();
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_ListOfStripe &
	:rtype: None
") Assign;
		void Assign (const ChFiDS_ListOfStripe & Other);
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_ListOfStripe &
	:rtype: None
") operator=;
		void operator = (const ChFiDS_ListOfStripe & Other);
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:param I:
	:type I: Handle_ChFiDS_Stripe &
	:rtype: None
") Prepend;
		void Prepend (const Handle_ChFiDS_Stripe & I);
		%feature("autodoc", "	:param I:
	:type I: Handle_ChFiDS_Stripe &
	:param theIt:
	:type theIt: ChFiDS_ListIteratorOfListOfStripe &
	:rtype: None
") Prepend;
		void Prepend (const Handle_ChFiDS_Stripe & I,ChFiDS_ListIteratorOfListOfStripe & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_ListOfStripe &
	:rtype: None
") Prepend;
		void Prepend (ChFiDS_ListOfStripe & Other);
		%feature("autodoc", "	:param I:
	:type I: Handle_ChFiDS_Stripe &
	:rtype: None
") Append;
		void Append (const Handle_ChFiDS_Stripe & I);
		%feature("autodoc", "	:param I:
	:type I: Handle_ChFiDS_Stripe &
	:param theIt:
	:type theIt: ChFiDS_ListIteratorOfListOfStripe &
	:rtype: None
") Append;
		void Append (const Handle_ChFiDS_Stripe & I,ChFiDS_ListIteratorOfListOfStripe & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_ListOfStripe &
	:rtype: None
") Append;
		void Append (ChFiDS_ListOfStripe & Other);
		%feature("autodoc", "	:rtype: Handle_ChFiDS_Stripe
") First;
		Handle_ChFiDS_Stripe & First ();
		%feature("autodoc", "	:rtype: Handle_ChFiDS_Stripe
") Last;
		Handle_ChFiDS_Stripe & Last ();
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "	:param It:
	:type It: ChFiDS_ListIteratorOfListOfStripe &
	:rtype: None
") Remove;
		void Remove (ChFiDS_ListIteratorOfListOfStripe & It);
		%feature("autodoc", "	:param I:
	:type I: Handle_ChFiDS_Stripe &
	:param It:
	:type It: ChFiDS_ListIteratorOfListOfStripe &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Handle_ChFiDS_Stripe & I,ChFiDS_ListIteratorOfListOfStripe & It);
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_ListOfStripe &
	:param It:
	:type It: ChFiDS_ListIteratorOfListOfStripe &
	:rtype: None
") InsertBefore;
		void InsertBefore (ChFiDS_ListOfStripe & Other,ChFiDS_ListIteratorOfListOfStripe & It);
		%feature("autodoc", "	:param I:
	:type I: Handle_ChFiDS_Stripe &
	:param It:
	:type It: ChFiDS_ListIteratorOfListOfStripe &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Handle_ChFiDS_Stripe & I,ChFiDS_ListIteratorOfListOfStripe & It);
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_ListOfStripe &
	:param It:
	:type It: ChFiDS_ListIteratorOfListOfStripe &
	:rtype: None
") InsertAfter;
		void InsertAfter (ChFiDS_ListOfStripe & Other,ChFiDS_ListIteratorOfListOfStripe & It);
};


%feature("shadow") ChFiDS_ListOfStripe::~ChFiDS_ListOfStripe %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiDS_ListOfStripe {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ChFiDS_Map;
class ChFiDS_Map {
	public:
		%feature("autodoc", "	* Create an empty Map

	:rtype: None
") ChFiDS_Map;
		 ChFiDS_Map ();
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
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & S);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") FindFromKey;
		const TopTools_ListOfShape & FindFromKey (const TopoDS_Shape & S);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopTools_ListOfShape
") FindFromIndex;
		const TopTools_ListOfShape & FindFromIndex (const Standard_Integer I);
};


%feature("shadow") ChFiDS_Map::~ChFiDS_Map %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiDS_Map {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ChFiDS_Regul;
class ChFiDS_Regul {
	public:
		%feature("autodoc", "	:rtype: None
") ChFiDS_Regul;
		 ChFiDS_Regul ();
		%feature("autodoc", "	:param IC:
	:type IC: Standard_Integer
	:rtype: None
") SetCurve;
		void SetCurve (const Standard_Integer IC);
		%feature("autodoc", "	:param IS1:
	:type IS1: Standard_Integer
	:param IsFace: default value is Standard_True
	:type IsFace: bool
	:rtype: None
") SetS1;
		void SetS1 (const Standard_Integer IS1,const Standard_Boolean IsFace = Standard_True);
		%feature("autodoc", "	:param IS2:
	:type IS2: Standard_Integer
	:param IsFace: default value is Standard_True
	:type IsFace: bool
	:rtype: None
") SetS2;
		void SetS2 (const Standard_Integer IS2,const Standard_Boolean IsFace = Standard_True);
		%feature("autodoc", "	:rtype: bool
") IsSurface1;
		Standard_Boolean IsSurface1 ();
		%feature("autodoc", "	:rtype: bool
") IsSurface2;
		Standard_Boolean IsSurface2 ();
		%feature("autodoc", "	:rtype: int
") Curve;
		Standard_Integer Curve ();
		%feature("autodoc", "	:rtype: int
") S1;
		Standard_Integer S1 ();
		%feature("autodoc", "	:rtype: int
") S2;
		Standard_Integer S2 ();
};


%feature("shadow") ChFiDS_Regul::~ChFiDS_Regul %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiDS_Regul {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ChFiDS_Regularities;
class ChFiDS_Regularities {
	public:
		%feature("autodoc", "	:rtype: None
") ChFiDS_Regularities;
		 ChFiDS_Regularities ();
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_Regularities &
	:rtype: None
") Assign;
		void Assign (const ChFiDS_Regularities & Other);
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_Regularities &
	:rtype: None
") operator=;
		void operator = (const ChFiDS_Regularities & Other);
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:param I:
	:type I: ChFiDS_Regul &
	:rtype: None
") Prepend;
		void Prepend (const ChFiDS_Regul & I);
		%feature("autodoc", "	:param I:
	:type I: ChFiDS_Regul &
	:param theIt:
	:type theIt: ChFiDS_ListIteratorOfRegularities &
	:rtype: None
") Prepend;
		void Prepend (const ChFiDS_Regul & I,ChFiDS_ListIteratorOfRegularities & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_Regularities &
	:rtype: None
") Prepend;
		void Prepend (ChFiDS_Regularities & Other);
		%feature("autodoc", "	:param I:
	:type I: ChFiDS_Regul &
	:rtype: None
") Append;
		void Append (const ChFiDS_Regul & I);
		%feature("autodoc", "	:param I:
	:type I: ChFiDS_Regul &
	:param theIt:
	:type theIt: ChFiDS_ListIteratorOfRegularities &
	:rtype: None
") Append;
		void Append (const ChFiDS_Regul & I,ChFiDS_ListIteratorOfRegularities & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_Regularities &
	:rtype: None
") Append;
		void Append (ChFiDS_Regularities & Other);
		%feature("autodoc", "	:rtype: ChFiDS_Regul
") First;
		ChFiDS_Regul & First ();
		%feature("autodoc", "	:rtype: ChFiDS_Regul
") Last;
		ChFiDS_Regul & Last ();
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "	:param It:
	:type It: ChFiDS_ListIteratorOfRegularities &
	:rtype: None
") Remove;
		void Remove (ChFiDS_ListIteratorOfRegularities & It);
		%feature("autodoc", "	:param I:
	:type I: ChFiDS_Regul &
	:param It:
	:type It: ChFiDS_ListIteratorOfRegularities &
	:rtype: None
") InsertBefore;
		void InsertBefore (const ChFiDS_Regul & I,ChFiDS_ListIteratorOfRegularities & It);
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_Regularities &
	:param It:
	:type It: ChFiDS_ListIteratorOfRegularities &
	:rtype: None
") InsertBefore;
		void InsertBefore (ChFiDS_Regularities & Other,ChFiDS_ListIteratorOfRegularities & It);
		%feature("autodoc", "	:param I:
	:type I: ChFiDS_Regul &
	:param It:
	:type It: ChFiDS_ListIteratorOfRegularities &
	:rtype: None
") InsertAfter;
		void InsertAfter (const ChFiDS_Regul & I,ChFiDS_ListIteratorOfRegularities & It);
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_Regularities &
	:param It:
	:type It: ChFiDS_ListIteratorOfRegularities &
	:rtype: None
") InsertAfter;
		void InsertAfter (ChFiDS_Regularities & Other,ChFiDS_ListIteratorOfRegularities & It);
};


%feature("shadow") ChFiDS_Regularities::~ChFiDS_Regularities %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiDS_Regularities {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ChFiDS_SecArray1;
class ChFiDS_SecArray1 {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") ChFiDS_SecArray1;
		 ChFiDS_SecArray1 (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: ChFiDS_CircSection &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") ChFiDS_SecArray1;
		 ChFiDS_SecArray1 (const ChFiDS_CircSection & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: ChFiDS_CircSection &
	:rtype: None
") Init;
		void Init (const ChFiDS_CircSection & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_SecArray1 &
	:rtype: ChFiDS_SecArray1
") Assign;
		const ChFiDS_SecArray1 & Assign (const ChFiDS_SecArray1 & Other);
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_SecArray1 &
	:rtype: ChFiDS_SecArray1
") operator=;
		const ChFiDS_SecArray1 & operator = (const ChFiDS_SecArray1 & Other);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: ChFiDS_CircSection &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const ChFiDS_CircSection & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: ChFiDS_CircSection
") Value;
		const ChFiDS_CircSection & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: ChFiDS_CircSection
") ChangeValue;
		ChFiDS_CircSection & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") ChFiDS_SecArray1::~ChFiDS_SecArray1 %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiDS_SecArray1 {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ChFiDS_SecHArray1;
class ChFiDS_SecHArray1 : public MMgt_TShared {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") ChFiDS_SecHArray1;
		 ChFiDS_SecHArray1 (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:param V:
	:type V: ChFiDS_CircSection &
	:rtype: None
") ChFiDS_SecHArray1;
		 ChFiDS_SecHArray1 (const Standard_Integer Low,const Standard_Integer Up,const ChFiDS_CircSection & V);
		%feature("autodoc", "	:param V:
	:type V: ChFiDS_CircSection &
	:rtype: None
") Init;
		void Init (const ChFiDS_CircSection & V);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: ChFiDS_CircSection &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const ChFiDS_CircSection & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: ChFiDS_CircSection
") Value;
		const ChFiDS_CircSection & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: ChFiDS_CircSection
") ChangeValue;
		ChFiDS_CircSection & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: ChFiDS_SecArray1
") Array1;
		const ChFiDS_SecArray1 & Array1 ();
		%feature("autodoc", "	:rtype: ChFiDS_SecArray1
") ChangeArray1;
		ChFiDS_SecArray1 & ChangeArray1 ();
};


%feature("shadow") ChFiDS_SecHArray1::~ChFiDS_SecHArray1 %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiDS_SecHArray1 {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ChFiDS_SecHArray1 {
	Handle_ChFiDS_SecHArray1 GetHandle() {
	return *(Handle_ChFiDS_SecHArray1*) &$self;
	}
};

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
    ChFiDS_SecHArray1* GetObject() {
    return (ChFiDS_SecHArray1*)$self->Access();
    }
};
%feature("shadow") Handle_ChFiDS_SecHArray1::~Handle_ChFiDS_SecHArray1 %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ChFiDS_SecHArray1 {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ChFiDS_SequenceNodeOfSequenceOfSpine;
class ChFiDS_SequenceNodeOfSequenceOfSpine : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Handle_ChFiDS_Spine &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") ChFiDS_SequenceNodeOfSequenceOfSpine;
		 ChFiDS_SequenceNodeOfSequenceOfSpine (const Handle_ChFiDS_Spine & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Handle_ChFiDS_Spine
") Value;
		Handle_ChFiDS_Spine & Value ();
};


%feature("shadow") ChFiDS_SequenceNodeOfSequenceOfSpine::~ChFiDS_SequenceNodeOfSequenceOfSpine %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiDS_SequenceNodeOfSequenceOfSpine {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ChFiDS_SequenceNodeOfSequenceOfSpine {
	Handle_ChFiDS_SequenceNodeOfSequenceOfSpine GetHandle() {
	return *(Handle_ChFiDS_SequenceNodeOfSequenceOfSpine*) &$self;
	}
};

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
    ChFiDS_SequenceNodeOfSequenceOfSpine* GetObject() {
    return (ChFiDS_SequenceNodeOfSequenceOfSpine*)$self->Access();
    }
};
%feature("shadow") Handle_ChFiDS_SequenceNodeOfSequenceOfSpine::~Handle_ChFiDS_SequenceNodeOfSequenceOfSpine %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ChFiDS_SequenceNodeOfSequenceOfSpine {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ChFiDS_SequenceNodeOfSequenceOfSurfData;
class ChFiDS_SequenceNodeOfSequenceOfSurfData : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Handle_ChFiDS_SurfData &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") ChFiDS_SequenceNodeOfSequenceOfSurfData;
		 ChFiDS_SequenceNodeOfSequenceOfSurfData (const Handle_ChFiDS_SurfData & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Handle_ChFiDS_SurfData
") Value;
		Handle_ChFiDS_SurfData & Value ();
};


%feature("shadow") ChFiDS_SequenceNodeOfSequenceOfSurfData::~ChFiDS_SequenceNodeOfSequenceOfSurfData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiDS_SequenceNodeOfSequenceOfSurfData {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ChFiDS_SequenceNodeOfSequenceOfSurfData {
	Handle_ChFiDS_SequenceNodeOfSequenceOfSurfData GetHandle() {
	return *(Handle_ChFiDS_SequenceNodeOfSequenceOfSurfData*) &$self;
	}
};

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
    ChFiDS_SequenceNodeOfSequenceOfSurfData* GetObject() {
    return (ChFiDS_SequenceNodeOfSequenceOfSurfData*)$self->Access();
    }
};
%feature("shadow") Handle_ChFiDS_SequenceNodeOfSequenceOfSurfData::~Handle_ChFiDS_SequenceNodeOfSequenceOfSurfData %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ChFiDS_SequenceNodeOfSequenceOfSurfData {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ChFiDS_SequenceOfSpine;
class ChFiDS_SequenceOfSpine : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") ChFiDS_SequenceOfSpine;
		 ChFiDS_SequenceOfSpine ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_SequenceOfSpine &
	:rtype: ChFiDS_SequenceOfSpine
") Assign;
		const ChFiDS_SequenceOfSpine & Assign (const ChFiDS_SequenceOfSpine & Other);
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_SequenceOfSpine &
	:rtype: ChFiDS_SequenceOfSpine
") operator=;
		const ChFiDS_SequenceOfSpine & operator = (const ChFiDS_SequenceOfSpine & Other);
		%feature("autodoc", "	:param T:
	:type T: Handle_ChFiDS_Spine &
	:rtype: None
") Append;
		void Append (const Handle_ChFiDS_Spine & T);
		%feature("autodoc", "	:param S:
	:type S: ChFiDS_SequenceOfSpine &
	:rtype: None
") Append;
		void Append (ChFiDS_SequenceOfSpine & S);
		%feature("autodoc", "	:param T:
	:type T: Handle_ChFiDS_Spine &
	:rtype: None
") Prepend;
		void Prepend (const Handle_ChFiDS_Spine & T);
		%feature("autodoc", "	:param S:
	:type S: ChFiDS_SequenceOfSpine &
	:rtype: None
") Prepend;
		void Prepend (ChFiDS_SequenceOfSpine & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_ChFiDS_Spine &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_ChFiDS_Spine & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: ChFiDS_SequenceOfSpine &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,ChFiDS_SequenceOfSpine & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_ChFiDS_Spine &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_ChFiDS_Spine & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: ChFiDS_SequenceOfSpine &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,ChFiDS_SequenceOfSpine & S);
		%feature("autodoc", "	:rtype: Handle_ChFiDS_Spine
") First;
		const Handle_ChFiDS_Spine & First ();
		%feature("autodoc", "	:rtype: Handle_ChFiDS_Spine
") Last;
		const Handle_ChFiDS_Spine & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: ChFiDS_SequenceOfSpine &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,ChFiDS_SequenceOfSpine & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_ChFiDS_Spine
") Value;
		const Handle_ChFiDS_Spine & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Handle_ChFiDS_Spine &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_ChFiDS_Spine & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_ChFiDS_Spine
") ChangeValue;
		Handle_ChFiDS_Spine & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") ChFiDS_SequenceOfSpine::~ChFiDS_SequenceOfSpine %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiDS_SequenceOfSpine {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ChFiDS_SequenceOfSurfData;
class ChFiDS_SequenceOfSurfData : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") ChFiDS_SequenceOfSurfData;
		 ChFiDS_SequenceOfSurfData ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_SequenceOfSurfData &
	:rtype: ChFiDS_SequenceOfSurfData
") Assign;
		const ChFiDS_SequenceOfSurfData & Assign (const ChFiDS_SequenceOfSurfData & Other);
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_SequenceOfSurfData &
	:rtype: ChFiDS_SequenceOfSurfData
") operator=;
		const ChFiDS_SequenceOfSurfData & operator = (const ChFiDS_SequenceOfSurfData & Other);
		%feature("autodoc", "	:param T:
	:type T: Handle_ChFiDS_SurfData &
	:rtype: None
") Append;
		void Append (const Handle_ChFiDS_SurfData & T);
		%feature("autodoc", "	:param S:
	:type S: ChFiDS_SequenceOfSurfData &
	:rtype: None
") Append;
		void Append (ChFiDS_SequenceOfSurfData & S);
		%feature("autodoc", "	:param T:
	:type T: Handle_ChFiDS_SurfData &
	:rtype: None
") Prepend;
		void Prepend (const Handle_ChFiDS_SurfData & T);
		%feature("autodoc", "	:param S:
	:type S: ChFiDS_SequenceOfSurfData &
	:rtype: None
") Prepend;
		void Prepend (ChFiDS_SequenceOfSurfData & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_ChFiDS_SurfData &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_ChFiDS_SurfData & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: ChFiDS_SequenceOfSurfData &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,ChFiDS_SequenceOfSurfData & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_ChFiDS_SurfData &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_ChFiDS_SurfData & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: ChFiDS_SequenceOfSurfData &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,ChFiDS_SequenceOfSurfData & S);
		%feature("autodoc", "	:rtype: Handle_ChFiDS_SurfData
") First;
		const Handle_ChFiDS_SurfData & First ();
		%feature("autodoc", "	:rtype: Handle_ChFiDS_SurfData
") Last;
		const Handle_ChFiDS_SurfData & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: ChFiDS_SequenceOfSurfData &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,ChFiDS_SequenceOfSurfData & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_ChFiDS_SurfData
") Value;
		const Handle_ChFiDS_SurfData & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Handle_ChFiDS_SurfData &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_ChFiDS_SurfData & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_ChFiDS_SurfData
") ChangeValue;
		Handle_ChFiDS_SurfData & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") ChFiDS_SequenceOfSurfData::~ChFiDS_SequenceOfSurfData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiDS_SequenceOfSurfData {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ChFiDS_Spine;
class ChFiDS_Spine : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") ChFiDS_Spine;
		 ChFiDS_Spine ();
		%feature("autodoc", "	:param Tol:
	:type Tol: float
	:rtype: None
") ChFiDS_Spine;
		 ChFiDS_Spine (const Standard_Real Tol);
		%feature("autodoc", "	* store edges composing the guideline

	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") SetEdges;
		void SetEdges (const TopoDS_Edge & E);
		%feature("autodoc", "	* store the edge at the first position before all others

	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") PutInFirst;
		void PutInFirst (const TopoDS_Edge & E);
		%feature("autodoc", "	:rtype: int
") NbEdges;
		Standard_Integer NbEdges ();
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopoDS_Edge
") Edges;
		const TopoDS_Edge  Edges (const Standard_Integer I);
		%feature("autodoc", "	* stores if the start of a set of edges starts on a section of free border or forms a closed contour

	:param S:
	:type S: ChFiDS_State
	:rtype: None
") SetFirstStatus;
		void SetFirstStatus (const ChFiDS_State S);
		%feature("autodoc", "	* stores if the end of a set of edges starts on a section of free border or forms a closed contour

	:param S:
	:type S: ChFiDS_State
	:rtype: None
") SetLastStatus;
		void SetLastStatus (const ChFiDS_State S);
		%feature("autodoc", "	:param Els:
	:type Els: Handle_ChFiDS_HElSpine &
	:rtype: void
") AppendElSpine;
		virtual void AppendElSpine (const Handle_ChFiDS_HElSpine & Els);
		%feature("autodoc", "	:param IE:
	:type IE: Standard_Integer
	:rtype: Handle_ChFiDS_HElSpine
") ElSpine;
		Handle_ChFiDS_HElSpine ElSpine (const Standard_Integer IE);
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:rtype: Handle_ChFiDS_HElSpine
") ElSpine;
		Handle_ChFiDS_HElSpine ElSpine (const TopoDS_Edge & E);
		%feature("autodoc", "	:param W:
	:type W: float
	:rtype: Handle_ChFiDS_HElSpine
") ElSpine;
		Handle_ChFiDS_HElSpine ElSpine (const Standard_Real W);
		%feature("autodoc", "	:rtype: ChFiDS_ListOfHElSpine
") ChangeElSpines;
		ChFiDS_ListOfHElSpine & ChangeElSpines ();
		%feature("autodoc", "	:param AllData: default value is Standard_False
	:type AllData: bool
	:rtype: void
") Reset;
		virtual void Reset (const Standard_Boolean AllData = Standard_False);
		%feature("autodoc", "	:rtype: bool
") SplitDone;
		Standard_Boolean SplitDone ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") SplitDone;
		void SplitDone (const Standard_Boolean B);
		%feature("autodoc", "	* prepare the guideline depending on the edges that are elementary arks (take parameters from a single curvilinear abscissa); to be able to call methods on the geometry (first,last,value,d1,d2) it is necessary to start with preparation otherwise an exception will be raised

	:rtype: None
") Load;
		void Load ();
		%feature("autodoc", "	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);
		%feature("autodoc", "	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("autodoc", "	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "	:param Par:
	:type Par: float
	:rtype: None
") SetFirstParameter;
		void SetFirstParameter (const Standard_Real Par);
		%feature("autodoc", "	:param Par:
	:type Par: float
	:rtype: None
") SetLastParameter;
		void SetLastParameter (const Standard_Real Par);
		%feature("autodoc", "	* gives the total length of all arcs before the number IndexSp

	:param IndexSpine:
	:type IndexSpine: Standard_Integer
	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter (const Standard_Integer IndexSpine);
		%feature("autodoc", "	* gives the total length till the ark with number IndexSpine (inclus)

	:param IndexSpine:
	:type IndexSpine: Standard_Integer
	:rtype: float
") LastParameter;
		Standard_Real LastParameter (const Standard_Integer IndexSpine);
		%feature("autodoc", "	* gives the length of ark with number IndexSp

	:param IndexSpine:
	:type IndexSpine: Standard_Integer
	:rtype: float
") Length;
		Standard_Real Length (const Standard_Integer IndexSpine);
		%feature("autodoc", "	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("autodoc", "	:rtype: float
") Period;
		Standard_Real Period ();
		%feature("autodoc", "	:param U:
	:type U: float
	:rtype: float
") Absc;
		Standard_Real Absc (const Standard_Real U);
		%feature("autodoc", "	:param U:
	:type U: float
	:param I:
	:type I: Standard_Integer
	:rtype: float
") Absc;
		Standard_Real Absc (const Standard_Real U,const Standard_Integer I);
		%feature("autodoc", "	:param AbsC:
	:type AbsC: float
	:param U:
	:type U: float &
	:param Oriented: default value is Standard_True
	:type Oriented: bool
	:rtype: None
") Parameter;
		void Parameter (const Standard_Real AbsC,Standard_Real &OutValue,const Standard_Boolean Oriented = Standard_True);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param AbsC:
	:type AbsC: float
	:param U:
	:type U: float &
	:param Oriented: default value is Standard_True
	:type Oriented: bool
	:rtype: None
") Parameter;
		void Parameter (const Standard_Integer Index,const Standard_Real AbsC,Standard_Real &OutValue,const Standard_Boolean Oriented = Standard_True);
		%feature("autodoc", "	:param AbsC:
	:type AbsC: float
	:rtype: gp_Pnt
") Value;
		gp_Pnt Value (const Standard_Real AbsC);
		%feature("autodoc", "	:param AbsC:
	:type AbsC: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") D0;
		void D0 (const Standard_Real AbsC,gp_Pnt & P);
		%feature("autodoc", "	:param AbsC:
	:type AbsC: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: None
") D1;
		void D1 (const Standard_Real AbsC,gp_Pnt & P,gp_Vec & V1);
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
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") SetCurrent;
		void SetCurrent (const Standard_Integer Index);
		%feature("autodoc", "	* sets the current curve and returns it

	:param Index:
	:type Index: Standard_Integer
	:rtype: BRepAdaptor_Curve
") CurrentElementarySpine;
		const BRepAdaptor_Curve & CurrentElementarySpine (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: int
") CurrentIndexOfElementarySpine;
		Standard_Integer CurrentIndexOfElementarySpine ();
		%feature("autodoc", "	:rtype: GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType ();
		%feature("autodoc", "	:rtype: gp_Lin
") Line;
		gp_Lin Line ();
		%feature("autodoc", "	:rtype: gp_Circ
") Circle;
		gp_Circ Circle ();
		%feature("autodoc", "	* returns if the set of edges starts on a free boundary or if the first vertex is a breakpoint or if the set is closed

	:rtype: ChFiDS_State
") FirstStatus;
		ChFiDS_State FirstStatus ();
		%feature("autodoc", "	* returns the state at the end of the set

	:rtype: ChFiDS_State
") LastStatus;
		ChFiDS_State LastStatus ();
		%feature("autodoc", "	:param IsFirst:
	:type IsFirst: bool
	:rtype: ChFiDS_State
") Status;
		ChFiDS_State Status (const Standard_Boolean IsFirst);
		%feature("autodoc", "	:param S:
	:type S: ChFiDS_State
	:param IsFirst:
	:type IsFirst: bool
	:rtype: None
") SetStatus;
		void SetStatus (const ChFiDS_State S,const Standard_Boolean IsFirst);
		%feature("autodoc", "	* returns if the set of edges starts (or end) on Tangency point.

	:param IsFirst:
	:type IsFirst: bool
	:rtype: bool
") IsTangencyExtremity;
		Standard_Boolean IsTangencyExtremity (const Standard_Boolean IsFirst);
		%feature("autodoc", "	:param IsTangency:
	:type IsTangency: bool
	:param IsFirst:
	:type IsFirst: bool
	:rtype: None
") SetTangencyExtremity;
		void SetTangencyExtremity (const Standard_Boolean IsTangency,const Standard_Boolean IsFirst);
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Vertex &
	:rtype: float
") Absc;
		Standard_Real Absc (const TopoDS_Vertex & V);
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") FirstVertex;
		TopoDS_Vertex FirstVertex ();
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") LastVertex;
		TopoDS_Vertex LastVertex ();
		%feature("autodoc", "	:param W:
	:type W: float
	:rtype: None
") SetFirstTgt;
		void SetFirstTgt (const Standard_Real W);
		%feature("autodoc", "	:param W:
	:type W: float
	:rtype: None
") SetLastTgt;
		void SetLastTgt (const Standard_Real W);
		%feature("autodoc", "	:rtype: bool
") HasFirstTgt;
		Standard_Boolean HasFirstTgt ();
		%feature("autodoc", "	:rtype: bool
") HasLastTgt;
		Standard_Boolean HasLastTgt ();
		%feature("autodoc", "	* set a parameter reference for the approx.

	:param W:
	:type W: float
	:rtype: None
") SetReference;
		void SetReference (const Standard_Real W);
		%feature("autodoc", "	* set a parameter reference for the approx, at the middle of edge I.

	:param I:
	:type I: Standard_Integer
	:rtype: None
") SetReference;
		void SetReference (const Standard_Integer I);
		%feature("autodoc", "	:param W:
	:type W: float
	:param Forward: default value is Standard_True
	:type Forward: bool
	:rtype: int
") Index;
		Standard_Integer Index (const Standard_Real W,const Standard_Boolean Forward = Standard_True);
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:rtype: int
") Index;
		Standard_Integer Index (const TopoDS_Edge & E);
		%feature("autodoc", "	:rtype: None
") UnsetReference;
		void UnsetReference ();
		%feature("autodoc", "	:param state:
	:type state: ChFiDS_ErrorStatus
	:rtype: None
") SetErrorStatus;
		void SetErrorStatus (const ChFiDS_ErrorStatus state);
		%feature("autodoc", "	:rtype: ChFiDS_ErrorStatus
") ErrorStatus;
		ChFiDS_ErrorStatus ErrorStatus ();
};


%feature("shadow") ChFiDS_Spine::~ChFiDS_Spine %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiDS_Spine {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ChFiDS_Spine {
	Handle_ChFiDS_Spine GetHandle() {
	return *(Handle_ChFiDS_Spine*) &$self;
	}
};

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
    ChFiDS_Spine* GetObject() {
    return (ChFiDS_Spine*)$self->Access();
    }
};
%feature("shadow") Handle_ChFiDS_Spine::~Handle_ChFiDS_Spine %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ChFiDS_Spine {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ChFiDS_Stripe;
class ChFiDS_Stripe : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") ChFiDS_Stripe;
		 ChFiDS_Stripe ();
		%feature("autodoc", "	* Reset everything except Spine.

	:rtype: None
") Reset;
		void Reset ();
		%feature("autodoc", "	:rtype: Handle_ChFiDS_HData
") SetOfSurfData;
		const Handle_ChFiDS_HData & SetOfSurfData ();
		%feature("autodoc", "	:rtype: Handle_ChFiDS_Spine
") Spine;
		const Handle_ChFiDS_Spine & Spine ();
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") OrientationOnFace1;
		TopAbs_Orientation OrientationOnFace1 ();
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") OrientationOnFace2;
		TopAbs_Orientation OrientationOnFace2 ();
		%feature("autodoc", "	:rtype: int
") Choix;
		Standard_Integer Choix ();
		%feature("autodoc", "	:rtype: Handle_ChFiDS_HData
") ChangeSetOfSurfData;
		Handle_ChFiDS_HData & ChangeSetOfSurfData ();
		%feature("autodoc", "	:rtype: Handle_ChFiDS_Spine
") ChangeSpine;
		Handle_ChFiDS_Spine & ChangeSpine ();
		%feature("autodoc", "	:param Or1:
	:type Or1: TopAbs_Orientation
	:rtype: None
") OrientationOnFace1;
		void OrientationOnFace1 (const TopAbs_Orientation Or1);
		%feature("autodoc", "	:param Or2:
	:type Or2: TopAbs_Orientation
	:rtype: None
") OrientationOnFace2;
		void OrientationOnFace2 (const TopAbs_Orientation Or2);
		%feature("autodoc", "	:param C:
	:type C: Standard_Integer
	:rtype: None
") Choix;
		void Choix (const Standard_Integer C);
		%feature("autodoc", "	:param Pdeb:
	:type Pdeb: float &
	:param Pfin:
	:type Pfin: float &
	:rtype: None
") FirstParameters;
		void FirstParameters (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param Pdeb:
	:type Pdeb: float &
	:param Pfin:
	:type Pfin: float &
	:rtype: None
") LastParameters;
		void LastParameters (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param Pdeb:
	:type Pdeb: float
	:param Pfin:
	:type Pfin: float
	:rtype: None
") ChangeFirstParameters;
		void ChangeFirstParameters (const Standard_Real Pdeb,const Standard_Real Pfin);
		%feature("autodoc", "	:param Pdeb:
	:type Pdeb: float
	:param Pfin:
	:type Pfin: float
	:rtype: None
") ChangeLastParameters;
		void ChangeLastParameters (const Standard_Real Pdeb,const Standard_Real Pfin);
		%feature("autodoc", "	:rtype: int
") FirstCurve;
		Standard_Integer FirstCurve ();
		%feature("autodoc", "	:rtype: int
") LastCurve;
		Standard_Integer LastCurve ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") ChangeFirstCurve;
		void ChangeFirstCurve (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") ChangeLastCurve;
		void ChangeLastCurve (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: Handle_Geom2d_Curve
") FirstPCurve;
		const Handle_Geom2d_Curve & FirstPCurve ();
		%feature("autodoc", "	:rtype: Handle_Geom2d_Curve
") LastPCurve;
		const Handle_Geom2d_Curve & LastPCurve ();
		%feature("autodoc", "	:rtype: Handle_Geom2d_Curve
") ChangeFirstPCurve;
		Handle_Geom2d_Curve & ChangeFirstPCurve ();
		%feature("autodoc", "	:rtype: Handle_Geom2d_Curve
") ChangeLastPCurve;
		Handle_Geom2d_Curve & ChangeLastPCurve ();
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") FirstPCurveOrientation;
		TopAbs_Orientation FirstPCurveOrientation ();
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") LastPCurveOrientation;
		TopAbs_Orientation LastPCurveOrientation ();
		%feature("autodoc", "	:param O:
	:type O: TopAbs_Orientation
	:rtype: None
") FirstPCurveOrientation;
		void FirstPCurveOrientation (const TopAbs_Orientation O);
		%feature("autodoc", "	:param O:
	:type O: TopAbs_Orientation
	:rtype: None
") LastPCurveOrientation;
		void LastPCurveOrientation (const TopAbs_Orientation O);
		%feature("autodoc", "	:rtype: int
") IndexFirstPointOnS1;
		Standard_Integer IndexFirstPointOnS1 ();
		%feature("autodoc", "	:rtype: int
") IndexFirstPointOnS2;
		Standard_Integer IndexFirstPointOnS2 ();
		%feature("autodoc", "	:rtype: int
") IndexLastPointOnS1;
		Standard_Integer IndexLastPointOnS1 ();
		%feature("autodoc", "	:rtype: int
") IndexLastPointOnS2;
		Standard_Integer IndexLastPointOnS2 ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") ChangeIndexFirstPointOnS1;
		void ChangeIndexFirstPointOnS1 (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") ChangeIndexFirstPointOnS2;
		void ChangeIndexFirstPointOnS2 (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") ChangeIndexLastPointOnS1;
		void ChangeIndexLastPointOnS1 (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") ChangeIndexLastPointOnS2;
		void ChangeIndexLastPointOnS2 (const Standard_Integer Index);
		%feature("autodoc", "	:param First:
	:type First: bool
	:param Pdeb:
	:type Pdeb: float &
	:param Pfin:
	:type Pfin: float &
	:rtype: None
") Parameters;
		void Parameters (const Standard_Boolean First,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param First:
	:type First: bool
	:param Pdeb:
	:type Pdeb: float
	:param Pfin:
	:type Pfin: float
	:rtype: None
") SetParameters;
		void SetParameters (const Standard_Boolean First,const Standard_Real Pdeb,const Standard_Real Pfin);
		%feature("autodoc", "	:param First:
	:type First: bool
	:rtype: int
") Curve;
		Standard_Integer Curve (const Standard_Boolean First);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param First:
	:type First: bool
	:rtype: None
") SetCurve;
		void SetCurve (const Standard_Integer Index,const Standard_Boolean First);
		%feature("autodoc", "	:param First:
	:type First: bool
	:rtype: Handle_Geom2d_Curve
") PCurve;
		const Handle_Geom2d_Curve & PCurve (const Standard_Boolean First);
		%feature("autodoc", "	:param First:
	:type First: bool
	:rtype: Handle_Geom2d_Curve
") ChangePCurve;
		Handle_Geom2d_Curve & ChangePCurve (const Standard_Boolean First);
		%feature("autodoc", "	:param OnS:
	:type OnS: Standard_Integer
	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation (const Standard_Integer OnS);
		%feature("autodoc", "	:param Or:
	:type Or: TopAbs_Orientation
	:param OnS:
	:type OnS: Standard_Integer
	:rtype: None
") SetOrientation;
		void SetOrientation (const TopAbs_Orientation Or,const Standard_Integer OnS);
		%feature("autodoc", "	:param First:
	:type First: bool
	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation (const Standard_Boolean First);
		%feature("autodoc", "	:param Or:
	:type Or: TopAbs_Orientation
	:param First:
	:type First: bool
	:rtype: None
") SetOrientation;
		void SetOrientation (const TopAbs_Orientation Or,const Standard_Boolean First);
		%feature("autodoc", "	:param First:
	:type First: bool
	:param OnS:
	:type OnS: Standard_Integer
	:rtype: int
") IndexPoint;
		Standard_Integer IndexPoint (const Standard_Boolean First,const Standard_Integer OnS);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param First:
	:type First: bool
	:param OnS:
	:type OnS: Standard_Integer
	:rtype: None
") SetIndexPoint;
		void SetIndexPoint (const Standard_Integer Index,const Standard_Boolean First,const Standard_Integer OnS);
		%feature("autodoc", "	:rtype: int
") SolidIndex;
		Standard_Integer SolidIndex ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") SetSolidIndex;
		void SetSolidIndex (const Standard_Integer Index);
		%feature("autodoc", "	* Set nb of SurfData's at end put in DS

	:param First:
	:type First: bool
	:param Nb: default value is 1
	:type Nb: Standard_Integer
	:rtype: None
") InDS;
		void InDS (const Standard_Boolean First,const Standard_Integer Nb = 1);
		%feature("autodoc", "	* Returns nb of SurfData's at end being in DS

	:param First:
	:type First: bool
	:rtype: int
") IsInDS;
		Standard_Integer IsInDS (const Standard_Boolean First);
};


%feature("shadow") ChFiDS_Stripe::~ChFiDS_Stripe %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiDS_Stripe {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ChFiDS_Stripe {
	Handle_ChFiDS_Stripe GetHandle() {
	return *(Handle_ChFiDS_Stripe*) &$self;
	}
};

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
    ChFiDS_Stripe* GetObject() {
    return (ChFiDS_Stripe*)$self->Access();
    }
};
%feature("shadow") Handle_ChFiDS_Stripe::~Handle_ChFiDS_Stripe %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ChFiDS_Stripe {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ChFiDS_StripeArray1;
class ChFiDS_StripeArray1 {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") ChFiDS_StripeArray1;
		 ChFiDS_StripeArray1 (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: Handle_ChFiDS_Stripe &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") ChFiDS_StripeArray1;
		 ChFiDS_StripeArray1 (const Handle_ChFiDS_Stripe & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: Handle_ChFiDS_Stripe &
	:rtype: None
") Init;
		void Init (const Handle_ChFiDS_Stripe & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_StripeArray1 &
	:rtype: ChFiDS_StripeArray1
") Assign;
		const ChFiDS_StripeArray1 & Assign (const ChFiDS_StripeArray1 & Other);
		%feature("autodoc", "	:param Other:
	:type Other: ChFiDS_StripeArray1 &
	:rtype: ChFiDS_StripeArray1
") operator=;
		const ChFiDS_StripeArray1 & operator = (const ChFiDS_StripeArray1 & Other);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: Handle_ChFiDS_Stripe &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_ChFiDS_Stripe & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_ChFiDS_Stripe
") Value;
		const Handle_ChFiDS_Stripe & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_ChFiDS_Stripe
") ChangeValue;
		Handle_ChFiDS_Stripe & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") ChFiDS_StripeArray1::~ChFiDS_StripeArray1 %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiDS_StripeArray1 {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ChFiDS_StripeMap;
class ChFiDS_StripeMap {
	public:
		%feature("autodoc", "	:rtype: None
") ChFiDS_StripeMap;
		 ChFiDS_StripeMap ();
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Vertex &
	:param F:
	:type F: Handle_ChFiDS_Stripe &
	:rtype: None
") Add;
		void Add (const TopoDS_Vertex & V,const Handle_ChFiDS_Stripe & F);
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Vertex &
	:rtype: ChFiDS_ListOfStripe
") FindFromKey;
		const ChFiDS_ListOfStripe & FindFromKey (const TopoDS_Vertex & V);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: ChFiDS_ListOfStripe
") FindFromIndex;
		const ChFiDS_ListOfStripe & FindFromIndex (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopoDS_Vertex
") FindKey;
		const TopoDS_Vertex  FindKey (const Standard_Integer I);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
};


%feature("shadow") ChFiDS_StripeMap::~ChFiDS_StripeMap %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiDS_StripeMap {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ChFiDS_SurfData;
class ChFiDS_SurfData : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") ChFiDS_SurfData;
		 ChFiDS_SurfData ();
		%feature("autodoc", "	:param Other:
	:type Other: Handle_ChFiDS_SurfData &
	:rtype: None
") Copy;
		void Copy (const Handle_ChFiDS_SurfData & Other);
		%feature("autodoc", "	:rtype: int
") IndexOfS1;
		Standard_Integer IndexOfS1 ();
		%feature("autodoc", "	:rtype: int
") IndexOfS2;
		Standard_Integer IndexOfS2 ();
		%feature("autodoc", "	:rtype: bool
") IsOnCurve1;
		Standard_Boolean IsOnCurve1 ();
		%feature("autodoc", "	:rtype: bool
") IsOnCurve2;
		Standard_Boolean IsOnCurve2 ();
		%feature("autodoc", "	:rtype: int
") IndexOfC1;
		Standard_Integer IndexOfC1 ();
		%feature("autodoc", "	:rtype: int
") IndexOfC2;
		Standard_Integer IndexOfC2 ();
		%feature("autodoc", "	:rtype: int
") Surf;
		Standard_Integer Surf ();
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation ();
		%feature("autodoc", "	:rtype: ChFiDS_FaceInterference
") InterferenceOnS1;
		const ChFiDS_FaceInterference & InterferenceOnS1 ();
		%feature("autodoc", "	:rtype: ChFiDS_FaceInterference
") InterferenceOnS2;
		const ChFiDS_FaceInterference & InterferenceOnS2 ();
		%feature("autodoc", "	:rtype: ChFiDS_CommonPoint
") VertexFirstOnS1;
		const ChFiDS_CommonPoint & VertexFirstOnS1 ();
		%feature("autodoc", "	:rtype: ChFiDS_CommonPoint
") VertexFirstOnS2;
		const ChFiDS_CommonPoint & VertexFirstOnS2 ();
		%feature("autodoc", "	:rtype: ChFiDS_CommonPoint
") VertexLastOnS1;
		const ChFiDS_CommonPoint & VertexLastOnS1 ();
		%feature("autodoc", "	:rtype: ChFiDS_CommonPoint
") VertexLastOnS2;
		const ChFiDS_CommonPoint & VertexLastOnS2 ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") ChangeIndexOfS1;
		void ChangeIndexOfS1 (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") ChangeIndexOfS2;
		void ChangeIndexOfS2 (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") ChangeSurf;
		void ChangeSurf (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") SetIndexOfC1;
		void SetIndexOfC1 (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") SetIndexOfC2;
		void SetIndexOfC2 (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") ChangeOrientation;
		TopAbs_Orientation & ChangeOrientation ();
		%feature("autodoc", "	:rtype: ChFiDS_FaceInterference
") ChangeInterferenceOnS1;
		ChFiDS_FaceInterference & ChangeInterferenceOnS1 ();
		%feature("autodoc", "	:rtype: ChFiDS_FaceInterference
") ChangeInterferenceOnS2;
		ChFiDS_FaceInterference & ChangeInterferenceOnS2 ();
		%feature("autodoc", "	:rtype: ChFiDS_CommonPoint
") ChangeVertexFirstOnS1;
		ChFiDS_CommonPoint & ChangeVertexFirstOnS1 ();
		%feature("autodoc", "	:rtype: ChFiDS_CommonPoint
") ChangeVertexFirstOnS2;
		ChFiDS_CommonPoint & ChangeVertexFirstOnS2 ();
		%feature("autodoc", "	:rtype: ChFiDS_CommonPoint
") ChangeVertexLastOnS1;
		ChFiDS_CommonPoint & ChangeVertexLastOnS1 ();
		%feature("autodoc", "	:rtype: ChFiDS_CommonPoint
") ChangeVertexLastOnS2;
		ChFiDS_CommonPoint & ChangeVertexLastOnS2 ();
		%feature("autodoc", "	:param OnS:
	:type OnS: Standard_Integer
	:rtype: ChFiDS_FaceInterference
") Interference;
		const ChFiDS_FaceInterference & Interference (const Standard_Integer OnS);
		%feature("autodoc", "	:param OnS:
	:type OnS: Standard_Integer
	:rtype: ChFiDS_FaceInterference
") ChangeInterference;
		ChFiDS_FaceInterference & ChangeInterference (const Standard_Integer OnS);
		%feature("autodoc", "	:param OfS:
	:type OfS: Standard_Integer
	:rtype: int
") Index;
		Standard_Integer Index (const Standard_Integer OfS);
		%feature("autodoc", "	* returns one of the four vertices wether First is true or wrong and OnS equals 1 or 2.

	:param First:
	:type First: bool
	:param OnS:
	:type OnS: Standard_Integer
	:rtype: ChFiDS_CommonPoint
") Vertex;
		const ChFiDS_CommonPoint & Vertex (const Standard_Boolean First,const Standard_Integer OnS);
		%feature("autodoc", "	* returns one of the four vertices wether First is true or wrong and OnS equals 1 or 2.

	:param First:
	:type First: bool
	:param OnS:
	:type OnS: Standard_Integer
	:rtype: ChFiDS_CommonPoint
") ChangeVertex;
		ChFiDS_CommonPoint & ChangeVertex (const Standard_Boolean First,const Standard_Integer OnS);
		%feature("autodoc", "	:param OnS:
	:type OnS: Standard_Integer
	:rtype: bool
") IsOnCurve;
		Standard_Boolean IsOnCurve (const Standard_Integer OnS);
		%feature("autodoc", "	:param OnS:
	:type OnS: Standard_Integer
	:rtype: int
") IndexOfC;
		Standard_Integer IndexOfC (const Standard_Integer OnS);
		%feature("autodoc", "	:rtype: float
") FirstSpineParam;
		Standard_Real FirstSpineParam ();
		%feature("autodoc", "	:rtype: float
") LastSpineParam;
		Standard_Real LastSpineParam ();
		%feature("autodoc", "	:param Par:
	:type Par: float
	:rtype: None
") FirstSpineParam;
		void FirstSpineParam (const Standard_Real Par);
		%feature("autodoc", "	:param Par:
	:type Par: float
	:rtype: None
") LastSpineParam;
		void LastSpineParam (const Standard_Real Par);
		%feature("autodoc", "	:rtype: float
") FirstExtensionValue;
		Standard_Real FirstExtensionValue ();
		%feature("autodoc", "	:rtype: float
") LastExtensionValue;
		Standard_Real LastExtensionValue ();
		%feature("autodoc", "	:param Extend:
	:type Extend: float
	:rtype: None
") FirstExtensionValue;
		void FirstExtensionValue (const Standard_Real Extend);
		%feature("autodoc", "	:param Extend:
	:type Extend: float
	:rtype: None
") LastExtensionValue;
		void LastExtensionValue (const Standard_Real Extend);
		%feature("autodoc", "	:rtype: Handle_MMgt_TShared
") Simul;
		Handle_MMgt_TShared Simul ();
		%feature("autodoc", "	:param S:
	:type S: Handle_MMgt_TShared &
	:rtype: None
") SetSimul;
		void SetSimul (const Handle_MMgt_TShared & S);
		%feature("autodoc", "	:rtype: None
") ResetSimul;
		void ResetSimul ();
		%feature("autodoc", "	:param First:
	:type First: bool
	:param OnS:
	:type OnS: Standard_Integer
	:rtype: gp_Pnt2d
") Get2dPoints;
		gp_Pnt2d Get2dPoints (const Standard_Boolean First,const Standard_Integer OnS);
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
		%feature("autodoc", "	:rtype: bool
") TwistOnS1;
		Standard_Boolean TwistOnS1 ();
		%feature("autodoc", "	:rtype: bool
") TwistOnS2;
		Standard_Boolean TwistOnS2 ();
		%feature("autodoc", "	:param T:
	:type T: bool
	:rtype: None
") TwistOnS1;
		void TwistOnS1 (const Standard_Boolean T);
		%feature("autodoc", "	:param T:
	:type T: bool
	:rtype: None
") TwistOnS2;
		void TwistOnS2 (const Standard_Boolean T);
};


%feature("shadow") ChFiDS_SurfData::~ChFiDS_SurfData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiDS_SurfData {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ChFiDS_SurfData {
	Handle_ChFiDS_SurfData GetHandle() {
	return *(Handle_ChFiDS_SurfData*) &$self;
	}
};

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
    ChFiDS_SurfData* GetObject() {
    return (ChFiDS_SurfData*)$self->Access();
    }
};
%feature("shadow") Handle_ChFiDS_SurfData::~Handle_ChFiDS_SurfData %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ChFiDS_SurfData {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ChFiDS_ChamfSpine;
class ChFiDS_ChamfSpine : public ChFiDS_Spine {
	public:
		%feature("autodoc", "	:rtype: None
") ChFiDS_ChamfSpine;
		 ChFiDS_ChamfSpine ();
		%feature("autodoc", "	:param Tol:
	:type Tol: float
	:rtype: None
") ChFiDS_ChamfSpine;
		 ChFiDS_ChamfSpine (const Standard_Real Tol);
		%feature("autodoc", "	:param Dis:
	:type Dis: float
	:rtype: None
") SetDist;
		void SetDist (const Standard_Real Dis);
		%feature("autodoc", "	:param Dis:
	:type Dis: float &
	:rtype: None
") GetDist;
		void GetDist (Standard_Real &OutValue);
		%feature("autodoc", "	:param Dis1:
	:type Dis1: float
	:param Dis2:
	:type Dis2: float
	:rtype: None
") SetDists;
		void SetDists (const Standard_Real Dis1,const Standard_Real Dis2);
		%feature("autodoc", "	:param Dis1:
	:type Dis1: float &
	:param Dis2:
	:type Dis2: float &
	:rtype: None
") Dists;
		void Dists (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param Dis:
	:type Dis: float &
	:param Angle:
	:type Angle: float &
	:param DisOnF1:
	:type DisOnF1: bool
	:rtype: None
") GetDistAngle;
		void GetDistAngle (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Boolean & DisOnF1);
		%feature("autodoc", "	:param Dis:
	:type Dis: float
	:param Angle:
	:type Angle: float
	:param DisOnF1:
	:type DisOnF1: bool
	:rtype: None
") SetDistAngle;
		void SetDistAngle (const Standard_Real Dis,const Standard_Real Angle,const Standard_Boolean DisOnF1);
		%feature("autodoc", "	* Return the method of chamfers used

	:rtype: ChFiDS_ChamfMethod
") IsChamfer;
		ChFiDS_ChamfMethod IsChamfer ();
};


%feature("shadow") ChFiDS_ChamfSpine::~ChFiDS_ChamfSpine %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiDS_ChamfSpine {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ChFiDS_ChamfSpine {
	Handle_ChFiDS_ChamfSpine GetHandle() {
	return *(Handle_ChFiDS_ChamfSpine*) &$self;
	}
};

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
    ChFiDS_ChamfSpine* GetObject() {
    return (ChFiDS_ChamfSpine*)$self->Access();
    }
};
%feature("shadow") Handle_ChFiDS_ChamfSpine::~Handle_ChFiDS_ChamfSpine %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ChFiDS_ChamfSpine {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ChFiDS_FilSpine;
class ChFiDS_FilSpine : public ChFiDS_Spine {
	public:
		%feature("autodoc", "	:rtype: None
") ChFiDS_FilSpine;
		 ChFiDS_FilSpine ();
		%feature("autodoc", "	:param Tol:
	:type Tol: float
	:rtype: None
") ChFiDS_FilSpine;
		 ChFiDS_FilSpine (const Standard_Real Tol);
		%feature("autodoc", "	:param AllData: default value is Standard_False
	:type AllData: bool
	:rtype: void
") Reset;
		virtual void Reset (const Standard_Boolean AllData = Standard_False);
		%feature("autodoc", "	* initializes the constant vector on edge E.

	:param Radius:
	:type Radius: float
	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") SetRadius;
		void SetRadius (const Standard_Real Radius,const TopoDS_Edge & E);
		%feature("autodoc", "	* resets the constant vector on edge E.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") UnSetRadius;
		void UnSetRadius (const TopoDS_Edge & E);
		%feature("autodoc", "	* initializes the vector on Vertex V.

	:param Radius:
	:type Radius: float
	:param V:
	:type V: TopoDS_Vertex &
	:rtype: None
") SetRadius;
		void SetRadius (const Standard_Real Radius,const TopoDS_Vertex & V);
		%feature("autodoc", "	* resets the vector on Vertex V.

	:param V:
	:type V: TopoDS_Vertex &
	:rtype: None
") UnSetRadius;
		void UnSetRadius (const TopoDS_Vertex & V);
		%feature("autodoc", "	* initializes the vector on the point of parameter W.

	:param UandR:
	:type UandR: gp_XY
	:param IinC:
	:type IinC: Standard_Integer
	:rtype: None
") SetRadius;
		void SetRadius (const gp_XY & UandR,const Standard_Integer IinC);
		%feature("autodoc", "	* initializes the constant vector on all spine.

	:param Radius:
	:type Radius: float
	:rtype: None
") SetRadius;
		void SetRadius (const Standard_Real Radius);
		%feature("autodoc", "	* initializes the rule of evolution on all spine.

	:param C:
	:type C: Handle_Law_Function &
	:param IinC:
	:type IinC: Standard_Integer
	:rtype: None
") SetRadius;
		void SetRadius (const Handle_Law_Function & C,const Standard_Integer IinC);
		%feature("autodoc", "	* returns true if the radius is constant all along the spine.

	:rtype: bool
") IsConstant;
		Standard_Boolean IsConstant ();
		%feature("autodoc", "	* returns true if the radius is constant all along the edge E.

	:param IE:
	:type IE: Standard_Integer
	:rtype: bool
") IsConstant;
		Standard_Boolean IsConstant (const Standard_Integer IE);
		%feature("autodoc", "	* returns the radius if the fillet is constant all along the spine.

	:rtype: float
") Radius;
		Standard_Real Radius ();
		%feature("autodoc", "	* returns the radius if the fillet is constant all along the edge E.

	:param IE:
	:type IE: Standard_Integer
	:rtype: float
") Radius;
		Standard_Real Radius (const Standard_Integer IE);
		%feature("autodoc", "	* returns the radius if the fillet is constant all along the edge E.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: float
") Radius;
		Standard_Real Radius (const TopoDS_Edge & E);
		%feature("autodoc", "	:param Els:
	:type Els: Handle_ChFiDS_HElSpine &
	:rtype: void
") AppendElSpine;
		virtual void AppendElSpine (const Handle_ChFiDS_HElSpine & Els);
		%feature("autodoc", "	:param Els:
	:type Els: Handle_ChFiDS_HElSpine &
	:rtype: Handle_Law_Composite
") Law;
		Handle_Law_Composite Law (const Handle_ChFiDS_HElSpine & Els);
		%feature("autodoc", "	* returns the elementary law

	:param E:
	:type E: TopoDS_Edge &
	:rtype: Handle_Law_Function
") ChangeLaw;
		Handle_Law_Function & ChangeLaw (const TopoDS_Edge & E);
		%feature("autodoc", "	* returns the maximum radius if the fillet is non-constant

	:rtype: float
") MaxRadFromSeqAndLaws;
		Standard_Real MaxRadFromSeqAndLaws ();
};


%feature("shadow") ChFiDS_FilSpine::~ChFiDS_FilSpine %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ChFiDS_FilSpine {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ChFiDS_FilSpine {
	Handle_ChFiDS_FilSpine GetHandle() {
	return *(Handle_ChFiDS_FilSpine*) &$self;
	}
};

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
    ChFiDS_FilSpine* GetObject() {
    return (ChFiDS_FilSpine*)$self->Access();
    }
};
%feature("shadow") Handle_ChFiDS_FilSpine::~Handle_ChFiDS_FilSpine %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ChFiDS_FilSpine {
    void _kill_pointed() {
        delete $self;
    }
};

