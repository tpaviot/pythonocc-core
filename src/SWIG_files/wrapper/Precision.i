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
%module (package="OCC") Precision

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


%include Precision_headers.i


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
/* end public enums declaration */

%rename(precision) Precision;
class Precision {
	public:
		%feature("compactdefaultargs") Angular;
		%feature("autodoc", "	* Returns the recommended precision value when checking the equality of two angles (given in radians). Standard_Real Angle1 = ... , Angle2 = ... ; If ( Abs( Angle2 - Angle1 ) < Precision::Angular() ) ... The tolerance of angular equality may be used to check the parallelism of two vectors : gp_Vec V1, V2 ; V1 = ... V2 = ... If ( V1.IsParallel (V2, Precision::Angular() ) ) ... The tolerance of angular equality is equal to 1.e-12. Note : The tolerance of angular equality can be used when working with scalar products or cross products since sines and angles are equivalent for small angles. Therefore, in order to check whether two unit vectors are perpendicular : gp_Dir D1, D2 ; D1 = ... D2 = ... you can use : If ( Abs( D1.D2 ) < Precision::Angular() ) ... (although the function IsNormal does exist).

	:rtype: float
") Angular;
		static Standard_Real Angular ();
		%feature("compactdefaultargs") Confusion;
		%feature("autodoc", "	* Returns the recommended precision value when checking coincidence of two points in real space. The tolerance of confusion is used for testing a 3D distance : - Two points are considered to be coincident if their distance is smaller than the tolerance of confusion. gp_Pnt P1, P2 ; P1 = ... P2 = ... if ( P1.IsEqual ( P2 , Precision::Confusion() ) ) then ... - A vector is considered to be null if it has a null length : gp_Vec V ; V = ... if ( V.Magnitude() < Precision::Confusion() ) then ... The tolerance of confusion is equal to 1.e-7. The value of the tolerance of confusion is also used to define : - the tolerance of intersection, and - the tolerance of approximation. Note : As a rule, coordinate values in Cas.Cade are not dimensioned, so 1. represents one user unit, whatever value the unit may have : the millimeter, the meter, the inch, or any other unit. Let's say that Cas.Cade algorithms are written to be tuned essentially with mechanical design applications, on the basis of the millimeter. However, these algorithms may be used with any other unit but the tolerance criterion does no longer have the same signification. So pay particular attention to the type of your application, in relation with the impact of your unit on the precision criterion. - For example in mechanical design, if the unit is the millimeter, the tolerance of confusion corresponds to a distance of 1 / 10000 micron, which is rather difficult to measure. - However in other types of applications, such as cartography, where the kilometer is frequently used, the tolerance of confusion corresponds to a greater distance (1 / 10 millimeter). This distance becomes easily measurable, but only within a restricted space which contains some small objects of the complete scene.

	:rtype: float
") Confusion;
		static Standard_Real Confusion ();
		%feature("compactdefaultargs") SquareConfusion;
		%feature("autodoc", "	* Returns square of Confusion. Created for speed and convenience.

	:rtype: float
") SquareConfusion;
		static Standard_Real SquareConfusion ();
		%feature("compactdefaultargs") Intersection;
		%feature("autodoc", "	* Returns the precision value in real space, frequently used by intersection algorithms to decide that a solution is reached. This function provides an acceptable level of precision for an intersection process to define the adjustment limits. The tolerance of intersection is designed to ensure that a point computed by an iterative algorithm as the intersection between two curves is indeed on the intersection. It is obvious that two tangent curves are close to each other, on a large distance. An iterative algorithm of intersection may find points on these curves within the scope of the confusion tolerance, but still far from the true intersection point. In order to force the intersection algorithm to continue the iteration process until a correct point is found on the tangent objects, the tolerance of intersection must be smaller than the tolerance of confusion. On the other hand, the tolerance of intersection must be large enough to minimize the time required by the process to converge to a solution. The tolerance of intersection is equal to : Precision::Confusion() / 100. (that is, 1.e-9).

	:rtype: float
") Intersection;
		static Standard_Real Intersection ();
		%feature("compactdefaultargs") Approximation;
		%feature("autodoc", "	* Returns the precision value in real space, frequently used by approximation algorithms. This function provides an acceptable level of precision for an approximation process to define adjustment limits. The tolerance of approximation is designed to ensure an acceptable computation time when performing an approximation process. That is why the tolerance of approximation is greater than the tolerance of confusion. The tolerance of approximation is equal to : Precision::Confusion() * 10. (that is, 1.e-6). You may use a smaller tolerance in an approximation algorithm, but this option might be costly.

	:rtype: float
") Approximation;
		static Standard_Real Approximation ();
		%feature("compactdefaultargs") Parametric;
		%feature("autodoc", "	* Convert a real space precision to a parametric space precision. <T> is the mean value of the length of the tangent of the curve or the surface. //! Value is P / T

	:param P:
	:type P: float
	:param T:
	:type T: float
	:rtype: float
") Parametric;
		static Standard_Real Parametric (const Standard_Real P,const Standard_Real T);
		%feature("compactdefaultargs") PConfusion;
		%feature("autodoc", "	* Returns a precision value in parametric space, which may be used : - to test the coincidence of two points in the real space, by using parameter values, or - to test the equality of two parameter values in a parametric space. The parametric tolerance of confusion is designed to give a mean value in relation with the dimension of the curve or the surface. It considers that a variation of parameter equal to 1. along a curve (or an isoparametric curve of a surface) generates a segment whose length is equal to 100. (default value), or T. The parametric tolerance of confusion is equal to : - Precision::Confusion() / 100., or Precision::Confusion() / T. The value of the parametric tolerance of confusion is also used to define : - the parametric tolerance of intersection, and - the parametric tolerance of approximation. Warning It is rather difficult to define a unique precision value in parametric space. - First consider a curve (c) ; if M is the point of parameter u and M' the point of parameter u+du on the curve, call 'parametric tangent' at point M, for the variation du of the parameter, the quantity : T(u,du)=MM'/du (where MM' represents the distance between the two points M and M', in the real space). - Consider the other curve resulting from a scaling transformation of (c) with a scale factor equal to 10. The 'parametric tangent' at the point of parameter u of this curve is ten times greater than the previous one. This shows that for two different curves, the distance between two points on the curve, resulting from the same variation of parameter du, may vary considerably. - Moreover, the variation of the parameter along the curve is generally not proportional to the curvilinear abscissa along the curve. So the distance between two points resulting from the same variation of parameter du, at two different points of a curve, may completely differ. - Moreover, the parameterization of a surface may generate two quite different 'parametric tangent' values in the u or in the v parametric direction. - Last, close to the poles of a sphere (the points which correspond to the values -Pi/2. and Pi/2. of the v parameter) the u parameter may change from 0 to 2.Pi without impacting on the resulting point. Therefore, take great care when adjusting a parametric tolerance to your own algorithm.

	:param T:
	:type T: float
	:rtype: float
") PConfusion;
		static Standard_Real PConfusion (const Standard_Real T);
		%feature("compactdefaultargs") PIntersection;
		%feature("autodoc", "	* Returns a precision value in parametric space, which may be used by intersection algorithms, to decide that a solution is reached. The purpose of this function is to provide an acceptable level of precision in parametric space, for an intersection process to define the adjustment limits. The parametric tolerance of intersection is designed to give a mean value in relation with the dimension of the curve or the surface. It considers that a variation of parameter equal to 1. along a curve (or an isoparametric curve of a surface) generates a segment whose length is equal to 100. (default value), or T. The parametric tolerance of intersection is equal to : - Precision::Intersection() / 100., or Precision::Intersection() / T.

	:param T:
	:type T: float
	:rtype: float
") PIntersection;
		static Standard_Real PIntersection (const Standard_Real T);
		%feature("compactdefaultargs") PApproximation;
		%feature("autodoc", "	* Returns a precision value in parametric space, which may be used by approximation algorithms. The purpose of this function is to provide an acceptable level of precision in parametric space, for an approximation process to define the adjustment limits. The parametric tolerance of approximation is designed to give a mean value in relation with the dimension of the curve or the surface. It considers that a variation of parameter equal to 1. along a curve (or an isoparametric curve of a surface) generates a segment whose length is equal to 100. (default value), or T. The parametric tolerance of intersection is equal to : - Precision::Approximation() / 100., or Precision::Approximation() / T.

	:param T:
	:type T: float
	:rtype: float
") PApproximation;
		static Standard_Real PApproximation (const Standard_Real T);
		%feature("compactdefaultargs") Parametric;
		%feature("autodoc", "	* Convert a real space precision to a parametric space precision on a default curve. //! Value is Parametric(P,1.e+2)

	:param P:
	:type P: float
	:rtype: float
") Parametric;
		static Standard_Real Parametric (const Standard_Real P);
		%feature("compactdefaultargs") PConfusion;
		%feature("autodoc", "	* Used to test distances in parametric space on a default curve. //! This is Precision::Parametric(Precision::Confusion())

	:rtype: float
") PConfusion;
		static Standard_Real PConfusion ();
		%feature("compactdefaultargs") PIntersection;
		%feature("autodoc", "	* Used for Intersections in parametric space on a default curve. //! This is Precision::Parametric(Precision::Intersection())

	:rtype: float
") PIntersection;
		static Standard_Real PIntersection ();
		%feature("compactdefaultargs") PApproximation;
		%feature("autodoc", "	* Used for Approximations in parametric space on a default curve. //! This is Precision::Parametric(Precision::Approximation())

	:rtype: float
") PApproximation;
		static Standard_Real PApproximation ();
		%feature("compactdefaultargs") IsInfinite;
		%feature("autodoc", "	* Returns True if R may be considered as an infinite number. Currently Abs(R) > 1e100

	:param R:
	:type R: float
	:rtype: bool
") IsInfinite;
		static Standard_Boolean IsInfinite (const Standard_Real R);
		%feature("compactdefaultargs") IsPositiveInfinite;
		%feature("autodoc", "	* Returns True if R may be considered as a positive infinite number. Currently R > 1e100

	:param R:
	:type R: float
	:rtype: bool
") IsPositiveInfinite;
		static Standard_Boolean IsPositiveInfinite (const Standard_Real R);
		%feature("compactdefaultargs") IsNegativeInfinite;
		%feature("autodoc", "	* Returns True if R may be considered as a negative infinite number. Currently R < -1e100

	:param R:
	:type R: float
	:rtype: bool
") IsNegativeInfinite;
		static Standard_Boolean IsNegativeInfinite (const Standard_Real R);
		%feature("compactdefaultargs") Infinite;
		%feature("autodoc", "	* Returns a big number that can be considered as infinite. Use -Infinite() for a negative big number.

	:rtype: float
") Infinite;
		static Standard_Real Infinite ();
};


%extend Precision {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
