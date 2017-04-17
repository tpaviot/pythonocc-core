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
%module (package="OCC") GCPnts

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


%include GCPnts_headers.i


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
enum GCPnts_AbscissaType {
	GCPnts_LengthParametrized = 0,
	GCPnts_Parametrized = 1,
	GCPnts_AbsComposite = 2,
};

enum GCPnts_DeflectionType {
	GCPnts_Linear = 0,
	GCPnts_Circular = 1,
	GCPnts_Curved = 2,
	GCPnts_DefComposite = 3,
};

/* end public enums declaration */

class GCPnts_AbscissaPoint {
	public:
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* Computes the length of the Curve <C>.

	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: float
") Length;
		static Standard_Real Length (Adaptor3d_Curve & C);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* Computes the length of the Curve <C>.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: float
") Length;
		static Standard_Real Length (Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* Computes the length of the Curve <C> with the given tolerance.

	:param C:
	:type C: Adaptor3d_Curve &
	:param Tol:
	:type Tol: float
	:rtype: float
") Length;
		static Standard_Real Length (Adaptor3d_Curve & C,const Standard_Real Tol);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* Computes the length of the Curve <C> with the given tolerance.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Tol:
	:type Tol: float
	:rtype: float
") Length;
		static Standard_Real Length (Adaptor2d_Curve2d & C,const Standard_Real Tol);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* Computes the length of the Curve <C>.

	:param C:
	:type C: Adaptor3d_Curve &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: float
") Length;
		static Standard_Real Length (Adaptor3d_Curve & C,const Standard_Real U1,const Standard_Real U2);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* Computes the length of the Curve <C>.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: float
") Length;
		static Standard_Real Length (Adaptor2d_Curve2d & C,const Standard_Real U1,const Standard_Real U2);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* Computes the length of the Curve <C> with the given tolerance.

	:param C:
	:type C: Adaptor3d_Curve &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Tol:
	:type Tol: float
	:rtype: float
") Length;
		static Standard_Real Length (Adaptor3d_Curve & C,const Standard_Real U1,const Standard_Real U2,const Standard_Real Tol);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* Computes the length of the Curve <C> with the given tolerance. Constructs an empty algorithm. This function is used only for initializing a framework to compute the length of a curve (or a series of curves). Warning The function IsDone will return the value false after the use of this function.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Tol:
	:type Tol: float
	:rtype: float
") Length;
		static Standard_Real Length (Adaptor2d_Curve2d & C,const Standard_Real U1,const Standard_Real U2,const Standard_Real Tol);
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "	:rtype: None
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint ();
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "	* the algorithm computes a point on a curve <Curve> at the distance <Abscissa> from the point of parameter <U0>.

	:param C:
	:type C: Adaptor3d_Curve &
	:param Abscissa:
	:type Abscissa: float
	:param U0:
	:type U0: float
	:rtype: None
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint (Adaptor3d_Curve & C,const Standard_Real Abscissa,const Standard_Real U0);
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "	* the algorithm computes a point on a curve <Curve> at the distance <Abscissa> from the point of parameter <U0> with the given tolerance.

	:param Tol:
	:type Tol: float
	:param C:
	:type C: Adaptor3d_Curve &
	:param Abscissa:
	:type Abscissa: float
	:param U0:
	:type U0: float
	:rtype: None
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint (const Standard_Real Tol,Adaptor3d_Curve & C,const Standard_Real Abscissa,const Standard_Real U0);
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "	* the algorithm computes a point on a curve <Curve> at the distance <Abscissa> from the point of parameter <U0> with the given tolerance.

	:param Tol:
	:type Tol: float
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Abscissa:
	:type Abscissa: float
	:param U0:
	:type U0: float
	:rtype: None
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint (const Standard_Real Tol,Adaptor2d_Curve2d & C,const Standard_Real Abscissa,const Standard_Real U0);
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "	* the algorithm computes a point on a curve <Curve> at the distance <Abscissa> from the point of parameter <U0>.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Abscissa:
	:type Abscissa: float
	:param U0:
	:type U0: float
	:rtype: None
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint (Adaptor2d_Curve2d & C,const Standard_Real Abscissa,const Standard_Real U0);
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "	* the algorithm computes a point on a curve <Curve> at the distance <Abscissa> from the point of parameter <U0>. <Ui> is the starting value used in the iterative process which find the solution, it must be close to the final solution

	:param C:
	:type C: Adaptor3d_Curve &
	:param Abscissa:
	:type Abscissa: float
	:param U0:
	:type U0: float
	:param Ui:
	:type Ui: float
	:rtype: None
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint (Adaptor3d_Curve & C,const Standard_Real Abscissa,const Standard_Real U0,const Standard_Real Ui);
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "	* the algorithm computes a point on a curve <Curve> at the distance <Abscissa> from the point of parameter <U0>. <Ui> is the starting value used in the iterative process which find the solution, it must be closed to the final solution

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Abscissa:
	:type Abscissa: float
	:param U0:
	:type U0: float
	:param Ui:
	:type Ui: float
	:rtype: None
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint (Adaptor2d_Curve2d & C,const Standard_Real Abscissa,const Standard_Real U0,const Standard_Real Ui);
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "	* the algorithm computes a point on a curve <Curve> at the distance <Abscissa> from the point of parameter <U0>. <Ui> is the starting value used in the iterative process which find the solution, it must be close to the final solution

	:param C:
	:type C: Adaptor3d_Curve &
	:param Abscissa:
	:type Abscissa: float
	:param U0:
	:type U0: float
	:param Ui:
	:type Ui: float
	:param Tol:
	:type Tol: float
	:rtype: None
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint (Adaptor3d_Curve & C,const Standard_Real Abscissa,const Standard_Real U0,const Standard_Real Ui,const Standard_Real Tol);
		%feature("compactdefaultargs") GCPnts_AbscissaPoint;
		%feature("autodoc", "	* the algorithm computes a point on a curve <Curve> at the distance <Abscissa> from the point of parameter <U0>. <Ui> is the starting value used in the iterative process which find the solution, it must be close to the final solution

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Abscissa:
	:type Abscissa: float
	:param U0:
	:type U0: float
	:param Ui:
	:type Ui: float
	:param Tol:
	:type Tol: float
	:rtype: None
") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint (Adaptor2d_Curve2d & C,const Standard_Real Abscissa,const Standard_Real U0,const Standard_Real Ui,const Standard_Real Tol);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* True if the computation was successful, False otherwise. IsDone is a protection against: - non-convergence of the algorithm - querying the results before computation.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Returns the parameter on the curve of the point solution of this algorithm. Exceptions StdFail_NotDone if the computation was not successful, or was not done.

	:rtype: float
") Parameter;
		Standard_Real Parameter ();
};


%extend GCPnts_AbscissaPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GCPnts_QuasiUniformAbscissa;
class GCPnts_QuasiUniformAbscissa {
	public:
		%feature("compactdefaultargs") GCPnts_QuasiUniformAbscissa;
		%feature("autodoc", "	* Constructs an empty algorithm. To define the problem to be solved, use the function Initialize.

	:rtype: None
") GCPnts_QuasiUniformAbscissa;
		 GCPnts_QuasiUniformAbscissa ();
		%feature("compactdefaultargs") GCPnts_QuasiUniformAbscissa;
		%feature("autodoc", "	* Computes a uniform abscissa distribution of points - on the curve C where Abscissa is the curvilinear distance between two consecutive points of the distribution.

	:param C:
	:type C: Adaptor3d_Curve &
	:param NbPoints:
	:type NbPoints: int
	:rtype: None
") GCPnts_QuasiUniformAbscissa;
		 GCPnts_QuasiUniformAbscissa (Adaptor3d_Curve & C,const Standard_Integer NbPoints);
		%feature("compactdefaultargs") GCPnts_QuasiUniformAbscissa;
		%feature("autodoc", "	* Computes a uniform abscissa distribution of points on the part of curve C limited by the two parameter values U1 and U2, where Abscissa is the curvilinear distance between two consecutive points of the distribution. The first point of the distribution is either the origin of curve C or the point of parameter U1. The following points are computed such that the curvilinear distance between two consecutive points is equal to Abscissa. The last point of the distribution is either the end point of curve C or the point of parameter U2. However the curvilinear distance between this last point and the point just preceding it in the distribution is, of course, generally not equal to Abscissa. Use the function IsDone to verify that the computation was successful, the function NbPoints to obtain the number of points of the computed distribution, and the function Parameter to read the parameter of each point. Warning The roles of U1 and U2 are inverted if U1 > U2 . Warning C is an adapted curve, that is, an object which is an interface between: - the services provided by either a 2D curve from the package Geom2d (in the case of an Adaptor2d_Curve2d curve) or a 3D curve from the package Geom (in the case of an Adaptor3d_Curve curve), - and those required on the curve by the computation algorithm.

	:param C:
	:type C: Adaptor3d_Curve &
	:param NbPoints:
	:type NbPoints: int
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: None
") GCPnts_QuasiUniformAbscissa;
		 GCPnts_QuasiUniformAbscissa (Adaptor3d_Curve & C,const Standard_Integer NbPoints,const Standard_Real U1,const Standard_Real U2);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initialize the algoritms with <C>, <NbPoints> and

	:param C:
	:type C: Adaptor3d_Curve &
	:param NbPoints:
	:type NbPoints: int
	:rtype: None
") Initialize;
		void Initialize (Adaptor3d_Curve & C,const Standard_Integer NbPoints);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initialize the algoritms with <C>, <Abscissa>, <U1>, <U2>.

	:param C:
	:type C: Adaptor3d_Curve &
	:param NbPoints:
	:type NbPoints: int
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: None
") Initialize;
		void Initialize (Adaptor3d_Curve & C,const Standard_Integer NbPoints,const Standard_Real U1,const Standard_Real U2);
		%feature("compactdefaultargs") GCPnts_QuasiUniformAbscissa;
		%feature("autodoc", "	* Computes a uniform abscissa distribution of points on the Curve2d <C>. <NbPoints> defines the nomber of desired points.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param NbPoints:
	:type NbPoints: int
	:rtype: None
") GCPnts_QuasiUniformAbscissa;
		 GCPnts_QuasiUniformAbscissa (Adaptor2d_Curve2d & C,const Standard_Integer NbPoints);
		%feature("compactdefaultargs") GCPnts_QuasiUniformAbscissa;
		%feature("autodoc", "	* Computes a Uniform abscissa distribution of points on a part of the Curve2d <C>.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param NbPoints:
	:type NbPoints: int
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: None
") GCPnts_QuasiUniformAbscissa;
		 GCPnts_QuasiUniformAbscissa (Adaptor2d_Curve2d & C,const Standard_Integer NbPoints,const Standard_Real U1,const Standard_Real U2);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initialize the algoritms with <C>, <NbPoints> and

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param NbPoints:
	:type NbPoints: int
	:rtype: None
") Initialize;
		void Initialize (Adaptor2d_Curve2d & C,const Standard_Integer NbPoints);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initialize the algoritms with <C>, <Abscissa>, <U1>, <U2>.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param NbPoints:
	:type NbPoints: int
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: None
") Initialize;
		void Initialize (Adaptor2d_Curve2d & C,const Standard_Integer NbPoints,const Standard_Real U1,const Standard_Real U2);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the computation was successful. IsDone is a protection against: - non-convergence of the algorithm - querying the results before computation.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	* Returns the number of points of the distribution computed by this algorithm. This value is either: - the one imposed on the algorithm at the time of construction (or initialization), or - the one computed by the algorithm when the curvilinear distance between two consecutive points of the distribution is imposed on the algorithm at the time of construction (or initialization). Exceptions StdFail_NotDone if this algorithm has not been initialized, or if the computation was not successful.

	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Returns the parameter of the point of index Index in the distribution computed by this algorithm. Warning Index must be greater than or equal to 1, and less than or equal to the number of points of the distribution. However, pay particular attention as this condition is not checked by this function. Exceptions StdFail_NotDone if this algorithm has not been initialized, or if the computation was not successful.

	:param Index:
	:type Index: int
	:rtype: float
") Parameter;
		Standard_Real Parameter (const Standard_Integer Index);
};


%extend GCPnts_QuasiUniformAbscissa {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GCPnts_QuasiUniformDeflection;
class GCPnts_QuasiUniformDeflection {
	public:
		%feature("compactdefaultargs") GCPnts_QuasiUniformDeflection;
		%feature("autodoc", "	* Constructs an empty algorithm. To define the problem to be solved, use the function Initialize.

	:rtype: None
") GCPnts_QuasiUniformDeflection;
		 GCPnts_QuasiUniformDeflection ();
		%feature("compactdefaultargs") GCPnts_QuasiUniformDeflection;
		%feature("autodoc", "	* Computes a QuasiUniform Deflection distribution of points on the Curve <C>.

	:param C:
	:type C: Adaptor3d_Curve &
	:param Deflection:
	:type Deflection: float
	:param Continuity: default value is GeomAbs_C1
	:type Continuity: GeomAbs_Shape
	:rtype: None
") GCPnts_QuasiUniformDeflection;
		 GCPnts_QuasiUniformDeflection (Adaptor3d_Curve & C,const Standard_Real Deflection,const GeomAbs_Shape Continuity = GeomAbs_C1);
		%feature("compactdefaultargs") GCPnts_QuasiUniformDeflection;
		%feature("autodoc", "	* Computes a QuasiUniform Deflection distribution of points on the Curve <C>.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Deflection:
	:type Deflection: float
	:param Continuity: default value is GeomAbs_C1
	:type Continuity: GeomAbs_Shape
	:rtype: None
") GCPnts_QuasiUniformDeflection;
		 GCPnts_QuasiUniformDeflection (Adaptor2d_Curve2d & C,const Standard_Real Deflection,const GeomAbs_Shape Continuity = GeomAbs_C1);
		%feature("compactdefaultargs") GCPnts_QuasiUniformDeflection;
		%feature("autodoc", "	* Computes a QuasiUniform Deflection distribution of points on a part of the Curve <C>.

	:param C:
	:type C: Adaptor3d_Curve &
	:param Deflection:
	:type Deflection: float
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Continuity: default value is GeomAbs_C1
	:type Continuity: GeomAbs_Shape
	:rtype: None
") GCPnts_QuasiUniformDeflection;
		 GCPnts_QuasiUniformDeflection (Adaptor3d_Curve & C,const Standard_Real Deflection,const Standard_Real U1,const Standard_Real U2,const GeomAbs_Shape Continuity = GeomAbs_C1);
		%feature("compactdefaultargs") GCPnts_QuasiUniformDeflection;
		%feature("autodoc", "	* Computes a QuasiUniform Deflection distribution of points on a part of the Curve <C>. This and the above algorithms compute a distribution of points: - on the curve C, or - on the part of curve C limited by the two parameter values U1 and U2, where the deflection resulting from the distributed points is not greater than Deflection. The first point of the distribution is either the origin of curve C or the point of parameter U1. The last point of the distribution is either the end point of curve C or the point of parameter U2. Intermediate points of the distribution are built such that the deflection is not greater than Deflection. Using the following evaluation of the deflection: if Pi and Pj are two consecutive points of the distribution, respectively of parameter ui and uj on the curve, the deflection is the distance between: - the mid-point of Pi and Pj (the center of the chord joining these two points) - and the point of mid-parameter of these two points (the point of parameter [(ui+uj) / 2 ] on curve C). Continuity, defaulted to GeomAbs_C1, gives the degree of continuity of the curve C. (Note that C is an Adaptor3d_Curve or an Adaptor2d_Curve2d object, and does not know the degree of continuity of the underlying curve). Use the function IsDone to verify that the computation was successful, the function NbPoints to obtain the number of points of the computed distribution, and the function Parameter to read the parameter of each point. Warning - The roles of U1 and U2 are inverted if U1 > U2. - Derivative functions on the curve are called according to Continuity. An error may occur if Continuity is greater than the real degree of continuity of the curve. Warning C is an adapted curve, i.e. an object which is an interface between: - the services provided by either a 2D curve from the package Geom2d (in the case of an Adaptor2d_Curve2d curve) or a 3D curve from the package Geom (in the case of an Adaptor3d_Curve curve), - and those required on the curve by the computation algorithm.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Deflection:
	:type Deflection: float
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Continuity: default value is GeomAbs_C1
	:type Continuity: GeomAbs_Shape
	:rtype: None
") GCPnts_QuasiUniformDeflection;
		 GCPnts_QuasiUniformDeflection (Adaptor2d_Curve2d & C,const Standard_Real Deflection,const Standard_Real U1,const Standard_Real U2,const GeomAbs_Shape Continuity = GeomAbs_C1);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initialize the algoritms with <C>, <Deflection>

	:param C:
	:type C: Adaptor3d_Curve &
	:param Deflection:
	:type Deflection: float
	:param Continuity: default value is GeomAbs_C1
	:type Continuity: GeomAbs_Shape
	:rtype: None
") Initialize;
		void Initialize (Adaptor3d_Curve & C,const Standard_Real Deflection,const GeomAbs_Shape Continuity = GeomAbs_C1);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initialize the algoritms with <C>, <Deflection>

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Deflection:
	:type Deflection: float
	:param Continuity: default value is GeomAbs_C1
	:type Continuity: GeomAbs_Shape
	:rtype: None
") Initialize;
		void Initialize (Adaptor2d_Curve2d & C,const Standard_Real Deflection,const GeomAbs_Shape Continuity = GeomAbs_C1);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initialize the algoritms with <C>, <Deflection>, <U1>,<U2>

	:param C:
	:type C: Adaptor3d_Curve &
	:param Deflection:
	:type Deflection: float
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Continuity: default value is GeomAbs_C1
	:type Continuity: GeomAbs_Shape
	:rtype: None
") Initialize;
		void Initialize (Adaptor3d_Curve & C,const Standard_Real Deflection,const Standard_Real U1,const Standard_Real U2,const GeomAbs_Shape Continuity = GeomAbs_C1);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initialize the algoritms with <C>, <Deflection>, -- <U1>,<U2> This and the above algorithms initialize (or reinitialize) this algorithm and compute a distribution of points: - on the curve C, or - on the part of curve C limited by the two parameter values U1 and U2, where the deflection resulting from the distributed points is not greater than Deflection. The first point of the distribution is either the origin of curve C or the point of parameter U1. The last point of the distribution is either the end point of curve C or the point of parameter U2. Intermediate points of the distribution are built in such a way that the deflection is not greater than Deflection. Using the following evaluation of the deflection: if Pi and Pj are two consecutive points of the distribution, respectively of parameter ui and uj on the curve, the deflection is the distance between: - the mid-point of Pi and Pj (the center of the chord joining these two points) - and the point of mid-parameter of these two points (the point of parameter [(ui+uj) / 2 ] on curve C). Continuity, defaulted to GeomAbs_C1, gives the degree of continuity of the curve C. (Note that C is an Adaptor3d_Curve or an Adaptor2d_Curve2d object, and does not know the degree of continuity of the underlying curve). Use the function IsDone to verify that the computation was successful, the function NbPoints to obtain the number of points of the computed distribution, and the function Parameter to read the parameter of each point. Warning - The roles of U1 and U2 are inverted if U1 > U2. - Derivative functions on the curve are called according to Continuity. An error may occur if Continuity is greater than the real degree of continuity of the curve. Warning C is an adapted curve, i.e. an object which is an interface between: - the services provided by either a 2D curve from the package Geom2d (in the case of an Adaptor2d_Curve2d curve) or a 3D curve from the package Geom (in the case of an Adaptor3d_Curve curve), and those required on the curve by the computation algorithm.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Deflection:
	:type Deflection: float
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Continuity: default value is GeomAbs_C1
	:type Continuity: GeomAbs_Shape
	:rtype: None
") Initialize;
		void Initialize (Adaptor2d_Curve2d & C,const Standard_Real Deflection,const Standard_Real U1,const Standard_Real U2,const GeomAbs_Shape Continuity = GeomAbs_C1);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the computation was successful. IsDone is a protection against: - non-convergence of the algorithm - querying the results before computation.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	* Returns the number of points of the distribution computed by this algorithm. Exceptions StdFail_NotDone if this algorithm has not been initialized, or if the computation was not successful.

	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Returns the parameter of the point of index Index in the distribution computed by this algorithm. Warning Index must be greater than or equal to 1, and less than or equal to the number of points of the distribution. However, pay particular attention as this condition is not checked by this function. Exceptions StdFail_NotDone if this algorithm has not been initialized, or if the computation was not successful.

	:param Index:
	:type Index: int
	:rtype: float
") Parameter;
		Standard_Real Parameter (const Standard_Integer Index);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the point of index Index in the distribution computed by this algorithm. Warning Index must be greater than or equal to 1, and less than or equal to the number of points of the distribution. However, pay particular attention as this condition is not checked by this function. Exceptions StdFail_NotDone if this algorithm has not been initialized, or if the computation was not successful.

	:param Index:
	:type Index: int
	:rtype: gp_Pnt
") Value;
		gp_Pnt Value (const Standard_Integer Index);
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "	* Returns the deflection between the curve and the polygon resulting from the points of the distribution computed by this algorithm. This is the value given to the algorithm at the time of construction (or initialization). Exceptions StdFail_NotDone if this algorithm has not been initialized, or if the computation was not successful.

	:rtype: float
") Deflection;
		Standard_Real Deflection ();
};


%extend GCPnts_QuasiUniformDeflection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GCPnts_TangentialDeflection;
class GCPnts_TangentialDeflection {
	public:
		%feature("compactdefaultargs") GCPnts_TangentialDeflection;
		%feature("autodoc", "	:rtype: None
") GCPnts_TangentialDeflection;
		 GCPnts_TangentialDeflection ();
		%feature("compactdefaultargs") GCPnts_TangentialDeflection;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param AngularDeflection:
	:type AngularDeflection: float
	:param CurvatureDeflection:
	:type CurvatureDeflection: float
	:param MinimumOfPoints: default value is 2
	:type MinimumOfPoints: int
	:param UTol: default value is 1.0e-9
	:type UTol: float
	:param theMinLen: default value is 1.0e-7
	:type theMinLen: float
	:rtype: None
") GCPnts_TangentialDeflection;
		 GCPnts_TangentialDeflection (const Adaptor3d_Curve & C,const Standard_Real AngularDeflection,const Standard_Real CurvatureDeflection,const Standard_Integer MinimumOfPoints = 2,const Standard_Real UTol = 1.0e-9,const Standard_Real theMinLen = 1.0e-7);
		%feature("compactdefaultargs") GCPnts_TangentialDeflection;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param FirstParameter:
	:type FirstParameter: float
	:param LastParameter:
	:type LastParameter: float
	:param AngularDeflection:
	:type AngularDeflection: float
	:param CurvatureDeflection:
	:type CurvatureDeflection: float
	:param MinimumOfPoints: default value is 2
	:type MinimumOfPoints: int
	:param UTol: default value is 1.0e-9
	:type UTol: float
	:param theMinLen: default value is 1.0e-7
	:type theMinLen: float
	:rtype: None
") GCPnts_TangentialDeflection;
		 GCPnts_TangentialDeflection (const Adaptor3d_Curve & C,const Standard_Real FirstParameter,const Standard_Real LastParameter,const Standard_Real AngularDeflection,const Standard_Real CurvatureDeflection,const Standard_Integer MinimumOfPoints = 2,const Standard_Real UTol = 1.0e-9,const Standard_Real theMinLen = 1.0e-7);
		%feature("compactdefaultargs") GCPnts_TangentialDeflection;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param AngularDeflection:
	:type AngularDeflection: float
	:param CurvatureDeflection:
	:type CurvatureDeflection: float
	:param MinimumOfPoints: default value is 2
	:type MinimumOfPoints: int
	:param UTol: default value is 1.0e-9
	:type UTol: float
	:param theMinLen: default value is 1.0e-7
	:type theMinLen: float
	:rtype: None
") GCPnts_TangentialDeflection;
		 GCPnts_TangentialDeflection (const Adaptor2d_Curve2d & C,const Standard_Real AngularDeflection,const Standard_Real CurvatureDeflection,const Standard_Integer MinimumOfPoints = 2,const Standard_Real UTol = 1.0e-9,const Standard_Real theMinLen = 1.0e-7);
		%feature("compactdefaultargs") GCPnts_TangentialDeflection;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param FirstParameter:
	:type FirstParameter: float
	:param LastParameter:
	:type LastParameter: float
	:param AngularDeflection:
	:type AngularDeflection: float
	:param CurvatureDeflection:
	:type CurvatureDeflection: float
	:param MinimumOfPoints: default value is 2
	:type MinimumOfPoints: int
	:param UTol: default value is 1.0e-9
	:type UTol: float
	:param theMinLen: default value is 1.0e-7
	:type theMinLen: float
	:rtype: None
") GCPnts_TangentialDeflection;
		 GCPnts_TangentialDeflection (const Adaptor2d_Curve2d & C,const Standard_Real FirstParameter,const Standard_Real LastParameter,const Standard_Real AngularDeflection,const Standard_Real CurvatureDeflection,const Standard_Integer MinimumOfPoints = 2,const Standard_Real UTol = 1.0e-9,const Standard_Real theMinLen = 1.0e-7);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param AngularDeflection:
	:type AngularDeflection: float
	:param CurvatureDeflection:
	:type CurvatureDeflection: float
	:param MinimumOfPoints: default value is 2
	:type MinimumOfPoints: int
	:param UTol: default value is 1.0e-9
	:type UTol: float
	:param theMinLen: default value is 1.0e-7
	:type theMinLen: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Real AngularDeflection,const Standard_Real CurvatureDeflection,const Standard_Integer MinimumOfPoints = 2,const Standard_Real UTol = 1.0e-9,const Standard_Real theMinLen = 1.0e-7);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param FirstParameter:
	:type FirstParameter: float
	:param LastParameter:
	:type LastParameter: float
	:param AngularDeflection:
	:type AngularDeflection: float
	:param CurvatureDeflection:
	:type CurvatureDeflection: float
	:param MinimumOfPoints: default value is 2
	:type MinimumOfPoints: int
	:param UTol: default value is 1.0e-9
	:type UTol: float
	:param theMinLen: default value is 1.0e-7
	:type theMinLen: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Real FirstParameter,const Standard_Real LastParameter,const Standard_Real AngularDeflection,const Standard_Real CurvatureDeflection,const Standard_Integer MinimumOfPoints = 2,const Standard_Real UTol = 1.0e-9,const Standard_Real theMinLen = 1.0e-7);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param AngularDeflection:
	:type AngularDeflection: float
	:param CurvatureDeflection:
	:type CurvatureDeflection: float
	:param MinimumOfPoints: default value is 2
	:type MinimumOfPoints: int
	:param UTol: default value is 1.0e-9
	:type UTol: float
	:param theMinLen: default value is 1.0e-7
	:type theMinLen: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Real AngularDeflection,const Standard_Real CurvatureDeflection,const Standard_Integer MinimumOfPoints = 2,const Standard_Real UTol = 1.0e-9,const Standard_Real theMinLen = 1.0e-7);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param FirstParameter:
	:type FirstParameter: float
	:param LastParameter:
	:type LastParameter: float
	:param AngularDeflection:
	:type AngularDeflection: float
	:param CurvatureDeflection:
	:type CurvatureDeflection: float
	:param MinimumOfPoints: default value is 2
	:type MinimumOfPoints: int
	:param UTol: default value is 1.0e-9
	:type UTol: float
	:param theMinLen: default value is 1.0e-7
	:type theMinLen: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Real FirstParameter,const Standard_Real LastParameter,const Standard_Real AngularDeflection,const Standard_Real CurvatureDeflection,const Standard_Integer MinimumOfPoints = 2,const Standard_Real UTol = 1.0e-9,const Standard_Real theMinLen = 1.0e-7);
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "	* Add point to already calculated points (or replace existing) Returns index of new added point or founded with parametric tolerance (replaced if theIsReplace is true)

	:param thePnt:
	:type thePnt: gp_Pnt
	:param theParam:
	:type theParam: float
	:param theIsReplace: default value is Standard_True
	:type theIsReplace: bool
	:rtype: int
") AddPoint;
		Standard_Integer AddPoint (const gp_Pnt & thePnt,const Standard_Real theParam,const Standard_Boolean theIsReplace = Standard_True);
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: float
") Parameter;
		Standard_Real Parameter (const Standard_Integer I);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: gp_Pnt
") Value;
		gp_Pnt Value (const Standard_Integer I);
		%feature("compactdefaultargs") ArcAngularStep;
		%feature("autodoc", "	* Computes angular step for the arc using the given parameters.

	:param theRadius:
	:type theRadius: float
	:param theLinearDeflection:
	:type theLinearDeflection: float
	:param theAngularDeflection:
	:type theAngularDeflection: float
	:param theMinLength:
	:type theMinLength: float
	:rtype: float
") ArcAngularStep;
		static Standard_Real ArcAngularStep (const Standard_Real theRadius,const Standard_Real theLinearDeflection,const Standard_Real theAngularDeflection,const Standard_Real theMinLength);
};


%extend GCPnts_TangentialDeflection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GCPnts_UniformAbscissa;
class GCPnts_UniformAbscissa {
	public:
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "	* creation of a indefinite UniformAbscissa

	:rtype: None
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa ();
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "	* Computes a uniform abscissa distribution of points on the Curve <C>. Parameter Toler is equal Precision::Confusion by default. It Is used for more precise calculation of curve length

	:param C:
	:type C: Adaptor3d_Curve &
	:param Abscissa:
	:type Abscissa: float
	:param Toler: default value is -1
	:type Toler: float
	:rtype: None
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa (Adaptor3d_Curve & C,const Standard_Real Abscissa,const Standard_Real Toler = -1);
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "	* Computes a Uniform abscissa distribution of points on a part of the Curve <C>. Parameter Toler is equal Precision::Confusion by default. It Is used for more precise calculation of curve length

	:param C:
	:type C: Adaptor3d_Curve &
	:param Abscissa:
	:type Abscissa: float
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Toler: default value is -1
	:type Toler: float
	:rtype: None
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa (Adaptor3d_Curve & C,const Standard_Real Abscissa,const Standard_Real U1,const Standard_Real U2,const Standard_Real Toler = -1);
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "	* Computes a uniform abscissa distribution of points on the Curve <C>. <NbPoints> defines the nomber of desired points. Parameter Toler is equal Precision::Confusion by default. It Is used for more precise calculation of curve length

	:param C:
	:type C: Adaptor3d_Curve &
	:param NbPoints:
	:type NbPoints: int
	:param Toler: default value is -1
	:type Toler: float
	:rtype: None
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa (Adaptor3d_Curve & C,const Standard_Integer NbPoints,const Standard_Real Toler = -1);
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "	* Computes a Uniform abscissa distribution of points on a part of the Curve <C>. Parameter Toler is equal Precision::Confusion by default. It Is used for more precise calculation of curve length

	:param C:
	:type C: Adaptor3d_Curve &
	:param NbPoints:
	:type NbPoints: int
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Toler: default value is -1
	:type Toler: float
	:rtype: None
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa (Adaptor3d_Curve & C,const Standard_Integer NbPoints,const Standard_Real U1,const Standard_Real U2,const Standard_Real Toler = -1);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initialize the algoritms with <C>, <Abscissa>, <Toler>

	:param C:
	:type C: Adaptor3d_Curve &
	:param Abscissa:
	:type Abscissa: float
	:param Toler: default value is -1
	:type Toler: float
	:rtype: None
") Initialize;
		void Initialize (Adaptor3d_Curve & C,const Standard_Real Abscissa,const Standard_Real Toler = -1);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initialize the algoritms with <C>, <Abscissa>, <U1>, <U2>, <Toler>

	:param C:
	:type C: Adaptor3d_Curve &
	:param Abscissa:
	:type Abscissa: float
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Toler: default value is -1
	:type Toler: float
	:rtype: None
") Initialize;
		void Initialize (Adaptor3d_Curve & C,const Standard_Real Abscissa,const Standard_Real U1,const Standard_Real U2,const Standard_Real Toler = -1);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initialize the algoritms with <C>, <NbPoints>, <Toler> and

	:param C:
	:type C: Adaptor3d_Curve &
	:param NbPoints:
	:type NbPoints: int
	:param Toler: default value is -1
	:type Toler: float
	:rtype: None
") Initialize;
		void Initialize (Adaptor3d_Curve & C,const Standard_Integer NbPoints,const Standard_Real Toler = -1);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initialize the algoritms with <C>, <Abscissa>, <U1>, <U2>, <Toler>.

	:param C:
	:type C: Adaptor3d_Curve &
	:param NbPoints:
	:type NbPoints: int
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Toler: default value is -1
	:type Toler: float
	:rtype: None
") Initialize;
		void Initialize (Adaptor3d_Curve & C,const Standard_Integer NbPoints,const Standard_Real U1,const Standard_Real U2,const Standard_Real Toler = -1);
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "	* Computes a uniform abscissa distribution of points on the Curve2d <C>. Parameter Toler is equal Precision::Confusion by default. It Is used for more precise calculation of curve length

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Abscissa:
	:type Abscissa: float
	:param Toler: default value is -1
	:type Toler: float
	:rtype: None
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa (Adaptor2d_Curve2d & C,const Standard_Real Abscissa,const Standard_Real Toler = -1);
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "	* Computes a Uniform abscissa distribution of points on a part of the Curve2d <C>. Parameter Toler is equal Precision::Confusion by default. It Is used for more precise calculation of curve length

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Abscissa:
	:type Abscissa: float
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Toler: default value is -1
	:type Toler: float
	:rtype: None
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa (Adaptor2d_Curve2d & C,const Standard_Real Abscissa,const Standard_Real U1,const Standard_Real U2,const Standard_Real Toler = -1);
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "	* Computes a uniform abscissa distribution of points on the Curve2d <C>. <NbPoints> defines the nomber of desired points. Parameter Toler is equal Precision::Confusion by default. It Is used for more precise calculation of curve length

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param NbPoints:
	:type NbPoints: int
	:param Toler: default value is -1
	:type Toler: float
	:rtype: None
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa (Adaptor2d_Curve2d & C,const Standard_Integer NbPoints,const Standard_Real Toler = -1);
		%feature("compactdefaultargs") GCPnts_UniformAbscissa;
		%feature("autodoc", "	* Computes a Uniform abscissa distribution of points on a part of the Curve2d <C>. Parameter Toler is equal Precision::Confusion by default. It Is used for more precise calculation of curve length

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param NbPoints:
	:type NbPoints: int
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Toler: default value is -1
	:type Toler: float
	:rtype: None
") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa (Adaptor2d_Curve2d & C,const Standard_Integer NbPoints,const Standard_Real U1,const Standard_Real U2,const Standard_Real Toler = -1);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initialize the algoritms with <C>, <Abscissa>, <Toler>

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Abscissa:
	:type Abscissa: float
	:param Toler: default value is -1
	:type Toler: float
	:rtype: None
") Initialize;
		void Initialize (Adaptor2d_Curve2d & C,const Standard_Real Abscissa,const Standard_Real Toler = -1);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initialize the algoritms with <C>, <Abscissa>, <U1>, <U2>, <Toler>

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Abscissa:
	:type Abscissa: float
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Toler: default value is -1
	:type Toler: float
	:rtype: None
") Initialize;
		void Initialize (Adaptor2d_Curve2d & C,const Standard_Real Abscissa,const Standard_Real U1,const Standard_Real U2,const Standard_Real Toler = -1);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initialize the algoritms with <C>, <NbPoints>, <Toler> and

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param NbPoints:
	:type NbPoints: int
	:param Toler: default value is -1
	:type Toler: float
	:rtype: None
") Initialize;
		void Initialize (Adaptor2d_Curve2d & C,const Standard_Integer NbPoints,const Standard_Real Toler = -1);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initialize the algoritms with <C>, <Abscissa>, <U1>, <U2>, <Toler>.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param NbPoints:
	:type NbPoints: int
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Toler: default value is -1
	:type Toler: float
	:rtype: None
") Initialize;
		void Initialize (Adaptor2d_Curve2d & C,const Standard_Integer NbPoints,const Standard_Real U1,const Standard_Real U2,const Standard_Real Toler = -1);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* returns the computed Parameter of index <Index>.

	:param Index:
	:type Index: int
	:rtype: float
") Parameter;
		Standard_Real Parameter (const Standard_Integer Index);
		%feature("compactdefaultargs") Abscissa;
		%feature("autodoc", "	* returne the current abscissa ie the distance between two consecutive points

	:rtype: float
") Abscissa;
		Standard_Real Abscissa ();
};


%extend GCPnts_UniformAbscissa {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GCPnts_UniformDeflection;
class GCPnts_UniformDeflection {
	public:
		%feature("compactdefaultargs") GCPnts_UniformDeflection;
		%feature("autodoc", "	* Constructs an empty algorithm. To define the problem to be solved, use the function Initialize.

	:rtype: None
") GCPnts_UniformDeflection;
		 GCPnts_UniformDeflection ();
		%feature("compactdefaultargs") GCPnts_UniformDeflection;
		%feature("autodoc", "	* Computes a uniform Deflection distribution of points on the Curve <C>. if <WithControl> is True,the algorithm controls the estimate deflection

	:param C:
	:type C: Adaptor3d_Curve &
	:param Deflection:
	:type Deflection: float
	:param WithControl: default value is Standard_True
	:type WithControl: bool
	:rtype: None
") GCPnts_UniformDeflection;
		 GCPnts_UniformDeflection (Adaptor3d_Curve & C,const Standard_Real Deflection,const Standard_Boolean WithControl = Standard_True);
		%feature("compactdefaultargs") GCPnts_UniformDeflection;
		%feature("autodoc", "	* Computes a uniform Deflection distribution of points on the Curve <C>. if <WithControl> is True,the algorithm controls the estimate deflection

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Deflection:
	:type Deflection: float
	:param WithControl: default value is Standard_True
	:type WithControl: bool
	:rtype: None
") GCPnts_UniformDeflection;
		 GCPnts_UniformDeflection (Adaptor2d_Curve2d & C,const Standard_Real Deflection,const Standard_Boolean WithControl = Standard_True);
		%feature("compactdefaultargs") GCPnts_UniformDeflection;
		%feature("autodoc", "	* Computes a Uniform Deflection distribution of points on a part of the Curve <C>. if <WithControl> is True,the algorithm controls the estimate deflection

	:param C:
	:type C: Adaptor3d_Curve &
	:param Deflection:
	:type Deflection: float
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param WithControl: default value is Standard_True
	:type WithControl: bool
	:rtype: None
") GCPnts_UniformDeflection;
		 GCPnts_UniformDeflection (Adaptor3d_Curve & C,const Standard_Real Deflection,const Standard_Real U1,const Standard_Real U2,const Standard_Boolean WithControl = Standard_True);
		%feature("compactdefaultargs") GCPnts_UniformDeflection;
		%feature("autodoc", "	* Computes a Uniform Deflection distribution of points on a part of the Curve <C>. if <WithControl> is True,the algorithm controls the estimate deflection

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Deflection:
	:type Deflection: float
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param WithControl: default value is Standard_True
	:type WithControl: bool
	:rtype: None
") GCPnts_UniformDeflection;
		 GCPnts_UniformDeflection (Adaptor2d_Curve2d & C,const Standard_Real Deflection,const Standard_Real U1,const Standard_Real U2,const Standard_Boolean WithControl = Standard_True);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initialize the algoritms with <C>, <Deflection>

	:param C:
	:type C: Adaptor3d_Curve &
	:param Deflection:
	:type Deflection: float
	:param WithControl: default value is Standard_True
	:type WithControl: bool
	:rtype: None
") Initialize;
		void Initialize (Adaptor3d_Curve & C,const Standard_Real Deflection,const Standard_Boolean WithControl = Standard_True);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initialize the algoritms with <C>, <Deflection>

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Deflection:
	:type Deflection: float
	:param WithControl: default value is Standard_True
	:type WithControl: bool
	:rtype: None
") Initialize;
		void Initialize (Adaptor2d_Curve2d & C,const Standard_Real Deflection,const Standard_Boolean WithControl = Standard_True);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initialize the algoritms with <C>, <Deflection>, <U1>,<U2>

	:param C:
	:type C: Adaptor3d_Curve &
	:param Deflection:
	:type Deflection: float
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param WithControl: default value is Standard_True
	:type WithControl: bool
	:rtype: None
") Initialize;
		void Initialize (Adaptor3d_Curve & C,const Standard_Real Deflection,const Standard_Real U1,const Standard_Real U2,const Standard_Boolean WithControl = Standard_True);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initialize the algoritms with <C>, <Deflection>, <U1>,<U2> This and the above methods initialize (or reinitialize) this algorithm and compute a distribution of points: - on the curve C, or - on the part of curve C limited by the two parameter values U1 and U2, where the maximum distance between C and the polygon that results from the points of the distribution is not greater than Deflection. The first point of the distribution is either the origin of curve C or the point of parameter U1. The last point of the distribution is either the end point of curve C or the point of parameter U2. Intermediate points of the distribution are built using interpolations of segments of the curve limited at the 2nd degree. The construction ensures, in a first step, that the chordal deviation for this interpolation of the curve is less than or equal to Deflection. However, it does not ensure that the chordal deviation for the curve itself is less than or equal to Deflection. To do this a check is necessary, which may generate (second step) additional intermediate points. This check is time consuming, and can be avoided by setting WithControl to false. Note that by default WithControl is true and check is performed. Use the function IsDone to verify that the computation was successful, the function NbPoints to obtain the number of points of the computed distribution, and the function Parameter to read the parameter of each point. Warning - C is necessary, 'C2' continuous. This property is not checked at construction time. - The roles of U1 and U2 are inverted if U1 > U2. Warning C is an adapted curve, i.e. an object which is an interface between: - the services provided by either a 2D curve from the package Geom2d (in the case of an Adaptor2d_Curve2d curve) or a 3D curve from the package Geom (in the case of an Adaptor3d_Curve curve), - and those required on the curve by the computation algorithm.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Deflection:
	:type Deflection: float
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param WithControl: default value is Standard_True
	:type WithControl: bool
	:rtype: None
") Initialize;
		void Initialize (Adaptor2d_Curve2d & C,const Standard_Real Deflection,const Standard_Real U1,const Standard_Real U2,const Standard_Boolean WithControl = Standard_True);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the computation was successful. IsDone is a protection against: - non-convergence of the algorithm - querying the results before computation.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	* Returns the number of points of the distribution computed by this algorithm. Exceptions StdFail_NotDone if this algorithm has not been initialized, or if the computation was not successful.

	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Returns the parameter of the point of index Index in the distribution computed by this algorithm. Warning Index must be greater than or equal to 1, and less than or equal to the number of points of the distribution. However, pay particular attention as this condition is not checked by this function. Exceptions StdFail_NotDone if this algorithm has not been initialized, or if the computation was not successful.

	:param Index:
	:type Index: int
	:rtype: float
") Parameter;
		Standard_Real Parameter (const Standard_Integer Index);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the point of index Index in the distribution computed by this algorithm. Warning Index must be greater than or equal to 1, and less than or equal to the number of points of the distribution. However, pay particular attention as this condition is not checked by this function. Exceptions StdFAil_NotDone if this algorithm has not been initialized, or if the computation was not successful.

	:param Index:
	:type Index: int
	:rtype: gp_Pnt
") Value;
		gp_Pnt Value (const Standard_Integer Index);
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "	* Returns the deflection between the curve and the polygon resulting from the points of the distribution computed by this algorithm. This value is the one given to the algorithm at the time of construction (or initialization). Exceptions StdFail_NotDone if this algorithm has not been initialized, or if the computation was not successful.

	:rtype: float
") Deflection;
		Standard_Real Deflection ();
};


%extend GCPnts_UniformDeflection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
