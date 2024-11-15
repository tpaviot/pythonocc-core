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
%define EXPRDOCSTRING
"Expr module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_expr.html"
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
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColStd.i
%import TCollection.i

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

/* handles */
%wrap_handle(Expr_GeneralExpression)
%wrap_handle(Expr_GeneralFunction)
%wrap_handle(Expr_GeneralRelation)
%wrap_handle(Expr_BinaryExpression)
%wrap_handle(Expr_FunctionDerivative)
%wrap_handle(Expr_NamedExpression)
%wrap_handle(Expr_NamedFunction)
%wrap_handle(Expr_NumericValue)
%wrap_handle(Expr_PolyExpression)
%wrap_handle(Expr_SingleRelation)
%wrap_handle(Expr_SystemRelation)
%wrap_handle(Expr_UnaryExpression)
%wrap_handle(Expr_Absolute)
%wrap_handle(Expr_ArcCosine)
%wrap_handle(Expr_ArcSine)
%wrap_handle(Expr_ArcTangent)
%wrap_handle(Expr_ArgCosh)
%wrap_handle(Expr_ArgSinh)
%wrap_handle(Expr_ArgTanh)
%wrap_handle(Expr_BinaryFunction)
%wrap_handle(Expr_Cosh)
%wrap_handle(Expr_Cosine)
%wrap_handle(Expr_Difference)
%wrap_handle(Expr_Different)
%wrap_handle(Expr_Division)
%wrap_handle(Expr_Equal)
%wrap_handle(Expr_Exponential)
%wrap_handle(Expr_Exponentiate)
%wrap_handle(Expr_GreaterThan)
%wrap_handle(Expr_GreaterThanOrEqual)
%wrap_handle(Expr_LessThan)
%wrap_handle(Expr_LessThanOrEqual)
%wrap_handle(Expr_LogOf10)
%wrap_handle(Expr_LogOfe)
%wrap_handle(Expr_NamedConstant)
%wrap_handle(Expr_NamedUnknown)
%wrap_handle(Expr_PolyFunction)
%wrap_handle(Expr_Product)
%wrap_handle(Expr_Sine)
%wrap_handle(Expr_Sinh)
%wrap_handle(Expr_Square)
%wrap_handle(Expr_SquareRoot)
%wrap_handle(Expr_Sum)
%wrap_handle(Expr_Tangent)
%wrap_handle(Expr_Tanh)
%wrap_handle(Expr_UnaryFunction)
%wrap_handle(Expr_UnaryMinus)
/* end handles declaration */

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
%rename(expr) Expr;
class Expr {
	public:
		/****** Expr::CopyShare ******/
		/****** md5 signature: d48eccb7b89758844acfc25cc647f57e ******/
		%feature("compactdefaultargs") CopyShare;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
No available documentation.
") CopyShare;
		static opencascade::handle<Expr_GeneralExpression> CopyShare(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr::NbOfFreeVariables ******/
		/****** md5 signature: 36d680bf41b499b8369321ad9dee0b84 ******/
		%feature("compactdefaultargs") NbOfFreeVariables;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
int

Description
-----------
No available documentation.
") NbOfFreeVariables;
		static Standard_Integer NbOfFreeVariables(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr::NbOfFreeVariables ******/
		/****** md5 signature: 047e2ea750a39104e0919c01f4310598 ******/
		%feature("compactdefaultargs") NbOfFreeVariables;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralRelation

Return
-------
int

Description
-----------
No available documentation.
") NbOfFreeVariables;
		static Standard_Integer NbOfFreeVariables(const opencascade::handle<Expr_GeneralRelation> & exp);

		/****** Expr::Sign ******/
		/****** md5 signature: af50bfd48660a25f9e0da3bfcfe579d8 ******/
		%feature("compactdefaultargs") Sign;
		%feature("autodoc", "
Parameters
----------
val: float

Return
-------
float

Description
-----------
No available documentation.
") Sign;
		static Standard_Real Sign(const Standard_Real val);

};


%extend Expr {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Expr_GeneralExpression *
*******************************/
%nodefaultctor Expr_GeneralExpression;
class Expr_GeneralExpression : public Standard_Transient {
	public:
		/****** Expr_GeneralExpression::Contains ******/
		/****** md5 signature: 31cab92e606acfecbb683acb8f59676f ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <exp> is contained in <self>.
") Contains;
		virtual Standard_Boolean Contains(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_GeneralExpression::ContainsUnknowns ******/
		/****** md5 signature: fe8bc4584a92957711d27da74f7c8f38 ******/
		%feature("compactdefaultargs") ContainsUnknowns;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tests if <self> contains namedunknowns.
") ContainsUnknowns;
		virtual Standard_Boolean ContainsUnknowns();

		/****** Expr_GeneralExpression::Copy ******/
		/****** md5 signature: b163b65864f2e0a48b494b9d637cfa27 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		virtual opencascade::handle<Expr_GeneralExpression> Copy();

		/****** Expr_GeneralExpression::Derivative ******/
		/****** md5 signature: 169c12333fa969123d334c3458dd9659 ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the derivative on <x> unknown of <self>.
") Derivative;
		virtual opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****** Expr_GeneralExpression::Evaluate ******/
		/****** md5 signature: 1c263047827fe37a8309acaa0d1748ef ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.
") Evaluate;
		virtual Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****** Expr_GeneralExpression::EvaluateNumeric ******/
		/****** md5 signature: e655ba51f3af9f0af0398fde1f6c3a05 ******/
		%feature("compactdefaultargs") EvaluateNumeric;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.
") EvaluateNumeric;
		Standard_Real EvaluateNumeric();

		/****** Expr_GeneralExpression::IsIdentical ******/
		/****** md5 signature: 6e845e0dd031558efec6eef844b102d1 ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
Other: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <self> and <other> define the same expression. warning: this method does not include any simplification before testing. it could also be very slow; to be used carefully.
") IsIdentical;
		virtual Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****** Expr_GeneralExpression::IsLinear ******/
		/****** md5 signature: 5b0102ab4337ebad63f43ab9fc519d87 ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tests if <self> is linear on every namedunknown it contains.
") IsLinear;
		virtual Standard_Boolean IsLinear();

		/****** Expr_GeneralExpression::IsShareable ******/
		/****** md5 signature: 0b89020067d4f33e32c203c0dd92577b ******/
		%feature("compactdefaultargs") IsShareable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tests if <self> can be shared by one or more expressions or must be copied. this method returns false as a default value. to be redefined ( especially for namedunknown).
") IsShareable;
		virtual Standard_Boolean IsShareable();

		/****** Expr_GeneralExpression::NDerivative ******/
		/****** md5 signature: d0cd6821321f2875d0ad6c0a509707e4 ******/
		%feature("compactdefaultargs") NDerivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown
N: int

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the <n>-th derivative on <x> unknown of <self>. raise outofrange if n <= 0.
") NDerivative;
		virtual opencascade::handle<Expr_GeneralExpression> NDerivative(const opencascade::handle<Expr_NamedUnknown> & X, const Standard_Integer N);

		/****** Expr_GeneralExpression::NbSubExpressions ******/
		/****** md5 signature: d80b384932e886f68b503f4fffb23ca5 ******/
		%feature("compactdefaultargs") NbSubExpressions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of sub-expressions contained in <self> ( >= 0).
") NbSubExpressions;
		virtual Standard_Integer NbSubExpressions();

		/****** Expr_GeneralExpression::Replace ******/
		/****** md5 signature: 21a054e81da4e62ac63c7025abefabe3 ******/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "
Parameters
----------
var: Expr_NamedUnknown
with: Expr_GeneralExpression

Return
-------
None

Description
-----------
Replaces all occurrences of <var> with copies of <with> in <self>. copies of <with> are made with the copy() method. raises invalidoperand if <with> contains <self>.
") Replace;
		virtual void Replace(const opencascade::handle<Expr_NamedUnknown> & var, const opencascade::handle<Expr_GeneralExpression> & with);

		/****** Expr_GeneralExpression::ShallowSimplified ******/
		/****** md5 signature: a3d819883b560c025271777b456eecd6 ******/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after a simplification of the arguments of <self>.
") ShallowSimplified;
		virtual opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****** Expr_GeneralExpression::Simplified ******/
		/****** md5 signature: f835bd04e697f4219aee2bcda46f41d7 ******/
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after replacement of namedunknowns by an associated expression and after values computation.
") Simplified;
		virtual opencascade::handle<Expr_GeneralExpression> Simplified();

		/****** Expr_GeneralExpression::String ******/
		/****** md5 signature: d9017ee331ccdefb86321aa3bd5483ad ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		virtual TCollection_AsciiString String();

		/****** Expr_GeneralExpression::SubExpression ******/
		/****** md5 signature: 142336577b7108577c3b4c4a3236df33 ******/
		%feature("compactdefaultargs") SubExpression;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the <i>-th sub-expression of <self> raises outofrange if <i> > nbsubexpressions(me).
") SubExpression;
		virtual const opencascade::handle<Expr_GeneralExpression> & SubExpression(const Standard_Integer I);

};


%make_alias(Expr_GeneralExpression)

%extend Expr_GeneralExpression {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Expr_GeneralFunction *
*****************************/
%nodefaultctor Expr_GeneralFunction;
class Expr_GeneralFunction : public Standard_Transient {
	public:
		/****** Expr_GeneralFunction::Copy ******/
		/****** md5 signature: b86cf4805c2e056091b3f874bcdf1183 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralFunction>

Description
-----------
Returns a copy of <self> with the same form.
") Copy;
		virtual opencascade::handle<Expr_GeneralFunction> Copy();

		/****** Expr_GeneralFunction::Derivative ******/
		/****** md5 signature: 7a2425c3b5cde7b417cd621d5c281381 ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
var: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralFunction>

Description
-----------
Returns derivative of <self> for variable <var>.
") Derivative;
		virtual opencascade::handle<Expr_GeneralFunction> Derivative(const opencascade::handle<Expr_NamedUnknown> & var);

		/****** Expr_GeneralFunction::Derivative ******/
		/****** md5 signature: 2ae1baeef461cfc92beef1aed8c33ab3 ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
var: Expr_NamedUnknown
deg: int

Return
-------
opencascade::handle<Expr_GeneralFunction>

Description
-----------
Returns derivative of <self> for variable <var> with degree <deg>.
") Derivative;
		virtual opencascade::handle<Expr_GeneralFunction> Derivative(const opencascade::handle<Expr_NamedUnknown> & var, const Standard_Integer deg);

		/****** Expr_GeneralFunction::Evaluate ******/
		/****** md5 signature: 1c263047827fe37a8309acaa0d1748ef ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Computes the value of <self> with the given variables. raises notevaluable if <vars> does not match all variables of <self>.
") Evaluate;
		virtual Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****** Expr_GeneralFunction::GetStringName ******/
		/****** md5 signature: eee1f2d436d373d354f09e73253adae0 ******/
		%feature("compactdefaultargs") GetStringName;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") GetStringName;
		virtual TCollection_AsciiString GetStringName();

		/****** Expr_GeneralFunction::IsIdentical ******/
		/****** md5 signature: 27e5ec218c5aeef2bc9718cdbeae5e9a ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
func: Expr_GeneralFunction

Return
-------
bool

Description
-----------
Tests if <self> and <func> are similar functions (same name and same used expression).
") IsIdentical;
		virtual Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralFunction> & func);

		/****** Expr_GeneralFunction::IsLinearOnVariable ******/
		/****** md5 signature: e5fd5c3e3227fa0318b60adc2e010fcc ******/
		%feature("compactdefaultargs") IsLinearOnVariable;
		%feature("autodoc", "
Parameters
----------
index: int

Return
-------
bool

Description
-----------
Tests if <self> is linear on variable on range <index>.
") IsLinearOnVariable;
		virtual Standard_Boolean IsLinearOnVariable(const Standard_Integer index);

		/****** Expr_GeneralFunction::NbOfVariables ******/
		/****** md5 signature: c404ab89688760def89f027a9ad5a60b ******/
		%feature("compactdefaultargs") NbOfVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of variables of <self>.
") NbOfVariables;
		virtual Standard_Integer NbOfVariables();

		/****** Expr_GeneralFunction::Variable ******/
		/****** md5 signature: 2e1d3cff7009f972f33e60a1d60209be ******/
		%feature("compactdefaultargs") Variable;
		%feature("autodoc", "
Parameters
----------
index: int

Return
-------
opencascade::handle<Expr_NamedUnknown>

Description
-----------
Returns the variable denoted by <index> in <self>. raises outofrange if index > nbofvariables.
") Variable;
		virtual opencascade::handle<Expr_NamedUnknown> Variable(const Standard_Integer index);

};


%make_alias(Expr_GeneralFunction)

%extend Expr_GeneralFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Expr_GeneralRelation *
*****************************/
%nodefaultctor Expr_GeneralRelation;
class Expr_GeneralRelation : public Standard_Transient {
	public:
		/****** Expr_GeneralRelation::Contains ******/
		/****** md5 signature: 31cab92e606acfecbb683acb8f59676f ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <exp> contains <var>.
") Contains;
		virtual Standard_Boolean Contains(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_GeneralRelation::Copy ******/
		/****** md5 signature: 32797f10d7966e7f7e5e589c87c53e35 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralRelation>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		virtual opencascade::handle<Expr_GeneralRelation> Copy();

		/****** Expr_GeneralRelation::IsLinear ******/
		/****** md5 signature: 5b0102ab4337ebad63f43ab9fc519d87 ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tests if <self> is linear between its namedunknowns.
") IsLinear;
		virtual Standard_Boolean IsLinear();

		/****** Expr_GeneralRelation::IsSatisfied ******/
		/****** md5 signature: e2fed82b75e36d17062ba6595b0ee8b5 ******/
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the current status of the relation.
") IsSatisfied;
		virtual Standard_Boolean IsSatisfied();

		/****** Expr_GeneralRelation::NbOfSingleRelations ******/
		/****** md5 signature: a2a7f18724bcc4ac714342dc5837f4a7 ******/
		%feature("compactdefaultargs") NbOfSingleRelations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of singlerelations contained in <self>.
") NbOfSingleRelations;
		virtual Standard_Integer NbOfSingleRelations();

		/****** Expr_GeneralRelation::NbOfSubRelations ******/
		/****** md5 signature: f50bdc6a51355e7032bedc85ac540baf ******/
		%feature("compactdefaultargs") NbOfSubRelations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of relations contained in <self>.
") NbOfSubRelations;
		virtual Standard_Integer NbOfSubRelations();

		/****** Expr_GeneralRelation::Replace ******/
		/****** md5 signature: 21a054e81da4e62ac63c7025abefabe3 ******/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "
Parameters
----------
var: Expr_NamedUnknown
with: Expr_GeneralExpression

Return
-------
None

Description
-----------
Replaces all occurrences of <var> with <with> in <self>.
") Replace;
		virtual void Replace(const opencascade::handle<Expr_NamedUnknown> & var, const opencascade::handle<Expr_GeneralExpression> & with);

		/****** Expr_GeneralRelation::Simplified ******/
		/****** md5 signature: f745b8c1c665b5a2e782af7a0da5ede6 ******/
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralRelation>

Description
-----------
Returns a generalrelation after replacement of namedunknowns by an associated expression, and after values computation.
") Simplified;
		virtual opencascade::handle<Expr_GeneralRelation> Simplified();

		/****** Expr_GeneralRelation::Simplify ******/
		/****** md5 signature: f5a963ffa297c796250829f5cf853235 ******/
		%feature("compactdefaultargs") Simplify;
		%feature("autodoc", "Return
-------
None

Description
-----------
Replaces namedunknowns by associated expressions, and computes values in <self>.
") Simplify;
		virtual void Simplify();

		/****** Expr_GeneralRelation::String ******/
		/****** md5 signature: d9017ee331ccdefb86321aa3bd5483ad ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		virtual TCollection_AsciiString String();

		/****** Expr_GeneralRelation::SubRelation ******/
		/****** md5 signature: 091fd623341eb2614469201b4ad02722 ******/
		%feature("compactdefaultargs") SubRelation;
		%feature("autodoc", "
Parameters
----------
index: int

Return
-------
opencascade::handle<Expr_GeneralRelation>

Description
-----------
Returns the relation denoted by <index> in <self>. an exception is raised if <index> is out of range.
") SubRelation;
		virtual opencascade::handle<Expr_GeneralRelation> SubRelation(const Standard_Integer index);

};


%make_alias(Expr_GeneralRelation)

%extend Expr_GeneralRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Expr_RUIterator *
************************/
class Expr_RUIterator {
	public:
		/****** Expr_RUIterator::Expr_RUIterator ******/
		/****** md5 signature: 96a0f76d1cdc7e48c7d9f472035d00b2 ******/
		%feature("compactdefaultargs") Expr_RUIterator;
		%feature("autodoc", "
Parameters
----------
rel: Expr_GeneralRelation

Return
-------
None

Description
-----------
Creates an iterator on every namedunknown contained in <rel>.
") Expr_RUIterator;
		 Expr_RUIterator(const opencascade::handle<Expr_GeneralRelation> & rel);

		/****** Expr_RUIterator::More ******/
		/****** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns false if on other unknown remains.
") More;
		Standard_Boolean More();

		/****** Expr_RUIterator::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next();

		/****** Expr_RUIterator::Value ******/
		/****** md5 signature: f8585997db9a5e8ea8d58782235870b7 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_NamedUnknown>

Description
-----------
Returns current namedunknown. raises exception if no more unknowns remain.
") Value;
		opencascade::handle<Expr_NamedUnknown> Value();

};


%extend Expr_RUIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Expr_RelationIterator *
******************************/
class Expr_RelationIterator {
	public:
		/****** Expr_RelationIterator::Expr_RelationIterator ******/
		/****** md5 signature: 2f911bdfc89b17db47c12012534ae61a ******/
		%feature("compactdefaultargs") Expr_RelationIterator;
		%feature("autodoc", "
Parameters
----------
rel: Expr_GeneralRelation

Return
-------
None

Description
-----------
No available documentation.
") Expr_RelationIterator;
		 Expr_RelationIterator(const opencascade::handle<Expr_GeneralRelation> & rel);

		/****** Expr_RelationIterator::More ******/
		/****** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns false if no other relation remains.
") More;
		Standard_Boolean More();

		/****** Expr_RelationIterator::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next();

		/****** Expr_RelationIterator::Value ******/
		/****** md5 signature: 5220559ff14b6682327b64ff62b3e9ad ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_SingleRelation>

Description
-----------
Returns current basic relation. exception is raised if no more relation remains.
") Value;
		opencascade::handle<Expr_SingleRelation> Value();

};


%extend Expr_RelationIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Expr_UnknownIterator *
*****************************/
class Expr_UnknownIterator {
	public:
		/****** Expr_UnknownIterator::Expr_UnknownIterator ******/
		/****** md5 signature: 07061646201d428fa94e1e8b791d9bc6 ******/
		%feature("compactdefaultargs") Expr_UnknownIterator;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
None

Description
-----------
No available documentation.
") Expr_UnknownIterator;
		 Expr_UnknownIterator(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_UnknownIterator::More ******/
		/****** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		Standard_Boolean More();

		/****** Expr_UnknownIterator::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next();

		/****** Expr_UnknownIterator::Value ******/
		/****** md5 signature: f8585997db9a5e8ea8d58782235870b7 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_NamedUnknown>

Description
-----------
No available documentation.
") Value;
		opencascade::handle<Expr_NamedUnknown> Value();

};


%extend Expr_UnknownIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Expr_BinaryExpression *
******************************/
%nodefaultctor Expr_BinaryExpression;
class Expr_BinaryExpression : public Expr_GeneralExpression {
	public:
		/****** Expr_BinaryExpression::Contains ******/
		/****** md5 signature: 4d3e3a365e28051266a44f7d96eb9917 ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <self> contains <exp>.
") Contains;
		Standard_Boolean Contains(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_BinaryExpression::ContainsUnknowns ******/
		/****** md5 signature: 847c37fd1fdb87ce3fd4b89fbb7d8d46 ******/
		%feature("compactdefaultargs") ContainsUnknowns;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Does <self> contain namedunknown ?.
") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns();

		/****** Expr_BinaryExpression::FirstOperand ******/
		/****** md5 signature: 4d1ac3afe76d92fa3075aa20917b7eb2 ******/
		%feature("compactdefaultargs") FirstOperand;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
No available documentation.
") FirstOperand;
		const opencascade::handle<Expr_GeneralExpression> & FirstOperand();

		/****** Expr_BinaryExpression::NbSubExpressions ******/
		/****** md5 signature: bd59d3a2c33cb431e9b8695901cbe037 ******/
		%feature("compactdefaultargs") NbSubExpressions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of sub-expressions contained in <self> ( >= 0).
") NbSubExpressions;
		Standard_Integer NbSubExpressions();

		/****** Expr_BinaryExpression::Replace ******/
		/****** md5 signature: d1980891db2f275bbc6d54eac796d58d ******/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "
Parameters
----------
var: Expr_NamedUnknown
with: Expr_GeneralExpression

Return
-------
None

Description
-----------
Replaces all occurrences of <var> with <with> in <self>. raises invalidoperand if <with> contains <self>.
") Replace;
		void Replace(const opencascade::handle<Expr_NamedUnknown> & var, const opencascade::handle<Expr_GeneralExpression> & with);

		/****** Expr_BinaryExpression::SecondOperand ******/
		/****** md5 signature: c616b0eb5bc021085ff7b9fb543fd29d ******/
		%feature("compactdefaultargs") SecondOperand;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
No available documentation.
") SecondOperand;
		const opencascade::handle<Expr_GeneralExpression> & SecondOperand();

		/****** Expr_BinaryExpression::SetFirstOperand ******/
		/****** md5 signature: 414b59e7889a2754180ee9b0c6a7ed1c ******/
		%feature("compactdefaultargs") SetFirstOperand;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
None

Description
-----------
Sets first operand of <self> raises invalidoperand if exp = me.
") SetFirstOperand;
		void SetFirstOperand(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_BinaryExpression::SetSecondOperand ******/
		/****** md5 signature: ba8d700e8810c98f38d6c76a3ea7bf34 ******/
		%feature("compactdefaultargs") SetSecondOperand;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
None

Description
-----------
Sets second operand of <self> raises invalidoperand if <exp> contains <self>.
") SetSecondOperand;
		void SetSecondOperand(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_BinaryExpression::Simplified ******/
		/****** md5 signature: 28f32c755b08a477aaaa66888fafbe45 ******/
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after replacement of namedunknowns by an associated expression and after values computation.
") Simplified;
		opencascade::handle<Expr_GeneralExpression> Simplified();

		/****** Expr_BinaryExpression::SubExpression ******/
		/****** md5 signature: da538711b3889bbe62310fe1c52e3fd2 ******/
		%feature("compactdefaultargs") SubExpression;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the <i>-th sub-expression of <self> raises outofrange if <i> > nbsubexpressions(me).
") SubExpression;
		const opencascade::handle<Expr_GeneralExpression> & SubExpression(const Standard_Integer I);

};


%make_alias(Expr_BinaryExpression)

%extend Expr_BinaryExpression {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Expr_FunctionDerivative *
********************************/
class Expr_FunctionDerivative : public Expr_GeneralFunction {
	public:
		/****** Expr_FunctionDerivative::Expr_FunctionDerivative ******/
		/****** md5 signature: 2e9ddaed13911ee38b6b8ff20516f9f7 ******/
		%feature("compactdefaultargs") Expr_FunctionDerivative;
		%feature("autodoc", "
Parameters
----------
func: Expr_GeneralFunction
withX: Expr_NamedUnknown
deg: int

Return
-------
None

Description
-----------
Creates a functionderivative of degree <deg> relative to the <withx> variable. raises outofrange if <deg> lower or equal to zero.
") Expr_FunctionDerivative;
		 Expr_FunctionDerivative(const opencascade::handle<Expr_GeneralFunction> & func, const opencascade::handle<Expr_NamedUnknown> & withX, const Standard_Integer deg);

		/****** Expr_FunctionDerivative::Copy ******/
		/****** md5 signature: f36e6e5f7be603f7eb908df39a6c3a7d ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralFunction>

Description
-----------
Returns a copy of <self> with the same form.
") Copy;
		opencascade::handle<Expr_GeneralFunction> Copy();

		/****** Expr_FunctionDerivative::Degree ******/
		/****** md5 signature: e3276df1ce733e2c8e940db548a26d03 ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the degree of derivation of <self>.
") Degree;
		Standard_Integer Degree();

		/****** Expr_FunctionDerivative::DerivVariable ******/
		/****** md5 signature: 74f206cb98facd5fc0f44138ef5cf3f3 ******/
		%feature("compactdefaultargs") DerivVariable;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_NamedUnknown>

Description
-----------
Returns the derivation variable of <self>.
") DerivVariable;
		opencascade::handle<Expr_NamedUnknown> DerivVariable();

		/****** Expr_FunctionDerivative::Derivative ******/
		/****** md5 signature: 412fa68e0589115a98050f3e9dbd3130 ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
var: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralFunction>

Description
-----------
Returns derivative of <self> for variable <var>.
") Derivative;
		opencascade::handle<Expr_GeneralFunction> Derivative(const opencascade::handle<Expr_NamedUnknown> & var);

		/****** Expr_FunctionDerivative::Derivative ******/
		/****** md5 signature: 40e0677ee3bb33acc2e7435c50229eb7 ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
var: Expr_NamedUnknown
deg: int

Return
-------
opencascade::handle<Expr_GeneralFunction>

Description
-----------
Returns derivative of <self> for variable <var> with degree <deg>.
") Derivative;
		opencascade::handle<Expr_GeneralFunction> Derivative(const opencascade::handle<Expr_NamedUnknown> & var, const Standard_Integer deg);

		/****** Expr_FunctionDerivative::Evaluate ******/
		/****** md5 signature: cc8c16a3ebe1a6688a0b62678d8ecf65 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
values: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Computes the value of <self> with the given variables. raises dimensionmismatch if length(vars) is different from length(values).
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & values);

		/****** Expr_FunctionDerivative::Expression ******/
		/****** md5 signature: 5ca63dd06176a0c3c49989c229b9fbf6 ******/
		%feature("compactdefaultargs") Expression;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
No available documentation.
") Expression;
		opencascade::handle<Expr_GeneralExpression> Expression();

		/****** Expr_FunctionDerivative::Function ******/
		/****** md5 signature: f027f2800a46ad0cf94502538104cf73 ******/
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralFunction>

Description
-----------
Returns the function of which <self> is the derivative.
") Function;
		opencascade::handle<Expr_GeneralFunction> Function();

		/****** Expr_FunctionDerivative::GetStringName ******/
		/****** md5 signature: 6a84152af4e49ae604b0e33ac8f2f4a2 ******/
		%feature("compactdefaultargs") GetStringName;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") GetStringName;
		TCollection_AsciiString GetStringName();

		/****** Expr_FunctionDerivative::IsIdentical ******/
		/****** md5 signature: bb54bc47e414ff54a21664310fb9bc25 ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
func: Expr_GeneralFunction

Return
-------
bool

Description
-----------
Tests if <self> and <func> are similar functions (same name and same used expression).
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralFunction> & func);

		/****** Expr_FunctionDerivative::IsLinearOnVariable ******/
		/****** md5 signature: 587a473c1f08e070e5c0583b9b9b81fd ******/
		%feature("compactdefaultargs") IsLinearOnVariable;
		%feature("autodoc", "
Parameters
----------
index: int

Return
-------
bool

Description
-----------
Tests if <self> is linear on variable on range <index>.
") IsLinearOnVariable;
		Standard_Boolean IsLinearOnVariable(const Standard_Integer index);

		/****** Expr_FunctionDerivative::NbOfVariables ******/
		/****** md5 signature: 3b7291949e1ea6abf8d9ffaf9f506f15 ******/
		%feature("compactdefaultargs") NbOfVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of variables of <self>.
") NbOfVariables;
		Standard_Integer NbOfVariables();

		/****** Expr_FunctionDerivative::UpdateExpression ******/
		/****** md5 signature: 920846d576fe48e51a41d5ce007681ee ******/
		%feature("compactdefaultargs") UpdateExpression;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UpdateExpression;
		void UpdateExpression();

		/****** Expr_FunctionDerivative::Variable ******/
		/****** md5 signature: 0dd774ec75a9b517f5abdc7feceaa26a ******/
		%feature("compactdefaultargs") Variable;
		%feature("autodoc", "
Parameters
----------
index: int

Return
-------
opencascade::handle<Expr_NamedUnknown>

Description
-----------
Returns the variable denoted by <index> in <self>. raises outofrange if <index> greater than nbofvariables of <self>.
") Variable;
		opencascade::handle<Expr_NamedUnknown> Variable(const Standard_Integer index);

};


%make_alias(Expr_FunctionDerivative)

%extend Expr_FunctionDerivative {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Expr_NamedExpression *
*****************************/
%nodefaultctor Expr_NamedExpression;
class Expr_NamedExpression : public Expr_GeneralExpression {
	public:
		/****** Expr_NamedExpression::GetName ******/
		/****** md5 signature: 7e9f481c5e74ef85da5447ebc73bfcfb ******/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") GetName;
		const TCollection_AsciiString & GetName();

		/****** Expr_NamedExpression::IsIdentical ******/
		/****** md5 signature: 887141aa7f58c129eb32231276e0f0fa ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
Other: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****** Expr_NamedExpression::IsShareable ******/
		/****** md5 signature: ae4969db1c26a8dd1e5f841bfcb4c91c ******/
		%feature("compactdefaultargs") IsShareable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tests if <self> can be shared by one or more expressions or must be copied. this method redefines to a true value the generalexpression method.
") IsShareable;
		virtual Standard_Boolean IsShareable();

		/****** Expr_NamedExpression::SetName ******/
		/****** md5 signature: 961c448818ed938d0d41ca6dc539aefb ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
None

Description
-----------
No available documentation.
") SetName;
		void SetName(TCollection_AsciiString name);

		/****** Expr_NamedExpression::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_NamedExpression)

%extend Expr_NamedExpression {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Expr_NamedFunction *
***************************/
class Expr_NamedFunction : public Expr_GeneralFunction {
	public:
		/****** Expr_NamedFunction::Expr_NamedFunction ******/
		/****** md5 signature: 8799d3a2a10f81fbea297f54e8c473e1 ******/
		%feature("compactdefaultargs") Expr_NamedFunction;
		%feature("autodoc", "
Parameters
----------
name: str
exp: Expr_GeneralExpression
vars: Expr_Array1OfNamedUnknown

Return
-------
None

Description
-----------
Creates a function of given variables <vars> with name <name> defined by the expression <exp>.
") Expr_NamedFunction;
		 Expr_NamedFunction(TCollection_AsciiString name, const opencascade::handle<Expr_GeneralExpression> & exp, const Expr_Array1OfNamedUnknown & vars);

		/****** Expr_NamedFunction::Copy ******/
		/****** md5 signature: f36e6e5f7be603f7eb908df39a6c3a7d ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralFunction>

Description
-----------
Returns a copy of <self> with the same form.
") Copy;
		opencascade::handle<Expr_GeneralFunction> Copy();

		/****** Expr_NamedFunction::Derivative ******/
		/****** md5 signature: 412fa68e0589115a98050f3e9dbd3130 ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
var: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralFunction>

Description
-----------
Returns derivative of <self> for variable <var>.
") Derivative;
		opencascade::handle<Expr_GeneralFunction> Derivative(const opencascade::handle<Expr_NamedUnknown> & var);

		/****** Expr_NamedFunction::Derivative ******/
		/****** md5 signature: 40e0677ee3bb33acc2e7435c50229eb7 ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
var: Expr_NamedUnknown
deg: int

Return
-------
opencascade::handle<Expr_GeneralFunction>

Description
-----------
Returns derivative of <self> for variable <var> with degree <deg>.
") Derivative;
		opencascade::handle<Expr_GeneralFunction> Derivative(const opencascade::handle<Expr_NamedUnknown> & var, const Standard_Integer deg);

		/****** Expr_NamedFunction::Evaluate ******/
		/****** md5 signature: cc8c16a3ebe1a6688a0b62678d8ecf65 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
values: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Computes the value of <self> with the given variables. raises dimensionmismatch if length(vars) is different from length(values).
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & values);

		/****** Expr_NamedFunction::Expression ******/
		/****** md5 signature: 5ca63dd06176a0c3c49989c229b9fbf6 ******/
		%feature("compactdefaultargs") Expression;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns equivalent expression of <self>.
") Expression;
		opencascade::handle<Expr_GeneralExpression> Expression();

		/****** Expr_NamedFunction::GetName ******/
		/****** md5 signature: 098fcb2e74ace7a58df723e39192378f ******/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns the name assigned to <self>.
") GetName;
		TCollection_AsciiString GetName();

		/****** Expr_NamedFunction::GetStringName ******/
		/****** md5 signature: 6a84152af4e49ae604b0e33ac8f2f4a2 ******/
		%feature("compactdefaultargs") GetStringName;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") GetStringName;
		TCollection_AsciiString GetStringName();

		/****** Expr_NamedFunction::IsIdentical ******/
		/****** md5 signature: bb54bc47e414ff54a21664310fb9bc25 ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
func: Expr_GeneralFunction

Return
-------
bool

Description
-----------
Tests if <self> and <func> are similar functions (same name and same used expression).
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralFunction> & func);

		/****** Expr_NamedFunction::IsLinearOnVariable ******/
		/****** md5 signature: 587a473c1f08e070e5c0583b9b9b81fd ******/
		%feature("compactdefaultargs") IsLinearOnVariable;
		%feature("autodoc", "
Parameters
----------
index: int

Return
-------
bool

Description
-----------
Tests if <self> is linear on variable on range <index>.
") IsLinearOnVariable;
		Standard_Boolean IsLinearOnVariable(const Standard_Integer index);

		/****** Expr_NamedFunction::NbOfVariables ******/
		/****** md5 signature: 3b7291949e1ea6abf8d9ffaf9f506f15 ******/
		%feature("compactdefaultargs") NbOfVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of variables of <self>.
") NbOfVariables;
		Standard_Integer NbOfVariables();

		/****** Expr_NamedFunction::SetExpression ******/
		/****** md5 signature: de7a5ac287b97599e049e91fa920a484 ******/
		%feature("compactdefaultargs") SetExpression;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
None

Description
-----------
Modifies expression of <self>. warning: beware of derivatives. see functionderivative.
") SetExpression;
		void SetExpression(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_NamedFunction::SetName ******/
		/****** md5 signature: 8529c8f1140dc6e77e0918ed884f85a2 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
newname: str

Return
-------
None

Description
-----------
Sets the name <newname> to <self>.
") SetName;
		void SetName(TCollection_AsciiString newname);

		/****** Expr_NamedFunction::Variable ******/
		/****** md5 signature: 0dd774ec75a9b517f5abdc7feceaa26a ******/
		%feature("compactdefaultargs") Variable;
		%feature("autodoc", "
Parameters
----------
index: int

Return
-------
opencascade::handle<Expr_NamedUnknown>

Description
-----------
Returns the variable denoted by <index> in <self>. raises outofrange if <index> is greater than nbofvariables of <self>, or less than or equal to zero.
") Variable;
		opencascade::handle<Expr_NamedUnknown> Variable(const Standard_Integer index);

};


%make_alias(Expr_NamedFunction)

%extend Expr_NamedFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Expr_NumericValue *
**************************/
class Expr_NumericValue : public Expr_GeneralExpression {
	public:
		/****** Expr_NumericValue::Expr_NumericValue ******/
		/****** md5 signature: 9b95df436c4a29758583ad509b238ccc ******/
		%feature("compactdefaultargs") Expr_NumericValue;
		%feature("autodoc", "
Parameters
----------
val: float

Return
-------
None

Description
-----------
No available documentation.
") Expr_NumericValue;
		 Expr_NumericValue(const Standard_Real val);

		/****** Expr_NumericValue::Contains ******/
		/****** md5 signature: 4d3e3a365e28051266a44f7d96eb9917 ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <exp> is contained in <self>.
") Contains;
		Standard_Boolean Contains(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_NumericValue::ContainsUnknowns ******/
		/****** md5 signature: 847c37fd1fdb87ce3fd4b89fbb7d8d46 ******/
		%feature("compactdefaultargs") ContainsUnknowns;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tests if <self> contains namedunknown.
") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns();

		/****** Expr_NumericValue::Copy ******/
		/****** md5 signature: 959911c21ab8344ca7df9189a97166b1 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****** Expr_NumericValue::Derivative ******/
		/****** md5 signature: 270fc2b9646e490f90b1b721eeed146d ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the derivative on <x> unknown of <self>.
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****** Expr_NumericValue::Evaluate ******/
		/****** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Returns the value of <self> (as a real) by replacement of <vars> by <vals>.
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****** Expr_NumericValue::GetValue ******/
		/****** md5 signature: 2863c7a566efd7be6530d131f7f2cf29 ******/
		%feature("compactdefaultargs") GetValue;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") GetValue;
		Standard_Real GetValue();

		/****** Expr_NumericValue::IsIdentical ******/
		/****** md5 signature: 887141aa7f58c129eb32231276e0f0fa ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
Other: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****** Expr_NumericValue::IsLinear ******/
		/****** md5 signature: 5e125c70746046ac726ed804bbbf922f ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsLinear;
		Standard_Boolean IsLinear();

		/****** Expr_NumericValue::NDerivative ******/
		/****** md5 signature: 64fe21d732fcfe80f37aea7c134ab146 ******/
		%feature("compactdefaultargs") NDerivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown
N: int

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the <n>-th derivative on <x> unknown of <self>. raises outofrange if <n> <= 0.
") NDerivative;
		virtual opencascade::handle<Expr_GeneralExpression> NDerivative(const opencascade::handle<Expr_NamedUnknown> & X, const Standard_Integer N);

		/****** Expr_NumericValue::NbSubExpressions ******/
		/****** md5 signature: bd59d3a2c33cb431e9b8695901cbe037 ******/
		%feature("compactdefaultargs") NbSubExpressions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of sub-expressions contained in <self> ( >= 0).
") NbSubExpressions;
		Standard_Integer NbSubExpressions();

		/****** Expr_NumericValue::Replace ******/
		/****** md5 signature: d1980891db2f275bbc6d54eac796d58d ******/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "
Parameters
----------
var: Expr_NamedUnknown
with: Expr_GeneralExpression

Return
-------
None

Description
-----------
Replaces all occurrences of <var> with <with> in <self>.
") Replace;
		void Replace(const opencascade::handle<Expr_NamedUnknown> & var, const opencascade::handle<Expr_GeneralExpression> & with);

		/****** Expr_NumericValue::SetValue ******/
		/****** md5 signature: 306d5cb5d7430ef039d57c40b0690d07 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
val: float

Return
-------
None

Description
-----------
No available documentation.
") SetValue;
		void SetValue(const Standard_Real val);

		/****** Expr_NumericValue::ShallowSimplified ******/
		/****** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ******/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after a simplification of the arguments of <self>.
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****** Expr_NumericValue::Simplified ******/
		/****** md5 signature: 28f32c755b08a477aaaa66888fafbe45 ******/
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after replacement of namedunknowns by an associated expression and after values computation.
") Simplified;
		opencascade::handle<Expr_GeneralExpression> Simplified();

		/****** Expr_NumericValue::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

		/****** Expr_NumericValue::SubExpression ******/
		/****** md5 signature: da538711b3889bbe62310fe1c52e3fd2 ******/
		%feature("compactdefaultargs") SubExpression;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the <i>-th sub-expression of <self> raises outofrange if <i> > nbsubexpressions(me).
") SubExpression;
		const opencascade::handle<Expr_GeneralExpression> & SubExpression(const Standard_Integer I);

};


%make_alias(Expr_NumericValue)

%extend Expr_NumericValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Expr_PolyExpression *
****************************/
%nodefaultctor Expr_PolyExpression;
class Expr_PolyExpression : public Expr_GeneralExpression {
	public:
		/****** Expr_PolyExpression::Contains ******/
		/****** md5 signature: 4d3e3a365e28051266a44f7d96eb9917 ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <exp> is contained in <self>.
") Contains;
		Standard_Boolean Contains(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_PolyExpression::ContainsUnknowns ******/
		/****** md5 signature: 847c37fd1fdb87ce3fd4b89fbb7d8d46 ******/
		%feature("compactdefaultargs") ContainsUnknowns;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Does <self> contains namedunknown ?.
") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns();

		/****** Expr_PolyExpression::NbOperands ******/
		/****** md5 signature: 1c135bc4d655185cc7d2ed79e42524fd ******/
		%feature("compactdefaultargs") NbOperands;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of operands contained in <self>.
") NbOperands;
		Standard_Integer NbOperands();

		/****** Expr_PolyExpression::NbSubExpressions ******/
		/****** md5 signature: bd59d3a2c33cb431e9b8695901cbe037 ******/
		%feature("compactdefaultargs") NbSubExpressions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of sub-expressions contained in <self> ( >= 2).
") NbSubExpressions;
		Standard_Integer NbSubExpressions();

		/****** Expr_PolyExpression::Operand ******/
		/****** md5 signature: 56c0f61d871217605549e8c156dec152 ******/
		%feature("compactdefaultargs") Operand;
		%feature("autodoc", "
Parameters
----------
index: int

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the <index>-th operand used in <self>. an exception is raised if index is out of range.
") Operand;
		const opencascade::handle<Expr_GeneralExpression> & Operand(const Standard_Integer index);

		/****** Expr_PolyExpression::Replace ******/
		/****** md5 signature: d1980891db2f275bbc6d54eac796d58d ******/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "
Parameters
----------
var: Expr_NamedUnknown
with: Expr_GeneralExpression

Return
-------
None

Description
-----------
Replaces all occurrences of <var> with <with> in <self> raises invalidoperand if <with> contains <self>.
") Replace;
		void Replace(const opencascade::handle<Expr_NamedUnknown> & var, const opencascade::handle<Expr_GeneralExpression> & with);

		/****** Expr_PolyExpression::SetOperand ******/
		/****** md5 signature: 408363eed76d555c4e732a12851b2338 ******/
		%feature("compactdefaultargs") SetOperand;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression
index: int

Return
-------
None

Description
-----------
Sets the <index>-th operand used in <self>. an exception is raised if <index> is out of range raises invalidoperand if <exp> contains <self>.
") SetOperand;
		void SetOperand(const opencascade::handle<Expr_GeneralExpression> & exp, const Standard_Integer index);

		/****** Expr_PolyExpression::Simplified ******/
		/****** md5 signature: 28f32c755b08a477aaaa66888fafbe45 ******/
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after replacement of namedunknowns by an associated expression and after values computation.
") Simplified;
		opencascade::handle<Expr_GeneralExpression> Simplified();

		/****** Expr_PolyExpression::SubExpression ******/
		/****** md5 signature: da538711b3889bbe62310fe1c52e3fd2 ******/
		%feature("compactdefaultargs") SubExpression;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the sub-expression denoted by <i> in <self> raises outofrange if <i> > nbsubexpressions(me).
") SubExpression;
		const opencascade::handle<Expr_GeneralExpression> & SubExpression(const Standard_Integer I);

};


%make_alias(Expr_PolyExpression)

%extend Expr_PolyExpression {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Expr_SingleRelation *
****************************/
%nodefaultctor Expr_SingleRelation;
class Expr_SingleRelation : public Expr_GeneralRelation {
	public:
		/****** Expr_SingleRelation::Contains ******/
		/****** md5 signature: 4d3e3a365e28051266a44f7d96eb9917 ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <self> contains <exp>.
") Contains;
		Standard_Boolean Contains(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_SingleRelation::FirstMember ******/
		/****** md5 signature: 44c63ad073e601781abda385cb63949b ******/
		%feature("compactdefaultargs") FirstMember;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the first member of the relation.
") FirstMember;
		opencascade::handle<Expr_GeneralExpression> FirstMember();

		/****** Expr_SingleRelation::IsLinear ******/
		/****** md5 signature: 5e125c70746046ac726ed804bbbf922f ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tests if <self> is linear between its namedunknowns.
") IsLinear;
		Standard_Boolean IsLinear();

		/****** Expr_SingleRelation::NbOfSingleRelations ******/
		/****** md5 signature: cb5c71421de80d5ccb13ce9b0cfa7e6e ******/
		%feature("compactdefaultargs") NbOfSingleRelations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of singlerelations contained in <self> (always 1).
") NbOfSingleRelations;
		Standard_Integer NbOfSingleRelations();

		/****** Expr_SingleRelation::NbOfSubRelations ******/
		/****** md5 signature: eba32d2d912705cec016dd6df3b971e5 ******/
		%feature("compactdefaultargs") NbOfSubRelations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of relations contained in <self>.
") NbOfSubRelations;
		Standard_Integer NbOfSubRelations();

		/****** Expr_SingleRelation::Replace ******/
		/****** md5 signature: d1980891db2f275bbc6d54eac796d58d ******/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "
Parameters
----------
var: Expr_NamedUnknown
with: Expr_GeneralExpression

Return
-------
None

Description
-----------
Replaces all occurrences of <var> with <with> in <self>.
") Replace;
		void Replace(const opencascade::handle<Expr_NamedUnknown> & var, const opencascade::handle<Expr_GeneralExpression> & with);

		/****** Expr_SingleRelation::SecondMember ******/
		/****** md5 signature: 0e1d8e90484bf116cebde74548208f18 ******/
		%feature("compactdefaultargs") SecondMember;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the second member of the relation.
") SecondMember;
		opencascade::handle<Expr_GeneralExpression> SecondMember();

		/****** Expr_SingleRelation::SetFirstMember ******/
		/****** md5 signature: 3e78fe28f0b4bdf48efb91f8ab6266eb ******/
		%feature("compactdefaultargs") SetFirstMember;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
None

Description
-----------
Defines the first member of the relation.
") SetFirstMember;
		void SetFirstMember(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_SingleRelation::SetSecondMember ******/
		/****** md5 signature: 105a1b58a4071c5b0a77e95a44dcf7cc ******/
		%feature("compactdefaultargs") SetSecondMember;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
None

Description
-----------
Defines the second member of the relation.
") SetSecondMember;
		void SetSecondMember(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_SingleRelation::SubRelation ******/
		/****** md5 signature: e582dddebeec4d0519b16bf1ca106be8 ******/
		%feature("compactdefaultargs") SubRelation;
		%feature("autodoc", "
Parameters
----------
index: int

Return
-------
opencascade::handle<Expr_GeneralRelation>

Description
-----------
Returns the relation denoted by <index> in <self>. an exception is raised if index is out of range.
") SubRelation;
		opencascade::handle<Expr_GeneralRelation> SubRelation(const Standard_Integer index);

};


%make_alias(Expr_SingleRelation)

%extend Expr_SingleRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Expr_SystemRelation *
****************************/
class Expr_SystemRelation : public Expr_GeneralRelation {
	public:
		/****** Expr_SystemRelation::Expr_SystemRelation ******/
		/****** md5 signature: f465667b503f538c320345cf4d7ad2ae ******/
		%feature("compactdefaultargs") Expr_SystemRelation;
		%feature("autodoc", "
Parameters
----------
relation: Expr_GeneralRelation

Return
-------
None

Description
-----------
Creates a system with one relation.
") Expr_SystemRelation;
		 Expr_SystemRelation(const opencascade::handle<Expr_GeneralRelation> & relation);

		/****** Expr_SystemRelation::Add ******/
		/****** md5 signature: cfb935b2e1b03d830fe75a521740f7db ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
relation: Expr_GeneralRelation

Return
-------
None

Description
-----------
Appends <relation> in the list of components of <self>.
") Add;
		void Add(const opencascade::handle<Expr_GeneralRelation> & relation);

		/****** Expr_SystemRelation::Contains ******/
		/****** md5 signature: 4d3e3a365e28051266a44f7d96eb9917 ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <self> contains <exp>.
") Contains;
		Standard_Boolean Contains(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_SystemRelation::Copy ******/
		/****** md5 signature: 4fb077f1759a1cc123427f28e5b2aaa7 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralRelation>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralRelation> Copy();

		/****** Expr_SystemRelation::IsLinear ******/
		/****** md5 signature: 5e125c70746046ac726ed804bbbf922f ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tests if <self> is linear between its namedunknowns.
") IsLinear;
		Standard_Boolean IsLinear();

		/****** Expr_SystemRelation::IsSatisfied ******/
		/****** md5 signature: 29fd56dcca3d0f68d00dfd4c1a7b3ff7 ******/
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsSatisfied;
		Standard_Boolean IsSatisfied();

		/****** Expr_SystemRelation::NbOfSingleRelations ******/
		/****** md5 signature: cb5c71421de80d5ccb13ce9b0cfa7e6e ******/
		%feature("compactdefaultargs") NbOfSingleRelations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of singlerelations contained in <self>.
") NbOfSingleRelations;
		Standard_Integer NbOfSingleRelations();

		/****** Expr_SystemRelation::NbOfSubRelations ******/
		/****** md5 signature: eba32d2d912705cec016dd6df3b971e5 ******/
		%feature("compactdefaultargs") NbOfSubRelations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of relations contained in <self>.
") NbOfSubRelations;
		Standard_Integer NbOfSubRelations();

		/****** Expr_SystemRelation::Remove ******/
		/****** md5 signature: a7c10b6896c791e5e6977f46cc817c9c ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
relation: Expr_GeneralRelation

Return
-------
None

Description
-----------
No available documentation.
") Remove;
		void Remove(const opencascade::handle<Expr_GeneralRelation> & relation);

		/****** Expr_SystemRelation::Replace ******/
		/****** md5 signature: d1980891db2f275bbc6d54eac796d58d ******/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "
Parameters
----------
var: Expr_NamedUnknown
with: Expr_GeneralExpression

Return
-------
None

Description
-----------
Replaces all occurrences of <var> with <with> in <self>.
") Replace;
		void Replace(const opencascade::handle<Expr_NamedUnknown> & var, const opencascade::handle<Expr_GeneralExpression> & with);

		/****** Expr_SystemRelation::Simplified ******/
		/****** md5 signature: 9b1cc1e39bd9e0a60af88b21f44eb44c ******/
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralRelation>

Description
-----------
Returns a generalrelation after replacement of namedunknowns by an associated expression, and after values computation.
") Simplified;
		opencascade::handle<Expr_GeneralRelation> Simplified();

		/****** Expr_SystemRelation::Simplify ******/
		/****** md5 signature: d448a44dccfa01a406e4283570ba001f ******/
		%feature("compactdefaultargs") Simplify;
		%feature("autodoc", "Return
-------
None

Description
-----------
Replaces namedunknowns by associated expressions, and computes values in <self>.
") Simplify;
		void Simplify();

		/****** Expr_SystemRelation::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

		/****** Expr_SystemRelation::SubRelation ******/
		/****** md5 signature: e582dddebeec4d0519b16bf1ca106be8 ******/
		%feature("compactdefaultargs") SubRelation;
		%feature("autodoc", "
Parameters
----------
index: int

Return
-------
opencascade::handle<Expr_GeneralRelation>

Description
-----------
Returns the relation denoted by <index> in <self>. an exception is raised if <index> is out of range.
") SubRelation;
		opencascade::handle<Expr_GeneralRelation> SubRelation(const Standard_Integer index);

};


%make_alias(Expr_SystemRelation)

%extend Expr_SystemRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Expr_UnaryExpression *
*****************************/
%nodefaultctor Expr_UnaryExpression;
class Expr_UnaryExpression : public Expr_GeneralExpression {
	public:
		/****** Expr_UnaryExpression::Contains ******/
		/****** md5 signature: 4d3e3a365e28051266a44f7d96eb9917 ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <exp> is contained in <self>.
") Contains;
		Standard_Boolean Contains(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_UnaryExpression::ContainsUnknowns ******/
		/****** md5 signature: 847c37fd1fdb87ce3fd4b89fbb7d8d46 ******/
		%feature("compactdefaultargs") ContainsUnknowns;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Does <self> contains namedunknown ?.
") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns();

		/****** Expr_UnaryExpression::NbSubExpressions ******/
		/****** md5 signature: bd59d3a2c33cb431e9b8695901cbe037 ******/
		%feature("compactdefaultargs") NbSubExpressions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of sub-expressions contained in <self> ( >= 0).
") NbSubExpressions;
		Standard_Integer NbSubExpressions();

		/****** Expr_UnaryExpression::Operand ******/
		/****** md5 signature: 2ec68075618c40cd1ee25981c9447c9a ******/
		%feature("compactdefaultargs") Operand;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the operand used.
") Operand;
		const opencascade::handle<Expr_GeneralExpression> & Operand();

		/****** Expr_UnaryExpression::Replace ******/
		/****** md5 signature: d1980891db2f275bbc6d54eac796d58d ******/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "
Parameters
----------
var: Expr_NamedUnknown
with: Expr_GeneralExpression

Return
-------
None

Description
-----------
Replaces all occurrences of <var> with <with> in <self> raises invalidoperand if <with> contains <self>.
") Replace;
		void Replace(const opencascade::handle<Expr_NamedUnknown> & var, const opencascade::handle<Expr_GeneralExpression> & with);

		/****** Expr_UnaryExpression::SetOperand ******/
		/****** md5 signature: 9f138059ef15077dd47814c890174a5e ******/
		%feature("compactdefaultargs") SetOperand;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
None

Description
-----------
Sets the operand used raises invalidoperand if <exp> contains <self>.
") SetOperand;
		void SetOperand(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_UnaryExpression::Simplified ******/
		/****** md5 signature: 28f32c755b08a477aaaa66888fafbe45 ******/
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after replacement of namedunknowns by an associated expression, and after values computation.
") Simplified;
		opencascade::handle<Expr_GeneralExpression> Simplified();

		/****** Expr_UnaryExpression::SubExpression ******/
		/****** md5 signature: da538711b3889bbe62310fe1c52e3fd2 ******/
		%feature("compactdefaultargs") SubExpression;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the <i>-th sub-expression of <self>. raises outofrange if <i> > nbsubexpressions(me).
") SubExpression;
		const opencascade::handle<Expr_GeneralExpression> & SubExpression(const Standard_Integer I);

};


%make_alias(Expr_UnaryExpression)

%extend Expr_UnaryExpression {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Expr_Absolute *
**********************/
class Expr_Absolute : public Expr_UnaryExpression {
	public:
		/****** Expr_Absolute::Expr_Absolute ******/
		/****** md5 signature: 4f88f5738533f59cd3a528e0cab57f17 ******/
		%feature("compactdefaultargs") Expr_Absolute;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
None

Description
-----------
Creates the abs of <exp>.
") Expr_Absolute;
		 Expr_Absolute(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_Absolute::Copy ******/
		/****** md5 signature: 959911c21ab8344ca7df9189a97166b1 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****** Expr_Absolute::Derivative ******/
		/****** md5 signature: 270fc2b9646e490f90b1b721eeed146d ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the derivative on <x> unknown of <self>.
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****** Expr_Absolute::Evaluate ******/
		/****** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****** Expr_Absolute::IsIdentical ******/
		/****** md5 signature: 887141aa7f58c129eb32231276e0f0fa ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
Other: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****** Expr_Absolute::IsLinear ******/
		/****** md5 signature: 5e125c70746046ac726ed804bbbf922f ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsLinear;
		Standard_Boolean IsLinear();

		/****** Expr_Absolute::ShallowSimplified ******/
		/****** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ******/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after a simplification of the arguments of <self>.
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****** Expr_Absolute::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_Absolute)

%extend Expr_Absolute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Expr_ArcCosine *
***********************/
class Expr_ArcCosine : public Expr_UnaryExpression {
	public:
		/****** Expr_ArcCosine::Expr_ArcCosine ******/
		/****** md5 signature: eaa9e1f0788193eed77d3d083e840ed5 ******/
		%feature("compactdefaultargs") Expr_ArcCosine;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
None

Description
-----------
Creates the arccos of <exp>.
") Expr_ArcCosine;
		 Expr_ArcCosine(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_ArcCosine::Copy ******/
		/****** md5 signature: 959911c21ab8344ca7df9189a97166b1 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****** Expr_ArcCosine::Derivative ******/
		/****** md5 signature: 270fc2b9646e490f90b1b721eeed146d ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the derivative on <x> unknown of <self>.
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****** Expr_ArcCosine::Evaluate ******/
		/****** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****** Expr_ArcCosine::IsIdentical ******/
		/****** md5 signature: 887141aa7f58c129eb32231276e0f0fa ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
Other: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****** Expr_ArcCosine::IsLinear ******/
		/****** md5 signature: 5e125c70746046ac726ed804bbbf922f ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsLinear;
		Standard_Boolean IsLinear();

		/****** Expr_ArcCosine::ShallowSimplified ******/
		/****** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ******/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after a simplification of the arguments of <self>.
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****** Expr_ArcCosine::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_ArcCosine)

%extend Expr_ArcCosine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Expr_ArcSine *
*********************/
class Expr_ArcSine : public Expr_UnaryExpression {
	public:
		/****** Expr_ArcSine::Expr_ArcSine ******/
		/****** md5 signature: 3cf7b8a1b68c1be8ae0a807d93859b10 ******/
		%feature("compactdefaultargs") Expr_ArcSine;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
None

Description
-----------
Creates the arcsin of <exp>.
") Expr_ArcSine;
		 Expr_ArcSine(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_ArcSine::Copy ******/
		/****** md5 signature: 959911c21ab8344ca7df9189a97166b1 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****** Expr_ArcSine::Derivative ******/
		/****** md5 signature: 270fc2b9646e490f90b1b721eeed146d ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the derivative on <x> unknown of <self>.
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****** Expr_ArcSine::Evaluate ******/
		/****** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****** Expr_ArcSine::IsIdentical ******/
		/****** md5 signature: 887141aa7f58c129eb32231276e0f0fa ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
Other: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****** Expr_ArcSine::IsLinear ******/
		/****** md5 signature: 5e125c70746046ac726ed804bbbf922f ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsLinear;
		Standard_Boolean IsLinear();

		/****** Expr_ArcSine::ShallowSimplified ******/
		/****** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ******/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after a simplification of the arguments of <self>.
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****** Expr_ArcSine::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_ArcSine)

%extend Expr_ArcSine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Expr_ArcTangent *
************************/
class Expr_ArcTangent : public Expr_UnaryExpression {
	public:
		/****** Expr_ArcTangent::Expr_ArcTangent ******/
		/****** md5 signature: a3eb3787eb87136cc56e987d24cc9a37 ******/
		%feature("compactdefaultargs") Expr_ArcTangent;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
None

Description
-----------
Creates the arctan of <exp>.
") Expr_ArcTangent;
		 Expr_ArcTangent(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_ArcTangent::Copy ******/
		/****** md5 signature: 959911c21ab8344ca7df9189a97166b1 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****** Expr_ArcTangent::Derivative ******/
		/****** md5 signature: 270fc2b9646e490f90b1b721eeed146d ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the derivative on <x> unknown of <self>.
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****** Expr_ArcTangent::Evaluate ******/
		/****** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****** Expr_ArcTangent::IsIdentical ******/
		/****** md5 signature: 887141aa7f58c129eb32231276e0f0fa ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
Other: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****** Expr_ArcTangent::IsLinear ******/
		/****** md5 signature: 5e125c70746046ac726ed804bbbf922f ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsLinear;
		Standard_Boolean IsLinear();

		/****** Expr_ArcTangent::ShallowSimplified ******/
		/****** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ******/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after a simplification of the arguments of <self>.
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****** Expr_ArcTangent::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_ArcTangent)

%extend Expr_ArcTangent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Expr_ArgCosh *
*********************/
class Expr_ArgCosh : public Expr_UnaryExpression {
	public:
		/****** Expr_ArgCosh::Expr_ArgCosh ******/
		/****** md5 signature: 14f819e10ed1bfdefe30d23bf0a2f76f ******/
		%feature("compactdefaultargs") Expr_ArgCosh;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
None

Description
-----------
Creates the argcosh of <exp>.
") Expr_ArgCosh;
		 Expr_ArgCosh(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_ArgCosh::Copy ******/
		/****** md5 signature: 959911c21ab8344ca7df9189a97166b1 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****** Expr_ArgCosh::Derivative ******/
		/****** md5 signature: 270fc2b9646e490f90b1b721eeed146d ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the derivative on <x> unknown of <self>.
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****** Expr_ArgCosh::Evaluate ******/
		/****** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****** Expr_ArgCosh::IsIdentical ******/
		/****** md5 signature: 887141aa7f58c129eb32231276e0f0fa ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
Other: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****** Expr_ArgCosh::IsLinear ******/
		/****** md5 signature: 5e125c70746046ac726ed804bbbf922f ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsLinear;
		Standard_Boolean IsLinear();

		/****** Expr_ArgCosh::ShallowSimplified ******/
		/****** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ******/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after a simplification of the arguments of <self>.
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****** Expr_ArgCosh::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_ArgCosh)

%extend Expr_ArgCosh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Expr_ArgSinh *
*********************/
class Expr_ArgSinh : public Expr_UnaryExpression {
	public:
		/****** Expr_ArgSinh::Expr_ArgSinh ******/
		/****** md5 signature: becca13accec494f7b943a1b72421c00 ******/
		%feature("compactdefaultargs") Expr_ArgSinh;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
None

Description
-----------
Creates the argsinh of <exp>.
") Expr_ArgSinh;
		 Expr_ArgSinh(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_ArgSinh::Copy ******/
		/****** md5 signature: 959911c21ab8344ca7df9189a97166b1 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****** Expr_ArgSinh::Derivative ******/
		/****** md5 signature: 270fc2b9646e490f90b1b721eeed146d ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the derivative on <x> unknown of <self>.
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****** Expr_ArgSinh::Evaluate ******/
		/****** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****** Expr_ArgSinh::IsIdentical ******/
		/****** md5 signature: 887141aa7f58c129eb32231276e0f0fa ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
Other: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****** Expr_ArgSinh::IsLinear ******/
		/****** md5 signature: 5e125c70746046ac726ed804bbbf922f ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsLinear;
		Standard_Boolean IsLinear();

		/****** Expr_ArgSinh::ShallowSimplified ******/
		/****** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ******/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after a simplification of the arguments of <self>.
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****** Expr_ArgSinh::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_ArgSinh)

%extend Expr_ArgSinh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Expr_ArgTanh *
*********************/
class Expr_ArgTanh : public Expr_UnaryExpression {
	public:
		/****** Expr_ArgTanh::Expr_ArgTanh ******/
		/****** md5 signature: 93f59eda6ff9f11f6a1e9cdeb688d8bc ******/
		%feature("compactdefaultargs") Expr_ArgTanh;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
None

Description
-----------
Creates the argtanh of <exp>.
") Expr_ArgTanh;
		 Expr_ArgTanh(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_ArgTanh::Copy ******/
		/****** md5 signature: 959911c21ab8344ca7df9189a97166b1 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****** Expr_ArgTanh::Derivative ******/
		/****** md5 signature: 270fc2b9646e490f90b1b721eeed146d ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the derivative on <x> unknown of <self>.
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****** Expr_ArgTanh::Evaluate ******/
		/****** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****** Expr_ArgTanh::IsIdentical ******/
		/****** md5 signature: 887141aa7f58c129eb32231276e0f0fa ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
Other: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****** Expr_ArgTanh::IsLinear ******/
		/****** md5 signature: 5e125c70746046ac726ed804bbbf922f ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsLinear;
		Standard_Boolean IsLinear();

		/****** Expr_ArgTanh::ShallowSimplified ******/
		/****** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ******/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after a simplification of the arguments of <self>.
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****** Expr_ArgTanh::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_ArgTanh)

%extend Expr_ArgTanh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Expr_BinaryFunction *
****************************/
class Expr_BinaryFunction : public Expr_BinaryExpression {
	public:
		/****** Expr_BinaryFunction::Expr_BinaryFunction ******/
		/****** md5 signature: 78aaf8975a3ff50150348f7d72c5ea2f ******/
		%feature("compactdefaultargs") Expr_BinaryFunction;
		%feature("autodoc", "
Parameters
----------
func: Expr_GeneralFunction
exp1: Expr_GeneralExpression
exp2: Expr_GeneralExpression

Return
-------
None

Description
-----------
Creates <self> as <func> (<exp1>,<exp2>). raises exception if <func> is not binary.
") Expr_BinaryFunction;
		 Expr_BinaryFunction(const opencascade::handle<Expr_GeneralFunction> & func, const opencascade::handle<Expr_GeneralExpression> & exp1, const opencascade::handle<Expr_GeneralExpression> & exp2);

		/****** Expr_BinaryFunction::Copy ******/
		/****** md5 signature: 959911c21ab8344ca7df9189a97166b1 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****** Expr_BinaryFunction::Derivative ******/
		/****** md5 signature: 270fc2b9646e490f90b1b721eeed146d ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the derivative on <x> unknown of <self>.
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****** Expr_BinaryFunction::Evaluate ******/
		/****** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****** Expr_BinaryFunction::Function ******/
		/****** md5 signature: f027f2800a46ad0cf94502538104cf73 ******/
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralFunction>

Description
-----------
Returns the function defining <self>.
") Function;
		opencascade::handle<Expr_GeneralFunction> Function();

		/****** Expr_BinaryFunction::IsIdentical ******/
		/****** md5 signature: 887141aa7f58c129eb32231276e0f0fa ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
Other: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****** Expr_BinaryFunction::IsLinear ******/
		/****** md5 signature: 5e125c70746046ac726ed804bbbf922f ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsLinear;
		Standard_Boolean IsLinear();

		/****** Expr_BinaryFunction::ShallowSimplified ******/
		/****** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ******/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after a simplification of the arguments of <self>.
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****** Expr_BinaryFunction::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_BinaryFunction)

%extend Expr_BinaryFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class Expr_Cosh *
******************/
class Expr_Cosh : public Expr_UnaryExpression {
	public:
		/****** Expr_Cosh::Expr_Cosh ******/
		/****** md5 signature: 909b7c545d8206300e4b8ecf5dbcf05b ******/
		%feature("compactdefaultargs") Expr_Cosh;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
None

Description
-----------
Creates the cosh of <exp>.
") Expr_Cosh;
		 Expr_Cosh(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_Cosh::Copy ******/
		/****** md5 signature: 959911c21ab8344ca7df9189a97166b1 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****** Expr_Cosh::Derivative ******/
		/****** md5 signature: 270fc2b9646e490f90b1b721eeed146d ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the derivative on <x> unknown of <self>.
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****** Expr_Cosh::Evaluate ******/
		/****** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****** Expr_Cosh::IsIdentical ******/
		/****** md5 signature: 887141aa7f58c129eb32231276e0f0fa ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
Other: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****** Expr_Cosh::IsLinear ******/
		/****** md5 signature: 5e125c70746046ac726ed804bbbf922f ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsLinear;
		Standard_Boolean IsLinear();

		/****** Expr_Cosh::ShallowSimplified ******/
		/****** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ******/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after a simplification of the arguments of <self>.
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****** Expr_Cosh::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_Cosh)

%extend Expr_Cosh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Expr_Cosine *
********************/
class Expr_Cosine : public Expr_UnaryExpression {
	public:
		/****** Expr_Cosine::Expr_Cosine ******/
		/****** md5 signature: 982ca231f2b3035f6fb2d935fab48c09 ******/
		%feature("compactdefaultargs") Expr_Cosine;
		%feature("autodoc", "
Parameters
----------
Exp: Expr_GeneralExpression

Return
-------
None

Description
-----------
Creates the cosine of exp.
") Expr_Cosine;
		 Expr_Cosine(const opencascade::handle<Expr_GeneralExpression> & Exp);

		/****** Expr_Cosine::Copy ******/
		/****** md5 signature: 959911c21ab8344ca7df9189a97166b1 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****** Expr_Cosine::Derivative ******/
		/****** md5 signature: 270fc2b9646e490f90b1b721eeed146d ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the derivative on <x> unknown of <self>.
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****** Expr_Cosine::Evaluate ******/
		/****** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****** Expr_Cosine::IsIdentical ******/
		/****** md5 signature: 887141aa7f58c129eb32231276e0f0fa ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
Other: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****** Expr_Cosine::IsLinear ******/
		/****** md5 signature: 5e125c70746046ac726ed804bbbf922f ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsLinear;
		Standard_Boolean IsLinear();

		/****** Expr_Cosine::ShallowSimplified ******/
		/****** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ******/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after a simplification of the arguments of <self>.
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****** Expr_Cosine::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_Cosine)

%extend Expr_Cosine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Expr_Difference *
************************/
class Expr_Difference : public Expr_BinaryExpression {
	public:
		/****** Expr_Difference::Expr_Difference ******/
		/****** md5 signature: 9b22984d415f752164f29d4bc5942668 ******/
		%feature("compactdefaultargs") Expr_Difference;
		%feature("autodoc", "
Parameters
----------
exp1: Expr_GeneralExpression
exp2: Expr_GeneralExpression

Return
-------
None

Description
-----------
Creates the difference <exp1> - <exp2>.
") Expr_Difference;
		 Expr_Difference(const opencascade::handle<Expr_GeneralExpression> & exp1, const opencascade::handle<Expr_GeneralExpression> & exp2);

		/****** Expr_Difference::Copy ******/
		/****** md5 signature: 959911c21ab8344ca7df9189a97166b1 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****** Expr_Difference::Derivative ******/
		/****** md5 signature: 270fc2b9646e490f90b1b721eeed146d ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the derivative on <x> unknown of <self>.
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****** Expr_Difference::Evaluate ******/
		/****** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****** Expr_Difference::IsIdentical ******/
		/****** md5 signature: 887141aa7f58c129eb32231276e0f0fa ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
Other: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****** Expr_Difference::IsLinear ******/
		/****** md5 signature: 5e125c70746046ac726ed804bbbf922f ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsLinear;
		Standard_Boolean IsLinear();

		/****** Expr_Difference::NDerivative ******/
		/****** md5 signature: 64fe21d732fcfe80f37aea7c134ab146 ******/
		%feature("compactdefaultargs") NDerivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown
N: int

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the <n>-th derivative on <x> unknown of <self>. raises outofrange if <n> <= 0.
") NDerivative;
		virtual opencascade::handle<Expr_GeneralExpression> NDerivative(const opencascade::handle<Expr_NamedUnknown> & X, const Standard_Integer N);

		/****** Expr_Difference::ShallowSimplified ******/
		/****** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ******/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after a simplification of the arguments of <self>.
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****** Expr_Difference::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_Difference)

%extend Expr_Difference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Expr_Different *
***********************/
class Expr_Different : public Expr_SingleRelation {
	public:
		/****** Expr_Different::Expr_Different ******/
		/****** md5 signature: e90d4a831a5d96fadc66f4f1026de296 ******/
		%feature("compactdefaultargs") Expr_Different;
		%feature("autodoc", "
Parameters
----------
exp1: Expr_GeneralExpression
exp2: Expr_GeneralExpression

Return
-------
None

Description
-----------
Creates the relation <exp1> # <exp2>.
") Expr_Different;
		 Expr_Different(const opencascade::handle<Expr_GeneralExpression> & exp1, const opencascade::handle<Expr_GeneralExpression> & exp2);

		/****** Expr_Different::Copy ******/
		/****** md5 signature: 4fb077f1759a1cc123427f28e5b2aaa7 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralRelation>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralRelation> Copy();

		/****** Expr_Different::IsSatisfied ******/
		/****** md5 signature: 29fd56dcca3d0f68d00dfd4c1a7b3ff7 ******/
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsSatisfied;
		Standard_Boolean IsSatisfied();

		/****** Expr_Different::Simplified ******/
		/****** md5 signature: 9b1cc1e39bd9e0a60af88b21f44eb44c ******/
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralRelation>

Description
-----------
Returns a generalrelation after replacement of namedunknowns by an associated expression, and after values computation.
") Simplified;
		opencascade::handle<Expr_GeneralRelation> Simplified();

		/****** Expr_Different::Simplify ******/
		/****** md5 signature: d448a44dccfa01a406e4283570ba001f ******/
		%feature("compactdefaultargs") Simplify;
		%feature("autodoc", "Return
-------
None

Description
-----------
Replaces namedunknowns by associated expressions, and computes values in <self>.
") Simplify;
		void Simplify();

		/****** Expr_Different::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_Different)

%extend Expr_Different {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Expr_Division *
**********************/
class Expr_Division : public Expr_BinaryExpression {
	public:
		/****** Expr_Division::Expr_Division ******/
		/****** md5 signature: 73fa6302a74030784ab3fcf08600e121 ******/
		%feature("compactdefaultargs") Expr_Division;
		%feature("autodoc", "
Parameters
----------
exp1: Expr_GeneralExpression
exp2: Expr_GeneralExpression

Return
-------
None

Description
-----------
Creates the division <exp1>/<exp2>.
") Expr_Division;
		 Expr_Division(const opencascade::handle<Expr_GeneralExpression> & exp1, const opencascade::handle<Expr_GeneralExpression> & exp2);

		/****** Expr_Division::Copy ******/
		/****** md5 signature: 959911c21ab8344ca7df9189a97166b1 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****** Expr_Division::Derivative ******/
		/****** md5 signature: 270fc2b9646e490f90b1b721eeed146d ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the derivative on <x> unknown of <self>.
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****** Expr_Division::Evaluate ******/
		/****** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****** Expr_Division::IsIdentical ******/
		/****** md5 signature: 887141aa7f58c129eb32231276e0f0fa ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
Other: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****** Expr_Division::IsLinear ******/
		/****** md5 signature: 5e125c70746046ac726ed804bbbf922f ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsLinear;
		Standard_Boolean IsLinear();

		/****** Expr_Division::ShallowSimplified ******/
		/****** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ******/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after a simplification of the arguments of <self>.
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****** Expr_Division::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_Division)

%extend Expr_Division {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class Expr_Equal *
*******************/
class Expr_Equal : public Expr_SingleRelation {
	public:
		/****** Expr_Equal::Expr_Equal ******/
		/****** md5 signature: b4ff5feaa719eb4f8a5be462c4c08381 ******/
		%feature("compactdefaultargs") Expr_Equal;
		%feature("autodoc", "
Parameters
----------
exp1: Expr_GeneralExpression
exp2: Expr_GeneralExpression

Return
-------
None

Description
-----------
Creates the relation <exp1> = <exp2>.
") Expr_Equal;
		 Expr_Equal(const opencascade::handle<Expr_GeneralExpression> & exp1, const opencascade::handle<Expr_GeneralExpression> & exp2);

		/****** Expr_Equal::Copy ******/
		/****** md5 signature: 4fb077f1759a1cc123427f28e5b2aaa7 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralRelation>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralRelation> Copy();

		/****** Expr_Equal::IsSatisfied ******/
		/****** md5 signature: 29fd56dcca3d0f68d00dfd4c1a7b3ff7 ******/
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsSatisfied;
		Standard_Boolean IsSatisfied();

		/****** Expr_Equal::Simplified ******/
		/****** md5 signature: 9b1cc1e39bd9e0a60af88b21f44eb44c ******/
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralRelation>

Description
-----------
Returns a generalrelation after replacement of namedunknowns by an associated expression and after values computation.
") Simplified;
		opencascade::handle<Expr_GeneralRelation> Simplified();

		/****** Expr_Equal::Simplify ******/
		/****** md5 signature: d448a44dccfa01a406e4283570ba001f ******/
		%feature("compactdefaultargs") Simplify;
		%feature("autodoc", "Return
-------
None

Description
-----------
Replaces namedunknowns by an associated expressions and computes values in <self>.
") Simplify;
		void Simplify();

		/****** Expr_Equal::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_Equal)

%extend Expr_Equal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Expr_Exponential *
*************************/
class Expr_Exponential : public Expr_UnaryExpression {
	public:
		/****** Expr_Exponential::Expr_Exponential ******/
		/****** md5 signature: 8d1d299927e184c3ae836d15f197e297 ******/
		%feature("compactdefaultargs") Expr_Exponential;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
None

Description
-----------
Creates the exponential of <exp>.
") Expr_Exponential;
		 Expr_Exponential(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_Exponential::Copy ******/
		/****** md5 signature: 959911c21ab8344ca7df9189a97166b1 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****** Expr_Exponential::Derivative ******/
		/****** md5 signature: 270fc2b9646e490f90b1b721eeed146d ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the derivative on <x> unknown of <self>.
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****** Expr_Exponential::Evaluate ******/
		/****** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****** Expr_Exponential::IsIdentical ******/
		/****** md5 signature: 887141aa7f58c129eb32231276e0f0fa ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
Other: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****** Expr_Exponential::IsLinear ******/
		/****** md5 signature: 5e125c70746046ac726ed804bbbf922f ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsLinear;
		Standard_Boolean IsLinear();

		/****** Expr_Exponential::ShallowSimplified ******/
		/****** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ******/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after a simplification of the arguments of <self>.
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****** Expr_Exponential::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_Exponential)

%extend Expr_Exponential {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Expr_Exponentiate *
**************************/
class Expr_Exponentiate : public Expr_BinaryExpression {
	public:
		/****** Expr_Exponentiate::Expr_Exponentiate ******/
		/****** md5 signature: bd7f2bdd1796f67e55840b583c587151 ******/
		%feature("compactdefaultargs") Expr_Exponentiate;
		%feature("autodoc", "
Parameters
----------
exp1: Expr_GeneralExpression
exp2: Expr_GeneralExpression

Return
-------
None

Description
-----------
Creates the exponential <exp1> ^ <exp2>.
") Expr_Exponentiate;
		 Expr_Exponentiate(const opencascade::handle<Expr_GeneralExpression> & exp1, const opencascade::handle<Expr_GeneralExpression> & exp2);

		/****** Expr_Exponentiate::Copy ******/
		/****** md5 signature: 959911c21ab8344ca7df9189a97166b1 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****** Expr_Exponentiate::Derivative ******/
		/****** md5 signature: 270fc2b9646e490f90b1b721eeed146d ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the derivative on <x> unknown of <self>.
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****** Expr_Exponentiate::Evaluate ******/
		/****** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****** Expr_Exponentiate::IsIdentical ******/
		/****** md5 signature: 887141aa7f58c129eb32231276e0f0fa ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
Other: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****** Expr_Exponentiate::IsLinear ******/
		/****** md5 signature: 5e125c70746046ac726ed804bbbf922f ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsLinear;
		Standard_Boolean IsLinear();

		/****** Expr_Exponentiate::ShallowSimplified ******/
		/****** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ******/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after a simplification of the arguments of <self>.
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****** Expr_Exponentiate::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_Exponentiate)

%extend Expr_Exponentiate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Expr_GreaterThan *
*************************/
class Expr_GreaterThan : public Expr_SingleRelation {
	public:
		/****** Expr_GreaterThan::Expr_GreaterThan ******/
		/****** md5 signature: 30f0ffdbf668f1b682b723c4c4f2a4a2 ******/
		%feature("compactdefaultargs") Expr_GreaterThan;
		%feature("autodoc", "
Parameters
----------
exp1: Expr_GeneralExpression
exp2: Expr_GeneralExpression

Return
-------
None

Description
-----------
Creates the relation <exp1> > <exp2>.
") Expr_GreaterThan;
		 Expr_GreaterThan(const opencascade::handle<Expr_GeneralExpression> & exp1, const opencascade::handle<Expr_GeneralExpression> & exp2);

		/****** Expr_GreaterThan::Copy ******/
		/****** md5 signature: 4fb077f1759a1cc123427f28e5b2aaa7 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralRelation>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralRelation> Copy();

		/****** Expr_GreaterThan::IsSatisfied ******/
		/****** md5 signature: 29fd56dcca3d0f68d00dfd4c1a7b3ff7 ******/
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsSatisfied;
		Standard_Boolean IsSatisfied();

		/****** Expr_GreaterThan::Simplified ******/
		/****** md5 signature: 9b1cc1e39bd9e0a60af88b21f44eb44c ******/
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralRelation>

Description
-----------
Returns a generalrelation after replacement of namedunknowns by an associated expression, and after values computation.
") Simplified;
		opencascade::handle<Expr_GeneralRelation> Simplified();

		/****** Expr_GreaterThan::Simplify ******/
		/****** md5 signature: d448a44dccfa01a406e4283570ba001f ******/
		%feature("compactdefaultargs") Simplify;
		%feature("autodoc", "Return
-------
None

Description
-----------
Replaces namedunknowns by associated expressions, and computes values in <self>.
") Simplify;
		void Simplify();

		/****** Expr_GreaterThan::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_GreaterThan)

%extend Expr_GreaterThan {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Expr_GreaterThanOrEqual *
********************************/
class Expr_GreaterThanOrEqual : public Expr_SingleRelation {
	public:
		/****** Expr_GreaterThanOrEqual::Expr_GreaterThanOrEqual ******/
		/****** md5 signature: a1c2e3960f6f903896f2a094c34072cf ******/
		%feature("compactdefaultargs") Expr_GreaterThanOrEqual;
		%feature("autodoc", "
Parameters
----------
exp1: Expr_GeneralExpression
exp2: Expr_GeneralExpression

Return
-------
None

Description
-----------
Creates the relation <exp1> >= <exp2>.
") Expr_GreaterThanOrEqual;
		 Expr_GreaterThanOrEqual(const opencascade::handle<Expr_GeneralExpression> & exp1, const opencascade::handle<Expr_GeneralExpression> & exp2);

		/****** Expr_GreaterThanOrEqual::Copy ******/
		/****** md5 signature: 4fb077f1759a1cc123427f28e5b2aaa7 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralRelation>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralRelation> Copy();

		/****** Expr_GreaterThanOrEqual::IsSatisfied ******/
		/****** md5 signature: 29fd56dcca3d0f68d00dfd4c1a7b3ff7 ******/
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsSatisfied;
		Standard_Boolean IsSatisfied();

		/****** Expr_GreaterThanOrEqual::Simplified ******/
		/****** md5 signature: 9b1cc1e39bd9e0a60af88b21f44eb44c ******/
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralRelation>

Description
-----------
Returns a generalrelation after replacement of namedunknowns by an associated expression, and after values computation.
") Simplified;
		opencascade::handle<Expr_GeneralRelation> Simplified();

		/****** Expr_GreaterThanOrEqual::Simplify ******/
		/****** md5 signature: d448a44dccfa01a406e4283570ba001f ******/
		%feature("compactdefaultargs") Simplify;
		%feature("autodoc", "Return
-------
None

Description
-----------
Replaces namedunknowns by associated expressions, and computes values in <self>.
") Simplify;
		void Simplify();

		/****** Expr_GreaterThanOrEqual::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_GreaterThanOrEqual)

%extend Expr_GreaterThanOrEqual {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Expr_LessThan *
**********************/
class Expr_LessThan : public Expr_SingleRelation {
	public:
		/****** Expr_LessThan::Expr_LessThan ******/
		/****** md5 signature: ec9b186a3e5aa5964ac85c5e0965c1fe ******/
		%feature("compactdefaultargs") Expr_LessThan;
		%feature("autodoc", "
Parameters
----------
exp1: Expr_GeneralExpression
exp2: Expr_GeneralExpression

Return
-------
None

Description
-----------
Creates the relation <exp1> < <exp2>.
") Expr_LessThan;
		 Expr_LessThan(const opencascade::handle<Expr_GeneralExpression> & exp1, const opencascade::handle<Expr_GeneralExpression> & exp2);

		/****** Expr_LessThan::Copy ******/
		/****** md5 signature: 4fb077f1759a1cc123427f28e5b2aaa7 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralRelation>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralRelation> Copy();

		/****** Expr_LessThan::IsSatisfied ******/
		/****** md5 signature: 29fd56dcca3d0f68d00dfd4c1a7b3ff7 ******/
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsSatisfied;
		Standard_Boolean IsSatisfied();

		/****** Expr_LessThan::Simplified ******/
		/****** md5 signature: 9b1cc1e39bd9e0a60af88b21f44eb44c ******/
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralRelation>

Description
-----------
Returns a generalrelation after replacement of namedunknowns by an associated expression, and after values computation.
") Simplified;
		opencascade::handle<Expr_GeneralRelation> Simplified();

		/****** Expr_LessThan::Simplify ******/
		/****** md5 signature: d448a44dccfa01a406e4283570ba001f ******/
		%feature("compactdefaultargs") Simplify;
		%feature("autodoc", "Return
-------
None

Description
-----------
Replaces namedunknowns by associated expressions, and computes values in <self>.
") Simplify;
		void Simplify();

		/****** Expr_LessThan::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_LessThan)

%extend Expr_LessThan {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Expr_LessThanOrEqual *
*****************************/
class Expr_LessThanOrEqual : public Expr_SingleRelation {
	public:
		/****** Expr_LessThanOrEqual::Expr_LessThanOrEqual ******/
		/****** md5 signature: ce8454fa064b5976fe4e21a26d57a4d3 ******/
		%feature("compactdefaultargs") Expr_LessThanOrEqual;
		%feature("autodoc", "
Parameters
----------
exp1: Expr_GeneralExpression
exp2: Expr_GeneralExpression

Return
-------
None

Description
-----------
Creates the relation <exp1> <= <exp2>.
") Expr_LessThanOrEqual;
		 Expr_LessThanOrEqual(const opencascade::handle<Expr_GeneralExpression> & exp1, const opencascade::handle<Expr_GeneralExpression> & exp2);

		/****** Expr_LessThanOrEqual::Copy ******/
		/****** md5 signature: 4fb077f1759a1cc123427f28e5b2aaa7 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralRelation>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralRelation> Copy();

		/****** Expr_LessThanOrEqual::IsSatisfied ******/
		/****** md5 signature: 29fd56dcca3d0f68d00dfd4c1a7b3ff7 ******/
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsSatisfied;
		Standard_Boolean IsSatisfied();

		/****** Expr_LessThanOrEqual::Simplified ******/
		/****** md5 signature: 9b1cc1e39bd9e0a60af88b21f44eb44c ******/
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralRelation>

Description
-----------
Returns a generalrelation after replacement of namedunknowns by an associated expression, and after values computation.
") Simplified;
		opencascade::handle<Expr_GeneralRelation> Simplified();

		/****** Expr_LessThanOrEqual::Simplify ******/
		/****** md5 signature: d448a44dccfa01a406e4283570ba001f ******/
		%feature("compactdefaultargs") Simplify;
		%feature("autodoc", "Return
-------
None

Description
-----------
Replaces namedunknowns by associated expressions, and computes values in <self>.
") Simplify;
		void Simplify();

		/****** Expr_LessThanOrEqual::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_LessThanOrEqual)

%extend Expr_LessThanOrEqual {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Expr_LogOf10 *
*********************/
class Expr_LogOf10 : public Expr_UnaryExpression {
	public:
		/****** Expr_LogOf10::Expr_LogOf10 ******/
		/****** md5 signature: 59b8dd4db88909d8f020f118473efba5 ******/
		%feature("compactdefaultargs") Expr_LogOf10;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
None

Description
-----------
Creates the base 10 logarithm of <exp>.
") Expr_LogOf10;
		 Expr_LogOf10(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_LogOf10::Copy ******/
		/****** md5 signature: 959911c21ab8344ca7df9189a97166b1 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****** Expr_LogOf10::Derivative ******/
		/****** md5 signature: 270fc2b9646e490f90b1b721eeed146d ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the derivative on <x> unknown of <self>.
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****** Expr_LogOf10::Evaluate ******/
		/****** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****** Expr_LogOf10::IsIdentical ******/
		/****** md5 signature: 887141aa7f58c129eb32231276e0f0fa ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
Other: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****** Expr_LogOf10::IsLinear ******/
		/****** md5 signature: 5e125c70746046ac726ed804bbbf922f ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsLinear;
		Standard_Boolean IsLinear();

		/****** Expr_LogOf10::ShallowSimplified ******/
		/****** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ******/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after a simplification of the arguments of <self>.
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****** Expr_LogOf10::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_LogOf10)

%extend Expr_LogOf10 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Expr_LogOfe *
********************/
class Expr_LogOfe : public Expr_UnaryExpression {
	public:
		/****** Expr_LogOfe::Expr_LogOfe ******/
		/****** md5 signature: 2db01f31cae52513255ce88091e83582 ******/
		%feature("compactdefaultargs") Expr_LogOfe;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
None

Description
-----------
Creates the natural logarithm of <exp>.
") Expr_LogOfe;
		 Expr_LogOfe(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_LogOfe::Copy ******/
		/****** md5 signature: 959911c21ab8344ca7df9189a97166b1 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****** Expr_LogOfe::Derivative ******/
		/****** md5 signature: 270fc2b9646e490f90b1b721eeed146d ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the derivative on <x> unknown of <self>.
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****** Expr_LogOfe::Evaluate ******/
		/****** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****** Expr_LogOfe::IsIdentical ******/
		/****** md5 signature: 887141aa7f58c129eb32231276e0f0fa ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
Other: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****** Expr_LogOfe::IsLinear ******/
		/****** md5 signature: 5e125c70746046ac726ed804bbbf922f ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsLinear;
		Standard_Boolean IsLinear();

		/****** Expr_LogOfe::ShallowSimplified ******/
		/****** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ******/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after a simplification of the arguments of <self>.
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****** Expr_LogOfe::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_LogOfe)

%extend Expr_LogOfe {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Expr_NamedConstant *
***************************/
class Expr_NamedConstant : public Expr_NamedExpression {
	public:
		/****** Expr_NamedConstant::Expr_NamedConstant ******/
		/****** md5 signature: 5f7a3c5cb78bab430f0473d14675dd38 ******/
		%feature("compactdefaultargs") Expr_NamedConstant;
		%feature("autodoc", "
Parameters
----------
name: str
value: float

Return
-------
None

Description
-----------
Creates a constant value of name <name> and value <value>.
") Expr_NamedConstant;
		 Expr_NamedConstant(TCollection_AsciiString name, const Standard_Real value);

		/****** Expr_NamedConstant::Contains ******/
		/****** md5 signature: 4d3e3a365e28051266a44f7d96eb9917 ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <exp> is contained in <self>.
") Contains;
		Standard_Boolean Contains(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_NamedConstant::ContainsUnknowns ******/
		/****** md5 signature: 847c37fd1fdb87ce3fd4b89fbb7d8d46 ******/
		%feature("compactdefaultargs") ContainsUnknowns;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tests if <self> contains namedunknown. (returns always false).
") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns();

		/****** Expr_NamedConstant::Copy ******/
		/****** md5 signature: 959911c21ab8344ca7df9189a97166b1 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****** Expr_NamedConstant::Derivative ******/
		/****** md5 signature: 270fc2b9646e490f90b1b721eeed146d ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the derivative on <x> unknown of <self>.
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****** Expr_NamedConstant::Evaluate ******/
		/****** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Returns the value of <self> (as a real) by replacement of <vars> by <vals>.
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****** Expr_NamedConstant::GetValue ******/
		/****** md5 signature: 2863c7a566efd7be6530d131f7f2cf29 ******/
		%feature("compactdefaultargs") GetValue;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") GetValue;
		Standard_Real GetValue();

		/****** Expr_NamedConstant::IsLinear ******/
		/****** md5 signature: 5e125c70746046ac726ed804bbbf922f ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsLinear;
		Standard_Boolean IsLinear();

		/****** Expr_NamedConstant::NDerivative ******/
		/****** md5 signature: 64fe21d732fcfe80f37aea7c134ab146 ******/
		%feature("compactdefaultargs") NDerivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown
N: int

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the <n>-th derivative on <x> unknown of <self>. raises outofrange if <n> <= 0.
") NDerivative;
		virtual opencascade::handle<Expr_GeneralExpression> NDerivative(const opencascade::handle<Expr_NamedUnknown> & X, const Standard_Integer N);

		/****** Expr_NamedConstant::NbSubExpressions ******/
		/****** md5 signature: bd59d3a2c33cb431e9b8695901cbe037 ******/
		%feature("compactdefaultargs") NbSubExpressions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of sub-expressions contained in <self> (always returns zero).
") NbSubExpressions;
		Standard_Integer NbSubExpressions();

		/****** Expr_NamedConstant::Replace ******/
		/****** md5 signature: d1980891db2f275bbc6d54eac796d58d ******/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "
Parameters
----------
var: Expr_NamedUnknown
with: Expr_GeneralExpression

Return
-------
None

Description
-----------
Replaces all occurrences of <var> with <with> in <self>.
") Replace;
		void Replace(const opencascade::handle<Expr_NamedUnknown> & var, const opencascade::handle<Expr_GeneralExpression> & with);

		/****** Expr_NamedConstant::ShallowSimplified ******/
		/****** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ******/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after a simplification of the arguments of <self>.
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****** Expr_NamedConstant::Simplified ******/
		/****** md5 signature: 28f32c755b08a477aaaa66888fafbe45 ******/
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after replacement of namedunknowns by an associated expression and after values computation.
") Simplified;
		opencascade::handle<Expr_GeneralExpression> Simplified();

		/****** Expr_NamedConstant::SubExpression ******/
		/****** md5 signature: da538711b3889bbe62310fe1c52e3fd2 ******/
		%feature("compactdefaultargs") SubExpression;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the <i>-th sub-expression of <self> raises outofrange.
") SubExpression;
		const opencascade::handle<Expr_GeneralExpression> & SubExpression(const Standard_Integer I);

};


%make_alias(Expr_NamedConstant)

%extend Expr_NamedConstant {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Expr_NamedUnknown *
**************************/
class Expr_NamedUnknown : public Expr_NamedExpression {
	public:
		/****** Expr_NamedUnknown::Expr_NamedUnknown ******/
		/****** md5 signature: 25f05966a200301b7e068bb634d32b84 ******/
		%feature("compactdefaultargs") Expr_NamedUnknown;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
None

Description
-----------
No available documentation.
") Expr_NamedUnknown;
		 Expr_NamedUnknown(TCollection_AsciiString name);

		/****** Expr_NamedUnknown::Assign ******/
		/****** md5 signature: 2d586a2386463c9b0d4b174890bd7d12 ******/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
None

Description
-----------
Assigns <self> to <exp> expression. raises exception if <exp> refers to <self>.
") Assign;
		void Assign(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_NamedUnknown::AssignedExpression ******/
		/****** md5 signature: 2aedd3f2b693692f428f79814a0eeb9d ******/
		%feature("compactdefaultargs") AssignedExpression;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
If exists, returns the assigned expression. an exception is raised if the expression does not exist.
") AssignedExpression;
		const opencascade::handle<Expr_GeneralExpression> & AssignedExpression();

		/****** Expr_NamedUnknown::Contains ******/
		/****** md5 signature: 4d3e3a365e28051266a44f7d96eb9917 ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <exp> is contained in <self>.
") Contains;
		Standard_Boolean Contains(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_NamedUnknown::ContainsUnknowns ******/
		/****** md5 signature: 847c37fd1fdb87ce3fd4b89fbb7d8d46 ******/
		%feature("compactdefaultargs") ContainsUnknowns;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tests if <self> contains namedunknown.
") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns();

		/****** Expr_NamedUnknown::Copy ******/
		/****** md5 signature: 959911c21ab8344ca7df9189a97166b1 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****** Expr_NamedUnknown::Deassign ******/
		/****** md5 signature: bdd99d62e4917809f78e8082960232c1 ******/
		%feature("compactdefaultargs") Deassign;
		%feature("autodoc", "Return
-------
None

Description
-----------
Suppresses the assigned expression.
") Deassign;
		void Deassign();

		/****** Expr_NamedUnknown::Derivative ******/
		/****** md5 signature: 270fc2b9646e490f90b1b721eeed146d ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the derivative on <x> unknown of <self>.
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****** Expr_NamedUnknown::Evaluate ******/
		/****** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****** Expr_NamedUnknown::IsAssigned ******/
		/****** md5 signature: 10514134a7a4186d1c438c2b296fef32 ******/
		%feature("compactdefaultargs") IsAssigned;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tests if an expression is assigned to <self>.
") IsAssigned;
		Standard_Boolean IsAssigned();

		/****** Expr_NamedUnknown::IsLinear ******/
		/****** md5 signature: 5e125c70746046ac726ed804bbbf922f ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsLinear;
		Standard_Boolean IsLinear();

		/****** Expr_NamedUnknown::NbSubExpressions ******/
		/****** md5 signature: bd59d3a2c33cb431e9b8695901cbe037 ******/
		%feature("compactdefaultargs") NbSubExpressions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of sub-expressions contained in <self> ( >= 0).
") NbSubExpressions;
		Standard_Integer NbSubExpressions();

		/****** Expr_NamedUnknown::Replace ******/
		/****** md5 signature: d1980891db2f275bbc6d54eac796d58d ******/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "
Parameters
----------
var: Expr_NamedUnknown
with: Expr_GeneralExpression

Return
-------
None

Description
-----------
Replaces all occurrences of <var> with <with> in <self> raises invalidoperand if <with> contains <self>.
") Replace;
		void Replace(const opencascade::handle<Expr_NamedUnknown> & var, const opencascade::handle<Expr_GeneralExpression> & with);

		/****** Expr_NamedUnknown::ShallowSimplified ******/
		/****** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ******/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after a simplification of the arguments of <self>.
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****** Expr_NamedUnknown::Simplified ******/
		/****** md5 signature: 28f32c755b08a477aaaa66888fafbe45 ******/
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after replacement of namedunknowns by an associated expression and after values computation.
") Simplified;
		opencascade::handle<Expr_GeneralExpression> Simplified();

		/****** Expr_NamedUnknown::SubExpression ******/
		/****** md5 signature: da538711b3889bbe62310fe1c52e3fd2 ******/
		%feature("compactdefaultargs") SubExpression;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the <i>-th sub-expression of <self> raises outofrange if <i> > nbsubexpressions(me).
") SubExpression;
		const opencascade::handle<Expr_GeneralExpression> & SubExpression(const Standard_Integer I);

};


%make_alias(Expr_NamedUnknown)

%extend Expr_NamedUnknown {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Expr_PolyFunction *
**************************/
class Expr_PolyFunction : public Expr_PolyExpression {
	public:
		/****** Expr_PolyFunction::Expr_PolyFunction ******/
		/****** md5 signature: bb0d21d6c30ae603033c1a20ffea8170 ******/
		%feature("compactdefaultargs") Expr_PolyFunction;
		%feature("autodoc", "
Parameters
----------
func: Expr_GeneralFunction
exps: Expr_Array1OfGeneralExpression

Return
-------
None

Description
-----------
Creates <self> as <func>(<exps_1>,<exps_2>,...,<exps_n>).
") Expr_PolyFunction;
		 Expr_PolyFunction(const opencascade::handle<Expr_GeneralFunction> & func, const Expr_Array1OfGeneralExpression & exps);

		/****** Expr_PolyFunction::Copy ******/
		/****** md5 signature: 959911c21ab8344ca7df9189a97166b1 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****** Expr_PolyFunction::Derivative ******/
		/****** md5 signature: 270fc2b9646e490f90b1b721eeed146d ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the derivative on <x> unknown of <self>.
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****** Expr_PolyFunction::Evaluate ******/
		/****** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****** Expr_PolyFunction::Function ******/
		/****** md5 signature: f027f2800a46ad0cf94502538104cf73 ******/
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralFunction>

Description
-----------
Returns the function defining <self>.
") Function;
		opencascade::handle<Expr_GeneralFunction> Function();

		/****** Expr_PolyFunction::IsIdentical ******/
		/****** md5 signature: 887141aa7f58c129eb32231276e0f0fa ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
Other: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****** Expr_PolyFunction::IsLinear ******/
		/****** md5 signature: 5e125c70746046ac726ed804bbbf922f ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsLinear;
		Standard_Boolean IsLinear();

		/****** Expr_PolyFunction::ShallowSimplified ******/
		/****** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ******/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after a simplification of the arguments of <self>.
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****** Expr_PolyFunction::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_PolyFunction)

%extend Expr_PolyFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Expr_Product *
*********************/
class Expr_Product : public Expr_PolyExpression {
	public:
		/****** Expr_Product::Expr_Product ******/
		/****** md5 signature: 74b5163d45eb7131e645511f7997caf3 ******/
		%feature("compactdefaultargs") Expr_Product;
		%feature("autodoc", "
Parameters
----------
exps: Expr_SequenceOfGeneralExpression

Return
-------
None

Description
-----------
Creates the product of all members of sequence <exps>.
") Expr_Product;
		 Expr_Product(const Expr_SequenceOfGeneralExpression & exps);

		/****** Expr_Product::Expr_Product ******/
		/****** md5 signature: 1e7ed70c20e505fff5be6facbba2fe41 ******/
		%feature("compactdefaultargs") Expr_Product;
		%feature("autodoc", "
Parameters
----------
exp1: Expr_GeneralExpression
exp2: Expr_GeneralExpression

Return
-------
None

Description
-----------
Creates the product of <exp1> and <exp2>.
") Expr_Product;
		 Expr_Product(const opencascade::handle<Expr_GeneralExpression> & exp1, const opencascade::handle<Expr_GeneralExpression> & exp2);

		/****** Expr_Product::Copy ******/
		/****** md5 signature: 959911c21ab8344ca7df9189a97166b1 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****** Expr_Product::Derivative ******/
		/****** md5 signature: 270fc2b9646e490f90b1b721eeed146d ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the derivative on <x> unknown of <self>.
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****** Expr_Product::Evaluate ******/
		/****** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****** Expr_Product::IsIdentical ******/
		/****** md5 signature: 887141aa7f58c129eb32231276e0f0fa ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
Other: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****** Expr_Product::IsLinear ******/
		/****** md5 signature: 5e125c70746046ac726ed804bbbf922f ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsLinear;
		Standard_Boolean IsLinear();

		/****** Expr_Product::ShallowSimplified ******/
		/****** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ******/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after a simplification of the arguments of <self>.
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****** Expr_Product::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_Product)

%extend Expr_Product {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class Expr_Sign *
******************/
/******************
* class Expr_Sine *
******************/
class Expr_Sine : public Expr_UnaryExpression {
	public:
		/****** Expr_Sine::Expr_Sine ******/
		/****** md5 signature: 79a6e289fff74f5929f265d65a6e7f6c ******/
		%feature("compactdefaultargs") Expr_Sine;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
None

Description
-----------
Creates the sine of <exp>.
") Expr_Sine;
		 Expr_Sine(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_Sine::Copy ******/
		/****** md5 signature: 959911c21ab8344ca7df9189a97166b1 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****** Expr_Sine::Derivative ******/
		/****** md5 signature: 270fc2b9646e490f90b1b721eeed146d ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the derivative on <x> unknown of <self>.
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****** Expr_Sine::Evaluate ******/
		/****** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****** Expr_Sine::IsIdentical ******/
		/****** md5 signature: 887141aa7f58c129eb32231276e0f0fa ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
Other: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****** Expr_Sine::IsLinear ******/
		/****** md5 signature: 5e125c70746046ac726ed804bbbf922f ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsLinear;
		Standard_Boolean IsLinear();

		/****** Expr_Sine::ShallowSimplified ******/
		/****** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ******/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after a simplification of the arguments of <self>.
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****** Expr_Sine::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_Sine)

%extend Expr_Sine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class Expr_Sinh *
******************/
class Expr_Sinh : public Expr_UnaryExpression {
	public:
		/****** Expr_Sinh::Expr_Sinh ******/
		/****** md5 signature: 2fbf772f2fe5ac00184a39d76b5f7ff6 ******/
		%feature("compactdefaultargs") Expr_Sinh;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
None

Description
-----------
Creates the sinh of <exp>.
") Expr_Sinh;
		 Expr_Sinh(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_Sinh::Copy ******/
		/****** md5 signature: 959911c21ab8344ca7df9189a97166b1 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****** Expr_Sinh::Derivative ******/
		/****** md5 signature: 270fc2b9646e490f90b1b721eeed146d ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the derivative on <x> unknown of <self>.
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****** Expr_Sinh::Evaluate ******/
		/****** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****** Expr_Sinh::IsIdentical ******/
		/****** md5 signature: 887141aa7f58c129eb32231276e0f0fa ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
Other: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****** Expr_Sinh::IsLinear ******/
		/****** md5 signature: 5e125c70746046ac726ed804bbbf922f ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsLinear;
		Standard_Boolean IsLinear();

		/****** Expr_Sinh::ShallowSimplified ******/
		/****** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ******/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after a simplification of the arguments of <self>.
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****** Expr_Sinh::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_Sinh)

%extend Expr_Sinh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Expr_Square *
********************/
class Expr_Square : public Expr_UnaryExpression {
	public:
		/****** Expr_Square::Expr_Square ******/
		/****** md5 signature: c36229fd034d78a92d3ff5b362c1e99e ******/
		%feature("compactdefaultargs") Expr_Square;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
None

Description
-----------
Creates the square of <exp>.
") Expr_Square;
		 Expr_Square(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_Square::Copy ******/
		/****** md5 signature: 959911c21ab8344ca7df9189a97166b1 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****** Expr_Square::Derivative ******/
		/****** md5 signature: 270fc2b9646e490f90b1b721eeed146d ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the derivative on <x> unknown of <self>.
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****** Expr_Square::Evaluate ******/
		/****** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****** Expr_Square::IsIdentical ******/
		/****** md5 signature: 887141aa7f58c129eb32231276e0f0fa ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
Other: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****** Expr_Square::IsLinear ******/
		/****** md5 signature: 5e125c70746046ac726ed804bbbf922f ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsLinear;
		Standard_Boolean IsLinear();

		/****** Expr_Square::ShallowSimplified ******/
		/****** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ******/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after a simplification of the arguments of <self>.
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****** Expr_Square::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_Square)

%extend Expr_Square {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Expr_SquareRoot *
************************/
class Expr_SquareRoot : public Expr_UnaryExpression {
	public:
		/****** Expr_SquareRoot::Expr_SquareRoot ******/
		/****** md5 signature: 8a8794b40b3ad413d4571f0b4192f3bb ******/
		%feature("compactdefaultargs") Expr_SquareRoot;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
None

Description
-----------
Creates the square root of <exp>.
") Expr_SquareRoot;
		 Expr_SquareRoot(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_SquareRoot::Copy ******/
		/****** md5 signature: 959911c21ab8344ca7df9189a97166b1 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****** Expr_SquareRoot::Derivative ******/
		/****** md5 signature: 270fc2b9646e490f90b1b721eeed146d ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the derivative on <x> unknown of <self>.
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****** Expr_SquareRoot::Evaluate ******/
		/****** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****** Expr_SquareRoot::IsIdentical ******/
		/****** md5 signature: 887141aa7f58c129eb32231276e0f0fa ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
Other: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****** Expr_SquareRoot::IsLinear ******/
		/****** md5 signature: 5e125c70746046ac726ed804bbbf922f ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsLinear;
		Standard_Boolean IsLinear();

		/****** Expr_SquareRoot::ShallowSimplified ******/
		/****** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ******/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after a simplification of the arguments of <self>.
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****** Expr_SquareRoot::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_SquareRoot)

%extend Expr_SquareRoot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class Expr_Sum *
*****************/
class Expr_Sum : public Expr_PolyExpression {
	public:
		/****** Expr_Sum::Expr_Sum ******/
		/****** md5 signature: 40407804027889b6462777ca64d2a684 ******/
		%feature("compactdefaultargs") Expr_Sum;
		%feature("autodoc", "
Parameters
----------
exps: Expr_SequenceOfGeneralExpression

Return
-------
None

Description
-----------
Creates the sum of all the members of sequence <exps>.
") Expr_Sum;
		 Expr_Sum(const Expr_SequenceOfGeneralExpression & exps);

		/****** Expr_Sum::Expr_Sum ******/
		/****** md5 signature: fded1ec534bec9f5e2e433b83663bee2 ******/
		%feature("compactdefaultargs") Expr_Sum;
		%feature("autodoc", "
Parameters
----------
exp1: Expr_GeneralExpression
exp2: Expr_GeneralExpression

Return
-------
None

Description
-----------
Creates the sum of <exp1> and <exp2>.
") Expr_Sum;
		 Expr_Sum(const opencascade::handle<Expr_GeneralExpression> & exp1, const opencascade::handle<Expr_GeneralExpression> & exp2);

		/****** Expr_Sum::Copy ******/
		/****** md5 signature: 959911c21ab8344ca7df9189a97166b1 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****** Expr_Sum::Derivative ******/
		/****** md5 signature: 270fc2b9646e490f90b1b721eeed146d ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the derivative on <x> unknown of <self>.
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****** Expr_Sum::Evaluate ******/
		/****** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****** Expr_Sum::IsIdentical ******/
		/****** md5 signature: 887141aa7f58c129eb32231276e0f0fa ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
Other: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****** Expr_Sum::IsLinear ******/
		/****** md5 signature: 5e125c70746046ac726ed804bbbf922f ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsLinear;
		Standard_Boolean IsLinear();

		/****** Expr_Sum::NDerivative ******/
		/****** md5 signature: 64fe21d732fcfe80f37aea7c134ab146 ******/
		%feature("compactdefaultargs") NDerivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown
N: int

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the <n>-th derivative on <x> unknown of <self>. raises outofrange if <n> <= 0.
") NDerivative;
		virtual opencascade::handle<Expr_GeneralExpression> NDerivative(const opencascade::handle<Expr_NamedUnknown> & X, const Standard_Integer N);

		/****** Expr_Sum::ShallowSimplified ******/
		/****** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ******/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after a simplification of the arguments of <self>.
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****** Expr_Sum::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_Sum)

%extend Expr_Sum {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Expr_Tangent *
*********************/
class Expr_Tangent : public Expr_UnaryExpression {
	public:
		/****** Expr_Tangent::Expr_Tangent ******/
		/****** md5 signature: cdf65d26ee28ea59b45349d129adb9d6 ******/
		%feature("compactdefaultargs") Expr_Tangent;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
None

Description
-----------
Creates the tangent of <exp>.
") Expr_Tangent;
		 Expr_Tangent(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_Tangent::Copy ******/
		/****** md5 signature: 959911c21ab8344ca7df9189a97166b1 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****** Expr_Tangent::Derivative ******/
		/****** md5 signature: 270fc2b9646e490f90b1b721eeed146d ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the derivative on <x> unknown of <self>.
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****** Expr_Tangent::Evaluate ******/
		/****** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****** Expr_Tangent::IsIdentical ******/
		/****** md5 signature: 887141aa7f58c129eb32231276e0f0fa ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
Other: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****** Expr_Tangent::IsLinear ******/
		/****** md5 signature: 5e125c70746046ac726ed804bbbf922f ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsLinear;
		Standard_Boolean IsLinear();

		/****** Expr_Tangent::ShallowSimplified ******/
		/****** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ******/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after a simplification of the arguments of <self>.
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****** Expr_Tangent::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_Tangent)

%extend Expr_Tangent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class Expr_Tanh *
******************/
class Expr_Tanh : public Expr_UnaryExpression {
	public:
		/****** Expr_Tanh::Expr_Tanh ******/
		/****** md5 signature: 28ce53f706ca5ca2e9cb73c237d02437 ******/
		%feature("compactdefaultargs") Expr_Tanh;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
None

Description
-----------
Creates the hyperbolic tangent of <exp>.
") Expr_Tanh;
		 Expr_Tanh(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_Tanh::Copy ******/
		/****** md5 signature: 959911c21ab8344ca7df9189a97166b1 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****** Expr_Tanh::Derivative ******/
		/****** md5 signature: 270fc2b9646e490f90b1b721eeed146d ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the derivative on <x> unknown of <self>.
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****** Expr_Tanh::Evaluate ******/
		/****** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****** Expr_Tanh::IsIdentical ******/
		/****** md5 signature: 887141aa7f58c129eb32231276e0f0fa ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
Other: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****** Expr_Tanh::IsLinear ******/
		/****** md5 signature: 5e125c70746046ac726ed804bbbf922f ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsLinear;
		Standard_Boolean IsLinear();

		/****** Expr_Tanh::ShallowSimplified ******/
		/****** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ******/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after a simplification of the arguments of <self>.
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****** Expr_Tanh::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_Tanh)

%extend Expr_Tanh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Expr_UnaryFunction *
***************************/
class Expr_UnaryFunction : public Expr_UnaryExpression {
	public:
		/****** Expr_UnaryFunction::Expr_UnaryFunction ******/
		/****** md5 signature: 29f391e131f9f953fe129056419f1834 ******/
		%feature("compactdefaultargs") Expr_UnaryFunction;
		%feature("autodoc", "
Parameters
----------
func: Expr_GeneralFunction
exp: Expr_GeneralExpression

Return
-------
None

Description
-----------
Creates me as <func>(<exp>). raises exception if <func> is not unary.
") Expr_UnaryFunction;
		 Expr_UnaryFunction(const opencascade::handle<Expr_GeneralFunction> & func, const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_UnaryFunction::Copy ******/
		/****** md5 signature: 959911c21ab8344ca7df9189a97166b1 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****** Expr_UnaryFunction::Derivative ******/
		/****** md5 signature: 270fc2b9646e490f90b1b721eeed146d ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the derivative on <x> unknown of <self>.
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****** Expr_UnaryFunction::Evaluate ******/
		/****** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****** Expr_UnaryFunction::Function ******/
		/****** md5 signature: f027f2800a46ad0cf94502538104cf73 ******/
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralFunction>

Description
-----------
Returns the function defining <self>.
") Function;
		opencascade::handle<Expr_GeneralFunction> Function();

		/****** Expr_UnaryFunction::IsIdentical ******/
		/****** md5 signature: 887141aa7f58c129eb32231276e0f0fa ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
Other: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****** Expr_UnaryFunction::IsLinear ******/
		/****** md5 signature: 5e125c70746046ac726ed804bbbf922f ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsLinear;
		Standard_Boolean IsLinear();

		/****** Expr_UnaryFunction::ShallowSimplified ******/
		/****** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ******/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after a simplification of the arguments of <self>.
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****** Expr_UnaryFunction::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_UnaryFunction)

%extend Expr_UnaryFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Expr_UnaryMinus *
************************/
class Expr_UnaryMinus : public Expr_UnaryExpression {
	public:
		/****** Expr_UnaryMinus::Expr_UnaryMinus ******/
		/****** md5 signature: 0ab675cc7ee867851527a908d57cb712 ******/
		%feature("compactdefaultargs") Expr_UnaryMinus;
		%feature("autodoc", "
Parameters
----------
exp: Expr_GeneralExpression

Return
-------
None

Description
-----------
Create the unary minus of <exp>.
") Expr_UnaryMinus;
		 Expr_UnaryMinus(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****** Expr_UnaryMinus::Copy ******/
		/****** md5 signature: 959911c21ab8344ca7df9189a97166b1 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a copy of <self> having the same unknowns and functions.
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****** Expr_UnaryMinus::Derivative ******/
		/****** md5 signature: 270fc2b9646e490f90b1b721eeed146d ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the derivative on <x> unknown of <self>.
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****** Expr_UnaryMinus::Evaluate ******/
		/****** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Return
-------
float

Description
-----------
Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****** Expr_UnaryMinus::IsIdentical ******/
		/****** md5 signature: 887141aa7f58c129eb32231276e0f0fa ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
Other: Expr_GeneralExpression

Return
-------
bool

Description
-----------
Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****** Expr_UnaryMinus::IsLinear ******/
		/****** md5 signature: 5e125c70746046ac726ed804bbbf922f ******/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsLinear;
		Standard_Boolean IsLinear();

		/****** Expr_UnaryMinus::NDerivative ******/
		/****** md5 signature: 64fe21d732fcfe80f37aea7c134ab146 ******/
		%feature("compactdefaultargs") NDerivative;
		%feature("autodoc", "
Parameters
----------
X: Expr_NamedUnknown
N: int

Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns the <n>-th derivative on <x> unknown of <self>. raises outofrange if <n> <= 0.
") NDerivative;
		virtual opencascade::handle<Expr_GeneralExpression> NDerivative(const opencascade::handle<Expr_NamedUnknown> & X, const Standard_Integer N);

		/****** Expr_UnaryMinus::ShallowSimplified ******/
		/****** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ******/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Return
-------
opencascade::handle<Expr_GeneralExpression>

Description
-----------
Returns a generalexpression after a simplification of the arguments of <self>.
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****** Expr_UnaryMinus::String ******/
		/****** md5 signature: 29eba20994c971e692980f5879c5ee19 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string representing <self> in a readable way.
") String;
		TCollection_AsciiString String();

};


%make_alias(Expr_UnaryMinus)

%extend Expr_UnaryMinus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class Expr_Sign:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def expr_CopyShare(*args):
	return expr.CopyShare(*args)

@deprecated
def expr_NbOfFreeVariables(*args):
	return expr.NbOfFreeVariables(*args)

@deprecated
def expr_NbOfFreeVariables(*args):
	return expr.NbOfFreeVariables(*args)

@deprecated
def expr_Sign(*args):
	return expr.Sign(*args)

}
