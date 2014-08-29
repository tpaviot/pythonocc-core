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
%module ChFiDS

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

%include ChFiDS_required_python_modules.i
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ChFiDS_CircSection;
		 ChFiDS_CircSection ();
		%feature("autodoc", "Args:
	C(gp_Circ)
	F(Standard_Real)
	L(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const gp_Circ & C,const Standard_Real F,const Standard_Real L);
		%feature("autodoc", "Args:
	C(gp_Lin)
	F(Standard_Real)
	L(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const gp_Lin & C,const Standard_Real F,const Standard_Real L);
		%feature("autodoc", "Args:
	C(gp_Circ)
	F(Standard_Real)
	L(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Get;
		void Get (gp_Circ & C,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	C(gp_Lin)
	F(Standard_Real)
	L(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Get;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") ChFiDS_CommonPoint;
		 ChFiDS_CommonPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	None

default value for all fields") Reset;
		void Reset ();
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)

Returns:
	None

Sets the values of a point which is a vertex on  
         the initial facet of restriction of one  
         of the surface.") SetVertex;
		void SetVertex (const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	Tol(Standard_Real)
	A(TopoDS_Edge)
	Param(Standard_Real)
	TArc(TopAbs_Orientation)

Returns:
	None

Sets the values of a point which is on the arc  
         A, at parameter Param.") SetArc;
		void SetArc (const Standard_Real Tol,const TopoDS_Edge & A,const Standard_Real Param,const TopAbs_Orientation TArc);
		%feature("autodoc", "Args:
	Param(Standard_Real)

Returns:
	None

Sets the value of the parameter on the spine") SetParameter;
		void SetParameter (const Standard_Real Param);
		%feature("autodoc", "Args:
	Point(gp_Pnt)

Returns:
	None

Set the 3d point for a commonpoint that is not  
         a vertex or on an arc.") SetPoint;
		void SetPoint (const gp_Pnt & Point);
		%feature("autodoc", "Args:
	Vector(gp_Vec)

Returns:
	None

Set the output 3d  vector") SetVector;
		void SetVector (const gp_Vec & Vector);
		%feature("autodoc", "Args:
	Tol(Standard_Real)

Returns:
	None

This method set the fuzziness on the point.") SetTolerance;
		void SetTolerance (const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

This method returns the fuzziness on the point.") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE if the point is a vertex on the initial  
         restriction facet of the surface.") IsVertex;
		Standard_Boolean IsVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

Returns the information about the point when it is  
         on the domain of the first patch, i-e when the function  
         IsVertex returns True.  
         Otherwise, an exception is raised.") Vertex;
		const TopoDS_Vertex & Vertex ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE if the point is a on an edge of the initial  
         restriction facet of the surface.") IsOnArc;
		Standard_Boolean IsOnArc ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

Returns the arc of restriction containing the  
         vertex.") Arc;
		const TopoDS_Edge & Arc ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_Orientation

Returns the transition of the point on the arc  
         returned by Arc().") TransitionOnArc;
		TopAbs_Orientation TransitionOnArc ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the parameter of the point on the  
         arc returned by the method Arc().") ParameterOnArc;
		Standard_Real ParameterOnArc ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns  the parameter the  paramter on the  spine") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the 3d point") Point;
		const gp_Pnt & Point ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE if the output vector is  stored.") HasVector;
		Standard_Boolean HasVector ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

Returns the output  3d vector") Vector;
		const gp_Vec & Vector ();
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ChFiDS_ElSpine;
		 ChFiDS_ElSpine ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

No detailed docstring for this function.") FirstParameter;
		virtual Standard_Real FirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

No detailed docstring for this function.") LastParameter;
		virtual Standard_Real LastParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

No detailed docstring for this function.") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "Args:
	S(GeomAbs_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	None

No detailed docstring for this function.") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)
	Tol(Standard_Real)

Returns:
	virtual Handle_Adaptor3d_HCurve

Returns    a  curve equivalent   of  <self>  between  
         parameters <First>  and <Last>. <Tol>  is used  to  
         test for 3d points confusion.") Trim;
		virtual Handle_Adaptor3d_HCurve Trim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "Args:
	R3d(Standard_Real)

Returns:
	virtual Standard_Real

No detailed docstring for this function.") Resolution;
		virtual Standard_Real Resolution (const Standard_Real R3d);
		%feature("autodoc", "Args:
	None
Returns:
	virtual GeomAbs_CurveType

No detailed docstring for this function.") GetType;
		virtual GeomAbs_CurveType GetType ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsPeriodic;
		virtual Standard_Boolean IsPeriodic ();
		%feature("autodoc", "Args:
	I(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetPeriodic;
		void SetPeriodic (const Standard_Boolean I);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

No detailed docstring for this function.") Period;
		virtual Standard_Real Period ();
		%feature("autodoc", "Args:
	AbsC(Standard_Real)

Returns:
	virtual gp_Pnt

No detailed docstring for this function.") Value;
		virtual gp_Pnt Value (const Standard_Real AbsC);
		%feature("autodoc", "Args:
	AbsC(Standard_Real)
	P(gp_Pnt)

Returns:
	virtual void

No detailed docstring for this function.") D0;
		virtual void D0 (const Standard_Real AbsC,gp_Pnt & P);
		%feature("autodoc", "Args:
	AbsC(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)

Returns:
	virtual void

No detailed docstring for this function.") D1;
		virtual void D1 (const Standard_Real AbsC,gp_Pnt & P,gp_Vec & V1);
		%feature("autodoc", "Args:
	AbsC(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	virtual void

No detailed docstring for this function.") D2;
		virtual void D2 (const Standard_Real AbsC,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	AbsC(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	virtual void

No detailed docstring for this function.") D3;
		virtual void D3 (const Standard_Real AbsC,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	P(Standard_Real)

Returns:
	None

No detailed docstring for this function.") FirstParameter;
		void FirstParameter (const Standard_Real P);
		%feature("autodoc", "Args:
	P(Standard_Real)

Returns:
	None

No detailed docstring for this function.") LastParameter;
		void LastParameter (const Standard_Real P);
		%feature("autodoc", "Args:
	O(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetOrigin;
		void SetOrigin (const Standard_Real O);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	T(gp_Vec)

Returns:
	None

No detailed docstring for this function.") FirstPointAndTgt;
		void FirstPointAndTgt (gp_Pnt & P,gp_Vec & T);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	T(gp_Vec)

Returns:
	None

No detailed docstring for this function.") LastPointAndTgt;
		void LastPointAndTgt (gp_Pnt & P,gp_Vec & T);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	T(gp_Vec)

Returns:
	None

No detailed docstring for this function.") SetFirstPointAndTgt;
		void SetFirstPointAndTgt (const gp_Pnt & P,const gp_Vec & T);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	T(gp_Vec)

Returns:
	None

No detailed docstring for this function.") SetLastPointAndTgt;
		void SetLastPointAndTgt (const gp_Pnt & P,const gp_Vec & T);
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)

Returns:
	None

No detailed docstring for this function.") SetCurve;
		void SetCurve (const Handle_Geom_Curve & C);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ChFiDS_SurfData

No detailed docstring for this function.") Previous;
		const Handle_ChFiDS_SurfData & Previous ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ChFiDS_SurfData

No detailed docstring for this function.") ChangePrevious;
		Handle_ChFiDS_SurfData & ChangePrevious ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ChFiDS_SurfData

No detailed docstring for this function.") Next;
		const Handle_ChFiDS_SurfData & Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ChFiDS_SurfData

No detailed docstring for this function.") ChangeNext;
		Handle_ChFiDS_SurfData & ChangeNext ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Lin

No detailed docstring for this function.") Line;
		gp_Lin Line ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Circ

No detailed docstring for this function.") Circle;
		gp_Circ Circle ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Elips

No detailed docstring for this function.") Ellipse;
		gp_Elips Ellipse ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Hypr

No detailed docstring for this function.") Hyperbola;
		gp_Hypr Hyperbola ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Parab

No detailed docstring for this function.") Parabola;
		gp_Parab Parabola ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BezierCurve

No detailed docstring for this function.") Bezier;
		Handle_Geom_BezierCurve Bezier ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BSplineCurve

No detailed docstring for this function.") BSpline;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ChFiDS_FaceInterference;
		 ChFiDS_FaceInterference ();
		%feature("autodoc", "Args:
	LineIndex(Standard_Integer)
	Trans(TopAbs_Orientation)
	PCurv1(Handle_Geom2d_Curve)
	PCurv2(Handle_Geom2d_Curve)

Returns:
	None

No detailed docstring for this function.") SetInterference;
		void SetInterference (const Standard_Integer LineIndex,const TopAbs_Orientation Trans,const Handle_Geom2d_Curve & PCurv1,const Handle_Geom2d_Curve & PCurv2);
		%feature("autodoc", "Args:
	Trans(TopAbs_Orientation)

Returns:
	None

No detailed docstring for this function.") SetTransition;
		void SetTransition (const TopAbs_Orientation Trans);
		%feature("autodoc", "Args:
	U1(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetFirstParameter;
		void SetFirstParameter (const Standard_Real U1);
		%feature("autodoc", "Args:
	U1(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetLastParameter;
		void SetLastParameter (const Standard_Real U1);
		%feature("autodoc", "Args:
	U1(Standard_Real)
	IsFirst(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetParameter;
		void SetParameter (const Standard_Real U1,const Standard_Boolean IsFirst);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LineIndex;
		Standard_Integer LineIndex ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetLineIndex;
		void SetLineIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_Orientation

No detailed docstring for this function.") Transition;
		TopAbs_Orientation Transition ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") PCurveOnFace;
		const Handle_Geom2d_Curve & PCurveOnFace ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") PCurveOnSurf;
		const Handle_Geom2d_Curve & PCurveOnSurf ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") ChangePCurveOnFace;
		Handle_Geom2d_Curve & ChangePCurveOnFace ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") ChangePCurveOnSurf;
		Handle_Geom2d_Curve & ChangePCurveOnSurf ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "Args:
	IsFirst(Standard_Boolean)

Returns:
	Standard_Real

No detailed docstring for this function.") Parameter;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ChFiDS_HData;
		 ChFiDS_HData ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	anItem(Handle_ChFiDS_SurfData)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_ChFiDS_SurfData & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_ChFiDS_HData)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_ChFiDS_HData & aSequence);
		%feature("autodoc", "Args:
	anItem(Handle_ChFiDS_SurfData)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_ChFiDS_SurfData & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_ChFiDS_HData)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_ChFiDS_HData & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_ChFiDS_SurfData)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_ChFiDS_SurfData & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_ChFiDS_HData)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_ChFiDS_HData & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_ChFiDS_SurfData)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_ChFiDS_SurfData & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_ChFiDS_HData)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_ChFiDS_HData & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anOtherIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_ChFiDS_HData

No detailed docstring for this function.") Split;
		Handle_ChFiDS_HData Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_ChFiDS_SurfData)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_ChFiDS_SurfData & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_ChFiDS_SurfData

No detailed docstring for this function.") Value;
		const Handle_ChFiDS_SurfData & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_ChFiDS_SurfData

No detailed docstring for this function.") ChangeValue;
		Handle_ChFiDS_SurfData & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	fromIndex(Standard_Integer)
	toIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "Args:
	None
Returns:
	ChFiDS_SequenceOfSurfData

No detailed docstring for this function.") Sequence;
		const ChFiDS_SequenceOfSurfData & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	ChFiDS_SequenceOfSurfData

No detailed docstring for this function.") ChangeSequence;
		ChFiDS_SequenceOfSurfData & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ChFiDS_HData

No detailed docstring for this function.") ShallowCopy;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ChFiDS_HElSpine;
		 ChFiDS_HElSpine ();
		%feature("autodoc", "Args:
	C(ChFiDS_ElSpine)

Returns:
	None

No detailed docstring for this function.") ChFiDS_HElSpine;
		 ChFiDS_HElSpine (const ChFiDS_ElSpine & C);
		%feature("autodoc", "Args:
	C(ChFiDS_ElSpine)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const ChFiDS_ElSpine & C);
		%feature("autodoc", "Args:
	None
Returns:
	Adaptor3d_Curve

No detailed docstring for this function.") Curve;
		const Adaptor3d_Curve & Curve ();
		%feature("autodoc", "Args:
	None
Returns:
	Adaptor3d_Curve

No detailed docstring for this function.") GetCurve;
		Adaptor3d_Curve & GetCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	ChFiDS_ElSpine

No detailed docstring for this function.") ChangeCurve;
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
		%feature("autodoc", "Args:
	K1(TopoDS_Vertex)
	K2(Standard_Integer)
	I(ChFiDS_ListOfStripe)
	n1(TCollection_MapNodePtr)
	n2(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe;
		 ChFiDS_IndexedDataMapNodeOfIndexedDataMapOfVertexListOfStripe (const TopoDS_Vertex & K1,const Standard_Integer K2,const ChFiDS_ListOfStripe & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

No detailed docstring for this function.") Key1;
		TopoDS_Vertex & Key1 ();

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
            		%feature("autodoc", "Args:
	None
Returns:
	TCollection_MapNodePtr

No detailed docstring for this function.") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("autodoc", "Args:
	None
Returns:
	ChFiDS_ListOfStripe

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") ChFiDS_IndexedDataMapOfVertexListOfStripe;
		 ChFiDS_IndexedDataMapOfVertexListOfStripe (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(ChFiDS_IndexedDataMapOfVertexListOfStripe)

Returns:
	ChFiDS_IndexedDataMapOfVertexListOfStripe

No detailed docstring for this function.") Assign;
		ChFiDS_IndexedDataMapOfVertexListOfStripe & Assign (const ChFiDS_IndexedDataMapOfVertexListOfStripe & Other);
		%feature("autodoc", "Args:
	Other(ChFiDS_IndexedDataMapOfVertexListOfStripe)

Returns:
	ChFiDS_IndexedDataMapOfVertexListOfStripe

No detailed docstring for this function.") operator=;
		ChFiDS_IndexedDataMapOfVertexListOfStripe & operator = (const ChFiDS_IndexedDataMapOfVertexListOfStripe & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Vertex)
	I(ChFiDS_ListOfStripe)

Returns:
	Standard_Integer

No detailed docstring for this function.") Add;
		Standard_Integer Add (const TopoDS_Vertex & K,const ChFiDS_ListOfStripe & I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	K(TopoDS_Vertex)
	T(ChFiDS_ListOfStripe)

Returns:
	None

No detailed docstring for this function.") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Vertex & K,const ChFiDS_ListOfStripe & T);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "Args:
	K(TopoDS_Vertex)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const TopoDS_Vertex & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Vertex

No detailed docstring for this function.") FindKey;
		const TopoDS_Vertex & FindKey (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	ChFiDS_ListOfStripe

No detailed docstring for this function.") FindFromIndex;
		const ChFiDS_ListOfStripe & FindFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	ChFiDS_ListOfStripe

No detailed docstring for this function.") ChangeFromIndex;
		ChFiDS_ListOfStripe & ChangeFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	K(TopoDS_Vertex)

Returns:
	Standard_Integer

No detailed docstring for this function.") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Vertex & K);
		%feature("autodoc", "Args:
	K(TopoDS_Vertex)

Returns:
	ChFiDS_ListOfStripe

No detailed docstring for this function.") FindFromKey;
		const ChFiDS_ListOfStripe & FindFromKey (const TopoDS_Vertex & K);
		%feature("autodoc", "Args:
	K(TopoDS_Vertex)

Returns:
	ChFiDS_ListOfStripe

No detailed docstring for this function.") ChangeFromKey;
		ChFiDS_ListOfStripe & ChangeFromKey (const TopoDS_Vertex & K);
		%feature("autodoc", "Args:
	K(TopoDS_Vertex)

Returns:
	Standard_Address

No detailed docstring for this function.") FindFromKey1;
		Standard_Address FindFromKey1 (const TopoDS_Vertex & K);
		%feature("autodoc", "Args:
	K(TopoDS_Vertex)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFromKey1;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ChFiDS_ListIteratorOfListOfHElSpine;
		 ChFiDS_ListIteratorOfListOfHElSpine ();
		%feature("autodoc", "Args:
	L(ChFiDS_ListOfHElSpine)

Returns:
	None

No detailed docstring for this function.") ChFiDS_ListIteratorOfListOfHElSpine;
		 ChFiDS_ListIteratorOfListOfHElSpine (const ChFiDS_ListOfHElSpine & L);
		%feature("autodoc", "Args:
	L(ChFiDS_ListOfHElSpine)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const ChFiDS_ListOfHElSpine & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ChFiDS_HElSpine

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ChFiDS_ListIteratorOfListOfStripe;
		 ChFiDS_ListIteratorOfListOfStripe ();
		%feature("autodoc", "Args:
	L(ChFiDS_ListOfStripe)

Returns:
	None

No detailed docstring for this function.") ChFiDS_ListIteratorOfListOfStripe;
		 ChFiDS_ListIteratorOfListOfStripe (const ChFiDS_ListOfStripe & L);
		%feature("autodoc", "Args:
	L(ChFiDS_ListOfStripe)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const ChFiDS_ListOfStripe & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ChFiDS_Stripe

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ChFiDS_ListIteratorOfRegularities;
		 ChFiDS_ListIteratorOfRegularities ();
		%feature("autodoc", "Args:
	L(ChFiDS_Regularities)

Returns:
	None

No detailed docstring for this function.") ChFiDS_ListIteratorOfRegularities;
		 ChFiDS_ListIteratorOfRegularities (const ChFiDS_Regularities & L);
		%feature("autodoc", "Args:
	L(ChFiDS_Regularities)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const ChFiDS_Regularities & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	ChFiDS_Regul

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(Handle_ChFiDS_HElSpine)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") ChFiDS_ListNodeOfListOfHElSpine;
		 ChFiDS_ListNodeOfListOfHElSpine (const Handle_ChFiDS_HElSpine & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ChFiDS_HElSpine

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(Handle_ChFiDS_Stripe)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") ChFiDS_ListNodeOfListOfStripe;
		 ChFiDS_ListNodeOfListOfStripe (const Handle_ChFiDS_Stripe & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ChFiDS_Stripe

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(ChFiDS_Regul)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") ChFiDS_ListNodeOfRegularities;
		 ChFiDS_ListNodeOfRegularities (const ChFiDS_Regul & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	ChFiDS_Regul

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ChFiDS_ListOfHElSpine;
		 ChFiDS_ListOfHElSpine ();
		%feature("autodoc", "Args:
	Other(ChFiDS_ListOfHElSpine)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const ChFiDS_ListOfHElSpine & Other);
		%feature("autodoc", "Args:
	Other(ChFiDS_ListOfHElSpine)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const ChFiDS_ListOfHElSpine & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(Handle_ChFiDS_HElSpine)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_ChFiDS_HElSpine & I);
		%feature("autodoc", "Args:
	I(Handle_ChFiDS_HElSpine)
	theIt(ChFiDS_ListIteratorOfListOfHElSpine)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_ChFiDS_HElSpine & I,ChFiDS_ListIteratorOfListOfHElSpine & theIt);
		%feature("autodoc", "Args:
	Other(ChFiDS_ListOfHElSpine)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (ChFiDS_ListOfHElSpine & Other);
		%feature("autodoc", "Args:
	I(Handle_ChFiDS_HElSpine)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_ChFiDS_HElSpine & I);
		%feature("autodoc", "Args:
	I(Handle_ChFiDS_HElSpine)
	theIt(ChFiDS_ListIteratorOfListOfHElSpine)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_ChFiDS_HElSpine & I,ChFiDS_ListIteratorOfListOfHElSpine & theIt);
		%feature("autodoc", "Args:
	Other(ChFiDS_ListOfHElSpine)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (ChFiDS_ListOfHElSpine & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ChFiDS_HElSpine

No detailed docstring for this function.") First;
		Handle_ChFiDS_HElSpine & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ChFiDS_HElSpine

No detailed docstring for this function.") Last;
		Handle_ChFiDS_HElSpine & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(ChFiDS_ListIteratorOfListOfHElSpine)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (ChFiDS_ListIteratorOfListOfHElSpine & It);
		%feature("autodoc", "Args:
	I(Handle_ChFiDS_HElSpine)
	It(ChFiDS_ListIteratorOfListOfHElSpine)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Handle_ChFiDS_HElSpine & I,ChFiDS_ListIteratorOfListOfHElSpine & It);
		%feature("autodoc", "Args:
	Other(ChFiDS_ListOfHElSpine)
	It(ChFiDS_ListIteratorOfListOfHElSpine)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (ChFiDS_ListOfHElSpine & Other,ChFiDS_ListIteratorOfListOfHElSpine & It);
		%feature("autodoc", "Args:
	I(Handle_ChFiDS_HElSpine)
	It(ChFiDS_ListIteratorOfListOfHElSpine)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Handle_ChFiDS_HElSpine & I,ChFiDS_ListIteratorOfListOfHElSpine & It);
		%feature("autodoc", "Args:
	Other(ChFiDS_ListOfHElSpine)
	It(ChFiDS_ListIteratorOfListOfHElSpine)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ChFiDS_ListOfStripe;
		 ChFiDS_ListOfStripe ();
		%feature("autodoc", "Args:
	Other(ChFiDS_ListOfStripe)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const ChFiDS_ListOfStripe & Other);
		%feature("autodoc", "Args:
	Other(ChFiDS_ListOfStripe)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const ChFiDS_ListOfStripe & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(Handle_ChFiDS_Stripe)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_ChFiDS_Stripe & I);
		%feature("autodoc", "Args:
	I(Handle_ChFiDS_Stripe)
	theIt(ChFiDS_ListIteratorOfListOfStripe)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_ChFiDS_Stripe & I,ChFiDS_ListIteratorOfListOfStripe & theIt);
		%feature("autodoc", "Args:
	Other(ChFiDS_ListOfStripe)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (ChFiDS_ListOfStripe & Other);
		%feature("autodoc", "Args:
	I(Handle_ChFiDS_Stripe)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_ChFiDS_Stripe & I);
		%feature("autodoc", "Args:
	I(Handle_ChFiDS_Stripe)
	theIt(ChFiDS_ListIteratorOfListOfStripe)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_ChFiDS_Stripe & I,ChFiDS_ListIteratorOfListOfStripe & theIt);
		%feature("autodoc", "Args:
	Other(ChFiDS_ListOfStripe)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (ChFiDS_ListOfStripe & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ChFiDS_Stripe

No detailed docstring for this function.") First;
		Handle_ChFiDS_Stripe & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ChFiDS_Stripe

No detailed docstring for this function.") Last;
		Handle_ChFiDS_Stripe & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(ChFiDS_ListIteratorOfListOfStripe)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (ChFiDS_ListIteratorOfListOfStripe & It);
		%feature("autodoc", "Args:
	I(Handle_ChFiDS_Stripe)
	It(ChFiDS_ListIteratorOfListOfStripe)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Handle_ChFiDS_Stripe & I,ChFiDS_ListIteratorOfListOfStripe & It);
		%feature("autodoc", "Args:
	Other(ChFiDS_ListOfStripe)
	It(ChFiDS_ListIteratorOfListOfStripe)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (ChFiDS_ListOfStripe & Other,ChFiDS_ListIteratorOfListOfStripe & It);
		%feature("autodoc", "Args:
	I(Handle_ChFiDS_Stripe)
	It(ChFiDS_ListIteratorOfListOfStripe)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Handle_ChFiDS_Stripe & I,ChFiDS_ListIteratorOfListOfStripe & It);
		%feature("autodoc", "Args:
	Other(ChFiDS_ListOfStripe)
	It(ChFiDS_ListIteratorOfListOfStripe)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Create an empty Map") ChFiDS_Map;
		 ChFiDS_Map ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	T1(TopAbs_ShapeEnum)
	T2(TopAbs_ShapeEnum)

Returns:
	None

Fills the map with the subshapes of type T1 as keys  
         and the list of ancestors  of type T2 as items.") Fill;
		void Fill (const TopoDS_Shape & S,const TopAbs_ShapeEnum T1,const TopAbs_ShapeEnum T2);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") FindFromKey;
		const TopTools_ListOfShape & FindFromKey (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") FindFromIndex;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ChFiDS_Regul;
		 ChFiDS_Regul ();
		%feature("autodoc", "Args:
	IC(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetCurve;
		void SetCurve (const Standard_Integer IC);
		%feature("autodoc", "Args:
	IS1(Standard_Integer)
	IsFace(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") SetS1;
		void SetS1 (const Standard_Integer IS1,const Standard_Boolean IsFace = Standard_True);
		%feature("autodoc", "Args:
	IS2(Standard_Integer)
	IsFace(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") SetS2;
		void SetS2 (const Standard_Integer IS2,const Standard_Boolean IsFace = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsSurface1;
		Standard_Boolean IsSurface1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsSurface2;
		Standard_Boolean IsSurface2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Curve;
		Standard_Integer Curve ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") S1;
		Standard_Integer S1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") S2;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ChFiDS_Regularities;
		 ChFiDS_Regularities ();
		%feature("autodoc", "Args:
	Other(ChFiDS_Regularities)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const ChFiDS_Regularities & Other);
		%feature("autodoc", "Args:
	Other(ChFiDS_Regularities)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const ChFiDS_Regularities & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(ChFiDS_Regul)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const ChFiDS_Regul & I);
		%feature("autodoc", "Args:
	I(ChFiDS_Regul)
	theIt(ChFiDS_ListIteratorOfRegularities)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const ChFiDS_Regul & I,ChFiDS_ListIteratorOfRegularities & theIt);
		%feature("autodoc", "Args:
	Other(ChFiDS_Regularities)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (ChFiDS_Regularities & Other);
		%feature("autodoc", "Args:
	I(ChFiDS_Regul)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const ChFiDS_Regul & I);
		%feature("autodoc", "Args:
	I(ChFiDS_Regul)
	theIt(ChFiDS_ListIteratorOfRegularities)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const ChFiDS_Regul & I,ChFiDS_ListIteratorOfRegularities & theIt);
		%feature("autodoc", "Args:
	Other(ChFiDS_Regularities)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (ChFiDS_Regularities & Other);
		%feature("autodoc", "Args:
	None
Returns:
	ChFiDS_Regul

No detailed docstring for this function.") First;
		ChFiDS_Regul & First ();
		%feature("autodoc", "Args:
	None
Returns:
	ChFiDS_Regul

No detailed docstring for this function.") Last;
		ChFiDS_Regul & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(ChFiDS_ListIteratorOfRegularities)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (ChFiDS_ListIteratorOfRegularities & It);
		%feature("autodoc", "Args:
	I(ChFiDS_Regul)
	It(ChFiDS_ListIteratorOfRegularities)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const ChFiDS_Regul & I,ChFiDS_ListIteratorOfRegularities & It);
		%feature("autodoc", "Args:
	Other(ChFiDS_Regularities)
	It(ChFiDS_ListIteratorOfRegularities)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (ChFiDS_Regularities & Other,ChFiDS_ListIteratorOfRegularities & It);
		%feature("autodoc", "Args:
	I(ChFiDS_Regul)
	It(ChFiDS_ListIteratorOfRegularities)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const ChFiDS_Regul & I,ChFiDS_ListIteratorOfRegularities & It);
		%feature("autodoc", "Args:
	Other(ChFiDS_Regularities)
	It(ChFiDS_ListIteratorOfRegularities)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
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
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ChFiDS_SecArray1;
		 ChFiDS_SecArray1 (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(ChFiDS_CircSection)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ChFiDS_SecArray1;
		 ChFiDS_SecArray1 (const ChFiDS_CircSection & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(ChFiDS_CircSection)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const ChFiDS_CircSection & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(ChFiDS_SecArray1)

Returns:
	ChFiDS_SecArray1

No detailed docstring for this function.") Assign;
		const ChFiDS_SecArray1 & Assign (const ChFiDS_SecArray1 & Other);
		%feature("autodoc", "Args:
	Other(ChFiDS_SecArray1)

Returns:
	ChFiDS_SecArray1

No detailed docstring for this function.") operator=;
		const ChFiDS_SecArray1 & operator = (const ChFiDS_SecArray1 & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(ChFiDS_CircSection)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const ChFiDS_CircSection & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	ChFiDS_CircSection

No detailed docstring for this function.") Value;
		const ChFiDS_CircSection & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	ChFiDS_CircSection

No detailed docstring for this function.") ChangeValue;
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
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ChFiDS_SecHArray1;
		 ChFiDS_SecHArray1 (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(ChFiDS_CircSection)

Returns:
	None

No detailed docstring for this function.") ChFiDS_SecHArray1;
		 ChFiDS_SecHArray1 (const Standard_Integer Low,const Standard_Integer Up,const ChFiDS_CircSection & V);
		%feature("autodoc", "Args:
	V(ChFiDS_CircSection)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const ChFiDS_CircSection & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(ChFiDS_CircSection)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const ChFiDS_CircSection & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	ChFiDS_CircSection

No detailed docstring for this function.") Value;
		const ChFiDS_CircSection & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	ChFiDS_CircSection

No detailed docstring for this function.") ChangeValue;
		ChFiDS_CircSection & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	ChFiDS_SecArray1

No detailed docstring for this function.") Array1;
		const ChFiDS_SecArray1 & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	ChFiDS_SecArray1

No detailed docstring for this function.") ChangeArray1;
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
		%feature("autodoc", "Args:
	I(Handle_ChFiDS_Spine)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") ChFiDS_SequenceNodeOfSequenceOfSpine;
		 ChFiDS_SequenceNodeOfSequenceOfSpine (const Handle_ChFiDS_Spine & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ChFiDS_Spine

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(Handle_ChFiDS_SurfData)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") ChFiDS_SequenceNodeOfSequenceOfSurfData;
		 ChFiDS_SequenceNodeOfSequenceOfSurfData (const Handle_ChFiDS_SurfData & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ChFiDS_SurfData

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ChFiDS_SequenceOfSpine;
		 ChFiDS_SequenceOfSpine ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(ChFiDS_SequenceOfSpine)

Returns:
	ChFiDS_SequenceOfSpine

No detailed docstring for this function.") Assign;
		const ChFiDS_SequenceOfSpine & Assign (const ChFiDS_SequenceOfSpine & Other);
		%feature("autodoc", "Args:
	Other(ChFiDS_SequenceOfSpine)

Returns:
	ChFiDS_SequenceOfSpine

No detailed docstring for this function.") operator=;
		const ChFiDS_SequenceOfSpine & operator = (const ChFiDS_SequenceOfSpine & Other);
		%feature("autodoc", "Args:
	T(Handle_ChFiDS_Spine)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_ChFiDS_Spine & T);
		%feature("autodoc", "Args:
	S(ChFiDS_SequenceOfSpine)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (ChFiDS_SequenceOfSpine & S);
		%feature("autodoc", "Args:
	T(Handle_ChFiDS_Spine)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_ChFiDS_Spine & T);
		%feature("autodoc", "Args:
	S(ChFiDS_SequenceOfSpine)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (ChFiDS_SequenceOfSpine & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_ChFiDS_Spine)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_ChFiDS_Spine & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(ChFiDS_SequenceOfSpine)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,ChFiDS_SequenceOfSpine & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_ChFiDS_Spine)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_ChFiDS_Spine & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(ChFiDS_SequenceOfSpine)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,ChFiDS_SequenceOfSpine & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ChFiDS_Spine

No detailed docstring for this function.") First;
		const Handle_ChFiDS_Spine & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ChFiDS_Spine

No detailed docstring for this function.") Last;
		const Handle_ChFiDS_Spine & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(ChFiDS_SequenceOfSpine)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,ChFiDS_SequenceOfSpine & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_ChFiDS_Spine

No detailed docstring for this function.") Value;
		const Handle_ChFiDS_Spine & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_ChFiDS_Spine)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_ChFiDS_Spine & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_ChFiDS_Spine

No detailed docstring for this function.") ChangeValue;
		Handle_ChFiDS_Spine & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ChFiDS_SequenceOfSurfData;
		 ChFiDS_SequenceOfSurfData ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(ChFiDS_SequenceOfSurfData)

Returns:
	ChFiDS_SequenceOfSurfData

No detailed docstring for this function.") Assign;
		const ChFiDS_SequenceOfSurfData & Assign (const ChFiDS_SequenceOfSurfData & Other);
		%feature("autodoc", "Args:
	Other(ChFiDS_SequenceOfSurfData)

Returns:
	ChFiDS_SequenceOfSurfData

No detailed docstring for this function.") operator=;
		const ChFiDS_SequenceOfSurfData & operator = (const ChFiDS_SequenceOfSurfData & Other);
		%feature("autodoc", "Args:
	T(Handle_ChFiDS_SurfData)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_ChFiDS_SurfData & T);
		%feature("autodoc", "Args:
	S(ChFiDS_SequenceOfSurfData)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (ChFiDS_SequenceOfSurfData & S);
		%feature("autodoc", "Args:
	T(Handle_ChFiDS_SurfData)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_ChFiDS_SurfData & T);
		%feature("autodoc", "Args:
	S(ChFiDS_SequenceOfSurfData)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (ChFiDS_SequenceOfSurfData & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_ChFiDS_SurfData)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_ChFiDS_SurfData & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(ChFiDS_SequenceOfSurfData)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,ChFiDS_SequenceOfSurfData & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_ChFiDS_SurfData)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_ChFiDS_SurfData & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(ChFiDS_SequenceOfSurfData)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,ChFiDS_SequenceOfSurfData & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ChFiDS_SurfData

No detailed docstring for this function.") First;
		const Handle_ChFiDS_SurfData & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ChFiDS_SurfData

No detailed docstring for this function.") Last;
		const Handle_ChFiDS_SurfData & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(ChFiDS_SequenceOfSurfData)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,ChFiDS_SequenceOfSurfData & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_ChFiDS_SurfData

No detailed docstring for this function.") Value;
		const Handle_ChFiDS_SurfData & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_ChFiDS_SurfData)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_ChFiDS_SurfData & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_ChFiDS_SurfData

No detailed docstring for this function.") ChangeValue;
		Handle_ChFiDS_SurfData & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ChFiDS_Spine;
		 ChFiDS_Spine ();
		%feature("autodoc", "Args:
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") ChFiDS_Spine;
		 ChFiDS_Spine (const Standard_Real Tol);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	None

store edges composing the guideline") SetEdges;
		void SetEdges (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	None

store the edge at the first position before all others") PutInFirst;
		void PutInFirst (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbEdges;
		Standard_Integer NbEdges ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Edge

No detailed docstring for this function.") Edges;
		const TopoDS_Edge & Edges (const Standard_Integer I);
		%feature("autodoc", "Args:
	S(ChFiDS_State)

Returns:
	None

stores if the start of a set of edges starts on a  
section of free border or forms  a closed contour") SetFirstStatus;
		void SetFirstStatus (const ChFiDS_State S);
		%feature("autodoc", "Args:
	S(ChFiDS_State)

Returns:
	None

stores if the end of a set of edges starts on a  
section of free border or forms  a closed contour") SetLastStatus;
		void SetLastStatus (const ChFiDS_State S);
		%feature("autodoc", "Args:
	Els(Handle_ChFiDS_HElSpine)

Returns:
	virtual void

No detailed docstring for this function.") AppendElSpine;
		virtual void AppendElSpine (const Handle_ChFiDS_HElSpine & Els);
		%feature("autodoc", "Args:
	IE(Standard_Integer)

Returns:
	Handle_ChFiDS_HElSpine

No detailed docstring for this function.") ElSpine;
		Handle_ChFiDS_HElSpine ElSpine (const Standard_Integer IE);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	Handle_ChFiDS_HElSpine

No detailed docstring for this function.") ElSpine;
		Handle_ChFiDS_HElSpine ElSpine (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	W(Standard_Real)

Returns:
	Handle_ChFiDS_HElSpine

No detailed docstring for this function.") ElSpine;
		Handle_ChFiDS_HElSpine ElSpine (const Standard_Real W);
		%feature("autodoc", "Args:
	None
Returns:
	ChFiDS_ListOfHElSpine

No detailed docstring for this function.") ChangeElSpines;
		ChFiDS_ListOfHElSpine & ChangeElSpines ();
		%feature("autodoc", "Args:
	AllData(Standard_Boolean)=Standard_False

Returns:
	virtual void

No detailed docstring for this function.") Reset;
		virtual void Reset (const Standard_Boolean AllData = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") SplitDone;
		Standard_Boolean SplitDone ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SplitDone;
		void SplitDone (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	None

prepare the guideline depending on the edges that  
         are elementary arks (take parameters from  
         a single curvilinear abscissa); to be able to call  
         methods on the geometry (first,last,value,d1,d2)  
         it is necessary to start with preparation otherwise an  
         exception will be raised") Load;
		void Load ();
		%feature("autodoc", "Args:
	R3d(Standard_Real)

Returns:
	Standard_Real

No detailed docstring for this function.") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "Args:
	Par(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetFirstParameter;
		void SetFirstParameter (const Standard_Real Par);
		%feature("autodoc", "Args:
	Par(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetLastParameter;
		void SetLastParameter (const Standard_Real Par);
		%feature("autodoc", "Args:
	IndexSpine(Standard_Integer)

Returns:
	Standard_Real

gives the total length of all arcs before the  
         number IndexSp") FirstParameter;
		Standard_Real FirstParameter (const Standard_Integer IndexSpine);
		%feature("autodoc", "Args:
	IndexSpine(Standard_Integer)

Returns:
	Standard_Real

gives the total length till the ark with number  
         IndexSpine (inclus)") LastParameter;
		Standard_Real LastParameter (const Standard_Integer IndexSpine);
		%feature("autodoc", "Args:
	IndexSpine(Standard_Integer)

Returns:
	Standard_Real

gives the length of ark with number IndexSp") Length;
		Standard_Real Length (const Standard_Integer IndexSpine);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Period;
		Standard_Real Period ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

No detailed docstring for this function.") Absc;
		Standard_Real Absc (const Standard_Real U);
		%feature("autodoc", "Args:
	U(Standard_Real)
	I(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") Absc;
		Standard_Real Absc (const Standard_Real U,const Standard_Integer I);
		%feature("autodoc", "Args:
	AbsC(Standard_Real)
	U(Standard_Real)
	Oriented(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") Parameter;
		void Parameter (const Standard_Real AbsC,Standard_Real &OutValue,const Standard_Boolean Oriented = Standard_True);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	AbsC(Standard_Real)
	U(Standard_Real)
	Oriented(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") Parameter;
		void Parameter (const Standard_Integer Index,const Standard_Real AbsC,Standard_Real &OutValue,const Standard_Boolean Oriented = Standard_True);
		%feature("autodoc", "Args:
	AbsC(Standard_Real)

Returns:
	gp_Pnt

No detailed docstring for this function.") Value;
		gp_Pnt Value (const Standard_Real AbsC);
		%feature("autodoc", "Args:
	AbsC(Standard_Real)
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") D0;
		void D0 (const Standard_Real AbsC,gp_Pnt & P);
		%feature("autodoc", "Args:
	AbsC(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)

Returns:
	None

No detailed docstring for this function.") D1;
		void D1 (const Standard_Real AbsC,gp_Pnt & P,gp_Vec & V1);
		%feature("autodoc", "Args:
	AbsC(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	None

No detailed docstring for this function.") D2;
		void D2 (const Standard_Real AbsC,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetCurrent;
		void SetCurrent (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	BRepAdaptor_Curve

sets the current curve and returns it") CurrentElementarySpine;
		const BRepAdaptor_Curve & CurrentElementarySpine (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") CurrentIndexOfElementarySpine;
		Standard_Integer CurrentIndexOfElementarySpine ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_CurveType

No detailed docstring for this function.") GetType;
		GeomAbs_CurveType GetType ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Lin

No detailed docstring for this function.") Line;
		gp_Lin Line ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Circ

No detailed docstring for this function.") Circle;
		gp_Circ Circle ();
		%feature("autodoc", "Args:
	None
Returns:
	ChFiDS_State

returns if the set of edges starts on a free boundary  
         or if the first vertex is a breakpoint or if the set is  
         closed") FirstStatus;
		ChFiDS_State FirstStatus ();
		%feature("autodoc", "Args:
	None
Returns:
	ChFiDS_State

returns the state at the end of the set") LastStatus;
		ChFiDS_State LastStatus ();
		%feature("autodoc", "Args:
	IsFirst(Standard_Boolean)

Returns:
	ChFiDS_State

No detailed docstring for this function.") Status;
		ChFiDS_State Status (const Standard_Boolean IsFirst);
		%feature("autodoc", "Args:
	S(ChFiDS_State)
	IsFirst(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetStatus;
		void SetStatus (const ChFiDS_State S,const Standard_Boolean IsFirst);
		%feature("autodoc", "Args:
	IsFirst(Standard_Boolean)

Returns:
	Standard_Boolean

returns   if the  set  of  edges starts (or   end) on  
         Tangency point.") IsTangencyExtremity;
		Standard_Boolean IsTangencyExtremity (const Standard_Boolean IsFirst);
		%feature("autodoc", "Args:
	IsTangency(Standard_Boolean)
	IsFirst(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetTangencyExtremity;
		void SetTangencyExtremity (const Standard_Boolean IsTangency,const Standard_Boolean IsFirst);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)

Returns:
	Standard_Real

No detailed docstring for this function.") Absc;
		Standard_Real Absc (const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

No detailed docstring for this function.") FirstVertex;
		TopoDS_Vertex FirstVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

No detailed docstring for this function.") LastVertex;
		TopoDS_Vertex LastVertex ();
		%feature("autodoc", "Args:
	W(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetFirstTgt;
		void SetFirstTgt (const Standard_Real W);
		%feature("autodoc", "Args:
	W(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetLastTgt;
		void SetLastTgt (const Standard_Real W);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasFirstTgt;
		Standard_Boolean HasFirstTgt ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasLastTgt;
		Standard_Boolean HasLastTgt ();
		%feature("autodoc", "Args:
	W(Standard_Real)

Returns:
	None

set a parameter reference for the approx.") SetReference;
		void SetReference (const Standard_Real W);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

set  a  parameter  reference  for  the approx,  at the  
         middle  of edge I.") SetReference;
		void SetReference (const Standard_Integer I);
		%feature("autodoc", "Args:
	W(Standard_Real)
	Forward(Standard_Boolean)=Standard_True

Returns:
	Standard_Integer

No detailed docstring for this function.") Index;
		Standard_Integer Index (const Standard_Real W,const Standard_Boolean Forward = Standard_True);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	Standard_Integer

No detailed docstring for this function.") Index;
		Standard_Integer Index (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") UnsetReference;
		void UnsetReference ();
		%feature("autodoc", "Args:
	state(ChFiDS_ErrorStatus)

Returns:
	None

No detailed docstring for this function.") SetErrorStatus;
		void SetErrorStatus (const ChFiDS_ErrorStatus state);
		%feature("autodoc", "Args:
	None
Returns:
	ChFiDS_ErrorStatus

No detailed docstring for this function.") ErrorStatus;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ChFiDS_Stripe;
		 ChFiDS_Stripe ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Reset everything except Spine.") Reset;
		void Reset ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ChFiDS_HData

No detailed docstring for this function.") SetOfSurfData;
		const Handle_ChFiDS_HData & SetOfSurfData ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ChFiDS_Spine

No detailed docstring for this function.") Spine;
		const Handle_ChFiDS_Spine & Spine ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_Orientation

No detailed docstring for this function.") OrientationOnFace1;
		TopAbs_Orientation OrientationOnFace1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_Orientation

No detailed docstring for this function.") OrientationOnFace2;
		TopAbs_Orientation OrientationOnFace2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Choix;
		Standard_Integer Choix ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ChFiDS_HData

No detailed docstring for this function.") ChangeSetOfSurfData;
		Handle_ChFiDS_HData & ChangeSetOfSurfData ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ChFiDS_Spine

No detailed docstring for this function.") ChangeSpine;
		Handle_ChFiDS_Spine & ChangeSpine ();
		%feature("autodoc", "Args:
	Or1(TopAbs_Orientation)

Returns:
	None

No detailed docstring for this function.") OrientationOnFace1;
		void OrientationOnFace1 (const TopAbs_Orientation Or1);
		%feature("autodoc", "Args:
	Or2(TopAbs_Orientation)

Returns:
	None

No detailed docstring for this function.") OrientationOnFace2;
		void OrientationOnFace2 (const TopAbs_Orientation Or2);
		%feature("autodoc", "Args:
	C(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Choix;
		void Choix (const Standard_Integer C);
		%feature("autodoc", "Args:
	Pdeb(Standard_Real)
	Pfin(Standard_Real)

Returns:
	None

No detailed docstring for this function.") FirstParameters;
		void FirstParameters (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Pdeb(Standard_Real)
	Pfin(Standard_Real)

Returns:
	None

No detailed docstring for this function.") LastParameters;
		void LastParameters (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Pdeb(Standard_Real)
	Pfin(Standard_Real)

Returns:
	None

No detailed docstring for this function.") ChangeFirstParameters;
		void ChangeFirstParameters (const Standard_Real Pdeb,const Standard_Real Pfin);
		%feature("autodoc", "Args:
	Pdeb(Standard_Real)
	Pfin(Standard_Real)

Returns:
	None

No detailed docstring for this function.") ChangeLastParameters;
		void ChangeLastParameters (const Standard_Real Pdeb,const Standard_Real Pfin);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FirstCurve;
		Standard_Integer FirstCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LastCurve;
		Standard_Integer LastCurve ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ChangeFirstCurve;
		void ChangeFirstCurve (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ChangeLastCurve;
		void ChangeLastCurve (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") FirstPCurve;
		const Handle_Geom2d_Curve & FirstPCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") LastPCurve;
		const Handle_Geom2d_Curve & LastPCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") ChangeFirstPCurve;
		Handle_Geom2d_Curve & ChangeFirstPCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") ChangeLastPCurve;
		Handle_Geom2d_Curve & ChangeLastPCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_Orientation

No detailed docstring for this function.") FirstPCurveOrientation;
		TopAbs_Orientation FirstPCurveOrientation ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_Orientation

No detailed docstring for this function.") LastPCurveOrientation;
		TopAbs_Orientation LastPCurveOrientation ();
		%feature("autodoc", "Args:
	O(TopAbs_Orientation)

Returns:
	None

No detailed docstring for this function.") FirstPCurveOrientation;
		void FirstPCurveOrientation (const TopAbs_Orientation O);
		%feature("autodoc", "Args:
	O(TopAbs_Orientation)

Returns:
	None

No detailed docstring for this function.") LastPCurveOrientation;
		void LastPCurveOrientation (const TopAbs_Orientation O);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") IndexFirstPointOnS1;
		Standard_Integer IndexFirstPointOnS1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") IndexFirstPointOnS2;
		Standard_Integer IndexFirstPointOnS2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") IndexLastPointOnS1;
		Standard_Integer IndexLastPointOnS1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") IndexLastPointOnS2;
		Standard_Integer IndexLastPointOnS2 ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ChangeIndexFirstPointOnS1;
		void ChangeIndexFirstPointOnS1 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ChangeIndexFirstPointOnS2;
		void ChangeIndexFirstPointOnS2 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ChangeIndexLastPointOnS1;
		void ChangeIndexLastPointOnS1 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ChangeIndexLastPointOnS2;
		void ChangeIndexLastPointOnS2 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	First(Standard_Boolean)
	Pdeb(Standard_Real)
	Pfin(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Parameters;
		void Parameters (const Standard_Boolean First,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	First(Standard_Boolean)
	Pdeb(Standard_Real)
	Pfin(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetParameters;
		void SetParameters (const Standard_Boolean First,const Standard_Real Pdeb,const Standard_Real Pfin);
		%feature("autodoc", "Args:
	First(Standard_Boolean)

Returns:
	Standard_Integer

No detailed docstring for this function.") Curve;
		Standard_Integer Curve (const Standard_Boolean First);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	First(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetCurve;
		void SetCurve (const Standard_Integer Index,const Standard_Boolean First);
		%feature("autodoc", "Args:
	First(Standard_Boolean)

Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") PCurve;
		const Handle_Geom2d_Curve & PCurve (const Standard_Boolean First);
		%feature("autodoc", "Args:
	First(Standard_Boolean)

Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") ChangePCurve;
		Handle_Geom2d_Curve & ChangePCurve (const Standard_Boolean First);
		%feature("autodoc", "Args:
	OnS(Standard_Integer)

Returns:
	TopAbs_Orientation

No detailed docstring for this function.") Orientation;
		TopAbs_Orientation Orientation (const Standard_Integer OnS);
		%feature("autodoc", "Args:
	Or(TopAbs_Orientation)
	OnS(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetOrientation;
		void SetOrientation (const TopAbs_Orientation Or,const Standard_Integer OnS);
		%feature("autodoc", "Args:
	First(Standard_Boolean)

Returns:
	TopAbs_Orientation

No detailed docstring for this function.") Orientation;
		TopAbs_Orientation Orientation (const Standard_Boolean First);
		%feature("autodoc", "Args:
	Or(TopAbs_Orientation)
	First(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetOrientation;
		void SetOrientation (const TopAbs_Orientation Or,const Standard_Boolean First);
		%feature("autodoc", "Args:
	First(Standard_Boolean)
	OnS(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") IndexPoint;
		Standard_Integer IndexPoint (const Standard_Boolean First,const Standard_Integer OnS);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	First(Standard_Boolean)
	OnS(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetIndexPoint;
		void SetIndexPoint (const Standard_Integer Index,const Standard_Boolean First,const Standard_Integer OnS);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") SolidIndex;
		Standard_Integer SolidIndex ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetSolidIndex;
		void SetSolidIndex (const Standard_Integer Index);
		%feature("autodoc", "Args:
	First(Standard_Boolean)
	Nb(Standard_Integer)=1

Returns:
	None

Set nb of SurfData's at end put in DS") InDS;
		void InDS (const Standard_Boolean First,const Standard_Integer Nb = 1);
		%feature("autodoc", "Args:
	First(Standard_Boolean)

Returns:
	Standard_Integer

Returns nb of SurfData's at end being in DS") IsInDS;
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
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ChFiDS_StripeArray1;
		 ChFiDS_StripeArray1 (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Handle_ChFiDS_Stripe)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ChFiDS_StripeArray1;
		 ChFiDS_StripeArray1 (const Handle_ChFiDS_Stripe & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Handle_ChFiDS_Stripe)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_ChFiDS_Stripe & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(ChFiDS_StripeArray1)

Returns:
	ChFiDS_StripeArray1

No detailed docstring for this function.") Assign;
		const ChFiDS_StripeArray1 & Assign (const ChFiDS_StripeArray1 & Other);
		%feature("autodoc", "Args:
	Other(ChFiDS_StripeArray1)

Returns:
	ChFiDS_StripeArray1

No detailed docstring for this function.") operator=;
		const ChFiDS_StripeArray1 & operator = (const ChFiDS_StripeArray1 & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Handle_ChFiDS_Stripe)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_ChFiDS_Stripe & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_ChFiDS_Stripe

No detailed docstring for this function.") Value;
		const Handle_ChFiDS_Stripe & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_ChFiDS_Stripe

No detailed docstring for this function.") ChangeValue;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ChFiDS_StripeMap;
		 ChFiDS_StripeMap ();
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	F(Handle_ChFiDS_Stripe)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const TopoDS_Vertex & V,const Handle_ChFiDS_Stripe & F);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)

Returns:
	ChFiDS_ListOfStripe

No detailed docstring for this function.") FindFromKey;
		const ChFiDS_ListOfStripe & FindFromKey (const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	ChFiDS_ListOfStripe

No detailed docstring for this function.") FindFromIndex;
		const ChFiDS_ListOfStripe & FindFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Vertex

No detailed docstring for this function.") FindKey;
		const TopoDS_Vertex & FindKey (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ChFiDS_SurfData;
		 ChFiDS_SurfData ();
		%feature("autodoc", "Args:
	Other(Handle_ChFiDS_SurfData)

Returns:
	None

No detailed docstring for this function.") Copy;
		void Copy (const Handle_ChFiDS_SurfData & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") IndexOfS1;
		Standard_Integer IndexOfS1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") IndexOfS2;
		Standard_Integer IndexOfS2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOnCurve1;
		Standard_Boolean IsOnCurve1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOnCurve2;
		Standard_Boolean IsOnCurve2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") IndexOfC1;
		Standard_Integer IndexOfC1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") IndexOfC2;
		Standard_Integer IndexOfC2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Surf;
		Standard_Integer Surf ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_Orientation

No detailed docstring for this function.") Orientation;
		TopAbs_Orientation Orientation ();
		%feature("autodoc", "Args:
	None
Returns:
	ChFiDS_FaceInterference

No detailed docstring for this function.") InterferenceOnS1;
		const ChFiDS_FaceInterference & InterferenceOnS1 ();
		%feature("autodoc", "Args:
	None
Returns:
	ChFiDS_FaceInterference

No detailed docstring for this function.") InterferenceOnS2;
		const ChFiDS_FaceInterference & InterferenceOnS2 ();
		%feature("autodoc", "Args:
	None
Returns:
	ChFiDS_CommonPoint

No detailed docstring for this function.") VertexFirstOnS1;
		const ChFiDS_CommonPoint & VertexFirstOnS1 ();
		%feature("autodoc", "Args:
	None
Returns:
	ChFiDS_CommonPoint

No detailed docstring for this function.") VertexFirstOnS2;
		const ChFiDS_CommonPoint & VertexFirstOnS2 ();
		%feature("autodoc", "Args:
	None
Returns:
	ChFiDS_CommonPoint

No detailed docstring for this function.") VertexLastOnS1;
		const ChFiDS_CommonPoint & VertexLastOnS1 ();
		%feature("autodoc", "Args:
	None
Returns:
	ChFiDS_CommonPoint

No detailed docstring for this function.") VertexLastOnS2;
		const ChFiDS_CommonPoint & VertexLastOnS2 ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ChangeIndexOfS1;
		void ChangeIndexOfS1 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ChangeIndexOfS2;
		void ChangeIndexOfS2 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ChangeSurf;
		void ChangeSurf (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetIndexOfC1;
		void SetIndexOfC1 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetIndexOfC2;
		void SetIndexOfC2 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_Orientation

No detailed docstring for this function.") ChangeOrientation;
		TopAbs_Orientation & ChangeOrientation ();
		%feature("autodoc", "Args:
	None
Returns:
	ChFiDS_FaceInterference

No detailed docstring for this function.") ChangeInterferenceOnS1;
		ChFiDS_FaceInterference & ChangeInterferenceOnS1 ();
		%feature("autodoc", "Args:
	None
Returns:
	ChFiDS_FaceInterference

No detailed docstring for this function.") ChangeInterferenceOnS2;
		ChFiDS_FaceInterference & ChangeInterferenceOnS2 ();
		%feature("autodoc", "Args:
	None
Returns:
	ChFiDS_CommonPoint

No detailed docstring for this function.") ChangeVertexFirstOnS1;
		ChFiDS_CommonPoint & ChangeVertexFirstOnS1 ();
		%feature("autodoc", "Args:
	None
Returns:
	ChFiDS_CommonPoint

No detailed docstring for this function.") ChangeVertexFirstOnS2;
		ChFiDS_CommonPoint & ChangeVertexFirstOnS2 ();
		%feature("autodoc", "Args:
	None
Returns:
	ChFiDS_CommonPoint

No detailed docstring for this function.") ChangeVertexLastOnS1;
		ChFiDS_CommonPoint & ChangeVertexLastOnS1 ();
		%feature("autodoc", "Args:
	None
Returns:
	ChFiDS_CommonPoint

No detailed docstring for this function.") ChangeVertexLastOnS2;
		ChFiDS_CommonPoint & ChangeVertexLastOnS2 ();
		%feature("autodoc", "Args:
	OnS(Standard_Integer)

Returns:
	ChFiDS_FaceInterference

No detailed docstring for this function.") Interference;
		const ChFiDS_FaceInterference & Interference (const Standard_Integer OnS);
		%feature("autodoc", "Args:
	OnS(Standard_Integer)

Returns:
	ChFiDS_FaceInterference

No detailed docstring for this function.") ChangeInterference;
		ChFiDS_FaceInterference & ChangeInterference (const Standard_Integer OnS);
		%feature("autodoc", "Args:
	OfS(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") Index;
		Standard_Integer Index (const Standard_Integer OfS);
		%feature("autodoc", "Args:
	First(Standard_Boolean)
	OnS(Standard_Integer)

Returns:
	ChFiDS_CommonPoint

returns one of the four vertices  wether First is true  
         or wrong and OnS equals 1 or 2.") Vertex;
		const ChFiDS_CommonPoint & Vertex (const Standard_Boolean First,const Standard_Integer OnS);
		%feature("autodoc", "Args:
	First(Standard_Boolean)
	OnS(Standard_Integer)

Returns:
	ChFiDS_CommonPoint

returns one of the four vertices  wether First is true  
         or wrong and OnS equals 1 or 2.") ChangeVertex;
		ChFiDS_CommonPoint & ChangeVertex (const Standard_Boolean First,const Standard_Integer OnS);
		%feature("autodoc", "Args:
	OnS(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOnCurve;
		Standard_Boolean IsOnCurve (const Standard_Integer OnS);
		%feature("autodoc", "Args:
	OnS(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") IndexOfC;
		Standard_Integer IndexOfC (const Standard_Integer OnS);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") FirstSpineParam;
		Standard_Real FirstSpineParam ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") LastSpineParam;
		Standard_Real LastSpineParam ();
		%feature("autodoc", "Args:
	Par(Standard_Real)

Returns:
	None

No detailed docstring for this function.") FirstSpineParam;
		void FirstSpineParam (const Standard_Real Par);
		%feature("autodoc", "Args:
	Par(Standard_Real)

Returns:
	None

No detailed docstring for this function.") LastSpineParam;
		void LastSpineParam (const Standard_Real Par);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") FirstExtensionValue;
		Standard_Real FirstExtensionValue ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") LastExtensionValue;
		Standard_Real LastExtensionValue ();
		%feature("autodoc", "Args:
	Extend(Standard_Real)

Returns:
	None

No detailed docstring for this function.") FirstExtensionValue;
		void FirstExtensionValue (const Standard_Real Extend);
		%feature("autodoc", "Args:
	Extend(Standard_Real)

Returns:
	None

No detailed docstring for this function.") LastExtensionValue;
		void LastExtensionValue (const Standard_Real Extend);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MMgt_TShared

No detailed docstring for this function.") Simul;
		Handle_MMgt_TShared Simul ();
		%feature("autodoc", "Args:
	S(Handle_MMgt_TShared)

Returns:
	None

No detailed docstring for this function.") SetSimul;
		void SetSimul (const Handle_MMgt_TShared & S);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ResetSimul;
		void ResetSimul ();
		%feature("autodoc", "Args:
	First(Standard_Boolean)
	OnS(Standard_Integer)

Returns:
	gp_Pnt2d

No detailed docstring for this function.") Get2dPoints;
		gp_Pnt2d Get2dPoints (const Standard_Boolean First,const Standard_Integer OnS);
		%feature("autodoc", "Args:
	P2df1(gp_Pnt2d)
	P2dl1(gp_Pnt2d)
	P2df2(gp_Pnt2d)
	P2dl2(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Get2dPoints;
		void Get2dPoints (gp_Pnt2d & P2df1,gp_Pnt2d & P2dl1,gp_Pnt2d & P2df2,gp_Pnt2d & P2dl2);
		%feature("autodoc", "Args:
	P2df1(gp_Pnt2d)
	P2dl1(gp_Pnt2d)
	P2df2(gp_Pnt2d)
	P2dl2(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Set2dPoints;
		void Set2dPoints (const gp_Pnt2d & P2df1,const gp_Pnt2d & P2dl1,const gp_Pnt2d & P2df2,const gp_Pnt2d & P2dl2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") TwistOnS1;
		Standard_Boolean TwistOnS1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") TwistOnS2;
		Standard_Boolean TwistOnS2 ();
		%feature("autodoc", "Args:
	T(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") TwistOnS1;
		void TwistOnS1 (const Standard_Boolean T);
		%feature("autodoc", "Args:
	T(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") TwistOnS2;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ChFiDS_ChamfSpine;
		 ChFiDS_ChamfSpine ();
		%feature("autodoc", "Args:
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") ChFiDS_ChamfSpine;
		 ChFiDS_ChamfSpine (const Standard_Real Tol);
		%feature("autodoc", "Args:
	Dis(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetDist;
		void SetDist (const Standard_Real Dis);
		%feature("autodoc", "Args:
	Dis(Standard_Real)

Returns:
	None

No detailed docstring for this function.") GetDist;
		void GetDist (Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Dis1(Standard_Real)
	Dis2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetDists;
		void SetDists (const Standard_Real Dis1,const Standard_Real Dis2);
		%feature("autodoc", "Args:
	Dis1(Standard_Real)
	Dis2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Dists;
		void Dists (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Dis(Standard_Real)
	Angle(Standard_Real)
	DisOnF1(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") GetDistAngle;
		void GetDistAngle (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Boolean & DisOnF1);
		%feature("autodoc", "Args:
	Dis(Standard_Real)
	Angle(Standard_Real)
	DisOnF1(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetDistAngle;
		void SetDistAngle (const Standard_Real Dis,const Standard_Real Angle,const Standard_Boolean DisOnF1);
		%feature("autodoc", "Args:
	None
Returns:
	ChFiDS_ChamfMethod

Return the method of chamfers used") IsChamfer;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ChFiDS_FilSpine;
		 ChFiDS_FilSpine ();
		%feature("autodoc", "Args:
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") ChFiDS_FilSpine;
		 ChFiDS_FilSpine (const Standard_Real Tol);
		%feature("autodoc", "Args:
	AllData(Standard_Boolean)=Standard_False

Returns:
	virtual void

No detailed docstring for this function.") Reset;
		virtual void Reset (const Standard_Boolean AllData = Standard_False);
		%feature("autodoc", "Args:
	Radius(Standard_Real)
	E(TopoDS_Edge)

Returns:
	None

initializes the constant vector on edge E.") SetRadius;
		void SetRadius (const Standard_Real Radius,const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	None

resets the constant vector  on   edge E.") UnSetRadius;
		void UnSetRadius (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	Radius(Standard_Real)
	V(TopoDS_Vertex)

Returns:
	None

initializes the  vector on Vertex V.") SetRadius;
		void SetRadius (const Standard_Real Radius,const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)

Returns:
	None

resets the vector on Vertex V.") UnSetRadius;
		void UnSetRadius (const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	UandR(gp_XY)
	IinC(Standard_Integer)

Returns:
	None

initializes the vector on the point of parameter W.") SetRadius;
		void SetRadius (const gp_XY & UandR,const Standard_Integer IinC);
		%feature("autodoc", "Args:
	Radius(Standard_Real)

Returns:
	None

initializes the constant vector on all spine.") SetRadius;
		void SetRadius (const Standard_Real Radius);
		%feature("autodoc", "Args:
	C(Handle_Law_Function)
	IinC(Standard_Integer)

Returns:
	None

initializes the rule of evolution on all spine.") SetRadius;
		void SetRadius (const Handle_Law_Function & C,const Standard_Integer IinC);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns true if the radius is constant  
         all along the spine.") IsConstant;
		Standard_Boolean IsConstant ();
		%feature("autodoc", "Args:
	IE(Standard_Integer)

Returns:
	Standard_Boolean

returns true if the radius is constant  
         all along the edge E.") IsConstant;
		Standard_Boolean IsConstant (const Standard_Integer IE);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns the radius if the fillet is constant  
         all along the spine.") Radius;
		Standard_Real Radius ();
		%feature("autodoc", "Args:
	IE(Standard_Integer)

Returns:
	Standard_Real

returns the radius if the fillet is constant  
         all along the edge E.") Radius;
		Standard_Real Radius (const Standard_Integer IE);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	Standard_Real

returns the radius if the fillet is constant  
         all along the edge E.") Radius;
		Standard_Real Radius (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	Els(Handle_ChFiDS_HElSpine)

Returns:
	virtual void

No detailed docstring for this function.") AppendElSpine;
		virtual void AppendElSpine (const Handle_ChFiDS_HElSpine & Els);
		%feature("autodoc", "Args:
	Els(Handle_ChFiDS_HElSpine)

Returns:
	Handle_Law_Composite

No detailed docstring for this function.") Law;
		Handle_Law_Composite Law (const Handle_ChFiDS_HElSpine & Els);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	Handle_Law_Function

returns the elementary law") ChangeLaw;
		Handle_Law_Function & ChangeLaw (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns the maximum radius if the fillet is non-constant") MaxRadFromSeqAndLaws;
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

