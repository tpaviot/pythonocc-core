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
%module (package="OCC") math

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


%include math_headers.i


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
enum math_Status {
	math_OK = 0,
	math_TooManyIterations = 1,
	math_FunctionError = 2,
	math_DirectionSearchError = 3,
	math_NotBracketed = 4,
};

/* end public enums declaration */

%rename(math) math;
class math {
	public:
		%feature("compactdefaultargs") GaussPointsMax;
		%feature("autodoc", "	:rtype: int
") GaussPointsMax;
		static Standard_Integer GaussPointsMax ();
		%feature("compactdefaultargs") GaussPoints;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Points:
	:type Points: math_Vector &
	:rtype: void
") GaussPoints;
		static void GaussPoints (const Standard_Integer Index,math_Vector & Points);
		%feature("compactdefaultargs") GaussWeights;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Weights:
	:type Weights: math_Vector &
	:rtype: void
") GaussWeights;
		static void GaussWeights (const Standard_Integer Index,math_Vector & Weights);
		%feature("compactdefaultargs") KronrodPointsMax;
		%feature("autodoc", "	* Returns the maximal number of points for that the values are stored in the table. If the number is greater then KronrodPointsMax, the points will be computed.

	:rtype: int
") KronrodPointsMax;
		static Standard_Integer KronrodPointsMax ();
		%feature("compactdefaultargs") OrderedGaussPointsAndWeights;
		%feature("autodoc", "	* Returns a vector of Gauss points and a vector of their weights. The difference with the method GaussPoints is the following: - the points are returned in increasing order. - if Index is greater then GaussPointsMax, the points are computed. Returns Standard_True if Index is positive, Points' and Weights' length is equal to Index, Points and Weights are successfully computed.

	:param Index:
	:type Index: int
	:param Points:
	:type Points: math_Vector &
	:param Weights:
	:type Weights: math_Vector &
	:rtype: bool
") OrderedGaussPointsAndWeights;
		static Standard_Boolean OrderedGaussPointsAndWeights (const Standard_Integer Index,math_Vector & Points,math_Vector & Weights);
		%feature("compactdefaultargs") KronrodPointsAndWeights;
		%feature("autodoc", "	* Returns a vector of Kronrod points and a vector of their weights for Gauss-Kronrod computation method. Index should be odd and greater then or equal to 3, as the number of Kronrod points is equal to 2*N + 1, where N is a number of Gauss points. Points and Weights should have the size equal to Index. Each even element of Points represents a Gauss point value of N-th Gauss quadrature. The values from Index equal to 3 to 123 are stored in a table (see the file math_Kronrod.cxx). If Index is greater, then points and weights will be computed. Returns Standard_True if Index is odd, it is equal to the size of Points and Weights and the computation of Points and Weights is performed successfully. Otherwise this method returns Standard_False.

	:param Index:
	:type Index: int
	:param Points:
	:type Points: math_Vector &
	:param Weights:
	:type Weights: math_Vector &
	:rtype: bool
") KronrodPointsAndWeights;
		static Standard_Boolean KronrodPointsAndWeights (const Standard_Integer Index,math_Vector & Points,math_Vector & Weights);
};


%extend math {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_Array1OfValueAndWeight;
class math_Array1OfValueAndWeight {
	public:
		%feature("compactdefaultargs") math_Array1OfValueAndWeight;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") math_Array1OfValueAndWeight;
		 math_Array1OfValueAndWeight (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") math_Array1OfValueAndWeight;
		%feature("autodoc", "	:param Item:
	:type Item: math_ValueAndWeight &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") math_Array1OfValueAndWeight;
		 math_Array1OfValueAndWeight (const math_ValueAndWeight & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: math_ValueAndWeight &
	:rtype: None
") Init;
		void Init (const math_ValueAndWeight & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: math_Array1OfValueAndWeight &
	:rtype: math_Array1OfValueAndWeight
") Assign;
		const math_Array1OfValueAndWeight & Assign (const math_Array1OfValueAndWeight & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: math_Array1OfValueAndWeight &
	:rtype: math_Array1OfValueAndWeight
") operator =;
		const math_Array1OfValueAndWeight & operator = (const math_Array1OfValueAndWeight & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: math_ValueAndWeight &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const math_ValueAndWeight & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: math_ValueAndWeight
") Value;
		const math_ValueAndWeight & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: math_ValueAndWeight
") ChangeValue;
		math_ValueAndWeight & ChangeValue (const Standard_Integer Index);
};


%extend math_Array1OfValueAndWeight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_BFGS;
class math_BFGS {
	public:
		%feature("compactdefaultargs") math_BFGS;
		%feature("autodoc", "	* Initializes the computation of the minimum of a function with NbVariables. Tolerance, ZEPS and NbIterations are described in the method Perform. Warning: A call to the Perform method must be made after this initialization to effectively compute the minimum of the function F.

	:param NbVariables:
	:type NbVariables: int
	:param Tolerance: default value is 1.0e-8
	:type Tolerance: float
	:param NbIterations: default value is 200
	:type NbIterations: int
	:param ZEPS: default value is 1.0e-12
	:type ZEPS: float
	:rtype: None
") math_BFGS;
		 math_BFGS (const Standard_Integer NbVariables,const Standard_Real Tolerance = 1.0e-8,const Standard_Integer NbIterations = 200,const Standard_Real ZEPS = 1.0e-12);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Given the starting point StartingPoint, minimization is done on the function F. The solution F = Fi is found when : 2.0 * abs(Fi - Fi-1) <= Tolerance * (abs(Fi) + abs(Fi-1) + ZEPS). Tolerance, ZEPS and maximum number of iterations are given in the constructor.

	:param F:
	:type F: math_MultipleVarFunctionWithGradient &
	:param StartingPoint:
	:type StartingPoint: math_Vector &
	:rtype: None
") Perform;
		void Perform (math_MultipleVarFunctionWithGradient & F,const math_Vector & StartingPoint);
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "	* This method is called at the end of each iteration to check if the solution is found. It can be redefined in a sub-class to implement a specific test to stop the iterations.

	:param F:
	:type F: math_MultipleVarFunctionWithGradient &
	:rtype: bool
") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached (math_MultipleVarFunctionWithGradient & F);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* returns the location vector of the minimum. Exception NotDone is raised if the minimum was not found.

	:rtype: math_Vector
") Location;
		const math_Vector & Location ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* outputs the location vector of the minimum in Loc. Exception NotDone is raised if the minimum was not found. Exception DimensionError is raised if the range of Loc is not equal to the range of the StartingPoint.

	:param Loc:
	:type Loc: math_Vector &
	:rtype: None
") Location;
		void Location (math_Vector & Loc);
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "	* returns the value of the minimum. Exception NotDone is raised if the minimum was not found.

	:rtype: float
") Minimum;
		Standard_Real Minimum ();
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "	* Returns the gradient vector at the minimum. Exception NotDone is raised if the minimum was not found.

	:rtype: math_Vector
") Gradient;
		const math_Vector & Gradient ();
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "	* Returns the value of the gradient vector at the minimum in Grad. Exception NotDone is raised if the minimum was not found. Exception DimensionError is raised if the range of Grad is not equal to the range of the StartingPoint.

	:param Grad:
	:type Grad: math_Vector &
	:rtype: None
") Gradient;
		void Gradient (math_Vector & Grad);
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "	* Returns the number of iterations really done in the calculation of the minimum. The exception NotDone is raised if the minimum was not found.

	:rtype: int
") NbIterations;
		Standard_Integer NbIterations ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend math_BFGS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_BissecNewton;
class math_BissecNewton {
	public:
		%feature("compactdefaultargs") math_BissecNewton;
		%feature("autodoc", "	* Constructor. @param theXTolerance - algorithm tolerance.

	:param theXTolerance:
	:type theXTolerance: float
	:rtype: None
") math_BissecNewton;
		 math_BissecNewton (const Standard_Real theXTolerance);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* A combination of Newton-Raphson and bissection methods is done to find the root of the function F between the bounds Bound1 and Bound2 on the function F. The tolerance required on the root is given by TolX. The solution is found when: abs(Xi - Xi-1) <= TolX and F(Xi) * F(Xi-1) <= 0 The maximum number of iterations allowed is given by NbIterations.

	:param F:
	:type F: math_FunctionWithDerivative &
	:param Bound1:
	:type Bound1: float
	:param Bound2:
	:type Bound2: float
	:param NbIterations: default value is 100
	:type NbIterations: int
	:rtype: None
") Perform;
		void Perform (math_FunctionWithDerivative & F,const Standard_Real Bound1,const Standard_Real Bound2,const Standard_Integer NbIterations = 100);
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "	* This method is called at the end of each iteration to check if the solution has been found. It can be redefined in a sub-class to implement a specific test to stop the iterations.

	:param theFunction:
	:type theFunction: math_FunctionWithDerivative &
	:rtype: bool
") IsSolutionReached;
		Standard_Boolean IsSolutionReached (math_FunctionWithDerivative & theFunction);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Tests is the root has been successfully found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "	* returns the value of the root. Exception NotDone is raised if the minimum was not found.

	:rtype: float
") Root;
		Standard_Real Root ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* returns the value of the derivative at the root. Exception NotDone is raised if the minimum was not found.

	:rtype: float
") Derivative;
		Standard_Real Derivative ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* returns the value of the function at the root. Exception NotDone is raised if the minimum was not found.

	:rtype: float
") Value;
		Standard_Real Value ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	* Destructor alias.

	:rtype: None
") Delete;
		void Delete ();
};


%extend math_BissecNewton {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_BracketMinimum;
class math_BracketMinimum {
	public:
		%feature("compactdefaultargs") math_BracketMinimum;
		%feature("autodoc", "	* Given two initial values this class computes a bracketing triplet of abscissae Ax, Bx, Cx (such that Bx is between Ax and Cx, F(Bx) is less than both F(Bx) and F(Cx)) the Brent minimization is done on the function F.

	:param F:
	:type F: math_Function &
	:param A:
	:type A: float
	:param B:
	:type B: float
	:rtype: None
") math_BracketMinimum;
		 math_BracketMinimum (math_Function & F,const Standard_Real A,const Standard_Real B);
		%feature("compactdefaultargs") math_BracketMinimum;
		%feature("autodoc", "	* Given two initial values this class computes a bracketing triplet of abscissae Ax, Bx, Cx (such that Bx is between Ax and Cx, F(Bx) is less than both F(Bx) and F(Cx)) the Brent minimization is done on the function F. This constructor has to be used if F(A) is known.

	:param F:
	:type F: math_Function &
	:param A:
	:type A: float
	:param B:
	:type B: float
	:param FA:
	:type FA: float
	:rtype: None
") math_BracketMinimum;
		 math_BracketMinimum (math_Function & F,const Standard_Real A,const Standard_Real B,const Standard_Real FA);
		%feature("compactdefaultargs") math_BracketMinimum;
		%feature("autodoc", "	* Given two initial values this class computes a bracketing triplet of abscissae Ax, Bx, Cx (such that Bx is between Ax and Cx, F(Bx) is less than both F(Bx) and F(Cx)) the Brent minimization is done on the function F. This constructor has to be used if F(A) and F(B) are known.

	:param F:
	:type F: math_Function &
	:param A:
	:type A: float
	:param B:
	:type B: float
	:param FA:
	:type FA: float
	:param FB:
	:type FB: float
	:rtype: None
") math_BracketMinimum;
		 math_BracketMinimum (math_Function & F,const Standard_Real A,const Standard_Real B,const Standard_Real FA,const Standard_Real FB);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Returns the bracketed triplet of abscissae. Exceptions StdFail_NotDone if the algorithm fails (and IsDone returns false).

	:param A:
	:type A: float &
	:param B:
	:type B: float &
	:param C:
	:type C: float &
	:rtype: None
") Values;
		void Values (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") FunctionValues;
		%feature("autodoc", "	* returns the bracketed triplet function values. Exceptions StdFail_NotDone if the algorithm fails (and IsDone returns false).

	:param FA:
	:type FA: float &
	:param FB:
	:type FB: float &
	:param FC:
	:type FC: float &
	:rtype: None
") FunctionValues;
		void FunctionValues (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend math_BracketMinimum {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_BracketedRoot;
class math_BracketedRoot {
	public:
		%feature("compactdefaultargs") math_BracketedRoot;
		%feature("autodoc", "	* The Brent method is used to find the root of the function F between the bounds Bound1 and Bound2 on the function F. If F(Bound1)*F(Bound2) >0 the Brent method fails. The tolerance required for the root is given by Tolerance. The solution is found when : abs(Xi - Xi-1) <= Tolerance; The maximum number of iterations allowed is given by NbIterations.

	:param F:
	:type F: math_Function &
	:param Bound1:
	:type Bound1: float
	:param Bound2:
	:type Bound2: float
	:param Tolerance:
	:type Tolerance: float
	:param NbIterations: default value is 100
	:type NbIterations: int
	:param ZEPS: default value is 1.0e-12
	:type ZEPS: float
	:rtype: None
") math_BracketedRoot;
		 math_BracketedRoot (math_Function & F,const Standard_Real Bound1,const Standard_Real Bound2,const Standard_Real Tolerance,const Standard_Integer NbIterations = 100,const Standard_Real ZEPS = 1.0e-12);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "	* returns the value of the root. Exception NotDone is raised if the minimum was not found.

	:rtype: float
") Root;
		Standard_Real Root ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* returns the value of the function at the root. Exception NotDone is raised if the minimum was not found.

	:rtype: float
") Value;
		Standard_Real Value ();
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "	* returns the number of iterations really done during the computation of the Root. Exception NotDone is raised if the minimum was not found.

	:rtype: int
") NbIterations;
		Standard_Integer NbIterations ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend math_BracketedRoot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_BrentMinimum;
class math_BrentMinimum {
	public:
		%feature("compactdefaultargs") math_BrentMinimum;
		%feature("autodoc", "	* This constructor should be used in a sub-class to initialize correctly all the fields of this class.

	:param TolX:
	:type TolX: float
	:param NbIterations: default value is 100
	:type NbIterations: int
	:param ZEPS: default value is 1.0e-12
	:type ZEPS: float
	:rtype: None
") math_BrentMinimum;
		 math_BrentMinimum (const Standard_Real TolX,const Standard_Integer NbIterations = 100,const Standard_Real ZEPS = 1.0e-12);
		%feature("compactdefaultargs") math_BrentMinimum;
		%feature("autodoc", "	* This constructor should be used in a sub-class to initialize correctly all the fields of this class. It has to be used if F(Bx) is known.

	:param TolX:
	:type TolX: float
	:param Fbx:
	:type Fbx: float
	:param NbIterations: default value is 100
	:type NbIterations: int
	:param ZEPS: default value is 1.0e-12
	:type ZEPS: float
	:rtype: None
") math_BrentMinimum;
		 math_BrentMinimum (const Standard_Real TolX,const Standard_Real Fbx,const Standard_Integer NbIterations = 100,const Standard_Real ZEPS = 1.0e-12);
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	* Destructor alias.

	:rtype: None
") Delete;
		void Delete ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Brent minimization is performed on function F from a given bracketing triplet of abscissas Ax, Bx, Cx (such that Bx is between Ax and Cx, F(Bx) is less than both F(Bx) and F(Cx)) The solution is found when: abs(Xi - Xi-1) <= TolX * abs(Xi) + ZEPS;

	:param F:
	:type F: math_Function &
	:param Ax:
	:type Ax: float
	:param Bx:
	:type Bx: float
	:param Cx:
	:type Cx: float
	:rtype: None
") Perform;
		void Perform (math_Function & F,const Standard_Real Ax,const Standard_Real Bx,const Standard_Real Cx);
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "	* This method is called at the end of each iteration to check if the solution is found. It can be redefined in a sub-class to implement a specific test to stop the iterations.

	:param theFunction:
	:type theFunction: math_Function &
	:rtype: bool
") IsSolutionReached;
		Standard_Boolean IsSolutionReached (math_Function & theFunction);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* returns the location value of the minimum. Exception NotDone is raised if the minimum was not found.

	:rtype: float
") Location;
		Standard_Real Location ();
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "	* returns the value of the minimum. Exception NotDone is raised if the minimum was not found.

	:rtype: float
") Minimum;
		Standard_Real Minimum ();
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "	* returns the number of iterations really done during the computation of the minimum. Exception NotDone is raised if the minimum was not found.

	:rtype: int
") NbIterations;
		Standard_Integer NbIterations ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend math_BrentMinimum {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_BullardGenerator;
class math_BullardGenerator {
	public:
		%feature("compactdefaultargs") math_BullardGenerator;
		%feature("autodoc", "	* Creates new Xorshift 64-bit RNG.

	:param theSeed: default value is 1
	:type theSeed: unsigned int
	:rtype: None
") math_BullardGenerator;
		 math_BullardGenerator (unsigned int theSeed = 1);
		%feature("compactdefaultargs") NextInt;
		%feature("autodoc", "	* Generates new 64-bit integer value.

	:rtype: unsigned int
") NextInt;
		unsigned int NextInt ();
		%feature("compactdefaultargs") NextReal;
		%feature("autodoc", "	* Generates new floating-point value.

	:rtype: float
") NextReal;
		Standard_Real NextReal ();
};


%extend math_BullardGenerator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_CompareOfValueAndWeight;
class math_CompareOfValueAndWeight {
	public:
		%feature("compactdefaultargs") math_CompareOfValueAndWeight;
		%feature("autodoc", "	:rtype: None
") math_CompareOfValueAndWeight;
		 math_CompareOfValueAndWeight ();
		%feature("compactdefaultargs") IsLower;
		%feature("autodoc", "	* Returns True if <Left.Value()> is lower than <Right.Value()>.

	:param Left:
	:type Left: math_ValueAndWeight &
	:param Right:
	:type Right: math_ValueAndWeight &
	:rtype: bool
") IsLower;
		Standard_Boolean IsLower (const math_ValueAndWeight & Left,const math_ValueAndWeight & Right);
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "	* Returns True if <Left.Value()> is greater than <Right.Value()>.

	:param Left:
	:type Left: math_ValueAndWeight &
	:param Right:
	:type Right: math_ValueAndWeight &
	:rtype: bool
") IsGreater;
		Standard_Boolean IsGreater (const math_ValueAndWeight & Left,const math_ValueAndWeight & Right);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* returns True when <Right> and <Left> are equal.

	:param Left:
	:type Left: math_ValueAndWeight &
	:param Right:
	:type Right: math_ValueAndWeight &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const math_ValueAndWeight & Left,const math_ValueAndWeight & Right);
};


%extend math_CompareOfValueAndWeight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_ComputeGaussPointsAndWeights;
class math_ComputeGaussPointsAndWeights {
	public:
		%feature("compactdefaultargs") math_ComputeGaussPointsAndWeights;
		%feature("autodoc", "	:param Number:
	:type Number: int
	:rtype: None
") math_ComputeGaussPointsAndWeights;
		 math_ComputeGaussPointsAndWeights (const Standard_Integer Number);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	:rtype: math_Vector
") Points;
		math_Vector Points ();
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "	:rtype: math_Vector
") Weights;
		math_Vector Weights ();
};


%extend math_ComputeGaussPointsAndWeights {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_ComputeKronrodPointsAndWeights;
class math_ComputeKronrodPointsAndWeights {
	public:
		%feature("compactdefaultargs") math_ComputeKronrodPointsAndWeights;
		%feature("autodoc", "	:param Number:
	:type Number: int
	:rtype: None
") math_ComputeKronrodPointsAndWeights;
		 math_ComputeKronrodPointsAndWeights (const Standard_Integer Number);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	:rtype: math_Vector
") Points;
		math_Vector Points ();
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "	:rtype: math_Vector
") Weights;
		math_Vector Weights ();
};


%extend math_ComputeKronrodPointsAndWeights {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_Crout;
class math_Crout {
	public:
		%feature("compactdefaultargs") math_Crout;
		%feature("autodoc", "	* Given an input matrix A, this algorithm inverts A by the Crout algorithm. The user can give only the inferior triangle for the implementation. A can be decomposed like this: A = L * D * T(L) where L is triangular inferior and D is diagonal. If one element of A is less than MinPivot, A is considered as singular. Exception NotSquare is raised if A is not a square matrix.

	:param A:
	:type A: math_Matrix &
	:param MinPivot: default value is 1.0e-20
	:type MinPivot: float
	:rtype: None
") math_Crout;
		 math_Crout (const math_Matrix & A,const Standard_Real MinPivot = 1.0e-20);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if all has been correctly done.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "	* Given an input vector <B>, this routine returns the solution of the set of linear equations A . X = B. Exception NotDone is raised if the decomposition was not done successfully. Exception DimensionError is raised if the range of B is not equal to the rowrange of A.

	:param B:
	:type B: math_Vector &
	:param X:
	:type X: math_Vector &
	:rtype: None
") Solve;
		void Solve (const math_Vector & B,math_Vector & X);
		%feature("compactdefaultargs") Inverse;
		%feature("autodoc", "	* returns the inverse matrix of A. Only the inferior triangle is returned. Exception NotDone is raised if NotDone.

	:rtype: math_Matrix
") Inverse;
		const math_Matrix & Inverse ();
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "	* returns in Inv the inverse matrix of A. Only the inferior triangle is returned. Exception NotDone is raised if NotDone.

	:param Inv:
	:type Inv: math_Matrix &
	:rtype: None
") Invert;
		void Invert (math_Matrix & Inv);
		%feature("compactdefaultargs") Determinant;
		%feature("autodoc", "	* Returns the value of the determinant of the previously LU decomposed matrix A. Zero is returned if the matrix A is considered as singular. Exceptions StdFail_NotDone if the algorithm fails (and IsDone returns false).

	:rtype: float
") Determinant;
		Standard_Real Determinant ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend math_Crout {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_DirectPolynomialRoots;
class math_DirectPolynomialRoots {
	public:
		%feature("compactdefaultargs") math_DirectPolynomialRoots;
		%feature("autodoc", "	* computes all the real roots of the polynomial Ax4 + Bx3 + Cx2 + Dx + E using a direct method.

	:param A:
	:type A: float
	:param B:
	:type B: float
	:param C:
	:type C: float
	:param D:
	:type D: float
	:param E:
	:type E: float
	:rtype: None
") math_DirectPolynomialRoots;
		 math_DirectPolynomialRoots (const Standard_Real A,const Standard_Real B,const Standard_Real C,const Standard_Real D,const Standard_Real E);
		%feature("compactdefaultargs") math_DirectPolynomialRoots;
		%feature("autodoc", "	* computes all the real roots of the polynomial Ax3 + Bx2 + Cx + D using a direct method.

	:param A:
	:type A: float
	:param B:
	:type B: float
	:param C:
	:type C: float
	:param D:
	:type D: float
	:rtype: None
") math_DirectPolynomialRoots;
		 math_DirectPolynomialRoots (const Standard_Real A,const Standard_Real B,const Standard_Real C,const Standard_Real D);
		%feature("compactdefaultargs") math_DirectPolynomialRoots;
		%feature("autodoc", "	* computes all the real roots of the polynomial Ax2 + Bx + C using a direct method.

	:param A:
	:type A: float
	:param B:
	:type B: float
	:param C:
	:type C: float
	:rtype: None
") math_DirectPolynomialRoots;
		 math_DirectPolynomialRoots (const Standard_Real A,const Standard_Real B,const Standard_Real C);
		%feature("compactdefaultargs") math_DirectPolynomialRoots;
		%feature("autodoc", "	* computes the real root of the polynomial Ax + B.

	:param A:
	:type A: float
	:param B:
	:type B: float
	:rtype: None
") math_DirectPolynomialRoots;
		 math_DirectPolynomialRoots (const Standard_Real A,const Standard_Real B);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") InfiniteRoots;
		%feature("autodoc", "	* Returns true if there is an infinity of roots, otherwise returns false.

	:rtype: bool
") InfiniteRoots;
		Standard_Boolean InfiniteRoots ();
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "	* returns the number of solutions. An exception is raised if there are an infinity of roots.

	:rtype: int
") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* returns the value of the Nieme root. An exception is raised if there are an infinity of roots. Exception RangeError is raised if Nieme is < 1 or Nieme > NbSolutions.

	:param Nieme:
	:type Nieme: int
	:rtype: float
") Value;
		Standard_Real Value (const Standard_Integer Nieme);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend math_DirectPolynomialRoots {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_DoubleTab;
class math_DoubleTab {
	public:
		%feature("compactdefaultargs") math_DoubleTab;
		%feature("autodoc", "	:param LowerRow:
	:type LowerRow: int
	:param UpperRow:
	:type UpperRow: int
	:param LowerCol:
	:type LowerCol: int
	:param UpperCol:
	:type UpperCol: int
	:rtype: None
") math_DoubleTab;
		 math_DoubleTab (const Standard_Integer LowerRow,const Standard_Integer UpperRow,const Standard_Integer LowerCol,const Standard_Integer UpperCol);
		%feature("compactdefaultargs") math_DoubleTab;
		%feature("autodoc", "	:param Tab:
	:type Tab: Standard_Address
	:param LowerRow:
	:type LowerRow: int
	:param UpperRow:
	:type UpperRow: int
	:param LowerCol:
	:type LowerCol: int
	:param UpperCol:
	:type UpperCol: int
	:rtype: None
") math_DoubleTab;
		 math_DoubleTab (const Standard_Address Tab,const Standard_Integer LowerRow,const Standard_Integer UpperRow,const Standard_Integer LowerCol,const Standard_Integer UpperCol);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param InitValue:
	:type InitValue: float
	:rtype: None
") Init;
		void Init (const Standard_Real InitValue);
		%feature("compactdefaultargs") math_DoubleTab;
		%feature("autodoc", "	:param Other:
	:type Other: math_DoubleTab &
	:rtype: None
") math_DoubleTab;
		 math_DoubleTab (const math_DoubleTab & Other);
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	:param Other:
	:type Other: math_DoubleTab &
	:rtype: None
") Copy;
		void Copy (math_DoubleTab & Other);
		%feature("compactdefaultargs") SetLowerRow;
		%feature("autodoc", "	:param LowerRow:
	:type LowerRow: int
	:rtype: None
") SetLowerRow;
		void SetLowerRow (const Standard_Integer LowerRow);
		%feature("compactdefaultargs") SetLowerCol;
		%feature("autodoc", "	:param LowerCol:
	:type LowerCol: int
	:rtype: None
") SetLowerCol;
		void SetLowerCol (const Standard_Integer LowerCol);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param RowIndex:
	:type RowIndex: int
	:param ColIndex:
	:type ColIndex: int
	:rtype: float
") Value;
		Standard_Real & Value (const Standard_Integer RowIndex,const Standard_Integer ColIndex);
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "	:rtype: None
") Free;
		void Free ();
};


%extend math_DoubleTab {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_EigenValuesSearcher;
class math_EigenValuesSearcher {
	public:
		%feature("compactdefaultargs") math_EigenValuesSearcher;
		%feature("autodoc", "	:param Diagonal:
	:type Diagonal: TColStd_Array1OfReal &
	:param Subdiagonal:
	:type Subdiagonal: TColStd_Array1OfReal &
	:rtype: None
") math_EigenValuesSearcher;
		 math_EigenValuesSearcher (const TColStd_Array1OfReal & Diagonal,const TColStd_Array1OfReal & Subdiagonal);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns Standard_True if computation is performed successfully.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Dimension;
		%feature("autodoc", "	* Returns the dimension of matrix

	:rtype: int
") Dimension;
		Standard_Integer Dimension ();
		%feature("compactdefaultargs") EigenValue;
		%feature("autodoc", "	* Returns the Index_th eigen value of matrix Index must be in [1, Dimension()]

	:param Index:
	:type Index: int
	:rtype: float
") EigenValue;
		Standard_Real EigenValue (const Standard_Integer Index);
		%feature("compactdefaultargs") EigenVector;
		%feature("autodoc", "	* Returns the Index_th eigen vector of matrix Index must be in [1, Dimension()]

	:param Index:
	:type Index: int
	:rtype: math_Vector
") EigenVector;
		math_Vector EigenVector (const Standard_Integer Index);
};


%extend math_EigenValuesSearcher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_FRPR;
class math_FRPR {
	public:
		%feature("compactdefaultargs") math_FRPR;
		%feature("autodoc", "	* Initializes the computation of the minimum of F. Warning: constructor does not perform computations.

	:param theFunction:
	:type theFunction: math_MultipleVarFunctionWithGradient &
	:param theTolerance:
	:type theTolerance: float
	:param theNbIterations: default value is 200
	:type theNbIterations: int
	:param theZEPS: default value is 1.0e-12
	:type theZEPS: float
	:rtype: None
") math_FRPR;
		 math_FRPR (const math_MultipleVarFunctionWithGradient & theFunction,const Standard_Real theTolerance,const Standard_Integer theNbIterations = 200,const Standard_Real theZEPS = 1.0e-12);
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	* Destructor alias.

	:rtype: None
") Delete;
		void Delete ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* The solution F = Fi is found when 2.0 * abs(Fi - Fi-1) <= Tolerance * (abs(Fi) + abs(Fi-1) + ZEPS).

	:param theFunction:
	:type theFunction: math_MultipleVarFunctionWithGradient &
	:param theStartingPoint:
	:type theStartingPoint: math_Vector &
	:rtype: None
") Perform;
		void Perform (math_MultipleVarFunctionWithGradient & theFunction,const math_Vector & theStartingPoint);
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "	* The solution F = Fi is found when: 2.0 * abs(Fi - Fi-1) <= Tolerance * (abs(Fi) + abs(Fi-1)) + ZEPS. The maximum number of iterations allowed is given by NbIterations.

	:param theFunction:
	:type theFunction: math_MultipleVarFunctionWithGradient &
	:rtype: bool
") IsSolutionReached;
		Standard_Boolean IsSolutionReached (math_MultipleVarFunctionWithGradient & theFunction);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* returns the location vector of the minimum. Exception NotDone is raised if the minimum was not found.

	:rtype: math_Vector
") Location;
		const math_Vector & Location ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* outputs the location vector of the minimum in Loc. Exception NotDone is raised if the minimum was not found. Exception DimensionError is raised if the range of Loc is not equal to the range of the StartingPoint.

	:param Loc:
	:type Loc: math_Vector &
	:rtype: None
") Location;
		void Location (math_Vector & Loc);
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "	* returns the value of the minimum. Exception NotDone is raised if the minimum was not found.

	:rtype: float
") Minimum;
		Standard_Real Minimum ();
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "	* returns the gradient vector at the minimum. Exception NotDone is raised if the minimum was not found.

	:rtype: math_Vector
") Gradient;
		const math_Vector & Gradient ();
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "	* outputs the gradient vector at the minimum in Grad. Exception NotDone is raised if the minimum was not found. Exception DimensionError is raised if the range of Grad is not equal to the range of the StartingPoint.

	:param Grad:
	:type Grad: math_Vector &
	:rtype: None
") Gradient;
		void Gradient (math_Vector & Grad);
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "	* returns the number of iterations really done during the computation of the minimum. Exception NotDone is raised if the minimum was not found.

	:rtype: int
") NbIterations;
		Standard_Integer NbIterations ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend math_FRPR {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_Function;
class math_Function {
	public:
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the value of the function <F> for a given value of variable <X>. returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "	* returns the state of the function corresponding to the latest call of any methods associated with the function. This function is called by each of the algorithms described later which defined the function Integer Algorithm::StateNumber(). The algorithm has the responsibility to call this function when it has found a solution (i.e. a root or a minimum) and has to maintain the association between the solution found and this StateNumber. Byu default, this method returns 0 (which means for the algorithm: no state has been saved). It is the responsibility of the programmer to decide if he needs to save the current state of the function and to return an Integer that allows retrieval of the state.

	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
};


%extend math_Function {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_FunctionAllRoots;
class math_FunctionAllRoots {
	public:
		%feature("compactdefaultargs") math_FunctionAllRoots;
		%feature("autodoc", "	* The algorithm uses the sample to find intervals on which the function is null. An interval is found if, for at least two consecutive points of the sample, Ui and Ui+1, we get |F(Ui)|<=EpsNul and |F(Ui+1)|<=EpsNul. The real bounds of an interval are computed with the FunctionRoots. algorithm. Between two intervals, the roots of the function F are calculated using the FunctionRoots algorithm.

	:param F:
	:type F: math_FunctionWithDerivative &
	:param S:
	:type S: math_FunctionSample &
	:param EpsX:
	:type EpsX: float
	:param EpsF:
	:type EpsF: float
	:param EpsNul:
	:type EpsNul: float
	:rtype: None
") math_FunctionAllRoots;
		 math_FunctionAllRoots (math_FunctionWithDerivative & F,const math_FunctionSample & S,const Standard_Real EpsX,const Standard_Real EpsF,const Standard_Real EpsNul);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the computation has been done successfully.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals on which the function is Null. An exception is raised if IsDone returns False.

	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals ();
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "	* Returns the interval of parameter of range Index. An exception is raised if IsDone returns False; An exception is raised if Index<=0 or Index >Nbintervals.

	:param Index:
	:type Index: int
	:param A:
	:type A: float &
	:param B:
	:type B: float &
	:rtype: None
") GetInterval;
		void GetInterval (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetIntervalState;
		%feature("autodoc", "	* returns the State Number associated to the interval Index. An exception is raised if IsDone returns False; An exception is raised if Index<=0 or Index >Nbintervals.

	:param Index:
	:type Index: int
	:param IFirst:
	:type IFirst: int &
	:param ILast:
	:type ILast: int &
	:rtype: None
") GetIntervalState;
		void GetIntervalState (const Standard_Integer Index,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	* returns the number of points where the function is Null. An exception is raised if IsDone returns False.

	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "	* Returns the parameter of the point of range Index. An exception is raised if IsDone returns False; An exception is raised if Index<=0 or Index >NbPoints.

	:param Index:
	:type Index: int
	:rtype: float
") GetPoint;
		Standard_Real GetPoint (const Standard_Integer Index);
		%feature("compactdefaultargs") GetPointState;
		%feature("autodoc", "	* returns the State Number associated to the point Index. An exception is raised if IsDone returns False; An exception is raised if Index<=0 or Index >Nbintervals.

	:param Index:
	:type Index: int
	:rtype: int
") GetPointState;
		Standard_Integer GetPointState (const Standard_Integer Index);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend math_FunctionAllRoots {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_FunctionRoot;
class math_FunctionRoot {
	public:
		%feature("compactdefaultargs") math_FunctionRoot;
		%feature("autodoc", "	* The Newton-Raphson method is done to find the root of the function F from the initial guess Guess.The tolerance required on the root is given by Tolerance. Iterations are stopped if the expected solution does not stay in the range A..B. The solution is found when abs(Xi - Xi-1) <= Tolerance; The maximum number of iterations allowed is given by NbIterations.

	:param F:
	:type F: math_FunctionWithDerivative &
	:param Guess:
	:type Guess: float
	:param Tolerance:
	:type Tolerance: float
	:param NbIterations: default value is 100
	:type NbIterations: int
	:rtype: None
") math_FunctionRoot;
		 math_FunctionRoot (math_FunctionWithDerivative & F,const Standard_Real Guess,const Standard_Real Tolerance,const Standard_Integer NbIterations = 100);
		%feature("compactdefaultargs") math_FunctionRoot;
		%feature("autodoc", "	* The Newton-Raphson method is done to find the root of the function F from the initial guess Guess. The tolerance required on the root is given by Tolerance. Iterations are stopped if the expected solution does not stay in the range A..B The solution is found when abs(Xi - Xi-1) <= Tolerance; The maximum number of iterations allowed is given by NbIterations.

	:param F:
	:type F: math_FunctionWithDerivative &
	:param Guess:
	:type Guess: float
	:param Tolerance:
	:type Tolerance: float
	:param A:
	:type A: float
	:param B:
	:type B: float
	:param NbIterations: default value is 100
	:type NbIterations: int
	:rtype: None
") math_FunctionRoot;
		 math_FunctionRoot (math_FunctionWithDerivative & F,const Standard_Real Guess,const Standard_Real Tolerance,const Standard_Real A,const Standard_Real B,const Standard_Integer NbIterations = 100);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "	* returns the value of the root. Exception NotDone is raised if the root was not found.

	:rtype: float
") Root;
		Standard_Real Root ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* returns the value of the derivative at the root. Exception NotDone is raised if the root was not found.

	:rtype: float
") Derivative;
		Standard_Real Derivative ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* returns the value of the function at the root. Exception NotDone is raised if the root was not found.

	:rtype: float
") Value;
		Standard_Real Value ();
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "	* returns the number of iterations really done on the computation of the Root. Exception NotDone is raised if the root was not found.

	:rtype: int
") NbIterations;
		Standard_Integer NbIterations ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend math_FunctionRoot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_FunctionRoots;
class math_FunctionRoots {
	public:
		%feature("compactdefaultargs") math_FunctionRoots;
		%feature("autodoc", "	* Calculates all the real roots of a function F-K within the range A..B. whithout conditions on A and B A solution X is found when abs(Xi - Xi-1) <= Epsx and abs(F(Xi)-K) <= EpsF. The function is considered as null between A and B if abs(F-K) <= EpsNull within this range.

	:param F:
	:type F: math_FunctionWithDerivative &
	:param A:
	:type A: float
	:param B:
	:type B: float
	:param NbSample:
	:type NbSample: int
	:param EpsX: default value is 0.0
	:type EpsX: float
	:param EpsF: default value is 0.0
	:type EpsF: float
	:param EpsNull: default value is 0.0
	:type EpsNull: float
	:param K: default value is 0.0
	:type K: float
	:rtype: None
") math_FunctionRoots;
		 math_FunctionRoots (math_FunctionWithDerivative & F,const Standard_Real A,const Standard_Real B,const Standard_Integer NbSample,const Standard_Real EpsX = 0.0,const Standard_Real EpsF = 0.0,const Standard_Real EpsNull = 0.0,const Standard_Real K = 0.0);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsAllNull;
		%feature("autodoc", "	* returns true if the function is considered as null between A and B. Exceptions StdFail_NotDone if the algorithm fails (and IsDone returns false).

	:rtype: bool
") IsAllNull;
		Standard_Boolean IsAllNull ();
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "	* Returns the number of solutions found. Exceptions StdFail_NotDone if the algorithm fails (and IsDone returns false).

	:rtype: int
") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the Nth value of the root of function F. Exceptions StdFail_NotDone if the algorithm fails (and IsDone returns false).

	:param Nieme:
	:type Nieme: int
	:rtype: float
") Value;
		Standard_Real Value (const Standard_Integer Nieme);
		%feature("compactdefaultargs") StateNumber;
		%feature("autodoc", "	* returns the StateNumber of the Nieme root. Exception RangeError is raised if Nieme is < 1 or Nieme > NbSolutions.

	:param Nieme:
	:type Nieme: int
	:rtype: int
") StateNumber;
		Standard_Integer StateNumber (const Standard_Integer Nieme);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend math_FunctionRoots {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_FunctionSample;
class math_FunctionSample {
	public:
		%feature("compactdefaultargs") math_FunctionSample;
		%feature("autodoc", "	:param A:
	:type A: float
	:param B:
	:type B: float
	:param N:
	:type N: int
	:rtype: None
") math_FunctionSample;
		 math_FunctionSample (const Standard_Real A,const Standard_Real B,const Standard_Integer N);
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "	* Returns the bounds of parameters.

	:param A:
	:type A: float &
	:param B:
	:type B: float &
	:rtype: void
") Bounds;
		virtual void Bounds (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	* Returns the number of sample points.

	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") GetParameter;
		%feature("autodoc", "	* Returns the value of parameter of the point of range Index : A + ((Index-1)/(NbPoints-1))*B. An exception is raised if Index<=0 or Index>NbPoints.

	:param Index:
	:type Index: int
	:rtype: float
") GetParameter;
		virtual Standard_Real GetParameter (const Standard_Integer Index);
};


%extend math_FunctionSample {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_FunctionSet;
class math_FunctionSet {
	public:
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	* Returns the number of variables of the function.

	:rtype: int
") NbVariables;
		virtual Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* Returns the number of equations of the function.

	:rtype: int
") NbEquations;
		virtual Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the values <F> of the functions for the variable <X>. returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "	* Returns the state of the function corresponding to the latestcall of any methods associated with the function. This function is called by each of the algorithms described later which define the function Integer Algorithm::StateNumber(). The algorithm has the responsibility to call this function when it has found a solution (i.e. a root or a minimum) and has to maintain the association between the solution found and this StateNumber. Byu default, this method returns 0 (which means for the algorithm: no state has been saved). It is the responsibility of the programmer to decide if he needs to save the current state of the function and to return an Integer that allows retrieval of the state.

	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
};


%extend math_FunctionSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_FunctionSetRoot;
class math_FunctionSetRoot {
	public:
		%feature("compactdefaultargs") math_FunctionSetRoot;
		%feature("autodoc", "	* is used in a sub-class to initialize correctly all the fields of this class. The range (1, F.NbVariables()) must be especially respected for all vectors and matrix declarations.

	:param F:
	:type F: math_FunctionSetWithDerivatives &
	:param Tolerance:
	:type Tolerance: math_Vector &
	:param NbIterations: default value is 100
	:type NbIterations: int
	:rtype: None
") math_FunctionSetRoot;
		 math_FunctionSetRoot (math_FunctionSetWithDerivatives & F,const math_Vector & Tolerance,const Standard_Integer NbIterations = 100);
		%feature("compactdefaultargs") math_FunctionSetRoot;
		%feature("autodoc", "	* is used in a sub-class to initialize correctly all the fields of this class. The range (1, F.NbVariables()) must be especially respected for all vectors and matrix declarations. The method SetTolerance must be called after this constructor.

	:param F:
	:type F: math_FunctionSetWithDerivatives &
	:param NbIterations: default value is 100
	:type NbIterations: int
	:rtype: None
") math_FunctionSetRoot;
		 math_FunctionSetRoot (math_FunctionSetWithDerivatives & F,const Standard_Integer NbIterations = 100);
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	* Destructor alias.

	:rtype: None
") Delete;
		void Delete ();
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	* Initializes the tolerance values.

	:param Tolerance:
	:type Tolerance: math_Vector &
	:rtype: None
") SetTolerance;
		void SetTolerance (const math_Vector & Tolerance);
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "	* This routine is called at the end of each iteration to check if the solution was found. It can be redefined in a sub-class to implement a specific test to stop the iterations. In this case, the solution is found when: abs(Xi - Xi-1) <= Tolerance for all unknowns.

	:param F:
	:type F: math_FunctionSetWithDerivatives &
	:rtype: bool
") IsSolutionReached;
		Standard_Boolean IsSolutionReached (math_FunctionSetWithDerivatives & F);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Improves the root of function from the initial guess point. The infinum and supremum may be given to constrain the solution. In this case, the solution is found when: abs(Xi - Xi-1)(j) <= Tolerance(j) for all unknowns.

	:param theFunction:
	:type theFunction: math_FunctionSetWithDerivatives &
	:param theStartingPoint:
	:type theStartingPoint: math_Vector &
	:param theStopOnDivergent: default value is Standard_False
	:type theStopOnDivergent: bool
	:rtype: None
") Perform;
		void Perform (math_FunctionSetWithDerivatives & theFunction,const math_Vector & theStartingPoint,const Standard_Boolean theStopOnDivergent = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Improves the root of function from the initial guess point. The infinum and supremum may be given to constrain the solution. In this case, the solution is found when: abs(Xi - Xi-1) <= Tolerance for all unknowns.

	:param theFunction:
	:type theFunction: math_FunctionSetWithDerivatives &
	:param theStartingPoint:
	:type theStartingPoint: math_Vector &
	:param theInfBound:
	:type theInfBound: math_Vector &
	:param theSupBound:
	:type theSupBound: math_Vector &
	:param theStopOnDivergent: default value is Standard_False
	:type theStopOnDivergent: bool
	:rtype: None
") Perform;
		void Perform (math_FunctionSetWithDerivatives & theFunction,const math_Vector & theStartingPoint,const math_Vector & theInfBound,const math_Vector & theSupBound,const Standard_Boolean theStopOnDivergent = Standard_False);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "	* Returns the number of iterations really done during the computation of the root. Exception NotDone is raised if the root was not found.

	:rtype: int
") NbIterations;
		Standard_Integer NbIterations ();
		%feature("compactdefaultargs") StateNumber;
		%feature("autodoc", "	* returns the stateNumber (as returned by F.GetStateNumber()) associated to the root found.

	:rtype: int
") StateNumber;
		Standard_Integer StateNumber ();
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "	* Returns the value of the root of function F. Exception NotDone is raised if the root was not found.

	:rtype: math_Vector
") Root;
		const math_Vector & Root ();
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "	* Outputs the root vector in Root. Exception NotDone is raised if the root was not found. Exception DimensionError is raised if the range of Root is not equal to the range of the StartingPoint.

	:param Root:
	:type Root: math_Vector &
	:rtype: None
") Root;
		void Root (math_Vector & Root);
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the matrix value of the derivative at the root. Exception NotDone is raised if the root was not found.

	:rtype: math_Matrix
") Derivative;
		const math_Matrix & Derivative ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* outputs the matrix value of the derivative at the root in Der. Exception NotDone is raised if the root was not found. Exception DimensionError is raised if the column range of <Der> is not equal to the range of the startingPoint.

	:param Der:
	:type Der: math_Matrix &
	:rtype: None
") Derivative;
		void Derivative (math_Matrix & Der);
		%feature("compactdefaultargs") FunctionSetErrors;
		%feature("autodoc", "	* returns the vector value of the error done on the functions at the root. Exception NotDone is raised if the root was not found.

	:rtype: math_Vector
") FunctionSetErrors;
		const math_Vector & FunctionSetErrors ();
		%feature("compactdefaultargs") FunctionSetErrors;
		%feature("autodoc", "	* outputs the vector value of the error done on the functions at the root in Err. Exception NotDone is raised if the root was not found. Exception DimensionError is raised if the range of Err is not equal to the range of the StartingPoint.

	:param Err:
	:type Err: math_Vector &
	:rtype: None
") FunctionSetErrors;
		void FunctionSetErrors (math_Vector & Err);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") IsDivergent;
		%feature("autodoc", "	:rtype: bool
") IsDivergent;
		Standard_Boolean IsDivergent ();
};


%extend math_FunctionSetRoot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_Gauss;
class math_Gauss {
	public:
		%feature("compactdefaultargs") math_Gauss;
		%feature("autodoc", "	* Given an input n X n matrix A this constructor performs its LU decomposition with partial pivoting (interchange of rows). This LU decomposition is stored internally and may be used to do subsequent calculation. If the largest pivot found is less than MinPivot the matrix A is considered as singular. Exception NotSquare is raised if A is not a square matrix.

	:param A:
	:type A: math_Matrix &
	:param MinPivot: default value is 1.0e-20
	:type MinPivot: float
	:rtype: None
") math_Gauss;
		 math_Gauss (const math_Matrix & A,const Standard_Real MinPivot = 1.0e-20);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the computations are successful, otherwise returns false

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "	* Given the input Vector B this routine returns the solution X of the set of linear equations A . X = B. Exception NotDone is raised if the decomposition of A was not done successfully. Exception DimensionError is raised if the range of B is not equal to the number of rows of A.

	:param B:
	:type B: math_Vector &
	:param X:
	:type X: math_Vector &
	:rtype: None
") Solve;
		void Solve (const math_Vector & B,math_Vector & X);
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "	* Given the input Vector B this routine solves the set of linear equations A . X = B. B is replaced by the vector solution X. Exception NotDone is raised if the decomposition of A was not done successfully. Exception DimensionError is raised if the range of B is not equal to the number of rows of A.

	:param B:
	:type B: math_Vector &
	:rtype: None
") Solve;
		void Solve (math_Vector & B);
		%feature("compactdefaultargs") Determinant;
		%feature("autodoc", "	* This routine returns the value of the determinant of the previously LU decomposed matrix A. Exception NotDone may be raised if the decomposition of A was not done successfully, zero is returned if the matrix A was considered as singular.

	:rtype: float
") Determinant;
		Standard_Real Determinant ();
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "	* This routine outputs Inv the inverse of the previously LU decomposed matrix A. Exception DimensionError is raised if the ranges of B are not equal to the ranges of A.

	:param Inv:
	:type Inv: math_Matrix &
	:rtype: None
") Invert;
		void Invert (math_Matrix & Inv);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend math_Gauss {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_GaussLeastSquare;
class math_GaussLeastSquare {
	public:
		%feature("compactdefaultargs") math_GaussLeastSquare;
		%feature("autodoc", "	* Given an input n X m matrix A with n >= m this constructor performs the LU decomposition with partial pivoting (interchange of rows) of the matrix AA = A.Transposed() * A; This LU decomposition is stored internally and may be used to do subsequent calculation. If the largest pivot found is less than MinPivot the matrix <A> is considered as singular.

	:param A:
	:type A: math_Matrix &
	:param MinPivot: default value is 1.0e-20
	:type MinPivot: float
	:rtype: None
") math_GaussLeastSquare;
		 math_GaussLeastSquare (const math_Matrix & A,const Standard_Real MinPivot = 1.0e-20);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the computations are successful, otherwise returns false.e

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "	* Given the input Vector <B> this routine solves the set of linear equations A . X = B. Exception NotDone is raised if the decomposition of A was not done successfully. Exception DimensionError is raised if the range of B Inv is not equal to the rowrange of A. Exception DimensionError is raised if the range of X Inv is not equal to the colrange of A.

	:param B:
	:type B: math_Vector &
	:param X:
	:type X: math_Vector &
	:rtype: None
") Solve;
		void Solve (const math_Vector & B,math_Vector & X);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend math_GaussLeastSquare {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_GaussMultipleIntegration;
class math_GaussMultipleIntegration {
	public:
		%feature("compactdefaultargs") math_GaussMultipleIntegration;
		%feature("autodoc", "	* The Gauss-Legendre integration with Order = points of integration for each unknow, is done on the function F between the bounds Lower and Upper.

	:param F:
	:type F: math_MultipleVarFunction &
	:param Lower:
	:type Lower: math_Vector &
	:param Upper:
	:type Upper: math_Vector &
	:param Order:
	:type Order: math_IntegerVector &
	:rtype: None
") math_GaussMultipleIntegration;
		 math_GaussMultipleIntegration (math_MultipleVarFunction & F,const math_Vector & Lower,const math_Vector & Upper,const math_IntegerVector & Order);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* returns True if all has been correctly done.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* returns the value of the integral.

	:rtype: float
") Value;
		Standard_Real Value ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend math_GaussMultipleIntegration {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_GaussSetIntegration;
class math_GaussSetIntegration {
	public:
		%feature("compactdefaultargs") math_GaussSetIntegration;
		%feature("autodoc", "	* The Gauss-Legendre integration with Order = points of integration for each unknow, is done on the function F between the bounds Lower and Upper.

	:param F:
	:type F: math_FunctionSet &
	:param Lower:
	:type Lower: math_Vector &
	:param Upper:
	:type Upper: math_Vector &
	:param Order:
	:type Order: math_IntegerVector &
	:rtype: None
") math_GaussSetIntegration;
		 math_GaussSetIntegration (math_FunctionSet & F,const math_Vector & Lower,const math_Vector & Upper,const math_IntegerVector & Order);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* returns True if all has been correctly done.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* returns the value of the integral.

	:rtype: math_Vector
") Value;
		const math_Vector & Value ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend math_GaussSetIntegration {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_GaussSingleIntegration;
class math_GaussSingleIntegration {
	public:
		%feature("compactdefaultargs") math_GaussSingleIntegration;
		%feature("autodoc", "	:rtype: None
") math_GaussSingleIntegration;
		 math_GaussSingleIntegration ();
		%feature("compactdefaultargs") math_GaussSingleIntegration;
		%feature("autodoc", "	* The Gauss-Legendre integration with N = Order points of integration, is done on the function F between the bounds Lower and Upper.

	:param F:
	:type F: math_Function &
	:param Lower:
	:type Lower: float
	:param Upper:
	:type Upper: float
	:param Order:
	:type Order: int
	:rtype: None
") math_GaussSingleIntegration;
		 math_GaussSingleIntegration (math_Function & F,const Standard_Real Lower,const Standard_Real Upper,const Standard_Integer Order);
		%feature("compactdefaultargs") math_GaussSingleIntegration;
		%feature("autodoc", "	* The Gauss-Legendre integration with N = Order points of integration and given tolerance = Tol is done on the function F between the bounds Lower and Upper.

	:param F:
	:type F: math_Function &
	:param Lower:
	:type Lower: float
	:param Upper:
	:type Upper: float
	:param Order:
	:type Order: int
	:param Tol:
	:type Tol: float
	:rtype: None
") math_GaussSingleIntegration;
		 math_GaussSingleIntegration (math_Function & F,const Standard_Real Lower,const Standard_Real Upper,const Standard_Integer Order,const Standard_Real Tol);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* returns True if all has been correctly done.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* returns the value of the integral.

	:rtype: float
") Value;
		Standard_Real Value ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend math_GaussSingleIntegration {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_GlobOptMin;
class math_GlobOptMin {
	public:
		%feature("compactdefaultargs") math_GlobOptMin;
		%feature("autodoc", "	:param theFunc:
	:type theFunc: math_MultipleVarFunction *
	:param theLowerBorder:
	:type theLowerBorder: math_Vector &
	:param theUpperBorder:
	:type theUpperBorder: math_Vector &
	:param theC: default value is 9
	:type theC: float
	:param theDiscretizationTol: default value is 1.0e-2
	:type theDiscretizationTol: float
	:param theSameTol: default value is 1.0e-7
	:type theSameTol: float
	:rtype: None
") math_GlobOptMin;
		 math_GlobOptMin (math_MultipleVarFunction * theFunc,const math_Vector & theLowerBorder,const math_Vector & theUpperBorder,const Standard_Real theC = 9,const Standard_Real theDiscretizationTol = 1.0e-2,const Standard_Real theSameTol = 1.0e-7);
		%feature("compactdefaultargs") SetGlobalParams;
		%feature("autodoc", "	:param theFunc:
	:type theFunc: math_MultipleVarFunction *
	:param theLowerBorder:
	:type theLowerBorder: math_Vector &
	:param theUpperBorder:
	:type theUpperBorder: math_Vector &
	:param theC: default value is 9
	:type theC: float
	:param theDiscretizationTol: default value is 1.0e-2
	:type theDiscretizationTol: float
	:param theSameTol: default value is 1.0e-7
	:type theSameTol: float
	:rtype: None
") SetGlobalParams;
		void SetGlobalParams (math_MultipleVarFunction * theFunc,const math_Vector & theLowerBorder,const math_Vector & theUpperBorder,const Standard_Real theC = 9,const Standard_Real theDiscretizationTol = 1.0e-2,const Standard_Real theSameTol = 1.0e-7);
		%feature("compactdefaultargs") SetLocalParams;
		%feature("autodoc", "	:param theLocalA:
	:type theLocalA: math_Vector &
	:param theLocalB:
	:type theLocalB: math_Vector &
	:rtype: None
") SetLocalParams;
		void SetLocalParams (const math_Vector & theLocalA,const math_Vector & theLocalB);
		%feature("compactdefaultargs") SetTol;
		%feature("autodoc", "	:param theDiscretizationTol:
	:type theDiscretizationTol: float
	:param theSameTol:
	:type theSameTol: float
	:rtype: None
") SetTol;
		void SetTol (const Standard_Real theDiscretizationTol,const Standard_Real theSameTol);
		%feature("compactdefaultargs") GetTol;
		%feature("autodoc", "	:param theDiscretizationTol:
	:type theDiscretizationTol: float &
	:param theSameTol:
	:type theSameTol: float &
	:rtype: None
") GetTol;
		void GetTol (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* @param isFindSingleSolution - defines whether to find single solution or all solutions.

	:param isFindSingleSolution: default value is Standard_False
	:type isFindSingleSolution: bool
	:rtype: None
") Perform;
		void Perform (const Standard_Boolean isFindSingleSolution = Standard_False);
		%feature("compactdefaultargs") GetF;
		%feature("autodoc", "	* Get best functional value.

	:rtype: float
") GetF;
		Standard_Real GetF ();
		%feature("compactdefaultargs") NbExtrema;
		%feature("autodoc", "	* Return count of global extremas.

	:rtype: int
") NbExtrema;
		Standard_Integer NbExtrema ();
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	* Return solution theIndex, 1 <= theIndex <= NbExtrema.

	:param theIndex:
	:type theIndex: int
	:param theSol:
	:type theSol: math_Vector &
	:rtype: None
") Points;
		void Points (const Standard_Integer theIndex,math_Vector & theSol);
};


%extend math_GlobOptMin {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_Householder;
class math_Householder {
	public:
		%feature("compactdefaultargs") math_Householder;
		%feature("autodoc", "	* Given an input matrix A with n>= m, given an input matrix B this constructor performs the least square resolution of the set of linear equations A.X = B for each column of B. If a column norm is less than EPS, the resolution can't be done. Exception DimensionError is raised if the row number of B is different from the A row number.

	:param A:
	:type A: math_Matrix &
	:param B:
	:type B: math_Matrix &
	:param EPS: default value is 1.0e-20
	:type EPS: float
	:rtype: None
") math_Householder;
		 math_Householder (const math_Matrix & A,const math_Matrix & B,const Standard_Real EPS = 1.0e-20);
		%feature("compactdefaultargs") math_Householder;
		%feature("autodoc", "	* Given an input matrix A with n>= m, given an input matrix B this constructor performs the least square resolution of the set of linear equations A.X = B for each column of B. If a column norm is less than EPS, the resolution can't be done. Exception DimensionError is raised if the row number of B is different from the A row number.

	:param A:
	:type A: math_Matrix &
	:param B:
	:type B: math_Matrix &
	:param lowerArow:
	:type lowerArow: int
	:param upperArow:
	:type upperArow: int
	:param lowerAcol:
	:type lowerAcol: int
	:param upperAcol:
	:type upperAcol: int
	:param EPS: default value is 1.0e-20
	:type EPS: float
	:rtype: None
") math_Householder;
		 math_Householder (const math_Matrix & A,const math_Matrix & B,const Standard_Integer lowerArow,const Standard_Integer upperArow,const Standard_Integer lowerAcol,const Standard_Integer upperAcol,const Standard_Real EPS = 1.0e-20);
		%feature("compactdefaultargs") math_Householder;
		%feature("autodoc", "	* Given an input matrix A with n>= m, given an input vector B this constructor performs the least square resolution of the set of linear equations A.X = B. If a column norm is less than EPS, the resolution can't be done. Exception DimensionError is raised if the length of B is different from the A row number.

	:param A:
	:type A: math_Matrix &
	:param B:
	:type B: math_Vector &
	:param EPS: default value is 1.0e-20
	:type EPS: float
	:rtype: None
") math_Householder;
		 math_Householder (const math_Matrix & A,const math_Vector & B,const Standard_Real EPS = 1.0e-20);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Given the integer Index, this routine returns the corresponding least square solution sol. Exception NotDone is raised if the resolution has not be done. Exception OutOfRange is raised if Index <=0 or Index is more than the number of columns of B.

	:param sol:
	:type sol: math_Vector &
	:param Index: default value is 1
	:type Index: int
	:rtype: None
") Value;
		void Value (math_Vector & sol,const Standard_Integer Index = 1);
		%feature("compactdefaultargs") AllValues;
		%feature("autodoc", "	* Returns the matrix sol of all the solutions of the system A.X = B. Exception NotDone is raised is the resolution has not be done.

	:rtype: math_Matrix
") AllValues;
		const math_Matrix & AllValues ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend math_Householder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_IntegerVector;
class math_IntegerVector {
	public:
		%feature("compactdefaultargs") math_IntegerVector;
		%feature("autodoc", "	* contructs an IntegerVector in the range [Lower..Upper]

	:param theFirst:
	:type theFirst: int
	:param theLast:
	:type theLast: int
	:rtype: None
") math_IntegerVector;
		 math_IntegerVector (const Standard_Integer theFirst,const Standard_Integer theLast);
		%feature("compactdefaultargs") math_IntegerVector;
		%feature("autodoc", "	* contructs an IntegerVector in the range [Lower..Upper] with all the elements set to theInitialValue.

	:param theFirst:
	:type theFirst: int
	:param theLast:
	:type theLast: int
	:param theInitialValue:
	:type theInitialValue: int
	:rtype: None
") math_IntegerVector;
		 math_IntegerVector (const Standard_Integer theFirst,const Standard_Integer theLast,const Standard_Integer theInitialValue);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize an IntegerVector with all the elements set to theInitialValue.

	:param theInitialValue:
	:type theInitialValue: int
	:rtype: None
") Init;
		void Init (const Standard_Integer theInitialValue);
		%feature("compactdefaultargs") math_IntegerVector;
		%feature("autodoc", "	* constructs an IntegerVector in the range [Lower..Upper] which share the 'c array' theTab.

	:param theTab:
	:type theTab: Standard_Address
	:param theFirst:
	:type theFirst: int
	:param theLast:
	:type theLast: int
	:rtype: None
") math_IntegerVector;
		 math_IntegerVector (const Standard_Address theTab,const Standard_Integer theFirst,const Standard_Integer theLast);
		%feature("compactdefaultargs") math_IntegerVector;
		%feature("autodoc", "	* constructs a copy for initialization. An exception is raised if the lengths of the IntegerVectors are different.

	:param theOther:
	:type theOther: math_IntegerVector &
	:rtype: None
") math_IntegerVector;
		 math_IntegerVector (const math_IntegerVector & theOther);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* returns the length of an IntegerVector

	:rtype: inline int
") Length;
		inline Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	* returns the value of the Lower index of an IntegerVector.

	:rtype: inline int
") Lower;
		inline Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	* returns the value of the Upper index of an IntegerVector.

	:rtype: inline int
") Upper;
		inline Standard_Integer Upper ();
		%feature("compactdefaultargs") Norm;
		%feature("autodoc", "	* returns the value of the norm of an IntegerVector.

	:rtype: float
") Norm;
		Standard_Real Norm ();
		%feature("compactdefaultargs") Norm2;
		%feature("autodoc", "	* returns the value of the square of the norm of an IntegerVector.

	:rtype: float
") Norm2;
		Standard_Real Norm2 ();
		%feature("compactdefaultargs") Max;
		%feature("autodoc", "	* returns the value of the Index of the maximum element of an IntegerVector.

	:rtype: int
") Max;
		Standard_Integer Max ();
		%feature("compactdefaultargs") Min;
		%feature("autodoc", "	* returns the value of the Index of the minimum element of an IntegerVector.

	:rtype: int
") Min;
		Standard_Integer Min ();
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "	* inverses an IntegerVector.

	:rtype: None
") Invert;
		void Invert ();
		%feature("compactdefaultargs") Inverse;
		%feature("autodoc", "	* returns the inverse IntegerVector of an IntegerVector.

	:rtype: math_IntegerVector
") Inverse;
		math_IntegerVector Inverse ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* sets an IntegerVector from 'theI1' to 'theI2' to the IntegerVector 'theV'; An exception is raised if 'theI1' is less than 'LowerIndex' or 'theI2' is greater than 'UpperIndex' or 'theI1' is greater than 'theI2'. An exception is raised if 'theI2-theI1+1' is different from the Length of 'theV'.

	:param theI1:
	:type theI1: int
	:param theI2:
	:type theI2: int
	:param theV:
	:type theV: math_IntegerVector &
	:rtype: None
") Set;
		void Set (const Standard_Integer theI1,const Standard_Integer theI2,const math_IntegerVector & theV);
		%feature("compactdefaultargs") Slice;
		%feature("autodoc", "	* slices the values of the IntegerVector between 'theI1' and 'theI2': Example: [2, 1, 2, 3, 4, 5] becomes [2, 4, 3, 2, 1, 5] between 2 and 5. An exception is raised if 'theI1' is less than 'LowerIndex' or 'theI2' is greater than 'UpperIndex'.

	:param theI1:
	:type theI1: int
	:param theI2:
	:type theI2: int
	:rtype: math_IntegerVector
") Slice;
		math_IntegerVector Slice (const Standard_Integer theI1,const Standard_Integer theI2);
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "	* returns the product of an IntegerVector by an integer value.

	:param theRight:
	:type theRight: int
	:rtype: None
") Multiply;
		void Multiply (const Standard_Integer theRight);
		%feature("compactdefaultargs") operator *=;
		%feature("autodoc", "	:param theRight:
	:type theRight: int
	:rtype: None
") operator *=;
		void operator *= (const Standard_Integer theRight);
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "	* returns the product of an IntegerVector by an integer value.

	:param theRight:
	:type theRight: int
	:rtype: math_IntegerVector
") Multiplied;
		math_IntegerVector Multiplied (const Standard_Integer theRight);
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param theRight:
	:type theRight: int
	:rtype: math_IntegerVector
") operator *;
		math_IntegerVector operator * (const Standard_Integer theRight);
		%feature("compactdefaultargs") TMultiplied;
		%feature("autodoc", "	* returns the product of a vector and a real value.

	:param theRight:
	:type theRight: int
	:rtype: math_IntegerVector
") TMultiplied;
		math_IntegerVector TMultiplied (const Standard_Integer theRight);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* adds the IntegerVector 'theRight' to an IntegerVector. An exception is raised if the IntegerVectors have not the same length. An exception is raised if the lengths are not equal.

	:param theRight:
	:type theRight: math_IntegerVector &
	:rtype: None
") Add;
		void Add (const math_IntegerVector & theRight);
		%feature("compactdefaultargs") operator +=;
		%feature("autodoc", "	:param theRight:
	:type theRight: math_IntegerVector &
	:rtype: None
") operator +=;
		void operator += (const math_IntegerVector & theRight);
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "	* adds the IntegerVector 'theRight' to an IntegerVector. An exception is raised if the IntegerVectors have not the same length. An exception is raised if the lengths are not equal.

	:param theRight:
	:type theRight: math_IntegerVector &
	:rtype: math_IntegerVector
") Added;
		math_IntegerVector Added (const math_IntegerVector & theRight);
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "	:param theRight:
	:type theRight: math_IntegerVector &
	:rtype: math_IntegerVector
") operator +;
		math_IntegerVector operator + (const math_IntegerVector & theRight);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* sets an IntegerVector to the sum of the IntegerVector 'theLeft' and the IntegerVector 'theRight'. An exception is raised if the lengths are different.

	:param theLeft:
	:type theLeft: math_IntegerVector &
	:param theRight:
	:type theRight: math_IntegerVector &
	:rtype: None
") Add;
		void Add (const math_IntegerVector & theLeft,const math_IntegerVector & theRight);
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "	* sets an IntegerVector to the substraction of 'theRight' from 'theLeft'. An exception is raised if the IntegerVectors have not the same length.

	:param theLeft:
	:type theLeft: math_IntegerVector &
	:param theRight:
	:type theRight: math_IntegerVector &
	:rtype: None
") Subtract;
		void Subtract (const math_IntegerVector & theLeft,const math_IntegerVector & theRight);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* accesses (in read or write mode) the value of index theNum of an IntegerVector.

	:param theNum:
	:type theNum: int
	:rtype: inline int
") Value;
		inline Standard_Integer & Value (const Standard_Integer theNum);
		%feature("compactdefaultargs") Initialized;
		%feature("autodoc", "	* Initialises an IntegerVector by copying 'theOther'. An exception is raised if the Lengths are different.

	:param theOther:
	:type theOther: math_IntegerVector &
	:rtype: math_IntegerVector
") Initialized;
		math_IntegerVector & Initialized (const math_IntegerVector & theOther);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param theOther:
	:type theOther: math_IntegerVector &
	:rtype: math_IntegerVector
") operator =;
		math_IntegerVector & operator = (const math_IntegerVector & theOther);
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "	* returns the inner product of 2 IntegerVectors. An exception is raised if the lengths are not equal.

	:param theRight:
	:type theRight: math_IntegerVector &
	:rtype: int
") Multiplied;
		Standard_Integer Multiplied (const math_IntegerVector & theRight);
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param theRight:
	:type theRight: math_IntegerVector &
	:rtype: int
") operator *;
		Standard_Integer operator * (const math_IntegerVector & theRight);
		%feature("compactdefaultargs") Opposite;
		%feature("autodoc", "	* returns the opposite of an IntegerVector.

	:rtype: math_IntegerVector
") Opposite;
		math_IntegerVector Opposite ();
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "	:rtype: math_IntegerVector
") operator -;
		math_IntegerVector operator - ();
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "	* returns the subtraction of 'theRight' from 'me'. An exception is raised if the IntegerVectors have not the same length.

	:param theRight:
	:type theRight: math_IntegerVector &
	:rtype: None
") Subtract;
		void Subtract (const math_IntegerVector & theRight);
		%feature("compactdefaultargs") operator -=;
		%feature("autodoc", "	:param theRight:
	:type theRight: math_IntegerVector &
	:rtype: None
") operator -=;
		void operator -= (const math_IntegerVector & theRight);
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "	* returns the subtraction of 'theRight' from 'me'. An exception is raised if the IntegerVectors have not the same length.

	:param theRight:
	:type theRight: math_IntegerVector &
	:rtype: math_IntegerVector
") Subtracted;
		math_IntegerVector Subtracted (const math_IntegerVector & theRight);
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "	:param theRight:
	:type theRight: math_IntegerVector &
	:rtype: math_IntegerVector
") operator -;
		math_IntegerVector operator - (const math_IntegerVector & theRight);
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "	* returns the multiplication of an integer by an IntegerVector.

	:param theLeft:
	:type theLeft: int
	:param theRight:
	:type theRight: math_IntegerVector &
	:rtype: None
") Multiply;
		void Multiply (const Standard_Integer theLeft,const math_IntegerVector & theRight);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend math_IntegerVector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_Jacobi;
class math_Jacobi {
	public:
		%feature("compactdefaultargs") math_Jacobi;
		%feature("autodoc", "	* Given a Real n X n matrix A, this constructor computes all its eigenvalues and eigenvectors using the Jacobi method. The exception NotSquare is raised if the matrix is not square. No verification that the matrix A is really symmetric is done.

	:param A:
	:type A: math_Matrix &
	:rtype: None
") math_Jacobi;
		 math_Jacobi (const math_Matrix & A);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Returns the eigenvalues vector. Exception NotDone is raised if calculation is not done successfully.

	:rtype: math_Vector
") Values;
		const math_Vector & Values ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* returns the eigenvalue number Num. Eigenvalues are in the range (1..n). Exception NotDone is raised if calculation is not done successfully.

	:param Num:
	:type Num: int
	:rtype: float
") Value;
		Standard_Real Value (const Standard_Integer Num);
		%feature("compactdefaultargs") Vectors;
		%feature("autodoc", "	* returns the eigenvectors matrix. Exception NotDone is raised if calculation is not done successfully.

	:rtype: math_Matrix
") Vectors;
		const math_Matrix & Vectors ();
		%feature("compactdefaultargs") Vector;
		%feature("autodoc", "	* Returns the eigenvector V of number Num. Eigenvectors are in the range (1..n). Exception NotDone is raised if calculation is not done successfully.

	:param Num:
	:type Num: int
	:param V:
	:type V: math_Vector &
	:rtype: None
") Vector;
		void Vector (const Standard_Integer Num,math_Vector & V);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend math_Jacobi {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_KronrodSingleIntegration;
class math_KronrodSingleIntegration {
	public:
		%feature("compactdefaultargs") math_KronrodSingleIntegration;
		%feature("autodoc", "	* An empty constructor.

	:rtype: None
") math_KronrodSingleIntegration;
		 math_KronrodSingleIntegration ();
		%feature("compactdefaultargs") math_KronrodSingleIntegration;
		%feature("autodoc", "	* Constructor. Takes the function, the lower and upper bound values, the initial number of Kronrod points

	:param theFunction:
	:type theFunction: math_Function &
	:param theLower:
	:type theLower: float
	:param theUpper:
	:type theUpper: float
	:param theNbPnts:
	:type theNbPnts: int
	:rtype: None
") math_KronrodSingleIntegration;
		 math_KronrodSingleIntegration (math_Function & theFunction,const Standard_Real theLower,const Standard_Real theUpper,const Standard_Integer theNbPnts);
		%feature("compactdefaultargs") math_KronrodSingleIntegration;
		%feature("autodoc", "	* Constructor. Takes the function, the lower and upper bound values, the initial number of Kronrod points, the tolerance value and the maximal number of iterations as parameters.

	:param theFunction:
	:type theFunction: math_Function &
	:param theLower:
	:type theLower: float
	:param theUpper:
	:type theUpper: float
	:param theNbPnts:
	:type theNbPnts: int
	:param theTolerance:
	:type theTolerance: float
	:param theMaxNbIter:
	:type theMaxNbIter: int
	:rtype: None
") math_KronrodSingleIntegration;
		 math_KronrodSingleIntegration (math_Function & theFunction,const Standard_Real theLower,const Standard_Real theUpper,const Standard_Integer theNbPnts,const Standard_Real theTolerance,const Standard_Integer theMaxNbIter);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computation of the integral. Takes the function, the lower and upper bound values, the initial number of Kronrod points, the relative tolerance value and the maximal number of iterations as parameters. theNbPnts should be odd and greater then or equal to 3.

	:param theFunction:
	:type theFunction: math_Function &
	:param theLower:
	:type theLower: float
	:param theUpper:
	:type theUpper: float
	:param theNbPnts:
	:type theNbPnts: int
	:rtype: None
") Perform;
		void Perform (math_Function & theFunction,const Standard_Real theLower,const Standard_Real theUpper,const Standard_Integer theNbPnts);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computation of the integral. Takes the function, the lower and upper bound values, the initial number of Kronrod points, the relative tolerance value and the maximal number of iterations as parameters. theNbPnts should be odd and greater then or equal to 3. Note that theTolerance is relative, i.e. the criterion of solution reaching is: Abs(Kronrod - Gauss)/Abs(Kronrod) < theTolerance. theTolerance should be positive.

	:param theFunction:
	:type theFunction: math_Function &
	:param theLower:
	:type theLower: float
	:param theUpper:
	:type theUpper: float
	:param theNbPnts:
	:type theNbPnts: int
	:param theTolerance:
	:type theTolerance: float
	:param theMaxNbIter:
	:type theMaxNbIter: int
	:rtype: None
") Perform;
		void Perform (math_Function & theFunction,const Standard_Real theLower,const Standard_Real theUpper,const Standard_Integer theNbPnts,const Standard_Real theTolerance,const Standard_Integer theMaxNbIter);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns Standard_True if computation is performed successfully.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the value of the integral.

	:rtype: float
") Value;
		Standard_Real Value ();
		%feature("compactdefaultargs") ErrorReached;
		%feature("autodoc", "	* Returns the value of the relative error reached.

	:rtype: float
") ErrorReached;
		Standard_Real ErrorReached ();
		%feature("compactdefaultargs") AbsolutError;
		%feature("autodoc", "	* Returns the value of the relative error reached.

	:rtype: float
") AbsolutError;
		Standard_Real AbsolutError ();
		%feature("compactdefaultargs") OrderReached;
		%feature("autodoc", "	* Returns the number of Kronrod points for which the result is computed.

	:rtype: int
") OrderReached;
		Standard_Integer OrderReached ();
		%feature("compactdefaultargs") NbIterReached;
		%feature("autodoc", "	* Returns the number of iterations that were made to compute result.

	:rtype: int
") NbIterReached;
		Standard_Integer NbIterReached ();
		%feature("compactdefaultargs") GKRule;
		%feature("autodoc", "	:param theFunction:
	:type theFunction: math_Function &
	:param theLower:
	:type theLower: float
	:param theUpper:
	:type theUpper: float
	:param theGaussP:
	:type theGaussP: math_Vector &
	:param theGaussW:
	:type theGaussW: math_Vector &
	:param theKronrodP:
	:type theKronrodP: math_Vector &
	:param theKronrodW:
	:type theKronrodW: math_Vector &
	:param theValue:
	:type theValue: float &
	:param theError:
	:type theError: float &
	:rtype: bool
") GKRule;
		static Standard_Boolean GKRule (math_Function & theFunction,const Standard_Real theLower,const Standard_Real theUpper,const math_Vector & theGaussP,const math_Vector & theGaussW,const math_Vector & theKronrodP,const math_Vector & theKronrodW,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend math_KronrodSingleIntegration {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_Matrix;
class math_Matrix {
	public:
		%feature("compactdefaultargs") math_Matrix;
		%feature("autodoc", "	* Constructs a non-initialized matrix of range [LowerRow..UpperRow, LowerCol..UpperCol] For the constructed matrix: - LowerRow and UpperRow are the indexes of the lower and upper bounds of a row, and - LowerCol and UpperCol are the indexes of the lower and upper bounds of a column.

	:param LowerRow:
	:type LowerRow: int
	:param UpperRow:
	:type UpperRow: int
	:param LowerCol:
	:type LowerCol: int
	:param UpperCol:
	:type UpperCol: int
	:rtype: None
") math_Matrix;
		 math_Matrix (const Standard_Integer LowerRow,const Standard_Integer UpperRow,const Standard_Integer LowerCol,const Standard_Integer UpperCol);
		%feature("compactdefaultargs") math_Matrix;
		%feature("autodoc", "	* constructs a non-initialized matrix of range [LowerRow..UpperRow, LowerCol..UpperCol] whose values are all initialized with the value InitialValue.

	:param LowerRow:
	:type LowerRow: int
	:param UpperRow:
	:type UpperRow: int
	:param LowerCol:
	:type LowerCol: int
	:param UpperCol:
	:type UpperCol: int
	:param InitialValue:
	:type InitialValue: float
	:rtype: None
") math_Matrix;
		 math_Matrix (const Standard_Integer LowerRow,const Standard_Integer UpperRow,const Standard_Integer LowerCol,const Standard_Integer UpperCol,const Standard_Real InitialValue);
		%feature("compactdefaultargs") math_Matrix;
		%feature("autodoc", "	* constructs a matrix of range [LowerRow..UpperRow, LowerCol..UpperCol] Sharing data with a 'C array' pointed by Tab.

	:param Tab:
	:type Tab: Standard_Address
	:param LowerRow:
	:type LowerRow: int
	:param UpperRow:
	:type UpperRow: int
	:param LowerCol:
	:type LowerCol: int
	:param UpperCol:
	:type UpperCol: int
	:rtype: None
") math_Matrix;
		 math_Matrix (const Standard_Address Tab,const Standard_Integer LowerRow,const Standard_Integer UpperRow,const Standard_Integer LowerCol,const Standard_Integer UpperCol);
		%feature("compactdefaultargs") math_Matrix;
		%feature("autodoc", "	* constructs a matrix for copy in initialization. An exception is raised if the matrixes have not the same dimensions.

	:param Other:
	:type Other: math_Matrix &
	:rtype: None
") math_Matrix;
		 math_Matrix (const math_Matrix & Other);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all the elements of a matrix to InitialValue.

	:param InitialValue:
	:type InitialValue: float
	:rtype: None
") Init;
		void Init (const Standard_Real InitialValue);
		%feature("compactdefaultargs") RowNumber;
		%feature("autodoc", "	* Returns the number of rows of this matrix. Note that for a matrix A you always have the following relations: - A.RowNumber() = A.UpperRow() - A.LowerRow() + 1 - A.ColNumber() = A.UpperCol() - A.LowerCol() + 1 - the length of a row of A is equal to the number of columns of A, - the length of a column of A is equal to the number of rows of A.returns the row range of a matrix.

	:rtype: int
") RowNumber;
		Standard_Integer RowNumber ();
		%feature("compactdefaultargs") ColNumber;
		%feature("autodoc", "	* Returns the number of rows of this matrix. Note that for a matrix A you always have the following relations: - A.RowNumber() = A.UpperRow() - A.LowerRow() + 1 - A.ColNumber() = A.UpperCol() - A.LowerCol() + 1 - the length of a row of A is equal to the number of columns of A, - the length of a column of A is equal to the number of rows of A.returns the row range of a matrix.

	:rtype: int
") ColNumber;
		Standard_Integer ColNumber ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	* Returns the value of the Lower index of the row range of a matrix.

	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	* Returns the Upper index of the row range of a matrix.

	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	* Returns the value of the Lower index of the column range of a matrix.

	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	* Returns the value of the upper index of the column range of a matrix.

	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") Determinant;
		%feature("autodoc", "	* Computes the determinant of a matrix. An exception is raised if the matrix is not a square matrix.

	:rtype: float
") Determinant;
		Standard_Real Determinant ();
		%feature("compactdefaultargs") Transpose;
		%feature("autodoc", "	* Transposes a given matrix. An exception is raised if the matrix is not a square matrix.

	:rtype: None
") Transpose;
		void Transpose ();
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "	* Inverts a matrix using Gauss algorithm. Exception NotSquare is raised if the matrix is not square. Exception SingularMatrix is raised if the matrix is singular.

	:rtype: None
") Invert;
		void Invert ();
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "	* Sets this matrix to the product of the matrix Left, and the matrix Right. Example math_Matrix A (1, 3, 1, 3); math_Matrix B (1, 3, 1, 3); // A = ... , B = ... math_Matrix C (1, 3, 1, 3); C.Multiply(A, B); Exceptions Standard_DimensionError if matrices are of incompatible dimensions, i.e. if: - the number of columns of matrix Left, or the number of rows of matrix TLeft is not equal to the number of rows of matrix Right, or - the number of rows of matrix Left, or the number of columns of matrix TLeft is not equal to the number of rows of this matrix, or - the number of columns of matrix Right is not equal to the number of columns of this matrix.

	:param Right:
	:type Right: float
	:rtype: None
") Multiply;
		void Multiply (const Standard_Real Right);
		%feature("compactdefaultargs") operator *=;
		%feature("autodoc", "	:param Right:
	:type Right: float
	:rtype: None
") operator *=;
		void operator *= (const Standard_Real Right);
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "	* multiplies all the elements of a matrix by the value <Right>.

	:param Right:
	:type Right: float
	:rtype: math_Matrix
") Multiplied;
		math_Matrix Multiplied (const Standard_Real Right);
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param Right:
	:type Right: float
	:rtype: math_Matrix
") operator *;
		math_Matrix operator * (const Standard_Real Right);
		%feature("compactdefaultargs") TMultiplied;
		%feature("autodoc", "	* Sets this matrix to the product of the transposed matrix TLeft, and the matrix Right. Example math_Matrix A (1, 3, 1, 3); math_Matrix B (1, 3, 1, 3); // A = ... , B = ... math_Matrix C (1, 3, 1, 3); C.Multiply(A, B); Exceptions Standard_DimensionError if matrices are of incompatible dimensions, i.e. if: - the number of columns of matrix Left, or the number of rows of matrix TLeft is not equal to the number of rows of matrix Right, or - the number of rows of matrix Left, or the number of columns of matrix TLeft is not equal to the number of rows of this matrix, or - the number of columns of matrix Right is not equal to the number of columns of this matrix.

	:param Right:
	:type Right: float
	:rtype: math_Matrix
") TMultiplied;
		math_Matrix TMultiplied (const Standard_Real Right);
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "	* divides all the elements of a matrix by the value <Right>. An exception is raised if <Right> = 0.

	:param Right:
	:type Right: float
	:rtype: None
") Divide;
		void Divide (const Standard_Real Right);
		%feature("compactdefaultargs") operator /=;
		%feature("autodoc", "	:param Right:
	:type Right: float
	:rtype: None
") operator /=;
		void operator /= (const Standard_Real Right);
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "	* divides all the elements of a matrix by the value <Right>. An exception is raised if <Right> = 0.

	:param Right:
	:type Right: float
	:rtype: math_Matrix
") Divided;
		math_Matrix Divided (const Standard_Real Right);
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "	:param Right:
	:type Right: float
	:rtype: math_Matrix
") operator /;
		math_Matrix operator / (const Standard_Real Right);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* adds the matrix <Right> to a matrix. An exception is raised if the dimensions are different. Warning In order to save time when copying matrices, it is preferable to use operator += or the function Add whenever possible.

	:param Right:
	:type Right: math_Matrix &
	:rtype: None
") Add;
		void Add (const math_Matrix & Right);
		%feature("compactdefaultargs") operator +=;
		%feature("autodoc", "	:param Right:
	:type Right: math_Matrix &
	:rtype: None
") operator +=;
		void operator += (const math_Matrix & Right);
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "	* adds the matrix <Right> to a matrix. An exception is raised if the dimensions are different.

	:param Right:
	:type Right: math_Matrix &
	:rtype: math_Matrix
") Added;
		math_Matrix Added (const math_Matrix & Right);
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "	:param Right:
	:type Right: math_Matrix &
	:rtype: math_Matrix
") operator +;
		math_Matrix operator + (const math_Matrix & Right);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* sets a matrix to the addition of <Left> and <Right>. An exception is raised if the dimensions are different.

	:param Left:
	:type Left: math_Matrix &
	:param Right:
	:type Right: math_Matrix &
	:rtype: None
") Add;
		void Add (const math_Matrix & Left,const math_Matrix & Right);
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "	* Subtracts the matrix <Right> from <self>. An exception is raised if the dimensions are different. Warning In order to avoid time-consuming copying of matrices, it is preferable to use operator -= or the function Subtract whenever possible.

	:param Right:
	:type Right: math_Matrix &
	:rtype: None
") Subtract;
		void Subtract (const math_Matrix & Right);
		%feature("compactdefaultargs") operator -=;
		%feature("autodoc", "	:param Right:
	:type Right: math_Matrix &
	:rtype: None
") operator -=;
		void operator -= (const math_Matrix & Right);
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "	* Returns the result of the subtraction of <Right> from <self>. An exception is raised if the dimensions are different.

	:param Right:
	:type Right: math_Matrix &
	:rtype: math_Matrix
") Subtracted;
		math_Matrix Subtracted (const math_Matrix & Right);
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "	:param Right:
	:type Right: math_Matrix &
	:rtype: math_Matrix
") operator -;
		math_Matrix operator - (const math_Matrix & Right);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the values of this matrix, - from index I1 to index I2 on the row dimension, and - from index J1 to index J2 on the column dimension, to those of matrix M. Exceptions Standard_DimensionError if: - I1 is less than the index of the lower row bound of this matrix, or - I2 is greater than the index of the upper row bound of this matrix, or - J1 is less than the index of the lower column bound of this matrix, or - J2 is greater than the index of the upper column bound of this matrix, or - I2 - I1 + 1 is not equal to the number of rows of matrix M, or - J2 - J1 + 1 is not equal to the number of columns of matrix M.

	:param I1:
	:type I1: int
	:param I2:
	:type I2: int
	:param J1:
	:type J1: int
	:param J2:
	:type J2: int
	:param M:
	:type M: math_Matrix &
	:rtype: None
") Set;
		void Set (const Standard_Integer I1,const Standard_Integer I2,const Standard_Integer J1,const Standard_Integer J2,const math_Matrix & M);
		%feature("compactdefaultargs") SetRow;
		%feature("autodoc", "	* Sets the row of index Row of a matrix to the vector <V>. An exception is raised if the dimensions are different. An exception is raises if <Row> is inferior to the lower row of the matrix or <Row> is superior to the upper row.

	:param Row:
	:type Row: int
	:param V:
	:type V: math_Vector &
	:rtype: None
") SetRow;
		void SetRow (const Standard_Integer Row,const math_Vector & V);
		%feature("compactdefaultargs") SetCol;
		%feature("autodoc", "	* Sets the column of index Col of a matrix to the vector <V>. An exception is raised if the dimensions are different. An exception is raises if <Col> is inferior to the lower column of the matrix or <Col> is superior to the upper column.

	:param Col:
	:type Col: int
	:param V:
	:type V: math_Vector &
	:rtype: None
") SetCol;
		void SetCol (const Standard_Integer Col,const math_Vector & V);
		%feature("compactdefaultargs") SetDiag;
		%feature("autodoc", "	* Sets the diagonal of a matrix to the value <Value>. An exception is raised if the matrix is not square.

	:param Value:
	:type Value: float
	:rtype: None
") SetDiag;
		void SetDiag (const Standard_Real Value);
		%feature("compactdefaultargs") Row;
		%feature("autodoc", "	* Returns the row of index Row of a matrix.

	:param Row:
	:type Row: int
	:rtype: math_Vector
") Row;
		math_Vector Row (const Standard_Integer Row);
		%feature("compactdefaultargs") Col;
		%feature("autodoc", "	* Returns the column of index <Col> of a matrix.

	:param Col:
	:type Col: int
	:rtype: math_Vector
") Col;
		math_Vector Col (const Standard_Integer Col);
		%feature("compactdefaultargs") SwapRow;
		%feature("autodoc", "	* Swaps the rows of index Row1 and Row2. An exception is raised if <Row1> or <Row2> is out of range.

	:param Row1:
	:type Row1: int
	:param Row2:
	:type Row2: int
	:rtype: None
") SwapRow;
		void SwapRow (const Standard_Integer Row1,const Standard_Integer Row2);
		%feature("compactdefaultargs") SwapCol;
		%feature("autodoc", "	* Swaps the columns of index <Col1> and <Col2>. An exception is raised if <Col1> or <Col2> is out of range.

	:param Col1:
	:type Col1: int
	:param Col2:
	:type Col2: int
	:rtype: None
") SwapCol;
		void SwapCol (const Standard_Integer Col1,const Standard_Integer Col2);
		%feature("compactdefaultargs") Transposed;
		%feature("autodoc", "	* Teturns the transposed of a matrix. An exception is raised if the matrix is not a square matrix.

	:rtype: math_Matrix
") Transposed;
		math_Matrix Transposed ();
		%feature("compactdefaultargs") Inverse;
		%feature("autodoc", "	* Returns the inverse of a matrix. Exception NotSquare is raised if the matrix is not square. Exception SingularMatrix is raised if the matrix is singular.

	:rtype: math_Matrix
") Inverse;
		math_Matrix Inverse ();
		%feature("compactdefaultargs") TMultiply;
		%feature("autodoc", "	* Returns the product of the transpose of a matrix with the matrix <Right>. An exception is raised if the dimensions are different.

	:param Right:
	:type Right: math_Matrix &
	:rtype: math_Matrix
") TMultiply;
		math_Matrix TMultiply (const math_Matrix & Right);
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "	* Computes a matrix as the product of 2 vectors. An exception is raised if the dimensions are different. <self> = <Left> * <Right>.

	:param Left:
	:type Left: math_Vector &
	:param Right:
	:type Right: math_Vector &
	:rtype: None
") Multiply;
		void Multiply (const math_Vector & Left,const math_Vector & Right);
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "	* Computes a matrix as the product of 2 matrixes. An exception is raised if the dimensions are different.

	:param Left:
	:type Left: math_Matrix &
	:param Right:
	:type Right: math_Matrix &
	:rtype: None
") Multiply;
		void Multiply (const math_Matrix & Left,const math_Matrix & Right);
		%feature("compactdefaultargs") TMultiply;
		%feature("autodoc", "	* Computes a matrix to the product of the transpose of the matrix <TLeft> with the matrix <Right>. An exception is raised if the dimensions are different.

	:param TLeft:
	:type TLeft: math_Matrix &
	:param Right:
	:type Right: math_Matrix &
	:rtype: None
") TMultiply;
		void TMultiply (const math_Matrix & TLeft,const math_Matrix & Right);
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "	* Sets a matrix to the Subtraction of the matrix <Right> from the matrix <Left>. An exception is raised if the dimensions are different.

	:param Left:
	:type Left: math_Matrix &
	:param Right:
	:type Right: math_Matrix &
	:rtype: None
") Subtract;
		void Subtract (const math_Matrix & Left,const math_Matrix & Right);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Accesses (in read or write mode) the value of index <Row> and <Col> of a matrix. An exception is raised if <Row> and <Col> are not in the correct range.

	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: float
") Value;
		Standard_Real & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") Initialized;
		%feature("autodoc", "	* Matrixes are copied through assignement. An exception is raised if the dimensions are differents.

	:param Other:
	:type Other: math_Matrix &
	:rtype: math_Matrix
") Initialized;
		math_Matrix & Initialized (const math_Matrix & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: math_Matrix &
	:rtype: math_Matrix
") operator =;
		math_Matrix & operator = (const math_Matrix & Other);
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "	* Returns the product of 2 matrices. An exception is raised if the dimensions are different.

	:param Right:
	:type Right: math_Matrix &
	:rtype: None
") Multiply;
		void Multiply (const math_Matrix & Right);
		%feature("compactdefaultargs") operator *=;
		%feature("autodoc", "	:param Right:
	:type Right: math_Matrix &
	:rtype: None
") operator *=;
		void operator *= (const math_Matrix & Right);
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "	* Returns the product of 2 matrices. An exception is raised if the dimensions are different.

	:param Right:
	:type Right: math_Matrix &
	:rtype: math_Matrix
") Multiplied;
		math_Matrix Multiplied (const math_Matrix & Right);
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param Right:
	:type Right: math_Matrix &
	:rtype: math_Matrix
") operator *;
		math_Matrix operator * (const math_Matrix & Right);
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "	* Returns the product of a matrix by a vector. An exception is raised if the dimensions are different.

	:param Right:
	:type Right: math_Vector &
	:rtype: math_Vector
") Multiplied;
		math_Vector Multiplied (const math_Vector & Right);
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param Right:
	:type Right: math_Vector &
	:rtype: math_Vector
") operator *;
		math_Vector operator * (const math_Vector & Right);
		%feature("compactdefaultargs") Opposite;
		%feature("autodoc", "	* Returns the opposite of a matrix. An exception is raised if the dimensions are different.

	:rtype: math_Matrix
") Opposite;
		math_Matrix Opposite ();
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "	:rtype: math_Matrix
") operator -;
		math_Matrix operator - ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend math_Matrix {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_MultipleVarFunction;
class math_MultipleVarFunction {
	public:
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	* Returns the number of variables of the function

	:rtype: int
") NbVariables;
		virtual Standard_Integer NbVariables ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the values of the Functions <F> for the variable <X>. returns True if the computation was done successfully, otherwise false.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & X,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "	* return the state of the function corresponding to the latestt call of any methods associated to the function. This function is called by each of the algorithms described later which define the function Integer Algorithm::StateNumber(). The algorithm has the responsibility to call this function when it has found a solution (i.e. a root or a minimum) and has to maintain the association between the solution found and this StateNumber. Byu default, this method returns 0 (which means for the algorithm: no state has been saved). It is the responsibility of the programmer to decide if he needs to save the current state of the function and to return an Integer that allows retrieval of the state.

	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
};


%extend math_MultipleVarFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_NewtonFunctionRoot;
class math_NewtonFunctionRoot {
	public:
		%feature("compactdefaultargs") math_NewtonFunctionRoot;
		%feature("autodoc", "	* The Newton method is done to find the root of the function F from the initial guess Guess. The tolerance required on the root is given by Tolerance. The solution is found when : abs(Xi - Xi-1) <= EpsX and abs(F(Xi))<= EpsF The maximum number of iterations allowed is given by NbIterations.

	:param F:
	:type F: math_FunctionWithDerivative &
	:param Guess:
	:type Guess: float
	:param EpsX:
	:type EpsX: float
	:param EpsF:
	:type EpsF: float
	:param NbIterations: default value is 100
	:type NbIterations: int
	:rtype: None
") math_NewtonFunctionRoot;
		 math_NewtonFunctionRoot (math_FunctionWithDerivative & F,const Standard_Real Guess,const Standard_Real EpsX,const Standard_Real EpsF,const Standard_Integer NbIterations = 100);
		%feature("compactdefaultargs") math_NewtonFunctionRoot;
		%feature("autodoc", "	* The Newton method is done to find the root of the function F from the initial guess Guess. The solution must be inside the interval [A, B]. The tolerance required on the root is given by Tolerance. The solution is found when : abs(Xi - Xi-1) <= EpsX and abs(F(Xi))<= EpsF The maximum number of iterations allowed is given by NbIterations.

	:param F:
	:type F: math_FunctionWithDerivative &
	:param Guess:
	:type Guess: float
	:param EpsX:
	:type EpsX: float
	:param EpsF:
	:type EpsF: float
	:param A:
	:type A: float
	:param B:
	:type B: float
	:param NbIterations: default value is 100
	:type NbIterations: int
	:rtype: None
") math_NewtonFunctionRoot;
		 math_NewtonFunctionRoot (math_FunctionWithDerivative & F,const Standard_Real Guess,const Standard_Real EpsX,const Standard_Real EpsF,const Standard_Real A,const Standard_Real B,const Standard_Integer NbIterations = 100);
		%feature("compactdefaultargs") math_NewtonFunctionRoot;
		%feature("autodoc", "	* is used in a sub-class to initialize correctly all the fields of this class.

	:param A:
	:type A: float
	:param B:
	:type B: float
	:param EpsX:
	:type EpsX: float
	:param EpsF:
	:type EpsF: float
	:param NbIterations: default value is 100
	:type NbIterations: int
	:rtype: None
") math_NewtonFunctionRoot;
		 math_NewtonFunctionRoot (const Standard_Real A,const Standard_Real B,const Standard_Real EpsX,const Standard_Real EpsF,const Standard_Integer NbIterations = 100);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* is used internally by the constructors.

	:param F:
	:type F: math_FunctionWithDerivative &
	:param Guess:
	:type Guess: float
	:rtype: None
") Perform;
		void Perform (math_FunctionWithDerivative & F,const Standard_Real Guess);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "	* Returns the value of the root of function <F>. Exception NotDone is raised if the root was not found.

	:rtype: float
") Root;
		Standard_Real Root ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* returns the value of the derivative at the root. Exception NotDone is raised if the root was not found.

	:rtype: float
") Derivative;
		Standard_Real Derivative ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* returns the value of the function at the root. Exception NotDone is raised if the root was not found.

	:rtype: float
") Value;
		Standard_Real Value ();
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "	* Returns the number of iterations really done on the computation of the Root. Exception NotDone is raised if the root was not found.

	:rtype: int
") NbIterations;
		Standard_Integer NbIterations ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend math_NewtonFunctionRoot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_NewtonFunctionSetRoot;
class math_NewtonFunctionSetRoot {
	public:
		%feature("compactdefaultargs") math_NewtonFunctionSetRoot;
		%feature("autodoc", "	* Initialize correctly all the fields of this class. The range (1, F.NbVariables()) must be especially respected for all vectors and matrix declarations.

	:param theFunction:
	:type theFunction: math_FunctionSetWithDerivatives &
	:param theXTolerance:
	:type theXTolerance: math_Vector &
	:param theFTolerance:
	:type theFTolerance: float
	:param tehNbIterations: default value is 100
	:type tehNbIterations: int
	:rtype: None
") math_NewtonFunctionSetRoot;
		 math_NewtonFunctionSetRoot (math_FunctionSetWithDerivatives & theFunction,const math_Vector & theXTolerance,const Standard_Real theFTolerance,const Standard_Integer tehNbIterations = 100);
		%feature("compactdefaultargs") math_NewtonFunctionSetRoot;
		%feature("autodoc", "	* This constructor should be used in a sub-class to initialize correctly all the fields of this class. The range (1, F.NbVariables()) must be especially respected for all vectors and matrix declarations. The method SetTolerance must be called before performing the algorithm.

	:param theFunction:
	:type theFunction: math_FunctionSetWithDerivatives &
	:param theFTolerance:
	:type theFTolerance: float
	:param theNbIterations: default value is 100
	:type theNbIterations: int
	:rtype: None
") math_NewtonFunctionSetRoot;
		 math_NewtonFunctionSetRoot (math_FunctionSetWithDerivatives & theFunction,const Standard_Real theFTolerance,const Standard_Integer theNbIterations = 100);
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	* Destructor alias.

	:rtype: None
") Delete;
		void Delete ();
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	* Initializes the tolerance values for the unknowns.

	:param XTol:
	:type XTol: math_Vector &
	:rtype: None
") SetTolerance;
		void SetTolerance (const math_Vector & XTol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* The Newton method is done to improve the root of the function from the initial guess point. The solution is found when: abs(Xj - Xj-1)(i) <= XTol(i) and abs(Fi) <= FTol for all i;

	:param theFunction:
	:type theFunction: math_FunctionSetWithDerivatives &
	:param theStartingPoint:
	:type theStartingPoint: math_Vector &
	:rtype: None
") Perform;
		void Perform (math_FunctionSetWithDerivatives & theFunction,const math_Vector & theStartingPoint);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* The Newton method is done to improve the root of the function from the initial guess point. Bounds may be given, to constrain the solution. The solution is found when: abs(Xj - Xj-1)(i) <= XTol(i) and abs(Fi) <= FTol for all i;

	:param theFunction:
	:type theFunction: math_FunctionSetWithDerivatives &
	:param theStartingPoint:
	:type theStartingPoint: math_Vector &
	:param theInfBound:
	:type theInfBound: math_Vector &
	:param theSupBound:
	:type theSupBound: math_Vector &
	:rtype: None
") Perform;
		void Perform (math_FunctionSetWithDerivatives & theFunction,const math_Vector & theStartingPoint,const math_Vector & theInfBound,const math_Vector & theSupBound);
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "	* This method is called at the end of each iteration to check if the solution is found. Vectors DeltaX, Fvalues and Jacobian Matrix are consistent with the possible solution Vector Sol and can be inspected to decide whether the solution is reached or not.

	:param F:
	:type F: math_FunctionSetWithDerivatives &
	:rtype: bool
") IsSolutionReached;
		Standard_Boolean IsSolutionReached (math_FunctionSetWithDerivatives & F);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "	* Returns the value of the root of function F. Exceptions StdFail_NotDone if the algorithm fails (and IsDone returns false).

	:rtype: math_Vector
") Root;
		const math_Vector & Root ();
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "	* outputs the root vector in Root. Exception NotDone is raised if the root was not found. Exception DimensionError is raised if the range of Root is not equal to the range of the StartingPoint.

	:param Root:
	:type Root: math_Vector &
	:rtype: None
") Root;
		void Root (math_Vector & Root);
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the matrix value of the derivative at the root. Exception NotDone is raised if the root was not found.

	:rtype: math_Matrix
") Derivative;
		const math_Matrix & Derivative ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Outputs the matrix value of the derivative at the root in Der. Exception NotDone is raised if the root was not found. Exception DimensionError is raised if the range of Der is not equal to the range of the StartingPoint.

	:param Der:
	:type Der: math_Matrix &
	:rtype: None
") Derivative;
		void Derivative (math_Matrix & Der);
		%feature("compactdefaultargs") FunctionSetErrors;
		%feature("autodoc", "	* Returns the vector value of the error done on the functions at the root. Exception NotDone is raised if the root was not found.

	:rtype: math_Vector
") FunctionSetErrors;
		const math_Vector & FunctionSetErrors ();
		%feature("compactdefaultargs") FunctionSetErrors;
		%feature("autodoc", "	* Outputs the vector value of the error done on the functions at the root in Err. Exception NotDone is raised if the root was not found. Exception DimensionError is raised if the range of Err is not equal to the range of the StartingPoint.

	:param Err:
	:type Err: math_Vector &
	:rtype: None
") FunctionSetErrors;
		void FunctionSetErrors (math_Vector & Err);
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "	* Returns the number of iterations really done during the computation of the Root. Exception NotDone is raised if the root was not found.

	:rtype: int
") NbIterations;
		Standard_Integer NbIterations ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend math_NewtonFunctionSetRoot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_NewtonMinimum;
class math_NewtonMinimum {
	public:
		%feature("compactdefaultargs") math_NewtonMinimum;
		%feature("autodoc", "	* The tolerance required on the solution is given by Tolerance. Iteration are stopped if (!WithSingularity) and H(F(Xi)) is not definite positive (if the smaller eigenvalue of H < Convexity) or IsConverged() returns True for 2 successives Iterations. Warning: This constructor does not perform computation.

	:param theFunction:
	:type theFunction: math_MultipleVarFunctionWithHessian &
	:param theTolerance: default value is 1.0e-7
	:type theTolerance: float
	:param theNbIterations: default value is 40
	:type theNbIterations: int
	:param theConvexity: default value is 1.0e-6
	:type theConvexity: float
	:param theWithSingularity: default value is Standard_True
	:type theWithSingularity: bool
	:rtype: None
") math_NewtonMinimum;
		 math_NewtonMinimum (const math_MultipleVarFunctionWithHessian & theFunction,const Standard_Real theTolerance = 1.0e-7,const Standard_Integer theNbIterations = 40,const Standard_Real theConvexity = 1.0e-6,const Standard_Boolean theWithSingularity = Standard_True);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Search the solution.

	:param theFunction:
	:type theFunction: math_MultipleVarFunctionWithHessian &
	:param theStartingPoint:
	:type theStartingPoint: math_Vector &
	:rtype: None
") Perform;
		void Perform (math_MultipleVarFunctionWithHessian & theFunction,const math_Vector & theStartingPoint);
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	* Destructor alias.

	:rtype: None
") Delete;
		void Delete ();
		%feature("compactdefaultargs") IsConverged;
		%feature("autodoc", "	* This method is called at the end of each iteration to check the convergence: || Xi+1 - Xi || < Tolerance or || F(Xi+1) - F(Xi)|| < Tolerance * || F(Xi) || It can be redefined in a sub-class to implement a specific test.

	:rtype: bool
") IsConverged;
		Standard_Boolean IsConverged ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Tests if an error has occured.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* returns the location vector of the minimum. Exception NotDone is raised if an error has occured.

	:rtype: math_Vector
") Location;
		const math_Vector & Location ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* outputs the location vector of the minimum in Loc. Exception NotDone is raised if an error has occured. Exception DimensionError is raised if the range of Loc is not equal to the range of the StartingPoint.

	:param Loc:
	:type Loc: math_Vector &
	:rtype: None
") Location;
		void Location (math_Vector & Loc);
		%feature("compactdefaultargs") SetBoundary;
		%feature("autodoc", "	* Set boundaries.

	:param theLeftBorder:
	:type theLeftBorder: math_Vector &
	:param theRightBorder:
	:type theRightBorder: math_Vector &
	:rtype: None
") SetBoundary;
		void SetBoundary (const math_Vector & theLeftBorder,const math_Vector & theRightBorder);
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "	* returns the value of the minimum. Exception NotDone is raised if the minimum was not found.

	:rtype: float
") Minimum;
		Standard_Real Minimum ();
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "	* returns the gradient vector at the minimum. Exception NotDone is raised if an error has occured.the minimum was not found.

	:rtype: math_Vector
") Gradient;
		const math_Vector & Gradient ();
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "	* outputs the gradient vector at the minimum in Grad. Exception NotDone is raised if the minimum was not found. Exception DimensionError is raised if the range of Grad is not equal to the range of the StartingPoint.

	:param Grad:
	:type Grad: math_Vector &
	:rtype: None
") Gradient;
		void Gradient (math_Vector & Grad);
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "	* returns the number of iterations really done in the calculation of the minimum. The exception NotDone is raised if an error has occured.

	:rtype: int
") NbIterations;
		Standard_Integer NbIterations ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend math_NewtonMinimum {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_PSO;
class math_PSO {
	public:
		%feature("compactdefaultargs") math_PSO;
		%feature("autodoc", "	* /** * Constructor. * * @param theFunc defines the objective function. It should exist during all lifetime of class instance. * @param theLowBorder defines lower border of search space. * @param theUppBorder defines upper border of search space. * @param theSteps defines steps of regular grid, used for particle generation. This parameter used to define stop condition (TerminalVelocity). * @param theNbParticles defines number of particles. * @param theNbIter defines maximum number of iterations. */

	:param theFunc:
	:type theFunc: math_MultipleVarFunction *
	:param theLowBorder:
	:type theLowBorder: math_Vector &
	:param theUppBorder:
	:type theUppBorder: math_Vector &
	:param theSteps:
	:type theSteps: math_Vector &
	:param theNbParticles: default value is 32
	:type theNbParticles: int
	:param theNbIter: default value is 100
	:type theNbIter: int
	:rtype: None
") math_PSO;
		 math_PSO (math_MultipleVarFunction * theFunc,const math_Vector & theLowBorder,const math_Vector & theUppBorder,const math_Vector & theSteps,const Standard_Integer theNbParticles = 32,const Standard_Integer theNbIter = 100);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Perform computations, particles array is constructed inside of this function.

	:param theSteps:
	:type theSteps: math_Vector &
	:param theValue:
	:type theValue: float &
	:param theOutPnt:
	:type theOutPnt: math_Vector &
	:param theNbIter: default value is 100
	:type theNbIter: int
	:rtype: None
") Perform;
		void Perform (const math_Vector & theSteps,Standard_Real &OutValue,math_Vector & theOutPnt,const Standard_Integer theNbIter = 100);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Perform computations with given particles array.

	:param theParticles:
	:type theParticles: math_PSOParticlesPool &
	:param theNbParticles:
	:type theNbParticles: int
	:param theValue:
	:type theValue: float &
	:param theOutPnt:
	:type theOutPnt: math_Vector &
	:param theNbIter: default value is 100
	:type theNbIter: int
	:rtype: None
") Perform;
		void Perform (math_PSOParticlesPool & theParticles,Standard_Integer theNbParticles,Standard_Real &OutValue,math_Vector & theOutPnt,const Standard_Integer theNbIter = 100);
};


%extend math_PSO {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_PSOParticlesPool;
class math_PSOParticlesPool {
	public:
		%feature("compactdefaultargs") math_PSOParticlesPool;
		%feature("autodoc", "	:param theParticlesCount:
	:type theParticlesCount: int
	:param theDimensionCount:
	:type theDimensionCount: int
	:rtype: None
") math_PSOParticlesPool;
		 math_PSOParticlesPool (const Standard_Integer theParticlesCount,const Standard_Integer theDimensionCount);
		%feature("compactdefaultargs") GetParticle;
		%feature("autodoc", "	:param theIdx:
	:type theIdx: int
	:rtype: PSO_Particle *
") GetParticle;
		PSO_Particle * GetParticle (const Standard_Integer theIdx);
		%feature("compactdefaultargs") GetBestParticle;
		%feature("autodoc", "	:rtype: PSO_Particle *
") GetBestParticle;
		PSO_Particle * GetBestParticle ();
		%feature("compactdefaultargs") GetWorstParticle;
		%feature("autodoc", "	:rtype: PSO_Particle *
") GetWorstParticle;
		PSO_Particle * GetWorstParticle ();
};


%extend math_PSOParticlesPool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_Powell;
class math_Powell {
	public:
		%feature("compactdefaultargs") math_Powell;
		%feature("autodoc", "	* Constructor. Initialize new entity.

	:param theFunction:
	:type theFunction: math_MultipleVarFunction &
	:param theTolerance:
	:type theTolerance: float
	:param theNbIterations: default value is 200
	:type theNbIterations: int
	:param theZEPS: default value is 1.0e-12
	:type theZEPS: float
	:rtype: None
") math_Powell;
		 math_Powell (const math_MultipleVarFunction & theFunction,const Standard_Real theTolerance,const Standard_Integer theNbIterations = 200,const Standard_Real theZEPS = 1.0e-12);
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	* Destructor alias

	:rtype: None
") Delete;
		void Delete ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computes Powell minimization on the function F given theStartingPoint, and an initial matrix theStartingDirection whose columns contain the initial set of directions. The solution F = Fi is found when: 2.0 * abs(Fi - Fi-1) =< Tolerance * (abs(Fi) + abs(Fi-1) + ZEPS).

	:param theFunction:
	:type theFunction: math_MultipleVarFunction &
	:param theStartingPoint:
	:type theStartingPoint: math_Vector &
	:param theStartingDirections:
	:type theStartingDirections: math_Matrix &
	:rtype: None
") Perform;
		void Perform (math_MultipleVarFunction & theFunction,const math_Vector & theStartingPoint,const math_Matrix & theStartingDirections);
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "	* Solution F = Fi is found when: 2.0 * abs(Fi - Fi-1) <= Tolerance * (abs(Fi) + abs(Fi-1)) + ZEPS. The maximum number of iterations allowed is given by NbIterations.

	:param theFunction:
	:type theFunction: math_MultipleVarFunction &
	:rtype: bool
") IsSolutionReached;
		Standard_Boolean IsSolutionReached (math_MultipleVarFunction & theFunction);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* returns the location vector of the minimum. Exception NotDone is raised if the minimum was not found.

	:rtype: math_Vector
") Location;
		const math_Vector & Location ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* outputs the location vector of the minimum in Loc. Exception NotDone is raised if the minimum was not found. Exception DimensionError is raised if the range of Loc is not equal to the range of the StartingPoint.

	:param Loc:
	:type Loc: math_Vector &
	:rtype: None
") Location;
		void Location (math_Vector & Loc);
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "	* Returns the value of the minimum. Exception NotDone is raised if the minimum was not found.

	:rtype: float
") Minimum;
		Standard_Real Minimum ();
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "	* Returns the number of iterations really done during the computation of the minimum. Exception NotDone is raised if the minimum was not found.

	:rtype: int
") NbIterations;
		Standard_Integer NbIterations ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend math_Powell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class math_QuickSortOfValueAndWeight {
	public:
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "	:param TheArray:
	:type TheArray: math_Array1OfValueAndWeight &
	:param Comp:
	:type Comp: math_CompareOfValueAndWeight &
	:rtype: void
") Sort;
		static void Sort (math_Array1OfValueAndWeight & TheArray,const math_CompareOfValueAndWeight & Comp);
};


%extend math_QuickSortOfValueAndWeight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_SVD;
class math_SVD {
	public:
		%feature("compactdefaultargs") math_SVD;
		%feature("autodoc", "	* Given as input an n X m matrix A with n < m, n = m or n > m this constructor performs the Singular Value Decomposition.

	:param A:
	:type A: math_Matrix &
	:rtype: None
") math_SVD;
		 math_SVD (const math_Matrix & A);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "	* Given the input Vector B this routine solves the set of linear equations A . X = B. Exception NotDone is raised if the decomposition of A was not done successfully. Exception DimensionError is raised if the range of B is not equal to the rowrange of A. Exception DimensionError is raised if the range of X is not equal to the colrange of A.

	:param B:
	:type B: math_Vector &
	:param X:
	:type X: math_Vector &
	:param Eps: default value is 1.0e-6
	:type Eps: float
	:rtype: None
") Solve;
		void Solve (const math_Vector & B,math_Vector & X,const Standard_Real Eps = 1.0e-6);
		%feature("compactdefaultargs") PseudoInverse;
		%feature("autodoc", "	* Computes the inverse Inv of matrix A such as A * Inverse = Identity. Exceptions StdFail_NotDone if the algorithm fails (and IsDone returns false). Standard_DimensionError if the ranges of Inv are compatible with the ranges of A.

	:param Inv:
	:type Inv: math_Matrix &
	:param Eps: default value is 1.0e-6
	:type Eps: float
	:rtype: None
") PseudoInverse;
		void PseudoInverse (math_Matrix & Inv,const Standard_Real Eps = 1.0e-6);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend math_SVD {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_TrigonometricFunctionRoots;
class math_TrigonometricFunctionRoots {
	public:
		%feature("compactdefaultargs") math_TrigonometricFunctionRoots;
		%feature("autodoc", "	* Given coefficients a, b, c, d , e, this constructor performs the resolution of the equation above. The solutions must be contained in [InfBound, SupBound]. InfBound and SupBound can be set by default to 0 and 2*PI.

	:param A:
	:type A: float
	:param B:
	:type B: float
	:param C:
	:type C: float
	:param D:
	:type D: float
	:param E:
	:type E: float
	:param InfBound:
	:type InfBound: float
	:param SupBound:
	:type SupBound: float
	:rtype: None
") math_TrigonometricFunctionRoots;
		 math_TrigonometricFunctionRoots (const Standard_Real A,const Standard_Real B,const Standard_Real C,const Standard_Real D,const Standard_Real E,const Standard_Real InfBound,const Standard_Real SupBound);
		%feature("compactdefaultargs") math_TrigonometricFunctionRoots;
		%feature("autodoc", "	* Given the two coefficients d and e, it performs the resolution of d*sin(x) + e = 0. The solutions must be contained in [InfBound, SupBound]. InfBound and SupBound can be set by default to 0 and 2*PI.

	:param D:
	:type D: float
	:param E:
	:type E: float
	:param InfBound:
	:type InfBound: float
	:param SupBound:
	:type SupBound: float
	:rtype: None
") math_TrigonometricFunctionRoots;
		 math_TrigonometricFunctionRoots (const Standard_Real D,const Standard_Real E,const Standard_Real InfBound,const Standard_Real SupBound);
		%feature("compactdefaultargs") math_TrigonometricFunctionRoots;
		%feature("autodoc", "	* Given the three coefficients c, d and e, it performs the resolution of 2*b*cos(x)*sin(x) + d*sin(x) + e = 0. The solutions must be contained in [InfBound, SupBound]. InfBound and SupBound can be set by default to 0 and 2*PI.

	:param C:
	:type C: float
	:param D:
	:type D: float
	:param E:
	:type E: float
	:param InfBound:
	:type InfBound: float
	:param SupBound:
	:type SupBound: float
	:rtype: None
") math_TrigonometricFunctionRoots;
		 math_TrigonometricFunctionRoots (const Standard_Real C,const Standard_Real D,const Standard_Real E,const Standard_Real InfBound,const Standard_Real SupBound);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") InfiniteRoots;
		%feature("autodoc", "	* Returns true if there is an infinity of roots, otherwise returns false.

	:rtype: bool
") InfiniteRoots;
		Standard_Boolean InfiniteRoots ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the solution of range Index. An exception is raised if NotDone. An exception is raised if Index>NbSolutions. An exception is raised if there is an infinity of solutions.

	:param Index:
	:type Index: int
	:rtype: float
") Value;
		Standard_Real Value (const Standard_Integer Index);
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "	* Returns the number of solutions found. An exception is raised if NotDone. An exception is raised if there is an infinity of solutions.

	:rtype: int
") NbSolutions;
		Standard_Integer NbSolutions ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend math_TrigonometricFunctionRoots {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_Uzawa;
class math_Uzawa {
	public:
		%feature("compactdefaultargs") math_Uzawa;
		%feature("autodoc", "	* Given an input matrix Cont, two input vectors Secont and StartingPoint, it solves Cont*X = Secont (only = equations) with a minimization of Norme(X-X0). The maximun iterations number allowed is fixed to NbIterations. The tolerance EpsLic is fixed for the dual variable convergence. The tolerance EpsLix is used for the convergence of X. Exception ConstuctionError is raised if the line number of Cont is different from the length of Secont.

	:param Cont:
	:type Cont: math_Matrix &
	:param Secont:
	:type Secont: math_Vector &
	:param StartingPoint:
	:type StartingPoint: math_Vector &
	:param EpsLix: default value is 1.0e-06
	:type EpsLix: float
	:param EpsLic: default value is 1.0e-06
	:type EpsLic: float
	:param NbIterations: default value is 500
	:type NbIterations: int
	:rtype: None
") math_Uzawa;
		 math_Uzawa (const math_Matrix & Cont,const math_Vector & Secont,const math_Vector & StartingPoint,const Standard_Real EpsLix = 1.0e-06,const Standard_Real EpsLic = 1.0e-06,const Standard_Integer NbIterations = 500);
		%feature("compactdefaultargs") math_Uzawa;
		%feature("autodoc", "	* Given an input matrix Cont, two input vectors Secont and StartingPoint, it solves Cont*X = Secont (the Nce first equations are equal equations and the Nci last equations are inequalities <) with a minimization of Norme(X-X0). The maximun iterations number allowed is fixed to NbIterations. The tolerance EpsLic is fixed for the dual variable convergence. The tolerance EpsLix is used for the convergence of X. There are no conditions on Nce and Nci. Exception ConstuctionError is raised if the line number of Cont is different from the length of Secont and from Nce + Nci.

	:param Cont:
	:type Cont: math_Matrix &
	:param Secont:
	:type Secont: math_Vector &
	:param StartingPoint:
	:type StartingPoint: math_Vector &
	:param Nci:
	:type Nci: int
	:param Nce:
	:type Nce: int
	:param EpsLix: default value is 1.0e-06
	:type EpsLix: float
	:param EpsLic: default value is 1.0e-06
	:type EpsLic: float
	:param NbIterations: default value is 500
	:type NbIterations: int
	:rtype: None
") math_Uzawa;
		 math_Uzawa (const math_Matrix & Cont,const math_Vector & Secont,const math_Vector & StartingPoint,const Standard_Integer Nci,const Standard_Integer Nce,const Standard_Real EpsLix = 1.0e-06,const Standard_Real EpsLic = 1.0e-06,const Standard_Integer NbIterations = 500);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the vector solution of the system above. An exception is raised if NotDone.

	:rtype: math_Vector
") Value;
		const math_Vector & Value ();
		%feature("compactdefaultargs") InitialError;
		%feature("autodoc", "	* Returns the initial error Cont*StartingPoint-Secont. An exception is raised if NotDone.

	:rtype: math_Vector
") InitialError;
		const math_Vector & InitialError ();
		%feature("compactdefaultargs") Duale;
		%feature("autodoc", "	* returns the duale variables V of the systeme.

	:param V:
	:type V: math_Vector &
	:rtype: None
") Duale;
		void Duale (math_Vector & V);
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	* Returns the difference between X solution and the StartingPoint. An exception is raised if NotDone.

	:rtype: math_Vector
") Error;
		const math_Vector & Error ();
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "	* returns the number of iterations really done. An exception is raised if NotDone.

	:rtype: int
") NbIterations;
		Standard_Integer NbIterations ();
		%feature("compactdefaultargs") InverseCont;
		%feature("autodoc", "	* returns the inverse matrix of (C * Transposed(C)). This result is needed for the computation of the gradient when approximating a curve.

	:rtype: math_Matrix
") InverseCont;
		const math_Matrix & InverseCont ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend math_Uzawa {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_ValueAndWeight;
class math_ValueAndWeight {
	public:
		%feature("compactdefaultargs") math_ValueAndWeight;
		%feature("autodoc", "	:rtype: None
") math_ValueAndWeight;
		 math_ValueAndWeight ();
		%feature("compactdefaultargs") math_ValueAndWeight;
		%feature("autodoc", "	:param Value:
	:type Value: float
	:param Weight:
	:type Weight: float
	:rtype: None
") math_ValueAndWeight;
		 math_ValueAndWeight (const Standard_Real Value,const Standard_Real Weight);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: float
") Value;
		Standard_Real Value ();
		%feature("compactdefaultargs") Weight;
		%feature("autodoc", "	:rtype: float
") Weight;
		Standard_Real Weight ();
};


%extend math_ValueAndWeight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_Vector;
class math_Vector {
	public:
		%feature("compactdefaultargs") math_Vector;
		%feature("autodoc", "	* Contructs a non-initialized vector in the range [theLower..theUpper] 'theLower' and 'theUpper' are the indexes of the lower and upper bounds of the constructed vector.

	:param theLower:
	:type theLower: int
	:param theUpper:
	:type theUpper: int
	:rtype: None
") math_Vector;
		 math_Vector (const Standard_Integer theLower,const Standard_Integer theUpper);
		%feature("compactdefaultargs") math_Vector;
		%feature("autodoc", "	* Contructs a vector in the range [theLower..theUpper] whose values are all initialized with the value 'theInitialValue'

	:param theLower:
	:type theLower: int
	:param theUpper:
	:type theUpper: int
	:param theInitialValue:
	:type theInitialValue: float
	:rtype: None
") math_Vector;
		 math_Vector (const Standard_Integer theLower,const Standard_Integer theUpper,const Standard_Real theInitialValue);
		%feature("compactdefaultargs") math_Vector;
		%feature("autodoc", "	* Constructs a vector in the range [theLower..theUpper] with the 'c array' theTab.

	:param theTab:
	:type theTab: Standard_Address
	:param theLower:
	:type theLower: int
	:param theUpper:
	:type theUpper: int
	:rtype: None
") math_Vector;
		 math_Vector (const Standard_Address theTab,const Standard_Integer theLower,const Standard_Integer theUpper);
		%feature("compactdefaultargs") math_Vector;
		%feature("autodoc", "	* Constructor for converting gp_XY to math_Vector

	:param Other:
	:type Other: gp_XY
	:rtype: None
") math_Vector;
		 math_Vector (const gp_XY & Other);
		%feature("compactdefaultargs") math_Vector;
		%feature("autodoc", "	* Constructor for converting gp_XYZ to math_Vector

	:param Other:
	:type Other: gp_XYZ
	:rtype: None
") math_Vector;
		 math_Vector (const gp_XYZ & Other);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all the elements of a vector with 'theInitialValue'.

	:param theInitialValue:
	:type theInitialValue: float
	:rtype: None
") Init;
		void Init (const Standard_Real theInitialValue);
		%feature("compactdefaultargs") math_Vector;
		%feature("autodoc", "	* Constructs a copy for initialization. An exception is raised if the lengths of the vectors are different.

	:param theOther:
	:type theOther: math_Vector &
	:rtype: None
") math_Vector;
		 math_Vector (const math_Vector & theOther);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* Returns the length of a vector

	:rtype: inline int
") Length;
		inline Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	* Returns the value of the theLower index of a vector.

	:rtype: inline int
") Lower;
		inline Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	* Returns the value of the theUpper index of a vector.

	:rtype: inline int
") Upper;
		inline Standard_Integer Upper ();
		%feature("compactdefaultargs") Norm;
		%feature("autodoc", "	* Returns the value or the square of the norm of this vector.

	:rtype: float
") Norm;
		Standard_Real Norm ();
		%feature("compactdefaultargs") Norm2;
		%feature("autodoc", "	* Returns the value of the square of the norm of a vector.

	:rtype: float
") Norm2;
		Standard_Real Norm2 ();
		%feature("compactdefaultargs") Max;
		%feature("autodoc", "	* Returns the value of the 'Index' of the maximum element of a vector.

	:rtype: int
") Max;
		Standard_Integer Max ();
		%feature("compactdefaultargs") Min;
		%feature("autodoc", "	* Returns the value of the 'Index' of the minimum element of a vector.

	:rtype: int
") Min;
		Standard_Integer Min ();
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "	* Normalizes this vector (the norm of the result is equal to 1.0) and assigns the result to this vector Exceptions Standard_NullValue if this vector is null (i.e. if its norm is less than or equal to Standard_Real::RealEpsilon().

	:rtype: None
") Normalize;
		void Normalize ();
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "	* Normalizes this vector (the norm of the result is equal to 1.0) and creates a new vector Exceptions Standard_NullValue if this vector is null (i.e. if its norm is less than or equal to Standard_Real::RealEpsilon().

	:rtype: math_Vector
") Normalized;
		math_Vector Normalized ();
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "	* Inverts this vector and assigns the result to this vector.

	:rtype: None
") Invert;
		void Invert ();
		%feature("compactdefaultargs") Inverse;
		%feature("autodoc", "	* Inverts this vector and creates a new vector.

	:rtype: math_Vector
") Inverse;
		math_Vector Inverse ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* sets a vector from 'theI1' to 'theI2' to the vector 'theV'; An exception is raised if 'theI1' is less than 'LowerIndex' or 'theI2' is greater than 'UpperIndex' or 'theI1' is greater than 'theI2'. An exception is raised if 'theI2-theI1+1' is different from the 'Length' of 'theV'.

	:param theI1:
	:type theI1: int
	:param theI2:
	:type theI2: int
	:param theV:
	:type theV: math_Vector &
	:rtype: None
") Set;
		void Set (const Standard_Integer theI1,const Standard_Integer theI2,const math_Vector & theV);
		%feature("compactdefaultargs") Slice;
		%feature("autodoc", "	* //!Creates a new vector by inverting the values of this vector between indexes 'theI1' and 'theI2'. If the values of this vector were (1., 2., 3., 4.,5., 6.), by slicing it between indexes 2 and 5 the values of the resulting vector are (1., 5., 4., 3., 2., 6.)

	:param theI1:
	:type theI1: int
	:param theI2:
	:type theI2: int
	:rtype: math_Vector
") Slice;
		math_Vector Slice (const Standard_Integer theI1,const Standard_Integer theI2);
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "	* returns the product of a vector and a real value.

	:param theRight:
	:type theRight: float
	:rtype: None
") Multiply;
		void Multiply (const Standard_Real theRight);
		%feature("compactdefaultargs") operator *=;
		%feature("autodoc", "	:param theRight:
	:type theRight: float
	:rtype: None
") operator *=;
		void operator *= (const Standard_Real theRight);
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "	* returns the product of a vector and a real value.

	:param theRight:
	:type theRight: float
	:rtype: math_Vector
") Multiplied;
		math_Vector Multiplied (const Standard_Real theRight);
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param theRight:
	:type theRight: float
	:rtype: math_Vector
") operator *;
		math_Vector operator * (const Standard_Real theRight);
		%feature("compactdefaultargs") TMultiplied;
		%feature("autodoc", "	* returns the product of a vector and a real value.

	:param theRight:
	:type theRight: float
	:rtype: math_Vector
") TMultiplied;
		math_Vector TMultiplied (const Standard_Real theRight);
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "	* divides a vector by the value 'theRight'. An exception is raised if 'theRight' = 0.

	:param theRight:
	:type theRight: float
	:rtype: None
") Divide;
		void Divide (const Standard_Real theRight);
		%feature("compactdefaultargs") operator /=;
		%feature("autodoc", "	:param theRight:
	:type theRight: float
	:rtype: None
") operator /=;
		void operator /= (const Standard_Real theRight);
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "	* divides a vector by the value 'theRight'. An exception is raised if 'theRight' = 0.

	:param theRight:
	:type theRight: float
	:rtype: math_Vector
") Divided;
		math_Vector Divided (const Standard_Real theRight);
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "	:param theRight:
	:type theRight: float
	:rtype: math_Vector
") operator /;
		math_Vector operator / (const Standard_Real theRight);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* adds the vector 'theRight' to a vector. An exception is raised if the vectors have not the same length. Warning In order to avoid time-consuming copying of vectors, it is preferable to use operator += or the function Add whenever possible.

	:param theRight:
	:type theRight: math_Vector &
	:rtype: None
") Add;
		void Add (const math_Vector & theRight);
		%feature("compactdefaultargs") operator +=;
		%feature("autodoc", "	:param theRight:
	:type theRight: math_Vector &
	:rtype: None
") operator +=;
		void operator += (const math_Vector & theRight);
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "	* adds the vector theRight to a vector. An exception is raised if the vectors have not the same length. An exception is raised if the lengths are not equal.

	:param theRight:
	:type theRight: math_Vector &
	:rtype: math_Vector
") Added;
		math_Vector Added (const math_Vector & theRight);
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "	:param theRight:
	:type theRight: math_Vector &
	:rtype: math_Vector
") operator +;
		math_Vector operator + (const math_Vector & theRight);
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "	* sets a vector to the product of the vector 'theLeft' with the matrix 'theRight'.

	:param theLeft:
	:type theLeft: math_Vector &
	:param theRight:
	:type theRight: math_Matrix &
	:rtype: None
") Multiply;
		void Multiply (const math_Vector & theLeft,const math_Matrix & theRight);
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "	* //!sets a vector to the product of the matrix 'theLeft' with the vector 'theRight'.

	:param theLeft:
	:type theLeft: math_Matrix &
	:param theRight:
	:type theRight: math_Vector &
	:rtype: None
") Multiply;
		void Multiply (const math_Matrix & theLeft,const math_Vector & theRight);
		%feature("compactdefaultargs") TMultiply;
		%feature("autodoc", "	* sets a vector to the product of the transpose of the matrix 'theTLeft' by the vector 'theRight'.

	:param theTLeft:
	:type theTLeft: math_Matrix &
	:param theRight:
	:type theRight: math_Vector &
	:rtype: None
") TMultiply;
		void TMultiply (const math_Matrix & theTLeft,const math_Vector & theRight);
		%feature("compactdefaultargs") TMultiply;
		%feature("autodoc", "	* sets a vector to the product of the vector 'theLeft' by the transpose of the matrix 'theTRight'.

	:param theLeft:
	:type theLeft: math_Vector &
	:param theTRight:
	:type theTRight: math_Matrix &
	:rtype: None
") TMultiply;
		void TMultiply (const math_Vector & theLeft,const math_Matrix & theTRight);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* sets a vector to the sum of the vector 'theLeft' and the vector 'theRight'. An exception is raised if the lengths are different.

	:param theLeft:
	:type theLeft: math_Vector &
	:param theRight:
	:type theRight: math_Vector &
	:rtype: None
") Add;
		void Add (const math_Vector & theLeft,const math_Vector & theRight);
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "	* sets a vector to the Subtraction of the vector theRight from the vector theLeft. An exception is raised if the vectors have not the same length. Warning In order to avoid time-consuming copying of vectors, it is preferable to use operator -= or the function Subtract whenever possible.

	:param theLeft:
	:type theLeft: math_Vector &
	:param theRight:
	:type theRight: math_Vector &
	:rtype: None
") Subtract;
		void Subtract (const math_Vector & theLeft,const math_Vector & theRight);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* accesses (in read or write mode) the value of index 'theNum' of a vector.

	:param theNum:
	:type theNum: int
	:rtype: inline float
") Value;
		inline Standard_Real & Value (const Standard_Integer theNum);
		%feature("compactdefaultargs") Initialized;
		%feature("autodoc", "	* Initialises a vector by copying 'theOther'. An exception is raised if the Lengths are differents.

	:param theOther:
	:type theOther: math_Vector &
	:rtype: math_Vector
") Initialized;
		math_Vector & Initialized (const math_Vector & theOther);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param theOther:
	:type theOther: math_Vector &
	:rtype: math_Vector
") operator =;
		math_Vector & operator = (const math_Vector & theOther);
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "	* returns the inner product of 2 vectors. An exception is raised if the lengths are not equal.

	:param theRight:
	:type theRight: math_Vector &
	:rtype: float
") Multiplied;
		Standard_Real Multiplied (const math_Vector & theRight);
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param theRight:
	:type theRight: math_Vector &
	:rtype: float
") operator *;
		Standard_Real operator * (const math_Vector & theRight);
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "	* returns the product of a vector by a matrix.

	:param theRight:
	:type theRight: math_Matrix &
	:rtype: math_Vector
") Multiplied;
		math_Vector Multiplied (const math_Matrix & theRight);
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param theRight:
	:type theRight: math_Matrix &
	:rtype: math_Vector
") operator *;
		math_Vector operator * (const math_Matrix & theRight);
		%feature("compactdefaultargs") Opposite;
		%feature("autodoc", "	* returns the opposite of a vector.

	:rtype: math_Vector
") Opposite;
		math_Vector Opposite ();
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "	:rtype: math_Vector
") operator -;
		math_Vector operator - ();
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "	* returns the subtraction of 'theRight' from 'me'. An exception is raised if the vectors have not the same length.

	:param theRight:
	:type theRight: math_Vector &
	:rtype: None
") Subtract;
		void Subtract (const math_Vector & theRight);
		%feature("compactdefaultargs") operator -=;
		%feature("autodoc", "	:param theRight:
	:type theRight: math_Vector &
	:rtype: None
") operator -=;
		void operator -= (const math_Vector & theRight);
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "	* returns the subtraction of 'theRight' from 'me'. An exception is raised if the vectors have not the same length.

	:param theRight:
	:type theRight: math_Vector &
	:rtype: math_Vector
") Subtracted;
		math_Vector Subtracted (const math_Vector & theRight);
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "	:param theRight:
	:type theRight: math_Vector &
	:rtype: math_Vector
") operator -;
		math_Vector operator - (const math_Vector & theRight);
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "	* returns the multiplication of a real by a vector. 'me' = 'theLeft' * 'theRight'

	:param theLeft:
	:type theLeft: float
	:param theRight:
	:type theRight: math_Vector &
	:rtype: None
") Multiply;
		void Multiply (const Standard_Real theLeft,const math_Vector & theRight);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend math_Vector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_FunctionSetWithDerivatives;
class math_FunctionSetWithDerivatives : public math_FunctionSet {
	public:
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	* Returns the number of variables of the function.

	:rtype: int
") NbVariables;
		virtual Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* Returns the number of equations of the function.

	:rtype: int
") NbEquations;
		virtual Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* Returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		virtual Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Values;
		virtual Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
};


%extend math_FunctionSetWithDerivatives {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_FunctionWithDerivative;
class math_FunctionWithDerivative : public math_Function {
	public:
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the value <F>of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.

	:param X:
	:type X: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Computes the derivative <D> of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.

	:param X:
	:type X: float
	:param D:
	:type D: float &
	:rtype: bool
") Derivative;
		virtual Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Computes the value <F> and the derivative <D> of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.

	:param X:
	:type X: float
	:param F:
	:type F: float &
	:param D:
	:type D: float &
	:rtype: bool
") Values;
		virtual Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend math_FunctionWithDerivative {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_MultipleVarFunctionWithGradient;
class math_MultipleVarFunctionWithGradient : public math_MultipleVarFunction {
	public:
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	* Returns the number of variables of the function.

	:rtype: int
") NbVariables;
		virtual Standard_Integer NbVariables ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the values of the Functions <F> for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "	* Computes the gradient <G> of the functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Gradient;
		virtual Standard_Boolean Gradient (const math_Vector & X,math_Vector & G);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* computes the value <F> and the gradient <G> of the functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Values;
		virtual Standard_Boolean Values (const math_Vector & X,Standard_Real &OutValue,math_Vector & G);
};


%extend math_MultipleVarFunctionWithGradient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor math_MultipleVarFunctionWithHessian;
class math_MultipleVarFunctionWithHessian : public math_MultipleVarFunctionWithGradient {
	public:
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	* returns the number of variables of the function.

	:rtype: int
") NbVariables;
		virtual Standard_Integer NbVariables ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the values of the Functions <F> for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "	* computes the gradient <G> of the functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Gradient;
		virtual Standard_Boolean Gradient (const math_Vector & X,math_Vector & G);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* computes the value <F> and the gradient <G> of the functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Values;
		virtual Standard_Boolean Values (const math_Vector & X,Standard_Real &OutValue,math_Vector & G);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* computes the value <F>, the gradient <G> and the hessian <H> of the functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:param G:
	:type G: math_Vector &
	:param H:
	:type H: math_Matrix &
	:rtype: bool
") Values;
		virtual Standard_Boolean Values (const math_Vector & X,Standard_Real &OutValue,math_Vector & G,math_Matrix & H);
};


%extend math_MultipleVarFunctionWithHessian {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
