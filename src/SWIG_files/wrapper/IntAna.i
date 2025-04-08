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
%define INTANADOCSTRING
"IntAna module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_intana.html"
%enddef
%module (package="OCC.Core", docstring=INTANADOCSTRING) IntAna


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
#include<IntAna_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<TColStd_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import TColStd.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum IntAna_ResultType {
	IntAna_Point = 0,
	IntAna_Line = 1,
	IntAna_Circle = 2,
	IntAna_PointAndCircle = 3,
	IntAna_Ellipse = 4,
	IntAna_Parabola = 5,
	IntAna_Hyperbola = 6,
	IntAna_Empty = 7,
	IntAna_Same = 8,
	IntAna_NoGeometricSolution = 9,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class IntAna_ResultType(IntEnum):
	IntAna_Point = 0
	IntAna_Line = 1
	IntAna_Circle = 2
	IntAna_PointAndCircle = 3
	IntAna_Ellipse = 4
	IntAna_Parabola = 5
	IntAna_Hyperbola = 6
	IntAna_Empty = 7
	IntAna_Same = 8
	IntAna_NoGeometricSolution = 9
IntAna_Point = IntAna_ResultType.IntAna_Point
IntAna_Line = IntAna_ResultType.IntAna_Line
IntAna_Circle = IntAna_ResultType.IntAna_Circle
IntAna_PointAndCircle = IntAna_ResultType.IntAna_PointAndCircle
IntAna_Ellipse = IntAna_ResultType.IntAna_Ellipse
IntAna_Parabola = IntAna_ResultType.IntAna_Parabola
IntAna_Hyperbola = IntAna_ResultType.IntAna_Hyperbola
IntAna_Empty = IntAna_ResultType.IntAna_Empty
IntAna_Same = IntAna_ResultType.IntAna_Same
IntAna_NoGeometricSolution = IntAna_ResultType.IntAna_NoGeometricSolution
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
%template(IntAna_ListIteratorOfListOfCurve) NCollection_TListIterator<IntAna_Curve>;
%template(IntAna_ListOfCurve) NCollection_List<IntAna_Curve>;

%extend NCollection_List<IntAna_Curve> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_List<IntAna_Curve>::Iterator IntAna_ListIteratorOfListOfCurve;
typedef NCollection_List<IntAna_Curve> IntAna_ListOfCurve;
/* end typedefs declaration */

/*********************
* class IntAna_Curve *
*********************/
class IntAna_Curve {
	public:
		/****** IntAna_Curve::IntAna_Curve ******/
		/****** md5 signature: 5c319ff5a94b238e578c95c3657ce591 ******/
		%feature("compactdefaultargs") IntAna_Curve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty Constructor.
") IntAna_Curve;
		 IntAna_Curve();

