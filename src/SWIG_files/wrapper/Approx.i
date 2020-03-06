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
%define APPROXDOCSTRING
"Approx module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_approx.html"
%enddef
%module (package="OCC.Core", docstring=APPROXDOCSTRING) Approx


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
#include<Approx_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColStd_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<GeomAbs_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom_module.hxx>
#include<AppCont_module.hxx>
#include<AppParCurves_module.hxx>
#include<TColgp_module.hxx>
#include<gp_module.hxx>
#include<FEmTool_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColStd.i
%import Adaptor3d.i
%import Adaptor2d.i
%import GeomAbs.i
%import Geom2d.i
%import Geom.i
%import AppCont.i
%import AppParCurves.i
%import TColgp.i
%import gp.i

%pythoncode {
from OCC.Core.Exception import *
};

/* public enums */
enum Approx_Status {
	Approx_PointsAdded = 0,
	Approx_NoPointsAdded = 1,
	Approx_NoApproximation = 2,
};

enum Approx_ParametrizationType {
	Approx_ChordLength = 0,
	Approx_Centripetal = 1,
	Approx_IsoParametric = 2,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class Approx_Status:
	Approx_PointsAdded = 0
	Approx_NoPointsAdded = 1
	Approx_NoApproximation = 2

class Approx_ParametrizationType:
	Approx_ChordLength = 0
	Approx_Centripetal = 1
	Approx_IsoParametric = 2
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Approx_CurvlinFunc)
%wrap_handle(Approx_SweepFunction)
%wrap_handle(Approx_HArray1OfGTrsf2d)
%wrap_handle(Approx_HArray1OfAdHSurface)
/* end handles declaration */

/* templates */
%template(Approx_Array1OfAdHSurface) NCollection_Array1<opencascade::handle<Adaptor3d_HSurface>>;

%extend NCollection_Array1<opencascade::handle<Adaptor3d_HSurface>> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(Approx_Array1OfGTrsf2d) NCollection_Array1<gp_GTrsf2d>;

%extend NCollection_Array1<gp_GTrsf2d> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(Approx_SequenceOfHArray1OfReal) NCollection_Sequence<opencascade::handle<TColStd_HArray1OfReal>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<opencascade::handle<Adaptor3d_HSurface>> Approx_Array1OfAdHSurface;
typedef NCollection_Array1<gp_GTrsf2d> Approx_Array1OfGTrsf2d;
typedef NCollection_Sequence<opencascade::handle<TColStd_HArray1OfReal>> Approx_SequenceOfHArray1OfReal;
/* end typedefs declaration */

/***********************
* class Approx_Curve2d *
***********************/
class Approx_Curve2d {
	public:
		/****************** Approx_Curve2d ******************/
		%feature("compactdefaultargs") Approx_Curve2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
C2D: Adaptor2d_HCurve2d
First: float
Last: float
TolU: float
TolV: float
Continuity: GeomAbs_Shape
MaxDegree: int
MaxSegments: int

Returns
-------
None
") Approx_Curve2d;
		 Approx_Curve2d(const opencascade::handle<Adaptor2d_HCurve2d> & C2D, const Standard_Real First, const Standard_Real Last, const Standard_Real TolU, const Standard_Real TolV, const GeomAbs_Shape Continuity, const Standard_Integer MaxDegree, const Standard_Integer MaxSegments);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") Curve;
		opencascade::handle<Geom2d_BSplineCurve> Curve();

		/****************** HasResult ******************/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasResult;
		Standard_Boolean HasResult();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** MaxError2dU ******************/
		%feature("compactdefaultargs") MaxError2dU;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") MaxError2dU;
		Standard_Real MaxError2dU();

		/****************** MaxError2dV ******************/
		%feature("compactdefaultargs") MaxError2dV;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") MaxError2dV;
		Standard_Real MaxError2dV();

};


%extend Approx_Curve2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Approx_Curve3d *
***********************/
class Approx_Curve3d {
	public:
		/****************** Approx_Curve3d ******************/
		%feature("compactdefaultargs") Approx_Curve3d;
		%feature("autodoc", "Approximation of a curve with respect of the requiered tolerance tol3d.

Parameters
----------
Curve: Adaptor3d_HCurve
Tol3d: float
Order: GeomAbs_Shape
MaxSegments: int
MaxDegree: int

Returns
-------
None
") Approx_Curve3d;
		 Approx_Curve3d(const opencascade::handle<Adaptor3d_HCurve> & Curve, const Standard_Real Tol3d, const GeomAbs_Shape Order, const Standard_Integer MaxSegments, const Standard_Integer MaxDegree);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") Curve;
		opencascade::handle<Geom_BSplineCurve> Curve();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** HasResult ******************/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Returns standard_true if the approximation did come out with a result that is not necessarely within the required tolerance.

Returns
-------
bool
") HasResult;
		Standard_Boolean HasResult();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns standard_true if the approximation has been done within requiered tolerance.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** MaxError ******************/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "Returns the maximum error (>0 when an approximation has been done, 0 if no approximation).

Returns
-------
float
") MaxError;
		Standard_Real MaxError();

};


%extend Approx_Curve3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Approx_CurveOnSurface *
******************************/
class Approx_CurveOnSurface {
	public:
		/****************** Approx_CurveOnSurface ******************/
		%feature("compactdefaultargs") Approx_CurveOnSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
C2D: Adaptor2d_HCurve2d
Surf: Adaptor3d_HSurface
First: float
Last: float
Tol: float
Continuity: GeomAbs_Shape
MaxDegree: int
MaxSegments: int
Only3d: bool,optional
	default value is Standard_False
Only2d: bool,optional
	default value is Standard_False

Returns
-------
None
") Approx_CurveOnSurface;
		 Approx_CurveOnSurface(const opencascade::handle<Adaptor2d_HCurve2d> & C2D, const opencascade::handle<Adaptor3d_HSurface> & Surf, const Standard_Real First, const Standard_Real Last, const Standard_Real Tol, const GeomAbs_Shape Continuity, const Standard_Integer MaxDegree, const Standard_Integer MaxSegments, const Standard_Boolean Only3d = Standard_False, const Standard_Boolean Only2d = Standard_False);

