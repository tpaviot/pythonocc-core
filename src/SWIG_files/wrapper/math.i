/*
Copyright 2008-2023 Thomas Paviot (tpaviot@gmail.com)

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
%define MATHDOCSTRING
"math module, see official documentation at
https://www.opencascade.com/doc/occt-7.7.0/refman/html/package_math.html"
%enddef
%module (package="OCC.Core", docstring=MATHDOCSTRING) math


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i


%{
#include<math_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Message.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum math_Status {
	math_OK = 0,
	math_TooManyIterations = 1,
	math_FunctionError = 2,
	math_DirectionSearchError = 3,
	math_NotBracketed = 4,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class math_Status(IntEnum):
	math_OK = 0
	math_TooManyIterations = 1
	math_FunctionError = 2
	math_DirectionSearchError = 3
	math_NotBracketed = 4
math_OK = math_Status.math_OK
math_TooManyIterations = math_Status.math_TooManyIterations
math_FunctionError = math_Status.math_FunctionError
math_DirectionSearchError = math_Status.math_DirectionSearchError
math_NotBracketed = math_Status.math_NotBracketed
};
/* end python proxy for enums */

/* templates */
%template(math_Array1OfValueAndWeight) NCollection_Array1<math_ValueAndWeight>;

%extend NCollection_Array1<math_ValueAndWeight> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<math_ValueAndWeight> math_Array1OfValueAndWeight;
/* end typedefs declaration */

/*********************
* class PSO_Particle *
*********************/
/*************
* class math *
*************/
/******************
* class math_BFGS *
******************/
/**************************
* class math_BissecNewton *
**************************/
/****************************
* class math_BracketMinimum *
****************************/
/***************************
* class math_BracketedRoot *
***************************/
/**************************
* class math_BrentMinimum *
**************************/
/******************************
* class math_BullardGenerator *
******************************/
/******************************************
* class math_ComputeGaussPointsAndWeights *
******************************************/
/********************************************
* class math_ComputeKronrodPointsAndWeights *
********************************************/
/*******************
* class math_Crout *
*******************/
/***********************************
* class math_DirectPolynomialRoots *
***********************************/
/***********************
* class math_DoubleTab *
***********************/
/*********************************
* class math_EigenValuesSearcher *
*********************************/
/******************
* class math_FRPR *
******************/
/**********************
* class math_Function *
**********************/
/******************************
* class math_FunctionAllRoots *
******************************/
/**************************
* class math_FunctionRoot *
**************************/
/***************************
* class math_FunctionRoots *
***************************/
/****************************
* class math_FunctionSample *
****************************/
/*************************
* class math_FunctionSet *
*************************/
/*****************************
* class math_FunctionSetRoot *
*****************************/
/*******************
* class math_Gauss *
*******************/
/******************************
* class math_GaussLeastSquare *
******************************/
/**************************************
* class math_GaussMultipleIntegration *
**************************************/
/*********************************
* class math_GaussSetIntegration *
*********************************/
/************************************
* class math_GaussSingleIntegration *
************************************/
/************************
* class math_GlobOptMin *
************************/
/*************************
* class math_Householder *
*************************/
/********************
* class math_Jacobi *
********************/
/**************************************
* class math_KronrodSingleIntegration *
**************************************/
/********************
* class math_Matrix *
********************/
/*********************************
* class math_MultipleVarFunction *
*********************************/
/********************************
* class math_NewtonFunctionRoot *
********************************/
/***********************************
* class math_NewtonFunctionSetRoot *
***********************************/
/***************************
* class math_NewtonMinimum *
***************************/
/*****************
* class math_PSO *
*****************/
/******************************
* class math_PSOParticlesPool *
******************************/
/********************
* class math_Powell *
********************/
/*****************
* class math_SVD *
*****************/
/****************************************
* class math_TrigonometricFunctionRoots *
****************************************/
/*******************
* class math_Uzawa *
*******************/
/****************************
* class math_ValueAndWeight *
****************************/
/************************
* class math_VectorBase *
************************/
/****************************************
* class math_FunctionSetWithDerivatives *
****************************************/
/************************************
* class math_FunctionWithDerivative *
************************************/
/*********************************************
* class math_MultipleVarFunctionWithGradient *
*********************************************/
/********************************************
* class math_MultipleVarFunctionWithHessian *
********************************************/
/*******************************************
* class math_TrigonometricEquationFunction *
*******************************************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class math_FunctionRoots:
	pass

@classnotwrapped
class math_ValueAndWeight:
	pass

@classnotwrapped
class math_Gauss:
	pass

@classnotwrapped
class math_DoubleTab:
	pass

@classnotwrapped
class math_Jacobi:
	pass

@classnotwrapped
class math_BFGS:
	pass

@classnotwrapped
class math_FunctionSet:
	pass

@classnotwrapped
class math_FunctionSetWithDerivatives:
	pass

@classnotwrapped
class math_Matrix:
	pass

@classnotwrapped
class math_GlobOptMin:
	pass

@classnotwrapped
class math_Crout:
	pass

@classnotwrapped
class math_Householder:
	pass

@classnotwrapped
class math_BullardGenerator:
	pass

@classnotwrapped
class math_FunctionRoot:
	pass

@classnotwrapped
class math_FunctionSetRoot:
	pass

@classnotwrapped
class math_GaussLeastSquare:
	pass

@classnotwrapped
class math_ComputeKronrodPointsAndWeights:
	pass

@classnotwrapped
class math_BrentMinimum:
	pass

@classnotwrapped
class math_GaussSingleIntegration:
	pass

@classnotwrapped
class math_ComputeGaussPointsAndWeights:
	pass

@classnotwrapped
class math_EigenValuesSearcher:
	pass

@classnotwrapped
class math_DirectPolynomialRoots:
	pass

@classnotwrapped
class PSO_Particle:
	pass

@classnotwrapped
class math_PSOParticlesPool:
	pass

@classnotwrapped
class math_TrigonometricEquationFunction:
	pass

@classnotwrapped
class math_BracketedRoot:
	pass

@classnotwrapped
class math_NewtonFunctionRoot:
	pass

@classnotwrapped
class math_GaussSetIntegration:
	pass

@classnotwrapped
class math_SVD:
	pass

@classnotwrapped
class math_MultipleVarFunction:
	pass

@classnotwrapped
class math_NewtonFunctionSetRoot:
	pass

@classnotwrapped
class math_MultipleVarFunctionWithGradient:
	pass

@classnotwrapped
class math_FunctionSample:
	pass

@classnotwrapped
class math_VectorBase:
	pass

@classnotwrapped
class math_PSO:
	pass

@classnotwrapped
class math_TrigonometricFunctionRoots:
	pass

@classnotwrapped
class math_BracketMinimum:
	pass

@classnotwrapped
class math_KronrodSingleIntegration:
	pass

@classnotwrapped
class math_BissecNewton:
	pass

@classnotwrapped
class math_GaussMultipleIntegration:
	pass

@classnotwrapped
class math_FRPR:
	pass

@classnotwrapped
class math_FunctionWithDerivative:
	pass

@classnotwrapped
class math_Function:
	pass

@classnotwrapped
class math_Powell:
	pass

@classnotwrapped
class math_FunctionAllRoots:
	pass

@classnotwrapped
class math_Uzawa:
	pass

@classnotwrapped
class math_NewtonMinimum:
	pass

@classnotwrapped
class math_MultipleVarFunctionWithHessian:
	pass

@classnotwrapped
class math:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
