/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_intana.html"
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
    // occt-800: re-export Size/Length/IsEmpty per instantiation; the
    // NCollection_BaseList header is wrapped but its inherited methods
    // don't propagate cleanly to the typedef-aliased Python class.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()

    def __iter__(self):
        it = IntAna_ListIteratorOfListOfCurve(self)
        while it.More():
            yield it.Value()
            it.Next()
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
		/****** md5 signature: 565f5359253444e34404de1546709500 ******/
		%feature("compactdefaultargs") D1u;
		%feature("autodoc", "
Parameters
----------
Theta: double
P: gp_Pnt
V: gp_Vec

Return
-------
bool

Description
-----------
Returns the point and the first derivative at parameter Theta on the curve.
") D1u;
		bool D1u(const double Theta, gp_Pnt & P, gp_Vec & V);

		/****** IntAna_Curve::Domain ******/
		/****** md5 signature: 811e62574fb69f08b937076f1e49a60e ******/
		%feature("compactdefaultargs") Domain;
		%feature("autodoc", "
Parameters
----------

Return
-------
theFirst: double
theLast: double

Description
-----------
Returns the parametric domain of the curve.
") Domain;
		void Domain(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntAna_Curve::FindParameter ******/
		/****** md5 signature: 407de38cada1fec3ab9e565b56fb7e9e ******/
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
		/****** md5 signature: 004cfe784b2152966984d86bf19ad8a1 ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the function is constant.
") IsConstant;
		bool IsConstant();

		/****** IntAna_Curve::IsFirstOpen ******/
		/****** md5 signature: a7bf5103450395b78e139546d5a41ba7 ******/
		%feature("compactdefaultargs") IsFirstOpen;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the domain is open at the beginning.
") IsFirstOpen;
		bool IsFirstOpen();

		/****** IntAna_Curve::IsLastOpen ******/
		/****** md5 signature: e205422460fa454b1c48f61ba2c3835c ******/
		%feature("compactdefaultargs") IsLastOpen;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the domain is open at the end.
") IsLastOpen;
		bool IsLastOpen();

		/****** IntAna_Curve::IsOpen ******/
		/****** md5 signature: 0c9790a385181e7469ddaf9bf17ff666 ******/
		%feature("compactdefaultargs") IsOpen;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the curve is not infinite at the last parameter or at the first parameter of the domain.
") IsOpen;
		bool IsOpen();

		/****** IntAna_Curve::SetConeQuadValues ******/
		/****** md5 signature: 1b98025e7fe62268af5c67018ce16fd6 ******/
		%feature("compactdefaultargs") SetConeQuadValues;
		%feature("autodoc", "
Parameters
----------
Cone: gp_Cone
Qxx: double
Qyy: double
Qzz: double
Qxy: double
Qxz: double
Qyz: double
Qx: double
Qy: double
Qz: double
Q1: double
Tol: double
DomInf: double
DomSup: double
TwoZForATheta: bool
ZIsPositive: bool

Return
-------
None

Description
-----------
Sets the parameters used to compute Points and Derivative on the curve.
") SetConeQuadValues;
		void SetConeQuadValues(const gp_Cone & Cone, const double Qxx, const double Qyy, const double Qzz, const double Qxy, const double Qxz, const double Qyz, const double Qx, const double Qy, const double Qz, const double Q1, const double Tol, const double DomInf, const double DomSup, const bool TwoZForATheta, const bool ZIsPositive);

		/****** IntAna_Curve::SetCylinderQuadValues ******/
		/****** md5 signature: cac89448d6a937581aeca0bbab27a6db ******/
		%feature("compactdefaultargs") SetCylinderQuadValues;
		%feature("autodoc", "
Parameters
----------
Cylinder: gp_Cylinder
Qxx: double
Qyy: double
Qzz: double
Qxy: double
Qxz: double
Qyz: double
Qx: double
Qy: double
Qz: double
Q1: double
Tol: double
DomInf: double
DomSup: double
TwoZForATheta: bool
ZIsPositive: bool

Return
-------
None

Description
-----------
Sets the parameters used to compute Points and Derivative on the curve.
") SetCylinderQuadValues;
		void SetCylinderQuadValues(const gp_Cylinder & Cylinder, const double Qxx, const double Qyy, const double Qzz, const double Qxy, const double Qxz, const double Qyz, const double Qx, const double Qy, const double Qz, const double Q1, const double Tol, const double DomInf, const double DomSup, const bool TwoZForATheta, const bool ZIsPositive);

		/****** IntAna_Curve::SetDomain ******/
		/****** md5 signature: 750930d637779c3c92160f866428f205 ******/
		%feature("compactdefaultargs") SetDomain;
		%feature("autodoc", "
Parameters
----------
theFirst: double
theLast: double

Return
-------
None

Description
-----------
Trims this curve.
") SetDomain;
		void SetDomain(const double theFirst, const double theLast);

		/****** IntAna_Curve::SetIsFirstOpen ******/
		/****** md5 signature: 3f03e538547b8d5d25d95c40b1110ca1 ******/
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
		void SetIsFirstOpen(const bool Flag);

		/****** IntAna_Curve::SetIsLastOpen ******/
		/****** md5 signature: 7eb9c30879eab1d402a714324a62c543 ******/
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
		void SetIsLastOpen(const bool Flag);

		/****** IntAna_Curve::Value ******/
		/****** md5 signature: 27507730663e95a290ca2cb82d6cc1ab ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Theta: double

Return
-------
gp_Pnt

Description
-----------
Returns the point at parameter Theta on the curve.
") Value;
		gp_Pnt Value(const double Theta);

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the computation was successful.
") IsDone;
		bool IsDone();

		/****** IntAna_Int3Pln::IsEmpty ******/
		/****** md5 signature: 03c43b1186186edcd7d757f16ac1f505 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is no intersection POINT. If 2 planes are identical or parallel, IsEmpty will return True.
") IsEmpty;
		bool IsEmpty();

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
		/****** md5 signature: 98db20378a4fad8f972fe09db8d15d6a ******/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin
P: gp_Pln
Tolang: double
Tol: double (optional, default to 0)
Len: double (optional, default to 0)

Return
-------
None

Description
-----------
Intersection between a line and a plane. Tolang is used to determine if the angle between two vectors is null. Tol is used to check the distance between line and plane on the distance <Len> from the origin of the line.
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad(const gp_Lin & L, const gp_Pln & P, const double Tolang, const double Tol = 0, const double Len = 0);

		/****** IntAna_IntConicQuad::IntAna_IntConicQuad ******/
		/****** md5 signature: 05ee436aa7853bc1f145287b7cb00f37 ******/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
P: gp_Pln
Tolang: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a circle and a plane. Tolang is used to determine if the angle between two vectors is null. Tol is used to determine if a distance is null.
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad(const gp_Circ & C, const gp_Pln & P, const double Tolang, const double Tol);

		/****** IntAna_IntConicQuad::IntAna_IntConicQuad ******/
		/****** md5 signature: cb628a9035bec365f626bb2c8bc679cf ******/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips
P: gp_Pln
Tolang: double
Tol: double

Return
-------
None

Description
-----------
Intersection between an ellipse and a plane. Tolang is used to determine if the angle between two vectors is null. Tol is used to determine if a distance is null.
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad(const gp_Elips & E, const gp_Pln & P, const double Tolang, const double Tol);

		/****** IntAna_IntConicQuad::IntAna_IntConicQuad ******/
		/****** md5 signature: d4149f17c95ea0f6c3f98eb46b3aaa0a ******/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "
Parameters
----------
Pb: gp_Parab
P: gp_Pln
Tolang: double

Return
-------
None

Description
-----------
Intersection between a parabola and a plane. Tolang is used to determine if the angle between two vectors is null.
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad(const gp_Parab & Pb, const gp_Pln & P, const double Tolang);

		/****** IntAna_IntConicQuad::IntAna_IntConicQuad ******/
		/****** md5 signature: d3c7a19b5c95766c98f1e6746d3e1c32 ******/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr
P: gp_Pln
Tolang: double

Return
-------
None

Description
-----------
Intersection between an hyperbola and a plane. Tolang is used to determine if the angle between two vectors is null.
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad(const gp_Hypr & H, const gp_Pln & P, const double Tolang);

		/****** IntAna_IntConicQuad::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the creation completed.
") IsDone;
		bool IsDone();

		/****** IntAna_IntConicQuad::IsInQuadric ******/
		/****** md5 signature: 689a976f3f1b932576abf26dd657c236 ******/
		%feature("compactdefaultargs") IsInQuadric;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the conic is in the quadric.
") IsInQuadric;
		bool IsInQuadric();

		/****** IntAna_IntConicQuad::IsParallel ******/
		/****** md5 signature: 25d4ac955341335e2fbcc4e3737ea518 ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the line is in a quadric which is parallel to the quadric.
") IsParallel;
		bool IsParallel();

		/****** IntAna_IntConicQuad::NbPoints ******/
		/****** md5 signature: 0243a6484ef0942dcad871f7c247b5de ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of intersection point.
") NbPoints;
		int NbPoints();

		/****** IntAna_IntConicQuad::ParamOnConic ******/
		/****** md5 signature: 2d0cc1777a5d8f10c0ab1e2f55851c9a ******/
		%feature("compactdefaultargs") ParamOnConic;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
double

Description
-----------
Returns the parameter on the line of the intersection point of range N.
") ParamOnConic;
		double ParamOnConic(const int N);

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
		/****** md5 signature: b4de598b8eb7238c99fbf5388e1ff817 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin
P: gp_Pln
Tolang: double
Tol: double (optional, default to 0)
Len: double (optional, default to 0)

Return
-------
None

Description
-----------
Intersects a line and a plane. Tolang is used to determine if the angle between two vectors is null. Tol is used to check the distance between line and plane on the distance <Len> from the origin of the line.
") Perform;
		void Perform(const gp_Lin & L, const gp_Pln & P, const double Tolang, const double Tol = 0, const double Len = 0);

		/****** IntAna_IntConicQuad::Perform ******/
		/****** md5 signature: e9df97f3602b5d95a86f7739d5609a54 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
P: gp_Pln
Tolang: double
Tol: double

Return
-------
None

Description
-----------
Intersects a circle and a plane. Tolang is used to determine if the angle between two vectors is null. Tol is used to determine if a distance is null.
") Perform;
		void Perform(const gp_Circ & C, const gp_Pln & P, const double Tolang, const double Tol);

		/****** IntAna_IntConicQuad::Perform ******/
		/****** md5 signature: 65cbcd84ad3aa068cb8c4e363bc27a39 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips
P: gp_Pln
Tolang: double
Tol: double

Return
-------
None

Description
-----------
Intersects an ellipse and a plane. Tolang is used to determine if the angle between two vectors is null. Tol is used to determine if a distance is null.
") Perform;
		void Perform(const gp_Elips & E, const gp_Pln & P, const double Tolang, const double Tol);

		/****** IntAna_IntConicQuad::Perform ******/
		/****** md5 signature: a60f11cb6bc80c1fe1c7b5e8380a4d51 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Pb: gp_Parab
P: gp_Pln
Tolang: double

Return
-------
None

Description
-----------
Intersects a parabola and a plane. Tolang is used to determine if the angle between two vectors is null.
") Perform;
		void Perform(const gp_Parab & Pb, const gp_Pln & P, const double Tolang);

		/****** IntAna_IntConicQuad::Perform ******/
		/****** md5 signature: 42422a2df5cb365f26497915c1125829 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr
P: gp_Pln
Tolang: double

Return
-------
None

Description
-----------
Intersects an hyperbola and a plane. Tolang is used to determine if the angle between two vectors is null.
") Perform;
		void Perform(const gp_Hypr & H, const gp_Pln & P, const double Tolang);

		/****** IntAna_IntConicQuad::Point ******/
		/****** md5 signature: ba4281ac65e4ecb05e581c2514888269 ******/
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
		const gp_Pnt Point(const int N);

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the computation was successful.
") IsDone;
		bool IsDone();

		/****** IntAna_IntLinTorus::NbPoints ******/
		/****** md5 signature: 0243a6484ef0942dcad871f7c247b5de ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of intersection points.
") NbPoints;
		int NbPoints();

		/****** IntAna_IntLinTorus::ParamOnLine ******/
		/****** md5 signature: 1b7c26e40bf4a31fd32d5ce85afc7e02 ******/
		%feature("compactdefaultargs") ParamOnLine;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
Returns the parameter on the line of the intersection point of range Index.
") ParamOnLine;
		double ParamOnLine(const int Index);

		/****** IntAna_IntLinTorus::ParamOnTorus ******/
		/****** md5 signature: 876bcf2d0532aa1822b7f7f6ec3b22d3 ******/
		%feature("compactdefaultargs") ParamOnTorus;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
FI: double
THETA: double

Description
-----------
Returns the parameters on the torus of the intersection point of range Index.
") ParamOnTorus;
		void ParamOnTorus(const int Index, Standard_Real &OutValue, Standard_Real &OutValue);

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
		/****** md5 signature: f3cc28515c48ebb3ebe325913ea84bdf ******/
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
		const gp_Pnt Value(const int Index);

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
		/****** md5 signature: 6da166008fb627a38575b30e7ec04e0c ******/
		%feature("compactdefaultargs") IntAna_IntQuadQuad;
		%feature("autodoc", "
Parameters
----------
C: gp_Cylinder
Q: IntAna_Quadric
Tol: double

Return
-------
None

Description
-----------
Creates the intersection between a cylinder and a quadric. Tol est a definir plus precisemment.
") IntAna_IntQuadQuad;
		 IntAna_IntQuadQuad(const gp_Cylinder & C, const IntAna_Quadric & Q, const double Tol);

		/****** IntAna_IntQuadQuad::IntAna_IntQuadQuad ******/
		/****** md5 signature: c0e6783cc53b9324e51ac67a37a39bae ******/
		%feature("compactdefaultargs") IntAna_IntQuadQuad;
		%feature("autodoc", "
Parameters
----------
C: gp_Cone
Q: IntAna_Quadric
Tol: double

Return
-------
None

Description
-----------
Creates the intersection between a cone and a quadric. Tol est a definir plus precisemment.
") IntAna_IntQuadQuad;
		 IntAna_IntQuadQuad(const gp_Cone & C, const IntAna_Quadric & Q, const double Tol);

		/****** IntAna_IntQuadQuad::Curve ******/
		/****** md5 signature: bf16018e7289cbbdb7bb3d8dd8ab7892 ******/
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
		IntAna_Curve Curve(const int N);

		/****** IntAna_IntQuadQuad::HasNextCurve ******/
		/****** md5 signature: c242ab99fb17adac3307122ae012dc9b ******/
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
		bool HasNextCurve(const int I);

		/****** IntAna_IntQuadQuad::HasPreviousCurve ******/
		/****** md5 signature: d718ecfdd0694342cc8b652d650193d8 ******/
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
		bool HasPreviousCurve(const int I);

		/****** IntAna_IntQuadQuad::IdenticalElements ******/
		/****** md5 signature: 39f98348f556a7b58c7b4a84a940baee ******/
		%feature("compactdefaultargs") IdenticalElements;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the cylinder, the cone or the sphere is identical to the quadric.
") IdenticalElements;
		bool IdenticalElements();

		/****** IntAna_IntQuadQuad::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the computation was successful.
") IsDone;
		bool IsDone();

		/****** IntAna_IntQuadQuad::NbCurve ******/
		/****** md5 signature: 566ea73a881af200bf25067f6679c345 ******/
		%feature("compactdefaultargs") NbCurve;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of curves solution.
") NbCurve;
		int NbCurve();

		/****** IntAna_IntQuadQuad::NbPnt ******/
		/****** md5 signature: b0974aa225801ebe3ae9518f18a1fa98 ******/
		%feature("compactdefaultargs") NbPnt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of contact point.
") NbPnt;
		int NbPnt();

		/****** IntAna_IntQuadQuad::NextCurve ******/
		/****** md5 signature: 3b0688046703c6425b5179dbd3205d39 ******/
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
If HasNextCurve(I) returns True, this function returns the Index J of the curve which has a common bound with the curve I. If theOpposite == True, then the last parameter of the curve I, and the last parameter of the curve J give the same point. Else the last parameter of the curve I and the first parameter of the curve J are the same point.
") NextCurve;
		int NextCurve(const int I, Standard_Boolean &OutValue);

		/****** IntAna_IntQuadQuad::Parameters ******/
		/****** md5 signature: a2d6c1eeff9945c55fe4a4a6ca7e8df7 ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
U1: double
U2: double

Description
-----------
Returns the parameters on the 'explicit quadric' (i.e. the cylinder or the cone, the first argument given to the constructor) of the point of range N.
") Parameters;
		void Parameters(const int N, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntAna_IntQuadQuad::Perform ******/
		/****** md5 signature: 9862931abd58ebd4fa82ccf907abd6d6 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Cylinder
Q: IntAna_Quadric
Tol: double

Return
-------
None

Description
-----------
Intersects a cylinder and a quadric . Tol est a definir plus precisemment.
") Perform;
		void Perform(const gp_Cylinder & C, const IntAna_Quadric & Q, const double Tol);

		/****** IntAna_IntQuadQuad::Perform ******/
		/****** md5 signature: f9437e99d775e5c57bc0e9452ee3bab1 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Cone
Q: IntAna_Quadric
Tol: double

Return
-------
None

Description
-----------
Intersects a cone and a quadric. Tol est a definir plus precisemment.
") Perform;
		void Perform(const gp_Cone & C, const IntAna_Quadric & Q, const double Tol);

		/****** IntAna_IntQuadQuad::Point ******/
		/****** md5 signature: ba4281ac65e4ecb05e581c2514888269 ******/
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
		const gp_Pnt Point(const int N);

		/****** IntAna_IntQuadQuad::PreviousCurve ******/
		/****** md5 signature: eb6a1916f48011410d2e10846c6eac67 ******/
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
if HasPreviousCurve(I) returns True, this function returns the Index J of the curve which has a common bound with the curve I. If theOpposite == True then the first parameter of the curve I, and the first parameter of the curve J give the same point. Else the first parameter of the curve I and the last parameter of the curve J are the same point.
") PreviousCurve;
		int PreviousCurve(const int I, Standard_Boolean &OutValue);

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
		/****** md5 signature: 1099591d0fba13861f8bb2c9562bbb55 ******/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pln
P2: gp_Pln
TolAng: double
Tol: double

Return
-------
None

Description
-----------
Creates the intersection between two planes. TolAng is the angular tolerance used to determine if the planes are parallel. Tol is the tolerance used to determine if the planes are identical (only when they are parallel).
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Pln & P1, const gp_Pln & P2, const double TolAng, const double Tol);

		/****** IntAna_QuadQuadGeo::IntAna_QuadQuadGeo ******/
		/****** md5 signature: 84baf04bc126fb76fe338e788c7acf16 ******/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "
Parameters
----------
P: gp_Pln
C: gp_Cylinder
Tolang: double
Tol: double
H: double (optional, default to 0)

Return
-------
None

Description
-----------
Creates the intersection between a plane and a cylinder. TolAng is the angular tolerance used to determine if the axis of the cylinder is parallel to the plane. Tol is the tolerance used to determine if the result is a circle or an ellipse. If the maximum distance between the ellipse solution and the circle centered at the ellipse center is less than Tol, the result will be the circle. H is the height of the cylinder <Cyl>. It is used to check whether the plane and cylinder are parallel.
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Pln & P, const gp_Cylinder & C, const double Tolang, const double Tol, const double H = 0);

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
		/****** md5 signature: 9b05d08be2d7f71fb9856d83853a8c94 ******/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "
Parameters
----------
P: gp_Pln
C: gp_Cone
Tolang: double
Tol: double

Return
-------
None

Description
-----------
Creates the intersection between a plane and a cone. TolAng is the angular tolerance used to determine if the axis of the cone is parallel or perpendicular to the plane, and if the generating line of the cone is parallel to the plane. Tol is the tolerance used to determine if the apex of the cone is in the plane.
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Pln & P, const gp_Cone & C, const double Tolang, const double Tol);

		/****** IntAna_QuadQuadGeo::IntAna_QuadQuadGeo ******/
		/****** md5 signature: 3deb3a4f67a47f78a370018562760b6c ******/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "
Parameters
----------
Cyl1: gp_Cylinder
Cyl2: gp_Cylinder
Tol: double

Return
-------
None

Description
-----------
Creates the intersection between two cylinders.
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Cylinder & Cyl1, const gp_Cylinder & Cyl2, const double Tol);

		/****** IntAna_QuadQuadGeo::IntAna_QuadQuadGeo ******/
		/****** md5 signature: d3e6c1ff439f6551a792aec8a3817cf4 ******/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "
Parameters
----------
Cyl: gp_Cylinder
Sph: gp_Sphere
Tol: double

Return
-------
None

Description
-----------
Creates the intersection between a Cylinder and a Sphere.
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Cylinder & Cyl, const gp_Sphere & Sph, const double Tol);

		/****** IntAna_QuadQuadGeo::IntAna_QuadQuadGeo ******/
		/****** md5 signature: be616f4e07a0943bc957d396489af440 ******/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "
Parameters
----------
Cyl: gp_Cylinder
Con: gp_Cone
Tol: double

Return
-------
None

Description
-----------
Creates the intersection between a Cylinder and a Cone.
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Cylinder & Cyl, const gp_Cone & Con, const double Tol);

		/****** IntAna_QuadQuadGeo::IntAna_QuadQuadGeo ******/
		/****** md5 signature: 42e3c385501c1485d89429c4d8d224b1 ******/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "
Parameters
----------
Sph1: gp_Sphere
Sph2: gp_Sphere
Tol: double

Return
-------
None

Description
-----------
Creates the intersection between two Spheres.
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Sphere & Sph1, const gp_Sphere & Sph2, const double Tol);

		/****** IntAna_QuadQuadGeo::IntAna_QuadQuadGeo ******/
		/****** md5 signature: 10238c714511b05e27088cbadfe5c478 ******/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "
Parameters
----------
Sph: gp_Sphere
Con: gp_Cone
Tol: double

Return
-------
None

Description
-----------
Creates the intersection between a Sphere and a Cone.
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Sphere & Sph, const gp_Cone & Con, const double Tol);

		/****** IntAna_QuadQuadGeo::IntAna_QuadQuadGeo ******/
		/****** md5 signature: f5d322d14033a96d89e510efd4885314 ******/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "
