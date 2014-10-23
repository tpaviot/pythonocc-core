/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include Expr_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(expr) Expr;
%nodefaultctor Expr;
class Expr {
	public:
		%feature("autodoc", "	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: Handle_Expr_GeneralExpression
") CopyShare;
		static Handle_Expr_GeneralExpression CopyShare (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: int
") NbOfFreeVariables;
		static Standard_Integer NbOfFreeVariables (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	:param exp:
	:type exp: Handle_Expr_GeneralRelation &
	:rtype: int
") NbOfFreeVariables;
		static Standard_Integer NbOfFreeVariables (const Handle_Expr_GeneralRelation & exp);
		%feature("autodoc", "	:param val:
	:type val: float
	:rtype: float
") Sign;
		static Standard_Real Sign (const Standard_Real val);
};


%feature("shadow") Expr::~Expr %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Expr_Array1OfGeneralExpression;
class Expr_Array1OfGeneralExpression {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Expr_Array1OfGeneralExpression;
		 Expr_Array1OfGeneralExpression (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Expr_GeneralExpression &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Expr_Array1OfGeneralExpression;
		 Expr_Array1OfGeneralExpression (const Handle_Expr_GeneralExpression & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: Handle_Expr_GeneralExpression &
	:rtype: None
") Init;
		void Init (const Handle_Expr_GeneralExpression & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: Expr_Array1OfGeneralExpression &
	:rtype: Expr_Array1OfGeneralExpression
") Assign;
		const Expr_Array1OfGeneralExpression & Assign (const Expr_Array1OfGeneralExpression & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Expr_Array1OfGeneralExpression &
	:rtype: Expr_Array1OfGeneralExpression
") operator=;
		const Expr_Array1OfGeneralExpression & operator = (const Expr_Array1OfGeneralExpression & Other);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: Handle_Expr_GeneralExpression &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Expr_GeneralExpression & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Expr_GeneralExpression
") Value;
		const Handle_Expr_GeneralExpression & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Expr_GeneralExpression
") ChangeValue;
		Handle_Expr_GeneralExpression & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") Expr_Array1OfGeneralExpression::~Expr_Array1OfGeneralExpression %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_Array1OfGeneralExpression {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Expr_Array1OfNamedUnknown;
class Expr_Array1OfNamedUnknown {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Expr_Array1OfNamedUnknown;
		 Expr_Array1OfNamedUnknown (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Expr_NamedUnknown &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Expr_Array1OfNamedUnknown;
		 Expr_Array1OfNamedUnknown (const Handle_Expr_NamedUnknown & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: Handle_Expr_NamedUnknown &
	:rtype: None
") Init;
		void Init (const Handle_Expr_NamedUnknown & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: Expr_Array1OfNamedUnknown &
	:rtype: Expr_Array1OfNamedUnknown
") Assign;
		const Expr_Array1OfNamedUnknown & Assign (const Expr_Array1OfNamedUnknown & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Expr_Array1OfNamedUnknown &
	:rtype: Expr_Array1OfNamedUnknown
") operator=;
		const Expr_Array1OfNamedUnknown & operator = (const Expr_Array1OfNamedUnknown & Other);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: Handle_Expr_NamedUnknown &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Expr_NamedUnknown & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Expr_NamedUnknown
") Value;
		const Handle_Expr_NamedUnknown & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Expr_NamedUnknown
") ChangeValue;
		Handle_Expr_NamedUnknown & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") Expr_Array1OfNamedUnknown::~Expr_Array1OfNamedUnknown %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_Array1OfNamedUnknown {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Expr_Array1OfSingleRelation;
class Expr_Array1OfSingleRelation {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Expr_Array1OfSingleRelation;
		 Expr_Array1OfSingleRelation (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Expr_SingleRelation &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Expr_Array1OfSingleRelation;
		 Expr_Array1OfSingleRelation (const Handle_Expr_SingleRelation & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: Handle_Expr_SingleRelation &
	:rtype: None
") Init;
		void Init (const Handle_Expr_SingleRelation & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: Expr_Array1OfSingleRelation &
	:rtype: Expr_Array1OfSingleRelation
") Assign;
		const Expr_Array1OfSingleRelation & Assign (const Expr_Array1OfSingleRelation & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Expr_Array1OfSingleRelation &
	:rtype: Expr_Array1OfSingleRelation
") operator=;
		const Expr_Array1OfSingleRelation & operator = (const Expr_Array1OfSingleRelation & Other);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: Handle_Expr_SingleRelation &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Expr_SingleRelation & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Expr_SingleRelation
") Value;
		const Handle_Expr_SingleRelation & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Expr_SingleRelation
") ChangeValue;
		Handle_Expr_SingleRelation & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") Expr_Array1OfSingleRelation::~Expr_Array1OfSingleRelation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_Array1OfSingleRelation {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Expr_GeneralExpression;
class Expr_GeneralExpression : public MMgt_TShared {
	public:
		%feature("autodoc", "	* Returns the number of sub-expressions contained in <self> ( >= 0)

	:rtype: int
") NbSubExpressions;
		virtual Standard_Integer NbSubExpressions ();
		%feature("autodoc", "	* Returns the <I>-th sub-expression of <self> raises OutOfRange if <I> > NbSubExpressions(me)

	:param I:
	:type I: Standard_Integer
	:rtype: Handle_Expr_GeneralExpression
") SubExpression;
		virtual const Handle_Expr_GeneralExpression & SubExpression (const Standard_Integer I);
		%feature("autodoc", "	* Returns a GeneralExpression after replacement of NamedUnknowns by an associated expression and after values computation.

	:rtype: Handle_Expr_GeneralExpression
") Simplified;
		virtual Handle_Expr_GeneralExpression Simplified ();
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		virtual Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		virtual Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "	* Tests if <self> contains NamedUnknowns.

	:rtype: bool
") ContainsUnknowns;
		virtual Standard_Boolean ContainsUnknowns ();
		%feature("autodoc", "	* Tests if <exp> is contained in <self>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: bool
") Contains;
		virtual Standard_Boolean Contains (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	* Tests if <self> is linear on every NamedUnknown it contains.

	:rtype: bool
") IsLinear;
		virtual Standard_Boolean IsLinear ();
		%feature("autodoc", "	* Tests if <self> can be shared by one or more expressions or must be copied. This method returns False as a default value. To be redefined ( especially for NamedUnknown).

	:rtype: bool
") IsShareable;
		virtual Standard_Boolean IsShareable ();
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. Warning: This method does not include any simplification before testing. It could also be very slow; to be used carefully.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		virtual Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		virtual Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "	* Returns the <N>-th derivative on <X> unknown of <self>. Raise OutOfRange if N <= 0

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:param N:
	:type N: Standard_Integer
	:rtype: Handle_Expr_GeneralExpression
") NDerivative;
		virtual Handle_Expr_GeneralExpression NDerivative (const Handle_Expr_NamedUnknown & X,const Standard_Integer N);
		%feature("autodoc", "	* Replaces all occurences of <var> with copies of <with> in <self>. Copies of <with> are made with the Copy() method. Raises InvalidOperand if <with> contains <self>.

	:param var:
	:type var: Handle_Expr_NamedUnknown &
	:param with:
	:type with: Handle_Expr_GeneralExpression &
	:rtype: void
") Replace;
		virtual void Replace (const Handle_Expr_NamedUnknown & var,const Handle_Expr_GeneralExpression & with);
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		virtual Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:rtype: float
") EvaluateNumeric;
		Standard_Real EvaluateNumeric ();
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		virtual TCollection_AsciiString String ();
};


%feature("shadow") Expr_GeneralExpression::~Expr_GeneralExpression %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_GeneralExpression {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_GeneralExpression {
	Handle_Expr_GeneralExpression GetHandle() {
	return *(Handle_Expr_GeneralExpression*) &$self;
	}
};

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
    Expr_GeneralExpression* GetObject() {
    return (Expr_GeneralExpression*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_GeneralExpression::~Handle_Expr_GeneralExpression %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_GeneralExpression {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_GeneralFunction;
class Expr_GeneralFunction : public MMgt_TShared {
	public:
		%feature("autodoc", "	* Returns the number of variables of <self>.

	:rtype: int
") NbOfVariables;
		virtual Standard_Integer NbOfVariables ();
		%feature("autodoc", "	* Returns the variable denoted by <index> in <self>. Raises OutOfRange if index > NbOfVariables.

	:param index:
	:type index: Standard_Integer
	:rtype: Handle_Expr_NamedUnknown
") Variable;
		virtual Handle_Expr_NamedUnknown Variable (const Standard_Integer index);
		%feature("autodoc", "	* Returns a copy of <self> with the same form.

	:rtype: Handle_Expr_GeneralFunction
") Copy;
		virtual Handle_Expr_GeneralFunction Copy ();
		%feature("autodoc", "	* Returns Derivative of <self> for variable <var>.

	:param var:
	:type var: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralFunction
") Derivative;
		virtual Handle_Expr_GeneralFunction Derivative (const Handle_Expr_NamedUnknown & var);
		%feature("autodoc", "	* Returns Derivative of <self> for variable <var> with degree <deg>.

	:param var:
	:type var: Handle_Expr_NamedUnknown &
	:param deg:
	:type deg: Standard_Integer
	:rtype: Handle_Expr_GeneralFunction
") Derivative;
		virtual Handle_Expr_GeneralFunction Derivative (const Handle_Expr_NamedUnknown & var,const Standard_Integer deg);
		%feature("autodoc", "	* Computes the value of <self> with the given variables. Raises NotEvaluable if <vars> does not match all variables of <self>.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		virtual Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "	* Tests if <self> and <func> are similar functions (same name and same used expression).

	:param func:
	:type func: Handle_Expr_GeneralFunction &
	:rtype: bool
") IsIdentical;
		virtual Standard_Boolean IsIdentical (const Handle_Expr_GeneralFunction & func);
		%feature("autodoc", "	* Tests if <self> is linear on variable on range <index>

	:param index:
	:type index: Standard_Integer
	:rtype: bool
") IsLinearOnVariable;
		virtual Standard_Boolean IsLinearOnVariable (const Standard_Integer index);
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") GetStringName;
		virtual TCollection_AsciiString GetStringName ();
};


%feature("shadow") Expr_GeneralFunction::~Expr_GeneralFunction %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_GeneralFunction {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_GeneralFunction {
	Handle_Expr_GeneralFunction GetHandle() {
	return *(Handle_Expr_GeneralFunction*) &$self;
	}
};

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
    Expr_GeneralFunction* GetObject() {
    return (Expr_GeneralFunction*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_GeneralFunction::~Handle_Expr_GeneralFunction %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_GeneralFunction {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_GeneralRelation;
class Expr_GeneralRelation : public MMgt_TShared {
	public:
		%feature("autodoc", "	* Returns the current status of the relation

	:rtype: bool
") IsSatisfied;
		virtual Standard_Boolean IsSatisfied ();
		%feature("autodoc", "	* Tests if <self> is linear between its NamedUnknowns.

	:rtype: bool
") IsLinear;
		virtual Standard_Boolean IsLinear ();
		%feature("autodoc", "	* Returns a GeneralRelation after replacement of NamedUnknowns by an associated expression, and after values computation.

	:rtype: Handle_Expr_GeneralRelation
") Simplified;
		virtual Handle_Expr_GeneralRelation Simplified ();
		%feature("autodoc", "	* Replaces NamedUnknowns by associated expressions, and computes values in <self>.

	:rtype: void
") Simplify;
		virtual void Simplify ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralRelation
") Copy;
		virtual Handle_Expr_GeneralRelation Copy ();
		%feature("autodoc", "	* Returns the number of relations contained in <self>.

	:rtype: int
") NbOfSubRelations;
		virtual Standard_Integer NbOfSubRelations ();
		%feature("autodoc", "	* Returns the number of SingleRelations contained in <self>.

	:rtype: int
") NbOfSingleRelations;
		virtual Standard_Integer NbOfSingleRelations ();
		%feature("autodoc", "	* Returns the relation denoted by <index> in <self>. An exception is raised if <index> is out of range.

	:param index:
	:type index: Standard_Integer
	:rtype: Handle_Expr_GeneralRelation
") SubRelation;
		virtual Handle_Expr_GeneralRelation SubRelation (const Standard_Integer index);
		%feature("autodoc", "	* Tests if <exp> contains <var>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: bool
") Contains;
		virtual Standard_Boolean Contains (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	* Replaces all occurences of <var> with <with> in <self>.

	:param var:
	:type var: Handle_Expr_NamedUnknown &
	:param with:
	:type with: Handle_Expr_GeneralExpression &
	:rtype: void
") Replace;
		virtual void Replace (const Handle_Expr_NamedUnknown & var,const Handle_Expr_GeneralExpression & with);
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		virtual TCollection_AsciiString String ();
};


%feature("shadow") Expr_GeneralRelation::~Expr_GeneralRelation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_GeneralRelation {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_GeneralRelation {
	Handle_Expr_GeneralRelation GetHandle() {
	return *(Handle_Expr_GeneralRelation*) &$self;
	}
};

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
    Expr_GeneralRelation* GetObject() {
    return (Expr_GeneralRelation*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_GeneralRelation::~Handle_Expr_GeneralRelation %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_GeneralRelation {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_IndexedMapNodeOfMapOfNamedUnknown;
class Expr_IndexedMapNodeOfMapOfNamedUnknown : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param K1:
	:type K1: Handle_Expr_NamedUnknown &
	:param K2:
	:type K2: Standard_Integer
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") Expr_IndexedMapNodeOfMapOfNamedUnknown;
		 Expr_IndexedMapNodeOfMapOfNamedUnknown (const Handle_Expr_NamedUnknown & K1,const Standard_Integer K2,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "	:rtype: Handle_Expr_NamedUnknown
") Key1;
		Handle_Expr_NamedUnknown & Key1 ();

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
            		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
};


%feature("shadow") Expr_IndexedMapNodeOfMapOfNamedUnknown::~Expr_IndexedMapNodeOfMapOfNamedUnknown %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_IndexedMapNodeOfMapOfNamedUnknown {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_IndexedMapNodeOfMapOfNamedUnknown {
	Handle_Expr_IndexedMapNodeOfMapOfNamedUnknown GetHandle() {
	return *(Handle_Expr_IndexedMapNodeOfMapOfNamedUnknown*) &$self;
	}
};

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
    Expr_IndexedMapNodeOfMapOfNamedUnknown* GetObject() {
    return (Expr_IndexedMapNodeOfMapOfNamedUnknown*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_IndexedMapNodeOfMapOfNamedUnknown::~Handle_Expr_IndexedMapNodeOfMapOfNamedUnknown %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_IndexedMapNodeOfMapOfNamedUnknown {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_MapOfNamedUnknown;
class Expr_MapOfNamedUnknown : public TCollection_BasicMap {
	public:
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") Expr_MapOfNamedUnknown;
		 Expr_MapOfNamedUnknown (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: Expr_MapOfNamedUnknown &
	:rtype: Expr_MapOfNamedUnknown
") Assign;
		Expr_MapOfNamedUnknown & Assign (const Expr_MapOfNamedUnknown & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Expr_MapOfNamedUnknown &
	:rtype: Expr_MapOfNamedUnknown
") operator=;
		Expr_MapOfNamedUnknown & operator = (const Expr_MapOfNamedUnknown & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: Handle_Expr_NamedUnknown &
	:rtype: int
") Add;
		Standard_Integer Add (const Handle_Expr_NamedUnknown & K);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:param K:
	:type K: Handle_Expr_NamedUnknown &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const Handle_Expr_NamedUnknown & K);
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "	:param K:
	:type K: Handle_Expr_NamedUnknown &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Expr_NamedUnknown & K);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: Handle_Expr_NamedUnknown
") FindKey;
		const Handle_Expr_NamedUnknown & FindKey (const Standard_Integer I);
		%feature("autodoc", "	:param K:
	:type K: Handle_Expr_NamedUnknown &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const Handle_Expr_NamedUnknown & K);
};


%feature("shadow") Expr_MapOfNamedUnknown::~Expr_MapOfNamedUnknown %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_MapOfNamedUnknown {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Expr_RUIterator;
class Expr_RUIterator {
	public:
		%feature("autodoc", "	* Creates an iterator on every NamedUnknown contained in <rel>.

	:param rel:
	:type rel: Handle_Expr_GeneralRelation &
	:rtype: None
") Expr_RUIterator;
		 Expr_RUIterator (const Handle_Expr_GeneralRelation & rel);
		%feature("autodoc", "	* Returns False if on other unknown remains.

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	* Returns current NamedUnknown. Raises exception if no more unknowns remain.

	:rtype: Handle_Expr_NamedUnknown
") Value;
		Handle_Expr_NamedUnknown Value ();
};


%feature("shadow") Expr_RUIterator::~Expr_RUIterator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_RUIterator {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Expr_RelationIterator;
class Expr_RelationIterator {
	public:
		%feature("autodoc", "	:param rel:
	:type rel: Handle_Expr_GeneralRelation &
	:rtype: None
") Expr_RelationIterator;
		 Expr_RelationIterator (const Handle_Expr_GeneralRelation & rel);
		%feature("autodoc", "	* Returns False if no other relation remains.

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	* Returns current basic relation. Exception is raised if no more relation remains.

	:rtype: Handle_Expr_SingleRelation
") Value;
		Handle_Expr_SingleRelation Value ();
};


%feature("shadow") Expr_RelationIterator::~Expr_RelationIterator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_RelationIterator {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Expr_SequenceNodeOfSequenceOfGeneralExpression;
class Expr_SequenceNodeOfSequenceOfGeneralExpression : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralExpression &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Expr_SequenceNodeOfSequenceOfGeneralExpression;
		 Expr_SequenceNodeOfSequenceOfGeneralExpression (const Handle_Expr_GeneralExpression & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralExpression
") Value;
		Handle_Expr_GeneralExpression & Value ();
};


%feature("shadow") Expr_SequenceNodeOfSequenceOfGeneralExpression::~Expr_SequenceNodeOfSequenceOfGeneralExpression %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_SequenceNodeOfSequenceOfGeneralExpression {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_SequenceNodeOfSequenceOfGeneralExpression {
	Handle_Expr_SequenceNodeOfSequenceOfGeneralExpression GetHandle() {
	return *(Handle_Expr_SequenceNodeOfSequenceOfGeneralExpression*) &$self;
	}
};

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
    Expr_SequenceNodeOfSequenceOfGeneralExpression* GetObject() {
    return (Expr_SequenceNodeOfSequenceOfGeneralExpression*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_SequenceNodeOfSequenceOfGeneralExpression::~Handle_Expr_SequenceNodeOfSequenceOfGeneralExpression %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_SequenceNodeOfSequenceOfGeneralExpression {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_SequenceNodeOfSequenceOfGeneralRelation;
class Expr_SequenceNodeOfSequenceOfGeneralRelation : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralRelation &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Expr_SequenceNodeOfSequenceOfGeneralRelation;
		 Expr_SequenceNodeOfSequenceOfGeneralRelation (const Handle_Expr_GeneralRelation & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralRelation
") Value;
		Handle_Expr_GeneralRelation & Value ();
};


%feature("shadow") Expr_SequenceNodeOfSequenceOfGeneralRelation::~Expr_SequenceNodeOfSequenceOfGeneralRelation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_SequenceNodeOfSequenceOfGeneralRelation {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_SequenceNodeOfSequenceOfGeneralRelation {
	Handle_Expr_SequenceNodeOfSequenceOfGeneralRelation GetHandle() {
	return *(Handle_Expr_SequenceNodeOfSequenceOfGeneralRelation*) &$self;
	}
};

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
    Expr_SequenceNodeOfSequenceOfGeneralRelation* GetObject() {
    return (Expr_SequenceNodeOfSequenceOfGeneralRelation*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_SequenceNodeOfSequenceOfGeneralRelation::~Handle_Expr_SequenceNodeOfSequenceOfGeneralRelation %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_SequenceNodeOfSequenceOfGeneralRelation {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_SequenceOfGeneralExpression;
class Expr_SequenceOfGeneralExpression : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Expr_SequenceOfGeneralExpression;
		 Expr_SequenceOfGeneralExpression ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Expr_SequenceOfGeneralExpression &
	:rtype: Expr_SequenceOfGeneralExpression
") Assign;
		const Expr_SequenceOfGeneralExpression & Assign (const Expr_SequenceOfGeneralExpression & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Expr_SequenceOfGeneralExpression &
	:rtype: Expr_SequenceOfGeneralExpression
") operator=;
		const Expr_SequenceOfGeneralExpression & operator = (const Expr_SequenceOfGeneralExpression & Other);
		%feature("autodoc", "	:param T:
	:type T: Handle_Expr_GeneralExpression &
	:rtype: None
") Append;
		void Append (const Handle_Expr_GeneralExpression & T);
		%feature("autodoc", "	:param S:
	:type S: Expr_SequenceOfGeneralExpression &
	:rtype: None
") Append;
		void Append (Expr_SequenceOfGeneralExpression & S);
		%feature("autodoc", "	:param T:
	:type T: Handle_Expr_GeneralExpression &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Expr_GeneralExpression & T);
		%feature("autodoc", "	:param S:
	:type S: Expr_SequenceOfGeneralExpression &
	:rtype: None
") Prepend;
		void Prepend (Expr_SequenceOfGeneralExpression & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Expr_GeneralExpression &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Expr_GeneralExpression & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Expr_SequenceOfGeneralExpression &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Expr_SequenceOfGeneralExpression & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Expr_GeneralExpression &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Expr_GeneralExpression & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Expr_SequenceOfGeneralExpression &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Expr_SequenceOfGeneralExpression & S);
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralExpression
") First;
		const Handle_Expr_GeneralExpression & First ();
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralExpression
") Last;
		const Handle_Expr_GeneralExpression & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Expr_SequenceOfGeneralExpression &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Expr_SequenceOfGeneralExpression & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Expr_GeneralExpression
") Value;
		const Handle_Expr_GeneralExpression & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Handle_Expr_GeneralExpression &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Expr_GeneralExpression & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Expr_GeneralExpression
") ChangeValue;
		Handle_Expr_GeneralExpression & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Expr_SequenceOfGeneralExpression::~Expr_SequenceOfGeneralExpression %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_SequenceOfGeneralExpression {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Expr_SequenceOfGeneralRelation;
class Expr_SequenceOfGeneralRelation : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Expr_SequenceOfGeneralRelation;
		 Expr_SequenceOfGeneralRelation ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Expr_SequenceOfGeneralRelation &
	:rtype: Expr_SequenceOfGeneralRelation
") Assign;
		const Expr_SequenceOfGeneralRelation & Assign (const Expr_SequenceOfGeneralRelation & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Expr_SequenceOfGeneralRelation &
	:rtype: Expr_SequenceOfGeneralRelation
") operator=;
		const Expr_SequenceOfGeneralRelation & operator = (const Expr_SequenceOfGeneralRelation & Other);
		%feature("autodoc", "	:param T:
	:type T: Handle_Expr_GeneralRelation &
	:rtype: None
") Append;
		void Append (const Handle_Expr_GeneralRelation & T);
		%feature("autodoc", "	:param S:
	:type S: Expr_SequenceOfGeneralRelation &
	:rtype: None
") Append;
		void Append (Expr_SequenceOfGeneralRelation & S);
		%feature("autodoc", "	:param T:
	:type T: Handle_Expr_GeneralRelation &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Expr_GeneralRelation & T);
		%feature("autodoc", "	:param S:
	:type S: Expr_SequenceOfGeneralRelation &
	:rtype: None
") Prepend;
		void Prepend (Expr_SequenceOfGeneralRelation & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Expr_GeneralRelation &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Expr_GeneralRelation & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Expr_SequenceOfGeneralRelation &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Expr_SequenceOfGeneralRelation & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Expr_GeneralRelation &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Expr_GeneralRelation & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Expr_SequenceOfGeneralRelation &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Expr_SequenceOfGeneralRelation & S);
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralRelation
") First;
		const Handle_Expr_GeneralRelation & First ();
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralRelation
") Last;
		const Handle_Expr_GeneralRelation & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Expr_SequenceOfGeneralRelation &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Expr_SequenceOfGeneralRelation & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Expr_GeneralRelation
") Value;
		const Handle_Expr_GeneralRelation & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Handle_Expr_GeneralRelation &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Expr_GeneralRelation & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Expr_GeneralRelation
") ChangeValue;
		Handle_Expr_GeneralRelation & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Expr_SequenceOfGeneralRelation::~Expr_SequenceOfGeneralRelation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_SequenceOfGeneralRelation {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Expr_UnknownIterator;
class Expr_UnknownIterator {
	public:
		%feature("autodoc", "	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_UnknownIterator;
		 Expr_UnknownIterator (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: Handle_Expr_NamedUnknown
") Value;
		Handle_Expr_NamedUnknown Value ();
};


%feature("shadow") Expr_UnknownIterator::~Expr_UnknownIterator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_UnknownIterator {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Expr_BinaryExpression;
class Expr_BinaryExpression : public Expr_GeneralExpression {
	public:
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralExpression
") FirstOperand;
		const Handle_Expr_GeneralExpression & FirstOperand ();
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralExpression
") SecondOperand;
		const Handle_Expr_GeneralExpression & SecondOperand ();
		%feature("autodoc", "	* Sets first operand of <self> Raises InvalidOperand if exp = me

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") SetFirstOperand;
		void SetFirstOperand (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	* Sets second operand of <self> Raises InvalidOperand if <exp> contains <self>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") SetSecondOperand;
		void SetSecondOperand (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	* returns the number of sub-expressions contained in <self> ( >= 0)

	:rtype: int
") NbSubExpressions;
		Standard_Integer NbSubExpressions ();
		%feature("autodoc", "	* returns the <I>-th sub-expression of <self> raises OutOfRange if <I> > NbSubExpressions(me)

	:param I:
	:type I: Standard_Integer
	:rtype: Handle_Expr_GeneralExpression
") SubExpression;
		const Handle_Expr_GeneralExpression & SubExpression (const Standard_Integer I);
		%feature("autodoc", "	* Does <self> contain NamedUnknown ?

	:rtype: bool
") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns ();
		%feature("autodoc", "	* Tests if <self> contains <exp>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	* Replaces all occurences of <var> with <with> in <self>. Raises InvalidOperand if <with> contains <self>.

	:param var:
	:type var: Handle_Expr_NamedUnknown &
	:param with:
	:type with: Handle_Expr_GeneralExpression &
	:rtype: None
") Replace;
		void Replace (const Handle_Expr_NamedUnknown & var,const Handle_Expr_GeneralExpression & with);
		%feature("autodoc", "	* Returns a GeneralExpression after replacement of NamedUnknowns by an associated expression and after values computation.

	:rtype: Handle_Expr_GeneralExpression
") Simplified;
		Handle_Expr_GeneralExpression Simplified ();
};


%feature("shadow") Expr_BinaryExpression::~Expr_BinaryExpression %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_BinaryExpression {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_BinaryExpression {
	Handle_Expr_BinaryExpression GetHandle() {
	return *(Handle_Expr_BinaryExpression*) &$self;
	}
};

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
    Expr_BinaryExpression* GetObject() {
    return (Expr_BinaryExpression*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_BinaryExpression::~Handle_Expr_BinaryExpression %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_BinaryExpression {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_FunctionDerivative;
class Expr_FunctionDerivative : public Expr_GeneralFunction {
	public:
		%feature("autodoc", "	* Creates a FunctionDerivative of degree <deg> relative to the <withX> variable. Raises OutOfRange if <deg> lower or equal to zero.

	:param func:
	:type func: Handle_Expr_GeneralFunction &
	:param withX:
	:type withX: Handle_Expr_NamedUnknown &
	:param deg:
	:type deg: Standard_Integer
	:rtype: None
") Expr_FunctionDerivative;
		 Expr_FunctionDerivative (const Handle_Expr_GeneralFunction & func,const Handle_Expr_NamedUnknown & withX,const Standard_Integer deg);
		%feature("autodoc", "	* Returns the number of variables of <self>.

	:rtype: int
") NbOfVariables;
		Standard_Integer NbOfVariables ();
		%feature("autodoc", "	* Returns the variable denoted by <index> in <self>. Raises OutOfRange if <index> greater than NbOfVariables of <self>.

	:param index:
	:type index: Standard_Integer
	:rtype: Handle_Expr_NamedUnknown
") Variable;
		Handle_Expr_NamedUnknown Variable (const Standard_Integer index);
		%feature("autodoc", "	* Computes the value of <self> with the given variables. Raises DimensionMismatch if Length(vars) is different from Length(values).

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param values:
	:type values: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & values);
		%feature("autodoc", "	* Returns a copy of <self> with the same form.

	:rtype: Handle_Expr_GeneralFunction
") Copy;
		Handle_Expr_GeneralFunction Copy ();
		%feature("autodoc", "	* Returns Derivative of <self> for variable <var>.

	:param var:
	:type var: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralFunction
") Derivative;
		Handle_Expr_GeneralFunction Derivative (const Handle_Expr_NamedUnknown & var);
		%feature("autodoc", "	* Returns Derivative of <self> for variable <var> with degree <deg>.

	:param var:
	:type var: Handle_Expr_NamedUnknown &
	:param deg:
	:type deg: Standard_Integer
	:rtype: Handle_Expr_GeneralFunction
") Derivative;
		Handle_Expr_GeneralFunction Derivative (const Handle_Expr_NamedUnknown & var,const Standard_Integer deg);
		%feature("autodoc", "	* Tests if <self> and <func> are similar functions (same name and same used expression).

	:param func:
	:type func: Handle_Expr_GeneralFunction &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralFunction & func);
		%feature("autodoc", "	* Tests if <self> is linear on variable on range <index>

	:param index:
	:type index: Standard_Integer
	:rtype: bool
") IsLinearOnVariable;
		Standard_Boolean IsLinearOnVariable (const Standard_Integer index);
		%feature("autodoc", "	* Returns the function of which <self> is the derivative.

	:rtype: Handle_Expr_GeneralFunction
") Function;
		Handle_Expr_GeneralFunction Function ();
		%feature("autodoc", "	* Returns the degree of derivation of <self>.

	:rtype: int
") Degree;
		Standard_Integer Degree ();
		%feature("autodoc", "	* Returns the derivation variable of <self>.

	:rtype: Handle_Expr_NamedUnknown
") DerivVariable;
		Handle_Expr_NamedUnknown DerivVariable ();
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") GetStringName;
		TCollection_AsciiString GetStringName ();
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralExpression
") Expression;
		Handle_Expr_GeneralExpression Expression ();
		%feature("autodoc", "	:rtype: None
") UpdateExpression;
		void UpdateExpression ();
};


%feature("shadow") Expr_FunctionDerivative::~Expr_FunctionDerivative %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_FunctionDerivative {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_FunctionDerivative {
	Handle_Expr_FunctionDerivative GetHandle() {
	return *(Handle_Expr_FunctionDerivative*) &$self;
	}
};

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
    Expr_FunctionDerivative* GetObject() {
    return (Expr_FunctionDerivative*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_FunctionDerivative::~Handle_Expr_FunctionDerivative %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_FunctionDerivative {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_NamedExpression;
class Expr_NamedExpression : public Expr_GeneralExpression {
	public:
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") GetName;
		const TCollection_AsciiString & GetName ();
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:rtype: None
") SetName;
		void SetName (const TCollection_AsciiString & name);
		%feature("autodoc", "	* Tests if <self> can be shared by one or more expressions or must be copied. This method redefines to a True value the GeneralExpression method.

	:rtype: bool
") IsShareable;
		virtual Standard_Boolean IsShareable ();
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_NamedExpression::~Expr_NamedExpression %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_NamedExpression {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_NamedExpression {
	Handle_Expr_NamedExpression GetHandle() {
	return *(Handle_Expr_NamedExpression*) &$self;
	}
};

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
    Expr_NamedExpression* GetObject() {
    return (Expr_NamedExpression*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_NamedExpression::~Handle_Expr_NamedExpression %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_NamedExpression {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_NamedFunction;
class Expr_NamedFunction : public Expr_GeneralFunction {
	public:
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
		%feature("autodoc", "	* Sets the name <newname> to <self>.

	:param newname:
	:type newname: TCollection_AsciiString &
	:rtype: None
") SetName;
		void SetName (const TCollection_AsciiString & newname);
		%feature("autodoc", "	* Returns the name assigned to <self>

	:rtype: TCollection_AsciiString
") GetName;
		TCollection_AsciiString GetName ();
		%feature("autodoc", "	* Returns the number of variables of <self>.

	:rtype: int
") NbOfVariables;
		Standard_Integer NbOfVariables ();
		%feature("autodoc", "	* Returns the variable denoted by <index> in <self>. Raises OutOfRange if <index> is greater than NbOfVariables of <self>, or less than or equal to zero.

	:param index:
	:type index: Standard_Integer
	:rtype: Handle_Expr_NamedUnknown
") Variable;
		Handle_Expr_NamedUnknown Variable (const Standard_Integer index);
		%feature("autodoc", "	* Computes the value of <self> with the given variables. Raises DimensionMismatch if Length(vars) is different from Length(values).

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param values:
	:type values: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & values);
		%feature("autodoc", "	* Returns a copy of <self> with the same form.

	:rtype: Handle_Expr_GeneralFunction
") Copy;
		Handle_Expr_GeneralFunction Copy ();
		%feature("autodoc", "	* Returns Derivative of <self> for variable <var>.

	:param var:
	:type var: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralFunction
") Derivative;
		Handle_Expr_GeneralFunction Derivative (const Handle_Expr_NamedUnknown & var);
		%feature("autodoc", "	* Returns Derivative of <self> for variable <var> with degree <deg>.

	:param var:
	:type var: Handle_Expr_NamedUnknown &
	:param deg:
	:type deg: Standard_Integer
	:rtype: Handle_Expr_GeneralFunction
") Derivative;
		Handle_Expr_GeneralFunction Derivative (const Handle_Expr_NamedUnknown & var,const Standard_Integer deg);
		%feature("autodoc", "	* Tests if <self> and <func> are similar functions (same name and same used expression).

	:param func:
	:type func: Handle_Expr_GeneralFunction &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralFunction & func);
		%feature("autodoc", "	* Tests if <self> is linear on variable on range <index>

	:param index:
	:type index: Standard_Integer
	:rtype: bool
") IsLinearOnVariable;
		Standard_Boolean IsLinearOnVariable (const Standard_Integer index);
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") GetStringName;
		TCollection_AsciiString GetStringName ();
		%feature("autodoc", "	* Returns equivalent expression of <self>.

	:rtype: Handle_Expr_GeneralExpression
") Expression;
		Handle_Expr_GeneralExpression Expression ();
		%feature("autodoc", "	* Modifies expression of <self>. Warning: Beware of derivatives. See FunctionDerivative

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") SetExpression;
		void SetExpression (const Handle_Expr_GeneralExpression & exp);
};


%feature("shadow") Expr_NamedFunction::~Expr_NamedFunction %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_NamedFunction {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_NamedFunction {
	Handle_Expr_NamedFunction GetHandle() {
	return *(Handle_Expr_NamedFunction*) &$self;
	}
};

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
    Expr_NamedFunction* GetObject() {
    return (Expr_NamedFunction*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_NamedFunction::~Handle_Expr_NamedFunction %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_NamedFunction {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_NumericValue;
class Expr_NumericValue : public Expr_GeneralExpression {
	public:
		%feature("autodoc", "	:param val:
	:type val: float
	:rtype: None
") Expr_NumericValue;
		 Expr_NumericValue (const Standard_Real val);
		%feature("autodoc", "	:rtype: float
") GetValue;
		Standard_Real GetValue ();
		%feature("autodoc", "	:param val:
	:type val: float
	:rtype: None
") SetValue;
		void SetValue (const Standard_Real val);
		%feature("autodoc", "	* Returns the number of sub-expressions contained in <self> ( >= 0)

	:rtype: int
") NbSubExpressions;
		Standard_Integer NbSubExpressions ();
		%feature("autodoc", "	* Returns the <I>-th sub-expression of <self> raises OutOfRange if <I> > NbSubExpressions(me)

	:param I:
	:type I: Standard_Integer
	:rtype: Handle_Expr_GeneralExpression
") SubExpression;
		const Handle_Expr_GeneralExpression & SubExpression (const Standard_Integer I);
		%feature("autodoc", "	* Returns a GeneralExpression after replacement of NamedUnknowns by an associated expression and after values computation.

	:rtype: Handle_Expr_GeneralExpression
") Simplified;
		Handle_Expr_GeneralExpression Simplified ();
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "	* Tests if <self> contains NamedUnknown.

	:rtype: bool
") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns ();
		%feature("autodoc", "	* Tests if <exp> is contained in <self>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "	* Returns the <N>-th derivative on <X> unknown of <self>. Raises OutOfRange if <N> <= 0

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:param N:
	:type N: Standard_Integer
	:rtype: Handle_Expr_GeneralExpression
") NDerivative;
		virtual Handle_Expr_GeneralExpression NDerivative (const Handle_Expr_NamedUnknown & X,const Standard_Integer N);
		%feature("autodoc", "	* Replaces all occurences of <var> with <with> in <self>

	:param var:
	:type var: Handle_Expr_NamedUnknown &
	:param with:
	:type with: Handle_Expr_GeneralExpression &
	:rtype: None
") Replace;
		void Replace (const Handle_Expr_NamedUnknown & var,const Handle_Expr_GeneralExpression & with);
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_NumericValue::~Expr_NumericValue %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_NumericValue {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_NumericValue {
	Handle_Expr_NumericValue GetHandle() {
	return *(Handle_Expr_NumericValue*) &$self;
	}
};

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
    Expr_NumericValue* GetObject() {
    return (Expr_NumericValue*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_NumericValue::~Handle_Expr_NumericValue %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_NumericValue {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_PolyExpression;
class Expr_PolyExpression : public Expr_GeneralExpression {
	public:
		%feature("autodoc", "	* returns the number of operands contained in <self>

	:rtype: int
") NbOperands;
		Standard_Integer NbOperands ();
		%feature("autodoc", "	* Returns the <index>-th operand used in <self>. An exception is raised if index is out of range

	:param index:
	:type index: Standard_Integer
	:rtype: Handle_Expr_GeneralExpression
") Operand;
		const Handle_Expr_GeneralExpression & Operand (const Standard_Integer index);
		%feature("autodoc", "	* Sets the <index>-th operand used in <self>. An exception is raised if <index> is out of range Raises InvalidOperand if <exp> contains <self>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:param index:
	:type index: Standard_Integer
	:rtype: None
") SetOperand;
		void SetOperand (const Handle_Expr_GeneralExpression & exp,const Standard_Integer index);
		%feature("autodoc", "	* returns the number of sub-expressions contained in <self> ( >= 2)

	:rtype: int
") NbSubExpressions;
		Standard_Integer NbSubExpressions ();
		%feature("autodoc", "	* Returns the sub-expression denoted by <I> in <self> Raises OutOfRange if <I> > NbSubExpressions(me)

	:param I:
	:type I: Standard_Integer
	:rtype: Handle_Expr_GeneralExpression
") SubExpression;
		const Handle_Expr_GeneralExpression & SubExpression (const Standard_Integer I);
		%feature("autodoc", "	* Does <self> contains NamedUnknown ?

	:rtype: bool
") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns ();
		%feature("autodoc", "	* Tests if <exp> is contained in <self>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	* Replaces all occurences of <var> with <with> in <self> Raises InvalidOperand if <with> contains <self>.

	:param var:
	:type var: Handle_Expr_NamedUnknown &
	:param with:
	:type with: Handle_Expr_GeneralExpression &
	:rtype: None
") Replace;
		void Replace (const Handle_Expr_NamedUnknown & var,const Handle_Expr_GeneralExpression & with);
		%feature("autodoc", "	* Returns a GeneralExpression after replacement of NamedUnknowns by an associated expression and after values computation.

	:rtype: Handle_Expr_GeneralExpression
") Simplified;
		Handle_Expr_GeneralExpression Simplified ();
};


%feature("shadow") Expr_PolyExpression::~Expr_PolyExpression %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_PolyExpression {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_PolyExpression {
	Handle_Expr_PolyExpression GetHandle() {
	return *(Handle_Expr_PolyExpression*) &$self;
	}
};

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
    Expr_PolyExpression* GetObject() {
    return (Expr_PolyExpression*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_PolyExpression::~Handle_Expr_PolyExpression %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_PolyExpression {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_SingleRelation;
class Expr_SingleRelation : public Expr_GeneralRelation {
	public:
		%feature("autodoc", "	* Defines the first member of the relation

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") SetFirstMember;
		void SetFirstMember (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	* Defines the second member of the relation

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") SetSecondMember;
		void SetSecondMember (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	* Returns the first member of the relation

	:rtype: Handle_Expr_GeneralExpression
") FirstMember;
		Handle_Expr_GeneralExpression FirstMember ();
		%feature("autodoc", "	* Returns the second member of the relation

	:rtype: Handle_Expr_GeneralExpression
") SecondMember;
		Handle_Expr_GeneralExpression SecondMember ();
		%feature("autodoc", "	* Tests if <self> is linear between its NamedUnknowns.

	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "	* Returns the number of relations contained in <self>.

	:rtype: int
") NbOfSubRelations;
		Standard_Integer NbOfSubRelations ();
		%feature("autodoc", "	* Returns the number of SingleRelations contained in <self> (Always 1).

	:rtype: int
") NbOfSingleRelations;
		Standard_Integer NbOfSingleRelations ();
		%feature("autodoc", "	* Returns the relation denoted by <index> in <self>. An exception is raised if index is out of range.

	:param index:
	:type index: Standard_Integer
	:rtype: Handle_Expr_GeneralRelation
") SubRelation;
		Handle_Expr_GeneralRelation SubRelation (const Standard_Integer index);
		%feature("autodoc", "	* Tests if <self> contains <exp>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	* Replaces all occurences of <var> with <with> in <self>.

	:param var:
	:type var: Handle_Expr_NamedUnknown &
	:param with:
	:type with: Handle_Expr_GeneralExpression &
	:rtype: None
") Replace;
		void Replace (const Handle_Expr_NamedUnknown & var,const Handle_Expr_GeneralExpression & with);
};


%feature("shadow") Expr_SingleRelation::~Expr_SingleRelation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_SingleRelation {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_SingleRelation {
	Handle_Expr_SingleRelation GetHandle() {
	return *(Handle_Expr_SingleRelation*) &$self;
	}
};

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
    Expr_SingleRelation* GetObject() {
    return (Expr_SingleRelation*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_SingleRelation::~Handle_Expr_SingleRelation %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_SingleRelation {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_SystemRelation;
class Expr_SystemRelation : public Expr_GeneralRelation {
	public:
		%feature("autodoc", "	* Creates a system with one relation

	:param relation:
	:type relation: Handle_Expr_GeneralRelation &
	:rtype: None
") Expr_SystemRelation;
		 Expr_SystemRelation (const Handle_Expr_GeneralRelation & relation);
		%feature("autodoc", "	* Appends <relation> in the list of components of <self>.

	:param relation:
	:type relation: Handle_Expr_GeneralRelation &
	:rtype: None
") Add;
		void Add (const Handle_Expr_GeneralRelation & relation);
		%feature("autodoc", "	:param relation:
	:type relation: Handle_Expr_GeneralRelation &
	:rtype: None
") Remove;
		void Remove (const Handle_Expr_GeneralRelation & relation);
		%feature("autodoc", "	* Tests if <self> is linear between its NamedUnknowns.

	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "	* Returns the number of relations contained in <self>.

	:rtype: int
") NbOfSubRelations;
		Standard_Integer NbOfSubRelations ();
		%feature("autodoc", "	* Returns the number of SingleRelations contained in <self>.

	:rtype: int
") NbOfSingleRelations;
		Standard_Integer NbOfSingleRelations ();
		%feature("autodoc", "	* Returns the relation denoted by <index> in <self>. An exception is raised if <index> is out of range.

	:param index:
	:type index: Standard_Integer
	:rtype: Handle_Expr_GeneralRelation
") SubRelation;
		Handle_Expr_GeneralRelation SubRelation (const Standard_Integer index);
		%feature("autodoc", "	:rtype: bool
") IsSatisfied;
		Standard_Boolean IsSatisfied ();
		%feature("autodoc", "	* Returns a GeneralRelation after replacement of NamedUnknowns by an associated expression, and after values computation.

	:rtype: Handle_Expr_GeneralRelation
") Simplified;
		Handle_Expr_GeneralRelation Simplified ();
		%feature("autodoc", "	* Replaces NamedUnknowns by associated expressions, and computes values in <self>.

	:rtype: None
") Simplify;
		void Simplify ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralRelation
") Copy;
		Handle_Expr_GeneralRelation Copy ();
		%feature("autodoc", "	* Tests if <self> contains <exp>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	* Replaces all occurences of <var> with <with> in <self>.

	:param var:
	:type var: Handle_Expr_NamedUnknown &
	:param with:
	:type with: Handle_Expr_GeneralExpression &
	:rtype: None
") Replace;
		void Replace (const Handle_Expr_NamedUnknown & var,const Handle_Expr_GeneralExpression & with);
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_SystemRelation::~Expr_SystemRelation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_SystemRelation {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_SystemRelation {
	Handle_Expr_SystemRelation GetHandle() {
	return *(Handle_Expr_SystemRelation*) &$self;
	}
};

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
    Expr_SystemRelation* GetObject() {
    return (Expr_SystemRelation*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_SystemRelation::~Handle_Expr_SystemRelation %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_SystemRelation {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_UnaryExpression;
class Expr_UnaryExpression : public Expr_GeneralExpression {
	public:
		%feature("autodoc", "	* Returns the operand used

	:rtype: Handle_Expr_GeneralExpression
") Operand;
		const Handle_Expr_GeneralExpression & Operand ();
		%feature("autodoc", "	* Sets the operand used Raises InvalidOperand if <exp> contains <self>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") SetOperand;
		void SetOperand (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	* Returns the number of sub-expressions contained in <self> ( >= 0)

	:rtype: int
") NbSubExpressions;
		Standard_Integer NbSubExpressions ();
		%feature("autodoc", "	* Returns the <I>-th sub-expression of <self>. Raises OutOfRange if <I> > NbSubExpressions(me)

	:param I:
	:type I: Standard_Integer
	:rtype: Handle_Expr_GeneralExpression
") SubExpression;
		const Handle_Expr_GeneralExpression & SubExpression (const Standard_Integer I);
		%feature("autodoc", "	* Does <self> contains NamedUnknown ?

	:rtype: bool
") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns ();
		%feature("autodoc", "	* Tests if <exp> is contained in <self>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	* Replaces all occurences of <var> with <with> in <self> Raises InvalidOperand if <with> contains <self>.

	:param var:
	:type var: Handle_Expr_NamedUnknown &
	:param with:
	:type with: Handle_Expr_GeneralExpression &
	:rtype: None
") Replace;
		void Replace (const Handle_Expr_NamedUnknown & var,const Handle_Expr_GeneralExpression & with);
		%feature("autodoc", "	* Returns a GeneralExpression after replacement of NamedUnknowns by an associated expression, and after values computation.

	:rtype: Handle_Expr_GeneralExpression
") Simplified;
		Handle_Expr_GeneralExpression Simplified ();
};


%feature("shadow") Expr_UnaryExpression::~Expr_UnaryExpression %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_UnaryExpression {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_UnaryExpression {
	Handle_Expr_UnaryExpression GetHandle() {
	return *(Handle_Expr_UnaryExpression*) &$self;
	}
};

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
    Expr_UnaryExpression* GetObject() {
    return (Expr_UnaryExpression*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_UnaryExpression::~Handle_Expr_UnaryExpression %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_UnaryExpression {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_Absolute;
class Expr_Absolute : public Expr_UnaryExpression {
	public:
		%feature("autodoc", "	* Creates the Abs of <exp>

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_Absolute;
		 Expr_Absolute (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_Absolute::~Expr_Absolute %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_Absolute {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_Absolute {
	Handle_Expr_Absolute GetHandle() {
	return *(Handle_Expr_Absolute*) &$self;
	}
};

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
    Expr_Absolute* GetObject() {
    return (Expr_Absolute*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_Absolute::~Handle_Expr_Absolute %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_Absolute {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_ArcCosine;
class Expr_ArcCosine : public Expr_UnaryExpression {
	public:
		%feature("autodoc", "	* Creates the Arccos of <exp>

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_ArcCosine;
		 Expr_ArcCosine (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_ArcCosine::~Expr_ArcCosine %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_ArcCosine {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_ArcCosine {
	Handle_Expr_ArcCosine GetHandle() {
	return *(Handle_Expr_ArcCosine*) &$self;
	}
};

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
    Expr_ArcCosine* GetObject() {
    return (Expr_ArcCosine*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_ArcCosine::~Handle_Expr_ArcCosine %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_ArcCosine {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_ArcSine;
class Expr_ArcSine : public Expr_UnaryExpression {
	public:
		%feature("autodoc", "	* Creates the Arcsin of <exp>

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_ArcSine;
		 Expr_ArcSine (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_ArcSine::~Expr_ArcSine %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_ArcSine {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_ArcSine {
	Handle_Expr_ArcSine GetHandle() {
	return *(Handle_Expr_ArcSine*) &$self;
	}
};

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
    Expr_ArcSine* GetObject() {
    return (Expr_ArcSine*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_ArcSine::~Handle_Expr_ArcSine %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_ArcSine {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_ArcTangent;
class Expr_ArcTangent : public Expr_UnaryExpression {
	public:
		%feature("autodoc", "	* Creates the Arctan of <exp>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_ArcTangent;
		 Expr_ArcTangent (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_ArcTangent::~Expr_ArcTangent %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_ArcTangent {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_ArcTangent {
	Handle_Expr_ArcTangent GetHandle() {
	return *(Handle_Expr_ArcTangent*) &$self;
	}
};

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
    Expr_ArcTangent* GetObject() {
    return (Expr_ArcTangent*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_ArcTangent::~Handle_Expr_ArcTangent %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_ArcTangent {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_ArgCosh;
class Expr_ArgCosh : public Expr_UnaryExpression {
	public:
		%feature("autodoc", "	* Creates the ArgCosh of <exp>

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_ArgCosh;
		 Expr_ArgCosh (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_ArgCosh::~Expr_ArgCosh %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_ArgCosh {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_ArgCosh {
	Handle_Expr_ArgCosh GetHandle() {
	return *(Handle_Expr_ArgCosh*) &$self;
	}
};

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
    Expr_ArgCosh* GetObject() {
    return (Expr_ArgCosh*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_ArgCosh::~Handle_Expr_ArgCosh %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_ArgCosh {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_ArgSinh;
class Expr_ArgSinh : public Expr_UnaryExpression {
	public:
		%feature("autodoc", "	* Creates the ArgSinh of <exp>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_ArgSinh;
		 Expr_ArgSinh (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_ArgSinh::~Expr_ArgSinh %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_ArgSinh {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_ArgSinh {
	Handle_Expr_ArgSinh GetHandle() {
	return *(Handle_Expr_ArgSinh*) &$self;
	}
};

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
    Expr_ArgSinh* GetObject() {
    return (Expr_ArgSinh*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_ArgSinh::~Handle_Expr_ArgSinh %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_ArgSinh {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_ArgTanh;
class Expr_ArgTanh : public Expr_UnaryExpression {
	public:
		%feature("autodoc", "	* Creates the Argtanh of <exp>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_ArgTanh;
		 Expr_ArgTanh (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_ArgTanh::~Expr_ArgTanh %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_ArgTanh {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_ArgTanh {
	Handle_Expr_ArgTanh GetHandle() {
	return *(Handle_Expr_ArgTanh*) &$self;
	}
};

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
    Expr_ArgTanh* GetObject() {
    return (Expr_ArgTanh*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_ArgTanh::~Handle_Expr_ArgTanh %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_ArgTanh {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_BinaryFunction;
class Expr_BinaryFunction : public Expr_BinaryExpression {
	public:
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
		%feature("autodoc", "	* Returns the function defining <self>.

	:rtype: Handle_Expr_GeneralFunction
") Function;
		Handle_Expr_GeneralFunction Function ();
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_BinaryFunction::~Expr_BinaryFunction %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_BinaryFunction {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_BinaryFunction {
	Handle_Expr_BinaryFunction GetHandle() {
	return *(Handle_Expr_BinaryFunction*) &$self;
	}
};

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
    Expr_BinaryFunction* GetObject() {
    return (Expr_BinaryFunction*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_BinaryFunction::~Handle_Expr_BinaryFunction %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_BinaryFunction {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_Cosh;
class Expr_Cosh : public Expr_UnaryExpression {
	public:
		%feature("autodoc", "	* Creates the Cosh of <exp>

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_Cosh;
		 Expr_Cosh (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_Cosh::~Expr_Cosh %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_Cosh {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_Cosh {
	Handle_Expr_Cosh GetHandle() {
	return *(Handle_Expr_Cosh*) &$self;
	}
};

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
    Expr_Cosh* GetObject() {
    return (Expr_Cosh*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_Cosh::~Handle_Expr_Cosh %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_Cosh {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_Cosine;
class Expr_Cosine : public Expr_UnaryExpression {
	public:
		%feature("autodoc", "	* Creates the cosine of Exp

	:param Exp:
	:type Exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_Cosine;
		 Expr_Cosine (const Handle_Expr_GeneralExpression & Exp);
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_Cosine::~Expr_Cosine %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_Cosine {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_Cosine {
	Handle_Expr_Cosine GetHandle() {
	return *(Handle_Expr_Cosine*) &$self;
	}
};

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
    Expr_Cosine* GetObject() {
    return (Expr_Cosine*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_Cosine::~Handle_Expr_Cosine %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_Cosine {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_Difference;
class Expr_Difference : public Expr_BinaryExpression {
	public:
		%feature("autodoc", "	* Creates the difference <exp1> - <exp2>.

	:param exp1:
	:type exp1: Handle_Expr_GeneralExpression &
	:param exp2:
	:type exp2: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_Difference;
		 Expr_Difference (const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "	* Returns the <N>-th derivative on <X> unknown of <self>. Raises OutOfRange if <N> <= 0

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:param N:
	:type N: Standard_Integer
	:rtype: Handle_Expr_GeneralExpression
") NDerivative;
		virtual Handle_Expr_GeneralExpression NDerivative (const Handle_Expr_NamedUnknown & X,const Standard_Integer N);
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_Difference::~Expr_Difference %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_Difference {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_Difference {
	Handle_Expr_Difference GetHandle() {
	return *(Handle_Expr_Difference*) &$self;
	}
};

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
    Expr_Difference* GetObject() {
    return (Expr_Difference*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_Difference::~Handle_Expr_Difference %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_Difference {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_Different;
class Expr_Different : public Expr_SingleRelation {
	public:
		%feature("autodoc", "	* Creates the relation <exp1> # <exp2>.

	:param exp1:
	:type exp1: Handle_Expr_GeneralExpression &
	:param exp2:
	:type exp2: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_Different;
		 Expr_Different (const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("autodoc", "	:rtype: bool
") IsSatisfied;
		Standard_Boolean IsSatisfied ();
		%feature("autodoc", "	* Returns a GeneralRelation after replacement of NamedUnknowns by an associated expression, and after values computation.

	:rtype: Handle_Expr_GeneralRelation
") Simplified;
		Handle_Expr_GeneralRelation Simplified ();
		%feature("autodoc", "	* Replaces NamedUnknowns by associated expressions, and computes values in <self>.

	:rtype: None
") Simplify;
		void Simplify ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralRelation
") Copy;
		Handle_Expr_GeneralRelation Copy ();
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_Different::~Expr_Different %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_Different {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_Different {
	Handle_Expr_Different GetHandle() {
	return *(Handle_Expr_Different*) &$self;
	}
};

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
    Expr_Different* GetObject() {
    return (Expr_Different*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_Different::~Handle_Expr_Different %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_Different {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_Division;
class Expr_Division : public Expr_BinaryExpression {
	public:
		%feature("autodoc", "	* Creates the division <exp1>/<exp2>

	:param exp1:
	:type exp1: Handle_Expr_GeneralExpression &
	:param exp2:
	:type exp2: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_Division;
		 Expr_Division (const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_Division::~Expr_Division %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_Division {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_Division {
	Handle_Expr_Division GetHandle() {
	return *(Handle_Expr_Division*) &$self;
	}
};

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
    Expr_Division* GetObject() {
    return (Expr_Division*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_Division::~Handle_Expr_Division %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_Division {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_Equal;
class Expr_Equal : public Expr_SingleRelation {
	public:
		%feature("autodoc", "	* Creates the relation <exp1> = <exp2>.

	:param exp1:
	:type exp1: Handle_Expr_GeneralExpression &
	:param exp2:
	:type exp2: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_Equal;
		 Expr_Equal (const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("autodoc", "	:rtype: bool
") IsSatisfied;
		Standard_Boolean IsSatisfied ();
		%feature("autodoc", "	* returns a GeneralRelation after replacement of NamedUnknowns by an associated expression and after values computation.

	:rtype: Handle_Expr_GeneralRelation
") Simplified;
		Handle_Expr_GeneralRelation Simplified ();
		%feature("autodoc", "	* Replaces NamedUnknowns by an associated expressions and computes values in <self>.

	:rtype: None
") Simplify;
		void Simplify ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralRelation
") Copy;
		Handle_Expr_GeneralRelation Copy ();
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_Equal::~Expr_Equal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_Equal {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_Equal {
	Handle_Expr_Equal GetHandle() {
	return *(Handle_Expr_Equal*) &$self;
	}
};

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
    Expr_Equal* GetObject() {
    return (Expr_Equal*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_Equal::~Handle_Expr_Equal %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_Equal {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_Exponential;
class Expr_Exponential : public Expr_UnaryExpression {
	public:
		%feature("autodoc", "	* Creates the exponential of <exp>

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_Exponential;
		 Expr_Exponential (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_Exponential::~Expr_Exponential %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_Exponential {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_Exponential {
	Handle_Expr_Exponential GetHandle() {
	return *(Handle_Expr_Exponential*) &$self;
	}
};

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
    Expr_Exponential* GetObject() {
    return (Expr_Exponential*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_Exponential::~Handle_Expr_Exponential %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_Exponential {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_Exponentiate;
class Expr_Exponentiate : public Expr_BinaryExpression {
	public:
		%feature("autodoc", "	* Creates the exponential <exp1> ^ <exp2>

	:param exp1:
	:type exp1: Handle_Expr_GeneralExpression &
	:param exp2:
	:type exp2: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_Exponentiate;
		 Expr_Exponentiate (const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_Exponentiate::~Expr_Exponentiate %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_Exponentiate {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_Exponentiate {
	Handle_Expr_Exponentiate GetHandle() {
	return *(Handle_Expr_Exponentiate*) &$self;
	}
};

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
    Expr_Exponentiate* GetObject() {
    return (Expr_Exponentiate*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_Exponentiate::~Handle_Expr_Exponentiate %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_Exponentiate {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_GreaterThan;
class Expr_GreaterThan : public Expr_SingleRelation {
	public:
		%feature("autodoc", "	* Creates the relation <exp1> > <exp2>.

	:param exp1:
	:type exp1: Handle_Expr_GeneralExpression &
	:param exp2:
	:type exp2: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_GreaterThan;
		 Expr_GreaterThan (const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("autodoc", "	:rtype: bool
") IsSatisfied;
		Standard_Boolean IsSatisfied ();
		%feature("autodoc", "	* Returns a GeneralRelation after replacement of NamedUnknowns by an associated expression, and after values computation.

	:rtype: Handle_Expr_GeneralRelation
") Simplified;
		Handle_Expr_GeneralRelation Simplified ();
		%feature("autodoc", "	* Replaces NamedUnknowns by associated expressions, and computes values in <self>.

	:rtype: None
") Simplify;
		void Simplify ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralRelation
") Copy;
		Handle_Expr_GeneralRelation Copy ();
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_GreaterThan::~Expr_GreaterThan %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_GreaterThan {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_GreaterThan {
	Handle_Expr_GreaterThan GetHandle() {
	return *(Handle_Expr_GreaterThan*) &$self;
	}
};

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
    Expr_GreaterThan* GetObject() {
    return (Expr_GreaterThan*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_GreaterThan::~Handle_Expr_GreaterThan %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_GreaterThan {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_GreaterThanOrEqual;
class Expr_GreaterThanOrEqual : public Expr_SingleRelation {
	public:
		%feature("autodoc", "	* Creates the relation <exp1> >= <exp2>.

	:param exp1:
	:type exp1: Handle_Expr_GeneralExpression &
	:param exp2:
	:type exp2: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_GreaterThanOrEqual;
		 Expr_GreaterThanOrEqual (const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("autodoc", "	:rtype: bool
") IsSatisfied;
		Standard_Boolean IsSatisfied ();
		%feature("autodoc", "	* Returns a GeneralRelation after replacement of NamedUnknowns by an associated expression, and after values computation.

	:rtype: Handle_Expr_GeneralRelation
") Simplified;
		Handle_Expr_GeneralRelation Simplified ();
		%feature("autodoc", "	* Replaces NamedUnknowns by associated expressions, and computes values in <self>.

	:rtype: None
") Simplify;
		void Simplify ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralRelation
") Copy;
		Handle_Expr_GeneralRelation Copy ();
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_GreaterThanOrEqual::~Expr_GreaterThanOrEqual %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_GreaterThanOrEqual {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_GreaterThanOrEqual {
	Handle_Expr_GreaterThanOrEqual GetHandle() {
	return *(Handle_Expr_GreaterThanOrEqual*) &$self;
	}
};

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
    Expr_GreaterThanOrEqual* GetObject() {
    return (Expr_GreaterThanOrEqual*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_GreaterThanOrEqual::~Handle_Expr_GreaterThanOrEqual %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_GreaterThanOrEqual {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_LessThan;
class Expr_LessThan : public Expr_SingleRelation {
	public:
		%feature("autodoc", "	* Creates the relation <exp1> < <exp2>.

	:param exp1:
	:type exp1: Handle_Expr_GeneralExpression &
	:param exp2:
	:type exp2: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_LessThan;
		 Expr_LessThan (const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("autodoc", "	:rtype: bool
") IsSatisfied;
		Standard_Boolean IsSatisfied ();
		%feature("autodoc", "	* Returns a GeneralRelation after replacement of NamedUnknowns by an associated expression, and after values computation.

	:rtype: Handle_Expr_GeneralRelation
") Simplified;
		Handle_Expr_GeneralRelation Simplified ();
		%feature("autodoc", "	* Replaces NamedUnknowns by associated expressions, and computes values in <self>.

	:rtype: None
") Simplify;
		void Simplify ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralRelation
") Copy;
		Handle_Expr_GeneralRelation Copy ();
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_LessThan::~Expr_LessThan %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_LessThan {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_LessThan {
	Handle_Expr_LessThan GetHandle() {
	return *(Handle_Expr_LessThan*) &$self;
	}
};

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
    Expr_LessThan* GetObject() {
    return (Expr_LessThan*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_LessThan::~Handle_Expr_LessThan %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_LessThan {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_LessThanOrEqual;
class Expr_LessThanOrEqual : public Expr_SingleRelation {
	public:
		%feature("autodoc", "	* Creates the relation <exp1> <= <exp2>.

	:param exp1:
	:type exp1: Handle_Expr_GeneralExpression &
	:param exp2:
	:type exp2: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_LessThanOrEqual;
		 Expr_LessThanOrEqual (const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("autodoc", "	:rtype: bool
") IsSatisfied;
		Standard_Boolean IsSatisfied ();
		%feature("autodoc", "	* Returns a GeneralRelation after replacement of NamedUnknowns by an associated expression, and after values computation.

	:rtype: Handle_Expr_GeneralRelation
") Simplified;
		Handle_Expr_GeneralRelation Simplified ();
		%feature("autodoc", "	* Replaces NamedUnknowns by associated expressions, and computes values in <self>.

	:rtype: None
") Simplify;
		void Simplify ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralRelation
") Copy;
		Handle_Expr_GeneralRelation Copy ();
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_LessThanOrEqual::~Expr_LessThanOrEqual %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_LessThanOrEqual {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_LessThanOrEqual {
	Handle_Expr_LessThanOrEqual GetHandle() {
	return *(Handle_Expr_LessThanOrEqual*) &$self;
	}
};

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
    Expr_LessThanOrEqual* GetObject() {
    return (Expr_LessThanOrEqual*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_LessThanOrEqual::~Handle_Expr_LessThanOrEqual %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_LessThanOrEqual {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_LogOf10;
class Expr_LogOf10 : public Expr_UnaryExpression {
	public:
		%feature("autodoc", "	* Creates the base 10 logarithm of <exp>

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_LogOf10;
		 Expr_LogOf10 (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_LogOf10::~Expr_LogOf10 %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_LogOf10 {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_LogOf10 {
	Handle_Expr_LogOf10 GetHandle() {
	return *(Handle_Expr_LogOf10*) &$self;
	}
};

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
    Expr_LogOf10* GetObject() {
    return (Expr_LogOf10*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_LogOf10::~Handle_Expr_LogOf10 %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_LogOf10 {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_LogOfe;
class Expr_LogOfe : public Expr_UnaryExpression {
	public:
		%feature("autodoc", "	* Creates the natural logarithm of <exp>

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_LogOfe;
		 Expr_LogOfe (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_LogOfe::~Expr_LogOfe %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_LogOfe {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_LogOfe {
	Handle_Expr_LogOfe GetHandle() {
	return *(Handle_Expr_LogOfe*) &$self;
	}
};

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
    Expr_LogOfe* GetObject() {
    return (Expr_LogOfe*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_LogOfe::~Handle_Expr_LogOfe %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_LogOfe {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_NamedConstant;
class Expr_NamedConstant : public Expr_NamedExpression {
	public:
		%feature("autodoc", "	* Creates a constant value of name <name> and value <value>.

	:param name:
	:type name: TCollection_AsciiString &
	:param value:
	:type value: float
	:rtype: None
") Expr_NamedConstant;
		 Expr_NamedConstant (const TCollection_AsciiString & name,const Standard_Real value);
		%feature("autodoc", "	:rtype: float
") GetValue;
		Standard_Real GetValue ();
		%feature("autodoc", "	* returns the number of sub-expressions contained in <self> (always returns zero)

	:rtype: int
") NbSubExpressions;
		Standard_Integer NbSubExpressions ();
		%feature("autodoc", "	* returns the <I>-th sub-expression of <self> raises OutOfRange

	:param I:
	:type I: Standard_Integer
	:rtype: Handle_Expr_GeneralExpression
") SubExpression;
		const Handle_Expr_GeneralExpression & SubExpression (const Standard_Integer I);
		%feature("autodoc", "	* returns a GeneralExpression after replacement of NamedUnknowns by an associated expression and after values computation.

	:rtype: Handle_Expr_GeneralExpression
") Simplified;
		Handle_Expr_GeneralExpression Simplified ();
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "	* Tests if <self> contains NamedUnknown. (returns always False)

	:rtype: bool
") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns ();
		%feature("autodoc", "	* Tests if <exp> is contained in <self>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "	* Returns the <N>-th derivative on <X> unknown of <self>. Raises OutOfRange if <N> <= 0

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:param N:
	:type N: Standard_Integer
	:rtype: Handle_Expr_GeneralExpression
") NDerivative;
		virtual Handle_Expr_GeneralExpression NDerivative (const Handle_Expr_NamedUnknown & X,const Standard_Integer N);
		%feature("autodoc", "	* Replaces all occurences of <var> with <with> in <self>

	:param var:
	:type var: Handle_Expr_NamedUnknown &
	:param with:
	:type with: Handle_Expr_GeneralExpression &
	:rtype: None
") Replace;
		void Replace (const Handle_Expr_NamedUnknown & var,const Handle_Expr_GeneralExpression & with);
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
};


%feature("shadow") Expr_NamedConstant::~Expr_NamedConstant %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_NamedConstant {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_NamedConstant {
	Handle_Expr_NamedConstant GetHandle() {
	return *(Handle_Expr_NamedConstant*) &$self;
	}
};

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
    Expr_NamedConstant* GetObject() {
    return (Expr_NamedConstant*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_NamedConstant::~Handle_Expr_NamedConstant %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_NamedConstant {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_NamedUnknown;
class Expr_NamedUnknown : public Expr_NamedExpression {
	public:
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:rtype: None
") Expr_NamedUnknown;
		 Expr_NamedUnknown (const TCollection_AsciiString & name);
		%feature("autodoc", "	* Tests if an expression is assigned to <self>.

	:rtype: bool
") IsAssigned;
		Standard_Boolean IsAssigned ();
		%feature("autodoc", "	* If exists, returns the assigned expression. An exception is raised if the expression does not exist.

	:rtype: Handle_Expr_GeneralExpression
") AssignedExpression;
		const Handle_Expr_GeneralExpression & AssignedExpression ();
		%feature("autodoc", "	* Assigns <self> to <exp> expression. Raises exception if <exp> refers to <self>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Assign;
		void Assign (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	* Supresses the assigned expression

	:rtype: None
") Deassign;
		void Deassign ();
		%feature("autodoc", "	* Returns the number of sub-expressions contained in <self> ( >= 0)

	:rtype: int
") NbSubExpressions;
		Standard_Integer NbSubExpressions ();
		%feature("autodoc", "	* Returns the <I>-th sub-expression of <self> raises OutOfRange if <I> > NbSubExpressions(me)

	:param I:
	:type I: Standard_Integer
	:rtype: Handle_Expr_GeneralExpression
") SubExpression;
		const Handle_Expr_GeneralExpression & SubExpression (const Standard_Integer I);
		%feature("autodoc", "	* Returns a GeneralExpression after replacement of NamedUnknowns by an associated expression and after values computation.

	:rtype: Handle_Expr_GeneralExpression
") Simplified;
		Handle_Expr_GeneralExpression Simplified ();
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "	* Tests if <self> contains NamedUnknown.

	:rtype: bool
") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns ();
		%feature("autodoc", "	* Tests if <exp> is contained in <self>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "	* Replaces all occurences of <var> with <with> in <self> Raises InvalidOperand if <with> contains <self>.

	:param var:
	:type var: Handle_Expr_NamedUnknown &
	:param with:
	:type with: Handle_Expr_GeneralExpression &
	:rtype: None
") Replace;
		void Replace (const Handle_Expr_NamedUnknown & var,const Handle_Expr_GeneralExpression & with);
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
};


%feature("shadow") Expr_NamedUnknown::~Expr_NamedUnknown %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_NamedUnknown {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_NamedUnknown {
	Handle_Expr_NamedUnknown GetHandle() {
	return *(Handle_Expr_NamedUnknown*) &$self;
	}
};

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
    Expr_NamedUnknown* GetObject() {
    return (Expr_NamedUnknown*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_NamedUnknown::~Handle_Expr_NamedUnknown %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_NamedUnknown {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_PolyFunction;
class Expr_PolyFunction : public Expr_PolyExpression {
	public:
		%feature("autodoc", "	* Creates <self> as <func>(<exps_1>,<exps_2>,...,<exps_n>)

	:param func:
	:type func: Handle_Expr_GeneralFunction &
	:param exps:
	:type exps: Expr_Array1OfGeneralExpression &
	:rtype: None
") Expr_PolyFunction;
		 Expr_PolyFunction (const Handle_Expr_GeneralFunction & func,const Expr_Array1OfGeneralExpression & exps);
		%feature("autodoc", "	* Returns the function defining <self>.

	:rtype: Handle_Expr_GeneralFunction
") Function;
		Handle_Expr_GeneralFunction Function ();
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_PolyFunction::~Expr_PolyFunction %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_PolyFunction {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_PolyFunction {
	Handle_Expr_PolyFunction GetHandle() {
	return *(Handle_Expr_PolyFunction*) &$self;
	}
};

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
    Expr_PolyFunction* GetObject() {
    return (Expr_PolyFunction*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_PolyFunction::~Handle_Expr_PolyFunction %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_PolyFunction {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_Product;
class Expr_Product : public Expr_PolyExpression {
	public:
		%feature("autodoc", "	* Creates the product of all members of sequence <exps>

	:param exps:
	:type exps: Expr_SequenceOfGeneralExpression &
	:rtype: None
") Expr_Product;
		 Expr_Product (const Expr_SequenceOfGeneralExpression & exps);
		%feature("autodoc", "	* Creates the product of <exp1> and <exp2>.

	:param exp1:
	:type exp1: Handle_Expr_GeneralExpression &
	:param exp2:
	:type exp2: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_Product;
		 Expr_Product (const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_Product::~Expr_Product %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_Product {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_Product {
	Handle_Expr_Product GetHandle() {
	return *(Handle_Expr_Product*) &$self;
	}
};

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
    Expr_Product* GetObject() {
    return (Expr_Product*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_Product::~Handle_Expr_Product %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_Product {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_Sine;
class Expr_Sine : public Expr_UnaryExpression {
	public:
		%feature("autodoc", "	* Creates the sine of <exp>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_Sine;
		 Expr_Sine (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_Sine::~Expr_Sine %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_Sine {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_Sine {
	Handle_Expr_Sine GetHandle() {
	return *(Handle_Expr_Sine*) &$self;
	}
};

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
    Expr_Sine* GetObject() {
    return (Expr_Sine*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_Sine::~Handle_Expr_Sine %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_Sine {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_Sinh;
class Expr_Sinh : public Expr_UnaryExpression {
	public:
		%feature("autodoc", "	* Creates the sinh of <exp>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_Sinh;
		 Expr_Sinh (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_Sinh::~Expr_Sinh %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_Sinh {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_Sinh {
	Handle_Expr_Sinh GetHandle() {
	return *(Handle_Expr_Sinh*) &$self;
	}
};

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
    Expr_Sinh* GetObject() {
    return (Expr_Sinh*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_Sinh::~Handle_Expr_Sinh %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_Sinh {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_Square;
class Expr_Square : public Expr_UnaryExpression {
	public:
		%feature("autodoc", "	* Creates the square of <exp>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_Square;
		 Expr_Square (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_Square::~Expr_Square %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_Square {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_Square {
	Handle_Expr_Square GetHandle() {
	return *(Handle_Expr_Square*) &$self;
	}
};

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
    Expr_Square* GetObject() {
    return (Expr_Square*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_Square::~Handle_Expr_Square %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_Square {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_SquareRoot;
class Expr_SquareRoot : public Expr_UnaryExpression {
	public:
		%feature("autodoc", "	* Creates the square root of <exp>

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_SquareRoot;
		 Expr_SquareRoot (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_SquareRoot::~Expr_SquareRoot %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_SquareRoot {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_SquareRoot {
	Handle_Expr_SquareRoot GetHandle() {
	return *(Handle_Expr_SquareRoot*) &$self;
	}
};

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
    Expr_SquareRoot* GetObject() {
    return (Expr_SquareRoot*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_SquareRoot::~Handle_Expr_SquareRoot %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_SquareRoot {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_Sum;
class Expr_Sum : public Expr_PolyExpression {
	public:
		%feature("autodoc", "	* Creates the sum of all the members of sequence <exps>.

	:param exps:
	:type exps: Expr_SequenceOfGeneralExpression &
	:rtype: None
") Expr_Sum;
		 Expr_Sum (const Expr_SequenceOfGeneralExpression & exps);
		%feature("autodoc", "	* Creates the sum of <exp1> and <exp2>.

	:param exp1:
	:type exp1: Handle_Expr_GeneralExpression &
	:param exp2:
	:type exp2: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_Sum;
		 Expr_Sum (const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "	* Returns the <N>-th derivative on <X> unknown of <self>. Raises OutOfRange if <N> <= 0

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:param N:
	:type N: Standard_Integer
	:rtype: Handle_Expr_GeneralExpression
") NDerivative;
		virtual Handle_Expr_GeneralExpression NDerivative (const Handle_Expr_NamedUnknown & X,const Standard_Integer N);
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_Sum::~Expr_Sum %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_Sum {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_Sum {
	Handle_Expr_Sum GetHandle() {
	return *(Handle_Expr_Sum*) &$self;
	}
};

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
    Expr_Sum* GetObject() {
    return (Expr_Sum*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_Sum::~Handle_Expr_Sum %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_Sum {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_Tangent;
class Expr_Tangent : public Expr_UnaryExpression {
	public:
		%feature("autodoc", "	* Creates the tangent of <exp>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_Tangent;
		 Expr_Tangent (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_Tangent::~Expr_Tangent %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_Tangent {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_Tangent {
	Handle_Expr_Tangent GetHandle() {
	return *(Handle_Expr_Tangent*) &$self;
	}
};

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
    Expr_Tangent* GetObject() {
    return (Expr_Tangent*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_Tangent::~Handle_Expr_Tangent %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_Tangent {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_Tanh;
class Expr_Tanh : public Expr_UnaryExpression {
	public:
		%feature("autodoc", "	* Creates the hyperbolic tangent of <exp>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_Tanh;
		 Expr_Tanh (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_Tanh::~Expr_Tanh %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_Tanh {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_Tanh {
	Handle_Expr_Tanh GetHandle() {
	return *(Handle_Expr_Tanh*) &$self;
	}
};

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
    Expr_Tanh* GetObject() {
    return (Expr_Tanh*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_Tanh::~Handle_Expr_Tanh %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_Tanh {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_UnaryFunction;
class Expr_UnaryFunction : public Expr_UnaryExpression {
	public:
		%feature("autodoc", "	* Creates me as <func>(<exp>). Raises exception if <func> is not unary.

	:param func:
	:type func: Handle_Expr_GeneralFunction &
	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_UnaryFunction;
		 Expr_UnaryFunction (const Handle_Expr_GeneralFunction & func,const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	* Returns the function defining <self>.

	:rtype: Handle_Expr_GeneralFunction
") Function;
		Handle_Expr_GeneralFunction Function ();
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "	* returns the derivative on <X> unknown of <self>.

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_UnaryFunction::~Expr_UnaryFunction %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_UnaryFunction {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_UnaryFunction {
	Handle_Expr_UnaryFunction GetHandle() {
	return *(Handle_Expr_UnaryFunction*) &$self;
	}
};

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
    Expr_UnaryFunction* GetObject() {
    return (Expr_UnaryFunction*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_UnaryFunction::~Handle_Expr_UnaryFunction %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_UnaryFunction {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Expr_UnaryMinus;
class Expr_UnaryMinus : public Expr_UnaryExpression {
	public:
		%feature("autodoc", "	* Create the unary minus of <exp>.

	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Expr_UnaryMinus;
		 Expr_UnaryMinus (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	* Returns a GeneralExpression after a simplification of the arguments of <self>.

	:rtype: Handle_Expr_GeneralExpression
") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "	* Returns a copy of <self> having the same unknowns and functions.

	:rtype: Handle_Expr_GeneralExpression
") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "	* Tests if <self> and <Other> define the same expression. This method does not include any simplification before testing.

	:param Other:
	:type Other: Handle_Expr_GeneralExpression &
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "	:rtype: bool
") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "	* Returns the derivative on <X> unknown of <self>

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:rtype: Handle_Expr_GeneralExpression
") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "	* Returns the <N>-th derivative on <X> unknown of <self>. Raises OutOfRange if <N> <= 0

	:param X:
	:type X: Handle_Expr_NamedUnknown &
	:param N:
	:type N: Standard_Integer
	:rtype: Handle_Expr_GeneralExpression
") NDerivative;
		virtual Handle_Expr_GeneralExpression NDerivative (const Handle_Expr_NamedUnknown & X,const Standard_Integer N);
		%feature("autodoc", "	* Returns the value of <self> (as a Real) by replacement of <vars> by <vals>. Raises NotEvaluable if <self> contains NamedUnknown not in <vars> or NumericError if result cannot be computed.

	:param vars:
	:type vars: Expr_Array1OfNamedUnknown &
	:param vals:
	:type vals: TColStd_Array1OfReal &
	:rtype: float
") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "	* returns a string representing <self> in a readable way.

	:rtype: TCollection_AsciiString
") String;
		TCollection_AsciiString String ();
};


%feature("shadow") Expr_UnaryMinus::~Expr_UnaryMinus %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Expr_UnaryMinus {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Expr_UnaryMinus {
	Handle_Expr_UnaryMinus GetHandle() {
	return *(Handle_Expr_UnaryMinus*) &$self;
	}
};

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
    Expr_UnaryMinus* GetObject() {
    return (Expr_UnaryMinus*)$self->Access();
    }
};
%feature("shadow") Handle_Expr_UnaryMinus::~Handle_Expr_UnaryMinus %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Expr_UnaryMinus {
    void _kill_pointed() {
        delete $self;
    }
};

