/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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

/*
This file was automatically generated using the pythonocc_generator, see
https://github.com/tpaviot/pythonocc-generator.

This file is platform independant, but was generated under the following
conditions:

- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define EXPRDOCSTRING
"Expr module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_Expr.html"
%enddef
%module (package="OCC.Core", docstring=EXPRDOCSTRING) Expr

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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

/* public enums */
/* end public enums declaration */

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
%template(Expr_Array1OfNamedUnknown) NCollection_Array1 <opencascade::handle <Expr_NamedUnknown>>;

%extend NCollection_Array1 <opencascade::handle <Expr_NamedUnknown>> {
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
%template(Expr_MapOfNamedUnknown) NCollection_IndexedMap <opencascade::handle <Expr_NamedUnknown>, TColStd_MapTransientHasher>;
%template(Expr_Array1OfGeneralExpression) NCollection_Array1 <opencascade::handle <Expr_GeneralExpression>>;

%extend NCollection_Array1 <opencascade::handle <Expr_GeneralExpression>> {
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
%template(Expr_Array1OfSingleRelation) NCollection_Array1 <opencascade::handle <Expr_SingleRelation>>;

%extend NCollection_Array1 <opencascade::handle <Expr_SingleRelation>> {
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
%template(Expr_SequenceOfGeneralRelation) NCollection_Sequence <opencascade::handle <Expr_GeneralRelation>>;
%template(Expr_SequenceOfGeneralExpression) NCollection_Sequence <opencascade::handle <Expr_GeneralExpression>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1 <opencascade::handle <Expr_NamedUnknown>> Expr_Array1OfNamedUnknown;
typedef NCollection_IndexedMap <opencascade::handle <Expr_NamedUnknown>, TColStd_MapTransientHasher> Expr_MapOfNamedUnknown;
typedef NCollection_Array1 <opencascade::handle <Expr_GeneralExpression>> Expr_Array1OfGeneralExpression;
typedef NCollection_Array1 <opencascade::handle <Expr_SingleRelation>> Expr_Array1OfSingleRelation;
typedef NCollection_Sequence <opencascade::handle <Expr_GeneralRelation>> Expr_SequenceOfGeneralRelation;
typedef NCollection_Sequence <opencascade::handle <Expr_GeneralExpression>> Expr_SequenceOfGeneralExpression;
/* end typedefs declaration */

%rename(expr) Expr;
class Expr {
	public:
		%feature("compactdefaultargs") CopyShare;
		%feature("autodoc", "	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: opencascade::handle<Expr_GeneralExpression>
") CopyShare;
		static opencascade::handle<Expr_GeneralExpression> CopyShare (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") NbOfFreeVariables;
		%feature("autodoc", "	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: int
") NbOfFreeVariables;
		static Standard_Integer NbOfFreeVariables (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") NbOfFreeVariables;
		%feature("autodoc", "	:param exp:
	:type exp: opencascade::handle<Expr_GeneralRelation> &
	:rtype: int
") NbOfFreeVariables;
		static Standard_Integer NbOfFreeVariables (const opencascade::handle<Expr_GeneralRelation> & exp);
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
%nodefaultctor Expr_GeneralExpression;
class Expr_GeneralExpression : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Tests if <exp> is contained in <self>.

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") Contains;
		virtual Standard_Boolean Contains (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") ContainsUnknowns;
		%feature("autodoc", "	* Tests if <self> contains NamedUnknowns.

	:rtype: bool
") ContainsUnknowns;
		virtual Standard_Boolean ContainsUnknowns ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Copy;
		virtual opencascade::handle<Expr_GeneralExpression> Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralExpression>
") Derivative;
		virtual opencascade::handle<Expr_GeneralExpression> Derivative (const opencascade::handle<Expr_NamedUnknown> & X);
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
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. Warning: This method does not include any simplification before testing. It could also be very slow; to be used carefully.

	:param Other:
	:type Other: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") IsIdentical;
		virtual Standard_Boolean IsIdentical (const opencascade::handle<Expr_GeneralExpression> & Other);
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
		%feature("compactdefaultargs") NDerivative;
		%feature("autodoc", "	* Returns the <N>-th derivative on <X> unknown of <self>. Raise OutOfRange if N <= 0

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:param N:
	:type N: int
	:rtype: opencascade::handle<Expr_GeneralExpression>
") NDerivative;
		virtual opencascade::handle<Expr_GeneralExpression> NDerivative (const opencascade::handle<Expr_NamedUnknown> & X,const Standard_Integer N);
		%feature("compactdefaultargs") NbSubExpressions;
		%feature("autodoc", "	* Returns the number of sub-expressions contained in <self> ( >= 0)

	:rtype: int
") NbSubExpressions;
		virtual Standard_Integer NbSubExpressions ();
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "	* Replaces all occurences of <var> with copies of <with> in <self>. Copies of <with> are made with the Copy() method. Raises InvalidOperand if <with> contains <self>.

	:param var:
	:type var: opencascade::handle<Expr_NamedUnknown> &
	:param with:
	:type with: opencascade::handle<Expr_GeneralExpression> &
	:rtype: void
") Replace;
		virtual void Replace (const opencascade::handle<Expr_NamedUnknown> & var,const opencascade::handle<Expr_GeneralExpression> & with);
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		virtual opencascade::handle<Expr_GeneralExpression> ShallowSimplified ();
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "	* Returns a GeneralExpression after replacement of NamedUnknowns by an associated expression and after values computation.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Simplified;
		virtual opencascade::handle<Expr_GeneralExpression> Simplified ();
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		virtual TCollection_AsciiString String ();
		%feature("compactdefaultargs") SubExpression;
		%feature("autodoc", "	* Returns the <I>-th sub-expression of <self> raises OutOfRange if <I> > NbSubExpressions(me)

	:param I:
	:type I: int
	:rtype: opencascade::handle<Expr_GeneralExpression>
") SubExpression;
		virtual const opencascade::handle<Expr_GeneralExpression> & SubExpression (const Standard_Integer I);
};


%make_alias(Expr_GeneralExpression)

%extend Expr_GeneralExpression {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_GeneralFunction;
class Expr_GeneralFunction : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> with the same form.

	:rtype: opencascade::handle<Expr_GeneralFunction>
") Copy;
		virtual opencascade::handle<Expr_GeneralFunction> Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns Derivative of <self> for variable <var>.

	:param var:
	:type var: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralFunction>
") Derivative;
		virtual opencascade::handle<Expr_GeneralFunction> Derivative (const opencascade::handle<Expr_NamedUnknown> & var);
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns Derivative of <self> for variable <var> with degree <deg>.

	:param var:
	:type var: opencascade::handle<Expr_NamedUnknown> &
	:param deg:
	:type deg: int
	:rtype: opencascade::handle<Expr_GeneralFunction>
") Derivative;
		virtual opencascade::handle<Expr_GeneralFunction> Derivative (const opencascade::handle<Expr_NamedUnknown> & var,const Standard_Integer deg);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Computes the value of <self> with the given variables. Raises NotEvaluable if <vars> does not match all variables of <self>.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		virtual Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") GetStringName;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") GetStringName;
		virtual TCollection_AsciiString GetStringName ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <func> are similar functions (same name and same used expression).

	:param func:
	:type func: opencascade::handle<Expr_GeneralFunction> &
	:rtype: bool
") IsIdentical;
		virtual Standard_Boolean IsIdentical (const opencascade::handle<Expr_GeneralFunction> & func);
		%feature("compactdefaultargs") IsLinearOnVariable;
		%feature("autodoc", "	* Tests if <self> is linear on variable on range <index>

	:param index:
	:type index: int
	:rtype: bool
") IsLinearOnVariable;
		virtual Standard_Boolean IsLinearOnVariable (const Standard_Integer index);
		%feature("compactdefaultargs") NbOfVariables;
		%feature("autodoc", "	* Returns the number of variables of <self>.

	:rtype: int
") NbOfVariables;
		virtual Standard_Integer NbOfVariables ();
		%feature("compactdefaultargs") Variable;
		%feature("autodoc", "	* Returns the variable denoted by <index> in <self>. Raises OutOfRange if index > NbOfVariables.

	:param index:
	:type index: int
	:rtype: opencascade::handle<Expr_NamedUnknown>
") Variable;
		virtual opencascade::handle<Expr_NamedUnknown> Variable (const Standard_Integer index);
};


%make_alias(Expr_GeneralFunction)

%extend Expr_GeneralFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_GeneralRelation;
class Expr_GeneralRelation : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Tests if <exp> contains <var>.

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") Contains;
		virtual Standard_Boolean Contains (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralRelation>
") Copy;
		virtual opencascade::handle<Expr_GeneralRelation> Copy ();
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	* Tests if <self> is linear between its NamedUnknowns.

	:rtype: bool
") IsLinear;
		virtual Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "	* Returns the current status of the relation

	:rtype: bool
") IsSatisfied;
		virtual Standard_Boolean IsSatisfied ();
		%feature("compactdefaultargs") NbOfSingleRelations;
		%feature("autodoc", "	* Returns the number of SingleRelations contained in <self>.

	:rtype: int
") NbOfSingleRelations;
		virtual Standard_Integer NbOfSingleRelations ();
		%feature("compactdefaultargs") NbOfSubRelations;
		%feature("autodoc", "	* Returns the number of relations contained in <self>.

	:rtype: int
") NbOfSubRelations;
		virtual Standard_Integer NbOfSubRelations ();
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "	* Replaces all occurences of <var> with <with> in <self>.

	:param var:
	:type var: opencascade::handle<Expr_NamedUnknown> &
	:param with:
	:type with: opencascade::handle<Expr_GeneralExpression> &
	:rtype: void
") Replace;
		virtual void Replace (const opencascade::handle<Expr_NamedUnknown> & var,const opencascade::handle<Expr_GeneralExpression> & with);
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "	* Returns a GeneralRelation after replacement of NamedUnknowns by an associated expression, and after values computation.

	:rtype: opencascade::handle<Expr_GeneralRelation>
") Simplified;
		virtual opencascade::handle<Expr_GeneralRelation> Simplified ();
		%feature("compactdefaultargs") Simplify;
		%feature("autodoc", "	* Replaces NamedUnknowns by associated expressions, and computes values in <self>.

	:rtype: void
") Simplify;
		virtual void Simplify ();
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		virtual TCollection_AsciiString String ();
		%feature("compactdefaultargs") SubRelation;
		%feature("autodoc", "	* Returns the relation denoted by <index> in <self>. An exception is raised if <index> is out of range.

	:param index:
	:type index: int
	:rtype: opencascade::handle<Expr_GeneralRelation>
") SubRelation;
		virtual opencascade::handle<Expr_GeneralRelation> SubRelation (const Standard_Integer index);
};


%make_alias(Expr_GeneralRelation)

%extend Expr_GeneralRelation {
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
	:type rel: opencascade::handle<Expr_GeneralRelation> &
	:rtype: None
") Expr_RUIterator;
		 Expr_RUIterator (const opencascade::handle<Expr_GeneralRelation> & rel);
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

	:rtype: opencascade::handle<Expr_NamedUnknown>
") Value;
		opencascade::handle<Expr_NamedUnknown> Value ();
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
	:type rel: opencascade::handle<Expr_GeneralRelation> &
	:rtype: None
") Expr_RelationIterator;
		 Expr_RelationIterator (const opencascade::handle<Expr_GeneralRelation> & rel);
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

	:rtype: opencascade::handle<Expr_SingleRelation>
") Value;
		opencascade::handle<Expr_SingleRelation> Value ();
};


%extend Expr_RelationIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_UnknownIterator;
class Expr_UnknownIterator {
	public:
		%feature("compactdefaultargs") Expr_UnknownIterator;
		%feature("autodoc", "	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Expr_UnknownIterator;
		 Expr_UnknownIterator (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: opencascade::handle<Expr_NamedUnknown>
") Value;
		opencascade::handle<Expr_NamedUnknown> Value ();
};


%extend Expr_UnknownIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Expr_BinaryExpression;
class Expr_BinaryExpression : public Expr_GeneralExpression {
	public:
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Tests if <self> contains <exp>.

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") ContainsUnknowns;
		%feature("autodoc", "	* Does <self> contain NamedUnknown ?

	:rtype: bool
") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns ();
		%feature("compactdefaultargs") FirstOperand;
		%feature("autodoc", "	:rtype: opencascade::handle<Expr_GeneralExpression>
") FirstOperand;
		const opencascade::handle<Expr_GeneralExpression> & FirstOperand ();
		%feature("compactdefaultargs") NbSubExpressions;
		%feature("autodoc", "	* returns the number of sub-expressions contained in <self> ( >= 0)

	:rtype: int
") NbSubExpressions;
		Standard_Integer NbSubExpressions ();
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "	* Replaces all occurences of <var> with <with> in <self>. Raises InvalidOperand if <with> contains <self>.

	:param var:
	:type var: opencascade::handle<Expr_NamedUnknown> &
	:param with:
	:type with: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Replace;
		void Replace (const opencascade::handle<Expr_NamedUnknown> & var,const opencascade::handle<Expr_GeneralExpression> & with);
		%feature("compactdefaultargs") SecondOperand;
		%feature("autodoc", "	:rtype: opencascade::handle<Expr_GeneralExpression>
") SecondOperand;
		const opencascade::handle<Expr_GeneralExpression> & SecondOperand ();
		%feature("compactdefaultargs") SetFirstOperand;
		%feature("autodoc", "	* Sets first operand of <self> Raises InvalidOperand if exp = me

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") SetFirstOperand;
		void SetFirstOperand (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") SetSecondOperand;
		%feature("autodoc", "	* Sets second operand of <self> Raises InvalidOperand if <exp> contains <self>.

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") SetSecondOperand;
		void SetSecondOperand (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "	* Returns a GeneralExpression after replacement of NamedUnknowns by an associated expression and after values computation.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Simplified;
		opencascade::handle<Expr_GeneralExpression> Simplified ();
		%feature("compactdefaultargs") SubExpression;
		%feature("autodoc", "	* returns the <I>-th sub-expression of <self> raises OutOfRange if <I> > NbSubExpressions(me)

	:param I:
	:type I: int
	:rtype: opencascade::handle<Expr_GeneralExpression>
") SubExpression;
		const opencascade::handle<Expr_GeneralExpression> & SubExpression (const Standard_Integer I);
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> with the same form.

	:rtype: opencascade::handle<Expr_GeneralFunction>
") Copy;
		opencascade::handle<Expr_GeneralFunction> Copy ();
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "	* Returns the degree of derivation of <self>.

	:rtype: int
") Degree;
		Standard_Integer Degree ();
		%feature("compactdefaultargs") DerivVariable;
		%feature("autodoc", "	* Returns the derivation variable of <self>.

	:rtype: opencascade::handle<Expr_NamedUnknown>
") DerivVariable;
		opencascade::handle<Expr_NamedUnknown> DerivVariable ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns Derivative of <self> for variable <var>.

	:param var:
	:type var: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralFunction>
") Derivative;
		opencascade::handle<Expr_GeneralFunction> Derivative (const opencascade::handle<Expr_NamedUnknown> & var);
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns Derivative of <self> for variable <var> with degree <deg>.

	:param var:
	:type var: opencascade::handle<Expr_NamedUnknown> &
	:param deg:
	:type deg: int
	:rtype: opencascade::handle<Expr_GeneralFunction>
") Derivative;
		opencascade::handle<Expr_GeneralFunction> Derivative (const opencascade::handle<Expr_NamedUnknown> & var,const Standard_Integer deg);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Computes the value of <self> with the given variables. Raises DimensionMismatch if Length(vars) is different from Length(values).

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param values:
	:type values: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & values);
		%feature("compactdefaultargs") Expr_FunctionDerivative;
		%feature("autodoc", "	* Creates a FunctionDerivative of degree <deg> relative to the <withX> variable. Raises OutOfRange if <deg> lower or equal to zero.

	:param func:
	:type func: opencascade::handle<Expr_GeneralFunction> &
	:param withX:
	:type withX: opencascade::handle<Expr_NamedUnknown> &
	:param deg:
	:type deg: int
	:rtype: None
") Expr_FunctionDerivative;
		 Expr_FunctionDerivative (const opencascade::handle<Expr_GeneralFunction> & func,const opencascade::handle<Expr_NamedUnknown> & withX,const Standard_Integer deg);
		%feature("compactdefaultargs") Expression;
		%feature("autodoc", "	:rtype: opencascade::handle<Expr_GeneralExpression>
") Expression;
		opencascade::handle<Expr_GeneralExpression> Expression ();
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "	* Returns the function of which <self> is the derivative.

	:rtype: opencascade::handle<Expr_GeneralFunction>
") Function;
		opencascade::handle<Expr_GeneralFunction> Function ();
		%feature("compactdefaultargs") GetStringName;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") GetStringName;
		TCollection_AsciiString GetStringName ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <func> are similar functions (same name and same used expression).

	:param func:
	:type func: opencascade::handle<Expr_GeneralFunction> &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const opencascade::handle<Expr_GeneralFunction> & func);
		%feature("compactdefaultargs") IsLinearOnVariable;
		%feature("autodoc", "	* Tests if <self> is linear on variable on range <index>

	:param index:
	:type index: int
	:rtype: bool
") IsLinearOnVariable;
		Standard_Boolean IsLinearOnVariable (const Standard_Integer index);
		%feature("compactdefaultargs") NbOfVariables;
		%feature("autodoc", "	* Returns the number of variables of <self>.

	:rtype: int
") NbOfVariables;
		Standard_Integer NbOfVariables ();
		%feature("compactdefaultargs") UpdateExpression;
		%feature("autodoc", "	:rtype: None
") UpdateExpression;
		void UpdateExpression ();
		%feature("compactdefaultargs") Variable;
		%feature("autodoc", "	* Returns the variable denoted by <index> in <self>. Raises OutOfRange if <index> greater than NbOfVariables of <self>.

	:param index:
	:type index: int
	:rtype: opencascade::handle<Expr_NamedUnknown>
") Variable;
		opencascade::handle<Expr_NamedUnknown> Variable (const Standard_Integer index);
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
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const opencascade::handle<Expr_GeneralExpression> & Other);
		%feature("compactdefaultargs") IsShareable;
		%feature("autodoc", "	* Tests if <self> can be shared by one or more expressions or must be copied. This method redefines to a True value the GeneralExpression method.

	:rtype: bool
") IsShareable;
		virtual Standard_Boolean IsShareable ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:rtype: None
") SetName;
		void SetName (const TCollection_AsciiString & name);
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> with the same form.

	:rtype: opencascade::handle<Expr_GeneralFunction>
") Copy;
		opencascade::handle<Expr_GeneralFunction> Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns Derivative of <self> for variable <var>.

	:param var:
	:type var: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralFunction>
") Derivative;
		opencascade::handle<Expr_GeneralFunction> Derivative (const opencascade::handle<Expr_NamedUnknown> & var);
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns Derivative of <self> for variable <var> with degree <deg>.

	:param var:
	:type var: opencascade::handle<Expr_NamedUnknown> &
	:param deg:
	:type deg: int
	:rtype: opencascade::handle<Expr_GeneralFunction>
") Derivative;
		opencascade::handle<Expr_GeneralFunction> Derivative (const opencascade::handle<Expr_NamedUnknown> & var,const Standard_Integer deg);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Computes the value of <self> with the given variables. Raises DimensionMismatch if Length(vars) is different from Length(values).

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param values:
	:type values: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & values);
		%feature("compactdefaultargs") Expr_NamedFunction;
		%feature("autodoc", "	* Creates a function of given variables <vars> with name <name> defined by the expression <exp>.

	:param name:
	:type name: TCollection_AsciiString &
	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:rtype: None
") Expr_NamedFunction;
		 Expr_NamedFunction (const TCollection_AsciiString & name,const opencascade::handle<Expr_GeneralExpression> & exp,const Expr_Array1OfNamedUnknown & vars);
		%feature("compactdefaultargs") Expression;
		%feature("autodoc", "	* Returns equivalent expression of <self>.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Expression;
		opencascade::handle<Expr_GeneralExpression> Expression ();
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "	* Returns the name assigned to <self>

	:rtype: TCollection_AsciiString
") GetName;
		TCollection_AsciiString GetName ();
		%feature("compactdefaultargs") GetStringName;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") GetStringName;
		TCollection_AsciiString GetStringName ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <func> are similar functions (same name and same used expression).

	:param func:
	:type func: opencascade::handle<Expr_GeneralFunction> &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const opencascade::handle<Expr_GeneralFunction> & func);
		%feature("compactdefaultargs") IsLinearOnVariable;
		%feature("autodoc", "	* Tests if <self> is linear on variable on range <index>

	:param index:
	:type index: int
	:rtype: bool
") IsLinearOnVariable;
		Standard_Boolean IsLinearOnVariable (const Standard_Integer index);
		%feature("compactdefaultargs") NbOfVariables;
		%feature("autodoc", "	* Returns the number of variables of <self>.

	:rtype: int
") NbOfVariables;
		Standard_Integer NbOfVariables ();
		%feature("compactdefaultargs") SetExpression;
		%feature("autodoc", "	* Modifies expression of <self>. Warning: Beware of derivatives. See FunctionDerivative

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") SetExpression;
		void SetExpression (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Sets the name <newname> to <self>.

	:param newname:
	:type newname: TCollection_AsciiString &
	:rtype: None
") SetName;
		void SetName (const TCollection_AsciiString & newname);
		%feature("compactdefaultargs") Variable;
		%feature("autodoc", "	* Returns the variable denoted by <index> in <self>. Raises OutOfRange if <index> is greater than NbOfVariables of <self>, or less than or equal to zero.

	:param index:
	:type index: int
	:rtype: opencascade::handle<Expr_NamedUnknown>
") Variable;
		opencascade::handle<Expr_NamedUnknown> Variable (const Standard_Integer index);
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
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Tests if <exp> is contained in <self>.

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") ContainsUnknowns;
		%feature("autodoc", "	* Tests if <self> contains NamedUnknown.

	:rtype: bool
") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative (const opencascade::handle<Expr_NamedUnknown> & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
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
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const opencascade::handle<Expr_GeneralExpression> & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") NDerivative;
		%feature("autodoc", "	* Returns the <N>-th derivative on <X> unknown of <self>. Raises OutOfRange if <N> <= 0

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:param N:
	:type N: int
	:rtype: opencascade::handle<Expr_GeneralExpression>
") NDerivative;
		virtual opencascade::handle<Expr_GeneralExpression> NDerivative (const opencascade::handle<Expr_NamedUnknown> & X,const Standard_Integer N);
		%feature("compactdefaultargs") NbSubExpressions;
		%feature("autodoc", "	* Returns the number of sub-expressions contained in <self> ( >= 0)

	:rtype: int
") NbSubExpressions;
		Standard_Integer NbSubExpressions ();
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "	* Replaces all occurences of <var> with <with> in <self>

	:param var:
	:type var: opencascade::handle<Expr_NamedUnknown> &
	:param with:
	:type with: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Replace;
		void Replace (const opencascade::handle<Expr_NamedUnknown> & var,const opencascade::handle<Expr_GeneralExpression> & with);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param val:
	:type val: float
	:rtype: None
") SetValue;
		void SetValue (const Standard_Real val);
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified ();
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "	* Returns a GeneralExpression after replacement of NamedUnknowns by an associated expression and after values computation.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Simplified;
		opencascade::handle<Expr_GeneralExpression> Simplified ();
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
		%feature("compactdefaultargs") SubExpression;
		%feature("autodoc", "	* Returns the <I>-th sub-expression of <self> raises OutOfRange if <I> > NbSubExpressions(me)

	:param I:
	:type I: int
	:rtype: opencascade::handle<Expr_GeneralExpression>
") SubExpression;
		const opencascade::handle<Expr_GeneralExpression> & SubExpression (const Standard_Integer I);
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
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Tests if <exp> is contained in <self>.

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") ContainsUnknowns;
		%feature("autodoc", "	* Does <self> contains NamedUnknown ?

	:rtype: bool
") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns ();
		%feature("compactdefaultargs") NbOperands;
		%feature("autodoc", "	* returns the number of operands contained in <self>

	:rtype: int
") NbOperands;
		Standard_Integer NbOperands ();
		%feature("compactdefaultargs") NbSubExpressions;
		%feature("autodoc", "	* returns the number of sub-expressions contained in <self> ( >= 2)

	:rtype: int
") NbSubExpressions;
		Standard_Integer NbSubExpressions ();
		%feature("compactdefaultargs") Operand;
		%feature("autodoc", "	* Returns the <index>-th operand used in <self>. An exception is raised if index is out of range

	:param index:
	:type index: int
	:rtype: opencascade::handle<Expr_GeneralExpression>
") Operand;
		const opencascade::handle<Expr_GeneralExpression> & Operand (const Standard_Integer index);
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "	* Replaces all occurences of <var> with <with> in <self> Raises InvalidOperand if <with> contains <self>.

	:param var:
	:type var: opencascade::handle<Expr_NamedUnknown> &
	:param with:
	:type with: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Replace;
		void Replace (const opencascade::handle<Expr_NamedUnknown> & var,const opencascade::handle<Expr_GeneralExpression> & with);
		%feature("compactdefaultargs") SetOperand;
		%feature("autodoc", "	* Sets the <index>-th operand used in <self>. An exception is raised if <index> is out of range Raises InvalidOperand if <exp> contains <self>.

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:param index:
	:type index: int
	:rtype: None
") SetOperand;
		void SetOperand (const opencascade::handle<Expr_GeneralExpression> & exp,const Standard_Integer index);
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "	* Returns a GeneralExpression after replacement of NamedUnknowns by an associated expression and after values computation.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Simplified;
		opencascade::handle<Expr_GeneralExpression> Simplified ();
		%feature("compactdefaultargs") SubExpression;
		%feature("autodoc", "	* Returns the sub-expression denoted by <I> in <self> Raises OutOfRange if <I> > NbSubExpressions(me)

	:param I:
	:type I: int
	:rtype: opencascade::handle<Expr_GeneralExpression>
") SubExpression;
		const opencascade::handle<Expr_GeneralExpression> & SubExpression (const Standard_Integer I);
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
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Tests if <self> contains <exp>.

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") FirstMember;
		%feature("autodoc", "	* Returns the first member of the relation

	:rtype: opencascade::handle<Expr_GeneralExpression>
") FirstMember;
		opencascade::handle<Expr_GeneralExpression> FirstMember ();
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	* Tests if <self> is linear between its NamedUnknowns.

	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") NbOfSingleRelations;
		%feature("autodoc", "	* Returns the number of SingleRelations contained in <self> (Always 1).

	:rtype: int
") NbOfSingleRelations;
		Standard_Integer NbOfSingleRelations ();
		%feature("compactdefaultargs") NbOfSubRelations;
		%feature("autodoc", "	* Returns the number of relations contained in <self>.

	:rtype: int
") NbOfSubRelations;
		Standard_Integer NbOfSubRelations ();
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "	* Replaces all occurences of <var> with <with> in <self>.

	:param var:
	:type var: opencascade::handle<Expr_NamedUnknown> &
	:param with:
	:type with: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Replace;
		void Replace (const opencascade::handle<Expr_NamedUnknown> & var,const opencascade::handle<Expr_GeneralExpression> & with);
		%feature("compactdefaultargs") SecondMember;
		%feature("autodoc", "	* Returns the second member of the relation

	:rtype: opencascade::handle<Expr_GeneralExpression>
") SecondMember;
		opencascade::handle<Expr_GeneralExpression> SecondMember ();
		%feature("compactdefaultargs") SetFirstMember;
		%feature("autodoc", "	* Defines the first member of the relation

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") SetFirstMember;
		void SetFirstMember (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") SetSecondMember;
		%feature("autodoc", "	* Defines the second member of the relation

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") SetSecondMember;
		void SetSecondMember (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") SubRelation;
		%feature("autodoc", "	* Returns the relation denoted by <index> in <self>. An exception is raised if index is out of range.

	:param index:
	:type index: int
	:rtype: opencascade::handle<Expr_GeneralRelation>
") SubRelation;
		opencascade::handle<Expr_GeneralRelation> SubRelation (const Standard_Integer index);
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
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Appends <relation> in the list of components of <self>.

	:param relation:
	:type relation: opencascade::handle<Expr_GeneralRelation> &
	:rtype: None
") Add;
		void Add (const opencascade::handle<Expr_GeneralRelation> & relation);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Tests if <self> contains <exp>.

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralRelation>
") Copy;
		opencascade::handle<Expr_GeneralRelation> Copy ();
		%feature("compactdefaultargs") Expr_SystemRelation;
		%feature("autodoc", "	* Creates a system with one relation

	:param relation:
	:type relation: opencascade::handle<Expr_GeneralRelation> &
	:rtype: None
") Expr_SystemRelation;
		 Expr_SystemRelation (const opencascade::handle<Expr_GeneralRelation> & relation);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	* Tests if <self> is linear between its NamedUnknowns.

	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "	:rtype: bool
") IsSatisfied;
		Standard_Boolean IsSatisfied ();
		%feature("compactdefaultargs") NbOfSingleRelations;
		%feature("autodoc", "	* Returns the number of SingleRelations contained in <self>.

	:rtype: int
") NbOfSingleRelations;
		Standard_Integer NbOfSingleRelations ();
		%feature("compactdefaultargs") NbOfSubRelations;
		%feature("autodoc", "	* Returns the number of relations contained in <self>.

	:rtype: int
") NbOfSubRelations;
		Standard_Integer NbOfSubRelations ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param relation:
	:type relation: opencascade::handle<Expr_GeneralRelation> &
	:rtype: None
") Remove;
		void Remove (const opencascade::handle<Expr_GeneralRelation> & relation);
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "	* Replaces all occurences of <var> with <with> in <self>.

	:param var:
	:type var: opencascade::handle<Expr_NamedUnknown> &
	:param with:
	:type with: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Replace;
		void Replace (const opencascade::handle<Expr_NamedUnknown> & var,const opencascade::handle<Expr_GeneralExpression> & with);
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "	* Returns a GeneralRelation after replacement of NamedUnknowns by an associated expression, and after values computation.

	:rtype: opencascade::handle<Expr_GeneralRelation>
") Simplified;
		opencascade::handle<Expr_GeneralRelation> Simplified ();
		%feature("compactdefaultargs") Simplify;
		%feature("autodoc", "	* Replaces NamedUnknowns by associated expressions, and computes values in <self>.

	:rtype: None
") Simplify;
		void Simplify ();
		%feature("compactdefaultargs") String;
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
		%feature("compactdefaultargs") SubRelation;
		%feature("autodoc", "	* Returns the relation denoted by <index> in <self>. An exception is raised if <index> is out of range.

	:param index:
	:type index: int
	:rtype: opencascade::handle<Expr_GeneralRelation>
") SubRelation;
		opencascade::handle<Expr_GeneralRelation> SubRelation (const Standard_Integer index);
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
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Tests if <exp> is contained in <self>.

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") ContainsUnknowns;
		%feature("autodoc", "	* Does <self> contains NamedUnknown ?

	:rtype: bool
") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns ();
		%feature("compactdefaultargs") NbSubExpressions;
		%feature("autodoc", "	* Returns the number of sub-expressions contained in <self> ( >= 0)

	:rtype: int
") NbSubExpressions;
		Standard_Integer NbSubExpressions ();
		%feature("compactdefaultargs") Operand;
		%feature("autodoc", "	* Returns the operand used

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Operand;
		const opencascade::handle<Expr_GeneralExpression> & Operand ();
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "	* Replaces all occurences of <var> with <with> in <self> Raises InvalidOperand if <with> contains <self>.

	:param var:
	:type var: opencascade::handle<Expr_NamedUnknown> &
	:param with:
	:type with: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Replace;
		void Replace (const opencascade::handle<Expr_NamedUnknown> & var,const opencascade::handle<Expr_GeneralExpression> & with);
		%feature("compactdefaultargs") SetOperand;
		%feature("autodoc", "	* Sets the operand used Raises InvalidOperand if <exp> contains <self>.

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") SetOperand;
		void SetOperand (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "	* Returns a GeneralExpression after replacement of NamedUnknowns by an associated expression, and after values computation.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Simplified;
		opencascade::handle<Expr_GeneralExpression> Simplified ();
		%feature("compactdefaultargs") SubExpression;
		%feature("autodoc", "	* Returns the <I>-th sub-expression of <self>. Raises OutOfRange if <I> > NbSubExpressions(me)

	:param I:
	:type I: int
	:rtype: opencascade::handle<Expr_GeneralExpression>
") SubExpression;
		const opencascade::handle<Expr_GeneralExpression> & SubExpression (const Standard_Integer I);
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative (const opencascade::handle<Expr_NamedUnknown> & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") Expr_Absolute;
		%feature("autodoc", "	* Creates the Abs of <exp>

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Expr_Absolute;
		 Expr_Absolute (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const opencascade::handle<Expr_GeneralExpression> & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified ();
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative (const opencascade::handle<Expr_NamedUnknown> & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") Expr_ArcCosine;
		%feature("autodoc", "	* Creates the Arccos of <exp>

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Expr_ArcCosine;
		 Expr_ArcCosine (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const opencascade::handle<Expr_GeneralExpression> & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified ();
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative (const opencascade::handle<Expr_NamedUnknown> & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") Expr_ArcSine;
		%feature("autodoc", "	* Creates the Arcsin of <exp>

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Expr_ArcSine;
		 Expr_ArcSine (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const opencascade::handle<Expr_GeneralExpression> & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified ();
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative (const opencascade::handle<Expr_NamedUnknown> & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") Expr_ArcTangent;
		%feature("autodoc", "	* Creates the Arctan of <exp>.

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Expr_ArcTangent;
		 Expr_ArcTangent (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const opencascade::handle<Expr_GeneralExpression> & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified ();
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative (const opencascade::handle<Expr_NamedUnknown> & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") Expr_ArgCosh;
		%feature("autodoc", "	* Creates the ArgCosh of <exp>

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Expr_ArgCosh;
		 Expr_ArgCosh (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const opencascade::handle<Expr_GeneralExpression> & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified ();
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative (const opencascade::handle<Expr_NamedUnknown> & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") Expr_ArgSinh;
		%feature("autodoc", "	* Creates the ArgSinh of <exp>.

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Expr_ArgSinh;
		 Expr_ArgSinh (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const opencascade::handle<Expr_GeneralExpression> & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified ();
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative (const opencascade::handle<Expr_NamedUnknown> & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") Expr_ArgTanh;
		%feature("autodoc", "	* Creates the Argtanh of <exp>.

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Expr_ArgTanh;
		 Expr_ArgTanh (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const opencascade::handle<Expr_GeneralExpression> & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified ();
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative (const opencascade::handle<Expr_NamedUnknown> & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") Expr_BinaryFunction;
		%feature("autodoc", "	* Creates <self> as <func> (<exp1>,<exp2>). Raises exception if <func> is not binary.

	:param func:
	:type func: opencascade::handle<Expr_GeneralFunction> &
	:param exp1:
	:type exp1: opencascade::handle<Expr_GeneralExpression> &
	:param exp2:
	:type exp2: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Expr_BinaryFunction;
		 Expr_BinaryFunction (const opencascade::handle<Expr_GeneralFunction> & func,const opencascade::handle<Expr_GeneralExpression> & exp1,const opencascade::handle<Expr_GeneralExpression> & exp2);
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "	* Returns the function defining <self>.

	:rtype: opencascade::handle<Expr_GeneralFunction>
") Function;
		opencascade::handle<Expr_GeneralFunction> Function ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const opencascade::handle<Expr_GeneralExpression> & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified ();
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative (const opencascade::handle<Expr_NamedUnknown> & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") Expr_Cosh;
		%feature("autodoc", "	* Creates the Cosh of <exp>

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Expr_Cosh;
		 Expr_Cosh (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const opencascade::handle<Expr_GeneralExpression> & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified ();
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative (const opencascade::handle<Expr_NamedUnknown> & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") Expr_Cosine;
		%feature("autodoc", "	* Creates the cosine of Exp

	:param Exp:
	:type Exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Expr_Cosine;
		 Expr_Cosine (const opencascade::handle<Expr_GeneralExpression> & Exp);
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const opencascade::handle<Expr_GeneralExpression> & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified ();
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative (const opencascade::handle<Expr_NamedUnknown> & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") Expr_Difference;
		%feature("autodoc", "	* Creates the difference <exp1> - <exp2>.

	:param exp1:
	:type exp1: opencascade::handle<Expr_GeneralExpression> &
	:param exp2:
	:type exp2: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Expr_Difference;
		 Expr_Difference (const opencascade::handle<Expr_GeneralExpression> & exp1,const opencascade::handle<Expr_GeneralExpression> & exp2);
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const opencascade::handle<Expr_GeneralExpression> & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") NDerivative;
		%feature("autodoc", "	* Returns the <N>-th derivative on <X> unknown of <self>. Raises OutOfRange if <N> <= 0

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:param N:
	:type N: int
	:rtype: opencascade::handle<Expr_GeneralExpression>
") NDerivative;
		virtual opencascade::handle<Expr_GeneralExpression> NDerivative (const opencascade::handle<Expr_NamedUnknown> & X,const Standard_Integer N);
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified ();
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralRelation>
") Copy;
		opencascade::handle<Expr_GeneralRelation> Copy ();
		%feature("compactdefaultargs") Expr_Different;
		%feature("autodoc", "	* Creates the relation <exp1> # <exp2>.

	:param exp1:
	:type exp1: opencascade::handle<Expr_GeneralExpression> &
	:param exp2:
	:type exp2: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Expr_Different;
		 Expr_Different (const opencascade::handle<Expr_GeneralExpression> & exp1,const opencascade::handle<Expr_GeneralExpression> & exp2);
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "	:rtype: bool
") IsSatisfied;
		Standard_Boolean IsSatisfied ();
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "	* Returns a GeneralRelation after replacement of NamedUnknowns by an associated expression, and after values computation.

	:rtype: opencascade::handle<Expr_GeneralRelation>
") Simplified;
		opencascade::handle<Expr_GeneralRelation> Simplified ();
		%feature("compactdefaultargs") Simplify;
		%feature("autodoc", "	* Replaces NamedUnknowns by associated expressions, and computes values in <self>.

	:rtype: None
") Simplify;
		void Simplify ();
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative (const opencascade::handle<Expr_NamedUnknown> & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") Expr_Division;
		%feature("autodoc", "	* Creates the division <exp1>/<exp2>

	:param exp1:
	:type exp1: opencascade::handle<Expr_GeneralExpression> &
	:param exp2:
	:type exp2: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Expr_Division;
		 Expr_Division (const opencascade::handle<Expr_GeneralExpression> & exp1,const opencascade::handle<Expr_GeneralExpression> & exp2);
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const opencascade::handle<Expr_GeneralExpression> & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified ();
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralRelation>
") Copy;
		opencascade::handle<Expr_GeneralRelation> Copy ();
		%feature("compactdefaultargs") Expr_Equal;
		%feature("autodoc", "	* Creates the relation <exp1> = <exp2>.

	:param exp1:
	:type exp1: opencascade::handle<Expr_GeneralExpression> &
	:param exp2:
	:type exp2: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Expr_Equal;
		 Expr_Equal (const opencascade::handle<Expr_GeneralExpression> & exp1,const opencascade::handle<Expr_GeneralExpression> & exp2);
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "	:rtype: bool
") IsSatisfied;
		Standard_Boolean IsSatisfied ();
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "	* returns a GeneralRelation after replacement of NamedUnknowns by an associated expression and after values computation.

	:rtype: opencascade::handle<Expr_GeneralRelation>
") Simplified;
		opencascade::handle<Expr_GeneralRelation> Simplified ();
		%feature("compactdefaultargs") Simplify;
		%feature("autodoc", "	* Replaces NamedUnknowns by an associated expressions and computes values in <self>.

	:rtype: None
") Simplify;
		void Simplify ();
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative (const opencascade::handle<Expr_NamedUnknown> & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") Expr_Exponential;
		%feature("autodoc", "	* Creates the exponential of <exp>

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Expr_Exponential;
		 Expr_Exponential (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const opencascade::handle<Expr_GeneralExpression> & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified ();
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative (const opencascade::handle<Expr_NamedUnknown> & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") Expr_Exponentiate;
		%feature("autodoc", "	* Creates the exponential <exp1> ^ <exp2>

	:param exp1:
	:type exp1: opencascade::handle<Expr_GeneralExpression> &
	:param exp2:
	:type exp2: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Expr_Exponentiate;
		 Expr_Exponentiate (const opencascade::handle<Expr_GeneralExpression> & exp1,const opencascade::handle<Expr_GeneralExpression> & exp2);
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const opencascade::handle<Expr_GeneralExpression> & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified ();
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralRelation>
") Copy;
		opencascade::handle<Expr_GeneralRelation> Copy ();
		%feature("compactdefaultargs") Expr_GreaterThan;
		%feature("autodoc", "	* Creates the relation <exp1> > <exp2>.

	:param exp1:
	:type exp1: opencascade::handle<Expr_GeneralExpression> &
	:param exp2:
	:type exp2: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Expr_GreaterThan;
		 Expr_GreaterThan (const opencascade::handle<Expr_GeneralExpression> & exp1,const opencascade::handle<Expr_GeneralExpression> & exp2);
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "	:rtype: bool
") IsSatisfied;
		Standard_Boolean IsSatisfied ();
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "	* Returns a GeneralRelation after replacement of NamedUnknowns by an associated expression, and after values computation.

	:rtype: opencascade::handle<Expr_GeneralRelation>
") Simplified;
		opencascade::handle<Expr_GeneralRelation> Simplified ();
		%feature("compactdefaultargs") Simplify;
		%feature("autodoc", "	* Replaces NamedUnknowns by associated expressions, and computes values in <self>.

	:rtype: None
") Simplify;
		void Simplify ();
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralRelation>
") Copy;
		opencascade::handle<Expr_GeneralRelation> Copy ();
		%feature("compactdefaultargs") Expr_GreaterThanOrEqual;
		%feature("autodoc", "	* Creates the relation <exp1> >= <exp2>.

	:param exp1:
	:type exp1: opencascade::handle<Expr_GeneralExpression> &
	:param exp2:
	:type exp2: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Expr_GreaterThanOrEqual;
		 Expr_GreaterThanOrEqual (const opencascade::handle<Expr_GeneralExpression> & exp1,const opencascade::handle<Expr_GeneralExpression> & exp2);
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "	:rtype: bool
") IsSatisfied;
		Standard_Boolean IsSatisfied ();
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "	* Returns a GeneralRelation after replacement of NamedUnknowns by an associated expression, and after values computation.

	:rtype: opencascade::handle<Expr_GeneralRelation>
") Simplified;
		opencascade::handle<Expr_GeneralRelation> Simplified ();
		%feature("compactdefaultargs") Simplify;
		%feature("autodoc", "	* Replaces NamedUnknowns by associated expressions, and computes values in <self>.

	:rtype: None
") Simplify;
		void Simplify ();
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralRelation>
") Copy;
		opencascade::handle<Expr_GeneralRelation> Copy ();
		%feature("compactdefaultargs") Expr_LessThan;
		%feature("autodoc", "	* Creates the relation <exp1> < <exp2>.

	:param exp1:
	:type exp1: opencascade::handle<Expr_GeneralExpression> &
	:param exp2:
	:type exp2: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Expr_LessThan;
		 Expr_LessThan (const opencascade::handle<Expr_GeneralExpression> & exp1,const opencascade::handle<Expr_GeneralExpression> & exp2);
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "	:rtype: bool
") IsSatisfied;
		Standard_Boolean IsSatisfied ();
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "	* Returns a GeneralRelation after replacement of NamedUnknowns by an associated expression, and after values computation.

	:rtype: opencascade::handle<Expr_GeneralRelation>
") Simplified;
		opencascade::handle<Expr_GeneralRelation> Simplified ();
		%feature("compactdefaultargs") Simplify;
		%feature("autodoc", "	* Replaces NamedUnknowns by associated expressions, and computes values in <self>.

	:rtype: None
") Simplify;
		void Simplify ();
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralRelation>
") Copy;
		opencascade::handle<Expr_GeneralRelation> Copy ();
		%feature("compactdefaultargs") Expr_LessThanOrEqual;
		%feature("autodoc", "	* Creates the relation <exp1> <= <exp2>.

	:param exp1:
	:type exp1: opencascade::handle<Expr_GeneralExpression> &
	:param exp2:
	:type exp2: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Expr_LessThanOrEqual;
		 Expr_LessThanOrEqual (const opencascade::handle<Expr_GeneralExpression> & exp1,const opencascade::handle<Expr_GeneralExpression> & exp2);
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "	:rtype: bool
") IsSatisfied;
		Standard_Boolean IsSatisfied ();
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "	* Returns a GeneralRelation after replacement of NamedUnknowns by an associated expression, and after values computation.

	:rtype: opencascade::handle<Expr_GeneralRelation>
") Simplified;
		opencascade::handle<Expr_GeneralRelation> Simplified ();
		%feature("compactdefaultargs") Simplify;
		%feature("autodoc", "	* Replaces NamedUnknowns by associated expressions, and computes values in <self>.

	:rtype: None
") Simplify;
		void Simplify ();
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative (const opencascade::handle<Expr_NamedUnknown> & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") Expr_LogOf10;
		%feature("autodoc", "	* Creates the base 10 logarithm of <exp>

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Expr_LogOf10;
		 Expr_LogOf10 (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const opencascade::handle<Expr_GeneralExpression> & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified ();
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative (const opencascade::handle<Expr_NamedUnknown> & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") Expr_LogOfe;
		%feature("autodoc", "	* Creates the natural logarithm of <exp>

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Expr_LogOfe;
		 Expr_LogOfe (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const opencascade::handle<Expr_GeneralExpression> & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified ();
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
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Tests if <exp> is contained in <self>.

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") ContainsUnknowns;
		%feature("autodoc", "	* Tests if <self> contains NamedUnknown. (returns always False)

	:rtype: bool
") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative (const opencascade::handle<Expr_NamedUnknown> & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
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
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") NDerivative;
		%feature("autodoc", "	* Returns the <N>-th derivative on <X> unknown of <self>. Raises OutOfRange if <N> <= 0

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:param N:
	:type N: int
	:rtype: opencascade::handle<Expr_GeneralExpression>
") NDerivative;
		virtual opencascade::handle<Expr_GeneralExpression> NDerivative (const opencascade::handle<Expr_NamedUnknown> & X,const Standard_Integer N);
		%feature("compactdefaultargs") NbSubExpressions;
		%feature("autodoc", "	* returns the number of sub-expressions contained in <self> (always returns zero)

	:rtype: int
") NbSubExpressions;
		Standard_Integer NbSubExpressions ();
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "	* Replaces all occurences of <var> with <with> in <self>

	:param var:
	:type var: opencascade::handle<Expr_NamedUnknown> &
	:param with:
	:type with: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Replace;
		void Replace (const opencascade::handle<Expr_NamedUnknown> & var,const opencascade::handle<Expr_GeneralExpression> & with);
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified ();
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "	* returns a GeneralExpression after replacement of NamedUnknowns by an associated expression and after values computation.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Simplified;
		opencascade::handle<Expr_GeneralExpression> Simplified ();
		%feature("compactdefaultargs") SubExpression;
		%feature("autodoc", "	* returns the <I>-th sub-expression of <self> raises OutOfRange

	:param I:
	:type I: int
	:rtype: opencascade::handle<Expr_GeneralExpression>
") SubExpression;
		const opencascade::handle<Expr_GeneralExpression> & SubExpression (const Standard_Integer I);
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
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	* Assigns <self> to <exp> expression. Raises exception if <exp> refers to <self>.

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Assign;
		void Assign (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") AssignedExpression;
		%feature("autodoc", "	* If exists, returns the assigned expression. An exception is raised if the expression does not exist.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") AssignedExpression;
		const opencascade::handle<Expr_GeneralExpression> & AssignedExpression ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Tests if <exp> is contained in <self>.

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") ContainsUnknowns;
		%feature("autodoc", "	* Tests if <self> contains NamedUnknown.

	:rtype: bool
") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy ();
		%feature("compactdefaultargs") Deassign;
		%feature("autodoc", "	* Supresses the assigned expression

	:rtype: None
") Deassign;
		void Deassign ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative (const opencascade::handle<Expr_NamedUnknown> & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
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
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") NbSubExpressions;
		%feature("autodoc", "	* Returns the number of sub-expressions contained in <self> ( >= 0)

	:rtype: int
") NbSubExpressions;
		Standard_Integer NbSubExpressions ();
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "	* Replaces all occurences of <var> with <with> in <self> Raises InvalidOperand if <with> contains <self>.

	:param var:
	:type var: opencascade::handle<Expr_NamedUnknown> &
	:param with:
	:type with: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Replace;
		void Replace (const opencascade::handle<Expr_NamedUnknown> & var,const opencascade::handle<Expr_GeneralExpression> & with);
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified ();
		%feature("compactdefaultargs") Simplified;
		%feature("autodoc", "	* Returns a GeneralExpression after replacement of NamedUnknowns by an associated expression and after values computation.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Simplified;
		opencascade::handle<Expr_GeneralExpression> Simplified ();
		%feature("compactdefaultargs") SubExpression;
		%feature("autodoc", "	* Returns the <I>-th sub-expression of <self> raises OutOfRange if <I> > NbSubExpressions(me)

	:param I:
	:type I: int
	:rtype: opencascade::handle<Expr_GeneralExpression>
") SubExpression;
		const opencascade::handle<Expr_GeneralExpression> & SubExpression (const Standard_Integer I);
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative (const opencascade::handle<Expr_NamedUnknown> & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") Expr_PolyFunction;
		%feature("autodoc", "	* Creates <self> as <func>(<exps_1>,<exps_2>,...,<exps_n>)

	:param func:
	:type func: opencascade::handle<Expr_GeneralFunction> &
	:param exps:
	:type exps: Expr_Array1OfGeneralExpression &
	:rtype: None
") Expr_PolyFunction;
		 Expr_PolyFunction (const opencascade::handle<Expr_GeneralFunction> & func,const Expr_Array1OfGeneralExpression & exps);
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "	* Returns the function defining <self>.

	:rtype: opencascade::handle<Expr_GeneralFunction>
") Function;
		opencascade::handle<Expr_GeneralFunction> Function ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const opencascade::handle<Expr_GeneralExpression> & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified ();
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative (const opencascade::handle<Expr_NamedUnknown> & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
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
	:type exp1: opencascade::handle<Expr_GeneralExpression> &
	:param exp2:
	:type exp2: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Expr_Product;
		 Expr_Product (const opencascade::handle<Expr_GeneralExpression> & exp1,const opencascade::handle<Expr_GeneralExpression> & exp2);
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const opencascade::handle<Expr_GeneralExpression> & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified ();
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative (const opencascade::handle<Expr_NamedUnknown> & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") Expr_Sine;
		%feature("autodoc", "	* Creates the sine of <exp>.

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Expr_Sine;
		 Expr_Sine (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const opencascade::handle<Expr_GeneralExpression> & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified ();
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative (const opencascade::handle<Expr_NamedUnknown> & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") Expr_Sinh;
		%feature("autodoc", "	* Creates the sinh of <exp>.

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Expr_Sinh;
		 Expr_Sinh (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const opencascade::handle<Expr_GeneralExpression> & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified ();
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative (const opencascade::handle<Expr_NamedUnknown> & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") Expr_Square;
		%feature("autodoc", "	* Creates the square of <exp>.

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Expr_Square;
		 Expr_Square (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const opencascade::handle<Expr_GeneralExpression> & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified ();
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative (const opencascade::handle<Expr_NamedUnknown> & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") Expr_SquareRoot;
		%feature("autodoc", "	* Creates the square root of <exp>

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Expr_SquareRoot;
		 Expr_SquareRoot (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const opencascade::handle<Expr_GeneralExpression> & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified ();
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative (const opencascade::handle<Expr_NamedUnknown> & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
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
	:type exp1: opencascade::handle<Expr_GeneralExpression> &
	:param exp2:
	:type exp2: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Expr_Sum;
		 Expr_Sum (const opencascade::handle<Expr_GeneralExpression> & exp1,const opencascade::handle<Expr_GeneralExpression> & exp2);
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const opencascade::handle<Expr_GeneralExpression> & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") NDerivative;
		%feature("autodoc", "	* Returns the <N>-th derivative on <X> unknown of <self>. Raises OutOfRange if <N> <= 0

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:param N:
	:type N: int
	:rtype: opencascade::handle<Expr_GeneralExpression>
") NDerivative;
		virtual opencascade::handle<Expr_GeneralExpression> NDerivative (const opencascade::handle<Expr_NamedUnknown> & X,const Standard_Integer N);
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified ();
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative (const opencascade::handle<Expr_NamedUnknown> & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") Expr_Tangent;
		%feature("autodoc", "	* Creates the tangent of <exp>.

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Expr_Tangent;
		 Expr_Tangent (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const opencascade::handle<Expr_GeneralExpression> & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified ();
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative (const opencascade::handle<Expr_NamedUnknown> & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") Expr_Tanh;
		%feature("autodoc", "	* Creates the hyperbolic tangent of <exp>.

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Expr_Tanh;
		 Expr_Tanh (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const opencascade::handle<Expr_GeneralExpression> & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified ();
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative (const opencascade::handle<Expr_NamedUnknown> & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") Expr_UnaryFunction;
		%feature("autodoc", "	* Creates me as <func>(<exp>). Raises exception if <func> is not unary.

	:param func:
	:type func: opencascade::handle<Expr_GeneralFunction> &
	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Expr_UnaryFunction;
		 Expr_UnaryFunction (const opencascade::handle<Expr_GeneralFunction> & func,const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "	* Returns the function defining <self>.

	:rtype: opencascade::handle<Expr_GeneralFunction>
") Function;
		opencascade::handle<Expr_GeneralFunction> Function ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const opencascade::handle<Expr_GeneralExpression> & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified ();
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
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") Copy;
		opencascade::handle<Expr_GeneralExpression> Copy ();
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:rtype: opencascade::handle<Expr_GeneralExpression>
") Derivative;
		opencascade::handle<Expr_GeneralExpression> Derivative (const opencascade::handle<Expr_NamedUnknown> & X);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("compactdefaultargs") Expr_UnaryMinus;
		%feature("autodoc", "	* Create the unary minus of <exp>.

	:param exp:
	:type exp: opencascade::handle<Expr_GeneralExpression> &
	:rtype: None
") Expr_UnaryMinus;
		 Expr_UnaryMinus (const opencascade::handle<Expr_GeneralExpression> & exp);
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: opencascade::handle<Expr_GeneralExpression> &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const opencascade::handle<Expr_GeneralExpression> & Other);
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("compactdefaultargs") NDerivative;
		%feature("autodoc", "	* Returns the <N>-th derivative on <X> unknown of <self>. Raises OutOfRange if <N> <= 0

	:param X:
	:type X: opencascade::handle<Expr_NamedUnknown> &
	:param N:
	:type N: int
	:rtype: opencascade::handle<Expr_GeneralExpression>
") NDerivative;
		virtual opencascade::handle<Expr_GeneralExpression> NDerivative (const opencascade::handle<Expr_NamedUnknown> & X,const Standard_Integer N);
		%feature("compactdefaultargs") ShallowSimplified;
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: opencascade::handle<Expr_GeneralExpression>
") ShallowSimplified;
		opencascade::handle<Expr_GeneralExpression> ShallowSimplified ();
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
/* harray1 class */
/* harray2 class */
/* harray2 class */