Parameters
----------
Con1: gp_Cone
Con2: gp_Cone
Tol: double

Return
-------
None

Description
-----------
Creates the intersection between two cones.
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Cone & Con1, const gp_Cone & Con2, const double Tol);

		/****** IntAna_QuadQuadGeo::IntAna_QuadQuadGeo ******/
		/****** md5 signature: a80b751b718a0c9443642b7cc971fc13 ******/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "
Parameters
----------
Pln: gp_Pln
Tor: gp_Torus
Tol: double

Return
-------
None

Description
-----------
Creates the intersection between plane and torus.
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Pln & Pln, const gp_Torus & Tor, const double Tol);

		/****** IntAna_QuadQuadGeo::IntAna_QuadQuadGeo ******/
		/****** md5 signature: 17326503ee98ae97f5643a5005dc8777 ******/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "
Parameters
----------
Cyl: gp_Cylinder
Tor: gp_Torus
Tol: double

Return
-------
None

Description
-----------
Creates the intersection between cylinder and torus.
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Cylinder & Cyl, const gp_Torus & Tor, const double Tol);

		/****** IntAna_QuadQuadGeo::IntAna_QuadQuadGeo ******/
		/****** md5 signature: 5174734581b895a2cf371257f9c717c8 ******/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "
Parameters
----------
Con: gp_Cone
Tor: gp_Torus
Tol: double

