/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.7.0/refman/html/package_law.html"
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
		/****************** MixBnd ******************/
		/**** md5 signature: 7b19fad347c0d1fb788bcd0778c9990d ****/
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
This algorithm searches the knot values corresponding to the splitting of a given b-spline law into several arcs with the same continuity. the continuity order is given at the construction time. builds a 1d bspline that is near from lin with null derivatives at the extremities.
") MixBnd;
		static opencascade::handle<Law_BSpFunc> MixBnd(const opencascade::handle<Law_Linear> & Lin);

		/****************** MixBnd ******************/
		/**** md5 signature: f4ebbbb1512aebec0517f3dcee67804c ****/
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
Builds the poles of the 1d bspline that is near from lin with null derivatives at the extremities.
") MixBnd;
		static opencascade::handle<TColStd_HArray1OfReal> MixBnd(const Standard_Integer Degree, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const opencascade::handle<Law_Linear> & Lin);

		/****************** MixTgt ******************/
		/**** md5 signature: 3c3be1a2329c3b1f6f1e9955082e3637 ****/
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
Builds the poles of the 1d bspline that is null on the right side of knots(index) (on the left if nulontheright is false) and that is like a t*(1-t)(1-t) curve on the left side of knots(index) (on the right if nulontheright is false). the result curve is c1 with a derivative equal to 1. at first parameter (-1 at last parameter if nulontheright is false). warning: mults(index) must greater or equal to degree-1.
") MixTgt;
		static opencascade::handle<TColStd_HArray1OfReal> MixTgt(const Standard_Integer Degree, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Boolean NulOnTheRight, const Standard_Integer Index);

		/****************** Reparametrize ******************/
		/**** md5 signature: d8ce157352bbb7210496c72ebb0ca89a ****/
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
Computes a 1 d curve to reparametrize a curve. its an interpolation of nbpoints points calculated at quasi constant abscissa.
") Reparametrize;
		static opencascade::handle<Law_BSpline> Reparametrize(const Adaptor3d_Curve & Curve, const Standard_Real First, const Standard_Real Last, const Standard_Boolean HasDF, const Standard_Boolean HasDL, const Standard_Real DFirst, const Standard_Real DLast, const Standard_Boolean Rev, const Standard_Integer NbPoints);

		/****************** Scale ******************/
		/**** md5 signature: 15578153ee4c6edba1973e48746e0103 ****/
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
Computes a 1 d curve to scale a field of tangency. value is 1. for t = (first+last)/2 . if hasfirst value for t = first is vfirst (null derivative). if haslast value for t = last is vlast (null derivative). //! 1.  _ _/ \_ __/ \__ / vfirst ____/  vlast \____ first  last.
") Scale;
		static opencascade::handle<Law_BSpline> Scale(const Standard_Real First, const Standard_Real Last, const Standard_Boolean HasF, const Standard_Boolean HasL, const Standard_Real VFirst, const Standard_Real VLast);

		/****************** ScaleCub ******************/
		/**** md5 signature: f589f77f5b3767d16190d156ce4168ce ****/
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
		/****************** Law_BSpline ******************/
		/**** md5 signature: ddcf66ff074044c630f9815ef36c3709 ****/
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
Creates a non-rational b_spline curve on the basis <knots, multiplicities> of degree <degree>.
") Law_BSpline;
		 Law_BSpline(const TColStd_Array1OfReal & Poles, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Multiplicities, const Standard_Integer Degree, const Standard_Boolean Periodic = Standard_False);

		/****************** Law_BSpline ******************/
		/**** md5 signature: ffdefda1db70319179b16969eba3b8af ****/
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
Creates a rational b_spline curve on the basis <knots, multiplicities> of degree <degree>.
") Law_BSpline;
		 Law_BSpline(const TColStd_Array1OfReal & Poles, const TColStd_Array1OfReal & Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Multiplicities, const Standard_Integer Degree, const Standard_Boolean Periodic = Standard_False);

		/****************** Continuity ******************/
		/**** md5 signature: 4cc571878c66d538aeaf8b0affec3574 ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns the global continuity of the curve: c0: only geometric continuity, c1: continuity of the first derivative all along the curve, c2: continuity of the second derivative all along the curve, c3: continuity of the third derivative all along the curve, cn: the order of continuity is infinite. for a b-spline curve of degree d if a knot ui has a multiplicity p the b-spline curve is only cd-p continuous at ui. so the global continuity of the curve can't be greater than cd-p where p is the maximum multiplicity of the interior knots. in the interior of a knot span the curve is infinitely continuously differentiable.
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Copy ******************/
		/**** md5 signature: 7ac2d4f22e6a079e0e3da1e93c86f351 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Law_BSpline>

Description
-----------
No available documentation.
") Copy;
		opencascade::handle<Law_BSpline> Copy();

		/****************** D0 ******************/
		/**** md5 signature: 8dc4872a7316c94eced3e3171a95b737 ****/
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

		/****************** D1 ******************/
		/**** md5 signature: 296f870b71d08a28799b64ebc8e9c26a ****/
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

		/****************** D2 ******************/
		/**** md5 signature: b850fde0eb081baf40cbf7814dd7bf8f ****/
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

		/****************** D3 ******************/
		/**** md5 signature: 7358c85b1707a9a2454f8b96bf5a1da9 ****/
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

		/****************** DN ******************/
		/**** md5 signature: 7d4e6133389371147f74e8105126fd89 ****/
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
The following functions computes the point of parameter u and the derivatives at this point on the b-spline curve arc defined between the knot fromk1 and the knot tok2. u can be out of bounds [knot (fromk1), knot (tok2)] but for the computation we only use the definition of the curve between these two knots. this method is useful to compute local derivative, if the order of continuity of the whole curve is not greater enough. inside the parametric domain knot (fromk1), knot (tok2) the evaluations are the same as if we consider the whole definition of the curve. of course the evaluations are different outside this parametric domain.
") DN;
		Standard_Real DN(const Standard_Real U, const Standard_Integer N);

		/****************** Degree ******************/
		/**** md5 signature: e3276df1ce733e2c8e940db548a26d03 ****/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Computation of value and derivatives.
