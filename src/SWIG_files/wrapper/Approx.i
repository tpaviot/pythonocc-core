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
%module (package="OCC") Approx

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


%include Approx_headers.i


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
		%feature("compactdefaultargs") Approx_Array1OfAdHSurface;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Approx_Array1OfAdHSurface;
		 Approx_Array1OfAdHSurface (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Approx_Array1OfAdHSurface;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Adaptor3d_HSurface &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Approx_Array1OfAdHSurface;
		 Approx_Array1OfAdHSurface (const Handle_Adaptor3d_HSurface & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_Adaptor3d_HSurface &
	:rtype: None
") Init;
		void Init (const Handle_Adaptor3d_HSurface & V);
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
	:type Other: Approx_Array1OfAdHSurface &
	:rtype: Approx_Array1OfAdHSurface
") Assign;
		const Approx_Array1OfAdHSurface & Assign (const Approx_Array1OfAdHSurface & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Approx_Array1OfAdHSurface &
	:rtype: Approx_Array1OfAdHSurface
") operator =;
		const Approx_Array1OfAdHSurface & operator = (const Approx_Array1OfAdHSurface & Other);
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
	:type Value: Handle_Adaptor3d_HSurface &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Adaptor3d_HSurface & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Adaptor3d_HSurface
") Value;
		Handle_Adaptor3d_HSurface Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Adaptor3d_HSurface
") ChangeValue;
		Handle_Adaptor3d_HSurface ChangeValue (const Standard_Integer Index);
};


%extend Approx_Array1OfAdHSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Approx_Array1OfGTrsf2d;
class Approx_Array1OfGTrsf2d {
	public:
		%feature("compactdefaultargs") Approx_Array1OfGTrsf2d;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Approx_Array1OfGTrsf2d;
		 Approx_Array1OfGTrsf2d (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Approx_Array1OfGTrsf2d;
		%feature("autodoc", "	:param Item:
	:type Item: gp_GTrsf2d
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Approx_Array1OfGTrsf2d;
		 Approx_Array1OfGTrsf2d (const gp_GTrsf2d & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_GTrsf2d
	:rtype: None
") Init;
		void Init (const gp_GTrsf2d & V);
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
	:type Other: Approx_Array1OfGTrsf2d &
	:rtype: Approx_Array1OfGTrsf2d
") Assign;
		const Approx_Array1OfGTrsf2d & Assign (const Approx_Array1OfGTrsf2d & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Approx_Array1OfGTrsf2d &
	:rtype: Approx_Array1OfGTrsf2d
") operator =;
		const Approx_Array1OfGTrsf2d & operator = (const Approx_Array1OfGTrsf2d & Other);
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
	:type Value: gp_GTrsf2d
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_GTrsf2d & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_GTrsf2d
") Value;
		const gp_GTrsf2d  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_GTrsf2d
") ChangeValue;
		gp_GTrsf2d  ChangeValue (const Standard_Integer Index);
};


%extend Approx_Array1OfGTrsf2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Approx_Curve2d;
class Approx_Curve2d {
	public:
		%feature("compactdefaultargs") Approx_Curve2d;
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
	:type MaxDegree: int
	:param MaxSegments:
	:type MaxSegments: int
	:rtype: None
") Approx_Curve2d;
		 Approx_Curve2d (const Handle_Adaptor2d_HCurve2d & C2D,const Standard_Real First,const Standard_Real Last,const Standard_Real TolU,const Standard_Real TolV,const GeomAbs_Shape Continuity,const Standard_Integer MaxDegree,const Standard_Integer MaxSegments);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "	:rtype: bool
") HasResult;
		Standard_Boolean HasResult ();
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	:rtype: Handle_Geom2d_BSplineCurve
") Curve;
		Handle_Geom2d_BSplineCurve Curve ();
		%feature("compactdefaultargs") MaxError2dU;
		%feature("autodoc", "	:rtype: float
") MaxError2dU;
		Standard_Real MaxError2dU ();
		%feature("compactdefaultargs") MaxError2dV;
		%feature("autodoc", "	:rtype: float
") MaxError2dV;
		Standard_Real MaxError2dV ();
};


%extend Approx_Curve2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Approx_Curve3d;
class Approx_Curve3d {
	public:
		%feature("compactdefaultargs") Approx_Curve3d;
		%feature("autodoc", "	* Approximation of a curve with respect of the requiered tolerance Tol3D.

	:param Curve:
	:type Curve: Handle_Adaptor3d_HCurve &
	:param Tol3d:
	:type Tol3d: float
	:param Order:
	:type Order: GeomAbs_Shape
	:param MaxSegments:
	:type MaxSegments: int
	:param MaxDegree:
	:type MaxDegree: int
	:rtype: None
") Approx_Curve3d;
		 Approx_Curve3d (const Handle_Adaptor3d_HCurve & Curve,const Standard_Real Tol3d,const GeomAbs_Shape Order,const Standard_Integer MaxSegments,const Standard_Integer MaxDegree);
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	:rtype: Handle_Geom_BSplineCurve
") Curve;
		Handle_Geom_BSplineCurve Curve ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* returns Standard_True if the approximation has been done within requiered tolerance

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "	* returns Standard_True if the approximation did come out with a result that is not NECESSARELY within the required tolerance

	:rtype: bool
") HasResult;
		Standard_Boolean HasResult ();
		%feature("compactdefaultargs") MaxError;
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


%extend Approx_Curve3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Approx_CurveOnSurface;
class Approx_CurveOnSurface {
	public:
		%feature("compactdefaultargs") Approx_CurveOnSurface;
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
	:type MaxDegree: int
	:param MaxSegments:
	:type MaxSegments: int
	:param Only3d: default value is Standard_False
	:type Only3d: bool
	:param Only2d: default value is Standard_False
	:type Only2d: bool
	:rtype: None
") Approx_CurveOnSurface;
		 Approx_CurveOnSurface (const Handle_Adaptor2d_HCurve2d & C2D,const Handle_Adaptor3d_HSurface & Surf,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol,const GeomAbs_Shape Continuity,const Standard_Integer MaxDegree,const Standard_Integer MaxSegments,const Standard_Boolean Only3d = Standard_False,const Standard_Boolean Only2d = Standard_False);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "	:rtype: bool
") HasResult;
		Standard_Boolean HasResult ();
		%feature("compactdefaultargs") Curve3d;
		%feature("autodoc", "	:rtype: Handle_Geom_BSplineCurve
") Curve3d;
		Handle_Geom_BSplineCurve Curve3d ();
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "	:rtype: float
") MaxError3d;
		Standard_Real MaxError3d ();
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "	:rtype: Handle_Geom2d_BSplineCurve
") Curve2d;
		Handle_Geom2d_BSplineCurve Curve2d ();
		%feature("compactdefaultargs") MaxError2dU;
		%feature("autodoc", "	:rtype: float
") MaxError2dU;
		Standard_Real MaxError2dU ();
		%feature("compactdefaultargs") MaxError2dV;
		%feature("autodoc", "	* returns the maximum errors relativly to the U component or the V component of the 2d Curve

	:rtype: float
") MaxError2dV;
		Standard_Real MaxError2dV ();
};


%extend Approx_CurveOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Approx_CurvilinearParameter;
class Approx_CurvilinearParameter {
	public:
		%feature("compactdefaultargs") Approx_CurvilinearParameter;
		%feature("autodoc", "	* case of a free 3D curve

	:param C3D:
	:type C3D: Handle_Adaptor3d_HCurve &
	:param Tol:
	:type Tol: float
	:param Order:
	:type Order: GeomAbs_Shape
	:param MaxDegree:
	:type MaxDegree: int
	:param MaxSegments:
	:type MaxSegments: int
	:rtype: None
") Approx_CurvilinearParameter;
		 Approx_CurvilinearParameter (const Handle_Adaptor3d_HCurve & C3D,const Standard_Real Tol,const GeomAbs_Shape Order,const Standard_Integer MaxDegree,const Standard_Integer MaxSegments);
		%feature("compactdefaultargs") Approx_CurvilinearParameter;
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
	:type MaxDegree: int
	:param MaxSegments:
	:type MaxSegments: int
	:rtype: None
") Approx_CurvilinearParameter;
		 Approx_CurvilinearParameter (const Handle_Adaptor2d_HCurve2d & C2D,const Handle_Adaptor3d_HSurface & Surf,const Standard_Real Tol,const GeomAbs_Shape Order,const Standard_Integer MaxDegree,const Standard_Integer MaxSegments);
		%feature("compactdefaultargs") Approx_CurvilinearParameter;
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
	:type MaxDegree: int
	:param MaxSegments:
	:type MaxSegments: int
	:rtype: None
") Approx_CurvilinearParameter;
		 Approx_CurvilinearParameter (const Handle_Adaptor2d_HCurve2d & C2D1,const Handle_Adaptor3d_HSurface & Surf1,const Handle_Adaptor2d_HCurve2d & C2D2,const Handle_Adaptor3d_HSurface & Surf2,const Standard_Real Tol,const GeomAbs_Shape Order,const Standard_Integer MaxDegree,const Standard_Integer MaxSegments);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "	:rtype: bool
") HasResult;
		Standard_Boolean HasResult ();
		%feature("compactdefaultargs") Curve3d;
		%feature("autodoc", "	* returns the Bspline curve corresponding to the reparametrized 3D curve

	:rtype: Handle_Geom_BSplineCurve
") Curve3d;
		Handle_Geom_BSplineCurve Curve3d ();
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "	* returns the maximum error on the reparametrized 3D curve

	:rtype: float
") MaxError3d;
		Standard_Real MaxError3d ();
		%feature("compactdefaultargs") Curve2d1;
		%feature("autodoc", "	* returns the BsplineCurve representing the reparametrized 2D curve on the first surface (case of a curve on one or two surfaces)

	:rtype: Handle_Geom2d_BSplineCurve
") Curve2d1;
		Handle_Geom2d_BSplineCurve Curve2d1 ();
		%feature("compactdefaultargs") MaxError2d1;
		%feature("autodoc", "	* returns the maximum error on the first reparametrized 2D curve

	:rtype: float
") MaxError2d1;
		Standard_Real MaxError2d1 ();
		%feature("compactdefaultargs") Curve2d2;
		%feature("autodoc", "	* returns the BsplineCurve representing the reparametrized 2D curve on the second surface (case of a curve on two surfaces)

	:rtype: Handle_Geom2d_BSplineCurve
") Curve2d2;
		Handle_Geom2d_BSplineCurve Curve2d2 ();
		%feature("compactdefaultargs") MaxError2d2;
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


%extend Approx_CurvilinearParameter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Approx_CurvlinFunc;
class Approx_CurvlinFunc : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Approx_CurvlinFunc;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param Tol:
	:type Tol: float
	:rtype: None
") Approx_CurvlinFunc;
		 Approx_CurvlinFunc (const Handle_Adaptor3d_HCurve & C,const Standard_Real Tol);
		%feature("compactdefaultargs") Approx_CurvlinFunc;
		%feature("autodoc", "	:param C2D:
	:type C2D: Handle_Adaptor2d_HCurve2d &
	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param Tol:
	:type Tol: float
	:rtype: None
") Approx_CurvlinFunc;
		 Approx_CurvlinFunc (const Handle_Adaptor2d_HCurve2d & C2D,const Handle_Adaptor3d_HSurface & S,const Standard_Real Tol);
		%feature("compactdefaultargs") Approx_CurvlinFunc;
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
		%feature("compactdefaultargs") SetTol;
		%feature("autodoc", "	* ---Purpose Update the tolerance to used

	:param Tol:
	:type Tol: float
	:rtype: None
") SetTol;
		void SetTol (const Standard_Real Tol);
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") Trim;
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
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* Computes length of the curve.

	:rtype: None
") Length;
		void Length ();
		%feature("compactdefaultargs") Length;
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
		%feature("compactdefaultargs") GetLength;
		%feature("autodoc", "	:rtype: float
") GetLength;
		Standard_Real GetLength ();
		%feature("compactdefaultargs") GetUParameter;
		%feature("autodoc", "	* returns original parameter correponding S. if Case == 1 computation is performed on myC2D1 and mySurf1, otherwise it is done on myC2D2 and mySurf2.

	:param C:
	:type C: Adaptor3d_Curve &
	:param S:
	:type S: float
	:param NumberOfCurve:
	:type NumberOfCurve: int
	:rtype: float
") GetUParameter;
		Standard_Real GetUParameter (Adaptor3d_Curve & C,const Standard_Real S,const Standard_Integer NumberOfCurve);
		%feature("compactdefaultargs") GetSParameter;
		%feature("autodoc", "	* returns original parameter correponding S.

	:param U:
	:type U: float
	:rtype: float
") GetSParameter;
		Standard_Real GetSParameter (const Standard_Real U);
		%feature("compactdefaultargs") EvalCase1;
		%feature("autodoc", "	* if myCase != 1

	:param S:
	:type S: float
	:param Order:
	:type Order: int
	:param Result:
	:type Result: TColStd_Array1OfReal &
	:rtype: bool
") EvalCase1;
		Standard_Boolean EvalCase1 (const Standard_Real S,const Standard_Integer Order,TColStd_Array1OfReal & Result);
		%feature("compactdefaultargs") EvalCase2;
		%feature("autodoc", "	* if myCase != 2

	:param S:
	:type S: float
	:param Order:
	:type Order: int
	:param Result:
	:type Result: TColStd_Array1OfReal &
	:rtype: bool
") EvalCase2;
		Standard_Boolean EvalCase2 (const Standard_Real S,const Standard_Integer Order,TColStd_Array1OfReal & Result);
		%feature("compactdefaultargs") EvalCase3;
		%feature("autodoc", "	* if myCase != 3

	:param S:
	:type S: float
	:param Order:
	:type Order: int
	:param Result:
	:type Result: TColStd_Array1OfReal &
	:rtype: bool
") EvalCase3;
		Standard_Boolean EvalCase3 (const Standard_Real S,const Standard_Integer Order,TColStd_Array1OfReal & Result);
};


%extend Approx_CurvlinFunc {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Approx_CurvlinFunc(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Approx_CurvlinFunc::Handle_Approx_CurvlinFunc %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    Approx_CurvlinFunc* _get_reference() {
    return (Approx_CurvlinFunc*)$self->Access();
    }
};

%extend Handle_Approx_CurvlinFunc {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Approx_CurvlinFunc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Approx_FitAndDivide;
class Approx_FitAndDivide {
	public:
		%feature("compactdefaultargs") Approx_FitAndDivide;
		%feature("autodoc", "	:param Line:
	:type Line: AppCont_Function &
	:param degreemin: default value is 3
	:type degreemin: int
	:param degreemax: default value is 8
	:type degreemax: int
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
		%feature("compactdefaultargs") Approx_FitAndDivide;
		%feature("autodoc", "	:param degreemin: default value is 3
	:type degreemin: int
	:param degreemax: default value is 8
	:type degreemax: int
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
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Line:
	:type Line: AppCont_Function &
	:rtype: None
") Perform;
		void Perform (const AppCont_Function & Line);
		%feature("compactdefaultargs") SetDegrees;
		%feature("autodoc", "	:param degreemin:
	:type degreemin: int
	:param degreemax:
	:type degreemax: int
	:rtype: None
") SetDegrees;
		void SetDegrees (const Standard_Integer degreemin,const Standard_Integer degreemax);
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "	:param Tolerance3d:
	:type Tolerance3d: float
	:param Tolerance2d:
	:type Tolerance2d: float
	:rtype: None
") SetTolerances;
		void SetTolerances (const Standard_Real Tolerance3d,const Standard_Real Tolerance2d);
		%feature("compactdefaultargs") SetConstraints;
		%feature("autodoc", "	:param FirstC:
	:type FirstC: AppParCurves_Constraint
	:param LastC:
	:type LastC: AppParCurves_Constraint
	:rtype: None
") SetConstraints;
		void SetConstraints (const AppParCurves_Constraint FirstC,const AppParCurves_Constraint LastC);
		%feature("compactdefaultargs") IsAllApproximated;
		%feature("autodoc", "	:rtype: bool
") IsAllApproximated;
		Standard_Boolean IsAllApproximated ();
		%feature("compactdefaultargs") IsToleranceReached;
		%feature("autodoc", "	:rtype: bool
") IsToleranceReached;
		Standard_Boolean IsToleranceReached ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param tol3d:
	:type tol3d: float &
	:param tol2d:
	:type tol2d: float &
	:rtype: None
") Error;
		void Error (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") NbMultiCurves;
		%feature("autodoc", "	:rtype: int
") NbMultiCurves;
		Standard_Integer NbMultiCurves ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index: default value is 1
	:type Index: int
	:rtype: AppParCurves_MultiCurve
") Value;
		AppParCurves_MultiCurve Value (const Standard_Integer Index = 1);
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param firstp:
	:type firstp: float &
	:param lastp:
	:type lastp: float &
	:rtype: None
") Parameters;
		void Parameters (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend Approx_FitAndDivide {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Approx_FitAndDivide2d;
class Approx_FitAndDivide2d {
	public:
		%feature("compactdefaultargs") Approx_FitAndDivide2d;
		%feature("autodoc", "	:param Line:
	:type Line: AppCont_Function &
	:param degreemin: default value is 3
	:type degreemin: int
	:param degreemax: default value is 8
	:type degreemax: int
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
		 Approx_FitAndDivide2d (const AppCont_Function & Line,const Standard_Integer degreemin = 3,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-5,const Standard_Real Tolerance2d = 1.0e-5,const Standard_Boolean cutting = Standard_False,const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint,const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);
		%feature("compactdefaultargs") Approx_FitAndDivide2d;
		%feature("autodoc", "	:param degreemin: default value is 3
	:type degreemin: int
	:param degreemax: default value is 8
	:type degreemax: int
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
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Line:
	:type Line: AppCont_Function &
	:rtype: None
") Perform;
		void Perform (const AppCont_Function & Line);
		%feature("compactdefaultargs") SetDegrees;
		%feature("autodoc", "	:param degreemin:
	:type degreemin: int
	:param degreemax:
	:type degreemax: int
	:rtype: None
") SetDegrees;
		void SetDegrees (const Standard_Integer degreemin,const Standard_Integer degreemax);
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "	:param Tolerance3d:
	:type Tolerance3d: float
	:param Tolerance2d:
	:type Tolerance2d: float
	:rtype: None
") SetTolerances;
		void SetTolerances (const Standard_Real Tolerance3d,const Standard_Real Tolerance2d);
		%feature("compactdefaultargs") SetConstraints;
		%feature("autodoc", "	:param FirstC:
	:type FirstC: AppParCurves_Constraint
	:param LastC:
	:type LastC: AppParCurves_Constraint
	:rtype: None
") SetConstraints;
		void SetConstraints (const AppParCurves_Constraint FirstC,const AppParCurves_Constraint LastC);
		%feature("compactdefaultargs") IsAllApproximated;
		%feature("autodoc", "	:rtype: bool
") IsAllApproximated;
		Standard_Boolean IsAllApproximated ();
		%feature("compactdefaultargs") IsToleranceReached;
		%feature("autodoc", "	:rtype: bool
") IsToleranceReached;
		Standard_Boolean IsToleranceReached ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param tol3d:
	:type tol3d: float &
	:param tol2d:
	:type tol2d: float &
	:rtype: None
") Error;
		void Error (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") NbMultiCurves;
		%feature("autodoc", "	:rtype: int
") NbMultiCurves;
		Standard_Integer NbMultiCurves ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index: default value is 1
	:type Index: int
	:rtype: AppParCurves_MultiCurve
") Value;
		AppParCurves_MultiCurve Value (const Standard_Integer Index = 1);
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param firstp:
	:type firstp: float &
	:param lastp:
	:type lastp: float &
	:rtype: None
") Parameters;
		void Parameters (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend Approx_FitAndDivide2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Approx_HArray1OfAdHSurface;
class Approx_HArray1OfAdHSurface : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Approx_HArray1OfAdHSurface;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Approx_HArray1OfAdHSurface;
		 Approx_HArray1OfAdHSurface (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Approx_HArray1OfAdHSurface;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_Adaptor3d_HSurface &
	:rtype: None
") Approx_HArray1OfAdHSurface;
		 Approx_HArray1OfAdHSurface (const Standard_Integer Low,const Standard_Integer Up,const Handle_Adaptor3d_HSurface & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_Adaptor3d_HSurface &
	:rtype: None
") Init;
		void Init (const Handle_Adaptor3d_HSurface & V);
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
	:type Value: Handle_Adaptor3d_HSurface &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Adaptor3d_HSurface & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Adaptor3d_HSurface
") Value;
		Handle_Adaptor3d_HSurface Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Adaptor3d_HSurface
") ChangeValue;
		Handle_Adaptor3d_HSurface ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: Approx_Array1OfAdHSurface
") Array1;
		const Approx_Array1OfAdHSurface & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: Approx_Array1OfAdHSurface
") ChangeArray1;
		Approx_Array1OfAdHSurface & ChangeArray1 ();
};


%extend Approx_HArray1OfAdHSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Approx_HArray1OfAdHSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Approx_HArray1OfAdHSurface::Handle_Approx_HArray1OfAdHSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    Approx_HArray1OfAdHSurface* _get_reference() {
    return (Approx_HArray1OfAdHSurface*)$self->Access();
    }
};

%extend Handle_Approx_HArray1OfAdHSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Approx_HArray1OfAdHSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Approx_HArray1OfGTrsf2d;
class Approx_HArray1OfGTrsf2d : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Approx_HArray1OfGTrsf2d;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Approx_HArray1OfGTrsf2d;
		 Approx_HArray1OfGTrsf2d (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Approx_HArray1OfGTrsf2d;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: gp_GTrsf2d
	:rtype: None
") Approx_HArray1OfGTrsf2d;
		 Approx_HArray1OfGTrsf2d (const Standard_Integer Low,const Standard_Integer Up,const gp_GTrsf2d & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_GTrsf2d
	:rtype: None
") Init;
		void Init (const gp_GTrsf2d & V);
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
	:type Value: gp_GTrsf2d
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_GTrsf2d & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_GTrsf2d
") Value;
		const gp_GTrsf2d  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_GTrsf2d
") ChangeValue;
		gp_GTrsf2d  ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: Approx_Array1OfGTrsf2d
") Array1;
		const Approx_Array1OfGTrsf2d & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: Approx_Array1OfGTrsf2d
") ChangeArray1;
		Approx_Array1OfGTrsf2d & ChangeArray1 ();
};


%extend Approx_HArray1OfGTrsf2d {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Approx_HArray1OfGTrsf2d(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Approx_HArray1OfGTrsf2d::Handle_Approx_HArray1OfGTrsf2d %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    Approx_HArray1OfGTrsf2d* _get_reference() {
    return (Approx_HArray1OfGTrsf2d*)$self->Access();
    }
};

%extend Handle_Approx_HArray1OfGTrsf2d {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Approx_HArray1OfGTrsf2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Approx_MCurvesToBSpCurve;
class Approx_MCurvesToBSpCurve {
	public:
		%feature("compactdefaultargs") Approx_MCurvesToBSpCurve;
		%feature("autodoc", "	:rtype: None
") Approx_MCurvesToBSpCurve;
		 Approx_MCurvesToBSpCurve ();
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "	:rtype: None
") Reset;
		void Reset ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param MC:
	:type MC: AppParCurves_MultiCurve &
	:rtype: None
") Append;
		void Append (const AppParCurves_MultiCurve & MC);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:rtype: None
") Perform;
		void Perform ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param TheSeq:
	:type TheSeq: AppParCurves_SequenceOfMultiCurve &
	:rtype: None
") Perform;
		void Perform (const AppParCurves_SequenceOfMultiCurve & TheSeq);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* return the composite MultiCurves as a MultiBSpCurve.

	:rtype: AppParCurves_MultiBSpCurve
") Value;
		const AppParCurves_MultiBSpCurve & Value ();
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	* return the composite MultiCurves as a MultiBSpCurve.

	:rtype: AppParCurves_MultiBSpCurve
") ChangeValue;
		const AppParCurves_MultiBSpCurve & ChangeValue ();
};


%extend Approx_MCurvesToBSpCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Approx_SameParameter;
class Approx_SameParameter {
	public:
		%feature("compactdefaultargs") Approx_SameParameter;
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
		%feature("compactdefaultargs") Approx_SameParameter;
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
		%feature("compactdefaultargs") Approx_SameParameter;
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
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") TolReached;
		%feature("autodoc", "	:rtype: float
") TolReached;
		Standard_Real TolReached ();
		%feature("compactdefaultargs") IsSameParameter;
		%feature("autodoc", "	* Tells whether the original data had already the same parameter up to the tolerance : in that case nothing is done.

	:rtype: bool
") IsSameParameter;
		Standard_Boolean IsSameParameter ();
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "	* Returns the 2D curve that has the same parameter as the 3D curve once evaluated on the surface up to the specified tolerance

	:rtype: Handle_Geom2d_BSplineCurve
") Curve2d;
		Handle_Geom2d_BSplineCurve Curve2d ();
};


%extend Approx_SameParameter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Approx_SequenceNodeOfSequenceOfHArray1OfReal;
class Approx_SequenceNodeOfSequenceOfHArray1OfReal : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Approx_SequenceNodeOfSequenceOfHArray1OfReal;
		%feature("autodoc", "	:param I:
	:type I: Handle_TColStd_HArray1OfReal &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Approx_SequenceNodeOfSequenceOfHArray1OfReal;
		 Approx_SequenceNodeOfSequenceOfHArray1OfReal (const Handle_TColStd_HArray1OfReal & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") Value;
		Handle_TColStd_HArray1OfReal Value ();
};


%extend Approx_SequenceNodeOfSequenceOfHArray1OfReal {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Approx_SequenceNodeOfSequenceOfHArray1OfReal(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Approx_SequenceNodeOfSequenceOfHArray1OfReal::Handle_Approx_SequenceNodeOfSequenceOfHArray1OfReal %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    Approx_SequenceNodeOfSequenceOfHArray1OfReal* _get_reference() {
    return (Approx_SequenceNodeOfSequenceOfHArray1OfReal*)$self->Access();
    }
};

%extend Handle_Approx_SequenceNodeOfSequenceOfHArray1OfReal {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Approx_SequenceNodeOfSequenceOfHArray1OfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Approx_SequenceOfHArray1OfReal;
class Approx_SequenceOfHArray1OfReal : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Approx_SequenceOfHArray1OfReal;
		%feature("autodoc", "	:rtype: None
") Approx_SequenceOfHArray1OfReal;
		 Approx_SequenceOfHArray1OfReal ();
		%feature("compactdefaultargs") Approx_SequenceOfHArray1OfReal;
		%feature("autodoc", "	:param Other:
	:type Other: Approx_SequenceOfHArray1OfReal &
	:rtype: None
") Approx_SequenceOfHArray1OfReal;
		 Approx_SequenceOfHArray1OfReal (const Approx_SequenceOfHArray1OfReal & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Approx_SequenceOfHArray1OfReal &
	:rtype: Approx_SequenceOfHArray1OfReal
") Assign;
		const Approx_SequenceOfHArray1OfReal & Assign (const Approx_SequenceOfHArray1OfReal & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Approx_SequenceOfHArray1OfReal &
	:rtype: Approx_SequenceOfHArray1OfReal
") operator =;
		const Approx_SequenceOfHArray1OfReal & operator = (const Approx_SequenceOfHArray1OfReal & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_TColStd_HArray1OfReal &
	:rtype: None
") Append;
		void Append (const Handle_TColStd_HArray1OfReal & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Approx_SequenceOfHArray1OfReal &
	:rtype: None
") Append;
		void Append (Approx_SequenceOfHArray1OfReal & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_TColStd_HArray1OfReal &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TColStd_HArray1OfReal & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Approx_SequenceOfHArray1OfReal &
	:rtype: None
") Prepend;
		void Prepend (Approx_SequenceOfHArray1OfReal & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_TColStd_HArray1OfReal &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_TColStd_HArray1OfReal & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Approx_SequenceOfHArray1OfReal &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Approx_SequenceOfHArray1OfReal & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_TColStd_HArray1OfReal &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_TColStd_HArray1OfReal & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Approx_SequenceOfHArray1OfReal &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Approx_SequenceOfHArray1OfReal & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") First;
		Handle_TColStd_HArray1OfReal First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") Last;
		Handle_TColStd_HArray1OfReal Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Approx_SequenceOfHArray1OfReal &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Approx_SequenceOfHArray1OfReal & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_TColStd_HArray1OfReal
") Value;
		Handle_TColStd_HArray1OfReal Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_TColStd_HArray1OfReal &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_TColStd_HArray1OfReal & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_TColStd_HArray1OfReal
") ChangeValue;
		Handle_TColStd_HArray1OfReal ChangeValue (const Standard_Integer Index);
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


%extend Approx_SequenceOfHArray1OfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Approx_SweepApproximation;
class Approx_SweepApproximation {
	public:
		%feature("compactdefaultargs") Approx_SweepApproximation;
		%feature("autodoc", "	:param Func:
	:type Func: Handle_Approx_SweepFunction &
	:rtype: None
") Approx_SweepApproximation;
		 Approx_SweepApproximation (const Handle_Approx_SweepFunction & Func);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Perform the Approximation [First, Last] : Approx_SweepApproximation.cdl Tol3d : Tolerance to surface approximation Tol2d : Tolerance used to perform curve approximation Normaly the 2d curve are approximated with a tolerance given by the resolution on support surfaces, but if this tolerance is too large Tol2d is used. TolAngular : Tolerance (in radian) to control the angle beetween tangents on the section law and tangent of iso-v on approximed surface Continuity : The continuity in v waiting on the surface Degmax : The maximum degree in v requiered on the surface Segmax : The maximum number of span in v requiered on the surface Warning : The continuity ci can be obtained only if Ft is Ci

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
	:type Degmax: int
	:param Segmax: default value is 50
	:type Segmax: int
	:rtype: None
") Perform;
		void Perform (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol3d,const Standard_Real BoundTol,const Standard_Real Tol2d,const Standard_Real TolAngular,const GeomAbs_Shape Continuity = GeomAbs_C0,const Standard_Integer Degmax = 11,const Standard_Integer Segmax = 50);
		%feature("compactdefaultargs") Eval;
		%feature("autodoc", "	* The EvaluatorFunction from AdvApprox;

	:param Parameter:
	:type Parameter: float
	:param DerivativeRequest:
	:type DerivativeRequest: int
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Result:
	:type Result: float &
	:rtype: int
") Eval;
		Standard_Integer Eval (const Standard_Real Parameter,const Standard_Integer DerivativeRequest,const Standard_Real First,const Standard_Real Last,Standard_Real &OutValue);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* returns if we have an result

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") SurfShape;
		%feature("autodoc", "	:param UDegree:
	:type UDegree: int &
	:param VDegree:
	:type VDegree: int &
	:param NbUPoles:
	:type NbUPoles: int &
	:param NbVPoles:
	:type NbVPoles: int &
	:param NbUKnots:
	:type NbUKnots: int &
	:param NbVKnots:
	:type NbVKnots: int &
	:rtype: None
") SurfShape;
		void SurfShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Surface;
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
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "	:rtype: int
") UDegree;
		Standard_Integer UDegree ();
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "	:rtype: int
") VDegree;
		Standard_Integer VDegree ();
		%feature("compactdefaultargs") SurfPoles;
		%feature("autodoc", "	:rtype: TColgp_Array2OfPnt
") SurfPoles;
		const TColgp_Array2OfPnt & SurfPoles ();
		%feature("compactdefaultargs") SurfWeights;
		%feature("autodoc", "	:rtype: TColStd_Array2OfReal
") SurfWeights;
		const TColStd_Array2OfReal & SurfWeights ();
		%feature("compactdefaultargs") SurfUKnots;
		%feature("autodoc", "	:rtype: TColStd_Array1OfReal
") SurfUKnots;
		const TColStd_Array1OfReal & SurfUKnots ();
		%feature("compactdefaultargs") SurfVKnots;
		%feature("autodoc", "	:rtype: TColStd_Array1OfReal
") SurfVKnots;
		const TColStd_Array1OfReal & SurfVKnots ();
		%feature("compactdefaultargs") SurfUMults;
		%feature("autodoc", "	:rtype: TColStd_Array1OfInteger
") SurfUMults;
		const TColStd_Array1OfInteger & SurfUMults ();
		%feature("compactdefaultargs") SurfVMults;
		%feature("autodoc", "	:rtype: TColStd_Array1OfInteger
") SurfVMults;
		const TColStd_Array1OfInteger & SurfVMults ();
		%feature("compactdefaultargs") MaxErrorOnSurf;
		%feature("autodoc", "	* returns the maximum error in the suface approximation.

	:rtype: float
") MaxErrorOnSurf;
		Standard_Real MaxErrorOnSurf ();
		%feature("compactdefaultargs") AverageErrorOnSurf;
		%feature("autodoc", "	* returns the average error in the suface approximation.

	:rtype: float
") AverageErrorOnSurf;
		Standard_Real AverageErrorOnSurf ();
		%feature("compactdefaultargs") NbCurves2d;
		%feature("autodoc", "	:rtype: int
") NbCurves2d;
		Standard_Integer NbCurves2d ();
		%feature("compactdefaultargs") Curves2dShape;
		%feature("autodoc", "	:param Degree:
	:type Degree: int &
	:param NbPoles:
	:type NbPoles: int &
	:param NbKnots:
	:type NbKnots: int &
	:rtype: None
") Curves2dShape;
		void Curves2dShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param TPoles:
	:type TPoles: TColgp_Array1OfPnt2d
	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:param TMults:
	:type TMults: TColStd_Array1OfInteger &
	:rtype: None
") Curve2d;
		void Curve2d (const Standard_Integer Index,TColgp_Array1OfPnt2d & TPoles,TColStd_Array1OfReal & TKnots,TColStd_Array1OfInteger & TMults);
		%feature("compactdefaultargs") Curves2dDegree;
		%feature("autodoc", "	:rtype: int
") Curves2dDegree;
		Standard_Integer Curves2dDegree ();
		%feature("compactdefaultargs") Curve2dPoles;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TColgp_Array1OfPnt2d
") Curve2dPoles;
		const TColgp_Array1OfPnt2d & Curve2dPoles (const Standard_Integer Index);
		%feature("compactdefaultargs") Curves2dKnots;
		%feature("autodoc", "	:rtype: TColStd_Array1OfReal
") Curves2dKnots;
		const TColStd_Array1OfReal & Curves2dKnots ();
		%feature("compactdefaultargs") Curves2dMults;
		%feature("autodoc", "	:rtype: TColStd_Array1OfInteger
") Curves2dMults;
		const TColStd_Array1OfInteger & Curves2dMults ();
		%feature("compactdefaultargs") Max2dError;
		%feature("autodoc", "	* returns the maximum error of the <Index> 2d curve approximation.

	:param Index:
	:type Index: int
	:rtype: float
") Max2dError;
		Standard_Real Max2dError (const Standard_Integer Index);
		%feature("compactdefaultargs") Average2dError;
		%feature("autodoc", "	* returns the average error of the <Index> 2d curve approximation.

	:param Index:
	:type Index: int
	:rtype: float
") Average2dError;
		Standard_Real Average2dError (const Standard_Integer Index);
		%feature("compactdefaultargs") TolCurveOnSurf;
		%feature("autodoc", "	* returns the maximum 3d error of the <Index> 2d curve approximation on the Surface.

	:param Index:
	:type Index: int
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


%extend Approx_SweepApproximation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Approx_SweepFunction;
class Approx_SweepFunction : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") D0;
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
		%feature("compactdefaultargs") D1;
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
		%feature("compactdefaultargs") D2;
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
		%feature("compactdefaultargs") Nb2dCurves;
		%feature("autodoc", "	* get the number of 2d curves to approximate.

	:rtype: int
") Nb2dCurves;
		virtual Standard_Integer Nb2dCurves ();
		%feature("compactdefaultargs") SectionShape;
		%feature("autodoc", "	* get the format of an section

	:param NbPoles:
	:type NbPoles: int &
	:param NbKnots:
	:type NbKnots: int &
	:param Degree:
	:type Degree: int &
	:rtype: void
") SectionShape;
		virtual void SectionShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "	* get the Knots of the section

	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:rtype: void
") Knots;
		virtual void Knots (TColStd_Array1OfReal & TKnots);
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "	* get the Multplicities of the section

	:param TMults:
	:type TMults: TColStd_Array1OfInteger &
	:rtype: void
") Mults;
		virtual void Mults (TColStd_Array1OfInteger & TMults);
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "	* Returns if the sections are rationnal or not

	:rtype: bool
") IsRational;
		virtual Standard_Boolean IsRational ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "	* Sets the bounds of the parametric interval on the fonction This determines the derivatives in these values if the function is not Cn.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: void
") SetInterval;
		virtual void SetInterval (const Standard_Real First,const Standard_Real Last);
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	* Returns the resolutions in the sub-space 2d <Index> This information is usfull to find an good tolerance in 2d approximation.

	:param Index:
	:type Index: int
	:param Tol:
	:type Tol: float
	:param TolU:
	:type TolU: float &
	:param TolV:
	:type TolV: float &
	:rtype: void
") Resolution;
		virtual void Resolution (const Standard_Integer Index,const Standard_Real Tol,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetTolerance;
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
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	* Is usefull, if (me) have to run numerical algorithm to perform D0, D1 or D2

	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:rtype: void
") SetTolerance;
		virtual void SetTolerance (const Standard_Real Tol3d,const Standard_Real Tol2d);
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "	* Get the barycentre of Surface. An very poor estimation is sufficent. This information is usefull to perform well conditioned rational approximation. Warning: Used only if <self> IsRational

	:rtype: gp_Pnt
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf ();
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "	* Returns the length of the greater section. This information is usefull to G1's control. Warning: With an little value, approximation can be slower.

	:rtype: float
") MaximalSection;
		virtual Standard_Real MaximalSection ();
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "	* Compute the minimal value of weight for each poles in all sections. This information is usefull to control error in rational approximation. Warning: Used only if <self> IsRational

	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: void
") GetMinimalWeight;
		virtual void GetMinimalWeight (TColStd_Array1OfReal & Weigths);
};


%extend Approx_SweepFunction {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Approx_SweepFunction(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Approx_SweepFunction::Handle_Approx_SweepFunction %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    Approx_SweepFunction* _get_reference() {
    return (Approx_SweepFunction*)$self->Access();
    }
};

%extend Handle_Approx_SweepFunction {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Approx_SweepFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
