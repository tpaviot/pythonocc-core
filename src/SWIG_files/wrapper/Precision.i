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
%define PRECISIONDOCSTRING
"Precision module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_precision.html"
%enddef
%module (package="OCC.Core", docstring=PRECISIONDOCSTRING) Precision


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
#include<Precision_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i

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
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/******************
* class Precision *
******************/
%rename(precision) Precision;
class Precision {
	public:
		/****** Precision::Angular ******/
		/****** md5 signature: 937f597f2d89a54b9e4e3397f5f16de5 ******/
		%feature("compactdefaultargs") Angular;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the recommended precision value when checking the equality of two angles (given in radians). Standard_Real Angle1 = ... , Angle2 = ... ; If ( Abs( Angle2 - Angle1 ) < Precision::Angular() ) ... The tolerance of angular equality may be used to check the parallelism of two vectors: gp_Vec V1, V2 ; V1 = ... V2 = ... If ( V1.IsParallel (V2, Precision::Angular() ) ) ... The tolerance of angular equality is equal to 1.e-12. Note: The tolerance of angular equality can be used when working with scalar products or cross products since sines and angles are equivalent for small angles. Therefore, in order to check whether two unit vectors are perpendicular: gp_Dir D1, D2 ; D1 = ... D2 = ... you can use: If ( Abs( D1.D2 ) < Precision::Angular() ) ... (although the function IsNormal does exist).
") Angular;
		static Standard_Real Angular();

		/****** Precision::Approximation ******/
		/****** md5 signature: 9f2e5b5d7da4a660b8f194d18f3ca4da ******/
		%feature("compactdefaultargs") Approximation;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the precision value in real space, frequently used by approximation algorithms. This function provides an acceptable level of precision for an approximation process to define adjustment limits. The tolerance of approximation is designed to ensure an acceptable computation time when performing an approximation process. That is why the tolerance of approximation is greater than the tolerance of confusion. The tolerance of approximation is equal to: Precision::Confusion() * 10. (that is, 1.e-6). You may use a smaller tolerance in an approximation algorithm, but this option might be costly.
") Approximation;
		static Standard_Real Approximation();

		/****** Precision::Confusion ******/
		/****** md5 signature: 9f83608ae84f84c1757bb526055b5ec0 ******/
		%feature("compactdefaultargs") Confusion;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the recommended precision value when checking coincidence of two points in real space. The tolerance of confusion is used for testing a 3D distance: - Two points are considered to be coincident if their distance is smaller than the tolerance of confusion. gp_Pnt P1, P2 ; P1 = ... P2 = ... if ( P1.IsEqual ( P2 , Precision::Confusion() ) ) then ... - A vector is considered to be null if it has a null length: gp_Vec V ; V = ... if ( V.Magnitude() < Precision::Confusion() ) then ... The tolerance of confusion is equal to 1.e-7. The value of the tolerance of confusion is also used to define: - the tolerance of intersection, and - the tolerance of approximation. Note: As a rule, coordinate values in Cas.Cade are not dimensioned, so 1. represents one user unit, whatever value the unit may have: the millimeter, the meter, the inch, or any other unit. Let's say that Cas.Cade algorithms are written to be tuned essentially with mechanical design applications, on the basis of the millimeter. However, these algorithms may be used with any other unit but the tolerance criterion does no longer have the same signification. So pay particular attention to the type of your application, in relation with the impact of your unit on the precision criterion. - For example in mechanical design, if the unit is the millimeter, the tolerance of confusion corresponds to a distance of 1 / 10000 micron, which is rather difficult to measure. - However in other types of applications, such as cartography, where the kilometer is frequently used, the tolerance of confusion corresponds to a greater distance (1 / 10 millimeter). This distance becomes easily measurable, but only within a restricted space which contains some small objects of the complete scene.
") Confusion;
		static Standard_Real Confusion();

		/****** Precision::Infinite ******/
		/****** md5 signature: 808819b0ee4431d4f2d9b70e1e182b68 ******/
		%feature("compactdefaultargs") Infinite;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns a big number that can be considered as infinite. Use -Infinite() for a negative big number.
") Infinite;
		static Standard_Real Infinite();

		/****** Precision::Intersection ******/
		/****** md5 signature: bf8887c9820fcec9484d7d7c8d16271f ******/
		%feature("compactdefaultargs") Intersection;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the precision value in real space, frequently used by intersection algorithms to decide that a solution is reached. This function provides an acceptable level of precision for an intersection process to define the adjustment limits. The tolerance of intersection is designed to ensure that a point computed by an iterative algorithm as the intersection between two curves is indeed on the intersection. It is obvious that two tangent curves are close to each other, on a large distance. An iterative algorithm of intersection may find points on these curves within the scope of the confusion tolerance, but still far from the true intersection point. In order to force the intersection algorithm to continue the iteration process until a correct point is found on the tangent objects, the tolerance of intersection must be smaller than the tolerance of confusion. On the other hand, the tolerance of intersection must be large enough to minimize the time required by the process to converge to a solution. The tolerance of intersection is equal to: Precision::Confusion() / 100. (that is, 1.e-9).
") Intersection;
		static Standard_Real Intersection();

