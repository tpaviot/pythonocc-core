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
%define PRECISIONDOCSTRING
"Precision module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_precision.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/* python proy classes for enums */
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
		/****************** Angular ******************/
		/**** md5 signature: d66ae915268c0c56c42cc1b75a460288 ****/
		%feature("compactdefaultargs") Angular;
		%feature("autodoc", "Returns the recommended precision value when checking the equality of two angles (given in radians). standard_real angle1 = ... , angle2 = ... ; if ( abs( angle2 - angle1 ) < precision::angular() ) ... the tolerance of angular equality may be used to check the parallelism of two vectors : gp_vec v1, v2 ; v1 = ... v2 = ... if ( v1.isparallel (v2, precision::angular() ) ) ... the tolerance of angular equality is equal to 1.e-12. note : the tolerance of angular equality can be used when working with scalar products or cross products since sines and angles are equivalent for small angles. therefore, in order to check whether two unit vectors are perpendicular : gp_dir d1, d2 ; d1 = ... d2 = ... you can use : if ( abs( d1.d2 ) < precision::angular() ) ... (although the function isnormal does exist).

Returns
-------
float
") Angular;
		static Standard_Real Angular();

		/****************** Approximation ******************/
		/**** md5 signature: fcad0107c9d9c3e9b902fd1d2a9348f6 ****/
		%feature("compactdefaultargs") Approximation;
		%feature("autodoc", "Returns the precision value in real space, frequently used by approximation algorithms. this function provides an acceptable level of precision for an approximation process to define adjustment limits. the tolerance of approximation is designed to ensure an acceptable computation time when performing an approximation process. that is why the tolerance of approximation is greater than the tolerance of confusion. the tolerance of approximation is equal to : precision::confusion() * 10. (that is, 1.e-6). you may use a smaller tolerance in an approximation algorithm, but this option might be costly.

Returns
-------
float
") Approximation;
		static Standard_Real Approximation();

		/****************** Confusion ******************/
		/**** md5 signature: 261a8fd013e8755ec73cdd7715310200 ****/
		%feature("compactdefaultargs") Confusion;
		%feature("autodoc", "Returns the recommended precision value when checking coincidence of two points in real space. the tolerance of confusion is used for testing a 3d distance : - two points are considered to be coincident if their distance is smaller than the tolerance of confusion. gp_pnt p1, p2 ; p1 = ... p2 = ... if ( p1.isequal ( p2 , precision::confusion() ) ) then ... - a vector is considered to be null if it has a null length : gp_vec v ; v = ... if ( v.magnitude() < precision::confusion() ) then ... the tolerance of confusion is equal to 1.e-7. the value of the tolerance of confusion is also used to define : - the tolerance of intersection, and - the tolerance of approximation. note : as a rule, coordinate values in cas.cade are not dimensioned, so 1. represents one user unit, whatever value the unit may have : the millimeter, the meter, the inch, or any other unit. let's say that cas.cade algorithms are written to be tuned essentially with mechanical design applications, on the basis of the millimeter. however, these algorithms may be used with any other unit but the tolerance criterion does no longer have the same signification. so pay particular attention to the type of your application, in relation with the impact of your unit on the precision criterion. - for example in mechanical design, if the unit is the millimeter, the tolerance of confusion corresponds to a distance of 1 / 10000 micron, which is rather difficult to measure. - however in other types of applications, such as cartography, where the kilometer is frequently used, the tolerance of confusion corresponds to a greater distance (1 / 10 millimeter). this distance becomes easily measurable, but only within a restricted space which contains some small objects of the complete scene.

Returns
-------
float
") Confusion;
		static Standard_Real Confusion();

		/****************** Infinite ******************/
		/**** md5 signature: 7829afc28234ba2385655766212272d3 ****/
		%feature("compactdefaultargs") Infinite;
		%feature("autodoc", "Returns a big number that can be considered as infinite. use -infinite() for a negative big number.

Returns
-------
float
") Infinite;
		static Standard_Real Infinite();

		/****************** Intersection ******************/
		/**** md5 signature: a196c72a45a4e1ecee20d3639271fa21 ****/
		%feature("compactdefaultargs") Intersection;
		%feature("autodoc", "Returns the precision value in real space, frequently used by intersection algorithms to decide that a solution is reached. this function provides an acceptable level of precision for an intersection process to define the adjustment limits. the tolerance of intersection is designed to ensure that a point computed by an iterative algorithm as the intersection between two curves is indeed on the intersection. it is obvious that two tangent curves are close to each other, on a large distance. an iterative algorithm of intersection may find points on these curves within the scope of the confusion tolerance, but still far from the true intersection point. in order to force the intersection algorithm to continue the iteration process until a correct point is found on the tangent objects, the tolerance of intersection must be smaller than the tolerance of confusion. on the other hand, the tolerance of intersection must be large enough to minimize the time required by the process to converge to a solution. the tolerance of intersection is equal to : precision::confusion() / 100. (that is, 1.e-9).

Returns
-------
float
") Intersection;
		static Standard_Real Intersection();

		/****************** IsInfinite ******************/
		/**** md5 signature: a267874bd879efbcfadf471951140661 ****/
		%feature("compactdefaultargs") IsInfinite;
		%feature("autodoc", "Returns true if r may be considered as an infinite number. currently abs(r) > 1e100.

Parameters
----------
R: float

Returns
-------
bool
") IsInfinite;
		static Standard_Boolean IsInfinite(const Standard_Real R);

		/****************** IsNegativeInfinite ******************/
		/**** md5 signature: 13693b548c2fa3e2236848404623f679 ****/
		%feature("compactdefaultargs") IsNegativeInfinite;
		%feature("autodoc", "Returns true if r may be considered as a negative infinite number. currently r < -1e100.

Parameters
----------
R: float

Returns
-------
bool
") IsNegativeInfinite;
		static Standard_Boolean IsNegativeInfinite(const Standard_Real R);

		/****************** IsPositiveInfinite ******************/
		/**** md5 signature: 5862ab4c33a8bfeca39b8149f8119f1c ****/
		%feature("compactdefaultargs") IsPositiveInfinite;
		%feature("autodoc", "Returns true if r may be considered as a positive infinite number. currently r > 1e100.

Parameters
----------
R: float

Returns
-------
bool
") IsPositiveInfinite;
		static Standard_Boolean IsPositiveInfinite(const Standard_Real R);

		/****************** PApproximation ******************/
		/**** md5 signature: 84696f0dcfbab897a31b069e2dc59034 ****/
		%feature("compactdefaultargs") PApproximation;
		%feature("autodoc", "Returns a precision value in parametric space, which may be used by approximation algorithms. the purpose of this function is to provide an acceptable level of precision in parametric space, for an approximation process to define the adjustment limits. the parametric tolerance of approximation is designed to give a mean value in relation with the dimension of the curve or the surface. it considers that a variation of parameter equal to 1. along a curve (or an isoparametric curve of a surface) generates a segment whose length is equal to 100. (default value), or t. the parametric tolerance of intersection is equal to : - precision::approximation() / 100., or precision::approximation() / t.

Parameters
----------
T: float

Returns
-------
float
") PApproximation;
		static Standard_Real PApproximation(const Standard_Real T);

		/****************** PApproximation ******************/
		/**** md5 signature: d360d120192e7adb3ad528e7b69e6be6 ****/
		%feature("compactdefaultargs") PApproximation;
		%feature("autodoc", "Used for approximations in parametric space on a default curve. //! this is precision::parametric(precision::approximation()).

Returns
-------
float
") PApproximation;
		static Standard_Real PApproximation();

		/****************** PConfusion ******************/
		/**** md5 signature: 238f64b4102880bc279d12eee169a243 ****/
		%feature("compactdefaultargs") PConfusion;
		%feature("autodoc", "Returns a precision value in parametric space, which may be used : - to test the coincidence of two points in the real space, by using parameter values, or - to test the equality of two parameter values in a parametric space. the parametric tolerance of confusion is designed to give a mean value in relation with the dimension of the curve or the surface. it considers that a variation of parameter equal to 1. along a curve (or an isoparametric curve of a surface) generates a segment whose length is equal to 100. (default value), or t. the parametric tolerance of confusion is equal to : - precision::confusion() / 100., or precision::confusion() / t. the value of the parametric tolerance of confusion is also used to define : - the parametric tolerance of intersection, and - the parametric tolerance of approximation. warning it is rather difficult to define a unique precision value in parametric space. - first consider a curve (c) ; if m is the point of parameter u and m' the point of parameter u+du on the curve, call 'parametric tangent' at point m, for the variation du of the parameter, the quantity : t(u,du)=mm'/du (where mm' represents the distance between the two points m and m', in the real space). - consider the other curve resulting from a scaling transformation of (c) with a scale factor equal to 10. the 'parametric tangent' at the point of parameter u of this curve is ten times greater than the previous one. this shows that for two different curves, the distance between two points on the curve, resulting from the same variation of parameter du, may vary considerably. - moreover, the variation of the parameter along the curve is generally not proportional to the curvilinear abscissa along the curve. so the distance between two points resulting from the same variation of parameter du, at two different points of a curve, may completely differ. - moreover, the parameterization of a surface may generate two quite different 'parametric tangent' values in the u or in the v parametric direction. - last, close to the poles of a sphere (the points which correspond to the values -pi/2. and pi/2. of the v parameter) the u parameter may change from 0 to 2.pi without impacting on the resulting point. therefore, take great care when adjusting a parametric tolerance to your own algorithm.

Parameters
----------
T: float

Returns
-------
float
") PConfusion;
		static Standard_Real PConfusion(const Standard_Real T);

		/****************** PConfusion ******************/
		/**** md5 signature: 73c63807f474a2814b625a3a6a41fd1d ****/
		%feature("compactdefaultargs") PConfusion;
		%feature("autodoc", "Used to test distances in parametric space on a default curve. //! this is precision::parametric(precision::confusion()).

Returns
-------
float
") PConfusion;
		static Standard_Real PConfusion();

		/****************** PIntersection ******************/
		/**** md5 signature: 100c6ef8c6b93420156b38ca0013086f ****/
		%feature("compactdefaultargs") PIntersection;
		%feature("autodoc", "Returns a precision value in parametric space, which may be used by intersection algorithms, to decide that a solution is reached. the purpose of this function is to provide an acceptable level of precision in parametric space, for an intersection process to define the adjustment limits. the parametric tolerance of intersection is designed to give a mean value in relation with the dimension of the curve or the surface. it considers that a variation of parameter equal to 1. along a curve (or an isoparametric curve of a surface) generates a segment whose length is equal to 100. (default value), or t. the parametric tolerance of intersection is equal to : - precision::intersection() / 100., or precision::intersection() / t.

Parameters
----------
T: float

Returns
-------
float
") PIntersection;
		static Standard_Real PIntersection(const Standard_Real T);

		/****************** PIntersection ******************/
		/**** md5 signature: 1e0aa721aff9c326ee4197e45512012f ****/
		%feature("compactdefaultargs") PIntersection;
		%feature("autodoc", "Used for intersections in parametric space on a default curve. //! this is precision::parametric(precision::intersection()).

Returns
-------
float
") PIntersection;
		static Standard_Real PIntersection();

		/****************** Parametric ******************/
		/**** md5 signature: b80b01f2f61cf57fc4e32991dcd1077d ****/
		%feature("compactdefaultargs") Parametric;
		%feature("autodoc", "Convert a real space precision to a parametric space precision. <t> is the mean value of the length of the tangent of the curve or the surface. //! value is p / t.

Parameters
----------
P: float
T: float

Returns
-------
float
") Parametric;
		static Standard_Real Parametric(const Standard_Real P, const Standard_Real T);

		/****************** Parametric ******************/
		/**** md5 signature: 05bee4f172b1b6527bb3ad73a6f4e087 ****/
		%feature("compactdefaultargs") Parametric;
		%feature("autodoc", "Convert a real space precision to a parametric space precision on a default curve. //! value is parametric(p,1.e+2).

Parameters
----------
P: float

Returns
-------
float
") Parametric;
		static Standard_Real Parametric(const Standard_Real P);

		/****************** SquareConfusion ******************/
		/**** md5 signature: be71c3860953c143014efe32d05c10a0 ****/
		%feature("compactdefaultargs") SquareConfusion;
		%feature("autodoc", "Returns square of confusion. created for speed and convenience.

Returns
-------
float
") SquareConfusion;
		static Standard_Real SquareConfusion();

		/****************** SquarePConfusion ******************/
		/**** md5 signature: 9640285578dd141b1cb17c0ad9dfc828 ****/
		%feature("compactdefaultargs") SquarePConfusion;
		%feature("autodoc", "Returns square of pconfusion. created for speed and convenience.

Returns
-------
float
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
