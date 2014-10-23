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
%module (package="OCC") ExprIntrp

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

%include ExprIntrp_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(exprintrp) ExprIntrp;
%nodefaultctor ExprIntrp;
class ExprIntrp {
	public:
};


%feature("shadow") ExprIntrp::~ExprIntrp %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ExprIntrp {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ExprIntrp_Analysis;
class ExprIntrp_Analysis {
	public:
		%feature("autodoc", "	:rtype: None
") ExprIntrp_Analysis;
		 ExprIntrp_Analysis ();
		%feature("autodoc", "	:param agen:
	:type agen: Handle_ExprIntrp_Generator &
	:rtype: None
") SetMaster;
		void SetMaster (const Handle_ExprIntrp_Generator & agen);
		%feature("autodoc", "	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Push;
		void Push (const Handle_Expr_GeneralExpression & exp);
		%feature("autodoc", "	:param rel:
	:type rel: Handle_Expr_GeneralRelation &
	:rtype: None
") PushRelation;
		void PushRelation (const Handle_Expr_GeneralRelation & rel);
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:rtype: None
") PushName;
		void PushName (const TCollection_AsciiString & name);
		%feature("autodoc", "	:param degree:
	:type degree: Standard_Integer
	:rtype: None
") PushValue;
		void PushValue (const Standard_Integer degree);
		%feature("autodoc", "	:param func:
	:type func: Handle_Expr_GeneralFunction &
	:rtype: None
") PushFunction;
		void PushFunction (const Handle_Expr_GeneralFunction & func);
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralExpression
") Pop;
		Handle_Expr_GeneralExpression Pop ();
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralRelation
") PopRelation;
		Handle_Expr_GeneralRelation PopRelation ();
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") PopName;
		TCollection_AsciiString PopName ();
		%feature("autodoc", "	:rtype: int
") PopValue;
		Standard_Integer PopValue ();
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralFunction
") PopFunction;
		Handle_Expr_GeneralFunction PopFunction ();
		%feature("autodoc", "	:rtype: bool
") IsExpStackEmpty;
		Standard_Boolean IsExpStackEmpty ();
		%feature("autodoc", "	:rtype: bool
") IsRelStackEmpty;
		Standard_Boolean IsRelStackEmpty ();
		%feature("autodoc", "	:rtype: None
") ResetAll;
		void ResetAll ();
		%feature("autodoc", "	:param func:
	:type func: Handle_Expr_NamedFunction &
	:rtype: None
") Use;
		void Use (const Handle_Expr_NamedFunction & func);
		%feature("autodoc", "	:param named:
	:type named: Handle_Expr_NamedExpression &
	:rtype: None
") Use;
		void Use (const Handle_Expr_NamedExpression & named);
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:rtype: Handle_Expr_NamedExpression
") GetNamed;
		Handle_Expr_NamedExpression GetNamed (const TCollection_AsciiString & name);
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:rtype: Handle_Expr_NamedFunction
") GetFunction;
		Handle_Expr_NamedFunction GetFunction (const TCollection_AsciiString & name);
};


%feature("shadow") ExprIntrp_Analysis::~ExprIntrp_Analysis %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ExprIntrp_Analysis {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ExprIntrp_Generator;
class ExprIntrp_Generator : public MMgt_TShared {
	public:
		%feature("autodoc", "	:param func:
	:type func: Handle_Expr_NamedFunction &
	:rtype: None
") Use;
		void Use (const Handle_Expr_NamedFunction & func);
		%feature("autodoc", "	:param named:
	:type named: Handle_Expr_NamedExpression &
	:rtype: None
") Use;
		void Use (const Handle_Expr_NamedExpression & named);
		%feature("autodoc", "	:rtype: ExprIntrp_SequenceOfNamedExpression
") GetNamed;
		const ExprIntrp_SequenceOfNamedExpression & GetNamed ();
		%feature("autodoc", "	:rtype: ExprIntrp_SequenceOfNamedFunction
") GetFunctions;
		const ExprIntrp_SequenceOfNamedFunction & GetFunctions ();
		%feature("autodoc", "	* Returns NamedExpression with name <name> already interpreted if it exists. Returns a null handle if not.

	:param name:
	:type name: TCollection_AsciiString &
	:rtype: Handle_Expr_NamedExpression
") GetNamed;
		Handle_Expr_NamedExpression GetNamed (const TCollection_AsciiString & name);
		%feature("autodoc", "	* Returns NamedFunction with name <name> already interpreted if it exists. Returns a null handle if not.

	:param name:
	:type name: TCollection_AsciiString &
	:rtype: Handle_Expr_NamedFunction
") GetFunction;
		Handle_Expr_NamedFunction GetFunction (const TCollection_AsciiString & name);
};


%feature("shadow") ExprIntrp_Generator::~ExprIntrp_Generator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ExprIntrp_Generator {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ExprIntrp_Generator {
	Handle_ExprIntrp_Generator GetHandle() {
	return *(Handle_ExprIntrp_Generator*) &$self;
	}
};

%nodefaultctor Handle_ExprIntrp_Generator;
class Handle_ExprIntrp_Generator : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_ExprIntrp_Generator();
        Handle_ExprIntrp_Generator(const Handle_ExprIntrp_Generator &aHandle);
        Handle_ExprIntrp_Generator(const ExprIntrp_Generator *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ExprIntrp_Generator DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ExprIntrp_Generator {
    ExprIntrp_Generator* GetObject() {
    return (ExprIntrp_Generator*)$self->Access();
    }
};
%feature("shadow") Handle_ExprIntrp_Generator::~Handle_ExprIntrp_Generator %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ExprIntrp_Generator {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ExprIntrp_SequenceNodeOfSequenceOfNamedExpression;
class ExprIntrp_SequenceNodeOfSequenceOfNamedExpression : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_NamedExpression &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") ExprIntrp_SequenceNodeOfSequenceOfNamedExpression;
		 ExprIntrp_SequenceNodeOfSequenceOfNamedExpression (const Handle_Expr_NamedExpression & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Handle_Expr_NamedExpression
") Value;
		Handle_Expr_NamedExpression & Value ();
};


%feature("shadow") ExprIntrp_SequenceNodeOfSequenceOfNamedExpression::~ExprIntrp_SequenceNodeOfSequenceOfNamedExpression %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ExprIntrp_SequenceNodeOfSequenceOfNamedExpression {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ExprIntrp_SequenceNodeOfSequenceOfNamedExpression {
	Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedExpression GetHandle() {
	return *(Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedExpression*) &$self;
	}
};

%nodefaultctor Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedExpression;
class Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedExpression : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedExpression();
        Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedExpression(const Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedExpression &aHandle);
        Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedExpression(const ExprIntrp_SequenceNodeOfSequenceOfNamedExpression *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedExpression DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedExpression {
    ExprIntrp_SequenceNodeOfSequenceOfNamedExpression* GetObject() {
    return (ExprIntrp_SequenceNodeOfSequenceOfNamedExpression*)$self->Access();
    }
};
%feature("shadow") Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedExpression::~Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedExpression %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedExpression {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ExprIntrp_SequenceNodeOfSequenceOfNamedFunction;
class ExprIntrp_SequenceNodeOfSequenceOfNamedFunction : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_NamedFunction &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") ExprIntrp_SequenceNodeOfSequenceOfNamedFunction;
		 ExprIntrp_SequenceNodeOfSequenceOfNamedFunction (const Handle_Expr_NamedFunction & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Handle_Expr_NamedFunction
") Value;
		Handle_Expr_NamedFunction & Value ();
};


%feature("shadow") ExprIntrp_SequenceNodeOfSequenceOfNamedFunction::~ExprIntrp_SequenceNodeOfSequenceOfNamedFunction %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ExprIntrp_SequenceNodeOfSequenceOfNamedFunction {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ExprIntrp_SequenceNodeOfSequenceOfNamedFunction {
	Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedFunction GetHandle() {
	return *(Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedFunction*) &$self;
	}
};

%nodefaultctor Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedFunction;
class Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedFunction : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedFunction();
        Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedFunction(const Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedFunction &aHandle);
        Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedFunction(const ExprIntrp_SequenceNodeOfSequenceOfNamedFunction *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedFunction DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedFunction {
    ExprIntrp_SequenceNodeOfSequenceOfNamedFunction* GetObject() {
    return (ExprIntrp_SequenceNodeOfSequenceOfNamedFunction*)$self->Access();
    }
};
%feature("shadow") Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedFunction::~Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedFunction %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedFunction {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ExprIntrp_SequenceOfNamedExpression;
class ExprIntrp_SequenceOfNamedExpression : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") ExprIntrp_SequenceOfNamedExpression;
		 ExprIntrp_SequenceOfNamedExpression ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_SequenceOfNamedExpression &
	:rtype: ExprIntrp_SequenceOfNamedExpression
") Assign;
		const ExprIntrp_SequenceOfNamedExpression & Assign (const ExprIntrp_SequenceOfNamedExpression & Other);
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_SequenceOfNamedExpression &
	:rtype: ExprIntrp_SequenceOfNamedExpression
") operator=;
		const ExprIntrp_SequenceOfNamedExpression & operator = (const ExprIntrp_SequenceOfNamedExpression & Other);
		%feature("autodoc", "	:param T:
	:type T: Handle_Expr_NamedExpression &
	:rtype: None
") Append;
		void Append (const Handle_Expr_NamedExpression & T);
		%feature("autodoc", "	:param S:
	:type S: ExprIntrp_SequenceOfNamedExpression &
	:rtype: None
") Append;
		void Append (ExprIntrp_SequenceOfNamedExpression & S);
		%feature("autodoc", "	:param T:
	:type T: Handle_Expr_NamedExpression &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Expr_NamedExpression & T);
		%feature("autodoc", "	:param S:
	:type S: ExprIntrp_SequenceOfNamedExpression &
	:rtype: None
") Prepend;
		void Prepend (ExprIntrp_SequenceOfNamedExpression & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Expr_NamedExpression &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Expr_NamedExpression & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: ExprIntrp_SequenceOfNamedExpression &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,ExprIntrp_SequenceOfNamedExpression & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Expr_NamedExpression &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Expr_NamedExpression & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: ExprIntrp_SequenceOfNamedExpression &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,ExprIntrp_SequenceOfNamedExpression & S);
		%feature("autodoc", "	:rtype: Handle_Expr_NamedExpression
") First;
		const Handle_Expr_NamedExpression & First ();
		%feature("autodoc", "	:rtype: Handle_Expr_NamedExpression
") Last;
		const Handle_Expr_NamedExpression & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: ExprIntrp_SequenceOfNamedExpression &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,ExprIntrp_SequenceOfNamedExpression & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Expr_NamedExpression
") Value;
		const Handle_Expr_NamedExpression & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Handle_Expr_NamedExpression &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Expr_NamedExpression & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Expr_NamedExpression
") ChangeValue;
		Handle_Expr_NamedExpression & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") ExprIntrp_SequenceOfNamedExpression::~ExprIntrp_SequenceOfNamedExpression %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ExprIntrp_SequenceOfNamedExpression {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ExprIntrp_SequenceOfNamedFunction;
class ExprIntrp_SequenceOfNamedFunction : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") ExprIntrp_SequenceOfNamedFunction;
		 ExprIntrp_SequenceOfNamedFunction ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_SequenceOfNamedFunction &
	:rtype: ExprIntrp_SequenceOfNamedFunction
") Assign;
		const ExprIntrp_SequenceOfNamedFunction & Assign (const ExprIntrp_SequenceOfNamedFunction & Other);
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_SequenceOfNamedFunction &
	:rtype: ExprIntrp_SequenceOfNamedFunction
") operator=;
		const ExprIntrp_SequenceOfNamedFunction & operator = (const ExprIntrp_SequenceOfNamedFunction & Other);
		%feature("autodoc", "	:param T:
	:type T: Handle_Expr_NamedFunction &
	:rtype: None
") Append;
		void Append (const Handle_Expr_NamedFunction & T);
		%feature("autodoc", "	:param S:
	:type S: ExprIntrp_SequenceOfNamedFunction &
	:rtype: None
") Append;
		void Append (ExprIntrp_SequenceOfNamedFunction & S);
		%feature("autodoc", "	:param T:
	:type T: Handle_Expr_NamedFunction &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Expr_NamedFunction & T);
		%feature("autodoc", "	:param S:
	:type S: ExprIntrp_SequenceOfNamedFunction &
	:rtype: None
") Prepend;
		void Prepend (ExprIntrp_SequenceOfNamedFunction & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Expr_NamedFunction &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Expr_NamedFunction & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: ExprIntrp_SequenceOfNamedFunction &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,ExprIntrp_SequenceOfNamedFunction & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Expr_NamedFunction &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Expr_NamedFunction & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: ExprIntrp_SequenceOfNamedFunction &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,ExprIntrp_SequenceOfNamedFunction & S);
		%feature("autodoc", "	:rtype: Handle_Expr_NamedFunction
") First;
		const Handle_Expr_NamedFunction & First ();
		%feature("autodoc", "	:rtype: Handle_Expr_NamedFunction
") Last;
		const Handle_Expr_NamedFunction & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: ExprIntrp_SequenceOfNamedFunction &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,ExprIntrp_SequenceOfNamedFunction & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Expr_NamedFunction
") Value;
		const Handle_Expr_NamedFunction & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Handle_Expr_NamedFunction &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Expr_NamedFunction & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Expr_NamedFunction
") ChangeValue;
		Handle_Expr_NamedFunction & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") ExprIntrp_SequenceOfNamedFunction::~ExprIntrp_SequenceOfNamedFunction %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ExprIntrp_SequenceOfNamedFunction {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ExprIntrp_StackIteratorOfStackOfGeneralExpression;
class ExprIntrp_StackIteratorOfStackOfGeneralExpression {
	public:
		%feature("autodoc", "	:rtype: None
") ExprIntrp_StackIteratorOfStackOfGeneralExpression;
		 ExprIntrp_StackIteratorOfStackOfGeneralExpression ();
		%feature("autodoc", "	:param S:
	:type S: ExprIntrp_StackOfGeneralExpression &
	:rtype: None
") ExprIntrp_StackIteratorOfStackOfGeneralExpression;
		 ExprIntrp_StackIteratorOfStackOfGeneralExpression (const ExprIntrp_StackOfGeneralExpression & S);
		%feature("autodoc", "	:param S:
	:type S: ExprIntrp_StackOfGeneralExpression &
	:rtype: None
") Initialize;
		void Initialize (const ExprIntrp_StackOfGeneralExpression & S);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralExpression
") Value;
		const Handle_Expr_GeneralExpression & Value ();
};


%feature("shadow") ExprIntrp_StackIteratorOfStackOfGeneralExpression::~ExprIntrp_StackIteratorOfStackOfGeneralExpression %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ExprIntrp_StackIteratorOfStackOfGeneralExpression {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ExprIntrp_StackIteratorOfStackOfGeneralFunction;
class ExprIntrp_StackIteratorOfStackOfGeneralFunction {
	public:
		%feature("autodoc", "	:rtype: None
") ExprIntrp_StackIteratorOfStackOfGeneralFunction;
		 ExprIntrp_StackIteratorOfStackOfGeneralFunction ();
		%feature("autodoc", "	:param S:
	:type S: ExprIntrp_StackOfGeneralFunction &
	:rtype: None
") ExprIntrp_StackIteratorOfStackOfGeneralFunction;
		 ExprIntrp_StackIteratorOfStackOfGeneralFunction (const ExprIntrp_StackOfGeneralFunction & S);
		%feature("autodoc", "	:param S:
	:type S: ExprIntrp_StackOfGeneralFunction &
	:rtype: None
") Initialize;
		void Initialize (const ExprIntrp_StackOfGeneralFunction & S);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralFunction
") Value;
		const Handle_Expr_GeneralFunction & Value ();
};


%feature("shadow") ExprIntrp_StackIteratorOfStackOfGeneralFunction::~ExprIntrp_StackIteratorOfStackOfGeneralFunction %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ExprIntrp_StackIteratorOfStackOfGeneralFunction {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ExprIntrp_StackIteratorOfStackOfGeneralRelation;
class ExprIntrp_StackIteratorOfStackOfGeneralRelation {
	public:
		%feature("autodoc", "	:rtype: None
") ExprIntrp_StackIteratorOfStackOfGeneralRelation;
		 ExprIntrp_StackIteratorOfStackOfGeneralRelation ();
		%feature("autodoc", "	:param S:
	:type S: ExprIntrp_StackOfGeneralRelation &
	:rtype: None
") ExprIntrp_StackIteratorOfStackOfGeneralRelation;
		 ExprIntrp_StackIteratorOfStackOfGeneralRelation (const ExprIntrp_StackOfGeneralRelation & S);
		%feature("autodoc", "	:param S:
	:type S: ExprIntrp_StackOfGeneralRelation &
	:rtype: None
") Initialize;
		void Initialize (const ExprIntrp_StackOfGeneralRelation & S);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralRelation
") Value;
		const Handle_Expr_GeneralRelation & Value ();
};


%feature("shadow") ExprIntrp_StackIteratorOfStackOfGeneralRelation::~ExprIntrp_StackIteratorOfStackOfGeneralRelation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ExprIntrp_StackIteratorOfStackOfGeneralRelation {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ExprIntrp_StackIteratorOfStackOfNames;
class ExprIntrp_StackIteratorOfStackOfNames {
	public:
		%feature("autodoc", "	:rtype: None
") ExprIntrp_StackIteratorOfStackOfNames;
		 ExprIntrp_StackIteratorOfStackOfNames ();
		%feature("autodoc", "	:param S:
	:type S: ExprIntrp_StackOfNames &
	:rtype: None
") ExprIntrp_StackIteratorOfStackOfNames;
		 ExprIntrp_StackIteratorOfStackOfNames (const ExprIntrp_StackOfNames & S);
		%feature("autodoc", "	:param S:
	:type S: ExprIntrp_StackOfNames &
	:rtype: None
") Initialize;
		void Initialize (const ExprIntrp_StackOfNames & S);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Value;
		const TCollection_AsciiString & Value ();
};


%feature("shadow") ExprIntrp_StackIteratorOfStackOfNames::~ExprIntrp_StackIteratorOfStackOfNames %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ExprIntrp_StackIteratorOfStackOfNames {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ExprIntrp_StackNodeOfStackOfGeneralExpression;
class ExprIntrp_StackNodeOfStackOfGeneralExpression : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralExpression &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") ExprIntrp_StackNodeOfStackOfGeneralExpression;
		 ExprIntrp_StackNodeOfStackOfGeneralExpression (const Handle_Expr_GeneralExpression & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralExpression
") Value;
		Handle_Expr_GeneralExpression & Value ();
};


%feature("shadow") ExprIntrp_StackNodeOfStackOfGeneralExpression::~ExprIntrp_StackNodeOfStackOfGeneralExpression %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ExprIntrp_StackNodeOfStackOfGeneralExpression {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ExprIntrp_StackNodeOfStackOfGeneralExpression {
	Handle_ExprIntrp_StackNodeOfStackOfGeneralExpression GetHandle() {
	return *(Handle_ExprIntrp_StackNodeOfStackOfGeneralExpression*) &$self;
	}
};

%nodefaultctor Handle_ExprIntrp_StackNodeOfStackOfGeneralExpression;
class Handle_ExprIntrp_StackNodeOfStackOfGeneralExpression : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_ExprIntrp_StackNodeOfStackOfGeneralExpression();
        Handle_ExprIntrp_StackNodeOfStackOfGeneralExpression(const Handle_ExprIntrp_StackNodeOfStackOfGeneralExpression &aHandle);
        Handle_ExprIntrp_StackNodeOfStackOfGeneralExpression(const ExprIntrp_StackNodeOfStackOfGeneralExpression *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ExprIntrp_StackNodeOfStackOfGeneralExpression DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ExprIntrp_StackNodeOfStackOfGeneralExpression {
    ExprIntrp_StackNodeOfStackOfGeneralExpression* GetObject() {
    return (ExprIntrp_StackNodeOfStackOfGeneralExpression*)$self->Access();
    }
};
%feature("shadow") Handle_ExprIntrp_StackNodeOfStackOfGeneralExpression::~Handle_ExprIntrp_StackNodeOfStackOfGeneralExpression %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ExprIntrp_StackNodeOfStackOfGeneralExpression {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ExprIntrp_StackNodeOfStackOfGeneralFunction;
class ExprIntrp_StackNodeOfStackOfGeneralFunction : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralFunction &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") ExprIntrp_StackNodeOfStackOfGeneralFunction;
		 ExprIntrp_StackNodeOfStackOfGeneralFunction (const Handle_Expr_GeneralFunction & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralFunction
") Value;
		Handle_Expr_GeneralFunction & Value ();
};


%feature("shadow") ExprIntrp_StackNodeOfStackOfGeneralFunction::~ExprIntrp_StackNodeOfStackOfGeneralFunction %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ExprIntrp_StackNodeOfStackOfGeneralFunction {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ExprIntrp_StackNodeOfStackOfGeneralFunction {
	Handle_ExprIntrp_StackNodeOfStackOfGeneralFunction GetHandle() {
	return *(Handle_ExprIntrp_StackNodeOfStackOfGeneralFunction*) &$self;
	}
};

%nodefaultctor Handle_ExprIntrp_StackNodeOfStackOfGeneralFunction;
class Handle_ExprIntrp_StackNodeOfStackOfGeneralFunction : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_ExprIntrp_StackNodeOfStackOfGeneralFunction();
        Handle_ExprIntrp_StackNodeOfStackOfGeneralFunction(const Handle_ExprIntrp_StackNodeOfStackOfGeneralFunction &aHandle);
        Handle_ExprIntrp_StackNodeOfStackOfGeneralFunction(const ExprIntrp_StackNodeOfStackOfGeneralFunction *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ExprIntrp_StackNodeOfStackOfGeneralFunction DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ExprIntrp_StackNodeOfStackOfGeneralFunction {
    ExprIntrp_StackNodeOfStackOfGeneralFunction* GetObject() {
    return (ExprIntrp_StackNodeOfStackOfGeneralFunction*)$self->Access();
    }
};
%feature("shadow") Handle_ExprIntrp_StackNodeOfStackOfGeneralFunction::~Handle_ExprIntrp_StackNodeOfStackOfGeneralFunction %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ExprIntrp_StackNodeOfStackOfGeneralFunction {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ExprIntrp_StackNodeOfStackOfGeneralRelation;
class ExprIntrp_StackNodeOfStackOfGeneralRelation : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralRelation &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") ExprIntrp_StackNodeOfStackOfGeneralRelation;
		 ExprIntrp_StackNodeOfStackOfGeneralRelation (const Handle_Expr_GeneralRelation & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralRelation
") Value;
		Handle_Expr_GeneralRelation & Value ();
};


%feature("shadow") ExprIntrp_StackNodeOfStackOfGeneralRelation::~ExprIntrp_StackNodeOfStackOfGeneralRelation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ExprIntrp_StackNodeOfStackOfGeneralRelation {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ExprIntrp_StackNodeOfStackOfGeneralRelation {
	Handle_ExprIntrp_StackNodeOfStackOfGeneralRelation GetHandle() {
	return *(Handle_ExprIntrp_StackNodeOfStackOfGeneralRelation*) &$self;
	}
};

%nodefaultctor Handle_ExprIntrp_StackNodeOfStackOfGeneralRelation;
class Handle_ExprIntrp_StackNodeOfStackOfGeneralRelation : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_ExprIntrp_StackNodeOfStackOfGeneralRelation();
        Handle_ExprIntrp_StackNodeOfStackOfGeneralRelation(const Handle_ExprIntrp_StackNodeOfStackOfGeneralRelation &aHandle);
        Handle_ExprIntrp_StackNodeOfStackOfGeneralRelation(const ExprIntrp_StackNodeOfStackOfGeneralRelation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ExprIntrp_StackNodeOfStackOfGeneralRelation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ExprIntrp_StackNodeOfStackOfGeneralRelation {
    ExprIntrp_StackNodeOfStackOfGeneralRelation* GetObject() {
    return (ExprIntrp_StackNodeOfStackOfGeneralRelation*)$self->Access();
    }
};
%feature("shadow") Handle_ExprIntrp_StackNodeOfStackOfGeneralRelation::~Handle_ExprIntrp_StackNodeOfStackOfGeneralRelation %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ExprIntrp_StackNodeOfStackOfGeneralRelation {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ExprIntrp_StackNodeOfStackOfNames;
class ExprIntrp_StackNodeOfStackOfNames : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: TCollection_AsciiString &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") ExprIntrp_StackNodeOfStackOfNames;
		 ExprIntrp_StackNodeOfStackOfNames (const TCollection_AsciiString & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Value;
		TCollection_AsciiString & Value ();
};


%feature("shadow") ExprIntrp_StackNodeOfStackOfNames::~ExprIntrp_StackNodeOfStackOfNames %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ExprIntrp_StackNodeOfStackOfNames {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ExprIntrp_StackNodeOfStackOfNames {
	Handle_ExprIntrp_StackNodeOfStackOfNames GetHandle() {
	return *(Handle_ExprIntrp_StackNodeOfStackOfNames*) &$self;
	}
};

%nodefaultctor Handle_ExprIntrp_StackNodeOfStackOfNames;
class Handle_ExprIntrp_StackNodeOfStackOfNames : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_ExprIntrp_StackNodeOfStackOfNames();
        Handle_ExprIntrp_StackNodeOfStackOfNames(const Handle_ExprIntrp_StackNodeOfStackOfNames &aHandle);
        Handle_ExprIntrp_StackNodeOfStackOfNames(const ExprIntrp_StackNodeOfStackOfNames *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ExprIntrp_StackNodeOfStackOfNames DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ExprIntrp_StackNodeOfStackOfNames {
    ExprIntrp_StackNodeOfStackOfNames* GetObject() {
    return (ExprIntrp_StackNodeOfStackOfNames*)$self->Access();
    }
};
%feature("shadow") Handle_ExprIntrp_StackNodeOfStackOfNames::~Handle_ExprIntrp_StackNodeOfStackOfNames %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ExprIntrp_StackNodeOfStackOfNames {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ExprIntrp_StackOfGeneralExpression;
class ExprIntrp_StackOfGeneralExpression {
	public:
		%feature("autodoc", "	:rtype: None
") ExprIntrp_StackOfGeneralExpression;
		 ExprIntrp_StackOfGeneralExpression ();
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfGeneralExpression &
	:rtype: ExprIntrp_StackOfGeneralExpression
") Assign;
		const ExprIntrp_StackOfGeneralExpression & Assign (const ExprIntrp_StackOfGeneralExpression & Other);
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfGeneralExpression &
	:rtype: ExprIntrp_StackOfGeneralExpression
") operator=;
		const ExprIntrp_StackOfGeneralExpression & operator = (const ExprIntrp_StackOfGeneralExpression & Other);
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:rtype: int
") Depth;
		Standard_Integer Depth ();
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralExpression
") Top;
		const Handle_Expr_GeneralExpression & Top ();
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralExpression &
	:rtype: None
") Push;
		void Push (const Handle_Expr_GeneralExpression & I);
		%feature("autodoc", "	:rtype: None
") Pop;
		void Pop ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralExpression
") ChangeTop;
		Handle_Expr_GeneralExpression & ChangeTop ();
};


%feature("shadow") ExprIntrp_StackOfGeneralExpression::~ExprIntrp_StackOfGeneralExpression %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ExprIntrp_StackOfGeneralExpression {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ExprIntrp_StackOfGeneralFunction;
class ExprIntrp_StackOfGeneralFunction {
	public:
		%feature("autodoc", "	:rtype: None
") ExprIntrp_StackOfGeneralFunction;
		 ExprIntrp_StackOfGeneralFunction ();
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfGeneralFunction &
	:rtype: ExprIntrp_StackOfGeneralFunction
") Assign;
		const ExprIntrp_StackOfGeneralFunction & Assign (const ExprIntrp_StackOfGeneralFunction & Other);
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfGeneralFunction &
	:rtype: ExprIntrp_StackOfGeneralFunction
") operator=;
		const ExprIntrp_StackOfGeneralFunction & operator = (const ExprIntrp_StackOfGeneralFunction & Other);
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:rtype: int
") Depth;
		Standard_Integer Depth ();
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralFunction
") Top;
		const Handle_Expr_GeneralFunction & Top ();
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralFunction &
	:rtype: None
") Push;
		void Push (const Handle_Expr_GeneralFunction & I);
		%feature("autodoc", "	:rtype: None
") Pop;
		void Pop ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralFunction
") ChangeTop;
		Handle_Expr_GeneralFunction & ChangeTop ();
};


%feature("shadow") ExprIntrp_StackOfGeneralFunction::~ExprIntrp_StackOfGeneralFunction %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ExprIntrp_StackOfGeneralFunction {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ExprIntrp_StackOfGeneralRelation;
class ExprIntrp_StackOfGeneralRelation {
	public:
		%feature("autodoc", "	:rtype: None
") ExprIntrp_StackOfGeneralRelation;
		 ExprIntrp_StackOfGeneralRelation ();
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfGeneralRelation &
	:rtype: ExprIntrp_StackOfGeneralRelation
") Assign;
		const ExprIntrp_StackOfGeneralRelation & Assign (const ExprIntrp_StackOfGeneralRelation & Other);
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfGeneralRelation &
	:rtype: ExprIntrp_StackOfGeneralRelation
") operator=;
		const ExprIntrp_StackOfGeneralRelation & operator = (const ExprIntrp_StackOfGeneralRelation & Other);
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:rtype: int
") Depth;
		Standard_Integer Depth ();
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralRelation
") Top;
		const Handle_Expr_GeneralRelation & Top ();
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralRelation &
	:rtype: None
") Push;
		void Push (const Handle_Expr_GeneralRelation & I);
		%feature("autodoc", "	:rtype: None
") Pop;
		void Pop ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralRelation
") ChangeTop;
		Handle_Expr_GeneralRelation & ChangeTop ();
};


%feature("shadow") ExprIntrp_StackOfGeneralRelation::~ExprIntrp_StackOfGeneralRelation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ExprIntrp_StackOfGeneralRelation {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ExprIntrp_StackOfNames;
class ExprIntrp_StackOfNames {
	public:
		%feature("autodoc", "	:rtype: None
") ExprIntrp_StackOfNames;
		 ExprIntrp_StackOfNames ();
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfNames &
	:rtype: ExprIntrp_StackOfNames
") Assign;
		const ExprIntrp_StackOfNames & Assign (const ExprIntrp_StackOfNames & Other);
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfNames &
	:rtype: ExprIntrp_StackOfNames
") operator=;
		const ExprIntrp_StackOfNames & operator = (const ExprIntrp_StackOfNames & Other);
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:rtype: int
") Depth;
		Standard_Integer Depth ();
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Top;
		const TCollection_AsciiString & Top ();
		%feature("autodoc", "	:param I:
	:type I: TCollection_AsciiString &
	:rtype: None
") Push;
		void Push (const TCollection_AsciiString & I);
		%feature("autodoc", "	:rtype: None
") Pop;
		void Pop ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") ChangeTop;
		TCollection_AsciiString & ChangeTop ();
};


%feature("shadow") ExprIntrp_StackOfNames::~ExprIntrp_StackOfNames %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ExprIntrp_StackOfNames {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ExprIntrp_GenExp;
class ExprIntrp_GenExp : public ExprIntrp_Generator {
	public:
		%feature("autodoc", "	:rtype: Handle_ExprIntrp_GenExp
") Create;
		static Handle_ExprIntrp_GenExp Create ();
		%feature("autodoc", "	* Processes given string.

	:param str:
	:type str: TCollection_AsciiString &
	:rtype: None
") Process;
		void Process (const TCollection_AsciiString & str);
		%feature("autodoc", "	* Returns false if any syntax error has occurred during process.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns expression generated. Raises an exception if IsDone answers false.

	:rtype: Handle_Expr_GeneralExpression
") Expression;
		Handle_Expr_GeneralExpression Expression ();
};


%feature("shadow") ExprIntrp_GenExp::~ExprIntrp_GenExp %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ExprIntrp_GenExp {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ExprIntrp_GenExp {
	Handle_ExprIntrp_GenExp GetHandle() {
	return *(Handle_ExprIntrp_GenExp*) &$self;
	}
};

%nodefaultctor Handle_ExprIntrp_GenExp;
class Handle_ExprIntrp_GenExp : public Handle_ExprIntrp_Generator {

    public:
        // constructors
        Handle_ExprIntrp_GenExp();
        Handle_ExprIntrp_GenExp(const Handle_ExprIntrp_GenExp &aHandle);
        Handle_ExprIntrp_GenExp(const ExprIntrp_GenExp *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ExprIntrp_GenExp DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ExprIntrp_GenExp {
    ExprIntrp_GenExp* GetObject() {
    return (ExprIntrp_GenExp*)$self->Access();
    }
};
%feature("shadow") Handle_ExprIntrp_GenExp::~Handle_ExprIntrp_GenExp %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ExprIntrp_GenExp {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ExprIntrp_GenFct;
class ExprIntrp_GenFct : public ExprIntrp_Generator {
	public:
		%feature("autodoc", "	:rtype: Handle_ExprIntrp_GenFct
") Create;
		static Handle_ExprIntrp_GenFct Create ();
		%feature("autodoc", "	:param str:
	:type str: TCollection_AsciiString &
	:rtype: None
") Process;
		void Process (const TCollection_AsciiString & str);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
};


%feature("shadow") ExprIntrp_GenFct::~ExprIntrp_GenFct %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ExprIntrp_GenFct {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ExprIntrp_GenFct {
	Handle_ExprIntrp_GenFct GetHandle() {
	return *(Handle_ExprIntrp_GenFct*) &$self;
	}
};

%nodefaultctor Handle_ExprIntrp_GenFct;
class Handle_ExprIntrp_GenFct : public Handle_ExprIntrp_Generator {

    public:
        // constructors
        Handle_ExprIntrp_GenFct();
        Handle_ExprIntrp_GenFct(const Handle_ExprIntrp_GenFct &aHandle);
        Handle_ExprIntrp_GenFct(const ExprIntrp_GenFct *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ExprIntrp_GenFct DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ExprIntrp_GenFct {
    ExprIntrp_GenFct* GetObject() {
    return (ExprIntrp_GenFct*)$self->Access();
    }
};
%feature("shadow") Handle_ExprIntrp_GenFct::~Handle_ExprIntrp_GenFct %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ExprIntrp_GenFct {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ExprIntrp_GenRel;
class ExprIntrp_GenRel : public ExprIntrp_Generator {
	public:
		%feature("autodoc", "	:rtype: Handle_ExprIntrp_GenRel
") Create;
		static Handle_ExprIntrp_GenRel Create ();
		%feature("autodoc", "	* Processes given string.

	:param str:
	:type str: TCollection_AsciiString &
	:rtype: None
") Process;
		void Process (const TCollection_AsciiString & str);
		%feature("autodoc", "	* Returns false if any syntax error has occurred during process.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns relation generated. Raises an exception if IsDone answers false.

	:rtype: Handle_Expr_GeneralRelation
") Relation;
		Handle_Expr_GeneralRelation Relation ();
};


%feature("shadow") ExprIntrp_GenRel::~ExprIntrp_GenRel %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ExprIntrp_GenRel {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ExprIntrp_GenRel {
	Handle_ExprIntrp_GenRel GetHandle() {
	return *(Handle_ExprIntrp_GenRel*) &$self;
	}
};

%nodefaultctor Handle_ExprIntrp_GenRel;
class Handle_ExprIntrp_GenRel : public Handle_ExprIntrp_Generator {

    public:
        // constructors
        Handle_ExprIntrp_GenRel();
        Handle_ExprIntrp_GenRel(const Handle_ExprIntrp_GenRel &aHandle);
        Handle_ExprIntrp_GenRel(const ExprIntrp_GenRel *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ExprIntrp_GenRel DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ExprIntrp_GenRel {
    ExprIntrp_GenRel* GetObject() {
    return (ExprIntrp_GenRel*)$self->Access();
    }
};
%feature("shadow") Handle_ExprIntrp_GenRel::~Handle_ExprIntrp_GenRel %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ExprIntrp_GenRel {
    void _kill_pointed() {
        delete $self;
    }
};

