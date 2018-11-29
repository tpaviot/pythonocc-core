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
%define EXPRDOCSTRING
"This package describes the data structure of any
expression, relation or function used in mathematics.
It also describes the assignment of variables. Standard
mathematical functions are implemented such as
trigonometrics, hyperbolics, and log functions.

"
%enddef
%module (package="OCC.Core", docstring=EXPRDOCSTRING) Expr

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
%include ../common/OccHandle.i


%include Expr_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%wrap_handle(Expr_GeneralExpression)
%wrap_handle(Expr_GeneralFunction)
%wrap_handle(Expr_GeneralRelation)
%wrap_handle(Expr_IndexedMapNodeOfMapOfNamedUnknown)
%wrap_handle(Expr_SequenceNodeOfSequenceOfGeneralExpression)
%wrap_handle(Expr_SequenceNodeOfSequenceOfGeneralRelation)
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

%rename(expr) Expr;
class Expr {
	public:
		%feature("compactdefaultargs") CopyShare;
		%feature("autodoc", "	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: Handle_Expr_GeneralExpression
") CopyShare;
		static Handle_Expr_GeneralExpression CopyShare (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") NbOfFreeVariables;
		%feature("autodoc", "	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: int
") NbOfFreeVariables;
		static Standard_Integer NbOfFreeVariables (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") NbOfFreeVariables;
		%feature("autodoc", "	:param exp:
	:type exp: Handle_Expr_GeneralRelation &
	:rtype: int
") NbOfFreeVariables;
		static Standard_Integer NbOfFreeVariables (const Handle_Expr_GeneralRelation & exp);
		%feature("compactdefaultargs") Sign;
		%feature("autodoc", "	:param val:
	:type val: float
	:rtype: float
") Sign;
		static Standard_Real Sign (const Standard_Real val);
};


%extend Expr {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_Array1OfGeneralExpression;
class Expr_Array1OfGeneralExpression {
	public:
		%feature("compactdefaultargs") Expr_Array1OfGeneralExpression;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Expr_Array1OfGeneralExpression;
		 Expr_Array1OfGeneralExpression (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Expr_Array1OfGeneralExpression;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Expr_GeneralExpression &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Expr_Array1OfGeneralExpression;
		 Expr_Array1OfGeneralExpression (const Handle_Expr_GeneralExpression & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_Expr_GeneralExpression &
	:rtype: None
") Init;
		void Init (const Handle_Expr_GeneralExpression & V);
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
	:type Other: Expr_Array1OfGeneralExpression &
	:rtype: Expr_Array1OfGeneralExpression
") Assign;
		const Expr_Array1OfGeneralExpression & Assign (const Expr_Array1OfGeneralExpression & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Expr_Array1OfGeneralExpression &
	:rtype: Expr_Array1OfGeneralExpression
") operator =;
		const Expr_Array1OfGeneralExpression & operator = (const Expr_Array1OfGeneralExpression & Other);
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
	:type Value: Handle_Expr_GeneralExpression &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Expr_GeneralExpression & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Expr_GeneralExpression
") Value;
		Handle_Expr_GeneralExpression Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Expr_GeneralExpression
") ChangeValue;
		Handle_Expr_GeneralExpression ChangeValue (const Standard_Integer Index);
};



%extend Expr_Array1OfGeneralExpression {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend Expr_Array1OfGeneralExpression {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_Array1OfNamedUnknown;
class Expr_Array1OfNamedUnknown {
	public:
		%feature("compactdefaultargs") Expr_Array1OfNamedUnknown;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Expr_Array1OfNamedUnknown;
		 Expr_Array1OfNamedUnknown (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Expr_Array1OfNamedUnknown;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Expr_NamedUnknown &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Expr_Array1OfNamedUnknown;
		 Expr_Array1OfNamedUnknown (const Handle_Expr_NamedUnknown & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_Expr_NamedUnknown &
	:rtype: None
") Init;
		void Init (const Handle_Expr_NamedUnknown & V);
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
	:type Other: Expr_Array1OfNamedUnknown &
	:rtype: Expr_Array1OfNamedUnknown
") Assign;
		const Expr_Array1OfNamedUnknown & Assign (const Expr_Array1OfNamedUnknown & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Expr_Array1OfNamedUnknown &
	:rtype: Expr_Array1OfNamedUnknown
") operator =;
		const Expr_Array1OfNamedUnknown & operator = (const Expr_Array1OfNamedUnknown & Other);
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
	:type Value: Handle_Expr_NamedUnknown &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Expr_NamedUnknown & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Expr_NamedUnknown
") Value;
		Handle_Expr_NamedUnknown Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Expr_NamedUnknown
") ChangeValue;
		Handle_Expr_NamedUnknown ChangeValue (const Standard_Integer Index);
};



%extend Expr_Array1OfNamedUnknown {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend Expr_Array1OfNamedUnknown {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_Array1OfSingleRelation;
class Expr_Array1OfSingleRelation {
	public:
		%feature("compactdefaultargs") Expr_Array1OfSingleRelation;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Expr_Array1OfSingleRelation;
		 Expr_Array1OfSingleRelation (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Expr_Array1OfSingleRelation;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Expr_SingleRelation &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Expr_Array1OfSingleRelation;
		 Expr_Array1OfSingleRelation (const Handle_Expr_SingleRelation & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_Expr_SingleRelation &
	:rtype: None
") Init;
		void Init (const Handle_Expr_SingleRelation & V);
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
	:type Other: Expr_Array1OfSingleRelation &
	:rtype: Expr_Array1OfSingleRelation
") Assign;
		const Expr_Array1OfSingleRelation & Assign (const Expr_Array1OfSingleRelation & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Expr_Array1OfSingleRelation &
	:rtype: Expr_Array1OfSingleRelation
") operator =;
		const Expr_Array1OfSingleRelation & operator = (const Expr_Array1OfSingleRelation & Other);
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
	:type Value: Handle_Expr_SingleRelation &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Expr_SingleRelation & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Expr_SingleRelation
") Value;
		Handle_Expr_SingleRelation Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Expr_SingleRelation
") ChangeValue;
		Handle_Expr_SingleRelation ChangeValue (const Standard_Integer Index);
};



%extend Expr_Array1OfSingleRelation {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend Expr_Array1OfSingleRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_GeneralExpression;
class Expr_GeneralExpression : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") NbSubExpressions;
		%feature("autodoc", "	* Returns the number of sub-expressions contained in <self> ( >= 0)

	:rtype: int
") NbSubExpressions;
		virtual Standard_Integer NbSubExpressions ();
		%feature("compactdefaultargs") SubExpression;
		%feature("autodoc", "	* Returns the <I>-th sub-expression of <self> raises OutOfRange if <I> > NbSubExpressions(me)

	:param I:
	:type I: int
	:rtype: Handle_Expr_GeneralExpression
") SubExpression;
		Handle_Expr_GeneralExpression SubExpression (const Standard_Integer I);
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "	* Returns a GeneralExpression after replacement of NamedUnknowns by an associated expression and after values computation.

	:rtype: Handle_Expr_GeneralExpression
") Simplified;
		virtual Handle_Expr_GeneralExpression Simplified ();
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		virtual Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		virtual Handle_Expr_GeneralExpression Copy ();
		%feature("compactdefaultargs") ContainsUnknowns;
		%feature("autodoc", "	* Tests if <self> contains NamedUnknowns.

	:rtype: bool
") ContainsUnknowns;
		virtual Standard_Boolean ContainsUnknowns ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Tests if <exp> is contained in <self>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: bool
") Contains;
		virtual Standard_Boolean Contains (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	* Tests if <self> is linear on every NamedUnknown it contains.

	:rtype: bool
") IsLinear;
		virtual Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") IsShareable;
		%feature("autodoc", "	* Tests if <self> can be shared by one or more expressions or must be copied. This method returns False as a default value. To be redefined ( especially for NamedUnknown).

	:rtype: bool
") IsShareable;
		virtual Standard_Boolean IsShareable ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. Warning: This method does not include any simplification before testing. It could also be very slow; to be used carefully.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		virtual Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		virtual Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("compactdefaultargs") NDerivative;
		%feature("autodoc", "	* Returns the <N>-th derivative on <X> unknown of <self>. Raise OutOfRange if N <= 0

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:param N:
	:type N: int
	:rtype: Handle_Expr_GeneralExpression
") NDerivative;
		virtual Handle_Expr_GeneralExpression NDerivative (const Handle_Expr_NamedUnknown & X,const Standard_Integer N);
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "	* Replaces all occurences of <var> with copies of <with> in <self>. Copies of <with> are made with the Copy() method. Raises InvalidOperand if <with> contains <self>.

	:param var:
	:type var: Handle_Expr_NamedUnknown &
	:param with:
	:type with: Handle_Expr_GeneralExpression &
	:rtype: void
") Replace;
		virtual void Replace (const Handle_Expr_NamedUnknown & var,const Handle_Expr_GeneralExpression & with);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		virtual Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") EvaluateNumeric;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:rtype: float
") EvaluateNumeric;
		Standard_Real EvaluateNumeric ();
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		virtual TCollection_AsciiString String ();
};


%make_alias(Expr_GeneralExpression)

%extend Expr_GeneralExpression {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_GeneralFunction;
class Expr_GeneralFunction : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") NbOfVariables;
		%feature("autodoc", "	* Returns the number of variables of <self>.

	:rtype: int
") NbOfVariables;
		virtual Standard_Integer NbOfVariables ();
		%feature("compactdefaultargs") Variable;
		%feature("autodoc", "	* Returns the variable denoted by <index> in <self>. Raises OutOfRange if index > NbOfVariables.

	:param index:
	:type index: int
	:rtype: Handle_Expr_NamedUnknown
") Variable;
		virtual Handle_Expr_NamedUnknown Variable (const Standard_Integer index);
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> with the same form.

	:rtype: Handle_Expr_GeneralFunction
") Copy;
		virtual Handle_Expr_GeneralFunction Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns Derivative of <self> for variable <var>.

	:param var:
	:type var: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralFunction
") Derivative;
		virtual Handle_Expr_GeneralFunction Derivative (const Handle_Expr_NamedUnknown & var);
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns Derivative of <self> for variable <var> with degree <deg>.

	:param var:
	:type var: Handle_Expr_NamedUnknown &
	:param deg:
	:type deg: int
	:rtype: Handle_Expr_GeneralFunction
") Derivative;
		virtual Handle_Expr_GeneralFunction Derivative (const Handle_Expr_NamedUnknown & var,const Standard_Integer deg);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Computes the value of <self> with the given variables. Raises NotEvaluable if <vars> does not match all variables of <self>.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		virtual Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <func> are similar functions (same name and same used expression).

	:param func:
	:type func: Handle_Expr_GeneralFunction &
	:rtype: bool
") IsIdentical;
		virtual Standard_Boolean IsIdentical (const Handle_Expr_GeneralFunction & func);
		%feature("compactdefaultargs") IsLinearOnVariable;
		%feature("autodoc", "	* Tests if <self> is linear on variable on range <index>

	:param index:
	:type index: int
	:rtype: bool
") IsLinearOnVariable;
		virtual Standard_Boolean IsLinearOnVariable (const Standard_Integer index);
		%feature("compactdefaultargs") GetStringName;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") GetStringName;
		virtual TCollection_AsciiString GetStringName ();
};


%make_alias(Expr_GeneralFunction)

%extend Expr_GeneralFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_GeneralRelation;
class Expr_GeneralRelation : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "	* Returns the current status of the relation

	:rtype: bool
") IsSatisfied;
		virtual Standard_Boolean IsSatisfied ();
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	* Tests if <self> is linear between its NamedUnknowns.

	:rtype: bool
") IsLinear;
		virtual Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "	* Returns a GeneralRelation after replacement of NamedUnknowns by an associated expression, and after values computation.

	:rtype: Handle_Expr_GeneralRelation
") Simplified;
		virtual Handle_Expr_GeneralRelation Simplified ();
		%feature("compactdefaultargs") Simplify;
		%feature("autodoc", "	* Replaces NamedUnknowns by associated expressions, and computes values in <self>.

	:rtype: void
") Simplify;
		virtual void Simplify ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralRelation
") Copy;
		virtual Handle_Expr_GeneralRelation Copy ();
		%feature("compactdefaultargs") NbOfSubRelations;
		%feature("autodoc", "	* Returns the number of relations contained in <self>.

	:rtype: int
") NbOfSubRelations;
		virtual Standard_Integer NbOfSubRelations ();
		%feature("compactdefaultargs") NbOfSingleRelations;
		%feature("autodoc", "	* Returns the number of SingleRelations contained in <self>.

	:rtype: int
") NbOfSingleRelations;
		virtual Standard_Integer NbOfSingleRelations ();
		%feature("compactdefaultargs") SubRelation;
		%feature("autodoc", "	* Returns the relation denoted by <index> in <self>. An exception is raised if <index> is out of range.

	:param index:
	:type index: int
	:rtype: Handle_Expr_GeneralRelation
") SubRelation;
		virtual Handle_Expr_GeneralRelation SubRelation (const Standard_Integer index);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Tests if <exp> contains <var>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: bool
") Contains;
		virtual Standard_Boolean Contains (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "	* Replaces all occurences of <var> with <with> in <self>.

	:param var:
	:type var: Handle_Expr_NamedUnknown &
	:param with:
	:type with: Handle_Expr_GeneralExpression &
	:rtype: void
") Replace;
		virtual void Replace (const Handle_Expr_NamedUnknown & var,const Handle_Expr_GeneralExpression & with);
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		virtual TCollection_AsciiString String ();
};


%make_alias(Expr_GeneralRelation)

%extend Expr_GeneralRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_IndexedMapNodeOfMapOfNamedUnknown;
class Expr_IndexedMapNodeOfMapOfNamedUnknown : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") Expr_IndexedMapNodeOfMapOfNamedUnknown;
		%feature("autodoc", "	:param K1:
	:type K1: Handle_Expr_NamedUnknown &
	:param K2:
	:type K2: int
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") Expr_IndexedMapNodeOfMapOfNamedUnknown;
		 Expr_IndexedMapNodeOfMapOfNamedUnknown (const Handle_Expr_NamedUnknown & K1,const Standard_Integer K2,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("compactdefaultargs") Key1;
		%feature("autodoc", "	:rtype: Handle_Expr_NamedUnknown
") Key1;
		Handle_Expr_NamedUnknown Key1 ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey2() {
                return (Standard_Integer) $self->Key2();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey2(Standard_Integer value ) {
                $self->Key2()=value;
                }
            };
            		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
};


%make_alias(Expr_IndexedMapNodeOfMapOfNamedUnknown)

%extend Expr_IndexedMapNodeOfMapOfNamedUnknown {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_MapOfNamedUnknown;
class Expr_MapOfNamedUnknown : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") Expr_MapOfNamedUnknown;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") Expr_MapOfNamedUnknown;
		 Expr_MapOfNamedUnknown (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Expr_MapOfNamedUnknown;
		%feature("autodoc", "	:param Other:
	:type Other: Expr_MapOfNamedUnknown &
	:rtype: None
") Expr_MapOfNamedUnknown;
		 Expr_MapOfNamedUnknown (const Expr_MapOfNamedUnknown & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Expr_MapOfNamedUnknown &
	:rtype: Expr_MapOfNamedUnknown
") Assign;
		Expr_MapOfNamedUnknown & Assign (const Expr_MapOfNamedUnknown & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Expr_MapOfNamedUnknown &
	:rtype: Expr_MapOfNamedUnknown
") operator =;
		Expr_MapOfNamedUnknown & operator = (const Expr_MapOfNamedUnknown & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param K:
	:type K: Handle_Expr_NamedUnknown &
	:rtype: int
") Add;
		Standard_Integer Add (const Handle_Expr_NamedUnknown & K);
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "	:param I:
	:type I: int
	:param K:
	:type K: Handle_Expr_NamedUnknown &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const Handle_Expr_NamedUnknown & K);
		%feature("compactdefaultargs") RemoveLast;
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param K:
	:type K: Handle_Expr_NamedUnknown &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Expr_NamedUnknown & K);
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: Handle_Expr_NamedUnknown
") FindKey;
		Handle_Expr_NamedUnknown FindKey (const Standard_Integer I);
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "	:param K:
	:type K: Handle_Expr_NamedUnknown &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const Handle_Expr_NamedUnknown & K);
};


%extend Expr_MapOfNamedUnknown {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_RUIterator;
class Expr_RUIterator {
	public:
		%feature("compactdefaultargs") Expr_RUIterator;
		%feature("autodoc", "	* Creates an iterator on every NamedUnknown contained in <rel>.

	:param rel:
	:type rel: Handle_Expr_GeneralRelation &
	:rtype: None
") Expr_RUIterator;
		 Expr_RUIterator (const Handle_Expr_GeneralRelation & rel);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* Returns False if on other unknown remains.

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns current NamedUnknown. Raises exception if no more unknowns remain.

	:rtype: Handle_Expr_NamedUnknown
") Value;
		Handle_Expr_NamedUnknown Value ();
};


%extend Expr_RUIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_RelationIterator;
class Expr_RelationIterator {
	public:
		%feature("compactdefaultargs") Expr_RelationIterator;
		%feature("autodoc", "	:param rel:
	:type rel: Handle_Expr_GeneralRelation &
	:rtype: None
") Expr_RelationIterator;
		 Expr_RelationIterator (const Handle_Expr_GeneralRelation & rel);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* Returns False if no other relation remains.

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns current basic relation. Exception is raised if no more relation remains.

	:rtype: Handle_Expr_SingleRelation
") Value;
		Handle_Expr_SingleRelation Value ();
};


%extend Expr_RelationIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_SequenceNodeOfSequenceOfGeneralExpression;
class Expr_SequenceNodeOfSequenceOfGeneralExpression : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Expr_SequenceNodeOfSequenceOfGeneralExpression;
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralExpression &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Expr_SequenceNodeOfSequenceOfGeneralExpression;
		 Expr_SequenceNodeOfSequenceOfGeneralExpression (const Handle_Expr_GeneralExpression & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralExpression
") Value;
		Handle_Expr_GeneralExpression Value ();
};


%make_alias(Expr_SequenceNodeOfSequenceOfGeneralExpression)

%extend Expr_SequenceNodeOfSequenceOfGeneralExpression {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_SequenceNodeOfSequenceOfGeneralRelation;
class Expr_SequenceNodeOfSequenceOfGeneralRelation : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Expr_SequenceNodeOfSequenceOfGeneralRelation;
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralRelation &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Expr_SequenceNodeOfSequenceOfGeneralRelation;
		 Expr_SequenceNodeOfSequenceOfGeneralRelation (const Handle_Expr_GeneralRelation & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralRelation
") Value;
		Handle_Expr_GeneralRelation Value ();
};


%make_alias(Expr_SequenceNodeOfSequenceOfGeneralRelation)

%extend Expr_SequenceNodeOfSequenceOfGeneralRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_SequenceOfGeneralExpression;
class Expr_SequenceOfGeneralExpression : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Expr_SequenceOfGeneralExpression;
		%feature("autodoc", "	:rtype: None
") Expr_SequenceOfGeneralExpression;
		 Expr_SequenceOfGeneralExpression ();
		%feature("compactdefaultargs") Expr_SequenceOfGeneralExpression;
		%feature("autodoc", "	:param Other:
	:type Other: Expr_SequenceOfGeneralExpression &
	:rtype: None
") Expr_SequenceOfGeneralExpression;
		 Expr_SequenceOfGeneralExpression (const Expr_SequenceOfGeneralExpression & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Expr_SequenceOfGeneralExpression &
	:rtype: Expr_SequenceOfGeneralExpression
") Assign;
		const Expr_SequenceOfGeneralExpression & Assign (const Expr_SequenceOfGeneralExpression & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Expr_SequenceOfGeneralExpression &
	:rtype: Expr_SequenceOfGeneralExpression
") operator =;
		const Expr_SequenceOfGeneralExpression & operator = (const Expr_SequenceOfGeneralExpression & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_Expr_GeneralExpression &
	:rtype: None
") Append;
		void Append (const Handle_Expr_GeneralExpression & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Expr_SequenceOfGeneralExpression &
	:rtype: None
") Append;
		void Append (Expr_SequenceOfGeneralExpression & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_Expr_GeneralExpression &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Expr_GeneralExpression & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Expr_SequenceOfGeneralExpression &
	:rtype: None
") Prepend;
		void Prepend (Expr_SequenceOfGeneralExpression & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Expr_GeneralExpression &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Expr_GeneralExpression & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Expr_SequenceOfGeneralExpression &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Expr_SequenceOfGeneralExpression & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Expr_GeneralExpression &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Expr_GeneralExpression & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Expr_SequenceOfGeneralExpression &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Expr_SequenceOfGeneralExpression & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralExpression
") First;
		Handle_Expr_GeneralExpression First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralExpression
") Last;
		Handle_Expr_GeneralExpression Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Expr_SequenceOfGeneralExpression &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Expr_SequenceOfGeneralExpression & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Expr_GeneralExpression
") Value;
		Handle_Expr_GeneralExpression Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_Expr_GeneralExpression &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Expr_GeneralExpression & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Expr_GeneralExpression
") ChangeValue;
		Handle_Expr_GeneralExpression ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend Expr_SequenceOfGeneralExpression {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_SequenceOfGeneralRelation;
class Expr_SequenceOfGeneralRelation : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Expr_SequenceOfGeneralRelation;
		%feature("autodoc", "	:rtype: None
") Expr_SequenceOfGeneralRelation;
		 Expr_SequenceOfGeneralRelation ();
		%feature("compactdefaultargs") Expr_SequenceOfGeneralRelation;
		%feature("autodoc", "	:param Other:
	:type Other: Expr_SequenceOfGeneralRelation &
	:rtype: None
") Expr_SequenceOfGeneralRelation;
		 Expr_SequenceOfGeneralRelation (const Expr_SequenceOfGeneralRelation & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Expr_SequenceOfGeneralRelation &
	:rtype: Expr_SequenceOfGeneralRelation
") Assign;
		const Expr_SequenceOfGeneralRelation & Assign (const Expr_SequenceOfGeneralRelation & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Expr_SequenceOfGeneralRelation &
	:rtype: Expr_SequenceOfGeneralRelation
") operator =;
		const Expr_SequenceOfGeneralRelation & operator = (const Expr_SequenceOfGeneralRelation & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_Expr_GeneralRelation &
	:rtype: None
") Append;
		void Append (const Handle_Expr_GeneralRelation & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Expr_SequenceOfGeneralRelation &
	:rtype: None
") Append;
		void Append (Expr_SequenceOfGeneralRelation & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_Expr_GeneralRelation &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Expr_GeneralRelation & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Expr_SequenceOfGeneralRelation &
	:rtype: None
") Prepend;
		void Prepend (Expr_SequenceOfGeneralRelation & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Expr_GeneralRelation &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Expr_GeneralRelation & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Expr_SequenceOfGeneralRelation &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Expr_SequenceOfGeneralRelation & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Expr_GeneralRelation &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Expr_GeneralRelation & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Expr_SequenceOfGeneralRelation &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Expr_SequenceOfGeneralRelation & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralRelation
") First;
		Handle_Expr_GeneralRelation First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralRelation
") Last;
		Handle_Expr_GeneralRelation Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Expr_SequenceOfGeneralRelation &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Expr_SequenceOfGeneralRelation & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Expr_GeneralRelation
") Value;
		Handle_Expr_GeneralRelation Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_Expr_GeneralRelation &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Expr_GeneralRelation & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Expr_GeneralRelation
") ChangeValue;
		Handle_Expr_GeneralRelation ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend Expr_SequenceOfGeneralRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_UnknownIterator;
class Expr_UnknownIterator {
	public:
		%feature("compactdefaultargs") Expr_UnknownIterator;
		%feature("autodoc", "	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_UnknownIterator;
		 Expr_UnknownIterator (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Expr_NamedUnknown
") Value;
		Handle_Expr_NamedUnknown Value ();
};


%extend Expr_UnknownIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_BinaryExpression;
class Expr_BinaryExpression : public Expr_GeneralExpression {
	public:
		%feature("compactdefaultargs") FirstOperand;
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralExpression
") FirstOperand;
		Handle_Expr_GeneralExpression FirstOperand ();
		%feature("compactdefaultargs") SecondOperand;
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralExpression
") SecondOperand;
		Handle_Expr_GeneralExpression SecondOperand ();
		%feature("compactdefaultargs") SetFirstOperand;
		%feature("autodoc", "	* Sets first operand of <self> Raises InvalidOperand if exp = me

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") SetFirstOperand;
		void SetFirstOperand (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") SetSecondOperand;
		%feature("autodoc", "	* Sets second operand of <self> Raises InvalidOperand if <exp> contains <self>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") SetSecondOperand;
		void SetSecondOperand (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") NbSubExpressions;
		%feature("autodoc", "	* returns the number of sub-expressions contained in <self> ( >= 0)

	:rtype: int
") NbSubExpressions;
		Standard_Integer NbSubExpressions ();
		%feature("compactdefaultargs") SubExpression;
		%feature("autodoc", "	* returns the <I>-th sub-expression of <self> raises OutOfRange if <I> > NbSubExpressions(me)

	:param I:
	:type I: int
	:rtype: Handle_Expr_GeneralExpression
") SubExpression;
		Handle_Expr_GeneralExpression SubExpression (const Standard_Integer I);
		%feature("compactdefaultargs") ContainsUnknowns;
		%feature("autodoc", "	* Does <self> contain NamedUnknown ?

	:rtype: bool
") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Tests if <self> contains <exp>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "	* Replaces all occurences of <var> with <with> in <self>. Raises InvalidOperand if <with> contains <self>.

	:param var:
	:type var: Handle_Expr_NamedUnknown &
	:param with:
	:type with: Handle_Expr_GeneralExpression &
	:rtype: None
") Replace;
		void Replace (const Handle_Expr_NamedUnknown & var,const Handle_Expr_GeneralExpression & with);
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "	* Returns a GeneralExpression after replacement of NamedUnknowns by an associated expression and after values computation.

	:rtype: Handle_Expr_GeneralExpression
") Simplified;
		Handle_Expr_GeneralExpression Simplified ();
};


%make_alias(Expr_BinaryExpression)

%extend Expr_BinaryExpression {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_FunctionDerivative;
class Expr_FunctionDerivative : public Expr_GeneralFunction {
	public:
		%feature("compactdefaultargs") Expr_FunctionDerivative;
		%feature("autodoc", "	* Creates a FunctionDerivative of degree <deg> relative to the <withX> variable. Raises OutOfRange if <deg> lower or equal to zero.

	:param func:
	:type func: Handle_Expr_GeneralFunction &
	:param withX:
	:type withX: Handle_Expr_NamedUnknown &
	:param deg:
	:type deg: int
	:rtype: None
") Expr_FunctionDerivative;
		 Expr_FunctionDerivative (const Handle_Expr_GeneralFunction & func,const Handle_Expr_NamedUnknown & withX,const Standard_Integer deg);
		%feature("compactdefaultargs") NbOfVariables;
		%feature("autodoc", "	* Returns the number of variables of <self>.

	:rtype: int
") NbOfVariables;
		Standard_Integer NbOfVariables ();
		%feature("compactdefaultargs") Variable;
		%feature("autodoc", "	* Returns the variable denoted by <index> in <self>. Raises OutOfRange if <index> greater than NbOfVariables of <self>.

	:param index:
	:type index: int
	:rtype: Handle_Expr_NamedUnknown
") Variable;
		Handle_Expr_NamedUnknown Variable (const Standard_Integer index);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Computes the value of <self> with the given variables. Raises DimensionMismatch if Length(vars) is different from Length(values).

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param values:
	:type values: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & values);
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> with the same form.

	:rtype: Handle_Expr_GeneralFunction
") Copy;
		Handle_Expr_GeneralFunction Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns Derivative of <self> for variable <var>.

	:param var:
	:type var: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralFunction
") Derivative;
		Handle_Expr_GeneralFunction Derivative (const Handle_Expr_NamedUnknown & var);
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns Derivative of <self> for variable <var> with degree <deg>.

	:param var:
	:type var: Handle_Expr_NamedUnknown &
	:param deg:
	:type deg: int
	:rtype: Handle_Expr_GeneralFunction
") Derivative;
		Handle_Expr_GeneralFunction Derivative (const Handle_Expr_NamedUnknown & var,const Standard_Integer deg);
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <func> are similar functions (same name and same used expression).

	:param func:
	:type func: Handle_Expr_GeneralFunction &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralFunction & func);
		%feature("compactdefaultargs") IsLinearOnVariable;
		%feature("autodoc", "	* Tests if <self> is linear on variable on range <index>

	:param index:
	:type index: int
	:rtype: bool
") IsLinearOnVariable;
		Standard_Boolean IsLinearOnVariable (const Standard_Integer index);
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "	* Returns the function of which <self> is the derivative.

	:rtype: Handle_Expr_GeneralFunction
") Function;
		Handle_Expr_GeneralFunction Function ();
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "	* Returns the degree of derivation of <self>.

	:rtype: int
") Degree;
		Standard_Integer Degree ();
		%feature("compactdefaultargs") DerivVariable;
		%feature("autodoc", "	* Returns the derivation variable of <self>.

	:rtype: Handle_Expr_NamedUnknown
") DerivVariable;
		Handle_Expr_NamedUnknown DerivVariable ();
		%feature("compactdefaultargs") GetStringName;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") GetStringName;
		TCollection_AsciiString GetStringName ();
		%feature("compactdefaultargs") Expression;
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralExpression
") Expression;
		Handle_Expr_GeneralExpression Expression ();
		%feature("compactdefaultargs") UpdateExpression;
		%feature("autodoc", "	:rtype: None
") UpdateExpression;
		void UpdateExpression ();
};


%make_alias(Expr_FunctionDerivative)

%extend Expr_FunctionDerivative {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_NamedExpression;
class Expr_NamedExpression : public Expr_GeneralExpression {
	public:
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") GetName;
		const TCollection_AsciiString & GetName ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:rtype: None
") SetName;
		void SetName (const TCollection_AsciiString & name);
		%feature("compactdefaultargs") IsShareable;
		%feature("autodoc", "	* Tests if <self> can be shared by one or more expressions or must be copied. This method redefines to a True value the GeneralExpression method.

	:rtype: bool
") IsShareable;
		virtual Standard_Boolean IsShareable ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_NamedExpression)

%extend Expr_NamedExpression {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_NamedFunction;
class Expr_NamedFunction : public Expr_GeneralFunction {
	public:
		%feature("compactdefaultargs") Expr_NamedFunction;
		%feature("autodoc", "	* Creates a function of given variables <vars> with name <name> defined by the expression <exp>.

	:param name:
	:type name: TCollection_AsciiString &
	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:rtype: None
") Expr_NamedFunction;
		 Expr_NamedFunction (const TCollection_AsciiString & name,const Handle_Expr_GeneralExpression & exp,const Expr_Array1OfNamedUnknown & vars);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Sets the name <newname> to <self>.

	:param newname:
	:type newname: TCollection_AsciiString &
	:rtype: None
") SetName;
		void SetName (const TCollection_AsciiString & newname);
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "	* Returns the name assigned to <self>

	:rtype: TCollection_AsciiString
") GetName;
		TCollection_AsciiString GetName ();
		%feature("compactdefaultargs") NbOfVariables;
		%feature("autodoc", "	* Returns the number of variables of <self>.

	:rtype: int
") NbOfVariables;
		Standard_Integer NbOfVariables ();
		%feature("compactdefaultargs") Variable;
		%feature("autodoc", "	* Returns the variable denoted by <index> in <self>. Raises OutOfRange if <index> is greater than NbOfVariables of <self>, or less than or equal to zero.

	:param index:
	:type index: int
	:rtype: Handle_Expr_NamedUnknown
") Variable;
		Handle_Expr_NamedUnknown Variable (const Standard_Integer index);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Computes the value of <self> with the given variables. Raises DimensionMismatch if Length(vars) is different from Length(values).

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param values:
	:type values: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & values);
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> with the same form.

	:rtype: Handle_Expr_GeneralFunction
") Copy;
		Handle_Expr_GeneralFunction Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns Derivative of <self> for variable <var>.

	:param var:
	:type var: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralFunction
") Derivative;
		Handle_Expr_GeneralFunction Derivative (const Handle_Expr_NamedUnknown & var);
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns Derivative of <self> for variable <var> with degree <deg>.

	:param var:
	:type var: Handle_Expr_NamedUnknown &
	:param deg:
	:type deg: int
	:rtype: Handle_Expr_GeneralFunction
") Derivative;
		Handle_Expr_GeneralFunction Derivative (const Handle_Expr_NamedUnknown & var,const Standard_Integer deg);
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <func> are similar functions (same name and same used expression).

	:param func:
	:type func: Handle_Expr_GeneralFunction &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralFunction & func);
		%feature("compactdefaultargs") IsLinearOnVariable;
		%feature("autodoc", "	* Tests if <self> is linear on variable on range <index>

	:param index:
	:type index: int
	:rtype: bool
") IsLinearOnVariable;
		Standard_Boolean IsLinearOnVariable (const Standard_Integer index);
		%feature("compactdefaultargs") GetStringName;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") GetStringName;
		TCollection_AsciiString GetStringName ();
		%feature("compactdefaultargs") Expression;
		%feature("autodoc", "	* Returns equivalent expression of <self>.

	:rtype: Handle_Expr_GeneralExpression
") Expression;
		Handle_Expr_GeneralExpression Expression ();
		%feature("compactdefaultargs") SetExpression;
		%feature("autodoc", "	* Modifies expression of <self>. Warning: Beware of derivatives. See FunctionDerivative

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") SetExpression;
		void SetExpression (const Handle_Expr_GeneralExpression & exp);
};


%make_alias(Expr_NamedFunction)

%extend Expr_NamedFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_NumericValue;
class Expr_NumericValue : public Expr_GeneralExpression {
	public:
		%feature("compactdefaultargs") Expr_NumericValue;
		%feature("autodoc", "	:param val:
	:type val: float
	:rtype: None
") Expr_NumericValue;
		 Expr_NumericValue (const Standard_Real val);
		%feature("compactdefaultargs") GetValue;
		%feature("autodoc", "	:rtype: float
") GetValue;
		Standard_Real GetValue ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param val:
	:type val: float
	:rtype: None
") SetValue;
		void SetValue (const Standard_Real val);
		%feature("compactdefaultargs") NbSubExpressions;
		%feature("autodoc", "	* Returns the number of sub-expressions contained in <self> ( >= 0)

	:rtype: int
") NbSubExpressions;
		Standard_Integer NbSubExpressions ();
		%feature("compactdefaultargs") SubExpression;
		%feature("autodoc", "	* Returns the <I>-th sub-expression of <self> raises OutOfRange if <I> > NbSubExpressions(me)

	:param I:
	:type I: int
	:rtype: Handle_Expr_GeneralExpression
") SubExpression;
		Handle_Expr_GeneralExpression SubExpression (const Standard_Integer I);
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "	* Returns a GeneralExpression after replacement of NamedUnknowns by an associated expression and after values computation.

	:rtype: Handle_Expr_GeneralExpression
") Simplified;
		Handle_Expr_GeneralExpression Simplified ();
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("compactdefaultargs") ContainsUnknowns;
		%feature("autodoc", "	* Tests if <self> contains NamedUnknown.

	:rtype: bool
") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Tests if <exp> is contained in <self>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("compactdefaultargs") NDerivative;
		%feature("autodoc", "	* Returns the <N>-th derivative on <X> unknown of <self>. Raises OutOfRange if <N> <= 0

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:param N:
	:type N: int
	:rtype: Handle_Expr_GeneralExpression
") NDerivative;
		virtual Handle_Expr_GeneralExpression NDerivative (const Handle_Expr_NamedUnknown & X,const Standard_Integer N);
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "	* Replaces all occurences of <var> with <with> in <self>

	:param var:
	:type var: Handle_Expr_NamedUnknown &
	:param with:
	:type with: Handle_Expr_GeneralExpression &
	:rtype: None
") Replace;
		void Replace (const Handle_Expr_NamedUnknown & var,const Handle_Expr_GeneralExpression & with);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_NumericValue)

%extend Expr_NumericValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_PolyExpression;
class Expr_PolyExpression : public Expr_GeneralExpression {
	public:
		%feature("compactdefaultargs") NbOperands;
		%feature("autodoc", "	* returns the number of operands contained in <self>

	:rtype: int
") NbOperands;
		Standard_Integer NbOperands ();
		%feature("compactdefaultargs") Operand;
		%feature("autodoc", "	* Returns the <index>-th operand used in <self>. An exception is raised if index is out of range

	:param index:
	:type index: int
	:rtype: Handle_Expr_GeneralExpression
") Operand;
		Handle_Expr_GeneralExpression Operand (const Standard_Integer index);
		%feature("compactdefaultargs") SetOperand;
		%feature("autodoc", "	* Sets the <index>-th operand used in <self>. An exception is raised if <index> is out of range Raises InvalidOperand if <exp> contains <self>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:param index:
	:type index: int
	:rtype: None
") SetOperand;
		void SetOperand (const Handle_Expr_GeneralExpression & exp,const Standard_Integer index);
		%feature("compactdefaultargs") NbSubExpressions;
		%feature("autodoc", "	* returns the number of sub-expressions contained in <self> ( >= 2)

	:rtype: int
") NbSubExpressions;
		Standard_Integer NbSubExpressions ();
		%feature("compactdefaultargs") SubExpression;
		%feature("autodoc", "	* Returns the sub-expression denoted by <I> in <self> Raises OutOfRange if <I> > NbSubExpressions(me)

	:param I:
	:type I: int
	:rtype: Handle_Expr_GeneralExpression
") SubExpression;
		Handle_Expr_GeneralExpression SubExpression (const Standard_Integer I);
		%feature("compactdefaultargs") ContainsUnknowns;
		%feature("autodoc", "	* Does <self> contains NamedUnknown ?

	:rtype: bool
") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Tests if <exp> is contained in <self>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "	* Replaces all occurences of <var> with <with> in <self> Raises InvalidOperand if <with> contains <self>.

	:param var:
	:type var: Handle_Expr_NamedUnknown &
	:param with:
	:type with: Handle_Expr_GeneralExpression &
	:rtype: None
") Replace;
		void Replace (const Handle_Expr_NamedUnknown & var,const Handle_Expr_GeneralExpression & with);
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "	* Returns a GeneralExpression after replacement of NamedUnknowns by an associated expression and after values computation.

	:rtype: Handle_Expr_GeneralExpression
") Simplified;
		Handle_Expr_GeneralExpression Simplified ();
};


%make_alias(Expr_PolyExpression)

%extend Expr_PolyExpression {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_SingleRelation;
class Expr_SingleRelation : public Expr_GeneralRelation {
	public:
		%feature("compactdefaultargs") SetFirstMember;
		%feature("autodoc", "	* Defines the first member of the relation

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") SetFirstMember;
		void SetFirstMember (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") SetSecondMember;
		%feature("autodoc", "	* Defines the second member of the relation

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") SetSecondMember;
		void SetSecondMember (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") FirstMember;
		%feature("autodoc", "	* Returns the first member of the relation

	:rtype: Handle_Expr_GeneralExpression
") FirstMember;
		Handle_Expr_GeneralExpression FirstMember ();
		%feature("compactdefaultargs") SecondMember;
		%feature("autodoc", "	* Returns the second member of the relation

	:rtype: Handle_Expr_GeneralExpression
") SecondMember;
		Handle_Expr_GeneralExpression SecondMember ();
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	* Tests if <self> is linear between its NamedUnknowns.

	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") NbOfSubRelations;
		%feature("autodoc", "	* Returns the number of relations contained in <self>.

	:rtype: int
") NbOfSubRelations;
		Standard_Integer NbOfSubRelations ();
		%feature("compactdefaultargs") NbOfSingleRelations;
		%feature("autodoc", "	* Returns the number of SingleRelations contained in <self> (Always 1).

	:rtype: int
") NbOfSingleRelations;
		Standard_Integer NbOfSingleRelations ();
		%feature("compactdefaultargs") SubRelation;
		%feature("autodoc", "	* Returns the relation denoted by <index> in <self>. An exception is raised if index is out of range.

	:param index:
	:type index: int
	:rtype: Handle_Expr_GeneralRelation
") SubRelation;
		Handle_Expr_GeneralRelation SubRelation (const Standard_Integer index);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Tests if <self> contains <exp>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "	* Replaces all occurences of <var> with <with> in <self>.

	:param var:
	:type var: Handle_Expr_NamedUnknown &
	:param with:
	:type with: Handle_Expr_GeneralExpression &
	:rtype: None
") Replace;
		void Replace (const Handle_Expr_NamedUnknown & var,const Handle_Expr_GeneralExpression & with);
};


%make_alias(Expr_SingleRelation)

%extend Expr_SingleRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_SystemRelation;
class Expr_SystemRelation : public Expr_GeneralRelation {
	public:
		%feature("compactdefaultargs") Expr_SystemRelation;
		%feature("autodoc", "	* Creates a system with one relation

	:param relation:
	:type relation: Handle_Expr_GeneralRelation &
	:rtype: None
") Expr_SystemRelation;
		 Expr_SystemRelation (const Handle_Expr_GeneralRelation & relation);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Appends <relation> in the list of components of <self>.

	:param relation:
	:type relation: Handle_Expr_GeneralRelation &
	:rtype: None
") Add;
		void Add (const Handle_Expr_GeneralRelation & relation);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param relation:
	:type relation: Handle_Expr_GeneralRelation &
	:rtype: None
") Remove;
		void Remove (const Handle_Expr_GeneralRelation & relation);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	* Tests if <self> is linear between its NamedUnknowns.

	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") NbOfSubRelations;
		%feature("autodoc", "	* Returns the number of relations contained in <self>.

	:rtype: int
") NbOfSubRelations;
		Standard_Integer NbOfSubRelations ();
		%feature("compactdefaultargs") NbOfSingleRelations;
		%feature("autodoc", "	* Returns the number of SingleRelations contained in <self>.

	:rtype: int
") NbOfSingleRelations;
		Standard_Integer NbOfSingleRelations ();
		%feature("compactdefaultargs") SubRelation;
		%feature("autodoc", "	* Returns the relation denoted by <index> in <self>. An exception is raised if <index> is out of range.

	:param index:
	:type index: int
	:rtype: Handle_Expr_GeneralRelation
") SubRelation;
		Handle_Expr_GeneralRelation SubRelation (const Standard_Integer index);
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "	:rtype: bool
") IsSatisfied;
		Standard_Boolean IsSatisfied ();
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "	* Returns a GeneralRelation after replacement of NamedUnknowns by an associated expression, and after values computation.

	:rtype: Handle_Expr_GeneralRelation
") Simplified;
		Handle_Expr_GeneralRelation Simplified ();
		%feature("compactdefaultargs") Simplify;
		%feature("autodoc", "	* Replaces NamedUnknowns by associated expressions, and computes values in <self>.

	:rtype: None
") Simplify;
		void Simplify ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralRelation
") Copy;
		Handle_Expr_GeneralRelation Copy ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Tests if <self> contains <exp>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "	* Replaces all occurences of <var> with <with> in <self>.

	:param var:
	:type var: Handle_Expr_NamedUnknown &
	:param with:
	:type with: Handle_Expr_GeneralExpression &
	:rtype: None
") Replace;
		void Replace (const Handle_Expr_NamedUnknown & var,const Handle_Expr_GeneralExpression & with);
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_SystemRelation)

%extend Expr_SystemRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_UnaryExpression;
class Expr_UnaryExpression : public Expr_GeneralExpression {
	public:
		%feature("compactdefaultargs") Operand;
		%feature("autodoc", "	* Returns the operand used

	:rtype: Handle_Expr_GeneralExpression
") Operand;
		Handle_Expr_GeneralExpression Operand ();
		%feature("compactdefaultargs") SetOperand;
		%feature("autodoc", "	* Sets the operand used Raises InvalidOperand if <exp> contains <self>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") SetOperand;
		void SetOperand (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") NbSubExpressions;
		%feature("autodoc", "	* Returns the number of sub-expressions contained in <self> ( >= 0)

	:rtype: int
") NbSubExpressions;
		Standard_Integer NbSubExpressions ();
		%feature("compactdefaultargs") SubExpression;
		%feature("autodoc", "	* Returns the <I>-th sub-expression of <self>. Raises OutOfRange if <I> > NbSubExpressions(me)

	:param I:
	:type I: int
	:rtype: Handle_Expr_GeneralExpression
") SubExpression;
		Handle_Expr_GeneralExpression SubExpression (const Standard_Integer I);
		%feature("compactdefaultargs") ContainsUnknowns;
		%feature("autodoc", "	* Does <self> contains NamedUnknown ?

	:rtype: bool
") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Tests if <exp> is contained in <self>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "	* Replaces all occurences of <var> with <with> in <self> Raises InvalidOperand if <with> contains <self>.

	:param var:
	:type var: Handle_Expr_NamedUnknown &
	:param with:
	:type with: Handle_Expr_GeneralExpression &
	:rtype: None
") Replace;
		void Replace (const Handle_Expr_NamedUnknown & var,const Handle_Expr_GeneralExpression & with);
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "	* Returns a GeneralExpression after replacement of NamedUnknowns by an associated expression, and after values computation.

	:rtype: Handle_Expr_GeneralExpression
") Simplified;
		Handle_Expr_GeneralExpression Simplified ();
};


%make_alias(Expr_UnaryExpression)

%extend Expr_UnaryExpression {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_Absolute;
class Expr_Absolute : public Expr_UnaryExpression {
	public:
		%feature("compactdefaultargs") Expr_Absolute;
		%feature("autodoc", "	* Creates the Abs of <exp>

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_Absolute;
		 Expr_Absolute (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_Absolute)

%extend Expr_Absolute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_ArcCosine;
class Expr_ArcCosine : public Expr_UnaryExpression {
	public:
		%feature("compactdefaultargs") Expr_ArcCosine;
		%feature("autodoc", "	* Creates the Arccos of <exp>

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_ArcCosine;
		 Expr_ArcCosine (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_ArcCosine)

%extend Expr_ArcCosine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_ArcSine;
class Expr_ArcSine : public Expr_UnaryExpression {
	public:
		%feature("compactdefaultargs") Expr_ArcSine;
		%feature("autodoc", "	* Creates the Arcsin of <exp>

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_ArcSine;
		 Expr_ArcSine (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_ArcSine)

%extend Expr_ArcSine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_ArcTangent;
class Expr_ArcTangent : public Expr_UnaryExpression {
	public:
		%feature("compactdefaultargs") Expr_ArcTangent;
		%feature("autodoc", "	* Creates the Arctan of <exp>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_ArcTangent;
		 Expr_ArcTangent (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_ArcTangent)

%extend Expr_ArcTangent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_ArgCosh;
class Expr_ArgCosh : public Expr_UnaryExpression {
	public:
		%feature("compactdefaultargs") Expr_ArgCosh;
		%feature("autodoc", "	* Creates the ArgCosh of <exp>

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_ArgCosh;
		 Expr_ArgCosh (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_ArgCosh)

%extend Expr_ArgCosh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_ArgSinh;
class Expr_ArgSinh : public Expr_UnaryExpression {
	public:
		%feature("compactdefaultargs") Expr_ArgSinh;
		%feature("autodoc", "	* Creates the ArgSinh of <exp>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_ArgSinh;
		 Expr_ArgSinh (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_ArgSinh)

%extend Expr_ArgSinh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_ArgTanh;
class Expr_ArgTanh : public Expr_UnaryExpression {
	public:
		%feature("compactdefaultargs") Expr_ArgTanh;
		%feature("autodoc", "	* Creates the Argtanh of <exp>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_ArgTanh;
		 Expr_ArgTanh (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_ArgTanh)

%extend Expr_ArgTanh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_BinaryFunction;
class Expr_BinaryFunction : public Expr_BinaryExpression {
	public:
		%feature("compactdefaultargs") Expr_BinaryFunction;
		%feature("autodoc", "	* Creates <self> as <func> (<exp1>,<exp2>). Raises exception if <func> is not binary.

	:param func:
	:type func: Handle_Expr_GeneralFunction &
	:param exp1:
	:type exp1: Handle_Expr_GeneralExpression &
	:param exp2:
	:type exp2: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_BinaryFunction;
		 Expr_BinaryFunction (const Handle_Expr_GeneralFunction & func,const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "	* Returns the function defining <self>.

	:rtype: Handle_Expr_GeneralFunction
") Function;
		Handle_Expr_GeneralFunction Function ();
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_BinaryFunction)

%extend Expr_BinaryFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_Cosh;
class Expr_Cosh : public Expr_UnaryExpression {
	public:
		%feature("compactdefaultargs") Expr_Cosh;
		%feature("autodoc", "	* Creates the Cosh of <exp>

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_Cosh;
		 Expr_Cosh (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_Cosh)

%extend Expr_Cosh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_Cosine;
class Expr_Cosine : public Expr_UnaryExpression {
	public:
		%feature("compactdefaultargs") Expr_Cosine;
		%feature("autodoc", "	* Creates the cosine of Exp

	:param Exp:
	:type Exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_Cosine;
		 Expr_Cosine (const Handle_Expr_GeneralExpression & Exp);
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_Cosine)

%extend Expr_Cosine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_Difference;
class Expr_Difference : public Expr_BinaryExpression {
	public:
		%feature("compactdefaultargs") Expr_Difference;
		%feature("autodoc", "	* Creates the difference <exp1> - <exp2>.

	:param exp1:
	:type exp1: Handle_Expr_GeneralExpression &
	:param exp2:
	:type exp2: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_Difference;
		 Expr_Difference (const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("compactdefaultargs") NDerivative;
		%feature("autodoc", "	* Returns the <N>-th derivative on <X> unknown of <self>. Raises OutOfRange if <N> <= 0

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:param N:
	:type N: int
	:rtype: Handle_Expr_GeneralExpression
") NDerivative;
		virtual Handle_Expr_GeneralExpression NDerivative (const Handle_Expr_NamedUnknown & X,const Standard_Integer N);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_Difference)

%extend Expr_Difference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_Different;
class Expr_Different : public Expr_SingleRelation {
	public:
		%feature("compactdefaultargs") Expr_Different;
		%feature("autodoc", "	* Creates the relation <exp1> # <exp2>.

	:param exp1:
	:type exp1: Handle_Expr_GeneralExpression &
	:param exp2:
	:type exp2: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_Different;
		 Expr_Different (const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "	:rtype: bool
") IsSatisfied;
		Standard_Boolean IsSatisfied ();
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "	* Returns a GeneralRelation after replacement of NamedUnknowns by an associated expression, and after values computation.

	:rtype: Handle_Expr_GeneralRelation
") Simplified;
		Handle_Expr_GeneralRelation Simplified ();
		%feature("compactdefaultargs") Simplify;
		%feature("autodoc", "	* Replaces NamedUnknowns by associated expressions, and computes values in <self>.

	:rtype: None
") Simplify;
		void Simplify ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralRelation
") Copy;
		Handle_Expr_GeneralRelation Copy ();
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_Different)

%extend Expr_Different {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_Division;
class Expr_Division : public Expr_BinaryExpression {
	public:
		%feature("compactdefaultargs") Expr_Division;
		%feature("autodoc", "	* Creates the division <exp1>/<exp2>

	:param exp1:
	:type exp1: Handle_Expr_GeneralExpression &
	:param exp2:
	:type exp2: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_Division;
		 Expr_Division (const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_Division)

%extend Expr_Division {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_Equal;
class Expr_Equal : public Expr_SingleRelation {
	public:
		%feature("compactdefaultargs") Expr_Equal;
		%feature("autodoc", "	* Creates the relation <exp1> = <exp2>.

	:param exp1:
	:type exp1: Handle_Expr_GeneralExpression &
	:param exp2:
	:type exp2: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_Equal;
		 Expr_Equal (const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "	:rtype: bool
") IsSatisfied;
		Standard_Boolean IsSatisfied ();
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "	* returns a GeneralRelation after replacement of NamedUnknowns by an associated expression and after values computation.

	:rtype: Handle_Expr_GeneralRelation
") Simplified;
		Handle_Expr_GeneralRelation Simplified ();
		%feature("compactdefaultargs") Simplify;
		%feature("autodoc", "	* Replaces NamedUnknowns by an associated expressions and computes values in <self>.

	:rtype: None
") Simplify;
		void Simplify ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralRelation
") Copy;
		Handle_Expr_GeneralRelation Copy ();
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_Equal)

%extend Expr_Equal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_Exponential;
class Expr_Exponential : public Expr_UnaryExpression {
	public:
		%feature("compactdefaultargs") Expr_Exponential;
		%feature("autodoc", "	* Creates the exponential of <exp>

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_Exponential;
		 Expr_Exponential (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_Exponential)

%extend Expr_Exponential {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_Exponentiate;
class Expr_Exponentiate : public Expr_BinaryExpression {
	public:
		%feature("compactdefaultargs") Expr_Exponentiate;
		%feature("autodoc", "	* Creates the exponential <exp1> ^ <exp2>

	:param exp1:
	:type exp1: Handle_Expr_GeneralExpression &
	:param exp2:
	:type exp2: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_Exponentiate;
		 Expr_Exponentiate (const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_Exponentiate)

%extend Expr_Exponentiate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_GreaterThan;
class Expr_GreaterThan : public Expr_SingleRelation {
	public:
		%feature("compactdefaultargs") Expr_GreaterThan;
		%feature("autodoc", "	* Creates the relation <exp1> > <exp2>.

	:param exp1:
	:type exp1: Handle_Expr_GeneralExpression &
	:param exp2:
	:type exp2: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_GreaterThan;
		 Expr_GreaterThan (const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "	:rtype: bool
") IsSatisfied;
		Standard_Boolean IsSatisfied ();
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "	* Returns a GeneralRelation after replacement of NamedUnknowns by an associated expression, and after values computation.

	:rtype: Handle_Expr_GeneralRelation
") Simplified;
		Handle_Expr_GeneralRelation Simplified ();
		%feature("compactdefaultargs") Simplify;
		%feature("autodoc", "	* Replaces NamedUnknowns by associated expressions, and computes values in <self>.

	:rtype: None
") Simplify;
		void Simplify ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralRelation
") Copy;
		Handle_Expr_GeneralRelation Copy ();
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_GreaterThan)

%extend Expr_GreaterThan {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_GreaterThanOrEqual;
class Expr_GreaterThanOrEqual : public Expr_SingleRelation {
	public:
		%feature("compactdefaultargs") Expr_GreaterThanOrEqual;
		%feature("autodoc", "	* Creates the relation <exp1> >= <exp2>.

	:param exp1:
	:type exp1: Handle_Expr_GeneralExpression &
	:param exp2:
	:type exp2: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_GreaterThanOrEqual;
		 Expr_GreaterThanOrEqual (const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "	:rtype: bool
") IsSatisfied;
		Standard_Boolean IsSatisfied ();
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "	* Returns a GeneralRelation after replacement of NamedUnknowns by an associated expression, and after values computation.

	:rtype: Handle_Expr_GeneralRelation
") Simplified;
		Handle_Expr_GeneralRelation Simplified ();
		%feature("compactdefaultargs") Simplify;
		%feature("autodoc", "	* Replaces NamedUnknowns by associated expressions, and computes values in <self>.

	:rtype: None
") Simplify;
		void Simplify ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralRelation
") Copy;
		Handle_Expr_GeneralRelation Copy ();
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_GreaterThanOrEqual)

%extend Expr_GreaterThanOrEqual {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_LessThan;
class Expr_LessThan : public Expr_SingleRelation {
	public:
		%feature("compactdefaultargs") Expr_LessThan;
		%feature("autodoc", "	* Creates the relation <exp1> < <exp2>.

	:param exp1:
	:type exp1: Handle_Expr_GeneralExpression &
	:param exp2:
	:type exp2: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_LessThan;
		 Expr_LessThan (const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "	:rtype: bool
") IsSatisfied;
		Standard_Boolean IsSatisfied ();
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "	* Returns a GeneralRelation after replacement of NamedUnknowns by an associated expression, and after values computation.

	:rtype: Handle_Expr_GeneralRelation
") Simplified;
		Handle_Expr_GeneralRelation Simplified ();
		%feature("compactdefaultargs") Simplify;
		%feature("autodoc", "	* Replaces NamedUnknowns by associated expressions, and computes values in <self>.

	:rtype: None
") Simplify;
		void Simplify ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralRelation
") Copy;
		Handle_Expr_GeneralRelation Copy ();
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_LessThan)

%extend Expr_LessThan {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_LessThanOrEqual;
class Expr_LessThanOrEqual : public Expr_SingleRelation {
	public:
		%feature("compactdefaultargs") Expr_LessThanOrEqual;
		%feature("autodoc", "	* Creates the relation <exp1> <= <exp2>.

	:param exp1:
	:type exp1: Handle_Expr_GeneralExpression &
	:param exp2:
	:type exp2: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_LessThanOrEqual;
		 Expr_LessThanOrEqual (const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "	:rtype: bool
") IsSatisfied;
		Standard_Boolean IsSatisfied ();
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "	* Returns a GeneralRelation after replacement of NamedUnknowns by an associated expression, and after values computation.

	:rtype: Handle_Expr_GeneralRelation
") Simplified;
		Handle_Expr_GeneralRelation Simplified ();
		%feature("compactdefaultargs") Simplify;
		%feature("autodoc", "	* Replaces NamedUnknowns by associated expressions, and computes values in <self>.

	:rtype: None
") Simplify;
		void Simplify ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralRelation
") Copy;
		Handle_Expr_GeneralRelation Copy ();
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_LessThanOrEqual)

%extend Expr_LessThanOrEqual {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_LogOf10;
class Expr_LogOf10 : public Expr_UnaryExpression {
	public:
		%feature("compactdefaultargs") Expr_LogOf10;
		%feature("autodoc", "	* Creates the base 10 logarithm of <exp>

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_LogOf10;
		 Expr_LogOf10 (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_LogOf10)

%extend Expr_LogOf10 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_LogOfe;
class Expr_LogOfe : public Expr_UnaryExpression {
	public:
		%feature("compactdefaultargs") Expr_LogOfe;
		%feature("autodoc", "	* Creates the natural logarithm of <exp>

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_LogOfe;
		 Expr_LogOfe (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_LogOfe)

%extend Expr_LogOfe {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_NamedConstant;
class Expr_NamedConstant : public Expr_NamedExpression {
	public:
		%feature("compactdefaultargs") Expr_NamedConstant;
		%feature("autodoc", "	* Creates a constant value of name <name> and value <value>.

	:param name:
	:type name: TCollection_AsciiString &
	:param value:
	:type value: float
	:rtype: None
") Expr_NamedConstant;
		 Expr_NamedConstant (const TCollection_AsciiString & name,const Standard_Real value);
		%feature("compactdefaultargs") GetValue;
		%feature("autodoc", "	:rtype: float
") GetValue;
		Standard_Real GetValue ();
		%feature("compactdefaultargs") NbSubExpressions;
		%feature("autodoc", "	* returns the number of sub-expressions contained in <self> (always returns zero)

	:rtype: int
") NbSubExpressions;
		Standard_Integer NbSubExpressions ();
		%feature("compactdefaultargs") SubExpression;
		%feature("autodoc", "	* returns the <I>-th sub-expression of <self> raises OutOfRange

	:param I:
	:type I: int
	:rtype: Handle_Expr_GeneralExpression
") SubExpression;
		Handle_Expr_GeneralExpression SubExpression (const Standard_Integer I);
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "	* returns a GeneralExpression after replacement of NamedUnknowns by an associated expression and after values computation.

	:rtype: Handle_Expr_GeneralExpression
") Simplified;
		Handle_Expr_GeneralExpression Simplified ();
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("compactdefaultargs") ContainsUnknowns;
		%feature("autodoc", "	* Tests if <self> contains NamedUnknown. (returns always False)

	:rtype: bool
") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Tests if <exp> is contained in <self>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("compactdefaultargs") NDerivative;
		%feature("autodoc", "	* Returns the <N>-th derivative on <X> unknown of <self>. Raises OutOfRange if <N> <= 0

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:param N:
	:type N: int
	:rtype: Handle_Expr_GeneralExpression
") NDerivative;
		virtual Handle_Expr_GeneralExpression NDerivative (const Handle_Expr_NamedUnknown & X,const Standard_Integer N);
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "	* Replaces all occurences of <var> with <with> in <self>

	:param var:
	:type var: Handle_Expr_NamedUnknown &
	:param with:
	:type with: Handle_Expr_GeneralExpression &
	:rtype: None
") Replace;
		void Replace (const Handle_Expr_NamedUnknown & var,const Handle_Expr_GeneralExpression & with);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
};


%make_alias(Expr_NamedConstant)

%extend Expr_NamedConstant {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_NamedUnknown;
class Expr_NamedUnknown : public Expr_NamedExpression {
	public:
		%feature("compactdefaultargs") Expr_NamedUnknown;
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:rtype: None
") Expr_NamedUnknown;
		 Expr_NamedUnknown (const TCollection_AsciiString & name);
		%feature("compactdefaultargs") IsAssigned;
		%feature("autodoc", "	* Tests if an expression is assigned to <self>.

	:rtype: bool
") IsAssigned;
		Standard_Boolean IsAssigned ();
		%feature("compactdefaultargs") AssignedExpression;
		%feature("autodoc", "	* If exists, returns the assigned expression. An exception is raised if the expression does not exist.

	:rtype: Handle_Expr_GeneralExpression
") AssignedExpression;
		Handle_Expr_GeneralExpression AssignedExpression ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	* Assigns <self> to <exp> expression. Raises exception if <exp> refers to <self>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Assign;
		void Assign (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") Deassign;
		%feature("autodoc", "	* Supresses the assigned expression

	:rtype: None
") Deassign;
		void Deassign ();
		%feature("compactdefaultargs") NbSubExpressions;
		%feature("autodoc", "	* Returns the number of sub-expressions contained in <self> ( >= 0)

	:rtype: int
") NbSubExpressions;
		Standard_Integer NbSubExpressions ();
		%feature("compactdefaultargs") SubExpression;
		%feature("autodoc", "	* Returns the <I>-th sub-expression of <self> raises OutOfRange if <I> > NbSubExpressions(me)

	:param I:
	:type I: int
	:rtype: Handle_Expr_GeneralExpression
") SubExpression;
		Handle_Expr_GeneralExpression SubExpression (const Standard_Integer I);
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "	* Returns a GeneralExpression after replacement of NamedUnknowns by an associated expression and after values computation.

	:rtype: Handle_Expr_GeneralExpression
") Simplified;
		Handle_Expr_GeneralExpression Simplified ();
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("compactdefaultargs") ContainsUnknowns;
		%feature("autodoc", "	* Tests if <self> contains NamedUnknown.

	:rtype: bool
") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Tests if <exp> is contained in <self>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "	* Replaces all occurences of <var> with <with> in <self> Raises InvalidOperand if <with> contains <self>.

	:param var:
	:type var: Handle_Expr_NamedUnknown &
	:param with:
	:type with: Handle_Expr_GeneralExpression &
	:rtype: None
") Replace;
		void Replace (const Handle_Expr_NamedUnknown & var,const Handle_Expr_GeneralExpression & with);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
};


%make_alias(Expr_NamedUnknown)

%extend Expr_NamedUnknown {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_PolyFunction;
class Expr_PolyFunction : public Expr_PolyExpression {
	public:
		%feature("compactdefaultargs") Expr_PolyFunction;
		%feature("autodoc", "	* Creates <self> as <func>(<exps_1>,<exps_2>,...,<exps_n>)

	:param func:
	:type func: Handle_Expr_GeneralFunction &
	:param exps:
	:type exps: Expr_Array1OfGeneralExpression &
	:rtype: None
") Expr_PolyFunction;
		 Expr_PolyFunction (const Handle_Expr_GeneralFunction & func,const Expr_Array1OfGeneralExpression & exps);
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "	* Returns the function defining <self>.

	:rtype: Handle_Expr_GeneralFunction
") Function;
		Handle_Expr_GeneralFunction Function ();
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_PolyFunction)

%extend Expr_PolyFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_Product;
class Expr_Product : public Expr_PolyExpression {
	public:
		%feature("compactdefaultargs") Expr_Product;
		%feature("autodoc", "	* Creates the product of all members of sequence <exps>

	:param exps:
	:type exps: Expr_SequenceOfGeneralExpression &
	:rtype: None
") Expr_Product;
		 Expr_Product (const Expr_SequenceOfGeneralExpression & exps);
		%feature("compactdefaultargs") Expr_Product;
		%feature("autodoc", "	* Creates the product of <exp1> and <exp2>.

	:param exp1:
	:type exp1: Handle_Expr_GeneralExpression &
	:param exp2:
	:type exp2: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_Product;
		 Expr_Product (const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_Product)

%extend Expr_Product {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_Sine;
class Expr_Sine : public Expr_UnaryExpression {
	public:
		%feature("compactdefaultargs") Expr_Sine;
		%feature("autodoc", "	* Creates the sine of <exp>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_Sine;
		 Expr_Sine (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_Sine)

%extend Expr_Sine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_Sinh;
class Expr_Sinh : public Expr_UnaryExpression {
	public:
		%feature("compactdefaultargs") Expr_Sinh;
		%feature("autodoc", "	* Creates the sinh of <exp>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_Sinh;
		 Expr_Sinh (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_Sinh)

%extend Expr_Sinh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_Square;
class Expr_Square : public Expr_UnaryExpression {
	public:
		%feature("compactdefaultargs") Expr_Square;
		%feature("autodoc", "	* Creates the square of <exp>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_Square;
		 Expr_Square (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_Square)

%extend Expr_Square {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_SquareRoot;
class Expr_SquareRoot : public Expr_UnaryExpression {
	public:
		%feature("compactdefaultargs") Expr_SquareRoot;
		%feature("autodoc", "	* Creates the square root of <exp>

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_SquareRoot;
		 Expr_SquareRoot (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_SquareRoot)

%extend Expr_SquareRoot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_Sum;
class Expr_Sum : public Expr_PolyExpression {
	public:
		%feature("compactdefaultargs") Expr_Sum;
		%feature("autodoc", "	* Creates the sum of all the members of sequence <exps>.

	:param exps:
	:type exps: Expr_SequenceOfGeneralExpression &
	:rtype: None
") Expr_Sum;
		 Expr_Sum (const Expr_SequenceOfGeneralExpression & exps);
		%feature("compactdefaultargs") Expr_Sum;
		%feature("autodoc", "	* Creates the sum of <exp1> and <exp2>.

	:param exp1:
	:type exp1: Handle_Expr_GeneralExpression &
	:param exp2:
	:type exp2: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_Sum;
		 Expr_Sum (const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("compactdefaultargs") NDerivative;
		%feature("autodoc", "	* Returns the <N>-th derivative on <X> unknown of <self>. Raises OutOfRange if <N> <= 0

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:param N:
	:type N: int
	:rtype: Handle_Expr_GeneralExpression
") NDerivative;
		virtual Handle_Expr_GeneralExpression NDerivative (const Handle_Expr_NamedUnknown & X,const Standard_Integer N);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_Sum)

%extend Expr_Sum {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_Tangent;
class Expr_Tangent : public Expr_UnaryExpression {
	public:
		%feature("compactdefaultargs") Expr_Tangent;
		%feature("autodoc", "	* Creates the tangent of <exp>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_Tangent;
		 Expr_Tangent (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_Tangent)

%extend Expr_Tangent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_Tanh;
class Expr_Tanh : public Expr_UnaryExpression {
	public:
		%feature("compactdefaultargs") Expr_Tanh;
		%feature("autodoc", "	* Creates the hyperbolic tangent of <exp>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_Tanh;
		 Expr_Tanh (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_Tanh)

%extend Expr_Tanh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_UnaryFunction;
class Expr_UnaryFunction : public Expr_UnaryExpression {
	public:
		%feature("compactdefaultargs") Expr_UnaryFunction;
		%feature("autodoc", "	* Creates me as <func>(<exp>). Raises exception if <func> is not unary.

	:param func:
	:type func: Handle_Expr_GeneralFunction &
	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_UnaryFunction;
		 Expr_UnaryFunction (const Handle_Expr_GeneralFunction & func,const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "	* Returns the function defining <self>.

	:rtype: Handle_Expr_GeneralFunction
") Function;
		Handle_Expr_GeneralFunction Function ();
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_UnaryFunction)

%extend Expr_UnaryFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_UnaryMinus;
class Expr_UnaryMinus : public Expr_UnaryExpression {
	public:
		%feature("compactdefaultargs") Expr_UnaryMinus;
		%feature("autodoc", "	* Create the unary minus of <exp>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_UnaryMinus;
		 Expr_UnaryMinus (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("compactdefaultargs") NDerivative;
		%feature("autodoc", "	* Returns the <N>-th derivative on <X> unknown of <self>. Raises OutOfRange if <N> <= 0

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:param N:
	:type N: int
	:rtype: Handle_Expr_GeneralExpression
") NDerivative;
		virtual Handle_Expr_GeneralExpression NDerivative (const Handle_Expr_NamedUnknown & X,const Standard_Integer N);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%make_alias(Expr_UnaryMinus)

%extend Expr_UnaryMinus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
