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
%module (package="OCC") Approx

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

%include Approx_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum Approx_ParametrizationType {
	Approx_ChordLength = 0,
	Approx_Centripetal = 1,
	Approx_IsoParametric = 2,
};

enum Approx_Status {
	Approx_PointsAdded = 0,
	Approx_NoPointsAdded = 1,
	Approx_NoApproximation = 2,
};

/* end public enums declaration */

%nodefaultctor Approx_Array1OfAdHSurface;
class Approx_Array1OfAdHSurface {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Approx_Array1OfAdHSurface;
		 Approx_Array1OfAdHSurface (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Handle_Adaptor3d_HSurface)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Approx_Array1OfAdHSurface;
		 Approx_Array1OfAdHSurface (const Handle_Adaptor3d_HSurface & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Handle_Adaptor3d_HSurface)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Adaptor3d_HSurface & V);
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
	Other(Approx_Array1OfAdHSurface)

Returns:
	Approx_Array1OfAdHSurface

No detailed docstring for this function.") Assign;
		const Approx_Array1OfAdHSurface & Assign (const Approx_Array1OfAdHSurface & Other);
		%feature("autodoc", "Args:
	Other(Approx_Array1OfAdHSurface)

Returns:
	Approx_Array1OfAdHSurface

No detailed docstring for this function.") operator=;
		const Approx_Array1OfAdHSurface & operator = (const Approx_Array1OfAdHSurface & Other);
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
	Value(Handle_Adaptor3d_HSurface)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Adaptor3d_HSurface & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Adaptor3d_HSurface

No detailed docstring for this function.") Value;
		const Handle_Adaptor3d_HSurface & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Adaptor3d_HSurface

No detailed docstring for this function.") ChangeValue;
		Handle_Adaptor3d_HSurface & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") Approx_Array1OfAdHSurface::~Approx_Array1OfAdHSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Approx_Array1OfAdHSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Approx_Array1OfGTrsf2d;
class Approx_Array1OfGTrsf2d {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Approx_Array1OfGTrsf2d;
		 Approx_Array1OfGTrsf2d (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(gp_GTrsf2d)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Approx_Array1OfGTrsf2d;
		 Approx_Array1OfGTrsf2d (const gp_GTrsf2d & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(gp_GTrsf2d)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const gp_GTrsf2d & V);
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
	Other(Approx_Array1OfGTrsf2d)

Returns:
	Approx_Array1OfGTrsf2d

No detailed docstring for this function.") Assign;
		const Approx_Array1OfGTrsf2d & Assign (const Approx_Array1OfGTrsf2d & Other);
		%feature("autodoc", "Args:
	Other(Approx_Array1OfGTrsf2d)

Returns:
	Approx_Array1OfGTrsf2d

No detailed docstring for this function.") operator=;
		const Approx_Array1OfGTrsf2d & operator = (const Approx_Array1OfGTrsf2d & Other);
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
	Value(gp_GTrsf2d)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const gp_GTrsf2d & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_GTrsf2d

No detailed docstring for this function.") Value;
		const gp_GTrsf2d & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_GTrsf2d

No detailed docstring for this function.") ChangeValue;
		gp_GTrsf2d & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") Approx_Array1OfGTrsf2d::~Approx_Array1OfGTrsf2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Approx_Array1OfGTrsf2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Approx_Curve2d;
class Approx_Curve2d {
	public:
		%feature("autodoc", "Args:
	C2D(Handle_Adaptor2d_HCurve2d)
	First(Standard_Real)
	Last(Standard_Real)
	TolU(Standard_Real)
	TolV(Standard_Real)
	Continuity(GeomAbs_Shape)
	MaxDegree(Standard_Integer)
	MaxSegments(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Approx_Curve2d;
		 Approx_Curve2d (const Handle_Adaptor2d_HCurve2d & C2D,const Standard_Real First,const Standard_Real Last,const Standard_Real TolU,const Standard_Real TolV,const GeomAbs_Shape Continuity,const Standard_Integer MaxDegree,const Standard_Integer MaxSegments);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasResult;
		Standard_Boolean HasResult ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_BSplineCurve

No detailed docstring for this function.") Curve;
		Handle_Geom2d_BSplineCurve Curve ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") MaxError2dU;
		Standard_Real MaxError2dU ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") MaxError2dV;
		Standard_Real MaxError2dV ();
};


%feature("shadow") Approx_Curve2d::~Approx_Curve2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Approx_Curve2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Approx_Curve3d;
class Approx_Curve3d {
	public:
		%feature("autodoc", "Args:
	Curve(Handle_Adaptor3d_HCurve)
	Tol3d(Standard_Real)
	Order(GeomAbs_Shape)
	MaxSegments(Standard_Integer)
	MaxDegree(Standard_Integer)

Returns:
	None

Approximation  of  a  curve  with respect of the  
         requiered tolerance Tol3D.") Approx_Curve3d;
		 Approx_Curve3d (const Handle_Adaptor3d_HCurve & Curve,const Standard_Real Tol3d,const GeomAbs_Shape Order,const Standard_Integer MaxSegments,const Standard_Integer MaxDegree);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BSplineCurve

No detailed docstring for this function.") Curve;
		Handle_Geom_BSplineCurve Curve ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns  Standard_True  if  the  approximation  has  
been  done  within  requiered tolerance") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns  Standard_True if the approximation did come out  
with a result that  is not NECESSARELY within the required  
tolerance") HasResult;
		Standard_Boolean HasResult ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns  the  Maximum  Error  (>0 when an approximation  
 has  been  done, 0  if  no  approximation)") MaxError;
		Standard_Real MaxError ();
		%feature("autodoc", "Args:
	o(Standard_OStream)

Returns:
	None

Print on the stream  o  information about the object") Dump;
		void Dump (Standard_OStream & o);
};


%feature("shadow") Approx_Curve3d::~Approx_Curve3d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Approx_Curve3d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Approx_CurveOnSurface;
class Approx_CurveOnSurface {
	public:
		%feature("autodoc", "Args:
	C2D(Handle_Adaptor2d_HCurve2d)
	Surf(Handle_Adaptor3d_HSurface)
	First(Standard_Real)
	Last(Standard_Real)
	Tol(Standard_Real)
	Continuity(GeomAbs_Shape)
	MaxDegree(Standard_Integer)
	MaxSegments(Standard_Integer)
	Only3d(Standard_Boolean)=Standard_False
	Only2d(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") Approx_CurveOnSurface;
		 Approx_CurveOnSurface (const Handle_Adaptor2d_HCurve2d & C2D,const Handle_Adaptor3d_HSurface & Surf,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol,const GeomAbs_Shape Continuity,const Standard_Integer MaxDegree,const Standard_Integer MaxSegments,const Standard_Boolean Only3d = Standard_False,const Standard_Boolean Only2d = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasResult;
		Standard_Boolean HasResult ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BSplineCurve

No detailed docstring for this function.") Curve3d;
		Handle_Geom_BSplineCurve Curve3d ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") MaxError3d;
		Standard_Real MaxError3d ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_BSplineCurve

No detailed docstring for this function.") Curve2d;
		Handle_Geom2d_BSplineCurve Curve2d ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") MaxError2dU;
		Standard_Real MaxError2dU ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns the maximum errors relativly to the  U component or the V component of the  
                2d Curve") MaxError2dV;
		Standard_Real MaxError2dV ();
};


%feature("shadow") Approx_CurveOnSurface::~Approx_CurveOnSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Approx_CurveOnSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Approx_CurvilinearParameter;
class Approx_CurvilinearParameter {
	public:
		%feature("autodoc", "Args:
	C3D(Handle_Adaptor3d_HCurve)
	Tol(Standard_Real)
	Order(GeomAbs_Shape)
	MaxDegree(Standard_Integer)
	MaxSegments(Standard_Integer)

Returns:
	None

case of a free 3D curve") Approx_CurvilinearParameter;
		 Approx_CurvilinearParameter (const Handle_Adaptor3d_HCurve & C3D,const Standard_Real Tol,const GeomAbs_Shape Order,const Standard_Integer MaxDegree,const Standard_Integer MaxSegments);
		%feature("autodoc", "Args:
	C2D(Handle_Adaptor2d_HCurve2d)
	Surf(Handle_Adaptor3d_HSurface)
	Tol(Standard_Real)
	Order(GeomAbs_Shape)
	MaxDegree(Standard_Integer)
	MaxSegments(Standard_Integer)

Returns:
	None

case of a curve on one surface") Approx_CurvilinearParameter;
		 Approx_CurvilinearParameter (const Handle_Adaptor2d_HCurve2d & C2D,const Handle_Adaptor3d_HSurface & Surf,const Standard_Real Tol,const GeomAbs_Shape Order,const Standard_Integer MaxDegree,const Standard_Integer MaxSegments);
		%feature("autodoc", "Args:
	C2D1(Handle_Adaptor2d_HCurve2d)
	Surf1(Handle_Adaptor3d_HSurface)
	C2D2(Handle_Adaptor2d_HCurve2d)
	Surf2(Handle_Adaptor3d_HSurface)
	Tol(Standard_Real)
	Order(GeomAbs_Shape)
	MaxDegree(Standard_Integer)
	MaxSegments(Standard_Integer)

Returns:
	None

case of a curve on two surfaces") Approx_CurvilinearParameter;
		 Approx_CurvilinearParameter (const Handle_Adaptor2d_HCurve2d & C2D1,const Handle_Adaptor3d_HSurface & Surf1,const Handle_Adaptor2d_HCurve2d & C2D2,const Handle_Adaptor3d_HSurface & Surf2,const Standard_Real Tol,const GeomAbs_Shape Order,const Standard_Integer MaxDegree,const Standard_Integer MaxSegments);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasResult;
		Standard_Boolean HasResult ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BSplineCurve

returns the Bspline curve corresponding to the reparametrized 3D curve") Curve3d;
		Handle_Geom_BSplineCurve Curve3d ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns the maximum error on the reparametrized 3D curve") MaxError3d;
		Standard_Real MaxError3d ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_BSplineCurve

returns the BsplineCurve representing the reparametrized 2D curve on the  
         first surface (case of a curve on one or two surfaces)") Curve2d1;
		Handle_Geom2d_BSplineCurve Curve2d1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns the maximum error on the first reparametrized 2D curve") MaxError2d1;
		Standard_Real MaxError2d1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_BSplineCurve

returns the BsplineCurve representing the reparametrized 2D curve on the  
         second surface (case of a curve on two surfaces)") Curve2d2;
		Handle_Geom2d_BSplineCurve Curve2d2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns the maximum error on the second reparametrized 2D curve") MaxError2d2;
		Standard_Real MaxError2d2 ();
		%feature("autodoc", "Args:
	o(Standard_OStream)

Returns:
	None

print the maximum errors(s)") Dump;
		void Dump (Standard_OStream & o);
};


%feature("shadow") Approx_CurvilinearParameter::~Approx_CurvilinearParameter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Approx_CurvilinearParameter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Approx_CurvlinFunc;
class Approx_CurvlinFunc : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Approx_CurvlinFunc;
		 Approx_CurvlinFunc (const Handle_Adaptor3d_HCurve & C,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C2D(Handle_Adaptor2d_HCurve2d)
	S(Handle_Adaptor3d_HSurface)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Approx_CurvlinFunc;
		 Approx_CurvlinFunc (const Handle_Adaptor2d_HCurve2d & C2D,const Handle_Adaptor3d_HSurface & S,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C2D1(Handle_Adaptor2d_HCurve2d)
	C2D2(Handle_Adaptor2d_HCurve2d)
	S1(Handle_Adaptor3d_HSurface)
	S2(Handle_Adaptor3d_HSurface)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Approx_CurvlinFunc;
		 Approx_CurvlinFunc (const Handle_Adaptor2d_HCurve2d & C2D1,const Handle_Adaptor2d_HCurve2d & C2D2,const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_HSurface & S2,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Tol(Standard_Real)

Returns:
	None

//!---Purpose Update the tolerance to used") SetTol;
		void SetTol (const Standard_Real Tol);
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
	S(GeomAbs_Shape)

Returns:
	Standard_Integer

Returns  the number  of  intervals for  continuity  
         <S>. May be one if Continuity(me) >= <S>") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	None

Stores in <T> the  parameters bounding the intervals  
         of continuity <S>.  
 
         The array must provide  enough room to  accomodate  
         for the parameters. i.e. T.Length() > NbIntervals()") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

if First < 0 or Last > 1") Trim;
		void Trim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	None

Computes length of the curve.") Length;
		void Length ();
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	FirstU(Standard_Real)
	LasrU(Standard_Real)

Returns:
	Standard_Real

Computes length of the curve segment.") Length;
		Standard_Real Length (Adaptor3d_Curve & C,const Standard_Real FirstU,const Standard_Real LasrU);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") GetLength;
		Standard_Real GetLength ();
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	S(Standard_Real)
	NumberOfCurve(Standard_Integer)

Returns:
	Standard_Real

returns  original parameter correponding S.  if  
 Case == 1 computation is performed on myC2D1 and mySurf1,  
 otherwise it is done on myC2D2 and mySurf2.") GetUParameter;
		Standard_Real GetUParameter (Adaptor3d_Curve & C,const Standard_Real S,const Standard_Integer NumberOfCurve);
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

returns original parameter correponding S.") GetSParameter;
		Standard_Real GetSParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	S(Standard_Real)
	Order(Standard_Integer)
	Result(TColStd_Array1OfReal)

Returns:
	Standard_Boolean

if myCase != 1") EvalCase1;
		Standard_Boolean EvalCase1 (const Standard_Real S,const Standard_Integer Order,TColStd_Array1OfReal & Result);
		%feature("autodoc", "Args:
	S(Standard_Real)
	Order(Standard_Integer)
	Result(TColStd_Array1OfReal)

Returns:
	Standard_Boolean

if myCase != 2") EvalCase2;
		Standard_Boolean EvalCase2 (const Standard_Real S,const Standard_Integer Order,TColStd_Array1OfReal & Result);
		%feature("autodoc", "Args:
	S(Standard_Real)
	Order(Standard_Integer)
	Result(TColStd_Array1OfReal)

Returns:
	Standard_Boolean

if myCase != 3") EvalCase3;
		Standard_Boolean EvalCase3 (const Standard_Real S,const Standard_Integer Order,TColStd_Array1OfReal & Result);
};


%feature("shadow") Approx_CurvlinFunc::~Approx_CurvlinFunc %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Approx_CurvlinFunc {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Approx_CurvlinFunc {
	Handle_Approx_CurvlinFunc GetHandle() {
	return *(Handle_Approx_CurvlinFunc*) &$self;
	}
};

%nodefaultctor Handle_Approx_CurvlinFunc;
class Handle_Approx_CurvlinFunc : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Approx_CurvlinFunc();
        Handle_Approx_CurvlinFunc(const Handle_Approx_CurvlinFunc &aHandle);
        Handle_Approx_CurvlinFunc(const Approx_CurvlinFunc *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Approx_CurvlinFunc DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Approx_CurvlinFunc {
    Approx_CurvlinFunc* GetObject() {
    return (Approx_CurvlinFunc*)$self->Access();
    }
};
%feature("shadow") Handle_Approx_CurvlinFunc::~Handle_Approx_CurvlinFunc %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Approx_CurvlinFunc {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Approx_FitAndDivide;
class Approx_FitAndDivide {
	public:
		%feature("autodoc", "Args:
	Line(AppCont_Function)
	degreemin(Standard_Integer)=3
	degreemax(Standard_Integer)=8
	Tolerance3d(Standard_Real)=1.0e-5
	Tolerance2d(Standard_Real)=1.0e-5
	cutting(Standard_Boolean)=Standard_False
	FirstC(AppParCurves_Constraint)=AppParCurves_TangencyPoint
	LastC(AppParCurves_Constraint)=AppParCurves_TangencyPoint

Returns:
	None

No detailed docstring for this function.") Approx_FitAndDivide;
		 Approx_FitAndDivide (const AppCont_Function & Line,const Standard_Integer degreemin = 3,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-5,const Standard_Real Tolerance2d = 1.0e-5,const Standard_Boolean cutting = Standard_False,const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint,const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);
		%feature("autodoc", "Args:
	degreemin(Standard_Integer)=3
	degreemax(Standard_Integer)=8
	Tolerance3d(Standard_Real)=1.0e-05
	Tolerance2d(Standard_Real)=1.0e-05
	cutting(Standard_Boolean)=Standard_False
	FirstC(AppParCurves_Constraint)=AppParCurves_TangencyPoint
	LastC(AppParCurves_Constraint)=AppParCurves_TangencyPoint

Returns:
	None

No detailed docstring for this function.") Approx_FitAndDivide;
		 Approx_FitAndDivide (const Standard_Integer degreemin = 3,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-05,const Standard_Real Tolerance2d = 1.0e-05,const Standard_Boolean cutting = Standard_False,const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint,const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);
		%feature("autodoc", "Args:
	Line(AppCont_Function)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const AppCont_Function & Line);
		%feature("autodoc", "Args:
	degreemin(Standard_Integer)
	degreemax(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetDegrees;
		void SetDegrees (const Standard_Integer degreemin,const Standard_Integer degreemax);
		%feature("autodoc", "Args:
	Tolerance3d(Standard_Real)
	Tolerance2d(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetTolerances;
		void SetTolerances (const Standard_Real Tolerance3d,const Standard_Real Tolerance2d);
		%feature("autodoc", "Args:
	FirstC(AppParCurves_Constraint)
	LastC(AppParCurves_Constraint)

Returns:
	None

No detailed docstring for this function.") SetConstraints;
		void SetConstraints (const AppParCurves_Constraint FirstC,const AppParCurves_Constraint LastC);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllApproximated;
		Standard_Boolean IsAllApproximated ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsToleranceReached;
		Standard_Boolean IsToleranceReached ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	tol3d(Standard_Real)
	tol2d(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Error;
		void Error (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbMultiCurves;
		Standard_Integer NbMultiCurves ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)=1

Returns:
	AppParCurves_MultiCurve

No detailed docstring for this function.") Value;
		AppParCurves_MultiCurve Value (const Standard_Integer Index = 1);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	firstp(Standard_Real)
	lastp(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Parameters;
		void Parameters (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") Approx_FitAndDivide::~Approx_FitAndDivide %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Approx_FitAndDivide {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Approx_FitAndDivide2d;
class Approx_FitAndDivide2d {
	public:
		%feature("autodoc", "Args:
	Line(AppCont_Function2d)
	degreemin(Standard_Integer)=3
	degreemax(Standard_Integer)=8
	Tolerance3d(Standard_Real)=1.0e-5
	Tolerance2d(Standard_Real)=1.0e-5
	cutting(Standard_Boolean)=Standard_False
	FirstC(AppParCurves_Constraint)=AppParCurves_TangencyPoint
	LastC(AppParCurves_Constraint)=AppParCurves_TangencyPoint

Returns:
	None

No detailed docstring for this function.") Approx_FitAndDivide2d;
		 Approx_FitAndDivide2d (const AppCont_Function2d & Line,const Standard_Integer degreemin = 3,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-5,const Standard_Real Tolerance2d = 1.0e-5,const Standard_Boolean cutting = Standard_False,const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint,const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);
		%feature("autodoc", "Args:
	degreemin(Standard_Integer)=3
	degreemax(Standard_Integer)=8
	Tolerance3d(Standard_Real)=1.0e-05
	Tolerance2d(Standard_Real)=1.0e-05
	cutting(Standard_Boolean)=Standard_False
	FirstC(AppParCurves_Constraint)=AppParCurves_TangencyPoint
	LastC(AppParCurves_Constraint)=AppParCurves_TangencyPoint

Returns:
	None

No detailed docstring for this function.") Approx_FitAndDivide2d;
		 Approx_FitAndDivide2d (const Standard_Integer degreemin = 3,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-05,const Standard_Real Tolerance2d = 1.0e-05,const Standard_Boolean cutting = Standard_False,const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint,const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);
		%feature("autodoc", "Args:
	Line(AppCont_Function2d)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const AppCont_Function2d & Line);
		%feature("autodoc", "Args:
	degreemin(Standard_Integer)
	degreemax(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetDegrees;
		void SetDegrees (const Standard_Integer degreemin,const Standard_Integer degreemax);
		%feature("autodoc", "Args:
	Tolerance3d(Standard_Real)
	Tolerance2d(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetTolerances;
		void SetTolerances (const Standard_Real Tolerance3d,const Standard_Real Tolerance2d);
		%feature("autodoc", "Args:
	FirstC(AppParCurves_Constraint)
	LastC(AppParCurves_Constraint)

Returns:
	None

No detailed docstring for this function.") SetConstraints;
		void SetConstraints (const AppParCurves_Constraint FirstC,const AppParCurves_Constraint LastC);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllApproximated;
		Standard_Boolean IsAllApproximated ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsToleranceReached;
		Standard_Boolean IsToleranceReached ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	tol3d(Standard_Real)
	tol2d(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Error;
		void Error (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbMultiCurves;
		Standard_Integer NbMultiCurves ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)=1

Returns:
	AppParCurves_MultiCurve

No detailed docstring for this function.") Value;
		AppParCurves_MultiCurve Value (const Standard_Integer Index = 1);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	firstp(Standard_Real)
	lastp(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Parameters;
		void Parameters (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") Approx_FitAndDivide2d::~Approx_FitAndDivide2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Approx_FitAndDivide2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Approx_HArray1OfAdHSurface;
class Approx_HArray1OfAdHSurface : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Approx_HArray1OfAdHSurface;
		 Approx_HArray1OfAdHSurface (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Handle_Adaptor3d_HSurface)

Returns:
	None

No detailed docstring for this function.") Approx_HArray1OfAdHSurface;
		 Approx_HArray1OfAdHSurface (const Standard_Integer Low,const Standard_Integer Up,const Handle_Adaptor3d_HSurface & V);
		%feature("autodoc", "Args:
	V(Handle_Adaptor3d_HSurface)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Adaptor3d_HSurface & V);
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
	Value(Handle_Adaptor3d_HSurface)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Adaptor3d_HSurface & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Adaptor3d_HSurface

No detailed docstring for this function.") Value;
		const Handle_Adaptor3d_HSurface & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Adaptor3d_HSurface

No detailed docstring for this function.") ChangeValue;
		Handle_Adaptor3d_HSurface & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Approx_Array1OfAdHSurface

No detailed docstring for this function.") Array1;
		const Approx_Array1OfAdHSurface & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Approx_Array1OfAdHSurface

No detailed docstring for this function.") ChangeArray1;
		Approx_Array1OfAdHSurface & ChangeArray1 ();
};


%feature("shadow") Approx_HArray1OfAdHSurface::~Approx_HArray1OfAdHSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Approx_HArray1OfAdHSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Approx_HArray1OfAdHSurface {
	Handle_Approx_HArray1OfAdHSurface GetHandle() {
	return *(Handle_Approx_HArray1OfAdHSurface*) &$self;
	}
};

%nodefaultctor Handle_Approx_HArray1OfAdHSurface;
class Handle_Approx_HArray1OfAdHSurface : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Approx_HArray1OfAdHSurface();
        Handle_Approx_HArray1OfAdHSurface(const Handle_Approx_HArray1OfAdHSurface &aHandle);
        Handle_Approx_HArray1OfAdHSurface(const Approx_HArray1OfAdHSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Approx_HArray1OfAdHSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Approx_HArray1OfAdHSurface {
    Approx_HArray1OfAdHSurface* GetObject() {
    return (Approx_HArray1OfAdHSurface*)$self->Access();
    }
};
%feature("shadow") Handle_Approx_HArray1OfAdHSurface::~Handle_Approx_HArray1OfAdHSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Approx_HArray1OfAdHSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Approx_HArray1OfGTrsf2d;
class Approx_HArray1OfGTrsf2d : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Approx_HArray1OfGTrsf2d;
		 Approx_HArray1OfGTrsf2d (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(gp_GTrsf2d)

Returns:
	None

No detailed docstring for this function.") Approx_HArray1OfGTrsf2d;
		 Approx_HArray1OfGTrsf2d (const Standard_Integer Low,const Standard_Integer Up,const gp_GTrsf2d & V);
		%feature("autodoc", "Args:
	V(gp_GTrsf2d)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const gp_GTrsf2d & V);
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
	Value(gp_GTrsf2d)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const gp_GTrsf2d & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_GTrsf2d

No detailed docstring for this function.") Value;
		const gp_GTrsf2d & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_GTrsf2d

No detailed docstring for this function.") ChangeValue;
		gp_GTrsf2d & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Approx_Array1OfGTrsf2d

No detailed docstring for this function.") Array1;
		const Approx_Array1OfGTrsf2d & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Approx_Array1OfGTrsf2d

No detailed docstring for this function.") ChangeArray1;
		Approx_Array1OfGTrsf2d & ChangeArray1 ();
};


%feature("shadow") Approx_HArray1OfGTrsf2d::~Approx_HArray1OfGTrsf2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Approx_HArray1OfGTrsf2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Approx_HArray1OfGTrsf2d {
	Handle_Approx_HArray1OfGTrsf2d GetHandle() {
	return *(Handle_Approx_HArray1OfGTrsf2d*) &$self;
	}
};

%nodefaultctor Handle_Approx_HArray1OfGTrsf2d;
class Handle_Approx_HArray1OfGTrsf2d : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Approx_HArray1OfGTrsf2d();
        Handle_Approx_HArray1OfGTrsf2d(const Handle_Approx_HArray1OfGTrsf2d &aHandle);
        Handle_Approx_HArray1OfGTrsf2d(const Approx_HArray1OfGTrsf2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Approx_HArray1OfGTrsf2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Approx_HArray1OfGTrsf2d {
    Approx_HArray1OfGTrsf2d* GetObject() {
    return (Approx_HArray1OfGTrsf2d*)$self->Access();
    }
};
%feature("shadow") Handle_Approx_HArray1OfGTrsf2d::~Handle_Approx_HArray1OfGTrsf2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Approx_HArray1OfGTrsf2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Approx_MCurvesToBSpCurve;
class Approx_MCurvesToBSpCurve {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Approx_MCurvesToBSpCurve;
		 Approx_MCurvesToBSpCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reset;
		void Reset ();
		%feature("autodoc", "Args:
	MC(AppParCurves_MultiCurve)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const AppParCurves_MultiCurve & MC);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	TheSeq(AppParCurves_SequenceOfMultiCurve)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const AppParCurves_SequenceOfMultiCurve & TheSeq);
		%feature("autodoc", "Args:
	None
Returns:
	AppParCurves_MultiBSpCurve

return the composite MultiCurves as a MultiBSpCurve.") Value;
		const AppParCurves_MultiBSpCurve & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	AppParCurves_MultiBSpCurve

return the composite MultiCurves as a MultiBSpCurve.") ChangeValue;
		const AppParCurves_MultiBSpCurve & ChangeValue ();
};


%feature("shadow") Approx_MCurvesToBSpCurve::~Approx_MCurvesToBSpCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Approx_MCurvesToBSpCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Approx_MyLeastSquareOfFitAndDivide;
class Approx_MyLeastSquareOfFitAndDivide {
	public:
		%feature("autodoc", "Args:
	SSP(AppCont_Function)
	U0(Standard_Real)
	U1(Standard_Real)
	FirstCons(AppParCurves_Constraint)
	LastCons(AppParCurves_Constraint)
	Deg(Standard_Integer)
	NbPoints(Standard_Integer)=24

Returns:
	None

No detailed docstring for this function.") Approx_MyLeastSquareOfFitAndDivide;
		 Approx_MyLeastSquareOfFitAndDivide (const AppCont_Function & SSP,const Standard_Real U0,const Standard_Real U1,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer Deg,const Standard_Integer NbPoints = 24);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	AppParCurves_MultiCurve

No detailed docstring for this function.") Value;
		const AppParCurves_MultiCurve & Value ();
		%feature("autodoc", "Args:
	F(Standard_Real)
	MaxE3d(Standard_Real)
	MaxE2d(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Error;
		void Error (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") Approx_MyLeastSquareOfFitAndDivide::~Approx_MyLeastSquareOfFitAndDivide %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Approx_MyLeastSquareOfFitAndDivide {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Approx_MyLeastSquareOfFitAndDivide2d;
class Approx_MyLeastSquareOfFitAndDivide2d {
	public:
		%feature("autodoc", "Args:
	SSP(AppCont_Function2d)
	U0(Standard_Real)
	U1(Standard_Real)
	FirstCons(AppParCurves_Constraint)
	LastCons(AppParCurves_Constraint)
	Deg(Standard_Integer)
	NbPoints(Standard_Integer)=24

Returns:
	None

No detailed docstring for this function.") Approx_MyLeastSquareOfFitAndDivide2d;
		 Approx_MyLeastSquareOfFitAndDivide2d (const AppCont_Function2d & SSP,const Standard_Real U0,const Standard_Real U1,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer Deg,const Standard_Integer NbPoints = 24);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	AppParCurves_MultiCurve

No detailed docstring for this function.") Value;
		const AppParCurves_MultiCurve & Value ();
		%feature("autodoc", "Args:
	F(Standard_Real)
	MaxE3d(Standard_Real)
	MaxE2d(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Error;
		void Error (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") Approx_MyLeastSquareOfFitAndDivide2d::~Approx_MyLeastSquareOfFitAndDivide2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Approx_MyLeastSquareOfFitAndDivide2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Approx_SameParameter;
class Approx_SameParameter {
	public:
		%feature("autodoc", "Args:
	C3D(Handle_Geom_Curve)
	C2D(Handle_Geom2d_Curve)
	S(Handle_Geom_Surface)
	Tol(Standard_Real)

Returns:
	None

Warning: the C3D and C2D must have the same parametric domain.") Approx_SameParameter;
		 Approx_SameParameter (const Handle_Geom_Curve & C3D,const Handle_Geom2d_Curve & C2D,const Handle_Geom_Surface & S,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C3D(Handle_Adaptor3d_HCurve)
	C2D(Handle_Geom2d_Curve)
	S(Handle_Adaptor3d_HSurface)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Approx_SameParameter;
		 Approx_SameParameter (const Handle_Adaptor3d_HCurve & C3D,const Handle_Geom2d_Curve & C2D,const Handle_Adaptor3d_HSurface & S,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C3D(Handle_Adaptor3d_HCurve)
	C2D(Handle_Adaptor2d_HCurve2d)
	S(Handle_Adaptor3d_HSurface)
	Tol(Standard_Real)

Returns:
	None

Warning: the C3D and C2D must have the same parametric domain.") Approx_SameParameter;
		 Approx_SameParameter (const Handle_Adaptor3d_HCurve & C3D,const Handle_Adaptor2d_HCurve2d & C2D,const Handle_Adaptor3d_HSurface & S,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") TolReached;
		Standard_Real TolReached ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Tells whether the original data  had already the  same  
         parameter up to  the tolerance :  in that case nothing  
         is done.") IsSameParameter;
		Standard_Boolean IsSameParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_BSplineCurve

Returns the 2D  curve that has  the same parameter  as  
         the  3D curve once evaluated on  the surface up to the  
         specified tolerance") Curve2d;
		Handle_Geom2d_BSplineCurve Curve2d ();
};


%feature("shadow") Approx_SameParameter::~Approx_SameParameter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Approx_SameParameter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Approx_SequenceNodeOfSequenceOfHArray1OfReal;
class Approx_SequenceNodeOfSequenceOfHArray1OfReal : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_TColStd_HArray1OfReal)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Approx_SequenceNodeOfSequenceOfHArray1OfReal;
		 Approx_SequenceNodeOfSequenceOfHArray1OfReal (const Handle_TColStd_HArray1OfReal & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfReal

No detailed docstring for this function.") Value;
		Handle_TColStd_HArray1OfReal & Value ();
};


%feature("shadow") Approx_SequenceNodeOfSequenceOfHArray1OfReal::~Approx_SequenceNodeOfSequenceOfHArray1OfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Approx_SequenceNodeOfSequenceOfHArray1OfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Approx_SequenceNodeOfSequenceOfHArray1OfReal {
	Handle_Approx_SequenceNodeOfSequenceOfHArray1OfReal GetHandle() {
	return *(Handle_Approx_SequenceNodeOfSequenceOfHArray1OfReal*) &$self;
	}
};

%nodefaultctor Handle_Approx_SequenceNodeOfSequenceOfHArray1OfReal;
class Handle_Approx_SequenceNodeOfSequenceOfHArray1OfReal : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Approx_SequenceNodeOfSequenceOfHArray1OfReal();
        Handle_Approx_SequenceNodeOfSequenceOfHArray1OfReal(const Handle_Approx_SequenceNodeOfSequenceOfHArray1OfReal &aHandle);
        Handle_Approx_SequenceNodeOfSequenceOfHArray1OfReal(const Approx_SequenceNodeOfSequenceOfHArray1OfReal *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Approx_SequenceNodeOfSequenceOfHArray1OfReal DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Approx_SequenceNodeOfSequenceOfHArray1OfReal {
    Approx_SequenceNodeOfSequenceOfHArray1OfReal* GetObject() {
    return (Approx_SequenceNodeOfSequenceOfHArray1OfReal*)$self->Access();
    }
};
%feature("shadow") Handle_Approx_SequenceNodeOfSequenceOfHArray1OfReal::~Handle_Approx_SequenceNodeOfSequenceOfHArray1OfReal %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Approx_SequenceNodeOfSequenceOfHArray1OfReal {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Approx_SequenceOfHArray1OfReal;
class Approx_SequenceOfHArray1OfReal : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Approx_SequenceOfHArray1OfReal;
		 Approx_SequenceOfHArray1OfReal ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Approx_SequenceOfHArray1OfReal)

Returns:
	Approx_SequenceOfHArray1OfReal

No detailed docstring for this function.") Assign;
		const Approx_SequenceOfHArray1OfReal & Assign (const Approx_SequenceOfHArray1OfReal & Other);
		%feature("autodoc", "Args:
	Other(Approx_SequenceOfHArray1OfReal)

Returns:
	Approx_SequenceOfHArray1OfReal

No detailed docstring for this function.") operator=;
		const Approx_SequenceOfHArray1OfReal & operator = (const Approx_SequenceOfHArray1OfReal & Other);
		%feature("autodoc", "Args:
	T(Handle_TColStd_HArray1OfReal)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_TColStd_HArray1OfReal & T);
		%feature("autodoc", "Args:
	S(Approx_SequenceOfHArray1OfReal)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Approx_SequenceOfHArray1OfReal & S);
		%feature("autodoc", "Args:
	T(Handle_TColStd_HArray1OfReal)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_TColStd_HArray1OfReal & T);
		%feature("autodoc", "Args:
	S(Approx_SequenceOfHArray1OfReal)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Approx_SequenceOfHArray1OfReal & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_TColStd_HArray1OfReal)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_TColStd_HArray1OfReal & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Approx_SequenceOfHArray1OfReal)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Approx_SequenceOfHArray1OfReal & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_TColStd_HArray1OfReal)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_TColStd_HArray1OfReal & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Approx_SequenceOfHArray1OfReal)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Approx_SequenceOfHArray1OfReal & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfReal

No detailed docstring for this function.") First;
		const Handle_TColStd_HArray1OfReal & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfReal

No detailed docstring for this function.") Last;
		const Handle_TColStd_HArray1OfReal & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Approx_SequenceOfHArray1OfReal)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Approx_SequenceOfHArray1OfReal & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_TColStd_HArray1OfReal

No detailed docstring for this function.") Value;
		const Handle_TColStd_HArray1OfReal & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_TColStd_HArray1OfReal)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_TColStd_HArray1OfReal & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_TColStd_HArray1OfReal

No detailed docstring for this function.") ChangeValue;
		Handle_TColStd_HArray1OfReal & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Approx_SequenceOfHArray1OfReal::~Approx_SequenceOfHArray1OfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Approx_SequenceOfHArray1OfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Approx_SweepApproximation;
class Approx_SweepApproximation {
	public:
		%feature("autodoc", "Args:
	Func(Handle_Approx_SweepFunction)

Returns:
	None

No detailed docstring for this function.") Approx_SweepApproximation;
		 Approx_SweepApproximation (const Handle_Approx_SweepFunction & Func);
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)
	Tol3d(Standard_Real)
	BoundTol(Standard_Real)
	Tol2d(Standard_Real)
	TolAngular(Standard_Real)
	Continuity(GeomAbs_Shape)=GeomAbs_C0
	Degmax(Standard_Integer)=11
	Segmax(Standard_Integer)=50

Returns:
	None

Perform the Approximation  
   [First, Last] : Approx_SweepApproximation.cdl  
   Tol3d : Tolerance to surface approximation  
   Tol2d : Tolerance used to perform curve approximation  
           Normaly the 2d curve are approximated with a  
           tolerance given by the resolution on support surfaces,  
           but if this tolerance is too large Tol2d is used.  
   TolAngular : Tolerance (in radian) to control the angle  
                beetween tangents on the section law and  
                tangent of iso-v on approximed surface  
   Continuity : The continuity in v waiting on the surface  
   Degmax     : The maximum degree in v requiered on the surface  
   Segmax     : The maximum number of span in v requiered on  
                the surface  
  Warning : The continuity ci can be obtained only if Ft is Ci") Perform;
		void Perform (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol3d,const Standard_Real BoundTol,const Standard_Real Tol2d,const Standard_Real TolAngular,const GeomAbs_Shape Continuity = GeomAbs_C0,const Standard_Integer Degmax = 11,const Standard_Integer Segmax = 50);
		%feature("autodoc", "Args:
	Parameter(Standard_Real)
	DerivativeRequest(Standard_Integer)
	First(Standard_Real)
	Last(Standard_Real)
	Result(Standard_Real)

Returns:
	Standard_Integer

The EvaluatorFunction from AdvApprox;") Eval;
		Standard_Integer Eval (const Standard_Real Parameter,const Standard_Integer DerivativeRequest,const Standard_Real First,const Standard_Real Last,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns if we have an result") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	UDegree(Standard_Integer)
	VDegree(Standard_Integer)
	NbUPoles(Standard_Integer)
	NbVPoles(Standard_Integer)
	NbUKnots(Standard_Integer)
	NbVKnots(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SurfShape;
		void SurfShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	TPoles(TColgp_Array2OfPnt)
	TWeights(TColStd_Array2OfReal)
	TUKnots(TColStd_Array1OfReal)
	TVKnots(TColStd_Array1OfReal)
	TUMults(TColStd_Array1OfInteger)
	TVMults(TColStd_Array1OfInteger)

Returns:
	None

No detailed docstring for this function.") Surface;
		void Surface (TColgp_Array2OfPnt & TPoles,TColStd_Array2OfReal & TWeights,TColStd_Array1OfReal & TUKnots,TColStd_Array1OfReal & TVKnots,TColStd_Array1OfInteger & TUMults,TColStd_Array1OfInteger & TVMults);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UDegree;
		Standard_Integer UDegree ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") VDegree;
		Standard_Integer VDegree ();
		%feature("autodoc", "Args:
	None
Returns:
	TColgp_Array2OfPnt

No detailed docstring for this function.") SurfPoles;
		const TColgp_Array2OfPnt & SurfPoles ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array2OfReal

No detailed docstring for this function.") SurfWeights;
		const TColStd_Array2OfReal & SurfWeights ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfReal

No detailed docstring for this function.") SurfUKnots;
		const TColStd_Array1OfReal & SurfUKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfReal

No detailed docstring for this function.") SurfVKnots;
		const TColStd_Array1OfReal & SurfVKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfInteger

No detailed docstring for this function.") SurfUMults;
		const TColStd_Array1OfInteger & SurfUMults ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfInteger

No detailed docstring for this function.") SurfVMults;
		const TColStd_Array1OfInteger & SurfVMults ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns the maximum error in the suface approximation.") MaxErrorOnSurf;
		Standard_Real MaxErrorOnSurf ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns the average error in the suface approximation.") AverageErrorOnSurf;
		Standard_Real AverageErrorOnSurf ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbCurves2d;
		Standard_Integer NbCurves2d ();
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	NbPoles(Standard_Integer)
	NbKnots(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Curves2dShape;
		void Curves2dShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	TPoles(TColgp_Array1OfPnt2d)
	TKnots(TColStd_Array1OfReal)
	TMults(TColStd_Array1OfInteger)

Returns:
	None

No detailed docstring for this function.") Curve2d;
		void Curve2d (const Standard_Integer Index,TColgp_Array1OfPnt2d & TPoles,TColStd_Array1OfReal & TKnots,TColStd_Array1OfInteger & TMults);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Curves2dDegree;
		Standard_Integer Curves2dDegree ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TColgp_Array1OfPnt2d

No detailed docstring for this function.") Curve2dPoles;
		const TColgp_Array1OfPnt2d & Curve2dPoles (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfReal

No detailed docstring for this function.") Curves2dKnots;
		const TColStd_Array1OfReal & Curves2dKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfInteger

No detailed docstring for this function.") Curves2dMults;
		const TColStd_Array1OfInteger & Curves2dMults ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

returns the maximum error of the <Index>  
         2d curve approximation.") Max2dError;
		Standard_Real Max2dError (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

returns the average error of the <Index>  
         2d curve approximation.") Average2dError;
		Standard_Real Average2dError (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

returns the  maximum 3d  error  of the  <Index>  
          2d curve approximation on the Surface.") TolCurveOnSurf;
		Standard_Real TolCurveOnSurf (const Standard_Integer Index);
		%feature("autodoc", "Args:
	o(Standard_OStream)

Returns:
	None

display information on approximation.") Dump;
		void Dump (Standard_OStream & o);
};


%feature("shadow") Approx_SweepApproximation::~Approx_SweepApproximation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Approx_SweepApproximation {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Approx_SweepFunction;
class Approx_SweepFunction : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Param(Standard_Real)
	First(Standard_Real)
	Last(Standard_Real)
	Poles(TColgp_Array1OfPnt)
	Poles2d(TColgp_Array1OfPnt2d)
	Weigths(TColStd_Array1OfReal)

Returns:
	virtual Standard_Boolean

compute the section for v = param") D0;
		virtual Standard_Boolean D0 (const Standard_Real Param,const Standard_Real First,const Standard_Real Last,TColgp_Array1OfPnt & Poles,TColgp_Array1OfPnt2d & Poles2d,TColStd_Array1OfReal & Weigths);
		%feature("autodoc", "Args:
	Param(Standard_Real)
	First(Standard_Real)
	Last(Standard_Real)
	Poles(TColgp_Array1OfPnt)
	DPoles(TColgp_Array1OfVec)
	Poles2d(TColgp_Array1OfPnt2d)
	DPoles2d(TColgp_Array1OfVec2d)
	Weigths(TColStd_Array1OfReal)
	DWeigths(TColStd_Array1OfReal)

Returns:
	virtual Standard_Boolean

compute the first  derivative in v direction  of the  
          section for v =  param  
 Warning : It used only for C1 or C2 aproximation") D1;
		virtual Standard_Boolean D1 (const Standard_Real Param,const Standard_Real First,const Standard_Real Last,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths);
		%feature("autodoc", "Args:
	Param(Standard_Real)
	First(Standard_Real)
	Last(Standard_Real)
	Poles(TColgp_Array1OfPnt)
	DPoles(TColgp_Array1OfVec)
	D2Poles(TColgp_Array1OfVec)
	Poles2d(TColgp_Array1OfPnt2d)
	DPoles2d(TColgp_Array1OfVec2d)
	D2Poles2d(TColgp_Array1OfVec2d)
	Weigths(TColStd_Array1OfReal)
	DWeigths(TColStd_Array1OfReal)
	D2Weigths(TColStd_Array1OfReal)

Returns:
	virtual Standard_Boolean

compute the second derivative  in v direction of the  
         section  for v = param  
 Warning : It used only for C2 aproximation") D2;
		virtual Standard_Boolean D2 (const Standard_Real Param,const Standard_Real First,const Standard_Real Last,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfVec & D2Poles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColgp_Array1OfVec2d & D2Poles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths,TColStd_Array1OfReal & D2Weigths);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

get the number of 2d curves to  approximate.") Nb2dCurves;
		virtual Standard_Integer Nb2dCurves ();
		%feature("autodoc", "Args:
	NbPoles(Standard_Integer)
	NbKnots(Standard_Integer)
	Degree(Standard_Integer)

Returns:
	virtual void

get the format of an  section") SectionShape;
		virtual void SectionShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	TKnots(TColStd_Array1OfReal)

Returns:
	virtual void

get the Knots of the section") Knots;
		virtual void Knots (TColStd_Array1OfReal & TKnots);
		%feature("autodoc", "Args:
	TMults(TColStd_Array1OfInteger)

Returns:
	virtual void

get the Multplicities of the section") Mults;
		virtual void Mults (TColStd_Array1OfInteger & TMults);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns if the sections are rationnal or not") IsRational;
		virtual Standard_Boolean IsRational ();
		%feature("autodoc", "Args:
	S(GeomAbs_Shape)

Returns:
	virtual Standard_Integer

Returns  the number  of  intervals for  continuity  
         <S>.  
         May be one if Continuity(me) >= <S>") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	virtual void

Stores in <T> the  parameters bounding the intervals  
         of continuity <S>.  
 
         The array must provide  enough room to  accomodate  
         for the parameters. i.e. T.Length() > NbIntervals()") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)

Returns:
	virtual void

Sets the bounds of the parametric interval on  
         the fonction  
         This determines the derivatives in these values if the  
         function is not Cn.") SetInterval;
		virtual void SetInterval (const Standard_Real First,const Standard_Real Last);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Tol(Standard_Real)
	TolU(Standard_Real)
	TolV(Standard_Real)

Returns:
	virtual void

Returns the resolutions in the  sub-space 2d <Index>  
         This information is usfull to find an good tolerance in  
         2d approximation.") Resolution;
		virtual void Resolution (const Standard_Integer Index,const Standard_Real Tol,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	BoundTol(Standard_Real)
	SurfTol(Standard_Real)
	AngleTol(Standard_Real)
	Tol3d(TColStd_Array1OfReal)

Returns:
	virtual void

Returns the tolerance to reach in approximation  
         to satisfy.  
         BoundTol error at the Boundary  
         AngleTol tangent error at the Boundary (in radian)  
         SurfTol error inside the surface.") GetTolerance;
		virtual void GetTolerance (const Standard_Real BoundTol,const Standard_Real SurfTol,const Standard_Real AngleTol,TColStd_Array1OfReal & Tol3d);
		%feature("autodoc", "Args:
	Tol3d(Standard_Real)
	Tol2d(Standard_Real)

Returns:
	virtual void

Is usefull, if (me) have to run numerical  
          algorithm to perform D0, D1 or D2") SetTolerance;
		virtual void SetTolerance (const Standard_Real Tol3d,const Standard_Real Tol2d);
		%feature("autodoc", "Args:
	None
Returns:
	virtual gp_Pnt

Get the barycentre of Surface.  
         An   very  poor estimation is sufficent.  
         This information is usefull to perform well  
         conditioned rational approximation.  
 Warning: Used only if <self> IsRational") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns the   length of the greater section. This  
         information is usefull to G1's control.  
 Warning: With an little value, approximation can be slower.") MaximalSection;
		virtual Standard_Real MaximalSection ();
		%feature("autodoc", "Args:
	Weigths(TColStd_Array1OfReal)

Returns:
	virtual void

Compute the minimal value of weight for each poles  
         in all  sections.  
         This information is  usefull to control error  
         in rational approximation.  
 Warning: Used only if <self> IsRational") GetMinimalWeight;
		virtual void GetMinimalWeight (TColStd_Array1OfReal & Weigths);
};


%feature("shadow") Approx_SweepFunction::~Approx_SweepFunction %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Approx_SweepFunction {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Approx_SweepFunction {
	Handle_Approx_SweepFunction GetHandle() {
	return *(Handle_Approx_SweepFunction*) &$self;
	}
};

%nodefaultctor Handle_Approx_SweepFunction;
class Handle_Approx_SweepFunction : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Approx_SweepFunction();
        Handle_Approx_SweepFunction(const Handle_Approx_SweepFunction &aHandle);
        Handle_Approx_SweepFunction(const Approx_SweepFunction *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Approx_SweepFunction DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Approx_SweepFunction {
    Approx_SweepFunction* GetObject() {
    return (Approx_SweepFunction*)$self->Access();
    }
};
%feature("shadow") Handle_Approx_SweepFunction::~Handle_Approx_SweepFunction %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Approx_SweepFunction {
    void _kill_pointed() {
        delete $self;
    }
};

