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
%define INTANADOCSTRING
"IntAna module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_intana.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/* python proy classes for enums */
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
		/****************** IntAna_Curve ******************/
		%feature("compactdefaultargs") IntAna_Curve;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntAna_Curve;
		 IntAna_Curve();

		/****************** D1u ******************/
		%feature("compactdefaultargs") D1u;
		%feature("autodoc", "Returns the point and the first derivative at parameter theta on the curve.

Parameters
----------
Theta: float
P: gp_Pnt
V: gp_Vec

Returns
-------
bool
") D1u;
		Standard_Boolean D1u(const Standard_Real Theta, gp_Pnt & P, gp_Vec & V);

		/****************** Domain ******************/
		%feature("compactdefaultargs") Domain;
		%feature("autodoc", "Returns the paramatric domain of the curve.

Parameters
----------

Returns
-------
theFirst: float
theLast: float
") Domain;
		void Domain(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** FindParameter ******************/
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "Tries to find the parameter of the point p on the curve. if the method returns false, the 'projection' is impossible. if the method returns true at least one parameter has been found. theparams is always sorted in ascending order.

Parameters
----------
P: gp_Pnt
theParams: TColStd_ListOfReal

Returns
-------
None
") FindParameter;
		void FindParameter(const gp_Pnt & P, TColStd_ListOfReal & theParams);

		/****************** IsConstant ******************/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Returns true if the function is constant.

Returns
-------
bool
") IsConstant;
		Standard_Boolean IsConstant();

		/****************** IsFirstOpen ******************/
		%feature("compactdefaultargs") IsFirstOpen;
		%feature("autodoc", "Returns true if the domain is open at the beginning.

Returns
-------
bool
") IsFirstOpen;
		Standard_Boolean IsFirstOpen();

		/****************** IsLastOpen ******************/
		%feature("compactdefaultargs") IsLastOpen;
		%feature("autodoc", "Returns true if the domain is open at the end.

Returns
-------
bool
") IsLastOpen;
		Standard_Boolean IsLastOpen();

		/****************** IsOpen ******************/
		%feature("compactdefaultargs") IsOpen;
		%feature("autodoc", "Returns true if the curve is not infinite at the last parameter or at the first parameter of the domain.

Returns
-------
bool
") IsOpen;
		Standard_Boolean IsOpen();

		/****************** SetConeQuadValues ******************/
		%feature("compactdefaultargs") SetConeQuadValues;
		%feature("autodoc", "Sets the parameters used to compute points and derivative on the curve.

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

Returns
-------
None
") SetConeQuadValues;
		void SetConeQuadValues(const gp_Cone & Cone, const Standard_Real Qxx, const Standard_Real Qyy, const Standard_Real Qzz, const Standard_Real Qxy, const Standard_Real Qxz, const Standard_Real Qyz, const Standard_Real Qx, const Standard_Real Qy, const Standard_Real Qz, const Standard_Real Q1, const Standard_Real Tol, const Standard_Real DomInf, const Standard_Real DomSup, const Standard_Boolean TwoZForATheta, const Standard_Boolean ZIsPositive);

		/****************** SetCylinderQuadValues ******************/
		%feature("compactdefaultargs") SetCylinderQuadValues;
		%feature("autodoc", "Sets the parameters used to compute points and derivative on the curve.

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

Returns
-------
None
") SetCylinderQuadValues;
		void SetCylinderQuadValues(const gp_Cylinder & Cylinder, const Standard_Real Qxx, const Standard_Real Qyy, const Standard_Real Qzz, const Standard_Real Qxy, const Standard_Real Qxz, const Standard_Real Qyz, const Standard_Real Qx, const Standard_Real Qy, const Standard_Real Qz, const Standard_Real Q1, const Standard_Real Tol, const Standard_Real DomInf, const Standard_Real DomSup, const Standard_Boolean TwoZForATheta, const Standard_Boolean ZIsPositive);

		/****************** SetDomain ******************/
		%feature("compactdefaultargs") SetDomain;
		%feature("autodoc", "Trims this curve.

Parameters
----------
theFirst: float
theLast: float

Returns
-------
None
") SetDomain;
		void SetDomain(const Standard_Real theFirst, const Standard_Real theLast);

		/****************** SetIsFirstOpen ******************/
		%feature("compactdefaultargs") SetIsFirstOpen;
		%feature("autodoc", "If flag is true, the curve is not defined at the first parameter of its domain.

Parameters
----------
Flag: bool

Returns
-------
None
") SetIsFirstOpen;
		void SetIsFirstOpen(const Standard_Boolean Flag);

		/****************** SetIsLastOpen ******************/
		%feature("compactdefaultargs") SetIsLastOpen;
		%feature("autodoc", "If flag is true, the curve is not defined at the first parameter of its domain.

Parameters
----------
Flag: bool

Returns
-------
None
") SetIsLastOpen;
		void SetIsLastOpen(const Standard_Boolean Flag);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the point at parameter theta on the curve.

Parameters
----------
Theta: float

Returns
-------
gp_Pnt
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
		/****************** IntAna_Int3Pln ******************/
		%feature("compactdefaultargs") IntAna_Int3Pln;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntAna_Int3Pln;
		 IntAna_Int3Pln();

		/****************** IntAna_Int3Pln ******************/
		%feature("compactdefaultargs") IntAna_Int3Pln;
		%feature("autodoc", "Determination of the intersection point between 3 planes.

Parameters
----------
P1: gp_Pln
P2: gp_Pln
P3: gp_Pln

Returns
-------
None
") IntAna_Int3Pln;
		 IntAna_Int3Pln(const gp_Pln & P1, const gp_Pln & P2, const gp_Pln & P3);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the computation was successful.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if there is no intersection point. if 2 planes are identical or parallel, isempty will return true.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Determination of the intersection point between 3 planes.

Parameters
----------
P1: gp_Pln
P2: gp_Pln
P3: gp_Pln

Returns
-------
None
") Perform;
		void Perform(const gp_Pln & P1, const gp_Pln & P2, const gp_Pln & P3);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the intersection point.

Returns
-------
gp_Pnt
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
		/****************** IntAna_IntConicQuad ******************/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad();

		/****************** IntAna_IntConicQuad ******************/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "Creates the intersection between a line and a quadric.

Parameters
----------
L: gp_Lin
Q: IntAna_Quadric

Returns
-------
None
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad(const gp_Lin & L, const IntAna_Quadric & Q);

		/****************** IntAna_IntConicQuad ******************/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "Creates the intersection between a circle and a quadric.

Parameters
----------
C: gp_Circ
Q: IntAna_Quadric

Returns
-------
None
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad(const gp_Circ & C, const IntAna_Quadric & Q);

		/****************** IntAna_IntConicQuad ******************/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "Creates the intersection between an ellipse and a quadric.

Parameters
----------
E: gp_Elips
Q: IntAna_Quadric

Returns
-------
None
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad(const gp_Elips & E, const IntAna_Quadric & Q);

		/****************** IntAna_IntConicQuad ******************/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "Creates the intersection between a parabola and a quadric.

Parameters
----------
P: gp_Parab
Q: IntAna_Quadric

Returns
-------
None
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad(const gp_Parab & P, const IntAna_Quadric & Q);

		/****************** IntAna_IntConicQuad ******************/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "Creates the intersection between an hyperbola and a quadric.

Parameters
----------
H: gp_Hypr
Q: IntAna_Quadric

Returns
-------
None
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad(const gp_Hypr & H, const IntAna_Quadric & Q);

		/****************** IntAna_IntConicQuad ******************/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "Intersection between a line and a plane. tolang is used to determine if the angle between two vectors is null. tol is used to check the distance between line and plane on the distance <len> from the origin of the line.

Parameters
----------
L: gp_Lin
P: gp_Pln
Tolang: float
Tol: float,optional
	default value is 0
Len: float,optional
	default value is 0

Returns
-------
None
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad(const gp_Lin & L, const gp_Pln & P, const Standard_Real Tolang, const Standard_Real Tol = 0, const Standard_Real Len = 0);

		/****************** IntAna_IntConicQuad ******************/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "Intersection between a circle and a plane. tolang is used to determine if the angle between two vectors is null. tol is used to determine if a distance is null.

Parameters
----------
C: gp_Circ
P: gp_Pln
Tolang: float
Tol: float

Returns
-------
None
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad(const gp_Circ & C, const gp_Pln & P, const Standard_Real Tolang, const Standard_Real Tol);

		/****************** IntAna_IntConicQuad ******************/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "Intersection between an ellipse and a plane. tolang is used to determine if the angle between two vectors is null. tol is used to determine if a distance is null.

Parameters
----------
E: gp_Elips
P: gp_Pln
Tolang: float
Tol: float

Returns
-------
None
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad(const gp_Elips & E, const gp_Pln & P, const Standard_Real Tolang, const Standard_Real Tol);

		/****************** IntAna_IntConicQuad ******************/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "Intersection between a parabola and a plane. tolang is used to determine if the angle between two vectors is null.

Parameters
----------
Pb: gp_Parab
P: gp_Pln
Tolang: float

Returns
-------
None
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad(const gp_Parab & Pb, const gp_Pln & P, const Standard_Real Tolang);

		/****************** IntAna_IntConicQuad ******************/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "Intersection between an hyperbola and a plane. tolang is used to determine if the angle between two vectors is null.

Parameters
----------
H: gp_Hypr
P: gp_Pln
Tolang: float

Returns
-------
None
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad(const gp_Hypr & H, const gp_Pln & P, const Standard_Real Tolang);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the creation completed.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsInQuadric ******************/
		%feature("compactdefaultargs") IsInQuadric;
		%feature("autodoc", "Returns true if the conic is in the quadric.

Returns
-------
bool
") IsInQuadric;
		Standard_Boolean IsInQuadric();

		/****************** IsParallel ******************/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Returns true if the line is in a quadric which is parallel to the quadric.

Returns
-------
bool
") IsParallel;
		Standard_Boolean IsParallel();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of intersection point.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** ParamOnConic ******************/
		%feature("compactdefaultargs") ParamOnConic;
		%feature("autodoc", "Returns the parameter on the line of the intersection point of range n.

Parameters
----------
N: int

Returns
-------
float
") ParamOnConic;
		Standard_Real ParamOnConic(const Standard_Integer N);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersects a line and a quadric.

Parameters
----------
L: gp_Lin
Q: IntAna_Quadric

Returns
-------
None
") Perform;
		void Perform(const gp_Lin & L, const IntAna_Quadric & Q);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersects a circle and a quadric.

Parameters
----------
C: gp_Circ
Q: IntAna_Quadric

Returns
-------
None
") Perform;
		void Perform(const gp_Circ & C, const IntAna_Quadric & Q);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersects an ellipse and a quadric.

Parameters
----------
E: gp_Elips
Q: IntAna_Quadric

Returns
-------
None
") Perform;
		void Perform(const gp_Elips & E, const IntAna_Quadric & Q);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersects a parabola and a quadric.

Parameters
----------
P: gp_Parab
Q: IntAna_Quadric

Returns
-------
None
") Perform;
		void Perform(const gp_Parab & P, const IntAna_Quadric & Q);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersects an hyperbola and a quadric.

Parameters
----------
H: gp_Hypr
Q: IntAna_Quadric

Returns
-------
None
") Perform;
		void Perform(const gp_Hypr & H, const IntAna_Quadric & Q);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersects a line and a plane. tolang is used to determine if the angle between two vectors is null. tol is used to check the distance between line and plane on the distance <len> from the origin of the line.

Parameters
----------
L: gp_Lin
P: gp_Pln
Tolang: float
Tol: float,optional
	default value is 0
Len: float,optional
	default value is 0

Returns
-------
None
") Perform;
		void Perform(const gp_Lin & L, const gp_Pln & P, const Standard_Real Tolang, const Standard_Real Tol = 0, const Standard_Real Len = 0);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersects a circle and a plane. tolang is used to determine if the angle between two vectors is null. tol is used to determine if a distance is null.

Parameters
----------
C: gp_Circ
P: gp_Pln
Tolang: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Circ & C, const gp_Pln & P, const Standard_Real Tolang, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersects an ellipse and a plane. tolang is used to determine if the angle between two vectors is null. tol is used to determine if a distance is null.

Parameters
----------
E: gp_Elips
P: gp_Pln
Tolang: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Elips & E, const gp_Pln & P, const Standard_Real Tolang, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersects a parabola and a plane. tolang is used to determine if the angle between two vectors is null.

Parameters
----------
Pb: gp_Parab
P: gp_Pln
Tolang: float

Returns
-------
None
") Perform;
		void Perform(const gp_Parab & Pb, const gp_Pln & P, const Standard_Real Tolang);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersects an hyperbola and a plane. tolang is used to determine if the angle between two vectors is null.

Parameters
----------
H: gp_Hypr
P: gp_Pln
Tolang: float

Returns
-------
None
") Perform;
		void Perform(const gp_Hypr & H, const gp_Pln & P, const Standard_Real Tolang);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of range n.

Parameters
----------
N: int

Returns
-------
gp_Pnt
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
		/****************** IntAna_IntLinTorus ******************/
		%feature("compactdefaultargs") IntAna_IntLinTorus;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntAna_IntLinTorus;
		 IntAna_IntLinTorus();

		/****************** IntAna_IntLinTorus ******************/
		%feature("compactdefaultargs") IntAna_IntLinTorus;
		%feature("autodoc", "Creates the intersection between a line and a torus.

Parameters
----------
L: gp_Lin
T: gp_Torus

Returns
-------
None
") IntAna_IntLinTorus;
		 IntAna_IntLinTorus(const gp_Lin & L, const gp_Torus & T);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the computation was successful.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of intersection points.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** ParamOnLine ******************/
		%feature("compactdefaultargs") ParamOnLine;
		%feature("autodoc", "Returns the parameter on the line of the intersection point of range index.

Parameters
----------
Index: int

Returns
-------
float
") ParamOnLine;
		Standard_Real ParamOnLine(const Standard_Integer Index);

		/****************** ParamOnTorus ******************/
		%feature("compactdefaultargs") ParamOnTorus;
		%feature("autodoc", "Returns the parameters on the torus of the intersection point of range index.

Parameters
----------
Index: int

Returns
-------
FI: float
THETA: float
") ParamOnTorus;
		void ParamOnTorus(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersects a line and a torus.

Parameters
----------
L: gp_Lin
T: gp_Torus

Returns
-------
None
") Perform;
		void Perform(const gp_Lin & L, const gp_Torus & T);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the intersection point of range index.

Parameters
----------
Index: int

Returns
-------
gp_Pnt
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
		/****************** IntAna_IntQuadQuad ******************/
		%feature("compactdefaultargs") IntAna_IntQuadQuad;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntAna_IntQuadQuad;
		 IntAna_IntQuadQuad();

		/****************** IntAna_IntQuadQuad ******************/
		%feature("compactdefaultargs") IntAna_IntQuadQuad;
		%feature("autodoc", "Creates the intersection between a cylinder and a quadric . tol est a definir plus precisemment.

Parameters
----------
C: gp_Cylinder
Q: IntAna_Quadric
Tol: float

Returns
-------
None
") IntAna_IntQuadQuad;
		 IntAna_IntQuadQuad(const gp_Cylinder & C, const IntAna_Quadric & Q, const Standard_Real Tol);

		/****************** IntAna_IntQuadQuad ******************/
		%feature("compactdefaultargs") IntAna_IntQuadQuad;
		%feature("autodoc", "Creates the intersection between a cone and a quadric. tol est a definir plus precisemment.

Parameters
----------
C: gp_Cone
Q: IntAna_Quadric
Tol: float

Returns
-------
None
") IntAna_IntQuadQuad;
		 IntAna_IntQuadQuad(const gp_Cone & C, const IntAna_Quadric & Q, const Standard_Real Tol);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the curve of range n.

Parameters
----------
N: int

Returns
-------
IntAna_Curve
") Curve;
		const IntAna_Curve & Curve(const Standard_Integer N);

		/****************** HasNextCurve ******************/
		%feature("compactdefaultargs") HasNextCurve;
		%feature("autodoc", "Returns true if the curve i shares its last bound with another curve.

Parameters
----------
I: int

Returns
-------
bool
") HasNextCurve;
		Standard_Boolean HasNextCurve(const Standard_Integer I);

		/****************** HasPreviousCurve ******************/
		%feature("compactdefaultargs") HasPreviousCurve;
		%feature("autodoc", "Returns true if the curve i shares its first bound with another curve.

Parameters
----------
I: int

Returns
-------
bool
") HasPreviousCurve;
		Standard_Boolean HasPreviousCurve(const Standard_Integer I);

		/****************** IdenticalElements ******************/
		%feature("compactdefaultargs") IdenticalElements;
		%feature("autodoc", "Returns true if the cylinder, the cone or the sphere is identical to the quadric.

Returns
-------
bool
") IdenticalElements;
		Standard_Boolean IdenticalElements();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the computation was successful.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbCurve ******************/
		%feature("compactdefaultargs") NbCurve;
		%feature("autodoc", "Returns the number of curves solution.

Returns
-------
int
") NbCurve;
		Standard_Integer NbCurve();

		/****************** NbPnt ******************/
		%feature("compactdefaultargs") NbPnt;
		%feature("autodoc", "Returns the number of contact point.

Returns
-------
int
") NbPnt;
		Standard_Integer NbPnt();

		/****************** NextCurve ******************/
		%feature("compactdefaultargs") NextCurve;
		%feature("autodoc", "If hasnextcurve(i) returns true, this function returns the index j of the curve which has a common bound with the curve i. if theopposite == true , then the last parameter of the curve i, and the last parameter of the curve j give the same point. else the last parameter of the curve i and the first parameter of the curve j are the same point.

Parameters
----------
I: int

Returns
-------
theOpposite: bool
") NextCurve;
		Standard_Integer NextCurve(const Standard_Integer I, Standard_Boolean &OutValue);

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Returns the paramaters on the 'explicit quadric' (i.e the cylinder or the cone, the first argument given to the constructor) of the point of range n.

Parameters
----------
N: int

Returns
-------
U1: float
U2: float
") Parameters;
		void Parameters(const Standard_Integer N, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersects a cylinder and a quadric . tol est a definir plus precisemment.

Parameters
----------
C: gp_Cylinder
Q: IntAna_Quadric
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Cylinder & C, const IntAna_Quadric & Q, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersects a cone and a quadric. tol est a definir plus precisemment.

Parameters
----------
C: gp_Cone
Q: IntAna_Quadric
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Cone & C, const IntAna_Quadric & Q, const Standard_Real Tol);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of range n.

Parameters
----------
N: int

Returns
-------
gp_Pnt
") Point;
		const gp_Pnt Point(const Standard_Integer N);

		/****************** PreviousCurve ******************/
		%feature("compactdefaultargs") PreviousCurve;
		%feature("autodoc", "If haspreviouscurve(i) returns true, this function returns the index j of the curve which has a common bound with the curve i. if theopposite == true , then the first parameter of the curve i, and the first parameter of the curve j give the same point. else the first parameter of the curve i and the last parameter of the curve j are the same point.

Parameters
----------
I: int

Returns
-------
theOpposite: bool
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
		/****************** IntAna_QuadQuadGeo ******************/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo();

		/****************** IntAna_QuadQuadGeo ******************/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "Creates the intersection between two planes. tolang is the angular tolerance used to determine if the planes are parallel. tol is the tolerance used to determine if the planes are identical (only when they are parallel).

Parameters
----------
P1: gp_Pln
P2: gp_Pln
TolAng: float
Tol: float

Returns
-------
None
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Pln & P1, const gp_Pln & P2, const Standard_Real TolAng, const Standard_Real Tol);

		/****************** IntAna_QuadQuadGeo ******************/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "Creates the intersection between a plane and a cylinder. tolang is the angular tolerance used to determine if the axis of the cylinder is parallel to the plane. tol is the tolerance used to determine if the result is a circle or an ellipse. if the maximum distance between the ellipse solution and the circle centered at the ellipse center is less than tol, the result will be the circle. h is the height of the cylinder <cyl>. it is used to check whether the plane and cylinder are parallel.

Parameters
----------
P: gp_Pln
C: gp_Cylinder
Tolang: float
Tol: float
H: float,optional
	default value is 0

Returns
-------
None
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Pln & P, const gp_Cylinder & C, const Standard_Real Tolang, const Standard_Real Tol, const Standard_Real H = 0);

		/****************** IntAna_QuadQuadGeo ******************/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "Creates the intersection between a plane and a sphere.

Parameters
----------
P: gp_Pln
S: gp_Sphere

Returns
-------
None
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Pln & P, const gp_Sphere & S);

		/****************** IntAna_QuadQuadGeo ******************/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "Creates the intersection between a plane and a cone. tolang is the angular tolerance used to determine if the axis of the cone is parallel or perpendicular to the plane, and if the generating line of the cone is parallel to the plane. tol is the tolerance used to determine if the apex of the cone is in the plane.

Parameters
----------
P: gp_Pln
C: gp_Cone
Tolang: float
Tol: float

Returns
-------
None
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Pln & P, const gp_Cone & C, const Standard_Real Tolang, const Standard_Real Tol);

		/****************** IntAna_QuadQuadGeo ******************/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "Creates the intersection between two cylinders.

Parameters
----------
Cyl1: gp_Cylinder
Cyl2: gp_Cylinder
Tol: float

Returns
-------
None
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Cylinder & Cyl1, const gp_Cylinder & Cyl2, const Standard_Real Tol);

		/****************** IntAna_QuadQuadGeo ******************/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "Creates the intersection between a cylinder and a sphere.

Parameters
----------
Cyl: gp_Cylinder
Sph: gp_Sphere
Tol: float

Returns
-------
None
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Cylinder & Cyl, const gp_Sphere & Sph, const Standard_Real Tol);

		/****************** IntAna_QuadQuadGeo ******************/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "Creates the intersection between a cylinder and a cone.

Parameters
----------
Cyl: gp_Cylinder
Con: gp_Cone
Tol: float

Returns
-------
None
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Cylinder & Cyl, const gp_Cone & Con, const Standard_Real Tol);

		/****************** IntAna_QuadQuadGeo ******************/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "Creates the intersection between two spheres.

Parameters
----------
Sph1: gp_Sphere
Sph2: gp_Sphere
Tol: float

Returns
-------
None
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Sphere & Sph1, const gp_Sphere & Sph2, const Standard_Real Tol);

		/****************** IntAna_QuadQuadGeo ******************/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "Creates the intersection beween a sphere and a cone.

Parameters
----------
Sph: gp_Sphere
Con: gp_Cone
Tol: float

Returns
-------
None
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Sphere & Sph, const gp_Cone & Con, const Standard_Real Tol);

		/****************** IntAna_QuadQuadGeo ******************/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "Creates the intersection beween two cones.

Parameters
----------
Con1: gp_Cone
Con2: gp_Cone
Tol: float

Returns
-------
None
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Cone & Con1, const gp_Cone & Con2, const Standard_Real Tol);

		/****************** IntAna_QuadQuadGeo ******************/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "Creates the intersection beween plane and torus.

Parameters
----------
Pln: gp_Pln
Tor: gp_Torus
Tol: float

Returns
-------
None
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Pln & Pln, const gp_Torus & Tor, const Standard_Real Tol);

		/****************** IntAna_QuadQuadGeo ******************/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "Creates the intersection beween cylinder and torus.

Parameters
----------
Cyl: gp_Cylinder
Tor: gp_Torus
Tol: float

Returns
-------
None
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Cylinder & Cyl, const gp_Torus & Tor, const Standard_Real Tol);

		/****************** IntAna_QuadQuadGeo ******************/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "Creates the intersection beween cone and torus.

Parameters
----------
Con: gp_Cone
Tor: gp_Torus
Tol: float

Returns
-------
None
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Cone & Con, const gp_Torus & Tor, const Standard_Real Tol);

		/****************** IntAna_QuadQuadGeo ******************/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "Creates the intersection beween sphere and torus.

Parameters
----------
Sph: gp_Sphere
Tor: gp_Torus
Tol: float

Returns
-------
None
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Sphere & Sph, const gp_Torus & Tor, const Standard_Real Tol);

		/****************** IntAna_QuadQuadGeo ******************/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "Creates the intersection beween two toruses.

Parameters
----------
Tor1: gp_Torus
Tor2: gp_Torus
Tol: float

Returns
-------
None
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo(const gp_Torus & Tor1, const gp_Torus & Tor2, const Standard_Real Tol);

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Returns the circle solution of range num.

Parameters
----------
Num: int

Returns
-------
gp_Circ
") Circle;
		gp_Circ Circle(const Standard_Integer Num);

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Returns the ellipse solution of range num.

Parameters
----------
Num: int

Returns
-------
gp_Elips
") Ellipse;
		gp_Elips Ellipse(const Standard_Integer Num);

		/****************** HasCommonGen ******************/
		%feature("compactdefaultargs") HasCommonGen;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasCommonGen;
		Standard_Boolean HasCommonGen();

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "Returns the hyperbola solution of range num.

Parameters
----------
Num: int

Returns
-------
gp_Hypr
") Hyperbola;
		gp_Hypr Hyperbola(const Standard_Integer Num);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns standard_true if the computation was successful.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Returns the line solution of range num.

Parameters
----------
Num: int

Returns
-------
gp_Lin
") Line;
		gp_Lin Line(const Standard_Integer Num);

		/****************** NbSolutions ******************/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Returns the number of interesections. the possible intersections are : - 1 point - 1 or 2 line(s) - 1 point and 1 line - 1 circle - 1 ellipse - 1 parabola - 1 or 2 hyperbola(s).

Returns
-------
int
") NbSolutions;
		Standard_Integer NbSolutions();

		/****************** PChar ******************/
		%feature("compactdefaultargs") PChar;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PChar;
		const gp_Pnt PChar();

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "Returns the parabola solution of range num.

Parameters
----------
Num: int

Returns
-------
gp_Parab
") Parabola;
		gp_Parab Parabola(const Standard_Integer Num);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersects two planes. tolang is the angular tolerance used to determine if the planes are parallel. tol is the tolerance used to determine if the planes are identical (only when they are parallel).

Parameters
----------
P1: gp_Pln
P2: gp_Pln
TolAng: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pln & P1, const gp_Pln & P2, const Standard_Real TolAng, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersects a plane and a cylinder. tolang is the angular tolerance used to determine if the axis of the cylinder is parallel to the plane. tol is the tolerance used to determine if the result is a circle or an ellipse. if the maximum distance between the ellipse solution and the circle centered at the ellipse center is less than tol, the result will be the circle. h is the height of the cylinder <cyl>. it is used to check whether the plane and cylinder are parallel.

Parameters
----------
P: gp_Pln
C: gp_Cylinder
Tolang: float
Tol: float
H: float,optional
	default value is 0

Returns
-------
None
") Perform;
		void Perform(const gp_Pln & P, const gp_Cylinder & C, const Standard_Real Tolang, const Standard_Real Tol, const Standard_Real H = 0);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersects a plane and a sphere.

Parameters
----------
P: gp_Pln
S: gp_Sphere

Returns
-------
None
") Perform;
		void Perform(const gp_Pln & P, const gp_Sphere & S);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersects a plane and a cone. tolang is the angular tolerance used to determine if the axis of the cone is parallel or perpendicular to the plane, and if the generating line of the cone is parallel to the plane. tol is the tolerance used to determine if the apex of the cone is in the plane.

Parameters
----------
P: gp_Pln
C: gp_Cone
Tolang: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pln & P, const gp_Cone & C, const Standard_Real Tolang, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersects two cylinders.

Parameters
----------
Cyl1: gp_Cylinder
Cyl2: gp_Cylinder
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Cylinder & Cyl1, const gp_Cylinder & Cyl2, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersects a cylinder and a sphere.

Parameters
----------
Cyl: gp_Cylinder
Sph: gp_Sphere
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Cylinder & Cyl, const gp_Sphere & Sph, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersects a cylinder and a cone.

Parameters
----------
Cyl: gp_Cylinder
Con: gp_Cone
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Cylinder & Cyl, const gp_Cone & Con, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersects a two spheres.

Parameters
----------
Sph1: gp_Sphere
Sph2: gp_Sphere
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Sphere & Sph1, const gp_Sphere & Sph2, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersects a sphere and a cone.

Parameters
----------
Sph: gp_Sphere
Con: gp_Cone
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Sphere & Sph, const gp_Cone & Con, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersects two cones.

Parameters
----------
Con1: gp_Cone
Con2: gp_Cone
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Cone & Con1, const gp_Cone & Con2, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersects plane and torus.

Parameters
----------
Pln: gp_Pln
Tor: gp_Torus
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pln & Pln, const gp_Torus & Tor, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersects cylinder and torus.

Parameters
----------
Cyl: gp_Cylinder
Tor: gp_Torus
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Cylinder & Cyl, const gp_Torus & Tor, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersects cone and torus.

Parameters
----------
Con: gp_Cone
Tor: gp_Torus
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Cone & Con, const gp_Torus & Tor, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersects sphere and torus.

Parameters
----------
Sph: gp_Sphere
Tor: gp_Torus
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Sphere & Sph, const gp_Torus & Tor, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersects two toruses.

Parameters
----------
Tor1: gp_Torus
Tor2: gp_Torus
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Torus & Tor1, const gp_Torus & Tor2, const Standard_Real Tol);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point solution of range num.

Parameters
----------
Num: int

Returns
-------
gp_Pnt
") Point;
		gp_Pnt Point(const Standard_Integer Num);

		/****************** TypeInter ******************/
		%feature("compactdefaultargs") TypeInter;
		%feature("autodoc", "Returns the type of intersection.

Returns
-------
IntAna_ResultType
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
		/****************** IntAna_Quadric ******************/
		%feature("compactdefaultargs") IntAna_Quadric;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntAna_Quadric;
		 IntAna_Quadric();

		/****************** IntAna_Quadric ******************/
		%feature("compactdefaultargs") IntAna_Quadric;
		%feature("autodoc", "Creates a quadric from a pln.

Parameters
----------
P: gp_Pln

Returns
-------
None
") IntAna_Quadric;
		 IntAna_Quadric(const gp_Pln & P);

		/****************** IntAna_Quadric ******************/
		%feature("compactdefaultargs") IntAna_Quadric;
		%feature("autodoc", "Creates a quadric from a sphere.

Parameters
----------
Sph: gp_Sphere

Returns
-------
None
") IntAna_Quadric;
		 IntAna_Quadric(const gp_Sphere & Sph);

		/****************** IntAna_Quadric ******************/
		%feature("compactdefaultargs") IntAna_Quadric;
		%feature("autodoc", "Creates a quadric from a cylinder.

Parameters
----------
Cyl: gp_Cylinder

Returns
-------
None
") IntAna_Quadric;
		 IntAna_Quadric(const gp_Cylinder & Cyl);

		/****************** IntAna_Quadric ******************/
		%feature("compactdefaultargs") IntAna_Quadric;
		%feature("autodoc", "Creates a quadric from a cone.

Parameters
----------
Cone: gp_Cone

Returns
-------
None
") IntAna_Quadric;
		 IntAna_Quadric(const gp_Cone & Cone);

		/****************** Coefficients ******************/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "Returns the coefficients of the polynomial equation which define the quadric: xcxx x**2 + xcyy y**2 + xczz z**2 + 2 ( xcxy x y + xcxz x z + xcyz y z ) + 2 ( xcx x + xcy y + xcz z ) + xccte.

Parameters
----------

Returns
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
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** NewCoefficients ******************/
		%feature("compactdefaultargs") NewCoefficients;
		%feature("autodoc", "Returns the coefficients of the polynomial equation ( written in the natural coordinates system ) in the local coordinates system defined by axis.

Parameters
----------
Axis: gp_Ax3

Returns
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
") NewCoefficients;
		void NewCoefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, const gp_Ax3 & Axis);

		/****************** SetQuadric ******************/
		%feature("compactdefaultargs") SetQuadric;
		%feature("autodoc", "Initializes the quadric with a pln.

Parameters
----------
P: gp_Pln

Returns
-------
None
") SetQuadric;
		void SetQuadric(const gp_Pln & P);

		/****************** SetQuadric ******************/
		%feature("compactdefaultargs") SetQuadric;
		%feature("autodoc", "Initialize the quadric with a sphere.

Parameters
----------
Sph: gp_Sphere

Returns
-------
None
") SetQuadric;
		void SetQuadric(const gp_Sphere & Sph);

		/****************** SetQuadric ******************/
		%feature("compactdefaultargs") SetQuadric;
		%feature("autodoc", "Initializes the quadric with a cone.

Parameters
----------
Con: gp_Cone

Returns
-------
None
") SetQuadric;
		void SetQuadric(const gp_Cone & Con);

		/****************** SetQuadric ******************/
		%feature("compactdefaultargs") SetQuadric;
		%feature("autodoc", "Initializes the quadric with a cylinder.

Parameters
----------
Cyl: gp_Cylinder

Returns
-------
None
") SetQuadric;
		void SetQuadric(const gp_Cylinder & Cyl);

		/****************** SpecialPoints ******************/
		%feature("compactdefaultargs") SpecialPoints;
		%feature("autodoc", "Returns the list of special points (with singularities).

Returns
-------
NCollection_List<gp_Pnt>
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
