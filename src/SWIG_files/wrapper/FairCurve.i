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
%module (package="OCC") FairCurve

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

%include FairCurve_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum FairCurve_AnalysisCode {
	FairCurve_OK = 0,
	FairCurve_NotConverged = 1,
	FairCurve_InfiniteSliding = 2,
	FairCurve_NullHeight = 3,
};

/* end public enums declaration */

%nodefaultctor FairCurve_Batten;
class FairCurve_Batten {
	public:
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)
	Height(Standard_Real)
	Slope(Standard_Real)=0

Returns:
	None

Constructor  with the two points and the geometrical  
         characteristics of the batten (elastic beam)  
Height is the height of the deformation, and Slope is the  
slope value, initialized at 0. The user can then supply the  
desired slope value by the method, SetSlope.  
         Other parameters are initialized as follow :  
          - FreeSliding = False  
          - ConstraintOrder1 = 1  
          - ConstraintOrder2 = 1  
          - Angle1 = 0  
          - Angle2 = 0  
          - SlidingFactor = 1  
 Exceptions  
NegativeValue if Height is less than or equal to 0.  
NullValue if the distance between P1 and P2 is less  
than or equal to the tolerance value for distance in  
Precision::Confusion: P1.IsEqual(P2,  
Precision::Confusion()). The function  
gp_Pnt2d::IsEqual tests to see if this is the case.") FairCurve_Batten;
		 FairCurve_Batten (const gp_Pnt2d & P1,const gp_Pnt2d & P2,const Standard_Real Height,const Standard_Real Slope = 0);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Delete;
		virtual void Delete ();
		%feature("autodoc", "Args:
	FreeSliding(Standard_Boolean)

Returns:
	None

Freesliding is initialized with the default setting false.  
When Freesliding is set to true and, as a result, sliding  
is free, the sliding factor is automatically computed to  
satisfy the equilibrium of the batten.") SetFreeSliding;
		void SetFreeSliding (const Standard_Boolean FreeSliding);
		%feature("autodoc", "Args:
	ConstraintOrder(Standard_Integer)

Returns:
	None

Allows you to change the order of the constraint on the  
first point. ConstraintOrder has the default setting of 1.  
The following settings are available:  
-   0-the curve must pass through a point  
-   1-the curve must pass through a point and have a given tangent  
-   2-the curve must pass through a point, have a given tangent and a given curvature.  
  The third setting is only valid for  
FairCurve_MinimalVariation curves.  
These constraints, though geometric, represent the  
mechanical constraints due, for example, to the  
resistance of the material the actual physical batten is made of.") SetConstraintOrder1;
		void SetConstraintOrder1 (const Standard_Integer ConstraintOrder);
		%feature("autodoc", "Args:
	ConstraintOrder(Standard_Integer)

Returns:
	None

Allows you to change the order of the constraint on the  
second point. ConstraintOrder is initialized with the default setting of 1.  
The following settings are available:  
-   0-the curve must pass through a point  
-   1-the curve must pass through a point and have a given tangent  
-   2-the curve must pass through a point, have a given  
  tangent and a given curvature.  
The third setting is only valid for  
FairCurve_MinimalVariation curves.  
These constraints, though geometric, represent the  
mechanical constraints due, for example, to the  
resistance of the material the actual physical batten is made of.") SetConstraintOrder2;
		void SetConstraintOrder2 (const Standard_Integer ConstraintOrder);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)

Returns:
	None

Allows you to change the location of the point, P1, and in  
doing so, modify the curve.  
Warning  
This method changes the angle as well as the point.  
Exceptions  
NullValue if the distance between P1 and P2 is less  
than or equal to the tolerance value for distance in  
Precision::Confusion: P1.IsEqual(P2,  
Precision::Confusion()). The function  
gp_Pnt2d::IsEqual tests to see if this is the case.") SetP1;
		void SetP1 (const gp_Pnt2d & P1);
		%feature("autodoc", "Args:
	P2(gp_Pnt2d)

Returns:
	None

Allows you to change the location of the point, P1, and in  
doing so, modify the curve.  
Warning  
This method changes the angle as well as the point.  
Exceptions  
NullValue if the distance between P1 and P2 is less  
than or equal to the tolerance value for distance in  
Precision::Confusion: P1.IsEqual(P2,  
Precision::Confusion()). The function  
gp_Pnt2d::IsEqual tests to see if this is the case.") SetP2;
		void SetP2 (const gp_Pnt2d & P2);
		%feature("autodoc", "Args:
	Angle1(Standard_Real)

Returns:
	None

Allows you to change the angle Angle1 at the first point,  
P1. The default setting is 0.") SetAngle1;
		void SetAngle1 (const Standard_Real Angle1);
		%feature("autodoc", "Args:
	Angle2(Standard_Real)

Returns:
	None

Allows you to change the angle Angle2 at the second  
point, P2. The default setting is 0.") SetAngle2;
		void SetAngle2 (const Standard_Real Angle2);
		%feature("autodoc", "Args:
	Height(Standard_Real)

Returns:
	None

Allows you to change the height of the deformation.  
 Raises  NegativeValue; -- if  Height <= 0  
if  Height <= 0") SetHeight;
		void SetHeight (const Standard_Real Height);
		%feature("autodoc", "Args:
	Slope(Standard_Real)

Returns:
	None

Allows you to set the slope value, Slope.") SetSlope;
		void SetSlope (const Standard_Real Slope);
		%feature("autodoc", "Args:
	SlidingFactor(Standard_Real)

Returns:
	None

Allows you to change the ratio SlidingFactor. This  
compares the length of the batten and the reference  
length, which is, in turn, a function of the constraints.  
This modification has one of the following two effects:  
-   if you increase the value, it inflates the batten  
-   if you decrease the value, it flattens the batten.  
When sliding is free, the sliding factor is automatically  
computed to satisfy the equilibrium of the batten. When  
sliding is imposed, a value is required for the sliding factor.  
SlidingFactor is initialized with the default setting of 1.") SetSlidingFactor;
		void SetSlidingFactor (const Standard_Real SlidingFactor);
		%feature("autodoc", "Args:
	Code(FairCurve_AnalysisCode)
	NbIterations(Standard_Integer)=50
	Tolerance(Standard_Real)=1.0e-3

Returns:
	virtual Standard_Boolean

Performs the algorithm, using the arguments Code,  
NbIterations and Tolerance and computes the curve  
with respect to the constraints.  
Code will have one of the following values:  
-   OK  
-   NotConverged  
-   InfiniteSliding  
-   NullHeight  
The parameters Tolerance and NbIterations control  
how precise the computation is, and how long it will take.") Compute;
		virtual Standard_Boolean Compute (FairCurve_AnalysisCode &OutValue,const Standard_Integer NbIterations = 50,const Standard_Real Tolerance = 1.0e-3);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the real number value for length Sliding of  
Reference for new constraints. If you want to give a  
specific length to a batten curve, use the following  
syntax: b.SetSlidingFactor(L /  
b.SlidingOfReference()) where b is the  
name of the batten curve object.") SlidingOfReference;
		Standard_Real SlidingOfReference ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the initial free sliding value, false by default.  
Free sliding is generally more aesthetically pleasing  
than constrained sliding. However, the computation can  
fail with values such as angles greater than PI/2. This is  
because the resulting batten length is theoretically infinite.") GetFreeSliding;
		Standard_Boolean GetFreeSliding ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the established first constraint order.") GetConstraintOrder1;
		Standard_Integer GetConstraintOrder1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the established second constraint order.") GetConstraintOrder2;
		Standard_Integer GetConstraintOrder2 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

Returns the established location of the point P1.") GetP1;
		const gp_Pnt2d & GetP1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

Returns the established location of the point P2.") GetP2;
		const gp_Pnt2d & GetP2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the established first angle.") GetAngle1;
		Standard_Real GetAngle1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the established second angle.") GetAngle2;
		Standard_Real GetAngle2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the thickness of the lathe.") GetHeight;
		Standard_Real GetHeight ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the established slope value.") GetSlope;
		Standard_Real GetSlope ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the initial sliding factor.") GetSlidingFactor;
		Standard_Real GetSlidingFactor ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_BSplineCurve

Returns the computed curve a 2d BSpline.") Curve;
		Handle_Geom2d_BSplineCurve Curve ();
		%feature("autodoc", "Args:
	o(Standard_OStream)

Returns:
	virtual void

Prints on the stream o information on the current state  
         of the object.  
 
  Private methodes  --------------------------------------") Dump;
		virtual void Dump (Standard_OStream & o);
};


%feature("shadow") FairCurve_Batten::~FairCurve_Batten %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend FairCurve_Batten {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor FairCurve_BattenLaw;
class FairCurve_BattenLaw : public math_Function {
	public:
		%feature("autodoc", "Args:
	Heigth(Standard_Real)
	Slope(Standard_Real)
	Sliding(Standard_Real)

Returns:
	None

Constructor of linear batten with  
         Heigth : the Heigth at the middle point  
         Slope  : the geometric slope of the batten  
         Sliding : Active Length of the batten without extension") FairCurve_BattenLaw;
		 FairCurve_BattenLaw (const Standard_Real Heigth,const Standard_Real Slope,const Standard_Real Sliding);
		%feature("autodoc", "Args:
	Sliding(Standard_Real)

Returns:
	None

Change the value of sliding") SetSliding;
		void SetSliding (const Standard_Real Sliding);
		%feature("autodoc", "Args:
	Heigth(Standard_Real)

Returns:
	None

Change the value of Heigth at the middle point.") SetHeigth;
		void SetHeigth (const Standard_Real Heigth);
		%feature("autodoc", "Args:
	Slope(Standard_Real)

Returns:
	None

Change the value of the geometric slope.") SetSlope;
		void SetSlope (const Standard_Real Slope);
		%feature("autodoc", "Args:
	T(Standard_Real)
	THeigth(Standard_Real)

Returns:
	Standard_Boolean

computes the value of  the heigth for the parameter T  
         on  the neutral fibber") Value;
		Standard_Boolean Value (const Standard_Real T,Standard_Real &OutValue);
};


%feature("shadow") FairCurve_BattenLaw::~FairCurve_BattenLaw %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend FairCurve_BattenLaw {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor FairCurve_DistributionOfEnergy;
class FairCurve_DistributionOfEnergy : public math_FunctionSet {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

returns the number of variables of the function.") NbVariables;
		virtual Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

returns the number of equations of the function.") NbEquations;
		virtual Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	DerivativeOrder(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetDerivativeOrder;
		void SetDerivativeOrder (const Standard_Integer DerivativeOrder);
};


%feature("shadow") FairCurve_DistributionOfEnergy::~FairCurve_DistributionOfEnergy %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend FairCurve_DistributionOfEnergy {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor FairCurve_Energy;
class FairCurve_Energy : public math_MultipleVarFunctionWithHessian {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

returns the number of variables of the energy.") NbVariables;
		virtual Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	X(math_Vector)
	E(Standard_Real)

Returns:
	virtual Standard_Boolean

computes the values of the Energys E for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Value;
		virtual Standard_Boolean Value (const math_Vector & X,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(math_Vector)
	G(math_Vector)

Returns:
	virtual Standard_Boolean

//!computes the gradient <G> of the energys for the  
        variable <X>.  
        Returns True if the computation was done successfully,  
        False otherwise.") Gradient;
		virtual Standard_Boolean Gradient (const math_Vector & X,math_Vector & G);
		%feature("autodoc", "Args:
	X(math_Vector)
	E(Standard_Real)
	G(math_Vector)

Returns:
	virtual Standard_Boolean

computes the Energy <E> and the gradient <G> of the  
         energy for the variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Values;
		virtual Standard_Boolean Values (const math_Vector & X,Standard_Real &OutValue,math_Vector & G);
		%feature("autodoc", "Args:
	X(math_Vector)
	E(Standard_Real)
	G(math_Vector)
	H(math_Matrix)

Returns:
	virtual Standard_Boolean

computes the Energy  <E>, the gradient <G> and the  
         Hessian   <H> of  the  energy  for  the   variable <X>.  
         Returns   True  if    the  computation   was  done  
         successfully, False otherwise.") Values;
		virtual Standard_Boolean Values (const math_Vector & X,Standard_Real &OutValue,math_Vector & G,math_Matrix & H);
		%feature("autodoc", "Args:
	X(math_Vector)

Returns:
	virtual Standard_Boolean

compute the variables <X> wich correspond with the field <MyPoles>") Variable;
		virtual Standard_Boolean Variable (math_Vector & X);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColgp_HArray1OfPnt2d

return  the  poles") Poles;
		const Handle_TColgp_HArray1OfPnt2d & Poles ();
};


%feature("shadow") FairCurve_Energy::~FairCurve_Energy %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend FairCurve_Energy {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor FairCurve_Newton;
class FairCurve_Newton : public math_NewtonMinimum {
	public:
		%feature("autodoc", "Args:
	F(math_MultipleVarFunctionWithHessian)
	StartingPoint(math_Vector)
	SpatialTolerance(Standard_Real)=1.0e-7
	CriteriumTolerance(Standard_Real)=1.0e-2
	NbIterations(Standard_Integer)=40
	Convexity(Standard_Real)=1.0e-6
	WithSingularity(Standard_Boolean)=Standard_True

Returns:
	None

-- Given the  starting   point  StartingPoint,  
           The tolerance  required on  the  solution is given  by  
           Tolerance.  
            Iteration are  stopped if  
            (!WithSingularity)  and H(F(Xi)) is not definite  
            positive  (if the smaller eigenvalue of H < Convexity)  
            or IsConverged() returns True for 2 successives Iterations.  
 Warning: Obsolete Constructor (because IsConverged can not be redefined  
          with this. )") FairCurve_Newton;
		 FairCurve_Newton (math_MultipleVarFunctionWithHessian & F,const math_Vector & StartingPoint,const Standard_Real SpatialTolerance = 1.0e-7,const Standard_Real CriteriumTolerance = 1.0e-2,const Standard_Integer NbIterations = 40,const Standard_Real Convexity = 1.0e-6,const Standard_Boolean WithSingularity = Standard_True);
		%feature("autodoc", "Args:
	F(math_MultipleVarFunctionWithHessian)
	SpatialTolerance(Standard_Real)=1.0e-7
	Tolerance(Standard_Real)=1.0e-7
	NbIterations(Standard_Integer)=40
	Convexity(Standard_Real)=1.0e-6
	WithSingularity(Standard_Boolean)=Standard_True

Returns:
	None

The tolerance  required on  the  solution is given  by  
           Tolerance.  
            Iteration are  stopped if  
            (!WithSingularity)  and H(F(Xi)) is not definite  
            positive  (if the smaller eigenvalue of H < Convexity)  
           or IsConverged() returns True for 2 successives Iterations.  
 Warning: This constructor do not computation") FairCurve_Newton;
		 FairCurve_Newton (math_MultipleVarFunctionWithHessian & F,const Standard_Real SpatialTolerance = 1.0e-7,const Standard_Real Tolerance = 1.0e-7,const Standard_Integer NbIterations = 40,const Standard_Real Convexity = 1.0e-6,const Standard_Boolean WithSingularity = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

This method is  called    at the end  of   each  
         iteration to  check the convergence :  
         || Xi+1 - Xi || < SpatialTolerance/100 Or  
         || Xi+1 - Xi || < SpatialTolerance and  
         |F(Xi+1) - F(Xi)| < CriteriumTolerance * |F(xi)|  
         It can be redefined in a sub-class to implement a specific test.") IsConverged;
		virtual Standard_Boolean IsConverged ();
};


%feature("shadow") FairCurve_Newton::~FairCurve_Newton %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend FairCurve_Newton {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor FairCurve_DistributionOfJerk;
class FairCurve_DistributionOfJerk : public FairCurve_DistributionOfEnergy {
	public:
		%feature("autodoc", "Args:
	BSplOrder(Standard_Integer)
	FlatKnots(Handle_TColStd_HArray1OfReal)
	Poles(Handle_TColgp_HArray1OfPnt2d)
	DerivativeOrder(Standard_Integer)
	Law(FairCurve_BattenLaw)
	NbValAux(Standard_Integer)=0

Returns:
	None

No detailed docstring for this function.") FairCurve_DistributionOfJerk;
		 FairCurve_DistributionOfJerk (const Standard_Integer BSplOrder,const Handle_TColStd_HArray1OfReal & FlatKnots,const Handle_TColgp_HArray1OfPnt2d & Poles,const Standard_Integer DerivativeOrder,const FairCurve_BattenLaw & Law,const Standard_Integer NbValAux = 0);
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)

Returns:
	virtual Standard_Boolean

computes the values <F> of the functions for the  
         variable <X>.  
         returns True if the computation was done successfully,  
         False otherwise.") Value;
		virtual Standard_Boolean Value (const math_Vector & X,math_Vector & F);
};


%feature("shadow") FairCurve_DistributionOfJerk::~FairCurve_DistributionOfJerk %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend FairCurve_DistributionOfJerk {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor FairCurve_DistributionOfSagging;
class FairCurve_DistributionOfSagging : public FairCurve_DistributionOfEnergy {
	public:
		%feature("autodoc", "Args:
	BSplOrder(Standard_Integer)
	FlatKnots(Handle_TColStd_HArray1OfReal)
	Poles(Handle_TColgp_HArray1OfPnt2d)
	DerivativeOrder(Standard_Integer)
	Law(FairCurve_BattenLaw)
	NbValAux(Standard_Integer)=0

Returns:
	None

No detailed docstring for this function.") FairCurve_DistributionOfSagging;
		 FairCurve_DistributionOfSagging (const Standard_Integer BSplOrder,const Handle_TColStd_HArray1OfReal & FlatKnots,const Handle_TColgp_HArray1OfPnt2d & Poles,const Standard_Integer DerivativeOrder,const FairCurve_BattenLaw & Law,const Standard_Integer NbValAux = 0);
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)

Returns:
	virtual Standard_Boolean

computes the values <F> of the functions for the  
         variable <X>.  
         returns True if the computation was done successfully,  
         False otherwise.") Value;
		virtual Standard_Boolean Value (const math_Vector & X,math_Vector & F);
};


%feature("shadow") FairCurve_DistributionOfSagging::~FairCurve_DistributionOfSagging %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend FairCurve_DistributionOfSagging {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor FairCurve_DistributionOfTension;
class FairCurve_DistributionOfTension : public FairCurve_DistributionOfEnergy {
	public:
		%feature("autodoc", "Args:
	BSplOrder(Standard_Integer)
	FlatKnots(Handle_TColStd_HArray1OfReal)
	Poles(Handle_TColgp_HArray1OfPnt2d)
	DerivativeOrder(Standard_Integer)
	LengthSliding(Standard_Real)
	Law(FairCurve_BattenLaw)
	NbValAux(Standard_Integer)=0
	Uniform(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") FairCurve_DistributionOfTension;
		 FairCurve_DistributionOfTension (const Standard_Integer BSplOrder,const Handle_TColStd_HArray1OfReal & FlatKnots,const Handle_TColgp_HArray1OfPnt2d & Poles,const Standard_Integer DerivativeOrder,const Standard_Real LengthSliding,const FairCurve_BattenLaw & Law,const Standard_Integer NbValAux = 0,const Standard_Boolean Uniform = Standard_False);
		%feature("autodoc", "Args:
	LengthSliding(Standard_Real)

Returns:
	None

change the length sliding") SetLengthSliding;
		void SetLengthSliding (const Standard_Real LengthSliding);
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)

Returns:
	virtual Standard_Boolean

computes the values <F> of the functions for the  
         variable <X>.  
         returns True if the computation was done successfully,  
         False otherwise.") Value;
		virtual Standard_Boolean Value (const math_Vector & X,math_Vector & F);
};


%feature("shadow") FairCurve_DistributionOfTension::~FairCurve_DistributionOfTension %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend FairCurve_DistributionOfTension {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor FairCurve_EnergyOfBatten;
class FairCurve_EnergyOfBatten : public FairCurve_Energy {
	public:
		%feature("autodoc", "Args:
	BSplOrder(Standard_Integer)
	FlatKnots(Handle_TColStd_HArray1OfReal)
	Poles(Handle_TColgp_HArray1OfPnt2d)
	ContrOrder1(Standard_Integer)
	ContrOrder2(Standard_Integer)
	Law(FairCurve_BattenLaw)
	LengthSliding(Standard_Real)
	FreeSliding(Standard_Boolean)=Standard_True
	Angle1(Standard_Real)=0
	Angle2(Standard_Real)=0

Returns:
	None

Angles corresspond to the Ox axis") FairCurve_EnergyOfBatten;
		 FairCurve_EnergyOfBatten (const Standard_Integer BSplOrder,const Handle_TColStd_HArray1OfReal & FlatKnots,const Handle_TColgp_HArray1OfPnt2d & Poles,const Standard_Integer ContrOrder1,const Standard_Integer ContrOrder2,const FairCurve_BattenLaw & Law,const Standard_Real LengthSliding,const Standard_Boolean FreeSliding = Standard_True,const Standard_Real Angle1 = 0,const Standard_Real Angle2 = 0);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

return  the  lengthSliding = P1P2 + Sliding") LengthSliding;
		Standard_Real LengthSliding ();
		%feature("autodoc", "Args:
	None
Returns:
	FairCurve_AnalysisCode

return  the status") Status;
		FairCurve_AnalysisCode Status ();
		%feature("autodoc", "Args:
	X(math_Vector)

Returns:
	virtual Standard_Boolean

compute the variables <X> wich correspond with the field <MyPoles>") Variable;
		virtual Standard_Boolean Variable (math_Vector & X);
};


%feature("shadow") FairCurve_EnergyOfBatten::~FairCurve_EnergyOfBatten %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend FairCurve_EnergyOfBatten {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor FairCurve_EnergyOfMVC;
class FairCurve_EnergyOfMVC : public FairCurve_Energy {
	public:
		%feature("autodoc", "Args:
	BSplOrder(Standard_Integer)
	FlatKnots(Handle_TColStd_HArray1OfReal)
	Poles(Handle_TColgp_HArray1OfPnt2d)
	ContrOrder1(Standard_Integer)
	ContrOrder2(Standard_Integer)
	Law(FairCurve_BattenLaw)
	PhysicalRatio(Standard_Real)
	LengthSliding(Standard_Real)
	FreeSliding(Standard_Boolean)=Standard_True
	Angle1(Standard_Real)=0
	Angle2(Standard_Real)=0
	Curvature1(Standard_Real)=0
	Curvature2(Standard_Real)=0

Returns:
	None

Angles corresspond to the Ox axis") FairCurve_EnergyOfMVC;
		 FairCurve_EnergyOfMVC (const Standard_Integer BSplOrder,const Handle_TColStd_HArray1OfReal & FlatKnots,const Handle_TColgp_HArray1OfPnt2d & Poles,const Standard_Integer ContrOrder1,const Standard_Integer ContrOrder2,const FairCurve_BattenLaw & Law,const Standard_Real PhysicalRatio,const Standard_Real LengthSliding,const Standard_Boolean FreeSliding = Standard_True,const Standard_Real Angle1 = 0,const Standard_Real Angle2 = 0,const Standard_Real Curvature1 = 0,const Standard_Real Curvature2 = 0);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

return  the  lengthSliding = P1P2 + Sliding") LengthSliding;
		Standard_Real LengthSliding ();
		%feature("autodoc", "Args:
	None
Returns:
	FairCurve_AnalysisCode

return  the status") Status;
		FairCurve_AnalysisCode Status ();
		%feature("autodoc", "Args:
	X(math_Vector)

Returns:
	virtual Standard_Boolean

compute the variables <X> wich correspond with the field <MyPoles>") Variable;
		virtual Standard_Boolean Variable (math_Vector & X);
};


%feature("shadow") FairCurve_EnergyOfMVC::~FairCurve_EnergyOfMVC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend FairCurve_EnergyOfMVC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor FairCurve_MinimalVariation;
class FairCurve_MinimalVariation : public FairCurve_Batten {
	public:
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)
	Heigth(Standard_Real)
	Slope(Standard_Real)=0
	PhysicalRatio(Standard_Real)=0

Returns:
	None

Constructs the two contact points P1 and P2  and the geometrical  
         characteristics of the batten (elastic beam)  
  These include the real number values for height of  
deformation Height, slope value Slope, and kind of  
energy PhysicalRatio. The kinds of energy include:  
-   Jerk (0)  
-   Sagging (1).  
Note that the default setting for Physical Ration is in FairCurve_Batten  
         Other parameters are initialized as follow :  
          - FreeSliding = False  
          - ConstraintOrder1 = 1  
          - ConstraintOrder2 = 1  
          - Angle1 = 0  
          - Angle2 = 0  
          - Curvature1 = 0  
          - Curvature2 = 0  
          - SlidingFactor = 1  
Warning  
If PhysicalRatio equals 1, you cannot impose constraints on curvature.  
Exceptions  
NegativeValue if Height is less than or equal to 0.  
NullValue if the distance between P1 and P2 is less  
than or equal to the tolerance value for distance in  
Precision::Confusion: P1.IsEqual(P2,  
Precision::Confusion()). The function  
gp_Pnt2d::IsEqual tests to see if this is the case.   Definition of the geometricals constraints") FairCurve_MinimalVariation;
		 FairCurve_MinimalVariation (const gp_Pnt2d & P1,const gp_Pnt2d & P2,const Standard_Real Heigth,const Standard_Real Slope = 0,const Standard_Real PhysicalRatio = 0);
		%feature("autodoc", "Args:
	Curvature(Standard_Real)

Returns:
	None

Allows you to set a new constraint on curvature at the first point.") SetCurvature1;
		void SetCurvature1 (const Standard_Real Curvature);
		%feature("autodoc", "Args:
	Curvature(Standard_Real)

Returns:
	None

Allows you to set a new constraint on curvature at the second point.") SetCurvature2;
		void SetCurvature2 (const Standard_Real Curvature);
		%feature("autodoc", "Args:
	Ratio(Standard_Real)

Returns:
	None

Allows you to set the physical ratio Ratio.  
The kinds of energy which you can specify include:  
         0 is only 'Jerk' Energy  
         1 is only 'Sagging' Energy like batten  
 Warning: if Ratio is 1 it is impossible to impose curvature constraints.  
 Raises  DomainError if Ratio < 0 or Ratio > 1") SetPhysicalRatio;
		void SetPhysicalRatio (const Standard_Real Ratio);
		%feature("autodoc", "Args:
	ACode(FairCurve_AnalysisCode)
	NbIterations(Standard_Integer)=50
	Tolerance(Standard_Real)=1.0e-3

Returns:
	virtual Standard_Boolean

Computes the curve with respect to the constraints,  
NbIterations and Tolerance. The tolerance setting  
allows you to control the precision of computation, and  
the maximum number of iterations allows you to set a limit on computation time.") Compute;
		virtual Standard_Boolean Compute (FairCurve_AnalysisCode &OutValue,const Standard_Integer NbIterations = 50,const Standard_Real Tolerance = 1.0e-3);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the first established curvature.") GetCurvature1;
		Standard_Real GetCurvature1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the second established curvature.") GetCurvature2;
		Standard_Real GetCurvature2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the physical ratio, or kind of energy.") GetPhysicalRatio;
		Standard_Real GetPhysicalRatio ();
		%feature("autodoc", "Args:
	o(Standard_OStream)

Returns:
	virtual void

Prints on the stream o information on the current state  
         of the object.  
         Is used to redefine the operator <<.") Dump;
		virtual void Dump (Standard_OStream & o);
};


%feature("shadow") FairCurve_MinimalVariation::~FairCurve_MinimalVariation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend FairCurve_MinimalVariation {
	void _kill_pointed() {
		delete $self;
	}
};
