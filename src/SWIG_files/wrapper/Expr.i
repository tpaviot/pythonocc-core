/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_expr.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/* python proy classes for enums */
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

%extend NCollection_Array1<opencascade::handle<Expr_GeneralExpression>> {
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
%template(Expr_Array1OfNamedUnknown) NCollection_Array1<opencascade::handle<Expr_NamedUnknown>>;

%extend NCollection_Array1<opencascade::handle<Expr_NamedUnknown>> {
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
%template(Expr_Array1OfSingleRelation) NCollection_Array1<opencascade::handle<Expr_SingleRelation>>;

%extend NCollection_Array1<opencascade::handle<Expr_SingleRelation>> {
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
%template(Expr_MapOfNamedUnknown) NCollection_IndexedMap<opencascade::handle<Expr_NamedUnknown>,TColStd_MapTransientHasher>;
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
typedef NCollection_IndexedMap<opencascade::handle<Expr_NamedUnknown>, TColStd_MapTransientHasher> Expr_MapOfNamedUnknown;
typedef NCollection_Sequence<opencascade::handle<Expr_GeneralExpression>> Expr_SequenceOfGeneralExpression;
typedef NCollection_Sequence<opencascade::handle<Expr_GeneralRelation>> Expr_SequenceOfGeneralRelation;
/* end typedefs declaration */

/*************
* class Expr *
*************/
%rename(expr) Expr;
class Expr {
	public:
		/****************** CopyShare ******************/
		/**** md5 signature: d48eccb7b89758844acfc25cc647f57e ****/
		%feature("compactdefaultargs") CopyShare;
		%feature("autodoc", "No available documentation.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") CopyShare;
		static opencascade::handle<Expr_GeneralExpression> CopyShare(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** NbOfFreeVariables ******************/
		/**** md5 signature: 36d680bf41b499b8369321ad9dee0b84 ****/
		%feature("compactdefaultargs") NbOfFreeVariables;
		%feature("autodoc", "No available documentation.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
int
") NbOfFreeVariables;
		static Standard_Integer NbOfFreeVariables(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** NbOfFreeVariables ******************/
		/**** md5 signature: 047e2ea750a39104e0919c01f4310598 ****/
		%feature("compactdefaultargs") NbOfFreeVariables;
		%feature("autodoc", "No available documentation.

Parameters
----------
exp: Expr_GeneralRelation

Returns
-------
int
") NbOfFreeVariables;
		static Standard_Integer NbOfFreeVariables(const opencascade::handle<Expr_GeneralRelation> & exp);

		/****************** Sign ******************/
		/**** md5 signature: af50bfd48660a25f9e0da3bfcfe579d8 ****/
		%feature("compactdefaultargs") Sign;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: float

Returns
-------
float
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
		/****************** Contains ******************/
		/**** md5 signature: 31cab92e606acfecbb683acb8f59676f ****/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "Tests if <exp> is contained in <self>.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
bool
") Contains;
		virtual Standard_Boolean Contains(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** ContainsUnknowns ******************/
		/**** md5 signature: fe8bc4584a92957711d27da74f7c8f38 ****/
		%feature("compactdefaultargs") ContainsUnknowns;
		%feature("autodoc", "Tests if <self> contains namedunknowns.

Returns
-------
bool
") ContainsUnknowns;
		virtual Standard_Boolean ContainsUnknowns();

		/****************** Copy ******************/
		/**** md5 signature: b163b65864f2e0a48b494b9d637cfa27 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Copy;
		virtual opencascade::handle<Expr_GeneralExpression> Copy();

		/****************** Derivative ******************/
		/**** md5 signature: 169c12333fa969123d334c3458dd9659 ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the derivative on <x> unknown of <self>.

Parameters
----------
X: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Derivative;
		virtual opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****************** Evaluate ******************/
		/**** md5 signature: 1c263047827fe37a8309acaa0d1748ef ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.

Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		virtual Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****************** EvaluateNumeric ******************/
		/**** md5 signature: e655ba51f3af9f0af0398fde1f6c3a05 ****/
		%feature("compactdefaultargs") EvaluateNumeric;
		%feature("autodoc", "Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.

Returns
-------
float
") EvaluateNumeric;
		Standard_Real EvaluateNumeric();

		/****************** IsIdentical ******************/
		/**** md5 signature: 6e845e0dd031558efec6eef844b102d1 ****/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if <self> and <other> define the same expression. warning: this method does not include any simplification before testing. it could also be very slow; to be used carefully.

Parameters
----------
Other: Expr_GeneralExpression

Returns
-------
bool
") IsIdentical;
		virtual Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****************** IsLinear ******************/
		/**** md5 signature: 5b0102ab4337ebad63f43ab9fc519d87 ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Tests if <self> is linear on every namedunknown it contains.

Returns
-------
bool
") IsLinear;
		virtual Standard_Boolean IsLinear();

		/****************** IsShareable ******************/
		/**** md5 signature: 0b89020067d4f33e32c203c0dd92577b ****/
		%feature("compactdefaultargs") IsShareable;
		%feature("autodoc", "Tests if <self> can be shared by one or more expressions or must be copied. this method returns false as a default value. to be redefined ( especially for namedunknown).

Returns
-------
bool
") IsShareable;
		virtual Standard_Boolean IsShareable();

		/****************** NDerivative ******************/
		/**** md5 signature: d0cd6821321f2875d0ad6c0a509707e4 ****/
		%feature("compactdefaultargs") NDerivative;
		%feature("autodoc", "Returns the <n>-th derivative on <x> unknown of <self>. raise outofrange if n <= 0.

Parameters
----------
X: Expr_NamedUnknown
N: int

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") NDerivative;
		virtual opencascade::handle<Expr_GeneralExpression> NDerivative(const opencascade::handle<Expr_NamedUnknown> & X, const Standard_Integer N);

		/****************** NbSubExpressions ******************/
		/**** md5 signature: d80b384932e886f68b503f4fffb23ca5 ****/
		%feature("compactdefaultargs") NbSubExpressions;
		%feature("autodoc", "Returns the number of sub-expressions contained in <self> ( >= 0).

Returns
-------
int
") NbSubExpressions;
		virtual Standard_Integer NbSubExpressions();

		/****************** Replace ******************/
		/**** md5 signature: 21a054e81da4e62ac63c7025abefabe3 ****/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "Replaces all occurences of <var> with copies of <with> in <self>. copies of <with> are made with the copy() method. raises invalidoperand if <with> contains <self>.

Parameters
----------
var: Expr_NamedUnknown
with: Expr_GeneralExpression

Returns
-------
None
") Replace;
		virtual void Replace(const opencascade::handle<Expr_NamedUnknown> & var, const opencascade::handle<Expr_GeneralExpression> & with);

		/****************** ShallowSimplified ******************/
		/**** md5 signature: a3d819883b560c025271777b456eecd6 ****/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Returns a generalexpression after a simplification of the arguments of <self>.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		virtual opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****************** Simplified ******************/
		/**** md5 signature: f835bd04e697f4219aee2bcda46f41d7 ****/
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "Returns a generalexpression after replacement of namedunknowns by an associated expression and after values computation.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Simplified;
		virtual opencascade::handle<Expr_GeneralExpression> Simplified();

		/****************** String ******************/
		/**** md5 signature: d9017ee331ccdefb86321aa3bd5483ad ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
") String;
		virtual TCollection_AsciiString String();

		/****************** SubExpression ******************/
		/**** md5 signature: 142336577b7108577c3b4c4a3236df33 ****/
		%feature("compactdefaultargs") SubExpression;
		%feature("autodoc", "Returns the <i>-th sub-expression of <self> raises outofrange if <i> > nbsubexpressions(me).

Parameters
----------
I: int

Returns
-------
opencascade::handle<Expr_GeneralExpression>
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
		/****************** Copy ******************/
		/**** md5 signature: b86cf4805c2e056091b3f874bcdf1183 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> with the same form.

Returns
-------
opencascade::handle<Expr_GeneralFunction>
") Copy;
		virtual opencascade::handle<Expr_GeneralFunction> Copy();

		/****************** Derivative ******************/
		/**** md5 signature: 7a2425c3b5cde7b417cd621d5c281381 ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns derivative of <self> for variable <var>.

Parameters
----------
var: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralFunction>
") Derivative;
		virtual opencascade::handle<Expr_GeneralFunction> Derivative(const opencascade::handle<Expr_NamedUnknown> & var);

		/****************** Derivative ******************/
		/**** md5 signature: 2ae1baeef461cfc92beef1aed8c33ab3 ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns derivative of <self> for variable <var> with degree <deg>.

Parameters
----------
var: Expr_NamedUnknown
deg: int

Returns
-------
opencascade::handle<Expr_GeneralFunction>
") Derivative;
		virtual opencascade::handle<Expr_GeneralFunction> Derivative(const opencascade::handle<Expr_NamedUnknown> & var, const Standard_Integer deg);

		/****************** Evaluate ******************/
		/**** md5 signature: 1c263047827fe37a8309acaa0d1748ef ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Computes the value of <self> with the given variables. raises notevaluable if <vars> does not match all variables of <self>.

Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		virtual Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****************** GetStringName ******************/
		/**** md5 signature: eee1f2d436d373d354f09e73253adae0 ****/
		%feature("compactdefaultargs") GetStringName;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_AsciiString
") GetStringName;
		virtual TCollection_AsciiString GetStringName();

		/****************** IsIdentical ******************/
		/**** md5 signature: 27e5ec218c5aeef2bc9718cdbeae5e9a ****/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if <self> and <func> are similar functions (same name and same used expression).

Parameters
----------
func: Expr_GeneralFunction

Returns
-------
bool
") IsIdentical;
		virtual Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralFunction> & func);

		/****************** IsLinearOnVariable ******************/
		/**** md5 signature: e5fd5c3e3227fa0318b60adc2e010fcc ****/
		%feature("compactdefaultargs") IsLinearOnVariable;
		%feature("autodoc", "Tests if <self> is linear on variable on range <index>.

Parameters
----------
index: int

Returns
-------
bool
") IsLinearOnVariable;
		virtual Standard_Boolean IsLinearOnVariable(const Standard_Integer index);

		/****************** NbOfVariables ******************/
		/**** md5 signature: c404ab89688760def89f027a9ad5a60b ****/
		%feature("compactdefaultargs") NbOfVariables;
		%feature("autodoc", "Returns the number of variables of <self>.

Returns
-------
int
") NbOfVariables;
		virtual Standard_Integer NbOfVariables();

		/****************** Variable ******************/
		/**** md5 signature: 2e1d3cff7009f972f33e60a1d60209be ****/
		%feature("compactdefaultargs") Variable;
		%feature("autodoc", "Returns the variable denoted by <index> in <self>. raises outofrange if index > nbofvariables.

Parameters
----------
index: int

Returns
-------
opencascade::handle<Expr_NamedUnknown>
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
		/****************** Contains ******************/
		/**** md5 signature: 31cab92e606acfecbb683acb8f59676f ****/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "Tests if <exp> contains <var>.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
bool
") Contains;
		virtual Standard_Boolean Contains(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** Copy ******************/
		/**** md5 signature: 32797f10d7966e7f7e5e589c87c53e35 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralRelation>
") Copy;
		virtual opencascade::handle<Expr_GeneralRelation> Copy();

		/****************** IsLinear ******************/
		/**** md5 signature: 5b0102ab4337ebad63f43ab9fc519d87 ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Tests if <self> is linear between its namedunknowns.

Returns
-------
bool
") IsLinear;
		virtual Standard_Boolean IsLinear();

		/****************** IsSatisfied ******************/
		/**** md5 signature: e2fed82b75e36d17062ba6595b0ee8b5 ****/
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "Returns the current status of the relation.

Returns
-------
bool
") IsSatisfied;
		virtual Standard_Boolean IsSatisfied();

		/****************** NbOfSingleRelations ******************/
		/**** md5 signature: a2a7f18724bcc4ac714342dc5837f4a7 ****/
		%feature("compactdefaultargs") NbOfSingleRelations;
		%feature("autodoc", "Returns the number of singlerelations contained in <self>.

Returns
-------
int
") NbOfSingleRelations;
		virtual Standard_Integer NbOfSingleRelations();

		/****************** NbOfSubRelations ******************/
		/**** md5 signature: f50bdc6a51355e7032bedc85ac540baf ****/
		%feature("compactdefaultargs") NbOfSubRelations;
		%feature("autodoc", "Returns the number of relations contained in <self>.

Returns
-------
int
") NbOfSubRelations;
		virtual Standard_Integer NbOfSubRelations();

		/****************** Replace ******************/
		/**** md5 signature: 21a054e81da4e62ac63c7025abefabe3 ****/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "Replaces all occurences of <var> with <with> in <self>.

Parameters
----------
var: Expr_NamedUnknown
with: Expr_GeneralExpression

Returns
-------
None
") Replace;
		virtual void Replace(const opencascade::handle<Expr_NamedUnknown> & var, const opencascade::handle<Expr_GeneralExpression> & with);

		/****************** Simplified ******************/
		/**** md5 signature: f745b8c1c665b5a2e782af7a0da5ede6 ****/
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "Returns a generalrelation after replacement of namedunknowns by an associated expression, and after values computation.

Returns
-------
opencascade::handle<Expr_GeneralRelation>
") Simplified;
		virtual opencascade::handle<Expr_GeneralRelation> Simplified();

		/****************** Simplify ******************/
		/**** md5 signature: f5a963ffa297c796250829f5cf853235 ****/
		%feature("compactdefaultargs") Simplify;
		%feature("autodoc", "Replaces namedunknowns by associated expressions, and computes values in <self>.

Returns
-------
None
") Simplify;
		virtual void Simplify();

		/****************** String ******************/
		/**** md5 signature: d9017ee331ccdefb86321aa3bd5483ad ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
") String;
		virtual TCollection_AsciiString String();

		/****************** SubRelation ******************/
		/**** md5 signature: 091fd623341eb2614469201b4ad02722 ****/
		%feature("compactdefaultargs") SubRelation;
		%feature("autodoc", "Returns the relation denoted by <index> in <self>. an exception is raised if <index> is out of range.

Parameters
----------
index: int

Returns
-------
opencascade::handle<Expr_GeneralRelation>
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
		/****************** Expr_RUIterator ******************/
		/**** md5 signature: 96a0f76d1cdc7e48c7d9f472035d00b2 ****/
		%feature("compactdefaultargs") Expr_RUIterator;
		%feature("autodoc", "Creates an iterator on every namedunknown contained in <rel>.

Parameters
----------
rel: Expr_GeneralRelation

Returns
-------
None
") Expr_RUIterator;
		 Expr_RUIterator(const opencascade::handle<Expr_GeneralRelation> & rel);

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns false if on other unknown remains.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Next;
		void Next();

		/****************** Value ******************/
		/**** md5 signature: f8585997db9a5e8ea8d58782235870b7 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns current namedunknown. raises exception if no more unknowns remain.

Returns
-------
opencascade::handle<Expr_NamedUnknown>
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
		/****************** Expr_RelationIterator ******************/
		/**** md5 signature: 2f911bdfc89b17db47c12012534ae61a ****/
		%feature("compactdefaultargs") Expr_RelationIterator;
		%feature("autodoc", "No available documentation.

Parameters
----------
rel: Expr_GeneralRelation

Returns
-------
None
") Expr_RelationIterator;
		 Expr_RelationIterator(const opencascade::handle<Expr_GeneralRelation> & rel);

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns false if no other relation remains.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Next;
		void Next();

		/****************** Value ******************/
		/**** md5 signature: 5220559ff14b6682327b64ff62b3e9ad ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns current basic relation. exception is raised if no more relation remains.

Returns
-------
opencascade::handle<Expr_SingleRelation>
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
		/****************** Expr_UnknownIterator ******************/
		/**** md5 signature: 07061646201d428fa94e1e8b791d9bc6 ****/
		%feature("compactdefaultargs") Expr_UnknownIterator;
		%feature("autodoc", "No available documentation.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
None
") Expr_UnknownIterator;
		 Expr_UnknownIterator(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Next;
		void Next();

		/****************** Value ******************/
		/**** md5 signature: f8585997db9a5e8ea8d58782235870b7 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Expr_NamedUnknown>
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
		/****************** Contains ******************/
		/**** md5 signature: 4d3e3a365e28051266a44f7d96eb9917 ****/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "Tests if <self> contains <exp>.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
bool
") Contains;
		Standard_Boolean Contains(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** ContainsUnknowns ******************/
		/**** md5 signature: 847c37fd1fdb87ce3fd4b89fbb7d8d46 ****/
		%feature("compactdefaultargs") ContainsUnknowns;
		%feature("autodoc", "Does <self> contain namedunknown ?.

Returns
-------
bool
") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns();

		/****************** FirstOperand ******************/
		/**** md5 signature: 4d1ac3afe76d92fa3075aa20917b7eb2 ****/
		%feature("compactdefaultargs") FirstOperand;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") FirstOperand;
		const opencascade::handle<Expr_GeneralExpression> & FirstOperand();

		/****************** NbSubExpressions ******************/
		/**** md5 signature: bd59d3a2c33cb431e9b8695901cbe037 ****/
		%feature("compactdefaultargs") NbSubExpressions;
		%feature("autodoc", "Returns the number of sub-expressions contained in <self> ( >= 0).

Returns
-------
int
") NbSubExpressions;
		Standard_Integer NbSubExpressions();

		/****************** Replace ******************/
		/**** md5 signature: d1980891db2f275bbc6d54eac796d58d ****/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "Replaces all occurences of <var> with <with> in <self>. raises invalidoperand if <with> contains <self>.

Parameters
----------
var: Expr_NamedUnknown
with: Expr_GeneralExpression

Returns
-------
None
") Replace;
		void Replace(const opencascade::handle<Expr_NamedUnknown> & var, const opencascade::handle<Expr_GeneralExpression> & with);

		/****************** SecondOperand ******************/
		/**** md5 signature: c616b0eb5bc021085ff7b9fb543fd29d ****/
		%feature("compactdefaultargs") SecondOperand;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") SecondOperand;
		const opencascade::handle<Expr_GeneralExpression> & SecondOperand();

		/****************** SetFirstOperand ******************/
		/**** md5 signature: 414b59e7889a2754180ee9b0c6a7ed1c ****/
		%feature("compactdefaultargs") SetFirstOperand;
		%feature("autodoc", "Sets first operand of <self> raises invalidoperand if exp = me.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
None
") SetFirstOperand;
		void SetFirstOperand(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** SetSecondOperand ******************/
		/**** md5 signature: ba8d700e8810c98f38d6c76a3ea7bf34 ****/
		%feature("compactdefaultargs") SetSecondOperand;
		%feature("autodoc", "Sets second operand of <self> raises invalidoperand if <exp> contains <self>.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
None
") SetSecondOperand;
		void SetSecondOperand(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** Simplified ******************/
		/**** md5 signature: 28f32c755b08a477aaaa66888fafbe45 ****/
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "Returns a generalexpression after replacement of namedunknowns by an associated expression and after values computation.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Simplified;
		opencascade::handle<Expr_GeneralExpression> Simplified();

		/****************** SubExpression ******************/
		/**** md5 signature: da538711b3889bbe62310fe1c52e3fd2 ****/
		%feature("compactdefaultargs") SubExpression;
		%feature("autodoc", "Returns the <i>-th sub-expression of <self> raises outofrange if <i> > nbsubexpressions(me).

Parameters
----------
I: int

Returns
-------
opencascade::handle<Expr_GeneralExpression>
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
		/****************** Expr_FunctionDerivative ******************/
		/**** md5 signature: 2e9ddaed13911ee38b6b8ff20516f9f7 ****/
		%feature("compactdefaultargs") Expr_FunctionDerivative;
		%feature("autodoc", "Creates a functionderivative of degree <deg> relative to the <withx> variable. raises outofrange if <deg> lower or equal to zero.

Parameters
----------
func: Expr_GeneralFunction
withX: Expr_NamedUnknown
deg: int

Returns
-------
None
") Expr_FunctionDerivative;
		 Expr_FunctionDerivative(const opencascade::handle<Expr_GeneralFunction> & func, const opencascade::handle<Expr_NamedUnknown> & withX, const Standard_Integer deg);

		/****************** Copy ******************/
		/**** md5 signature: f36e6e5f7be603f7eb908df39a6c3a7d ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> with the same form.

Returns
-------
opencascade::handle<Expr_GeneralFunction>
") Copy;
		opencascade::handle<Expr_GeneralFunction> Copy();

		/****************** Degree ******************/
		/**** md5 signature: e3276df1ce733e2c8e940db548a26d03 ****/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Returns the degree of derivation of <self>.

Returns
-------
int
") Degree;
		Standard_Integer Degree();

		/****************** DerivVariable ******************/
		/**** md5 signature: 74f206cb98facd5fc0f44138ef5cf3f3 ****/
		%feature("compactdefaultargs") DerivVariable;
		%feature("autodoc", "Returns the derivation variable of <self>.

Returns
-------
opencascade::handle<Expr_NamedUnknown>
") DerivVariable;
		opencascade::handle<Expr_NamedUnknown> DerivVariable();

		/****************** Derivative ******************/
		/**** md5 signature: 412fa68e0589115a98050f3e9dbd3130 ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns derivative of <self> for variable <var>.

Parameters
----------
var: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralFunction>
") Derivative;
		opencascade::handle<Expr_GeneralFunction> Derivative(const opencascade::handle<Expr_NamedUnknown> & var);

		/****************** Derivative ******************/
		/**** md5 signature: 40e0677ee3bb33acc2e7435c50229eb7 ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns derivative of <self> for variable <var> with degree <deg>.

Parameters
----------
var: Expr_NamedUnknown
deg: int

Returns
-------
opencascade::handle<Expr_GeneralFunction>
") Derivative;
		opencascade::handle<Expr_GeneralFunction> Derivative(const opencascade::handle<Expr_NamedUnknown> & var, const Standard_Integer deg);

		/****************** Evaluate ******************/
		/**** md5 signature: cc8c16a3ebe1a6688a0b62678d8ecf65 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Computes the value of <self> with the given variables. raises dimensionmismatch if length(vars) is different from length(values).

Parameters
----------
vars: Expr_Array1OfNamedUnknown
values: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & values);

		/****************** Expression ******************/
		/**** md5 signature: 5ca63dd06176a0c3c49989c229b9fbf6 ****/
		%feature("compactdefaultargs") Expression;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Expression;
		opencascade::handle<Expr_GeneralExpression> Expression();

		/****************** Function ******************/
		/**** md5 signature: f027f2800a46ad0cf94502538104cf73 ****/
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "Returns the function of which <self> is the derivative.

Returns
-------
opencascade::handle<Expr_GeneralFunction>
") Function;
		opencascade::handle<Expr_GeneralFunction> Function();

		/****************** GetStringName ******************/
		/**** md5 signature: 6a84152af4e49ae604b0e33ac8f2f4a2 ****/
		%feature("compactdefaultargs") GetStringName;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_AsciiString
") GetStringName;
		TCollection_AsciiString GetStringName();

		/****************** IsIdentical ******************/
		/**** md5 signature: bb54bc47e414ff54a21664310fb9bc25 ****/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if <self> and <func> are similar functions (same name and same used expression).

Parameters
----------
func: Expr_GeneralFunction

Returns
-------
bool
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralFunction> & func);

		/****************** IsLinearOnVariable ******************/
		/**** md5 signature: 587a473c1f08e070e5c0583b9b9b81fd ****/
		%feature("compactdefaultargs") IsLinearOnVariable;
		%feature("autodoc", "Tests if <self> is linear on variable on range <index>.

Parameters
----------
index: int

Returns
-------
bool
") IsLinearOnVariable;
		Standard_Boolean IsLinearOnVariable(const Standard_Integer index);

		/****************** NbOfVariables ******************/
		/**** md5 signature: 3b7291949e1ea6abf8d9ffaf9f506f15 ****/
		%feature("compactdefaultargs") NbOfVariables;
		%feature("autodoc", "Returns the number of variables of <self>.

Returns
-------
int
") NbOfVariables;
		Standard_Integer NbOfVariables();

		/****************** UpdateExpression ******************/
		/**** md5 signature: 920846d576fe48e51a41d5ce007681ee ****/
		%feature("compactdefaultargs") UpdateExpression;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") UpdateExpression;
		void UpdateExpression();

		/****************** Variable ******************/
		/**** md5 signature: 0dd774ec75a9b517f5abdc7feceaa26a ****/
		%feature("compactdefaultargs") Variable;
		%feature("autodoc", "Returns the variable denoted by <index> in <self>. raises outofrange if <index> greater than nbofvariables of <self>.

Parameters
----------
index: int

Returns
-------
opencascade::handle<Expr_NamedUnknown>
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
		/****************** GetName ******************/
		/**** md5 signature: 7e9f481c5e74ef85da5447ebc73bfcfb ****/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_AsciiString
") GetName;
		const TCollection_AsciiString & GetName();

		/****************** IsIdentical ******************/
		/**** md5 signature: 887141aa7f58c129eb32231276e0f0fa ****/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.

Parameters
----------
Other: Expr_GeneralExpression

Returns
-------
bool
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****************** IsShareable ******************/
		/**** md5 signature: ae4969db1c26a8dd1e5f841bfcb4c91c ****/
		%feature("compactdefaultargs") IsShareable;
		%feature("autodoc", "Tests if <self> can be shared by one or more expressions or must be copied. this method redefines to a true value the generalexpression method.

Returns
-------
bool
") IsShareable;
		virtual Standard_Boolean IsShareable();

		/****************** SetName ******************/
		/**** md5 signature: 961c448818ed938d0d41ca6dc539aefb ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
name: TCollection_AsciiString

Returns
-------
None
") SetName;
		void SetName(const TCollection_AsciiString & name);

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
		/****************** Expr_NamedFunction ******************/
		/**** md5 signature: 8799d3a2a10f81fbea297f54e8c473e1 ****/
		%feature("compactdefaultargs") Expr_NamedFunction;
		%feature("autodoc", "Creates a function of given variables <vars> with name <name> defined by the expression <exp>.

Parameters
----------
name: TCollection_AsciiString
exp: Expr_GeneralExpression
vars: Expr_Array1OfNamedUnknown

Returns
-------
None
") Expr_NamedFunction;
		 Expr_NamedFunction(const TCollection_AsciiString & name, const opencascade::handle<Expr_GeneralExpression> & exp, const Expr_Array1OfNamedUnknown & vars);

		/****************** Copy ******************/
		/**** md5 signature: f36e6e5f7be603f7eb908df39a6c3a7d ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> with the same form.

Returns
-------
opencascade::handle<Expr_GeneralFunction>
") Copy;
		opencascade::handle<Expr_GeneralFunction> Copy();

		/****************** Derivative ******************/
		/**** md5 signature: 412fa68e0589115a98050f3e9dbd3130 ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns derivative of <self> for variable <var>.

Parameters
----------
var: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralFunction>
") Derivative;
		opencascade::handle<Expr_GeneralFunction> Derivative(const opencascade::handle<Expr_NamedUnknown> & var);

		/****************** Derivative ******************/
		/**** md5 signature: 40e0677ee3bb33acc2e7435c50229eb7 ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns derivative of <self> for variable <var> with degree <deg>.

Parameters
----------
var: Expr_NamedUnknown
deg: int

Returns
-------
opencascade::handle<Expr_GeneralFunction>
") Derivative;
		opencascade::handle<Expr_GeneralFunction> Derivative(const opencascade::handle<Expr_NamedUnknown> & var, const Standard_Integer deg);

		/****************** Evaluate ******************/
		/**** md5 signature: cc8c16a3ebe1a6688a0b62678d8ecf65 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Computes the value of <self> with the given variables. raises dimensionmismatch if length(vars) is different from length(values).

Parameters
----------
vars: Expr_Array1OfNamedUnknown
values: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & values);

		/****************** Expression ******************/
		/**** md5 signature: 5ca63dd06176a0c3c49989c229b9fbf6 ****/
		%feature("compactdefaultargs") Expression;
		%feature("autodoc", "Returns equivalent expression of <self>.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Expression;
		opencascade::handle<Expr_GeneralExpression> Expression();

		/****************** GetName ******************/
		/**** md5 signature: 098fcb2e74ace7a58df723e39192378f ****/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "Returns the name assigned to <self>.

Returns
-------
TCollection_AsciiString
") GetName;
		TCollection_AsciiString GetName();

		/****************** GetStringName ******************/
		/**** md5 signature: 6a84152af4e49ae604b0e33ac8f2f4a2 ****/
		%feature("compactdefaultargs") GetStringName;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_AsciiString
") GetStringName;
		TCollection_AsciiString GetStringName();

		/****************** IsIdentical ******************/
		/**** md5 signature: bb54bc47e414ff54a21664310fb9bc25 ****/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if <self> and <func> are similar functions (same name and same used expression).

Parameters
----------
func: Expr_GeneralFunction

Returns
-------
bool
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralFunction> & func);

		/****************** IsLinearOnVariable ******************/
		/**** md5 signature: 587a473c1f08e070e5c0583b9b9b81fd ****/
		%feature("compactdefaultargs") IsLinearOnVariable;
		%feature("autodoc", "Tests if <self> is linear on variable on range <index>.

Parameters
----------
index: int

Returns
-------
bool
") IsLinearOnVariable;
		Standard_Boolean IsLinearOnVariable(const Standard_Integer index);

		/****************** NbOfVariables ******************/
		/**** md5 signature: 3b7291949e1ea6abf8d9ffaf9f506f15 ****/
		%feature("compactdefaultargs") NbOfVariables;
		%feature("autodoc", "Returns the number of variables of <self>.

Returns
-------
int
") NbOfVariables;
		Standard_Integer NbOfVariables();

		/****************** SetExpression ******************/
		/**** md5 signature: de7a5ac287b97599e049e91fa920a484 ****/
		%feature("compactdefaultargs") SetExpression;
		%feature("autodoc", "Modifies expression of <self>. warning: beware of derivatives. see functionderivative.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
None
") SetExpression;
		void SetExpression(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** SetName ******************/
		/**** md5 signature: 8529c8f1140dc6e77e0918ed884f85a2 ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Sets the name <newname> to <self>.

Parameters
----------
newname: TCollection_AsciiString

Returns
-------
None
") SetName;
		void SetName(const TCollection_AsciiString & newname);

		/****************** Variable ******************/
		/**** md5 signature: 0dd774ec75a9b517f5abdc7feceaa26a ****/
		%feature("compactdefaultargs") Variable;
		%feature("autodoc", "Returns the variable denoted by <index> in <self>. raises outofrange if <index> is greater than nbofvariables of <self>, or less than or equal to zero.

Parameters
----------
index: int

Returns
-------
opencascade::handle<Expr_NamedUnknown>
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
		/****************** Expr_NumericValue ******************/
		/**** md5 signature: 9b95df436c4a29758583ad509b238ccc ****/
		%feature("compactdefaultargs") Expr_NumericValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: float

Returns
-------
None
") Expr_NumericValue;
		 Expr_NumericValue(const Standard_Real val);

		/****************** Contains ******************/
		/**** md5 signature: 4d3e3a365e28051266a44f7d96eb9917 ****/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "Tests if <exp> is contained in <self>.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
bool
") Contains;
		Standard_Boolean Contains(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** ContainsUnknowns ******************/
		/**** md5 signature: 847c37fd1fdb87ce3fd4b89fbb7d8d46 ****/
		%feature("compactdefaultargs") ContainsUnknowns;
		%feature("autodoc", "Tests if <self> contains namedunknown.

Returns
-------
bool
") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns();

		/****************** Copy ******************/
		/**** md5 signature: 959911c21ab8344ca7df9189a97166b1 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****************** Derivative ******************/
		/**** md5 signature: 270fc2b9646e490f90b1b721eeed146d ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the derivative on <x> unknown of <self>.

Parameters
----------
X: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****************** Evaluate ******************/
		/**** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Returns the value of <self> (as a real) by replacement of <vars> by <vals>.

Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****************** GetValue ******************/
		/**** md5 signature: 2863c7a566efd7be6530d131f7f2cf29 ****/
		%feature("compactdefaultargs") GetValue;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") GetValue;
		Standard_Real GetValue();

		/****************** IsIdentical ******************/
		/**** md5 signature: 887141aa7f58c129eb32231276e0f0fa ****/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.

Parameters
----------
Other: Expr_GeneralExpression

Returns
-------
bool
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****************** IsLinear ******************/
		/**** md5 signature: 5e125c70746046ac726ed804bbbf922f ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsLinear;
		Standard_Boolean IsLinear();

		/****************** NDerivative ******************/
		/**** md5 signature: 64fe21d732fcfe80f37aea7c134ab146 ****/
		%feature("compactdefaultargs") NDerivative;
		%feature("autodoc", "Returns the <n>-th derivative on <x> unknown of <self>. raises outofrange if <n> <= 0.

Parameters
----------
X: Expr_NamedUnknown
N: int

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") NDerivative;
		virtual opencascade::handle<Expr_GeneralExpression> NDerivative(const opencascade::handle<Expr_NamedUnknown> & X, const Standard_Integer N);

		/****************** NbSubExpressions ******************/
		/**** md5 signature: bd59d3a2c33cb431e9b8695901cbe037 ****/
		%feature("compactdefaultargs") NbSubExpressions;
		%feature("autodoc", "Returns the number of sub-expressions contained in <self> ( >= 0).

Returns
-------
int
") NbSubExpressions;
		Standard_Integer NbSubExpressions();

		/****************** Replace ******************/
		/**** md5 signature: d1980891db2f275bbc6d54eac796d58d ****/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "Replaces all occurences of <var> with <with> in <self>.

Parameters
----------
var: Expr_NamedUnknown
with: Expr_GeneralExpression

Returns
-------
None
") Replace;
		void Replace(const opencascade::handle<Expr_NamedUnknown> & var, const opencascade::handle<Expr_GeneralExpression> & with);

		/****************** SetValue ******************/
		/**** md5 signature: 306d5cb5d7430ef039d57c40b0690d07 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: float

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Real val);

		/****************** ShallowSimplified ******************/
		/**** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ****/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Returns a generalexpression after a simplification of the arguments of <self>.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****************** Simplified ******************/
		/**** md5 signature: 28f32c755b08a477aaaa66888fafbe45 ****/
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "Returns a generalexpression after replacement of namedunknowns by an associated expression and after values computation.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Simplified;
		opencascade::handle<Expr_GeneralExpression> Simplified();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
") String;
		TCollection_AsciiString String();

		/****************** SubExpression ******************/
		/**** md5 signature: da538711b3889bbe62310fe1c52e3fd2 ****/
		%feature("compactdefaultargs") SubExpression;
		%feature("autodoc", "Returns the <i>-th sub-expression of <self> raises outofrange if <i> > nbsubexpressions(me).

Parameters
----------
I: int

Returns
-------
opencascade::handle<Expr_GeneralExpression>
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
		/****************** Contains ******************/
		/**** md5 signature: 4d3e3a365e28051266a44f7d96eb9917 ****/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "Tests if <exp> is contained in <self>.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
bool
") Contains;
		Standard_Boolean Contains(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** ContainsUnknowns ******************/
		/**** md5 signature: 847c37fd1fdb87ce3fd4b89fbb7d8d46 ****/
		%feature("compactdefaultargs") ContainsUnknowns;
		%feature("autodoc", "Does <self> contains namedunknown ?.

Returns
-------
bool
") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns();

		/****************** NbOperands ******************/
		/**** md5 signature: 1c135bc4d655185cc7d2ed79e42524fd ****/
		%feature("compactdefaultargs") NbOperands;
		%feature("autodoc", "Returns the number of operands contained in <self>.

Returns
-------
int
") NbOperands;
		Standard_Integer NbOperands();

		/****************** NbSubExpressions ******************/
		/**** md5 signature: bd59d3a2c33cb431e9b8695901cbe037 ****/
		%feature("compactdefaultargs") NbSubExpressions;
		%feature("autodoc", "Returns the number of sub-expressions contained in <self> ( >= 2).

Returns
-------
int
") NbSubExpressions;
		Standard_Integer NbSubExpressions();

		/****************** Operand ******************/
		/**** md5 signature: 56c0f61d871217605549e8c156dec152 ****/
		%feature("compactdefaultargs") Operand;
		%feature("autodoc", "Returns the <index>-th operand used in <self>. an exception is raised if index is out of range.

Parameters
----------
index: int

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Operand;
		const opencascade::handle<Expr_GeneralExpression> & Operand(const Standard_Integer index);

		/****************** Replace ******************/
		/**** md5 signature: d1980891db2f275bbc6d54eac796d58d ****/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "Replaces all occurences of <var> with <with> in <self> raises invalidoperand if <with> contains <self>.

Parameters
----------
var: Expr_NamedUnknown
with: Expr_GeneralExpression

Returns
-------
None
") Replace;
		void Replace(const opencascade::handle<Expr_NamedUnknown> & var, const opencascade::handle<Expr_GeneralExpression> & with);

		/****************** SetOperand ******************/
		/**** md5 signature: 408363eed76d555c4e732a12851b2338 ****/
		%feature("compactdefaultargs") SetOperand;
		%feature("autodoc", "Sets the <index>-th operand used in <self>. an exception is raised if <index> is out of range raises invalidoperand if <exp> contains <self>.

Parameters
----------
exp: Expr_GeneralExpression
index: int

Returns
-------
None
") SetOperand;
		void SetOperand(const opencascade::handle<Expr_GeneralExpression> & exp, const Standard_Integer index);

		/****************** Simplified ******************/
		/**** md5 signature: 28f32c755b08a477aaaa66888fafbe45 ****/
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "Returns a generalexpression after replacement of namedunknowns by an associated expression and after values computation.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Simplified;
		opencascade::handle<Expr_GeneralExpression> Simplified();

		/****************** SubExpression ******************/
		/**** md5 signature: da538711b3889bbe62310fe1c52e3fd2 ****/
		%feature("compactdefaultargs") SubExpression;
		%feature("autodoc", "Returns the sub-expression denoted by <i> in <self> raises outofrange if <i> > nbsubexpressions(me).

Parameters
----------
I: int

Returns
-------
opencascade::handle<Expr_GeneralExpression>
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
		/****************** Contains ******************/
		/**** md5 signature: 4d3e3a365e28051266a44f7d96eb9917 ****/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "Tests if <self> contains <exp>.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
bool
") Contains;
		Standard_Boolean Contains(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** FirstMember ******************/
		/**** md5 signature: 44c63ad073e601781abda385cb63949b ****/
		%feature("compactdefaultargs") FirstMember;
		%feature("autodoc", "Returns the first member of the relation.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") FirstMember;
		opencascade::handle<Expr_GeneralExpression> FirstMember();

		/****************** IsLinear ******************/
		/**** md5 signature: 5e125c70746046ac726ed804bbbf922f ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Tests if <self> is linear between its namedunknowns.

Returns
-------
bool
") IsLinear;
		Standard_Boolean IsLinear();

		/****************** NbOfSingleRelations ******************/
		/**** md5 signature: cb5c71421de80d5ccb13ce9b0cfa7e6e ****/
		%feature("compactdefaultargs") NbOfSingleRelations;
		%feature("autodoc", "Returns the number of singlerelations contained in <self> (always 1).

Returns
-------
int
") NbOfSingleRelations;
		Standard_Integer NbOfSingleRelations();

		/****************** NbOfSubRelations ******************/
		/**** md5 signature: eba32d2d912705cec016dd6df3b971e5 ****/
		%feature("compactdefaultargs") NbOfSubRelations;
		%feature("autodoc", "Returns the number of relations contained in <self>.

Returns
-------
int
") NbOfSubRelations;
		Standard_Integer NbOfSubRelations();

		/****************** Replace ******************/
		/**** md5 signature: d1980891db2f275bbc6d54eac796d58d ****/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "Replaces all occurences of <var> with <with> in <self>.

Parameters
----------
var: Expr_NamedUnknown
with: Expr_GeneralExpression

Returns
-------
None
") Replace;
		void Replace(const opencascade::handle<Expr_NamedUnknown> & var, const opencascade::handle<Expr_GeneralExpression> & with);

		/****************** SecondMember ******************/
		/**** md5 signature: 0e1d8e90484bf116cebde74548208f18 ****/
		%feature("compactdefaultargs") SecondMember;
		%feature("autodoc", "Returns the second member of the relation.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") SecondMember;
		opencascade::handle<Expr_GeneralExpression> SecondMember();

		/****************** SetFirstMember ******************/
		/**** md5 signature: 3e78fe28f0b4bdf48efb91f8ab6266eb ****/
		%feature("compactdefaultargs") SetFirstMember;
		%feature("autodoc", "Defines the first member of the relation.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
None
") SetFirstMember;
		void SetFirstMember(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** SetSecondMember ******************/
		/**** md5 signature: 105a1b58a4071c5b0a77e95a44dcf7cc ****/
		%feature("compactdefaultargs") SetSecondMember;
		%feature("autodoc", "Defines the second member of the relation.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
None
") SetSecondMember;
		void SetSecondMember(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** SubRelation ******************/
		/**** md5 signature: e582dddebeec4d0519b16bf1ca106be8 ****/
		%feature("compactdefaultargs") SubRelation;
		%feature("autodoc", "Returns the relation denoted by <index> in <self>. an exception is raised if index is out of range.

Parameters
----------
index: int

Returns
-------
opencascade::handle<Expr_GeneralRelation>
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
		/****************** Expr_SystemRelation ******************/
		/**** md5 signature: f465667b503f538c320345cf4d7ad2ae ****/
		%feature("compactdefaultargs") Expr_SystemRelation;
		%feature("autodoc", "Creates a system with one relation.

Parameters
----------
relation: Expr_GeneralRelation

Returns
-------
None
") Expr_SystemRelation;
		 Expr_SystemRelation(const opencascade::handle<Expr_GeneralRelation> & relation);

		/****************** Add ******************/
		/**** md5 signature: cfb935b2e1b03d830fe75a521740f7db ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Appends <relation> in the list of components of <self>.

Parameters
----------
relation: Expr_GeneralRelation

Returns
-------
None
") Add;
		void Add(const opencascade::handle<Expr_GeneralRelation> & relation);

		/****************** Contains ******************/
		/**** md5 signature: 4d3e3a365e28051266a44f7d96eb9917 ****/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "Tests if <self> contains <exp>.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
bool
") Contains;
		Standard_Boolean Contains(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** Copy ******************/
		/**** md5 signature: 4fb077f1759a1cc123427f28e5b2aaa7 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralRelation>
") Copy;
		opencascade::handle<Expr_GeneralRelation> Copy();

		/****************** IsLinear ******************/
		/**** md5 signature: 5e125c70746046ac726ed804bbbf922f ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Tests if <self> is linear between its namedunknowns.

Returns
-------
bool
") IsLinear;
		Standard_Boolean IsLinear();

		/****************** IsSatisfied ******************/
		/**** md5 signature: 29fd56dcca3d0f68d00dfd4c1a7b3ff7 ****/
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsSatisfied;
		Standard_Boolean IsSatisfied();

		/****************** NbOfSingleRelations ******************/
		/**** md5 signature: cb5c71421de80d5ccb13ce9b0cfa7e6e ****/
		%feature("compactdefaultargs") NbOfSingleRelations;
		%feature("autodoc", "Returns the number of singlerelations contained in <self>.

Returns
-------
int
") NbOfSingleRelations;
		Standard_Integer NbOfSingleRelations();

		/****************** NbOfSubRelations ******************/
		/**** md5 signature: eba32d2d912705cec016dd6df3b971e5 ****/
		%feature("compactdefaultargs") NbOfSubRelations;
		%feature("autodoc", "Returns the number of relations contained in <self>.

Returns
-------
int
") NbOfSubRelations;
		Standard_Integer NbOfSubRelations();

		/****************** Remove ******************/
		/**** md5 signature: a7c10b6896c791e5e6977f46cc817c9c ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "No available documentation.

Parameters
----------
relation: Expr_GeneralRelation

Returns
-------
None
") Remove;
		void Remove(const opencascade::handle<Expr_GeneralRelation> & relation);

		/****************** Replace ******************/
		/**** md5 signature: d1980891db2f275bbc6d54eac796d58d ****/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "Replaces all occurences of <var> with <with> in <self>.

Parameters
----------
var: Expr_NamedUnknown
with: Expr_GeneralExpression

Returns
-------
None
") Replace;
		void Replace(const opencascade::handle<Expr_NamedUnknown> & var, const opencascade::handle<Expr_GeneralExpression> & with);

		/****************** Simplified ******************/
		/**** md5 signature: 9b1cc1e39bd9e0a60af88b21f44eb44c ****/
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "Returns a generalrelation after replacement of namedunknowns by an associated expression, and after values computation.

Returns
-------
opencascade::handle<Expr_GeneralRelation>
") Simplified;
		opencascade::handle<Expr_GeneralRelation> Simplified();

		/****************** Simplify ******************/
		/**** md5 signature: d448a44dccfa01a406e4283570ba001f ****/
		%feature("compactdefaultargs") Simplify;
		%feature("autodoc", "Replaces namedunknowns by associated expressions, and computes values in <self>.

Returns
-------
None
") Simplify;
		void Simplify();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
") String;
		TCollection_AsciiString String();

		/****************** SubRelation ******************/
		/**** md5 signature: e582dddebeec4d0519b16bf1ca106be8 ****/
		%feature("compactdefaultargs") SubRelation;
		%feature("autodoc", "Returns the relation denoted by <index> in <self>. an exception is raised if <index> is out of range.

Parameters
----------
index: int

Returns
-------
opencascade::handle<Expr_GeneralRelation>
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
		/****************** Contains ******************/
		/**** md5 signature: 4d3e3a365e28051266a44f7d96eb9917 ****/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "Tests if <exp> is contained in <self>.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
bool
") Contains;
		Standard_Boolean Contains(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** ContainsUnknowns ******************/
		/**** md5 signature: 847c37fd1fdb87ce3fd4b89fbb7d8d46 ****/
		%feature("compactdefaultargs") ContainsUnknowns;
		%feature("autodoc", "Does <self> contains namedunknown ?.

Returns
-------
bool
") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns();

		/****************** NbSubExpressions ******************/
		/**** md5 signature: bd59d3a2c33cb431e9b8695901cbe037 ****/
		%feature("compactdefaultargs") NbSubExpressions;
		%feature("autodoc", "Returns the number of sub-expressions contained in <self> ( >= 0).

Returns
-------
int
") NbSubExpressions;
		Standard_Integer NbSubExpressions();

		/****************** Operand ******************/
		/**** md5 signature: 2ec68075618c40cd1ee25981c9447c9a ****/
		%feature("compactdefaultargs") Operand;
		%feature("autodoc", "Returns the operand used.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Operand;
		const opencascade::handle<Expr_GeneralExpression> & Operand();

		/****************** Replace ******************/
		/**** md5 signature: d1980891db2f275bbc6d54eac796d58d ****/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "Replaces all occurences of <var> with <with> in <self> raises invalidoperand if <with> contains <self>.

Parameters
----------
var: Expr_NamedUnknown
with: Expr_GeneralExpression

Returns
-------
None
") Replace;
		void Replace(const opencascade::handle<Expr_NamedUnknown> & var, const opencascade::handle<Expr_GeneralExpression> & with);

		/****************** SetOperand ******************/
		/**** md5 signature: 9f138059ef15077dd47814c890174a5e ****/
		%feature("compactdefaultargs") SetOperand;
		%feature("autodoc", "Sets the operand used raises invalidoperand if <exp> contains <self>.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
None
") SetOperand;
		void SetOperand(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** Simplified ******************/
		/**** md5 signature: 28f32c755b08a477aaaa66888fafbe45 ****/
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "Returns a generalexpression after replacement of namedunknowns by an associated expression, and after values computation.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Simplified;
		opencascade::handle<Expr_GeneralExpression> Simplified();

		/****************** SubExpression ******************/
		/**** md5 signature: da538711b3889bbe62310fe1c52e3fd2 ****/
		%feature("compactdefaultargs") SubExpression;
		%feature("autodoc", "Returns the <i>-th sub-expression of <self>. raises outofrange if <i> > nbsubexpressions(me).

Parameters
----------
I: int

Returns
-------
opencascade::handle<Expr_GeneralExpression>
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
		/****************** Expr_Absolute ******************/
		/**** md5 signature: 4f88f5738533f59cd3a528e0cab57f17 ****/
		%feature("compactdefaultargs") Expr_Absolute;
		%feature("autodoc", "Creates the abs of <exp>.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
None
") Expr_Absolute;
		 Expr_Absolute(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** Copy ******************/
		/**** md5 signature: 959911c21ab8344ca7df9189a97166b1 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****************** Derivative ******************/
		/**** md5 signature: 270fc2b9646e490f90b1b721eeed146d ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the derivative on <x> unknown of <self>.

Parameters
----------
X: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****************** Evaluate ******************/
		/**** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.

Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****************** IsIdentical ******************/
		/**** md5 signature: 887141aa7f58c129eb32231276e0f0fa ****/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.

Parameters
----------
Other: Expr_GeneralExpression

Returns
-------
bool
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****************** IsLinear ******************/
		/**** md5 signature: 5e125c70746046ac726ed804bbbf922f ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsLinear;
		Standard_Boolean IsLinear();

		/****************** ShallowSimplified ******************/
		/**** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ****/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Returns a generalexpression after a simplification of the arguments of <self>.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
		/****************** Expr_ArcCosine ******************/
		/**** md5 signature: eaa9e1f0788193eed77d3d083e840ed5 ****/
		%feature("compactdefaultargs") Expr_ArcCosine;
		%feature("autodoc", "Creates the arccos of <exp>.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
None
") Expr_ArcCosine;
		 Expr_ArcCosine(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** Copy ******************/
		/**** md5 signature: 959911c21ab8344ca7df9189a97166b1 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****************** Derivative ******************/
		/**** md5 signature: 270fc2b9646e490f90b1b721eeed146d ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the derivative on <x> unknown of <self>.

Parameters
----------
X: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****************** Evaluate ******************/
		/**** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.

Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****************** IsIdentical ******************/
		/**** md5 signature: 887141aa7f58c129eb32231276e0f0fa ****/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.

Parameters
----------
Other: Expr_GeneralExpression

Returns
-------
bool
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****************** IsLinear ******************/
		/**** md5 signature: 5e125c70746046ac726ed804bbbf922f ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsLinear;
		Standard_Boolean IsLinear();

		/****************** ShallowSimplified ******************/
		/**** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ****/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Returns a generalexpression after a simplification of the arguments of <self>.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
		/****************** Expr_ArcSine ******************/
		/**** md5 signature: 3cf7b8a1b68c1be8ae0a807d93859b10 ****/
		%feature("compactdefaultargs") Expr_ArcSine;
		%feature("autodoc", "Creates the arcsin of <exp>.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
None
") Expr_ArcSine;
		 Expr_ArcSine(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** Copy ******************/
		/**** md5 signature: 959911c21ab8344ca7df9189a97166b1 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****************** Derivative ******************/
		/**** md5 signature: 270fc2b9646e490f90b1b721eeed146d ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the derivative on <x> unknown of <self>.

Parameters
----------
X: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****************** Evaluate ******************/
		/**** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.

Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****************** IsIdentical ******************/
		/**** md5 signature: 887141aa7f58c129eb32231276e0f0fa ****/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.

Parameters
----------
Other: Expr_GeneralExpression

Returns
-------
bool
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****************** IsLinear ******************/
		/**** md5 signature: 5e125c70746046ac726ed804bbbf922f ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsLinear;
		Standard_Boolean IsLinear();

		/****************** ShallowSimplified ******************/
		/**** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ****/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Returns a generalexpression after a simplification of the arguments of <self>.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
		/****************** Expr_ArcTangent ******************/
		/**** md5 signature: a3eb3787eb87136cc56e987d24cc9a37 ****/
		%feature("compactdefaultargs") Expr_ArcTangent;
		%feature("autodoc", "Creates the arctan of <exp>.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
None
") Expr_ArcTangent;
		 Expr_ArcTangent(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** Copy ******************/
		/**** md5 signature: 959911c21ab8344ca7df9189a97166b1 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****************** Derivative ******************/
		/**** md5 signature: 270fc2b9646e490f90b1b721eeed146d ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the derivative on <x> unknown of <self>.

Parameters
----------
X: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****************** Evaluate ******************/
		/**** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.

Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****************** IsIdentical ******************/
		/**** md5 signature: 887141aa7f58c129eb32231276e0f0fa ****/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.

Parameters
----------
Other: Expr_GeneralExpression

Returns
-------
bool
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****************** IsLinear ******************/
		/**** md5 signature: 5e125c70746046ac726ed804bbbf922f ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsLinear;
		Standard_Boolean IsLinear();

		/****************** ShallowSimplified ******************/
		/**** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ****/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Returns a generalexpression after a simplification of the arguments of <self>.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
		/****************** Expr_ArgCosh ******************/
		/**** md5 signature: 14f819e10ed1bfdefe30d23bf0a2f76f ****/
		%feature("compactdefaultargs") Expr_ArgCosh;
		%feature("autodoc", "Creates the argcosh of <exp>.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
None
") Expr_ArgCosh;
		 Expr_ArgCosh(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** Copy ******************/
		/**** md5 signature: 959911c21ab8344ca7df9189a97166b1 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****************** Derivative ******************/
		/**** md5 signature: 270fc2b9646e490f90b1b721eeed146d ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the derivative on <x> unknown of <self>.

Parameters
----------
X: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****************** Evaluate ******************/
		/**** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.

Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****************** IsIdentical ******************/
		/**** md5 signature: 887141aa7f58c129eb32231276e0f0fa ****/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.

Parameters
----------
Other: Expr_GeneralExpression

Returns
-------
bool
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****************** IsLinear ******************/
		/**** md5 signature: 5e125c70746046ac726ed804bbbf922f ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsLinear;
		Standard_Boolean IsLinear();

		/****************** ShallowSimplified ******************/
		/**** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ****/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Returns a generalexpression after a simplification of the arguments of <self>.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
		/****************** Expr_ArgSinh ******************/
		/**** md5 signature: becca13accec494f7b943a1b72421c00 ****/
		%feature("compactdefaultargs") Expr_ArgSinh;
		%feature("autodoc", "Creates the argsinh of <exp>.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
None
") Expr_ArgSinh;
		 Expr_ArgSinh(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** Copy ******************/
		/**** md5 signature: 959911c21ab8344ca7df9189a97166b1 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****************** Derivative ******************/
		/**** md5 signature: 270fc2b9646e490f90b1b721eeed146d ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the derivative on <x> unknown of <self>.

Parameters
----------
X: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****************** Evaluate ******************/
		/**** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.

Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****************** IsIdentical ******************/
		/**** md5 signature: 887141aa7f58c129eb32231276e0f0fa ****/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.

Parameters
----------
Other: Expr_GeneralExpression

Returns
-------
bool
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****************** IsLinear ******************/
		/**** md5 signature: 5e125c70746046ac726ed804bbbf922f ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsLinear;
		Standard_Boolean IsLinear();

		/****************** ShallowSimplified ******************/
		/**** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ****/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Returns a generalexpression after a simplification of the arguments of <self>.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
		/****************** Expr_ArgTanh ******************/
		/**** md5 signature: 93f59eda6ff9f11f6a1e9cdeb688d8bc ****/
		%feature("compactdefaultargs") Expr_ArgTanh;
		%feature("autodoc", "Creates the argtanh of <exp>.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
None
") Expr_ArgTanh;
		 Expr_ArgTanh(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** Copy ******************/
		/**** md5 signature: 959911c21ab8344ca7df9189a97166b1 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****************** Derivative ******************/
		/**** md5 signature: 270fc2b9646e490f90b1b721eeed146d ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the derivative on <x> unknown of <self>.

Parameters
----------
X: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****************** Evaluate ******************/
		/**** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.

Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****************** IsIdentical ******************/
		/**** md5 signature: 887141aa7f58c129eb32231276e0f0fa ****/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.

Parameters
----------
Other: Expr_GeneralExpression

Returns
-------
bool
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****************** IsLinear ******************/
		/**** md5 signature: 5e125c70746046ac726ed804bbbf922f ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsLinear;
		Standard_Boolean IsLinear();

		/****************** ShallowSimplified ******************/
		/**** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ****/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Returns a generalexpression after a simplification of the arguments of <self>.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
		/****************** Expr_BinaryFunction ******************/
		/**** md5 signature: 78aaf8975a3ff50150348f7d72c5ea2f ****/
		%feature("compactdefaultargs") Expr_BinaryFunction;
		%feature("autodoc", "Creates <self> as <func> (<exp1>,<exp2>). raises exception if <func> is not binary.

Parameters
----------
func: Expr_GeneralFunction
exp1: Expr_GeneralExpression
exp2: Expr_GeneralExpression

Returns
-------
None
") Expr_BinaryFunction;
		 Expr_BinaryFunction(const opencascade::handle<Expr_GeneralFunction> & func, const opencascade::handle<Expr_GeneralExpression> & exp1, const opencascade::handle<Expr_GeneralExpression> & exp2);

		/****************** Copy ******************/
		/**** md5 signature: 959911c21ab8344ca7df9189a97166b1 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****************** Derivative ******************/
		/**** md5 signature: 270fc2b9646e490f90b1b721eeed146d ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the derivative on <x> unknown of <self>.

Parameters
----------
X: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****************** Evaluate ******************/
		/**** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.

Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****************** Function ******************/
		/**** md5 signature: f027f2800a46ad0cf94502538104cf73 ****/
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "Returns the function defining <self>.

Returns
-------
opencascade::handle<Expr_GeneralFunction>
") Function;
		opencascade::handle<Expr_GeneralFunction> Function();

		/****************** IsIdentical ******************/
		/**** md5 signature: 887141aa7f58c129eb32231276e0f0fa ****/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.

Parameters
----------
Other: Expr_GeneralExpression

Returns
-------
bool
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****************** IsLinear ******************/
		/**** md5 signature: 5e125c70746046ac726ed804bbbf922f ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsLinear;
		Standard_Boolean IsLinear();

		/****************** ShallowSimplified ******************/
		/**** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ****/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Returns a generalexpression after a simplification of the arguments of <self>.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
		/****************** Expr_Cosh ******************/
		/**** md5 signature: 909b7c545d8206300e4b8ecf5dbcf05b ****/
		%feature("compactdefaultargs") Expr_Cosh;
		%feature("autodoc", "Creates the cosh of <exp>.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
None
") Expr_Cosh;
		 Expr_Cosh(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** Copy ******************/
		/**** md5 signature: 959911c21ab8344ca7df9189a97166b1 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****************** Derivative ******************/
		/**** md5 signature: 270fc2b9646e490f90b1b721eeed146d ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the derivative on <x> unknown of <self>.

Parameters
----------
X: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****************** Evaluate ******************/
		/**** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.

Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****************** IsIdentical ******************/
		/**** md5 signature: 887141aa7f58c129eb32231276e0f0fa ****/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.

Parameters
----------
Other: Expr_GeneralExpression

Returns
-------
bool
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****************** IsLinear ******************/
		/**** md5 signature: 5e125c70746046ac726ed804bbbf922f ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsLinear;
		Standard_Boolean IsLinear();

		/****************** ShallowSimplified ******************/
		/**** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ****/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Returns a generalexpression after a simplification of the arguments of <self>.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
		/****************** Expr_Cosine ******************/
		/**** md5 signature: 982ca231f2b3035f6fb2d935fab48c09 ****/
		%feature("compactdefaultargs") Expr_Cosine;
		%feature("autodoc", "Creates the cosine of exp.

Parameters
----------
Exp: Expr_GeneralExpression

Returns
-------
None
") Expr_Cosine;
		 Expr_Cosine(const opencascade::handle<Expr_GeneralExpression> & Exp);

		/****************** Copy ******************/
		/**** md5 signature: 959911c21ab8344ca7df9189a97166b1 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****************** Derivative ******************/
		/**** md5 signature: 270fc2b9646e490f90b1b721eeed146d ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the derivative on <x> unknown of <self>.

Parameters
----------
X: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****************** Evaluate ******************/
		/**** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.

Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****************** IsIdentical ******************/
		/**** md5 signature: 887141aa7f58c129eb32231276e0f0fa ****/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.

Parameters
----------
Other: Expr_GeneralExpression

Returns
-------
bool
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****************** IsLinear ******************/
		/**** md5 signature: 5e125c70746046ac726ed804bbbf922f ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsLinear;
		Standard_Boolean IsLinear();

		/****************** ShallowSimplified ******************/
		/**** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ****/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Returns a generalexpression after a simplification of the arguments of <self>.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
		/****************** Expr_Difference ******************/
		/**** md5 signature: 9b22984d415f752164f29d4bc5942668 ****/
		%feature("compactdefaultargs") Expr_Difference;
		%feature("autodoc", "Creates the difference <exp1> - <exp2>.

Parameters
----------
exp1: Expr_GeneralExpression
exp2: Expr_GeneralExpression

Returns
-------
None
") Expr_Difference;
		 Expr_Difference(const opencascade::handle<Expr_GeneralExpression> & exp1, const opencascade::handle<Expr_GeneralExpression> & exp2);

		/****************** Copy ******************/
		/**** md5 signature: 959911c21ab8344ca7df9189a97166b1 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****************** Derivative ******************/
		/**** md5 signature: 270fc2b9646e490f90b1b721eeed146d ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the derivative on <x> unknown of <self>.

Parameters
----------
X: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****************** Evaluate ******************/
		/**** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.

Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****************** IsIdentical ******************/
		/**** md5 signature: 887141aa7f58c129eb32231276e0f0fa ****/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.

Parameters
----------
Other: Expr_GeneralExpression

Returns
-------
bool
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****************** IsLinear ******************/
		/**** md5 signature: 5e125c70746046ac726ed804bbbf922f ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsLinear;
		Standard_Boolean IsLinear();

		/****************** NDerivative ******************/
		/**** md5 signature: 64fe21d732fcfe80f37aea7c134ab146 ****/
		%feature("compactdefaultargs") NDerivative;
		%feature("autodoc", "Returns the <n>-th derivative on <x> unknown of <self>. raises outofrange if <n> <= 0.

Parameters
----------
X: Expr_NamedUnknown
N: int

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") NDerivative;
		virtual opencascade::handle<Expr_GeneralExpression> NDerivative(const opencascade::handle<Expr_NamedUnknown> & X, const Standard_Integer N);

		/****************** ShallowSimplified ******************/
		/**** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ****/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Returns a generalexpression after a simplification of the arguments of <self>.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
		/****************** Expr_Different ******************/
		/**** md5 signature: e90d4a831a5d96fadc66f4f1026de296 ****/
		%feature("compactdefaultargs") Expr_Different;
		%feature("autodoc", "Creates the relation <exp1> # <exp2>.

Parameters
----------
exp1: Expr_GeneralExpression
exp2: Expr_GeneralExpression

Returns
-------
None
") Expr_Different;
		 Expr_Different(const opencascade::handle<Expr_GeneralExpression> & exp1, const opencascade::handle<Expr_GeneralExpression> & exp2);

		/****************** Copy ******************/
		/**** md5 signature: 4fb077f1759a1cc123427f28e5b2aaa7 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralRelation>
") Copy;
		opencascade::handle<Expr_GeneralRelation> Copy();

		/****************** IsSatisfied ******************/
		/**** md5 signature: 29fd56dcca3d0f68d00dfd4c1a7b3ff7 ****/
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsSatisfied;
		Standard_Boolean IsSatisfied();

		/****************** Simplified ******************/
		/**** md5 signature: 9b1cc1e39bd9e0a60af88b21f44eb44c ****/
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "Returns a generalrelation after replacement of namedunknowns by an associated expression, and after values computation.

Returns
-------
opencascade::handle<Expr_GeneralRelation>
") Simplified;
		opencascade::handle<Expr_GeneralRelation> Simplified();

		/****************** Simplify ******************/
		/**** md5 signature: d448a44dccfa01a406e4283570ba001f ****/
		%feature("compactdefaultargs") Simplify;
		%feature("autodoc", "Replaces namedunknowns by associated expressions, and computes values in <self>.

Returns
-------
None
") Simplify;
		void Simplify();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
		/****************** Expr_Division ******************/
		/**** md5 signature: 73fa6302a74030784ab3fcf08600e121 ****/
		%feature("compactdefaultargs") Expr_Division;
		%feature("autodoc", "Creates the division <exp1>/<exp2>.

Parameters
----------
exp1: Expr_GeneralExpression
exp2: Expr_GeneralExpression

Returns
-------
None
") Expr_Division;
		 Expr_Division(const opencascade::handle<Expr_GeneralExpression> & exp1, const opencascade::handle<Expr_GeneralExpression> & exp2);

		/****************** Copy ******************/
		/**** md5 signature: 959911c21ab8344ca7df9189a97166b1 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****************** Derivative ******************/
		/**** md5 signature: 270fc2b9646e490f90b1b721eeed146d ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the derivative on <x> unknown of <self>.

Parameters
----------
X: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****************** Evaluate ******************/
		/**** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.

Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****************** IsIdentical ******************/
		/**** md5 signature: 887141aa7f58c129eb32231276e0f0fa ****/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.

Parameters
----------
Other: Expr_GeneralExpression

Returns
-------
bool
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****************** IsLinear ******************/
		/**** md5 signature: 5e125c70746046ac726ed804bbbf922f ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsLinear;
		Standard_Boolean IsLinear();

		/****************** ShallowSimplified ******************/
		/**** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ****/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Returns a generalexpression after a simplification of the arguments of <self>.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
		/****************** Expr_Equal ******************/
		/**** md5 signature: b4ff5feaa719eb4f8a5be462c4c08381 ****/
		%feature("compactdefaultargs") Expr_Equal;
		%feature("autodoc", "Creates the relation <exp1> = <exp2>.

Parameters
----------
exp1: Expr_GeneralExpression
exp2: Expr_GeneralExpression

Returns
-------
None
") Expr_Equal;
		 Expr_Equal(const opencascade::handle<Expr_GeneralExpression> & exp1, const opencascade::handle<Expr_GeneralExpression> & exp2);

		/****************** Copy ******************/
		/**** md5 signature: 4fb077f1759a1cc123427f28e5b2aaa7 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralRelation>
") Copy;
		opencascade::handle<Expr_GeneralRelation> Copy();

		/****************** IsSatisfied ******************/
		/**** md5 signature: 29fd56dcca3d0f68d00dfd4c1a7b3ff7 ****/
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsSatisfied;
		Standard_Boolean IsSatisfied();

		/****************** Simplified ******************/
		/**** md5 signature: 9b1cc1e39bd9e0a60af88b21f44eb44c ****/
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "Returns a generalrelation after replacement of namedunknowns by an associated expression and after values computation.

Returns
-------
opencascade::handle<Expr_GeneralRelation>
") Simplified;
		opencascade::handle<Expr_GeneralRelation> Simplified();

		/****************** Simplify ******************/
		/**** md5 signature: d448a44dccfa01a406e4283570ba001f ****/
		%feature("compactdefaultargs") Simplify;
		%feature("autodoc", "Replaces namedunknowns by an associated expressions and computes values in <self>.

Returns
-------
None
") Simplify;
		void Simplify();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
		/****************** Expr_Exponential ******************/
		/**** md5 signature: 8d1d299927e184c3ae836d15f197e297 ****/
		%feature("compactdefaultargs") Expr_Exponential;
		%feature("autodoc", "Creates the exponential of <exp>.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
None
") Expr_Exponential;
		 Expr_Exponential(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** Copy ******************/
		/**** md5 signature: 959911c21ab8344ca7df9189a97166b1 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****************** Derivative ******************/
		/**** md5 signature: 270fc2b9646e490f90b1b721eeed146d ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the derivative on <x> unknown of <self>.

Parameters
----------
X: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****************** Evaluate ******************/
		/**** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.

Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****************** IsIdentical ******************/
		/**** md5 signature: 887141aa7f58c129eb32231276e0f0fa ****/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.

Parameters
----------
Other: Expr_GeneralExpression

Returns
-------
bool
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****************** IsLinear ******************/
		/**** md5 signature: 5e125c70746046ac726ed804bbbf922f ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsLinear;
		Standard_Boolean IsLinear();

		/****************** ShallowSimplified ******************/
		/**** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ****/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Returns a generalexpression after a simplification of the arguments of <self>.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
		/****************** Expr_Exponentiate ******************/
		/**** md5 signature: bd7f2bdd1796f67e55840b583c587151 ****/
		%feature("compactdefaultargs") Expr_Exponentiate;
		%feature("autodoc", "Creates the exponential <exp1> ^ <exp2>.

Parameters
----------
exp1: Expr_GeneralExpression
exp2: Expr_GeneralExpression

Returns
-------
None
") Expr_Exponentiate;
		 Expr_Exponentiate(const opencascade::handle<Expr_GeneralExpression> & exp1, const opencascade::handle<Expr_GeneralExpression> & exp2);

		/****************** Copy ******************/
		/**** md5 signature: 959911c21ab8344ca7df9189a97166b1 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****************** Derivative ******************/
		/**** md5 signature: 270fc2b9646e490f90b1b721eeed146d ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the derivative on <x> unknown of <self>.

Parameters
----------
X: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****************** Evaluate ******************/
		/**** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.

Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****************** IsIdentical ******************/
		/**** md5 signature: 887141aa7f58c129eb32231276e0f0fa ****/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.

Parameters
----------
Other: Expr_GeneralExpression

Returns
-------
bool
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****************** IsLinear ******************/
		/**** md5 signature: 5e125c70746046ac726ed804bbbf922f ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsLinear;
		Standard_Boolean IsLinear();

		/****************** ShallowSimplified ******************/
		/**** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ****/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Returns a generalexpression after a simplification of the arguments of <self>.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
		/****************** Expr_GreaterThan ******************/
		/**** md5 signature: 30f0ffdbf668f1b682b723c4c4f2a4a2 ****/
		%feature("compactdefaultargs") Expr_GreaterThan;
		%feature("autodoc", "Creates the relation <exp1> > <exp2>.

Parameters
----------
exp1: Expr_GeneralExpression
exp2: Expr_GeneralExpression

Returns
-------
None
") Expr_GreaterThan;
		 Expr_GreaterThan(const opencascade::handle<Expr_GeneralExpression> & exp1, const opencascade::handle<Expr_GeneralExpression> & exp2);

		/****************** Copy ******************/
		/**** md5 signature: 4fb077f1759a1cc123427f28e5b2aaa7 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralRelation>
") Copy;
		opencascade::handle<Expr_GeneralRelation> Copy();

		/****************** IsSatisfied ******************/
		/**** md5 signature: 29fd56dcca3d0f68d00dfd4c1a7b3ff7 ****/
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsSatisfied;
		Standard_Boolean IsSatisfied();

		/****************** Simplified ******************/
		/**** md5 signature: 9b1cc1e39bd9e0a60af88b21f44eb44c ****/
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "Returns a generalrelation after replacement of namedunknowns by an associated expression, and after values computation.

Returns
-------
opencascade::handle<Expr_GeneralRelation>
") Simplified;
		opencascade::handle<Expr_GeneralRelation> Simplified();

		/****************** Simplify ******************/
		/**** md5 signature: d448a44dccfa01a406e4283570ba001f ****/
		%feature("compactdefaultargs") Simplify;
		%feature("autodoc", "Replaces namedunknowns by associated expressions, and computes values in <self>.

Returns
-------
None
") Simplify;
		void Simplify();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
		/****************** Expr_GreaterThanOrEqual ******************/
		/**** md5 signature: a1c2e3960f6f903896f2a094c34072cf ****/
		%feature("compactdefaultargs") Expr_GreaterThanOrEqual;
		%feature("autodoc", "Creates the relation <exp1> >= <exp2>.

Parameters
----------
exp1: Expr_GeneralExpression
exp2: Expr_GeneralExpression

Returns
-------
None
") Expr_GreaterThanOrEqual;
		 Expr_GreaterThanOrEqual(const opencascade::handle<Expr_GeneralExpression> & exp1, const opencascade::handle<Expr_GeneralExpression> & exp2);

		/****************** Copy ******************/
		/**** md5 signature: 4fb077f1759a1cc123427f28e5b2aaa7 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralRelation>
") Copy;
		opencascade::handle<Expr_GeneralRelation> Copy();

		/****************** IsSatisfied ******************/
		/**** md5 signature: 29fd56dcca3d0f68d00dfd4c1a7b3ff7 ****/
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsSatisfied;
		Standard_Boolean IsSatisfied();

		/****************** Simplified ******************/
		/**** md5 signature: 9b1cc1e39bd9e0a60af88b21f44eb44c ****/
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "Returns a generalrelation after replacement of namedunknowns by an associated expression, and after values computation.

Returns
-------
opencascade::handle<Expr_GeneralRelation>
") Simplified;
		opencascade::handle<Expr_GeneralRelation> Simplified();

		/****************** Simplify ******************/
		/**** md5 signature: d448a44dccfa01a406e4283570ba001f ****/
		%feature("compactdefaultargs") Simplify;
		%feature("autodoc", "Replaces namedunknowns by associated expressions, and computes values in <self>.

Returns
-------
None
") Simplify;
		void Simplify();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
		/****************** Expr_LessThan ******************/
		/**** md5 signature: ec9b186a3e5aa5964ac85c5e0965c1fe ****/
		%feature("compactdefaultargs") Expr_LessThan;
		%feature("autodoc", "Creates the relation <exp1> < <exp2>.

Parameters
----------
exp1: Expr_GeneralExpression
exp2: Expr_GeneralExpression

Returns
-------
None
") Expr_LessThan;
		 Expr_LessThan(const opencascade::handle<Expr_GeneralExpression> & exp1, const opencascade::handle<Expr_GeneralExpression> & exp2);

		/****************** Copy ******************/
		/**** md5 signature: 4fb077f1759a1cc123427f28e5b2aaa7 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralRelation>
") Copy;
		opencascade::handle<Expr_GeneralRelation> Copy();

		/****************** IsSatisfied ******************/
		/**** md5 signature: 29fd56dcca3d0f68d00dfd4c1a7b3ff7 ****/
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsSatisfied;
		Standard_Boolean IsSatisfied();

		/****************** Simplified ******************/
		/**** md5 signature: 9b1cc1e39bd9e0a60af88b21f44eb44c ****/
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "Returns a generalrelation after replacement of namedunknowns by an associated expression, and after values computation.

Returns
-------
opencascade::handle<Expr_GeneralRelation>
") Simplified;
		opencascade::handle<Expr_GeneralRelation> Simplified();

		/****************** Simplify ******************/
		/**** md5 signature: d448a44dccfa01a406e4283570ba001f ****/
		%feature("compactdefaultargs") Simplify;
		%feature("autodoc", "Replaces namedunknowns by associated expressions, and computes values in <self>.

Returns
-------
None
") Simplify;
		void Simplify();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
		/****************** Expr_LessThanOrEqual ******************/
		/**** md5 signature: ce8454fa064b5976fe4e21a26d57a4d3 ****/
		%feature("compactdefaultargs") Expr_LessThanOrEqual;
		%feature("autodoc", "Creates the relation <exp1> <= <exp2>.

Parameters
----------
exp1: Expr_GeneralExpression
exp2: Expr_GeneralExpression

Returns
-------
None
") Expr_LessThanOrEqual;
		 Expr_LessThanOrEqual(const opencascade::handle<Expr_GeneralExpression> & exp1, const opencascade::handle<Expr_GeneralExpression> & exp2);

		/****************** Copy ******************/
		/**** md5 signature: 4fb077f1759a1cc123427f28e5b2aaa7 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralRelation>
") Copy;
		opencascade::handle<Expr_GeneralRelation> Copy();

		/****************** IsSatisfied ******************/
		/**** md5 signature: 29fd56dcca3d0f68d00dfd4c1a7b3ff7 ****/
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsSatisfied;
		Standard_Boolean IsSatisfied();

		/****************** Simplified ******************/
		/**** md5 signature: 9b1cc1e39bd9e0a60af88b21f44eb44c ****/
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "Returns a generalrelation after replacement of namedunknowns by an associated expression, and after values computation.

Returns
-------
opencascade::handle<Expr_GeneralRelation>
") Simplified;
		opencascade::handle<Expr_GeneralRelation> Simplified();

		/****************** Simplify ******************/
		/**** md5 signature: d448a44dccfa01a406e4283570ba001f ****/
		%feature("compactdefaultargs") Simplify;
		%feature("autodoc", "Replaces namedunknowns by associated expressions, and computes values in <self>.

Returns
-------
None
") Simplify;
		void Simplify();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
		/****************** Expr_LogOf10 ******************/
		/**** md5 signature: 59b8dd4db88909d8f020f118473efba5 ****/
		%feature("compactdefaultargs") Expr_LogOf10;
		%feature("autodoc", "Creates the base 10 logarithm of <exp>.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
None
") Expr_LogOf10;
		 Expr_LogOf10(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** Copy ******************/
		/**** md5 signature: 959911c21ab8344ca7df9189a97166b1 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****************** Derivative ******************/
		/**** md5 signature: 270fc2b9646e490f90b1b721eeed146d ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the derivative on <x> unknown of <self>.

Parameters
----------
X: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****************** Evaluate ******************/
		/**** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.

Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****************** IsIdentical ******************/
		/**** md5 signature: 887141aa7f58c129eb32231276e0f0fa ****/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.

Parameters
----------
Other: Expr_GeneralExpression

Returns
-------
bool
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****************** IsLinear ******************/
		/**** md5 signature: 5e125c70746046ac726ed804bbbf922f ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsLinear;
		Standard_Boolean IsLinear();

		/****************** ShallowSimplified ******************/
		/**** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ****/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Returns a generalexpression after a simplification of the arguments of <self>.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
		/****************** Expr_LogOfe ******************/
		/**** md5 signature: 2db01f31cae52513255ce88091e83582 ****/
		%feature("compactdefaultargs") Expr_LogOfe;
		%feature("autodoc", "Creates the natural logarithm of <exp>.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
None
") Expr_LogOfe;
		 Expr_LogOfe(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** Copy ******************/
		/**** md5 signature: 959911c21ab8344ca7df9189a97166b1 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****************** Derivative ******************/
		/**** md5 signature: 270fc2b9646e490f90b1b721eeed146d ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the derivative on <x> unknown of <self>.

Parameters
----------
X: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****************** Evaluate ******************/
		/**** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.

Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****************** IsIdentical ******************/
		/**** md5 signature: 887141aa7f58c129eb32231276e0f0fa ****/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.

Parameters
----------
Other: Expr_GeneralExpression

Returns
-------
bool
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****************** IsLinear ******************/
		/**** md5 signature: 5e125c70746046ac726ed804bbbf922f ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsLinear;
		Standard_Boolean IsLinear();

		/****************** ShallowSimplified ******************/
		/**** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ****/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Returns a generalexpression after a simplification of the arguments of <self>.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
		/****************** Expr_NamedConstant ******************/
		/**** md5 signature: 5f7a3c5cb78bab430f0473d14675dd38 ****/
		%feature("compactdefaultargs") Expr_NamedConstant;
		%feature("autodoc", "Creates a constant value of name <name> and value <value>.

Parameters
----------
name: TCollection_AsciiString
value: float

Returns
-------
None
") Expr_NamedConstant;
		 Expr_NamedConstant(const TCollection_AsciiString & name, const Standard_Real value);

		/****************** Contains ******************/
		/**** md5 signature: 4d3e3a365e28051266a44f7d96eb9917 ****/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "Tests if <exp> is contained in <self>.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
bool
") Contains;
		Standard_Boolean Contains(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** ContainsUnknowns ******************/
		/**** md5 signature: 847c37fd1fdb87ce3fd4b89fbb7d8d46 ****/
		%feature("compactdefaultargs") ContainsUnknowns;
		%feature("autodoc", "Tests if <self> contains namedunknown. (returns always false).

Returns
-------
bool
") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns();

		/****************** Copy ******************/
		/**** md5 signature: 959911c21ab8344ca7df9189a97166b1 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****************** Derivative ******************/
		/**** md5 signature: 270fc2b9646e490f90b1b721eeed146d ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the derivative on <x> unknown of <self>.

Parameters
----------
X: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****************** Evaluate ******************/
		/**** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Returns the value of <self> (as a real) by replacement of <vars> by <vals>.

Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****************** GetValue ******************/
		/**** md5 signature: 2863c7a566efd7be6530d131f7f2cf29 ****/
		%feature("compactdefaultargs") GetValue;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") GetValue;
		Standard_Real GetValue();

		/****************** IsLinear ******************/
		/**** md5 signature: 5e125c70746046ac726ed804bbbf922f ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsLinear;
		Standard_Boolean IsLinear();

		/****************** NDerivative ******************/
		/**** md5 signature: 64fe21d732fcfe80f37aea7c134ab146 ****/
		%feature("compactdefaultargs") NDerivative;
		%feature("autodoc", "Returns the <n>-th derivative on <x> unknown of <self>. raises outofrange if <n> <= 0.

Parameters
----------
X: Expr_NamedUnknown
N: int

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") NDerivative;
		virtual opencascade::handle<Expr_GeneralExpression> NDerivative(const opencascade::handle<Expr_NamedUnknown> & X, const Standard_Integer N);

		/****************** NbSubExpressions ******************/
		/**** md5 signature: bd59d3a2c33cb431e9b8695901cbe037 ****/
		%feature("compactdefaultargs") NbSubExpressions;
		%feature("autodoc", "Returns the number of sub-expressions contained in <self> (always returns zero).

Returns
-------
int
") NbSubExpressions;
		Standard_Integer NbSubExpressions();

		/****************** Replace ******************/
		/**** md5 signature: d1980891db2f275bbc6d54eac796d58d ****/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "Replaces all occurences of <var> with <with> in <self>.

Parameters
----------
var: Expr_NamedUnknown
with: Expr_GeneralExpression

Returns
-------
None
") Replace;
		void Replace(const opencascade::handle<Expr_NamedUnknown> & var, const opencascade::handle<Expr_GeneralExpression> & with);

		/****************** ShallowSimplified ******************/
		/**** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ****/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Returns a generalexpression after a simplification of the arguments of <self>.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****************** Simplified ******************/
		/**** md5 signature: 28f32c755b08a477aaaa66888fafbe45 ****/
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "Returns a generalexpression after replacement of namedunknowns by an associated expression and after values computation.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Simplified;
		opencascade::handle<Expr_GeneralExpression> Simplified();

		/****************** SubExpression ******************/
		/**** md5 signature: da538711b3889bbe62310fe1c52e3fd2 ****/
		%feature("compactdefaultargs") SubExpression;
		%feature("autodoc", "Returns the <i>-th sub-expression of <self> raises outofrange.

Parameters
----------
I: int

Returns
-------
opencascade::handle<Expr_GeneralExpression>
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
		/****************** Expr_NamedUnknown ******************/
		/**** md5 signature: 25f05966a200301b7e068bb634d32b84 ****/
		%feature("compactdefaultargs") Expr_NamedUnknown;
		%feature("autodoc", "No available documentation.

Parameters
----------
name: TCollection_AsciiString

Returns
-------
None
") Expr_NamedUnknown;
		 Expr_NamedUnknown(const TCollection_AsciiString & name);

		/****************** Assign ******************/
		/**** md5 signature: 2d586a2386463c9b0d4b174890bd7d12 ****/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "Assigns <self> to <exp> expression. raises exception if <exp> refers to <self>.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
None
") Assign;
		void Assign(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** AssignedExpression ******************/
		/**** md5 signature: 2aedd3f2b693692f428f79814a0eeb9d ****/
		%feature("compactdefaultargs") AssignedExpression;
		%feature("autodoc", "If exists, returns the assigned expression. an exception is raised if the expression does not exist.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") AssignedExpression;
		const opencascade::handle<Expr_GeneralExpression> & AssignedExpression();

		/****************** Contains ******************/
		/**** md5 signature: 4d3e3a365e28051266a44f7d96eb9917 ****/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "Tests if <exp> is contained in <self>.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
bool
") Contains;
		Standard_Boolean Contains(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** ContainsUnknowns ******************/
		/**** md5 signature: 847c37fd1fdb87ce3fd4b89fbb7d8d46 ****/
		%feature("compactdefaultargs") ContainsUnknowns;
		%feature("autodoc", "Tests if <self> contains namedunknown.

Returns
-------
bool
") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns();

		/****************** Copy ******************/
		/**** md5 signature: 959911c21ab8344ca7df9189a97166b1 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****************** Deassign ******************/
		/**** md5 signature: bdd99d62e4917809f78e8082960232c1 ****/
		%feature("compactdefaultargs") Deassign;
		%feature("autodoc", "Supresses the assigned expression.

Returns
-------
None
") Deassign;
		void Deassign();

		/****************** Derivative ******************/
		/**** md5 signature: 270fc2b9646e490f90b1b721eeed146d ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the derivative on <x> unknown of <self>.

Parameters
----------
X: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****************** Evaluate ******************/
		/**** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.

Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****************** IsAssigned ******************/
		/**** md5 signature: 10514134a7a4186d1c438c2b296fef32 ****/
		%feature("compactdefaultargs") IsAssigned;
		%feature("autodoc", "Tests if an expression is assigned to <self>.

Returns
-------
bool
") IsAssigned;
		Standard_Boolean IsAssigned();

		/****************** IsLinear ******************/
		/**** md5 signature: 5e125c70746046ac726ed804bbbf922f ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsLinear;
		Standard_Boolean IsLinear();

		/****************** NbSubExpressions ******************/
		/**** md5 signature: bd59d3a2c33cb431e9b8695901cbe037 ****/
		%feature("compactdefaultargs") NbSubExpressions;
		%feature("autodoc", "Returns the number of sub-expressions contained in <self> ( >= 0).

Returns
-------
int
") NbSubExpressions;
		Standard_Integer NbSubExpressions();

		/****************** Replace ******************/
		/**** md5 signature: d1980891db2f275bbc6d54eac796d58d ****/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "Replaces all occurences of <var> with <with> in <self> raises invalidoperand if <with> contains <self>.

Parameters
----------
var: Expr_NamedUnknown
with: Expr_GeneralExpression

Returns
-------
None
") Replace;
		void Replace(const opencascade::handle<Expr_NamedUnknown> & var, const opencascade::handle<Expr_GeneralExpression> & with);

		/****************** ShallowSimplified ******************/
		/**** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ****/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Returns a generalexpression after a simplification of the arguments of <self>.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****************** Simplified ******************/
		/**** md5 signature: 28f32c755b08a477aaaa66888fafbe45 ****/
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "Returns a generalexpression after replacement of namedunknowns by an associated expression and after values computation.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Simplified;
		opencascade::handle<Expr_GeneralExpression> Simplified();

		/****************** SubExpression ******************/
		/**** md5 signature: da538711b3889bbe62310fe1c52e3fd2 ****/
		%feature("compactdefaultargs") SubExpression;
		%feature("autodoc", "Returns the <i>-th sub-expression of <self> raises outofrange if <i> > nbsubexpressions(me).

Parameters
----------
I: int

Returns
-------
opencascade::handle<Expr_GeneralExpression>
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
		/****************** Expr_PolyFunction ******************/
		/**** md5 signature: bb0d21d6c30ae603033c1a20ffea8170 ****/
		%feature("compactdefaultargs") Expr_PolyFunction;
		%feature("autodoc", "Creates <self> as <func>(<exps_1>,<exps_2>,...,<exps_n>).

Parameters
----------
func: Expr_GeneralFunction
exps: Expr_Array1OfGeneralExpression

Returns
-------
None
") Expr_PolyFunction;
		 Expr_PolyFunction(const opencascade::handle<Expr_GeneralFunction> & func, const Expr_Array1OfGeneralExpression & exps);

		/****************** Copy ******************/
		/**** md5 signature: 959911c21ab8344ca7df9189a97166b1 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****************** Derivative ******************/
		/**** md5 signature: 270fc2b9646e490f90b1b721eeed146d ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the derivative on <x> unknown of <self>.

Parameters
----------
X: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****************** Evaluate ******************/
		/**** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.

Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****************** Function ******************/
		/**** md5 signature: f027f2800a46ad0cf94502538104cf73 ****/
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "Returns the function defining <self>.

Returns
-------
opencascade::handle<Expr_GeneralFunction>
") Function;
		opencascade::handle<Expr_GeneralFunction> Function();

		/****************** IsIdentical ******************/
		/**** md5 signature: 887141aa7f58c129eb32231276e0f0fa ****/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.

Parameters
----------
Other: Expr_GeneralExpression

Returns
-------
bool
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****************** IsLinear ******************/
		/**** md5 signature: 5e125c70746046ac726ed804bbbf922f ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsLinear;
		Standard_Boolean IsLinear();

		/****************** ShallowSimplified ******************/
		/**** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ****/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Returns a generalexpression after a simplification of the arguments of <self>.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
		/****************** Expr_Product ******************/
		/**** md5 signature: 74b5163d45eb7131e645511f7997caf3 ****/
		%feature("compactdefaultargs") Expr_Product;
		%feature("autodoc", "Creates the product of all members of sequence <exps>.

Parameters
----------
exps: Expr_SequenceOfGeneralExpression

Returns
-------
None
") Expr_Product;
		 Expr_Product(const Expr_SequenceOfGeneralExpression & exps);

		/****************** Expr_Product ******************/
		/**** md5 signature: 1e7ed70c20e505fff5be6facbba2fe41 ****/
		%feature("compactdefaultargs") Expr_Product;
		%feature("autodoc", "Creates the product of <exp1> and <exp2>.

Parameters
----------
exp1: Expr_GeneralExpression
exp2: Expr_GeneralExpression

Returns
-------
None
") Expr_Product;
		 Expr_Product(const opencascade::handle<Expr_GeneralExpression> & exp1, const opencascade::handle<Expr_GeneralExpression> & exp2);

		/****************** Copy ******************/
		/**** md5 signature: 959911c21ab8344ca7df9189a97166b1 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****************** Derivative ******************/
		/**** md5 signature: 270fc2b9646e490f90b1b721eeed146d ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the derivative on <x> unknown of <self>.

Parameters
----------
X: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****************** Evaluate ******************/
		/**** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.

Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****************** IsIdentical ******************/
		/**** md5 signature: 887141aa7f58c129eb32231276e0f0fa ****/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.

Parameters
----------
Other: Expr_GeneralExpression

Returns
-------
bool
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****************** IsLinear ******************/
		/**** md5 signature: 5e125c70746046ac726ed804bbbf922f ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsLinear;
		Standard_Boolean IsLinear();

		/****************** ShallowSimplified ******************/
		/**** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ****/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Returns a generalexpression after a simplification of the arguments of <self>.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
		/****************** Expr_Sine ******************/
		/**** md5 signature: 79a6e289fff74f5929f265d65a6e7f6c ****/
		%feature("compactdefaultargs") Expr_Sine;
		%feature("autodoc", "Creates the sine of <exp>.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
None
") Expr_Sine;
		 Expr_Sine(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** Copy ******************/
		/**** md5 signature: 959911c21ab8344ca7df9189a97166b1 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****************** Derivative ******************/
		/**** md5 signature: 270fc2b9646e490f90b1b721eeed146d ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the derivative on <x> unknown of <self>.

Parameters
----------
X: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****************** Evaluate ******************/
		/**** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.

Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****************** IsIdentical ******************/
		/**** md5 signature: 887141aa7f58c129eb32231276e0f0fa ****/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.

Parameters
----------
Other: Expr_GeneralExpression

Returns
-------
bool
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****************** IsLinear ******************/
		/**** md5 signature: 5e125c70746046ac726ed804bbbf922f ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsLinear;
		Standard_Boolean IsLinear();

		/****************** ShallowSimplified ******************/
		/**** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ****/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Returns a generalexpression after a simplification of the arguments of <self>.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
		/****************** Expr_Sinh ******************/
		/**** md5 signature: 2fbf772f2fe5ac00184a39d76b5f7ff6 ****/
		%feature("compactdefaultargs") Expr_Sinh;
		%feature("autodoc", "Creates the sinh of <exp>.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
None
") Expr_Sinh;
		 Expr_Sinh(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** Copy ******************/
		/**** md5 signature: 959911c21ab8344ca7df9189a97166b1 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****************** Derivative ******************/
		/**** md5 signature: 270fc2b9646e490f90b1b721eeed146d ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the derivative on <x> unknown of <self>.

Parameters
----------
X: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****************** Evaluate ******************/
		/**** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.

Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****************** IsIdentical ******************/
		/**** md5 signature: 887141aa7f58c129eb32231276e0f0fa ****/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.

Parameters
----------
Other: Expr_GeneralExpression

Returns
-------
bool
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****************** IsLinear ******************/
		/**** md5 signature: 5e125c70746046ac726ed804bbbf922f ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsLinear;
		Standard_Boolean IsLinear();

		/****************** ShallowSimplified ******************/
		/**** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ****/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Returns a generalexpression after a simplification of the arguments of <self>.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
		/****************** Expr_Square ******************/
		/**** md5 signature: c36229fd034d78a92d3ff5b362c1e99e ****/
		%feature("compactdefaultargs") Expr_Square;
		%feature("autodoc", "Creates the square of <exp>.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
None
") Expr_Square;
		 Expr_Square(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** Copy ******************/
		/**** md5 signature: 959911c21ab8344ca7df9189a97166b1 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****************** Derivative ******************/
		/**** md5 signature: 270fc2b9646e490f90b1b721eeed146d ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the derivative on <x> unknown of <self>.

Parameters
----------
X: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****************** Evaluate ******************/
		/**** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.

Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****************** IsIdentical ******************/
		/**** md5 signature: 887141aa7f58c129eb32231276e0f0fa ****/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.

Parameters
----------
Other: Expr_GeneralExpression

Returns
-------
bool
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****************** IsLinear ******************/
		/**** md5 signature: 5e125c70746046ac726ed804bbbf922f ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsLinear;
		Standard_Boolean IsLinear();

		/****************** ShallowSimplified ******************/
		/**** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ****/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Returns a generalexpression after a simplification of the arguments of <self>.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
		/****************** Expr_SquareRoot ******************/
		/**** md5 signature: 8a8794b40b3ad413d4571f0b4192f3bb ****/
		%feature("compactdefaultargs") Expr_SquareRoot;
		%feature("autodoc", "Creates the square root of <exp>.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
None
") Expr_SquareRoot;
		 Expr_SquareRoot(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** Copy ******************/
		/**** md5 signature: 959911c21ab8344ca7df9189a97166b1 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****************** Derivative ******************/
		/**** md5 signature: 270fc2b9646e490f90b1b721eeed146d ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the derivative on <x> unknown of <self>.

Parameters
----------
X: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****************** Evaluate ******************/
		/**** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.

Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****************** IsIdentical ******************/
		/**** md5 signature: 887141aa7f58c129eb32231276e0f0fa ****/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.

Parameters
----------
Other: Expr_GeneralExpression

Returns
-------
bool
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****************** IsLinear ******************/
		/**** md5 signature: 5e125c70746046ac726ed804bbbf922f ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsLinear;
		Standard_Boolean IsLinear();

		/****************** ShallowSimplified ******************/
		/**** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ****/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Returns a generalexpression after a simplification of the arguments of <self>.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
		/****************** Expr_Sum ******************/
		/**** md5 signature: 40407804027889b6462777ca64d2a684 ****/
		%feature("compactdefaultargs") Expr_Sum;
		%feature("autodoc", "Creates the sum of all the members of sequence <exps>.

Parameters
----------
exps: Expr_SequenceOfGeneralExpression

Returns
-------
None
") Expr_Sum;
		 Expr_Sum(const Expr_SequenceOfGeneralExpression & exps);

		/****************** Expr_Sum ******************/
		/**** md5 signature: fded1ec534bec9f5e2e433b83663bee2 ****/
		%feature("compactdefaultargs") Expr_Sum;
		%feature("autodoc", "Creates the sum of <exp1> and <exp2>.

Parameters
----------
exp1: Expr_GeneralExpression
exp2: Expr_GeneralExpression

Returns
-------
None
") Expr_Sum;
		 Expr_Sum(const opencascade::handle<Expr_GeneralExpression> & exp1, const opencascade::handle<Expr_GeneralExpression> & exp2);

		/****************** Copy ******************/
		/**** md5 signature: 959911c21ab8344ca7df9189a97166b1 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****************** Derivative ******************/
		/**** md5 signature: 270fc2b9646e490f90b1b721eeed146d ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the derivative on <x> unknown of <self>.

Parameters
----------
X: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****************** Evaluate ******************/
		/**** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.

Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****************** IsIdentical ******************/
		/**** md5 signature: 887141aa7f58c129eb32231276e0f0fa ****/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.

Parameters
----------
Other: Expr_GeneralExpression

Returns
-------
bool
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****************** IsLinear ******************/
		/**** md5 signature: 5e125c70746046ac726ed804bbbf922f ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsLinear;
		Standard_Boolean IsLinear();

		/****************** NDerivative ******************/
		/**** md5 signature: 64fe21d732fcfe80f37aea7c134ab146 ****/
		%feature("compactdefaultargs") NDerivative;
		%feature("autodoc", "Returns the <n>-th derivative on <x> unknown of <self>. raises outofrange if <n> <= 0.

Parameters
----------
X: Expr_NamedUnknown
N: int

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") NDerivative;
		virtual opencascade::handle<Expr_GeneralExpression> NDerivative(const opencascade::handle<Expr_NamedUnknown> & X, const Standard_Integer N);

		/****************** ShallowSimplified ******************/
		/**** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ****/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Returns a generalexpression after a simplification of the arguments of <self>.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
		/****************** Expr_Tangent ******************/
		/**** md5 signature: cdf65d26ee28ea59b45349d129adb9d6 ****/
		%feature("compactdefaultargs") Expr_Tangent;
		%feature("autodoc", "Creates the tangent of <exp>.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
None
") Expr_Tangent;
		 Expr_Tangent(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** Copy ******************/
		/**** md5 signature: 959911c21ab8344ca7df9189a97166b1 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****************** Derivative ******************/
		/**** md5 signature: 270fc2b9646e490f90b1b721eeed146d ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the derivative on <x> unknown of <self>.

Parameters
----------
X: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****************** Evaluate ******************/
		/**** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.

Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****************** IsIdentical ******************/
		/**** md5 signature: 887141aa7f58c129eb32231276e0f0fa ****/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.

Parameters
----------
Other: Expr_GeneralExpression

Returns
-------
bool
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****************** IsLinear ******************/
		/**** md5 signature: 5e125c70746046ac726ed804bbbf922f ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsLinear;
		Standard_Boolean IsLinear();

		/****************** ShallowSimplified ******************/
		/**** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ****/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Returns a generalexpression after a simplification of the arguments of <self>.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
		/****************** Expr_Tanh ******************/
		/**** md5 signature: 28ce53f706ca5ca2e9cb73c237d02437 ****/
		%feature("compactdefaultargs") Expr_Tanh;
		%feature("autodoc", "Creates the hyperbolic tangent of <exp>.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
None
") Expr_Tanh;
		 Expr_Tanh(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** Copy ******************/
		/**** md5 signature: 959911c21ab8344ca7df9189a97166b1 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****************** Derivative ******************/
		/**** md5 signature: 270fc2b9646e490f90b1b721eeed146d ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the derivative on <x> unknown of <self>.

Parameters
----------
X: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****************** Evaluate ******************/
		/**** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.

Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****************** IsIdentical ******************/
		/**** md5 signature: 887141aa7f58c129eb32231276e0f0fa ****/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.

Parameters
----------
Other: Expr_GeneralExpression

Returns
-------
bool
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****************** IsLinear ******************/
		/**** md5 signature: 5e125c70746046ac726ed804bbbf922f ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsLinear;
		Standard_Boolean IsLinear();

		/****************** ShallowSimplified ******************/
		/**** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ****/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Returns a generalexpression after a simplification of the arguments of <self>.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
		/****************** Expr_UnaryFunction ******************/
		/**** md5 signature: 29f391e131f9f953fe129056419f1834 ****/
		%feature("compactdefaultargs") Expr_UnaryFunction;
		%feature("autodoc", "Creates me as <func>(<exp>). raises exception if <func> is not unary.

Parameters
----------
func: Expr_GeneralFunction
exp: Expr_GeneralExpression

Returns
-------
None
") Expr_UnaryFunction;
		 Expr_UnaryFunction(const opencascade::handle<Expr_GeneralFunction> & func, const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** Copy ******************/
		/**** md5 signature: 959911c21ab8344ca7df9189a97166b1 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****************** Derivative ******************/
		/**** md5 signature: 270fc2b9646e490f90b1b721eeed146d ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the derivative on <x> unknown of <self>.

Parameters
----------
X: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****************** Evaluate ******************/
		/**** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.

Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****************** Function ******************/
		/**** md5 signature: f027f2800a46ad0cf94502538104cf73 ****/
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "Returns the function defining <self>.

Returns
-------
opencascade::handle<Expr_GeneralFunction>
") Function;
		opencascade::handle<Expr_GeneralFunction> Function();

		/****************** IsIdentical ******************/
		/**** md5 signature: 887141aa7f58c129eb32231276e0f0fa ****/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.

Parameters
----------
Other: Expr_GeneralExpression

Returns
-------
bool
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****************** IsLinear ******************/
		/**** md5 signature: 5e125c70746046ac726ed804bbbf922f ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsLinear;
		Standard_Boolean IsLinear();

		/****************** ShallowSimplified ******************/
		/**** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ****/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Returns a generalexpression after a simplification of the arguments of <self>.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
		/****************** Expr_UnaryMinus ******************/
		/**** md5 signature: 0ab675cc7ee867851527a908d57cb712 ****/
		%feature("compactdefaultargs") Expr_UnaryMinus;
		%feature("autodoc", "Create the unary minus of <exp>.

Parameters
----------
exp: Expr_GeneralExpression

Returns
-------
None
") Expr_UnaryMinus;
		 Expr_UnaryMinus(const opencascade::handle<Expr_GeneralExpression> & exp);

		/****************** Copy ******************/
		/**** md5 signature: 959911c21ab8344ca7df9189a97166b1 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns a copy of <self> having the same unknowns and functions.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy();

		/****************** Derivative ******************/
		/**** md5 signature: 270fc2b9646e490f90b1b721eeed146d ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the derivative on <x> unknown of <self>.

Parameters
----------
X: Expr_NamedUnknown

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative(const opencascade::handle<Expr_NamedUnknown> & X);

		/****************** Evaluate ******************/
		/**** md5 signature: 491e0633831dc6e8f8dfc1e5b5b66b35 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Returns the value of <self> (as a real) by replacement of <vars> by <vals>. raises notevaluable if <self> contains namedunknown not in <vars> or numericerror if result cannot be computed.

Parameters
----------
vars: Expr_Array1OfNamedUnknown
vals: TColStd_Array1OfReal

Returns
-------
float
") Evaluate;
		Standard_Real Evaluate(const Expr_Array1OfNamedUnknown & vars, const TColStd_Array1OfReal & vals);

		/****************** IsIdentical ******************/
		/**** md5 signature: 887141aa7f58c129eb32231276e0f0fa ****/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if <self> and <other> define the same expression. this method does not include any simplification before testing.

Parameters
----------
Other: Expr_GeneralExpression

Returns
-------
bool
") IsIdentical;
		Standard_Boolean IsIdentical(const opencascade::handle<Expr_GeneralExpression> & Other);

		/****************** IsLinear ******************/
		/**** md5 signature: 5e125c70746046ac726ed804bbbf922f ****/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsLinear;
		Standard_Boolean IsLinear();

		/****************** NDerivative ******************/
		/**** md5 signature: 64fe21d732fcfe80f37aea7c134ab146 ****/
		%feature("compactdefaultargs") NDerivative;
		%feature("autodoc", "Returns the <n>-th derivative on <x> unknown of <self>. raises outofrange if <n> <= 0.

Parameters
----------
X: Expr_NamedUnknown
N: int

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") NDerivative;
		virtual opencascade::handle<Expr_GeneralExpression> NDerivative(const opencascade::handle<Expr_NamedUnknown> & X, const Standard_Integer N);

		/****************** ShallowSimplified ******************/
		/**** md5 signature: a5d09ad682e9a8f8949e802ff3bd5c30 ****/
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "Returns a generalexpression after a simplification of the arguments of <self>.

Returns
-------
opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified();

		/****************** String ******************/
		/**** md5 signature: 29eba20994c971e692980f5879c5ee19 ****/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Returns a string representing <self> in a readable way.

Returns
-------
TCollection_AsciiString
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
