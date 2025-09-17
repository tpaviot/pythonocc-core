/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
%define LAWDOCSTRING
"Law module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_law.html"
%enddef
%module (package="OCC.Core", docstring=LAWDOCSTRING) Law


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<Law_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColStd_module.hxx>
#include<Adaptor3d_module.hxx>
#include<GeomAbs_module.hxx>
#include<TColgp_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
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
%import GeomAbs.i
%import TColgp.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Law_BSpline)
%wrap_handle(Law_Function)
%wrap_handle(Law_BSpFunc)
%wrap_handle(Law_Composite)
%wrap_handle(Law_Constant)
%wrap_handle(Law_Linear)
%wrap_handle(Law_Interpol)
%wrap_handle(Law_S)
/* end handles declaration */

/* templates */
%template(Law_Laws) NCollection_List<opencascade::handle<Law_Function>>;

%extend NCollection_List<opencascade::handle<Law_Function>> {
    %pythoncode {
    def __len__(self):
        return self.Size()

    def __iter__(self):
        it = Law_ListIteratorOfLaws(self.this)
        while it.More():
            it.Next()
    }
};
%template(Law_ListIteratorOfLaws) NCollection_TListIterator<opencascade::handle<Law_Function>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_List<opencascade::handle<Law_Function>> Law_Laws;
typedef NCollection_List<opencascade::handle<Law_Function>>::Iterator Law_ListIteratorOfLaws;
/* end typedefs declaration */