") Degree;
		Standard_Integer Degree();

		/****************** EndPoint ******************/
		/**** md5 signature: aa1a5c447cb485ee6b7184fe9697a0de ****/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the last point of the curve. warnings: the last point of the curve is different from the last pole of the curve if the multiplicity of the last knot is lower than degree.
") EndPoint;
		Standard_Real EndPoint();

		/****************** FirstParameter ******************/
		/**** md5 signature: 4ccedbaad83be904f510b4760c75f69c ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the parametric value of the start point of the curve. it is a knot value.
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** FirstUKnotIndex ******************/
		/**** md5 signature: cd1268c018861ca921686718cddd2c78 ****/
		%feature("compactdefaultargs") FirstUKnotIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
For a b-spline curve the first parameter (which gives the start point of the curve) is a knot value but if the multiplicity of the first knot index is lower than degree + 1 it is not the first knot of the curve. this method computes the index of the knot corresponding to the first parameter.
") FirstUKnotIndex;
		Standard_Integer FirstUKnotIndex();

		/****************** IncreaseDegree ******************/
		/**** md5 signature: 2f404362ae4c6786bc49eb532abfeb06 ****/
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
Increase the degree to <degree>. nothing is done if <degree> is lower or equal to the current degree.
") IncreaseDegree;
		void IncreaseDegree(const Standard_Integer Degree);

		/****************** IncreaseMultiplicity ******************/
		/**** md5 signature: acbc64714702b7201cc3229bfdba4081 ****/
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
Increases the multiplicity of the knot <index> to <m>. //! if <m> is lower or equal to the current multiplicity nothing is done. if <m> is higher than the degree the degree is used. if <index> is not in [firstuknotindex, lastuknotindex].
") IncreaseMultiplicity;
		void IncreaseMultiplicity(const Standard_Integer Index, const Standard_Integer M);

		/****************** IncreaseMultiplicity ******************/
		/**** md5 signature: 20329617e559bb513534e7b5d8d351fc ****/
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
Increases the multiplicities of the knots in [i1,i2] to <m>. //! for each knot if <m> is lower or equal to the current multiplicity nothing is done. if <m> is higher than the degree the degree is used. if <i1,i2> are not in [firstuknotindex, lastuknotindex].
") IncreaseMultiplicity;
		void IncreaseMultiplicity(const Standard_Integer I1, const Standard_Integer I2, const Standard_Integer M);

		/****************** IncrementMultiplicity ******************/
		/**** md5 signature: 7c6b4452fa65fae5da2a1a56ab1d1564 ****/
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
Increment the multiplicities of the knots in [i1,i2] by <m>. //! if <m> is not positive nithing is done. //! for each knot the resulting multiplicity is limited to the degree. if <i1,i2> are not in [firstuknotindex, lastuknotindex].
") IncrementMultiplicity;
		void IncrementMultiplicity(const Standard_Integer I1, const Standard_Integer I2, const Standard_Integer M);

		/****************** InsertKnot ******************/
		/**** md5 signature: 4107fd8f43066c1257644c676b582c67 ****/
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
Inserts a knot value in the sequence of knots. if <u> is an existing knot the multiplicity is increased by <m>. //! if u is not on the parameter range nothing is done. //! if the multiplicity is negative or null nothing is done. the new multiplicity is limited to the degree. //! the tolerance criterion for knots equality is the max of epsilon(u) and parametrictolerance.
") InsertKnot;
		void InsertKnot(const Standard_Real U, const Standard_Integer M = 1, const Standard_Real ParametricTolerance = 0.0, const Standard_Boolean Add = Standard_True);

		/****************** InsertKnots ******************/
		/**** md5 signature: 6518beb27958c7c7882b20b52acc844f ****/
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
Inserts a set of knots values in the sequence of knots. //! for each u = knots(i), m = mults(i) //! if <u> is an existing knot the multiplicity is increased by <m> if <add> is true, increased to <m> if <add> is false. //! if u is not on the parameter range nothing is done. //! if the multiplicity is negative or null nothing is done. the new multiplicity is limited to the degree. //! the tolerance criterion for knots equality is the max of epsilon(u) and parametrictolerance.
") InsertKnots;
		void InsertKnots(const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Real ParametricTolerance = 0.0, const Standard_Boolean Add = Standard_False);

		/****************** IsCN ******************/
		/**** md5 signature: 7f34d4987a255fd641d3dff93dba4de4 ****/
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
Returns the continuity of the curve, the curve is at least c0. raised if n < 0.
") IsCN;
		Standard_Boolean IsCN(const Standard_Integer N);

		/****************** IsClosed ******************/
		/**** md5 signature: 29709d02fadc9fcb79a766bc9679271b ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the distance between the first point and the last point of the curve is lower or equal to resolution from package gp. warnings: the first and the last point can be different from the first pole and the last pole of the curve.
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		/**** md5 signature: 62d7f554b0b7785e1f3919569dfbc68f ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the curve is periodic.
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** IsRational ******************/
		/**** md5 signature: fd4212ffa7bc30cde420e74a2c539434 ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the weights are not identical. the tolerance criterion is epsilon of the class real.
") IsRational;
		Standard_Boolean IsRational();

		/****************** Knot ******************/
		/**** md5 signature: 87780028b98a8253068f050487c4f4d5 ****/
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
Returns the knot of range index. when there is a knot with a multiplicity greater than 1 the knot is not repeated. the method multiplicity can be used to get the multiplicity of the knot. raised if index < 1 or index > nbknots.
") Knot;
		Standard_Real Knot(const Standard_Integer Index);

		/****************** KnotDistribution ******************/
		/**** md5 signature: 6b866e71367b1f5428eba6d3bcc36415 ****/
		%feature("compactdefaultargs") KnotDistribution;
		%feature("autodoc", "Return
-------
GeomAbs_BSplKnotDistribution

Description
-----------
Returns nonuniform or uniform or quasiuniform or piecewisebezier. if all the knots differ by a positive constant from the preceding knot the bspline curve can be: - uniform if all the knots are of multiplicity 1, - quasiuniform if all the knots are of multiplicity 1 except for the first and last knot which are of multiplicity degree + 1, - piecewisebezier if the first and last knots have multiplicity degree + 1 and if interior knots have multiplicity degree a piecewise bezier with only two knots is a beziercurve. else the curve is non uniform. the tolerance criterion is epsilon from class real.
") KnotDistribution;
		GeomAbs_BSplKnotDistribution KnotDistribution();

		/****************** KnotSequence ******************/
		/**** md5 signature: 16870e6acc7bcd815fb4e50aaa88ac5a ****/
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
Returns the knots sequence. in this sequence the knots with a multiplicity greater than 1 are repeated. example: k = {k1, k1, k1, k2, k3, k3, k4, k4, k4} //! raised if the length of k is not equal to nbpoles + degree + 1.
") KnotSequence;
		void KnotSequence(TColStd_Array1OfReal & K);

		/****************** Knots ******************/
		/**** md5 signature: 949cf09b8db41cbb8ab5188bcb475e56 ****/
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
Returns the knot values of the b-spline curve; //! raised if the length of k is not equal to the number of knots.
") Knots;
		void Knots(TColStd_Array1OfReal & K);

		/****************** LastParameter ******************/
		/**** md5 signature: 7cdf630921ee47ad365a5a6bafd4b46e ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the parametric value of the end point of the curve. it is a knot value.
") LastParameter;
		Standard_Real LastParameter();

		/****************** LastUKnotIndex ******************/
		/**** md5 signature: b5183e855ac73e665e20fe9cd9a25fef ****/
		%feature("compactdefaultargs") LastUKnotIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
For a bspline curve the last parameter (which gives the end point of the curve) is a knot value but if the multiplicity of the last knot index is lower than degree + 1 it is not the last knot of the curve. this method computes the index of the knot corresponding to the last parameter.
") LastUKnotIndex;
		Standard_Integer LastUKnotIndex();

		/****************** LocalD0 ******************/
		/**** md5 signature: 67f9063f60c6650e736e82ad5e95de83 ****/
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

		/****************** LocalD1 ******************/
		/**** md5 signature: b04e6a63f88ea2b5e34deb229eb8b8be ****/
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

		/****************** LocalD2 ******************/
		/**** md5 signature: e0f09f877634d736373e7b5cbf5cf8da ****/
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

		/****************** LocalD3 ******************/
		/**** md5 signature: 2e91899c058dfa66978c6e4f5218e43b ****/
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

		/****************** LocalDN ******************/
		/**** md5 signature: 2b46fe2487783db45aa0ea00e052f430 ****/
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

		/****************** LocalValue ******************/
		/**** md5 signature: 764bef5fcba4f390b1497c3df3bfbb61 ****/
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

		/****************** LocateU ******************/
		/**** md5 signature: d536ddd65ca3edfb5dd75e59f7417959 ****/
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
Locates the parametric value u in the sequence of knots. if 'withknotrepetition' is true we consider the knot's representation with repetition of multiple knot value, otherwise we consider the knot's representation with no repetition of multiple knot values. knots (i1) <= u <= knots (i2) . if i1 = i2 u is a knot value (the tolerance criterion parametrictolerance is used). . if i1 < 1 => u < knots (1) - abs(parametrictolerance) . if i2 > nbknots => u > knots (nbknots) + abs(parametrictolerance).
") LocateU;
		void LocateU(const Standard_Real U, const Standard_Real ParametricTolerance, Standard_Integer &OutValue, Standard_Integer &OutValue, const Standard_Boolean WithKnotRepetition = Standard_False);

		/****************** MaxDegree ******************/
		/**** md5 signature: 985314a0ed62b597a9bdf0f555b97bed ****/
		%feature("compactdefaultargs") MaxDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the value of the maximum degree of the normalized b-spline basis functions in this package.
") MaxDegree;
		static Standard_Integer MaxDegree();

		/****************** MovePointAndTangent ******************/
		/**** md5 signature: 48e98676b5c4d441b6b8923083347851 ****/
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
Changes the value of the law at parameter u to newvalue. and makes its derivative at u be derivative. startingcondition = -1 means first can move endingcondition = -1 means last point can move startingcondition = 0 means the first point cannot move endingcondition = 0 means the last point cannot move startingcondition = 1 means the first point and tangent cannot move endingcondition = 1 means the last point and tangent cannot move and so forth errorstatus != 0 means that there are not enough degree of freedom with the constrain to deform the curve accordingly.
") MovePointAndTangent;
		void MovePointAndTangent(const Standard_Real U, const Standard_Real NewValue, const Standard_Real Derivative, const Standard_Real Tolerance, const Standard_Integer StartingCondition, const Standard_Integer EndingCondition, Standard_Integer &OutValue);

		/****************** Multiplicities ******************/
		/**** md5 signature: 5e4cb134cc2959735c59c531d6a8b490 ****/
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
Returns the multiplicity of the knots of the curve. //! raised if the length of m is not equal to nbknots.
") Multiplicities;
		void Multiplicities(TColStd_Array1OfInteger & M);

		/****************** Multiplicity ******************/
		/**** md5 signature: 0b00002ea9c75b6fa0f22b159f127931 ****/
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
Returns the multiplicity of the knots of range index. raised if index < 1 or index > nbknots.
") Multiplicity;
		Standard_Integer Multiplicity(const Standard_Integer Index);

		/****************** NbKnots ******************/
		/**** md5 signature: ccda669299f8eba1ba0d3387af4c950e ****/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of knots. this method returns the number of knot without repetition of multiple knots.
") NbKnots;
		Standard_Integer NbKnots();

		/****************** NbPoles ******************/
		/**** md5 signature: 9a7d6d5f8a21c5833786e951bce99604 ****/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of poles.
") NbPoles;
		Standard_Integer NbPoles();

		/****************** PeriodicNormalization ******************/
		/**** md5 signature: ba1016bda06943eb982997be7f9da740 ****/
		%feature("compactdefaultargs") PeriodicNormalization;
		%feature("autodoc", "
Parameters
----------

Return
-------
U: float

Description
-----------
Returns the parameter normalized within the period if the curve is periodic: otherwise does not do anything.
") PeriodicNormalization;
		void PeriodicNormalization(Standard_Real &OutValue);

		/****************** Pole ******************/
		/**** md5 signature: 4b60eb57c0e94e2f3f596d71e602d4cd ****/
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
Returns the pole of range index. raised if index < 1 or index > nbpoles.
") Pole;
		Standard_Real Pole(const Standard_Integer Index);

		/****************** Poles ******************/
		/**** md5 signature: c54230dca164a58b2ce761e623ee934f ****/
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
Returns the poles of the b-spline curve; //! raised if the length of p is not equal to the number of poles.
") Poles;
		void Poles(TColStd_Array1OfReal & P);

		/****************** RemoveKnot ******************/
		/**** md5 signature: 9210db71a77261be541bbc23355610eb ****/
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
Decrement the knots multiplicity to <m>. if m is 0 the knot is removed. the poles sequence is modified. //! as there are two ways to compute the new poles the average is computed if the distance is lower than the <tolerance>, else false is returned. //! a low tolerance is used to prevent the modification of the curve. //! a high tolerance is used to 'smooth' the curve. //! raised if index is not in the range [firstuknotindex, lastuknotindex] pole insertion and pole removing this operation is limited to the uniform or quasiuniform bsplinecurve. the knot values are modified . if the bspline is nonuniform or piecewise bezier an exception construction error is raised.
") RemoveKnot;
		Standard_Boolean RemoveKnot(const Standard_Integer Index, const Standard_Integer M, const Standard_Real Tolerance);

		/****************** Resolution ******************/
		/**** md5 signature: 67eeda2a737d12a02a1311baf9f9467b ****/
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
Given tolerance3d returns utolerance such that if f(t) is the curve we have | t1 - t0| < utolerance ===> |f(t1) - f(t0)| < tolerance3d.
") Resolution;
		void Resolution(const Standard_Real Tolerance3D, Standard_Real &OutValue);

		/****************** Reverse ******************/
		/**** md5 signature: b751d6874fc026e19a7a6cb37e9ac1b4 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Changes the direction of parametrization of <self>. the knot sequence is modified, the firstparameter and the lastparameter are not modified. the startpoint of the initial curve becomes the endpoint of the reversed curve and the endpoint of the initial curve becomes the startpoint of the reversed curve.
") Reverse;
		void Reverse();

		/****************** ReversedParameter ******************/
		/**** md5 signature: d34103f7eed393c7e93e6ef5b52b2682 ****/
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
Returns the parameter on the reversed curve for the point of parameter u on <self>. //! returns ufirst + ulast - u.
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****************** Segment ******************/
		/**** md5 signature: fb72a1522f77fa9f134af7f8bf81def8 ****/
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
Segments the curve between u1 and u2. the control points are modified, the first and the last point are not the same. warnings: even if <self> is not closed it can become closed after the segmentation for example if u1 or u2 are out of the bounds of the curve <self> or if the curve makes loop. after the segmentation the length of a curve can be null. raises if u2 < u1.
") Segment;
		void Segment(const Standard_Real U1, const Standard_Real U2);

		/****************** SetKnot ******************/
		/**** md5 signature: 24248dddb124af2118f7043ae254694e ****/
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
Changes the knot of range index. the multiplicity of the knot is not modified. raised if k >= knots(index+1) or k <= knots(index-1). raised if index < 1 || index > nbknots.
") SetKnot;
		void SetKnot(const Standard_Integer Index, const Standard_Real K);

		/****************** SetKnot ******************/
		/**** md5 signature: 12123e73421d28330eec5dae317ac18f ****/
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
Changes the knot of range index with its multiplicity. you can increase the multiplicity of a knot but it is not allowed to decrease the multiplicity of an existing knot. //! raised if k >= knots(index+1) or k <= knots(index-1). raised if m is greater than degree or lower than the previous multiplicity of knot of range index. raised if index < 1 || index > nbknots.
") SetKnot;
		void SetKnot(const Standard_Integer Index, const Standard_Real K, const Standard_Integer M);

		/****************** SetKnots ******************/
		/**** md5 signature: d319c647ea235edd171c661a477e0338 ****/
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
Changes all the knots of the curve the multiplicity of the knots are not modified. //! raised if there is an index such that k (index+1) <= k (index). //! raised if k.lower() < 1 or k.upper() > nbknots.
") SetKnots;
		void SetKnots(const TColStd_Array1OfReal & K);

		/****************** SetNotPeriodic ******************/
		/**** md5 signature: ccfbd171d2b38df3531b77ecbc51dcae ****/
		%feature("compactdefaultargs") SetNotPeriodic;
		%feature("autodoc", "Return
-------
None

Description
-----------
Makes a non periodic curve. if the curve was non periodic the curve is not modified.
") SetNotPeriodic;
		void SetNotPeriodic();

		/****************** SetOrigin ******************/
		/**** md5 signature: bcb4756c4db11bf7ed3d05d2f98659f0 ****/
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
Set the origin of a periodic curve at knot(index) knotvector and poles are modified. raised if the curve is not periodic raised if index not in the range [firstuknotindex , lastuknotindex].
") SetOrigin;
		void SetOrigin(const Standard_Integer Index);

		/****************** SetPeriodic ******************/
		/**** md5 signature: 3d498279f2dd83a2ab9aa88181da253f ****/
		%feature("compactdefaultargs") SetPeriodic;
		%feature("autodoc", "Return
-------
None

Description
-----------
Makes a closed b-spline into a periodic curve. the curve is periodic if the knot sequence is periodic and if the curve is closed (the tolerance criterion is resolution from gp). the period t is equal to knot(lastuknotindex) - knot(firstuknotindex). a periodic b-spline can be uniform or not. raised if the curve is not closed.
") SetPeriodic;
		void SetPeriodic();

		/****************** SetPole ******************/
		/**** md5 signature: c543141afef84d45aee3427438896497 ****/
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
Substitutes the pole of range index with p. //! raised if index < 1 || index > nbpoles.
") SetPole;
		void SetPole(const Standard_Integer Index, const Standard_Real P);

		/****************** SetPole ******************/
		/**** md5 signature: 41bc8db65ef7348f416a0f41e206176a ****/
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
Substitutes the pole and the weight of range index. if the curve <self> is not rational it can become rational if the curve was rational it can become non rational //! raised if index < 1 || index > nbpoles raised if weight <= 0.0.
") SetPole;
		void SetPole(const Standard_Integer Index, const Standard_Real P, const Standard_Real Weight);

		/****************** SetWeight ******************/
		/**** md5 signature: 4e7aa00d12e09e9b776d4bf66f07ecec ****/
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
Changes the weight for the pole of range index. if the curve was non rational it can become rational. if the curve was rational it can become non rational. //! raised if index < 1 || index > nbpoles raised if weight <= 0.0.
") SetWeight;
		void SetWeight(const Standard_Integer Index, const Standard_Real Weight);

		/****************** StartPoint ******************/
		/**** md5 signature: 6de4f7eb4e60e5292b0a68de88b0afcc ****/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the start point of the curve. warnings: this point is different from the first pole of the curve if the multiplicity of the first knot is lower than degree.
") StartPoint;
		Standard_Real StartPoint();

		/****************** Value ******************/
		/**** md5 signature: 259d0381438deb1ea24f676e0632e216 ****/
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

		/****************** Weight ******************/
		/**** md5 signature: 70cf193bf7498ec22102a906ea9db6f5 ****/
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
Returns the weight of the pole of range index . raised if index < 1 or index > nbpoles.
") Weight;
		Standard_Real Weight(const Standard_Integer Index);

		/****************** Weights ******************/
		/**** md5 signature: dd63733e96eafbaacbd2d7b600471c30 ****/
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
Returns the weights of the b-spline curve; //! raised if the length of w is not equal to nbpoles.
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
		/****************** Law_BSplineKnotSplitting ******************/
		/**** md5 signature: 0176cf7ca612fa56b641a0a54f53170e ****/
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
Locates the knot values which correspond to the segmentation of the curve into arcs with a continuity equal to continuityrange. //! raised if continuityrange is not greater or equal zero.
") Law_BSplineKnotSplitting;
		 Law_BSplineKnotSplitting(const opencascade::handle<Law_BSpline> & BasisLaw, const Standard_Integer ContinuityRange);

		/****************** NbSplits ******************/
		/**** md5 signature: 4531d20d48cc2f1c4ba8fba36f455258 ****/
		%feature("compactdefaultargs") NbSplits;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of knots corresponding to the splitting.
") NbSplits;
		Standard_Integer NbSplits();

		/****************** SplitValue ******************/
		/**** md5 signature: 721f3b88e9b98541767484bae1df7e27 ****/
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
Returns the index of the knot corresponding to the splitting of range index. //! raised if index < 1 or index > nbsplits.
") SplitValue;
		Standard_Integer SplitValue(const Standard_Integer Index);

		/****************** Splitting ******************/
		/**** md5 signature: 735443fa5e885793b9df881715b055c2 ****/
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
Returns the indexes of the bspline curve knots corresponding to the splitting. //! raised if the length of splitvalues is not equal to nbsplit.
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
		/****************** Bounds ******************/
		/**** md5 signature: 2dfcb21f440f89dad8f64131851fa810 ****/
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

		/****************** Continuity ******************/
		/**** md5 signature: 8dbb475c198ca068fb275dadeaaecf82 ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		virtual GeomAbs_Shape Continuity();

		/****************** D1 ******************/
		/**** md5 signature: c203a9919f51b45a6b18a551e4c933c3 ****/
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
Returns the value f and the first derivative d of the function at the point of parameter x.
") D1;
		virtual void D1(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** D2 ******************/
		/**** md5 signature: 8812da4cd148a429405a5ef1ca2f25e3 ****/
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
Returns the value, first and seconde derivatives at parameter x.
") D2;
		virtual void D2(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Intervals ******************/
		/**** md5 signature: 7d2bf038a9213acf1609cc1244a3ee03 ****/
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
Stores in <t> the parameters bounding the intervals of continuity <s>. the array must provide enough room to accommodate for the parameters, i.e. t.length() > nbintervals().
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** NbIntervals ******************/
		/**** md5 signature: cb7f68d4b2c30f29cd5ba6f81443d314 ****/
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
Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** Trim ******************/
		/**** md5 signature: f8e78845e5df643d7de59e777d3b29b4 ****/
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
Returns a law equivalent of <self> between parameters <first> and <last>. <tol> is used to test for 3d points confusion. it is usfule to determines the derivatives in these values <first> and <last> if the law is not cn.
") Trim;
		virtual opencascade::handle<Law_Function> Trim(const Standard_Real PFirst, const Standard_Real PLast, const Standard_Real Tol);

		/****************** Value ******************/
		/**** md5 signature: c0f739be8882045b477e5965ae854310 ****/
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
Returns the value of the function at the point of parameter x.
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
		/****************** Law_Interpolate ******************/
		/**** md5 signature: aa0d1eb6b8f2ce7f2a34a7b1144f35d5 ****/
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
Tolerance is to check if the points are not too close to one an other. it is also used to check if the tangent vector is not too small. there should be at least 2 points. if periodicflag is true then the curve will be periodic be periodic.
") Law_Interpolate;
		 Law_Interpolate(const opencascade::handle<TColStd_HArray1OfReal> & Points, const Standard_Boolean PeriodicFlag, const Standard_Real Tolerance);

		/****************** Law_Interpolate ******************/
		/**** md5 signature: bafa05254f37788638580f8b10d3fd00 ****/
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
Tolerance is to check if the points are not too close to one an other. it is also used to check if the tangent vector is not too small. there should be at least 2 points. if periodicflag is true then the curve will be periodic be periodic.
") Law_Interpolate;
		 Law_Interpolate(const opencascade::handle<TColStd_HArray1OfReal> & Points, const opencascade::handle<TColStd_HArray1OfReal> & Parameters, const Standard_Boolean PeriodicFlag, const Standard_Real Tolerance);

		/****************** Curve ******************/
		/**** md5 signature: 532bf252f584bdb8f5e20aed8fa40bce ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Law_BSpline>

Description
-----------
No available documentation.
") Curve;
		const opencascade::handle<Law_BSpline> & Curve();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****************** Load ******************/
		/**** md5 signature: 8f771b9f76c028b192478032313f9c5d ****/
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
Loads initial and final tangents if any.
") Load;
		void Load(const Standard_Real InitialTangent, const Standard_Real FinalTangent);

		/****************** Load ******************/
		/**** md5 signature: 1072f5d77a808ecf12baa4f8d28262ed ****/
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
Loads the tangents. we should have as many tangents as they are points in the array if tangentflags.value(i) is standard_true use the tangent tangents.value(i) otherwise the tangent is not constrained.
") Load;
		void Load(const TColStd_Array1OfReal & Tangents, const opencascade::handle<TColStd_HArray1OfBoolean> & TangentFlags);

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
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
		/****************** Law_BSpFunc ******************/
		/**** md5 signature: 00d351a4159535c6bcad09293d08c0d9 ****/
		%feature("compactdefaultargs") Law_BSpFunc;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Law_BSpFunc;
		 Law_BSpFunc();

		/****************** Law_BSpFunc ******************/
		/**** md5 signature: 2b00be194f3d42245535db64e407f43a ****/
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

		/****************** Bounds ******************/
		/**** md5 signature: 109b33fbef4fa3e688fc253ce6374e64 ****/
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

		/****************** Continuity ******************/
		/**** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Curve ******************/
		/**** md5 signature: cdfbc6f051f501ddd771545c4bedd7e7 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Law_BSpline>

Description
-----------
No available documentation.
") Curve;
		opencascade::handle<Law_BSpline> Curve();

		/****************** D1 ******************/
		/**** md5 signature: cf7042ba3595c92e51856267ec678265 ****/
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

		/****************** D2 ******************/
		/**** md5 signature: 112e5f46e90df7f80b022aac83ebf670 ****/
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

		/****************** Intervals ******************/
		/**** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ****/
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
Stores in <t> the parameters bounding the intervals of continuity <s>. the array must provide enough room to accommodate for the parameters, i.e. t.length() > nbintervals().
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** NbIntervals ******************/
		/**** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ****/
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
Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** SetCurve ******************/
		/**** md5 signature: 96498826c71d9588cdfd5a8a18018a7b ****/
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

		/****************** Trim ******************/
		/**** md5 signature: e3ce5ec219196d07cdf6d267682f4d69 ****/
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
Returns a law equivalent of <self> between parameters <first> and <last>. <tol> is used to test for 3d points confusion. it is usfule to determines the derivatives in these values <first> and <last> if the law is not cn.
") Trim;
		opencascade::handle<Law_Function> Trim(const Standard_Real PFirst, const Standard_Real PLast, const Standard_Real Tol);

		/****************** Value ******************/
		/**** md5 signature: ab3c530c57b52577e74270dde01981c6 ****/
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
		/****************** Law_Composite ******************/
		/**** md5 signature: 9fad703504dbdf0dfe348df1242a128e ****/
		%feature("compactdefaultargs") Law_Composite;
		%feature("autodoc", "Return
-------
None

Description
-----------
Construct an empty law.
") Law_Composite;
		 Law_Composite();

		/****************** Law_Composite ******************/
		/**** md5 signature: b51d805042e8e834fd1c73c392ffe7bf ****/
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
Construct an empty, trimmed law.
") Law_Composite;
		 Law_Composite(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****************** Bounds ******************/
		/**** md5 signature: 109b33fbef4fa3e688fc253ce6374e64 ****/
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

		/****************** ChangeElementaryLaw ******************/
		/**** md5 signature: 001020016f6913c8feeb8af262c638d4 ****/
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
Returns the elementary function of the composite used to compute at parameter w.
") ChangeElementaryLaw;
		opencascade::handle<Law_Function> & ChangeElementaryLaw(const Standard_Real W);

		/****************** ChangeLaws ******************/
		/**** md5 signature: 558d152f4bf700f26bd58a0cdffadaae ****/
		%feature("compactdefaultargs") ChangeLaws;
		%feature("autodoc", "Return
-------
Law_Laws

Description
-----------
No available documentation.
") ChangeLaws;
		Law_Laws & ChangeLaws();

		/****************** Continuity ******************/
		/**** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** D1 ******************/
		/**** md5 signature: cf7042ba3595c92e51856267ec678265 ****/
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
Returns the value and the first derivative at parameter x.
") D1;
		void D1(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** D2 ******************/
		/**** md5 signature: 112e5f46e90df7f80b022aac83ebf670 ****/
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
Returns the value, first and second derivatives at parameter x.
") D2;
		void D2(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Intervals ******************/
		/**** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ****/
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
Stores in <t> the parameters bounding the intervals of continuity <s>. the array must provide enough room to accommodate for the parameters, i.e. t.length() > nbintervals().
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsPeriodic ******************/
		/**** md5 signature: 62d7f554b0b7785e1f3919569dfbc68f ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** NbIntervals ******************/
		/**** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ****/
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
Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** SetPeriodic ******************/
		/**** md5 signature: 3d498279f2dd83a2ab9aa88181da253f ****/
		%feature("compactdefaultargs") SetPeriodic;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") SetPeriodic;
		void SetPeriodic();

		/****************** Trim ******************/
		/**** md5 signature: e3ce5ec219196d07cdf6d267682f4d69 ****/
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
Returns a law equivalent of <self> between parameters <first> and <last>. <tol> is used to test for 3d points confusion. it is usfule to determines the derivatives in these values <first> and <last> if the law is not cn.
") Trim;
		opencascade::handle<Law_Function> Trim(const Standard_Real PFirst, const Standard_Real PLast, const Standard_Real Tol);

		/****************** Value ******************/
		/**** md5 signature: ab3c530c57b52577e74270dde01981c6 ****/
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
Returns the value at parameter x.
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
		/****************** Law_Constant ******************/
		/**** md5 signature: 0fd8cc567137ff55c50de3ad074030d4 ****/
		%feature("compactdefaultargs") Law_Constant;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Law_Constant;
		 Law_Constant();

		/****************** Bounds ******************/
		/**** md5 signature: 109b33fbef4fa3e688fc253ce6374e64 ****/
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

		/****************** Continuity ******************/
		/**** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns geomabs_cn.
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** D1 ******************/
		/**** md5 signature: cf7042ba3595c92e51856267ec678265 ****/
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
Returns the value and the first derivative at parameter x.
") D1;
		void D1(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** D2 ******************/
		/**** md5 signature: 112e5f46e90df7f80b022aac83ebf670 ****/
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
Returns the value, first and second derivatives at parameter x.
") D2;
		void D2(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Intervals ******************/
		/**** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ****/
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

		/****************** NbIntervals ******************/
		/**** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ****/
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

		/****************** Set ******************/
		/**** md5 signature: 14aa6a38c1de36b883fe65df941453f5 ****/
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
Set the radius and the range of the constant law.
") Set;
		void Set(const Standard_Real Radius, const Standard_Real PFirst, const Standard_Real PLast);

		/****************** Trim ******************/
		/**** md5 signature: e3ce5ec219196d07cdf6d267682f4d69 ****/
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

		/****************** Value ******************/
		/**** md5 signature: ab3c530c57b52577e74270dde01981c6 ****/
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
Returns the value at parameter x.
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
		/****************** Law_Linear ******************/
		/**** md5 signature: 7e7e2a11cadadc07bc93c15533d9991c ****/
		%feature("compactdefaultargs") Law_Linear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty linear evolution law.
") Law_Linear;
		 Law_Linear();

		/****************** Bounds ******************/
		/**** md5 signature: 109b33fbef4fa3e688fc253ce6374e64 ****/
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

		/****************** Continuity ******************/
		/**** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns geomabs_cn.
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** D1 ******************/
		/**** md5 signature: cf7042ba3595c92e51856267ec678265 ****/
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
Returns the value f and the first derivative d of this function at the point of parameter x.
") D1;
		void D1(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** D2 ******************/
		/**** md5 signature: 112e5f46e90df7f80b022aac83ebf670 ****/
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
Returns the value, first and second derivatives at parameter x.
") D2;
		void D2(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Intervals ******************/
		/**** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ****/
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

		/****************** NbIntervals ******************/
		/**** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ****/
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

		/****************** Set ******************/
		/**** md5 signature: a9e7ebf4e40f181869e8f48dce50b28b ****/
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
Defines this linear evolution law by assigning both: - the bounds pdeb and pfin of the parameter, and - the values valdeb and valfin of the function at these two parametric bounds.
") Set;
		void Set(const Standard_Real Pdeb, const Standard_Real Valdeb, const Standard_Real Pfin, const Standard_Real Valfin);

		/****************** Trim ******************/
		/**** md5 signature: e3ce5ec219196d07cdf6d267682f4d69 ****/
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
Returns a law equivalent of <self> between parameters <first> and <last>. <tol> is used to test for 3d points confusion. it is usfule to determines the derivatives in these values <first> and <last> if the law is not cn.
") Trim;
		opencascade::handle<Law_Function> Trim(const Standard_Real PFirst, const Standard_Real PLast, const Standard_Real Tol);

		/****************** Value ******************/
		/**** md5 signature: ab3c530c57b52577e74270dde01981c6 ****/
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
Returns the value of this function at the point of parameter x.
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
		/****************** Law_Interpol ******************/
		/**** md5 signature: 9f0b8feafcfd29beb68fa82ca43a2583 ****/
		%feature("compactdefaultargs") Law_Interpol;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty interpolative evolution law. the function set is used to define the law.
") Law_Interpol;
		 Law_Interpol();

		/****************** Set ******************/
		/**** md5 signature: 4b5522f818f9f85342cb46d060e477a7 ****/
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
Defines this evolution law by interpolating the set of 2d points parandrad. the y coordinate of a point of parandrad is the value of the function at the parameter point given by its x coordinate. if periodic is true, this function is assumed to be periodic. warning - the x coordinates of points in the table parandrad must be given in ascendant order. - if periodic is true, the first and last y coordinates of points in the table parandrad are assumed to be equal. in addition, with the second syntax, dd and df are also assumed to be equal. if this is not the case, set uses the first value(s) as last value(s).
") Set;
		void Set(const TColgp_Array1OfPnt2d & ParAndRad, const Standard_Boolean Periodic = Standard_False);

		/****************** Set ******************/
		/**** md5 signature: 437b6f2ff340656befcd0f8219e42069 ****/
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
Defines this evolution law by interpolating the set of 2d points parandrad. the y coordinate of a point of parandrad is the value of the function at the parameter point given by its x coordinate. if periodic is true, this function is assumed to be periodic. in the second syntax, dd and df define the values of the first derivative of the function at its first and last points. warning - the x coordinates of points in the table parandrad must be given in ascendant order. - if periodic is true, the first and last y coordinates of points in the table parandrad are assumed to be equal. in addition, with the second syntax, dd and df are also assumed to be equal. if this is not the case, set uses the first value(s) as last value(s).
") Set;
		void Set(const TColgp_Array1OfPnt2d & ParAndRad, const Standard_Real Dd, const Standard_Real Df, const Standard_Boolean Periodic = Standard_False);

		/****************** SetInRelative ******************/
		/**** md5 signature: 97e8b2c0568223ee320047d91bc3bb07 ****/
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

		/****************** SetInRelative ******************/
		/**** md5 signature: 3b4be520e8ff5d3a1675c1bace32a4d5 ****/
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
		/****************** Law_S ******************/
		/**** md5 signature: c7cfd18abe4bb6c5ffce22425f8f6055 ****/
		%feature("compactdefaultargs") Law_S;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty 's' evolution law.
") Law_S;
		 Law_S();

		/****************** Set ******************/
		/**** md5 signature: a9e7ebf4e40f181869e8f48dce50b28b ****/
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
Defines this s evolution law by assigning both: - the bounds pdeb and pfin of the parameter, and - the values valdeb and valfin of the function at these two parametric bounds. the function is assumed to have the first derivatives equal to 0 at the two parameter points pdeb and pfin.
") Set;
		void Set(const Standard_Real Pdeb, const Standard_Real Valdeb, const Standard_Real Pfin, const Standard_Real Valfin);

		/****************** Set ******************/
		/**** md5 signature: 9a1b06c2df05c48ed33e65cf626f70e4 ****/
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
Defines this s evolution law by assigning - the bounds pdeb and pfin of the parameter, - the values valdeb and valfin of the function at these two parametric bounds, and - the values ddeb and dfin of the first derivative of the function at these two parametric bounds.
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
