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
%module Expr

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

%include Expr_required_python_modules.i
%include Expr_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(expr) Expr;
%nodefaultctor Expr;
class Expr {
	public:
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	static Handle_Expr_GeneralExpression

No detailed docstring for this function.") CopyShare;
		static Handle_Expr_GeneralExpression CopyShare (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbOfFreeVariables;
		static Standard_Integer NbOfFreeVariables (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralRelation)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbOfFreeVariables;
		static Standard_Integer NbOfFreeVariables (const Handle_Expr_GeneralRelation & exp);
		%feature("autodoc", "Args:
	val(Standard_Real)

Returns:
	static Standard_Real

No detailed docstring for this function.") Sign;
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
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Expr_Array1OfGeneralExpression;
		 Expr_Array1OfGeneralExpression (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Handle_Expr_GeneralExpression)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Expr_Array1OfGeneralExpression;
		 Expr_Array1OfGeneralExpression (const Handle_Expr_GeneralExpression & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Handle_Expr_GeneralExpression)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Expr_GeneralExpression & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(Expr_Array1OfGeneralExpression)

Returns:
	Expr_Array1OfGeneralExpression

No detailed docstring for this function.") Assign;
		const Expr_Array1OfGeneralExpression & Assign (const Expr_Array1OfGeneralExpression & Other);
		%feature("autodoc", "Args:
	Other(Expr_Array1OfGeneralExpression)

Returns:
	Expr_Array1OfGeneralExpression

No detailed docstring for this function.") operator=;
		const Expr_Array1OfGeneralExpression & operator = (const Expr_Array1OfGeneralExpression & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Handle_Expr_GeneralExpression)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Expr_GeneralExpression & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Expr_GeneralExpression

No detailed docstring for this function.") Value;
		const Handle_Expr_GeneralExpression & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Expr_GeneralExpression

No detailed docstring for this function.") ChangeValue;
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
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Expr_Array1OfNamedUnknown;
		 Expr_Array1OfNamedUnknown (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Handle_Expr_NamedUnknown)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Expr_Array1OfNamedUnknown;
		 Expr_Array1OfNamedUnknown (const Handle_Expr_NamedUnknown & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Handle_Expr_NamedUnknown)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Expr_NamedUnknown & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(Expr_Array1OfNamedUnknown)

Returns:
	Expr_Array1OfNamedUnknown

No detailed docstring for this function.") Assign;
		const Expr_Array1OfNamedUnknown & Assign (const Expr_Array1OfNamedUnknown & Other);
		%feature("autodoc", "Args:
	Other(Expr_Array1OfNamedUnknown)

Returns:
	Expr_Array1OfNamedUnknown

No detailed docstring for this function.") operator=;
		const Expr_Array1OfNamedUnknown & operator = (const Expr_Array1OfNamedUnknown & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Handle_Expr_NamedUnknown)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Expr_NamedUnknown & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Expr_NamedUnknown

No detailed docstring for this function.") Value;
		const Handle_Expr_NamedUnknown & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Expr_NamedUnknown

No detailed docstring for this function.") ChangeValue;
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
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Expr_Array1OfSingleRelation;
		 Expr_Array1OfSingleRelation (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Handle_Expr_SingleRelation)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Expr_Array1OfSingleRelation;
		 Expr_Array1OfSingleRelation (const Handle_Expr_SingleRelation & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Handle_Expr_SingleRelation)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Expr_SingleRelation & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(Expr_Array1OfSingleRelation)

Returns:
	Expr_Array1OfSingleRelation

No detailed docstring for this function.") Assign;
		const Expr_Array1OfSingleRelation & Assign (const Expr_Array1OfSingleRelation & Other);
		%feature("autodoc", "Args:
	Other(Expr_Array1OfSingleRelation)

Returns:
	Expr_Array1OfSingleRelation

No detailed docstring for this function.") operator=;
		const Expr_Array1OfSingleRelation & operator = (const Expr_Array1OfSingleRelation & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Handle_Expr_SingleRelation)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Expr_SingleRelation & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Expr_SingleRelation

No detailed docstring for this function.") Value;
		const Handle_Expr_SingleRelation & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Expr_SingleRelation

No detailed docstring for this function.") ChangeValue;
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
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

Returns the number of sub-expressions contained  
         in <self> ( >= 0)") NbSubExpressions;
		virtual Standard_Integer NbSubExpressions ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	virtual  Handle_Expr_GeneralExpression

Returns the <I>-th sub-expression of <self>  
         raises OutOfRange if <I> > NbSubExpressions(me)") SubExpression;
		virtual const Handle_Expr_GeneralExpression & SubExpression (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Expr_GeneralExpression

Returns a GeneralExpression after replacement of  
         NamedUnknowns by an associated expression and after  
         values computation.") Simplified;
		virtual Handle_Expr_GeneralExpression Simplified ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Expr_GeneralExpression

Returns a GeneralExpression after a simplification  
         of the arguments of <self>.") ShallowSimplified;
		virtual Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Expr_GeneralExpression

Returns a copy of <self> having the same unknowns and  
         functions.") Copy;
		virtual Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Tests if <self> contains NamedUnknowns.") ContainsUnknowns;
		virtual Standard_Boolean ContainsUnknowns ();
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	virtual Standard_Boolean

Tests if <exp> is contained in <self>.") Contains;
		virtual Standard_Boolean Contains (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Tests if <self> is linear on every NamedUnknown it  
         contains.") IsLinear;
		virtual Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Tests if <self> can be shared by one or more expressions  
         or must be copied. This method returns False as a  
         default value. To be redefined ( especially for  
         NamedUnknown).") IsShareable;
		virtual Standard_Boolean IsShareable ();
		%feature("autodoc", "Args:
	Other(Handle_Expr_GeneralExpression)

Returns:
	virtual Standard_Boolean

Tests if <self> and <Other> define the same expression.  
 Warning: This method does not include any simplification before  
         testing. It could also be very slow; to be used  
         carefully.") IsIdentical;
		virtual Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)

Returns:
	virtual Handle_Expr_GeneralExpression

Returns the derivative on <X> unknown of <self>") Derivative;
		virtual Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)
	N(Standard_Integer)

Returns:
	virtual Handle_Expr_GeneralExpression

Returns the <N>-th derivative on <X> unknown of <self>.  
         Raise OutOfRange if N <= 0") NDerivative;
		virtual Handle_Expr_GeneralExpression NDerivative (const Handle_Expr_NamedUnknown & X,const Standard_Integer N);
		%feature("autodoc", "Args:
	var(Handle_Expr_NamedUnknown)
	with(Handle_Expr_GeneralExpression)

Returns:
	virtual void

Replaces all occurences of <var> with copies of <with>  
         in <self>. Copies of <with> are made with the Copy() method.  
         Raises InvalidOperand if <with> contains <self>.") Replace;
		virtual void Replace (const Handle_Expr_NamedUnknown & var,const Handle_Expr_GeneralExpression & with);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	vals(TColStd_Array1OfReal)

Returns:
	virtual Standard_Real

Returns the value of <self> (as a Real) by  
         replacement of <vars> by <vals>.  
         Raises NotEvaluable if <self> contains NamedUnknown not  
         in <vars> or NumericError if result cannot be computed.") Evaluate;
		virtual Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the value of <self> (as a Real) by  
         replacement of <vars> by <vals>.  
         Raises NotEvaluable if <self> contains NamedUnknown not  
         in <vars> or NumericError if result cannot be computed.") EvaluateNumeric;
		Standard_Real EvaluateNumeric ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

Returns the number of variables of <self>.") NbOfVariables;
		virtual Standard_Integer NbOfVariables ();
		%feature("autodoc", "Args:
	index(Standard_Integer)

Returns:
	virtual Handle_Expr_NamedUnknown

Returns the variable denoted by <index> in <self>.  
         Raises OutOfRange if index > NbOfVariables.") Variable;
		virtual Handle_Expr_NamedUnknown Variable (const Standard_Integer index);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Expr_GeneralFunction

Returns a copy of <self> with the same form.") Copy;
		virtual Handle_Expr_GeneralFunction Copy ();
		%feature("autodoc", "Args:
	var(Handle_Expr_NamedUnknown)

Returns:
	virtual Handle_Expr_GeneralFunction

Returns Derivative of <self> for variable <var>.") Derivative;
		virtual Handle_Expr_GeneralFunction Derivative (const Handle_Expr_NamedUnknown & var);
		%feature("autodoc", "Args:
	var(Handle_Expr_NamedUnknown)
	deg(Standard_Integer)

Returns:
	virtual Handle_Expr_GeneralFunction

Returns Derivative of <self> for variable <var> with  
         degree <deg>.") Derivative;
		virtual Handle_Expr_GeneralFunction Derivative (const Handle_Expr_NamedUnknown & var,const Standard_Integer deg);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	vals(TColStd_Array1OfReal)

Returns:
	virtual Standard_Real

Computes the value of <self> with the given variables.  
         Raises NotEvaluable if <vars> does not match all variables  
         of <self>.") Evaluate;
		virtual Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "Args:
	func(Handle_Expr_GeneralFunction)

Returns:
	virtual Standard_Boolean

Tests if <self> and <func> are similar functions (same  
         name and same used expression).") IsIdentical;
		virtual Standard_Boolean IsIdentical (const Handle_Expr_GeneralFunction & func);
		%feature("autodoc", "Args:
	index(Standard_Integer)

Returns:
	virtual Standard_Boolean

Tests if <self> is linear on variable on range <index>") IsLinearOnVariable;
		virtual Standard_Boolean IsLinearOnVariable (const Standard_Integer index);
		%feature("autodoc", "Args:
	None
Returns:
	virtual TCollection_AsciiString

No detailed docstring for this function.") GetStringName;
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
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns the current status of the relation") IsSatisfied;
		virtual Standard_Boolean IsSatisfied ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Tests if <self> is linear between its NamedUnknowns.") IsLinear;
		virtual Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Expr_GeneralRelation

Returns a GeneralRelation after replacement of  
         NamedUnknowns by an associated expression, and after  
         values computation.") Simplified;
		virtual Handle_Expr_GeneralRelation Simplified ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Replaces NamedUnknowns by associated expressions,  
         and computes values in <self>.") Simplify;
		virtual void Simplify ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Expr_GeneralRelation

Returns a copy of <self> having the same unknowns and  
         functions.") Copy;
		virtual Handle_Expr_GeneralRelation Copy ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

Returns the number of relations contained in <self>.") NbOfSubRelations;
		virtual Standard_Integer NbOfSubRelations ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

Returns the number of SingleRelations contained in  
         <self>.") NbOfSingleRelations;
		virtual Standard_Integer NbOfSingleRelations ();
		%feature("autodoc", "Args:
	index(Standard_Integer)

Returns:
	virtual Handle_Expr_GeneralRelation

Returns the relation denoted by <index> in <self>.  
         An exception is raised if <index> is out of range.") SubRelation;
		virtual Handle_Expr_GeneralRelation SubRelation (const Standard_Integer index);
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	virtual Standard_Boolean

Tests if <exp> contains <var>.") Contains;
		virtual Standard_Boolean Contains (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	var(Handle_Expr_NamedUnknown)
	with(Handle_Expr_GeneralExpression)

Returns:
	virtual void

Replaces all occurences of <var> with <with> in <self>.") Replace;
		virtual void Replace (const Handle_Expr_NamedUnknown & var,const Handle_Expr_GeneralExpression & with);
		%feature("autodoc", "Args:
	None
Returns:
	virtual TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	K1(Handle_Expr_NamedUnknown)
	K2(Standard_Integer)
	n1(TCollection_MapNodePtr)
	n2(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") Expr_IndexedMapNodeOfMapOfNamedUnknown;
		 Expr_IndexedMapNodeOfMapOfNamedUnknown (const Handle_Expr_NamedUnknown & K1,const Standard_Integer K2,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_NamedUnknown

No detailed docstring for this function.") Key1;
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
            		%feature("autodoc", "Args:
	None
Returns:
	TCollection_MapNodePtr

No detailed docstring for this function.") Next2;
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
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") Expr_MapOfNamedUnknown;
		 Expr_MapOfNamedUnknown (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(Expr_MapOfNamedUnknown)

Returns:
	Expr_MapOfNamedUnknown

No detailed docstring for this function.") Assign;
		Expr_MapOfNamedUnknown & Assign (const Expr_MapOfNamedUnknown & Other);
		%feature("autodoc", "Args:
	Other(Expr_MapOfNamedUnknown)

Returns:
	Expr_MapOfNamedUnknown

No detailed docstring for this function.") operator=;
		Expr_MapOfNamedUnknown & operator = (const Expr_MapOfNamedUnknown & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Handle_Expr_NamedUnknown)

Returns:
	Standard_Integer

No detailed docstring for this function.") Add;
		Standard_Integer Add (const Handle_Expr_NamedUnknown & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	K(Handle_Expr_NamedUnknown)

Returns:
	None

No detailed docstring for this function.") Substitute;
		void Substitute (const Standard_Integer I,const Handle_Expr_NamedUnknown & K);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "Args:
	K(Handle_Expr_NamedUnknown)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const Handle_Expr_NamedUnknown & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Handle_Expr_NamedUnknown

No detailed docstring for this function.") FindKey;
		const Handle_Expr_NamedUnknown & FindKey (const Standard_Integer I);
		%feature("autodoc", "Args:
	K(Handle_Expr_NamedUnknown)

Returns:
	Standard_Integer

No detailed docstring for this function.") FindIndex;
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
		%feature("autodoc", "Args:
	rel(Handle_Expr_GeneralRelation)

Returns:
	None

Creates an iterator on every NamedUnknown contained in  
         <rel>.") Expr_RUIterator;
		 Expr_RUIterator (const Handle_Expr_GeneralRelation & rel);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns False if on other unknown remains.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_NamedUnknown

Returns current NamedUnknown.  
         Raises exception if no more unknowns remain.") Value;
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
		%feature("autodoc", "Args:
	rel(Handle_Expr_GeneralRelation)

Returns:
	None

No detailed docstring for this function.") Expr_RelationIterator;
		 Expr_RelationIterator (const Handle_Expr_GeneralRelation & rel);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns False if no other relation remains.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_SingleRelation

Returns current basic relation.  
         Exception is raised if no more relation remains.") Value;
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
		%feature("autodoc", "Args:
	I(Handle_Expr_GeneralExpression)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Expr_SequenceNodeOfSequenceOfGeneralExpression;
		 Expr_SequenceNodeOfSequenceOfGeneralExpression (const Handle_Expr_GeneralExpression & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(Handle_Expr_GeneralRelation)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Expr_SequenceNodeOfSequenceOfGeneralRelation;
		 Expr_SequenceNodeOfSequenceOfGeneralRelation (const Handle_Expr_GeneralRelation & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralRelation

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Expr_SequenceOfGeneralExpression;
		 Expr_SequenceOfGeneralExpression ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Expr_SequenceOfGeneralExpression)

Returns:
	Expr_SequenceOfGeneralExpression

No detailed docstring for this function.") Assign;
		const Expr_SequenceOfGeneralExpression & Assign (const Expr_SequenceOfGeneralExpression & Other);
		%feature("autodoc", "Args:
	Other(Expr_SequenceOfGeneralExpression)

Returns:
	Expr_SequenceOfGeneralExpression

No detailed docstring for this function.") operator=;
		const Expr_SequenceOfGeneralExpression & operator = (const Expr_SequenceOfGeneralExpression & Other);
		%feature("autodoc", "Args:
	T(Handle_Expr_GeneralExpression)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Expr_GeneralExpression & T);
		%feature("autodoc", "Args:
	S(Expr_SequenceOfGeneralExpression)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Expr_SequenceOfGeneralExpression & S);
		%feature("autodoc", "Args:
	T(Handle_Expr_GeneralExpression)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Expr_GeneralExpression & T);
		%feature("autodoc", "Args:
	S(Expr_SequenceOfGeneralExpression)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Expr_SequenceOfGeneralExpression & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Expr_GeneralExpression)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Expr_GeneralExpression & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Expr_SequenceOfGeneralExpression)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Expr_SequenceOfGeneralExpression & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Expr_GeneralExpression)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Expr_GeneralExpression & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Expr_SequenceOfGeneralExpression)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Expr_SequenceOfGeneralExpression & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

No detailed docstring for this function.") First;
		const Handle_Expr_GeneralExpression & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

No detailed docstring for this function.") Last;
		const Handle_Expr_GeneralExpression & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Expr_SequenceOfGeneralExpression)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Expr_SequenceOfGeneralExpression & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Expr_GeneralExpression

No detailed docstring for this function.") Value;
		const Handle_Expr_GeneralExpression & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_Expr_GeneralExpression)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Expr_GeneralExpression & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Expr_GeneralExpression

No detailed docstring for this function.") ChangeValue;
		Handle_Expr_GeneralExpression & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Expr_SequenceOfGeneralRelation;
		 Expr_SequenceOfGeneralRelation ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Expr_SequenceOfGeneralRelation)

Returns:
	Expr_SequenceOfGeneralRelation

No detailed docstring for this function.") Assign;
		const Expr_SequenceOfGeneralRelation & Assign (const Expr_SequenceOfGeneralRelation & Other);
		%feature("autodoc", "Args:
	Other(Expr_SequenceOfGeneralRelation)

Returns:
	Expr_SequenceOfGeneralRelation

No detailed docstring for this function.") operator=;
		const Expr_SequenceOfGeneralRelation & operator = (const Expr_SequenceOfGeneralRelation & Other);
		%feature("autodoc", "Args:
	T(Handle_Expr_GeneralRelation)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Expr_GeneralRelation & T);
		%feature("autodoc", "Args:
	S(Expr_SequenceOfGeneralRelation)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Expr_SequenceOfGeneralRelation & S);
		%feature("autodoc", "Args:
	T(Handle_Expr_GeneralRelation)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Expr_GeneralRelation & T);
		%feature("autodoc", "Args:
	S(Expr_SequenceOfGeneralRelation)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Expr_SequenceOfGeneralRelation & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Expr_GeneralRelation)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Expr_GeneralRelation & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Expr_SequenceOfGeneralRelation)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Expr_SequenceOfGeneralRelation & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Expr_GeneralRelation)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Expr_GeneralRelation & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Expr_SequenceOfGeneralRelation)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Expr_SequenceOfGeneralRelation & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralRelation

No detailed docstring for this function.") First;
		const Handle_Expr_GeneralRelation & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralRelation

No detailed docstring for this function.") Last;
		const Handle_Expr_GeneralRelation & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Expr_SequenceOfGeneralRelation)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Expr_SequenceOfGeneralRelation & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Expr_GeneralRelation

No detailed docstring for this function.") Value;
		const Handle_Expr_GeneralRelation & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_Expr_GeneralRelation)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Expr_GeneralRelation & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Expr_GeneralRelation

No detailed docstring for this function.") ChangeValue;
		Handle_Expr_GeneralRelation & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
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
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	None

No detailed docstring for this function.") Expr_UnknownIterator;
		 Expr_UnknownIterator (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_NamedUnknown

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

No detailed docstring for this function.") FirstOperand;
		const Handle_Expr_GeneralExpression & FirstOperand ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

No detailed docstring for this function.") SecondOperand;
		const Handle_Expr_GeneralExpression & SecondOperand ();
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	None

Sets first operand of <self>  
         Raises InvalidOperand if exp = me") SetFirstOperand;
		void SetFirstOperand (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	None

Sets second operand of <self>  
         Raises InvalidOperand if <exp> contains <self>.") SetSecondOperand;
		void SetSecondOperand (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns the number of sub-expressions contained  
         in <self> ( >= 0)") NbSubExpressions;
		Standard_Integer NbSubExpressions ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Handle_Expr_GeneralExpression

returns the <I>-th sub-expression of <self>  
         raises OutOfRange if <I> > NbSubExpressions(me)") SubExpression;
		const Handle_Expr_GeneralExpression & SubExpression (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Does <self> contain NamedUnknown ?") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns ();
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <self> contains <exp>.") Contains;
		Standard_Boolean Contains (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	var(Handle_Expr_NamedUnknown)
	with(Handle_Expr_GeneralExpression)

Returns:
	None

Replaces all occurences of <var> with <with> in <self>.  
         Raises InvalidOperand if <with> contains <self>.") Replace;
		void Replace (const Handle_Expr_NamedUnknown & var,const Handle_Expr_GeneralExpression & with);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after replacement of  
         NamedUnknowns by an associated expression and after  
         values computation.") Simplified;
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
		%feature("autodoc", "Args:
	func(Handle_Expr_GeneralFunction)
	withX(Handle_Expr_NamedUnknown)
	deg(Standard_Integer)

Returns:
	None

Creates a FunctionDerivative of degree <deg> relative  
         to the <withX> variable.  
         Raises OutOfRange if <deg> lower or equal to zero.") Expr_FunctionDerivative;
		 Expr_FunctionDerivative (const Handle_Expr_GeneralFunction & func,const Handle_Expr_NamedUnknown & withX,const Standard_Integer deg);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of variables of <self>.") NbOfVariables;
		Standard_Integer NbOfVariables ();
		%feature("autodoc", "Args:
	index(Standard_Integer)

Returns:
	Handle_Expr_NamedUnknown

Returns the variable denoted by <index> in <self>.  
         Raises OutOfRange if <index> greater than  
         NbOfVariables of <self>.") Variable;
		Handle_Expr_NamedUnknown Variable (const Standard_Integer index);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	values(TColStd_Array1OfReal)

Returns:
	Standard_Real

Computes the value of <self> with the given variables.  
         Raises DimensionMismatch if Length(vars) is different from  
         Length(values).") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & values);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralFunction

Returns a copy of <self> with the same form.") Copy;
		Handle_Expr_GeneralFunction Copy ();
		%feature("autodoc", "Args:
	var(Handle_Expr_NamedUnknown)

Returns:
	Handle_Expr_GeneralFunction

Returns Derivative of <self> for variable <var>.") Derivative;
		Handle_Expr_GeneralFunction Derivative (const Handle_Expr_NamedUnknown & var);
		%feature("autodoc", "Args:
	var(Handle_Expr_NamedUnknown)
	deg(Standard_Integer)

Returns:
	Handle_Expr_GeneralFunction

Returns Derivative of <self> for variable <var> with  
         degree <deg>.") Derivative;
		Handle_Expr_GeneralFunction Derivative (const Handle_Expr_NamedUnknown & var,const Standard_Integer deg);
		%feature("autodoc", "Args:
	func(Handle_Expr_GeneralFunction)

Returns:
	Standard_Boolean

Tests if <self> and <func> are similar functions (same  
         name and same used expression).") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralFunction & func);
		%feature("autodoc", "Args:
	index(Standard_Integer)

Returns:
	Standard_Boolean

Tests if <self> is linear on variable on range <index>") IsLinearOnVariable;
		Standard_Boolean IsLinearOnVariable (const Standard_Integer index);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralFunction

Returns the function of which <self> is the derivative.") Function;
		Handle_Expr_GeneralFunction Function ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the degree of derivation of <self>.") Degree;
		Standard_Integer Degree ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_NamedUnknown

Returns the derivation variable of <self>.") DerivVariable;
		Handle_Expr_NamedUnknown DerivVariable ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

No detailed docstring for this function.") GetStringName;
		TCollection_AsciiString GetStringName ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

No detailed docstring for this function.") Expression;
		Handle_Expr_GeneralExpression Expression ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") UpdateExpression;
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
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

No detailed docstring for this function.") GetName;
		const TCollection_AsciiString & GetName ();
		%feature("autodoc", "Args:
	name(TCollection_AsciiString)

Returns:
	None

No detailed docstring for this function.") SetName;
		void SetName (const TCollection_AsciiString & name);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Tests if <self> can be shared by one or more expressions  
         or must be copied. This method redefines to a True  
         value the GeneralExpression method.") IsShareable;
		virtual Standard_Boolean IsShareable ();
		%feature("autodoc", "Args:
	Other(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <self> and <Other> define the same expression.  
         This method does not include any simplification before  
         testing.") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	name(TCollection_AsciiString)
	exp(Handle_Expr_GeneralExpression)
	vars(Expr_Array1OfNamedUnknown)

Returns:
	None

Creates a function of given variables <vars> with name  
         <name> defined by the expression <exp>.") Expr_NamedFunction;
		 Expr_NamedFunction (const TCollection_AsciiString & name,const Handle_Expr_GeneralExpression & exp,const Expr_Array1OfNamedUnknown & vars);
		%feature("autodoc", "Args:
	newname(TCollection_AsciiString)

Returns:
	None

Sets the name <newname> to <self>.") SetName;
		void SetName (const TCollection_AsciiString & newname);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns the name assigned to <self>") GetName;
		TCollection_AsciiString GetName ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of variables of <self>.") NbOfVariables;
		Standard_Integer NbOfVariables ();
		%feature("autodoc", "Args:
	index(Standard_Integer)

Returns:
	Handle_Expr_NamedUnknown

Returns the variable denoted by <index> in <self>.  
         Raises OutOfRange if <index> is greater than  
         NbOfVariables of <self>, or less than or equal to zero.") Variable;
		Handle_Expr_NamedUnknown Variable (const Standard_Integer index);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	values(TColStd_Array1OfReal)

Returns:
	Standard_Real

Computes the value of <self> with the given variables.  
         Raises DimensionMismatch if Length(vars) is different from  
         Length(values).") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & values);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralFunction

Returns a copy of <self> with the same form.") Copy;
		Handle_Expr_GeneralFunction Copy ();
		%feature("autodoc", "Args:
	var(Handle_Expr_NamedUnknown)

Returns:
	Handle_Expr_GeneralFunction

Returns Derivative of <self> for variable <var>.") Derivative;
		Handle_Expr_GeneralFunction Derivative (const Handle_Expr_NamedUnknown & var);
		%feature("autodoc", "Args:
	var(Handle_Expr_NamedUnknown)
	deg(Standard_Integer)

Returns:
	Handle_Expr_GeneralFunction

Returns Derivative of <self> for variable <var> with  
         degree <deg>.") Derivative;
		Handle_Expr_GeneralFunction Derivative (const Handle_Expr_NamedUnknown & var,const Standard_Integer deg);
		%feature("autodoc", "Args:
	func(Handle_Expr_GeneralFunction)

Returns:
	Standard_Boolean

Tests if <self> and <func> are similar functions (same  
         name and same used expression).") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralFunction & func);
		%feature("autodoc", "Args:
	index(Standard_Integer)

Returns:
	Standard_Boolean

Tests if <self> is linear on variable on range <index>") IsLinearOnVariable;
		Standard_Boolean IsLinearOnVariable (const Standard_Integer index);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

No detailed docstring for this function.") GetStringName;
		TCollection_AsciiString GetStringName ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns equivalent expression of <self>.") Expression;
		Handle_Expr_GeneralExpression Expression ();
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	None

Modifies expression of <self>.  
 Warning: Beware of derivatives. See FunctionDerivative") SetExpression;
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
		%feature("autodoc", "Args:
	val(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Expr_NumericValue;
		 Expr_NumericValue (const Standard_Real val);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") GetValue;
		Standard_Real GetValue ();
		%feature("autodoc", "Args:
	val(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Real val);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of sub-expressions contained  
         in <self> ( >= 0)") NbSubExpressions;
		Standard_Integer NbSubExpressions ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Handle_Expr_GeneralExpression

Returns the <I>-th sub-expression of <self>  
         raises OutOfRange if <I> > NbSubExpressions(me)") SubExpression;
		const Handle_Expr_GeneralExpression & SubExpression (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after replacement of  
         NamedUnknowns by an associated expression and after  
         values computation.") Simplified;
		Handle_Expr_GeneralExpression Simplified ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after a simplification  
         of the arguments of <self>.") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Tests if <self> contains NamedUnknown.") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns ();
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <exp> is contained in <self>.") Contains;
		Standard_Boolean Contains (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	Other(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <self> and <Other> define the same expression.  
         This method does not include any simplification before  
         testing.") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)

Returns:
	Handle_Expr_GeneralExpression

Returns the derivative on <X> unknown of <self>") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)
	N(Standard_Integer)

Returns:
	virtual Handle_Expr_GeneralExpression

Returns the <N>-th derivative on <X> unknown of <self>.  
         Raises OutOfRange if <N> <= 0") NDerivative;
		virtual Handle_Expr_GeneralExpression NDerivative (const Handle_Expr_NamedUnknown & X,const Standard_Integer N);
		%feature("autodoc", "Args:
	var(Handle_Expr_NamedUnknown)
	with(Handle_Expr_GeneralExpression)

Returns:
	None

Replaces all occurences of <var> with <with> in <self>") Replace;
		void Replace (const Handle_Expr_NamedUnknown & var,const Handle_Expr_GeneralExpression & with);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	vals(TColStd_Array1OfReal)

Returns:
	Standard_Real

Returns the value of <self> (as a Real) by  
         replacement of <vars> by <vals>.") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns the number of operands contained in <self>") NbOperands;
		Standard_Integer NbOperands ();
		%feature("autodoc", "Args:
	index(Standard_Integer)

Returns:
	Handle_Expr_GeneralExpression

Returns the <index>-th operand used in <self>.  
         An exception is raised if index is out of range") Operand;
		const Handle_Expr_GeneralExpression & Operand (const Standard_Integer index);
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)
	index(Standard_Integer)

Returns:
	None

Sets the <index>-th operand used in <self>.  
         An exception is raised if <index> is out of range  
         Raises InvalidOperand if <exp> contains <self>.") SetOperand;
		void SetOperand (const Handle_Expr_GeneralExpression & exp,const Standard_Integer index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns the number of sub-expressions contained  
         in <self> ( >= 2)") NbSubExpressions;
		Standard_Integer NbSubExpressions ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Handle_Expr_GeneralExpression

Returns the sub-expression denoted by <I> in <self>  
         Raises OutOfRange if <I> > NbSubExpressions(me)") SubExpression;
		const Handle_Expr_GeneralExpression & SubExpression (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Does <self> contains NamedUnknown ?") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns ();
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <exp> is contained in <self>.") Contains;
		Standard_Boolean Contains (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	var(Handle_Expr_NamedUnknown)
	with(Handle_Expr_GeneralExpression)

Returns:
	None

Replaces all occurences of <var> with <with> in <self>  
         Raises InvalidOperand if <with> contains <self>.") Replace;
		void Replace (const Handle_Expr_NamedUnknown & var,const Handle_Expr_GeneralExpression & with);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after replacement of  
         NamedUnknowns by an associated expression and after  
         values computation.") Simplified;
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
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	None

Defines the first member of the relation") SetFirstMember;
		void SetFirstMember (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	None

Defines the second member of the relation") SetSecondMember;
		void SetSecondMember (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns the first member of the relation") FirstMember;
		Handle_Expr_GeneralExpression FirstMember ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns the second member of the relation") SecondMember;
		Handle_Expr_GeneralExpression SecondMember ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Tests if <self> is linear between its NamedUnknowns.") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of relations contained in <self>.") NbOfSubRelations;
		Standard_Integer NbOfSubRelations ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of SingleRelations contained in  
         <self> (Always 1).") NbOfSingleRelations;
		Standard_Integer NbOfSingleRelations ();
		%feature("autodoc", "Args:
	index(Standard_Integer)

Returns:
	Handle_Expr_GeneralRelation

Returns the relation denoted by <index> in <self>.  
         An exception is raised if index is out of range.") SubRelation;
		Handle_Expr_GeneralRelation SubRelation (const Standard_Integer index);
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <self> contains <exp>.") Contains;
		Standard_Boolean Contains (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	var(Handle_Expr_NamedUnknown)
	with(Handle_Expr_GeneralExpression)

Returns:
	None

Replaces all occurences of <var> with <with> in <self>.") Replace;
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
		%feature("autodoc", "Args:
	relation(Handle_Expr_GeneralRelation)

Returns:
	None

Creates a system with one relation") Expr_SystemRelation;
		 Expr_SystemRelation (const Handle_Expr_GeneralRelation & relation);
		%feature("autodoc", "Args:
	relation(Handle_Expr_GeneralRelation)

Returns:
	None

Appends <relation> in the list of components of <self>.") Add;
		void Add (const Handle_Expr_GeneralRelation & relation);
		%feature("autodoc", "Args:
	relation(Handle_Expr_GeneralRelation)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Handle_Expr_GeneralRelation & relation);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Tests if <self> is linear between its NamedUnknowns.") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of relations contained in <self>.") NbOfSubRelations;
		Standard_Integer NbOfSubRelations ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of SingleRelations contained in  
         <self>.") NbOfSingleRelations;
		Standard_Integer NbOfSingleRelations ();
		%feature("autodoc", "Args:
	index(Standard_Integer)

Returns:
	Handle_Expr_GeneralRelation

Returns the relation denoted by <index> in <self>.  
         An exception is raised if <index> is out of range.") SubRelation;
		Handle_Expr_GeneralRelation SubRelation (const Standard_Integer index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsSatisfied;
		Standard_Boolean IsSatisfied ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralRelation

Returns a GeneralRelation after replacement of  
         NamedUnknowns by an associated expression, and after  
         values computation.") Simplified;
		Handle_Expr_GeneralRelation Simplified ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Replaces NamedUnknowns by associated expressions,  
         and computes values in <self>.") Simplify;
		void Simplify ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralRelation

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralRelation Copy ();
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <self> contains <exp>.") Contains;
		Standard_Boolean Contains (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	var(Handle_Expr_NamedUnknown)
	with(Handle_Expr_GeneralExpression)

Returns:
	None

Replaces all occurences of <var> with <with> in <self>.") Replace;
		void Replace (const Handle_Expr_NamedUnknown & var,const Handle_Expr_GeneralExpression & with);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns the operand used") Operand;
		const Handle_Expr_GeneralExpression & Operand ();
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	None

Sets the operand used  
         Raises InvalidOperand if <exp> contains <self>.") SetOperand;
		void SetOperand (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of sub-expressions contained  
         in <self> ( >= 0)") NbSubExpressions;
		Standard_Integer NbSubExpressions ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Handle_Expr_GeneralExpression

Returns the <I>-th sub-expression of <self>.  
         Raises OutOfRange if <I> > NbSubExpressions(me)") SubExpression;
		const Handle_Expr_GeneralExpression & SubExpression (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Does <self> contains NamedUnknown ?") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns ();
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <exp> is contained in <self>.") Contains;
		Standard_Boolean Contains (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	var(Handle_Expr_NamedUnknown)
	with(Handle_Expr_GeneralExpression)

Returns:
	None

Replaces all occurences of <var> with <with> in <self>  
         Raises InvalidOperand if <with> contains <self>.") Replace;
		void Replace (const Handle_Expr_NamedUnknown & var,const Handle_Expr_GeneralExpression & with);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after replacement of  
         NamedUnknowns by an associated expression, and after  
         values computation.") Simplified;
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
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	None

Creates the Abs of <exp>") Expr_Absolute;
		 Expr_Absolute (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after a simplification  
         of the arguments of <self>.") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "Args:
	Other(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <self> and <Other> define the same expression.  
         This method does not include any simplification before  
         testing.") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)

Returns:
	Handle_Expr_GeneralExpression

Returns the derivative on <X> unknown of <self>") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	vals(TColStd_Array1OfReal)

Returns:
	Standard_Real

Returns the value of <self> (as a Real) by  
         replacement of <vars> by <vals>.  
         Raises NotEvaluable if <self> contains NamedUnknown not  
         in <vars> or NumericError if result cannot be computed.") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	None

Creates the Arccos of <exp>") Expr_ArcCosine;
		 Expr_ArcCosine (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after a simplification  
         of the arguments of <self>.") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "Args:
	Other(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <self> and <Other> define the same expression.  
         This method does not include any simplification before  
         testing.") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)

Returns:
	Handle_Expr_GeneralExpression

Returns the derivative on <X> unknown of <self>.") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	vals(TColStd_Array1OfReal)

Returns:
	Standard_Real

Returns the value of <self> (as a Real) by  
         replacement of <vars> by <vals>.  
         Raises NotEvaluable if <self> contains NamedUnknown not  
         in <vars> or NumericError if result cannot be computed.") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	None

Creates the Arcsin of <exp>") Expr_ArcSine;
		 Expr_ArcSine (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after a simplification  
         of the arguments of <self>.") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "Args:
	Other(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <self> and <Other> define the same expression.  
         This method does not include any simplification before  
         testing.") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)

Returns:
	Handle_Expr_GeneralExpression

Returns the derivative on <X> unknown of <self>.") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	vals(TColStd_Array1OfReal)

Returns:
	Standard_Real

Returns the value of <self> (as a Real) by  
         replacement of <vars> by <vals>.  
         Raises NotEvaluable if <self> contains NamedUnknown not  
         in <vars> or NumericError if result cannot be computed.") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	None

Creates the Arctan of <exp>.") Expr_ArcTangent;
		 Expr_ArcTangent (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after a simplification  
         of the arguments of <self>.") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "Args:
	Other(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <self> and <Other> define the same expression.  
         This method does not include any simplification before  
         testing.") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)

Returns:
	Handle_Expr_GeneralExpression

Returns the derivative on <X> unknown of <self>.") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	vals(TColStd_Array1OfReal)

Returns:
	Standard_Real

Returns the value of <self> (as a Real) by  
         replacement of <vars> by <vals>.  
         Raises NotEvaluable if <self> contains NamedUnknown not  
         in <vars> or NumericError if result cannot be computed.") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	None

Creates the ArgCosh of <exp>") Expr_ArgCosh;
		 Expr_ArgCosh (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after a simplification  
         of the arguments of <self>.") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "Args:
	Other(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <self> and <Other> define the same expression.  
         This method does not include any simplification before  
         testing.") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)

Returns:
	Handle_Expr_GeneralExpression

Returns the derivative on <X> unknown of <self>.") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	vals(TColStd_Array1OfReal)

Returns:
	Standard_Real

Returns the value of <self> (as a Real) by  
         replacement of <vars> by <vals>.  
         Raises NotEvaluable if <self> contains NamedUnknown not  
         in <vars> or NumericError if result cannot be computed.") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	None

Creates the ArgSinh of <exp>.") Expr_ArgSinh;
		 Expr_ArgSinh (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after a simplification  
         of the arguments of <self>.") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "Args:
	Other(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <self> and <Other> define the same expression.  
         This method does not include any simplification before  
         testing.") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)

Returns:
	Handle_Expr_GeneralExpression

Returns the derivative on <X> unknown of <self>.") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	vals(TColStd_Array1OfReal)

Returns:
	Standard_Real

Returns the value of <self> (as a Real) by  
         replacement of <vars> by <vals>.  
         Raises NotEvaluable if <self> contains NamedUnknown not  
         in <vars> or NumericError if result cannot be computed.") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	None

Creates the Argtanh of <exp>.") Expr_ArgTanh;
		 Expr_ArgTanh (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after a simplification  
         of the arguments of <self>.") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "Args:
	Other(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <self> and <Other> define the same expression.  
         This method does not include any simplification before  
         testing.") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)

Returns:
	Handle_Expr_GeneralExpression

Returns the derivative on <X> unknown of <self>.") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	vals(TColStd_Array1OfReal)

Returns:
	Standard_Real

Returns the value of <self> (as a Real) by  
         replacement of <vars> by <vals>.  
         Raises NotEvaluable if <self> contains NamedUnknown not  
         in <vars> or NumericError if result cannot be computed.") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	func(Handle_Expr_GeneralFunction)
	exp1(Handle_Expr_GeneralExpression)
	exp2(Handle_Expr_GeneralExpression)

Returns:
	None

Creates <self> as <func> (<exp1>,<exp2>).  
         Raises exception if <func> is not binary.") Expr_BinaryFunction;
		 Expr_BinaryFunction (const Handle_Expr_GeneralFunction & func,const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralFunction

Returns the function defining <self>.") Function;
		Handle_Expr_GeneralFunction Function ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after a simplification  
         of the arguments of <self>.") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "Args:
	Other(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <self> and <Other> define the same expression.  
         This method does not include any simplification before  
         testing.") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)

Returns:
	Handle_Expr_GeneralExpression

Returns the derivative on <X> unknown of <self>") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	vals(TColStd_Array1OfReal)

Returns:
	Standard_Real

Returns the value of <self> (as a Real) by  
         replacement of <vars> by <vals>.  
         Raises NotEvaluable if <self> contains NamedUnknown not  
         in <vars> or NumericError if result cannot be computed.") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	None

Creates the Cosh of <exp>") Expr_Cosh;
		 Expr_Cosh (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after a simplification  
         of the arguments of <self>.") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "Args:
	Other(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <self> and <Other> define the same expression.  
         This method does not include any simplification before  
         testing.") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)

Returns:
	Handle_Expr_GeneralExpression

Returns the derivative on <X> unknown of <self>.") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	vals(TColStd_Array1OfReal)

Returns:
	Standard_Real

Returns the value of <self> (as a Real) by  
         replacement of <vars> by <vals>.  
         Raises NotEvaluable if <self> contains NamedUnknown not  
         in <vars> or NumericError if result cannot be computed.") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	Exp(Handle_Expr_GeneralExpression)

Returns:
	None

Creates the cosine of Exp") Expr_Cosine;
		 Expr_Cosine (const Handle_Expr_GeneralExpression & Exp);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after a simplification  
         of the arguments of <self>.") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "Args:
	Other(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <self> and <Other> define the same expression.  
         This method does not include any simplification before  
         testing.") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)

Returns:
	Handle_Expr_GeneralExpression

Returns the derivative on <X> unknown of <self>") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	vals(TColStd_Array1OfReal)

Returns:
	Standard_Real

Returns the value of <self> (as a Real) by  
         replacement of <vars> by <vals>.  
         Raises NotEvaluable if <self> contains NamedUnknown not  
         in <vars> or NumericError if result cannot be computed.") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	exp1(Handle_Expr_GeneralExpression)
	exp2(Handle_Expr_GeneralExpression)

Returns:
	None

Creates the difference <exp1> - <exp2>.") Expr_Difference;
		 Expr_Difference (const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after a simplification  
         of the arguments of <self>.") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "Args:
	Other(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <self> and <Other> define the same expression.  
         This method does not include any simplification before  
         testing.") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)

Returns:
	Handle_Expr_GeneralExpression

Returns the derivative on <X> unknown of <self>") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)
	N(Standard_Integer)

Returns:
	virtual Handle_Expr_GeneralExpression

Returns the <N>-th derivative on <X> unknown of <self>.  
         Raises OutOfRange if <N> <= 0") NDerivative;
		virtual Handle_Expr_GeneralExpression NDerivative (const Handle_Expr_NamedUnknown & X,const Standard_Integer N);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	vals(TColStd_Array1OfReal)

Returns:
	Standard_Real

Returns the value of <self> (as a Real) by  
         replacement of <vars> by <vals>.  
         Raises NotEvaluable if <self> contains NamedUnknown not  
         in <vars> or NumericError if result cannot be computed.") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	exp1(Handle_Expr_GeneralExpression)
	exp2(Handle_Expr_GeneralExpression)

Returns:
	None

Creates the relation <exp1> # <exp2>.") Expr_Different;
		 Expr_Different (const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsSatisfied;
		Standard_Boolean IsSatisfied ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralRelation

Returns a GeneralRelation after replacement of  
         NamedUnknowns by an associated expression, and after  
         values computation.") Simplified;
		Handle_Expr_GeneralRelation Simplified ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Replaces NamedUnknowns by associated expressions,  
         and computes values in <self>.") Simplify;
		void Simplify ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralRelation

Returns a copy of <self> having the same unknowns and  
         functions.") Copy;
		Handle_Expr_GeneralRelation Copy ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	exp1(Handle_Expr_GeneralExpression)
	exp2(Handle_Expr_GeneralExpression)

Returns:
	None

Creates the division <exp1>/<exp2>") Expr_Division;
		 Expr_Division (const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after a simplification  
         of the arguments of <self>.") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "Args:
	Other(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <self> and <Other> define the same expression.  
         This method does not include any simplification before  
         testing.") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)

Returns:
	Handle_Expr_GeneralExpression

Returns the derivative on <X> unknown of <self>.") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	vals(TColStd_Array1OfReal)

Returns:
	Standard_Real

Returns the value of <self> (as a Real) by  
         replacement of <vars> by <vals>.  
         Raises NotEvaluable if <self> contains NamedUnknown not  
         in <vars> or NumericError if result cannot be computed.") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	exp1(Handle_Expr_GeneralExpression)
	exp2(Handle_Expr_GeneralExpression)

Returns:
	None

Creates the relation <exp1> = <exp2>.") Expr_Equal;
		 Expr_Equal (const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsSatisfied;
		Standard_Boolean IsSatisfied ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralRelation

returns a GeneralRelation after replacement of  
         NamedUnknowns by an associated expression and after  
         values computation.") Simplified;
		Handle_Expr_GeneralRelation Simplified ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Replaces NamedUnknowns by an associated expressions  
         and computes values in <self>.") Simplify;
		void Simplify ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralRelation

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralRelation Copy ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	None

Creates the exponential of <exp>") Expr_Exponential;
		 Expr_Exponential (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after a simplification  
         of the arguments of <self>.") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "Args:
	Other(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <self> and <Other> define the same expression.  
         This method does not include any simplification before  
         testing.") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)

Returns:
	Handle_Expr_GeneralExpression

Returns the derivative on <X> unknown of <self>.") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	vals(TColStd_Array1OfReal)

Returns:
	Standard_Real

Returns the value of <self> (as a Real) by  
         replacement of <vars> by <vals>.  
         Raises NotEvaluable if <self> contains NamedUnknown not  
         in <vars> or NumericError if result cannot be computed.") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	exp1(Handle_Expr_GeneralExpression)
	exp2(Handle_Expr_GeneralExpression)

Returns:
	None

Creates the exponential <exp1> ^ <exp2>") Expr_Exponentiate;
		 Expr_Exponentiate (const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after a simplification  
         of the arguments of <self>.") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "Args:
	Other(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <self> and <Other> define the same expression.  
         This method does not include any simplification before  
         testing.") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)

Returns:
	Handle_Expr_GeneralExpression

Returns the derivative on <X> unknown of <self>.") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	vals(TColStd_Array1OfReal)

Returns:
	Standard_Real

Returns the value of <self> (as a Real) by  
         replacement of <vars> by <vals>.  
         Raises NotEvaluable if <self> contains NamedUnknown not  
         in <vars> or NumericError if result cannot be computed.") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	exp1(Handle_Expr_GeneralExpression)
	exp2(Handle_Expr_GeneralExpression)

Returns:
	None

Creates the relation <exp1> > <exp2>.") Expr_GreaterThan;
		 Expr_GreaterThan (const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsSatisfied;
		Standard_Boolean IsSatisfied ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralRelation

Returns a GeneralRelation after replacement of  
         NamedUnknowns by an associated expression, and after  
         values computation.") Simplified;
		Handle_Expr_GeneralRelation Simplified ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Replaces NamedUnknowns by associated expressions,  
         and computes values in <self>.") Simplify;
		void Simplify ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralRelation

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralRelation Copy ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	exp1(Handle_Expr_GeneralExpression)
	exp2(Handle_Expr_GeneralExpression)

Returns:
	None

Creates the relation <exp1> >= <exp2>.") Expr_GreaterThanOrEqual;
		 Expr_GreaterThanOrEqual (const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsSatisfied;
		Standard_Boolean IsSatisfied ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralRelation

Returns a GeneralRelation after replacement of  
         NamedUnknowns by an associated expression, and after  
         values computation.") Simplified;
		Handle_Expr_GeneralRelation Simplified ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Replaces NamedUnknowns by associated expressions,  
         and computes values in <self>.") Simplify;
		void Simplify ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralRelation

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralRelation Copy ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	exp1(Handle_Expr_GeneralExpression)
	exp2(Handle_Expr_GeneralExpression)

Returns:
	None

Creates the relation <exp1> < <exp2>.") Expr_LessThan;
		 Expr_LessThan (const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsSatisfied;
		Standard_Boolean IsSatisfied ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralRelation

Returns a GeneralRelation after replacement of  
         NamedUnknowns by an associated expression, and after  
         values computation.") Simplified;
		Handle_Expr_GeneralRelation Simplified ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Replaces NamedUnknowns by associated expressions,  
         and computes values in <self>.") Simplify;
		void Simplify ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralRelation

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralRelation Copy ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	exp1(Handle_Expr_GeneralExpression)
	exp2(Handle_Expr_GeneralExpression)

Returns:
	None

Creates the relation <exp1> <= <exp2>.") Expr_LessThanOrEqual;
		 Expr_LessThanOrEqual (const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsSatisfied;
		Standard_Boolean IsSatisfied ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralRelation

Returns a GeneralRelation after replacement of  
         NamedUnknowns by an associated expression, and after  
         values computation.") Simplified;
		Handle_Expr_GeneralRelation Simplified ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Replaces NamedUnknowns by associated expressions,  
         and computes values in <self>.") Simplify;
		void Simplify ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralRelation

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralRelation Copy ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	None

Creates the base 10 logarithm of <exp>") Expr_LogOf10;
		 Expr_LogOf10 (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after a simplification  
         of the arguments of <self>.") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "Args:
	Other(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <self> and <Other> define the same expression.  
         This method does not include any simplification before  
         testing.") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)

Returns:
	Handle_Expr_GeneralExpression

Returns the derivative on <X> unknown of <self>.") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	vals(TColStd_Array1OfReal)

Returns:
	Standard_Real

Returns the value of <self> (as a Real) by  
         replacement of <vars> by <vals>.  
         Raises NotEvaluable if <self> contains NamedUnknown not  
         in <vars> or NumericError if result cannot be computed.") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	None

Creates the natural logarithm of <exp>") Expr_LogOfe;
		 Expr_LogOfe (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after a simplification  
         of the arguments of <self>.") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "Args:
	Other(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <self> and <Other> define the same expression.  
         This method does not include any simplification before  
         testing.") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)

Returns:
	Handle_Expr_GeneralExpression

Returns the derivative on <X> unknown of <self>.") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	vals(TColStd_Array1OfReal)

Returns:
	Standard_Real

Returns the value of <self> (as a Real) by  
         replacement of <vars> by <vals>.  
         Raises NotEvaluable if <self> contains NamedUnknown not  
         in <vars> or NumericError if result cannot be computed.") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	name(TCollection_AsciiString)
	value(Standard_Real)

Returns:
	None

Creates a constant value of name <name> and value <value>.") Expr_NamedConstant;
		 Expr_NamedConstant (const TCollection_AsciiString & name,const Standard_Real value);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") GetValue;
		Standard_Real GetValue ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns the number of sub-expressions contained  
         in <self> (always returns zero)") NbSubExpressions;
		Standard_Integer NbSubExpressions ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Handle_Expr_GeneralExpression

returns the <I>-th sub-expression of <self>  
         raises OutOfRange") SubExpression;
		const Handle_Expr_GeneralExpression & SubExpression (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

returns a GeneralExpression after replacement of  
         NamedUnknowns by an associated expression and after  
         values computation.") Simplified;
		Handle_Expr_GeneralExpression Simplified ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after a simplification  
         of the arguments of <self>.") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Tests if <self> contains NamedUnknown.  
         (returns always False)") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns ();
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <exp> is contained in <self>.") Contains;
		Standard_Boolean Contains (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)

Returns:
	Handle_Expr_GeneralExpression

Returns the derivative on <X> unknown of <self>") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)
	N(Standard_Integer)

Returns:
	virtual Handle_Expr_GeneralExpression

Returns the <N>-th derivative on <X> unknown of <self>.  
         Raises OutOfRange if <N> <= 0") NDerivative;
		virtual Handle_Expr_GeneralExpression NDerivative (const Handle_Expr_NamedUnknown & X,const Standard_Integer N);
		%feature("autodoc", "Args:
	var(Handle_Expr_NamedUnknown)
	with(Handle_Expr_GeneralExpression)

Returns:
	None

Replaces all occurences of <var> with <with> in <self>") Replace;
		void Replace (const Handle_Expr_NamedUnknown & var,const Handle_Expr_GeneralExpression & with);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	vals(TColStd_Array1OfReal)

Returns:
	Standard_Real

Returns the value of <self> (as a Real) by  
         replacement of <vars> by <vals>.") Evaluate;
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
		%feature("autodoc", "Args:
	name(TCollection_AsciiString)

Returns:
	None

No detailed docstring for this function.") Expr_NamedUnknown;
		 Expr_NamedUnknown (const TCollection_AsciiString & name);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Tests if an expression is assigned to <self>.") IsAssigned;
		Standard_Boolean IsAssigned ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

If exists, returns the assigned expression.  
         An exception is raised if the expression does not exist.") AssignedExpression;
		const Handle_Expr_GeneralExpression & AssignedExpression ();
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	None

Assigns <self> to <exp> expression.  
         Raises exception if <exp> refers to <self>.") Assign;
		void Assign (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	None
Returns:
	None

Supresses the assigned expression") Deassign;
		void Deassign ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of sub-expressions contained  
         in <self> ( >= 0)") NbSubExpressions;
		Standard_Integer NbSubExpressions ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Handle_Expr_GeneralExpression

Returns the <I>-th sub-expression of <self>  
         raises OutOfRange if <I> > NbSubExpressions(me)") SubExpression;
		const Handle_Expr_GeneralExpression & SubExpression (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after replacement of  
         NamedUnknowns by an associated expression and after  
         values computation.") Simplified;
		Handle_Expr_GeneralExpression Simplified ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after a simplification  
         of the arguments of <self>.") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Tests if <self> contains NamedUnknown.") ContainsUnknowns;
		Standard_Boolean ContainsUnknowns ();
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <exp> is contained in <self>.") Contains;
		Standard_Boolean Contains (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)

Returns:
	Handle_Expr_GeneralExpression

Returns the derivative on <X> unknown of <self>") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "Args:
	var(Handle_Expr_NamedUnknown)
	with(Handle_Expr_GeneralExpression)

Returns:
	None

Replaces all occurences of <var> with <with> in <self>  
         Raises InvalidOperand if <with> contains <self>.") Replace;
		void Replace (const Handle_Expr_NamedUnknown & var,const Handle_Expr_GeneralExpression & with);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	vals(TColStd_Array1OfReal)

Returns:
	Standard_Real

Returns the value of <self> (as a Real) by  
         replacement of <vars> by <vals>.  
         Raises NotEvaluable if <self> contains NamedUnknown not  
         in <vars> or NumericError if result cannot be computed.") Evaluate;
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
		%feature("autodoc", "Args:
	func(Handle_Expr_GeneralFunction)
	exps(Expr_Array1OfGeneralExpression)

Returns:
	None

Creates <self> as <func>(<exps_1>,<exps_2>,...,<exps_n>)") Expr_PolyFunction;
		 Expr_PolyFunction (const Handle_Expr_GeneralFunction & func,const Expr_Array1OfGeneralExpression & exps);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralFunction

Returns the function defining <self>.") Function;
		Handle_Expr_GeneralFunction Function ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after a simplification  
         of the arguments of <self>.") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "Args:
	Other(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <self> and <Other> define the same expression.  
         This method does not include any simplification before  
         testing.") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)

Returns:
	Handle_Expr_GeneralExpression

Returns the derivative on <X> unknown of <self>") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	vals(TColStd_Array1OfReal)

Returns:
	Standard_Real

Returns the value of <self> (as a Real) by  
         replacement of <vars> by <vals>.  
         Raises NotEvaluable if <self> contains NamedUnknown not  
         in <vars> or NumericError if result cannot be computed.") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	exps(Expr_SequenceOfGeneralExpression)

Returns:
	None

Creates the product of all members of sequence <exps>") Expr_Product;
		 Expr_Product (const Expr_SequenceOfGeneralExpression & exps);
		%feature("autodoc", "Args:
	exp1(Handle_Expr_GeneralExpression)
	exp2(Handle_Expr_GeneralExpression)

Returns:
	None

Creates the product of <exp1> and <exp2>.") Expr_Product;
		 Expr_Product (const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after a simplification  
         of the arguments of <self>.") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "Args:
	Other(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <self> and <Other> define the same expression.  
         This method does not include any simplification before  
         testing.") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)

Returns:
	Handle_Expr_GeneralExpression

Returns the derivative on <X> unknown of <self>") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	vals(TColStd_Array1OfReal)

Returns:
	Standard_Real

Returns the value of <self> (as a Real) by  
         replacement of <vars> by <vals>.  
         Raises NotEvaluable if <self> contains NamedUnknown not  
         in <vars> or NumericError if result cannot be computed.") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	None

Creates the sine of <exp>.") Expr_Sine;
		 Expr_Sine (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after a simplification  
         of the arguments of <self>.") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "Args:
	Other(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <self> and <Other> define the same expression.  
         This method does not include any simplification before  
         testing.") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)

Returns:
	Handle_Expr_GeneralExpression

Returns the derivative on <X> unknown of <self>") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	vals(TColStd_Array1OfReal)

Returns:
	Standard_Real

Returns the value of <self> (as a Real) by  
         replacement of <vars> by <vals>.  
         Raises NotEvaluable if <self> contains NamedUnknown not  
         in <vars> or NumericError if result cannot be computed.") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	None

Creates the sinh of <exp>.") Expr_Sinh;
		 Expr_Sinh (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after a simplification  
         of the arguments of <self>.") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "Args:
	Other(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <self> and <Other> define the same expression.  
         This method does not include any simplification before  
         testing.") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)

Returns:
	Handle_Expr_GeneralExpression

Returns the derivative on <X> unknown of <self>") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	vals(TColStd_Array1OfReal)

Returns:
	Standard_Real

Returns the value of <self> (as a Real) by  
         replacement of <vars> by <vals>.  
         Raises NotEvaluable if <self> contains NamedUnknown not  
         in <vars> or NumericError if result cannot be computed.") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	None

Creates the square of <exp>.") Expr_Square;
		 Expr_Square (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after a simplification  
         of the arguments of <self>.") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "Args:
	Other(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <self> and <Other> define the same expression.  
         This method does not include any simplification before  
         testing.") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)

Returns:
	Handle_Expr_GeneralExpression

Returns the derivative on <X> unknown of <self>.") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	vals(TColStd_Array1OfReal)

Returns:
	Standard_Real

Returns the value of <self> (as a Real) by  
         replacement of <vars> by <vals>.  
         Raises NotEvaluable if <self> contains NamedUnknown not  
         in <vars> or NumericError if result cannot be computed.") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	None

Creates the square root of <exp>") Expr_SquareRoot;
		 Expr_SquareRoot (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after a simplification  
         of the arguments of <self>.") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "Args:
	Other(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <self> and <Other> define the same expression.  
         This method does not include any simplification before  
         testing.") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)

Returns:
	Handle_Expr_GeneralExpression

Returns the derivative on <X> unknown of <self>.") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	vals(TColStd_Array1OfReal)

Returns:
	Standard_Real

Returns the value of <self> (as a Real) by  
         replacement of <vars> by <vals>.  
         Raises NotEvaluable if <self> contains NamedUnknown not  
         in <vars> or NumericError if result cannot be computed.") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	exps(Expr_SequenceOfGeneralExpression)

Returns:
	None

Creates the sum of all the members of sequence <exps>.") Expr_Sum;
		 Expr_Sum (const Expr_SequenceOfGeneralExpression & exps);
		%feature("autodoc", "Args:
	exp1(Handle_Expr_GeneralExpression)
	exp2(Handle_Expr_GeneralExpression)

Returns:
	None

Creates the sum of <exp1> and <exp2>.") Expr_Sum;
		 Expr_Sum (const Handle_Expr_GeneralExpression & exp1,const Handle_Expr_GeneralExpression & exp2);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after a simplification  
         of the arguments of <self>.") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "Args:
	Other(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <self> and <Other> define the same expression.  
         This method does not include any simplification before  
         testing.") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)

Returns:
	Handle_Expr_GeneralExpression

Returns the derivative on <X> unknown of <self>.") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)
	N(Standard_Integer)

Returns:
	virtual Handle_Expr_GeneralExpression

Returns the <N>-th derivative on <X> unknown of <self>.  
         Raises OutOfRange if <N> <= 0") NDerivative;
		virtual Handle_Expr_GeneralExpression NDerivative (const Handle_Expr_NamedUnknown & X,const Standard_Integer N);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	vals(TColStd_Array1OfReal)

Returns:
	Standard_Real

Returns the value of <self> (as a Real) by  
         replacement of <vars> by <vals>.  
         Raises NotEvaluable if <self> contains NamedUnknown not  
         in <vars> or NumericError if result cannot be computed.") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	None

Creates the tangent of <exp>.") Expr_Tangent;
		 Expr_Tangent (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after a simplification  
         of the arguments of <self>.") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "Args:
	Other(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <self> and <Other> define the same expression.  
         This method does not include any simplification before  
         testing.") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)

Returns:
	Handle_Expr_GeneralExpression

Returns the derivative on <X> unknown of <self>") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	vals(TColStd_Array1OfReal)

Returns:
	Standard_Real

Returns the value of <self> (as a Real) by  
         replacement of <vars> by <vals>.  
         Raises NotEvaluable if <self> contains NamedUnknown not  
         in <vars> or NumericError if result cannot be computed.") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	None

Creates the hyperbolic tangent of <exp>.") Expr_Tanh;
		 Expr_Tanh (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after a simplification  
         of the arguments of <self>.") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "Args:
	Other(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <self> and <Other> define the same expression.  
         This method does not include any simplification before  
         testing.") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)

Returns:
	Handle_Expr_GeneralExpression

Returns the derivative on <X> unknown of <self>") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	vals(TColStd_Array1OfReal)

Returns:
	Standard_Real

Returns the value of <self> (as a Real) by  
         replacement of <vars> by <vals>.  
         Raises NotEvaluable if <self> contains NamedUnknown not  
         in <vars> or NumericError if result cannot be computed.") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	func(Handle_Expr_GeneralFunction)
	exp(Handle_Expr_GeneralExpression)

Returns:
	None

Creates me as <func>(<exp>).  
         Raises exception if <func> is not unary.") Expr_UnaryFunction;
		 Expr_UnaryFunction (const Handle_Expr_GeneralFunction & func,const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralFunction

Returns the function defining <self>.") Function;
		Handle_Expr_GeneralFunction Function ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after a simplification  
         of the arguments of <self>.") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "Args:
	Other(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <self> and <Other> define the same expression.  
         This method does not include any simplification before  
         testing.") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)

Returns:
	Handle_Expr_GeneralExpression

returns the derivative on <X> unknown of <self>.") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	vals(TColStd_Array1OfReal)

Returns:
	Standard_Real

Returns the value of <self> (as a Real) by  
         replacement of <vars> by <vals>.  
         Raises NotEvaluable if <self> contains NamedUnknown not  
         in <vars> or NumericError if result cannot be computed.") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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
		%feature("autodoc", "Args:
	exp(Handle_Expr_GeneralExpression)

Returns:
	None

Create the unary minus of <exp>.") Expr_UnaryMinus;
		 Expr_UnaryMinus (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a GeneralExpression after a simplification  
         of the arguments of <self>.") ShallowSimplified;
		Handle_Expr_GeneralExpression ShallowSimplified ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Expr_GeneralExpression

Returns a copy of <self> having the same unknowns and functions.") Copy;
		Handle_Expr_GeneralExpression Copy ();
		%feature("autodoc", "Args:
	Other(Handle_Expr_GeneralExpression)

Returns:
	Standard_Boolean

Tests if <self> and <Other> define the same expression.  
         This method does not include any simplification before  
         testing.") IsIdentical;
		Standard_Boolean IsIdentical (const Handle_Expr_GeneralExpression & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)

Returns:
	Handle_Expr_GeneralExpression

Returns the derivative on <X> unknown of <self>") Derivative;
		Handle_Expr_GeneralExpression Derivative (const Handle_Expr_NamedUnknown & X);
		%feature("autodoc", "Args:
	X(Handle_Expr_NamedUnknown)
	N(Standard_Integer)

Returns:
	virtual Handle_Expr_GeneralExpression

Returns the <N>-th derivative on <X> unknown of <self>.  
         Raises OutOfRange if <N> <= 0") NDerivative;
		virtual Handle_Expr_GeneralExpression NDerivative (const Handle_Expr_NamedUnknown & X,const Standard_Integer N);
		%feature("autodoc", "Args:
	vars(Expr_Array1OfNamedUnknown)
	vals(TColStd_Array1OfReal)

Returns:
	Standard_Real

Returns the value of <self> (as a Real) by  
         replacement of <vars> by <vals>.  
         Raises NotEvaluable if <self> contains NamedUnknown not  
         in <vars> or NumericError if result cannot be computed.") Evaluate;
		Standard_Real Evaluate (const Expr_Array1OfNamedUnknown & vars,const TColStd_Array1OfReal & vals);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

returns a string representing <self> in a readable way.") String;
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

