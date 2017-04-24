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
%module (package="OCC") Expr

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


%include Expr_headers.i


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


%extend Expr_GeneralExpression {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_GeneralExpression(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_GeneralExpression::Handle_Expr_GeneralExpression %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_GeneralExpression;
class Handle_Expr_GeneralExpression : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Expr_GeneralExpression();
        Handle_Expr_GeneralExpression(const Handle_Expr_GeneralExpression &aHandle);
        Handle_Expr_GeneralExpression(const Expr_GeneralExpression *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_GeneralExpression DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_GeneralExpression {
    Expr_GeneralExpression* _get_reference() {
    return (Expr_GeneralExpression*)$self->Access();
    }
};

%extend Handle_Expr_GeneralExpression {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_GeneralFunction {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_GeneralFunction(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_GeneralFunction::Handle_Expr_GeneralFunction %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_GeneralFunction;
class Handle_Expr_GeneralFunction : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Expr_GeneralFunction();
        Handle_Expr_GeneralFunction(const Handle_Expr_GeneralFunction &aHandle);
        Handle_Expr_GeneralFunction(const Expr_GeneralFunction *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_GeneralFunction DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_GeneralFunction {
    Expr_GeneralFunction* _get_reference() {
    return (Expr_GeneralFunction*)$self->Access();
    }
};

%extend Handle_Expr_GeneralFunction {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_GeneralRelation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_GeneralRelation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_GeneralRelation::Handle_Expr_GeneralRelation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_GeneralRelation;
class Handle_Expr_GeneralRelation : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Expr_GeneralRelation();
        Handle_Expr_GeneralRelation(const Handle_Expr_GeneralRelation &aHandle);
        Handle_Expr_GeneralRelation(const Expr_GeneralRelation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_GeneralRelation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_GeneralRelation {
    Expr_GeneralRelation* _get_reference() {
    return (Expr_GeneralRelation*)$self->Access();
    }
};

%extend Handle_Expr_GeneralRelation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_IndexedMapNodeOfMapOfNamedUnknown {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_IndexedMapNodeOfMapOfNamedUnknown(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_IndexedMapNodeOfMapOfNamedUnknown::Handle_Expr_IndexedMapNodeOfMapOfNamedUnknown %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_IndexedMapNodeOfMapOfNamedUnknown;
class Handle_Expr_IndexedMapNodeOfMapOfNamedUnknown : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_Expr_IndexedMapNodeOfMapOfNamedUnknown();
        Handle_Expr_IndexedMapNodeOfMapOfNamedUnknown(const Handle_Expr_IndexedMapNodeOfMapOfNamedUnknown &aHandle);
        Handle_Expr_IndexedMapNodeOfMapOfNamedUnknown(const Expr_IndexedMapNodeOfMapOfNamedUnknown *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_IndexedMapNodeOfMapOfNamedUnknown DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_IndexedMapNodeOfMapOfNamedUnknown {
    Expr_IndexedMapNodeOfMapOfNamedUnknown* _get_reference() {
    return (Expr_IndexedMapNodeOfMapOfNamedUnknown*)$self->Access();
    }
};

%extend Handle_Expr_IndexedMapNodeOfMapOfNamedUnknown {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_SequenceNodeOfSequenceOfGeneralExpression {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_SequenceNodeOfSequenceOfGeneralExpression(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_SequenceNodeOfSequenceOfGeneralExpression::Handle_Expr_SequenceNodeOfSequenceOfGeneralExpression %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_SequenceNodeOfSequenceOfGeneralExpression;
class Handle_Expr_SequenceNodeOfSequenceOfGeneralExpression : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Expr_SequenceNodeOfSequenceOfGeneralExpression();
        Handle_Expr_SequenceNodeOfSequenceOfGeneralExpression(const Handle_Expr_SequenceNodeOfSequenceOfGeneralExpression &aHandle);
        Handle_Expr_SequenceNodeOfSequenceOfGeneralExpression(const Expr_SequenceNodeOfSequenceOfGeneralExpression *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_SequenceNodeOfSequenceOfGeneralExpression DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_SequenceNodeOfSequenceOfGeneralExpression {
    Expr_SequenceNodeOfSequenceOfGeneralExpression* _get_reference() {
    return (Expr_SequenceNodeOfSequenceOfGeneralExpression*)$self->Access();
    }
};

%extend Handle_Expr_SequenceNodeOfSequenceOfGeneralExpression {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_SequenceNodeOfSequenceOfGeneralRelation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_SequenceNodeOfSequenceOfGeneralRelation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_SequenceNodeOfSequenceOfGeneralRelation::Handle_Expr_SequenceNodeOfSequenceOfGeneralRelation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_SequenceNodeOfSequenceOfGeneralRelation;
class Handle_Expr_SequenceNodeOfSequenceOfGeneralRelation : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Expr_SequenceNodeOfSequenceOfGeneralRelation();
        Handle_Expr_SequenceNodeOfSequenceOfGeneralRelation(const Handle_Expr_SequenceNodeOfSequenceOfGeneralRelation &aHandle);
        Handle_Expr_SequenceNodeOfSequenceOfGeneralRelation(const Expr_SequenceNodeOfSequenceOfGeneralRelation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_SequenceNodeOfSequenceOfGeneralRelation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_SequenceNodeOfSequenceOfGeneralRelation {
    Expr_SequenceNodeOfSequenceOfGeneralRelation* _get_reference() {
    return (Expr_SequenceNodeOfSequenceOfGeneralRelation*)$self->Access();
    }
};

%extend Handle_Expr_SequenceNodeOfSequenceOfGeneralRelation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_BinaryExpression {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_BinaryExpression(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_BinaryExpression::Handle_Expr_BinaryExpression %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_BinaryExpression;
class Handle_Expr_BinaryExpression : public Handle_Expr_GeneralExpression {

    public:
        // constructors
        Handle_Expr_BinaryExpression();
        Handle_Expr_BinaryExpression(const Handle_Expr_BinaryExpression &aHandle);
        Handle_Expr_BinaryExpression(const Expr_BinaryExpression *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_BinaryExpression DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_BinaryExpression {
    Expr_BinaryExpression* _get_reference() {
    return (Expr_BinaryExpression*)$self->Access();
    }
};

%extend Handle_Expr_BinaryExpression {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_FunctionDerivative {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_FunctionDerivative(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_FunctionDerivative::Handle_Expr_FunctionDerivative %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_FunctionDerivative;
class Handle_Expr_FunctionDerivative : public Handle_Expr_GeneralFunction {

    public:
        // constructors
        Handle_Expr_FunctionDerivative();
        Handle_Expr_FunctionDerivative(const Handle_Expr_FunctionDerivative &aHandle);
        Handle_Expr_FunctionDerivative(const Expr_FunctionDerivative *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_FunctionDerivative DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_FunctionDerivative {
    Expr_FunctionDerivative* _get_reference() {
    return (Expr_FunctionDerivative*)$self->Access();
    }
};

%extend Handle_Expr_FunctionDerivative {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_NamedExpression {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_NamedExpression(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_NamedExpression::Handle_Expr_NamedExpression %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_NamedExpression;
class Handle_Expr_NamedExpression : public Handle_Expr_GeneralExpression {

    public:
        // constructors
        Handle_Expr_NamedExpression();
        Handle_Expr_NamedExpression(const Handle_Expr_NamedExpression &aHandle);
        Handle_Expr_NamedExpression(const Expr_NamedExpression *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_NamedExpression DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_NamedExpression {
    Expr_NamedExpression* _get_reference() {
    return (Expr_NamedExpression*)$self->Access();
    }
};

%extend Handle_Expr_NamedExpression {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_NamedFunction {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_NamedFunction(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_NamedFunction::Handle_Expr_NamedFunction %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_NamedFunction;
class Handle_Expr_NamedFunction : public Handle_Expr_GeneralFunction {

    public:
        // constructors
        Handle_Expr_NamedFunction();
        Handle_Expr_NamedFunction(const Handle_Expr_NamedFunction &aHandle);
        Handle_Expr_NamedFunction(const Expr_NamedFunction *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_NamedFunction DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_NamedFunction {
    Expr_NamedFunction* _get_reference() {
    return (Expr_NamedFunction*)$self->Access();
    }
};

%extend Handle_Expr_NamedFunction {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_NumericValue {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_NumericValue(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_NumericValue::Handle_Expr_NumericValue %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_NumericValue;
class Handle_Expr_NumericValue : public Handle_Expr_GeneralExpression {

    public:
        // constructors
        Handle_Expr_NumericValue();
        Handle_Expr_NumericValue(const Handle_Expr_NumericValue &aHandle);
        Handle_Expr_NumericValue(const Expr_NumericValue *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_NumericValue DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_NumericValue {
    Expr_NumericValue* _get_reference() {
    return (Expr_NumericValue*)$self->Access();
    }
};

%extend Handle_Expr_NumericValue {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_PolyExpression {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_PolyExpression(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_PolyExpression::Handle_Expr_PolyExpression %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_PolyExpression;
class Handle_Expr_PolyExpression : public Handle_Expr_GeneralExpression {

    public:
        // constructors
        Handle_Expr_PolyExpression();
        Handle_Expr_PolyExpression(const Handle_Expr_PolyExpression &aHandle);
        Handle_Expr_PolyExpression(const Expr_PolyExpression *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_PolyExpression DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_PolyExpression {
    Expr_PolyExpression* _get_reference() {
    return (Expr_PolyExpression*)$self->Access();
    }
};

%extend Handle_Expr_PolyExpression {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_SingleRelation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_SingleRelation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_SingleRelation::Handle_Expr_SingleRelation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_SingleRelation;
class Handle_Expr_SingleRelation : public Handle_Expr_GeneralRelation {

    public:
        // constructors
        Handle_Expr_SingleRelation();
        Handle_Expr_SingleRelation(const Handle_Expr_SingleRelation &aHandle);
        Handle_Expr_SingleRelation(const Expr_SingleRelation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_SingleRelation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_SingleRelation {
    Expr_SingleRelation* _get_reference() {
    return (Expr_SingleRelation*)$self->Access();
    }
};

%extend Handle_Expr_SingleRelation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_SystemRelation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_SystemRelation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_SystemRelation::Handle_Expr_SystemRelation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_SystemRelation;
class Handle_Expr_SystemRelation : public Handle_Expr_GeneralRelation {

    public:
        // constructors
        Handle_Expr_SystemRelation();
        Handle_Expr_SystemRelation(const Handle_Expr_SystemRelation &aHandle);
        Handle_Expr_SystemRelation(const Expr_SystemRelation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_SystemRelation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_SystemRelation {
    Expr_SystemRelation* _get_reference() {
    return (Expr_SystemRelation*)$self->Access();
    }
};

%extend Handle_Expr_SystemRelation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_UnaryExpression {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_UnaryExpression(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_UnaryExpression::Handle_Expr_UnaryExpression %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_UnaryExpression;
class Handle_Expr_UnaryExpression : public Handle_Expr_GeneralExpression {

    public:
        // constructors
        Handle_Expr_UnaryExpression();
        Handle_Expr_UnaryExpression(const Handle_Expr_UnaryExpression &aHandle);
        Handle_Expr_UnaryExpression(const Expr_UnaryExpression *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_UnaryExpression DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_UnaryExpression {
    Expr_UnaryExpression* _get_reference() {
    return (Expr_UnaryExpression*)$self->Access();
    }
};

%extend Handle_Expr_UnaryExpression {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_Absolute {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_Absolute(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_Absolute::Handle_Expr_Absolute %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_Absolute;
class Handle_Expr_Absolute : public Handle_Expr_UnaryExpression {

    public:
        // constructors
        Handle_Expr_Absolute();
        Handle_Expr_Absolute(const Handle_Expr_Absolute &aHandle);
        Handle_Expr_Absolute(const Expr_Absolute *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_Absolute DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_Absolute {
    Expr_Absolute* _get_reference() {
    return (Expr_Absolute*)$self->Access();
    }
};

%extend Handle_Expr_Absolute {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_ArcCosine {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_ArcCosine(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_ArcCosine::Handle_Expr_ArcCosine %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_ArcCosine;
class Handle_Expr_ArcCosine : public Handle_Expr_UnaryExpression {

    public:
        // constructors
        Handle_Expr_ArcCosine();
        Handle_Expr_ArcCosine(const Handle_Expr_ArcCosine &aHandle);
        Handle_Expr_ArcCosine(const Expr_ArcCosine *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_ArcCosine DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_ArcCosine {
    Expr_ArcCosine* _get_reference() {
    return (Expr_ArcCosine*)$self->Access();
    }
};

%extend Handle_Expr_ArcCosine {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_ArcSine {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_ArcSine(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_ArcSine::Handle_Expr_ArcSine %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_ArcSine;
class Handle_Expr_ArcSine : public Handle_Expr_UnaryExpression {

    public:
        // constructors
        Handle_Expr_ArcSine();
        Handle_Expr_ArcSine(const Handle_Expr_ArcSine &aHandle);
        Handle_Expr_ArcSine(const Expr_ArcSine *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_ArcSine DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_ArcSine {
    Expr_ArcSine* _get_reference() {
    return (Expr_ArcSine*)$self->Access();
    }
};

%extend Handle_Expr_ArcSine {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_ArcTangent {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_ArcTangent(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_ArcTangent::Handle_Expr_ArcTangent %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_ArcTangent;
class Handle_Expr_ArcTangent : public Handle_Expr_UnaryExpression {

    public:
        // constructors
        Handle_Expr_ArcTangent();
        Handle_Expr_ArcTangent(const Handle_Expr_ArcTangent &aHandle);
        Handle_Expr_ArcTangent(const Expr_ArcTangent *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_ArcTangent DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_ArcTangent {
    Expr_ArcTangent* _get_reference() {
    return (Expr_ArcTangent*)$self->Access();
    }
};

%extend Handle_Expr_ArcTangent {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_ArgCosh {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_ArgCosh(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_ArgCosh::Handle_Expr_ArgCosh %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_ArgCosh;
class Handle_Expr_ArgCosh : public Handle_Expr_UnaryExpression {

    public:
        // constructors
        Handle_Expr_ArgCosh();
        Handle_Expr_ArgCosh(const Handle_Expr_ArgCosh &aHandle);
        Handle_Expr_ArgCosh(const Expr_ArgCosh *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_ArgCosh DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_ArgCosh {
    Expr_ArgCosh* _get_reference() {
    return (Expr_ArgCosh*)$self->Access();
    }
};

%extend Handle_Expr_ArgCosh {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_ArgSinh {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_ArgSinh(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_ArgSinh::Handle_Expr_ArgSinh %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_ArgSinh;
class Handle_Expr_ArgSinh : public Handle_Expr_UnaryExpression {

    public:
        // constructors
        Handle_Expr_ArgSinh();
        Handle_Expr_ArgSinh(const Handle_Expr_ArgSinh &aHandle);
        Handle_Expr_ArgSinh(const Expr_ArgSinh *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_ArgSinh DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_ArgSinh {
    Expr_ArgSinh* _get_reference() {
    return (Expr_ArgSinh*)$self->Access();
    }
};

%extend Handle_Expr_ArgSinh {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_ArgTanh {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_ArgTanh(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_ArgTanh::Handle_Expr_ArgTanh %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_ArgTanh;
class Handle_Expr_ArgTanh : public Handle_Expr_UnaryExpression {

    public:
        // constructors
        Handle_Expr_ArgTanh();
        Handle_Expr_ArgTanh(const Handle_Expr_ArgTanh &aHandle);
        Handle_Expr_ArgTanh(const Expr_ArgTanh *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_ArgTanh DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_ArgTanh {
    Expr_ArgTanh* _get_reference() {
    return (Expr_ArgTanh*)$self->Access();
    }
};

%extend Handle_Expr_ArgTanh {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_BinaryFunction {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_BinaryFunction(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_BinaryFunction::Handle_Expr_BinaryFunction %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_BinaryFunction;
class Handle_Expr_BinaryFunction : public Handle_Expr_BinaryExpression {

    public:
        // constructors
        Handle_Expr_BinaryFunction();
        Handle_Expr_BinaryFunction(const Handle_Expr_BinaryFunction &aHandle);
        Handle_Expr_BinaryFunction(const Expr_BinaryFunction *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_BinaryFunction DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_BinaryFunction {
    Expr_BinaryFunction* _get_reference() {
    return (Expr_BinaryFunction*)$self->Access();
    }
};

%extend Handle_Expr_BinaryFunction {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_Cosh {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_Cosh(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_Cosh::Handle_Expr_Cosh %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_Cosh;
class Handle_Expr_Cosh : public Handle_Expr_UnaryExpression {

    public:
        // constructors
        Handle_Expr_Cosh();
        Handle_Expr_Cosh(const Handle_Expr_Cosh &aHandle);
        Handle_Expr_Cosh(const Expr_Cosh *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_Cosh DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_Cosh {
    Expr_Cosh* _get_reference() {
    return (Expr_Cosh*)$self->Access();
    }
};

%extend Handle_Expr_Cosh {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_Cosine {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_Cosine(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_Cosine::Handle_Expr_Cosine %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_Cosine;
class Handle_Expr_Cosine : public Handle_Expr_UnaryExpression {

    public:
        // constructors
        Handle_Expr_Cosine();
        Handle_Expr_Cosine(const Handle_Expr_Cosine &aHandle);
        Handle_Expr_Cosine(const Expr_Cosine *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_Cosine DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_Cosine {
    Expr_Cosine* _get_reference() {
    return (Expr_Cosine*)$self->Access();
    }
};

%extend Handle_Expr_Cosine {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_Difference {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_Difference(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_Difference::Handle_Expr_Difference %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_Difference;
class Handle_Expr_Difference : public Handle_Expr_BinaryExpression {

    public:
        // constructors
        Handle_Expr_Difference();
        Handle_Expr_Difference(const Handle_Expr_Difference &aHandle);
        Handle_Expr_Difference(const Expr_Difference *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_Difference DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_Difference {
    Expr_Difference* _get_reference() {
    return (Expr_Difference*)$self->Access();
    }
};

%extend Handle_Expr_Difference {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_Different {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_Different(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_Different::Handle_Expr_Different %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_Different;
class Handle_Expr_Different : public Handle_Expr_SingleRelation {

    public:
        // constructors
        Handle_Expr_Different();
        Handle_Expr_Different(const Handle_Expr_Different &aHandle);
        Handle_Expr_Different(const Expr_Different *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_Different DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_Different {
    Expr_Different* _get_reference() {
    return (Expr_Different*)$self->Access();
    }
};

%extend Handle_Expr_Different {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_Division {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_Division(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_Division::Handle_Expr_Division %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_Division;
class Handle_Expr_Division : public Handle_Expr_BinaryExpression {

    public:
        // constructors
        Handle_Expr_Division();
        Handle_Expr_Division(const Handle_Expr_Division &aHandle);
        Handle_Expr_Division(const Expr_Division *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_Division DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_Division {
    Expr_Division* _get_reference() {
    return (Expr_Division*)$self->Access();
    }
};

%extend Handle_Expr_Division {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_Equal {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_Equal(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_Equal::Handle_Expr_Equal %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_Equal;
class Handle_Expr_Equal : public Handle_Expr_SingleRelation {

    public:
        // constructors
        Handle_Expr_Equal();
        Handle_Expr_Equal(const Handle_Expr_Equal &aHandle);
        Handle_Expr_Equal(const Expr_Equal *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_Equal DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_Equal {
    Expr_Equal* _get_reference() {
    return (Expr_Equal*)$self->Access();
    }
};

%extend Handle_Expr_Equal {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_Exponential {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_Exponential(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_Exponential::Handle_Expr_Exponential %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_Exponential;
class Handle_Expr_Exponential : public Handle_Expr_UnaryExpression {

    public:
        // constructors
        Handle_Expr_Exponential();
        Handle_Expr_Exponential(const Handle_Expr_Exponential &aHandle);
        Handle_Expr_Exponential(const Expr_Exponential *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_Exponential DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_Exponential {
    Expr_Exponential* _get_reference() {
    return (Expr_Exponential*)$self->Access();
    }
};

%extend Handle_Expr_Exponential {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_Exponentiate {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_Exponentiate(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_Exponentiate::Handle_Expr_Exponentiate %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_Exponentiate;
class Handle_Expr_Exponentiate : public Handle_Expr_BinaryExpression {

    public:
        // constructors
        Handle_Expr_Exponentiate();
        Handle_Expr_Exponentiate(const Handle_Expr_Exponentiate &aHandle);
        Handle_Expr_Exponentiate(const Expr_Exponentiate *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_Exponentiate DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_Exponentiate {
    Expr_Exponentiate* _get_reference() {
    return (Expr_Exponentiate*)$self->Access();
    }
};

%extend Handle_Expr_Exponentiate {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_GreaterThan {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_GreaterThan(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_GreaterThan::Handle_Expr_GreaterThan %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_GreaterThan;
class Handle_Expr_GreaterThan : public Handle_Expr_SingleRelation {

    public:
        // constructors
        Handle_Expr_GreaterThan();
        Handle_Expr_GreaterThan(const Handle_Expr_GreaterThan &aHandle);
        Handle_Expr_GreaterThan(const Expr_GreaterThan *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_GreaterThan DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_GreaterThan {
    Expr_GreaterThan* _get_reference() {
    return (Expr_GreaterThan*)$self->Access();
    }
};

%extend Handle_Expr_GreaterThan {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_GreaterThanOrEqual {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_GreaterThanOrEqual(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_GreaterThanOrEqual::Handle_Expr_GreaterThanOrEqual %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_GreaterThanOrEqual;
class Handle_Expr_GreaterThanOrEqual : public Handle_Expr_SingleRelation {

    public:
        // constructors
        Handle_Expr_GreaterThanOrEqual();
        Handle_Expr_GreaterThanOrEqual(const Handle_Expr_GreaterThanOrEqual &aHandle);
        Handle_Expr_GreaterThanOrEqual(const Expr_GreaterThanOrEqual *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_GreaterThanOrEqual DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_GreaterThanOrEqual {
    Expr_GreaterThanOrEqual* _get_reference() {
    return (Expr_GreaterThanOrEqual*)$self->Access();
    }
};

%extend Handle_Expr_GreaterThanOrEqual {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_LessThan {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_LessThan(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_LessThan::Handle_Expr_LessThan %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_LessThan;
class Handle_Expr_LessThan : public Handle_Expr_SingleRelation {

    public:
        // constructors
        Handle_Expr_LessThan();
        Handle_Expr_LessThan(const Handle_Expr_LessThan &aHandle);
        Handle_Expr_LessThan(const Expr_LessThan *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_LessThan DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_LessThan {
    Expr_LessThan* _get_reference() {
    return (Expr_LessThan*)$self->Access();
    }
};

%extend Handle_Expr_LessThan {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_LessThanOrEqual {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_LessThanOrEqual(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_LessThanOrEqual::Handle_Expr_LessThanOrEqual %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_LessThanOrEqual;
class Handle_Expr_LessThanOrEqual : public Handle_Expr_SingleRelation {

    public:
        // constructors
        Handle_Expr_LessThanOrEqual();
        Handle_Expr_LessThanOrEqual(const Handle_Expr_LessThanOrEqual &aHandle);
        Handle_Expr_LessThanOrEqual(const Expr_LessThanOrEqual *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_LessThanOrEqual DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_LessThanOrEqual {
    Expr_LessThanOrEqual* _get_reference() {
    return (Expr_LessThanOrEqual*)$self->Access();
    }
};

%extend Handle_Expr_LessThanOrEqual {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_LogOf10 {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_LogOf10(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_LogOf10::Handle_Expr_LogOf10 %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_LogOf10;
class Handle_Expr_LogOf10 : public Handle_Expr_UnaryExpression {

    public:
        // constructors
        Handle_Expr_LogOf10();
        Handle_Expr_LogOf10(const Handle_Expr_LogOf10 &aHandle);
        Handle_Expr_LogOf10(const Expr_LogOf10 *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_LogOf10 DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_LogOf10 {
    Expr_LogOf10* _get_reference() {
    return (Expr_LogOf10*)$self->Access();
    }
};

%extend Handle_Expr_LogOf10 {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_LogOfe {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_LogOfe(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_LogOfe::Handle_Expr_LogOfe %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_LogOfe;
class Handle_Expr_LogOfe : public Handle_Expr_UnaryExpression {

    public:
        // constructors
        Handle_Expr_LogOfe();
        Handle_Expr_LogOfe(const Handle_Expr_LogOfe &aHandle);
        Handle_Expr_LogOfe(const Expr_LogOfe *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_LogOfe DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_LogOfe {
    Expr_LogOfe* _get_reference() {
    return (Expr_LogOfe*)$self->Access();
    }
};

%extend Handle_Expr_LogOfe {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_NamedConstant {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_NamedConstant(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_NamedConstant::Handle_Expr_NamedConstant %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_NamedConstant;
class Handle_Expr_NamedConstant : public Handle_Expr_NamedExpression {

    public:
        // constructors
        Handle_Expr_NamedConstant();
        Handle_Expr_NamedConstant(const Handle_Expr_NamedConstant &aHandle);
        Handle_Expr_NamedConstant(const Expr_NamedConstant *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_NamedConstant DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_NamedConstant {
    Expr_NamedConstant* _get_reference() {
    return (Expr_NamedConstant*)$self->Access();
    }
};

%extend Handle_Expr_NamedConstant {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_NamedUnknown {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_NamedUnknown(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_NamedUnknown::Handle_Expr_NamedUnknown %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_NamedUnknown;
class Handle_Expr_NamedUnknown : public Handle_Expr_NamedExpression {

    public:
        // constructors
        Handle_Expr_NamedUnknown();
        Handle_Expr_NamedUnknown(const Handle_Expr_NamedUnknown &aHandle);
        Handle_Expr_NamedUnknown(const Expr_NamedUnknown *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_NamedUnknown DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_NamedUnknown {
    Expr_NamedUnknown* _get_reference() {
    return (Expr_NamedUnknown*)$self->Access();
    }
};

%extend Handle_Expr_NamedUnknown {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_PolyFunction {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_PolyFunction(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_PolyFunction::Handle_Expr_PolyFunction %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_PolyFunction;
class Handle_Expr_PolyFunction : public Handle_Expr_PolyExpression {

    public:
        // constructors
        Handle_Expr_PolyFunction();
        Handle_Expr_PolyFunction(const Handle_Expr_PolyFunction &aHandle);
        Handle_Expr_PolyFunction(const Expr_PolyFunction *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_PolyFunction DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_PolyFunction {
    Expr_PolyFunction* _get_reference() {
    return (Expr_PolyFunction*)$self->Access();
    }
};

%extend Handle_Expr_PolyFunction {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_Product {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_Product(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_Product::Handle_Expr_Product %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_Product;
class Handle_Expr_Product : public Handle_Expr_PolyExpression {

    public:
        // constructors
        Handle_Expr_Product();
        Handle_Expr_Product(const Handle_Expr_Product &aHandle);
        Handle_Expr_Product(const Expr_Product *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_Product DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_Product {
    Expr_Product* _get_reference() {
    return (Expr_Product*)$self->Access();
    }
};

%extend Handle_Expr_Product {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_Sine {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_Sine(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_Sine::Handle_Expr_Sine %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_Sine;
class Handle_Expr_Sine : public Handle_Expr_UnaryExpression {

    public:
        // constructors
        Handle_Expr_Sine();
        Handle_Expr_Sine(const Handle_Expr_Sine &aHandle);
        Handle_Expr_Sine(const Expr_Sine *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_Sine DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_Sine {
    Expr_Sine* _get_reference() {
    return (Expr_Sine*)$self->Access();
    }
};

%extend Handle_Expr_Sine {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_Sinh {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_Sinh(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_Sinh::Handle_Expr_Sinh %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_Sinh;
class Handle_Expr_Sinh : public Handle_Expr_UnaryExpression {

    public:
        // constructors
        Handle_Expr_Sinh();
        Handle_Expr_Sinh(const Handle_Expr_Sinh &aHandle);
        Handle_Expr_Sinh(const Expr_Sinh *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_Sinh DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_Sinh {
    Expr_Sinh* _get_reference() {
    return (Expr_Sinh*)$self->Access();
    }
};

%extend Handle_Expr_Sinh {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_Square {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_Square(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_Square::Handle_Expr_Square %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_Square;
class Handle_Expr_Square : public Handle_Expr_UnaryExpression {

    public:
        // constructors
        Handle_Expr_Square();
        Handle_Expr_Square(const Handle_Expr_Square &aHandle);
        Handle_Expr_Square(const Expr_Square *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_Square DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_Square {
    Expr_Square* _get_reference() {
    return (Expr_Square*)$self->Access();
    }
};

%extend Handle_Expr_Square {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_SquareRoot {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_SquareRoot(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_SquareRoot::Handle_Expr_SquareRoot %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_SquareRoot;
class Handle_Expr_SquareRoot : public Handle_Expr_UnaryExpression {

    public:
        // constructors
        Handle_Expr_SquareRoot();
        Handle_Expr_SquareRoot(const Handle_Expr_SquareRoot &aHandle);
        Handle_Expr_SquareRoot(const Expr_SquareRoot *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_SquareRoot DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_SquareRoot {
    Expr_SquareRoot* _get_reference() {
    return (Expr_SquareRoot*)$self->Access();
    }
};

%extend Handle_Expr_SquareRoot {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_Sum {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_Sum(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_Sum::Handle_Expr_Sum %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_Sum;
class Handle_Expr_Sum : public Handle_Expr_PolyExpression {

    public:
        // constructors
        Handle_Expr_Sum();
        Handle_Expr_Sum(const Handle_Expr_Sum &aHandle);
        Handle_Expr_Sum(const Expr_Sum *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_Sum DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_Sum {
    Expr_Sum* _get_reference() {
    return (Expr_Sum*)$self->Access();
    }
};

%extend Handle_Expr_Sum {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_Tangent {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_Tangent(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_Tangent::Handle_Expr_Tangent %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_Tangent;
class Handle_Expr_Tangent : public Handle_Expr_UnaryExpression {

    public:
        // constructors
        Handle_Expr_Tangent();
        Handle_Expr_Tangent(const Handle_Expr_Tangent &aHandle);
        Handle_Expr_Tangent(const Expr_Tangent *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_Tangent DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_Tangent {
    Expr_Tangent* _get_reference() {
    return (Expr_Tangent*)$self->Access();
    }
};

%extend Handle_Expr_Tangent {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_Tanh {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_Tanh(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_Tanh::Handle_Expr_Tanh %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_Tanh;
class Handle_Expr_Tanh : public Handle_Expr_UnaryExpression {

    public:
        // constructors
        Handle_Expr_Tanh();
        Handle_Expr_Tanh(const Handle_Expr_Tanh &aHandle);
        Handle_Expr_Tanh(const Expr_Tanh *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_Tanh DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_Tanh {
    Expr_Tanh* _get_reference() {
    return (Expr_Tanh*)$self->Access();
    }
};

%extend Handle_Expr_Tanh {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_UnaryFunction {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_UnaryFunction(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_UnaryFunction::Handle_Expr_UnaryFunction %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_UnaryFunction;
class Handle_Expr_UnaryFunction : public Handle_Expr_UnaryExpression {

    public:
        // constructors
        Handle_Expr_UnaryFunction();
        Handle_Expr_UnaryFunction(const Handle_Expr_UnaryFunction &aHandle);
        Handle_Expr_UnaryFunction(const Expr_UnaryFunction *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_UnaryFunction DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_UnaryFunction {
    Expr_UnaryFunction* _get_reference() {
    return (Expr_UnaryFunction*)$self->Access();
    }
};

%extend Handle_Expr_UnaryFunction {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

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


%extend Expr_UnaryMinus {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Expr_UnaryMinus(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Expr_UnaryMinus::Handle_Expr_UnaryMinus %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Expr_UnaryMinus;
class Handle_Expr_UnaryMinus : public Handle_Expr_UnaryExpression {

    public:
        // constructors
        Handle_Expr_UnaryMinus();
        Handle_Expr_UnaryMinus(const Handle_Expr_UnaryMinus &aHandle);
        Handle_Expr_UnaryMinus(const Expr_UnaryMinus *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Expr_UnaryMinus DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Expr_UnaryMinus {
    Expr_UnaryMinus* _get_reference() {
    return (Expr_UnaryMinus*)$self->Access();
    }
};

%extend Handle_Expr_UnaryMinus {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Expr_UnaryMinus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