Return
-------
None

Description
-----------
Creates the intersection between cone and torus.
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Cone & Con, const gp_Torus & Tor, const double Tol);

		/****** IntAna_QuadQuadGeo::IntAna_QuadQuadGeo ******/
		/****** md5 signature: c92bd4eca428563ea31e1f25c1fbc5cc ******/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "
Parameters
----------
Sph: gp_Sphere
Tor: gp_Torus
Tol: double

Return
-------
None

Description
-----------
Creates the intersection between sphere and torus.
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Sphere & Sph, const gp_Torus & Tor, const double Tol);

		/****** IntAna_QuadQuadGeo::IntAna_QuadQuadGeo ******/
		/****** md5 signature: 1989ee3d4f3ad25acd870c786cfac6f8 ******/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "
Parameters
----------
Tor1: gp_Torus
Tor2: gp_Torus
Tol: double

Return
-------
None

Description
-----------
Creates the intersection between two toruses.
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Torus & Tor1, const gp_Torus & Tor2, const double Tol);

		/****** IntAna_QuadQuadGeo::Circle ******/
		/****** md5 signature: 74ff6d873add8ea203972d74f725e8f0 ******/
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
		gp_Circ Circle(const int Num);

		/****** IntAna_QuadQuadGeo::Ellipse ******/
		/****** md5 signature: ef5338ab8b92b0687028a4e2d5894f95 ******/
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
		gp_Elips Ellipse(const int Num);

		/****** IntAna_QuadQuadGeo::HasCommonGen ******/
		/****** md5 signature: ee86bb0a6b49c40b6ca594c196dc669f ******/
		%feature("compactdefaultargs") HasCommonGen;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasCommonGen;
		bool HasCommonGen();

		/****** IntAna_QuadQuadGeo::Hyperbola ******/
		/****** md5 signature: 1e8bd47a28de9e8725b906b8cb72fdae ******/
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
		gp_Hypr Hyperbola(const int Num);

		/****** IntAna_QuadQuadGeo::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the computation was successful.
") IsDone;
		bool IsDone();

		/****** IntAna_QuadQuadGeo::Line ******/
		/****** md5 signature: a811acfe6f11aa8e2df9b81a675d2193 ******/
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
		gp_Lin Line(const int Num);

		/****** IntAna_QuadQuadGeo::NbSolutions ******/
		/****** md5 signature: 55162d50f2670468f6ab0d146e7a9b77 ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of intersections. The possible intersections are: - 1 point - 1 or 2 line(s) - 1 Point and 1 Line - 1 circle - 1 ellipse - 1 parabola - 1 or 2 hyperbola(s).
") NbSolutions;
		int NbSolutions();

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
		/****** md5 signature: db8bf6c71e9722a3d028c7a8a0da850d ******/
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
		gp_Parab Parabola(const int Num);

		/****** IntAna_QuadQuadGeo::Perform ******/
		/****** md5 signature: be6482a137f20107e618f89164b67346 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pln
P2: gp_Pln
TolAng: double
Tol: double

Return
-------
None

Description
-----------
Intersects two planes. TolAng is the angular tolerance used to determine if the planes are parallel. Tol is the tolerance used to determine if the planes are identical (only when they are parallel).
") Perform;
		void Perform(const gp_Pln & P1, const gp_Pln & P2, const double TolAng, const double Tol);

		/****** IntAna_QuadQuadGeo::Perform ******/
		/****** md5 signature: 0ae0bc9c31e2bcbaff090deceee996ce ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pln
C: gp_Cylinder
Tolang: double
Tol: double
H: double (optional, default to 0)

Return
-------
None

Description
-----------
Intersects a plane and a cylinder. TolAng is the angular tolerance used to determine if the axis of the cylinder is parallel to the plane. Tol is the tolerance used to determine if the result is a circle or an ellipse. If the maximum distance between the ellipse solution and the circle centered at the ellipse center is less than Tol, the result will be the circle. H is the height of the cylinder <Cyl>. It is used to check whether the plane and cylinder are parallel.
") Perform;
		void Perform(const gp_Pln & P, const gp_Cylinder & C, const double Tolang, const double Tol, const double H = 0);

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
		/****** md5 signature: 86ee8607340924cb4e6b8a0432bb8b6f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pln
C: gp_Cone
Tolang: double
Tol: double

Return
-------
None

Description
-----------
Intersects a plane and a cone. TolAng is the angular tolerance used to determine if the axis of the cone is parallel or perpendicular to the plane, and if the generating line of the cone is parallel to the plane. Tol is the tolerance used to determine if the apex of the cone is in the plane.
") Perform;
		void Perform(const gp_Pln & P, const gp_Cone & C, const double Tolang, const double Tol);

		/****** IntAna_QuadQuadGeo::Perform ******/
		/****** md5 signature: 3a096d26bfaa88ebfef4a604eabd2d15 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Cyl1: gp_Cylinder
Cyl2: gp_Cylinder
Tol: double

Return
-------
None

Description
-----------
Intersects two cylinders.
") Perform;
		void Perform(const gp_Cylinder & Cyl1, const gp_Cylinder & Cyl2, const double Tol);

		/****** IntAna_QuadQuadGeo::Perform ******/
		/****** md5 signature: 3e67f859c6963c72005b467d1bdc6dd3 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Cyl: gp_Cylinder
Sph: gp_Sphere
Tol: double

Return
-------
None

Description
-----------
Intersects a cylinder and a sphere.
") Perform;
		void Perform(const gp_Cylinder & Cyl, const gp_Sphere & Sph, const double Tol);

		/****** IntAna_QuadQuadGeo::Perform ******/
		/****** md5 signature: 30cdb127df6b9cb778967a52431d4e63 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Cyl: gp_Cylinder
Con: gp_Cone
Tol: double

Return
-------
None

Description
-----------
Intersects a cylinder and a cone.
") Perform;
		void Perform(const gp_Cylinder & Cyl, const gp_Cone & Con, const double Tol);

		/****** IntAna_QuadQuadGeo::Perform ******/
		/****** md5 signature: 14ed17617445128ba23fca1c358a8837 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Sph1: gp_Sphere
Sph2: gp_Sphere
Tol: double

Return
-------
None

Description
-----------
Intersects a two spheres.
") Perform;
		void Perform(const gp_Sphere & Sph1, const gp_Sphere & Sph2, const double Tol);

		/****** IntAna_QuadQuadGeo::Perform ******/
		/****** md5 signature: 932b299fcd49cf72c0979828b86d26fe ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Sph: gp_Sphere
Con: gp_Cone
Tol: double

Return
-------
None

Description
-----------
Intersects a sphere and a cone.
") Perform;
		void Perform(const gp_Sphere & Sph, const gp_Cone & Con, const double Tol);

		/****** IntAna_QuadQuadGeo::Perform ******/
		/****** md5 signature: 04d4605347c0eb7421681a9e0ba2748b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Con1: gp_Cone
Con2: gp_Cone
Tol: double

Return
-------
None

Description
-----------
Intersects two cones.
") Perform;
		void Perform(const gp_Cone & Con1, const gp_Cone & Con2, const double Tol);

		/****** IntAna_QuadQuadGeo::Perform ******/
		/****** md5 signature: b0a20de2affdd5a9c640bf36ad67e5f8 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Pln: gp_Pln
Tor: gp_Torus
Tol: double

Return
-------
None

Description
-----------
Intersects plane and torus.
") Perform;
		void Perform(const gp_Pln & Pln, const gp_Torus & Tor, const double Tol);

		/****** IntAna_QuadQuadGeo::Perform ******/
		/****** md5 signature: a8b083a615a0906bc302287546a92ca4 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Cyl: gp_Cylinder
Tor: gp_Torus
Tol: double

Return
-------
None

Description
-----------
Intersects cylinder and torus.
") Perform;
		void Perform(const gp_Cylinder & Cyl, const gp_Torus & Tor, const double Tol);

		/****** IntAna_QuadQuadGeo::Perform ******/
		/****** md5 signature: 41dd04444779ba67030307c8265394bb ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Con: gp_Cone
Tor: gp_Torus
Tol: double

Return
-------
None

Description
-----------
Intersects cone and torus.
") Perform;
		void Perform(const gp_Cone & Con, const gp_Torus & Tor, const double Tol);

		/****** IntAna_QuadQuadGeo::Perform ******/
		/****** md5 signature: a4c312b3bf9461dc2f1fbff2fd603ba5 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Sph: gp_Sphere
Tor: gp_Torus
Tol: double

Return
-------
None

Description
-----------
Intersects sphere and torus.
") Perform;
		void Perform(const gp_Sphere & Sph, const gp_Torus & Tor, const double Tol);

		/****** IntAna_QuadQuadGeo::Perform ******/
		/****** md5 signature: 563e978e6c20c6c1f1699508a42fb373 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Tor1: gp_Torus
Tor2: gp_Torus
Tol: double

Return
-------
None

Description
-----------
Intersects two toruses.
") Perform;
		void Perform(const gp_Torus & Tor1, const gp_Torus & Tor2, const double Tol);

		/****** IntAna_QuadQuadGeo::Point ******/
		/****** md5 signature: a0ee2a781a50bedc48a3a3ea66cec720 ******/
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
		gp_Pnt Point(const int Num);

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
		/****** md5 signature: dd6d543ca2ffa7ad76a4ea3fbf3a58f9 ******/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------

Return
-------
xCXX: double
xCYY: double
xCZZ: double
xCXY: double
xCXZ: double
xCYZ: double
xCX: double
xCY: double
xCZ: double
xCCte: double

Description
-----------
Returns the coefficients of the polynomial equation which define the quadric: xCXX x**2 + xCYY y**2 + xCZZ z**2 + 2 ( xCXY x y + xCXZ x z + xCYZ y z ) + 2 ( xCX x + xCY y + xCZ z ) + xCCte.
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntAna_Quadric::NewCoefficients ******/
		/****** md5 signature: 45a0e1ec0390a24b2fe7911264040c34 ******/
		%feature("compactdefaultargs") NewCoefficients;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax3

Return
-------
xCXX: double
xCYY: double
xCZZ: double
xCXY: double
xCXZ: double
xCYZ: double
xCX: double
xCY: double
xCZ: double
xCCte: double

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