		/****** Precision::IsInfinite ******/
		/****** md5 signature: f5fd28139e3eb1857e266b2fd761d1fd ******/
		%feature("compactdefaultargs") IsInfinite;
		%feature("autodoc", "
Parameters
----------
R: float

Return
-------
bool

Description
-----------
Returns True if R may be considered as an infinite number. Currently Abs(R) > 1e100.
") IsInfinite;
		static Standard_Boolean IsInfinite(const Standard_Real R);

		/****** Precision::IsNegativeInfinite ******/
		/****** md5 signature: 6095654986c15dcbe27ef2e11b0ee540 ******/
		%feature("compactdefaultargs") IsNegativeInfinite;
		%feature("autodoc", "
Parameters
----------
R: float

Return
-------
bool

Description
-----------
Returns True if R may be considered as a negative infinite number. Currently R < -1e100.
") IsNegativeInfinite;
		static Standard_Boolean IsNegativeInfinite(const Standard_Real R);

		/****** Precision::IsPositiveInfinite ******/
		/****** md5 signature: cbaa76324aeaeee518b81222a4760b1d ******/
		%feature("compactdefaultargs") IsPositiveInfinite;
		%feature("autodoc", "
Parameters
----------
R: float

Return
-------
bool

Description
-----------
Returns True if R may be considered as a positive infinite number. Currently R > 1e100.
") IsPositiveInfinite;
		static Standard_Boolean IsPositiveInfinite(const Standard_Real R);

		/****** Precision::PApproximation ******/
		/****** md5 signature: 36b3e2b992541d3e07bc5e38c034e711 ******/
		%feature("compactdefaultargs") PApproximation;
		%feature("autodoc", "
Parameters
----------
T: float

Return
-------
float

Description
-----------
Returns a precision value in parametric space, which may be used by approximation algorithms. The purpose of this function is to provide an acceptable level of precision in parametric space, for an approximation process to define the adjustment limits. The parametric tolerance of approximation is designed to give a mean value in relation with the dimension of the curve or the surface. It considers that a variation of parameter equal to 1. along a curve (or an isoparametric curve of a surface) generates a segment whose length is equal to 100. (default value), or T. The parametric tolerance of intersection is equal to: - Precision::Approximation() / 100., or Precision::Approximation() / T.
") PApproximation;
		static Standard_Real PApproximation(const Standard_Real T);

		/****** Precision::PApproximation ******/
		/****** md5 signature: 12cd82a376fc840ccd31584921f6befc ******/
		%feature("compactdefaultargs") PApproximation;
		%feature("autodoc", "Return
-------
float

Description
-----------
Used for Approximations in parametric space on a default curve. //! This is Precision::Parametric(Precision::Approximation()).
") PApproximation;
		static Standard_Real PApproximation();

		/****** Precision::PConfusion ******/
		/****** md5 signature: f703a571cba96c6df4fd0a81ae6936c7 ******/
		%feature("compactdefaultargs") PConfusion;
		%feature("autodoc", "
Parameters
----------
T: float

Return
-------
float

Description
-----------
Returns a precision value in parametric space, which may be used: - to test the coincidence of two points in the real space, by using parameter values, or - to test the equality of two parameter values in a parametric space. The parametric tolerance of confusion is designed to give a mean value in relation with the dimension of the curve or the surface. It considers that a variation of parameter equal to 1. along a curve (or an isoparametric curve of a surface) generates a segment whose length is equal to 100. (default value), or T. The parametric tolerance of confusion is equal to: - Precision::Confusion() / 100., or Precision::Confusion() / T. The value of the parametric tolerance of confusion is also used to define: - the parametric tolerance of intersection, and - the parametric tolerance of approximation. Warning It is rather difficult to define a unique precision value in parametric space. - First consider a curve (c) ; if M is the point of parameter u and M' the point of parameter u+du on the curve, call 'parametric tangent' at point M, for the variation du of the parameter, the quantity: T(u,du)=MM'/du (where MM' represents the distance between the two points M and M', in the real space). - Consider the other curve resulting from a scaling transformation of (c) with a scale factor equal to 10. The 'parametric tangent' at the point of parameter u of this curve is ten times greater than the previous one. This shows that for two different curves, the distance between two points on the curve, resulting from the same variation of parameter du, may vary considerably. - Moreover, the variation of the parameter along the curve is generally not proportional to the curvilinear abscissa along the curve. So the distance between two points resulting from the same variation of parameter du, at two different points of a curve, may completely differ. - Moreover, the parameterization of a surface may generate two quite different 'parametric tangent' values in the u or in the v parametric direction. - Last, close to the poles of a sphere (the points which correspond to the values -Pi/2. and Pi/2. of the v parameter) the u parameter may change from 0 to 2.Pi without impacting on the resulting point. Therefore, take great care when adjusting a parametric tolerance to your own algorithm.
") PConfusion;
		static Standard_Real PConfusion(const Standard_Real T);

		/****** Precision::PConfusion ******/
		/****** md5 signature: d01d48dd27a48cad4de3b4058e27d253 ******/
		%feature("compactdefaultargs") PConfusion;
		%feature("autodoc", "Return
-------
float

Description
-----------
Used to test distances in parametric space on a default curve. //! This is Precision::Parametric(Precision::Confusion()).
") PConfusion;
		static Standard_Real PConfusion();

		/****** Precision::PIntersection ******/
		/****** md5 signature: ceb5c0d0629ece18e471c6cff288178a ******/
		%feature("compactdefaultargs") PIntersection;
		%feature("autodoc", "
Parameters
----------
T: float

Return
-------
float

Description
-----------
Returns a precision value in parametric space, which may be used by intersection algorithms, to decide that a solution is reached. The purpose of this function is to provide an acceptable level of precision in parametric space, for an intersection process to define the adjustment limits. The parametric tolerance of intersection is designed to give a mean value in relation with the dimension of the curve or the surface. It considers that a variation of parameter equal to 1. along a curve (or an isoparametric curve of a surface) generates a segment whose length is equal to 100. (default value), or T. The parametric tolerance of intersection is equal to: - Precision::Intersection() / 100., or Precision::Intersection() / T.
") PIntersection;
		static Standard_Real PIntersection(const Standard_Real T);

		/****** Precision::PIntersection ******/
		/****** md5 signature: 0dbbbc777d64bd845740a2f14691740e ******/
		%feature("compactdefaultargs") PIntersection;
		%feature("autodoc", "Return
-------
float

Description
-----------
Used for Intersections in parametric space on a default curve. //! This is Precision::Parametric(Precision::Intersection()).
") PIntersection;
		static Standard_Real PIntersection();

		/****** Precision::Parametric ******/
		/****** md5 signature: b9ef831bf76fa68354a3154d2717dd3f ******/
		%feature("compactdefaultargs") Parametric;
		%feature("autodoc", "
Parameters
----------
P: float
T: float

Return
-------
float

Description
-----------
Convert a real space precision to a parametric space precision. <T> is the mean value of the length of the tangent of the curve or the surface. //! Value is P / T.
") Parametric;
		static Standard_Real Parametric(const Standard_Real P, const Standard_Real T);

		/****** Precision::Parametric ******/
		/****** md5 signature: 3c3a85121d4bddc86e9cbe1730caf7a2 ******/
		%feature("compactdefaultargs") Parametric;
		%feature("autodoc", "
Parameters
----------
P: float

Return
-------
float

Description
-----------
Convert a real space precision to a parametric space precision on a default curve. //! Value is Parametric(P,1.e+2).
") Parametric;
		static Standard_Real Parametric(const Standard_Real P);

		/****** Precision::SquareConfusion ******/
		/****** md5 signature: 5e1caa3bae81231f959bb60e26302fe7 ******/
		%feature("compactdefaultargs") SquareConfusion;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns square of Confusion. Created for speed and convenience.
") SquareConfusion;
		static Standard_Real SquareConfusion();

		/****** Precision::SquarePConfusion ******/
		/****** md5 signature: 2ddf6a12a49707ec70c663a88807db98 ******/
		%feature("compactdefaultargs") SquarePConfusion;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns square of PConfusion. Created for speed and convenience.
") SquarePConfusion;
		static Standard_Real SquarePConfusion();

};


%extend Precision {
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
def precision_Angular(*args):
	return precision.Angular(*args)

@deprecated
def precision_Approximation(*args):
	return precision.Approximation(*args)

@deprecated
def precision_Confusion(*args):
	return precision.Confusion(*args)

@deprecated
def precision_Infinite(*args):
	return precision.Infinite(*args)

@deprecated
def precision_Intersection(*args):
	return precision.Intersection(*args)

@deprecated
def precision_IsInfinite(*args):
	return precision.IsInfinite(*args)

@deprecated
def precision_IsNegativeInfinite(*args):
	return precision.IsNegativeInfinite(*args)

@deprecated
def precision_IsPositiveInfinite(*args):
	return precision.IsPositiveInfinite(*args)

@deprecated
def precision_PApproximation(*args):
	return precision.PApproximation(*args)

@deprecated
def precision_PApproximation(*args):
	return precision.PApproximation(*args)

@deprecated
def precision_PConfusion(*args):
	return precision.PConfusion(*args)

@deprecated
def precision_PConfusion(*args):
	return precision.PConfusion(*args)

@deprecated
def precision_PIntersection(*args):
	return precision.PIntersection(*args)

@deprecated
def precision_PIntersection(*args):
	return precision.PIntersection(*args)

@deprecated
def precision_Parametric(*args):
	return precision.Parametric(*args)

@deprecated
def precision_Parametric(*args):
	return precision.Parametric(*args)

@deprecated
def precision_SquareConfusion(*args):
	return precision.SquareConfusion(*args)

@deprecated
def precision_SquarePConfusion(*args):
	return precision.SquarePConfusion(*args)

}
