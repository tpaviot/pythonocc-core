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
%module (package="OCC") FairCurve

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


%include FairCurve_headers.i


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
		%feature("compactdefaultargs") FairCurve_Batten;
		%feature("autodoc", "	* Constructor with the two points and the geometrical characteristics of the batten (elastic beam) Height is the height of the deformation, and Slope is the slope value, initialized at 0. The user can then supply the desired slope value by the method, SetSlope. Other parameters are initialized as follow : - FreeSliding = False - ConstraintOrder1 = 1 - ConstraintOrder2 = 1 - Angle1 = 0 - Angle2 = 0 - SlidingFactor = 1 Exceptions NegativeValue if Height is less than or equal to 0. NullValue if the distance between P1 and P2 is less than or equal to the tolerance value for distance in Precision::Confusion: P1.IsEqual(P2, Precision::Confusion()). The function gp_Pnt2d::IsEqual tests to see if this is the case.

	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:param Height:
	:type Height: float
	:param Slope: default value is 0
	:type Slope: float
	:rtype: None
") FairCurve_Batten;
		 FairCurve_Batten (const gp_Pnt2d & P1,const gp_Pnt2d & P2,const Standard_Real Height,const Standard_Real Slope = 0);
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	:rtype: void
") Delete;
		virtual void Delete ();
		%feature("compactdefaultargs") SetFreeSliding;
		%feature("autodoc", "	* Freesliding is initialized with the default setting false. When Freesliding is set to true and, as a result, sliding is free, the sliding factor is automatically computed to satisfy the equilibrium of the batten.

	:param FreeSliding:
	:type FreeSliding: bool
	:rtype: None
") SetFreeSliding;
		void SetFreeSliding (const Standard_Boolean FreeSliding);
		%feature("compactdefaultargs") SetConstraintOrder1;
		%feature("autodoc", "	* Allows you to change the order of the constraint on the first point. ConstraintOrder has the default setting of 1. The following settings are available: - 0-the curve must pass through a point - 1-the curve must pass through a point and have a given tangent - 2-the curve must pass through a point, have a given tangent and a given curvature. The third setting is only valid for FairCurve_MinimalVariation curves. These constraints, though geometric, represent the mechanical constraints due, for example, to the resistance of the material the actual physical batten is made of.

	:param ConstraintOrder:
	:type ConstraintOrder: int
	:rtype: None
") SetConstraintOrder1;
		void SetConstraintOrder1 (const Standard_Integer ConstraintOrder);
		%feature("compactdefaultargs") SetConstraintOrder2;
		%feature("autodoc", "	* Allows you to change the order of the constraint on the second point. ConstraintOrder is initialized with the default setting of 1. The following settings are available: - 0-the curve must pass through a point - 1-the curve must pass through a point and have a given tangent - 2-the curve must pass through a point, have a given tangent and a given curvature. The third setting is only valid for FairCurve_MinimalVariation curves. These constraints, though geometric, represent the mechanical constraints due, for example, to the resistance of the material the actual physical batten is made of.

	:param ConstraintOrder:
	:type ConstraintOrder: int
	:rtype: None
") SetConstraintOrder2;
		void SetConstraintOrder2 (const Standard_Integer ConstraintOrder);
		%feature("compactdefaultargs") SetP1;
		%feature("autodoc", "	* Allows you to change the location of the point, P1, and in doing so, modify the curve. Warning This method changes the angle as well as the point. Exceptions NullValue if the distance between P1 and P2 is less than or equal to the tolerance value for distance in Precision::Confusion: P1.IsEqual(P2, Precision::Confusion()). The function gp_Pnt2d::IsEqual tests to see if this is the case.

	:param P1:
	:type P1: gp_Pnt2d
	:rtype: None
") SetP1;
		void SetP1 (const gp_Pnt2d & P1);
		%feature("compactdefaultargs") SetP2;
		%feature("autodoc", "	* Allows you to change the location of the point, P1, and in doing so, modify the curve. Warning This method changes the angle as well as the point. Exceptions NullValue if the distance between P1 and P2 is less than or equal to the tolerance value for distance in Precision::Confusion: P1.IsEqual(P2, Precision::Confusion()). The function gp_Pnt2d::IsEqual tests to see if this is the case.

	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") SetP2;
		void SetP2 (const gp_Pnt2d & P2);
		%feature("compactdefaultargs") SetAngle1;
		%feature("autodoc", "	* Allows you to change the angle Angle1 at the first point, P1. The default setting is 0.

	:param Angle1:
	:type Angle1: float
	:rtype: None
") SetAngle1;
		void SetAngle1 (const Standard_Real Angle1);
		%feature("compactdefaultargs") SetAngle2;
		%feature("autodoc", "	* Allows you to change the angle Angle2 at the second point, P2. The default setting is 0.

	:param Angle2:
	:type Angle2: float
	:rtype: None
") SetAngle2;
		void SetAngle2 (const Standard_Real Angle2);
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "	* Allows you to change the height of the deformation. Raises NegativeValue; -- if Height <= 0 if Height <= 0

	:param Height:
	:type Height: float
	:rtype: None
") SetHeight;
		void SetHeight (const Standard_Real Height);
		%feature("compactdefaultargs") SetSlope;
		%feature("autodoc", "	* Allows you to set the slope value, Slope.

	:param Slope:
	:type Slope: float
	:rtype: None
") SetSlope;
		void SetSlope (const Standard_Real Slope);
		%feature("compactdefaultargs") SetSlidingFactor;
		%feature("autodoc", "	* Allows you to change the ratio SlidingFactor. This compares the length of the batten and the reference length, which is, in turn, a function of the constraints. This modification has one of the following two effects: - if you increase the value, it inflates the batten - if you decrease the value, it flattens the batten. When sliding is free, the sliding factor is automatically computed to satisfy the equilibrium of the batten. When sliding is imposed, a value is required for the sliding factor. SlidingFactor is initialized with the default setting of 1.

	:param SlidingFactor:
	:type SlidingFactor: float
	:rtype: None
") SetSlidingFactor;
		void SetSlidingFactor (const Standard_Real SlidingFactor);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Performs the algorithm, using the arguments Code, NbIterations and Tolerance and computes the curve with respect to the constraints. Code will have one of the following values: - OK - NotConverged - InfiniteSliding - NullHeight The parameters Tolerance and NbIterations control how precise the computation is, and how long it will take.

	:param Code:
	:type Code: FairCurve_AnalysisCode &
	:param NbIterations: default value is 50
	:type NbIterations: int
	:param Tolerance: default value is 1.0e-3
	:type Tolerance: float
	:rtype: bool
") Compute;
		virtual Standard_Boolean Compute (FairCurve_AnalysisCode &OutValue,const Standard_Integer NbIterations = 50,const Standard_Real Tolerance = 1.0e-3);
		%feature("compactdefaultargs") SlidingOfReference;
		%feature("autodoc", "	* Computes the real number value for length Sliding of Reference for new constraints. If you want to give a specific length to a batten curve, use the following syntax: b.SetSlidingFactor(L / b.SlidingOfReference()) where b is the name of the batten curve object.

	:rtype: float
") SlidingOfReference;
		Standard_Real SlidingOfReference ();
		%feature("compactdefaultargs") GetFreeSliding;
		%feature("autodoc", "	* Returns the initial free sliding value, false by default. Free sliding is generally more aesthetically pleasing than constrained sliding. However, the computation can fail with values such as angles greater than PI/2. This is because the resulting batten length is theoretically infinite.

	:rtype: bool
") GetFreeSliding;
		Standard_Boolean GetFreeSliding ();
		%feature("compactdefaultargs") GetConstraintOrder1;
		%feature("autodoc", "	* Returns the established first constraint order.

	:rtype: int
") GetConstraintOrder1;
		Standard_Integer GetConstraintOrder1 ();
		%feature("compactdefaultargs") GetConstraintOrder2;
		%feature("autodoc", "	* Returns the established second constraint order.

	:rtype: int
") GetConstraintOrder2;
		Standard_Integer GetConstraintOrder2 ();
		%feature("compactdefaultargs") GetP1;
		%feature("autodoc", "	* Returns the established location of the point P1.

	:rtype: gp_Pnt2d
") GetP1;
		const gp_Pnt2d  GetP1 ();
		%feature("compactdefaultargs") GetP2;
		%feature("autodoc", "	* Returns the established location of the point P2.

	:rtype: gp_Pnt2d
") GetP2;
		const gp_Pnt2d  GetP2 ();
		%feature("compactdefaultargs") GetAngle1;
		%feature("autodoc", "	* Returns the established first angle.

	:rtype: float
") GetAngle1;
		Standard_Real GetAngle1 ();
		%feature("compactdefaultargs") GetAngle2;
		%feature("autodoc", "	* Returns the established second angle.

	:rtype: float
") GetAngle2;
		Standard_Real GetAngle2 ();
		%feature("compactdefaultargs") GetHeight;
		%feature("autodoc", "	* Returns the thickness of the lathe.

	:rtype: float
") GetHeight;
		Standard_Real GetHeight ();
		%feature("compactdefaultargs") GetSlope;
		%feature("autodoc", "	* Returns the established slope value.

	:rtype: float
") GetSlope;
		Standard_Real GetSlope ();
		%feature("compactdefaultargs") GetSlidingFactor;
		%feature("autodoc", "	* Returns the initial sliding factor.

	:rtype: float
") GetSlidingFactor;
		Standard_Real GetSlidingFactor ();
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	* Returns the computed curve a 2d BSpline.

	:rtype: Handle_Geom2d_BSplineCurve
") Curve;
		Handle_Geom2d_BSplineCurve Curve ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend FairCurve_Batten {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor FairCurve_BattenLaw;
class FairCurve_BattenLaw : public math_Function {
	public:
		%feature("compactdefaultargs") FairCurve_BattenLaw;
		%feature("autodoc", "	* Constructor of linear batten with Heigth : the Heigth at the middle point Slope : the geometric slope of the batten Sliding : Active Length of the batten without extension

	:param Heigth:
	:type Heigth: float
	:param Slope:
	:type Slope: float
	:param Sliding:
	:type Sliding: float
	:rtype: None
") FairCurve_BattenLaw;
		 FairCurve_BattenLaw (const Standard_Real Heigth,const Standard_Real Slope,const Standard_Real Sliding);
		%feature("compactdefaultargs") SetSliding;
		%feature("autodoc", "	* Change the value of sliding

	:param Sliding:
	:type Sliding: float
	:rtype: None
") SetSliding;
		void SetSliding (const Standard_Real Sliding);
		%feature("compactdefaultargs") SetHeigth;
		%feature("autodoc", "	* Change the value of Heigth at the middle point.

	:param Heigth:
	:type Heigth: float
	:rtype: None
") SetHeigth;
		void SetHeigth (const Standard_Real Heigth);
		%feature("compactdefaultargs") SetSlope;
		%feature("autodoc", "	* Change the value of the geometric slope.

	:param Slope:
	:type Slope: float
	:rtype: None
") SetSlope;
		void SetSlope (const Standard_Real Slope);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the value of the heigth for the parameter T on the neutral fibber

	:param T:
	:type T: float
	:param THeigth:
	:type THeigth: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real T,Standard_Real &OutValue);
};


%extend FairCurve_BattenLaw {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor FairCurve_DistributionOfEnergy;
class FairCurve_DistributionOfEnergy : public math_FunctionSet {
	public:
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	* returns the number of variables of the function.

	:rtype: int
") NbVariables;
		virtual Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* returns the number of equations of the function.

	:rtype: int
") NbEquations;
		virtual Standard_Integer NbEquations ();
		%feature("compactdefaultargs") SetDerivativeOrder;
		%feature("autodoc", "	:param DerivativeOrder:
	:type DerivativeOrder: int
	:rtype: None
") SetDerivativeOrder;
		void SetDerivativeOrder (const Standard_Integer DerivativeOrder);
};


%extend FairCurve_DistributionOfEnergy {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor FairCurve_Energy;
class FairCurve_Energy : public math_MultipleVarFunctionWithHessian {
	public:
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	* returns the number of variables of the energy.

	:rtype: int
") NbVariables;
		virtual Standard_Integer NbVariables ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the values of the Energys E for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param E:
	:type E: float &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "	* computes the gradient <G> of the energys for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Gradient;
		virtual Standard_Boolean Gradient (const math_Vector & X,math_Vector & G);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* computes the Energy <E> and the gradient <G> of the energy for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param E:
	:type E: float &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Values;
		virtual Standard_Boolean Values (const math_Vector & X,Standard_Real &OutValue,math_Vector & G);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* computes the Energy <E>, the gradient <G> and the Hessian <H> of the energy for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param E:
	:type E: float &
	:param G:
	:type G: math_Vector &
	:param H:
	:type H: math_Matrix &
	:rtype: bool
") Values;
		virtual Standard_Boolean Values (const math_Vector & X,Standard_Real &OutValue,math_Vector & G,math_Matrix & H);
		%feature("compactdefaultargs") Variable;
		%feature("autodoc", "	* compute the variables <X> wich correspond with the field <MyPoles>

	:param X:
	:type X: math_Vector &
	:rtype: bool
") Variable;
		virtual Standard_Boolean Variable (math_Vector & X);
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "	* return the poles

	:rtype: Handle_TColgp_HArray1OfPnt2d
") Poles;
		Handle_TColgp_HArray1OfPnt2d Poles ();
};


%extend FairCurve_Energy {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor FairCurve_Newton;
class FairCurve_Newton : public math_NewtonMinimum {
	public:
		%feature("compactdefaultargs") FairCurve_Newton;
		%feature("autodoc", "	* The tolerance required on the solution is given by Tolerance. Iteration are stopped if (!WithSingularity) and H(F(Xi)) is not definite positive (if the smaller eigenvalue of H < Convexity) or IsConverged() returns True for 2 successives Iterations. Warning: This constructor do not computation

	:param theFunction:
	:type theFunction: math_MultipleVarFunctionWithHessian &
	:param theSpatialTolerance: default value is 1.0e-7
	:type theSpatialTolerance: float
	:param theCriteriumTolerance: default value is 1.0e-7
	:type theCriteriumTolerance: float
	:param theNbIterations: default value is 40
	:type theNbIterations: int
	:param theConvexity: default value is 1.0e-6
	:type theConvexity: float
	:param theWithSingularity: default value is Standard_True
	:type theWithSingularity: bool
	:rtype: None
") FairCurve_Newton;
		 FairCurve_Newton (const math_MultipleVarFunctionWithHessian & theFunction,const Standard_Real theSpatialTolerance = 1.0e-7,const Standard_Real theCriteriumTolerance = 1.0e-7,const Standard_Integer theNbIterations = 40,const Standard_Real theConvexity = 1.0e-6,const Standard_Boolean theWithSingularity = Standard_True);
		%feature("compactdefaultargs") IsConverged;
		%feature("autodoc", "	* This method is called at the end of each iteration to check the convergence : || Xi+1 - Xi || < SpatialTolerance/100 Or || Xi+1 - Xi || < SpatialTolerance and |F(Xi+1) - F(Xi)| < CriteriumTolerance * |F(xi)| It can be redefined in a sub-class to implement a specific test.

	:rtype: bool
") IsConverged;
		virtual Standard_Boolean IsConverged ();
};


%extend FairCurve_Newton {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor FairCurve_DistributionOfJerk;
class FairCurve_DistributionOfJerk : public FairCurve_DistributionOfEnergy {
	public:
		%feature("compactdefaultargs") FairCurve_DistributionOfJerk;
		%feature("autodoc", "	:param BSplOrder:
	:type BSplOrder: int
	:param FlatKnots:
	:type FlatKnots: Handle_TColStd_HArray1OfReal &
	:param Poles:
	:type Poles: Handle_TColgp_HArray1OfPnt2d
	:param DerivativeOrder:
	:type DerivativeOrder: int
	:param Law:
	:type Law: FairCurve_BattenLaw &
	:param NbValAux: default value is 0
	:type NbValAux: int
	:rtype: None
") FairCurve_DistributionOfJerk;
		 FairCurve_DistributionOfJerk (const Standard_Integer BSplOrder,const Handle_TColStd_HArray1OfReal & FlatKnots,const Handle_TColgp_HArray1OfPnt2d & Poles,const Standard_Integer DerivativeOrder,const FairCurve_BattenLaw & Law,const Standard_Integer NbValAux = 0);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the values <F> of the functions for the variable <X>. returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & X,math_Vector & F);
};


%extend FairCurve_DistributionOfJerk {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor FairCurve_DistributionOfSagging;
class FairCurve_DistributionOfSagging : public FairCurve_DistributionOfEnergy {
	public:
		%feature("compactdefaultargs") FairCurve_DistributionOfSagging;
		%feature("autodoc", "	:param BSplOrder:
	:type BSplOrder: int
	:param FlatKnots:
	:type FlatKnots: Handle_TColStd_HArray1OfReal &
	:param Poles:
	:type Poles: Handle_TColgp_HArray1OfPnt2d
	:param DerivativeOrder:
	:type DerivativeOrder: int
	:param Law:
	:type Law: FairCurve_BattenLaw &
	:param NbValAux: default value is 0
	:type NbValAux: int
	:rtype: None
") FairCurve_DistributionOfSagging;
		 FairCurve_DistributionOfSagging (const Standard_Integer BSplOrder,const Handle_TColStd_HArray1OfReal & FlatKnots,const Handle_TColgp_HArray1OfPnt2d & Poles,const Standard_Integer DerivativeOrder,const FairCurve_BattenLaw & Law,const Standard_Integer NbValAux = 0);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the values <F> of the functions for the variable <X>. returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & X,math_Vector & F);
};


%extend FairCurve_DistributionOfSagging {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor FairCurve_DistributionOfTension;
class FairCurve_DistributionOfTension : public FairCurve_DistributionOfEnergy {
	public:
		%feature("compactdefaultargs") FairCurve_DistributionOfTension;
		%feature("autodoc", "	:param BSplOrder:
	:type BSplOrder: int
	:param FlatKnots:
	:type FlatKnots: Handle_TColStd_HArray1OfReal &
	:param Poles:
	:type Poles: Handle_TColgp_HArray1OfPnt2d
	:param DerivativeOrder:
	:type DerivativeOrder: int
	:param LengthSliding:
	:type LengthSliding: float
	:param Law:
	:type Law: FairCurve_BattenLaw &
	:param NbValAux: default value is 0
	:type NbValAux: int
	:param Uniform: default value is Standard_False
	:type Uniform: bool
	:rtype: None
") FairCurve_DistributionOfTension;
		 FairCurve_DistributionOfTension (const Standard_Integer BSplOrder,const Handle_TColStd_HArray1OfReal & FlatKnots,const Handle_TColgp_HArray1OfPnt2d & Poles,const Standard_Integer DerivativeOrder,const Standard_Real LengthSliding,const FairCurve_BattenLaw & Law,const Standard_Integer NbValAux = 0,const Standard_Boolean Uniform = Standard_False);
		%feature("compactdefaultargs") SetLengthSliding;
		%feature("autodoc", "	* change the length sliding

	:param LengthSliding:
	:type LengthSliding: float
	:rtype: None
") SetLengthSliding;
		void SetLengthSliding (const Standard_Real LengthSliding);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the values <F> of the functions for the variable <X>. returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & X,math_Vector & F);
};


%extend FairCurve_DistributionOfTension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor FairCurve_EnergyOfBatten;
class FairCurve_EnergyOfBatten : public FairCurve_Energy {
	public:
		%feature("compactdefaultargs") FairCurve_EnergyOfBatten;
		%feature("autodoc", "	* Angles corresspond to the Ox axis

	:param BSplOrder:
	:type BSplOrder: int
	:param FlatKnots:
	:type FlatKnots: Handle_TColStd_HArray1OfReal &
	:param Poles:
	:type Poles: Handle_TColgp_HArray1OfPnt2d
	:param ContrOrder1:
	:type ContrOrder1: int
	:param ContrOrder2:
	:type ContrOrder2: int
	:param Law:
	:type Law: FairCurve_BattenLaw &
	:param LengthSliding:
	:type LengthSliding: float
	:param FreeSliding: default value is Standard_True
	:type FreeSliding: bool
	:param Angle1: default value is 0
	:type Angle1: float
	:param Angle2: default value is 0
	:type Angle2: float
	:rtype: None
") FairCurve_EnergyOfBatten;
		 FairCurve_EnergyOfBatten (const Standard_Integer BSplOrder,const Handle_TColStd_HArray1OfReal & FlatKnots,const Handle_TColgp_HArray1OfPnt2d & Poles,const Standard_Integer ContrOrder1,const Standard_Integer ContrOrder2,const FairCurve_BattenLaw & Law,const Standard_Real LengthSliding,const Standard_Boolean FreeSliding = Standard_True,const Standard_Real Angle1 = 0,const Standard_Real Angle2 = 0);
		%feature("compactdefaultargs") LengthSliding;
		%feature("autodoc", "	* return the lengthSliding = P1P2 + Sliding

	:rtype: float
") LengthSliding;
		Standard_Real LengthSliding ();
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	* return the status

	:rtype: FairCurve_AnalysisCode
") Status;
		FairCurve_AnalysisCode Status ();
		%feature("compactdefaultargs") Variable;
		%feature("autodoc", "	* compute the variables <X> wich correspond with the field <MyPoles>

	:param X:
	:type X: math_Vector &
	:rtype: bool
") Variable;
		virtual Standard_Boolean Variable (math_Vector & X);
};


%extend FairCurve_EnergyOfBatten {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor FairCurve_EnergyOfMVC;
class FairCurve_EnergyOfMVC : public FairCurve_Energy {
	public:
		%feature("compactdefaultargs") FairCurve_EnergyOfMVC;
		%feature("autodoc", "	* Angles corresspond to the Ox axis

	:param BSplOrder:
	:type BSplOrder: int
	:param FlatKnots:
	:type FlatKnots: Handle_TColStd_HArray1OfReal &
	:param Poles:
	:type Poles: Handle_TColgp_HArray1OfPnt2d
	:param ContrOrder1:
	:type ContrOrder1: int
	:param ContrOrder2:
	:type ContrOrder2: int
	:param Law:
	:type Law: FairCurve_BattenLaw &
	:param PhysicalRatio:
	:type PhysicalRatio: float
	:param LengthSliding:
	:type LengthSliding: float
	:param FreeSliding: default value is Standard_True
	:type FreeSliding: bool
	:param Angle1: default value is 0
	:type Angle1: float
	:param Angle2: default value is 0
	:type Angle2: float
	:param Curvature1: default value is 0
	:type Curvature1: float
	:param Curvature2: default value is 0
	:type Curvature2: float
	:rtype: None
") FairCurve_EnergyOfMVC;
		 FairCurve_EnergyOfMVC (const Standard_Integer BSplOrder,const Handle_TColStd_HArray1OfReal & FlatKnots,const Handle_TColgp_HArray1OfPnt2d & Poles,const Standard_Integer ContrOrder1,const Standard_Integer ContrOrder2,const FairCurve_BattenLaw & Law,const Standard_Real PhysicalRatio,const Standard_Real LengthSliding,const Standard_Boolean FreeSliding = Standard_True,const Standard_Real Angle1 = 0,const Standard_Real Angle2 = 0,const Standard_Real Curvature1 = 0,const Standard_Real Curvature2 = 0);
		%feature("compactdefaultargs") LengthSliding;
		%feature("autodoc", "	* return the lengthSliding = P1P2 + Sliding

	:rtype: float
") LengthSliding;
		Standard_Real LengthSliding ();
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	* return the status

	:rtype: FairCurve_AnalysisCode
") Status;
		FairCurve_AnalysisCode Status ();
		%feature("compactdefaultargs") Variable;
		%feature("autodoc", "	* compute the variables <X> wich correspond with the field <MyPoles>

	:param X:
	:type X: math_Vector &
	:rtype: bool
") Variable;
		virtual Standard_Boolean Variable (math_Vector & X);
};


%extend FairCurve_EnergyOfMVC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor FairCurve_MinimalVariation;
class FairCurve_MinimalVariation : public FairCurve_Batten {
	public:
		%feature("compactdefaultargs") FairCurve_MinimalVariation;
		%feature("autodoc", "	* Constructs the two contact points P1 and P2 and the geometrical characteristics of the batten (elastic beam) These include the real number values for height of deformation Height, slope value Slope, and kind of energy PhysicalRatio. The kinds of energy include: - Jerk (0) - Sagging (1). Note that the default setting for Physical Ration is in FairCurve_Batten Other parameters are initialized as follow : - FreeSliding = False - ConstraintOrder1 = 1 - ConstraintOrder2 = 1 - Angle1 = 0 - Angle2 = 0 - Curvature1 = 0 - Curvature2 = 0 - SlidingFactor = 1 Warning If PhysicalRatio equals 1, you cannot impose constraints on curvature. Exceptions NegativeValue if Height is less than or equal to 0. NullValue if the distance between P1 and P2 is less than or equal to the tolerance value for distance in Precision::Confusion: P1.IsEqual(P2, Precision::Confusion()). The function gp_Pnt2d::IsEqual tests to see if this is the case. Definition of the geometricals constraints

	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:param Heigth:
	:type Heigth: float
	:param Slope: default value is 0
	:type Slope: float
	:param PhysicalRatio: default value is 0
	:type PhysicalRatio: float
	:rtype: None
") FairCurve_MinimalVariation;
		 FairCurve_MinimalVariation (const gp_Pnt2d & P1,const gp_Pnt2d & P2,const Standard_Real Heigth,const Standard_Real Slope = 0,const Standard_Real PhysicalRatio = 0);
		%feature("compactdefaultargs") SetCurvature1;
		%feature("autodoc", "	* Allows you to set a new constraint on curvature at the first point.

	:param Curvature:
	:type Curvature: float
	:rtype: None
") SetCurvature1;
		void SetCurvature1 (const Standard_Real Curvature);
		%feature("compactdefaultargs") SetCurvature2;
		%feature("autodoc", "	* Allows you to set a new constraint on curvature at the second point.

	:param Curvature:
	:type Curvature: float
	:rtype: None
") SetCurvature2;
		void SetCurvature2 (const Standard_Real Curvature);
		%feature("compactdefaultargs") SetPhysicalRatio;
		%feature("autodoc", "	* Allows you to set the physical ratio Ratio. The kinds of energy which you can specify include: 0 is only 'Jerk' Energy 1 is only 'Sagging' Energy like batten Warning: if Ratio is 1 it is impossible to impose curvature constraints. Raises DomainError if Ratio < 0 or Ratio > 1

	:param Ratio:
	:type Ratio: float
	:rtype: None
") SetPhysicalRatio;
		void SetPhysicalRatio (const Standard_Real Ratio);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Computes the curve with respect to the constraints, NbIterations and Tolerance. The tolerance setting allows you to control the precision of computation, and the maximum number of iterations allows you to set a limit on computation time.

	:param ACode:
	:type ACode: FairCurve_AnalysisCode &
	:param NbIterations: default value is 50
	:type NbIterations: int
	:param Tolerance: default value is 1.0e-3
	:type Tolerance: float
	:rtype: bool
") Compute;
		virtual Standard_Boolean Compute (FairCurve_AnalysisCode &OutValue,const Standard_Integer NbIterations = 50,const Standard_Real Tolerance = 1.0e-3);
		%feature("compactdefaultargs") GetCurvature1;
		%feature("autodoc", "	* Returns the first established curvature.

	:rtype: float
") GetCurvature1;
		Standard_Real GetCurvature1 ();
		%feature("compactdefaultargs") GetCurvature2;
		%feature("autodoc", "	* Returns the second established curvature.

	:rtype: float
") GetCurvature2;
		Standard_Real GetCurvature2 ();
		%feature("compactdefaultargs") GetPhysicalRatio;
		%feature("autodoc", "	* Returns the physical ratio, or kind of energy.

	:rtype: float
") GetPhysicalRatio;
		Standard_Real GetPhysicalRatio ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend FairCurve_MinimalVariation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
