/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
%define EXPRINTRPDOCSTRING
"ExprIntrp module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_exprintrp.html"
%enddef
%module (package="OCC.Core", docstring=EXPRINTRPDOCSTRING) ExprIntrp


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
#include<ExprIntrp_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Expr_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Expr.i

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
%template(ExprIntrp_ListIteratorOfStackOfGeneralExpression) NCollection_TListIterator<opencascade::handle<Expr_GeneralExpression>>;
%template(ExprIntrp_ListIteratorOfStackOfGeneralRelation) NCollection_TListIterator<opencascade::handle<Expr_GeneralRelation>>;
%template(ExprIntrp_SequenceOfNamedExpression) NCollection_Sequence<opencascade::handle<Expr_NamedExpression>>;

%extend NCollection_Sequence<opencascade::handle<Expr_NamedExpression>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(ExprIntrp_StackOfGeneralExpression) NCollection_List<opencascade::handle<Expr_GeneralExpression>>;

%extend NCollection_List<opencascade::handle<Expr_GeneralExpression>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(ExprIntrp_StackOfGeneralRelation) NCollection_List<opencascade::handle<Expr_GeneralRelation>>;

%extend NCollection_List<opencascade::handle<Expr_GeneralRelation>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_List<opencascade::handle<Expr_GeneralExpression>>::Iterator ExprIntrp_ListIteratorOfStackOfGeneralExpression;
typedef NCollection_List<opencascade::handle<Expr_GeneralRelation>>::Iterator ExprIntrp_ListIteratorOfStackOfGeneralRelation;
typedef NCollection_Sequence<opencascade::handle<Expr_NamedExpression>> ExprIntrp_SequenceOfNamedExpression;
typedef NCollection_List<opencascade::handle<Expr_GeneralExpression>> ExprIntrp_StackOfGeneralExpression;
typedef NCollection_List<opencascade::handle<Expr_GeneralRelation>> ExprIntrp_StackOfGeneralRelation;
/* end typedefs declaration */

/******************
* class ExprIntrp *
******************/
/***************************
* class ExprIntrp_Analysis *
***************************/
/****************************
* class ExprIntrp_Generator *
****************************/
/*************************
* class ExprIntrp_GenExp *
*************************/
/*************************
* class ExprIntrp_GenFct *
*************************/
/*************************
* class ExprIntrp_GenRel *
*************************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class ExprIntrp:
	pass

@classnotwrapped
class ExprIntrp_Analysis:
	pass

@classnotwrapped
class ExprIntrp_GenExp:
	pass

@classnotwrapped
class ExprIntrp_GenFct:
	pass

@classnotwrapped
class ExprIntrp_GenRel:
	pass

@classnotwrapped
class ExprIntrp_Generator:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