		/****************** Curve2d ******************/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") Curve2d;
		opencascade::handle<Geom2d_BSplineCurve> Curve2d();

		/****************** Curve3d ******************/
		%feature("compactdefaultargs") Curve3d;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") Curve3d;
		opencascade::handle<Geom_BSplineCurve> Curve3d();

		/****************** HasResult ******************/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasResult;
		Standard_Boolean HasResult();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** MaxError2dU ******************/
		%feature("compactdefaultargs") MaxError2dU;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") MaxError2dU;
		Standard_Real MaxError2dU();

		/****************** MaxError2dV ******************/
		%feature("compactdefaultargs") MaxError2dV;
		%feature("autodoc", "Returns the maximum errors relativly to the u component or the v component of the 2d curve.

Returns
-------
float
") MaxError2dV;
		Standard_Real MaxError2dV();

		/****************** MaxError3d ******************/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") MaxError3d;
		Standard_Real MaxError3d();

};


%extend Approx_CurveOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class Approx_CurvilinearParameter *
************************************/
class Approx_CurvilinearParameter {
	public:
		/****************** Approx_CurvilinearParameter ******************/
		%feature("compactdefaultargs") Approx_CurvilinearParameter;
		%feature("autodoc", "Case of a free 3d curve.

Parameters
----------
C3D: Adaptor3d_HCurve
Tol: float
Order: GeomAbs_Shape
MaxDegree: int
MaxSegments: int

Returns
-------
None
") Approx_CurvilinearParameter;
		 Approx_CurvilinearParameter(const opencascade::handle<Adaptor3d_HCurve> & C3D, const Standard_Real Tol, const GeomAbs_Shape Order, const Standard_Integer MaxDegree, const Standard_Integer MaxSegments);

		/****************** Approx_CurvilinearParameter ******************/
		%feature("compactdefaultargs") Approx_CurvilinearParameter;
		%feature("autodoc", "Case of a curve on one surface.

Parameters
----------
C2D: Adaptor2d_HCurve2d
Surf: Adaptor3d_HSurface
Tol: float
Order: GeomAbs_Shape
MaxDegree: int
MaxSegments: int

Returns
-------
None
") Approx_CurvilinearParameter;
		 Approx_CurvilinearParameter(const opencascade::handle<Adaptor2d_HCurve2d> & C2D, const opencascade::handle<Adaptor3d_HSurface> & Surf, const Standard_Real Tol, const GeomAbs_Shape Order, const Standard_Integer MaxDegree, const Standard_Integer MaxSegments);

		/****************** Approx_CurvilinearParameter ******************/
		%feature("compactdefaultargs") Approx_CurvilinearParameter;
		%feature("autodoc", "Case of a curve on two surfaces.

Parameters
----------
C2D1: Adaptor2d_HCurve2d
Surf1: Adaptor3d_HSurface
C2D2: Adaptor2d_HCurve2d
Surf2: Adaptor3d_HSurface
Tol: float
Order: GeomAbs_Shape
MaxDegree: int
MaxSegments: int

Returns
-------
None
") Approx_CurvilinearParameter;
		 Approx_CurvilinearParameter(const opencascade::handle<Adaptor2d_HCurve2d> & C2D1, const opencascade::handle<Adaptor3d_HSurface> & Surf1, const opencascade::handle<Adaptor2d_HCurve2d> & C2D2, const opencascade::handle<Adaptor3d_HSurface> & Surf2, const Standard_Real Tol, const GeomAbs_Shape Order, const Standard_Integer MaxDegree, const Standard_Integer MaxSegments);

		/****************** Curve2d1 ******************/
		%feature("compactdefaultargs") Curve2d1;
		%feature("autodoc", "Returns the bsplinecurve representing the reparametrized 2d curve on the first surface (case of a curve on one or two surfaces).

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") Curve2d1;
		opencascade::handle<Geom2d_BSplineCurve> Curve2d1();

		/****************** Curve2d2 ******************/
		%feature("compactdefaultargs") Curve2d2;
		%feature("autodoc", "Returns the bsplinecurve representing the reparametrized 2d curve on the second surface (case of a curve on two surfaces).

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") Curve2d2;
		opencascade::handle<Geom2d_BSplineCurve> Curve2d2();

		/****************** Curve3d ******************/
		%feature("compactdefaultargs") Curve3d;
		%feature("autodoc", "Returns the bspline curve corresponding to the reparametrized 3d curve.

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") Curve3d;
		opencascade::handle<Geom_BSplineCurve> Curve3d();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** HasResult ******************/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasResult;
		Standard_Boolean HasResult();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** MaxError2d1 ******************/
		%feature("compactdefaultargs") MaxError2d1;
		%feature("autodoc", "Returns the maximum error on the first reparametrized 2d curve.

Returns
-------
float
") MaxError2d1;
		Standard_Real MaxError2d1();

		/****************** MaxError2d2 ******************/
		%feature("compactdefaultargs") MaxError2d2;
		%feature("autodoc", "Returns the maximum error on the second reparametrized 2d curve.

Returns
-------
float
") MaxError2d2;
		Standard_Real MaxError2d2();

		/****************** MaxError3d ******************/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Returns the maximum error on the reparametrized 3d curve.

Returns
-------
float
") MaxError3d;
		Standard_Real MaxError3d();

};


%extend Approx_CurvilinearParameter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Approx_CurvlinFunc *
***************************/
class Approx_CurvlinFunc : public Standard_Transient {
	public:
		/****************** Approx_CurvlinFunc ******************/
		%feature("compactdefaultargs") Approx_CurvlinFunc;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_HCurve
Tol: float

Returns
-------
None
") Approx_CurvlinFunc;
		 Approx_CurvlinFunc(const opencascade::handle<Adaptor3d_HCurve> & C, const Standard_Real Tol);

		/****************** Approx_CurvlinFunc ******************/
		%feature("compactdefaultargs") Approx_CurvlinFunc;
		%feature("autodoc", "No available documentation.

Parameters
----------
C2D: Adaptor2d_HCurve2d
S: Adaptor3d_HSurface
Tol: float

Returns
-------
None
") Approx_CurvlinFunc;
		 Approx_CurvlinFunc(const opencascade::handle<Adaptor2d_HCurve2d> & C2D, const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Real Tol);

		/****************** Approx_CurvlinFunc ******************/
		%feature("compactdefaultargs") Approx_CurvlinFunc;
		%feature("autodoc", "No available documentation.

Parameters
----------
C2D1: Adaptor2d_HCurve2d
C2D2: Adaptor2d_HCurve2d
S1: Adaptor3d_HSurface
S2: Adaptor3d_HSurface
Tol: float

Returns
-------
None
") Approx_CurvlinFunc;
		 Approx_CurvlinFunc(const opencascade::handle<Adaptor2d_HCurve2d> & C2D1, const opencascade::handle<Adaptor2d_HCurve2d> & C2D2, const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_HSurface> & S2, const Standard_Real Tol);

		/****************** EvalCase1 ******************/
		%feature("compactdefaultargs") EvalCase1;
		%feature("autodoc", "If mycase != 1.

Parameters
----------
S: float
Order: int
Result: TColStd_Array1OfReal

Returns
-------
bool
") EvalCase1;
		Standard_Boolean EvalCase1(const Standard_Real S, const Standard_Integer Order, TColStd_Array1OfReal & Result);

		/****************** EvalCase2 ******************/
		%feature("compactdefaultargs") EvalCase2;
		%feature("autodoc", "If mycase != 2.

Parameters
----------
S: float
Order: int
Result: TColStd_Array1OfReal

Returns
-------
bool
") EvalCase2;
		Standard_Boolean EvalCase2(const Standard_Real S, const Standard_Integer Order, TColStd_Array1OfReal & Result);

		/****************** EvalCase3 ******************/
		%feature("compactdefaultargs") EvalCase3;
		%feature("autodoc", "If mycase != 3.

Parameters
----------
S: float
Order: int
Result: TColStd_Array1OfReal

Returns
-------
bool
") EvalCase3;
		Standard_Boolean EvalCase3(const Standard_Real S, const Standard_Integer Order, TColStd_Array1OfReal & Result);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** GetLength ******************/
		%feature("compactdefaultargs") GetLength;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") GetLength;
		Standard_Real GetLength();

		/****************** GetSParameter ******************/
		%feature("compactdefaultargs") GetSParameter;
		%feature("autodoc", "Returns original parameter correponding s.

Parameters
----------
U: float

Returns
-------
float
") GetSParameter;
		Standard_Real GetSParameter(const Standard_Real U);

		/****************** GetUParameter ******************/
		%feature("compactdefaultargs") GetUParameter;
		%feature("autodoc", "Returns original parameter correponding s. if case == 1 computation is performed on myc2d1 and mysurf1, otherwise it is done on myc2d2 and mysurf2.

Parameters
----------
C: Adaptor3d_Curve
S: float
NumberOfCurve: int

Returns
-------
float
") GetUParameter;
		Standard_Real GetUParameter(Adaptor3d_Curve & C, const Standard_Real S, const Standard_Integer NumberOfCurve);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes length of the curve.

Returns
-------
None
") Length;
		void Length();

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes length of the curve segment.

Parameters
----------
C: Adaptor3d_Curve
FirstU: float
LasrU: float

Returns
-------
float
") Length;
		Standard_Real Length(Adaptor3d_Curve & C, const Standard_Real FirstU, const Standard_Real LasrU);

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** SetTol ******************/
		%feature("compactdefaultargs") SetTol;
		%feature("autodoc", "---purpose update the tolerance to used.

Parameters
----------
Tol: float

Returns
-------
None
") SetTol;
		void SetTol(const Standard_Real Tol);

		/****************** Trim ******************/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "If first < 0 or last > 1.

Parameters
----------
First: float
Last: float
Tol: float

Returns
-------
None
") Trim;
		void Trim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

};


%make_alias(Approx_CurvlinFunc)

%extend Approx_CurvlinFunc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Approx_FitAndDivide *
****************************/
class Approx_FitAndDivide {
	public:
		/****************** Approx_FitAndDivide ******************/
		%feature("compactdefaultargs") Approx_FitAndDivide;
		%feature("autodoc", "The multiline <line> will be approximated until tolerances will be reached. the approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is true.

Parameters
----------
Line: AppCont_Function
degreemin: int,optional
	default value is 3
degreemax: int,optional
	default value is 8
Tolerance3d: float,optional
	default value is 1.0e-5
Tolerance2d: float,optional
	default value is 1.0e-5
cutting: bool,optional
	default value is Standard_False
FirstC: AppParCurves_Constraint,optional
	default value is AppParCurves_TangencyPoint
LastC: AppParCurves_Constraint,optional
	default value is AppParCurves_TangencyPoint

Returns
-------
None
") Approx_FitAndDivide;
		 Approx_FitAndDivide(const AppCont_Function & Line, const Standard_Integer degreemin = 3, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-5, const Standard_Real Tolerance2d = 1.0e-5, const Standard_Boolean cutting = Standard_False, const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint, const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);

		/****************** Approx_FitAndDivide ******************/
		%feature("compactdefaultargs") Approx_FitAndDivide;
		%feature("autodoc", "Initializes the fields of the algorithm.

Parameters
----------
degreemin: int,optional
	default value is 3
degreemax: int,optional
	default value is 8
Tolerance3d: float,optional
	default value is 1.0e-05
Tolerance2d: float,optional
	default value is 1.0e-05
cutting: bool,optional
	default value is Standard_False
FirstC: AppParCurves_Constraint,optional
	default value is AppParCurves_TangencyPoint
LastC: AppParCurves_Constraint,optional
	default value is AppParCurves_TangencyPoint

Returns
-------
None
") Approx_FitAndDivide;
		 Approx_FitAndDivide(const Standard_Integer degreemin = 3, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-05, const Standard_Real Tolerance2d = 1.0e-05, const Standard_Boolean cutting = Standard_False, const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint, const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns the tolerances 2d and 3d of the <index> multicurve.

Parameters
----------
Index: int

Returns
-------
tol3d: float
tol2d: float
") Error;
		void Error(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** IsAllApproximated ******************/
		%feature("compactdefaultargs") IsAllApproximated;
		%feature("autodoc", "Returns false if at a moment of the approximation, the status noapproximation has been sent by the user when more points were needed.

Returns
-------
bool
") IsAllApproximated;
		Standard_Boolean IsAllApproximated();

		/****************** IsToleranceReached ******************/
		%feature("compactdefaultargs") IsToleranceReached;
		%feature("autodoc", "Returns false if the status nopointsadded has been sent.

Returns
-------
bool
") IsToleranceReached;
		Standard_Boolean IsToleranceReached();

		/****************** NbMultiCurves ******************/
		%feature("compactdefaultargs") NbMultiCurves;
		%feature("autodoc", "Returns the number of multicurve doing the approximation of the multiline.

Returns
-------
int
") NbMultiCurves;
		Standard_Integer NbMultiCurves();

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
firstp: float
lastp: float
") Parameters;
		void Parameters(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Runs the algorithm after having initialized the fields.

Parameters
----------
Line: AppCont_Function

Returns
-------
None
") Perform;
		void Perform(const AppCont_Function & Line);

		/****************** SetConstraints ******************/
		%feature("compactdefaultargs") SetConstraints;
		%feature("autodoc", "Changes the constraints of the approximation.

Parameters
----------
FirstC: AppParCurves_Constraint
LastC: AppParCurves_Constraint

Returns
-------
None
") SetConstraints;
		void SetConstraints(const AppParCurves_Constraint FirstC, const AppParCurves_Constraint LastC);

		/****************** SetDegrees ******************/
		%feature("compactdefaultargs") SetDegrees;
		%feature("autodoc", "Changes the degrees of the approximation.

Parameters
----------
degreemin: int
degreemax: int

Returns
-------
None
") SetDegrees;
		void SetDegrees(const Standard_Integer degreemin, const Standard_Integer degreemax);

		/****************** SetInvOrder ******************/
		%feature("compactdefaultargs") SetInvOrder;
		%feature("autodoc", "Set inverse order of degree selection: if theinvordr = true, current degree is chosen by inverse order - from maxdegree to mindegree. by default inverse order is used.

Parameters
----------
theInvOrder: bool

Returns
-------
None
") SetInvOrder;
		void SetInvOrder(const Standard_Boolean theInvOrder);

		/****************** SetMaxSegments ******************/
		%feature("compactdefaultargs") SetMaxSegments;
		%feature("autodoc", "Changes the max number of segments, which is allowed for cutting.

Parameters
----------
theMaxSegments: int

Returns
-------
None
") SetMaxSegments;
		void SetMaxSegments(const Standard_Integer theMaxSegments);

		/****************** SetTolerances ******************/
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "Changes the tolerances of the approximation.

Parameters
----------
Tolerance3d: float
Tolerance2d: float

Returns
-------
None
") SetTolerances;
		void SetTolerances(const Standard_Real Tolerance3d, const Standard_Real Tolerance2d);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the approximation multicurve of range <index>.

Parameters
----------
Index: int,optional
	default value is 1

Returns
-------
AppParCurves_MultiCurve
") Value;
		AppParCurves_MultiCurve Value(const Standard_Integer Index = 1);

};


%extend Approx_FitAndDivide {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Approx_FitAndDivide2d *
******************************/
class Approx_FitAndDivide2d {
	public:
		/****************** Approx_FitAndDivide2d ******************/
		%feature("compactdefaultargs") Approx_FitAndDivide2d;
		%feature("autodoc", "The multiline <line> will be approximated until tolerances will be reached. the approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is true.

Parameters
----------
Line: AppCont_Function
degreemin: int,optional
	default value is 3
degreemax: int,optional
	default value is 8
Tolerance3d: float,optional
	default value is 1.0e-5
Tolerance2d: float,optional
	default value is 1.0e-5
cutting: bool,optional
	default value is Standard_False
FirstC: AppParCurves_Constraint,optional
	default value is AppParCurves_TangencyPoint
LastC: AppParCurves_Constraint,optional
	default value is AppParCurves_TangencyPoint

Returns
-------
None
") Approx_FitAndDivide2d;
		 Approx_FitAndDivide2d(const AppCont_Function & Line, const Standard_Integer degreemin = 3, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-5, const Standard_Real Tolerance2d = 1.0e-5, const Standard_Boolean cutting = Standard_False, const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint, const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);

		/****************** Approx_FitAndDivide2d ******************/
		%feature("compactdefaultargs") Approx_FitAndDivide2d;
		%feature("autodoc", "Initializes the fields of the algorithm.

Parameters
----------
degreemin: int,optional
	default value is 3
degreemax: int,optional
	default value is 8
Tolerance3d: float,optional
	default value is 1.0e-05
Tolerance2d: float,optional
	default value is 1.0e-05
cutting: bool,optional
	default value is Standard_False
FirstC: AppParCurves_Constraint,optional
	default value is AppParCurves_TangencyPoint
LastC: AppParCurves_Constraint,optional
	default value is AppParCurves_TangencyPoint

Returns
-------
None
") Approx_FitAndDivide2d;
		 Approx_FitAndDivide2d(const Standard_Integer degreemin = 3, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-05, const Standard_Real Tolerance2d = 1.0e-05, const Standard_Boolean cutting = Standard_False, const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint, const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns the tolerances 2d and 3d of the <index> multicurve.

Parameters
----------
Index: int

Returns
-------
tol3d: float
tol2d: float
") Error;
		void Error(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** IsAllApproximated ******************/
		%feature("compactdefaultargs") IsAllApproximated;
		%feature("autodoc", "Returns false if at a moment of the approximation, the status noapproximation has been sent by the user when more points were needed.

Returns
-------
bool
") IsAllApproximated;
		Standard_Boolean IsAllApproximated();

		/****************** IsToleranceReached ******************/
		%feature("compactdefaultargs") IsToleranceReached;
		%feature("autodoc", "Returns false if the status nopointsadded has been sent.

Returns
-------
bool
") IsToleranceReached;
		Standard_Boolean IsToleranceReached();

		/****************** NbMultiCurves ******************/
		%feature("compactdefaultargs") NbMultiCurves;
		%feature("autodoc", "Returns the number of multicurve doing the approximation of the multiline.

Returns
-------
int
") NbMultiCurves;
		Standard_Integer NbMultiCurves();

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
firstp: float
lastp: float
") Parameters;
		void Parameters(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Runs the algorithm after having initialized the fields.

Parameters
----------
Line: AppCont_Function

Returns
-------
None
") Perform;
		void Perform(const AppCont_Function & Line);

		/****************** SetConstraints ******************/
		%feature("compactdefaultargs") SetConstraints;
		%feature("autodoc", "Changes the constraints of the approximation.

Parameters
----------
FirstC: AppParCurves_Constraint
LastC: AppParCurves_Constraint

Returns
-------
None
") SetConstraints;
		void SetConstraints(const AppParCurves_Constraint FirstC, const AppParCurves_Constraint LastC);

		/****************** SetDegrees ******************/
		%feature("compactdefaultargs") SetDegrees;
		%feature("autodoc", "Changes the degrees of the approximation.

Parameters
----------
degreemin: int
degreemax: int

Returns
-------
None
") SetDegrees;
		void SetDegrees(const Standard_Integer degreemin, const Standard_Integer degreemax);

		/****************** SetInvOrder ******************/
		%feature("compactdefaultargs") SetInvOrder;
		%feature("autodoc", "Set inverse order of degree selection: if theinvordr = true, current degree is chosen by inverse order - from maxdegree to mindegree. by default inverse order is used.

Parameters
----------
theInvOrder: bool

Returns
-------
None
") SetInvOrder;
		void SetInvOrder(const Standard_Boolean theInvOrder);

		/****************** SetMaxSegments ******************/
		%feature("compactdefaultargs") SetMaxSegments;
		%feature("autodoc", "Changes the max number of segments, which is allowed for cutting.

Parameters
----------
theMaxSegments: int

Returns
-------
None
") SetMaxSegments;
		void SetMaxSegments(const Standard_Integer theMaxSegments);

		/****************** SetTolerances ******************/
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "Changes the tolerances of the approximation.

Parameters
----------
Tolerance3d: float
Tolerance2d: float

Returns
-------
None
") SetTolerances;
		void SetTolerances(const Standard_Real Tolerance3d, const Standard_Real Tolerance2d);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the approximation multicurve of range <index>.

Parameters
----------
Index: int,optional
	default value is 1

Returns
-------
AppParCurves_MultiCurve
") Value;
		AppParCurves_MultiCurve Value(const Standard_Integer Index = 1);

};


%extend Approx_FitAndDivide2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Approx_MCurvesToBSpCurve *
*********************************/
class Approx_MCurvesToBSpCurve {
	public:
		/****************** Approx_MCurvesToBSpCurve ******************/
		%feature("compactdefaultargs") Approx_MCurvesToBSpCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Approx_MCurvesToBSpCurve;
		 Approx_MCurvesToBSpCurve();

		/****************** Append ******************/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "No available documentation.

Parameters
----------
MC: AppParCurves_MultiCurve

Returns
-------
None
") Append;
		void Append(const AppParCurves_MultiCurve & MC);

		/****************** ChangeValue ******************/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "Return the composite multicurves as a multibspcurve.

Returns
-------
AppParCurves_MultiBSpCurve
") ChangeValue;
		const AppParCurves_MultiBSpCurve & ChangeValue();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Perform;
		void Perform();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
TheSeq: AppParCurves_SequenceOfMultiCurve

Returns
-------
None
") Perform;
		void Perform(const AppParCurves_SequenceOfMultiCurve & TheSeq);

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Reset;
		void Reset();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return the composite multicurves as a multibspcurve.

Returns
-------
AppParCurves_MultiBSpCurve
") Value;
		const AppParCurves_MultiBSpCurve & Value();

};


%extend Approx_MCurvesToBSpCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Approx_SameParameter *
*****************************/
class Approx_SameParameter {
	public:
		/****************** Approx_SameParameter ******************/
		%feature("compactdefaultargs") Approx_SameParameter;
		%feature("autodoc", "Warning: the c3d and c2d must have the same parametric domain.

Parameters
----------
C3D: Geom_Curve
C2D: Geom2d_Curve
S: Geom_Surface
Tol: float

Returns
-------
None
") Approx_SameParameter;
		 Approx_SameParameter(const opencascade::handle<Geom_Curve> & C3D, const opencascade::handle<Geom2d_Curve> & C2D, const opencascade::handle<Geom_Surface> & S, const Standard_Real Tol);

		/****************** Approx_SameParameter ******************/
		%feature("compactdefaultargs") Approx_SameParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C3D: Adaptor3d_HCurve
C2D: Geom2d_Curve
S: Adaptor3d_HSurface
Tol: float

Returns
-------
None
") Approx_SameParameter;
		 Approx_SameParameter(const opencascade::handle<Adaptor3d_HCurve> & C3D, const opencascade::handle<Geom2d_Curve> & C2D, const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Real Tol);

		/****************** Approx_SameParameter ******************/
		%feature("compactdefaultargs") Approx_SameParameter;
		%feature("autodoc", "Warning: the c3d and c2d must have the same parametric domain.

Parameters
----------
C3D: Adaptor3d_HCurve
C2D: Adaptor2d_HCurve2d
S: Adaptor3d_HSurface
Tol: float

Returns
-------
None
") Approx_SameParameter;
		 Approx_SameParameter(const opencascade::handle<Adaptor3d_HCurve> & C3D, const opencascade::handle<Adaptor2d_HCurve2d> & C2D, const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Real Tol);

		/****************** Curve2d ******************/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "Returns the 2d curve that has the same parameter as the 3d curve once evaluated on the surface up to the specified tolerance.

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") Curve2d;
		opencascade::handle<Geom2d_BSplineCurve> Curve2d();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsSameParameter ******************/
		%feature("compactdefaultargs") IsSameParameter;
		%feature("autodoc", "Tells whether the original data had already the same parameter up to the tolerance : in that case nothing is done.

Returns
-------
bool
") IsSameParameter;
		Standard_Boolean IsSameParameter();

		/****************** TolReached ******************/
		%feature("compactdefaultargs") TolReached;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") TolReached;
		Standard_Real TolReached();

};


%extend Approx_SameParameter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Approx_SweepApproximation *
**********************************/
class Approx_SweepApproximation {
	public:
		/****************** Approx_SweepApproximation ******************/
		%feature("compactdefaultargs") Approx_SweepApproximation;
		%feature("autodoc", "No available documentation.

Parameters
----------
Func: Approx_SweepFunction

Returns
-------
None
") Approx_SweepApproximation;
		 Approx_SweepApproximation(const opencascade::handle<Approx_SweepFunction> & Func);

		/****************** Average2dError ******************/
		%feature("compactdefaultargs") Average2dError;
		%feature("autodoc", "Returns the average error of the <index> 2d curve approximation.

Parameters
----------
Index: int

Returns
-------
float
") Average2dError;
		Standard_Real Average2dError(const Standard_Integer Index);

		/****************** AverageErrorOnSurf ******************/
		%feature("compactdefaultargs") AverageErrorOnSurf;
		%feature("autodoc", "Returns the average error in the suface approximation.

Returns
-------
float
") AverageErrorOnSurf;
		Standard_Real AverageErrorOnSurf();

		/****************** Curve2d ******************/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int
TPoles: TColgp_Array1OfPnt2d
TKnots: TColStd_Array1OfReal
TMults: TColStd_Array1OfInteger

Returns
-------
None
") Curve2d;
		void Curve2d(const Standard_Integer Index, TColgp_Array1OfPnt2d & TPoles, TColStd_Array1OfReal & TKnots, TColStd_Array1OfInteger & TMults);

		/****************** Curve2dPoles ******************/
		%feature("compactdefaultargs") Curve2dPoles;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
TColgp_Array1OfPnt2d
") Curve2dPoles;
		const TColgp_Array1OfPnt2d & Curve2dPoles(const Standard_Integer Index);

		/****************** Curves2dDegree ******************/
		%feature("compactdefaultargs") Curves2dDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Curves2dDegree;
		Standard_Integer Curves2dDegree();

		/****************** Curves2dKnots ******************/
		%feature("compactdefaultargs") Curves2dKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") Curves2dKnots;
		const TColStd_Array1OfReal & Curves2dKnots();

		/****************** Curves2dMults ******************/
		%feature("compactdefaultargs") Curves2dMults;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") Curves2dMults;
		const TColStd_Array1OfInteger & Curves2dMults();

		/****************** Curves2dShape ******************/
		%feature("compactdefaultargs") Curves2dShape;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
Degree: int
NbPoles: int
NbKnots: int
") Curves2dShape;
		void Curves2dShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Eval ******************/
		%feature("compactdefaultargs") Eval;
		%feature("autodoc", "The evaluatorfunction from advapprox;.

Parameters
----------
Parameter: float
DerivativeRequest: int
First: float
Last: float

Returns
-------
Result: float
") Eval;
		Standard_Integer Eval(const Standard_Real Parameter, const Standard_Integer DerivativeRequest, const Standard_Real First, const Standard_Real Last, Standard_Real &OutValue);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns if we have an result.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Max2dError ******************/
		%feature("compactdefaultargs") Max2dError;
		%feature("autodoc", "Returns the maximum error of the <index> 2d curve approximation.

Parameters
----------
Index: int

Returns
-------
float
") Max2dError;
		Standard_Real Max2dError(const Standard_Integer Index);

		/****************** MaxErrorOnSurf ******************/
		%feature("compactdefaultargs") MaxErrorOnSurf;
		%feature("autodoc", "Returns the maximum error in the suface approximation.

Returns
-------
float
") MaxErrorOnSurf;
		Standard_Real MaxErrorOnSurf();

		/****************** NbCurves2d ******************/
		%feature("compactdefaultargs") NbCurves2d;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbCurves2d;
		Standard_Integer NbCurves2d();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Perform the approximation [first, last] : approx_sweepapproximation.cdl tol3d : tolerance to surface approximation tol2d : tolerance used to perform curve approximation normaly the 2d curve are approximated with a tolerance given by the resolution on support surfaces, but if this tolerance is too large tol2d is used. tolangular : tolerance (in radian) to control the angle beetween tangents on the section law and tangent of iso-v on approximed surface continuity : the continuity in v waiting on the surface degmax : the maximum degree in v requiered on the surface segmax : the maximum number of span in v requiered on the surface warning : the continuity ci can be obtained only if ft is ci.

Parameters
----------
First: float
Last: float
Tol3d: float
BoundTol: float
Tol2d: float
TolAngular: float
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C0
Degmax: int,optional
	default value is 11
Segmax: int,optional
	default value is 50

Returns
-------
None
") Perform;
		void Perform(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol3d, const Standard_Real BoundTol, const Standard_Real Tol2d, const Standard_Real TolAngular, const GeomAbs_Shape Continuity = GeomAbs_C0, const Standard_Integer Degmax = 11, const Standard_Integer Segmax = 50);

		/****************** SurfPoles ******************/
		%feature("compactdefaultargs") SurfPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
TColgp_Array2OfPnt
") SurfPoles;
		const TColgp_Array2OfPnt & SurfPoles();

		/****************** SurfShape ******************/
		%feature("compactdefaultargs") SurfShape;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
UDegree: int
VDegree: int
NbUPoles: int
NbVPoles: int
NbUKnots: int
NbVKnots: int
") SurfShape;
		void SurfShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** SurfUKnots ******************/
		%feature("compactdefaultargs") SurfUKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") SurfUKnots;
		const TColStd_Array1OfReal & SurfUKnots();

		/****************** SurfUMults ******************/
		%feature("compactdefaultargs") SurfUMults;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") SurfUMults;
		const TColStd_Array1OfInteger & SurfUMults();

		/****************** SurfVKnots ******************/
		%feature("compactdefaultargs") SurfVKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") SurfVKnots;
		const TColStd_Array1OfReal & SurfVKnots();

		/****************** SurfVMults ******************/
		%feature("compactdefaultargs") SurfVMults;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") SurfVMults;
		const TColStd_Array1OfInteger & SurfVMults();

		/****************** SurfWeights ******************/
		%feature("compactdefaultargs") SurfWeights;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array2OfReal
") SurfWeights;
		const TColStd_Array2OfReal & SurfWeights();

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Parameters
----------
TPoles: TColgp_Array2OfPnt
TWeights: TColStd_Array2OfReal
TUKnots: TColStd_Array1OfReal
TVKnots: TColStd_Array1OfReal
TUMults: TColStd_Array1OfInteger
TVMults: TColStd_Array1OfInteger

Returns
-------
None
") Surface;
		void Surface(TColgp_Array2OfPnt & TPoles, TColStd_Array2OfReal & TWeights, TColStd_Array1OfReal & TUKnots, TColStd_Array1OfReal & TVKnots, TColStd_Array1OfInteger & TUMults, TColStd_Array1OfInteger & TVMults);

		/****************** TolCurveOnSurf ******************/
		%feature("compactdefaultargs") TolCurveOnSurf;
		%feature("autodoc", "Returns the maximum 3d error of the <index> 2d curve approximation on the surface.

Parameters
----------
Index: int

Returns
-------
float
") TolCurveOnSurf;
		Standard_Real TolCurveOnSurf(const Standard_Integer Index);

		/****************** UDegree ******************/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") UDegree;
		Standard_Integer UDegree();

		/****************** VDegree ******************/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") VDegree;
		Standard_Integer VDegree();

};


%extend Approx_SweepApproximation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Approx_SweepFunction *
*****************************/
%nodefaultctor Approx_SweepFunction;
class Approx_SweepFunction : public Standard_Transient {
	public:
		/****************** BarycentreOfSurf ******************/
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "Get the barycentre of surface. an very poor estimation is sufficent. this information is usefull to perform well conditioned rational approximation. warning: used only if <self> isrational.

Returns
-------
gp_Pnt
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Compute the section for v = param.

Parameters
----------
Param: float
First: float
Last: float
Poles: TColgp_Array1OfPnt
Poles2d: TColgp_Array1OfPnt2d
Weigths: TColStd_Array1OfReal

Returns
-------
bool
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, const Standard_Real First, const Standard_Real Last, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Compute the first derivative in v direction of the section for v = param warning : it used only for c1 or c2 aproximation.

Parameters
----------
Param: float
First: float
Last: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Returns
-------
bool
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, const Standard_Real First, const Standard_Real Last, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Compute the second derivative in v direction of the section for v = param warning : it used only for c2 aproximation.

Parameters
----------
Param: float
First: float
Last: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
D2Poles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
D2Poles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal
D2Weigths: TColStd_Array1OfReal

Returns
-------
bool
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, const Standard_Real First, const Standard_Real Last, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****************** GetMinimalWeight ******************/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "Compute the minimal value of weight for each poles in all sections. this information is usefull to control error in rational approximation. warning: used only if <self> isrational.

Parameters
----------
Weigths: TColStd_Array1OfReal

Returns
-------
None
") GetMinimalWeight;
		virtual void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns the tolerance to reach in approximation to satisfy. boundtol error at the boundary angletol tangent error at the boundary (in radian) surftol error inside the surface.

Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: TColStd_Array1OfReal

Returns
-------
None
") GetTolerance;
		virtual void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, TColStd_Array1OfReal & Tol3d);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the sections are rationnal or not.

Returns
-------
bool
") IsRational;
		virtual Standard_Boolean IsRational();

		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "Get the knots of the section.

Parameters
----------
TKnots: TColStd_Array1OfReal

Returns
-------
None
") Knots;
		virtual void Knots(TColStd_Array1OfReal & TKnots);

		/****************** MaximalSection ******************/
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "Returns the length of the greater section. this information is usefull to g1's control. warning: with an little value, approximation can be slower.

Returns
-------
float
") MaximalSection;
		virtual Standard_Real MaximalSection();

		/****************** Mults ******************/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "Get the multplicities of the section.

Parameters
----------
TMults: TColStd_Array1OfInteger

Returns
-------
None
") Mults;
		virtual void Mults(TColStd_Array1OfInteger & TMults);

		/****************** Nb2dCurves ******************/
		%feature("compactdefaultargs") Nb2dCurves;
		%feature("autodoc", "Get the number of 2d curves to approximate.

Returns
-------
int
") Nb2dCurves;
		virtual Standard_Integer Nb2dCurves();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Returns the resolutions in the sub-space 2d <index> this information is usfull to find an good tolerance in 2d approximation.

Parameters
----------
Index: int
Tol: float

Returns
-------
TolU: float
TolV: float
") Resolution;
		virtual void Resolution(const Standard_Integer Index, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SectionShape ******************/
		%feature("compactdefaultargs") SectionShape;
		%feature("autodoc", "Get the format of an section.

Parameters
----------

Returns
-------
NbPoles: int
NbKnots: int
Degree: int
") SectionShape;
		virtual void SectionShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** SetInterval ******************/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "Sets the bounds of the parametric interval on the fonction this determines the derivatives in these values if the function is not cn.

Parameters
----------
First: float
Last: float

Returns
-------
None
") SetInterval;
		virtual void SetInterval(const Standard_Real First, const Standard_Real Last);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Is usefull, if (me) have to run numerical algorithm to perform d0, d1 or d2.

Parameters
----------
Tol3d: float
Tol2d: float

Returns
-------
None
") SetTolerance;
		virtual void SetTolerance(const Standard_Real Tol3d, const Standard_Real Tol2d);

};


%make_alias(Approx_SweepFunction)

%extend Approx_SweepFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
class Approx_HArray1OfGTrsf2d : public  Approx_Array1OfGTrsf2d, public Standard_Transient {
  public:
    Approx_HArray1OfGTrsf2d(const Standard_Integer theLower, const Standard_Integer theUpper);
    Approx_HArray1OfGTrsf2d(const Standard_Integer theLower, const Standard_Integer theUpper, const  Approx_Array1OfGTrsf2d::value_type& theValue);
    Approx_HArray1OfGTrsf2d(const  Approx_Array1OfGTrsf2d& theOther);
    const  Approx_Array1OfGTrsf2d& Array1();
     Approx_Array1OfGTrsf2d& ChangeArray1();
};
%make_alias(Approx_HArray1OfGTrsf2d)


class Approx_HArray1OfAdHSurface : public  Approx_Array1OfAdHSurface, public Standard_Transient {
  public:
    Approx_HArray1OfAdHSurface(const Standard_Integer theLower, const Standard_Integer theUpper);
    Approx_HArray1OfAdHSurface(const Standard_Integer theLower, const Standard_Integer theUpper, const  Approx_Array1OfAdHSurface::value_type& theValue);
    Approx_HArray1OfAdHSurface(const  Approx_Array1OfAdHSurface& theOther);
    const  Approx_Array1OfAdHSurface& Array1();
     Approx_Array1OfAdHSurface& ChangeArray1();
};
%make_alias(Approx_HArray1OfAdHSurface)


/* harray2 classes */
/* hsequence classes */
