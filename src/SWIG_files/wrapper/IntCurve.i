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
%module (package="OCC") IntCurve

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

%include IntCurve_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor IntCurve_IConicTool;
class IntCurve_IConicTool {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntCurve_IConicTool;
		 IntCurve_IConicTool ();
		%feature("autodoc", "Args:
	IT(IntCurve_IConicTool)

Returns:
	None

No detailed docstring for this function.") IntCurve_IConicTool;
		 IntCurve_IConicTool (const IntCurve_IConicTool & IT);
		%feature("autodoc", "Args:
	E(gp_Elips2d)

Returns:
	None

No detailed docstring for this function.") IntCurve_IConicTool;
		 IntCurve_IConicTool (const gp_Elips2d & E);
		%feature("autodoc", "Args:
	L(gp_Lin2d)

Returns:
	None

No detailed docstring for this function.") IntCurve_IConicTool;
		 IntCurve_IConicTool (const gp_Lin2d & L);
		%feature("autodoc", "Args:
	C(gp_Circ2d)

Returns:
	None

No detailed docstring for this function.") IntCurve_IConicTool;
		 IntCurve_IConicTool (const gp_Circ2d & C);
		%feature("autodoc", "Args:
	P(gp_Parab2d)

Returns:
	None

No detailed docstring for this function.") IntCurve_IConicTool;
		 IntCurve_IConicTool (const gp_Parab2d & P);
		%feature("autodoc", "Args:
	H(gp_Hypr2d)

Returns:
	None

No detailed docstring for this function.") IntCurve_IConicTool;
		 IntCurve_IConicTool (const gp_Hypr2d & H);
		%feature("autodoc", "Args:
	X(Standard_Real)

Returns:
	gp_Pnt2d

No detailed docstring for this function.") Value;
		gp_Pnt2d Value (const Standard_Real X);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt2d)
	T(gp_Vec2d)

Returns:
	None

No detailed docstring for this function.") D1;
		void D1 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & T);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt2d)
	T(gp_Vec2d)
	N(gp_Vec2d)

Returns:
	None

No detailed docstring for this function.") D2;
		void D2 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & T,gp_Vec2d & N);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	Standard_Real

Computes the value of the signed  distance between  
         the point P and the implicit curve.") Distance;
		Standard_Real Distance (const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	gp_Vec2d

Computes  the   Gradient  of  the  Signed Distance  
         between  a  point and  the  implicit curve, at the  
         point P.") GradDistance;
		gp_Vec2d GradDistance (const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	Standard_Real

Returns the   parameter  U of   the point  on  the  
         implicit curve corresponding to  the point P.  The  
         correspondance between P and the point P(U) on the  
         implicit curve must be coherent  with the  way  of  
         determination of the signed distance.") FindParameter;
		Standard_Real FindParameter (const gp_Pnt2d & P);
};


%feature("shadow") IntCurve_IConicTool::~IntCurve_IConicTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntCurve_IConicTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntCurve_IntConicConic;
class IntCurve_IntConicConic : public IntRes2d_Intersection {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty Constructor") IntCurve_IntConicConic;
		 IntCurve_IntConicConic ();
		%feature("autodoc", "Args:
	L1(gp_Lin2d)
	D1(IntRes2d_Domain)
	L2(gp_Lin2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersection between 2 lines from gp.") IntCurve_IntConicConic;
		 IntCurve_IntConicConic (const gp_Lin2d & L1,const IntRes2d_Domain & D1,const gp_Lin2d & L2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	L1(gp_Lin2d)
	D1(IntRes2d_Domain)
	L2(gp_Lin2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersection between 2 lines from gp.") Perform;
		void Perform (const gp_Lin2d & L1,const IntRes2d_Domain & D1,const gp_Lin2d & L2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	DL(IntRes2d_Domain)
	C(gp_Circ2d)
	DC(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersection between a line and a circle.  
         The exception ConstructionError is raised if the method  
         IsClosed of the domain of the circle returns False.") IntCurve_IntConicConic;
		 IntCurve_IntConicConic (const gp_Lin2d & L,const IntRes2d_Domain & DL,const gp_Circ2d & C,const IntRes2d_Domain & DC,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	DL(IntRes2d_Domain)
	C(gp_Circ2d)
	DC(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersection between a line and a circle.  
         The exception ConstructionError is raised if the method  
         IsClosed of the domain of the circle returns False.") Perform;
		void Perform (const gp_Lin2d & L,const IntRes2d_Domain & DL,const gp_Circ2d & C,const IntRes2d_Domain & DC,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	DL(IntRes2d_Domain)
	E(gp_Elips2d)
	DE(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersection between a line and an ellipse.  
         The exception ConstructionError is raised if the method  
         IsClosed of the domain of the ellipse returns False.") IntCurve_IntConicConic;
		 IntCurve_IntConicConic (const gp_Lin2d & L,const IntRes2d_Domain & DL,const gp_Elips2d & E,const IntRes2d_Domain & DE,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	DL(IntRes2d_Domain)
	E(gp_Elips2d)
	DE(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersection between a line and an ellipse.  
         The exception ConstructionError is raised if the method  
         IsClosed of the domain of the ellipse returns False.") Perform;
		void Perform (const gp_Lin2d & L,const IntRes2d_Domain & DL,const gp_Elips2d & E,const IntRes2d_Domain & DE,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	DL(IntRes2d_Domain)
	P(gp_Parab2d)
	DP(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersection between a line and a parabola from gp.") IntCurve_IntConicConic;
		 IntCurve_IntConicConic (const gp_Lin2d & L,const IntRes2d_Domain & DL,const gp_Parab2d & P,const IntRes2d_Domain & DP,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	DL(IntRes2d_Domain)
	P(gp_Parab2d)
	DP(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersection between a line and a parabola from gp.") Perform;
		void Perform (const gp_Lin2d & L,const IntRes2d_Domain & DL,const gp_Parab2d & P,const IntRes2d_Domain & DP,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	DL(IntRes2d_Domain)
	H(gp_Hypr2d)
	DH(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersection between a line and an hyperbola.") IntCurve_IntConicConic;
		 IntCurve_IntConicConic (const gp_Lin2d & L,const IntRes2d_Domain & DL,const gp_Hypr2d & H,const IntRes2d_Domain & DH,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	DL(IntRes2d_Domain)
	H(gp_Hypr2d)
	DH(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersection between a line and an hyperbola.") Perform;
		void Perform (const gp_Lin2d & L,const IntRes2d_Domain & DL,const gp_Hypr2d & H,const IntRes2d_Domain & DH,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C1(gp_Circ2d)
	D1(IntRes2d_Domain)
	C2(gp_Circ2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersection between 2 circles from gp.  
         The exception ConstructionError is raised if the method  
         IsClosed of one of the domain returns False.") IntCurve_IntConicConic;
		 IntCurve_IntConicConic (const gp_Circ2d & C1,const IntRes2d_Domain & D1,const gp_Circ2d & C2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C1(gp_Circ2d)
	D1(IntRes2d_Domain)
	C2(gp_Circ2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersection between 2 circles from gp.  
         The exception ConstructionError is raised if the method  
         IsClosed of the domain of one of the circle returns False.") Perform;
		void Perform (const gp_Circ2d & C1,const IntRes2d_Domain & D1,const gp_Circ2d & C2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(gp_Circ2d)
	DC(IntRes2d_Domain)
	E(gp_Elips2d)
	DE(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersection between a circle and an ellipse.  
         The exception ConstructionError is raised if the method  
         IsClosed of one the domain returns False.") IntCurve_IntConicConic;
		 IntCurve_IntConicConic (const gp_Circ2d & C,const IntRes2d_Domain & DC,const gp_Elips2d & E,const IntRes2d_Domain & DE,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(gp_Circ2d)
	DC(IntRes2d_Domain)
	E(gp_Elips2d)
	DE(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersection between a circle and an ellipse.  
         The exception ConstructionError is raised if the method  
         IsClosed of one the domain returns False.") Perform;
		void Perform (const gp_Circ2d & C,const IntRes2d_Domain & DC,const gp_Elips2d & E,const IntRes2d_Domain & DE,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(gp_Circ2d)
	DC(IntRes2d_Domain)
	P(gp_Parab2d)
	DP(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersection between a circle and a parabola.  
         The exception ConstructionError is raised if the method  
         IsClosed of the domain of the circle returns False.") IntCurve_IntConicConic;
		 IntCurve_IntConicConic (const gp_Circ2d & C,const IntRes2d_Domain & DC,const gp_Parab2d & P,const IntRes2d_Domain & DP,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(gp_Circ2d)
	DC(IntRes2d_Domain)
	P(gp_Parab2d)
	DP(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersection between a circle and a parabola.  
         The exception ConstructionError is raised if the method  
         IsClosed of the domain of the circle returns False.") Perform;
		void Perform (const gp_Circ2d & C,const IntRes2d_Domain & DC,const gp_Parab2d & P,const IntRes2d_Domain & DP,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(gp_Circ2d)
	DC(IntRes2d_Domain)
	H(gp_Hypr2d)
	DH(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersection between a circle and an hyperbola.  
         The exception ConstructionError is raised if the method  
         IsClosed of the domain of the circle returns False.") IntCurve_IntConicConic;
		 IntCurve_IntConicConic (const gp_Circ2d & C,const IntRes2d_Domain & DC,const gp_Hypr2d & H,const IntRes2d_Domain & DH,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(gp_Circ2d)
	DC(IntRes2d_Domain)
	H(gp_Hypr2d)
	DH(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersection between a circle and an hyperbola.  
         The exception ConstructionError is raised if the method  
         IsClosed of the domain of the circle returns False.") Perform;
		void Perform (const gp_Circ2d & C,const IntRes2d_Domain & DC,const gp_Hypr2d & H,const IntRes2d_Domain & DH,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	E1(gp_Elips2d)
	D1(IntRes2d_Domain)
	E2(gp_Elips2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersection between 2 ellipses.  
         The exception ConstructionError is raised if the method  
         IsClosed of one of the domain returns False.") IntCurve_IntConicConic;
		 IntCurve_IntConicConic (const gp_Elips2d & E1,const IntRes2d_Domain & D1,const gp_Elips2d & E2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	E1(gp_Elips2d)
	D1(IntRes2d_Domain)
	E2(gp_Elips2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersection between 2 ellipses.  
         The exception ConstructionError is raised if the method  
         IsClosed of one of the domain returns False.") Perform;
		void Perform (const gp_Elips2d & E1,const IntRes2d_Domain & D1,const gp_Elips2d & E2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	E(gp_Elips2d)
	DE(IntRes2d_Domain)
	P(gp_Parab2d)
	DP(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersection between an ellipse and a parabola.  
         The exception ConstructionError is raised if the method  
         IsClosed of the domain of the ellipse returns False.") IntCurve_IntConicConic;
		 IntCurve_IntConicConic (const gp_Elips2d & E,const IntRes2d_Domain & DE,const gp_Parab2d & P,const IntRes2d_Domain & DP,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	E(gp_Elips2d)
	DE(IntRes2d_Domain)
	P(gp_Parab2d)
	DP(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersection between an ellipse and a parabola.  
         The exception ConstructionError is raised if the method  
         IsClosed of the domain of the ellipse returns False.") Perform;
		void Perform (const gp_Elips2d & E,const IntRes2d_Domain & DE,const gp_Parab2d & P,const IntRes2d_Domain & DP,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	E(gp_Elips2d)
	DE(IntRes2d_Domain)
	H(gp_Hypr2d)
	DH(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersection between an ellipse and an hyperbola.  
         The exception ConstructionError is raised if the method  
         IsClosed of the domain of the ellipse returns False.") IntCurve_IntConicConic;
		 IntCurve_IntConicConic (const gp_Elips2d & E,const IntRes2d_Domain & DE,const gp_Hypr2d & H,const IntRes2d_Domain & DH,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	E(gp_Elips2d)
	DE(IntRes2d_Domain)
	H(gp_Hypr2d)
	DH(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersection between an ellipse and an hyperbola.  
         The exception ConstructionError is raised if the method  
         IsClosed of the domain of the ellipse returns False.") Perform;
		void Perform (const gp_Elips2d & E,const IntRes2d_Domain & DE,const gp_Hypr2d & H,const IntRes2d_Domain & DH,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	P1(gp_Parab2d)
	D1(IntRes2d_Domain)
	P2(gp_Parab2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersection between 2 parabolas.") IntCurve_IntConicConic;
		 IntCurve_IntConicConic (const gp_Parab2d & P1,const IntRes2d_Domain & D1,const gp_Parab2d & P2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	P1(gp_Parab2d)
	D1(IntRes2d_Domain)
	P2(gp_Parab2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersection between 2 parabolas.") Perform;
		void Perform (const gp_Parab2d & P1,const IntRes2d_Domain & D1,const gp_Parab2d & P2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	P(gp_Parab2d)
	DP(IntRes2d_Domain)
	H(gp_Hypr2d)
	DH(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersection between a parabola and an hyperbola.") IntCurve_IntConicConic;
		 IntCurve_IntConicConic (const gp_Parab2d & P,const IntRes2d_Domain & DP,const gp_Hypr2d & H,const IntRes2d_Domain & DH,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	P(gp_Parab2d)
	DP(IntRes2d_Domain)
	H(gp_Hypr2d)
	DH(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersection between a parabola and an hyperbola.") Perform;
		void Perform (const gp_Parab2d & P,const IntRes2d_Domain & DP,const gp_Hypr2d & H,const IntRes2d_Domain & DH,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	H1(gp_Hypr2d)
	D1(IntRes2d_Domain)
	H2(gp_Hypr2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersection between 2 hyperbolas.") IntCurve_IntConicConic;
		 IntCurve_IntConicConic (const gp_Hypr2d & H1,const IntRes2d_Domain & D1,const gp_Hypr2d & H2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	H1(gp_Hypr2d)
	D1(IntRes2d_Domain)
	H2(gp_Hypr2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersection between 2 hyperbolas.") Perform;
		void Perform (const gp_Hypr2d & H1,const IntRes2d_Domain & D1,const gp_Hypr2d & H2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
};


%feature("shadow") IntCurve_IntConicConic::~IntCurve_IntConicConic %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntCurve_IntConicConic {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntCurve_IntImpConicParConic;
class IntCurve_IntImpConicParConic : public IntRes2d_Intersection {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntCurve_IntImpConicParConic;
		 IntCurve_IntImpConicParConic ();
		%feature("autodoc", "Args:
	ITool(IntCurve_IConicTool)
	Dom1(IntRes2d_Domain)
	PCurve(IntCurve_PConic)
	Dom2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") IntCurve_IntImpConicParConic;
		 IntCurve_IntImpConicParConic (const IntCurve_IConicTool & ITool,const IntRes2d_Domain & Dom1,const IntCurve_PConic & PCurve,const IntRes2d_Domain & Dom2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	ITool(IntCurve_IConicTool)
	Dom1(IntRes2d_Domain)
	PCurve(IntCurve_PConic)
	Dom2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const IntCurve_IConicTool & ITool,const IntRes2d_Domain & Dom1,const IntCurve_PConic & PCurve,const IntRes2d_Domain & Dom2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	parameter(Standard_Real)
	point(gp_Pnt2d)
	TheParCurev(IntCurve_PConic)
	TheImpTool(IntCurve_IConicTool)

Returns:
	Standard_Real

No detailed docstring for this function.") FindU;
		Standard_Real FindU (const Standard_Real parameter,gp_Pnt2d & point,const IntCurve_PConic & TheParCurev,const IntCurve_IConicTool & TheImpTool);
		%feature("autodoc", "Args:
	parameter(Standard_Real)
	point(gp_Pnt2d)
	TheImpTool(IntCurve_IConicTool)
	ParCurve(IntCurve_PConic)
	TheParCurveDomain(IntRes2d_Domain)
	V0(Standard_Real)
	V1(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	Standard_Real

No detailed docstring for this function.") FindV;
		Standard_Real FindV (const Standard_Real parameter,gp_Pnt2d & point,const IntCurve_IConicTool & TheImpTool,const IntCurve_PConic & ParCurve,const IntRes2d_Domain & TheParCurveDomain,const Standard_Real V0,const Standard_Real V1,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	TheImpTool(IntCurve_IConicTool)
	TheParCurve(IntCurve_PConic)
	TheImpCurveDomain(IntRes2d_Domain)
	TheParCurveDomain(IntRes2d_Domain)
	NbResultats(Standard_Integer)
	Inter2_And_Domain2(TColStd_Array1OfReal)
	Inter1(TColStd_Array1OfReal)
	Resultat1(TColStd_Array1OfReal)
	Resultat2(TColStd_Array1OfReal)
	EpsNul(Standard_Real)

Returns:
	None

No detailed docstring for this function.") And_Domaine_Objet1_Intersections;
		void And_Domaine_Objet1_Intersections (const IntCurve_IConicTool & TheImpTool,const IntCurve_PConic & TheParCurve,const IntRes2d_Domain & TheImpCurveDomain,const IntRes2d_Domain & TheParCurveDomain,Standard_Integer &OutValue,TColStd_Array1OfReal & Inter2_And_Domain2,TColStd_Array1OfReal & Inter1,TColStd_Array1OfReal & Resultat1,TColStd_Array1OfReal & Resultat2,const Standard_Real EpsNul);
};


%feature("shadow") IntCurve_IntImpConicParConic::~IntCurve_IntImpConicParConic %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntCurve_IntImpConicParConic {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntCurve_MyImpParToolOfIntImpConicParConic;
class IntCurve_MyImpParToolOfIntImpConicParConic : public math_FunctionWithDerivative {
	public:
		%feature("autodoc", "Args:
	IT(IntCurve_IConicTool)
	PC(IntCurve_PConic)

Returns:
	None

No detailed docstring for this function.") IntCurve_MyImpParToolOfIntImpConicParConic;
		 IntCurve_MyImpParToolOfIntImpConicParConic (const IntCurve_IConicTool & IT,const IntCurve_PConic & PC);
		%feature("autodoc", "Args:
	Param(Standard_Real)
	F(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const Standard_Real Param,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Param(Standard_Real)
	D(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivative;
		Standard_Boolean Derivative (const Standard_Real Param,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Param(Standard_Real)
	F(Standard_Real)
	D(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const Standard_Real Param,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") IntCurve_MyImpParToolOfIntImpConicParConic::~IntCurve_MyImpParToolOfIntImpConicParConic %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntCurve_MyImpParToolOfIntImpConicParConic {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntCurve_PConic;
class IntCurve_PConic {
	public:
		%feature("autodoc", "Args:
	PC(IntCurve_PConic)

Returns:
	None

No detailed docstring for this function.") IntCurve_PConic;
		 IntCurve_PConic (const IntCurve_PConic & PC);
		%feature("autodoc", "Args:
	E(gp_Elips2d)

Returns:
	None

No detailed docstring for this function.") IntCurve_PConic;
		 IntCurve_PConic (const gp_Elips2d & E);
		%feature("autodoc", "Args:
	C(gp_Circ2d)

Returns:
	None

No detailed docstring for this function.") IntCurve_PConic;
		 IntCurve_PConic (const gp_Circ2d & C);
		%feature("autodoc", "Args:
	P(gp_Parab2d)

Returns:
	None

No detailed docstring for this function.") IntCurve_PConic;
		 IntCurve_PConic (const gp_Parab2d & P);
		%feature("autodoc", "Args:
	H(gp_Hypr2d)

Returns:
	None

No detailed docstring for this function.") IntCurve_PConic;
		 IntCurve_PConic (const gp_Hypr2d & H);
		%feature("autodoc", "Args:
	L(gp_Lin2d)

Returns:
	None

No detailed docstring for this function.") IntCurve_PConic;
		 IntCurve_PConic (const gp_Lin2d & L);
		%feature("autodoc", "Args:
	EpsDist(Standard_Real)

Returns:
	None

EpsX is a internal tolerance used in math  
         algorithms, usually about 1e-10  
         (See FunctionAllRoots for more details)") SetEpsX;
		void SetEpsX (const Standard_Real EpsDist);
		%feature("autodoc", "Args:
	Nb(Standard_Integer)

Returns:
	None

Accuracy is the number of samples used to  
         approximate the parametric curve on its domain.") SetAccuracy;
		void SetAccuracy (const Standard_Integer Nb);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Accuracy;
		Standard_Integer Accuracy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") EpsX;
		Standard_Real EpsX ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_CurveType

The Conics are manipulated as objects which only  
         depend on three parameters : Axis and two Real from Standards.  
         Type Curve is used to select the correct Conic.") TypeCurve;
		GeomAbs_CurveType TypeCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax22d

No detailed docstring for this function.") Axis2;
		const gp_Ax22d & Axis2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Param1;
		Standard_Real Param1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Param2;
		Standard_Real Param2 ();
};


%feature("shadow") IntCurve_PConic::~IntCurve_PConic %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntCurve_PConic {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntCurve_PConicTool;
class IntCurve_PConicTool {
	public:
		%feature("autodoc", "Args:
	C(IntCurve_PConic)

Returns:
	static Standard_Real

No detailed docstring for this function.") EpsX;
		static Standard_Real EpsX (const IntCurve_PConic & C);
		%feature("autodoc", "Args:
	C(IntCurve_PConic)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSamples;
		static Standard_Integer NbSamples (const IntCurve_PConic & C);
		%feature("autodoc", "Args:
	C(IntCurve_PConic)
	U0(Standard_Real)
	U1(Standard_Real)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSamples;
		static Standard_Integer NbSamples (const IntCurve_PConic & C,const Standard_Real U0,const Standard_Real U1);
		%feature("autodoc", "Args:
	C(IntCurve_PConic)
	X(Standard_Real)

Returns:
	static gp_Pnt2d

No detailed docstring for this function.") Value;
		static gp_Pnt2d Value (const IntCurve_PConic & C,const Standard_Real X);
		%feature("autodoc", "Args:
	C(IntCurve_PConic)
	U(Standard_Real)
	P(gp_Pnt2d)
	T(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") D1;
		static void D1 (const IntCurve_PConic & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & T);
		%feature("autodoc", "Args:
	C(IntCurve_PConic)
	U(Standard_Real)
	P(gp_Pnt2d)
	T(gp_Vec2d)
	N(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") D2;
		static void D2 (const IntCurve_PConic & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & T,gp_Vec2d & N);
};


%feature("shadow") IntCurve_PConicTool::~IntCurve_PConicTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntCurve_PConicTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntCurve_ProjectOnPConicTool;
class IntCurve_ProjectOnPConicTool {
	public:
		%feature("autodoc", "Args:
	C(IntCurve_PConic)
	Pnt(gp_Pnt2d)
	Tol(Standard_Real)

Returns:
	static Standard_Real

Returns  the parameter V  of the  point   on the  
 parametric  curve corresponding to  the  Point  Pnt.   The  
 Correspondance between  Pnt  and the  point   P(V) on  the  
 parametric    curve  must  be  coherent with    the way of  
 determination  of the signed  distance between a point and  
 the implicit curve.  Tol is the tolerance on  the distance  
 between a point and the parametrised curve.  In that case,  
 no bounds are given.  The research  of the rigth parameter  
 has to  be  made  on the natural  parametric domain of the  
 curve.") FindParameter;
		static Standard_Real FindParameter (const IntCurve_PConic & C,const gp_Pnt2d & Pnt,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(IntCurve_PConic)
	Pnt(gp_Pnt2d)
	LowParameter(Standard_Real)
	HighParameter(Standard_Real)
	Tol(Standard_Real)

Returns:
	static Standard_Real

Returns the  parameter  V of the   point  on the  
 parametric  curve corresponding  to  the   Point Pnt.  The  
 Correspondance  between Pnt and  the   point  P(V) on  the  
 parametric  curve  must  be  coherent   with the  way   of  
 determination of the  signed distance between  a point and  
 the implicit curve.  Tol  is the tolerance on the distance  
 between a point and the  parametrised curve.  LowParameter  
 and HighParameter give the  boundaries of the interval  in  
 wich the parameter  certainly  lies.  These parameters are  
 given to implement a  more efficient  algoritm. So,  it is  
 not necessary to check   that the returned value  verifies  
 LowParameter <= Value <= HighParameter.") FindParameter;
		static Standard_Real FindParameter (const IntCurve_PConic & C,const gp_Pnt2d & Pnt,const Standard_Real LowParameter,const Standard_Real HighParameter,const Standard_Real Tol);
};


%feature("shadow") IntCurve_ProjectOnPConicTool::~IntCurve_ProjectOnPConicTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntCurve_ProjectOnPConicTool {
	void _kill_pointed() {
		delete $self;
	}
};
