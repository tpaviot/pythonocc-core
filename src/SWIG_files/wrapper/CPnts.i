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
%define CPNTSDOCSTRING
"CPnts module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_cpnts.html"
%enddef
%module (package="OCC.Core", docstring=CPNTSDOCSTRING) CPnts


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
#include<CPnts_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<math_module.hxx>
#include<gp_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Adaptor3d.i
%import Adaptor2d.i
%import math.i
%import gp.i
/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
typedef Standard_Real ( * CPnts_RealFunction ) ( const Standard_Real , 	 	 	 	 	 const Standard_Address );
/* end typedefs declaration */

/****************************
* class CPnts_AbscissaPoint *
****************************/
class CPnts_AbscissaPoint {
	public:
		/****************** AdvPerform ******************/
		%feature("compactdefaultargs") AdvPerform;
		%feature("autodoc", "* Computes the point at the distance <Abscissa> of the curve; performs more appropriate tolerance managment; to use this method in right way it is necessary to call empty consructor. then call method Init with Tolerance = Resolution, then call AdvPermorm. U0 is the parameter of the point from which the distance is measured and Ui is the starting value for the iterative process (should be close to the final solution).
	:param Abscissa:
	:type Abscissa: float
	:param U0:
	:type U0: float
	:param Ui:
	:type Ui: float
	:param Resolution:
	:type Resolution: float
	:rtype: None") AdvPerform;
		void AdvPerform (const Standard_Real Abscissa,const Standard_Real U0,const Standard_Real Ui,const Standard_Real Resolution);

		/****************** CPnts_AbscissaPoint ******************/
		%feature("compactdefaultargs") CPnts_AbscissaPoint;
		%feature("autodoc", ":rtype: None") CPnts_AbscissaPoint;
		 CPnts_AbscissaPoint ();

		/****************** CPnts_AbscissaPoint ******************/
		%feature("compactdefaultargs") CPnts_AbscissaPoint;
		%feature("autodoc", "* the algorithm computes a point on a curve <Curve> at the distance <Abscissa> from the point of parameter <U0>. <Resolution> is the error allowed in the computation. The computed point can be outside of the curve 's bounds.
	:param C:
	:type C: Adaptor3d_Curve &
	:param Abscissa:
	:type Abscissa: float
	:param U0:
	:type U0: float
	:param Resolution:
	:type Resolution: float
	:rtype: None") CPnts_AbscissaPoint;
		 CPnts_AbscissaPoint (const Adaptor3d_Curve & C,const Standard_Real Abscissa,const Standard_Real U0,const Standard_Real Resolution);

		/****************** CPnts_AbscissaPoint ******************/
		%feature("compactdefaultargs") CPnts_AbscissaPoint;
		%feature("autodoc", "* the algorithm computes a point on a curve <Curve> at the distance <Abscissa> from the point of parameter <U0>. <Resolution> is the error allowed in the computation. The computed point can be outside of the curve 's bounds.
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Abscissa:
	:type Abscissa: float
	:param U0:
	:type U0: float
	:param Resolution:
	:type Resolution: float
	:rtype: None") CPnts_AbscissaPoint;
		 CPnts_AbscissaPoint (const Adaptor2d_Curve2d & C,const Standard_Real Abscissa,const Standard_Real U0,const Standard_Real Resolution);

		/****************** CPnts_AbscissaPoint ******************/
		%feature("compactdefaultargs") CPnts_AbscissaPoint;
		%feature("autodoc", "* the algorithm computes a point on a curve <Curve> at the distance <Abscissa> from the point of parameter <U0>. <Ui> is the starting value used in the iterative process which find the solution, it must be closed to the final solution <Resolution> is the error allowed in the computation. The computed point can be outside of the curve 's bounds.
	:param C:
	:type C: Adaptor3d_Curve &
	:param Abscissa:
	:type Abscissa: float
	:param U0:
	:type U0: float
	:param Ui:
	:type Ui: float
	:param Resolution:
	:type Resolution: float
	:rtype: None") CPnts_AbscissaPoint;
		 CPnts_AbscissaPoint (const Adaptor3d_Curve & C,const Standard_Real Abscissa,const Standard_Real U0,const Standard_Real Ui,const Standard_Real Resolution);

		/****************** CPnts_AbscissaPoint ******************/
		%feature("compactdefaultargs") CPnts_AbscissaPoint;
		%feature("autodoc", "* the algorithm computes a point on a curve <Curve> at the distance <Abscissa> from the point of parameter <U0>. <Ui> is the starting value used in the iterative process which find the solution, it must be closed to the final solution <Resolution> is the error allowed in the computation. The computed point can be outside of the curve 's bounds.
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Abscissa:
	:type Abscissa: float
	:param U0:
	:type U0: float
	:param Ui:
	:type Ui: float
	:param Resolution:
	:type Resolution: float
	:rtype: None") CPnts_AbscissaPoint;
		 CPnts_AbscissaPoint (const Adaptor2d_Curve2d & C,const Standard_Real Abscissa,const Standard_Real U0,const Standard_Real Ui,const Standard_Real Resolution);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the resolution function with <C>.
	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: None") Init;
		void Init (const Adaptor3d_Curve & C);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the resolution function with <C>.
	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: None") Init;
		void Init (const Adaptor2d_Curve2d & C);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the resolution function with <C>.
	:param C:
	:type C: Adaptor3d_Curve &
	:param Tol:
	:type Tol: float
	:rtype: None") Init;
		void Init (const Adaptor3d_Curve & C,const Standard_Real Tol);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the resolution function with <C>.
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Tol:
	:type Tol: float
	:rtype: None") Init;
		void Init (const Adaptor2d_Curve2d & C,const Standard_Real Tol);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the resolution function with <C> between U1 and U2.
	:param C:
	:type C: Adaptor3d_Curve &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: None") Init;
		void Init (const Adaptor3d_Curve & C,const Standard_Real U1,const Standard_Real U2);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the resolution function with <C> between U1 and U2.
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: None") Init;
		void Init (const Adaptor2d_Curve2d & C,const Standard_Real U1,const Standard_Real U2);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the resolution function with <C> between U1 and U2.
	:param C:
	:type C: Adaptor3d_Curve &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Tol:
	:type Tol: float
	:rtype: None") Init;
		void Init (const Adaptor3d_Curve & C,const Standard_Real U1,const Standard_Real U2,const Standard_Real Tol);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the resolution function with <C> between U1 and U2.
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Tol:
	:type Tol: float
	:rtype: None") Init;
		void Init (const Adaptor2d_Curve2d & C,const Standard_Real U1,const Standard_Real U2,const Standard_Real Tol);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* True if the computation was successful, False otherwise.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "* Computes the length of the Curve <C>.
	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: float") Length;
		static Standard_Real Length (const Adaptor3d_Curve & C);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "* Computes the length of the Curve <C>.
	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: float") Length;
		static Standard_Real Length (const Adaptor2d_Curve2d & C);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "* Computes the length of the Curve <C> with the given tolerance.
	:param C:
	:type C: Adaptor3d_Curve &
	:param Tol:
	:type Tol: float
	:rtype: float") Length;
		static Standard_Real Length (const Adaptor3d_Curve & C,const Standard_Real Tol);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "* Computes the length of the Curve <C> with the given tolerance.
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Tol:
	:type Tol: float
	:rtype: float") Length;
		static Standard_Real Length (const Adaptor2d_Curve2d & C,const Standard_Real Tol);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "* Computes the length of the Curve <C> between <U1> and <U2>.
	:param C:
	:type C: Adaptor3d_Curve &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: float") Length;
		static Standard_Real Length (const Adaptor3d_Curve & C,const Standard_Real U1,const Standard_Real U2);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "* Computes the length of the Curve <C> between <U1> and <U2>.
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: float") Length;
		static Standard_Real Length (const Adaptor2d_Curve2d & C,const Standard_Real U1,const Standard_Real U2);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "* Computes the length of the Curve <C> between <U1> and <U2> with the given tolerance.
	:param C:
	:type C: Adaptor3d_Curve &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Tol:
	:type Tol: float
	:rtype: float") Length;
		static Standard_Real Length (const Adaptor3d_Curve & C,const Standard_Real U1,const Standard_Real U2,const Standard_Real Tol);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "* Computes the length of the Curve <C> between <U1> and <U2> with the given tolerance. creation of a indefinite AbscissaPoint.
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Tol:
	:type Tol: float
	:rtype: float") Length;
		static Standard_Real Length (const Adaptor2d_Curve2d & C,const Standard_Real U1,const Standard_Real U2,const Standard_Real Tol);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "* Returns the parameter of the solution.
	:rtype: float") Parameter;
		Standard_Real Parameter ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Computes the point at the distance <Abscissa> of the curve. U0 is the parameter of the point from which the distance is measured.
	:param Abscissa:
	:type Abscissa: float
	:param U0:
	:type U0: float
	:param Resolution:
	:type Resolution: float
	:rtype: None") Perform;
		void Perform (const Standard_Real Abscissa,const Standard_Real U0,const Standard_Real Resolution);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Computes the point at the distance <Abscissa> of the curve. U0 is the parameter of the point from which the distance is measured and Ui is the starting value for the iterative process (should be close to the final solution).
	:param Abscissa:
	:type Abscissa: float
	:param U0:
	:type U0: float
	:param Ui:
	:type Ui: float
	:param Resolution:
	:type Resolution: float
	:rtype: None") Perform;
		void Perform (const Standard_Real Abscissa,const Standard_Real U0,const Standard_Real Ui,const Standard_Real Resolution);

		/****************** SetParameter ******************/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "* Enforce the solution, used by GCPnts.
	:param P:
	:type P: float
	:rtype: None") SetParameter;
		void SetParameter (const Standard_Real P);

};


%extend CPnts_AbscissaPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class CPnts_MyGaussFunction *
******************************/
%nodefaultctor CPnts_MyGaussFunction;
class CPnts_MyGaussFunction : public math_Function {
	public:
		/****************** CPnts_MyGaussFunction ******************/
		%feature("compactdefaultargs") CPnts_MyGaussFunction;
		%feature("autodoc", ":rtype: None") CPnts_MyGaussFunction;
		 CPnts_MyGaussFunction ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* F is a pointer on a function D is a client data //! Each value is computed with F(D)
	:param F:
	:type F: CPnts_RealFunction &
	:param D:
	:type D: Standard_Address
	:rtype: None") Init;
		void Init (const CPnts_RealFunction & F,const Standard_Address D);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":param X:
	:type X: float
	:param F:
	:type F: float &
	:rtype: bool") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);

};


%extend CPnts_MyGaussFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class CPnts_MyRootFunction *
*****************************/
%nodefaultctor CPnts_MyRootFunction;
class CPnts_MyRootFunction : public math_FunctionWithDerivative {
	public:
		/****************** CPnts_MyRootFunction ******************/
		%feature("compactdefaultargs") CPnts_MyRootFunction;
		%feature("autodoc", ":rtype: None") CPnts_MyRootFunction;
		 CPnts_MyRootFunction ();

		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "* This is F(X,D)
	:param X:
	:type X: float
	:param Df:
	:type Df: float &
	:rtype: bool") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* F is a pointer on a function D is a client data Order is the order of integration to use
	:param F:
	:type F: CPnts_RealFunction &
	:param D:
	:type D: Standard_Address
	:param Order:
	:type Order: int
	:rtype: None") Init;
		void Init (const CPnts_RealFunction & F,const Standard_Address D,const Standard_Integer Order);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* We want to solve Integral(X0,X,F(X,D)) = L
	:param X0:
	:type X0: float
	:param L:
	:type L: float
	:rtype: None") Init;
		void Init (const Standard_Real X0,const Standard_Real L);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* We want to solve Integral(X0,X,F(X,D)) = L with given tolerance
	:param X0:
	:type X0: float
	:param L:
	:type L: float
	:param Tol:
	:type Tol: float
	:rtype: None") Init;
		void Init (const Standard_Real X0,const Standard_Real L,const Standard_Real Tol);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* This is Integral(X0,X,F(X,D)) - L
	:param X:
	:type X: float
	:param F:
	:type F: float &
	:rtype: bool") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", ":param X:
	:type X: float
	:param F:
	:type F: float &
	:param Df:
	:type Df: float &
	:rtype: bool") Values;
		Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);

};


%extend CPnts_MyRootFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class CPnts_UniformDeflection *
********************************/
%nodefaultctor CPnts_UniformDeflection;
class CPnts_UniformDeflection {
	public:
		/****************** CPnts_UniformDeflection ******************/
		%feature("compactdefaultargs") CPnts_UniformDeflection;
		%feature("autodoc", "* creation of a indefinite UniformDeflection
	:rtype: None") CPnts_UniformDeflection;
		 CPnts_UniformDeflection ();

		/****************** CPnts_UniformDeflection ******************/
		%feature("compactdefaultargs") CPnts_UniformDeflection;
		%feature("autodoc", "* Computes a uniform deflection distribution of points on the curve <C>. <Deflection> defines the constant deflection value. The algorithm computes the number of points and the points. The curve <C> must be at least C2 else the computation can fail. If just some parts of the curve is C2 it is better to give the parameters bounds and to use the below constructor . if <WithControl> is True, the algorithm controls the estimate deflection when the curve is singular at the point P(u),the algorithm computes the next point as P(u + Max(CurrentStep,Abs(LastParameter-FirstParameter))) if the singularity is at the first point ,the next point calculated is the P(LastParameter)
	:param C:
	:type C: Adaptor3d_Curve &
	:param Deflection:
	:type Deflection: float
	:param Resolution:
	:type Resolution: float
	:param WithControl:
	:type WithControl: bool
	:rtype: None") CPnts_UniformDeflection;
		 CPnts_UniformDeflection (const Adaptor3d_Curve & C,const Standard_Real Deflection,const Standard_Real Resolution,const Standard_Boolean WithControl);

		/****************** CPnts_UniformDeflection ******************/
		%feature("compactdefaultargs") CPnts_UniformDeflection;
		%feature("autodoc", "* As above with 2d curve
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Deflection:
	:type Deflection: float
	:param Resolution:
	:type Resolution: float
	:param WithControl:
	:type WithControl: bool
	:rtype: None") CPnts_UniformDeflection;
		 CPnts_UniformDeflection (const Adaptor2d_Curve2d & C,const Standard_Real Deflection,const Standard_Real Resolution,const Standard_Boolean WithControl);

		/****************** CPnts_UniformDeflection ******************/
		%feature("compactdefaultargs") CPnts_UniformDeflection;
		%feature("autodoc", "* Computes an uniform deflection distribution of points on a part of the curve <C>. Deflection defines the step between the points. <U1> and <U2> define the distribution span. <U1> and <U2> must be in the parametric range of the curve.
	:param C:
	:type C: Adaptor3d_Curve &
	:param Deflection:
	:type Deflection: float
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Resolution:
	:type Resolution: float
	:param WithControl:
	:type WithControl: bool
	:rtype: None") CPnts_UniformDeflection;
		 CPnts_UniformDeflection (const Adaptor3d_Curve & C,const Standard_Real Deflection,const Standard_Real U1,const Standard_Real U2,const Standard_Real Resolution,const Standard_Boolean WithControl);

		/****************** CPnts_UniformDeflection ******************/
		%feature("compactdefaultargs") CPnts_UniformDeflection;
		%feature("autodoc", "* As above with 2d curve
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Deflection:
	:type Deflection: float
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Resolution:
	:type Resolution: float
	:param WithControl:
	:type WithControl: bool
	:rtype: None") CPnts_UniformDeflection;
		 CPnts_UniformDeflection (const Adaptor2d_Curve2d & C,const Standard_Real Deflection,const Standard_Real U1,const Standard_Real U2,const Standard_Real Resolution,const Standard_Boolean WithControl);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "* Initialize the algoritms with <C>, <Deflection>, <UStep>, <Resolution> and <WithControl>
	:param C:
	:type C: Adaptor3d_Curve &
	:param Deflection:
	:type Deflection: float
	:param Resolution:
	:type Resolution: float
	:param WithControl:
	:type WithControl: bool
	:rtype: None") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Real Deflection,const Standard_Real Resolution,const Standard_Boolean WithControl);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "* Initialize the algoritms with <C>, <Deflection>, <UStep>, <Resolution> and <WithControl>
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Deflection:
	:type Deflection: float
	:param Resolution:
	:type Resolution: float
	:param WithControl:
	:type WithControl: bool
	:rtype: None") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Real Deflection,const Standard_Real Resolution,const Standard_Boolean WithControl);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "* Initialize the algoritms with <C>, <Deflection>, <UStep>, <U1>, <U2> and <WithControl>
	:param C:
	:type C: Adaptor3d_Curve &
	:param Deflection:
	:type Deflection: float
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Resolution:
	:type Resolution: float
	:param WithControl:
	:type WithControl: bool
	:rtype: None") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Real Deflection,const Standard_Real U1,const Standard_Real U2,const Standard_Real Resolution,const Standard_Boolean WithControl);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "* Initialize the algoritms with <C>, <Deflection>, <UStep>, <U1>, <U2> and <WithControl>
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Deflection:
	:type Deflection: float
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Resolution:
	:type Resolution: float
	:param WithControl:
	:type WithControl: bool
	:rtype: None") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Real Deflection,const Standard_Real U1,const Standard_Real U2,const Standard_Real Resolution,const Standard_Boolean WithControl);

		/****************** IsAllDone ******************/
		%feature("compactdefaultargs") IsAllDone;
		%feature("autodoc", "* To know if all the calculus were done successfully (ie all the points have been computed). The calculus can fail if the Curve is not C1 in the considered domain. Returns True if the calculus was successful.
	:rtype: bool") IsAllDone;
		Standard_Boolean IsAllDone ();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "* returns True if it exists a next Point.
	:rtype: bool") More;
		Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* go to the next Point.
	:rtype: None") Next;
		void Next ();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* return the computed parameter
	:rtype: gp_Pnt") Point;
		gp_Pnt Point ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* return the computed parameter
	:rtype: float") Value;
		Standard_Real Value ();

};


%extend CPnts_UniformDeflection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 class */
/* harray2 class */
/* harray2 class */
