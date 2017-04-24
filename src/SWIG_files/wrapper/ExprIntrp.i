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


%extend ExprIntrp {
	%pythoncode {
	__repr__ = _dumps_object
	}
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


%extend ExprIntrp_Analysis {
	%pythoncode {
	__repr__ = _dumps_object
	}
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
    ExprIntrp_Generator* _get_reference() {
    return (ExprIntrp_Generator*)$self->Access();
    }
};

%extend Handle_ExprIntrp_Generator {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ExprIntrp_Generator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ExprIntrp_ListIteratorOfStackOfGeneralExpression;
class ExprIntrp_ListIteratorOfStackOfGeneralExpression {
	public:
		%feature("compactdefaultargs") ExprIntrp_ListIteratorOfStackOfGeneralExpression;
		%feature("autodoc", "	:rtype: None
") ExprIntrp_ListIteratorOfStackOfGeneralExpression;
		 ExprIntrp_ListIteratorOfStackOfGeneralExpression ();
		%feature("compactdefaultargs") ExprIntrp_ListIteratorOfStackOfGeneralExpression;
		%feature("autodoc", "	:param L:
	:type L: ExprIntrp_StackOfGeneralExpression &
	:rtype: None
") ExprIntrp_ListIteratorOfStackOfGeneralExpression;
		 ExprIntrp_ListIteratorOfStackOfGeneralExpression (const ExprIntrp_StackOfGeneralExpression & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: ExprIntrp_StackOfGeneralExpression &
	:rtype: None
") Initialize;
		void Initialize (const ExprIntrp_StackOfGeneralExpression & L);
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


%extend ExprIntrp_ListIteratorOfStackOfGeneralExpression {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ExprIntrp_ListIteratorOfStackOfGeneralFunction;
class ExprIntrp_ListIteratorOfStackOfGeneralFunction {
	public:
		%feature("compactdefaultargs") ExprIntrp_ListIteratorOfStackOfGeneralFunction;
		%feature("autodoc", "	:rtype: None
") ExprIntrp_ListIteratorOfStackOfGeneralFunction;
		 ExprIntrp_ListIteratorOfStackOfGeneralFunction ();
		%feature("compactdefaultargs") ExprIntrp_ListIteratorOfStackOfGeneralFunction;
		%feature("autodoc", "	:param L:
	:type L: ExprIntrp_StackOfGeneralFunction &
	:rtype: None
") ExprIntrp_ListIteratorOfStackOfGeneralFunction;
		 ExprIntrp_ListIteratorOfStackOfGeneralFunction (const ExprIntrp_StackOfGeneralFunction & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: ExprIntrp_StackOfGeneralFunction &
	:rtype: None
") Initialize;
		void Initialize (const ExprIntrp_StackOfGeneralFunction & L);
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


%extend ExprIntrp_ListIteratorOfStackOfGeneralFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ExprIntrp_ListIteratorOfStackOfGeneralRelation;
class ExprIntrp_ListIteratorOfStackOfGeneralRelation {
	public:
		%feature("compactdefaultargs") ExprIntrp_ListIteratorOfStackOfGeneralRelation;
		%feature("autodoc", "	:rtype: None
") ExprIntrp_ListIteratorOfStackOfGeneralRelation;
		 ExprIntrp_ListIteratorOfStackOfGeneralRelation ();
		%feature("compactdefaultargs") ExprIntrp_ListIteratorOfStackOfGeneralRelation;
		%feature("autodoc", "	:param L:
	:type L: ExprIntrp_StackOfGeneralRelation &
	:rtype: None
") ExprIntrp_ListIteratorOfStackOfGeneralRelation;
		 ExprIntrp_ListIteratorOfStackOfGeneralRelation (const ExprIntrp_StackOfGeneralRelation & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: ExprIntrp_StackOfGeneralRelation &
	:rtype: None
") Initialize;
		void Initialize (const ExprIntrp_StackOfGeneralRelation & L);
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


%extend ExprIntrp_ListIteratorOfStackOfGeneralRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ExprIntrp_ListNodeOfStackOfGeneralExpression;
class ExprIntrp_ListNodeOfStackOfGeneralExpression : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") ExprIntrp_ListNodeOfStackOfGeneralExpression;
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralExpression &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") ExprIntrp_ListNodeOfStackOfGeneralExpression;
		 ExprIntrp_ListNodeOfStackOfGeneralExpression (const Handle_Expr_GeneralExpression & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralExpression
") Value;
		Handle_Expr_GeneralExpression Value ();
};


%extend ExprIntrp_ListNodeOfStackOfGeneralExpression {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ExprIntrp_ListNodeOfStackOfGeneralExpression(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ExprIntrp_ListNodeOfStackOfGeneralExpression::Handle_ExprIntrp_ListNodeOfStackOfGeneralExpression %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ExprIntrp_ListNodeOfStackOfGeneralExpression;
class Handle_ExprIntrp_ListNodeOfStackOfGeneralExpression : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_ExprIntrp_ListNodeOfStackOfGeneralExpression();
        Handle_ExprIntrp_ListNodeOfStackOfGeneralExpression(const Handle_ExprIntrp_ListNodeOfStackOfGeneralExpression &aHandle);
        Handle_ExprIntrp_ListNodeOfStackOfGeneralExpression(const ExprIntrp_ListNodeOfStackOfGeneralExpression *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ExprIntrp_ListNodeOfStackOfGeneralExpression DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ExprIntrp_ListNodeOfStackOfGeneralExpression {
    ExprIntrp_ListNodeOfStackOfGeneralExpression* _get_reference() {
    return (ExprIntrp_ListNodeOfStackOfGeneralExpression*)$self->Access();
    }
};

%extend Handle_ExprIntrp_ListNodeOfStackOfGeneralExpression {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ExprIntrp_ListNodeOfStackOfGeneralExpression {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ExprIntrp_ListNodeOfStackOfGeneralFunction;
class ExprIntrp_ListNodeOfStackOfGeneralFunction : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") ExprIntrp_ListNodeOfStackOfGeneralFunction;
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralFunction &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") ExprIntrp_ListNodeOfStackOfGeneralFunction;
		 ExprIntrp_ListNodeOfStackOfGeneralFunction (const Handle_Expr_GeneralFunction & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralFunction
") Value;
		Handle_Expr_GeneralFunction Value ();
};


%extend ExprIntrp_ListNodeOfStackOfGeneralFunction {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ExprIntrp_ListNodeOfStackOfGeneralFunction(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ExprIntrp_ListNodeOfStackOfGeneralFunction::Handle_ExprIntrp_ListNodeOfStackOfGeneralFunction %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ExprIntrp_ListNodeOfStackOfGeneralFunction;
class Handle_ExprIntrp_ListNodeOfStackOfGeneralFunction : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_ExprIntrp_ListNodeOfStackOfGeneralFunction();
        Handle_ExprIntrp_ListNodeOfStackOfGeneralFunction(const Handle_ExprIntrp_ListNodeOfStackOfGeneralFunction &aHandle);
        Handle_ExprIntrp_ListNodeOfStackOfGeneralFunction(const ExprIntrp_ListNodeOfStackOfGeneralFunction *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ExprIntrp_ListNodeOfStackOfGeneralFunction DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ExprIntrp_ListNodeOfStackOfGeneralFunction {
    ExprIntrp_ListNodeOfStackOfGeneralFunction* _get_reference() {
    return (ExprIntrp_ListNodeOfStackOfGeneralFunction*)$self->Access();
    }
};

%extend Handle_ExprIntrp_ListNodeOfStackOfGeneralFunction {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ExprIntrp_ListNodeOfStackOfGeneralFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ExprIntrp_ListNodeOfStackOfGeneralRelation;
class ExprIntrp_ListNodeOfStackOfGeneralRelation : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") ExprIntrp_ListNodeOfStackOfGeneralRelation;
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralRelation &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") ExprIntrp_ListNodeOfStackOfGeneralRelation;
		 ExprIntrp_ListNodeOfStackOfGeneralRelation (const Handle_Expr_GeneralRelation & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralRelation
") Value;
		Handle_Expr_GeneralRelation Value ();
};


%extend ExprIntrp_ListNodeOfStackOfGeneralRelation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ExprIntrp_ListNodeOfStackOfGeneralRelation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ExprIntrp_ListNodeOfStackOfGeneralRelation::Handle_ExprIntrp_ListNodeOfStackOfGeneralRelation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ExprIntrp_ListNodeOfStackOfGeneralRelation;
class Handle_ExprIntrp_ListNodeOfStackOfGeneralRelation : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_ExprIntrp_ListNodeOfStackOfGeneralRelation();
        Handle_ExprIntrp_ListNodeOfStackOfGeneralRelation(const Handle_ExprIntrp_ListNodeOfStackOfGeneralRelation &aHandle);
        Handle_ExprIntrp_ListNodeOfStackOfGeneralRelation(const ExprIntrp_ListNodeOfStackOfGeneralRelation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ExprIntrp_ListNodeOfStackOfGeneralRelation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ExprIntrp_ListNodeOfStackOfGeneralRelation {
    ExprIntrp_ListNodeOfStackOfGeneralRelation* _get_reference() {
    return (ExprIntrp_ListNodeOfStackOfGeneralRelation*)$self->Access();
    }
};

%extend Handle_ExprIntrp_ListNodeOfStackOfGeneralRelation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ExprIntrp_ListNodeOfStackOfGeneralRelation {
	%pythoncode {
	__repr__ = _dumps_object
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
    ExprIntrp_SequenceNodeOfSequenceOfNamedExpression* _get_reference() {
    return (ExprIntrp_SequenceNodeOfSequenceOfNamedExpression*)$self->Access();
    }
};

%extend Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedExpression {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ExprIntrp_SequenceNodeOfSequenceOfNamedExpression {
	%pythoncode {
	__repr__ = _dumps_object
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
    ExprIntrp_SequenceNodeOfSequenceOfNamedFunction* _get_reference() {
    return (ExprIntrp_SequenceNodeOfSequenceOfNamedFunction*)$self->Access();
    }
};

%extend Handle_ExprIntrp_SequenceNodeOfSequenceOfNamedFunction {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ExprIntrp_SequenceNodeOfSequenceOfNamedFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ExprIntrp_SequenceOfNamedExpression;
class ExprIntrp_SequenceOfNamedExpression : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") ExprIntrp_SequenceOfNamedExpression;
		%feature("autodoc", "	:rtype: None
") ExprIntrp_SequenceOfNamedExpression;
		 ExprIntrp_SequenceOfNamedExpression ();
		%feature("compactdefaultargs") ExprIntrp_SequenceOfNamedExpression;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_SequenceOfNamedExpression &
	:rtype: None
") ExprIntrp_SequenceOfNamedExpression;
		 ExprIntrp_SequenceOfNamedExpression (const ExprIntrp_SequenceOfNamedExpression & Other);
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
") operator =;
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


%extend ExprIntrp_SequenceOfNamedExpression {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ExprIntrp_SequenceOfNamedFunction;
class ExprIntrp_SequenceOfNamedFunction : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") ExprIntrp_SequenceOfNamedFunction;
		%feature("autodoc", "	:rtype: None
") ExprIntrp_SequenceOfNamedFunction;
		 ExprIntrp_SequenceOfNamedFunction ();
		%feature("compactdefaultargs") ExprIntrp_SequenceOfNamedFunction;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_SequenceOfNamedFunction &
	:rtype: None
") ExprIntrp_SequenceOfNamedFunction;
		 ExprIntrp_SequenceOfNamedFunction (const ExprIntrp_SequenceOfNamedFunction & Other);
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
") operator =;
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


%extend ExprIntrp_SequenceOfNamedFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ExprIntrp_StackOfGeneralExpression;
class ExprIntrp_StackOfGeneralExpression {
	public:
		%feature("compactdefaultargs") ExprIntrp_StackOfGeneralExpression;
		%feature("autodoc", "	:rtype: None
") ExprIntrp_StackOfGeneralExpression;
		 ExprIntrp_StackOfGeneralExpression ();
		%feature("compactdefaultargs") ExprIntrp_StackOfGeneralExpression;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfGeneralExpression &
	:rtype: None
") ExprIntrp_StackOfGeneralExpression;
		 ExprIntrp_StackOfGeneralExpression (const ExprIntrp_StackOfGeneralExpression & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfGeneralExpression &
	:rtype: None
") Assign;
		void Assign (const ExprIntrp_StackOfGeneralExpression & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfGeneralExpression &
	:rtype: None
") operator =;
		void operator = (const ExprIntrp_StackOfGeneralExpression & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralExpression &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Expr_GeneralExpression & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralExpression &
	:param theIt:
	:type theIt: ExprIntrp_ListIteratorOfStackOfGeneralExpression &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Expr_GeneralExpression & I,ExprIntrp_ListIteratorOfStackOfGeneralExpression & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfGeneralExpression &
	:rtype: None
") Prepend;
		void Prepend (ExprIntrp_StackOfGeneralExpression & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralExpression &
	:rtype: None
") Append;
		void Append (const Handle_Expr_GeneralExpression & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralExpression &
	:param theIt:
	:type theIt: ExprIntrp_ListIteratorOfStackOfGeneralExpression &
	:rtype: None
") Append;
		void Append (const Handle_Expr_GeneralExpression & I,ExprIntrp_ListIteratorOfStackOfGeneralExpression & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfGeneralExpression &
	:rtype: None
") Append;
		void Append (ExprIntrp_StackOfGeneralExpression & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralExpression
") First;
		Handle_Expr_GeneralExpression First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralExpression
") Last;
		Handle_Expr_GeneralExpression Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: ExprIntrp_ListIteratorOfStackOfGeneralExpression &
	:rtype: None
") Remove;
		void Remove (ExprIntrp_ListIteratorOfStackOfGeneralExpression & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralExpression &
	:param It:
	:type It: ExprIntrp_ListIteratorOfStackOfGeneralExpression &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Handle_Expr_GeneralExpression & I,ExprIntrp_ListIteratorOfStackOfGeneralExpression & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfGeneralExpression &
	:param It:
	:type It: ExprIntrp_ListIteratorOfStackOfGeneralExpression &
	:rtype: None
") InsertBefore;
		void InsertBefore (ExprIntrp_StackOfGeneralExpression & Other,ExprIntrp_ListIteratorOfStackOfGeneralExpression & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralExpression &
	:param It:
	:type It: ExprIntrp_ListIteratorOfStackOfGeneralExpression &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Handle_Expr_GeneralExpression & I,ExprIntrp_ListIteratorOfStackOfGeneralExpression & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfGeneralExpression &
	:param It:
	:type It: ExprIntrp_ListIteratorOfStackOfGeneralExpression &
	:rtype: None
") InsertAfter;
		void InsertAfter (ExprIntrp_StackOfGeneralExpression & Other,ExprIntrp_ListIteratorOfStackOfGeneralExpression & It);
};


%extend ExprIntrp_StackOfGeneralExpression {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ExprIntrp_StackOfGeneralFunction;
class ExprIntrp_StackOfGeneralFunction {
	public:
		%feature("compactdefaultargs") ExprIntrp_StackOfGeneralFunction;
		%feature("autodoc", "	:rtype: None
") ExprIntrp_StackOfGeneralFunction;
		 ExprIntrp_StackOfGeneralFunction ();
		%feature("compactdefaultargs") ExprIntrp_StackOfGeneralFunction;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfGeneralFunction &
	:rtype: None
") ExprIntrp_StackOfGeneralFunction;
		 ExprIntrp_StackOfGeneralFunction (const ExprIntrp_StackOfGeneralFunction & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfGeneralFunction &
	:rtype: None
") Assign;
		void Assign (const ExprIntrp_StackOfGeneralFunction & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfGeneralFunction &
	:rtype: None
") operator =;
		void operator = (const ExprIntrp_StackOfGeneralFunction & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralFunction &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Expr_GeneralFunction & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralFunction &
	:param theIt:
	:type theIt: ExprIntrp_ListIteratorOfStackOfGeneralFunction &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Expr_GeneralFunction & I,ExprIntrp_ListIteratorOfStackOfGeneralFunction & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfGeneralFunction &
	:rtype: None
") Prepend;
		void Prepend (ExprIntrp_StackOfGeneralFunction & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralFunction &
	:rtype: None
") Append;
		void Append (const Handle_Expr_GeneralFunction & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralFunction &
	:param theIt:
	:type theIt: ExprIntrp_ListIteratorOfStackOfGeneralFunction &
	:rtype: None
") Append;
		void Append (const Handle_Expr_GeneralFunction & I,ExprIntrp_ListIteratorOfStackOfGeneralFunction & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfGeneralFunction &
	:rtype: None
") Append;
		void Append (ExprIntrp_StackOfGeneralFunction & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralFunction
") First;
		Handle_Expr_GeneralFunction First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralFunction
") Last;
		Handle_Expr_GeneralFunction Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: ExprIntrp_ListIteratorOfStackOfGeneralFunction &
	:rtype: None
") Remove;
		void Remove (ExprIntrp_ListIteratorOfStackOfGeneralFunction & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralFunction &
	:param It:
	:type It: ExprIntrp_ListIteratorOfStackOfGeneralFunction &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Handle_Expr_GeneralFunction & I,ExprIntrp_ListIteratorOfStackOfGeneralFunction & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfGeneralFunction &
	:param It:
	:type It: ExprIntrp_ListIteratorOfStackOfGeneralFunction &
	:rtype: None
") InsertBefore;
		void InsertBefore (ExprIntrp_StackOfGeneralFunction & Other,ExprIntrp_ListIteratorOfStackOfGeneralFunction & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralFunction &
	:param It:
	:type It: ExprIntrp_ListIteratorOfStackOfGeneralFunction &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Handle_Expr_GeneralFunction & I,ExprIntrp_ListIteratorOfStackOfGeneralFunction & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfGeneralFunction &
	:param It:
	:type It: ExprIntrp_ListIteratorOfStackOfGeneralFunction &
	:rtype: None
") InsertAfter;
		void InsertAfter (ExprIntrp_StackOfGeneralFunction & Other,ExprIntrp_ListIteratorOfStackOfGeneralFunction & It);
};


%extend ExprIntrp_StackOfGeneralFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ExprIntrp_StackOfGeneralRelation;
class ExprIntrp_StackOfGeneralRelation {
	public:
		%feature("compactdefaultargs") ExprIntrp_StackOfGeneralRelation;
		%feature("autodoc", "	:rtype: None
") ExprIntrp_StackOfGeneralRelation;
		 ExprIntrp_StackOfGeneralRelation ();
		%feature("compactdefaultargs") ExprIntrp_StackOfGeneralRelation;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfGeneralRelation &
	:rtype: None
") ExprIntrp_StackOfGeneralRelation;
		 ExprIntrp_StackOfGeneralRelation (const ExprIntrp_StackOfGeneralRelation & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfGeneralRelation &
	:rtype: None
") Assign;
		void Assign (const ExprIntrp_StackOfGeneralRelation & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfGeneralRelation &
	:rtype: None
") operator =;
		void operator = (const ExprIntrp_StackOfGeneralRelation & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralRelation &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Expr_GeneralRelation & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralRelation &
	:param theIt:
	:type theIt: ExprIntrp_ListIteratorOfStackOfGeneralRelation &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Expr_GeneralRelation & I,ExprIntrp_ListIteratorOfStackOfGeneralRelation & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfGeneralRelation &
	:rtype: None
") Prepend;
		void Prepend (ExprIntrp_StackOfGeneralRelation & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralRelation &
	:rtype: None
") Append;
		void Append (const Handle_Expr_GeneralRelation & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralRelation &
	:param theIt:
	:type theIt: ExprIntrp_ListIteratorOfStackOfGeneralRelation &
	:rtype: None
") Append;
		void Append (const Handle_Expr_GeneralRelation & I,ExprIntrp_ListIteratorOfStackOfGeneralRelation & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfGeneralRelation &
	:rtype: None
") Append;
		void Append (ExprIntrp_StackOfGeneralRelation & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralRelation
") First;
		Handle_Expr_GeneralRelation First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Expr_GeneralRelation
") Last;
		Handle_Expr_GeneralRelation Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: ExprIntrp_ListIteratorOfStackOfGeneralRelation &
	:rtype: None
") Remove;
		void Remove (ExprIntrp_ListIteratorOfStackOfGeneralRelation & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralRelation &
	:param It:
	:type It: ExprIntrp_ListIteratorOfStackOfGeneralRelation &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Handle_Expr_GeneralRelation & I,ExprIntrp_ListIteratorOfStackOfGeneralRelation & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfGeneralRelation &
	:param It:
	:type It: ExprIntrp_ListIteratorOfStackOfGeneralRelation &
	:rtype: None
") InsertBefore;
		void InsertBefore (ExprIntrp_StackOfGeneralRelation & Other,ExprIntrp_ListIteratorOfStackOfGeneralRelation & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: Handle_Expr_GeneralRelation &
	:param It:
	:type It: ExprIntrp_ListIteratorOfStackOfGeneralRelation &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Handle_Expr_GeneralRelation & I,ExprIntrp_ListIteratorOfStackOfGeneralRelation & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: ExprIntrp_StackOfGeneralRelation &
	:param It:
	:type It: ExprIntrp_ListIteratorOfStackOfGeneralRelation &
	:rtype: None
") InsertAfter;
		void InsertAfter (ExprIntrp_StackOfGeneralRelation & Other,ExprIntrp_ListIteratorOfStackOfGeneralRelation & It);
};


%extend ExprIntrp_StackOfGeneralRelation {
	%pythoncode {
	__repr__ = _dumps_object
	}
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
    ExprIntrp_GenExp* _get_reference() {
    return (ExprIntrp_GenExp*)$self->Access();
    }
};

%extend Handle_ExprIntrp_GenExp {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ExprIntrp_GenExp {
	%pythoncode {
	__repr__ = _dumps_object
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
    ExprIntrp_GenFct* _get_reference() {
    return (ExprIntrp_GenFct*)$self->Access();
    }
};

%extend Handle_ExprIntrp_GenFct {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ExprIntrp_GenFct {
	%pythoncode {
	__repr__ = _dumps_object
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
    ExprIntrp_GenRel* _get_reference() {
    return (ExprIntrp_GenRel*)$self->Access();
    }
};

%extend Handle_ExprIntrp_GenRel {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ExprIntrp_GenRel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
