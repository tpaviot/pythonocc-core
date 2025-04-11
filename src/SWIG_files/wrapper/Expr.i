/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
%define EXPRDOCSTRING
"Expr module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_expr.html"
%enddef
%module (package="OCC.Core", docstring=EXPRDOCSTRING) Expr


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
%include ../common/ArrayMacros.i


%{
#include<Expr_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* templates */
%template(Expr_Array1OfGeneralExpression) NCollection_Array1<opencascade::handle<Expr_GeneralExpression>>;
Array1ExtendIter(opencascade::handle<Expr_GeneralExpression>)

%template(Expr_Array1OfNamedUnknown) NCollection_Array1<opencascade::handle<Expr_NamedUnknown>>;
Array1ExtendIter(opencascade::handle<Expr_NamedUnknown>)

%template(Expr_Array1OfSingleRelation) NCollection_Array1<opencascade::handle<Expr_SingleRelation>>;
Array1ExtendIter(opencascade::handle<Expr_SingleRelation>)

%template(Expr_MapOfNamedUnknown) NCollection_IndexedMap<opencascade::handle<Expr_NamedUnknown>>;
%template(Expr_SequenceOfGeneralExpression) NCollection_Sequence<opencascade::handle<Expr_GeneralExpression>>;

%extend NCollection_Sequence<opencascade::handle<Expr_GeneralExpression>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Expr_SequenceOfGeneralRelation) NCollection_Sequence<opencascade::handle<Expr_GeneralRelation>>;

%extend NCollection_Sequence<opencascade::handle<Expr_GeneralRelation>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<opencascade::handle<Expr_GeneralExpression>> Expr_Array1OfGeneralExpression;
typedef NCollection_Array1<opencascade::handle<Expr_NamedUnknown>> Expr_Array1OfNamedUnknown;
typedef NCollection_Array1<opencascade::handle<Expr_SingleRelation>> Expr_Array1OfSingleRelation;
typedef NCollection_IndexedMap<opencascade::handle<Expr_NamedUnknown>> Expr_MapOfNamedUnknown;
typedef NCollection_Sequence<opencascade::handle<Expr_GeneralExpression>> Expr_SequenceOfGeneralExpression;
typedef NCollection_Sequence<opencascade::handle<Expr_GeneralRelation>> Expr_SequenceOfGeneralRelation;
/* end typedefs declaration */

