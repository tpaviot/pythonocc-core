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
%module CPnts

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

%include CPnts_required_python_modules.i
%include CPnts_headers.i

/* typedefs */
typedef Standard_Real ( * CPnts_RealFunction ) ( const Standard_Real , 	 	 	 	 	 const Standard_Address );
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor CPnts_AbscissaPoint;
class CPnts_AbscissaPoint {
	public:
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)

Returns:
	static Standard_Real

Computes the length of the Curve <C>.") Length;
		static Standard_Real Length (const Adaptor3d_Curve & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	static Standard_Real

Computes the length of the Curve <C>.") Length;
		static Standard_Real Length (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	Tol(Standard_Real)

Returns:
	static Standard_Real

Computes the length of the Curve <C> with the given tolerance.") Length;
		static Standard_Real Length (const Adaptor3d_Curve & C,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Tol(Standard_Real)

Returns:
	static Standard_Real

Computes the length of the Curve <C> with the given tolerance.") Length;
		static Standard_Real Length (const Adaptor2d_Curve2d & C,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	U1(Standard_Real)
	U2(Standard_Real)

Returns:
	static Standard_Real

Computes the length of the Curve <C> between <U1> and <U2>.") Length;
		static Standard_Real Length (const Adaptor3d_Curve & C,const Standard_Real U1,const Standard_Real U2);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	U1(Standard_Real)
	U2(Standard_Real)

Returns:
	static Standard_Real

Computes the length of the Curve <C> between <U1> and <U2>.") Length;
		static Standard_Real Length (const Adaptor2d_Curve2d & C,const Standard_Real U1,const Standard_Real U2);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	U1(Standard_Real)
	U2(Standard_Real)
	Tol(Standard_Real)

Returns:
	static Standard_Real

Computes the length of the Curve <C> between <U1> and <U2> with the given tolerance.") Length;
		static Standard_Real Length (const Adaptor3d_Curve & C,const Standard_Real U1,const Standard_Real U2,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	U1(Standard_Real)
	U2(Standard_Real)
	Tol(Standard_Real)

Returns:
	static Standard_Real

Computes the length of the Curve <C> between <U1> and <U2> with the given tolerance.  creation of a indefinite AbscissaPoint.") Length;
		static Standard_Real Length (const Adaptor2d_Curve2d & C,const Standard_Real U1,const Standard_Real U2,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") CPnts_AbscissaPoint;
		 CPnts_AbscissaPoint ();
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	Abscissa(Standard_Real)
	U0(Standard_Real)
	Resolution(Standard_Real)

Returns:
	None

the algorithm computes a point on a curve <Curve> at the  
         distance <Abscissa> from the point of parameter <U0>.  
         <Resolution> is the error allowed in the computation.  
         The computed point can be outside of the curve 's bounds.") CPnts_AbscissaPoint;
		 CPnts_AbscissaPoint (const Adaptor3d_Curve & C,const Standard_Real Abscissa,const Standard_Real U0,const Standard_Real Resolution);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Abscissa(Standard_Real)
	U0(Standard_Real)
	Resolution(Standard_Real)

Returns:
	None

the algorithm computes a point on a curve <Curve> at the  
         distance <Abscissa> from the point of parameter <U0>.  
         <Resolution> is the error allowed in the computation.  
         The computed point can be outside of the curve 's bounds.") CPnts_AbscissaPoint;
		 CPnts_AbscissaPoint (const Adaptor2d_Curve2d & C,const Standard_Real Abscissa,const Standard_Real U0,const Standard_Real Resolution);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	Abscissa(Standard_Real)
	U0(Standard_Real)
	Ui(Standard_Real)
	Resolution(Standard_Real)

Returns:
	None

the algorithm computes a point on a curve <Curve> at the  
         distance <Abscissa> from the point of parameter <U0>.  
         <Ui> is the starting value used in the iterative process  
         which find the solution, it must be closed to the final  
         solution  
         <Resolution> is the error allowed in the computation.  
         The computed point can be outside of the curve 's bounds.") CPnts_AbscissaPoint;
		 CPnts_AbscissaPoint (const Adaptor3d_Curve & C,const Standard_Real Abscissa,const Standard_Real U0,const Standard_Real Ui,const Standard_Real Resolution);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Abscissa(Standard_Real)
	U0(Standard_Real)
	Ui(Standard_Real)
	Resolution(Standard_Real)

Returns:
	None

the algorithm computes a point on a curve <Curve> at the  
         distance <Abscissa> from the point of parameter <U0>.  
         <Ui> is the starting value used in the iterative process  
         which find the solution, it must be closed to the final  
         solution  
         <Resolution> is the error allowed in the computation.  
         The computed point can be outside of the curve 's bounds.") CPnts_AbscissaPoint;
		 CPnts_AbscissaPoint (const Adaptor2d_Curve2d & C,const Standard_Real Abscissa,const Standard_Real U0,const Standard_Real Ui,const Standard_Real Resolution);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)

Returns:
	None

Initializes the resolution function with <C>.") Init;
		void Init (const Adaptor3d_Curve & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	None

Initializes the resolution function with <C>.") Init;
		void Init (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	Tol(Standard_Real)

Returns:
	None

Initializes the resolution function with <C>.") Init;
		void Init (const Adaptor3d_Curve & C,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Tol(Standard_Real)

Returns:
	None

Initializes the resolution function with <C>.") Init;
		void Init (const Adaptor2d_Curve2d & C,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	U1(Standard_Real)
	U2(Standard_Real)

Returns:
	None

Initializes the resolution function with <C>  
         between U1 and U2.") Init;
		void Init (const Adaptor3d_Curve & C,const Standard_Real U1,const Standard_Real U2);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	U1(Standard_Real)
	U2(Standard_Real)

Returns:
	None

Initializes the resolution function with <C>  
         between U1 and U2.") Init;
		void Init (const Adaptor2d_Curve2d & C,const Standard_Real U1,const Standard_Real U2);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	U1(Standard_Real)
	U2(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Initializes the resolution function with <C>  
         between U1 and U2.") Init;
		void Init (const Adaptor3d_Curve & C,const Standard_Real U1,const Standard_Real U2,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	U1(Standard_Real)
	U2(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Initializes the resolution function with <C>  
         between U1 and U2.") Init;
		void Init (const Adaptor2d_Curve2d & C,const Standard_Real U1,const Standard_Real U2,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Abscissa(Standard_Real)
	U0(Standard_Real)
	Resolution(Standard_Real)

Returns:
	None

Computes the point at the distance <Abscissa> of  
         the curve.") Perform;
		void Perform (const Standard_Real Abscissa,const Standard_Real U0,const Standard_Real Resolution);
		%feature("autodoc", "Args:
	Abscissa(Standard_Real)
	U0(Standard_Real)
	Ui(Standard_Real)
	Resolution(Standard_Real)

Returns:
	None

Computes the point at the distance <Abscissa> of  
         the curve.") Perform;
		void Perform (const Standard_Real Abscissa,const Standard_Real U0,const Standard_Real Ui,const Standard_Real Resolution);
		%feature("autodoc", "Args:
	Abscissa(Standard_Real)
	U0(Standard_Real)
	Ui(Standard_Real)
	Resolution(Standard_Real)

Returns:
	None

Computes the point at the distance <Abscissa> of  
         the curve; performs more appropriate tolerance managment;  
         to use this method in right way it is necessary to call  
         empty consructor. then call method Init with  
//!	        Tolerance = Resolution, then call AdvPermorm.") AdvPerform;
		void AdvPerform (const Standard_Real Abscissa,const Standard_Real U0,const Standard_Real Ui,const Standard_Real Resolution);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

True if the computation was successful, False otherwise.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the parameter of the solution.") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "Args:
	P(Standard_Real)

Returns:
	None

Enforce the solution, used by GCPnts.") SetParameter;
		void SetParameter (const Standard_Real P);
};


%feature("shadow") CPnts_AbscissaPoint::~CPnts_AbscissaPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend CPnts_AbscissaPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor CPnts_MyGaussFunction;
class CPnts_MyGaussFunction : public math_Function {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") CPnts_MyGaussFunction;
		 CPnts_MyGaussFunction ();
		%feature("autodoc", "Args:
	F(CPnts_RealFunction)
	D(Standard_Address)

Returns:
	None

F  is a pointer on a  function  D is a client data  
 
         Each value is computed with F(D)") Init;
		void Init (const CPnts_RealFunction & F,const Standard_Address D);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
};


%feature("shadow") CPnts_MyGaussFunction::~CPnts_MyGaussFunction %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend CPnts_MyGaussFunction {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor CPnts_MyRootFunction;
class CPnts_MyRootFunction : public math_FunctionWithDerivative {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") CPnts_MyRootFunction;
		 CPnts_MyRootFunction ();
		%feature("autodoc", "Args:
	F(CPnts_RealFunction)
	D(Standard_Address)
	Order(Standard_Integer)

Returns:
	None

F  is a pointer on a  function  D is a client data  
         Order is the order of integration to use") Init;
		void Init (const CPnts_RealFunction & F,const Standard_Address D,const Standard_Integer Order);
		%feature("autodoc", "Args:
	X0(Standard_Real)
	L(Standard_Real)

Returns:
	None

We want to solve Integral(X0,X,F(X,D)) = L") Init;
		void Init (const Standard_Real X0,const Standard_Real L);
		%feature("autodoc", "Args:
	X0(Standard_Real)
	L(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

We want to solve Integral(X0,X,F(X,D)) = L  
 with given tolerance") Init;
		void Init (const Standard_Real X0,const Standard_Real L,const Standard_Real Tol);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)

Returns:
	Standard_Boolean

This is Integral(X0,X,F(X,D)) - L") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Df(Standard_Real)

Returns:
	Standard_Boolean

This is F(X,D)") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)
	Df(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") CPnts_MyRootFunction::~CPnts_MyRootFunction %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend CPnts_MyRootFunction {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor CPnts_UniformDeflection;
class CPnts_UniformDeflection {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

creation of a indefinite UniformDeflection") CPnts_UniformDeflection;
		 CPnts_UniformDeflection ();
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	Deflection(Standard_Real)
	Resolution(Standard_Real)
	WithControl(Standard_Boolean)

Returns:
	None

Computes a uniform deflection distribution of points  
 on the curve <C>.  
 <Deflection> defines the constant deflection value.  
 The algorithm computes the number of points and the points.  
 The curve <C> must be at least C2 else the computation can fail.  
 If just some parts of the curve is C2 it is better to give the  
 parameters bounds and to use the below constructor .  
 if <WithControl> is True, the algorithm controls the estimate  
 deflection  
 when the curve is singular at the point P(u),the algorithm  
 computes the next point as  
 P(u + Max(CurrentStep,Abs(LastParameter-FirstParameter)))  
 if the singularity is at the first point ,the next point  
 calculated is the P(LastParameter)") CPnts_UniformDeflection;
		 CPnts_UniformDeflection (const Adaptor3d_Curve & C,const Standard_Real Deflection,const Standard_Real Resolution,const Standard_Boolean WithControl);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Deflection(Standard_Real)
	Resolution(Standard_Real)
	WithControl(Standard_Boolean)

Returns:
	None

As above with 2d curve") CPnts_UniformDeflection;
		 CPnts_UniformDeflection (const Adaptor2d_Curve2d & C,const Standard_Real Deflection,const Standard_Real Resolution,const Standard_Boolean WithControl);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	Deflection(Standard_Real)
	U1(Standard_Real)
	U2(Standard_Real)
	Resolution(Standard_Real)
	WithControl(Standard_Boolean)

Returns:
	None

Computes an uniform deflection distribution of points on a part of  
 the curve <C>. Deflection defines the step between the points.  
 <U1> and <U2> define the distribution span.  
 <U1> and <U2> must be in the parametric range of the curve.") CPnts_UniformDeflection;
		 CPnts_UniformDeflection (const Adaptor3d_Curve & C,const Standard_Real Deflection,const Standard_Real U1,const Standard_Real U2,const Standard_Real Resolution,const Standard_Boolean WithControl);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Deflection(Standard_Real)
	U1(Standard_Real)
	U2(Standard_Real)
	Resolution(Standard_Real)
	WithControl(Standard_Boolean)

Returns:
	None

As above with 2d curve") CPnts_UniformDeflection;
		 CPnts_UniformDeflection (const Adaptor2d_Curve2d & C,const Standard_Real Deflection,const Standard_Real U1,const Standard_Real U2,const Standard_Real Resolution,const Standard_Boolean WithControl);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	Deflection(Standard_Real)
	Resolution(Standard_Real)
	WithControl(Standard_Boolean)

Returns:
	None

Initialize the algoritms with <C>, <Deflection>, <UStep>,  
         <Resolution> and <WithControl>") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Real Deflection,const Standard_Real Resolution,const Standard_Boolean WithControl);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Deflection(Standard_Real)
	Resolution(Standard_Real)
	WithControl(Standard_Boolean)

Returns:
	None

Initialize the algoritms with <C>, <Deflection>, <UStep>,  
         <Resolution> and <WithControl>") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Real Deflection,const Standard_Real Resolution,const Standard_Boolean WithControl);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	Deflection(Standard_Real)
	U1(Standard_Real)
	U2(Standard_Real)
	Resolution(Standard_Real)
	WithControl(Standard_Boolean)

Returns:
	None

Initialize the algoritms with <C>, <Deflection>, <UStep>,  
         <U1>, <U2> and <WithControl>") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Real Deflection,const Standard_Real U1,const Standard_Real U2,const Standard_Real Resolution,const Standard_Boolean WithControl);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Deflection(Standard_Real)
	U1(Standard_Real)
	U2(Standard_Real)
	Resolution(Standard_Real)
	WithControl(Standard_Boolean)

Returns:
	None

Initialize the algoritms with <C>, <Deflection>, <UStep>,  
         <U1>, <U2> and <WithControl>") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Real Deflection,const Standard_Real U1,const Standard_Real U2,const Standard_Real Resolution,const Standard_Boolean WithControl);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

To know if all the calculus were done successfully  
 (ie all the points have been computed). The calculus can fail if  
 the Curve is not C1 in the considered domain.  
 Returns True if the calculus was successful.") IsAllDone;
		Standard_Boolean IsAllDone ();
		%feature("autodoc", "Args:
	None
Returns:
	None

go to the next Point.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns True if it exists a next Point.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

return the computed parameter") Value;
		Standard_Real Value ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

return the computed parameter") Point;
		gp_Pnt Point ();
};


%feature("shadow") CPnts_UniformDeflection::~CPnts_UniformDeflection %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend CPnts_UniformDeflection {
	void _kill_pointed() {
		delete $self;
	}
};
