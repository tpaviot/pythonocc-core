/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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

/* handles */
/* end handles declaration */

/* templates */
%template(IntAna_ListOfCurve) NCollection_List <IntAna_Curve>;
%template(IntAna_ListIteratorOfListOfCurve) NCollection_TListIterator<IntAna_Curve>;
/* end templates declaration */

/* typedefs */
typedef NCollection_List <IntAna_Curve> IntAna_ListOfCurve;
typedef NCollection_List <IntAna_Curve>::Iterator IntAna_ListIteratorOfListOfCurve;
/* end typedefs declaration */

/*********************
* class IntAna_Curve *
*********************/
class IntAna_Curve {
	public:
		/****************** D1u ******************/
		%feature("compactdefaultargs") D1u;
		%feature("autodoc", "* Returns the point and the first derivative at parameter Theta on the curve.
	:param Theta:
	:type Theta: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: bool") D1u;
		Standard_Boolean D1u (const Standard_Real Theta,gp_Pnt & P,gp_Vec & V);

		/****************** Domain ******************/
		%feature("compactdefaultargs") Domain;
		%feature("autodoc", "* Returns the paramatric domain of the curve.
	:param theFirst:
	:type theFirst: float
	:param theLast:
	:type theLast: float
	:rtype: None") Domain;
		void Domain (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** FindParameter ******************/
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "* Tries to find the parameter of the point P on the curve. If the method returns False, the 'projection' is impossible. If the method returns True at least one parameter has been found. theParams is always sorted in ascending order.
	:param P:
	:type P: gp_Pnt
	:param theParams:
	:type theParams: TColStd_ListOfReal
	:rtype: None") FindParameter;
		void FindParameter (const gp_Pnt & P,TColStd_ListOfReal & theParams);

		/****************** IntAna_Curve ******************/
		%feature("compactdefaultargs") IntAna_Curve;
		%feature("autodoc", "* Empty Constructor
	:rtype: None") IntAna_Curve;
		 IntAna_Curve ();

		/****************** IsConstant ******************/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "* Returns True if the function is constant.
	:rtype: bool") IsConstant;
		Standard_Boolean IsConstant ();

		/****************** IsFirstOpen ******************/
		%feature("compactdefaultargs") IsFirstOpen;
		%feature("autodoc", "* Returns True if the domain is open at the beginning.
	:rtype: bool") IsFirstOpen;
		Standard_Boolean IsFirstOpen ();

		/****************** IsLastOpen ******************/
		%feature("compactdefaultargs") IsLastOpen;
		%feature("autodoc", "* Returns True if the domain is open at the end.
	:rtype: bool") IsLastOpen;
		Standard_Boolean IsLastOpen ();

		/****************** IsOpen ******************/
		%feature("compactdefaultargs") IsOpen;
		%feature("autodoc", "* Returns True if the curve is not infinite at the last parameter or at the first parameter of the domain.
	:rtype: bool") IsOpen;
		Standard_Boolean IsOpen ();

		/****************** SetConeQuadValues ******************/
		%feature("compactdefaultargs") SetConeQuadValues;
		%feature("autodoc", "* Sets the parameters used to compute Points and Derivative on the curve.
	:param Cone:
	:type Cone: gp_Cone
	:param Qxx:
	:type Qxx: float
	:param Qyy:
	:type Qyy: float
	:param Qzz:
	:type Qzz: float
	:param Qxy:
	:type Qxy: float
	:param Qxz:
	:type Qxz: float
	:param Qyz:
	:type Qyz: float
	:param Qx:
	:type Qx: float
	:param Qy:
	:type Qy: float
	:param Qz:
	:type Qz: float
	:param Q1:
	:type Q1: float
	:param Tol:
	:type Tol: float
	:param DomInf:
	:type DomInf: float
	:param DomSup:
	:type DomSup: float
	:param TwoZForATheta:
	:type TwoZForATheta: bool
	:param ZIsPositive:
	:type ZIsPositive: bool
	:rtype: None") SetConeQuadValues;
		void SetConeQuadValues (const gp_Cone & Cone,const Standard_Real Qxx,const Standard_Real Qyy,const Standard_Real Qzz,const Standard_Real Qxy,const Standard_Real Qxz,const Standard_Real Qyz,const Standard_Real Qx,const Standard_Real Qy,const Standard_Real Qz,const Standard_Real Q1,const Standard_Real Tol,const Standard_Real DomInf,const Standard_Real DomSup,const Standard_Boolean TwoZForATheta,const Standard_Boolean ZIsPositive);

		/****************** SetCylinderQuadValues ******************/
		%feature("compactdefaultargs") SetCylinderQuadValues;
		%feature("autodoc", "* Sets the parameters used to compute Points and Derivative on the curve.
	:param Cylinder:
	:type Cylinder: gp_Cylinder
	:param Qxx:
	:type Qxx: float
	:param Qyy:
	:type Qyy: float
	:param Qzz:
	:type Qzz: float
	:param Qxy:
	:type Qxy: float
	:param Qxz:
	:type Qxz: float
	:param Qyz:
	:type Qyz: float
	:param Qx:
	:type Qx: float
	:param Qy:
	:type Qy: float
	:param Qz:
	:type Qz: float
	:param Q1:
	:type Q1: float
	:param Tol:
	:type Tol: float
	:param DomInf:
	:type DomInf: float
	:param DomSup:
	:type DomSup: float
	:param TwoZForATheta:
	:type TwoZForATheta: bool
	:param ZIsPositive:
	:type ZIsPositive: bool
	:rtype: None") SetCylinderQuadValues;
		void SetCylinderQuadValues (const gp_Cylinder & Cylinder,const Standard_Real Qxx,const Standard_Real Qyy,const Standard_Real Qzz,const Standard_Real Qxy,const Standard_Real Qxz,const Standard_Real Qyz,const Standard_Real Qx,const Standard_Real Qy,const Standard_Real Qz,const Standard_Real Q1,const Standard_Real Tol,const Standard_Real DomInf,const Standard_Real DomSup,const Standard_Boolean TwoZForATheta,const Standard_Boolean ZIsPositive);

		/****************** SetDomain ******************/
		%feature("compactdefaultargs") SetDomain;
		%feature("autodoc", "* Trims this curve
	:param theFirst:
	:type theFirst: float
	:param theLast:
	:type theLast: float
	:rtype: None") SetDomain;
		void SetDomain (const Standard_Real theFirst,const Standard_Real theLast);

		/****************** SetIsFirstOpen ******************/
		%feature("compactdefaultargs") SetIsFirstOpen;
		%feature("autodoc", "* If flag is True, the Curve is not defined at the first parameter of its domain.
	:param Flag:
	:type Flag: bool
	:rtype: None") SetIsFirstOpen;
		void SetIsFirstOpen (const Standard_Boolean Flag);

		/****************** SetIsLastOpen ******************/
		%feature("compactdefaultargs") SetIsLastOpen;
		%feature("autodoc", "* If flag is True, the Curve is not defined at the first parameter of its domain.
	:param Flag:
	:type Flag: bool
	:rtype: None") SetIsLastOpen;
		void SetIsLastOpen (const Standard_Boolean Flag);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the point at parameter Theta on the curve.
	:param Theta:
	:type Theta: float
	:rtype: gp_Pnt") Value;
		gp_Pnt Value (const Standard_Real Theta);

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
		%feature("autodoc", ":rtype: None") IntAna_Int3Pln;
		 IntAna_Int3Pln ();

		/****************** IntAna_Int3Pln ******************/
		%feature("compactdefaultargs") IntAna_Int3Pln;
		%feature("autodoc", "* Determination of the intersection point between 3 planes.
	:param P1:
	:type P1: gp_Pln
	:param P2:
	:type P2: gp_Pln
	:param P3:
	:type P3: gp_Pln
	:rtype: None") IntAna_Int3Pln;
		 IntAna_Int3Pln (const gp_Pln & P1,const gp_Pln & P2,const gp_Pln & P3);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns True if the computation was successful.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "* Returns True if there is no intersection POINT. If 2 planes are identical or parallel, IsEmpty will return True.
	:rtype: bool") IsEmpty;
		Standard_Boolean IsEmpty ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Determination of the intersection point between 3 planes.
	:param P1:
	:type P1: gp_Pln
	:param P2:
	:type P2: gp_Pln
	:param P3:
	:type P3: gp_Pln
	:rtype: None") Perform;
		void Perform (const gp_Pln & P1,const gp_Pln & P2,const gp_Pln & P3);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the intersection point.
	:rtype: gp_Pnt") Value;
		const gp_Pnt  Value ();

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
		%feature("autodoc", "* Empty constructor.
	:rtype: None") IntAna_IntConicQuad;
		 IntAna_IntConicQuad ();

		/****************** IntAna_IntConicQuad ******************/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "* Creates the intersection between a line and a quadric.
	:param L:
	:type L: gp_Lin
	:param Q:
	:type Q: IntAna_Quadric
	:rtype: None") IntAna_IntConicQuad;
		 IntAna_IntConicQuad (const gp_Lin & L,const IntAna_Quadric & Q);

		/****************** IntAna_IntConicQuad ******************/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "* Creates the intersection between a circle and a quadric.
	:param C:
	:type C: gp_Circ
	:param Q:
	:type Q: IntAna_Quadric
	:rtype: None") IntAna_IntConicQuad;
		 IntAna_IntConicQuad (const gp_Circ & C,const IntAna_Quadric & Q);

		/****************** IntAna_IntConicQuad ******************/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "* Creates the intersection between an ellipse and a quadric.
	:param E:
	:type E: gp_Elips
	:param Q:
	:type Q: IntAna_Quadric
	:rtype: None") IntAna_IntConicQuad;
		 IntAna_IntConicQuad (const gp_Elips & E,const IntAna_Quadric & Q);

		/****************** IntAna_IntConicQuad ******************/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "* Creates the intersection between a parabola and a quadric.
	:param P:
	:type P: gp_Parab
	:param Q:
	:type Q: IntAna_Quadric
	:rtype: None") IntAna_IntConicQuad;
		 IntAna_IntConicQuad (const gp_Parab & P,const IntAna_Quadric & Q);

		/****************** IntAna_IntConicQuad ******************/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "* Creates the intersection between an hyperbola and a quadric.
	:param H:
	:type H: gp_Hypr
	:param Q:
	:type Q: IntAna_Quadric
	:rtype: None") IntAna_IntConicQuad;
		 IntAna_IntConicQuad (const gp_Hypr & H,const IntAna_Quadric & Q);

		/****************** IntAna_IntConicQuad ******************/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "* Intersection between a line and a plane. Tolang is used to determine if the angle between two vectors is null. Tol is used to check the distance between line and plane on the distance <Len> from the origin of the line.
	:param L:
	:type L: gp_Lin
	:param P:
	:type P: gp_Pln
	:param Tolang:
	:type Tolang: float
	:param Tol: default value is 0
	:type Tol: float
	:param Len: default value is 0
	:type Len: float
	:rtype: None") IntAna_IntConicQuad;
		 IntAna_IntConicQuad (const gp_Lin & L,const gp_Pln & P,const Standard_Real Tolang,const Standard_Real Tol = 0,const Standard_Real Len = 0);

		/****************** IntAna_IntConicQuad ******************/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "* Intersection between a circle and a plane. Tolang is used to determine if the angle between two vectors is null. Tol is used to determine if a distance is null.
	:param C:
	:type C: gp_Circ
	:param P:
	:type P: gp_Pln
	:param Tolang:
	:type Tolang: float
	:param Tol:
	:type Tol: float
	:rtype: None") IntAna_IntConicQuad;
		 IntAna_IntConicQuad (const gp_Circ & C,const gp_Pln & P,const Standard_Real Tolang,const Standard_Real Tol);

		/****************** IntAna_IntConicQuad ******************/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "* Intersection between an ellipse and a plane. Tolang is used to determine if the angle between two vectors is null. Tol is used to determine if a distance is null.
	:param E:
	:type E: gp_Elips
	:param P:
	:type P: gp_Pln
	:param Tolang:
	:type Tolang: float
	:param Tol:
	:type Tol: float
	:rtype: None") IntAna_IntConicQuad;
		 IntAna_IntConicQuad (const gp_Elips & E,const gp_Pln & P,const Standard_Real Tolang,const Standard_Real Tol);

		/****************** IntAna_IntConicQuad ******************/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "* Intersection between a parabola and a plane. Tolang is used to determine if the angle between two vectors is null.
	:param Pb:
	:type Pb: gp_Parab
	:param P:
	:type P: gp_Pln
	:param Tolang:
	:type Tolang: float
	:rtype: None") IntAna_IntConicQuad;
		 IntAna_IntConicQuad (const gp_Parab & Pb,const gp_Pln & P,const Standard_Real Tolang);

		/****************** IntAna_IntConicQuad ******************/
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "* Intersection between an hyperbola and a plane. Tolang is used to determine if the angle between two vectors is null.
	:param H:
	:type H: gp_Hypr
	:param P:
	:type P: gp_Pln
	:param Tolang:
	:type Tolang: float
	:rtype: None") IntAna_IntConicQuad;
		 IntAna_IntConicQuad (const gp_Hypr & H,const gp_Pln & P,const Standard_Real Tolang);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns True if the creation completed.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** IsInQuadric ******************/
		%feature("compactdefaultargs") IsInQuadric;
		%feature("autodoc", "* Returns True if the conic is in the quadric.
	:rtype: bool") IsInQuadric;
		Standard_Boolean IsInQuadric ();

		/****************** IsParallel ******************/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "* Returns True if the line is in a quadric which is parallel to the quadric.
	:rtype: bool") IsParallel;
		Standard_Boolean IsParallel ();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "* Returns the number of intersection point.
	:rtype: int") NbPoints;
		Standard_Integer NbPoints ();

		/****************** ParamOnConic ******************/
		%feature("compactdefaultargs") ParamOnConic;
		%feature("autodoc", "* Returns the parameter on the line of the intersection point of range N.
	:param N:
	:type N: int
	:rtype: float") ParamOnConic;
		Standard_Real ParamOnConic (const Standard_Integer N);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersects a line and a quadric.
	:param L:
	:type L: gp_Lin
	:param Q:
	:type Q: IntAna_Quadric
	:rtype: None") Perform;
		void Perform (const gp_Lin & L,const IntAna_Quadric & Q);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersects a circle and a quadric.
	:param C:
	:type C: gp_Circ
	:param Q:
	:type Q: IntAna_Quadric
	:rtype: None") Perform;
		void Perform (const gp_Circ & C,const IntAna_Quadric & Q);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersects an ellipse and a quadric.
	:param E:
	:type E: gp_Elips
	:param Q:
	:type Q: IntAna_Quadric
	:rtype: None") Perform;
		void Perform (const gp_Elips & E,const IntAna_Quadric & Q);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersects a parabola and a quadric.
	:param P:
	:type P: gp_Parab
	:param Q:
	:type Q: IntAna_Quadric
	:rtype: None") Perform;
		void Perform (const gp_Parab & P,const IntAna_Quadric & Q);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersects an hyperbola and a quadric.
	:param H:
	:type H: gp_Hypr
	:param Q:
	:type Q: IntAna_Quadric
	:rtype: None") Perform;
		void Perform (const gp_Hypr & H,const IntAna_Quadric & Q);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersects a line and a plane. Tolang is used to determine if the angle between two vectors is null. Tol is used to check the distance between line and plane on the distance <Len> from the origin of the line.
	:param L:
	:type L: gp_Lin
	:param P:
	:type P: gp_Pln
	:param Tolang:
	:type Tolang: float
	:param Tol: default value is 0
	:type Tol: float
	:param Len: default value is 0
	:type Len: float
	:rtype: None") Perform;
		void Perform (const gp_Lin & L,const gp_Pln & P,const Standard_Real Tolang,const Standard_Real Tol = 0,const Standard_Real Len = 0);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersects a circle and a plane. Tolang is used to determine if the angle between two vectors is null. Tol is used to determine if a distance is null.
	:param C:
	:type C: gp_Circ
	:param P:
	:type P: gp_Pln
	:param Tolang:
	:type Tolang: float
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const gp_Circ & C,const gp_Pln & P,const Standard_Real Tolang,const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersects an ellipse and a plane. Tolang is used to determine if the angle between two vectors is null. Tol is used to determine if a distance is null.
	:param E:
	:type E: gp_Elips
	:param P:
	:type P: gp_Pln
	:param Tolang:
	:type Tolang: float
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const gp_Elips & E,const gp_Pln & P,const Standard_Real Tolang,const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersects a parabola and a plane. Tolang is used to determine if the angle between two vectors is null.
	:param Pb:
	:type Pb: gp_Parab
	:param P:
	:type P: gp_Pln
	:param Tolang:
	:type Tolang: float
	:rtype: None") Perform;
		void Perform (const gp_Parab & Pb,const gp_Pln & P,const Standard_Real Tolang);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersects an hyperbola and a plane. Tolang is used to determine if the angle between two vectors is null.
	:param H:
	:type H: gp_Hypr
	:param P:
	:type P: gp_Pln
	:param Tolang:
	:type Tolang: float
	:rtype: None") Perform;
		void Perform (const gp_Hypr & H,const gp_Pln & P,const Standard_Real Tolang);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* Returns the point of range N.
	:param N:
	:type N: int
	:rtype: gp_Pnt") Point;
		const gp_Pnt  Point (const Standard_Integer N);

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
		%feature("autodoc", ":rtype: None") IntAna_IntLinTorus;
		 IntAna_IntLinTorus ();

		/****************** IntAna_IntLinTorus ******************/
		%feature("compactdefaultargs") IntAna_IntLinTorus;
		%feature("autodoc", "* Creates the intersection between a line and a torus.
	:param L:
	:type L: gp_Lin
	:param T:
	:type T: gp_Torus
	:rtype: None") IntAna_IntLinTorus;
		 IntAna_IntLinTorus (const gp_Lin & L,const gp_Torus & T);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns True if the computation was successful.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "* Returns the number of intersection points.
	:rtype: int") NbPoints;
		Standard_Integer NbPoints ();

		/****************** ParamOnLine ******************/
		%feature("compactdefaultargs") ParamOnLine;
		%feature("autodoc", "* Returns the parameter on the line of the intersection point of range Index.
	:param Index:
	:type Index: int
	:rtype: float") ParamOnLine;
		Standard_Real ParamOnLine (const Standard_Integer Index);

		/****************** ParamOnTorus ******************/
		%feature("compactdefaultargs") ParamOnTorus;
		%feature("autodoc", "* Returns the parameters on the torus of the intersection point of range Index.
	:param Index:
	:type Index: int
	:param FI:
	:type FI: float
	:param THETA:
	:type THETA: float
	:rtype: None") ParamOnTorus;
		void ParamOnTorus (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersects a line and a torus.
	:param L:
	:type L: gp_Lin
	:param T:
	:type T: gp_Torus
	:rtype: None") Perform;
		void Perform (const gp_Lin & L,const gp_Torus & T);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the intersection point of range Index.
	:param Index:
	:type Index: int
	:rtype: gp_Pnt") Value;
		const gp_Pnt  Value (const Standard_Integer Index);

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
		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "* Returns the curve of range N.
	:param N:
	:type N: int
	:rtype: IntAna_Curve") Curve;
		const IntAna_Curve & Curve (const Standard_Integer N);

		/****************** HasNextCurve ******************/
		%feature("compactdefaultargs") HasNextCurve;
		%feature("autodoc", "* Returns True if the Curve I shares its last bound with another curve.
	:param I:
	:type I: int
	:rtype: bool") HasNextCurve;
		Standard_Boolean HasNextCurve (const Standard_Integer I);

		/****************** HasPreviousCurve ******************/
		%feature("compactdefaultargs") HasPreviousCurve;
		%feature("autodoc", "* Returns True if the Curve I shares its first bound with another curve.
	:param I:
	:type I: int
	:rtype: bool") HasPreviousCurve;
		Standard_Boolean HasPreviousCurve (const Standard_Integer I);

		/****************** IdenticalElements ******************/
		%feature("compactdefaultargs") IdenticalElements;
		%feature("autodoc", "* Returns True if the cylinder, the cone or the sphere is identical to the quadric.
	:rtype: bool") IdenticalElements;
		Standard_Boolean IdenticalElements ();

		/****************** IntAna_IntQuadQuad ******************/
		%feature("compactdefaultargs") IntAna_IntQuadQuad;
		%feature("autodoc", "* Empty Constructor
	:rtype: None") IntAna_IntQuadQuad;
		 IntAna_IntQuadQuad ();

		/****************** IntAna_IntQuadQuad ******************/
		%feature("compactdefaultargs") IntAna_IntQuadQuad;
		%feature("autodoc", "* Creates the intersection between a cylinder and a quadric . Tol est a definir plus precisemment.
	:param C:
	:type C: gp_Cylinder
	:param Q:
	:type Q: IntAna_Quadric
	:param Tol:
	:type Tol: float
	:rtype: None") IntAna_IntQuadQuad;
		 IntAna_IntQuadQuad (const gp_Cylinder & C,const IntAna_Quadric & Q,const Standard_Real Tol);

		/****************** IntAna_IntQuadQuad ******************/
		%feature("compactdefaultargs") IntAna_IntQuadQuad;
		%feature("autodoc", "* Creates the intersection between a cone and a quadric. Tol est a definir plus precisemment.
	:param C:
	:type C: gp_Cone
	:param Q:
	:type Q: IntAna_Quadric
	:param Tol:
	:type Tol: float
	:rtype: None") IntAna_IntQuadQuad;
		 IntAna_IntQuadQuad (const gp_Cone & C,const IntAna_Quadric & Q,const Standard_Real Tol);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns True if the computation was successful.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** NbCurve ******************/
		%feature("compactdefaultargs") NbCurve;
		%feature("autodoc", "* Returns the number of curves solution.
	:rtype: int") NbCurve;
		Standard_Integer NbCurve ();

		/****************** NbPnt ******************/
		%feature("compactdefaultargs") NbPnt;
		%feature("autodoc", "* Returns the number of contact point.
	:rtype: int") NbPnt;
		Standard_Integer NbPnt ();

		/****************** NextCurve ******************/
		%feature("compactdefaultargs") NextCurve;
		%feature("autodoc", "* If HasNextCurve(I) returns True, this function returns the Index J of the curve which has a common bound with the curve I. If theOpposite == True , then the last parameter of the curve I, and the last parameter of the curve J give the same point. Else the last parameter of the curve I and the first parameter of the curve J are the same point.
	:param I:
	:type I: int
	:param theOpposite:
	:type theOpposite: bool
	:rtype: int") NextCurve;
		Standard_Integer NextCurve (const Standard_Integer I,Standard_Boolean &OutValue);

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "* Returns the paramaters on the 'explicit quadric' (i.e the cylinder or the cone, the first argument given to the constructor) of the point of range N.
	:param N:
	:type N: int
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: None") Parameters;
		void Parameters (const Standard_Integer N,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersects a cylinder and a quadric . Tol est a definir plus precisemment.
	:param C:
	:type C: gp_Cylinder
	:param Q:
	:type Q: IntAna_Quadric
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const gp_Cylinder & C,const IntAna_Quadric & Q,const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersects a cone and a quadric. Tol est a definir plus precisemment.
	:param C:
	:type C: gp_Cone
	:param Q:
	:type Q: IntAna_Quadric
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const gp_Cone & C,const IntAna_Quadric & Q,const Standard_Real Tol);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* Returns the point of range N.
	:param N:
	:type N: int
	:rtype: gp_Pnt") Point;
		const gp_Pnt  Point (const Standard_Integer N);

		/****************** PreviousCurve ******************/
		%feature("compactdefaultargs") PreviousCurve;
		%feature("autodoc", "* if HasPreviousCurve(I) returns True, this function returns the Index J of the curve which has a common bound with the curve I. If theOpposite == True , then the first parameter of the curve I, and the first parameter of the curve J give the same point. Else the first parameter of the curve I and the last parameter of the curve J are the same point.
	:param I:
	:type I: int
	:param theOpposite:
	:type theOpposite: bool
	:rtype: int") PreviousCurve;
		Standard_Integer PreviousCurve (const Standard_Integer I,Standard_Boolean &OutValue);

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
		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "* Returns the circle solution of range Num.
	:param Num:
	:type Num: int
	:rtype: gp_Circ") Circle;
		gp_Circ Circle (const Standard_Integer Num);

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "* Returns the ellipse solution of range Num.
	:param Num:
	:type Num: int
	:rtype: gp_Elips") Ellipse;
		gp_Elips Ellipse (const Standard_Integer Num);

		/****************** HasCommonGen ******************/
		%feature("compactdefaultargs") HasCommonGen;
		%feature("autodoc", ":rtype: bool") HasCommonGen;
		Standard_Boolean HasCommonGen ();

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "* Returns the hyperbola solution of range Num.
	:param Num:
	:type Num: int
	:rtype: gp_Hypr") Hyperbola;
		gp_Hypr Hyperbola (const Standard_Integer Num);

		/****************** IntAna_QuadQuadGeo ******************/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo ();

		/****************** IntAna_QuadQuadGeo ******************/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "* Creates the intersection between two planes. TolAng is the angular tolerance used to determine if the planes are parallel. Tol is the tolerance used to determine if the planes are identical (only when they are parallel).
	:param P1:
	:type P1: gp_Pln
	:param P2:
	:type P2: gp_Pln
	:param TolAng:
	:type TolAng: float
	:param Tol:
	:type Tol: float
	:rtype: None") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Pln & P1,const gp_Pln & P2,const Standard_Real TolAng,const Standard_Real Tol);

		/****************** IntAna_QuadQuadGeo ******************/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "* Creates the intersection between a plane and a cylinder. TolAng is the angular tolerance used to determine if the axis of the cylinder is parallel to the plane. Tol is the tolerance used to determine if the result is a circle or an ellipse. If the maximum distance between the ellipse solution and the circle centered at the ellipse center is less than Tol, the result will be the circle. H is the height of the cylinder <Cyl>. It is used to check whether the plane and cylinder are parallel.
	:param P:
	:type P: gp_Pln
	:param C:
	:type C: gp_Cylinder
	:param Tolang:
	:type Tolang: float
	:param Tol:
	:type Tol: float
	:param H: default value is 0
	:type H: float
	:rtype: None") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Pln & P,const gp_Cylinder & C,const Standard_Real Tolang,const Standard_Real Tol,const Standard_Real H = 0);

		/****************** IntAna_QuadQuadGeo ******************/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "* Creates the intersection between a plane and a sphere.
	:param P:
	:type P: gp_Pln
	:param S:
	:type S: gp_Sphere
	:rtype: None") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Pln & P,const gp_Sphere & S);

		/****************** IntAna_QuadQuadGeo ******************/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "* Creates the intersection between a plane and a cone. TolAng is the angular tolerance used to determine if the axis of the cone is parallel or perpendicular to the plane, and if the generating line of the cone is parallel to the plane. Tol is the tolerance used to determine if the apex of the cone is in the plane.
	:param P:
	:type P: gp_Pln
	:param C:
	:type C: gp_Cone
	:param Tolang:
	:type Tolang: float
	:param Tol:
	:type Tol: float
	:rtype: None") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Pln & P,const gp_Cone & C,const Standard_Real Tolang,const Standard_Real Tol);

		/****************** IntAna_QuadQuadGeo ******************/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "* Creates the intersection between two cylinders.
	:param Cyl1:
	:type Cyl1: gp_Cylinder
	:param Cyl2:
	:type Cyl2: gp_Cylinder
	:param Tol:
	:type Tol: float
	:rtype: None") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Cylinder & Cyl1,const gp_Cylinder & Cyl2,const Standard_Real Tol);

		/****************** IntAna_QuadQuadGeo ******************/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "* Creates the intersection between a Cylinder and a Sphere.
	:param Cyl:
	:type Cyl: gp_Cylinder
	:param Sph:
	:type Sph: gp_Sphere
	:param Tol:
	:type Tol: float
	:rtype: None") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Cylinder & Cyl,const gp_Sphere & Sph,const Standard_Real Tol);

		/****************** IntAna_QuadQuadGeo ******************/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "* Creates the intersection between a Cylinder and a Cone
	:param Cyl:
	:type Cyl: gp_Cylinder
	:param Con:
	:type Con: gp_Cone
	:param Tol:
	:type Tol: float
	:rtype: None") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Cylinder & Cyl,const gp_Cone & Con,const Standard_Real Tol);

		/****************** IntAna_QuadQuadGeo ******************/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "* Creates the intersection between two Spheres.
	:param Sph1:
	:type Sph1: gp_Sphere
	:param Sph2:
	:type Sph2: gp_Sphere
	:param Tol:
	:type Tol: float
	:rtype: None") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Sphere & Sph1,const gp_Sphere & Sph2,const Standard_Real Tol);

		/****************** IntAna_QuadQuadGeo ******************/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "* Creates the intersection beween a Sphere and a Cone.
	:param Sph:
	:type Sph: gp_Sphere
	:param Con:
	:type Con: gp_Cone
	:param Tol:
	:type Tol: float
	:rtype: None") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Sphere & Sph,const gp_Cone & Con,const Standard_Real Tol);

		/****************** IntAna_QuadQuadGeo ******************/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "* Creates the intersection beween two cones.
	:param Con1:
	:type Con1: gp_Cone
	:param Con2:
	:type Con2: gp_Cone
	:param Tol:
	:type Tol: float
	:rtype: None") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Cone & Con1,const gp_Cone & Con2,const Standard_Real Tol);

		/****************** IntAna_QuadQuadGeo ******************/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "* Creates the intersection beween plane and torus.
	:param Pln:
	:type Pln: gp_Pln
	:param Tor:
	:type Tor: gp_Torus
	:param Tol:
	:type Tol: float
	:rtype: None") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Pln & Pln,const gp_Torus & Tor,const Standard_Real Tol);

		/****************** IntAna_QuadQuadGeo ******************/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "* Creates the intersection beween cylinder and torus.
	:param Cyl:
	:type Cyl: gp_Cylinder
	:param Tor:
	:type Tor: gp_Torus
	:param Tol:
	:type Tol: float
	:rtype: None") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Cylinder & Cyl,const gp_Torus & Tor,const Standard_Real Tol);

		/****************** IntAna_QuadQuadGeo ******************/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "* Creates the intersection beween cone and torus.
	:param Con:
	:type Con: gp_Cone
	:param Tor:
	:type Tor: gp_Torus
	:param Tol:
	:type Tol: float
	:rtype: None") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Cone & Con,const gp_Torus & Tor,const Standard_Real Tol);

		/****************** IntAna_QuadQuadGeo ******************/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "* Creates the intersection beween sphere and torus.
	:param Sph:
	:type Sph: gp_Sphere
	:param Tor:
	:type Tor: gp_Torus
	:param Tol:
	:type Tol: float
	:rtype: None") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Sphere & Sph,const gp_Torus & Tor,const Standard_Real Tol);

		/****************** IntAna_QuadQuadGeo ******************/
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "* Creates the intersection beween two toruses.
	:param Tor1:
	:type Tor1: gp_Torus
	:param Tor2:
	:type Tor2: gp_Torus
	:param Tol:
	:type Tol: float
	:rtype: None") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Torus & Tor1,const gp_Torus & Tor2,const Standard_Real Tol);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns Standard_True if the computation was successful.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "* Returns the line solution of range Num.
	:param Num:
	:type Num: int
	:rtype: gp_Lin") Line;
		gp_Lin Line (const Standard_Integer Num);

		/****************** NbSolutions ******************/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "* Returns the number of interesections. The possible intersections are : - 1 point - 1 or 2 line(s) - 1 Point and 1 Line - 1 circle - 1 ellipse - 1 parabola - 1 or 2 hyperbola(s).
	:rtype: int") NbSolutions;
		Standard_Integer NbSolutions ();

		/****************** PChar ******************/
		%feature("compactdefaultargs") PChar;
		%feature("autodoc", ":rtype: gp_Pnt") PChar;
		const gp_Pnt  PChar ();

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "* Returns the parabola solution of range Num.
	:param Num:
	:type Num: int
	:rtype: gp_Parab") Parabola;
		gp_Parab Parabola (const Standard_Integer Num);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersects two planes. TolAng is the angular tolerance used to determine if the planes are parallel. Tol is the tolerance used to determine if the planes are identical (only when they are parallel).
	:param P1:
	:type P1: gp_Pln
	:param P2:
	:type P2: gp_Pln
	:param TolAng:
	:type TolAng: float
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const gp_Pln & P1,const gp_Pln & P2,const Standard_Real TolAng,const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersects a plane and a cylinder. TolAng is the angular tolerance used to determine if the axis of the cylinder is parallel to the plane. Tol is the tolerance used to determine if the result is a circle or an ellipse. If the maximum distance between the ellipse solution and the circle centered at the ellipse center is less than Tol, the result will be the circle. H is the height of the cylinder <Cyl>. It is used to check whether the plane and cylinder are parallel.
	:param P:
	:type P: gp_Pln
	:param C:
	:type C: gp_Cylinder
	:param Tolang:
	:type Tolang: float
	:param Tol:
	:type Tol: float
	:param H: default value is 0
	:type H: float
	:rtype: None") Perform;
		void Perform (const gp_Pln & P,const gp_Cylinder & C,const Standard_Real Tolang,const Standard_Real Tol,const Standard_Real H = 0);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersects a plane and a sphere.
	:param P:
	:type P: gp_Pln
	:param S:
	:type S: gp_Sphere
	:rtype: None") Perform;
		void Perform (const gp_Pln & P,const gp_Sphere & S);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersects a plane and a cone. TolAng is the angular tolerance used to determine if the axis of the cone is parallel or perpendicular to the plane, and if the generating line of the cone is parallel to the plane. Tol is the tolerance used to determine if the apex of the cone is in the plane.
	:param P:
	:type P: gp_Pln
	:param C:
	:type C: gp_Cone
	:param Tolang:
	:type Tolang: float
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const gp_Pln & P,const gp_Cone & C,const Standard_Real Tolang,const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersects two cylinders
	:param Cyl1:
	:type Cyl1: gp_Cylinder
	:param Cyl2:
	:type Cyl2: gp_Cylinder
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const gp_Cylinder & Cyl1,const gp_Cylinder & Cyl2,const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersects a cylinder and a sphere.
	:param Cyl:
	:type Cyl: gp_Cylinder
	:param Sph:
	:type Sph: gp_Sphere
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const gp_Cylinder & Cyl,const gp_Sphere & Sph,const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersects a cylinder and a cone.
	:param Cyl:
	:type Cyl: gp_Cylinder
	:param Con:
	:type Con: gp_Cone
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const gp_Cylinder & Cyl,const gp_Cone & Con,const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersects a two spheres.
	:param Sph1:
	:type Sph1: gp_Sphere
	:param Sph2:
	:type Sph2: gp_Sphere
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const gp_Sphere & Sph1,const gp_Sphere & Sph2,const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersects a sphere and a cone.
	:param Sph:
	:type Sph: gp_Sphere
	:param Con:
	:type Con: gp_Cone
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const gp_Sphere & Sph,const gp_Cone & Con,const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersects two cones.
	:param Con1:
	:type Con1: gp_Cone
	:param Con2:
	:type Con2: gp_Cone
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const gp_Cone & Con1,const gp_Cone & Con2,const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersects plane and torus.
	:param Pln:
	:type Pln: gp_Pln
	:param Tor:
	:type Tor: gp_Torus
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const gp_Pln & Pln,const gp_Torus & Tor,const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersects cylinder and torus.
	:param Cyl:
	:type Cyl: gp_Cylinder
	:param Tor:
	:type Tor: gp_Torus
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const gp_Cylinder & Cyl,const gp_Torus & Tor,const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersects cone and torus.
	:param Con:
	:type Con: gp_Cone
	:param Tor:
	:type Tor: gp_Torus
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const gp_Cone & Con,const gp_Torus & Tor,const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersects sphere and torus.
	:param Sph:
	:type Sph: gp_Sphere
	:param Tor:
	:type Tor: gp_Torus
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const gp_Sphere & Sph,const gp_Torus & Tor,const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersects two toruses.
	:param Tor1:
	:type Tor1: gp_Torus
	:param Tor2:
	:type Tor2: gp_Torus
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const gp_Torus & Tor1,const gp_Torus & Tor2,const Standard_Real Tol);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* Returns the point solution of range Num.
	:param Num:
	:type Num: int
	:rtype: gp_Pnt") Point;
		gp_Pnt Point (const Standard_Integer Num);

		/****************** TypeInter ******************/
		%feature("compactdefaultargs") TypeInter;
		%feature("autodoc", "* Returns the type of intersection.
	:rtype: IntAna_ResultType") TypeInter;
		IntAna_ResultType TypeInter ();

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
		/****************** Coefficients ******************/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "* Returns the coefficients of the polynomial equation which define the quadric: xCXX x**2 + xCYY y**2 + xCZZ z**2 + 2 ( xCXY x y + xCXZ x z + xCYZ y z ) + 2 ( xCX x + xCY y + xCZ z ) + xCCte
	:param xCXX:
	:type xCXX: float
	:param xCYY:
	:type xCYY: float
	:param xCZZ:
	:type xCZZ: float
	:param xCXY:
	:type xCXY: float
	:param xCXZ:
	:type xCXZ: float
	:param xCYZ:
	:type xCYZ: float
	:param xCX:
	:type xCX: float
	:param xCY:
	:type xCY: float
	:param xCZ:
	:type xCZ: float
	:param xCCte:
	:type xCCte: float
	:rtype: None") Coefficients;
		void Coefficients (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** IntAna_Quadric ******************/
		%feature("compactdefaultargs") IntAna_Quadric;
		%feature("autodoc", "* Empty Constructor
	:rtype: None") IntAna_Quadric;
		 IntAna_Quadric ();

		/****************** IntAna_Quadric ******************/
		%feature("compactdefaultargs") IntAna_Quadric;
		%feature("autodoc", "* Creates a Quadric from a Pln
	:param P:
	:type P: gp_Pln
	:rtype: None") IntAna_Quadric;
		 IntAna_Quadric (const gp_Pln & P);

		/****************** IntAna_Quadric ******************/
		%feature("compactdefaultargs") IntAna_Quadric;
		%feature("autodoc", "* Creates a Quadric from a Sphere
	:param Sph:
	:type Sph: gp_Sphere
	:rtype: None") IntAna_Quadric;
		 IntAna_Quadric (const gp_Sphere & Sph);

		/****************** IntAna_Quadric ******************/
		%feature("compactdefaultargs") IntAna_Quadric;
		%feature("autodoc", "* Creates a Quadric from a Cylinder
	:param Cyl:
	:type Cyl: gp_Cylinder
	:rtype: None") IntAna_Quadric;
		 IntAna_Quadric (const gp_Cylinder & Cyl);

		/****************** IntAna_Quadric ******************/
		%feature("compactdefaultargs") IntAna_Quadric;
		%feature("autodoc", "* Creates a Quadric from a Cone
	:param Cone:
	:type Cone: gp_Cone
	:rtype: None") IntAna_Quadric;
		 IntAna_Quadric (const gp_Cone & Cone);

		/****************** NewCoefficients ******************/
		%feature("compactdefaultargs") NewCoefficients;
		%feature("autodoc", "* Returns the coefficients of the polynomial equation ( written in the natural coordinates system ) in the local coordinates system defined by Axis
	:param xCXX:
	:type xCXX: float
	:param xCYY:
	:type xCYY: float
	:param xCZZ:
	:type xCZZ: float
	:param xCXY:
	:type xCXY: float
	:param xCXZ:
	:type xCXZ: float
	:param xCYZ:
	:type xCYZ: float
	:param xCX:
	:type xCX: float
	:param xCY:
	:type xCY: float
	:param xCZ:
	:type xCZ: float
	:param xCCte:
	:type xCCte: float
	:param Axis:
	:type Axis: gp_Ax3
	:rtype: None") NewCoefficients;
		void NewCoefficients (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,const gp_Ax3 & Axis);

		/****************** SetQuadric ******************/
		%feature("compactdefaultargs") SetQuadric;
		%feature("autodoc", "* Initializes the quadric with a Pln
	:param P:
	:type P: gp_Pln
	:rtype: None") SetQuadric;
		void SetQuadric (const gp_Pln & P);

		/****************** SetQuadric ******************/
		%feature("compactdefaultargs") SetQuadric;
		%feature("autodoc", "* Initialize the quadric with a Sphere
	:param Sph:
	:type Sph: gp_Sphere
	:rtype: None") SetQuadric;
		void SetQuadric (const gp_Sphere & Sph);

		/****************** SetQuadric ******************/
		%feature("compactdefaultargs") SetQuadric;
		%feature("autodoc", "* Initializes the quadric with a Cone
	:param Con:
	:type Con: gp_Cone
	:rtype: None") SetQuadric;
		void SetQuadric (const gp_Cone & Con);

		/****************** SetQuadric ******************/
		%feature("compactdefaultargs") SetQuadric;
		%feature("autodoc", "* Initializes the quadric with a Cylinder
	:param Cyl:
	:type Cyl: gp_Cylinder
	:rtype: None") SetQuadric;
		void SetQuadric (const gp_Cylinder & Cyl);

		/****************** SpecialPoints ******************/
		%feature("compactdefaultargs") SpecialPoints;
		%feature("autodoc", "* Returns the list of special points (with singularities)
	:rtype: NCollection_List<gp_Pnt>") SpecialPoints;
		const NCollection_List<gp_Pnt>  SpecialPoints ();

};


%extend IntAna_Quadric {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
