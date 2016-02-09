/*
Copyright 2008-2015 Thomas Paviot (tpaviot@gmail.com)


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
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include ExprIntrp_headers.i


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

%rename(exprintrp) ExprIntrp;
%nodefaultctor ExprIntrp;
class ExprIntrp {
	public:
};


%nodefaultctor ExprIntrp_Analysis;
class ExprIntrp_Analysis {
	public:
		%feature("compactdefaultargs") ExprIntrp_Analysis;
		%feature("autodoc", "	:rtype: None
") ExprIntrp_Analysis;
		 ExprIntrp_Analysis ();
		%feature("compactdefaultargs") SetMaster;
		%feature("autodoc", "	:param agen:
	:type agen: Handle_ExprIntrp_Generator &
	:rtype: None
") SetMaster;
		void SetMaster (const Handle_ExprIntrp_Generator & agen);
		%feature("compactdefaultargs") Push;
		%feature("autodoc", "	:param exp:
	:type exp: Handle_Expr_GeneralExpression &
	:rtype: None
") Push;
		void Push (const Handle_Expr_GeneralExpression & exp);
		%feature("compactdefaultargs") PushRelation;
		%feature("autodoc", "	:param rel:
	:type rel: Handle_Expr_GeneralRelation &
	:rtype: None
") PushRelation;
		void PushRelation (const Handle_Expr_GeneralRelation & rel);
		%feature("compactdefaultargs") PushName;
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:rtype: None
") PushName;
		void PushName (const TCollection_AsciiString & name);
		%feature("compactdefaultargs") PushValue;
		%feature("autodoc", "	:param degree:
	:type degree: int
	:rtype: None
") PushValue;
		void PushValue (const Standard_Integer degree);
		%feature("compactdefaultargs") PushFunction;
		%feature("autodoc", "	:param func:
	:type func: Handle_Expr_GeneralFunction &
	:rtype: None
") PushFunction;
		void PushFunction (const Handle_Expr_GeneralFunction & func);
		%feature("compactdefaultargs") Pop;
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralExpression
") Pop;
		Handle_Expr_GeneralExpression Pop ();
		%feature("compactdefaultargs") PopRelation;
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralRelation
") PopRelation;
		Handle_Expr_GeneralRelation PopRelation ();
		%feature("compactdefaultargs") PopName;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") PopName;
		TCollection_AsciiString PopName ();
		%feature("compactdefaultargs") PopValue;
		%feature("autodoc", "	:rtype: int
") PopValue;
		Standard_Integer PopValue ();
		%feature("compactdefaultargs") PopFunction;
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralFunction
") PopFunction;
		Handle_Expr_GeneralFunction PopFunction ();
		%feature("compactdefaultargs") IsExpStackEmpty;
		%feature("autodoc", "	:rtype: bool
") IsExpStackEmpty;
		Standard_Boolean IsExpStackEmpty ();
		%feature("compactdefaultargs") IsRelStackEmpty;
		%feature("autodoc", "	:rtype: bool
") IsRelStackEmpty;
		Standard_Boolean IsRelStackEmpty ();
		%feature("compactdefaultargs") ResetAll;
		%feature("autodoc", "	:rtype: None
") ResetAll;
		void ResetAll ();
		%feature("compactdefaultargs") Use;
		%feature("autodoc", "	:param func:
	:type func: Handle_Expr_NamedFunction &
	:rtype: None
") Use;
		void Use (const Handle_Expr_NamedFunction & func);
		%feature("compactdefaultargs") Use;
		%feature("autodoc", "	:param named:
	:type named: Handle_Expr_NamedExpression &
	:rtype: None
") Use;
		void Use (const Handle_Expr_NamedExpression & named);
		%feature("compactdefaultargs") GetNamed;
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:rtype: Handle_Expr_NamedExpression
") GetNamed;
		Handle_Expr_NamedExpression GetNamed (const TCollection_AsciiString & name);
		%feature("compactdefaultargs") GetFunction;
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:rtype: Handle_Expr_NamedFunction
") GetFunction;
		Handle_Expr_NamedFunction GetFunction (const TCollection_AsciiString & name);
};


%nodefaultctor ExprIntrp_Generator;
class ExprIntrp_Generator : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Use;
		%feature("autodoc", "	:param func:
	:type func: Handle_Expr_NamedFunction &
	:rtype: None
") Use;
		void Use (const Handle_Expr_NamedFunction & func);
		%feature("compactdefaultargs") Use;
		%feature("autodoc", "	:param named:
	:type named: Handle_Expr_NamedExpression &
	:rtype: None
") Use;
		void Use (const Handle_Expr_NamedExpression & named);
		%feature("compactdefaultargs") GetNamed;
		%feature("autodoc", "	:rtype: ExprIntrp_SequenceOfNamedExpression
") GetNamed;
		const ExprIntrp_SequenceOfNamedExpression & GetNamed ();
		%feature("compactdefaultargs") GetFunctions;
		%feature("autodoc", "	:rtype: ExprIntrp_SequenceOfNamedFunction
") GetFunctions;
		const ExprIntrp_SequenceOfNamedFunction & GetFunctions ();
		%feature("compactdefaultargs") GetNamed;
		%feature("autodoc", "	* Returns NamedExpression with name <name> already interpreted if it exists. Returns a null handle if not.

	:param name:
	:type name: TCollection_AsciiString &
	:rtype: Handle_Expr_NamedExpression
") GetNamed;
		Handle_Expr_NamedExpression GetNamed (const TCollection_AsciiString & name);
		%feature("compactdefaultargs") GetFunction;
		%feature("autodoc", "	* Returns NamedFunction with name <name> already interpreted if it exists. Returns a null handle if not.

	:param name:
	:type name: TCollection_AsciiString &
	:rtype: Handle_Expr_NamedFunction
") GetFunction;
		Handle_Expr_NamedFunction GetFunction (const TCollection_AsciiString & name);
};


%extend ExprIntrp_Generator {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ExprIntrp_Generator(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ExprIntrp_Generator::Handle_ExprIntrp_Generator %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor ExprIntrp_SequenceNodeOfSequenceOfNamedExpression;
class ExprIntrp_SequenceNodeOfSequenceOfNamedExpression : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") ExprIntrp_SequenceNodeOfSequenceOfNamedExpression;
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_NamedExpression &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") ExprIntrp_SequenceNodeOfSequenceOfNamedExpression;
		 ExprIntrp_SequenceNodeOfSequenceOfNamedExpression (const Handle_Expr_NamedExpression & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Expr_NamedExpression
") Value;
		Handle_Expr_NamedExpression Value ();
};


%extend ExprIntrp_SequenceNodeOfSequenceOfNamedExpression {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedExpression(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedExpression::Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedExpression %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor ExprIntrp_SequenceNodeOfSequenceOfNamedFunction;
class ExprIntrp_SequenceNodeOfSequenceOfNamedFunction : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") ExprIntrp_SequenceNodeOfSequenceOfNamedFunction;
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_NamedFunction &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") ExprIntrp_SequenceNodeOfSequenceOfNamedFunction;
		 ExprIntrp_SequenceNodeOfSequenceOfNamedFunction (const Handle_Expr_NamedFunction & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Expr_NamedFunction
") Value;
		Handle_Expr_NamedFunction Value ();
};


%extend ExprIntrp_SequenceNodeOfSequenceOfNamedFunction {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedFunction(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedFunction::Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedFunction %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor ExprIntrp_SequenceOfNamedExpression;
class ExprIntrp_SequenceOfNamedExpression : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") ExprIntrp_SequenceOfNamedExpression;
		%feature("autodoc", "	:rtype: None
") ExprIntrp_SequenceOfNamedExpression;
		 ExprIntrp_SequenceOfNamedExpression ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_SequenceOfNamedExpression &
	:rtype: ExprIntrp_SequenceOfNamedExpression
") Assign;
		const ExprIntrp_SequenceOfNamedExpression & Assign (const ExprIntrp_SequenceOfNamedExpression & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_SequenceOfNamedExpression &
	:rtype: ExprIntrp_SequenceOfNamedExpression
") operator=;
		const ExprIntrp_SequenceOfNamedExpression & operator = (const ExprIntrp_SequenceOfNamedExpression & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_Expr_NamedExpression &
	:rtype: None
") Append;
		void Append (const Handle_Expr_NamedExpression & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: ExprIntrp_SequenceOfNamedExpression &
	:rtype: None
") Append;
		void Append (ExprIntrp_SequenceOfNamedExpression & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_Expr_NamedExpression &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Expr_NamedExpression & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: ExprIntrp_SequenceOfNamedExpression &
	:rtype: None
") Prepend;
		void Prepend (ExprIntrp_SequenceOfNamedExpression & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Expr_NamedExpression &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Expr_NamedExpression & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: ExprIntrp_SequenceOfNamedExpression &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,ExprIntrp_SequenceOfNamedExpression & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Expr_NamedExpression &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Expr_NamedExpression & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: ExprIntrp_SequenceOfNamedExpression &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,ExprIntrp_SequenceOfNamedExpression & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Expr_NamedExpression
") First;
		Handle_Expr_NamedExpression First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Expr_NamedExpression
") Last;
		Handle_Expr_NamedExpression Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: ExprIntrp_SequenceOfNamedExpression &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,ExprIntrp_SequenceOfNamedExpression & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Expr_NamedExpression
") Value;
		Handle_Expr_NamedExpression Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_Expr_NamedExpression &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Expr_NamedExpression & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Expr_NamedExpression
") ChangeValue;
		Handle_Expr_NamedExpression ChangeValue (const Standard_Integer Index);
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


%nodefaultctor ExprIntrp_SequenceOfNamedFunction;
class ExprIntrp_SequenceOfNamedFunction : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") ExprIntrp_SequenceOfNamedFunction;
		%feature("autodoc", "	:rtype: None
") ExprIntrp_SequenceOfNamedFunction;
		 ExprIntrp_SequenceOfNamedFunction ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_SequenceOfNamedFunction &
	:rtype: ExprIntrp_SequenceOfNamedFunction
") Assign;
		const ExprIntrp_SequenceOfNamedFunction & Assign (const ExprIntrp_SequenceOfNamedFunction & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_SequenceOfNamedFunction &
	:rtype: ExprIntrp_SequenceOfNamedFunction
") operator=;
		const ExprIntrp_SequenceOfNamedFunction & operator = (const ExprIntrp_SequenceOfNamedFunction & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_Expr_NamedFunction &
	:rtype: None
") Append;
		void Append (const Handle_Expr_NamedFunction & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: ExprIntrp_SequenceOfNamedFunction &
	:rtype: None
") Append;
		void Append (ExprIntrp_SequenceOfNamedFunction & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_Expr_NamedFunction &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Expr_NamedFunction & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: ExprIntrp_SequenceOfNamedFunction &
	:rtype: None
") Prepend;
		void Prepend (ExprIntrp_SequenceOfNamedFunction & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Expr_NamedFunction &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Expr_NamedFunction & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: ExprIntrp_SequenceOfNamedFunction &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,ExprIntrp_SequenceOfNamedFunction & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Expr_NamedFunction &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Expr_NamedFunction & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: ExprIntrp_SequenceOfNamedFunction &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,ExprIntrp_SequenceOfNamedFunction & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Expr_NamedFunction
") First;
		Handle_Expr_NamedFunction First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Expr_NamedFunction
") Last;
		Handle_Expr_NamedFunction Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: ExprIntrp_SequenceOfNamedFunction &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,ExprIntrp_SequenceOfNamedFunction & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Expr_NamedFunction
") Value;
		Handle_Expr_NamedFunction Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_Expr_NamedFunction &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Expr_NamedFunction & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Expr_NamedFunction
") ChangeValue;
		Handle_Expr_NamedFunction ChangeValue (const Standard_Integer Index);
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


%nodefaultctor ExprIntrp_StackIteratorOfStackOfGeneralExpression;
class ExprIntrp_StackIteratorOfStackOfGeneralExpression {
	public:
		%feature("compactdefaultargs") ExprIntrp_StackIteratorOfStackOfGeneralExpression;
		%feature("autodoc", "	:rtype: None
") ExprIntrp_StackIteratorOfStackOfGeneralExpression;
		 ExprIntrp_StackIteratorOfStackOfGeneralExpression ();
		%feature("compactdefaultargs") ExprIntrp_StackIteratorOfStackOfGeneralExpression;
		%feature("autodoc", "	:param S:
	:type S: ExprIntrp_StackOfGeneralExpression &
	:rtype: None
") ExprIntrp_StackIteratorOfStackOfGeneralExpression;
		 ExprIntrp_StackIteratorOfStackOfGeneralExpression (const ExprIntrp_StackOfGeneralExpression & S);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param S:
	:type S: ExprIntrp_StackOfGeneralExpression &
	:rtype: None
") Initialize;
		void Initialize (const ExprIntrp_StackOfGeneralExpression & S);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralExpression
") Value;
		Handle_Expr_GeneralExpression Value ();
};


%nodefaultctor ExprIntrp_StackIteratorOfStackOfGeneralFunction;
class ExprIntrp_StackIteratorOfStackOfGeneralFunction {
	public:
		%feature("compactdefaultargs") ExprIntrp_StackIteratorOfStackOfGeneralFunction;
		%feature("autodoc", "	:rtype: None
") ExprIntrp_StackIteratorOfStackOfGeneralFunction;
		 ExprIntrp_StackIteratorOfStackOfGeneralFunction ();
		%feature("compactdefaultargs") ExprIntrp_StackIteratorOfStackOfGeneralFunction;
		%feature("autodoc", "	:param S:
	:type S: ExprIntrp_StackOfGeneralFunction &
	:rtype: None
") ExprIntrp_StackIteratorOfStackOfGeneralFunction;
		 ExprIntrp_StackIteratorOfStackOfGeneralFunction (const ExprIntrp_StackOfGeneralFunction & S);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param S:
	:type S: ExprIntrp_StackOfGeneralFunction &
	:rtype: None
") Initialize;
		void Initialize (const ExprIntrp_StackOfGeneralFunction & S);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralFunction
") Value;
		Handle_Expr_GeneralFunction Value ();
};


%nodefaultctor ExprIntrp_StackIteratorOfStackOfGeneralRelation;
class ExprIntrp_StackIteratorOfStackOfGeneralRelation {
	public:
		%feature("compactdefaultargs") ExprIntrp_StackIteratorOfStackOfGeneralRelation;
		%feature("autodoc", "	:rtype: None
") ExprIntrp_StackIteratorOfStackOfGeneralRelation;
		 ExprIntrp_StackIteratorOfStackOfGeneralRelation ();
		%feature("compactdefaultargs") ExprIntrp_StackIteratorOfStackOfGeneralRelation;
		%feature("autodoc", "	:param S:
	:type S: ExprIntrp_StackOfGeneralRelation &
	:rtype: None
") ExprIntrp_StackIteratorOfStackOfGeneralRelation;
		 ExprIntrp_StackIteratorOfStackOfGeneralRelation (const ExprIntrp_StackOfGeneralRelation & S);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param S:
	:type S: ExprIntrp_StackOfGeneralRelation &
	:rtype: None
") Initialize;
		void Initialize (const ExprIntrp_StackOfGeneralRelation & S);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralRelation
") Value;
		Handle_Expr_GeneralRelation Value ();
};


%nodefaultctor ExprIntrp_StackIteratorOfStackOfNames;
class ExprIntrp_StackIteratorOfStackOfNames {
	public:
		%feature("compactdefaultargs") ExprIntrp_StackIteratorOfStackOfNames;
		%feature("autodoc", "	:rtype: None
") ExprIntrp_StackIteratorOfStackOfNames;
		 ExprIntrp_StackIteratorOfStackOfNames ();
		%feature("compactdefaultargs") ExprIntrp_StackIteratorOfStackOfNames;
		%feature("autodoc", "	:param S:
	:type S: ExprIntrp_StackOfNames &
	:rtype: None
") ExprIntrp_StackIteratorOfStackOfNames;
		 ExprIntrp_StackIteratorOfStackOfNames (const ExprIntrp_StackOfNames & S);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param S:
	:type S: ExprIntrp_StackOfNames &
	:rtype: None
") Initialize;
		void Initialize (const ExprIntrp_StackOfNames & S);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Value;
		const TCollection_AsciiString & Value ();
};


%nodefaultctor ExprIntrp_StackNodeOfStackOfGeneralExpression;
class ExprIntrp_StackNodeOfStackOfGeneralExpression : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") ExprIntrp_StackNodeOfStackOfGeneralExpression;
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralExpression &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") ExprIntrp_StackNodeOfStackOfGeneralExpression;
		 ExprIntrp_StackNodeOfStackOfGeneralExpression (const Handle_Expr_GeneralExpression & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralExpression
") Value;
		Handle_Expr_GeneralExpression Value ();
};


%extend ExprIntrp_StackNodeOfStackOfGeneralExpression {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ExprIntrp_StackNodeOfStackOfGeneralExpression(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ExprIntrp_StackNodeOfStackOfGeneralExpression::Handle_ExprIntrp_StackNodeOfStackOfGeneralExpression %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor ExprIntrp_StackNodeOfStackOfGeneralFunction;
class ExprIntrp_StackNodeOfStackOfGeneralFunction : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") ExprIntrp_StackNodeOfStackOfGeneralFunction;
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralFunction &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") ExprIntrp_StackNodeOfStackOfGeneralFunction;
		 ExprIntrp_StackNodeOfStackOfGeneralFunction (const Handle_Expr_GeneralFunction & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralFunction
") Value;
		Handle_Expr_GeneralFunction Value ();
};


%extend ExprIntrp_StackNodeOfStackOfGeneralFunction {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ExprIntrp_StackNodeOfStackOfGeneralFunction(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ExprIntrp_StackNodeOfStackOfGeneralFunction::Handle_ExprIntrp_StackNodeOfStackOfGeneralFunction %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor ExprIntrp_StackNodeOfStackOfGeneralRelation;
class ExprIntrp_StackNodeOfStackOfGeneralRelation : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") ExprIntrp_StackNodeOfStackOfGeneralRelation;
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralRelation &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") ExprIntrp_StackNodeOfStackOfGeneralRelation;
		 ExprIntrp_StackNodeOfStackOfGeneralRelation (const Handle_Expr_GeneralRelation & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralRelation
") Value;
		Handle_Expr_GeneralRelation Value ();
};


%extend ExprIntrp_StackNodeOfStackOfGeneralRelation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ExprIntrp_StackNodeOfStackOfGeneralRelation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ExprIntrp_StackNodeOfStackOfGeneralRelation::Handle_ExprIntrp_StackNodeOfStackOfGeneralRelation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor ExprIntrp_StackNodeOfStackOfNames;
class ExprIntrp_StackNodeOfStackOfNames : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") ExprIntrp_StackNodeOfStackOfNames;
		%feature("autodoc", "	:param I:
	:type I: TCollection_AsciiString &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") ExprIntrp_StackNodeOfStackOfNames;
		 ExprIntrp_StackNodeOfStackOfNames (const TCollection_AsciiString & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Value;
		TCollection_AsciiString & Value ();
};


%extend ExprIntrp_StackNodeOfStackOfNames {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ExprIntrp_StackNodeOfStackOfNames(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ExprIntrp_StackNodeOfStackOfNames::Handle_ExprIntrp_StackNodeOfStackOfNames %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor ExprIntrp_StackOfGeneralExpression;
class ExprIntrp_StackOfGeneralExpression {
	public:
		%feature("compactdefaultargs") ExprIntrp_StackOfGeneralExpression;
		%feature("autodoc", "	:rtype: None
") ExprIntrp_StackOfGeneralExpression;
		 ExprIntrp_StackOfGeneralExpression ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfGeneralExpression &
	:rtype: ExprIntrp_StackOfGeneralExpression
") Assign;
		const ExprIntrp_StackOfGeneralExpression & Assign (const ExprIntrp_StackOfGeneralExpression & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfGeneralExpression &
	:rtype: ExprIntrp_StackOfGeneralExpression
") operator=;
		const ExprIntrp_StackOfGeneralExpression & operator = (const ExprIntrp_StackOfGeneralExpression & Other);
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "	:rtype: int
") Depth;
		Standard_Integer Depth ();
		%feature("compactdefaultargs") Top;
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralExpression
") Top;
		Handle_Expr_GeneralExpression Top ();
		%feature("compactdefaultargs") Push;
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralExpression &
	:rtype: None
") Push;
		void Push (const Handle_Expr_GeneralExpression & I);
		%feature("compactdefaultargs") Pop;
		%feature("autodoc", "	:rtype: None
") Pop;
		void Pop ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") ChangeTop;
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralExpression
") ChangeTop;
		Handle_Expr_GeneralExpression ChangeTop ();
};


%nodefaultctor ExprIntrp_StackOfGeneralFunction;
class ExprIntrp_StackOfGeneralFunction {
	public:
		%feature("compactdefaultargs") ExprIntrp_StackOfGeneralFunction;
		%feature("autodoc", "	:rtype: None
") ExprIntrp_StackOfGeneralFunction;
		 ExprIntrp_StackOfGeneralFunction ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfGeneralFunction &
	:rtype: ExprIntrp_StackOfGeneralFunction
") Assign;
		const ExprIntrp_StackOfGeneralFunction & Assign (const ExprIntrp_StackOfGeneralFunction & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfGeneralFunction &
	:rtype: ExprIntrp_StackOfGeneralFunction
") operator=;
		const ExprIntrp_StackOfGeneralFunction & operator = (const ExprIntrp_StackOfGeneralFunction & Other);
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "	:rtype: int
") Depth;
		Standard_Integer Depth ();
		%feature("compactdefaultargs") Top;
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralFunction
") Top;
		Handle_Expr_GeneralFunction Top ();
		%feature("compactdefaultargs") Push;
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralFunction &
	:rtype: None
") Push;
		void Push (const Handle_Expr_GeneralFunction & I);
		%feature("compactdefaultargs") Pop;
		%feature("autodoc", "	:rtype: None
") Pop;
		void Pop ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") ChangeTop;
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralFunction
") ChangeTop;
		Handle_Expr_GeneralFunction ChangeTop ();
};


%nodefaultctor ExprIntrp_StackOfGeneralRelation;
class ExprIntrp_StackOfGeneralRelation {
	public:
		%feature("compactdefaultargs") ExprIntrp_StackOfGeneralRelation;
		%feature("autodoc", "	:rtype: None
") ExprIntrp_StackOfGeneralRelation;
		 ExprIntrp_StackOfGeneralRelation ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfGeneralRelation &
	:rtype: ExprIntrp_StackOfGeneralRelation
") Assign;
		const ExprIntrp_StackOfGeneralRelation & Assign (const ExprIntrp_StackOfGeneralRelation & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfGeneralRelation &
	:rtype: ExprIntrp_StackOfGeneralRelation
") operator=;
		const ExprIntrp_StackOfGeneralRelation & operator = (const ExprIntrp_StackOfGeneralRelation & Other);
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "	:rtype: int
") Depth;
		Standard_Integer Depth ();
		%feature("compactdefaultargs") Top;
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralRelation
") Top;
		Handle_Expr_GeneralRelation Top ();
		%feature("compactdefaultargs") Push;
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralRelation &
	:rtype: None
") Push;
		void Push (const Handle_Expr_GeneralRelation & I);
		%feature("compactdefaultargs") Pop;
		%feature("autodoc", "	:rtype: None
") Pop;
		void Pop ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") ChangeTop;
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralRelation
") ChangeTop;
		Handle_Expr_GeneralRelation ChangeTop ();
};


%nodefaultctor ExprIntrp_StackOfNames;
class ExprIntrp_StackOfNames {
	public:
		%feature("compactdefaultargs") ExprIntrp_StackOfNames;
		%feature("autodoc", "	:rtype: None
") ExprIntrp_StackOfNames;
		 ExprIntrp_StackOfNames ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfNames &
	:rtype: ExprIntrp_StackOfNames
") Assign;
		const ExprIntrp_StackOfNames & Assign (const ExprIntrp_StackOfNames & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfNames &
	:rtype: ExprIntrp_StackOfNames
") operator=;
		const ExprIntrp_StackOfNames & operator = (const ExprIntrp_StackOfNames & Other);
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "	:rtype: int
") Depth;
		Standard_Integer Depth ();
		%feature("compactdefaultargs") Top;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Top;
		const TCollection_AsciiString & Top ();
		%feature("compactdefaultargs") Push;
		%feature("autodoc", "	:param I:
	:type I: TCollection_AsciiString &
	:rtype: None
") Push;
		void Push (const TCollection_AsciiString & I);
		%feature("compactdefaultargs") Pop;
		%feature("autodoc", "	:rtype: None
") Pop;
		void Pop ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") ChangeTop;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") ChangeTop;
		TCollection_AsciiString & ChangeTop ();
};


%nodefaultctor ExprIntrp_GenExp;
class ExprIntrp_GenExp : public ExprIntrp_Generator {
	public:
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "	:rtype: Handle_ExprIntrp_GenExp
") Create;
		static Handle_ExprIntrp_GenExp Create ();
		%feature("compactdefaultargs") Process;
		%feature("autodoc", "	* Processes given string.

	:param str:
	:type str: TCollection_AsciiString &
	:rtype: None
") Process;
		void Process (const TCollection_AsciiString & str);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns false if any syntax error has occurred during process.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Expression;
		%feature("autodoc", "	* Returns expression generated. Raises an exception if IsDone answers false.

	:rtype: Handle_Expr_GeneralExpression
") Expression;
		Handle_Expr_GeneralExpression Expression ();
};


%extend ExprIntrp_GenExp {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ExprIntrp_GenExp(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ExprIntrp_GenExp::Handle_ExprIntrp_GenExp %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor ExprIntrp_GenFct;
class ExprIntrp_GenFct : public ExprIntrp_Generator {
	public:
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "	:rtype: Handle_ExprIntrp_GenFct
") Create;
		static Handle_ExprIntrp_GenFct Create ();
		%feature("compactdefaultargs") Process;
		%feature("autodoc", "	:param str:
	:type str: TCollection_AsciiString &
	:rtype: None
") Process;
		void Process (const TCollection_AsciiString & str);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
};


%extend ExprIntrp_GenFct {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ExprIntrp_GenFct(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ExprIntrp_GenFct::Handle_ExprIntrp_GenFct %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor ExprIntrp_GenRel;
class ExprIntrp_GenRel : public ExprIntrp_Generator {
	public:
		%feature("compactdefaultargs") Create;
		%feature("autodoc", "	:rtype: Handle_ExprIntrp_GenRel
") Create;
		static Handle_ExprIntrp_GenRel Create ();
		%feature("compactdefaultargs") Process;
		%feature("autodoc", "	* Processes given string.

	:param str:
	:type str: TCollection_AsciiString &
	:rtype: None
") Process;
		void Process (const TCollection_AsciiString & str);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns false if any syntax error has occurred during process.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Relation;
		%feature("autodoc", "	* Returns relation generated. Raises an exception if IsDone answers false.

	:rtype: Handle_Expr_GeneralRelation
") Relation;
		Handle_Expr_GeneralRelation Relation ();
};


%extend ExprIntrp_GenRel {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ExprIntrp_GenRel(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ExprIntrp_GenRel::Handle_ExprIntrp_GenRel %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

