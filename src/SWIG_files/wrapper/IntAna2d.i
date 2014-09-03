/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include IntAna2d_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor IntAna2d_AnaIntersection;
class IntAna2d_AnaIntersection {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor. IsDone returns False.") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection ();
		%feature("autodoc", "Args:
	L1(gp_Lin2d)
	L2(gp_Lin2d)

Returns:
	None

Intersection between two lines.") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection (const gp_Lin2d & L1,const gp_Lin2d & L2);
		%feature("autodoc", "Args:
	C1(gp_Circ2d)
	C2(gp_Circ2d)

Returns:
	None

Intersection between two circles.") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection (const gp_Circ2d & C1,const gp_Circ2d & C2);
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	C(gp_Circ2d)

Returns:
	None

Intersection between a line and a circle.") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection (const gp_Lin2d & L,const gp_Circ2d & C);
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	C(IntAna2d_Conic)

Returns:
	None

Intersection between a line and a conic.") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection (const gp_Lin2d & L,const IntAna2d_Conic & C);
		%feature("autodoc", "Args:
	C(gp_Circ2d)
	Co(IntAna2d_Conic)

Returns:
	None

Intersection between a circle and another conic.") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection (const gp_Circ2d & C,const IntAna2d_Conic & Co);
		%feature("autodoc", "Args:
	E(gp_Elips2d)
	C(IntAna2d_Conic)

Returns:
	None

Intersection between an ellipse and another conic.") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection (const gp_Elips2d & E,const IntAna2d_Conic & C);
		%feature("autodoc", "Args:
	P(gp_Parab2d)
	C(IntAna2d_Conic)

Returns:
	None

Intersection between a parabola and another conic.") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection (const gp_Parab2d & P,const IntAna2d_Conic & C);
		%feature("autodoc", "Args:
	H(gp_Hypr2d)
	C(IntAna2d_Conic)

Returns:
	None

Intersection between an hyperbola and another conic.") IntAna2d_AnaIntersection;
		 IntAna2d_AnaIntersection (const gp_Hypr2d & H,const IntAna2d_Conic & C);
		%feature("autodoc", "Args:
	L1(gp_Lin2d)
	L2(gp_Lin2d)

Returns:
	None

Intersection between two lines.") Perform;
		void Perform (const gp_Lin2d & L1,const gp_Lin2d & L2);
		%feature("autodoc", "Args:
	C1(gp_Circ2d)
	C2(gp_Circ2d)

Returns:
	None

Intersection between two circles.") Perform;
		void Perform (const gp_Circ2d & C1,const gp_Circ2d & C2);
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	C(gp_Circ2d)

Returns:
	None

Intersection between a line and a circle.") Perform;
		void Perform (const gp_Lin2d & L,const gp_Circ2d & C);
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	C(IntAna2d_Conic)

Returns:
	None

Intersection between a line and a conic.") Perform;
		void Perform (const gp_Lin2d & L,const IntAna2d_Conic & C);
		%feature("autodoc", "Args:
	C(gp_Circ2d)
	Co(IntAna2d_Conic)

Returns:
	None

Intersection between a circle and another conic.") Perform;
		void Perform (const gp_Circ2d & C,const IntAna2d_Conic & Co);
		%feature("autodoc", "Args:
	E(gp_Elips2d)
	C(IntAna2d_Conic)

Returns:
	None

Intersection between an ellipse and another conic.") Perform;
		void Perform (const gp_Elips2d & E,const IntAna2d_Conic & C);
		%feature("autodoc", "Args:
	P(gp_Parab2d)
	C(IntAna2d_Conic)

Returns:
	None

Intersection between a parabola and another conic.") Perform;
		void Perform (const gp_Parab2d & P,const IntAna2d_Conic & C);
		%feature("autodoc", "Args:
	H(gp_Hypr2d)
	C(IntAna2d_Conic)

Returns:
	None

Intersection between an hyperbola and another conic.") Perform;
		void Perform (const gp_Hypr2d & H,const IntAna2d_Conic & C);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE if the computation was succesfull.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE when there is no intersection, i-e  
          - no intersection point  
          - the elements are not identical.  
         The element may be parallel in this case.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

For the intersection between an element of gp and a conic  
         known by an implicit equation, the result will be TRUE  
         if the element of gp verifies the implicit equation.  
         For the intersection between two Lin2d or two Circ2d, the  
         result will be TRUE if the elements are identical.  
         The function returns FALSE in all the other cases.") IdenticalElements;
		Standard_Boolean IdenticalElements ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

For the intersection between two Lin2d or two Circ2d,  
         the function returns TRUE if the elements are parallel.  
         The function returns FALSE in all the other cases.") ParallelElements;
		Standard_Boolean ParallelElements ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns the number of IntPoint between the 2 curves.") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	IntAna2d_IntPoint

returns the intersection point of range N;  
         If (N<=0) or (N>NbPoints), an exception is raised.") Point;
		const IntAna2d_IntPoint & Point (const Standard_Integer N);
};


%feature("shadow") IntAna2d_AnaIntersection::~IntAna2d_AnaIntersection %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntAna2d_AnaIntersection {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntAna2d_Conic;
class IntAna2d_Conic {
	public:
		%feature("autodoc", "Args:
	C(gp_Circ2d)

Returns:
	None

No detailed docstring for this function.") IntAna2d_Conic;
		 IntAna2d_Conic (const gp_Circ2d & C);
		%feature("autodoc", "Args:
	C(gp_Lin2d)

Returns:
	None

No detailed docstring for this function.") IntAna2d_Conic;
		 IntAna2d_Conic (const gp_Lin2d & C);
		%feature("autodoc", "Args:
	C(gp_Parab2d)

Returns:
	None

No detailed docstring for this function.") IntAna2d_Conic;
		 IntAna2d_Conic (const gp_Parab2d & C);
		%feature("autodoc", "Args:
	C(gp_Hypr2d)

Returns:
	None

No detailed docstring for this function.") IntAna2d_Conic;
		 IntAna2d_Conic (const gp_Hypr2d & C);
		%feature("autodoc", "Args:
	C(gp_Elips2d)

Returns:
	None

No detailed docstring for this function.") IntAna2d_Conic;
		 IntAna2d_Conic (const gp_Elips2d & C);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)

Returns:
	Standard_Real

value of the function F at the point X,Y.") Value;
		Standard_Real Value (const Standard_Real X,const Standard_Real Y);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)

Returns:
	gp_XY

returns the value of the gradient of F at the point X,Y.") Grad;
		gp_XY Grad (const Standard_Real X,const Standard_Real Y);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)
	Val(Standard_Real)
	Grd(gp_XY)

Returns:
	None

Returns the value of the function and its gradient at  
         the point X,Y.") ValAndGrad;
		void ValAndGrad (const Standard_Real X,const Standard_Real Y,Standard_Real &OutValue,gp_XY & Grd);
		%feature("autodoc", "Args:
	A(Standard_Real)
	B(Standard_Real)
	C(Standard_Real)
	D(Standard_Real)
	E(Standard_Real)
	F(Standard_Real)

Returns:
	None

returns the coefficients of the polynomial equation  
         wich defines the conic:  
         A.X**2 + B.Y**2 + 2.C.X*Y + 2.D.X + 2.E.Y + F = 0.") Coefficients;
		void Coefficients (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	A(Standard_Real)
	B(Standard_Real)
	C(Standard_Real)
	D(Standard_Real)
	E(Standard_Real)
	F(Standard_Real)
	Axis(gp_Ax2d)

Returns:
	None

Returns the coefficients of the polynomial equation  
         ( written in the natural coordinates system )  
         A x x + B y y + 2 C x y + 2 D x + 2 E y + F  
         in the local coordinates system defined by Axis") NewCoefficients;
		void NewCoefficients (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,const gp_Ax2d & Axis);
};


%feature("shadow") IntAna2d_Conic::~IntAna2d_Conic %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntAna2d_Conic {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntAna2d_IntPoint;
class IntAna2d_IntPoint {
	public:
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)
	U1(Standard_Real)
	U2(Standard_Real)

Returns:
	None

Create an intersection point between 2 parametric 2d lines.  
         X,Y are the coordinate of the point. U1 is the parameter  
         on the first element, U2 the parameter on the second one.") IntAna2d_IntPoint;
		 IntAna2d_IntPoint (const Standard_Real X,const Standard_Real Y,const Standard_Real U1,const Standard_Real U2);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)
	U1(Standard_Real)

Returns:
	None

Create an intersection point between a parametric 2d line,  
         and a line given by an implicit equation (ImplicitCurve).  
         X,Y are the coordinate of the point. U1 is the parameter  
         on the parametric element.  Empty constructor. It's necessary to use one of  
         the SetValue method after this one.") IntAna2d_IntPoint;
		 IntAna2d_IntPoint (const Standard_Real X,const Standard_Real Y,const Standard_Real U1);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntAna2d_IntPoint;
		 IntAna2d_IntPoint ();
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)
	U1(Standard_Real)
	U2(Standard_Real)

Returns:
	virtual void

Set the values for a 'non-implicit' point.") SetValue;
		virtual void SetValue (const Standard_Real X,const Standard_Real Y,const Standard_Real U1,const Standard_Real U2);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)
	U1(Standard_Real)

Returns:
	virtual void

Set the values for an 'implicit' point.") SetValue;
		virtual void SetValue (const Standard_Real X,const Standard_Real Y,const Standard_Real U1);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

Returns the geometric point.") Value;
		const gp_Pnt2d & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the second curve is implicit.") SecondIsImplicit;
		Standard_Boolean SecondIsImplicit ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the parameter on the first element.") ParamOnFirst;
		Standard_Real ParamOnFirst ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the parameter on the second element.  
         If the second element is an implicit curve, an exception  
         is raised.") ParamOnSecond;
		Standard_Real ParamOnSecond ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_GetIntAna2d_IntPointmyu1;
		Standard_Real _CSFDB_GetIntAna2d_IntPointmyu1 ();
		%feature("autodoc", "Args:
	p(Standard_Real)

Returns:
	None

No detailed docstring for this function.") _CSFDB_SetIntAna2d_IntPointmyu1;
		void _CSFDB_SetIntAna2d_IntPointmyu1 (const Standard_Real p);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_GetIntAna2d_IntPointmyu2;
		Standard_Real _CSFDB_GetIntAna2d_IntPointmyu2 ();
		%feature("autodoc", "Args:
	p(Standard_Real)

Returns:
	None

No detailed docstring for this function.") _CSFDB_SetIntAna2d_IntPointmyu2;
		void _CSFDB_SetIntAna2d_IntPointmyu2 (const Standard_Real p);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

No detailed docstring for this function.") _CSFDB_GetIntAna2d_IntPointmyp;
		const gp_Pnt2d & _CSFDB_GetIntAna2d_IntPointmyp ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") _CSFDB_GetIntAna2d_IntPointmyimplicit;
		Standard_Boolean _CSFDB_GetIntAna2d_IntPointmyimplicit ();
		%feature("autodoc", "Args:
	p(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") _CSFDB_SetIntAna2d_IntPointmyimplicit;
		void _CSFDB_SetIntAna2d_IntPointmyimplicit (const Standard_Boolean p);
};


%feature("shadow") IntAna2d_IntPoint::~IntAna2d_IntPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntAna2d_IntPoint {
	void _kill_pointed() {
		delete $self;
	}
};