/************
* class Law *
************/
%rename(law) Law;
class Law {
	public:
		/****** Law::MixBnd ******/
		/****** md5 signature: 7b19fad347c0d1fb788bcd0778c9990d ******/
		%feature("compactdefaultargs") MixBnd;
		%feature("autodoc", "
Parameters
----------
Lin: Law_Linear

Return
-------
opencascade::handle<Law_BSpFunc>

Description
-----------
This algorithm searches the knot values corresponding to the splitting of a given B-spline law into several arcs with the same continuity. The continuity order is given at the construction time. Builds a 1d bspline that is near from Lin with null derivatives at the extremities.
") MixBnd;
		static opencascade::handle<Law_BSpFunc> MixBnd(const opencascade::handle<Law_Linear> & Lin);

		/****** Law::MixBnd ******/
		/****** md5 signature: f4ebbbb1512aebec0517f3dcee67804c ******/
		%feature("compactdefaultargs") MixBnd;
		%feature("autodoc", "
Parameters
----------
Degree: int
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
Lin: Law_Linear

Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Builds the poles of the 1d bspline that is near from Lin with null derivatives at the extremities.
") MixBnd;
		static opencascade::handle<TColStd_HArray1OfReal> MixBnd(const Standard_Integer Degree, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const opencascade::handle<Law_Linear> & Lin);

		/****** Law::MixTgt ******/
		/****** md5 signature: 3c3be1a2329c3b1f6f1e9955082e3637 ******/
		%feature("compactdefaultargs") MixTgt;
		%feature("autodoc", "
Parameters
----------
Degree: int
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
NulOnTheRight: bool
Index: int

Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Builds the poles of the 1d bspline that is null on the right side of Knots(Index) (on the left if NulOnTheRight is false) and that is like a t*(1-t)(1-t) curve on the left side of Knots(Index) (on the right if NulOnTheRight is false). The result curve is C1 with a derivative equal to 1. at first parameter (-1 at last parameter if NulOnTheRight is false). Warning: Mults(Index) must greater or equal to degree-1.
") MixTgt;
		static opencascade::handle<TColStd_HArray1OfReal> MixTgt(const Standard_Integer Degree, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Boolean NulOnTheRight, const Standard_Integer Index);

		/****** Law::Reparametrize ******/
		/****** md5 signature: d8ce157352bbb7210496c72ebb0ca89a ******/
		%feature("compactdefaultargs") Reparametrize;
		%feature("autodoc", "
Parameters
----------
Curve: Adaptor3d_Curve
First: float
Last: float
HasDF: bool
HasDL: bool
DFirst: float
DLast: float
Rev: bool
NbPoints: int

Return
-------
opencascade::handle<Law_BSpline>

Description
-----------
Computes a 1 d curve to reparametrize a curve. Its an interpolation of NbPoints points calculated at quasi constant abscissa.
") Reparametrize;
		static opencascade::handle<Law_BSpline> Reparametrize(const Adaptor3d_Curve & Curve, const Standard_Real First, const Standard_Real Last, const Standard_Boolean HasDF, const Standard_Boolean HasDL, const Standard_Real DFirst, const Standard_Real DLast, const Standard_Boolean Rev, const Standard_Integer NbPoints);

		/****** Law::Scale ******/
		/****** md5 signature: 15578153ee4c6edba1973e48746e0103 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float
HasF: bool
HasL: bool
VFirst: float
VLast: float

Return
-------
opencascade::handle<Law_BSpline>

Description
-----------
Computes a 1 d curve to scale a field of tangency. Value is 1. for t = (First+Last)/2 . If HasFirst value for t = First is VFirst (null derivative). If HasLast value for t = Last is VLast (null derivative). //! 1.  _ _/ \_ __/ \__ / VFirst ____/ VLast \____ First  Last.
") Scale;
		static opencascade::handle<Law_BSpline> Scale(const Standard_Real First, const Standard_Real Last, const Standard_Boolean HasF, const Standard_Boolean HasL, const Standard_Real VFirst, const Standard_Real VLast);

		/****** Law::ScaleCub ******/
		/****** md5 signature: f589f77f5b3767d16190d156ce4168ce ******/
		%feature("compactdefaultargs") ScaleCub;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float
HasF: bool
HasL: bool
VFirst: float
VLast: float

Return
-------
opencascade::handle<Law_BSpline>

Description
-----------
No available documentation.
") ScaleCub;
		static opencascade::handle<Law_BSpline> ScaleCub(const Standard_Real First, const Standard_Real Last, const Standard_Boolean HasF, const Standard_Boolean HasL, const Standard_Real VFirst, const Standard_Real VLast);

};


%extend Law {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Law_BSpline *
********************/
class Law_BSpline : public Standard_Transient {
	public:
		/****** Law_BSpline::Law_BSpline ******/
		/****** md5 signature: ddcf66ff074044c630f9815ef36c3709 ******/
		%feature("compactdefaultargs") Law_BSpline;
		%feature("autodoc", "
Parameters
----------
Poles: TColStd_Array1OfReal
Knots: TColStd_Array1OfReal
Multiplicities: TColStd_Array1OfInteger
Degree: int
Periodic: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creates a non-rational B_spline curve on the basis <Knots, Multiplicities> of degree <Degree>.
") Law_BSpline;
		 Law_BSpline(const TColStd_Array1OfReal & Poles, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Multiplicities, const Standard_Integer Degree, const Standard_Boolean Periodic = Standard_False);

		/****** Law_BSpline::Law_BSpline ******/
		/****** md5 signature: ffdefda1db70319179b16969eba3b8af ******/
		%feature("compactdefaultargs") Law_BSpline;
		%feature("autodoc", "
Parameters
----------
Poles: TColStd_Array1OfReal
Weights: TColStd_Array1OfReal
Knots: TColStd_Array1OfReal
Multiplicities: TColStd_Array1OfInteger
Degree: int
Periodic: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creates a rational B_spline curve on the basis <Knots, Multiplicities> of degree <Degree>.
") Law_BSpline;
		 Law_BSpline(const TColStd_Array1OfReal & Poles, const TColStd_Array1OfReal & Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Multiplicities, const Standard_Integer Degree, const Standard_Boolean Periodic = Standard_False);

		/****** Law_BSpline::Continuity ******/
		/****** md5 signature: 4cc571878c66d538aeaf8b0affec3574 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns the global continuity of the curve: C0: only geometric continuity, C1: continuity of the first derivative all along the Curve, C2: continuity of the second derivative all along the Curve, C3: continuity of the third derivative all along the Curve, CN: the order of continuity is infinite. For a B-spline curve of degree d if a knot Ui has a multiplicity p the B-spline curve is only Cd-p continuous at Ui. So the global continuity of the curve can't be greater than Cd-p where p is the maximum multiplicity of the interior Knots. In the interior of a knot span the curve is infinitely continuously differentiable.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** Law_BSpline::Copy ******/
		/****** md5 signature: 7ac2d4f22e6a079e0e3da1e93c86f351 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Law_BSpline>

Description
-----------
No available documentation.
") Copy;
		opencascade::handle<Law_BSpline> Copy();

		/****** Law_BSpline::D0 ******/
		/****** md5 signature: 8dc4872a7316c94eced3e3171a95b737 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
P: float

Description
-----------
No available documentation.
") D0;
		void D0(const Standard_Real U, Standard_Real &OutValue);

		/****** Law_BSpline::D1 ******/
		/****** md5 signature: 296f870b71d08a28799b64ebc8e9c26a ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
P: float
V1: float

Description
-----------
No available documentation.
") D1;
		void D1(const Standard_Real U, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_BSpline::D2 ******/
		/****** md5 signature: b850fde0eb081baf40cbf7814dd7bf8f ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
P: float
V1: float
V2: float

Description
-----------
No available documentation.
") D2;
		void D2(const Standard_Real U, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_BSpline::D3 ******/
		/****** md5 signature: 7358c85b1707a9a2454f8b96bf5a1da9 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
P: float
V1: float
V2: float
V3: float

Description
-----------
No available documentation.
") D3;
		void D3(const Standard_Real U, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_BSpline::DN ******/
		/****** md5 signature: 7d4e6133389371147f74e8105126fd89 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
N: int

Return
-------
float

Description
-----------
The following functions computes the point of parameter U and the derivatives at this point on the B-spline curve arc defined between the knot FromK1 and the knot ToK2. U can be out of bounds [Knot (FromK1), Knot (ToK2)] but for the computation we only use the definition of the curve between these two knots. This method is useful to compute local derivative, if the order of continuity of the whole curve is not greater enough. Inside the parametric domain Knot (FromK1), Knot (ToK2) the evaluations are the same as if we consider the whole definition of the curve. Of course the evaluations are different outside this parametric domain.
") DN;
		Standard_Real DN(const Standard_Real U, const Standard_Integer N);

		/****** Law_BSpline::Degree ******/
		/****** md5 signature: e3276df1ce733e2c8e940db548a26d03 ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Computation of value and derivatives.
") Degree;
		Standard_Integer Degree();

		/****** Law_BSpline::EndPoint ******/
		/****** md5 signature: aa1a5c447cb485ee6b7184fe9697a0de ******/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the last point of the curve. Warnings: The last point of the curve is different from the last pole of the curve if the multiplicity of the last knot is lower than Degree.
") EndPoint;
		Standard_Real EndPoint();

		/****** Law_BSpline::FirstParameter ******/
		/****** md5 signature: 4ccedbaad83be904f510b4760c75f69c ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the parametric value of the start point of the curve. It is a knot value.
") FirstParameter;
		Standard_Real FirstParameter();

		/****** Law_BSpline::FirstUKnotIndex ******/
		/****** md5 signature: cd1268c018861ca921686718cddd2c78 ******/
		%feature("compactdefaultargs") FirstUKnotIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
For a B-spline curve the first parameter (which gives the start point of the curve) is a knot value but if the multiplicity of the first knot index is lower than Degree + 1 it is not the first knot of the curve. This method computes the index of the knot corresponding to the first parameter.
") FirstUKnotIndex;
		Standard_Integer FirstUKnotIndex();

		/****** Law_BSpline::IncreaseDegree ******/
		/****** md5 signature: 2f404362ae4c6786bc49eb532abfeb06 ******/
		%feature("compactdefaultargs") IncreaseDegree;
		%feature("autodoc", "
Parameters
----------
Degree: int

Return
-------
None

Description
-----------
Increase the degree to <Degree>. Nothing is done if <Degree> is lower or equal to the current degree.
") IncreaseDegree;
		void IncreaseDegree(const Standard_Integer Degree);

		/****** Law_BSpline::IncreaseMultiplicity ******/
		/****** md5 signature: acbc64714702b7201cc3229bfdba4081 ******/
		%feature("compactdefaultargs") IncreaseMultiplicity;
		%feature("autodoc", "
Parameters
----------
Index: int
M: int

Return
-------
None

Description
-----------
Increases the multiplicity of the knot <Index> to <M>. //! If <M> is lower or equal to the current multiplicity nothing is done. If <M> is higher than the degree the degree is used. If <Index> is not in [FirstUKnotIndex, LastUKnotIndex].
") IncreaseMultiplicity;
		void IncreaseMultiplicity(const Standard_Integer Index, const Standard_Integer M);

		/****** Law_BSpline::IncreaseMultiplicity ******/
		/****** md5 signature: 20329617e559bb513534e7b5d8d351fc ******/
		%feature("compactdefaultargs") IncreaseMultiplicity;
		%feature("autodoc", "
Parameters
----------
I1: int
I2: int
M: int

Return
-------
None

Description
-----------
Increases the multiplicities of the knots in [I1,I2] to <M>. //! For each knot if <M> is lower or equal to the current multiplicity nothing is done. If <M> is higher than the degree the degree is used. If <I1,I2> are not in [FirstUKnotIndex, LastUKnotIndex].
") IncreaseMultiplicity;
		void IncreaseMultiplicity(const Standard_Integer I1, const Standard_Integer I2, const Standard_Integer M);

		/****** Law_BSpline::IncrementMultiplicity ******/
		/****** md5 signature: 7c6b4452fa65fae5da2a1a56ab1d1564 ******/
		%feature("compactdefaultargs") IncrementMultiplicity;
		%feature("autodoc", "
Parameters
----------
I1: int
I2: int
M: int

Return
-------
None

Description
-----------
Increment the multiplicities of the knots in [I1,I2] by <M>. //! If <M> is not positive nithing is done. //! For each knot the resulting multiplicity is limited to the Degree. If <I1,I2> are not in [FirstUKnotIndex, LastUKnotIndex].
") IncrementMultiplicity;
		void IncrementMultiplicity(const Standard_Integer I1, const Standard_Integer I2, const Standard_Integer M);

		/****** Law_BSpline::InsertKnot ******/
		/****** md5 signature: 4107fd8f43066c1257644c676b582c67 ******/
		%feature("compactdefaultargs") InsertKnot;
		%feature("autodoc", "
Parameters
----------
U: float
M: int (optional, default to 1)
ParametricTolerance: float (optional, default to 0.0)
Add: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Inserts a knot value in the sequence of knots. If <U> is an existing knot the multiplicity is increased by <M>. //! If U is not on the parameter range nothing is done. //! If the multiplicity is negative or null nothing is done. The new multiplicity is limited to the degree. //! The tolerance criterion for knots equality is the max of Epsilon(U) and ParametricTolerance.
") InsertKnot;
		void InsertKnot(const Standard_Real U, const Standard_Integer M = 1, const Standard_Real ParametricTolerance = 0.0, const Standard_Boolean Add = Standard_True);

		/****** Law_BSpline::InsertKnots ******/
		/****** md5 signature: 6518beb27958c7c7882b20b52acc844f ******/
		%feature("compactdefaultargs") InsertKnots;
		%feature("autodoc", "
Parameters
----------
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger
ParametricTolerance: float (optional, default to 0.0)
Add: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Inserts a set of knots values in the sequence of knots. //! For each U = Knots(i), M = Mults(i) //! If <U> is an existing knot the multiplicity is increased by <M> if <Add> is True, increased to <M> if <Add> is False. //! If U is not on the parameter range nothing is done. //! If the multiplicity is negative or null nothing is done. The new multiplicity is limited to the degree. //! The tolerance criterion for knots equality is the max of Epsilon(U) and ParametricTolerance.
") InsertKnots;
		void InsertKnots(const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Real ParametricTolerance = 0.0, const Standard_Boolean Add = Standard_False);

		/****** Law_BSpline::IsCN ******/
		/****** md5 signature: 7f34d4987a255fd641d3dff93dba4de4 ******/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns the continuity of the curve, the curve is at least C0. Raised if N < 0.
") IsCN;
		Standard_Boolean IsCN(const Standard_Integer N);

		/****** Law_BSpline::IsClosed ******/
		/****** md5 signature: 29709d02fadc9fcb79a766bc9679271b ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the distance between the first point and the last point of the curve is lower or equal to Resolution from package gp. Warnings: The first and the last point can be different from the first pole and the last pole of the curve.
") IsClosed;
		Standard_Boolean IsClosed();

		/****** Law_BSpline::IsPeriodic ******/
		/****** md5 signature: 62d7f554b0b7785e1f3919569dfbc68f ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the curve is periodic.
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****** Law_BSpline::IsRational ******/
		/****** md5 signature: fd4212ffa7bc30cde420e74a2c539434 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the weights are not identical. The tolerance criterion is Epsilon of the class Real.
") IsRational;
		Standard_Boolean IsRational();

		/****** Law_BSpline::Knot ******/
		/****** md5 signature: 87780028b98a8253068f050487c4f4d5 ******/
		%feature("compactdefaultargs") Knot;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Returns the knot of range Index. When there is a knot with a multiplicity greater than 1 the knot is not repeated. The method Multiplicity can be used to get the multiplicity of the Knot. Raised if Index < 1 or Index > NbKnots.
") Knot;
		Standard_Real Knot(const Standard_Integer Index);

		/****** Law_BSpline::KnotDistribution ******/
		/****** md5 signature: 6b866e71367b1f5428eba6d3bcc36415 ******/
		%feature("compactdefaultargs") KnotDistribution;
		%feature("autodoc", "Return
-------
GeomAbs_BSplKnotDistribution

Description
-----------
Returns NonUniform or Uniform or QuasiUniform or PiecewiseBezier. If all the knots differ by a positive constant from the preceding knot the BSpline Curve can be: - Uniform if all the knots are of multiplicity 1, - QuasiUniform if all the knots are of multiplicity 1 except for the first and last knot which are of multiplicity Degree + 1, - PiecewiseBezier if the first and last knots have multiplicity Degree + 1 and if interior knots have multiplicity Degree A piecewise Bezier with only two knots is a BezierCurve. else the curve is non uniform. The tolerance criterion is Epsilon from class Real.
") KnotDistribution;
		GeomAbs_BSplKnotDistribution KnotDistribution();

		/****** Law_BSpline::KnotSequence ******/
		/****** md5 signature: 16870e6acc7bcd815fb4e50aaa88ac5a ******/
		%feature("compactdefaultargs") KnotSequence;
		%feature("autodoc", "
Parameters
----------
K: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Returns the knots sequence. In this sequence the knots with a multiplicity greater than 1 are repeated. Example: K = {k1, k1, k1, k2, k3, k3, k4, k4, k4} //! Raised if the length of K is not equal to NbPoles + Degree + 1.
") KnotSequence;
		void KnotSequence(TColStd_Array1OfReal & K);

		/****** Law_BSpline::Knots ******/
		/****** md5 signature: 949cf09b8db41cbb8ab5188bcb475e56 ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
K: TColStd_Array1OfReal

Return
-------
None

Description
-----------
returns the knot values of the B-spline curve; //! Raised if the length of K is not equal to the number of knots.
") Knots;
		void Knots(TColStd_Array1OfReal & K);

		/****** Law_BSpline::LastParameter ******/
		/****** md5 signature: 7cdf630921ee47ad365a5a6bafd4b46e ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the parametric value of the end point of the curve. It is a knot value.
") LastParameter;
		Standard_Real LastParameter();

		/****** Law_BSpline::LastUKnotIndex ******/
		/****** md5 signature: b5183e855ac73e665e20fe9cd9a25fef ******/
		%feature("compactdefaultargs") LastUKnotIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
For a BSpline curve the last parameter (which gives the end point of the curve) is a knot value but if the multiplicity of the last knot index is lower than Degree + 1 it is not the last knot of the curve. This method computes the index of the knot corresponding to the last parameter.
") LastUKnotIndex;
		Standard_Integer LastUKnotIndex();

		/****** Law_BSpline::LocalD0 ******/
		/****** md5 signature: 67f9063f60c6650e736e82ad5e95de83 ******/
		%feature("compactdefaultargs") LocalD0;
		%feature("autodoc", "
Parameters
----------
U: float
FromK1: int
ToK2: int

Return
-------
P: float

Description
-----------
No available documentation.
") LocalD0;
		void LocalD0(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2, Standard_Real &OutValue);

		/****** Law_BSpline::LocalD1 ******/
		/****** md5 signature: b04e6a63f88ea2b5e34deb229eb8b8be ******/
		%feature("compactdefaultargs") LocalD1;
		%feature("autodoc", "
Parameters
----------
U: float
FromK1: int
ToK2: int

Return
-------
P: float
V1: float

Description
-----------
No available documentation.
") LocalD1;
		void LocalD1(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_BSpline::LocalD2 ******/
		/****** md5 signature: e0f09f877634d736373e7b5cbf5cf8da ******/
		%feature("compactdefaultargs") LocalD2;
		%feature("autodoc", "
Parameters
----------
U: float
FromK1: int
ToK2: int

Return
-------
P: float
V1: float
V2: float

Description
-----------
No available documentation.
") LocalD2;
		void LocalD2(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_BSpline::LocalD3 ******/
		/****** md5 signature: 2e91899c058dfa66978c6e4f5218e43b ******/
		%feature("compactdefaultargs") LocalD3;
		%feature("autodoc", "
Parameters
----------
U: float
FromK1: int
ToK2: int

Return
-------
P: float
V1: float
V2: float
V3: float

Description
-----------
No available documentation.
") LocalD3;
		void LocalD3(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_BSpline::LocalDN ******/
		/****** md5 signature: 2b46fe2487783db45aa0ea00e052f430 ******/
		%feature("compactdefaultargs") LocalDN;
		%feature("autodoc", "
Parameters
----------
U: float
FromK1: int
ToK2: int
N: int

Return
-------
float

Description
-----------
No available documentation.
") LocalDN;
		Standard_Real LocalDN(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2, const Standard_Integer N);

		/****** Law_BSpline::LocalValue ******/
		/****** md5 signature: 764bef5fcba4f390b1497c3df3bfbb61 ******/
		%feature("compactdefaultargs") LocalValue;
		%feature("autodoc", "
Parameters
----------
U: float
FromK1: int
ToK2: int

Return
-------
float

Description
-----------
No available documentation.
") LocalValue;
		Standard_Real LocalValue(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2);

		/****** Law_BSpline::LocateU ******/
		/****** md5 signature: d536ddd65ca3edfb5dd75e59f7417959 ******/
		%feature("compactdefaultargs") LocateU;
		%feature("autodoc", "
Parameters
----------
U: float
ParametricTolerance: float
WithKnotRepetition: bool (optional, default to Standard_False)

Return
-------
I1: int
I2: int

Description
-----------
Locates the parametric value U in the sequence of knots. If 'WithKnotRepetition' is True we consider the knot's representation with repetition of multiple knot value, otherwise we consider the knot's representation with no repetition of multiple knot values. Knots (I1) <= U <= Knots (I2) . if I1 = I2 U is a knot value (the tolerance criterion ParametricTolerance is used). . if I1 < 1 => U < Knots (1) - Abs(ParametricTolerance) . if I2 > NbKnots => U > Knots (NbKnots) + Abs(ParametricTolerance).
") LocateU;
		void LocateU(const Standard_Real U, const Standard_Real ParametricTolerance, Standard_Integer &OutValue, Standard_Integer &OutValue, const Standard_Boolean WithKnotRepetition = Standard_False);

		/****** Law_BSpline::MaxDegree ******/
		/****** md5 signature: 985314a0ed62b597a9bdf0f555b97bed ******/
		%feature("compactdefaultargs") MaxDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the value of the maximum degree of the normalized B-spline basis functions in this package.
") MaxDegree;
		static Standard_Integer MaxDegree();

		/****** Law_BSpline::MovePointAndTangent ******/
		/****** md5 signature: 48e98676b5c4d441b6b8923083347851 ******/
		%feature("compactdefaultargs") MovePointAndTangent;
		%feature("autodoc", "
Parameters
----------
U: float
NewValue: float
Derivative: float
Tolerance: float
StartingCondition: int
EndingCondition: int

Return
-------
ErrorStatus: int

Description
-----------
Changes the value of the Law at parameter U to NewValue. and makes its derivative at U be derivative. StartingCondition = -1 means first can move EndingCondition = -1 means last point can move StartingCondition = 0 means the first point cannot move EndingCondition = 0 means the last point cannot move StartingCondition = 1 means the first point and tangent cannot move EndingCondition = 1 means the last point and tangent cannot move and so forth ErrorStatus != 0 means that there are not enough degree of freedom with the constrain to deform the curve accordingly.
") MovePointAndTangent;
		void MovePointAndTangent(const Standard_Real U, const Standard_Real NewValue, const Standard_Real Derivative, const Standard_Real Tolerance, const Standard_Integer StartingCondition, const Standard_Integer EndingCondition, Standard_Integer &OutValue);

		/****** Law_BSpline::Multiplicities ******/
		/****** md5 signature: 5e4cb134cc2959735c59c531d6a8b490 ******/
		%feature("compactdefaultargs") Multiplicities;
		%feature("autodoc", "
Parameters
----------
M: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
Returns the multiplicity of the knots of the curve. //! Raised if the length of M is not equal to NbKnots.
") Multiplicities;
		void Multiplicities(TColStd_Array1OfInteger & M);

		/****** Law_BSpline::Multiplicity ******/
		/****** md5 signature: 0b00002ea9c75b6fa0f22b159f127931 ******/
		%feature("compactdefaultargs") Multiplicity;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
int

Description
-----------
Returns the multiplicity of the knots of range Index. Raised if Index < 1 or Index > NbKnots.
") Multiplicity;
		Standard_Integer Multiplicity(const Standard_Integer Index);

		/****** Law_BSpline::NbKnots ******/
		/****** md5 signature: ccda669299f8eba1ba0d3387af4c950e ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of knots. This method returns the number of knot without repetition of multiple knots.
") NbKnots;
		Standard_Integer NbKnots();

		/****** Law_BSpline::NbPoles ******/
		/****** md5 signature: 9a7d6d5f8a21c5833786e951bce99604 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of poles.
") NbPoles;
		Standard_Integer NbPoles();

		/****** Law_BSpline::PeriodicNormalization ******/
		/****** md5 signature: ba1016bda06943eb982997be7f9da740 ******/
		%feature("compactdefaultargs") PeriodicNormalization;
		%feature("autodoc", "
Parameters
----------

Return
-------
U: float

Description
-----------
returns the parameter normalized within the period if the curve is periodic: otherwise does not do anything.
") PeriodicNormalization;
		void PeriodicNormalization(Standard_Real &OutValue);

		/****** Law_BSpline::Pole ******/
		/****** md5 signature: 4b60eb57c0e94e2f3f596d71e602d4cd ******/
		%feature("compactdefaultargs") Pole;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Returns the pole of range Index. Raised if Index < 1 or Index > NbPoles.
") Pole;
		Standard_Real Pole(const Standard_Integer Index);

		/****** Law_BSpline::Poles ******/
		/****** md5 signature: c54230dca164a58b2ce761e623ee934f ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "
Parameters
----------
P: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Returns the poles of the B-spline curve; //! Raised if the length of P is not equal to the number of poles.
") Poles;
		void Poles(TColStd_Array1OfReal & P);

		/****** Law_BSpline::RemoveKnot ******/
		/****** md5 signature: 9210db71a77261be541bbc23355610eb ******/
		%feature("compactdefaultargs") RemoveKnot;
		%feature("autodoc", "
Parameters
----------
Index: int
M: int
Tolerance: float

Return
-------
bool

Description
-----------
Decrement the knots multiplicity to <M>. If M is 0 the knot is removed. The Poles sequence is modified. //! As there are two ways to compute the new poles the average is computed if the distance is lower than the <Tolerance>, else False is returned. //! A low tolerance is used to prevent the modification of the curve. //! A high tolerance is used to 'smooth' the curve. //! Raised if Index is not in the range [FirstUKnotIndex, LastUKnotIndex] pole insertion and pole removing this operation is limited to the Uniform or QuasiUniform BSplineCurve. The knot values are modified . If the BSpline is NonUniform or Piecewise Bezier an exception Construction error is raised.
") RemoveKnot;
		Standard_Boolean RemoveKnot(const Standard_Integer Index, const Standard_Integer M, const Standard_Real Tolerance);

		/****** Law_BSpline::Resolution ******/
		/****** md5 signature: 67eeda2a737d12a02a1311baf9f9467b ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
Tolerance3D: float

Return
-------
UTolerance: float

Description
-----------
given Tolerance3D returns UTolerance such that if f(t) is the curve we have | t1 - t0| < Utolerance ===> |f(t1) - f(t0)| < Tolerance3D.
") Resolution;
		void Resolution(const Standard_Real Tolerance3D, Standard_Real &OutValue);

		/****** Law_BSpline::Reverse ******/
		/****** md5 signature: b751d6874fc026e19a7a6cb37e9ac1b4 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Changes the direction of parametrization of <self>. The Knot sequence is modified, the FirstParameter and the LastParameter are not modified. The StartPoint of the initial curve becomes the EndPoint of the reversed curve and the EndPoint of the initial curve becomes the StartPoint of the reversed curve.
") Reverse;
		void Reverse();

		/****** Law_BSpline::ReversedParameter ******/
		/****** md5 signature: d34103f7eed393c7e93e6ef5b52b2682 ******/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Returns the parameter on the reversed curve for the point of parameter U on <self>. //! returns UFirst + ULast - U.
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****** Law_BSpline::Segment ******/
		/****** md5 signature: fb72a1522f77fa9f134af7f8bf81def8 ******/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "
Parameters
----------
U1: float
U2: float

Return
-------
None

Description
-----------
Segments the curve between U1 and U2. The control points are modified, the first and the last point are not the same. Warnings: Even if <self> is not closed it can become closed after the segmentation for example if U1 or U2 are out of the bounds of the curve <self> or if the curve makes loop. After the segmentation the length of a curve can be null. raises if U2 < U1.
") Segment;
		void Segment(const Standard_Real U1, const Standard_Real U2);

		/****** Law_BSpline::SetKnot ******/
		/****** md5 signature: 24248dddb124af2118f7043ae254694e ******/
		%feature("compactdefaultargs") SetKnot;
		%feature("autodoc", "
Parameters
----------
Index: int
K: float

Return
-------
None

Description
-----------
Changes the knot of range Index. The multiplicity of the knot is not modified. Raised if K >= Knots(Index+1) or K <= Knots(Index-1). Raised if Index < 1 || Index > NbKnots.
") SetKnot;
		void SetKnot(const Standard_Integer Index, const Standard_Real K);

		/****** Law_BSpline::SetKnot ******/
		/****** md5 signature: 12123e73421d28330eec5dae317ac18f ******/
		%feature("compactdefaultargs") SetKnot;
		%feature("autodoc", "
Parameters
----------
Index: int
K: float
M: int

Return
-------
None

Description
-----------
Changes the knot of range Index with its multiplicity. You can increase the multiplicity of a knot but it is not allowed to decrease the multiplicity of an existing knot. //! Raised if K >= Knots(Index+1) or K <= Knots(Index-1). Raised if M is greater than Degree or lower than the previous multiplicity of knot of range Index. Raised if Index < 1 || Index > NbKnots.
") SetKnot;
		void SetKnot(const Standard_Integer Index, const Standard_Real K, const Standard_Integer M);

		/****** Law_BSpline::SetKnots ******/
		/****** md5 signature: d319c647ea235edd171c661a477e0338 ******/
		%feature("compactdefaultargs") SetKnots;
		%feature("autodoc", "
Parameters
----------
K: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Changes all the knots of the curve The multiplicity of the knots are not modified. //! Raised if there is an index such that K (Index+1) <= K (Index). //! Raised if K.Lower() < 1 or K.Upper() > NbKnots.
") SetKnots;
		void SetKnots(const TColStd_Array1OfReal & K);

		/****** Law_BSpline::SetNotPeriodic ******/
		/****** md5 signature: ccfbd171d2b38df3531b77ecbc51dcae ******/
		%feature("compactdefaultargs") SetNotPeriodic;
		%feature("autodoc", "Return
-------
None

Description
-----------
Makes a non periodic curve. If the curve was non periodic the curve is not modified.
") SetNotPeriodic;
		void SetNotPeriodic();

		/****** Law_BSpline::SetOrigin ******/
		/****** md5 signature: bcb4756c4db11bf7ed3d05d2f98659f0 ******/
		%feature("compactdefaultargs") SetOrigin;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
None

Description
-----------
Set the origin of a periodic curve at Knot(index) KnotVector and poles are modified. Raised if the curve is not periodic Raised if index not in the range [FirstUKnotIndex , LastUKnotIndex].
") SetOrigin;
		void SetOrigin(const Standard_Integer Index);

		/****** Law_BSpline::SetPeriodic ******/
		/****** md5 signature: 3d498279f2dd83a2ab9aa88181da253f ******/
		%feature("compactdefaultargs") SetPeriodic;
		%feature("autodoc", "Return
-------
None

Description
-----------
Makes a closed B-spline into a periodic curve. The curve is periodic if the knot sequence is periodic and if the curve is closed (The tolerance criterion is Resolution from gp). The period T is equal to Knot(LastUKnotIndex) - Knot(FirstUKnotIndex). A periodic B-spline can be uniform or not. Raised if the curve is not closed.
") SetPeriodic;
		void SetPeriodic();

		/****** Law_BSpline::SetPole ******/
		/****** md5 signature: c543141afef84d45aee3427438896497 ******/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "
Parameters
----------
Index: int
P: float

Return
-------
None

Description
-----------
Substitutes the Pole of range Index with P. //! Raised if Index < 1 || Index > NbPoles.
") SetPole;
		void SetPole(const Standard_Integer Index, const Standard_Real P);

		/****** Law_BSpline::SetPole ******/
		/****** md5 signature: 41bc8db65ef7348f416a0f41e206176a ******/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "
Parameters
----------
Index: int
P: float
Weight: float

Return
-------
None

Description
-----------
Substitutes the pole and the weight of range Index. If the curve <self> is not rational it can become rational If the curve was rational it can become non rational //! Raised if Index < 1 || Index > NbPoles Raised if Weight <= 0.0.
") SetPole;
		void SetPole(const Standard_Integer Index, const Standard_Real P, const Standard_Real Weight);

		/****** Law_BSpline::SetWeight ******/
		/****** md5 signature: 4e7aa00d12e09e9b776d4bf66f07ecec ******/
		%feature("compactdefaultargs") SetWeight;
		%feature("autodoc", "
Parameters
----------
Index: int
Weight: float

Return
-------
None

Description
-----------
Changes the weight for the pole of range Index. If the curve was non rational it can become rational. If the curve was rational it can become non rational. //! Raised if Index < 1 || Index > NbPoles Raised if Weight <= 0.0.
") SetWeight;
		void SetWeight(const Standard_Integer Index, const Standard_Real Weight);

		/****** Law_BSpline::StartPoint ******/
		/****** md5 signature: 6de4f7eb4e60e5292b0a68de88b0afcc ******/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the start point of the curve. Warnings: This point is different from the first pole of the curve if the multiplicity of the first knot is lower than Degree.
") StartPoint;
		Standard_Real StartPoint();

		/****** Law_BSpline::Value ******/
		/****** md5 signature: 259d0381438deb1ea24f676e0632e216 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
No available documentation.
") Value;
		Standard_Real Value(const Standard_Real U);

		/****** Law_BSpline::Weight ******/
		/****** md5 signature: 70cf193bf7498ec22102a906ea9db6f5 ******/
		%feature("compactdefaultargs") Weight;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Returns the weight of the pole of range Index . Raised if Index < 1 or Index > NbPoles.
") Weight;
		Standard_Real Weight(const Standard_Integer Index);

		/****** Law_BSpline::Weights ******/
		/****** md5 signature: dd63733e96eafbaacbd2d7b600471c30 ******/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "
Parameters
----------
W: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Returns the weights of the B-spline curve; //! Raised if the length of W is not equal to NbPoles.
") Weights;
		void Weights(TColStd_Array1OfReal & W);

};


%make_alias(Law_BSpline)

%extend Law_BSpline {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Law_BSplineKnotSplitting *
*********************************/
class Law_BSplineKnotSplitting {
	public:
		/****** Law_BSplineKnotSplitting::Law_BSplineKnotSplitting ******/
		/****** md5 signature: 0176cf7ca612fa56b641a0a54f53170e ******/
		%feature("compactdefaultargs") Law_BSplineKnotSplitting;
		%feature("autodoc", "
Parameters
----------
BasisLaw: Law_BSpline
ContinuityRange: int

Return
-------
None

Description
-----------
Locates the knot values which correspond to the segmentation of the curve into arcs with a continuity equal to ContinuityRange. //! Raised if ContinuityRange is not greater or equal zero.
") Law_BSplineKnotSplitting;
		 Law_BSplineKnotSplitting(const opencascade::handle<Law_BSpline> & BasisLaw, const Standard_Integer ContinuityRange);

		/****** Law_BSplineKnotSplitting::NbSplits ******/
		/****** md5 signature: 4531d20d48cc2f1c4ba8fba36f455258 ******/
		%feature("compactdefaultargs") NbSplits;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of knots corresponding to the splitting.
") NbSplits;
		Standard_Integer NbSplits();

		/****** Law_BSplineKnotSplitting::SplitValue ******/
		/****** md5 signature: 721f3b88e9b98541767484bae1df7e27 ******/
		%feature("compactdefaultargs") SplitValue;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
int

Description
-----------
Returns the index of the knot corresponding to the splitting of range Index. //! Raised if Index < 1 or Index > NbSplits.
") SplitValue;
		Standard_Integer SplitValue(const Standard_Integer Index);

		/****** Law_BSplineKnotSplitting::Splitting ******/
		/****** md5 signature: 735443fa5e885793b9df881715b055c2 ******/
		%feature("compactdefaultargs") Splitting;
		%feature("autodoc", "
Parameters
----------
SplitValues: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
Returns the indexes of the BSpline curve knots corresponding to the splitting. //! Raised if the length of SplitValues is not equal to NbSPlit.
") Splitting;
		void Splitting(TColStd_Array1OfInteger & SplitValues);

};


%extend Law_BSplineKnotSplitting {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Law_Function *
*********************/
%nodefaultctor Law_Function;
class Law_Function : public Standard_Transient {
	public:
		/****** Law_Function::Bounds ******/
		/****** md5 signature: 2dfcb21f440f89dad8f64131851fa810 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
PFirst: float
PLast: float

Description
-----------
Returns the parametric bounds of the function.
") Bounds;
		virtual void Bounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_Function::Continuity ******/
		/****** md5 signature: 8dbb475c198ca068fb275dadeaaecf82 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		virtual GeomAbs_Shape Continuity();

		/****** Law_Function::D1 ******/
		/****** md5 signature: c203a9919f51b45a6b18a551e4c933c3 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
F: float
D: float

Description
-----------
Returns the value F and the first derivative D of the function at the point of parameter X.
") D1;
		virtual void D1(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_Function::D2 ******/
		/****** md5 signature: 8812da4cd148a429405a5ef1ca2f25e3 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
F: float
D: float
D2: float

Description
-----------
Returns the value, first and seconde derivatives at parameter X.
") D2;
		virtual void D2(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_Function::Intervals ******/
		/****** md5 signature: 7d2bf038a9213acf1609cc1244a3ee03 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. The array must provide enough room to accommodate for the parameters, i.e. T.Length() > NbIntervals().
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** Law_Function::NbIntervals ******/
		/****** md5 signature: cb7f68d4b2c30f29cd5ba6f81443d314 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** Law_Function::Trim ******/
		/****** md5 signature: f8e78845e5df643d7de59e777d3b29b4 ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
PFirst: float
PLast: float
Tol: float

Return
-------
opencascade::handle<Law_Function>

Description
-----------
Returns a law equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. It is usfule to determines the derivatives in these values <First> and <Last> if the Law is not Cn.
") Trim;
		virtual opencascade::handle<Law_Function> Trim(const Standard_Real PFirst, const Standard_Real PLast, const Standard_Real Tol);

		/****** Law_Function::Value ******/
		/****** md5 signature: c0f739be8882045b477e5965ae854310 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
float

Description
-----------
Returns the value of the function at the point of parameter X.
") Value;
		virtual Standard_Real Value(const Standard_Real X);

};


%make_alias(Law_Function)

%extend Law_Function {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Law_Interpolate *
************************/
class Law_Interpolate {
	public:
		/****** Law_Interpolate::Law_Interpolate ******/
		/****** md5 signature: aa0d1eb6b8f2ce7f2a34a7b1144f35d5 ******/
		%feature("compactdefaultargs") Law_Interpolate;
		%feature("autodoc", "
Parameters
----------
Points: TColStd_HArray1OfReal
PeriodicFlag: bool
Tolerance: float

Return
-------
None

Description
-----------
Tolerance is to check if the points are not too close to one an other. It is also used to check if the tangent vector is not too small. There should be at least 2 points. If PeriodicFlag is True then the curve will be periodic be periodic.
") Law_Interpolate;
		 Law_Interpolate(const opencascade::handle<TColStd_HArray1OfReal> & Points, const Standard_Boolean PeriodicFlag, const Standard_Real Tolerance);

		/****** Law_Interpolate::Law_Interpolate ******/
		/****** md5 signature: bafa05254f37788638580f8b10d3fd00 ******/
		%feature("compactdefaultargs") Law_Interpolate;
		%feature("autodoc", "
Parameters
----------
Points: TColStd_HArray1OfReal
Parameters: TColStd_HArray1OfReal
PeriodicFlag: bool
Tolerance: float

Return
-------
None

Description
-----------
Tolerance is to check if the points are not too close to one an other. It is also used to check if the tangent vector is not too small. There should be at least 2 points. If PeriodicFlag is True then the curve will be periodic be periodic.
") Law_Interpolate;
		 Law_Interpolate(const opencascade::handle<TColStd_HArray1OfReal> & Points, const opencascade::handle<TColStd_HArray1OfReal> & Parameters, const Standard_Boolean PeriodicFlag, const Standard_Real Tolerance);

		/****** Law_Interpolate::Curve ******/
		/****** md5 signature: 532bf252f584bdb8f5e20aed8fa40bce ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Law_BSpline>

Description
-----------
No available documentation.
") Curve;
		const opencascade::handle<Law_BSpline> & Curve();

		/****** Law_Interpolate::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** Law_Interpolate::Load ******/
		/****** md5 signature: 8f771b9f76c028b192478032313f9c5d ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
InitialTangent: float
FinalTangent: float

Return
-------
None

Description
-----------
loads initial and final tangents if any.
") Load;
		void Load(const Standard_Real InitialTangent, const Standard_Real FinalTangent);

		/****** Law_Interpolate::Load ******/
		/****** md5 signature: 1072f5d77a808ecf12baa4f8d28262ed ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
Tangents: TColStd_Array1OfReal
TangentFlags: TColStd_HArray1OfBoolean

Return
-------
None

Description
-----------
loads the tangents. We should have as many tangents as they are points in the array if TangentFlags.Value(i) is Standard_True use the tangent Tangents.Value(i) otherwise the tangent is not constrained.
") Load;
		void Load(const TColStd_Array1OfReal & Tangents, const opencascade::handle<TColStd_HArray1OfBoolean> & TangentFlags);

		/****** Law_Interpolate::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Makes the interpolation.
") Perform;
		void Perform();

};


%extend Law_Interpolate {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def ClearTangents(self):
		pass
	}
};

/********************
* class Law_BSpFunc *
********************/
class Law_BSpFunc : public Law_Function {
	public:
		/****** Law_BSpFunc::Law_BSpFunc ******/
		/****** md5 signature: 00d351a4159535c6bcad09293d08c0d9 ******/
		%feature("compactdefaultargs") Law_BSpFunc;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Law_BSpFunc;
		 Law_BSpFunc();

		/****** Law_BSpFunc::Law_BSpFunc ******/
		/****** md5 signature: 2b00be194f3d42245535db64e407f43a ******/
		%feature("compactdefaultargs") Law_BSpFunc;
		%feature("autodoc", "
Parameters
----------
C: Law_BSpline
First: float
Last: float

Return
-------
None

Description
-----------
No available documentation.
") Law_BSpFunc;
		 Law_BSpFunc(const opencascade::handle<Law_BSpline> & C, const Standard_Real First, const Standard_Real Last);

		/****** Law_BSpFunc::Bounds ******/
		/****** md5 signature: 109b33fbef4fa3e688fc253ce6374e64 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
PFirst: float
PLast: float

Description
-----------
No available documentation.
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_BSpFunc::Continuity ******/
		/****** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** Law_BSpFunc::Curve ******/
		/****** md5 signature: cdfbc6f051f501ddd771545c4bedd7e7 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Law_BSpline>

Description
-----------
No available documentation.
") Curve;
		opencascade::handle<Law_BSpline> Curve();

		/****** Law_BSpFunc::D1 ******/
		/****** md5 signature: cf7042ba3595c92e51856267ec678265 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
F: float
D: float

Description
-----------
No available documentation.
") D1;
		void D1(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_BSpFunc::D2 ******/
		/****** md5 signature: 112e5f46e90df7f80b022aac83ebf670 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
F: float
D: float
D2: float

Description
-----------
No available documentation.
") D2;
		void D2(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_BSpFunc::Intervals ******/
		/****** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. The array must provide enough room to accommodate for the parameters, i.e. T.Length() > NbIntervals().
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** Law_BSpFunc::NbIntervals ******/
		/****** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** Law_BSpFunc::SetCurve ******/
		/****** md5 signature: 96498826c71d9588cdfd5a8a18018a7b ******/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
C: Law_BSpline

Return
-------
None

Description
-----------
No available documentation.
") SetCurve;
		void SetCurve(const opencascade::handle<Law_BSpline> & C);

		/****** Law_BSpFunc::Trim ******/
		/****** md5 signature: e3ce5ec219196d07cdf6d267682f4d69 ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
PFirst: float
PLast: float
Tol: float

Return
-------
opencascade::handle<Law_Function>

Description
-----------
Returns a law equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. It is usfule to determines the derivatives in these values <First> and <Last> if the Law is not Cn.
") Trim;
		opencascade::handle<Law_Function> Trim(const Standard_Real PFirst, const Standard_Real PLast, const Standard_Real Tol);

		/****** Law_BSpFunc::Value ******/
		/****** md5 signature: ab3c530c57b52577e74270dde01981c6 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
float

Description
-----------
No available documentation.
") Value;
		Standard_Real Value(const Standard_Real X);

};


%make_alias(Law_BSpFunc)

%extend Law_BSpFunc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Law_Composite *
**********************/
class Law_Composite : public Law_Function {
	public:
		/****** Law_Composite::Law_Composite ******/
		/****** md5 signature: 9fad703504dbdf0dfe348df1242a128e ******/
		%feature("compactdefaultargs") Law_Composite;
		%feature("autodoc", "Return
-------
None

Description
-----------
Construct an empty Law.
") Law_Composite;
		 Law_Composite();

		/****** Law_Composite::Law_Composite ******/
		/****** md5 signature: b51d805042e8e834fd1c73c392ffe7bf ******/
		%feature("compactdefaultargs") Law_Composite;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float
Tol: float

Return
-------
None

Description
-----------
Construct an empty, trimmed Law.
") Law_Composite;
		 Law_Composite(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****** Law_Composite::Bounds ******/
		/****** md5 signature: 109b33fbef4fa3e688fc253ce6374e64 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
PFirst: float
PLast: float

Description
-----------
Returns the parametric bounds of the function.
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_Composite::ChangeElementaryLaw ******/
		/****** md5 signature: 001020016f6913c8feeb8af262c638d4 ******/
		%feature("compactdefaultargs") ChangeElementaryLaw;
		%feature("autodoc", "
Parameters
----------
W: float

Return
-------
opencascade::handle<Law_Function>

Description
-----------
Returns the elementary function of the composite used to compute at parameter W.
") ChangeElementaryLaw;
		opencascade::handle<Law_Function> & ChangeElementaryLaw(const Standard_Real W);

		/****** Law_Composite::ChangeLaws ******/
		/****** md5 signature: 558d152f4bf700f26bd58a0cdffadaae ******/
		%feature("compactdefaultargs") ChangeLaws;
		%feature("autodoc", "Return
-------
Law_Laws

Description
-----------
No available documentation.
") ChangeLaws;
		Law_Laws & ChangeLaws();

		/****** Law_Composite::Continuity ******/
		/****** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** Law_Composite::D1 ******/
		/****** md5 signature: cf7042ba3595c92e51856267ec678265 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
F: float
D: float

Description
-----------
Returns the value and the first derivative at parameter X.
") D1;
		void D1(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_Composite::D2 ******/
		/****** md5 signature: 112e5f46e90df7f80b022aac83ebf670 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
F: float
D: float
D2: float

Description
-----------
Returns the value, first and second derivatives at parameter X.
") D2;
		void D2(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_Composite::Intervals ******/
		/****** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. The array must provide enough room to accommodate for the parameters, i.e. T.Length() > NbIntervals().
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** Law_Composite::IsPeriodic ******/
		/****** md5 signature: 62d7f554b0b7785e1f3919569dfbc68f ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****** Law_Composite::NbIntervals ******/
		/****** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** Law_Composite::SetPeriodic ******/
		/****** md5 signature: 3d498279f2dd83a2ab9aa88181da253f ******/
		%feature("compactdefaultargs") SetPeriodic;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") SetPeriodic;
		void SetPeriodic();

		/****** Law_Composite::Trim ******/
		/****** md5 signature: e3ce5ec219196d07cdf6d267682f4d69 ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
PFirst: float
PLast: float
Tol: float

Return
-------
opencascade::handle<Law_Function>

Description
-----------
Returns a law equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. It is usfule to determines the derivatives in these values <First> and <Last> if the Law is not Cn.
") Trim;
		opencascade::handle<Law_Function> Trim(const Standard_Real PFirst, const Standard_Real PLast, const Standard_Real Tol);

		/****** Law_Composite::Value ******/
		/****** md5 signature: ab3c530c57b52577e74270dde01981c6 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
float

Description
-----------
Returns the value at parameter X.
") Value;
		Standard_Real Value(const Standard_Real X);

};


%make_alias(Law_Composite)

%extend Law_Composite {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Law_Constant *
*********************/
class Law_Constant : public Law_Function {
	public:
		/****** Law_Constant::Law_Constant ******/
		/****** md5 signature: 0fd8cc567137ff55c50de3ad074030d4 ******/
		%feature("compactdefaultargs") Law_Constant;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Law_Constant;
		 Law_Constant();

		/****** Law_Constant::Bounds ******/
		/****** md5 signature: 109b33fbef4fa3e688fc253ce6374e64 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
PFirst: float
PLast: float

Description
-----------
Returns the parametric bounds of the function.
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_Constant::Continuity ******/
		/****** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns GeomAbs_CN.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** Law_Constant::D1 ******/
		/****** md5 signature: cf7042ba3595c92e51856267ec678265 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
F: float
D: float

Description
-----------
Returns the value and the first derivative at parameter X.
") D1;
		void D1(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_Constant::D2 ******/
		/****** md5 signature: 112e5f46e90df7f80b022aac83ebf670 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
F: float
D: float
D2: float

Description
-----------
Returns the value, first and second derivatives at parameter X.
") D2;
		void D2(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_Constant::Intervals ******/
		/****** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
No available documentation.
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** Law_Constant::NbIntervals ******/
		/****** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns 1.
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** Law_Constant::Set ******/
		/****** md5 signature: 14aa6a38c1de36b883fe65df941453f5 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Radius: float
PFirst: float
PLast: float

Return
-------
None

Description
-----------
Set the radius and the range of the constant Law.
") Set;
		void Set(const Standard_Real Radius, const Standard_Real PFirst, const Standard_Real PLast);

		/****** Law_Constant::Trim ******/
		/****** md5 signature: e3ce5ec219196d07cdf6d267682f4d69 ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
PFirst: float
PLast: float
Tol: float

Return
-------
opencascade::handle<Law_Function>

Description
-----------
No available documentation.
") Trim;
		opencascade::handle<Law_Function> Trim(const Standard_Real PFirst, const Standard_Real PLast, const Standard_Real Tol);

		/****** Law_Constant::Value ******/
		/****** md5 signature: ab3c530c57b52577e74270dde01981c6 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
float

Description
-----------
Returns the value at parameter X.
") Value;
		Standard_Real Value(const Standard_Real X);

};


%make_alias(Law_Constant)

%extend Law_Constant {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class Law_Linear *
*******************/
class Law_Linear : public Law_Function {
	public:
		/****** Law_Linear::Law_Linear ******/
		/****** md5 signature: 7e7e2a11cadadc07bc93c15533d9991c ******/
		%feature("compactdefaultargs") Law_Linear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty linear evolution law.
") Law_Linear;
		 Law_Linear();

		/****** Law_Linear::Bounds ******/
		/****** md5 signature: 109b33fbef4fa3e688fc253ce6374e64 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
PFirst: float
PLast: float

Description
-----------
Returns the parametric bounds of the function.
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_Linear::Continuity ******/
		/****** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns GeomAbs_CN.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** Law_Linear::D1 ******/
		/****** md5 signature: cf7042ba3595c92e51856267ec678265 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
F: float
D: float

Description
-----------
Returns the value F and the first derivative D of this function at the point of parameter X.
") D1;
		void D1(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_Linear::D2 ******/
		/****** md5 signature: 112e5f46e90df7f80b022aac83ebf670 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
F: float
D: float
D2: float

Description
-----------
Returns the value, first and second derivatives at parameter X.
") D2;
		void D2(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_Linear::Intervals ******/
		/****** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
No available documentation.
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** Law_Linear::NbIntervals ******/
		/****** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns 1.
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** Law_Linear::Set ******/
		/****** md5 signature: a9e7ebf4e40f181869e8f48dce50b28b ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Pdeb: float
Valdeb: float
Pfin: float
Valfin: float

Return
-------
None

Description
-----------
Defines this linear evolution law by assigning both: - the bounds Pdeb and Pfin of the parameter, and - the values Valdeb and Valfin of the function at these two parametric bounds.
") Set;
		void Set(const Standard_Real Pdeb, const Standard_Real Valdeb, const Standard_Real Pfin, const Standard_Real Valfin);

		/****** Law_Linear::Trim ******/
		/****** md5 signature: e3ce5ec219196d07cdf6d267682f4d69 ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
PFirst: float
PLast: float
Tol: float

Return
-------
opencascade::handle<Law_Function>

Description
-----------
Returns a law equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. It is usfule to determines the derivatives in these values <First> and <Last> if the Law is not Cn.
") Trim;
		opencascade::handle<Law_Function> Trim(const Standard_Real PFirst, const Standard_Real PLast, const Standard_Real Tol);

		/****** Law_Linear::Value ******/
		/****** md5 signature: ab3c530c57b52577e74270dde01981c6 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
float

Description
-----------
Returns the value of this function at the point of parameter X.
") Value;
		Standard_Real Value(const Standard_Real X);

};


%make_alias(Law_Linear)

%extend Law_Linear {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Law_Interpol *
*********************/
class Law_Interpol : public Law_BSpFunc {
	public:
		/****** Law_Interpol::Law_Interpol ******/
		/****** md5 signature: 9f0b8feafcfd29beb68fa82ca43a2583 ******/
		%feature("compactdefaultargs") Law_Interpol;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty interpolative evolution law. The function Set is used to define the law.
") Law_Interpol;
		 Law_Interpol();

		/****** Law_Interpol::Set ******/
		/****** md5 signature: 4b5522f818f9f85342cb46d060e477a7 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
ParAndRad: TColgp_Array1OfPnt2d
Periodic: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Defines this evolution law by interpolating the set of 2D points ParAndRad. The Y coordinate of a point of ParAndRad is the value of the function at the parameter point given by its X coordinate. If Periodic is true, this function is assumed to be periodic. Warning - The X coordinates of points in the table ParAndRad must be given in ascendant order. - If Periodic is true, the first and last Y coordinates of points in the table ParAndRad are assumed to be equal. In addition, with the second syntax, Dd and Df are also assumed to be equal. If this is not the case, Set uses the first value(s) as last value(s).
") Set;
		void Set(const TColgp_Array1OfPnt2d & ParAndRad, const Standard_Boolean Periodic = Standard_False);

		/****** Law_Interpol::Set ******/
		/****** md5 signature: 437b6f2ff340656befcd0f8219e42069 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
ParAndRad: TColgp_Array1OfPnt2d
Dd: float
Df: float
Periodic: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Defines this evolution law by interpolating the set of 2D points ParAndRad. The Y coordinate of a point of ParAndRad is the value of the function at the parameter point given by its X coordinate. If Periodic is true, this function is assumed to be periodic. In the second syntax, Dd and Df define the values of the first derivative of the function at its first and last points. Warning - The X coordinates of points in the table ParAndRad must be given in ascendant order. - If Periodic is true, the first and last Y coordinates of points in the table ParAndRad are assumed to be equal. In addition, with the second syntax, Dd and Df are also assumed to be equal. If this is not the case, Set uses the first value(s) as last value(s).
") Set;
		void Set(const TColgp_Array1OfPnt2d & ParAndRad, const Standard_Real Dd, const Standard_Real Df, const Standard_Boolean Periodic = Standard_False);

		/****** Law_Interpol::SetInRelative ******/
		/****** md5 signature: 97e8b2c0568223ee320047d91bc3bb07 ******/
		%feature("compactdefaultargs") SetInRelative;
		%feature("autodoc", "
Parameters
----------
ParAndRad: TColgp_Array1OfPnt2d
Ud: float
Uf: float
Periodic: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") SetInRelative;
		void SetInRelative(const TColgp_Array1OfPnt2d & ParAndRad, const Standard_Real Ud, const Standard_Real Uf, const Standard_Boolean Periodic = Standard_False);

		/****** Law_Interpol::SetInRelative ******/
		/****** md5 signature: 3b4be520e8ff5d3a1675c1bace32a4d5 ******/
		%feature("compactdefaultargs") SetInRelative;
		%feature("autodoc", "
Parameters
----------
ParAndRad: TColgp_Array1OfPnt2d
Ud: float
Uf: float
Dd: float
Df: float
Periodic: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") SetInRelative;
		void SetInRelative(const TColgp_Array1OfPnt2d & ParAndRad, const Standard_Real Ud, const Standard_Real Uf, const Standard_Real Dd, const Standard_Real Df, const Standard_Boolean Periodic = Standard_False);

};


%make_alias(Law_Interpol)

%extend Law_Interpol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************
* class Law_S *
**************/
class Law_S : public Law_BSpFunc {
	public:
		/****** Law_S::Law_S ******/
		/****** md5 signature: c7cfd18abe4bb6c5ffce22425f8f6055 ******/
		%feature("compactdefaultargs") Law_S;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty 'S' evolution law.
") Law_S;
		 Law_S();

		/****** Law_S::Set ******/
		/****** md5 signature: a9e7ebf4e40f181869e8f48dce50b28b ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Pdeb: float
Valdeb: float
Pfin: float
Valfin: float

Return
-------
None

Description
-----------
Defines this S evolution law by assigning both: - the bounds Pdeb and Pfin of the parameter, and - the values Valdeb and Valfin of the function at these two parametric bounds. The function is assumed to have the first derivatives equal to 0 at the two parameter points Pdeb and Pfin.
") Set;
		void Set(const Standard_Real Pdeb, const Standard_Real Valdeb, const Standard_Real Pfin, const Standard_Real Valfin);

		/****** Law_S::Set ******/
		/****** md5 signature: 9a1b06c2df05c48ed33e65cf626f70e4 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Pdeb: float
Valdeb: float
Ddeb: float
Pfin: float
Valfin: float
Dfin: float

Return
-------
None

Description
-----------
Defines this S evolution law by assigning - the bounds Pdeb and Pfin of the parameter, - the values Valdeb and Valfin of the function at these two parametric bounds, and - the values Ddeb and Dfin of the first derivative of the function at these two parametric bounds.
") Set;
		void Set(const Standard_Real Pdeb, const Standard_Real Valdeb, const Standard_Real Ddeb, const Standard_Real Pfin, const Standard_Real Valfin, const Standard_Real Dfin);

};


%make_alias(Law_S)

%extend Law_S {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def law_MixBnd(*args):
	return law.MixBnd(*args)

@deprecated
def law_MixBnd(*args):
	return law.MixBnd(*args)

@deprecated
def law_MixTgt(*args):
	return law.MixTgt(*args)

@deprecated
def law_Reparametrize(*args):
	return law.Reparametrize(*args)

@deprecated
def law_Scale(*args):
	return law.Scale(*args)

@deprecated
def law_ScaleCub(*args):
	return law.ScaleCub(*args)

@deprecated
def Law_BSpline_MaxDegree(*args):
	return Law_BSpline.MaxDegree(*args)

}
