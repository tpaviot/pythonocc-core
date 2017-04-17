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
%module (package="OCC") IntAna2d

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


%include IntAna2d_headers.i


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

%nodefaultctor IntAna2d_AnaIntersection;
class IntAna2d_AnaIntersection {
	public:
		%feature("compactdefaultargs") IntAna2d_AnaIntersection;
		%feature("autodoc", "	* Empty constructor. IsDone returns False.

	:rtype: None
") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection ();
		%feature("compactdefaultargs") IntAna2d_AnaIntersection;
		%feature("autodoc", "	* Intersection between two lines.

	:param L1:
	:type L1: gp_Lin2d
	:param L2:
	:type L2: gp_Lin2d
	:rtype: None
") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection (const gp_Lin2d & L1,const gp_Lin2d & L2);
		%feature("compactdefaultargs") IntAna2d_AnaIntersection;
		%feature("autodoc", "	* Intersection between two circles.

	:param C1:
	:type C1: gp_Circ2d
	:param C2:
	:type C2: gp_Circ2d
	:rtype: None
") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection (const gp_Circ2d & C1,const gp_Circ2d & C2);
		%feature("compactdefaultargs") IntAna2d_AnaIntersection;
		%feature("autodoc", "	* Intersection between a line and a circle.

	:param L:
	:type L: gp_Lin2d
	:param C:
	:type C: gp_Circ2d
	:rtype: None
") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection (const gp_Lin2d & L,const gp_Circ2d & C);
		%feature("compactdefaultargs") IntAna2d_AnaIntersection;
		%feature("autodoc", "	* Intersection between a line and a conic.

	:param L:
	:type L: gp_Lin2d
	:param C:
	:type C: IntAna2d_Conic &
	:rtype: None
") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection (const gp_Lin2d & L,const IntAna2d_Conic & C);
		%feature("compactdefaultargs") IntAna2d_AnaIntersection;
		%feature("autodoc", "	* Intersection between a circle and another conic.

	:param C:
	:type C: gp_Circ2d
	:param Co:
	:type Co: IntAna2d_Conic &
	:rtype: None
") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection (const gp_Circ2d & C,const IntAna2d_Conic & Co);
		%feature("compactdefaultargs") IntAna2d_AnaIntersection;
		%feature("autodoc", "	* Intersection between an ellipse and another conic.

	:param E:
	:type E: gp_Elips2d
	:param C:
	:type C: IntAna2d_Conic &
	:rtype: None
") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection (const gp_Elips2d & E,const IntAna2d_Conic & C);
		%feature("compactdefaultargs") IntAna2d_AnaIntersection;
		%feature("autodoc", "	* Intersection between a parabola and another conic.

	:param P:
	:type P: gp_Parab2d
	:param C:
	:type C: IntAna2d_Conic &
	:rtype: None
") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection (const gp_Parab2d & P,const IntAna2d_Conic & C);
		%feature("compactdefaultargs") IntAna2d_AnaIntersection;
		%feature("autodoc", "	* Intersection between an hyperbola and another conic.

	:param H:
	:type H: gp_Hypr2d
	:param C:
	:type C: IntAna2d_Conic &
	:rtype: None
") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection (const gp_Hypr2d & H,const IntAna2d_Conic & C);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between two lines.

	:param L1:
	:type L1: gp_Lin2d
	:param L2:
	:type L2: gp_Lin2d
	:rtype: None
") Perform;
		void Perform (const gp_Lin2d & L1,const gp_Lin2d & L2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between two circles.

	:param C1:
	:type C1: gp_Circ2d
	:param C2:
	:type C2: gp_Circ2d
	:rtype: None
") Perform;
		void Perform (const gp_Circ2d & C1,const gp_Circ2d & C2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between a line and a circle.

	:param L:
	:type L: gp_Lin2d
	:param C:
	:type C: gp_Circ2d
	:rtype: None
") Perform;
		void Perform (const gp_Lin2d & L,const gp_Circ2d & C);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between a line and a conic.

	:param L:
	:type L: gp_Lin2d
	:param C:
	:type C: IntAna2d_Conic &
	:rtype: None
") Perform;
		void Perform (const gp_Lin2d & L,const IntAna2d_Conic & C);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between a circle and another conic.

	:param C:
	:type C: gp_Circ2d
	:param Co:
	:type Co: IntAna2d_Conic &
	:rtype: None
") Perform;
		void Perform (const gp_Circ2d & C,const IntAna2d_Conic & Co);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between an ellipse and another conic.

	:param E:
	:type E: gp_Elips2d
	:param C:
	:type C: IntAna2d_Conic &
	:rtype: None
") Perform;
		void Perform (const gp_Elips2d & E,const IntAna2d_Conic & C);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between a parabola and another conic.

	:param P:
	:type P: gp_Parab2d
	:param C:
	:type C: IntAna2d_Conic &
	:rtype: None
") Perform;
		void Perform (const gp_Parab2d & P,const IntAna2d_Conic & C);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between an hyperbola and another conic.

	:param H:
	:type H: gp_Hypr2d
	:param C:
	:type C: IntAna2d_Conic &
	:rtype: None
") Perform;
		void Perform (const gp_Hypr2d & H,const IntAna2d_Conic & C);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the computation was succesfull.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Returns True when there is no intersection, i-e - no intersection point - the elements are not identical. The element may be parallel in this case.

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") IdenticalElements;
		%feature("autodoc", "	* For the intersection between an element of gp and a conic known by an implicit equation, the result will be True if the element of gp verifies the implicit equation. For the intersection between two Lin2d or two Circ2d, the result will be True if the elements are identical. The function returns False in all the other cases.

	:rtype: bool
") IdenticalElements;
		Standard_Boolean IdenticalElements ();
		%feature("compactdefaultargs") ParallelElements;
		%feature("autodoc", "	* For the intersection between two Lin2d or two Circ2d, the function returns True if the elements are parallel. The function returns False in all the other cases.

	:rtype: bool
") ParallelElements;
		Standard_Boolean ParallelElements ();
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	* returns the number of IntPoint between the 2 curves.

	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* returns the intersection point of range N; If (N<=0) or (N>NbPoints), an exception is raised.

	:param N:
	:type N: int
	:rtype: IntAna2d_IntPoint
") Point;
		const IntAna2d_IntPoint & Point (const Standard_Integer N);
};


%extend IntAna2d_AnaIntersection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntAna2d_Conic;
class IntAna2d_Conic {
	public:
		%feature("compactdefaultargs") IntAna2d_Conic;
		%feature("autodoc", "	:param C:
	:type C: gp_Circ2d
	:rtype: None
") IntAna2d_Conic;
		 IntAna2d_Conic (const gp_Circ2d & C);
		%feature("compactdefaultargs") IntAna2d_Conic;
		%feature("autodoc", "	:param C:
	:type C: gp_Lin2d
	:rtype: None
") IntAna2d_Conic;
		 IntAna2d_Conic (const gp_Lin2d & C);
		%feature("compactdefaultargs") IntAna2d_Conic;
		%feature("autodoc", "	:param C:
	:type C: gp_Parab2d
	:rtype: None
") IntAna2d_Conic;
		 IntAna2d_Conic (const gp_Parab2d & C);
		%feature("compactdefaultargs") IntAna2d_Conic;
		%feature("autodoc", "	:param C:
	:type C: gp_Hypr2d
	:rtype: None
") IntAna2d_Conic;
		 IntAna2d_Conic (const gp_Hypr2d & C);
		%feature("compactdefaultargs") IntAna2d_Conic;
		%feature("autodoc", "	:param C:
	:type C: gp_Elips2d
	:rtype: None
") IntAna2d_Conic;
		 IntAna2d_Conic (const gp_Elips2d & C);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* value of the function F at the point X,Y.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:rtype: float
") Value;
		Standard_Real Value (const Standard_Real X,const Standard_Real Y);
		%feature("compactdefaultargs") Grad;
		%feature("autodoc", "	* returns the value of the gradient of F at the point X,Y.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:rtype: gp_XY
") Grad;
		gp_XY Grad (const Standard_Real X,const Standard_Real Y);
		%feature("compactdefaultargs") ValAndGrad;
		%feature("autodoc", "	* Returns the value of the function and its gradient at the point X,Y.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Val:
	:type Val: float &
	:param Grd:
	:type Grd: gp_XY
	:rtype: None
") ValAndGrad;
		void ValAndGrad (const Standard_Real X,const Standard_Real Y,Standard_Real &OutValue,gp_XY & Grd);
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "	* returns the coefficients of the polynomial equation wich defines the conic: A.X**2 + B.Y**2 + 2.C.X*Y + 2.D.X + 2.E.Y + F = 0.

	:param A:
	:type A: float &
	:param B:
	:type B: float &
	:param C:
	:type C: float &
	:param D:
	:type D: float &
	:param E:
	:type E: float &
	:param F:
	:type F: float &
	:rtype: None
") Coefficients;
		void Coefficients (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") NewCoefficients;
		%feature("autodoc", "	* Returns the coefficients of the polynomial equation ( written in the natural coordinates system ) A x x + B y y + 2 C x y + 2 D x + 2 E y + F in the local coordinates system defined by Axis

	:param A:
	:type A: float &
	:param B:
	:type B: float &
	:param C:
	:type C: float &
	:param D:
	:type D: float &
	:param E:
	:type E: float &
	:param F:
	:type F: float &
	:param Axis:
	:type Axis: gp_Ax2d
	:rtype: None
") NewCoefficients;
		void NewCoefficients (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,const gp_Ax2d & Axis);
};


%extend IntAna2d_Conic {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntAna2d_IntPoint;
class IntAna2d_IntPoint {
	public:
		%feature("compactdefaultargs") IntAna2d_IntPoint;
		%feature("autodoc", "	* Create an intersection point between 2 parametric 2d lines. X,Y are the coordinate of the point. U1 is the parameter on the first element, U2 the parameter on the second one.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: None
") IntAna2d_IntPoint;
		 IntAna2d_IntPoint (const Standard_Real X,const Standard_Real Y,const Standard_Real U1,const Standard_Real U2);
		%feature("compactdefaultargs") IntAna2d_IntPoint;
		%feature("autodoc", "	* Create an intersection point between a parametric 2d line, and a line given by an implicit equation (ImplicitCurve). X,Y are the coordinate of the point. U1 is the parameter on the parametric element. Empty constructor. It's necessary to use one of the SetValue method after this one.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param U1:
	:type U1: float
	:rtype: None
") IntAna2d_IntPoint;
		 IntAna2d_IntPoint (const Standard_Real X,const Standard_Real Y,const Standard_Real U1);
		%feature("compactdefaultargs") IntAna2d_IntPoint;
		%feature("autodoc", "	:rtype: None
") IntAna2d_IntPoint;
		 IntAna2d_IntPoint ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Set the values for a 'non-implicit' point.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: void
") SetValue;
		virtual void SetValue (const Standard_Real X,const Standard_Real Y,const Standard_Real U1,const Standard_Real U2);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Set the values for an 'implicit' point.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param U1:
	:type U1: float
	:rtype: void
") SetValue;
		virtual void SetValue (const Standard_Real X,const Standard_Real Y,const Standard_Real U1);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the geometric point.

	:rtype: gp_Pnt2d
") Value;
		const gp_Pnt2d  Value ();
		%feature("compactdefaultargs") SecondIsImplicit;
		%feature("autodoc", "	* Returns True if the second curve is implicit.

	:rtype: bool
") SecondIsImplicit;
		Standard_Boolean SecondIsImplicit ();
		%feature("compactdefaultargs") ParamOnFirst;
		%feature("autodoc", "	* Returns the parameter on the first element.

	:rtype: float
") ParamOnFirst;
		Standard_Real ParamOnFirst ();
		%feature("compactdefaultargs") ParamOnSecond;
		%feature("autodoc", "	* Returns the parameter on the second element. If the second element is an implicit curve, an exception is raised.

	:rtype: float
") ParamOnSecond;
		Standard_Real ParamOnSecond ();
		%feature("compactdefaultargs") _CSFDB_GetIntAna2d_IntPointmyu1;
		%feature("autodoc", "	:rtype: float
") _CSFDB_GetIntAna2d_IntPointmyu1;
		Standard_Real _CSFDB_GetIntAna2d_IntPointmyu1 ();
		%feature("compactdefaultargs") _CSFDB_SetIntAna2d_IntPointmyu1;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_SetIntAna2d_IntPointmyu1;
		void _CSFDB_SetIntAna2d_IntPointmyu1 (const Standard_Real p);
		%feature("compactdefaultargs") _CSFDB_GetIntAna2d_IntPointmyu2;
		%feature("autodoc", "	:rtype: float
") _CSFDB_GetIntAna2d_IntPointmyu2;
		Standard_Real _CSFDB_GetIntAna2d_IntPointmyu2 ();
		%feature("compactdefaultargs") _CSFDB_SetIntAna2d_IntPointmyu2;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_SetIntAna2d_IntPointmyu2;
		void _CSFDB_SetIntAna2d_IntPointmyu2 (const Standard_Real p);
		%feature("compactdefaultargs") _CSFDB_GetIntAna2d_IntPointmyp;
		%feature("autodoc", "	:rtype: gp_Pnt2d
") _CSFDB_GetIntAna2d_IntPointmyp;
		const gp_Pnt2d  _CSFDB_GetIntAna2d_IntPointmyp ();
		%feature("compactdefaultargs") _CSFDB_GetIntAna2d_IntPointmyimplicit;
		%feature("autodoc", "	:rtype: bool
") _CSFDB_GetIntAna2d_IntPointmyimplicit;
		Standard_Boolean _CSFDB_GetIntAna2d_IntPointmyimplicit ();
		%feature("compactdefaultargs") _CSFDB_SetIntAna2d_IntPointmyimplicit;
		%feature("autodoc", "	:param p:
	:type p: bool
	:rtype: None
") _CSFDB_SetIntAna2d_IntPointmyimplicit;
		void _CSFDB_SetIntAna2d_IntPointmyimplicit (const Standard_Boolean p);
};


%extend IntAna2d_IntPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
