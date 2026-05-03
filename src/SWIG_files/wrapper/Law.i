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
#include<Adaptor3d_module.hxx>
#include<GeomAbs_module.hxx>
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
%import Adaptor3d.i
%import GeomAbs.i

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
		/****** md5 signature: 10da63d5add4b46ad80b80921983d73e ******/
		%feature("compactdefaultargs") MixBnd;
		%feature("autodoc", "
Parameters
----------
Degree: int
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int>
Lin: Law_Linear

Return
-------
opencascade::handle<NCollection_HArray1<double>>

Description
-----------
Builds the poles of the 1d bspline that is near from Lin with null derivatives at the extremities.
") MixBnd;
		static opencascade::handle<NCollection_HArray1<double>> MixBnd(const int Degree, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> & Mults, const opencascade::handle<Law_Linear> & Lin);

		/****** Law::MixTgt ******/
		/****** md5 signature: 613240ab2d504d09ab45141aa92a08a3 ******/
		%feature("compactdefaultargs") MixTgt;
		%feature("autodoc", "
Parameters
----------
Degree: int
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int>
NulOnTheRight: bool
Index: int

Return
-------
opencascade::handle<NCollection_HArray1<double>>

Description
-----------
Builds the poles of the 1d bspline that is null on the right side of Knots(Index) (on the left if NulOnTheRight is false) and that is like a t*(1-t)(1-t) curve on the left side of Knots(Index) (on the right if NulOnTheRight is false). The result curve is C1 with a derivative equal to 1. at first parameter (-1 at last parameter if NulOnTheRight is false). Warning: Mults(Index) must greater or equal to degree-1.
") MixTgt;
		static opencascade::handle<NCollection_HArray1<double>> MixTgt(const int Degree, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> & Mults, const bool NulOnTheRight, const int Index);

		/****** Law::Reparametrize ******/
		/****** md5 signature: 575e532b4e248bef6c0c09b71b745518 ******/
		%feature("compactdefaultargs") Reparametrize;
		%feature("autodoc", "
Parameters
----------
Curve: Adaptor3d_Curve
First: double
Last: double
HasDF: bool
HasDL: bool
DFirst: double
DLast: double
Rev: bool
NbPoints: int

Return
-------
opencascade::handle<Law_BSpline>

Description
-----------
Computes a 1d curve to reparametrize a curve. Its an interpolation of NbPoints points calculated at quasi constant abscissa.
") Reparametrize;
		static opencascade::handle<Law_BSpline> Reparametrize(const Adaptor3d_Curve & Curve, const double First, const double Last, const bool HasDF, const bool HasDL, const double DFirst, const double DLast, const bool Rev, const int NbPoints);

		/****** Law::Scale ******/
		/****** md5 signature: 00f6248b993aaa8ca6a6564e74d4ae8a ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double
HasF: bool
HasL: bool
VFirst: double
VLast: double

Return
-------
opencascade::handle<Law_BSpline>

Description
-----------
Computes a 1d curve to scale a field of tangency. Value is 1. for t = (First+Last)/2 . If HasFirst value for t = First is VFirst (null derivative). If HasLast value for t = Last is VLast (null derivative). //! 1.  _ _/ \_ __/ \__ / VFirst ____/ VLast \____ First  Last.
") Scale;
		static opencascade::handle<Law_BSpline> Scale(const double First, const double Last, const bool HasF, const bool HasL, const double VFirst, const double VLast);

		/****** Law::ScaleCub ******/
		/****** md5 signature: d43fe746d872dd351842eea4128edff2 ******/
		%feature("compactdefaultargs") ScaleCub;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double
HasF: bool
HasL: bool
VFirst: double
VLast: double

Return
-------
opencascade::handle<Law_BSpline>

Description
-----------
No available documentation.
") ScaleCub;
		static opencascade::handle<Law_BSpline> ScaleCub(const double First, const double Last, const bool HasF, const bool HasL, const double VFirst, const double VLast);

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
		/****** md5 signature: 640ce716f8006c148c1e45a641a61384 ******/
		%feature("compactdefaultargs") Law_BSpline;
		%feature("autodoc", "
Parameters
----------
Poles: NCollection_Array1<double>
Knots: NCollection_Array1<double>
Multiplicities: NCollection_Array1<int>
Degree: int
Periodic: bool (optional, default to false)

Return
-------
None

Description
-----------
Creates a non-rational B_spline curve on the basis <Knots, Multiplicities> of degree <Degree>.
") Law_BSpline;
		 Law_BSpline(const NCollection_Array1<double> & Poles, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> & Multiplicities, const int Degree, const bool Periodic = false);

		/****** Law_BSpline::Law_BSpline ******/
		/****** md5 signature: e4676a69c0173545cbc9a1b8ae2d879c ******/
		%feature("compactdefaultargs") Law_BSpline;
		%feature("autodoc", "
Parameters
----------
Poles: NCollection_Array1<double>
Weights: NCollection_Array1<double>
Knots: NCollection_Array1<double>
Multiplicities: NCollection_Array1<int>
Degree: int
Periodic: bool (optional, default to false)

Return
-------
None

Description
-----------
Creates a rational B_spline curve on the basis <Knots, Multiplicities> of degree <Degree>.
") Law_BSpline;
		 Law_BSpline(const NCollection_Array1<double> & Poles, const NCollection_Array1<double> & Weights, const NCollection_Array1<double> & Knots, const NCollection_Array1<int> & Multiplicities, const int Degree, const bool Periodic = false);

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
		/****** md5 signature: b3b7f230f493fff729cfff32adceb159 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
P: double

Description
-----------
No available documentation.
") D0;
		void D0(const double U, Standard_Real &OutValue);

		/****** Law_BSpline::D1 ******/
		/****** md5 signature: e15998fccf1a20d31bccd800618ad5f6 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
P: double
V1: double

Description
-----------
No available documentation.
") D1;
		void D1(const double U, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_BSpline::D2 ******/
		/****** md5 signature: 27839ea3d8494d0aaf5c92ae5eaa0373 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
P: double
V1: double
V2: double

Description
-----------
No available documentation.
") D2;
		void D2(const double U, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_BSpline::D3 ******/
		/****** md5 signature: 3fb9fe7f52f018ffec64696240fe469c ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
P: double
V1: double
V2: double
V3: double

Description
-----------
No available documentation.
") D3;
		void D3(const double U, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_BSpline::DN ******/
		/****** md5 signature: 32996863b133edadd53b030037abdbac ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: double
N: int

Return
-------
double

Description
-----------
The following functions computes the point of parameter U and the derivatives at this point on the B-spline curve arc defined between the knot FromK1 and the knot ToK2. U can be out of bounds [Knot (FromK1), Knot (ToK2)] but for the computation we only use the definition of the curve between these two knots. This method is useful to compute local derivative, if the order of continuity of the whole curve is not greater enough. Inside the parametric domain Knot (FromK1), Knot (ToK2) the evaluations are the same as if we consider the whole definition of the curve. Of course the evaluations are different outside this parametric domain.
") DN;
		double DN(const double U, const int N);

		/****** Law_BSpline::Degree ******/
		/****** md5 signature: 41ab768385e3189d3d3bc517c9606dbb ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Computation of value and derivatives.
") Degree;
		int Degree();

		/****** Law_BSpline::EndPoint ******/
		/****** md5 signature: 3e23de04a9d5c32ec05c6ddd9d7eff92 ******/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the last point of the curve. Warnings: The last point of the curve is different from the last pole of the curve if the multiplicity of the last knot is lower than Degree.
") EndPoint;
		double EndPoint();

		/****** Law_BSpline::FirstParameter ******/
		/****** md5 signature: 663a02fdcfecea2f8437f306e48dfc6b ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the parametric value of the start point of the curve. It is a knot value.
") FirstParameter;
		double FirstParameter();

		/****** Law_BSpline::FirstUKnotIndex ******/
		/****** md5 signature: 73211d64126e1b184f22787c35589527 ******/
		%feature("compactdefaultargs") FirstUKnotIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
For a B-spline curve the first parameter (which gives the start point of the curve) is a knot value but if the multiplicity of the first knot index is lower than Degree + 1 it is not the first knot of the curve. This method computes the index of the knot corresponding to the first parameter.
") FirstUKnotIndex;
		int FirstUKnotIndex();

		/****** Law_BSpline::IncreaseDegree ******/
		/****** md5 signature: bedab57b39ff02828eefe07c657320e1 ******/
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
		void IncreaseDegree(const int Degree);

		/****** Law_BSpline::IncreaseMultiplicity ******/
		/****** md5 signature: 3546b162d433c77b2281ee8ee90f0cfb ******/
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
		void IncreaseMultiplicity(const int Index, const int M);

		/****** Law_BSpline::IncreaseMultiplicity ******/
		/****** md5 signature: 338e0e1466ae655261a8fdb422f3c746 ******/
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
		void IncreaseMultiplicity(const int I1, const int I2, const int M);

		/****** Law_BSpline::IncrementMultiplicity ******/
		/****** md5 signature: ae8bd1f92cb1267858ba8100c2a97184 ******/
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
Increment the multiplicities of the knots in [I1,I2] by <M>. //! If <M> is not positive nothing is done. //! For each knot the resulting multiplicity is limited to the Degree. If <I1,I2> are not in [FirstUKnotIndex, LastUKnotIndex].
") IncrementMultiplicity;
		void IncrementMultiplicity(const int I1, const int I2, const int M);

		/****** Law_BSpline::InsertKnot ******/
		/****** md5 signature: d4ee11baf8f5c45791b9ed98a2167173 ******/
		%feature("compactdefaultargs") InsertKnot;
		%feature("autodoc", "
Parameters
----------
U: double
M: int (optional, default to 1)
ParametricTolerance: double (optional, default to 0.0)
Add: bool (optional, default to true)

Return
-------
None

Description
-----------
Inserts a knot value in the sequence of knots. If <U> is an existing knot the multiplicity is increased by <M>. //! If U is not on the parameter range nothing is done. //! If the multiplicity is negative or null nothing is done. The new multiplicity is limited to the degree. //! The tolerance criterion for knots equality is the max of Epsilon(U) and ParametricTolerance.
") InsertKnot;
		void InsertKnot(const double U, const int M = 1, const double ParametricTolerance = 0.0, const bool Add = true);

		/****** Law_BSpline::InsertKnots ******/
		/****** md5 signature: 566872a4790cfd3823ae734c0748a45d ******/
		%feature("compactdefaultargs") InsertKnots;
		%feature("autodoc", "
Parameters
----------
Knots: NCollection_Array1<double>
Mults: NCollection_Array1<int>
ParametricTolerance: double (optional, default to 0.0)
Add: bool (optional, default to false)

Return
-------
None

Description
-----------
Inserts a set of knots values in the sequence of knots. //! For each U = Knots(i), M = Mults(i) //! If <U> is an existing knot the multiplicity is increased by <M> if <Add> is True, increased to <M> if <Add> is False. //! If U is not on the parameter range nothing is done. //! If the multiplicity is negative or null nothing is done. The new multiplicity is limited to the degree. //! The tolerance criterion for knots equality is the max of Epsilon(U) and ParametricTolerance.
") InsertKnots;
		void InsertKnots(const NCollection_Array1<double> & Knots, const NCollection_Array1<int> & Mults, const double ParametricTolerance = 0.0, const bool Add = false);

		/****** Law_BSpline::IsCN ******/
		/****** md5 signature: 1b01b4a36ecc507b96a58e616c23d89c ******/
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
		bool IsCN(const int N);

		/****** Law_BSpline::IsClosed ******/
		/****** md5 signature: 66fc0caa1853d24780b1d28b8296bc6c ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the distance between the first point and the last point of the curve is lower or equal to Resolution from package gp. Warnings: The first and the last point can be different from the first pole and the last pole of the curve.
") IsClosed;
		bool IsClosed();

		/****** Law_BSpline::IsPeriodic ******/
		/****** md5 signature: d36764d6f9b1283d23b2bfdabe28da79 ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the curve is periodic.
") IsPeriodic;
		bool IsPeriodic();

		/****** Law_BSpline::IsRational ******/
		/****** md5 signature: 2d134f58b1ac19806ba32cb72ce44772 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the weights are not identical. The tolerance criterion is Epsilon of the class Real.
") IsRational;
		bool IsRational();

		/****** Law_BSpline::Knot ******/
		/****** md5 signature: 1f8adaf53c02059612473e2f4f2e5b01 ******/
		%feature("compactdefaultargs") Knot;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
Returns the knot of range Index. When there is a knot with a multiplicity greater than 1 the knot is not repeated. The method Multiplicity can be used to get the multiplicity of the Knot. Raised if Index < 1 or Index > NbKnots.
") Knot;
		double Knot(const int Index);

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
		/****** md5 signature: 1b7301fa6b31d7a4f5ea6086e2fd0bec ******/
		%feature("compactdefaultargs") KnotSequence;
		%feature("autodoc", "
Parameters
----------
K: NCollection_Array1<double>

Return
-------
None

Description
-----------
Returns the knots sequence. In this sequence the knots with a multiplicity greater than 1 are repeated. Example: K = {k1, k1, k1, k2, k3, k3, k4, k4, k4} //! Raised if the length of K is not equal to NbPoles + Degree + 1.
") KnotSequence;
		void KnotSequence(NCollection_Array1<double> & K);

		/****** Law_BSpline::Knots ******/
		/****** md5 signature: 28e846af74f6d8e9d9bca42676b511f9 ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
K: NCollection_Array1<double>

Return
-------
None

Description
-----------
returns the knot values of the B-spline curve; //! Raised if the length of K is not equal to the number of knots.
") Knots;
		void Knots(NCollection_Array1<double> & K);

		/****** Law_BSpline::LastParameter ******/
		/****** md5 signature: fca5164159fd9f44a10664b338b6e402 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the parametric value of the end point of the curve. It is a knot value.
") LastParameter;
		double LastParameter();

		/****** Law_BSpline::LastUKnotIndex ******/
		/****** md5 signature: fdb1b3a0341af13d2cac11b5f8f49486 ******/
		%feature("compactdefaultargs") LastUKnotIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
For a BSpline curve the last parameter (which gives the end point of the curve) is a knot value but if the multiplicity of the last knot index is lower than Degree + 1 it is not the last knot of the curve. This method computes the index of the knot corresponding to the last parameter.
") LastUKnotIndex;
		int LastUKnotIndex();

		/****** Law_BSpline::LocalD0 ******/
		/****** md5 signature: 8d3c04c6a9ed800469237170922e849f ******/
		%feature("compactdefaultargs") LocalD0;
		%feature("autodoc", "
Parameters
----------
U: double
FromK1: int
ToK2: int

Return
-------
P: double

Description
-----------
No available documentation.
") LocalD0;
		void LocalD0(const double U, const int FromK1, const int ToK2, Standard_Real &OutValue);

		/****** Law_BSpline::LocalD1 ******/
		/****** md5 signature: cea7fcb5afa5666a78253649a0833aaf ******/
		%feature("compactdefaultargs") LocalD1;
		%feature("autodoc", "
Parameters
----------
U: double
FromK1: int
ToK2: int

Return
-------
P: double
V1: double

Description
-----------
No available documentation.
") LocalD1;
		void LocalD1(const double U, const int FromK1, const int ToK2, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_BSpline::LocalD2 ******/
		/****** md5 signature: 5d87d97b39ad9da584f9e0c72fd82e6a ******/
		%feature("compactdefaultargs") LocalD2;
		%feature("autodoc", "
Parameters
----------
U: double
FromK1: int
ToK2: int

Return
-------
P: double
V1: double
V2: double

Description
-----------
No available documentation.
") LocalD2;
		void LocalD2(const double U, const int FromK1, const int ToK2, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_BSpline::LocalD3 ******/
		/****** md5 signature: b9fba4b15f43b16ef3f32361b6dc42fb ******/
		%feature("compactdefaultargs") LocalD3;
		%feature("autodoc", "
Parameters
----------
U: double
FromK1: int
ToK2: int

Return
-------
P: double
V1: double
V2: double
V3: double

Description
-----------
No available documentation.
") LocalD3;
		void LocalD3(const double U, const int FromK1, const int ToK2, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_BSpline::LocalDN ******/
		/****** md5 signature: 6217b4c0576b136f280f403fa622cbb7 ******/
		%feature("compactdefaultargs") LocalDN;
		%feature("autodoc", "
Parameters
----------
U: double
FromK1: int
ToK2: int
N: int

Return
-------
double

Description
-----------
No available documentation.
") LocalDN;
		double LocalDN(const double U, const int FromK1, const int ToK2, const int N);

		/****** Law_BSpline::LocalValue ******/
		/****** md5 signature: 4b76edb651ab6d12ab1cbea441933e25 ******/
		%feature("compactdefaultargs") LocalValue;
		%feature("autodoc", "
Parameters
----------
U: double
FromK1: int
ToK2: int

Return
-------
double

Description
-----------
No available documentation.
") LocalValue;
		double LocalValue(const double U, const int FromK1, const int ToK2);

		/****** Law_BSpline::LocateU ******/
		/****** md5 signature: 1cd251285614aa4c353c1e6f8a41242d ******/
		%feature("compactdefaultargs") LocateU;
		%feature("autodoc", "
Parameters
----------
U: double
ParametricTolerance: double
WithKnotRepetition: bool (optional, default to false)

Return
-------
I1: int
I2: int

Description
-----------
Locates the parametric value U in the sequence of knots. If 'WithKnotRepetition' is True we consider the knot's representation with repetition of multiple knot value, otherwise we consider the knot's representation with no repetition of multiple knot values. Knots (I1) <= U <= Knots (I2) . if I1 = I2 U is a knot value (the tolerance criterion ParametricTolerance is used). . if I1 < 1 => U < Knots (1) - std::abs(ParametricTolerance) . if I2 > NbKnots => U > Knots (NbKnots) + std::abs(ParametricTolerance).
") LocateU;
		void LocateU(const double U, const double ParametricTolerance, Standard_Integer &OutValue, Standard_Integer &OutValue, const bool WithKnotRepetition = false);

		/****** Law_BSpline::MaxDegree ******/
		/****** md5 signature: c1d162018b4c908f3a00335cd079a0ea ******/
		%feature("compactdefaultargs") MaxDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the value of the maximum degree of the normalized B-spline basis functions in this package.
") MaxDegree;
		static int MaxDegree();

		/****** Law_BSpline::MovePointAndTangent ******/
		/****** md5 signature: 64a94934b2b148d90a7463e8f9f4f13a ******/
		%feature("compactdefaultargs") MovePointAndTangent;
		%feature("autodoc", "
Parameters
----------
U: double
NewValue: double
Derivative: double
Tolerance: double
StartingCondition: int
EndingCondition: int

Return
-------
ErrorStatus: int

Description
-----------
Changes the value of the Law at parameter U to NewValue. and makes its derivative at U be derivative. StartingCondition = -1 means first can move EndingCondition = -1 means last point can move StartingCondition = 0 means the first point cannot move EndingCondition = 0 means the last point cannot move StartingCondition = 1 means the first point and tangent cannot move EndingCondition = 1 means the last point and tangent cannot move and so forth ErrorStatus != 0 means that there are not enough degree of freedom with the constrain to deform the curve accordingly.
") MovePointAndTangent;
		void MovePointAndTangent(const double U, const double NewValue, const double Derivative, const double Tolerance, const int StartingCondition, const int EndingCondition, Standard_Integer &OutValue);

		/****** Law_BSpline::Multiplicities ******/
		/****** md5 signature: 1415188431c1974d7791a9ca90b50607 ******/
		%feature("compactdefaultargs") Multiplicities;
		%feature("autodoc", "
Parameters
----------
M: NCollection_Array1<int>

Return
-------
None

Description
-----------
Returns the multiplicity of the knots of the curve. //! Raised if the length of M is not equal to NbKnots.
") Multiplicities;
		void Multiplicities(NCollection_Array1<int> & M);

		/****** Law_BSpline::Multiplicity ******/
		/****** md5 signature: 6deea6eef255db56cfdeb88488a383cc ******/
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
		int Multiplicity(const int Index);

		/****** Law_BSpline::NbKnots ******/
		/****** md5 signature: 1d7f6bb61170b57fc8534832d22fab99 ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of knots. This method returns the number of knot without repetition of multiple knots.
") NbKnots;
		int NbKnots();

		/****** Law_BSpline::NbPoles ******/
		/****** md5 signature: ec44b31f908a8be9d45ab84543b6e8d5 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of poles.
") NbPoles;
		int NbPoles();

		/****** Law_BSpline::PeriodicNormalization ******/
		/****** md5 signature: 561cf2a1584a7411ebe6b9b581602ad1 ******/
		%feature("compactdefaultargs") PeriodicNormalization;
		%feature("autodoc", "
Parameters
----------

Return
-------
U: double

Description
-----------
returns the parameter normalized within the period if the curve is periodic: otherwise does not do anything.
") PeriodicNormalization;
		void PeriodicNormalization(Standard_Real &OutValue);

		/****** Law_BSpline::Pole ******/
		/****** md5 signature: a2625eddd63b1de69c7930c89cf4c02f ******/
		%feature("compactdefaultargs") Pole;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
Returns the pole of range Index. Raised if Index < 1 or Index > NbPoles.
") Pole;
		double Pole(const int Index);

		/****** Law_BSpline::Poles ******/
		/****** md5 signature: 85792619a1a8dc4e97e4e2151ee2081d ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "
Parameters
----------
P: NCollection_Array1<double>

Return
-------
None

Description
-----------
Returns the poles of the B-spline curve; //! Raised if the length of P is not equal to the number of poles.
") Poles;
		void Poles(NCollection_Array1<double> & P);

		/****** Law_BSpline::RemoveKnot ******/
		/****** md5 signature: 54905b41bbca7519e1f70b87cdd71db9 ******/
		%feature("compactdefaultargs") RemoveKnot;
		%feature("autodoc", "
Parameters
----------
Index: int
M: int
Tolerance: double

Return
-------
bool

Description
-----------
Decrement the knots multiplicity to <M>. If M is 0 the knot is removed. The Poles sequence is modified. //! As there are two ways to compute the new poles the average is computed if the distance is lower than the <Tolerance>, else False is returned. //! A low tolerance is used to prevent the modification of the curve. //! A high tolerance is used to 'smooth' the curve. //! Raised if Index is not in the range [FirstUKnotIndex, LastUKnotIndex] pole insertion and pole removing this operation is limited to the Uniform or QuasiUniform BSplineCurve. The knot values are modified. If the BSpline is NonUniform or Piecewise Bezier an exception Construction error is raised.
") RemoveKnot;
		bool RemoveKnot(const int Index, const int M, const double Tolerance);

		/****** Law_BSpline::Resolution ******/
		/****** md5 signature: 8810d337fa31ce2de402d4162505192b ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
Tolerance3D: double

Return
-------
UTolerance: double

Description
-----------
given Tolerance3D returns UTolerance such that if f(t) is the curve we have | t1 - t0| < Utolerance ===> |f(t1) - f(t0)| < Tolerance3D.
") Resolution;
		void Resolution(const double Tolerance3D, Standard_Real &OutValue);

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
		/****** md5 signature: c3130d767b123745954f0755ede77278 ******/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
Returns the parameter on the reversed curve for the point of parameter U on <self>. //! returns UFirst + ULast - U.
") ReversedParameter;
		double ReversedParameter(const double U);

		/****** Law_BSpline::Segment ******/
		/****** md5 signature: 431d11e406cedb37e1fce1b029086d31 ******/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "
Parameters
----------
U1: double
U2: double

Return
-------
None

Description
-----------
Segments the curve between U1 and U2. The control points are modified, the first and the last point are not the same. Warnings: Even if <self> is not closed it can become closed after the segmentation for example if U1 or U2 are out of the bounds of the curve <self> or if the curve makes loop. After the segmentation the length of a curve can be null. raises if U2 < U1.
") Segment;
		void Segment(const double U1, const double U2);

		/****** Law_BSpline::SetKnot ******/
		/****** md5 signature: 3671e77deddb12405c65a4fc2c4c7333 ******/
		%feature("compactdefaultargs") SetKnot;
		%feature("autodoc", "
Parameters
----------
Index: int
K: double

Return
-------
None

Description
-----------
Changes the knot of range Index. The multiplicity of the knot is not modified. Raised if K >= Knots(Index+1) or K <= Knots(Index-1). Raised if Index < 1 || Index > NbKnots.
") SetKnot;
		void SetKnot(const int Index, const double K);

		/****** Law_BSpline::SetKnot ******/
		/****** md5 signature: 0de49b51f368a1d5ff63bf35be32f5b7 ******/
		%feature("compactdefaultargs") SetKnot;
		%feature("autodoc", "
Parameters
----------
Index: int
K: double
M: int

Return
-------
None

Description
-----------
Changes the knot of range Index with its multiplicity. You can increase the multiplicity of a knot but it is not allowed to decrease the multiplicity of an existing knot. //! Raised if K >= Knots(Index+1) or K <= Knots(Index-1). Raised if M is greater than Degree or lower than the previous multiplicity of knot of range Index. Raised if Index < 1 || Index > NbKnots.
") SetKnot;
		void SetKnot(const int Index, const double K, const int M);

		/****** Law_BSpline::SetKnots ******/
		/****** md5 signature: c76939d5e20553630d805de848e55d1d ******/
		%feature("compactdefaultargs") SetKnots;
		%feature("autodoc", "
Parameters
----------
K: NCollection_Array1<double>

Return
-------
None

Description
-----------
Changes all the knots of the curve The multiplicity of the knots are not modified. //! Raised if there is an index such that K (Index+1) <= K (Index). //! Raised if K.Lower() < 1 or K.Upper() > NbKnots.
") SetKnots;
		void SetKnots(const NCollection_Array1<double> & K);

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
		/****** md5 signature: a689352e8bf76c88d77419d37d16683c ******/
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
		void SetOrigin(const int Index);

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
		/****** md5 signature: 1073e25fd129476c114b274220b13a61 ******/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "
Parameters
----------
Index: int
P: double

Return
-------
None

Description
-----------
Substitutes the Pole of range Index with P. //! Raised if Index < 1 || Index > NbPoles.
") SetPole;
		void SetPole(const int Index, const double P);

		/****** Law_BSpline::SetPole ******/
		/****** md5 signature: 147400a44695dcf4123c64f274fce134 ******/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "
Parameters
----------
Index: int
P: double
Weight: double

Return
-------
None

Description
-----------
Substitutes the pole and the weight of range Index. If the curve <self> is not rational it can become rational If the curve was rational it can become non rational //! Raised if Index < 1 || Index > NbPoles Raised if Weight <= 0.0.
") SetPole;
		void SetPole(const int Index, const double P, const double Weight);

		/****** Law_BSpline::SetWeight ******/
		/****** md5 signature: 070f4d4d27969cd02dc5548cbd61269b ******/
		%feature("compactdefaultargs") SetWeight;
		%feature("autodoc", "
Parameters
----------
Index: int
Weight: double

Return
-------
None

Description
-----------
Changes the weight for the pole of range Index. If the curve was non rational it can become rational. If the curve was rational it can become non rational. //! Raised if Index < 1 || Index > NbPoles Raised if Weight <= 0.0.
") SetWeight;
		void SetWeight(const int Index, const double Weight);

		/****** Law_BSpline::StartPoint ******/
		/****** md5 signature: 05df21c7c689c34483b577e53ee2f759 ******/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the start point of the curve. Warnings: This point is different from the first pole of the curve if the multiplicity of the first knot is lower than Degree.
") StartPoint;
		double StartPoint();

		/****** Law_BSpline::Value ******/
		/****** md5 signature: a11757851f750269ea194b71e2629ddf ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
No available documentation.
") Value;
		double Value(const double U);

		/****** Law_BSpline::Weight ******/
		/****** md5 signature: 4e490ff1aecfd614d673f3411c64fe0f ******/
		%feature("compactdefaultargs") Weight;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
Returns the weight of the pole of range Index . Raised if Index < 1 or Index > NbPoles.
") Weight;
		double Weight(const int Index);

		/****** Law_BSpline::Weights ******/
		/****** md5 signature: 75a527ca0732a5a4c79c4c170bad065d ******/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "
Parameters
----------
W: NCollection_Array1<double>

Return
-------
None

Description
-----------
Returns the weights of the B-spline curve; //! Raised if the length of W is not equal to NbPoles.
") Weights;
		void Weights(NCollection_Array1<double> & W);

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
		/****** md5 signature: f28607e2cc6210fc686d2bb8afceafb5 ******/
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
		 Law_BSplineKnotSplitting(const opencascade::handle<Law_BSpline> & BasisLaw, const int ContinuityRange);

		/****** Law_BSplineKnotSplitting::NbSplits ******/
		/****** md5 signature: 450e59ea60ccd5f46ae4d2b16e989c5a ******/
		%feature("compactdefaultargs") NbSplits;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of knots corresponding to the splitting.
") NbSplits;
		int NbSplits();

		/****** Law_BSplineKnotSplitting::SplitValue ******/
		/****** md5 signature: 58aee47f7f155f97d1a4ec76b6cebd87 ******/
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
		int SplitValue(const int Index);

		/****** Law_BSplineKnotSplitting::Splitting ******/
		/****** md5 signature: 6e6d594c00cac556bf0f204ddde3dabf ******/
		%feature("compactdefaultargs") Splitting;
		%feature("autodoc", "
Parameters
----------
SplitValues: NCollection_Array1<int>

Return
-------
None

Description
-----------
Returns the indexes of the BSpline curve knots corresponding to the splitting. //! Raised if the length of SplitValues is not equal to NbSPlit.
") Splitting;
		void Splitting(NCollection_Array1<int> & SplitValues);

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
		/****** md5 signature: 2db99ad77c23941eb1183d3435e84abb ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
PFirst: double
PLast: double

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
		/****** md5 signature: ed9688f566b2e6c03506c8cdd186171b ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double
D: double

Description
-----------
Returns the value F and the first derivative D of the function at the point of parameter X.
") D1;
		virtual void D1(const double X, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_Function::D2 ******/
		/****** md5 signature: e684efc83792dce814d2354508a455db ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double
D: double
D2: double

Description
-----------
Returns the value, first and second derivatives at parameter X.
") D2;
		virtual void D2(const double X, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_Function::Intervals ******/
		/****** md5 signature: 3d6a840a7f0f4eea65b38aa9a495c6b6 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: NCollection_Array1<double>
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. The array must provide enough room to accommodate for the parameters, i.e. T.Length() > NbIntervals().
") Intervals;
		virtual void Intervals(NCollection_Array1<double> & T, const GeomAbs_Shape S);

		/****** Law_Function::NbIntervals ******/
		/****** md5 signature: 9ac7bc3c23f26b850f256bf654af74c8 ******/
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
		virtual int NbIntervals(const GeomAbs_Shape S);

		/****** Law_Function::Trim ******/
		/****** md5 signature: 3066b7ae0034d8b766870efa26380e1a ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
PFirst: double
PLast: double
Tol: double

Return
-------
opencascade::handle<Law_Function>

Description
-----------
Returns a law equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. It is usfule to determines the derivatives in these values <First> and <Last> if the Law is not Cn.
") Trim;
		virtual opencascade::handle<Law_Function> Trim(const double PFirst, const double PLast, const double Tol);

		/****** Law_Function::Value ******/
		/****** md5 signature: 4a4eeed5712895b880fa0033bc4fd7ef ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
double

Description
-----------
Returns the value of the function at the point of parameter X.
") Value;
		virtual double Value(const double X);

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
		/****** md5 signature: 04dd6117d4a033acd6189a61d9839f3c ******/
		%feature("compactdefaultargs") Law_Interpolate;
		%feature("autodoc", "
Parameters
----------
Points: NCollection_HArray1<double
PeriodicFlag: bool
Tolerance: double

Return
-------
None

Description
-----------
Tolerance is to check if the points are not too close to one an other. It is also used to check if the tangent vector is not too small. There should be at least 2 points. If PeriodicFlag is True then the curve will be periodic be periodic.
") Law_Interpolate;
		 Law_Interpolate(const opencascade::handle<NCollection_HArray1<double> > & Points, const bool PeriodicFlag, const double Tolerance);

		/****** Law_Interpolate::Law_Interpolate ******/
		/****** md5 signature: 0166af133770af013b04733441c1a1eb ******/
		%feature("compactdefaultargs") Law_Interpolate;
		%feature("autodoc", "
Parameters
----------
Points: NCollection_HArray1<double
Parameters: NCollection_HArray1<double
PeriodicFlag: bool
Tolerance: double

Return
-------
None

Description
-----------
Tolerance is to check if the points are not too close to one an other. It is also used to check if the tangent vector is not too small. There should be at least 2 points. If PeriodicFlag is True then the curve will be periodic be periodic.
") Law_Interpolate;
		 Law_Interpolate(const opencascade::handle<NCollection_HArray1<double> > & Points, const opencascade::handle<NCollection_HArray1<double> > & Parameters, const bool PeriodicFlag, const double Tolerance);

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** Law_Interpolate::Load ******/
		/****** md5 signature: bc411ea57e01ab64e7584cf16d39a599 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
InitialTangent: double
FinalTangent: double

Return
-------
None

Description
-----------
loads initial and final tangents if any.
") Load;
		void Load(const double InitialTangent, const double FinalTangent);

		/****** Law_Interpolate::Load ******/
		/****** md5 signature: f718ed0040d981722ff46cb252c0bc2c ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
Tangents: NCollection_Array1<double>
TangentFlags: NCollection_HArray1<bool

Return
-------
None

Description
-----------
loads the tangents. We should have as many tangents as they are points in the array if TangentFlags.Value(i) is true use the tangent Tangents.Value(i) otherwise the tangent is not constrained.
") Load;
		void Load(const NCollection_Array1<double> & Tangents, const opencascade::handle<NCollection_HArray1<bool> > & TangentFlags);

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
		/****** md5 signature: d3c6ed60224b0d779f43708f4b7eb581 ******/
		%feature("compactdefaultargs") Law_BSpFunc;
		%feature("autodoc", "
Parameters
----------
C: Law_BSpline
First: double
Last: double

Return
-------
None

Description
-----------
No available documentation.
") Law_BSpFunc;
		 Law_BSpFunc(const opencascade::handle<Law_BSpline> & C, const double First, const double Last);

		/****** Law_BSpFunc::Bounds ******/
		/****** md5 signature: df559f1de5c889a4a37cc4880391de7c ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
PFirst: double
PLast: double

Description
-----------
No available documentation.
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_BSpFunc::Continuity ******/
		/****** md5 signature: 8a904df22c5de40ac55e533d992dce2a ******/
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
		/****** md5 signature: 066e33bcce92f1320ec9f58165de290b ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double
D: double

Description
-----------
No available documentation.
") D1;
		void D1(const double X, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_BSpFunc::D2 ******/
		/****** md5 signature: 8e6618c0a672c49640d29799527c94be ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double
D: double
D2: double

Description
-----------
No available documentation.
") D2;
		void D2(const double X, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_BSpFunc::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: NCollection_Array1<double>
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. The array must provide enough room to accommodate for the parameters, i.e. T.Length() > NbIntervals().
") Intervals;
		void Intervals(NCollection_Array1<double> & T, const GeomAbs_Shape S);

		/****** Law_BSpFunc::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
		int NbIntervals(const GeomAbs_Shape S);

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
		/****** md5 signature: 5deea5c13ea7b4eac48d0f27a6e1585a ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
PFirst: double
PLast: double
Tol: double

Return
-------
opencascade::handle<Law_Function>

Description
-----------
Returns a law equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. It is usfule to determines the derivatives in these values <First> and <Last> if the Law is not Cn.
") Trim;
		opencascade::handle<Law_Function> Trim(const double PFirst, const double PLast, const double Tol);

		/****** Law_BSpFunc::Value ******/
		/****** md5 signature: 2ce0fb6c99ca2f38a733383fe97a31e0 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
double

Description
-----------
No available documentation.
") Value;
		double Value(const double X);

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
		/****** md5 signature: f57ee1fe3b822222168aac13d704180c ******/
		%feature("compactdefaultargs") Law_Composite;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double
Tol: double

Return
-------
None

Description
-----------
Construct an empty, trimmed Law.
") Law_Composite;
		 Law_Composite(const double First, const double Last, const double Tol);

		/****** Law_Composite::Bounds ******/
		/****** md5 signature: df559f1de5c889a4a37cc4880391de7c ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
PFirst: double
PLast: double

Description
-----------
Returns the parametric bounds of the function.
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_Composite::ChangeElementaryLaw ******/
		/****** md5 signature: 1329ec0d453e1e01fd076b5e8e905fdf ******/
		%feature("compactdefaultargs") ChangeElementaryLaw;
		%feature("autodoc", "
Parameters
----------
W: double

Return
-------
opencascade::handle<Law_Function>

Description
-----------
Returns the elementary function of the composite used to compute at parameter W.
") ChangeElementaryLaw;
		opencascade::handle<Law_Function> & ChangeElementaryLaw(const double W);

		/****** Law_Composite::ChangeLaws ******/
		/****** md5 signature: 398d0cf7ab6491c305beca068c42718a ******/
		%feature("compactdefaultargs") ChangeLaws;
		%feature("autodoc", "Return
-------
NCollection_List<opencascade::handle<Law_Function>>

Description
-----------
No available documentation.
") ChangeLaws;
		NCollection_List<opencascade::handle<Law_Function>> & ChangeLaws();

		/****** Law_Composite::Continuity ******/
		/****** md5 signature: 8a904df22c5de40ac55e533d992dce2a ******/
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
		/****** md5 signature: 066e33bcce92f1320ec9f58165de290b ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double
D: double

Description
-----------
Returns the value and the first derivative at parameter X.
") D1;
		void D1(const double X, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_Composite::D2 ******/
		/****** md5 signature: 8e6618c0a672c49640d29799527c94be ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double
D: double
D2: double

Description
-----------
Returns the value, first and second derivatives at parameter X.
") D2;
		void D2(const double X, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_Composite::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: NCollection_Array1<double>
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. The array must provide enough room to accommodate for the parameters, i.e. T.Length() > NbIntervals().
") Intervals;
		void Intervals(NCollection_Array1<double> & T, const GeomAbs_Shape S);

		/****** Law_Composite::IsPeriodic ******/
		/****** md5 signature: d36764d6f9b1283d23b2bfdabe28da79 ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		bool IsPeriodic();

		/****** Law_Composite::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
		int NbIntervals(const GeomAbs_Shape S);

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
		/****** md5 signature: 5deea5c13ea7b4eac48d0f27a6e1585a ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
PFirst: double
PLast: double
Tol: double

Return
-------
opencascade::handle<Law_Function>

Description
-----------
Returns a law equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. It is usfule to determines the derivatives in these values <First> and <Last> if the Law is not Cn.
") Trim;
		opencascade::handle<Law_Function> Trim(const double PFirst, const double PLast, const double Tol);

		/****** Law_Composite::Value ******/
		/****** md5 signature: 2ce0fb6c99ca2f38a733383fe97a31e0 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
double

Description
-----------
Returns the value at parameter X.
") Value;
		double Value(const double X);

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
		/****** md5 signature: df559f1de5c889a4a37cc4880391de7c ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
PFirst: double
PLast: double

Description
-----------
Returns the parametric bounds of the function.
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_Constant::Continuity ******/
		/****** md5 signature: 8a904df22c5de40ac55e533d992dce2a ******/
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
		/****** md5 signature: 066e33bcce92f1320ec9f58165de290b ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double
D: double

Description
-----------
Returns the value and the first derivative at parameter X.
") D1;
		void D1(const double X, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_Constant::D2 ******/
		/****** md5 signature: 8e6618c0a672c49640d29799527c94be ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double
D: double
D2: double

Description
-----------
Returns the value, first and second derivatives at parameter X.
") D2;
		void D2(const double X, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_Constant::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: NCollection_Array1<double>
S: GeomAbs_Shape

Return
-------
None

Description
-----------
No available documentation.
") Intervals;
		void Intervals(NCollection_Array1<double> & T, const GeomAbs_Shape S);

		/****** Law_Constant::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
		int NbIntervals(const GeomAbs_Shape S);

		/****** Law_Constant::Set ******/
		/****** md5 signature: 49e20f85ca7b90a1804925f7867aeb75 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Radius: double
PFirst: double
PLast: double

Return
-------
None

Description
-----------
Set the radius and the range of the constant Law.
") Set;
		void Set(const double Radius, const double PFirst, const double PLast);

		/****** Law_Constant::Trim ******/
		/****** md5 signature: 5deea5c13ea7b4eac48d0f27a6e1585a ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
PFirst: double
PLast: double
Tol: double

Return
-------
opencascade::handle<Law_Function>

Description
-----------
No available documentation.
") Trim;
		opencascade::handle<Law_Function> Trim(const double PFirst, const double PLast, const double Tol);

		/****** Law_Constant::Value ******/
		/****** md5 signature: 2ce0fb6c99ca2f38a733383fe97a31e0 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
double

Description
-----------
Returns the value at parameter X.
") Value;
		double Value(const double X);

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
		/****** md5 signature: df559f1de5c889a4a37cc4880391de7c ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
PFirst: double
PLast: double

Description
-----------
Returns the parametric bounds of the function.
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_Linear::Continuity ******/
		/****** md5 signature: 8a904df22c5de40ac55e533d992dce2a ******/
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
		/****** md5 signature: 066e33bcce92f1320ec9f58165de290b ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double
D: double

Description
-----------
Returns the value F and the first derivative D of this function at the point of parameter X.
") D1;
		void D1(const double X, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_Linear::D2 ******/
		/****** md5 signature: 8e6618c0a672c49640d29799527c94be ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double
D: double
D2: double

Description
-----------
Returns the value, first and second derivatives at parameter X.
") D2;
		void D2(const double X, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Law_Linear::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: NCollection_Array1<double>
S: GeomAbs_Shape

Return
-------
None

Description
-----------
No available documentation.
") Intervals;
		void Intervals(NCollection_Array1<double> & T, const GeomAbs_Shape S);

		/****** Law_Linear::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
		int NbIntervals(const GeomAbs_Shape S);

		/****** Law_Linear::Set ******/
		/****** md5 signature: d49b7fccdbec4b920e3949a7867a566d ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Pdeb: double
Valdeb: double
Pfin: double
Valfin: double

Return
-------
None

Description
-----------
Defines this linear evolution law by assigning both: - the bounds Pdeb and Pfin of the parameter, and - the values Valdeb and Valfin of the function at these two parametric bounds.
") Set;
		void Set(const double Pdeb, const double Valdeb, const double Pfin, const double Valfin);

		/****** Law_Linear::Trim ******/
		/****** md5 signature: 5deea5c13ea7b4eac48d0f27a6e1585a ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
PFirst: double
PLast: double
Tol: double

Return
-------
opencascade::handle<Law_Function>

Description
-----------
Returns a law equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. It is usfule to determines the derivatives in these values <First> and <Last> if the Law is not Cn.
") Trim;
		opencascade::handle<Law_Function> Trim(const double PFirst, const double PLast, const double Tol);

		/****** Law_Linear::Value ******/
		/****** md5 signature: 2ce0fb6c99ca2f38a733383fe97a31e0 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
double

Description
-----------
Returns the value of this function at the point of parameter X.
") Value;
		double Value(const double X);

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
		/****** md5 signature: 7b2e95d27855146e943503a2fe020114 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
ParAndRad: NCollection_Array1<gp_Pnt2d>
Periodic: bool (optional, default to false)

Return
-------
None

Description
-----------
Defines this evolution law by interpolating the set of 2D points ParAndRad. The Y coordinate of a point of ParAndRad is the value of the function at the parameter point given by its X coordinate. If Periodic is true, this function is assumed to be periodic. Warning - The X coordinates of points in the table ParAndRad must be given in ascendant order. - If Periodic is true, the first and last Y coordinates of points in the table ParAndRad are assumed to be equal. In addition, with the second syntax, Dd and Df are also assumed to be equal. If this is not the case, Set uses the first value(s) as last value(s).
") Set;
		void Set(const NCollection_Array1<gp_Pnt2d> & ParAndRad, const bool Periodic = false);

		/****** Law_Interpol::Set ******/
		/****** md5 signature: c61bb22a42277032e685ce9d0f6e5dcb ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
ParAndRad: NCollection_Array1<gp_Pnt2d>
Dd: double
Df: double
Periodic: bool (optional, default to false)

Return
-------
None

Description
-----------
Defines this evolution law by interpolating the set of 2D points ParAndRad. The Y coordinate of a point of ParAndRad is the value of the function at the parameter point given by its X coordinate. If Periodic is true, this function is assumed to be periodic. In the second syntax, Dd and Df define the values of the first derivative of the function at its first and last points. Warning - The X coordinates of points in the table ParAndRad must be given in ascendant order. - If Periodic is true, the first and last Y coordinates of points in the table ParAndRad are assumed to be equal. In addition, with the second syntax, Dd and Df are also assumed to be equal. If this is not the case, Set uses the first value(s) as last value(s).
") Set;
		void Set(const NCollection_Array1<gp_Pnt2d> & ParAndRad, const double Dd, const double Df, const bool Periodic = false);

		/****** Law_Interpol::SetInRelative ******/
		/****** md5 signature: ea3c2417ef715a12ff07899ff4e37fef ******/
		%feature("compactdefaultargs") SetInRelative;
		%feature("autodoc", "
Parameters
----------
ParAndRad: NCollection_Array1<gp_Pnt2d>
Ud: double
Uf: double
Periodic: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") SetInRelative;
		void SetInRelative(const NCollection_Array1<gp_Pnt2d> & ParAndRad, const double Ud, const double Uf, const bool Periodic = false);

		/****** Law_Interpol::SetInRelative ******/
		/****** md5 signature: 0773a27903d91d07a45a6d396c5ac392 ******/
		%feature("compactdefaultargs") SetInRelative;
		%feature("autodoc", "
Parameters
----------
ParAndRad: NCollection_Array1<gp_Pnt2d>
Ud: double
Uf: double
Dd: double
Df: double
Periodic: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") SetInRelative;
		void SetInRelative(const NCollection_Array1<gp_Pnt2d> & ParAndRad, const double Ud, const double Uf, const double Dd, const double Df, const bool Periodic = false);

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
		/****** md5 signature: d49b7fccdbec4b920e3949a7867a566d ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Pdeb: double
Valdeb: double
Pfin: double
Valfin: double

Return
-------
None

Description
-----------
Defines this S evolution law by assigning both: - the bounds Pdeb and Pfin of the parameter, and - the values Valdeb and Valfin of the function at these two parametric bounds. The function is assumed to have the first derivatives equal to 0 at the two parameter points Pdeb and Pfin.
") Set;
		void Set(const double Pdeb, const double Valdeb, const double Pfin, const double Valfin);

		/****** Law_S::Set ******/
		/****** md5 signature: 483dc79efe74dfef4a7463b2ff13327f ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Pdeb: double
Valdeb: double
Ddeb: double
Pfin: double
Valfin: double
Dfin: double

Return
-------
None

Description
-----------
Defines this S evolution law by assigning - the bounds Pdeb and Pfin of the parameter, - the values Valdeb and Valfin of the function at these two parametric bounds, and - the values Ddeb and Dfin of the first derivative of the function at these two parametric bounds.
") Set;
		void Set(const double Pdeb, const double Valdeb, const double Ddeb, const double Pfin, const double Valfin, const double Dfin);

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