/*************
* class Expr *
*************/
/*******************************
* class Expr_GeneralExpression *
*******************************/
/*****************************
* class Expr_GeneralFunction *
*****************************/
/*****************************
* class Expr_GeneralRelation *
*****************************/
/************************
* class Expr_RUIterator *
************************/
/******************************
* class Expr_RelationIterator *
******************************/
/*****************************
* class Expr_UnknownIterator *
*****************************/
/******************************
* class Expr_BinaryExpression *
******************************/
/********************************
* class Expr_FunctionDerivative *
********************************/
/*****************************
* class Expr_NamedExpression *
*****************************/
/***************************
* class Expr_NamedFunction *
***************************/
/**************************
* class Expr_NumericValue *
**************************/
/****************************
* class Expr_PolyExpression *
****************************/
/****************************
* class Expr_SingleRelation *
****************************/
/****************************
* class Expr_SystemRelation *
****************************/
/*****************************
* class Expr_UnaryExpression *
*****************************/
/**********************
* class Expr_Absolute *
**********************/
/***********************
* class Expr_ArcCosine *
***********************/
/*********************
* class Expr_ArcSine *
*********************/
/************************
* class Expr_ArcTangent *
************************/
/*********************
* class Expr_ArgCosh *
*********************/
/*********************
* class Expr_ArgSinh *
*********************/
/*********************
* class Expr_ArgTanh *
*********************/
/****************************
* class Expr_BinaryFunction *
****************************/
/******************
* class Expr_Cosh *
******************/
/********************
* class Expr_Cosine *
********************/
/************************
* class Expr_Difference *
************************/
/***********************
* class Expr_Different *
***********************/
/**********************
* class Expr_Division *
**********************/
/*******************
* class Expr_Equal *
*******************/
/*************************
* class Expr_Exponential *
*************************/
/**************************
* class Expr_Exponentiate *
**************************/
/*************************
* class Expr_GreaterThan *
*************************/
/********************************
* class Expr_GreaterThanOrEqual *
********************************/
/**********************
* class Expr_LessThan *
**********************/
/*****************************
* class Expr_LessThanOrEqual *
*****************************/
/*********************
* class Expr_LogOf10 *
*********************/
/********************
* class Expr_LogOfe *
********************/
/***************************
* class Expr_NamedConstant *
***************************/
/**************************
* class Expr_NamedUnknown *
**************************/
/**************************
* class Expr_PolyFunction *
**************************/
/*********************
* class Expr_Product *
*********************/
/******************
* class Expr_Sign *
******************/
/******************
* class Expr_Sine *
******************/
/******************
* class Expr_Sinh *
******************/
/********************
* class Expr_Square *
********************/
/************************
* class Expr_SquareRoot *
************************/
/*****************
* class Expr_Sum *
*****************/
/*********************
* class Expr_Tangent *
*********************/
/******************
* class Expr_Tanh *
******************/
/***************************
* class Expr_UnaryFunction *
***************************/
/************************
* class Expr_UnaryMinus *
************************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class Expr:
	pass

@classnotwrapped
class Expr_Absolute:
	pass

@classnotwrapped
class Expr_ArcCosine:
	pass

@classnotwrapped
class Expr_ArcSine:
	pass

@classnotwrapped
class Expr_ArcTangent:
	pass

@classnotwrapped
class Expr_ArgCosh:
	pass

@classnotwrapped
class Expr_ArgSinh:
	pass

@classnotwrapped
class Expr_ArgTanh:
	pass

@classnotwrapped
class Expr_BinaryExpression:
	pass

@classnotwrapped
class Expr_BinaryFunction:
	pass

@classnotwrapped
class Expr_Cosh:
	pass

@classnotwrapped
class Expr_Cosine:
	pass

@classnotwrapped
class Expr_Difference:
	pass

@classnotwrapped
class Expr_Different:
	pass

@classnotwrapped
class Expr_Division:
	pass

@classnotwrapped
class Expr_Equal:
	pass

@classnotwrapped
class Expr_Exponential:
	pass

@classnotwrapped
class Expr_Exponentiate:
	pass

@classnotwrapped
class Expr_FunctionDerivative:
	pass

@classnotwrapped
class Expr_GeneralExpression:
	pass

@classnotwrapped
class Expr_GeneralFunction:
	pass

@classnotwrapped
class Expr_GeneralRelation:
	pass

@classnotwrapped
class Expr_GreaterThan:
	pass

@classnotwrapped
class Expr_GreaterThanOrEqual:
	pass

@classnotwrapped
class Expr_LessThan:
	pass

@classnotwrapped
class Expr_LessThanOrEqual:
	pass

@classnotwrapped
class Expr_LogOf10:
	pass

@classnotwrapped
class Expr_LogOfe:
	pass

@classnotwrapped
class Expr_NamedConstant:
	pass

@classnotwrapped
class Expr_NamedExpression:
	pass

@classnotwrapped
class Expr_NamedFunction:
	pass

@classnotwrapped
class Expr_NamedUnknown:
	pass

@classnotwrapped
class Expr_NumericValue:
	pass

@classnotwrapped
class Expr_PolyExpression:
	pass

@classnotwrapped
class Expr_PolyFunction:
	pass

@classnotwrapped
class Expr_Product:
	pass

@classnotwrapped
class Expr_RUIterator:
	pass

@classnotwrapped
class Expr_RelationIterator:
	pass

@classnotwrapped
class Expr_Sign:
	pass

@classnotwrapped
class Expr_Sine:
	pass

@classnotwrapped
class Expr_SingleRelation:
	pass

@classnotwrapped
class Expr_Sinh:
	pass

@classnotwrapped
class Expr_Square:
	pass

@classnotwrapped
class Expr_SquareRoot:
	pass

@classnotwrapped
class Expr_Sum:
	pass

@classnotwrapped
class Expr_SystemRelation:
	pass

@classnotwrapped
class Expr_Tangent:
	pass

@classnotwrapped
class Expr_Tanh:
	pass

@classnotwrapped
class Expr_UnaryExpression:
	pass

@classnotwrapped
class Expr_UnaryFunction:
	pass

@classnotwrapped
class Expr_UnaryMinus:
	pass

@classnotwrapped
class Expr_UnknownIterator:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
