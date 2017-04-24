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
%module (package="OCC") IntAna

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


%include IntAna_headers.i


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

%nodefaultctor IntAna_Curve;
class IntAna_Curve {
	public:
		%feature("compactdefaultargs") IntAna_Curve;
		%feature("autodoc", "	* Empty Constructor

	:rtype: None
") IntAna_Curve;
		 IntAna_Curve ();
		%feature("compactdefaultargs") SetCylinderQuadValues;
		%feature("autodoc", "	* Sets the parameters used to compute Points and Derivative on the curve.

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
	:rtype: None
") SetCylinderQuadValues;
		void SetCylinderQuadValues (const gp_Cylinder & Cylinder,const Standard_Real Qxx,const Standard_Real Qyy,const Standard_Real Qzz,const Standard_Real Qxy,const Standard_Real Qxz,const Standard_Real Qyz,const Standard_Real Qx,const Standard_Real Qy,const Standard_Real Qz,const Standard_Real Q1,const Standard_Real Tol,const Standard_Real DomInf,const Standard_Real DomSup,const Standard_Boolean TwoZForATheta,const Standard_Boolean ZIsPositive);
		%feature("compactdefaultargs") SetConeQuadValues;
		%feature("autodoc", "	* Sets the parameters used to compute Points and Derivative on the curve.

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
	:rtype: None
") SetConeQuadValues;
		void SetConeQuadValues (const gp_Cone & Cone,const Standard_Real Qxx,const Standard_Real Qyy,const Standard_Real Qzz,const Standard_Real Qxy,const Standard_Real Qxz,const Standard_Real Qyz,const Standard_Real Qx,const Standard_Real Qy,const Standard_Real Qz,const Standard_Real Q1,const Standard_Real Tol,const Standard_Real DomInf,const Standard_Real DomSup,const Standard_Boolean TwoZForATheta,const Standard_Boolean ZIsPositive);
		%feature("compactdefaultargs") IsOpen;
		%feature("autodoc", "	* Returns True if the curve is not infinite at the last parameter or at the first parameter of the domain.

	:rtype: bool
") IsOpen;
		Standard_Boolean IsOpen ();
		%feature("compactdefaultargs") Domain;
		%feature("autodoc", "	* Returns the paramatric domain of the curve.

	:param Theta1:
	:type Theta1: float &
	:param Theta2:
	:type Theta2: float &
	:rtype: None
") Domain;
		void Domain (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "	* Returns True if the function is constant.

	:rtype: bool
") IsConstant;
		Standard_Boolean IsConstant ();
		%feature("compactdefaultargs") IsFirstOpen;
		%feature("autodoc", "	* Returns True if the domain is open at the beginning.

	:rtype: bool
") IsFirstOpen;
		Standard_Boolean IsFirstOpen ();
		%feature("compactdefaultargs") IsLastOpen;
		%feature("autodoc", "	* Returns True if the domain is open at the end.

	:rtype: bool
") IsLastOpen;
		Standard_Boolean IsLastOpen ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the point at parameter Theta on the curve.

	:param Theta:
	:type Theta: float
	:rtype: gp_Pnt
") Value;
		gp_Pnt Value (const Standard_Real Theta);
		%feature("compactdefaultargs") D1u;
		%feature("autodoc", "	* Returns the point and the first derivative at parameter Theta on the curve.

	:param Theta:
	:type Theta: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: bool
") D1u;
		Standard_Boolean D1u (const Standard_Real Theta,gp_Pnt & P,gp_Vec & V);
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "	* Tries to find the parameter of the point P on the curve. If the method returns False, the 'projection' is impossible, and the value of Para is not significant. If the method returns True, Para is the parameter of the nearest intersection between the curve and the iso-theta containing P.

	:param P:
	:type P: gp_Pnt
	:param Para:
	:type Para: float &
	:rtype: bool
") FindParameter;
		Standard_Boolean FindParameter (const gp_Pnt & P,Standard_Real &OutValue);
		%feature("compactdefaultargs") SetIsFirstOpen;
		%feature("autodoc", "	* If flag is True, the Curve is not defined at the first parameter of its domain.

	:param Flag:
	:type Flag: bool
	:rtype: None
") SetIsFirstOpen;
		void SetIsFirstOpen (const Standard_Boolean Flag);
		%feature("compactdefaultargs") SetIsLastOpen;
		%feature("autodoc", "	* If flag is True, the Curve is not defined at the first parameter of its domain.

	:param Flag:
	:type Flag: bool
	:rtype: None
") SetIsLastOpen;
		void SetIsLastOpen (const Standard_Boolean Flag);
		%feature("compactdefaultargs") InternalUVValue;
		%feature("autodoc", "	* Protected function.

	:param Param:
	:type Param: float
	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:param A:
	:type A: float &
	:param B:
	:type B: float &
	:param C:
	:type C: float &
	:param Co:
	:type Co: float &
	:param Si:
	:type Si: float &
	:param Di:
	:type Di: float &
	:rtype: None
") InternalUVValue;
		void InternalUVValue (const Standard_Real Param,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") SetDomain;
		%feature("autodoc", "	:param Theta1:
	:type Theta1: float
	:param Theta2:
	:type Theta2: float
	:rtype: None
") SetDomain;
		void SetDomain (const Standard_Real Theta1,const Standard_Real Theta2);
};


%extend IntAna_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntAna_Int3Pln;
class IntAna_Int3Pln {
	public:
		%feature("compactdefaultargs") IntAna_Int3Pln;
		%feature("autodoc", "	:rtype: None
") IntAna_Int3Pln;
		 IntAna_Int3Pln ();
		%feature("compactdefaultargs") IntAna_Int3Pln;
		%feature("autodoc", "	* Determination of the intersection point between 3 planes.

	:param P1:
	:type P1: gp_Pln
	:param P2:
	:type P2: gp_Pln
	:param P3:
	:type P3: gp_Pln
	:rtype: None
") IntAna_Int3Pln;
		 IntAna_Int3Pln (const gp_Pln & P1,const gp_Pln & P2,const gp_Pln & P3);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Determination of the intersection point between 3 planes.

	:param P1:
	:type P1: gp_Pln
	:param P2:
	:type P2: gp_Pln
	:param P3:
	:type P3: gp_Pln
	:rtype: None
") Perform;
		void Perform (const gp_Pln & P1,const gp_Pln & P2,const gp_Pln & P3);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the computation was successful.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Returns True if there is no intersection POINT. If 2 planes are identical or parallel, IsEmpty will return True.

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the intersection point.

	:rtype: gp_Pnt
") Value;
		const gp_Pnt  Value ();
};


%extend IntAna_Int3Pln {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntAna_IntConicQuad;
class IntAna_IntConicQuad {
	public:
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad ();
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "	* Creates the intersection between a line and a quadric.

	:param L:
	:type L: gp_Lin
	:param Q:
	:type Q: IntAna_Quadric &
	:rtype: None
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad (const gp_Lin & L,const IntAna_Quadric & Q);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersects a line and a quadric.

	:param L:
	:type L: gp_Lin
	:param Q:
	:type Q: IntAna_Quadric &
	:rtype: None
") Perform;
		void Perform (const gp_Lin & L,const IntAna_Quadric & Q);
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "	* Creates the intersection between a circle and a quadric.

	:param C:
	:type C: gp_Circ
	:param Q:
	:type Q: IntAna_Quadric &
	:rtype: None
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad (const gp_Circ & C,const IntAna_Quadric & Q);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersects a circle and a quadric.

	:param C:
	:type C: gp_Circ
	:param Q:
	:type Q: IntAna_Quadric &
	:rtype: None
") Perform;
		void Perform (const gp_Circ & C,const IntAna_Quadric & Q);
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "	* Creates the intersection between an ellipse and a quadric.

	:param E:
	:type E: gp_Elips
	:param Q:
	:type Q: IntAna_Quadric &
	:rtype: None
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad (const gp_Elips & E,const IntAna_Quadric & Q);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersects an ellipse and a quadric.

	:param E:
	:type E: gp_Elips
	:param Q:
	:type Q: IntAna_Quadric &
	:rtype: None
") Perform;
		void Perform (const gp_Elips & E,const IntAna_Quadric & Q);
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "	* Creates the intersection between a parabola and a quadric.

	:param P:
	:type P: gp_Parab
	:param Q:
	:type Q: IntAna_Quadric &
	:rtype: None
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad (const gp_Parab & P,const IntAna_Quadric & Q);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersects a parabola and a quadric.

	:param P:
	:type P: gp_Parab
	:param Q:
	:type Q: IntAna_Quadric &
	:rtype: None
") Perform;
		void Perform (const gp_Parab & P,const IntAna_Quadric & Q);
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "	* Creates the intersection between an hyperbola and a quadric.

	:param H:
	:type H: gp_Hypr
	:param Q:
	:type Q: IntAna_Quadric &
	:rtype: None
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad (const gp_Hypr & H,const IntAna_Quadric & Q);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersects an hyperbola and a quadric.

	:param H:
	:type H: gp_Hypr
	:param Q:
	:type Q: IntAna_Quadric &
	:rtype: None
") Perform;
		void Perform (const gp_Hypr & H,const IntAna_Quadric & Q);
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "	* Intersection between a line and a plane. Tolang is used to determine if the angle between two vectors is null. Tol is used to check the distance between line and plane on the distance <Len> from the origin of the line.

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
	:rtype: None
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad (const gp_Lin & L,const gp_Pln & P,const Standard_Real Tolang,const Standard_Real Tol = 0,const Standard_Real Len = 0);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersects a line and a plane. Tolang is used to determine if the angle between two vectors is null. Tol is used to check the distance between line and plane on the distance <Len> from the origin of the line.

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
	:rtype: None
") Perform;
		void Perform (const gp_Lin & L,const gp_Pln & P,const Standard_Real Tolang,const Standard_Real Tol = 0,const Standard_Real Len = 0);
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "	* Intersection between a circle and a plane. Tolang is used to determine if the angle between two vectors is null. Tol is used to determine if a distance is null.

	:param C:
	:type C: gp_Circ
	:param P:
	:type P: gp_Pln
	:param Tolang:
	:type Tolang: float
	:param Tol:
	:type Tol: float
	:rtype: None
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad (const gp_Circ & C,const gp_Pln & P,const Standard_Real Tolang,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersects a circle and a plane. Tolang is used to determine if the angle between two vectors is null. Tol is used to determine if a distance is null.

	:param C:
	:type C: gp_Circ
	:param P:
	:type P: gp_Pln
	:param Tolang:
	:type Tolang: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Circ & C,const gp_Pln & P,const Standard_Real Tolang,const Standard_Real Tol);
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "	* Intersection between an ellipse and a plane. Tolang is used to determine if the angle between two vectors is null. Tol is used to determine if a distance is null.

	:param E:
	:type E: gp_Elips
	:param P:
	:type P: gp_Pln
	:param Tolang:
	:type Tolang: float
	:param Tol:
	:type Tol: float
	:rtype: None
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad (const gp_Elips & E,const gp_Pln & P,const Standard_Real Tolang,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersects an ellipse and a plane. Tolang is used to determine if the angle between two vectors is null. Tol is used to determine if a distance is null.

	:param E:
	:type E: gp_Elips
	:param P:
	:type P: gp_Pln
	:param Tolang:
	:type Tolang: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Elips & E,const gp_Pln & P,const Standard_Real Tolang,const Standard_Real Tol);
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "	* Intersection between a parabola and a plane. Tolang is used to determine if the angle between two vectors is null.

	:param Pb:
	:type Pb: gp_Parab
	:param P:
	:type P: gp_Pln
	:param Tolang:
	:type Tolang: float
	:rtype: None
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad (const gp_Parab & Pb,const gp_Pln & P,const Standard_Real Tolang);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersects a parabola and a plane. Tolang is used to determine if the angle between two vectors is null.

	:param Pb:
	:type Pb: gp_Parab
	:param P:
	:type P: gp_Pln
	:param Tolang:
	:type Tolang: float
	:rtype: None
") Perform;
		void Perform (const gp_Parab & Pb,const gp_Pln & P,const Standard_Real Tolang);
		%feature("compactdefaultargs") IntAna_IntConicQuad;
		%feature("autodoc", "	* Intersection between an hyperbola and a plane. Tolang is used to determine if the angle between two vectors is null.

	:param H:
	:type H: gp_Hypr
	:param P:
	:type P: gp_Pln
	:param Tolang:
	:type Tolang: float
	:rtype: None
") IntAna_IntConicQuad;
		 IntAna_IntConicQuad (const gp_Hypr & H,const gp_Pln & P,const Standard_Real Tolang);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersects an hyperbola and a plane. Tolang is used to determine if the angle between two vectors is null.

	:param H:
	:type H: gp_Hypr
	:param P:
	:type P: gp_Pln
	:param Tolang:
	:type Tolang: float
	:rtype: None
") Perform;
		void Perform (const gp_Hypr & H,const gp_Pln & P,const Standard_Real Tolang);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the creation completed.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsInQuadric;
		%feature("autodoc", "	* Returns True if the conic is in the quadric.

	:rtype: bool
") IsInQuadric;
		Standard_Boolean IsInQuadric ();
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns True if the line is in a quadric which is parallel to the quadric.

	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	* Returns the number of intersection point.

	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of range N.

	:param N:
	:type N: int
	:rtype: gp_Pnt
") Point;
		const gp_Pnt  Point (const Standard_Integer N);
		%feature("compactdefaultargs") ParamOnConic;
		%feature("autodoc", "	* Returns the parameter on the line of the intersection point of range N.

	:param N:
	:type N: int
	:rtype: float
") ParamOnConic;
		Standard_Real ParamOnConic (const Standard_Integer N);
};


%extend IntAna_IntConicQuad {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntAna_IntLinTorus;
class IntAna_IntLinTorus {
	public:
		%feature("compactdefaultargs") IntAna_IntLinTorus;
		%feature("autodoc", "	:rtype: None
") IntAna_IntLinTorus;
		 IntAna_IntLinTorus ();
		%feature("compactdefaultargs") IntAna_IntLinTorus;
		%feature("autodoc", "	* Creates the intersection between a line and a torus.

	:param L:
	:type L: gp_Lin
	:param T:
	:type T: gp_Torus
	:rtype: None
") IntAna_IntLinTorus;
		 IntAna_IntLinTorus (const gp_Lin & L,const gp_Torus & T);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersects a line and a torus.

	:param L:
	:type L: gp_Lin
	:param T:
	:type T: gp_Torus
	:rtype: None
") Perform;
		void Perform (const gp_Lin & L,const gp_Torus & T);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the computation was successful.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	* Returns the number of intersection points.

	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the intersection point of range Index.

	:param Index:
	:type Index: int
	:rtype: gp_Pnt
") Value;
		const gp_Pnt  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ParamOnLine;
		%feature("autodoc", "	* Returns the parameter on the line of the intersection point of range Index.

	:param Index:
	:type Index: int
	:rtype: float
") ParamOnLine;
		Standard_Real ParamOnLine (const Standard_Integer Index);
		%feature("compactdefaultargs") ParamOnTorus;
		%feature("autodoc", "	* Returns the parameters on the torus of the intersection point of range Index.

	:param Index:
	:type Index: int
	:param FI:
	:type FI: float &
	:param THETA:
	:type THETA: float &
	:rtype: None
") ParamOnTorus;
		void ParamOnTorus (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend IntAna_IntLinTorus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntAna_IntQuadQuad;
class IntAna_IntQuadQuad {
	public:
		%feature("compactdefaultargs") IntAna_IntQuadQuad;
		%feature("autodoc", "	* Empty Constructor

	:rtype: None
") IntAna_IntQuadQuad;
		 IntAna_IntQuadQuad ();
		%feature("compactdefaultargs") IntAna_IntQuadQuad;
		%feature("autodoc", "	* Creates the intersection between a cylinder and a quadric . Tol est a definir plus precisemment.

	:param C:
	:type C: gp_Cylinder
	:param Q:
	:type Q: IntAna_Quadric &
	:param Tol:
	:type Tol: float
	:rtype: None
") IntAna_IntQuadQuad;
		 IntAna_IntQuadQuad (const gp_Cylinder & C,const IntAna_Quadric & Q,const Standard_Real Tol);
		%feature("compactdefaultargs") IntAna_IntQuadQuad;
		%feature("autodoc", "	* Creates the intersection between a cone and a quadric. Tol est a definir plus precisemment.

	:param C:
	:type C: gp_Cone
	:param Q:
	:type Q: IntAna_Quadric &
	:param Tol:
	:type Tol: float
	:rtype: None
") IntAna_IntQuadQuad;
		 IntAna_IntQuadQuad (const gp_Cone & C,const IntAna_Quadric & Q,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersects a cylinder and a quadric . Tol est a definir plus precisemment.

	:param C:
	:type C: gp_Cylinder
	:param Q:
	:type Q: IntAna_Quadric &
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Cylinder & C,const IntAna_Quadric & Q,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersects a cone and a quadric. Tol est a definir plus precisemment.

	:param C:
	:type C: gp_Cone
	:param Q:
	:type Q: IntAna_Quadric &
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Cone & C,const IntAna_Quadric & Q,const Standard_Real Tol);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the computation was successful.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IdenticalElements;
		%feature("autodoc", "	* Returns True if the cylinder, the cone or the sphere is identical to the quadric.

	:rtype: bool
") IdenticalElements;
		Standard_Boolean IdenticalElements ();
		%feature("compactdefaultargs") NbCurve;
		%feature("autodoc", "	* Returns the number of curves solution.

	:rtype: int
") NbCurve;
		Standard_Integer NbCurve ();
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	* Returns the curve of range N.

	:param N:
	:type N: int
	:rtype: IntAna_Curve
") Curve;
		const IntAna_Curve & Curve (const Standard_Integer N);
		%feature("compactdefaultargs") NbPnt;
		%feature("autodoc", "	* Returns the number of contact point.

	:rtype: int
") NbPnt;
		Standard_Integer NbPnt ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of range N.

	:param N:
	:type N: int
	:rtype: gp_Pnt
") Point;
		const gp_Pnt  Point (const Standard_Integer N);
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	* Returns the paramaters on the 'explicit quadric' (i.e the cylinder or the cone, the first argument given to the constructor) of the point of range N.

	:param N:
	:type N: int
	:param U1:
	:type U1: float &
	:param U2:
	:type U2: float &
	:rtype: None
") Parameters;
		void Parameters (const Standard_Integer N,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") HasNextCurve;
		%feature("autodoc", "	* Returns True if the Curve I shares its last bound with another curve.

	:param I:
	:type I: int
	:rtype: bool
") HasNextCurve;
		Standard_Boolean HasNextCurve (const Standard_Integer I);
		%feature("compactdefaultargs") NextCurve;
		%feature("autodoc", "	* If HasNextCurve(I) returns True, this function returns the Index J of the curve which has a common bound with the curve I. If Opposite == True , then the last parameter of the curve I, and the last parameter of the curve J give the same point. Else the last parameter of the curve I and the first parameter of the curve J are the same point.

	:param I:
	:type I: int
	:param Opposite:
	:type Opposite: bool
	:rtype: int
") NextCurve;
		Standard_Integer NextCurve (const Standard_Integer I,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") HasPreviousCurve;
		%feature("autodoc", "	* Returns True if the Curve I shares its first bound with another curve.

	:param I:
	:type I: int
	:rtype: bool
") HasPreviousCurve;
		Standard_Boolean HasPreviousCurve (const Standard_Integer I);
		%feature("compactdefaultargs") PreviousCurve;
		%feature("autodoc", "	* if HasPreviousCurve(I) returns True, this function returns the Index J of the curve which has a common bound with the curve I. If Opposite == True , then the first parameter of the curve I, and the first parameter of the curve J give the same point. Else the first parameter of the curve I and the last parameter of the curve J are the same point.

	:param I:
	:type I: int
	:param Opposite:
	:type Opposite: bool
	:rtype: int
") PreviousCurve;
		Standard_Integer PreviousCurve (const Standard_Integer I,Standard_Boolean &OutValue);
};


%extend IntAna_IntQuadQuad {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntAna_ListIteratorOfListOfCurve;
class IntAna_ListIteratorOfListOfCurve {
	public:
		%feature("compactdefaultargs") IntAna_ListIteratorOfListOfCurve;
		%feature("autodoc", "	:rtype: None
") IntAna_ListIteratorOfListOfCurve;
		 IntAna_ListIteratorOfListOfCurve ();
		%feature("compactdefaultargs") IntAna_ListIteratorOfListOfCurve;
		%feature("autodoc", "	:param L:
	:type L: IntAna_ListOfCurve &
	:rtype: None
") IntAna_ListIteratorOfListOfCurve;
		 IntAna_ListIteratorOfListOfCurve (const IntAna_ListOfCurve & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: IntAna_ListOfCurve &
	:rtype: None
") Initialize;
		void Initialize (const IntAna_ListOfCurve & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: IntAna_Curve
") Value;
		IntAna_Curve & Value ();
};


%extend IntAna_ListIteratorOfListOfCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntAna_ListNodeOfListOfCurve;
class IntAna_ListNodeOfListOfCurve : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") IntAna_ListNodeOfListOfCurve;
		%feature("autodoc", "	:param I:
	:type I: IntAna_Curve &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") IntAna_ListNodeOfListOfCurve;
		 IntAna_ListNodeOfListOfCurve (const IntAna_Curve & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: IntAna_Curve
") Value;
		IntAna_Curve & Value ();
};


%extend IntAna_ListNodeOfListOfCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IntAna_ListNodeOfListOfCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IntAna_ListNodeOfListOfCurve::Handle_IntAna_ListNodeOfListOfCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IntAna_ListNodeOfListOfCurve;
class Handle_IntAna_ListNodeOfListOfCurve : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_IntAna_ListNodeOfListOfCurve();
        Handle_IntAna_ListNodeOfListOfCurve(const Handle_IntAna_ListNodeOfListOfCurve &aHandle);
        Handle_IntAna_ListNodeOfListOfCurve(const IntAna_ListNodeOfListOfCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntAna_ListNodeOfListOfCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntAna_ListNodeOfListOfCurve {
    IntAna_ListNodeOfListOfCurve* _get_reference() {
    return (IntAna_ListNodeOfListOfCurve*)$self->Access();
    }
};

%extend Handle_IntAna_ListNodeOfListOfCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IntAna_ListNodeOfListOfCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntAna_ListOfCurve;
class IntAna_ListOfCurve {
	public:
		%feature("compactdefaultargs") IntAna_ListOfCurve;
		%feature("autodoc", "	:rtype: None
") IntAna_ListOfCurve;
		 IntAna_ListOfCurve ();
		%feature("compactdefaultargs") IntAna_ListOfCurve;
		%feature("autodoc", "	:param Other:
	:type Other: IntAna_ListOfCurve &
	:rtype: None
") IntAna_ListOfCurve;
		 IntAna_ListOfCurve (const IntAna_ListOfCurve & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: IntAna_ListOfCurve &
	:rtype: None
") Assign;
		void Assign (const IntAna_ListOfCurve & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: IntAna_ListOfCurve &
	:rtype: None
") operator =;
		void operator = (const IntAna_ListOfCurve & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: IntAna_Curve &
	:rtype: None
") Prepend;
		void Prepend (const IntAna_Curve & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: IntAna_Curve &
	:param theIt:
	:type theIt: IntAna_ListIteratorOfListOfCurve &
	:rtype: None
") Prepend;
		void Prepend (const IntAna_Curve & I,IntAna_ListIteratorOfListOfCurve & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: IntAna_ListOfCurve &
	:rtype: None
") Prepend;
		void Prepend (IntAna_ListOfCurve & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: IntAna_Curve &
	:rtype: None
") Append;
		void Append (const IntAna_Curve & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: IntAna_Curve &
	:param theIt:
	:type theIt: IntAna_ListIteratorOfListOfCurve &
	:rtype: None
") Append;
		void Append (const IntAna_Curve & I,IntAna_ListIteratorOfListOfCurve & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: IntAna_ListOfCurve &
	:rtype: None
") Append;
		void Append (IntAna_ListOfCurve & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: IntAna_Curve
") First;
		IntAna_Curve & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: IntAna_Curve
") Last;
		IntAna_Curve & Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: IntAna_ListIteratorOfListOfCurve &
	:rtype: None
") Remove;
		void Remove (IntAna_ListIteratorOfListOfCurve & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: IntAna_Curve &
	:param It:
	:type It: IntAna_ListIteratorOfListOfCurve &
	:rtype: None
") InsertBefore;
		void InsertBefore (const IntAna_Curve & I,IntAna_ListIteratorOfListOfCurve & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: IntAna_ListOfCurve &
	:param It:
	:type It: IntAna_ListIteratorOfListOfCurve &
	:rtype: None
") InsertBefore;
		void InsertBefore (IntAna_ListOfCurve & Other,IntAna_ListIteratorOfListOfCurve & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: IntAna_Curve &
	:param It:
	:type It: IntAna_ListIteratorOfListOfCurve &
	:rtype: None
") InsertAfter;
		void InsertAfter (const IntAna_Curve & I,IntAna_ListIteratorOfListOfCurve & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: IntAna_ListOfCurve &
	:param It:
	:type It: IntAna_ListIteratorOfListOfCurve &
	:rtype: None
") InsertAfter;
		void InsertAfter (IntAna_ListOfCurve & Other,IntAna_ListIteratorOfListOfCurve & It);
};


%extend IntAna_ListOfCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntAna_QuadQuadGeo;
class IntAna_QuadQuadGeo {
	public:
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo ();
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "	* Creates the intersection between two planes. TolAng is the angular tolerance used to determine if the planes are parallel. Tol is the tolerance used to determine if the planes are identical (only when they are parallel).

	:param P1:
	:type P1: gp_Pln
	:param P2:
	:type P2: gp_Pln
	:param TolAng:
	:type TolAng: float
	:param Tol:
	:type Tol: float
	:rtype: None
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Pln & P1,const gp_Pln & P2,const Standard_Real TolAng,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersects two planes. TolAng is the angular tolerance used to determine if the planes are parallel. Tol is the tolerance used to determine if the planes are identical (only when they are parallel).

	:param P1:
	:type P1: gp_Pln
	:param P2:
	:type P2: gp_Pln
	:param TolAng:
	:type TolAng: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Pln & P1,const gp_Pln & P2,const Standard_Real TolAng,const Standard_Real Tol);
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "	* Creates the intersection between a plane and a cylinder. TolAng is the angular tolerance used to determine if the axis of the cylinder is parallel to the plane. Tol is the tolerance used to determine if the result is a circle or an ellipse. If the maximum distance between the ellipse solution and the circle centered at the ellipse center is less than Tol, the result will be the circle. H is the height of the cylinder <Cyl>. It is used to check whether the plane and cylinder are parallel.

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
	:rtype: None
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Pln & P,const gp_Cylinder & C,const Standard_Real Tolang,const Standard_Real Tol,const Standard_Real H = 0);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersects a plane and a cylinder. TolAng is the angular tolerance used to determine if the axis of the cylinder is parallel to the plane. Tol is the tolerance used to determine if the result is a circle or an ellipse. If the maximum distance between the ellipse solution and the circle centered at the ellipse center is less than Tol, the result will be the circle. H is the height of the cylinder <Cyl>. It is used to check whether the plane and cylinder are parallel.

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
	:rtype: None
") Perform;
		void Perform (const gp_Pln & P,const gp_Cylinder & C,const Standard_Real Tolang,const Standard_Real Tol,const Standard_Real H = 0);
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "	* Creates the intersection between a plane and a sphere.

	:param P:
	:type P: gp_Pln
	:param S:
	:type S: gp_Sphere
	:rtype: None
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Pln & P,const gp_Sphere & S);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersects a plane and a sphere.

	:param P:
	:type P: gp_Pln
	:param S:
	:type S: gp_Sphere
	:rtype: None
") Perform;
		void Perform (const gp_Pln & P,const gp_Sphere & S);
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "	* Creates the intersection between a plane and a cone. TolAng is the angular tolerance used to determine if the axis of the cone is parallel or perpendicular to the plane, and if the generating line of the cone is parallel to the plane. Tol is the tolerance used to determine if the apex of the cone is in the plane.

	:param P:
	:type P: gp_Pln
	:param C:
	:type C: gp_Cone
	:param Tolang:
	:type Tolang: float
	:param Tol:
	:type Tol: float
	:rtype: None
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Pln & P,const gp_Cone & C,const Standard_Real Tolang,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersects a plane and a cone. TolAng is the angular tolerance used to determine if the axis of the cone is parallel or perpendicular to the plane, and if the generating line of the cone is parallel to the plane. Tol is the tolerance used to determine if the apex of the cone is in the plane.

	:param P:
	:type P: gp_Pln
	:param C:
	:type C: gp_Cone
	:param Tolang:
	:type Tolang: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Pln & P,const gp_Cone & C,const Standard_Real Tolang,const Standard_Real Tol);
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "	* Creates the intersection between two cylinders.

	:param Cyl1:
	:type Cyl1: gp_Cylinder
	:param Cyl2:
	:type Cyl2: gp_Cylinder
	:param Tol:
	:type Tol: float
	:rtype: None
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Cylinder & Cyl1,const gp_Cylinder & Cyl2,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersects two cylinders

	:param Cyl1:
	:type Cyl1: gp_Cylinder
	:param Cyl2:
	:type Cyl2: gp_Cylinder
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Cylinder & Cyl1,const gp_Cylinder & Cyl2,const Standard_Real Tol);
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "	* Creates the intersection between a Cylinder and a Sphere.

	:param Cyl:
	:type Cyl: gp_Cylinder
	:param Sph:
	:type Sph: gp_Sphere
	:param Tol:
	:type Tol: float
	:rtype: None
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Cylinder & Cyl,const gp_Sphere & Sph,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersects a cylinder and a sphere.

	:param Cyl:
	:type Cyl: gp_Cylinder
	:param Sph:
	:type Sph: gp_Sphere
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Cylinder & Cyl,const gp_Sphere & Sph,const Standard_Real Tol);
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "	* Creates the intersection between a Cylinder and a Cone

	:param Cyl:
	:type Cyl: gp_Cylinder
	:param Con:
	:type Con: gp_Cone
	:param Tol:
	:type Tol: float
	:rtype: None
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Cylinder & Cyl,const gp_Cone & Con,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersects a cylinder and a cone.

	:param Cyl:
	:type Cyl: gp_Cylinder
	:param Con:
	:type Con: gp_Cone
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Cylinder & Cyl,const gp_Cone & Con,const Standard_Real Tol);
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "	* Creates the intersection between two Spheres.

	:param Sph1:
	:type Sph1: gp_Sphere
	:param Sph2:
	:type Sph2: gp_Sphere
	:param Tol:
	:type Tol: float
	:rtype: None
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Sphere & Sph1,const gp_Sphere & Sph2,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersects a two spheres.

	:param Sph1:
	:type Sph1: gp_Sphere
	:param Sph2:
	:type Sph2: gp_Sphere
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Sphere & Sph1,const gp_Sphere & Sph2,const Standard_Real Tol);
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "	* Creates the intersection beween a Sphere and a Cone.

	:param Sph:
	:type Sph: gp_Sphere
	:param Con:
	:type Con: gp_Cone
	:param Tol:
	:type Tol: float
	:rtype: None
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Sphere & Sph,const gp_Cone & Con,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersects a sphere and a cone.

	:param Sph:
	:type Sph: gp_Sphere
	:param Con:
	:type Con: gp_Cone
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Sphere & Sph,const gp_Cone & Con,const Standard_Real Tol);
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "	* Creates the intersection beween two cones.

	:param Con1:
	:type Con1: gp_Cone
	:param Con2:
	:type Con2: gp_Cone
	:param Tol:
	:type Tol: float
	:rtype: None
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Cone & Con1,const gp_Cone & Con2,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersects two cones.

	:param Con1:
	:type Con1: gp_Cone
	:param Con2:
	:type Con2: gp_Cone
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Cone & Con1,const gp_Cone & Con2,const Standard_Real Tol);
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "	* Creates the intersection beween plane and torus.

	:param Pln:
	:type Pln: gp_Pln
	:param Tor:
	:type Tor: gp_Torus
	:param Tol:
	:type Tol: float
	:rtype: None
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Pln & Pln,const gp_Torus & Tor,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersects plane and torus.

	:param Pln:
	:type Pln: gp_Pln
	:param Tor:
	:type Tor: gp_Torus
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Pln & Pln,const gp_Torus & Tor,const Standard_Real Tol);
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "	* Creates the intersection beween cylinder and torus.

	:param Cyl:
	:type Cyl: gp_Cylinder
	:param Tor:
	:type Tor: gp_Torus
	:param Tol:
	:type Tol: float
	:rtype: None
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Cylinder & Cyl,const gp_Torus & Tor,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersects cylinder and torus.

	:param Cyl:
	:type Cyl: gp_Cylinder
	:param Tor:
	:type Tor: gp_Torus
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Cylinder & Cyl,const gp_Torus & Tor,const Standard_Real Tol);
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "	* Creates the intersection beween cone and torus.

	:param Con:
	:type Con: gp_Cone
	:param Tor:
	:type Tor: gp_Torus
	:param Tol:
	:type Tol: float
	:rtype: None
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Cone & Con,const gp_Torus & Tor,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersects cone and torus.

	:param Con:
	:type Con: gp_Cone
	:param Tor:
	:type Tor: gp_Torus
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Cone & Con,const gp_Torus & Tor,const Standard_Real Tol);
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "	* Creates the intersection beween sphere and torus.

	:param Sph:
	:type Sph: gp_Sphere
	:param Tor:
	:type Tor: gp_Torus
	:param Tol:
	:type Tol: float
	:rtype: None
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Sphere & Sph,const gp_Torus & Tor,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersects sphere and torus.

	:param Sph:
	:type Sph: gp_Sphere
	:param Tor:
	:type Tor: gp_Torus
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Sphere & Sph,const gp_Torus & Tor,const Standard_Real Tol);
		%feature("compactdefaultargs") IntAna_QuadQuadGeo;
		%feature("autodoc", "	* Creates the intersection beween two toruses.

	:param Tor1:
	:type Tor1: gp_Torus
	:param Tor2:
	:type Tor2: gp_Torus
	:param Tol:
	:type Tol: float
	:rtype: None
") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Torus & Tor1,const gp_Torus & Tor2,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersects two toruses.

	:param Tor1:
	:type Tor1: gp_Torus
	:param Tor2:
	:type Tor2: gp_Torus
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Torus & Tor1,const gp_Torus & Tor2,const Standard_Real Tol);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns Standard_True if the computation was successful.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") TypeInter;
		%feature("autodoc", "	* Returns the type of intersection.

	:rtype: IntAna_ResultType
") TypeInter;
		IntAna_ResultType TypeInter ();
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "	* Returns the number of interesections. The possible intersections are : - 1 point - 1 or 2 line(s) - 1 Point and 1 Line - 1 circle - 1 ellipse - 1 parabola - 1 or 2 hyperbola(s).

	:rtype: int
") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point solution of range Num.

	:param Num:
	:type Num: int
	:rtype: gp_Pnt
") Point;
		gp_Pnt Point (const Standard_Integer Num);
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	* Returns the line solution of range Num.

	:param Num:
	:type Num: int
	:rtype: gp_Lin
") Line;
		gp_Lin Line (const Standard_Integer Num);
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	* Returns the circle solution of range Num.

	:param Num:
	:type Num: int
	:rtype: gp_Circ
") Circle;
		gp_Circ Circle (const Standard_Integer Num);
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "	* Returns the ellipse solution of range Num.

	:param Num:
	:type Num: int
	:rtype: gp_Elips
") Ellipse;
		gp_Elips Ellipse (const Standard_Integer Num);
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "	* Returns the parabola solution of range Num.

	:param Num:
	:type Num: int
	:rtype: gp_Parab
") Parabola;
		gp_Parab Parabola (const Standard_Integer Num);
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "	* Returns the hyperbola solution of range Num.

	:param Num:
	:type Num: int
	:rtype: gp_Hypr
") Hyperbola;
		gp_Hypr Hyperbola (const Standard_Integer Num);
		%feature("compactdefaultargs") HasCommonGen;
		%feature("autodoc", "	:rtype: bool
") HasCommonGen;
		Standard_Boolean HasCommonGen ();
		%feature("compactdefaultargs") PChar;
		%feature("autodoc", "	:rtype: gp_Pnt
") PChar;
		const gp_Pnt  PChar ();
};


%extend IntAna_QuadQuadGeo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntAna_Quadric;
class IntAna_Quadric {
	public:
		%feature("compactdefaultargs") IntAna_Quadric;
		%feature("autodoc", "	* Empty Constructor

	:rtype: None
") IntAna_Quadric;
		 IntAna_Quadric ();
		%feature("compactdefaultargs") IntAna_Quadric;
		%feature("autodoc", "	* Creates a Quadric from a Pln

	:param P:
	:type P: gp_Pln
	:rtype: None
") IntAna_Quadric;
		 IntAna_Quadric (const gp_Pln & P);
		%feature("compactdefaultargs") IntAna_Quadric;
		%feature("autodoc", "	* Creates a Quadric from a Sphere

	:param Sph:
	:type Sph: gp_Sphere
	:rtype: None
") IntAna_Quadric;
		 IntAna_Quadric (const gp_Sphere & Sph);
		%feature("compactdefaultargs") IntAna_Quadric;
		%feature("autodoc", "	* Creates a Quadric from a Cylinder

	:param Cyl:
	:type Cyl: gp_Cylinder
	:rtype: None
") IntAna_Quadric;
		 IntAna_Quadric (const gp_Cylinder & Cyl);
		%feature("compactdefaultargs") IntAna_Quadric;
		%feature("autodoc", "	* Creates a Quadric from a Cone

	:param Cone:
	:type Cone: gp_Cone
	:rtype: None
") IntAna_Quadric;
		 IntAna_Quadric (const gp_Cone & Cone);
		%feature("compactdefaultargs") SetQuadric;
		%feature("autodoc", "	* Initializes the quadric with a Pln

	:param P:
	:type P: gp_Pln
	:rtype: None
") SetQuadric;
		void SetQuadric (const gp_Pln & P);
		%feature("compactdefaultargs") SetQuadric;
		%feature("autodoc", "	* Initialize the quadric with a Sphere

	:param Sph:
	:type Sph: gp_Sphere
	:rtype: None
") SetQuadric;
		void SetQuadric (const gp_Sphere & Sph);
		%feature("compactdefaultargs") SetQuadric;
		%feature("autodoc", "	* Initializes the quadric with a Cone

	:param Con:
	:type Con: gp_Cone
	:rtype: None
") SetQuadric;
		void SetQuadric (const gp_Cone & Con);
		%feature("compactdefaultargs") SetQuadric;
		%feature("autodoc", "	* Initializes the quadric with a Cylinder

	:param Cyl:
	:type Cyl: gp_Cylinder
	:rtype: None
") SetQuadric;
		void SetQuadric (const gp_Cylinder & Cyl);
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "	* Returns the coefficients of the polynomial equation which define the quadric: xCXX x**2 + xCYY y**2 + xCZZ z**2 + 2 ( xCXY x y + xCXZ x z + xCYZ y z ) + 2 ( xCX x + xCY y + xCZ z ) + xCCte

	:param xCXX:
	:type xCXX: float &
	:param xCYY:
	:type xCYY: float &
	:param xCZZ:
	:type xCZZ: float &
	:param xCXY:
	:type xCXY: float &
	:param xCXZ:
	:type xCXZ: float &
	:param xCYZ:
	:type xCYZ: float &
	:param xCX:
	:type xCX: float &
	:param xCY:
	:type xCY: float &
	:param xCZ:
	:type xCZ: float &
	:param xCCte:
	:type xCCte: float &
	:rtype: None
") Coefficients;
		void Coefficients (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") NewCoefficients;
		%feature("autodoc", "	* Returns the coefficients of the polynomial equation ( written in the natural coordinates system ) in the local coordinates system defined by Axis

	:param xCXX:
	:type xCXX: float &
	:param xCYY:
	:type xCYY: float &
	:param xCZZ:
	:type xCZZ: float &
	:param xCXY:
	:type xCXY: float &
	:param xCXZ:
	:type xCXZ: float &
	:param xCYZ:
	:type xCYZ: float &
	:param xCX:
	:type xCX: float &
	:param xCY:
	:type xCY: float &
	:param xCZ:
	:type xCZ: float &
	:param xCCte:
	:type xCCte: float &
	:param Axis:
	:type Axis: gp_Ax3
	:rtype: None
") NewCoefficients;
		void NewCoefficients (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,const gp_Ax3 & Axis);
};


%extend IntAna_Quadric {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
