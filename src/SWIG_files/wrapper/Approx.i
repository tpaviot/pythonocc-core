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
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Approx_Array1OfAdHSurface;
		 Approx_Array1OfAdHSurface (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Adaptor3d_HSurface &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Approx_Array1OfAdHSurface;
		 Approx_Array1OfAdHSurface (const Handle_Adaptor3d_HSurface & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: Handle_Adaptor3d_HSurface &
	:rtype: None
") Init;
		void Init (const Handle_Adaptor3d_HSurface & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: Approx_Array1OfAdHSurface &
	:rtype: Approx_Array1OfAdHSurface
") Assign;
		const Approx_Array1OfAdHSurface & Assign (const Approx_Array1OfAdHSurface & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Approx_Array1OfAdHSurface &
	:rtype: Approx_Array1OfAdHSurface
") operator=;
		const Approx_Array1OfAdHSurface & operator = (const Approx_Array1OfAdHSurface & Other);
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
	:type Value: Handle_Adaptor3d_HSurface &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Adaptor3d_HSurface & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Adaptor3d_HSurface
") Value;
		const Handle_Adaptor3d_HSurface & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Adaptor3d_HSurface
") ChangeValue;
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
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Approx_Array1OfGTrsf2d;
		 Approx_Array1OfGTrsf2d (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: gp_GTrsf2d
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Approx_Array1OfGTrsf2d;
		 Approx_Array1OfGTrsf2d (const gp_GTrsf2d & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: gp_GTrsf2d
	:rtype: None
") Init;
		void Init (const gp_GTrsf2d & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: Approx_Array1OfGTrsf2d &
	:rtype: Approx_Array1OfGTrsf2d
") Assign;
		const Approx_Array1OfGTrsf2d & Assign (const Approx_Array1OfGTrsf2d & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Approx_Array1OfGTrsf2d &
	:rtype: Approx_Array1OfGTrsf2d
") operator=;
		const Approx_Array1OfGTrsf2d & operator = (const Approx_Array1OfGTrsf2d & Other);
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
	:type Value: gp_GTrsf2d
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_GTrsf2d & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: gp_GTrsf2d
") Value;
		const gp_GTrsf2d  Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: gp_GTrsf2d
") ChangeValue;
		gp_GTrsf2d  ChangeValue (const Standard_Integer Index);
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
		%feature("autodoc", "	:param C2D:
	:type C2D: Handle_Adaptor2d_HCurve2d &
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:param Continuity:
	:type Continuity: GeomAbs_Shape
	:param MaxDegree:
	:type MaxDegree: Standard_Integer
	:param MaxSegments:
	:type MaxSegments: Standard_Integer
	:rtype: None
") Approx_Curve2d;
		 Approx_Curve2d (const Handle_Adaptor2d_HCurve2d & C2D,const Standard_Real First,const Standard_Real Last,const Standard_Real TolU,const Standard_Real TolV,const GeomAbs_Shape Continuity,const Standard_Integer MaxDegree,const Standard_Integer MaxSegments);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: bool
") HasResult;
		Standard_Boolean HasResult ();
		%feature("autodoc", "	:rtype: Handle_Geom2d_BSplineCurve
") Curve;
		Handle_Geom2d_BSplineCurve Curve ();
		%feature("autodoc", "	:rtype: float
") MaxError2dU;
		Standard_Real MaxError2dU ();
		%feature("autodoc", "	:rtype: float
") MaxError2dV;
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
		%feature("autodoc", "	* Approximation of a curve with respect of the requiered tolerance Tol3D.

	:param Curve:
	:type Curve: Handle_Adaptor3d_HCurve &
	:param Tol3d:
	:type Tol3d: float
	:param Order:
	:type Order: GeomAbs_Shape
	:param MaxSegments:
	:type MaxSegments: Standard_Integer
	:param MaxDegree:
	:type MaxDegree: Standard_Integer
	:rtype: None
") Approx_Curve3d;
		 Approx_Curve3d (const Handle_Adaptor3d_HCurve & Curve,const Standard_Real Tol3d,const GeomAbs_Shape Order,const Standard_Integer MaxSegments,const Standard_Integer MaxDegree);
		%feature("autodoc", "	:rtype: Handle_Geom_BSplineCurve
") Curve;
		Handle_Geom_BSplineCurve Curve ();
		%feature("autodoc", "	* returns Standard_True if the approximation has been done within requiered tolerance

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* returns Standard_True if the approximation did come out with a result that is not NECESSARELY within the required tolerance

	:rtype: bool
") HasResult;
		Standard_Boolean HasResult ();
		%feature("autodoc", "	* returns the Maximum Error (>0 when an approximation has been done, 0 if no approximation)

	:rtype: float
") MaxError;
		Standard_Real MaxError ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("autodoc", "	:param C2D:
	:type C2D: Handle_Adaptor2d_HCurve2d &
	:param Surf:
	:type Surf: Handle_Adaptor3d_HSurface &
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:param Continuity:
	:type Continuity: GeomAbs_Shape
	:param MaxDegree:
	:type MaxDegree: Standard_Integer
	:param MaxSegments:
	:type MaxSegments: Standard_Integer
	:param Only3d: default value is Standard_False
	:type Only3d: bool
	:param Only2d: default value is Standard_False
	:type Only2d: bool
	:rtype: None
") Approx_CurveOnSurface;
		 Approx_CurveOnSurface (const Handle_Adaptor2d_HCurve2d & C2D,const Handle_Adaptor3d_HSurface & Surf,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol,const GeomAbs_Shape Continuity,const Standard_Integer MaxDegree,const Standard_Integer MaxSegments,const Standard_Boolean Only3d = Standard_False,const Standard_Boolean Only2d = Standard_False);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: bool
") HasResult;
		Standard_Boolean HasResult ();
		%feature("autodoc", "	:rtype: Handle_Geom_BSplineCurve
") Curve3d;
		Handle_Geom_BSplineCurve Curve3d ();
		%feature("autodoc", "	:rtype: float
") MaxError3d;
		Standard_Real MaxError3d ();
		%feature("autodoc", "	:rtype: Handle_Geom2d_BSplineCurve
") Curve2d;
		Handle_Geom2d_BSplineCurve Curve2d ();
		%feature("autodoc", "	:rtype: float
") MaxError2dU;
		Standard_Real MaxError2dU ();
		%feature("autodoc", "	* returns the maximum errors relativly to the U component or the V component of the  2d Curve

	:rtype: float
") MaxError2dV;
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
		%feature("autodoc", "	* case of a free 3D curve

	:param C3D:
	:type C3D: Handle_Adaptor3d_HCurve &
	:param Tol:
	:type Tol: float
	:param Order:
	:type Order: GeomAbs_Shape
	:param MaxDegree:
	:type MaxDegree: Standard_Integer
	:param MaxSegments:
	:type MaxSegments: Standard_Integer
	:rtype: None
") Approx_CurvilinearParameter;
		 Approx_CurvilinearParameter (const Handle_Adaptor3d_HCurve & C3D,const Standard_Real Tol,const GeomAbs_Shape Order,const Standard_Integer MaxDegree,const Standard_Integer MaxSegments);
		%feature("autodoc", "	* case of a curve on one surface

	:param C2D:
	:type C2D: Handle_Adaptor2d_HCurve2d &
	:param Surf:
	:type Surf: Handle_Adaptor3d_HSurface &
	:param Tol:
	:type Tol: float
	:param Order:
	:type Order: GeomAbs_Shape
	:param MaxDegree:
	:type MaxDegree: Standard_Integer
	:param MaxSegments:
	:type MaxSegments: Standard_Integer
	:rtype: None
") Approx_CurvilinearParameter;
		 Approx_CurvilinearParameter (const Handle_Adaptor2d_HCurve2d & C2D,const Handle_Adaptor3d_HSurface & Surf,const Standard_Real Tol,const GeomAbs_Shape Order,const Standard_Integer MaxDegree,const Standard_Integer MaxSegments);
		%feature("autodoc", "	* case of a curve on two surfaces

	:param C2D1:
	:type C2D1: Handle_Adaptor2d_HCurve2d &
	:param Surf1:
	:type Surf1: Handle_Adaptor3d_HSurface &
	:param C2D2:
	:type C2D2: Handle_Adaptor2d_HCurve2d &
	:param Surf2:
	:type Surf2: Handle_Adaptor3d_HSurface &
	:param Tol:
	:type Tol: float
	:param Order:
	:type Order: GeomAbs_Shape
	:param MaxDegree:
	:type MaxDegree: Standard_Integer
	:param MaxSegments:
	:type MaxSegments: Standard_Integer
	:rtype: None
") Approx_CurvilinearParameter;
		 Approx_CurvilinearParameter (const Handle_Adaptor2d_HCurve2d & C2D1,const Handle_Adaptor3d_HSurface & Surf1,const Handle_Adaptor2d_HCurve2d & C2D2,const Handle_Adaptor3d_HSurface & Surf2,const Standard_Real Tol,const GeomAbs_Shape Order,const Standard_Integer MaxDegree,const Standard_Integer MaxSegments);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: bool
") HasResult;
		Standard_Boolean HasResult ();
		%feature("autodoc", "	* returns the Bspline curve corresponding to the reparametrized 3D curve

	:rtype: Handle_Geom_BSplineCurve
") Curve3d;
		Handle_Geom_BSplineCurve Curve3d ();
		%feature("autodoc", "	* returns the maximum error on the reparametrized 3D curve

	:rtype: float
") MaxError3d;
		Standard_Real MaxError3d ();
		%feature("autodoc", "	* returns the BsplineCurve representing the reparametrized 2D curve on the first surface (case of a curve on one or two surfaces)

	:rtype: Handle_Geom2d_BSplineCurve
") Curve2d1;
		Handle_Geom2d_BSplineCurve Curve2d1 ();
		%feature("autodoc", "	* returns the maximum error on the first reparametrized 2D curve

	:rtype: float
") MaxError2d1;
		Standard_Real MaxError2d1 ();
		%feature("autodoc", "	* returns the BsplineCurve representing the reparametrized 2D curve on the second surface (case of a curve on two surfaces)

	:rtype: Handle_Geom2d_BSplineCurve
") Curve2d2;
		Handle_Geom2d_BSplineCurve Curve2d2 ();
		%feature("autodoc", "	* returns the maximum error on the second reparametrized 2D curve

	:rtype: float
") MaxError2d2;
		Standard_Real MaxError2d2 ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param Tol:
	:type Tol: float
	:rtype: None
") Approx_CurvlinFunc;
		 Approx_CurvlinFunc (const Handle_Adaptor3d_HCurve & C,const Standard_Real Tol);
		%feature("autodoc", "	:param C2D:
	:type C2D: Handle_Adaptor2d_HCurve2d &
	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param Tol:
	:type Tol: float
	:rtype: None
") Approx_CurvlinFunc;
		 Approx_CurvlinFunc (const Handle_Adaptor2d_HCurve2d & C2D,const Handle_Adaptor3d_HSurface & S,const Standard_Real Tol);
		%feature("autodoc", "	:param C2D1:
	:type C2D1: Handle_Adaptor2d_HCurve2d &
	:param C2D2:
	:type C2D2: Handle_Adaptor2d_HCurve2d &
	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:param Tol:
	:type Tol: float
	:rtype: None
") Approx_CurvlinFunc;
		 Approx_CurvlinFunc (const Handle_Adaptor2d_HCurve2d & C2D1,const Handle_Adaptor2d_HCurve2d & C2D2,const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_HSurface & S2,const Standard_Real Tol);
		%feature("autodoc", "	* //!---Purpose Update the tolerance to used

	:param Tol:
	:type Tol: float
	:rtype: None
") SetTol;
		void SetTol (const Standard_Real Tol);
		%feature("autodoc", "	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>.  The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "	* if First < 0 or Last > 1

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Trim;
		void Trim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "	* Computes length of the curve.

	:rtype: None
") Length;
		void Length ();
		%feature("autodoc", "	* Computes length of the curve segment.

	:param C:
	:type C: Adaptor3d_Curve &
	:param FirstU:
	:type FirstU: float
	:param LasrU:
	:type LasrU: float
	:rtype: float
") Length;
		Standard_Real Length (Adaptor3d_Curve & C,const Standard_Real FirstU,const Standard_Real LasrU);
		%feature("autodoc", "	:rtype: float
") GetLength;
		Standard_Real GetLength ();
		%feature("autodoc", "	* returns original parameter correponding S. if Case == 1 computation is performed on myC2D1 and mySurf1, otherwise it is done on myC2D2 and mySurf2.

	:param C:
	:type C: Adaptor3d_Curve &
	:param S:
	:type S: float
	:param NumberOfCurve:
	:type NumberOfCurve: Standard_Integer
	:rtype: float
") GetUParameter;
		Standard_Real GetUParameter (Adaptor3d_Curve & C,const Standard_Real S,const Standard_Integer NumberOfCurve);
		%feature("autodoc", "	* returns original parameter correponding S.

	:param U:
	:type U: float
	:rtype: float
") GetSParameter;
		Standard_Real GetSParameter (const Standard_Real U);
		%feature("autodoc", "	* if myCase != 1

	:param S:
	:type S: float
	:param Order:
	:type Order: Standard_Integer
	:param Result:
	:type Result: TColStd_Array1OfReal &
	:rtype: bool
") EvalCase1;
		Standard_Boolean EvalCase1 (const Standard_Real S,const Standard_Integer Order,TColStd_Array1OfReal & Result);
		%feature("autodoc", "	* if myCase != 2

	:param S:
	:type S: float
	:param Order:
	:type Order: Standard_Integer
	:param Result:
	:type Result: TColStd_Array1OfReal &
	:rtype: bool
") EvalCase2;
		Standard_Boolean EvalCase2 (const Standard_Real S,const Standard_Integer Order,TColStd_Array1OfReal & Result);
		%feature("autodoc", "	* if myCase != 3

	:param S:
	:type S: float
	:param Order:
	:type Order: Standard_Integer
	:param Result:
	:type Result: TColStd_Array1OfReal &
	:rtype: bool
") EvalCase3;
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
		%feature("autodoc", "	:param Line:
	:type Line: AppCont_Function &
	:param degreemin: default value is 3
	:type degreemin: Standard_Integer
	:param degreemax: default value is 8
	:type degreemax: Standard_Integer
	:param Tolerance3d: default value is 1.0e-5
	:type Tolerance3d: float
	:param Tolerance2d: default value is 1.0e-5
	:type Tolerance2d: float
	:param cutting: default value is Standard_False
	:type cutting: bool
	:param FirstC: default value is AppParCurves_TangencyPoint
	:type FirstC: AppParCurves_Constraint
	:param LastC: default value is AppParCurves_TangencyPoint
	:type LastC: AppParCurves_Constraint
	:rtype: None
") Approx_FitAndDivide;
		 Approx_FitAndDivide (const AppCont_Function & Line,const Standard_Integer degreemin = 3,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-5,const Standard_Real Tolerance2d = 1.0e-5,const Standard_Boolean cutting = Standard_False,const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint,const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);
		%feature("autodoc", "	:param degreemin: default value is 3
	:type degreemin: Standard_Integer
	:param degreemax: default value is 8
	:type degreemax: Standard_Integer
	:param Tolerance3d: default value is 1.0e-05
	:type Tolerance3d: float
	:param Tolerance2d: default value is 1.0e-05
	:type Tolerance2d: float
	:param cutting: default value is Standard_False
	:type cutting: bool
	:param FirstC: default value is AppParCurves_TangencyPoint
	:type FirstC: AppParCurves_Constraint
	:param LastC: default value is AppParCurves_TangencyPoint
	:type LastC: AppParCurves_Constraint
	:rtype: None
") Approx_FitAndDivide;
		 Approx_FitAndDivide (const Standard_Integer degreemin = 3,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-05,const Standard_Real Tolerance2d = 1.0e-05,const Standard_Boolean cutting = Standard_False,const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint,const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);
		%feature("autodoc", "	:param Line:
	:type Line: AppCont_Function &
	:rtype: None
") Perform;
		void Perform (const AppCont_Function & Line);
		%feature("autodoc", "	:param degreemin:
	:type degreemin: Standard_Integer
	:param degreemax:
	:type degreemax: Standard_Integer
	:rtype: None
") SetDegrees;
		void SetDegrees (const Standard_Integer degreemin,const Standard_Integer degreemax);
		%feature("autodoc", "	:param Tolerance3d:
	:type Tolerance3d: float
	:param Tolerance2d:
	:type Tolerance2d: float
	:rtype: None
") SetTolerances;
		void SetTolerances (const Standard_Real Tolerance3d,const Standard_Real Tolerance2d);
		%feature("autodoc", "	:param FirstC:
	:type FirstC: AppParCurves_Constraint
	:param LastC:
	:type LastC: AppParCurves_Constraint
	:rtype: None
") SetConstraints;
		void SetConstraints (const AppParCurves_Constraint FirstC,const AppParCurves_Constraint LastC);
		%feature("autodoc", "	:rtype: bool
") IsAllApproximated;
		Standard_Boolean IsAllApproximated ();
		%feature("autodoc", "	:rtype: bool
") IsToleranceReached;
		Standard_Boolean IsToleranceReached ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param tol3d:
	:type tol3d: float &
	:param tol2d:
	:type tol2d: float &
	:rtype: None
") Error;
		void Error (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:rtype: int
") NbMultiCurves;
		Standard_Integer NbMultiCurves ();
		%feature("autodoc", "	:param Index: default value is 1
	:type Index: Standard_Integer
	:rtype: AppParCurves_MultiCurve
") Value;
		AppParCurves_MultiCurve Value (const Standard_Integer Index = 1);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param firstp:
	:type firstp: float &
	:param lastp:
	:type lastp: float &
	:rtype: None
") Parameters;
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
		%feature("autodoc", "	:param Line:
	:type Line: AppCont_Function2d &
	:param degreemin: default value is 3
	:type degreemin: Standard_Integer
	:param degreemax: default value is 8
	:type degreemax: Standard_Integer
	:param Tolerance3d: default value is 1.0e-5
	:type Tolerance3d: float
	:param Tolerance2d: default value is 1.0e-5
	:type Tolerance2d: float
	:param cutting: default value is Standard_False
	:type cutting: bool
	:param FirstC: default value is AppParCurves_TangencyPoint
	:type FirstC: AppParCurves_Constraint
	:param LastC: default value is AppParCurves_TangencyPoint
	:type LastC: AppParCurves_Constraint
	:rtype: None
") Approx_FitAndDivide2d;
		 Approx_FitAndDivide2d (const AppCont_Function2d & Line,const Standard_Integer degreemin = 3,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-5,const Standard_Real Tolerance2d = 1.0e-5,const Standard_Boolean cutting = Standard_False,const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint,const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);
		%feature("autodoc", "	:param degreemin: default value is 3
	:type degreemin: Standard_Integer
	:param degreemax: default value is 8
	:type degreemax: Standard_Integer
	:param Tolerance3d: default value is 1.0e-05
	:type Tolerance3d: float
	:param Tolerance2d: default value is 1.0e-05
	:type Tolerance2d: float
	:param cutting: default value is Standard_False
	:type cutting: bool
	:param FirstC: default value is AppParCurves_TangencyPoint
	:type FirstC: AppParCurves_Constraint
	:param LastC: default value is AppParCurves_TangencyPoint
	:type LastC: AppParCurves_Constraint
	:rtype: None
") Approx_FitAndDivide2d;
		 Approx_FitAndDivide2d (const Standard_Integer degreemin = 3,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-05,const Standard_Real Tolerance2d = 1.0e-05,const Standard_Boolean cutting = Standard_False,const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint,const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);
		%feature("autodoc", "	:param Line:
	:type Line: AppCont_Function2d &
	:rtype: None
") Perform;
		void Perform (const AppCont_Function2d & Line);
		%feature("autodoc", "	:param degreemin:
	:type degreemin: Standard_Integer
	:param degreemax:
	:type degreemax: Standard_Integer
	:rtype: None
") SetDegrees;
		void SetDegrees (const Standard_Integer degreemin,const Standard_Integer degreemax);
		%feature("autodoc", "	:param Tolerance3d:
	:type Tolerance3d: float
	:param Tolerance2d:
	:type Tolerance2d: float
	:rtype: None
") SetTolerances;
		void SetTolerances (const Standard_Real Tolerance3d,const Standard_Real Tolerance2d);
		%feature("autodoc", "	:param FirstC:
	:type FirstC: AppParCurves_Constraint
	:param LastC:
	:type LastC: AppParCurves_Constraint
	:rtype: None
") SetConstraints;
		void SetConstraints (const AppParCurves_Constraint FirstC,const AppParCurves_Constraint LastC);
		%feature("autodoc", "	:rtype: bool
") IsAllApproximated;
		Standard_Boolean IsAllApproximated ();
		%feature("autodoc", "	:rtype: bool
") IsToleranceReached;
		Standard_Boolean IsToleranceReached ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param tol3d:
	:type tol3d: float &
	:param tol2d:
	:type tol2d: float &
	:rtype: None
") Error;
		void Error (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:rtype: int
") NbMultiCurves;
		Standard_Integer NbMultiCurves ();
		%feature("autodoc", "	:param Index: default value is 1
	:type Index: Standard_Integer
	:rtype: AppParCurves_MultiCurve
") Value;
		AppParCurves_MultiCurve Value (const Standard_Integer Index = 1);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param firstp:
	:type firstp: float &
	:param lastp:
	:type lastp: float &
	:rtype: None
") Parameters;
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
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Approx_HArray1OfAdHSurface;
		 Approx_HArray1OfAdHSurface (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:param V:
	:type V: Handle_Adaptor3d_HSurface &
	:rtype: None
") Approx_HArray1OfAdHSurface;
		 Approx_HArray1OfAdHSurface (const Standard_Integer Low,const Standard_Integer Up,const Handle_Adaptor3d_HSurface & V);
		%feature("autodoc", "	:param V:
	:type V: Handle_Adaptor3d_HSurface &
	:rtype: None
") Init;
		void Init (const Handle_Adaptor3d_HSurface & V);
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
	:type Value: Handle_Adaptor3d_HSurface &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Adaptor3d_HSurface & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Adaptor3d_HSurface
") Value;
		const Handle_Adaptor3d_HSurface & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Adaptor3d_HSurface
") ChangeValue;
		Handle_Adaptor3d_HSurface & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: Approx_Array1OfAdHSurface
") Array1;
		const Approx_Array1OfAdHSurface & Array1 ();
		%feature("autodoc", "	:rtype: Approx_Array1OfAdHSurface
") ChangeArray1;
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
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Approx_HArray1OfGTrsf2d;
		 Approx_HArray1OfGTrsf2d (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:param V:
	:type V: gp_GTrsf2d
	:rtype: None
") Approx_HArray1OfGTrsf2d;
		 Approx_HArray1OfGTrsf2d (const Standard_Integer Low,const Standard_Integer Up,const gp_GTrsf2d & V);
		%feature("autodoc", "	:param V:
	:type V: gp_GTrsf2d
	:rtype: None
") Init;
		void Init (const gp_GTrsf2d & V);
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
	:type Value: gp_GTrsf2d
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_GTrsf2d & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: gp_GTrsf2d
") Value;
		const gp_GTrsf2d  Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: gp_GTrsf2d
") ChangeValue;
		gp_GTrsf2d  ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: Approx_Array1OfGTrsf2d
") Array1;
		const Approx_Array1OfGTrsf2d & Array1 ();
		%feature("autodoc", "	:rtype: Approx_Array1OfGTrsf2d
") ChangeArray1;
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
		%feature("autodoc", "	:rtype: None
") Approx_MCurvesToBSpCurve;
		 Approx_MCurvesToBSpCurve ();
		%feature("autodoc", "	:rtype: None
") Reset;
		void Reset ();
		%feature("autodoc", "	:param MC:
	:type MC: AppParCurves_MultiCurve &
	:rtype: None
") Append;
		void Append (const AppParCurves_MultiCurve & MC);
		%feature("autodoc", "	:rtype: None
") Perform;
		void Perform ();
		%feature("autodoc", "	:param TheSeq:
	:type TheSeq: AppParCurves_SequenceOfMultiCurve &
	:rtype: None
") Perform;
		void Perform (const AppParCurves_SequenceOfMultiCurve & TheSeq);
		%feature("autodoc", "	* return the composite MultiCurves as a MultiBSpCurve.

	:rtype: AppParCurves_MultiBSpCurve
") Value;
		const AppParCurves_MultiBSpCurve & Value ();
		%feature("autodoc", "	* return the composite MultiCurves as a MultiBSpCurve.

	:rtype: AppParCurves_MultiBSpCurve
") ChangeValue;
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
		%feature("autodoc", "	:param SSP:
	:type SSP: AppCont_Function &
	:param U0:
	:type U0: float
	:param U1:
	:type U1: float
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param Deg:
	:type Deg: Standard_Integer
	:param NbPoints: default value is 24
	:type NbPoints: Standard_Integer
	:rtype: None
") Approx_MyLeastSquareOfFitAndDivide;
		 Approx_MyLeastSquareOfFitAndDivide (const AppCont_Function & SSP,const Standard_Real U0,const Standard_Real U1,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer Deg,const Standard_Integer NbPoints = 24);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: AppParCurves_MultiCurve
") Value;
		const AppParCurves_MultiCurve & Value ();
		%feature("autodoc", "	:param F:
	:type F: float &
	:param MaxE3d:
	:type MaxE3d: float &
	:param MaxE2d:
	:type MaxE2d: float &
	:rtype: None
") Error;
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
		%feature("autodoc", "	:param SSP:
	:type SSP: AppCont_Function2d &
	:param U0:
	:type U0: float
	:param U1:
	:type U1: float
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param Deg:
	:type Deg: Standard_Integer
	:param NbPoints: default value is 24
	:type NbPoints: Standard_Integer
	:rtype: None
") Approx_MyLeastSquareOfFitAndDivide2d;
		 Approx_MyLeastSquareOfFitAndDivide2d (const AppCont_Function2d & SSP,const Standard_Real U0,const Standard_Real U1,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer Deg,const Standard_Integer NbPoints = 24);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: AppParCurves_MultiCurve
") Value;
		const AppParCurves_MultiCurve & Value ();
		%feature("autodoc", "	:param F:
	:type F: float &
	:param MaxE3d:
	:type MaxE3d: float &
	:param MaxE2d:
	:type MaxE2d: float &
	:rtype: None
") Error;
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
		%feature("autodoc", "	* Warning: the C3D and C2D must have the same parametric domain.

	:param C3D:
	:type C3D: Handle_Geom_Curve &
	:param C2D:
	:type C2D: Handle_Geom2d_Curve &
	:param S:
	:type S: Handle_Geom_Surface &
	:param Tol:
	:type Tol: float
	:rtype: None
") Approx_SameParameter;
		 Approx_SameParameter (const Handle_Geom_Curve & C3D,const Handle_Geom2d_Curve & C2D,const Handle_Geom_Surface & S,const Standard_Real Tol);
		%feature("autodoc", "	:param C3D:
	:type C3D: Handle_Adaptor3d_HCurve &
	:param C2D:
	:type C2D: Handle_Geom2d_Curve &
	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param Tol:
	:type Tol: float
	:rtype: None
") Approx_SameParameter;
		 Approx_SameParameter (const Handle_Adaptor3d_HCurve & C3D,const Handle_Geom2d_Curve & C2D,const Handle_Adaptor3d_HSurface & S,const Standard_Real Tol);
		%feature("autodoc", "	* Warning: the C3D and C2D must have the same parametric domain.

	:param C3D:
	:type C3D: Handle_Adaptor3d_HCurve &
	:param C2D:
	:type C2D: Handle_Adaptor2d_HCurve2d &
	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param Tol:
	:type Tol: float
	:rtype: None
") Approx_SameParameter;
		 Approx_SameParameter (const Handle_Adaptor3d_HCurve & C3D,const Handle_Adaptor2d_HCurve2d & C2D,const Handle_Adaptor3d_HSurface & S,const Standard_Real Tol);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: float
") TolReached;
		Standard_Real TolReached ();
		%feature("autodoc", "	* Tells whether the original data had already the same parameter up to the tolerance : in that case nothing is done.

	:rtype: bool
") IsSameParameter;
		Standard_Boolean IsSameParameter ();
		%feature("autodoc", "	* Returns the 2D curve that has the same parameter as the 3D curve once evaluated on the surface up to the specified tolerance

	:rtype: Handle_Geom2d_BSplineCurve
") Curve2d;
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
		%feature("autodoc", "	:param I:
	:type I: Handle_TColStd_HArray1OfReal &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Approx_SequenceNodeOfSequenceOfHArray1OfReal;
		 Approx_SequenceNodeOfSequenceOfHArray1OfReal (const Handle_TColStd_HArray1OfReal & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") Value;
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
		%feature("autodoc", "	:rtype: None
") Approx_SequenceOfHArray1OfReal;
		 Approx_SequenceOfHArray1OfReal ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Approx_SequenceOfHArray1OfReal &
	:rtype: Approx_SequenceOfHArray1OfReal
") Assign;
		const Approx_SequenceOfHArray1OfReal & Assign (const Approx_SequenceOfHArray1OfReal & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Approx_SequenceOfHArray1OfReal &
	:rtype: Approx_SequenceOfHArray1OfReal
") operator=;
		const Approx_SequenceOfHArray1OfReal & operator = (const Approx_SequenceOfHArray1OfReal & Other);
		%feature("autodoc", "	:param T:
	:type T: Handle_TColStd_HArray1OfReal &
	:rtype: None
") Append;
		void Append (const Handle_TColStd_HArray1OfReal & T);
		%feature("autodoc", "	:param S:
	:type S: Approx_SequenceOfHArray1OfReal &
	:rtype: None
") Append;
		void Append (Approx_SequenceOfHArray1OfReal & S);
		%feature("autodoc", "	:param T:
	:type T: Handle_TColStd_HArray1OfReal &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TColStd_HArray1OfReal & T);
		%feature("autodoc", "	:param S:
	:type S: Approx_SequenceOfHArray1OfReal &
	:rtype: None
") Prepend;
		void Prepend (Approx_SequenceOfHArray1OfReal & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_TColStd_HArray1OfReal &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_TColStd_HArray1OfReal & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Approx_SequenceOfHArray1OfReal &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Approx_SequenceOfHArray1OfReal & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_TColStd_HArray1OfReal &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_TColStd_HArray1OfReal & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Approx_SequenceOfHArray1OfReal &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Approx_SequenceOfHArray1OfReal & S);
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") First;
		const Handle_TColStd_HArray1OfReal & First ();
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") Last;
		const Handle_TColStd_HArray1OfReal & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Approx_SequenceOfHArray1OfReal &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Approx_SequenceOfHArray1OfReal & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_TColStd_HArray1OfReal
") Value;
		const Handle_TColStd_HArray1OfReal & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Handle_TColStd_HArray1OfReal &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_TColStd_HArray1OfReal & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_TColStd_HArray1OfReal
") ChangeValue;
		Handle_TColStd_HArray1OfReal & ChangeValue (const Standard_Integer Index);
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
		%feature("autodoc", "	:param Func:
	:type Func: Handle_Approx_SweepFunction &
	:rtype: None
") Approx_SweepApproximation;
		 Approx_SweepApproximation (const Handle_Approx_SweepFunction & Func);
		%feature("autodoc", "	* Perform the Approximation [First, Last] : Approx_SweepApproximation.cdl Tol3d : Tolerance to surface approximation Tol2d : Tolerance used to perform curve approximation  Normaly the 2d curve are approximated with a  tolerance given by the resolution on support surfaces,  but if this tolerance is too large Tol2d is used. TolAngular : Tolerance (in radian) to control the angle  beetween tangents on the section law and  tangent of iso-v on approximed surface Continuity : The continuity in v waiting on the surface Degmax : The maximum degree in v requiered on the surface Segmax : The maximum number of span in v requiered on  the surface Warning : The continuity ci can be obtained only if Ft is Ci

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol3d:
	:type Tol3d: float
	:param BoundTol:
	:type BoundTol: float
	:param Tol2d:
	:type Tol2d: float
	:param TolAngular:
	:type TolAngular: float
	:param Continuity: default value is GeomAbs_C0
	:type Continuity: GeomAbs_Shape
	:param Degmax: default value is 11
	:type Degmax: Standard_Integer
	:param Segmax: default value is 50
	:type Segmax: Standard_Integer
	:rtype: None
") Perform;
		void Perform (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol3d,const Standard_Real BoundTol,const Standard_Real Tol2d,const Standard_Real TolAngular,const GeomAbs_Shape Continuity = GeomAbs_C0,const Standard_Integer Degmax = 11,const Standard_Integer Segmax = 50);
		%feature("autodoc", "	* The EvaluatorFunction from AdvApprox;

	:param Parameter:
	:type Parameter: float
	:param DerivativeRequest:
	:type DerivativeRequest: Standard_Integer
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Result:
	:type Result: float &
	:rtype: int
") Eval;
		Standard_Integer Eval (const Standard_Real Parameter,const Standard_Integer DerivativeRequest,const Standard_Real First,const Standard_Real Last,Standard_Real &OutValue);
		%feature("autodoc", "	* returns if we have an result

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:param UDegree:
	:type UDegree: Standard_Integer &
	:param VDegree:
	:type VDegree: Standard_Integer &
	:param NbUPoles:
	:type NbUPoles: Standard_Integer &
	:param NbVPoles:
	:type NbVPoles: Standard_Integer &
	:param NbUKnots:
	:type NbUKnots: Standard_Integer &
	:param NbVKnots:
	:type NbVKnots: Standard_Integer &
	:rtype: None
") SurfShape;
		void SurfShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	:param TPoles:
	:type TPoles: TColgp_Array2OfPnt
	:param TWeights:
	:type TWeights: TColStd_Array2OfReal &
	:param TUKnots:
	:type TUKnots: TColStd_Array1OfReal &
	:param TVKnots:
	:type TVKnots: TColStd_Array1OfReal &
	:param TUMults:
	:type TUMults: TColStd_Array1OfInteger &
	:param TVMults:
	:type TVMults: TColStd_Array1OfInteger &
	:rtype: None
") Surface;
		void Surface (TColgp_Array2OfPnt & TPoles,TColStd_Array2OfReal & TWeights,TColStd_Array1OfReal & TUKnots,TColStd_Array1OfReal & TVKnots,TColStd_Array1OfInteger & TUMults,TColStd_Array1OfInteger & TVMults);
		%feature("autodoc", "	:rtype: int
") UDegree;
		Standard_Integer UDegree ();
		%feature("autodoc", "	:rtype: int
") VDegree;
		Standard_Integer VDegree ();
		%feature("autodoc", "	:rtype: TColgp_Array2OfPnt
") SurfPoles;
		const TColgp_Array2OfPnt & SurfPoles ();
		%feature("autodoc", "	:rtype: TColStd_Array2OfReal
") SurfWeights;
		const TColStd_Array2OfReal & SurfWeights ();
		%feature("autodoc", "	:rtype: TColStd_Array1OfReal
") SurfUKnots;
		const TColStd_Array1OfReal & SurfUKnots ();
		%feature("autodoc", "	:rtype: TColStd_Array1OfReal
") SurfVKnots;
		const TColStd_Array1OfReal & SurfVKnots ();
		%feature("autodoc", "	:rtype: TColStd_Array1OfInteger
") SurfUMults;
		const TColStd_Array1OfInteger & SurfUMults ();
		%feature("autodoc", "	:rtype: TColStd_Array1OfInteger
") SurfVMults;
		const TColStd_Array1OfInteger & SurfVMults ();
		%feature("autodoc", "	* returns the maximum error in the suface approximation.

	:rtype: float
") MaxErrorOnSurf;
		Standard_Real MaxErrorOnSurf ();
		%feature("autodoc", "	* returns the average error in the suface approximation.

	:rtype: float
") AverageErrorOnSurf;
		Standard_Real AverageErrorOnSurf ();
		%feature("autodoc", "	:rtype: int
") NbCurves2d;
		Standard_Integer NbCurves2d ();
		%feature("autodoc", "	:param Degree:
	:type Degree: Standard_Integer &
	:param NbPoles:
	:type NbPoles: Standard_Integer &
	:param NbKnots:
	:type NbKnots: Standard_Integer &
	:rtype: None
") Curves2dShape;
		void Curves2dShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param TPoles:
	:type TPoles: TColgp_Array1OfPnt2d
	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:param TMults:
	:type TMults: TColStd_Array1OfInteger &
	:rtype: None
") Curve2d;
		void Curve2d (const Standard_Integer Index,TColgp_Array1OfPnt2d & TPoles,TColStd_Array1OfReal & TKnots,TColStd_Array1OfInteger & TMults);
		%feature("autodoc", "	:rtype: int
") Curves2dDegree;
		Standard_Integer Curves2dDegree ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: TColgp_Array1OfPnt2d
") Curve2dPoles;
		const TColgp_Array1OfPnt2d & Curve2dPoles (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: TColStd_Array1OfReal
") Curves2dKnots;
		const TColStd_Array1OfReal & Curves2dKnots ();
		%feature("autodoc", "	:rtype: TColStd_Array1OfInteger
") Curves2dMults;
		const TColStd_Array1OfInteger & Curves2dMults ();
		%feature("autodoc", "	* returns the maximum error of the <Index> 2d curve approximation.

	:param Index:
	:type Index: Standard_Integer
	:rtype: float
") Max2dError;
		Standard_Real Max2dError (const Standard_Integer Index);
		%feature("autodoc", "	* returns the average error of the <Index> 2d curve approximation.

	:param Index:
	:type Index: Standard_Integer
	:rtype: float
") Average2dError;
		Standard_Real Average2dError (const Standard_Integer Index);
		%feature("autodoc", "	* returns the maximum 3d error of the <Index> 2d curve approximation on the Surface.

	:param Index:
	:type Index: Standard_Integer
	:rtype: float
") TolCurveOnSurf;
		Standard_Real TolCurveOnSurf (const Standard_Integer Index);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("autodoc", "	* compute the section for v = param

	:param Param:
	:type Param: float
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: bool
") D0;
		virtual Standard_Boolean D0 (const Standard_Real Param,const Standard_Real First,const Standard_Real Last,TColgp_Array1OfPnt & Poles,TColgp_Array1OfPnt2d & Poles2d,TColStd_Array1OfReal & Weigths);
		%feature("autodoc", "	* compute the first derivative in v direction of the section for v = param Warning : It used only for C1 or C2 aproximation

	:param Param:
	:type Param: float
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param DPoles:
	:type DPoles: TColgp_Array1OfVec
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param DPoles2d:
	:type DPoles2d: TColgp_Array1OfVec2d
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:param DWeigths:
	:type DWeigths: TColStd_Array1OfReal &
	:rtype: bool
") D1;
		virtual Standard_Boolean D1 (const Standard_Real Param,const Standard_Real First,const Standard_Real Last,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths);
		%feature("autodoc", "	* compute the second derivative in v direction of the section for v = param Warning : It used only for C2 aproximation

	:param Param:
	:type Param: float
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param DPoles:
	:type DPoles: TColgp_Array1OfVec
	:param D2Poles:
	:type D2Poles: TColgp_Array1OfVec
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param DPoles2d:
	:type DPoles2d: TColgp_Array1OfVec2d
	:param D2Poles2d:
	:type D2Poles2d: TColgp_Array1OfVec2d
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:param DWeigths:
	:type DWeigths: TColStd_Array1OfReal &
	:param D2Weigths:
	:type D2Weigths: TColStd_Array1OfReal &
	:rtype: bool
") D2;
		virtual Standard_Boolean D2 (const Standard_Real Param,const Standard_Real First,const Standard_Real Last,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfVec & D2Poles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColgp_Array1OfVec2d & D2Poles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths,TColStd_Array1OfReal & D2Weigths);
		%feature("autodoc", "	* get the number of 2d curves to approximate.

	:rtype: int
") Nb2dCurves;
		virtual Standard_Integer Nb2dCurves ();
		%feature("autodoc", "	* get the format of an section

	:param NbPoles:
	:type NbPoles: Standard_Integer &
	:param NbKnots:
	:type NbKnots: Standard_Integer &
	:param Degree:
	:type Degree: Standard_Integer &
	:rtype: void
") SectionShape;
		virtual void SectionShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	* get the Knots of the section

	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:rtype: void
") Knots;
		virtual void Knots (TColStd_Array1OfReal & TKnots);
		%feature("autodoc", "	* get the Multplicities of the section

	:param TMults:
	:type TMults: TColStd_Array1OfInteger &
	:rtype: void
") Mults;
		virtual void Mults (TColStd_Array1OfInteger & TMults);
		%feature("autodoc", "	* Returns if the sections are rationnal or not

	:rtype: bool
") IsRational;
		virtual Standard_Boolean IsRational ();
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>.  The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "	* Sets the bounds of the parametric interval on the fonction This determines the derivatives in these values if the function is not Cn.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: void
") SetInterval;
		virtual void SetInterval (const Standard_Real First,const Standard_Real Last);
		%feature("autodoc", "	* Returns the resolutions in the sub-space 2d <Index> This information is usfull to find an good tolerance in 2d approximation.

	:param Index:
	:type Index: Standard_Integer
	:param Tol:
	:type Tol: float
	:param TolU:
	:type TolU: float &
	:param TolV:
	:type TolV: float &
	:rtype: void
") Resolution;
		virtual void Resolution (const Standard_Integer Index,const Standard_Real Tol,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns the tolerance to reach in approximation to satisfy. BoundTol error at the Boundary AngleTol tangent error at the Boundary (in radian) SurfTol error inside the surface.

	:param BoundTol:
	:type BoundTol: float
	:param SurfTol:
	:type SurfTol: float
	:param AngleTol:
	:type AngleTol: float
	:param Tol3d:
	:type Tol3d: TColStd_Array1OfReal &
	:rtype: void
") GetTolerance;
		virtual void GetTolerance (const Standard_Real BoundTol,const Standard_Real SurfTol,const Standard_Real AngleTol,TColStd_Array1OfReal & Tol3d);
		%feature("autodoc", "	* Is usefull, if (me) have to run numerical algorithm to perform D0, D1 or D2

	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:rtype: void
") SetTolerance;
		virtual void SetTolerance (const Standard_Real Tol3d,const Standard_Real Tol2d);
		%feature("autodoc", "	* Get the barycentre of Surface. An very poor estimation is sufficent. This information is usefull to perform well conditioned rational approximation. Warning: Used only if <self> IsRational

	:rtype: gp_Pnt
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf ();
		%feature("autodoc", "	* Returns the length of the greater section. This information is usefull to G1's control. Warning: With an little value, approximation can be slower.

	:rtype: float
") MaximalSection;
		virtual Standard_Real MaximalSection ();
		%feature("autodoc", "	* Compute the minimal value of weight for each poles in all sections. This information is usefull to control error in rational approximation. Warning: Used only if <self> IsRational

	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: void
") GetMinimalWeight;
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

