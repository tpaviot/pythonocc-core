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
%module (package="OCC") BRepApprox

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


%include BRepApprox_headers.i


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

%nodefaultctor BRepApprox_Approx;
class BRepApprox_Approx {
	public:
		%feature("compactdefaultargs") BRepApprox_Approx;
		%feature("autodoc", "	:rtype: None
") BRepApprox_Approx;
		 BRepApprox_Approx ();
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:param DegMin:
	:type DegMin: int
	:param DegMax:
	:type DegMax: int
	:param NbIterMax:
	:type NbIterMax: int
	:param ApproxWithTangency: default value is Standard_True
	:type ApproxWithTangency: bool
	:param Parametrization: default value is Approx_ChordLength
	:type Parametrization: Approx_ParametrizationType
	:rtype: None
") SetParameters;
		void SetParameters (const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer DegMin,const Standard_Integer DegMax,const Standard_Integer NbIterMax,const Standard_Boolean ApproxWithTangency = Standard_True,const Approx_ParametrizationType Parametrization = Approx_ChordLength);
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:param RelativeTol:
	:type RelativeTol: bool
	:param DegMin:
	:type DegMin: int
	:param DegMax:
	:type DegMax: int
	:param NbIterMax:
	:type NbIterMax: int
	:param NbPntMax:
	:type NbPntMax: int
	:param ApproxWithTangency: default value is Standard_True
	:type ApproxWithTangency: bool
	:param Parametrization: default value is Approx_ChordLength
	:type Parametrization: Approx_ParametrizationType
	:rtype: None
") SetParameters;
		void SetParameters (const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Boolean RelativeTol,const Standard_Integer DegMin,const Standard_Integer DegMax,const Standard_Integer NbIterMax,const Standard_Integer NbPntMax,const Standard_Boolean ApproxWithTangency = Standard_True,const Approx_ParametrizationType Parametrization = Approx_ChordLength);
		%feature("compactdefaultargs") TolReached3d;
		%feature("autodoc", "	:rtype: float
") TolReached3d;
		Standard_Real TolReached3d ();
		%feature("compactdefaultargs") TolReached2d;
		%feature("autodoc", "	:rtype: float
") TolReached2d;
		Standard_Real TolReached2d ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbMultiCurves;
		%feature("autodoc", "	:rtype: int
") NbMultiCurves;
		Standard_Integer NbMultiCurves ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: AppParCurves_MultiBSpCurve
") Value;
		const AppParCurves_MultiBSpCurve & Value (const Standard_Integer Index);
};


%extend BRepApprox_Approx {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepApprox_ApproxLine;
class BRepApprox_ApproxLine : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") BRepApprox_ApproxLine;
		%feature("autodoc", "	:param CurveXYZ:
	:type CurveXYZ: Handle_Geom_BSplineCurve &
	:param CurveUV1:
	:type CurveUV1: Handle_Geom2d_BSplineCurve &
	:param CurveUV2:
	:type CurveUV2: Handle_Geom2d_BSplineCurve &
	:rtype: None
") BRepApprox_ApproxLine;
		 BRepApprox_ApproxLine (const Handle_Geom_BSplineCurve & CurveXYZ,const Handle_Geom2d_BSplineCurve & CurveUV1,const Handle_Geom2d_BSplineCurve & CurveUV2);
		%feature("compactdefaultargs") BRepApprox_ApproxLine;
		%feature("autodoc", "	:param lin:
	:type lin: Handle_IntSurf_LineOn2S &
	:param Tang:
	:type Tang: bool
	:rtype: None
") BRepApprox_ApproxLine;
		 BRepApprox_ApproxLine (const Handle_IntSurf_LineOn2S & lin,const Standard_Boolean Tang);
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "	:rtype: int
") NbPnts;
		Standard_Integer NbPnts ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: IntSurf_PntOn2S
") Point;
		IntSurf_PntOn2S Point (const Standard_Integer Index);
};


%extend BRepApprox_ApproxLine {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepApprox_ApproxLine(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepApprox_ApproxLine::Handle_BRepApprox_ApproxLine %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepApprox_ApproxLine;
class Handle_BRepApprox_ApproxLine : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_BRepApprox_ApproxLine();
        Handle_BRepApprox_ApproxLine(const Handle_BRepApprox_ApproxLine &aHandle);
        Handle_BRepApprox_ApproxLine(const BRepApprox_ApproxLine *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepApprox_ApproxLine DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepApprox_ApproxLine {
    BRepApprox_ApproxLine* _get_reference() {
    return (BRepApprox_ApproxLine*)$self->Access();
    }
};

%extend Handle_BRepApprox_ApproxLine {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepApprox_ApproxLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox;
class BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox : public math_BFGS {
	public:
		%feature("compactdefaultargs") BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox;
		%feature("autodoc", "	:param F:
	:type F: math_MultipleVarFunctionWithGradient &
	:param StartingPoint:
	:type StartingPoint: math_Vector &
	:param Tolerance3d:
	:type Tolerance3d: float
	:param Tolerance2d:
	:type Tolerance2d: float
	:param Eps:
	:type Eps: float
	:param NbIterations: default value is 200
	:type NbIterations: int
	:rtype: None
") BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox (math_MultipleVarFunctionWithGradient & F,const math_Vector & StartingPoint,const Standard_Real Tolerance3d,const Standard_Real Tolerance2d,const Standard_Real Eps,const Standard_Integer NbIterations = 200);
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "	:param F:
	:type F: math_MultipleVarFunctionWithGradient &
	:rtype: bool
") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached (math_MultipleVarFunctionWithGradient & F);
};


%extend BRepApprox_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox;
class BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox : public math_MultipleVarFunctionWithGradient {
	public:
		%feature("compactdefaultargs") BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param TheConstraints:
	:type TheConstraints: Handle_AppParCurves_HArray1OfConstraintCouple &
	:param Parameters:
	:type Parameters: math_Vector &
	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:param Mults:
	:type Mults: TColStd_Array1OfInteger &
	:param NbPol:
	:type NbPol: int
	:rtype: None
") BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,const math_Vector & Parameters,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer NbPol);
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Gradient;
		Standard_Boolean Gradient (const math_Vector & X,math_Vector & G);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,Standard_Real &OutValue,math_Vector & G);
		%feature("compactdefaultargs") NewParameters;
		%feature("autodoc", "	:rtype: math_Vector
") NewParameters;
		const math_Vector & NewParameters ();
		%feature("compactdefaultargs") CurveValue;
		%feature("autodoc", "	:rtype: AppParCurves_MultiBSpCurve
") CurveValue;
		AppParCurves_MultiBSpCurve CurveValue ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:param IPoint:
	:type IPoint: int
	:param CurveIndex:
	:type CurveIndex: int
	:rtype: float
") Error;
		Standard_Real Error (const Standard_Integer IPoint,const Standard_Integer CurveIndex);
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "	:rtype: float
") MaxError3d;
		Standard_Real MaxError3d ();
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "	:rtype: float
") MaxError2d;
		Standard_Real MaxError2d ();
		%feature("compactdefaultargs") FunctionMatrix;
		%feature("autodoc", "	:rtype: math_Matrix
") FunctionMatrix;
		const math_Matrix & FunctionMatrix ();
		%feature("compactdefaultargs") DerivativeFunctionMatrix;
		%feature("autodoc", "	:rtype: math_Matrix
") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix ();
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	:rtype: math_IntegerVector
") Index;
		const math_IntegerVector & Index ();
		%feature("compactdefaultargs") FirstConstraint;
		%feature("autodoc", "	:param TheConstraints:
	:type TheConstraints: Handle_AppParCurves_HArray1OfConstraintCouple &
	:param FirstPoint:
	:type FirstPoint: int
	:rtype: AppParCurves_Constraint
") FirstConstraint;
		AppParCurves_Constraint FirstConstraint (const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,const Standard_Integer FirstPoint);
		%feature("compactdefaultargs") LastConstraint;
		%feature("autodoc", "	:param TheConstraints:
	:type TheConstraints: Handle_AppParCurves_HArray1OfConstraintCouple &
	:param LastPoint:
	:type LastPoint: int
	:rtype: AppParCurves_Constraint
") LastConstraint;
		AppParCurves_Constraint LastConstraint (const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,const Standard_Integer LastPoint);
		%feature("compactdefaultargs") SetFirstLambda;
		%feature("autodoc", "	:param l1:
	:type l1: float
	:rtype: None
") SetFirstLambda;
		void SetFirstLambda (const Standard_Real l1);
		%feature("compactdefaultargs") SetLastLambda;
		%feature("autodoc", "	:param l2:
	:type l2: float
	:rtype: None
") SetLastLambda;
		void SetLastLambda (const Standard_Real l2);
};


%extend BRepApprox_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
class BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox {
	public:
		%feature("compactdefaultargs") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param Parameters:
	:type Parameters: math_Vector &
	:param NbPol:
	:type NbPol: int
	:rtype: None
") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);
		%feature("compactdefaultargs") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param NbPol:
	:type NbPol: int
	:rtype: None
") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);
		%feature("compactdefaultargs") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox &
	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:param Mults:
	:type Mults: TColStd_Array1OfInteger &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param Parameters:
	:type Parameters: math_Vector &
	:param NbPol:
	:type NbPol: int
	:rtype: None
") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);
		%feature("compactdefaultargs") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox &
	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:param Mults:
	:type Mults: TColStd_Array1OfInteger &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param NbPol:
	:type NbPol: int
	:rtype: None
") BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Parameters:
	:type Parameters: math_Vector &
	:rtype: None
") Perform;
		void Perform (const math_Vector & Parameters);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Parameters:
	:type Parameters: math_Vector &
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None
") Perform;
		void Perform (const math_Vector & Parameters,const Standard_Real l1,const Standard_Real l2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Parameters:
	:type Parameters: math_Vector &
	:param V1t:
	:type V1t: math_Vector &
	:param V2t:
	:type V2t: math_Vector &
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None
") Perform;
		void Perform (const math_Vector & Parameters,const math_Vector & V1t,const math_Vector & V2t,const Standard_Real l1,const Standard_Real l2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Parameters:
	:type Parameters: math_Vector &
	:param V1t:
	:type V1t: math_Vector &
	:param V2t:
	:type V2t: math_Vector &
	:param V1c:
	:type V1c: math_Vector &
	:param V2c:
	:type V2c: math_Vector &
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None
") Perform;
		void Perform (const math_Vector & Parameters,const math_Vector & V1t,const math_Vector & V2t,const math_Vector & V1c,const math_Vector & V2c,const Standard_Real l1,const Standard_Real l2);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") BezierValue;
		%feature("autodoc", "	:rtype: AppParCurves_MultiCurve
") BezierValue;
		AppParCurves_MultiCurve BezierValue ();
		%feature("compactdefaultargs") BSplineValue;
		%feature("autodoc", "	:rtype: AppParCurves_MultiBSpCurve
") BSplineValue;
		const AppParCurves_MultiBSpCurve & BSplineValue ();
		%feature("compactdefaultargs") FunctionMatrix;
		%feature("autodoc", "	:rtype: math_Matrix
") FunctionMatrix;
		const math_Matrix & FunctionMatrix ();
		%feature("compactdefaultargs") DerivativeFunctionMatrix;
		%feature("autodoc", "	:rtype: math_Matrix
") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix ();
		%feature("compactdefaultargs") ErrorGradient;
		%feature("autodoc", "	:param Grad:
	:type Grad: math_Vector &
	:param F:
	:type F: float &
	:param MaxE3d:
	:type MaxE3d: float &
	:param MaxE2d:
	:type MaxE2d: float &
	:rtype: None
") ErrorGradient;
		void ErrorGradient (math_Vector & Grad,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	:rtype: math_Matrix
") Distance;
		const math_Matrix & Distance ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:param F:
	:type F: float &
	:param MaxE3d:
	:type MaxE3d: float &
	:param MaxE2d:
	:type MaxE2d: float &
	:rtype: None
") Error;
		void Error (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") FirstLambda;
		%feature("autodoc", "	:rtype: float
") FirstLambda;
		Standard_Real FirstLambda ();
		%feature("compactdefaultargs") LastLambda;
		%feature("autodoc", "	:rtype: float
") LastLambda;
		Standard_Real LastLambda ();
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	:rtype: math_Matrix
") Points;
		const math_Matrix & Points ();
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "	:rtype: math_Matrix
") Poles;
		const math_Matrix & Poles ();
		%feature("compactdefaultargs") KIndex;
		%feature("autodoc", "	:rtype: math_IntegerVector
") KIndex;
		const math_IntegerVector & KIndex ();
};


%extend BRepApprox_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox;
class BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox : public math_BFGS {
	public:
		%feature("compactdefaultargs") BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox;
		%feature("autodoc", "	:param F:
	:type F: math_MultipleVarFunctionWithGradient &
	:param StartingPoint:
	:type StartingPoint: math_Vector &
	:param Tolerance3d:
	:type Tolerance3d: float
	:param Tolerance2d:
	:type Tolerance2d: float
	:param Eps:
	:type Eps: float
	:param NbIterations: default value is 200
	:type NbIterations: int
	:rtype: None
") BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox (math_MultipleVarFunctionWithGradient & F,const math_Vector & StartingPoint,const Standard_Real Tolerance3d,const Standard_Real Tolerance2d,const Standard_Real Eps,const Standard_Integer NbIterations = 200);
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "	:param F:
	:type F: math_MultipleVarFunctionWithGradient &
	:rtype: bool
") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached (math_MultipleVarFunctionWithGradient & F);
};


%extend BRepApprox_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox;
class BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox : public math_BFGS {
	public:
		%feature("compactdefaultargs") BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox;
		%feature("autodoc", "	:param F:
	:type F: math_MultipleVarFunctionWithGradient &
	:param StartingPoint:
	:type StartingPoint: math_Vector &
	:param Tolerance3d:
	:type Tolerance3d: float
	:param Tolerance2d:
	:type Tolerance2d: float
	:param Eps:
	:type Eps: float
	:param NbIterations: default value is 200
	:type NbIterations: int
	:rtype: None
") BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox (math_MultipleVarFunctionWithGradient & F,const math_Vector & StartingPoint,const Standard_Real Tolerance3d,const Standard_Real Tolerance2d,const Standard_Real Eps,const Standard_Integer NbIterations = 200);
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "	:param F:
	:type F: math_MultipleVarFunctionWithGradient &
	:rtype: bool
") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached (math_MultipleVarFunctionWithGradient & F);
};


%extend BRepApprox_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepApprox_MyBSplGradientOfTheComputeLineOfApprox;
class BRepApprox_MyBSplGradientOfTheComputeLineOfApprox {
	public:
		%feature("compactdefaultargs") BRepApprox_MyBSplGradientOfTheComputeLineOfApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param TheConstraints:
	:type TheConstraints: Handle_AppParCurves_HArray1OfConstraintCouple &
	:param Parameters:
	:type Parameters: math_Vector &
	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:param Mults:
	:type Mults: TColStd_Array1OfInteger &
	:param Deg:
	:type Deg: int
	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:param NbIterations: default value is 1
	:type NbIterations: int
	:rtype: None
") BRepApprox_MyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_MyBSplGradientOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,math_Vector & Parameters,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer Deg,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIterations = 1);
		%feature("compactdefaultargs") BRepApprox_MyBSplGradientOfTheComputeLineOfApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param TheConstraints:
	:type TheConstraints: Handle_AppParCurves_HArray1OfConstraintCouple &
	:param Parameters:
	:type Parameters: math_Vector &
	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:param Mults:
	:type Mults: TColStd_Array1OfInteger &
	:param Deg:
	:type Deg: int
	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:param NbIterations:
	:type NbIterations: int
	:param lambda1:
	:type lambda1: float
	:param lambda2:
	:type lambda2: float
	:rtype: None
") BRepApprox_MyBSplGradientOfTheComputeLineOfApprox;
		 BRepApprox_MyBSplGradientOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,math_Vector & Parameters,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer Deg,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIterations,const Standard_Real lambda1,const Standard_Real lambda2);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: AppParCurves_MultiBSpCurve
") Value;
		AppParCurves_MultiBSpCurve Value ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: float
") Error;
		Standard_Real Error (const Standard_Integer Index);
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "	:rtype: float
") MaxError3d;
		Standard_Real MaxError3d ();
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "	:rtype: float
") MaxError2d;
		Standard_Real MaxError2d ();
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "	:rtype: float
") AverageError;
		Standard_Real AverageError ();
};


%extend BRepApprox_MyBSplGradientOfTheComputeLineOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepApprox_MyGradientOfTheComputeLineBezierOfApprox;
class BRepApprox_MyGradientOfTheComputeLineBezierOfApprox {
	public:
		%feature("compactdefaultargs") BRepApprox_MyGradientOfTheComputeLineBezierOfApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param TheConstraints:
	:type TheConstraints: Handle_AppParCurves_HArray1OfConstraintCouple &
	:param Parameters:
	:type Parameters: math_Vector &
	:param Deg:
	:type Deg: int
	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:param NbIterations: default value is 200
	:type NbIterations: int
	:rtype: None
") BRepApprox_MyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_MyGradientOfTheComputeLineBezierOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,math_Vector & Parameters,const Standard_Integer Deg,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIterations = 200);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: AppParCurves_MultiCurve
") Value;
		AppParCurves_MultiCurve Value ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: float
") Error;
		Standard_Real Error (const Standard_Integer Index);
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "	:rtype: float
") MaxError3d;
		Standard_Real MaxError3d ();
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "	:rtype: float
") MaxError2d;
		Standard_Real MaxError2d ();
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "	:rtype: float
") AverageError;
		Standard_Real AverageError ();
};


%extend BRepApprox_MyGradientOfTheComputeLineBezierOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepApprox_MyGradientbisOfTheComputeLineOfApprox;
class BRepApprox_MyGradientbisOfTheComputeLineOfApprox {
	public:
		%feature("compactdefaultargs") BRepApprox_MyGradientbisOfTheComputeLineOfApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param TheConstraints:
	:type TheConstraints: Handle_AppParCurves_HArray1OfConstraintCouple &
	:param Parameters:
	:type Parameters: math_Vector &
	:param Deg:
	:type Deg: int
	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:param NbIterations: default value is 200
	:type NbIterations: int
	:rtype: None
") BRepApprox_MyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_MyGradientbisOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,math_Vector & Parameters,const Standard_Integer Deg,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIterations = 200);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: AppParCurves_MultiCurve
") Value;
		AppParCurves_MultiCurve Value ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: float
") Error;
		Standard_Real Error (const Standard_Integer Index);
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "	:rtype: float
") MaxError3d;
		Standard_Real MaxError3d ();
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "	:rtype: float
") MaxError2d;
		Standard_Real MaxError2d ();
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "	:rtype: float
") AverageError;
		Standard_Real AverageError ();
};


%extend BRepApprox_MyGradientbisOfTheComputeLineOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox;
class BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox : public math_MultipleVarFunctionWithGradient {
	public:
		%feature("compactdefaultargs") BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param TheConstraints:
	:type TheConstraints: Handle_AppParCurves_HArray1OfConstraintCouple &
	:param Parameters:
	:type Parameters: math_Vector &
	:param Deg:
	:type Deg: int
	:rtype: None
") BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,const math_Vector & Parameters,const Standard_Integer Deg);
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Gradient;
		Standard_Boolean Gradient (const math_Vector & X,math_Vector & G);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,Standard_Real &OutValue,math_Vector & G);
		%feature("compactdefaultargs") NewParameters;
		%feature("autodoc", "	:rtype: math_Vector
") NewParameters;
		const math_Vector & NewParameters ();
		%feature("compactdefaultargs") CurveValue;
		%feature("autodoc", "	:rtype: AppParCurves_MultiCurve
") CurveValue;
		const AppParCurves_MultiCurve & CurveValue ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:param IPoint:
	:type IPoint: int
	:param CurveIndex:
	:type CurveIndex: int
	:rtype: float
") Error;
		Standard_Real Error (const Standard_Integer IPoint,const Standard_Integer CurveIndex);
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "	:rtype: float
") MaxError3d;
		Standard_Real MaxError3d ();
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "	:rtype: float
") MaxError2d;
		Standard_Real MaxError2d ();
		%feature("compactdefaultargs") FirstConstraint;
		%feature("autodoc", "	:param TheConstraints:
	:type TheConstraints: Handle_AppParCurves_HArray1OfConstraintCouple &
	:param FirstPoint:
	:type FirstPoint: int
	:rtype: AppParCurves_Constraint
") FirstConstraint;
		AppParCurves_Constraint FirstConstraint (const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,const Standard_Integer FirstPoint);
		%feature("compactdefaultargs") LastConstraint;
		%feature("autodoc", "	:param TheConstraints:
	:type TheConstraints: Handle_AppParCurves_HArray1OfConstraintCouple &
	:param LastPoint:
	:type LastPoint: int
	:rtype: AppParCurves_Constraint
") LastConstraint;
		AppParCurves_Constraint LastConstraint (const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,const Standard_Integer LastPoint);
};


%extend BRepApprox_ParFunctionOfMyGradientOfTheComputeLineBezierOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox;
class BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox : public math_MultipleVarFunctionWithGradient {
	public:
		%feature("compactdefaultargs") BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param TheConstraints:
	:type TheConstraints: Handle_AppParCurves_HArray1OfConstraintCouple &
	:param Parameters:
	:type Parameters: math_Vector &
	:param Deg:
	:type Deg: int
	:rtype: None
") BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,const math_Vector & Parameters,const Standard_Integer Deg);
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Gradient;
		Standard_Boolean Gradient (const math_Vector & X,math_Vector & G);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,Standard_Real &OutValue,math_Vector & G);
		%feature("compactdefaultargs") NewParameters;
		%feature("autodoc", "	:rtype: math_Vector
") NewParameters;
		const math_Vector & NewParameters ();
		%feature("compactdefaultargs") CurveValue;
		%feature("autodoc", "	:rtype: AppParCurves_MultiCurve
") CurveValue;
		const AppParCurves_MultiCurve & CurveValue ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:param IPoint:
	:type IPoint: int
	:param CurveIndex:
	:type CurveIndex: int
	:rtype: float
") Error;
		Standard_Real Error (const Standard_Integer IPoint,const Standard_Integer CurveIndex);
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "	:rtype: float
") MaxError3d;
		Standard_Real MaxError3d ();
		%feature("compactdefaultargs") MaxError2d;
		%feature("autodoc", "	:rtype: float
") MaxError2d;
		Standard_Real MaxError2d ();
		%feature("compactdefaultargs") FirstConstraint;
		%feature("autodoc", "	:param TheConstraints:
	:type TheConstraints: Handle_AppParCurves_HArray1OfConstraintCouple &
	:param FirstPoint:
	:type FirstPoint: int
	:rtype: AppParCurves_Constraint
") FirstConstraint;
		AppParCurves_Constraint FirstConstraint (const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,const Standard_Integer FirstPoint);
		%feature("compactdefaultargs") LastConstraint;
		%feature("autodoc", "	:param TheConstraints:
	:type TheConstraints: Handle_AppParCurves_HArray1OfConstraintCouple &
	:param LastPoint:
	:type LastPoint: int
	:rtype: AppParCurves_Constraint
") LastConstraint;
		AppParCurves_Constraint LastConstraint (const Handle_AppParCurves_HArray1OfConstraintCouple & TheConstraints,const Standard_Integer LastPoint);
};


%extend BRepApprox_ParFunctionOfMyGradientbisOfTheComputeLineOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
class BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox {
	public:
		%feature("compactdefaultargs") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param Parameters:
	:type Parameters: math_Vector &
	:param NbPol:
	:type NbPol: int
	:rtype: None
") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);
		%feature("compactdefaultargs") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param NbPol:
	:type NbPol: int
	:rtype: None
") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);
		%feature("compactdefaultargs") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox &
	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:param Mults:
	:type Mults: TColStd_Array1OfInteger &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param Parameters:
	:type Parameters: math_Vector &
	:param NbPol:
	:type NbPol: int
	:rtype: None
") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);
		%feature("compactdefaultargs") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox &
	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:param Mults:
	:type Mults: TColStd_Array1OfInteger &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param NbPol:
	:type NbPol: int
	:rtype: None
") BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Parameters:
	:type Parameters: math_Vector &
	:rtype: None
") Perform;
		void Perform (const math_Vector & Parameters);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Parameters:
	:type Parameters: math_Vector &
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None
") Perform;
		void Perform (const math_Vector & Parameters,const Standard_Real l1,const Standard_Real l2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Parameters:
	:type Parameters: math_Vector &
	:param V1t:
	:type V1t: math_Vector &
	:param V2t:
	:type V2t: math_Vector &
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None
") Perform;
		void Perform (const math_Vector & Parameters,const math_Vector & V1t,const math_Vector & V2t,const Standard_Real l1,const Standard_Real l2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Parameters:
	:type Parameters: math_Vector &
	:param V1t:
	:type V1t: math_Vector &
	:param V2t:
	:type V2t: math_Vector &
	:param V1c:
	:type V1c: math_Vector &
	:param V2c:
	:type V2c: math_Vector &
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None
") Perform;
		void Perform (const math_Vector & Parameters,const math_Vector & V1t,const math_Vector & V2t,const math_Vector & V1c,const math_Vector & V2c,const Standard_Real l1,const Standard_Real l2);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") BezierValue;
		%feature("autodoc", "	:rtype: AppParCurves_MultiCurve
") BezierValue;
		AppParCurves_MultiCurve BezierValue ();
		%feature("compactdefaultargs") BSplineValue;
		%feature("autodoc", "	:rtype: AppParCurves_MultiBSpCurve
") BSplineValue;
		const AppParCurves_MultiBSpCurve & BSplineValue ();
		%feature("compactdefaultargs") FunctionMatrix;
		%feature("autodoc", "	:rtype: math_Matrix
") FunctionMatrix;
		const math_Matrix & FunctionMatrix ();
		%feature("compactdefaultargs") DerivativeFunctionMatrix;
		%feature("autodoc", "	:rtype: math_Matrix
") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix ();
		%feature("compactdefaultargs") ErrorGradient;
		%feature("autodoc", "	:param Grad:
	:type Grad: math_Vector &
	:param F:
	:type F: float &
	:param MaxE3d:
	:type MaxE3d: float &
	:param MaxE2d:
	:type MaxE2d: float &
	:rtype: None
") ErrorGradient;
		void ErrorGradient (math_Vector & Grad,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	:rtype: math_Matrix
") Distance;
		const math_Matrix & Distance ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:param F:
	:type F: float &
	:param MaxE3d:
	:type MaxE3d: float &
	:param MaxE2d:
	:type MaxE2d: float &
	:rtype: None
") Error;
		void Error (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") FirstLambda;
		%feature("autodoc", "	:rtype: float
") FirstLambda;
		Standard_Real FirstLambda ();
		%feature("compactdefaultargs") LastLambda;
		%feature("autodoc", "	:rtype: float
") LastLambda;
		Standard_Real LastLambda ();
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	:rtype: math_Matrix
") Points;
		const math_Matrix & Points ();
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "	:rtype: math_Matrix
") Poles;
		const math_Matrix & Poles ();
		%feature("compactdefaultargs") KIndex;
		%feature("autodoc", "	:rtype: math_IntegerVector
") KIndex;
		const math_IntegerVector & KIndex ();
};


%extend BRepApprox_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
class BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox {
	public:
		%feature("compactdefaultargs") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param Parameters:
	:type Parameters: math_Vector &
	:param NbPol:
	:type NbPol: int
	:rtype: None
") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);
		%feature("compactdefaultargs") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param NbPol:
	:type NbPol: int
	:rtype: None
") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);
		%feature("compactdefaultargs") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox &
	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:param Mults:
	:type Mults: TColStd_Array1OfInteger &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param Parameters:
	:type Parameters: math_Vector &
	:param NbPol:
	:type NbPol: int
	:rtype: None
") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const math_Vector & Parameters,const Standard_Integer NbPol);
		%feature("compactdefaultargs") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox &
	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:param Mults:
	:type Mults: TColStd_Array1OfInteger &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param NbPol:
	:type NbPol: int
	:rtype: None
") BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer NbPol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Parameters:
	:type Parameters: math_Vector &
	:rtype: None
") Perform;
		void Perform (const math_Vector & Parameters);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Parameters:
	:type Parameters: math_Vector &
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None
") Perform;
		void Perform (const math_Vector & Parameters,const Standard_Real l1,const Standard_Real l2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Parameters:
	:type Parameters: math_Vector &
	:param V1t:
	:type V1t: math_Vector &
	:param V2t:
	:type V2t: math_Vector &
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None
") Perform;
		void Perform (const math_Vector & Parameters,const math_Vector & V1t,const math_Vector & V2t,const Standard_Real l1,const Standard_Real l2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Parameters:
	:type Parameters: math_Vector &
	:param V1t:
	:type V1t: math_Vector &
	:param V2t:
	:type V2t: math_Vector &
	:param V1c:
	:type V1c: math_Vector &
	:param V2c:
	:type V2c: math_Vector &
	:param l1:
	:type l1: float
	:param l2:
	:type l2: float
	:rtype: None
") Perform;
		void Perform (const math_Vector & Parameters,const math_Vector & V1t,const math_Vector & V2t,const math_Vector & V1c,const math_Vector & V2c,const Standard_Real l1,const Standard_Real l2);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") BezierValue;
		%feature("autodoc", "	:rtype: AppParCurves_MultiCurve
") BezierValue;
		AppParCurves_MultiCurve BezierValue ();
		%feature("compactdefaultargs") BSplineValue;
		%feature("autodoc", "	:rtype: AppParCurves_MultiBSpCurve
") BSplineValue;
		const AppParCurves_MultiBSpCurve & BSplineValue ();
		%feature("compactdefaultargs") FunctionMatrix;
		%feature("autodoc", "	:rtype: math_Matrix
") FunctionMatrix;
		const math_Matrix & FunctionMatrix ();
		%feature("compactdefaultargs") DerivativeFunctionMatrix;
		%feature("autodoc", "	:rtype: math_Matrix
") DerivativeFunctionMatrix;
		const math_Matrix & DerivativeFunctionMatrix ();
		%feature("compactdefaultargs") ErrorGradient;
		%feature("autodoc", "	:param Grad:
	:type Grad: math_Vector &
	:param F:
	:type F: float &
	:param MaxE3d:
	:type MaxE3d: float &
	:param MaxE2d:
	:type MaxE2d: float &
	:rtype: None
") ErrorGradient;
		void ErrorGradient (math_Vector & Grad,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	:rtype: math_Matrix
") Distance;
		const math_Matrix & Distance ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:param F:
	:type F: float &
	:param MaxE3d:
	:type MaxE3d: float &
	:param MaxE2d:
	:type MaxE2d: float &
	:rtype: None
") Error;
		void Error (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") FirstLambda;
		%feature("autodoc", "	:rtype: float
") FirstLambda;
		Standard_Real FirstLambda ();
		%feature("compactdefaultargs") LastLambda;
		%feature("autodoc", "	:rtype: float
") LastLambda;
		Standard_Real LastLambda ();
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	:rtype: math_Matrix
") Points;
		const math_Matrix & Points ();
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "	:rtype: math_Matrix
") Poles;
		const math_Matrix & Poles ();
		%feature("compactdefaultargs") KIndex;
		%feature("autodoc", "	:rtype: math_IntegerVector
") KIndex;
		const math_IntegerVector & KIndex ();
};


%extend BRepApprox_ParLeastSquareOfMyGradientbisOfTheComputeLineOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox;
class BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox {
	public:
		%feature("compactdefaultargs") BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox &
	:param SCurv:
	:type SCurv: AppParCurves_MultiCurve &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param Constraints:
	:type Constraints: Handle_AppParCurves_HArray1OfConstraintCouple &
	:param Bern:
	:type Bern: math_Matrix &
	:param DerivativeBern:
	:type DerivativeBern: math_Matrix &
	:param Tolerance: default value is 1.0e-10
	:type Tolerance: float
	:rtype: None
") BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox;
		 BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,AppParCurves_MultiCurve & SCurv,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const Handle_AppParCurves_HArray1OfConstraintCouple & Constraints,const math_Matrix & Bern,const math_Matrix & DerivativeBern,const Standard_Real Tolerance = 1.0e-10);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") ConstraintMatrix;
		%feature("autodoc", "	:rtype: math_Matrix
") ConstraintMatrix;
		const math_Matrix & ConstraintMatrix ();
		%feature("compactdefaultargs") Duale;
		%feature("autodoc", "	:rtype: math_Vector
") Duale;
		const math_Vector & Duale ();
		%feature("compactdefaultargs") ConstraintDerivative;
		%feature("autodoc", "	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox &
	:param Parameters:
	:type Parameters: math_Vector &
	:param Deg:
	:type Deg: int
	:param DA:
	:type DA: math_Matrix &
	:rtype: math_Matrix
") ConstraintDerivative;
		const math_Matrix & ConstraintDerivative (const BRepApprox_TheMultiLineOfApprox & SSP,const math_Vector & Parameters,const Standard_Integer Deg,const math_Matrix & DA);
		%feature("compactdefaultargs") InverseMatrix;
		%feature("autodoc", "	:rtype: math_Matrix
") InverseMatrix;
		const math_Matrix & InverseMatrix ();
};


%extend BRepApprox_ResConstraintOfMyGradientOfTheComputeLineBezierOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox;
class BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox {
	public:
		%feature("compactdefaultargs") BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox;
		%feature("autodoc", "	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox &
	:param SCurv:
	:type SCurv: AppParCurves_MultiCurve &
	:param FirstPoint:
	:type FirstPoint: int
	:param LastPoint:
	:type LastPoint: int
	:param Constraints:
	:type Constraints: Handle_AppParCurves_HArray1OfConstraintCouple &
	:param Bern:
	:type Bern: math_Matrix &
	:param DerivativeBern:
	:type DerivativeBern: math_Matrix &
	:param Tolerance: default value is 1.0e-10
	:type Tolerance: float
	:rtype: None
") BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox;
		 BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & SSP,AppParCurves_MultiCurve & SCurv,const Standard_Integer FirstPoint,const Standard_Integer LastPoint,const Handle_AppParCurves_HArray1OfConstraintCouple & Constraints,const math_Matrix & Bern,const math_Matrix & DerivativeBern,const Standard_Real Tolerance = 1.0e-10);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") ConstraintMatrix;
		%feature("autodoc", "	:rtype: math_Matrix
") ConstraintMatrix;
		const math_Matrix & ConstraintMatrix ();
		%feature("compactdefaultargs") Duale;
		%feature("autodoc", "	:rtype: math_Vector
") Duale;
		const math_Vector & Duale ();
		%feature("compactdefaultargs") ConstraintDerivative;
		%feature("autodoc", "	:param SSP:
	:type SSP: BRepApprox_TheMultiLineOfApprox &
	:param Parameters:
	:type Parameters: math_Vector &
	:param Deg:
	:type Deg: int
	:param DA:
	:type DA: math_Matrix &
	:rtype: math_Matrix
") ConstraintDerivative;
		const math_Matrix & ConstraintDerivative (const BRepApprox_TheMultiLineOfApprox & SSP,const math_Vector & Parameters,const Standard_Integer Deg,const math_Matrix & DA);
		%feature("compactdefaultargs") InverseMatrix;
		%feature("autodoc", "	:rtype: math_Matrix
") InverseMatrix;
		const math_Matrix & InverseMatrix ();
};


%extend BRepApprox_ResConstraintOfMyGradientbisOfTheComputeLineOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepApprox_TheComputeLineBezierOfApprox;
class BRepApprox_TheComputeLineBezierOfApprox {
	public:
		%feature("compactdefaultargs") BRepApprox_TheComputeLineBezierOfApprox;
		%feature("autodoc", "	:param Line:
	:type Line: BRepApprox_TheMultiLineOfApprox &
	:param degreemin: default value is 4
	:type degreemin: int
	:param degreemax: default value is 8
	:type degreemax: int
	:param Tolerance3d: default value is 1.0e-3
	:type Tolerance3d: float
	:param Tolerance2d: default value is 1.0e-6
	:type Tolerance2d: float
	:param NbIterations: default value is 5
	:type NbIterations: int
	:param cutting: default value is Standard_True
	:type cutting: bool
	:param parametrization: default value is Approx_ChordLength
	:type parametrization: Approx_ParametrizationType
	:param Squares: default value is Standard_False
	:type Squares: bool
	:rtype: None
") BRepApprox_TheComputeLineBezierOfApprox;
		 BRepApprox_TheComputeLineBezierOfApprox (const BRepApprox_TheMultiLineOfApprox & Line,const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-3,const Standard_Real Tolerance2d = 1.0e-6,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Approx_ParametrizationType parametrization = Approx_ChordLength,const Standard_Boolean Squares = Standard_False);
		%feature("compactdefaultargs") BRepApprox_TheComputeLineBezierOfApprox;
		%feature("autodoc", "	:param Line:
	:type Line: BRepApprox_TheMultiLineOfApprox &
	:param Parameters:
	:type Parameters: math_Vector &
	:param degreemin: default value is 4
	:type degreemin: int
	:param degreemax: default value is 8
	:type degreemax: int
	:param Tolerance3d: default value is 1.0e-03
	:type Tolerance3d: float
	:param Tolerance2d: default value is 1.0e-06
	:type Tolerance2d: float
	:param NbIterations: default value is 5
	:type NbIterations: int
	:param cutting: default value is Standard_True
	:type cutting: bool
	:param Squares: default value is Standard_False
	:type Squares: bool
	:rtype: None
") BRepApprox_TheComputeLineBezierOfApprox;
		 BRepApprox_TheComputeLineBezierOfApprox (const BRepApprox_TheMultiLineOfApprox & Line,const math_Vector & Parameters,const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Standard_Boolean Squares = Standard_False);
		%feature("compactdefaultargs") BRepApprox_TheComputeLineBezierOfApprox;
		%feature("autodoc", "	:param Parameters:
	:type Parameters: math_Vector &
	:param degreemin: default value is 4
	:type degreemin: int
	:param degreemax: default value is 8
	:type degreemax: int
	:param Tolerance3d: default value is 1.0e-03
	:type Tolerance3d: float
	:param Tolerance2d: default value is 1.0e-06
	:type Tolerance2d: float
	:param NbIterations: default value is 5
	:type NbIterations: int
	:param cutting: default value is Standard_True
	:type cutting: bool
	:param Squares: default value is Standard_False
	:type Squares: bool
	:rtype: None
") BRepApprox_TheComputeLineBezierOfApprox;
		 BRepApprox_TheComputeLineBezierOfApprox (const math_Vector & Parameters,const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Standard_Boolean Squares = Standard_False);
		%feature("compactdefaultargs") BRepApprox_TheComputeLineBezierOfApprox;
		%feature("autodoc", "	:param degreemin: default value is 4
	:type degreemin: int
	:param degreemax: default value is 8
	:type degreemax: int
	:param Tolerance3d: default value is 1.0e-03
	:type Tolerance3d: float
	:param Tolerance2d: default value is 1.0e-06
	:type Tolerance2d: float
	:param NbIterations: default value is 5
	:type NbIterations: int
	:param cutting: default value is Standard_True
	:type cutting: bool
	:param parametrization: default value is Approx_ChordLength
	:type parametrization: Approx_ParametrizationType
	:param Squares: default value is Standard_False
	:type Squares: bool
	:rtype: None
") BRepApprox_TheComputeLineBezierOfApprox;
		 BRepApprox_TheComputeLineBezierOfApprox (const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Approx_ParametrizationType parametrization = Approx_ChordLength,const Standard_Boolean Squares = Standard_False);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param degreemin: default value is 4
	:type degreemin: int
	:param degreemax: default value is 8
	:type degreemax: int
	:param Tolerance3d: default value is 1.0e-03
	:type Tolerance3d: float
	:param Tolerance2d: default value is 1.0e-06
	:type Tolerance2d: float
	:param NbIterations: default value is 5
	:type NbIterations: int
	:param cutting: default value is Standard_True
	:type cutting: bool
	:param parametrization: default value is Approx_ChordLength
	:type parametrization: Approx_ParametrizationType
	:param Squares: default value is Standard_False
	:type Squares: bool
	:rtype: None
") Init;
		void Init (const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Approx_ParametrizationType parametrization = Approx_ChordLength,const Standard_Boolean Squares = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Line:
	:type Line: BRepApprox_TheMultiLineOfApprox &
	:rtype: None
") Perform;
		void Perform (const BRepApprox_TheMultiLineOfApprox & Line);
		%feature("compactdefaultargs") SetDegrees;
		%feature("autodoc", "	:param degreemin:
	:type degreemin: int
	:param degreemax:
	:type degreemax: int
	:rtype: None
") SetDegrees;
		void SetDegrees (const Standard_Integer degreemin,const Standard_Integer degreemax);
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "	:param Tolerance3d:
	:type Tolerance3d: float
	:param Tolerance2d:
	:type Tolerance2d: float
	:rtype: None
") SetTolerances;
		void SetTolerances (const Standard_Real Tolerance3d,const Standard_Real Tolerance2d);
		%feature("compactdefaultargs") SetConstraints;
		%feature("autodoc", "	:param firstC:
	:type firstC: AppParCurves_Constraint
	:param lastC:
	:type lastC: AppParCurves_Constraint
	:rtype: None
") SetConstraints;
		void SetConstraints (const AppParCurves_Constraint firstC,const AppParCurves_Constraint lastC);
		%feature("compactdefaultargs") IsAllApproximated;
		%feature("autodoc", "	:rtype: bool
") IsAllApproximated;
		Standard_Boolean IsAllApproximated ();
		%feature("compactdefaultargs") IsToleranceReached;
		%feature("autodoc", "	:rtype: bool
") IsToleranceReached;
		Standard_Boolean IsToleranceReached ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param tol3d:
	:type tol3d: float &
	:param tol2d:
	:type tol2d: float &
	:rtype: None
") Error;
		void Error (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") NbMultiCurves;
		%feature("autodoc", "	:rtype: int
") NbMultiCurves;
		Standard_Integer NbMultiCurves ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index: default value is 1
	:type Index: int
	:rtype: AppParCurves_MultiCurve
") Value;
		const AppParCurves_MultiCurve & Value (const Standard_Integer Index = 1);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index: default value is 1
	:type Index: int
	:rtype: AppParCurves_MultiCurve
") ChangeValue;
		AppParCurves_MultiCurve & ChangeValue (const Standard_Integer Index = 1);
		%feature("compactdefaultargs") SplineValue;
		%feature("autodoc", "	:rtype: AppParCurves_MultiBSpCurve
") SplineValue;
		const AppParCurves_MultiBSpCurve & SplineValue ();
		%feature("compactdefaultargs") Parametrization;
		%feature("autodoc", "	:param partype:
	:type partype: Approx_ParametrizationType &
	:rtype: None
") Parametrization;
		void Parametrization (Approx_ParametrizationType & partype);
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	:param Index: default value is 1
	:type Index: int
	:rtype: TColStd_Array1OfReal
") Parameters;
		const TColStd_Array1OfReal & Parameters (const Standard_Integer Index = 1);
};


%extend BRepApprox_TheComputeLineBezierOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepApprox_TheComputeLineOfApprox;
class BRepApprox_TheComputeLineOfApprox {
	public:
		%feature("compactdefaultargs") BRepApprox_TheComputeLineOfApprox;
		%feature("autodoc", "	:param Line:
	:type Line: BRepApprox_TheMultiLineOfApprox &
	:param degreemin: default value is 4
	:type degreemin: int
	:param degreemax: default value is 8
	:type degreemax: int
	:param Tolerance3d: default value is 1.0e-3
	:type Tolerance3d: float
	:param Tolerance2d: default value is 1.0e-6
	:type Tolerance2d: float
	:param NbIterations: default value is 5
	:type NbIterations: int
	:param cutting: default value is Standard_True
	:type cutting: bool
	:param parametrization: default value is Approx_ChordLength
	:type parametrization: Approx_ParametrizationType
	:param Squares: default value is Standard_False
	:type Squares: bool
	:rtype: None
") BRepApprox_TheComputeLineOfApprox;
		 BRepApprox_TheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & Line,const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-3,const Standard_Real Tolerance2d = 1.0e-6,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Approx_ParametrizationType parametrization = Approx_ChordLength,const Standard_Boolean Squares = Standard_False);
		%feature("compactdefaultargs") BRepApprox_TheComputeLineOfApprox;
		%feature("autodoc", "	:param Line:
	:type Line: BRepApprox_TheMultiLineOfApprox &
	:param Parameters:
	:type Parameters: math_Vector &
	:param degreemin: default value is 4
	:type degreemin: int
	:param degreemax: default value is 8
	:type degreemax: int
	:param Tolerance3d: default value is 1.0e-03
	:type Tolerance3d: float
	:param Tolerance2d: default value is 1.0e-06
	:type Tolerance2d: float
	:param NbIterations: default value is 5
	:type NbIterations: int
	:param cutting: default value is Standard_True
	:type cutting: bool
	:param Squares: default value is Standard_False
	:type Squares: bool
	:rtype: None
") BRepApprox_TheComputeLineOfApprox;
		 BRepApprox_TheComputeLineOfApprox (const BRepApprox_TheMultiLineOfApprox & Line,const math_Vector & Parameters,const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Standard_Boolean Squares = Standard_False);
		%feature("compactdefaultargs") BRepApprox_TheComputeLineOfApprox;
		%feature("autodoc", "	:param Parameters:
	:type Parameters: math_Vector &
	:param degreemin: default value is 4
	:type degreemin: int
	:param degreemax: default value is 8
	:type degreemax: int
	:param Tolerance3d: default value is 1.0e-03
	:type Tolerance3d: float
	:param Tolerance2d: default value is 1.0e-06
	:type Tolerance2d: float
	:param NbIterations: default value is 5
	:type NbIterations: int
	:param cutting: default value is Standard_True
	:type cutting: bool
	:param Squares: default value is Standard_False
	:type Squares: bool
	:rtype: None
") BRepApprox_TheComputeLineOfApprox;
		 BRepApprox_TheComputeLineOfApprox (const math_Vector & Parameters,const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Standard_Boolean Squares = Standard_False);
		%feature("compactdefaultargs") BRepApprox_TheComputeLineOfApprox;
		%feature("autodoc", "	:param degreemin: default value is 4
	:type degreemin: int
	:param degreemax: default value is 8
	:type degreemax: int
	:param Tolerance3d: default value is 1.0e-03
	:type Tolerance3d: float
	:param Tolerance2d: default value is 1.0e-06
	:type Tolerance2d: float
	:param NbIterations: default value is 5
	:type NbIterations: int
	:param cutting: default value is Standard_True
	:type cutting: bool
	:param parametrization: default value is Approx_ChordLength
	:type parametrization: Approx_ParametrizationType
	:param Squares: default value is Standard_False
	:type Squares: bool
	:rtype: None
") BRepApprox_TheComputeLineOfApprox;
		 BRepApprox_TheComputeLineOfApprox (const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Approx_ParametrizationType parametrization = Approx_ChordLength,const Standard_Boolean Squares = Standard_False);
		%feature("compactdefaultargs") Interpol;
		%feature("autodoc", "	:param Line:
	:type Line: BRepApprox_TheMultiLineOfApprox &
	:rtype: None
") Interpol;
		void Interpol (const BRepApprox_TheMultiLineOfApprox & Line);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param degreemin: default value is 4
	:type degreemin: int
	:param degreemax: default value is 8
	:type degreemax: int
	:param Tolerance3d: default value is 1.0e-03
	:type Tolerance3d: float
	:param Tolerance2d: default value is 1.0e-06
	:type Tolerance2d: float
	:param NbIterations: default value is 5
	:type NbIterations: int
	:param cutting: default value is Standard_True
	:type cutting: bool
	:param parametrization: default value is Approx_ChordLength
	:type parametrization: Approx_ParametrizationType
	:param Squares: default value is Standard_False
	:type Squares: bool
	:rtype: None
") Init;
		void Init (const Standard_Integer degreemin = 4,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-03,const Standard_Real Tolerance2d = 1.0e-06,const Standard_Integer NbIterations = 5,const Standard_Boolean cutting = Standard_True,const Approx_ParametrizationType parametrization = Approx_ChordLength,const Standard_Boolean Squares = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Line:
	:type Line: BRepApprox_TheMultiLineOfApprox &
	:rtype: None
") Perform;
		void Perform (const BRepApprox_TheMultiLineOfApprox & Line);
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "	:param ThePar:
	:type ThePar: math_Vector &
	:rtype: None
") SetParameters;
		void SetParameters (const math_Vector & ThePar);
		%feature("compactdefaultargs") SetKnots;
		%feature("autodoc", "	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:rtype: None
") SetKnots;
		void SetKnots (const TColStd_Array1OfReal & Knots);
		%feature("compactdefaultargs") SetKnotsAndMultiplicities;
		%feature("autodoc", "	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:param Mults:
	:type Mults: TColStd_Array1OfInteger &
	:rtype: None
") SetKnotsAndMultiplicities;
		void SetKnotsAndMultiplicities (const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults);
		%feature("compactdefaultargs") SetDegrees;
		%feature("autodoc", "	:param degreemin:
	:type degreemin: int
	:param degreemax:
	:type degreemax: int
	:rtype: None
") SetDegrees;
		void SetDegrees (const Standard_Integer degreemin,const Standard_Integer degreemax);
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "	:param Tolerance3d:
	:type Tolerance3d: float
	:param Tolerance2d:
	:type Tolerance2d: float
	:rtype: None
") SetTolerances;
		void SetTolerances (const Standard_Real Tolerance3d,const Standard_Real Tolerance2d);
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "	:param C:
	:type C: int
	:rtype: None
") SetContinuity;
		void SetContinuity (const Standard_Integer C);
		%feature("compactdefaultargs") SetConstraints;
		%feature("autodoc", "	:param firstC:
	:type firstC: AppParCurves_Constraint
	:param lastC:
	:type lastC: AppParCurves_Constraint
	:rtype: None
") SetConstraints;
		void SetConstraints (const AppParCurves_Constraint firstC,const AppParCurves_Constraint lastC);
		%feature("compactdefaultargs") IsAllApproximated;
		%feature("autodoc", "	:rtype: bool
") IsAllApproximated;
		Standard_Boolean IsAllApproximated ();
		%feature("compactdefaultargs") IsToleranceReached;
		%feature("autodoc", "	:rtype: bool
") IsToleranceReached;
		Standard_Boolean IsToleranceReached ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:param tol3d:
	:type tol3d: float &
	:param tol2d:
	:type tol2d: float &
	:rtype: None
") Error;
		void Error (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: AppParCurves_MultiBSpCurve
") Value;
		const AppParCurves_MultiBSpCurve & Value ();
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:rtype: AppParCurves_MultiBSpCurve
") ChangeValue;
		AppParCurves_MultiBSpCurve & ChangeValue ();
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	:rtype: TColStd_Array1OfReal
") Parameters;
		const TColStd_Array1OfReal & Parameters ();
};


%extend BRepApprox_TheComputeLineOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox;
class BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox : public math_FunctionSetWithDerivatives {
	public:
		%feature("compactdefaultargs") BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox;
		%feature("autodoc", "	:rtype: None
") BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox;
		 BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox ();
		%feature("compactdefaultargs") BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox;
		%feature("autodoc", "	:param S1:
	:type S1: BRepAdaptor_Surface &
	:param S2:
	:type S2: BRepAdaptor_Surface &
	:rtype: None
") BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox;
		 BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox (const BRepAdaptor_Surface & S1,const BRepAdaptor_Surface & S2);
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("compactdefaultargs") ComputeParameters;
		%feature("autodoc", "	:param ChoixIso:
	:type ChoixIso: IntImp_ConstIsoparametric
	:param Param:
	:type Param: TColStd_Array1OfReal &
	:param UVap:
	:type UVap: math_Vector &
	:param BornInf:
	:type BornInf: math_Vector &
	:param BornSup:
	:type BornSup: math_Vector &
	:param Tolerance:
	:type Tolerance: math_Vector &
	:rtype: None
") ComputeParameters;
		void ComputeParameters (const IntImp_ConstIsoparametric ChoixIso,const TColStd_Array1OfReal & Param,math_Vector & UVap,math_Vector & BornInf,math_Vector & BornSup,math_Vector & Tolerance);
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "	:rtype: float
") Root;
		Standard_Real Root ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:rtype: gp_Pnt
") Point;
		gp_Pnt Point ();
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "	:param UVap:
	:type UVap: math_Vector &
	:param Param:
	:type Param: TColStd_Array1OfReal &
	:param BestChoix:
	:type BestChoix: IntImp_ConstIsoparametric &
	:rtype: bool
") IsTangent;
		Standard_Boolean IsTangent (const math_Vector & UVap,TColStd_Array1OfReal & Param,IntImp_ConstIsoparametric & BestChoix);
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "	:rtype: gp_Dir
") Direction;
		gp_Dir Direction ();
		%feature("compactdefaultargs") DirectionOnS1;
		%feature("autodoc", "	:rtype: gp_Dir2d
") DirectionOnS1;
		gp_Dir2d DirectionOnS1 ();
		%feature("compactdefaultargs") DirectionOnS2;
		%feature("autodoc", "	:rtype: gp_Dir2d
") DirectionOnS2;
		gp_Dir2d DirectionOnS2 ();
		%feature("compactdefaultargs") AuxillarSurface1;
		%feature("autodoc", "	:rtype: BRepAdaptor_Surface
") AuxillarSurface1;
		const BRepAdaptor_Surface & AuxillarSurface1 ();
		%feature("compactdefaultargs") AuxillarSurface2;
		%feature("autodoc", "	:rtype: BRepAdaptor_Surface
") AuxillarSurface2;
		const BRepAdaptor_Surface & AuxillarSurface2 ();
};


%extend BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepApprox_TheImpPrmSvSurfacesOfApprox;
class BRepApprox_TheImpPrmSvSurfacesOfApprox : public ApproxInt_SvSurfaces {
	public:
		%feature("compactdefaultargs") BRepApprox_TheImpPrmSvSurfacesOfApprox;
		%feature("autodoc", "	:param Surf1:
	:type Surf1: BRepAdaptor_Surface &
	:param Surf2:
	:type Surf2: IntSurf_Quadric &
	:rtype: None
") BRepApprox_TheImpPrmSvSurfacesOfApprox;
		 BRepApprox_TheImpPrmSvSurfacesOfApprox (const BRepAdaptor_Surface & Surf1,const IntSurf_Quadric & Surf2);
		%feature("compactdefaultargs") BRepApprox_TheImpPrmSvSurfacesOfApprox;
		%feature("autodoc", "	:param Surf1:
	:type Surf1: IntSurf_Quadric &
	:param Surf2:
	:type Surf2: BRepAdaptor_Surface &
	:rtype: None
") BRepApprox_TheImpPrmSvSurfacesOfApprox;
		 BRepApprox_TheImpPrmSvSurfacesOfApprox (const IntSurf_Quadric & Surf1,const BRepAdaptor_Surface & Surf2);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:param u1:
	:type u1: float &
	:param v1:
	:type v1: float &
	:param u2:
	:type u2: float &
	:param v2:
	:type v2: float &
	:param Pt:
	:type Pt: gp_Pnt
	:param Tg:
	:type Tg: gp_Vec
	:param Tguv1:
	:type Tguv1: gp_Vec2d
	:param Tguv2:
	:type Tguv2: gp_Vec2d
	:rtype: bool
") Compute;
		Standard_Boolean Compute (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & Pt,gp_Vec & Tg,gp_Vec2d & Tguv1,gp_Vec2d & Tguv2);
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") Pnt;
		void Pnt (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Pnt & P);
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param Tg:
	:type Tg: gp_Vec
	:rtype: bool
") Tangency;
		Standard_Boolean Tangency (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec & Tg);
		%feature("compactdefaultargs") TangencyOnSurf1;
		%feature("autodoc", "	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param Tg:
	:type Tg: gp_Vec2d
	:rtype: bool
") TangencyOnSurf1;
		Standard_Boolean TangencyOnSurf1 (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec2d & Tg);
		%feature("compactdefaultargs") TangencyOnSurf2;
		%feature("autodoc", "	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param Tg:
	:type Tg: gp_Vec2d
	:rtype: bool
") TangencyOnSurf2;
		Standard_Boolean TangencyOnSurf2 (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec2d & Tg);
};


%extend BRepApprox_TheImpPrmSvSurfacesOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox;
class BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox {
	public:
		%feature("compactdefaultargs") BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox;
		%feature("autodoc", "	:rtype: None
") BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox;
		 BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox ();
		%feature("compactdefaultargs") BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox;
		%feature("autodoc", "	:param Param:
	:type Param: TColStd_Array1OfReal &
	:param S1:
	:type S1: BRepAdaptor_Surface &
	:param S2:
	:type S2: BRepAdaptor_Surface &
	:param TolTangency:
	:type TolTangency: float
	:rtype: None
") BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox;
		 BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox (const TColStd_Array1OfReal & Param,const BRepAdaptor_Surface & S1,const BRepAdaptor_Surface & S2,const Standard_Real TolTangency);
		%feature("compactdefaultargs") BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox;
		%feature("autodoc", "	:param S1:
	:type S1: BRepAdaptor_Surface &
	:param S2:
	:type S2: BRepAdaptor_Surface &
	:param TolTangency:
	:type TolTangency: float
	:rtype: None
") BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox;
		 BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox (const BRepAdaptor_Surface & S1,const BRepAdaptor_Surface & S2,const Standard_Real TolTangency);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Param:
	:type Param: TColStd_Array1OfReal &
	:param Rsnld:
	:type Rsnld: math_FunctionSetRoot &
	:rtype: IntImp_ConstIsoparametric
") Perform;
		IntImp_ConstIsoparametric Perform (const TColStd_Array1OfReal & Param,math_FunctionSetRoot & Rsnld);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Param:
	:type Param: TColStd_Array1OfReal &
	:param Rsnld:
	:type Rsnld: math_FunctionSetRoot &
	:param ChoixIso:
	:type ChoixIso: IntImp_ConstIsoparametric
	:rtype: IntImp_ConstIsoparametric
") Perform;
		IntImp_ConstIsoparametric Perform (const TColStd_Array1OfReal & Param,math_FunctionSetRoot & Rsnld,const IntImp_ConstIsoparametric ChoixIso);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:rtype: IntSurf_PntOn2S
") Point;
		const IntSurf_PntOn2S & Point ();
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "	:rtype: bool
") IsTangent;
		Standard_Boolean IsTangent ();
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "	:rtype: gp_Dir
") Direction;
		const gp_Dir  Direction ();
		%feature("compactdefaultargs") DirectionOnS1;
		%feature("autodoc", "	:rtype: gp_Dir2d
") DirectionOnS1;
		const gp_Dir2d  DirectionOnS1 ();
		%feature("compactdefaultargs") DirectionOnS2;
		%feature("autodoc", "	:rtype: gp_Dir2d
") DirectionOnS2;
		const gp_Dir2d  DirectionOnS2 ();
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "	:rtype: BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox
") Function;
		BRepApprox_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfApprox & Function ();
		%feature("compactdefaultargs") ChangePoint;
		%feature("autodoc", "	:rtype: IntSurf_PntOn2S
") ChangePoint;
		IntSurf_PntOn2S & ChangePoint ();
};


%extend BRepApprox_TheInt2SOfThePrmPrmSvSurfacesOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepApprox_TheMultiLineOfApprox;
class BRepApprox_TheMultiLineOfApprox {
	public:
		%feature("compactdefaultargs") BRepApprox_TheMultiLineOfApprox;
		%feature("autodoc", "	:param line:
	:type line: Handle_BRepApprox_ApproxLine &
	:param PtrSvSurfaces:
	:type PtrSvSurfaces: Standard_Address
	:param NbP3d:
	:type NbP3d: int
	:param NbP2d:
	:type NbP2d: int
	:param xo:
	:type xo: float
	:param ax:
	:type ax: float
	:param yo:
	:type yo: float
	:param ay:
	:type ay: float
	:param zo:
	:type zo: float
	:param az:
	:type az: float
	:param u1o:
	:type u1o: float
	:param a1u:
	:type a1u: float
	:param v1o:
	:type v1o: float
	:param a1v:
	:type a1v: float
	:param u2o:
	:type u2o: float
	:param a2u:
	:type a2u: float
	:param v2o:
	:type v2o: float
	:param a2v:
	:type a2v: float
	:param P2DOnFirst:
	:type P2DOnFirst: bool
	:param IndMin: default value is 0
	:type IndMin: int
	:param IndMax: default value is 0
	:type IndMax: int
	:rtype: None
") BRepApprox_TheMultiLineOfApprox;
		 BRepApprox_TheMultiLineOfApprox (const Handle_BRepApprox_ApproxLine & line,const Standard_Address PtrSvSurfaces,const Standard_Integer NbP3d,const Standard_Integer NbP2d,const Standard_Real xo,const Standard_Real ax,const Standard_Real yo,const Standard_Real ay,const Standard_Real zo,const Standard_Real az,const Standard_Real u1o,const Standard_Real a1u,const Standard_Real v1o,const Standard_Real a1v,const Standard_Real u2o,const Standard_Real a2u,const Standard_Real v2o,const Standard_Real a2v,const Standard_Boolean P2DOnFirst,const Standard_Integer IndMin = 0,const Standard_Integer IndMax = 0);
		%feature("compactdefaultargs") BRepApprox_TheMultiLineOfApprox;
		%feature("autodoc", "	:param line:
	:type line: Handle_BRepApprox_ApproxLine &
	:param NbP3d:
	:type NbP3d: int
	:param NbP2d:
	:type NbP2d: int
	:param xo:
	:type xo: float
	:param ax:
	:type ax: float
	:param yo:
	:type yo: float
	:param ay:
	:type ay: float
	:param zo:
	:type zo: float
	:param az:
	:type az: float
	:param u1o:
	:type u1o: float
	:param a1u:
	:type a1u: float
	:param v1o:
	:type v1o: float
	:param a1v:
	:type a1v: float
	:param u2o:
	:type u2o: float
	:param a2u:
	:type a2u: float
	:param v2o:
	:type v2o: float
	:param a2v:
	:type a2v: float
	:param P2DOnFirst:
	:type P2DOnFirst: bool
	:param IndMin: default value is 0
	:type IndMin: int
	:param IndMax: default value is 0
	:type IndMax: int
	:rtype: None
") BRepApprox_TheMultiLineOfApprox;
		 BRepApprox_TheMultiLineOfApprox (const Handle_BRepApprox_ApproxLine & line,const Standard_Integer NbP3d,const Standard_Integer NbP2d,const Standard_Real xo,const Standard_Real ax,const Standard_Real yo,const Standard_Real ay,const Standard_Real zo,const Standard_Real az,const Standard_Real u1o,const Standard_Real a1u,const Standard_Real v1o,const Standard_Real a1v,const Standard_Real u2o,const Standard_Real a2u,const Standard_Real v2o,const Standard_Real a2v,const Standard_Boolean P2DOnFirst,const Standard_Integer IndMin = 0,const Standard_Integer IndMax = 0);
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "	:rtype: int
") FirstPoint;
		Standard_Integer FirstPoint ();
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "	:rtype: int
") LastPoint;
		Standard_Integer LastPoint ();
		%feature("compactdefaultargs") NbP2d;
		%feature("autodoc", "	:rtype: int
") NbP2d;
		Standard_Integer NbP2d ();
		%feature("compactdefaultargs") NbP3d;
		%feature("autodoc", "	:rtype: int
") NbP3d;
		Standard_Integer NbP3d ();
		%feature("compactdefaultargs") WhatStatus;
		%feature("autodoc", "	:rtype: Approx_Status
") WhatStatus;
		Approx_Status WhatStatus ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param MPointIndex:
	:type MPointIndex: int
	:param tabPt:
	:type tabPt: TColgp_Array1OfPnt
	:rtype: None
") Value;
		void Value (const Standard_Integer MPointIndex,TColgp_Array1OfPnt & tabPt);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param MPointIndex:
	:type MPointIndex: int
	:param tabPt2d:
	:type tabPt2d: TColgp_Array1OfPnt2d
	:rtype: None
") Value;
		void Value (const Standard_Integer MPointIndex,TColgp_Array1OfPnt2d & tabPt2d);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param MPointIndex:
	:type MPointIndex: int
	:param tabPt:
	:type tabPt: TColgp_Array1OfPnt
	:param tabPt2d:
	:type tabPt2d: TColgp_Array1OfPnt2d
	:rtype: None
") Value;
		void Value (const Standard_Integer MPointIndex,TColgp_Array1OfPnt & tabPt,TColgp_Array1OfPnt2d & tabPt2d);
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "	:param MPointIndex:
	:type MPointIndex: int
	:param tabV:
	:type tabV: TColgp_Array1OfVec
	:rtype: bool
") Tangency;
		Standard_Boolean Tangency (const Standard_Integer MPointIndex,TColgp_Array1OfVec & tabV);
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "	:param MPointIndex:
	:type MPointIndex: int
	:param tabV2d:
	:type tabV2d: TColgp_Array1OfVec2d
	:rtype: bool
") Tangency;
		Standard_Boolean Tangency (const Standard_Integer MPointIndex,TColgp_Array1OfVec2d & tabV2d);
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "	:param MPointIndex:
	:type MPointIndex: int
	:param tabV:
	:type tabV: TColgp_Array1OfVec
	:param tabV2d:
	:type tabV2d: TColgp_Array1OfVec2d
	:rtype: bool
") Tangency;
		Standard_Boolean Tangency (const Standard_Integer MPointIndex,TColgp_Array1OfVec & tabV,TColgp_Array1OfVec2d & tabV2d);
		%feature("compactdefaultargs") MakeMLBetween;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param High:
	:type High: int
	:param NbPointsToInsert:
	:type NbPointsToInsert: int
	:rtype: BRepApprox_TheMultiLineOfApprox
") MakeMLBetween;
		BRepApprox_TheMultiLineOfApprox MakeMLBetween (const Standard_Integer Low,const Standard_Integer High,const Standard_Integer NbPointsToInsert);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
};


%extend BRepApprox_TheMultiLineOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class BRepApprox_TheMultiLineToolOfApprox {
	public:
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "	:param ML:
	:type ML: BRepApprox_TheMultiLineOfApprox &
	:rtype: int
") FirstPoint;
		static Standard_Integer FirstPoint (const BRepApprox_TheMultiLineOfApprox & ML);
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "	:param ML:
	:type ML: BRepApprox_TheMultiLineOfApprox &
	:rtype: int
") LastPoint;
		static Standard_Integer LastPoint (const BRepApprox_TheMultiLineOfApprox & ML);
		%feature("compactdefaultargs") NbP2d;
		%feature("autodoc", "	:param ML:
	:type ML: BRepApprox_TheMultiLineOfApprox &
	:rtype: int
") NbP2d;
		static Standard_Integer NbP2d (const BRepApprox_TheMultiLineOfApprox & ML);
		%feature("compactdefaultargs") NbP3d;
		%feature("autodoc", "	:param ML:
	:type ML: BRepApprox_TheMultiLineOfApprox &
	:rtype: int
") NbP3d;
		static Standard_Integer NbP3d (const BRepApprox_TheMultiLineOfApprox & ML);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param ML:
	:type ML: BRepApprox_TheMultiLineOfApprox &
	:param MPointIndex:
	:type MPointIndex: int
	:param tabPt:
	:type tabPt: TColgp_Array1OfPnt
	:rtype: void
") Value;
		static void Value (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfPnt & tabPt);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param ML:
	:type ML: BRepApprox_TheMultiLineOfApprox &
	:param MPointIndex:
	:type MPointIndex: int
	:param tabPt2d:
	:type tabPt2d: TColgp_Array1OfPnt2d
	:rtype: void
") Value;
		static void Value (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfPnt2d & tabPt2d);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param ML:
	:type ML: BRepApprox_TheMultiLineOfApprox &
	:param MPointIndex:
	:type MPointIndex: int
	:param tabPt:
	:type tabPt: TColgp_Array1OfPnt
	:param tabPt2d:
	:type tabPt2d: TColgp_Array1OfPnt2d
	:rtype: void
") Value;
		static void Value (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfPnt & tabPt,TColgp_Array1OfPnt2d & tabPt2d);
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "	:param ML:
	:type ML: BRepApprox_TheMultiLineOfApprox &
	:param MPointIndex:
	:type MPointIndex: int
	:param tabV:
	:type tabV: TColgp_Array1OfVec
	:rtype: bool
") Tangency;
		static Standard_Boolean Tangency (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec & tabV);
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "	:param ML:
	:type ML: BRepApprox_TheMultiLineOfApprox &
	:param MPointIndex:
	:type MPointIndex: int
	:param tabV2d:
	:type tabV2d: TColgp_Array1OfVec2d
	:rtype: bool
") Tangency;
		static Standard_Boolean Tangency (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec2d & tabV2d);
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "	:param ML:
	:type ML: BRepApprox_TheMultiLineOfApprox &
	:param MPointIndex:
	:type MPointIndex: int
	:param tabV:
	:type tabV: TColgp_Array1OfVec
	:param tabV2d:
	:type tabV2d: TColgp_Array1OfVec2d
	:rtype: bool
") Tangency;
		static Standard_Boolean Tangency (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec & tabV,TColgp_Array1OfVec2d & tabV2d);
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "	:param ML:
	:type ML: BRepApprox_TheMultiLineOfApprox &
	:param MPointIndex:
	:type MPointIndex: int
	:param tabV:
	:type tabV: TColgp_Array1OfVec
	:rtype: bool
") Curvature;
		static Standard_Boolean Curvature (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec & tabV);
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "	:param ML:
	:type ML: BRepApprox_TheMultiLineOfApprox &
	:param MPointIndex:
	:type MPointIndex: int
	:param tabV2d:
	:type tabV2d: TColgp_Array1OfVec2d
	:rtype: bool
") Curvature;
		static Standard_Boolean Curvature (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec2d & tabV2d);
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "	:param ML:
	:type ML: BRepApprox_TheMultiLineOfApprox &
	:param MPointIndex:
	:type MPointIndex: int
	:param tabV:
	:type tabV: TColgp_Array1OfVec
	:param tabV2d:
	:type tabV2d: TColgp_Array1OfVec2d
	:rtype: bool
") Curvature;
		static Standard_Boolean Curvature (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer MPointIndex,TColgp_Array1OfVec & tabV,TColgp_Array1OfVec2d & tabV2d);
		%feature("compactdefaultargs") MakeMLBetween;
		%feature("autodoc", "	:param ML:
	:type ML: BRepApprox_TheMultiLineOfApprox &
	:param I1:
	:type I1: int
	:param I2:
	:type I2: int
	:param NbPMin:
	:type NbPMin: int
	:rtype: BRepApprox_TheMultiLineOfApprox
") MakeMLBetween;
		static BRepApprox_TheMultiLineOfApprox MakeMLBetween (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer I1,const Standard_Integer I2,const Standard_Integer NbPMin);
		%feature("compactdefaultargs") WhatStatus;
		%feature("autodoc", "	:param ML:
	:type ML: BRepApprox_TheMultiLineOfApprox &
	:param I1:
	:type I1: int
	:param I2:
	:type I2: int
	:rtype: Approx_Status
") WhatStatus;
		static Approx_Status WhatStatus (const BRepApprox_TheMultiLineOfApprox & ML,const Standard_Integer I1,const Standard_Integer I2);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param ML:
	:type ML: BRepApprox_TheMultiLineOfApprox &
	:rtype: void
") Dump;
		static void Dump (const BRepApprox_TheMultiLineOfApprox & ML);
};


%extend BRepApprox_TheMultiLineToolOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepApprox_ThePrmPrmSvSurfacesOfApprox;
class BRepApprox_ThePrmPrmSvSurfacesOfApprox : public ApproxInt_SvSurfaces {
	public:
		%feature("compactdefaultargs") BRepApprox_ThePrmPrmSvSurfacesOfApprox;
		%feature("autodoc", "	:param Surf1:
	:type Surf1: BRepAdaptor_Surface &
	:param Surf2:
	:type Surf2: BRepAdaptor_Surface &
	:rtype: None
") BRepApprox_ThePrmPrmSvSurfacesOfApprox;
		 BRepApprox_ThePrmPrmSvSurfacesOfApprox (const BRepAdaptor_Surface & Surf1,const BRepAdaptor_Surface & Surf2);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:param u1:
	:type u1: float &
	:param v1:
	:type v1: float &
	:param u2:
	:type u2: float &
	:param v2:
	:type v2: float &
	:param Pt:
	:type Pt: gp_Pnt
	:param Tg:
	:type Tg: gp_Vec
	:param Tguv1:
	:type Tguv1: gp_Vec2d
	:param Tguv2:
	:type Tguv2: gp_Vec2d
	:rtype: bool
") Compute;
		Standard_Boolean Compute (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & Pt,gp_Vec & Tg,gp_Vec2d & Tguv1,gp_Vec2d & Tguv2);
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") Pnt;
		void Pnt (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Pnt & P);
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param Tg:
	:type Tg: gp_Vec
	:rtype: bool
") Tangency;
		Standard_Boolean Tangency (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec & Tg);
		%feature("compactdefaultargs") TangencyOnSurf1;
		%feature("autodoc", "	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param Tg:
	:type Tg: gp_Vec2d
	:rtype: bool
") TangencyOnSurf1;
		Standard_Boolean TangencyOnSurf1 (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec2d & Tg);
		%feature("compactdefaultargs") TangencyOnSurf2;
		%feature("autodoc", "	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param Tg:
	:type Tg: gp_Vec2d
	:rtype: bool
") TangencyOnSurf2;
		Standard_Boolean TangencyOnSurf2 (const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec2d & Tg);
};


%extend BRepApprox_ThePrmPrmSvSurfacesOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox;
class BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox : public math_FunctionSetWithDerivatives {
	public:
		%feature("compactdefaultargs") BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox;
		%feature("autodoc", "	:rtype: None
") BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox;
		 BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox ();
		%feature("compactdefaultargs") BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox;
		%feature("autodoc", "	:param PS:
	:type PS: BRepAdaptor_Surface &
	:param IS:
	:type IS: IntSurf_Quadric &
	:rtype: None
") BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox;
		 BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox (const BRepAdaptor_Surface & PS,const IntSurf_Quadric & IS);
		%feature("compactdefaultargs") BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox;
		%feature("autodoc", "	:param IS:
	:type IS: IntSurf_Quadric &
	:rtype: None
") BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox;
		 BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox (const IntSurf_Quadric & IS);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param PS:
	:type PS: BRepAdaptor_Surface &
	:rtype: None
") Set;
		void Set (const BRepAdaptor_Surface & PS);
		%feature("compactdefaultargs") SetImplicitSurface;
		%feature("autodoc", "	:param IS:
	:type IS: IntSurf_Quadric &
	:rtype: None
") SetImplicitSurface;
		void SetImplicitSurface (const IntSurf_Quadric & IS);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Set;
		void Set (const Standard_Real Tolerance);
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "	:rtype: float
") Root;
		Standard_Real Root ();
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:rtype: gp_Pnt
") Point;
		const gp_Pnt  Point ();
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "	:rtype: bool
") IsTangent;
		Standard_Boolean IsTangent ();
		%feature("compactdefaultargs") Direction3d;
		%feature("autodoc", "	:rtype: gp_Vec
") Direction3d;
		const gp_Vec  Direction3d ();
		%feature("compactdefaultargs") Direction2d;
		%feature("autodoc", "	:rtype: gp_Dir2d
") Direction2d;
		const gp_Dir2d  Direction2d ();
		%feature("compactdefaultargs") PSurface;
		%feature("autodoc", "	:rtype: BRepAdaptor_Surface
") PSurface;
		const BRepAdaptor_Surface & PSurface ();
		%feature("compactdefaultargs") ISurface;
		%feature("autodoc", "	:rtype: IntSurf_Quadric
") ISurface;
		const IntSurf_Quadric & ISurface ();
};


%extend BRepApprox_TheZerImpFuncOfTheImpPrmSvSurfacesOfApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