		/****** IntAna_Curve::D1u ******/
		/****** md5 signature: adc6cf27bf3405c7aa615b2c8e09c345 ******/
		%feature("compactdefaultargs") D1u;
		%feature("autodoc", "
Parameters
----------
Theta: float
P: gp_Pnt
V: gp_Vec

Return
-------
bool

Description
-----------
Returns the point and the first derivative at parameter Theta on the curve.
") D1u;
		Standard_Boolean D1u(const Standard_Real Theta, gp_Pnt & P, gp_Vec & V);

		/****** IntAna_Curve::Domain ******/
		/****** md5 signature: 71155cc7e4359d3495fd35b68643b222 ******/
		%feature("compactdefaultargs") Domain;
		%feature("autodoc", "
Parameters
----------

Return
-------
theFirst: float
theLast: float

Description
-----------
Returns the parametric domain of the curve.
") Domain;
		void Domain(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntAna_Curve::FindParameter ******/
		/****** md5 signature: dab72e39e175512eaf3620eb76e16397 ******/
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
theParams: TColStd_ListOfReal

Return
-------
None

Description
-----------
Tries to find the parameter of the point P on the curve. If the method returns False, the 'projection' is impossible. If the method returns True at least one parameter has been found. theParams is always sorted in ascending order.
") FindParameter;
		void FindParameter(const gp_Pnt & P, TColStd_ListOfReal & theParams);

		/****** IntAna_Curve::IsConstant ******/
		/****** md5 signature: d04428c0cc470abb832fd48242d18c6c ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the function is constant.
") IsConstant;
		Standard_Boolean IsConstant();

		/****** IntAna_Curve::IsFirstOpen ******/
		/****** md5 signature: cb52fd08cfdd62e428711cb1cbf63a79 ******/
		%feature("compactdefaultargs") IsFirstOpen;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the domain is open at the beginning.
") IsFirstOpen;
		Standard_Boolean IsFirstOpen();

		/****** IntAna_Curve::IsLastOpen ******/
		/****** md5 signature: 18e9b3bfcd4c8c69e407292054770192 ******/
		%feature("compactdefaultargs") IsLastOpen;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the domain is open at the end.
") IsLastOpen;
		Standard_Boolean IsLastOpen();

		/****** IntAna_Curve::IsOpen ******/
		/****** md5 signature: bdd2e1a97b3f8d14fccdfc3ccf008748 ******/
		%feature("compactdefaultargs") IsOpen;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the curve is not infinite at the last parameter or at the first parameter of the domain.
") IsOpen;
		Standard_Boolean IsOpen();

		/****** IntAna_Curve::SetConeQuadValues ******/
		/****** md5 signature: ff92b84e177dacf7d91461f5a2402783 ******/
		%feature("compactdefaultargs") SetConeQuadValues;
		%feature("autodoc", "
Parameters
----------
Cone: gp_Cone
Qxx: float
Qyy: float
Qzz: float
Qxy: float
Qxz: float
Qyz: float
Qx: float
Qy: float
Qz: float
Q1: float
Tol: float
DomInf: float
DomSup: float
TwoZForATheta: bool
ZIsPositive: bool

Return
-------
None

Description
-----------
Sets the parameters used to compute Points and Derivative on the curve.
") SetConeQuadValues;
		void SetConeQuadValues(const gp_Cone & Cone, const Standard_Real Qxx, const Standard_Real Qyy, const Standard_Real Qzz, const Standard_Real Qxy, const Standard_Real Qxz, const Standard_Real Qyz, const Standard_Real Qx, const Standard_Real Qy, const Standard_Real Qz, const Standard_Real Q1, const Standard_Real Tol, const Standard_Real DomInf, const Standard_Real DomSup, const Standard_Boolean TwoZForATheta, const Standard_Boolean ZIsPositive);

		/****** IntAna_Curve::SetCylinderQuadValues ******/
		/****** md5 signature: 3007250938a2c3dde2b0afd11f9d3935 ******/
		%feature("compactdefaultargs") SetCylinderQuadValues;
		%feature("autodoc", "
Parameters
----------
Cylinder: gp_Cylinder
Qxx: float
Qyy: float
Qzz: float
Qxy: float
Qxz: float
Qyz: float
Qx: float
Qy: float
Qz: float
Q1: float
Tol: float
DomInf: float
DomSup: float
TwoZForATheta: bool
ZIsPositive: bool

Return
-------
None

Description
-----------
Sets the parameters used to compute Points and Derivative on the curve.
") SetCylinderQuadValues;
		void SetCylinderQuadValues(const gp_Cylinder & Cylinder, const Standard_Real Qxx, const Standard_Real Qyy, const Standard_Real Qzz, const Standard_Real Qxy, const Standard_Real Qxz, const Standard_Real Qyz, const Standard_Real Qx, const Standard_Real Qy, const Standard_Real Qz, const Standard_Real Q1, const Standard_Real Tol, const Standard_Real DomInf, const Standard_Real DomSup, const Standard_Boolean TwoZForATheta, const Standard_Boolean ZIsPositive);

		/****** IntAna_Curve::SetDomain ******/
		/****** md5 signature: 6e48d7eca8a8ab9e6b69eef070185309 ******/
		%feature("compactdefaultargs") SetDomain;
		%feature("autodoc", "
Parameters
----------
theFirst: float
theLast: float

Return
-------
None

Description
-----------
Trims this curve.
") SetDomain;
		void SetDomain(const Standard_Real theFirst, const Standard_Real theLast);

		/****** IntAna_Curve::SetIsFirstOpen ******/
		/****** md5 signature: 0610a2f545ec785de397e6b6f9a3ad03 ******/
		%feature("compactdefaultargs") SetIsFirstOpen;
		%feature("autodoc", "
Parameters
----------
Flag: bool

Return
-------
None

Description
-----------
If flag is True, the Curve is not defined at the first parameter of its domain.
") SetIsFirstOpen;
		void SetIsFirstOpen(const Standard_Boolean Flag);

		/****** IntAna_Curve::SetIsLastOpen ******/
		/****** md5 signature: 3430b23cf1d91b257fb412a6a33bafb3 ******/
		%feature("compactdefaultargs") SetIsLastOpen;
		%feature("autodoc", "
Parameters
----------
Flag: bool

Return
-------
None

Description
-----------
If flag is True, the Curve is not defined at the first parameter of its domain.
") SetIsLastOpen;
		void SetIsLastOpen(const Standard_Boolean Flag);

		/****** IntAna_Curve::Value ******/
		/****** md5 signature: 798c62cbb0ca4d521bfee97359040d7a ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Theta: float

Return
-------
gp_Pnt

Description
-----------
Returns the point at parameter Theta on the curve.
") Value;
		gp_Pnt Value(const Standard_Real Theta);

};


%extend IntAna_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IntAna_Int3Pln *
***********************/
class IntAna_Int3Pln {
	public:
		/****** IntAna_Int3Pln::IntAna_Int3Pln ******/
		/****** md5 signature: 0df1626a15343489e2f29c2d09d8fb40 ******/
		%feature("compactdefaultargs") IntAna_Int3Pln;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntAna_Int3Pln;
		 IntAna_Int3Pln();

		/****** IntAna_Int3Pln::IntAna_Int3Pln ******/
		/****** md5 signature: 275365a7c5f4b09cc250bfa521ef526a ******/
		%feature("compactdefaultargs") IntAna_Int3Pln;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pln
P2: gp_Pln
P3: gp_Pln

Return
-------
None

Description
-----------
Determination of the intersection point between 3 planes.
") IntAna_Int3Pln;
		 IntAna_Int3Pln(const gp_Pln & P1, const gp_Pln & P2, const gp_Pln & P3);

		/****** IntAna_Int3Pln::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the computation was successful.
") IsDone;
		Standard_Boolean IsDone();

		/****** IntAna_Int3Pln::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is no intersection POINT. If 2 planes are identical or parallel, IsEmpty will return True.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** IntAna_Int3Pln::Perform ******/
		/****** md5 signature: 1948627fc337f9fab8d2212eb5075042 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pln
P2: gp_Pln
P3: gp_Pln

Return
-------
None

Description
-----------
Determination of the intersection point between 3 planes.
") Perform;
		void Perform(const gp_Pln & P1, const gp_Pln & P2, const gp_Pln & P3);

		/****** IntAna_Int3Pln::Value ******/
		/****** md5 signature: eddd2908948849b73f6d8aacab318652 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the intersection point.
") Value;
		const gp_Pnt Value();

};


%extend IntAna_Int3Pln {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IntAna_IntConicQuad *
****************************/
class IntAna_IntConicQuad {
	public:
		/****** IntAna_IntConicQuad::IntAna_IntConicQuad ******/
		/****** md5 signature: 2ade8905bb71afa0a6450dc58adb43b2 ******/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad();

		/****** IntAna_IntConicQuad::IntAna_IntConicQuad ******/
		/****** md5 signature: 217bc28c2d545c3ea24356396a00a648 ******/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin
Q: IntAna_Quadric

Return
-------
None

Description
-----------
Creates the intersection between a line and a quadric.
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad(const gp_Lin & L, const IntAna_Quadric & Q);

		/****** IntAna_IntConicQuad::IntAna_IntConicQuad ******/
		/****** md5 signature: 186216f6395cc422555e95fe37a6719b ******/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
Q: IntAna_Quadric

Return
-------
None

Description
-----------
Creates the intersection between a circle and a quadric.
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad(const gp_Circ & C, const IntAna_Quadric & Q);

		/****** IntAna_IntConicQuad::IntAna_IntConicQuad ******/
		/****** md5 signature: 1de8cca3baf7c85c00e4f277f140b2cc ******/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips
Q: IntAna_Quadric

Return
-------
None

Description
-----------
Creates the intersection between an ellipse and a quadric.
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad(const gp_Elips & E, const IntAna_Quadric & Q);

		/****** IntAna_IntConicQuad::IntAna_IntConicQuad ******/
		/****** md5 signature: c39464c5384a0fb04dc87612c2575dd4 ******/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "
Parameters
----------
P: gp_Parab
Q: IntAna_Quadric

Return
-------
None

Description
-----------
Creates the intersection between a parabola and a quadric.
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad(const gp_Parab & P, const IntAna_Quadric & Q);

		/****** IntAna_IntConicQuad::IntAna_IntConicQuad ******/
		/****** md5 signature: e1bc4bc9b049b16ddbfa641ed6db84bd ******/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr
Q: IntAna_Quadric

Return
-------
None

Description
-----------
Creates the intersection between an hyperbola and a quadric.
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad(const gp_Hypr & H, const IntAna_Quadric & Q);

		/****** IntAna_IntConicQuad::IntAna_IntConicQuad ******/
		/****** md5 signature: f24dd986f24e8a81856f6c4da4f43c1b ******/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin
P: gp_Pln
Tolang: float
Tol: float (optional, default to 0)
Len: float (optional, default to 0)

Return
-------
None

Description
-----------
Intersection between a line and a plane. Tolang is used to determine if the angle between two vectors is null. Tol is used to check the distance between line and plane on the distance <Len> from the origin of the line.
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad(const gp_Lin & L, const gp_Pln & P, const Standard_Real Tolang, const Standard_Real Tol = 0, const Standard_Real Len = 0);

		/****** IntAna_IntConicQuad::IntAna_IntConicQuad ******/
		/****** md5 signature: b590728d110d0c01b502275c9e1663b1 ******/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
P: gp_Pln
Tolang: float
Tol: float

Return
-------
None

Description
-----------
Intersection between a circle and a plane. Tolang is used to determine if the angle between two vectors is null. Tol is used to determine if a distance is null.
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad(const gp_Circ & C, const gp_Pln & P, const Standard_Real Tolang, const Standard_Real Tol);

		/****** IntAna_IntConicQuad::IntAna_IntConicQuad ******/
		/****** md5 signature: 6123dc971c0eb21282a4647100cddde0 ******/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips
P: gp_Pln
Tolang: float
Tol: float

Return
-------
None

Description
-----------
Intersection between an ellipse and a plane. Tolang is used to determine if the angle between two vectors is null. Tol is used to determine if a distance is null.
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad(const gp_Elips & E, const gp_Pln & P, const Standard_Real Tolang, const Standard_Real Tol);

		/****** IntAna_IntConicQuad::IntAna_IntConicQuad ******/
		/****** md5 signature: 273638263aa164d044a3302a6907cea7 ******/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "
Parameters
----------
Pb: gp_Parab
P: gp_Pln
Tolang: float

Return
-------
None

Description
-----------
Intersection between a parabola and a plane. Tolang is used to determine if the angle between two vectors is null.
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad(const gp_Parab & Pb, const gp_Pln & P, const Standard_Real Tolang);

		/****** IntAna_IntConicQuad::IntAna_IntConicQuad ******/
		/****** md5 signature: f58d09ef0c1804aaea97c5913176b480 ******/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr
P: gp_Pln
Tolang: float

Return
-------
None

Description
-----------
Intersection between an hyperbola and a plane. Tolang is used to determine if the angle between two vectors is null.
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad(const gp_Hypr & H, const gp_Pln & P, const Standard_Real Tolang);

		/****** IntAna_IntConicQuad::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the creation completed.
") IsDone;
		Standard_Boolean IsDone();

		/****** IntAna_IntConicQuad::IsInQuadric ******/
		/****** md5 signature: c14f29b6b3830c2712ea657db11b3b43 ******/
		%feature("compactdefaultargs") IsInQuadric;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the conic is in the quadric.
") IsInQuadric;
		Standard_Boolean IsInQuadric();

		/****** IntAna_IntConicQuad::IsParallel ******/
		/****** md5 signature: 47a312fd58e74bf5bb8a9bb6f0484dfb ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the line is in a quadric which is parallel to the quadric.
") IsParallel;
		Standard_Boolean IsParallel();

		/****** IntAna_IntConicQuad::NbPoints ******/
		/****** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of intersection point.
") NbPoints;
		Standard_Integer NbPoints();

		/****** IntAna_IntConicQuad::ParamOnConic ******/
		/****** md5 signature: 63ad5b66d1dd2134fb4c0a358d66d8d7 ******/
		%feature("compactdefaultargs") ParamOnConic;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the parameter on the line of the intersection point of range N.
") ParamOnConic;
		Standard_Real ParamOnConic(const Standard_Integer N);

		/****** IntAna_IntConicQuad::Perform ******/
		/****** md5 signature: 919b55f5344c184938d2f227ec61e459 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin
Q: IntAna_Quadric

Return
-------
None

Description
-----------
Intersects a line and a quadric.
") Perform;
		void Perform(const gp_Lin & L, const IntAna_Quadric & Q);

		/****** IntAna_IntConicQuad::Perform ******/
		/****** md5 signature: 143f2be98cb10d4c6f5cf65cca98d48e ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
Q: IntAna_Quadric

Return
-------
None

Description
-----------
Intersects a circle and a quadric.
") Perform;
		void Perform(const gp_Circ & C, const IntAna_Quadric & Q);

		/****** IntAna_IntConicQuad::Perform ******/
		/****** md5 signature: 4d8d8d54a0fbf349f8077482cc278e41 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips
Q: IntAna_Quadric

Return
-------
None

Description
-----------
Intersects an ellipse and a quadric.
") Perform;
		void Perform(const gp_Elips & E, const IntAna_Quadric & Q);

		/****** IntAna_IntConicQuad::Perform ******/
		/****** md5 signature: 2a017d223fffa3a3d703ef0c8cf3db96 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Parab
Q: IntAna_Quadric

Return
-------
None

Description
-----------
Intersects a parabola and a quadric.
") Perform;
		void Perform(const gp_Parab & P, const IntAna_Quadric & Q);

		/****** IntAna_IntConicQuad::Perform ******/
		/****** md5 signature: 429668df065fd63830c0beb97a24b3d7 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr
Q: IntAna_Quadric

Return
-------
None

Description
-----------
Intersects an hyperbola and a quadric.
") Perform;
		void Perform(const gp_Hypr & H, const IntAna_Quadric & Q);

		/****** IntAna_IntConicQuad::Perform ******/
		/****** md5 signature: 1a237bda043cab9196baedffec8f2d12 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin
P: gp_Pln
Tolang: float
Tol: float (optional, default to 0)
Len: float (optional, default to 0)

Return
-------
None

Description
-----------
Intersects a line and a plane. Tolang is used to determine if the angle between two vectors is null. Tol is used to check the distance between line and plane on the distance <Len> from the origin of the line.
") Perform;
		void Perform(const gp_Lin & L, const gp_Pln & P, const Standard_Real Tolang, const Standard_Real Tol = 0, const Standard_Real Len = 0);

		/****** IntAna_IntConicQuad::Perform ******/
		/****** md5 signature: 170d3a465ef4795d792b29f01fd1e67c ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
P: gp_Pln
Tolang: float
Tol: float

Return
-------
None

Description
-----------
Intersects a circle and a plane. Tolang is used to determine if the angle between two vectors is null. Tol is used to determine if a distance is null.
") Perform;
		void Perform(const gp_Circ & C, const gp_Pln & P, const Standard_Real Tolang, const Standard_Real Tol);

		/****** IntAna_IntConicQuad::Perform ******/
		/****** md5 signature: fcc77802988574d14fc0b824d7f0724d ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips
P: gp_Pln
Tolang: float
Tol: float

Return
-------
None

Description
-----------
Intersects an ellipse and a plane. Tolang is used to determine if the angle between two vectors is null. Tol is used to determine if a distance is null.
") Perform;
		void Perform(const gp_Elips & E, const gp_Pln & P, const Standard_Real Tolang, const Standard_Real Tol);

		/****** IntAna_IntConicQuad::Perform ******/
		/****** md5 signature: 065131a35e044bcc1b149a3e7a75e0b3 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Pb: gp_Parab
P: gp_Pln
Tolang: float

Return
-------
None

Description
-----------
Intersects a parabola and a plane. Tolang is used to determine if the angle between two vectors is null.
") Perform;
		void Perform(const gp_Parab & Pb, const gp_Pln & P, const Standard_Real Tolang);

		/****** IntAna_IntConicQuad::Perform ******/
		/****** md5 signature: eb1b6e971c3f6e429b2a048578ee4069 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr
P: gp_Pln
Tolang: float

Return
-------
None

Description
-----------
Intersects an hyperbola and a plane. Tolang is used to determine if the angle between two vectors is null.
") Perform;
		void Perform(const gp_Hypr & H, const gp_Pln & P, const Standard_Real Tolang);

		/****** IntAna_IntConicQuad::Point ******/
		/****** md5 signature: 595cfbeab8fd1be511fcaaba876ba661 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
gp_Pnt

Description
-----------
Returns the point of range N.
") Point;
		const gp_Pnt Point(const Standard_Integer N);

};


%extend IntAna_IntConicQuad {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IntAna_IntLinTorus *
***************************/
class IntAna_IntLinTorus {
	public:
		/****** IntAna_IntLinTorus::IntAna_IntLinTorus ******/
		/****** md5 signature: f99a18726114c0af661c111a002b354e ******/
		%feature("compactdefaultargs") IntAna_IntLinTorus;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntAna_IntLinTorus;
		 IntAna_IntLinTorus();

		/****** IntAna_IntLinTorus::IntAna_IntLinTorus ******/
		/****** md5 signature: 6eb54418dd83b765870fe56eb4ea8f1e ******/
		%feature("compactdefaultargs") IntAna_IntLinTorus;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin
T: gp_Torus

Return
-------
None

Description
-----------
Creates the intersection between a line and a torus.
") IntAna_IntLinTorus;
		 IntAna_IntLinTorus(const gp_Lin & L, const gp_Torus & T);

		/****** IntAna_IntLinTorus::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the computation was successful.
") IsDone;
		Standard_Boolean IsDone();

		/****** IntAna_IntLinTorus::NbPoints ******/
		/****** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of intersection points.
") NbPoints;
		Standard_Integer NbPoints();

		/****** IntAna_IntLinTorus::ParamOnLine ******/
		/****** md5 signature: 34edc1255c86a7b78b4420fa34431cca ******/
		%feature("compactdefaultargs") ParamOnLine;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Returns the parameter on the line of the intersection point of range Index.
") ParamOnLine;
		Standard_Real ParamOnLine(const Standard_Integer Index);

		/****** IntAna_IntLinTorus::ParamOnTorus ******/
		/****** md5 signature: e3e86441b93a2da4ae44e244e45e326a ******/
		%feature("compactdefaultargs") ParamOnTorus;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
FI: float
THETA: float

Description
-----------
Returns the parameters on the torus of the intersection point of range Index.
") ParamOnTorus;
		void ParamOnTorus(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntAna_IntLinTorus::Perform ******/
		/****** md5 signature: be16910a1bb708b70be20f1eb0c26997 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin
T: gp_Torus

Return
-------
None

Description
-----------
Intersects a line and a torus.
") Perform;
		void Perform(const gp_Lin & L, const gp_Torus & T);

		/****** IntAna_IntLinTorus::Value ******/
		/****** md5 signature: abb96b9735b376ec15f851295e30ba1c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Pnt

Description
-----------
Returns the intersection point of range Index.
") Value;
		const gp_Pnt Value(const Standard_Integer Index);

};


%extend IntAna_IntLinTorus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IntAna_IntQuadQuad *
***************************/
class IntAna_IntQuadQuad {
	public:
		/****** IntAna_IntQuadQuad::IntAna_IntQuadQuad ******/
		/****** md5 signature: d4b645e993197724866be04d0c16866a ******/
		%feature("compactdefaultargs") IntAna_IntQuadQuad;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty Constructor.
") IntAna_IntQuadQuad;
		 IntAna_IntQuadQuad();

		/****** IntAna_IntQuadQuad::IntAna_IntQuadQuad ******/
		/****** md5 signature: 9be03c467c0bde83febc120c4fa0f906 ******/
		%feature("compactdefaultargs") IntAna_IntQuadQuad;
		%feature("autodoc", "
Parameters
----------
C: gp_Cylinder
Q: IntAna_Quadric
Tol: float

Return
-------
None

Description
-----------
Creates the intersection between a cylinder and a quadric . Tol est a definir plus precisemment.
") IntAna_IntQuadQuad;
		 IntAna_IntQuadQuad(const gp_Cylinder & C, const IntAna_Quadric & Q, const Standard_Real Tol);

		/****** IntAna_IntQuadQuad::IntAna_IntQuadQuad ******/
		/****** md5 signature: d3cfeedec864c6b46309d5a73f4a35be ******/
		%feature("compactdefaultargs") IntAna_IntQuadQuad;
		%feature("autodoc", "
Parameters
----------
C: gp_Cone
Q: IntAna_Quadric
Tol: float

Return
-------
None

Description
-----------
Creates the intersection between a cone and a quadric. Tol est a definir plus precisemment.
") IntAna_IntQuadQuad;
		 IntAna_IntQuadQuad(const gp_Cone & C, const IntAna_Quadric & Q, const Standard_Real Tol);

		/****** IntAna_IntQuadQuad::Curve ******/
		/****** md5 signature: 7594cfd033c3876dea6a320e98301628 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
IntAna_Curve

Description
-----------
Returns the curve of range N.
") Curve;
		IntAna_Curve Curve(const Standard_Integer N);

		/****** IntAna_IntQuadQuad::HasNextCurve ******/
		/****** md5 signature: a7a1cf3c623e1f0a7533ded2abd35b22 ******/
		%feature("compactdefaultargs") HasNextCurve;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
bool

Description
-----------
Returns True if the Curve I shares its last bound with another curve.
") HasNextCurve;
		Standard_Boolean HasNextCurve(const Standard_Integer I);

		/****** IntAna_IntQuadQuad::HasPreviousCurve ******/
		/****** md5 signature: d1511b80dcfe59f4f2d99cd4eb0b4617 ******/
		%feature("compactdefaultargs") HasPreviousCurve;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
bool

Description
-----------
Returns True if the Curve I shares its first bound with another curve.
") HasPreviousCurve;
		Standard_Boolean HasPreviousCurve(const Standard_Integer I);

		/****** IntAna_IntQuadQuad::IdenticalElements ******/
		/****** md5 signature: a9624e3d4423fe2affeb799176bb8c2b ******/
		%feature("compactdefaultargs") IdenticalElements;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the cylinder, the cone or the sphere is identical to the quadric.
") IdenticalElements;
		Standard_Boolean IdenticalElements();

		/****** IntAna_IntQuadQuad::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the computation was successful.
") IsDone;
		Standard_Boolean IsDone();

		/****** IntAna_IntQuadQuad::NbCurve ******/
		/****** md5 signature: a28f0d4b7dfa5166ce908feaf6bd9135 ******/
		%feature("compactdefaultargs") NbCurve;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of curves solution.
") NbCurve;
		Standard_Integer NbCurve();

		/****** IntAna_IntQuadQuad::NbPnt ******/
		/****** md5 signature: 7493472b43e2ee7c4bd85784ca2a7eb4 ******/
		%feature("compactdefaultargs") NbPnt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of contact point.
") NbPnt;
		Standard_Integer NbPnt();

		/****** IntAna_IntQuadQuad::NextCurve ******/
		/****** md5 signature: 7a52d0c407d97447f22f315f2b7315d3 ******/
		%feature("compactdefaultargs") NextCurve;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
theOpposite: bool

Description
-----------
If HasNextCurve(I) returns True, this function returns the Index J of the curve which has a common bound with the curve I. If theOpposite == True , then the last parameter of the curve I, and the last parameter of the curve J give the same point. Else the last parameter of the curve I and the first parameter of the curve J are the same point.
") NextCurve;
		Standard_Integer NextCurve(const Standard_Integer I, Standard_Boolean &OutValue);

		/****** IntAna_IntQuadQuad::Parameters ******/
		/****** md5 signature: 1a69ef9c9de63fa7c201d4948035bbbc ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
U1: float
U2: float

Description
-----------
Returns the parameters on the 'explicit quadric' (i.e the cylinder or the cone, the first argument given to the constructor) of the point of range N.
") Parameters;
		void Parameters(const Standard_Integer N, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntAna_IntQuadQuad::Perform ******/
		/****** md5 signature: 9c477a17a9284db8b183542ae303bef1 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Cylinder
Q: IntAna_Quadric
Tol: float

Return
-------
None

Description
-----------
Intersects a cylinder and a quadric . Tol est a definir plus precisemment.
") Perform;
		void Perform(const gp_Cylinder & C, const IntAna_Quadric & Q, const Standard_Real Tol);

		/****** IntAna_IntQuadQuad::Perform ******/
		/****** md5 signature: fb057b1cd99647e23bf81691b53f3656 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Cone
Q: IntAna_Quadric
Tol: float

Return
-------
None

Description
-----------
Intersects a cone and a quadric. Tol est a definir plus precisemment.
") Perform;
		void Perform(const gp_Cone & C, const IntAna_Quadric & Q, const Standard_Real Tol);

		/****** IntAna_IntQuadQuad::Point ******/
		/****** md5 signature: 595cfbeab8fd1be511fcaaba876ba661 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
gp_Pnt

Description
-----------
Returns the point of range N.
") Point;
		const gp_Pnt Point(const Standard_Integer N);

		/****** IntAna_IntQuadQuad::PreviousCurve ******/
		/****** md5 signature: af4a159c48c1a72897753c0037826720 ******/
		%feature("compactdefaultargs") PreviousCurve;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
theOpposite: bool

Description
-----------
if HasPreviousCurve(I) returns True, this function returns the Index J of the curve which has a common bound with the curve I. If theOpposite == True , then the first parameter of the curve I, and the first parameter of the curve J give the same point. Else the first parameter of the curve I and the last parameter of the curve J are the same point.
") PreviousCurve;
		Standard_Integer PreviousCurve(const Standard_Integer I, Standard_Boolean &OutValue);

};


%extend IntAna_IntQuadQuad {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IntAna_QuadQuadGeo *
***************************/
class IntAna_QuadQuadGeo {
	public:
		/****** IntAna_QuadQuadGeo::IntAna_QuadQuadGeo ******/
		/****** md5 signature: 939e44002df60417a7f9e9456bcb28c3 ******/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo();

		/****** IntAna_QuadQuadGeo::IntAna_QuadQuadGeo ******/
		/****** md5 signature: 0f57a38f9c90f73d6e8e75f13101647d ******/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pln
P2: gp_Pln
TolAng: float
Tol: float

Return
-------
None

Description
-----------
Creates the intersection between two planes. TolAng is the angular tolerance used to determine if the planes are parallel. Tol is the tolerance used to determine if the planes are identical (only when they are parallel).
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Pln & P1, const gp_Pln & P2, const Standard_Real TolAng, const Standard_Real Tol);

		/****** IntAna_QuadQuadGeo::IntAna_QuadQuadGeo ******/
		/****** md5 signature: 14895c6eff3503be5bfc2011f25e6d9a ******/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "
Parameters
----------
P: gp_Pln
C: gp_Cylinder
Tolang: float
Tol: float
H: float (optional, default to 0)

Return
-------
None

Description
-----------
Creates the intersection between a plane and a cylinder. TolAng is the angular tolerance used to determine if the axis of the cylinder is parallel to the plane. Tol is the tolerance used to determine if the result is a circle or an ellipse. If the maximum distance between the ellipse solution and the circle centered at the ellipse center is less than Tol, the result will be the circle. H is the height of the cylinder <Cyl>. It is used to check whether the plane and cylinder are parallel.
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Pln & P, const gp_Cylinder & C, const Standard_Real Tolang, const Standard_Real Tol, const Standard_Real H = 0);

		/****** IntAna_QuadQuadGeo::IntAna_QuadQuadGeo ******/
		/****** md5 signature: 30aab2a48d7a784eb4cfdcc85965143b ******/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "
Parameters
----------
P: gp_Pln
S: gp_Sphere

Return
-------
None

Description
-----------
Creates the intersection between a plane and a sphere.
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Pln & P, const gp_Sphere & S);

		/****** IntAna_QuadQuadGeo::IntAna_QuadQuadGeo ******/
		/****** md5 signature: ebe6a1d29658f998c37f671a305570bc ******/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "
Parameters
----------
P: gp_Pln
C: gp_Cone
Tolang: float
Tol: float

Return
-------
None

Description
-----------
Creates the intersection between a plane and a cone. TolAng is the angular tolerance used to determine if the axis of the cone is parallel or perpendicular to the plane, and if the generating line of the cone is parallel to the plane. Tol is the tolerance used to determine if the apex of the cone is in the plane.
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Pln & P, const gp_Cone & C, const Standard_Real Tolang, const Standard_Real Tol);

		/****** IntAna_QuadQuadGeo::IntAna_QuadQuadGeo ******/
		/****** md5 signature: 3ef735e50e41339dbdf1007eb63de85a ******/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "
Parameters
----------
Cyl1: gp_Cylinder
Cyl2: gp_Cylinder
Tol: float

Return
-------
None

Description
-----------
Creates the intersection between two cylinders.
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Cylinder & Cyl1, const gp_Cylinder & Cyl2, const Standard_Real Tol);

		/****** IntAna_QuadQuadGeo::IntAna_QuadQuadGeo ******/
		/****** md5 signature: bc61b8c780670060cda560e9a9543256 ******/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "
Parameters
----------
Cyl: gp_Cylinder
Sph: gp_Sphere
Tol: float

Return
-------
None

Description
-----------
Creates the intersection between a Cylinder and a Sphere.
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Cylinder & Cyl, const gp_Sphere & Sph, const Standard_Real Tol);

		/****** IntAna_QuadQuadGeo::IntAna_QuadQuadGeo ******/
		/****** md5 signature: ba617c58d2bbe9aefc5ca37bf42d53bf ******/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "
Parameters
----------
Cyl: gp_Cylinder
Con: gp_Cone
Tol: float

Return
-------
None

Description
-----------
Creates the intersection between a Cylinder and a Cone.
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Cylinder & Cyl, const gp_Cone & Con, const Standard_Real Tol);

		/****** IntAna_QuadQuadGeo::IntAna_QuadQuadGeo ******/
		/****** md5 signature: ef3a2feff86b5d020cbe38c885b0eb7b ******/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "
Parameters
----------
Sph1: gp_Sphere
Sph2: gp_Sphere
Tol: float

Return
-------
None

Description
-----------
Creates the intersection between two Spheres.
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Sphere & Sph1, const gp_Sphere & Sph2, const Standard_Real Tol);

		/****** IntAna_QuadQuadGeo::IntAna_QuadQuadGeo ******/
		/****** md5 signature: c899ef71b547bd2db47a92525a93d4e8 ******/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "
Parameters
----------
Sph: gp_Sphere
Con: gp_Cone
Tol: float

Return
-------
None

Description
-----------
Creates the intersection between a Sphere and a Cone.
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Sphere & Sph, const gp_Cone & Con, const Standard_Real Tol);

		/****** IntAna_QuadQuadGeo::IntAna_QuadQuadGeo ******/
		/****** md5 signature: 83c0e66baae701351794bdef3237d1c0 ******/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "
Parameters
----------
Con1: gp_Cone
Con2: gp_Cone
Tol: float

Return
-------
None

Description
-----------
Creates the intersection between two cones.
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Cone & Con1, const gp_Cone & Con2, const Standard_Real Tol);

		/****** IntAna_QuadQuadGeo::IntAna_QuadQuadGeo ******/
		/****** md5 signature: c75df91c18f3a3c576cfd0718237e421 ******/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "
Parameters
----------
Pln: gp_Pln
Tor: gp_Torus
Tol: float

Return
-------
None

Description
-----------
Creates the intersection between plane and torus.
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Pln & Pln, const gp_Torus & Tor, const Standard_Real Tol);

		/****** IntAna_QuadQuadGeo::IntAna_QuadQuadGeo ******/
		/****** md5 signature: f5ac6f131f5a59a873c78e730effc98f ******/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "
Parameters
----------
Cyl: gp_Cylinder
Tor: gp_Torus
Tol: float

Return
-------
None

Description
-----------
Creates the intersection between cylinder and torus.
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Cylinder & Cyl, const gp_Torus & Tor, const Standard_Real Tol);

		/****** IntAna_QuadQuadGeo::IntAna_QuadQuadGeo ******/
		/****** md5 signature: e4e77874a454e3533ea55734015b9474 ******/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "
Parameters
----------
Con: gp_Cone
Tor: gp_Torus
Tol: float

Return
-------
None

Description
-----------
Creates the intersection between cone and torus.
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Cone & Con, const gp_Torus & Tor, const Standard_Real Tol);

		/****** IntAna_QuadQuadGeo::IntAna_QuadQuadGeo ******/
		/****** md5 signature: 97435d4d72d5795ad710cd68d360d41b ******/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "
Parameters
----------
Sph: gp_Sphere
Tor: gp_Torus
Tol: float

Return
-------
None

Description
-----------
Creates the intersection between sphere and torus.
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Sphere & Sph, const gp_Torus & Tor, const Standard_Real Tol);

		/****** IntAna_QuadQuadGeo::IntAna_QuadQuadGeo ******/
		/****** md5 signature: a10fe1606b42c6e442296cd2783bbcce ******/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "
Parameters
----------
Tor1: gp_Torus
Tor2: gp_Torus
Tol: float

Return
-------
None

Description
-----------
Creates the intersection between two toruses.
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Torus & Tor1, const gp_Torus & Tor2, const Standard_Real Tol);

		/****** IntAna_QuadQuadGeo::Circle ******/
		/****** md5 signature: 6835dcc9c83ca3b5e9f3cd92d154a477 ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "
Parameters
----------
Num: int

Return
-------
gp_Circ

Description
-----------
Returns the circle solution of range Num.
") Circle;
		gp_Circ Circle(const Standard_Integer Num);

		/****** IntAna_QuadQuadGeo::Ellipse ******/
		/****** md5 signature: a1d5b9c0eb5054e5465d7cc2f0da837c ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "
Parameters
----------
Num: int

Return
-------
gp_Elips

Description
-----------
Returns the ellipse solution of range Num.
") Ellipse;
		gp_Elips Ellipse(const Standard_Integer Num);

		/****** IntAna_QuadQuadGeo::HasCommonGen ******/
		/****** md5 signature: e213c64bddbed59dd268fb4b9ccde843 ******/
		%feature("compactdefaultargs") HasCommonGen;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasCommonGen;
		Standard_Boolean HasCommonGen();

		/****** IntAna_QuadQuadGeo::Hyperbola ******/
		/****** md5 signature: ec3c224945b1f296553c636ef64a0a90 ******/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "
Parameters
----------
Num: int

Return
-------
gp_Hypr

Description
-----------
Returns the hyperbola solution of range Num.
") Hyperbola;
		gp_Hypr Hyperbola(const Standard_Integer Num);

		/****** IntAna_QuadQuadGeo::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns Standard_True if the computation was successful.
") IsDone;
		Standard_Boolean IsDone();

		/****** IntAna_QuadQuadGeo::Line ******/
		/****** md5 signature: fe5f3688face72a0a57d3e2dfe89fca0 ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
Num: int

Return
-------
gp_Lin

Description
-----------
Returns the line solution of range Num.
") Line;
		gp_Lin Line(const Standard_Integer Num);

		/****** IntAna_QuadQuadGeo::NbSolutions ******/
		/****** md5 signature: 02fdbddb1f7eff080419f602203d8f8b ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of intersections. The possible intersections are: - 1 point - 1 or 2 line(s) - 1 Point and 1 Line - 1 circle - 1 ellipse - 1 parabola - 1 or 2 hyperbola(s).
") NbSolutions;
		Standard_Integer NbSolutions();

		/****** IntAna_QuadQuadGeo::PChar ******/
		/****** md5 signature: 53f3ba5e9f0e905ceead008607d8102a ******/
		%feature("compactdefaultargs") PChar;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PChar;
		const gp_Pnt PChar();

		/****** IntAna_QuadQuadGeo::Parabola ******/
		/****** md5 signature: 9e9ba1da3f9b85c096c70a783f5e83e3 ******/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "
Parameters
----------
Num: int

Return
-------
gp_Parab

Description
-----------
Returns the parabola solution of range Num.
") Parabola;
		gp_Parab Parabola(const Standard_Integer Num);

		/****** IntAna_QuadQuadGeo::Perform ******/
		/****** md5 signature: 8f518f5df6f30e3156041faa56a7221a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pln
P2: gp_Pln
TolAng: float
Tol: float

Return
-------
None

Description
-----------
Intersects two planes. TolAng is the angular tolerance used to determine if the planes are parallel. Tol is the tolerance used to determine if the planes are identical (only when they are parallel).
") Perform;
		void Perform(const gp_Pln & P1, const gp_Pln & P2, const Standard_Real TolAng, const Standard_Real Tol);

		/****** IntAna_QuadQuadGeo::Perform ******/
		/****** md5 signature: 64d4c35bd397f53cb1ec0ba840bd2dce ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pln
C: gp_Cylinder
Tolang: float
Tol: float
H: float (optional, default to 0)

Return
-------
None

Description
-----------
Intersects a plane and a cylinder. TolAng is the angular tolerance used to determine if the axis of the cylinder is parallel to the plane. Tol is the tolerance used to determine if the result is a circle or an ellipse. If the maximum distance between the ellipse solution and the circle centered at the ellipse center is less than Tol, the result will be the circle. H is the height of the cylinder <Cyl>. It is used to check whether the plane and cylinder are parallel.
") Perform;
		void Perform(const gp_Pln & P, const gp_Cylinder & C, const Standard_Real Tolang, const Standard_Real Tol, const Standard_Real H = 0);

		/****** IntAna_QuadQuadGeo::Perform ******/
		/****** md5 signature: b006d6cde94524bd53c2b1a34c9b13de ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pln
S: gp_Sphere

Return
-------
None

Description
-----------
Intersects a plane and a sphere.
") Perform;
		void Perform(const gp_Pln & P, const gp_Sphere & S);

		/****** IntAna_QuadQuadGeo::Perform ******/
		/****** md5 signature: 3ff57b4796a61bffaecf47022f3e209d ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pln
C: gp_Cone
Tolang: float
Tol: float

Return
-------
None

Description
-----------
Intersects a plane and a cone. TolAng is the angular tolerance used to determine if the axis of the cone is parallel or perpendicular to the plane, and if the generating line of the cone is parallel to the plane. Tol is the tolerance used to determine if the apex of the cone is in the plane.
") Perform;
		void Perform(const gp_Pln & P, const gp_Cone & C, const Standard_Real Tolang, const Standard_Real Tol);

		/****** IntAna_QuadQuadGeo::Perform ******/
		/****** md5 signature: 4e75c6968a817ac13a36a925828e3938 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Cyl1: gp_Cylinder
Cyl2: gp_Cylinder
Tol: float

Return
-------
None

Description
-----------
Intersects two cylinders.
") Perform;
		void Perform(const gp_Cylinder & Cyl1, const gp_Cylinder & Cyl2, const Standard_Real Tol);

		/****** IntAna_QuadQuadGeo::Perform ******/
		/****** md5 signature: bf17ed9552575adbec24e07d3e088066 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Cyl: gp_Cylinder
Sph: gp_Sphere
Tol: float

Return
-------
None

Description
-----------
Intersects a cylinder and a sphere.
") Perform;
		void Perform(const gp_Cylinder & Cyl, const gp_Sphere & Sph, const Standard_Real Tol);

		/****** IntAna_QuadQuadGeo::Perform ******/
		/****** md5 signature: 0d303bb70a4fedada71b169193cb73d8 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Cyl: gp_Cylinder
Con: gp_Cone
Tol: float

Return
-------
None

Description
-----------
Intersects a cylinder and a cone.
") Perform;
		void Perform(const gp_Cylinder & Cyl, const gp_Cone & Con, const Standard_Real Tol);

		/****** IntAna_QuadQuadGeo::Perform ******/
		/****** md5 signature: 25f78a51815a588f59dd15e410013d08 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Sph1: gp_Sphere
Sph2: gp_Sphere
Tol: float

Return
-------
None

Description
-----------
Intersects a two spheres.
") Perform;
		void Perform(const gp_Sphere & Sph1, const gp_Sphere & Sph2, const Standard_Real Tol);

		/****** IntAna_QuadQuadGeo::Perform ******/
		/****** md5 signature: 37c9b7bed7162fac8465195efc4cf8b0 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Sph: gp_Sphere
Con: gp_Cone
Tol: float

Return
-------
None

Description
-----------
Intersects a sphere and a cone.
") Perform;
		void Perform(const gp_Sphere & Sph, const gp_Cone & Con, const Standard_Real Tol);

		/****** IntAna_QuadQuadGeo::Perform ******/
		/****** md5 signature: f92e55aae9101abde58414244b2caa0e ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Con1: gp_Cone
Con2: gp_Cone
Tol: float

Return
-------
None

Description
-----------
Intersects two cones.
") Perform;
		void Perform(const gp_Cone & Con1, const gp_Cone & Con2, const Standard_Real Tol);

		/****** IntAna_QuadQuadGeo::Perform ******/
		/****** md5 signature: b03d469930e3a63b57ddcb725989ca9d ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Pln: gp_Pln
Tor: gp_Torus
Tol: float

Return
-------
None

Description
-----------
Intersects plane and torus.
") Perform;
		void Perform(const gp_Pln & Pln, const gp_Torus & Tor, const Standard_Real Tol);

		/****** IntAna_QuadQuadGeo::Perform ******/
		/****** md5 signature: 7df06bf41f01c6a805c3d1841de8b5ec ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Cyl: gp_Cylinder
Tor: gp_Torus
Tol: float

Return
-------
None

Description
-----------
Intersects cylinder and torus.
") Perform;
		void Perform(const gp_Cylinder & Cyl, const gp_Torus & Tor, const Standard_Real Tol);

		/****** IntAna_QuadQuadGeo::Perform ******/
		/****** md5 signature: 17190a4b3e757e45cbc3332c0ea6e9db ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Con: gp_Cone
Tor: gp_Torus
Tol: float

Return
-------
None

Description
-----------
Intersects cone and torus.
") Perform;
		void Perform(const gp_Cone & Con, const gp_Torus & Tor, const Standard_Real Tol);

		/****** IntAna_QuadQuadGeo::Perform ******/
		/****** md5 signature: b41b678ccd242042e225d71463754709 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Sph: gp_Sphere
Tor: gp_Torus
Tol: float

Return
-------
None

Description
-----------
Intersects sphere and torus.
") Perform;
		void Perform(const gp_Sphere & Sph, const gp_Torus & Tor, const Standard_Real Tol);

		/****** IntAna_QuadQuadGeo::Perform ******/
		/****** md5 signature: 4612c46f38359ea92430ef3988478d80 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Tor1: gp_Torus
Tor2: gp_Torus
Tol: float

Return
-------
None

Description
-----------
Intersects two toruses.
") Perform;
		void Perform(const gp_Torus & Tor1, const gp_Torus & Tor2, const Standard_Real Tol);

		/****** IntAna_QuadQuadGeo::Point ******/
		/****** md5 signature: 5d5510baae4ce2e82f1b8abe75b38989 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Num: int

Return
-------
gp_Pnt

Description
-----------
Returns the point solution of range Num.
") Point;
		gp_Pnt Point(const Standard_Integer Num);

		/****** IntAna_QuadQuadGeo::TypeInter ******/
		/****** md5 signature: 6c797e50268c210a397edcda1fb8160b ******/
		%feature("compactdefaultargs") TypeInter;
		%feature("autodoc", "Return
-------
IntAna_ResultType

Description
-----------
Returns the type of intersection.
") TypeInter;
		IntAna_ResultType TypeInter();

};


%extend IntAna_QuadQuadGeo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IntAna_Quadric *
***********************/
class IntAna_Quadric {
	public:
		/****** IntAna_Quadric::IntAna_Quadric ******/
		/****** md5 signature: 6f45f578c668534253c9bc0e1eb7a7df ******/
		%feature("compactdefaultargs") IntAna_Quadric;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty Constructor.
") IntAna_Quadric;
		 IntAna_Quadric();

		/****** IntAna_Quadric::IntAna_Quadric ******/
		/****** md5 signature: 72fa8288463748d7285f8a6ad3ed9986 ******/
		%feature("compactdefaultargs") IntAna_Quadric;
		%feature("autodoc", "
Parameters
----------
P: gp_Pln

Return
-------
None

Description
-----------
Creates a Quadric from a Pln.
") IntAna_Quadric;
		 IntAna_Quadric(const gp_Pln & P);

		/****** IntAna_Quadric::IntAna_Quadric ******/
		/****** md5 signature: f1d7df762b847b2a7bfbb4c9d874566f ******/
		%feature("compactdefaultargs") IntAna_Quadric;
		%feature("autodoc", "
Parameters
----------
Sph: gp_Sphere

Return
-------
None

Description
-----------
Creates a Quadric from a Sphere.
") IntAna_Quadric;
		 IntAna_Quadric(const gp_Sphere & Sph);

		/****** IntAna_Quadric::IntAna_Quadric ******/
		/****** md5 signature: af72149559ddde745bfa59bab3b7bc58 ******/
		%feature("compactdefaultargs") IntAna_Quadric;
		%feature("autodoc", "
Parameters
----------
Cyl: gp_Cylinder

Return
-------
None

Description
-----------
Creates a Quadric from a Cylinder.
") IntAna_Quadric;
		 IntAna_Quadric(const gp_Cylinder & Cyl);

		/****** IntAna_Quadric::IntAna_Quadric ******/
		/****** md5 signature: abd9d4e65331a07a75a5fee7df8f3774 ******/
		%feature("compactdefaultargs") IntAna_Quadric;
		%feature("autodoc", "
Parameters
----------
Cone: gp_Cone

Return
-------
None

Description
-----------
Creates a Quadric from a Cone.
") IntAna_Quadric;
		 IntAna_Quadric(const gp_Cone & Cone);

		/****** IntAna_Quadric::Coefficients ******/
		/****** md5 signature: 7690ae519a3b3cafb5f52602edca6598 ******/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------

Return
-------
xCXX: float
xCYY: float
xCZZ: float
xCXY: float
xCXZ: float
xCYZ: float
xCX: float
xCY: float
xCZ: float
xCCte: float

Description
-----------
Returns the coefficients of the polynomial equation which define the quadric: xCXX x**2 + xCYY y**2 + xCZZ z**2 + 2 ( xCXY x y + xCXZ x z + xCYZ y z ) + 2 ( xCX x + xCY y + xCZ z ) + xCCte.
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntAna_Quadric::NewCoefficients ******/
		/****** md5 signature: a80d1e0a1527a6ec393b343fb5a875bf ******/
		%feature("compactdefaultargs") NewCoefficients;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax3

Return
-------
xCXX: float
xCYY: float
xCZZ: float
xCXY: float
xCXZ: float
xCYZ: float
xCX: float
xCY: float
xCZ: float
xCCte: float

Description
-----------
Returns the coefficients of the polynomial equation ( written in the natural coordinates system ) in the local coordinates system defined by Axis.
") NewCoefficients;
		void NewCoefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, const gp_Ax3 & Axis);

		/****** IntAna_Quadric::SetQuadric ******/
		/****** md5 signature: 39548850863d20574d665468fcf0ed8c ******/
		%feature("compactdefaultargs") SetQuadric;
		%feature("autodoc", "
Parameters
----------
P: gp_Pln

Return
-------
None

Description
-----------
Initializes the quadric with a Pln.
") SetQuadric;
		void SetQuadric(const gp_Pln & P);

		/****** IntAna_Quadric::SetQuadric ******/
		/****** md5 signature: 0b0b9c9de7c045896fb5a7515853c4d7 ******/
		%feature("compactdefaultargs") SetQuadric;
		%feature("autodoc", "
Parameters
----------
Sph: gp_Sphere

Return
-------
None

Description
-----------
Initialize the quadric with a Sphere.
") SetQuadric;
		void SetQuadric(const gp_Sphere & Sph);

		/****** IntAna_Quadric::SetQuadric ******/
		/****** md5 signature: ecc4a81d9847536663ac079802beb0b6 ******/
		%feature("compactdefaultargs") SetQuadric;
		%feature("autodoc", "
Parameters
----------
Con: gp_Cone

Return
-------
None

Description
-----------
Initializes the quadric with a Cone.
") SetQuadric;
		void SetQuadric(const gp_Cone & Con);

		/****** IntAna_Quadric::SetQuadric ******/
		/****** md5 signature: 8aabf40f11b3ec3126661dfd6fbf98df ******/
		%feature("compactdefaultargs") SetQuadric;
		%feature("autodoc", "
Parameters
----------
Cyl: gp_Cylinder

Return
-------
None

Description
-----------
Initializes the quadric with a Cylinder.
") SetQuadric;
		void SetQuadric(const gp_Cylinder & Cyl);

		/****** IntAna_Quadric::SpecialPoints ******/
		/****** md5 signature: badfb1328b090fd28cc53ddb4b01aaaf ******/
		%feature("compactdefaultargs") SpecialPoints;
		%feature("autodoc", "Return
-------
NCollection_List<gp_Pnt>

Description
-----------
Returns the list of special points (with singularities).
") SpecialPoints;
		const NCollection_List<gp_Pnt> SpecialPoints();

};


%extend IntAna_Quadric {
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
