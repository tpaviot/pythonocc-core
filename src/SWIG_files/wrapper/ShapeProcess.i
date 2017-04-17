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
%module (package="OCC") ShapeProcess

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


%include ShapeProcess_headers.i


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
typedef Standard_Boolean ( * ShapeProcess_OperFunc ) ( const Handle_ShapeProcess_Context & context );
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(shapeprocess) ShapeProcess;
class ShapeProcess {
	public:
		%feature("compactdefaultargs") RegisterOperator;
		%feature("autodoc", "	* Registers operator to make it visible for Performer

	:param name:
	:type name: char *
	:param op:
	:type op: Handle_ShapeProcess_Operator &
	:rtype: bool
") RegisterOperator;
		static Standard_Boolean RegisterOperator (const char * name,const Handle_ShapeProcess_Operator & op);
		%feature("compactdefaultargs") FindOperator;
		%feature("autodoc", "	* Finds operator by its name

	:param name:
	:type name: char *
	:param op:
	:type op: Handle_ShapeProcess_Operator &
	:rtype: bool
") FindOperator;
		static Standard_Boolean FindOperator (const char * name,Handle_ShapeProcess_Operator & op);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs a specified sequence of operators on Context Resource file and other data should be already loaded to Context (including description of sequence seq)

	:param context:
	:type context: Handle_ShapeProcess_Context &
	:param seq:
	:type seq: char *
	:rtype: bool
") Perform;
		static Standard_Boolean Perform (const Handle_ShapeProcess_Context & context,const char * seq);
};


%extend ShapeProcess {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeProcess_Context;
class ShapeProcess_Context : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") ShapeProcess_Context;
		%feature("autodoc", "	* Creates an empty tool

	:rtype: None
") ShapeProcess_Context;
		 ShapeProcess_Context ();
		%feature("compactdefaultargs") ShapeProcess_Context;
		%feature("autodoc", "	* Creates a new tool and initialises by name of resource file and (if specified) starting scope Calls method Init()

	:param file:
	:type file: char *
	:param scope: default value is ""
	:type scope: char *
	:rtype: None
") ShapeProcess_Context;
		 ShapeProcess_Context (const char * file,const char * scope = "");
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialises a tool by loading resource file and (if specified) sets starting scope Returns False if resource file not found

	:param file:
	:type file: char *
	:param scope: default value is ""
	:type scope: char *
	:rtype: bool
") Init;
		Standard_Boolean Init (const char * file,const char * scope = "");
		%feature("compactdefaultargs") LoadResourceManager;
		%feature("autodoc", "	* Loading Resource_Manager object if this object not equal internal static Resource_Manager object or internal static Resource_Manager object is null

	:param file:
	:type file: char *
	:rtype: Handle_Resource_Manager
") LoadResourceManager;
		Handle_Resource_Manager LoadResourceManager (const char * file);
		%feature("compactdefaultargs") ResourceManager;
		%feature("autodoc", "	* Returns internal Resource_Manager object

	:rtype: Handle_Resource_Manager
") ResourceManager;
		Handle_Resource_Manager ResourceManager ();
		%feature("compactdefaultargs") SetScope;
		%feature("autodoc", "	* Set a new (sub)scope

	:param scope:
	:type scope: char *
	:rtype: None
") SetScope;
		void SetScope (const char * scope);
		%feature("compactdefaultargs") UnSetScope;
		%feature("autodoc", "	* Go out of current scope

	:rtype: None
") UnSetScope;
		void UnSetScope ();
		%feature("compactdefaultargs") IsParamSet;
		%feature("autodoc", "	* Returns True if parameter is defined in the resource file

	:param param:
	:type param: char *
	:rtype: bool
") IsParamSet;
		Standard_Boolean IsParamSet (const char * param);
		%feature("compactdefaultargs") GetReal;
		%feature("autodoc", "	:param param:
	:type param: char *
	:param val:
	:type val: float &
	:rtype: bool
") GetReal;
		Standard_Boolean GetReal (const char * param,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetInteger;
		%feature("autodoc", "	:param param:
	:type param: char *
	:param val:
	:type val: int &
	:rtype: bool
") GetInteger;
		Standard_Boolean GetInteger (const char * param,Standard_Integer &OutValue);
		%feature("compactdefaultargs") GetBoolean;
		%feature("autodoc", "	:param param:
	:type param: char *
	:param val:
	:type val: bool
	:rtype: bool
") GetBoolean;
		Standard_Boolean GetBoolean (const char * param,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") GetString;
		%feature("autodoc", "	* Get value of parameter as being of specific type Returns False if parameter is not defined or has a wrong type

	:param param:
	:type param: char *
	:param val:
	:type val: TCollection_AsciiString &
	:rtype: bool
") GetString;
		Standard_Boolean GetString (const char * param,TCollection_AsciiString & val);
		%feature("compactdefaultargs") RealVal;
		%feature("autodoc", "	:param param:
	:type param: char *
	:param def:
	:type def: float
	:rtype: float
") RealVal;
		Standard_Real RealVal (const char * param,const Standard_Real def);
		%feature("compactdefaultargs") IntegerVal;
		%feature("autodoc", "	:param param:
	:type param: char *
	:param def:
	:type def: int
	:rtype: int
") IntegerVal;
		Standard_Integer IntegerVal (const char * param,const Standard_Integer def);
		%feature("compactdefaultargs") BooleanVal;
		%feature("autodoc", "	:param param:
	:type param: char *
	:param def:
	:type def: bool
	:rtype: bool
") BooleanVal;
		Standard_Boolean BooleanVal (const char * param,const Standard_Boolean def);
		%feature("compactdefaultargs") StringVal;
		%feature("autodoc", "	* Get value of parameter as being of specific type If parameter is not defined or does not have expected type, returns default value as specified

	:param param:
	:type param: char *
	:param def:
	:type def: char *
	:rtype: char *
") StringVal;
		const char * StringVal (const char * param,const char * def);
		%feature("compactdefaultargs") SetMessenger;
		%feature("autodoc", "	* Sets Messenger used for outputting messages.

	:param messenger:
	:type messenger: Handle_Message_Messenger &
	:rtype: None
") SetMessenger;
		void SetMessenger (const Handle_Message_Messenger & messenger);
		%feature("compactdefaultargs") Messenger;
		%feature("autodoc", "	* Returns Messenger used for outputting messages.

	:rtype: Handle_Message_Messenger
") Messenger;
		Handle_Message_Messenger Messenger ();
		%feature("compactdefaultargs") SetProgress;
		%feature("autodoc", "	* Sets Progress Indicator.

	:param theProgress:
	:type theProgress: Handle_Message_ProgressIndicator &
	:rtype: None
") SetProgress;
		void SetProgress (const Handle_Message_ProgressIndicator & theProgress);
		%feature("compactdefaultargs") Progress;
		%feature("autodoc", "	* Returns Progress Indicator.

	:rtype: Handle_Message_ProgressIndicator
") Progress;
		Handle_Message_ProgressIndicator Progress ();
		%feature("compactdefaultargs") SetTraceLevel;
		%feature("autodoc", "	* Sets trace level used for outputting messages - 0: no trace at all - 1: errors - 2: errors and warnings - 3: all messages Default is 1 : Errors traced

	:param tracelev:
	:type tracelev: int
	:rtype: None
") SetTraceLevel;
		void SetTraceLevel (const Standard_Integer tracelev);
		%feature("compactdefaultargs") TraceLevel;
		%feature("autodoc", "	* Returns trace level used for outputting messages.

	:rtype: int
") TraceLevel;
		Standard_Integer TraceLevel ();
};


%extend ShapeProcess_Context {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeProcess_Context(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeProcess_Context::Handle_ShapeProcess_Context %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeProcess_Context;
class Handle_ShapeProcess_Context : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_ShapeProcess_Context();
        Handle_ShapeProcess_Context(const Handle_ShapeProcess_Context &aHandle);
        Handle_ShapeProcess_Context(const ShapeProcess_Context *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeProcess_Context DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeProcess_Context {
    ShapeProcess_Context* _get_reference() {
    return (ShapeProcess_Context*)$self->Access();
    }
};

%extend Handle_ShapeProcess_Context {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeProcess_Context {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeProcess_DictionaryOfOperator;
class ShapeProcess_DictionaryOfOperator : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") ShapeProcess_DictionaryOfOperator;
		%feature("autodoc", "	:rtype: None
") ShapeProcess_DictionaryOfOperator;
		 ShapeProcess_DictionaryOfOperator ();
		%feature("compactdefaultargs") HasItem;
		%feature("autodoc", "	:param name:
	:type name: char *
	:param exact: default value is Standard_False
	:type exact: bool
	:rtype: bool
") HasItem;
		Standard_Boolean HasItem (const char * name,const Standard_Boolean exact = Standard_False);
		%feature("compactdefaultargs") HasItem;
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: bool
") HasItem;
		Standard_Boolean HasItem (const TCollection_AsciiString & name,const Standard_Boolean exact = Standard_True);
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "	:param name:
	:type name: char *
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: Handle_ShapeProcess_Operator
") Item;
		Handle_ShapeProcess_Operator Item (const char * name,const Standard_Boolean exact = Standard_True);
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: Handle_ShapeProcess_Operator
") Item;
		Handle_ShapeProcess_Operator Item (const TCollection_AsciiString & name,const Standard_Boolean exact = Standard_True);
		%feature("compactdefaultargs") GetItem;
		%feature("autodoc", "	:param name:
	:type name: char *
	:param anitem:
	:type anitem: Handle_ShapeProcess_Operator &
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: bool
") GetItem;
		Standard_Boolean GetItem (const char * name,Handle_ShapeProcess_Operator & anitem,const Standard_Boolean exact = Standard_True);
		%feature("compactdefaultargs") GetItem;
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:param anitem:
	:type anitem: Handle_ShapeProcess_Operator &
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: bool
") GetItem;
		Standard_Boolean GetItem (const TCollection_AsciiString & name,Handle_ShapeProcess_Operator & anitem,const Standard_Boolean exact = Standard_True);
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "	:param name:
	:type name: char *
	:param anitem:
	:type anitem: Handle_ShapeProcess_Operator &
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: None
") SetItem;
		void SetItem (const char * name,const Handle_ShapeProcess_Operator & anitem,const Standard_Boolean exact = Standard_True);
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:param anitem:
	:type anitem: Handle_ShapeProcess_Operator &
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: None
") SetItem;
		void SetItem (const TCollection_AsciiString & name,const Handle_ShapeProcess_Operator & anitem,const Standard_Boolean exact = Standard_True);
		%feature("compactdefaultargs") NewItem;
		%feature("autodoc", "	:param name:
	:type name: char *
	:param isvalued:
	:type isvalued: bool
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: Handle_ShapeProcess_Operator
") NewItem;
		Handle_ShapeProcess_Operator NewItem (const char * name,Standard_Boolean &OutValue,const Standard_Boolean exact = Standard_True);
		%feature("compactdefaultargs") NewItem;
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:param isvalued:
	:type isvalued: bool
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: Handle_ShapeProcess_Operator
") NewItem;
		Handle_ShapeProcess_Operator NewItem (const TCollection_AsciiString & name,Standard_Boolean &OutValue,const Standard_Boolean exact = Standard_True);
		%feature("compactdefaultargs") RemoveItem;
		%feature("autodoc", "	:param name:
	:type name: char *
	:param cln: default value is Standard_True
	:type cln: bool
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: bool
") RemoveItem;
		Standard_Boolean RemoveItem (const char * name,const Standard_Boolean cln = Standard_True,const Standard_Boolean exact = Standard_True);
		%feature("compactdefaultargs") RemoveItem;
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:param cln: default value is Standard_True
	:type cln: bool
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: bool
") RemoveItem;
		Standard_Boolean RemoveItem (const TCollection_AsciiString & name,const Standard_Boolean cln = Standard_True,const Standard_Boolean exact = Standard_True);
		%feature("compactdefaultargs") Clean;
		%feature("autodoc", "	:rtype: None
") Clean;
		void Clean ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	:rtype: Handle_ShapeProcess_DictionaryOfOperator
") Copy;
		Handle_ShapeProcess_DictionaryOfOperator Copy ();
		%feature("compactdefaultargs") Complete;
		%feature("autodoc", "	:param acell:
	:type acell: Handle_ShapeProcess_DictionaryOfOperator &
	:rtype: bool
") Complete;
		Standard_Boolean Complete (Handle_ShapeProcess_DictionaryOfOperator & acell);
};


%extend ShapeProcess_DictionaryOfOperator {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeProcess_DictionaryOfOperator(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeProcess_DictionaryOfOperator::Handle_ShapeProcess_DictionaryOfOperator %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeProcess_DictionaryOfOperator;
class Handle_ShapeProcess_DictionaryOfOperator : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_ShapeProcess_DictionaryOfOperator();
        Handle_ShapeProcess_DictionaryOfOperator(const Handle_ShapeProcess_DictionaryOfOperator &aHandle);
        Handle_ShapeProcess_DictionaryOfOperator(const ShapeProcess_DictionaryOfOperator *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeProcess_DictionaryOfOperator DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeProcess_DictionaryOfOperator {
    ShapeProcess_DictionaryOfOperator* _get_reference() {
    return (ShapeProcess_DictionaryOfOperator*)$self->Access();
    }
};

%extend Handle_ShapeProcess_DictionaryOfOperator {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeProcess_DictionaryOfOperator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeProcess_IteratorOfDictionaryOfOperator;
class ShapeProcess_IteratorOfDictionaryOfOperator {
	public:
		%feature("compactdefaultargs") ShapeProcess_IteratorOfDictionaryOfOperator;
		%feature("autodoc", "	:param acell:
	:type acell: Handle_ShapeProcess_DictionaryOfOperator &
	:rtype: None
") ShapeProcess_IteratorOfDictionaryOfOperator;
		 ShapeProcess_IteratorOfDictionaryOfOperator (const Handle_ShapeProcess_DictionaryOfOperator & acell);
		%feature("compactdefaultargs") ShapeProcess_IteratorOfDictionaryOfOperator;
		%feature("autodoc", "	:param acell:
	:type acell: Handle_ShapeProcess_DictionaryOfOperator &
	:param basename:
	:type basename: char *
	:rtype: None
") ShapeProcess_IteratorOfDictionaryOfOperator;
		 ShapeProcess_IteratorOfDictionaryOfOperator (const Handle_ShapeProcess_DictionaryOfOperator & acell,const char * basename);
		%feature("compactdefaultargs") ShapeProcess_IteratorOfDictionaryOfOperator;
		%feature("autodoc", "	:param acell:
	:type acell: Handle_ShapeProcess_DictionaryOfOperator &
	:param basename:
	:type basename: TCollection_AsciiString &
	:rtype: None
") ShapeProcess_IteratorOfDictionaryOfOperator;
		 ShapeProcess_IteratorOfDictionaryOfOperator (const Handle_ShapeProcess_DictionaryOfOperator & acell,const TCollection_AsciiString & basename);
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "	:rtype: None
") Start;
		void Start ();
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_ShapeProcess_Operator
") Value;
		Handle_ShapeProcess_Operator Value ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Name;
		TCollection_AsciiString Name ();
};


%extend ShapeProcess_IteratorOfDictionaryOfOperator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class ShapeProcess_OperLibrary {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Registers all the operators

	:rtype: void
") Init;
		static void Init ();
		%feature("compactdefaultargs") ApplyModifier;
		%feature("autodoc", "	* Applies BRepTools_Modification to a shape, taking into account sharing of components of compounds.

	:param S:
	:type S: TopoDS_Shape &
	:param context:
	:type context: Handle_ShapeProcess_ShapeContext &
	:param M:
	:type M: Handle_BRepTools_Modification &
	:param map:
	:type map: TopTools_DataMapOfShapeShape &
	:param msg: default value is 0
	:type msg: Handle_ShapeExtend_MsgRegistrator &
	:rtype: TopoDS_Shape
") ApplyModifier;
		static TopoDS_Shape ApplyModifier (const TopoDS_Shape & S,const Handle_ShapeProcess_ShapeContext & context,const Handle_BRepTools_Modification & M,TopTools_DataMapOfShapeShape & map,const Handle_ShapeExtend_MsgRegistrator & msg = 0);
};


%extend ShapeProcess_OperLibrary {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeProcess_Operator;
class ShapeProcess_Operator : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs operation and eventually records changes in the context

	:param context:
	:type context: Handle_ShapeProcess_Context &
	:rtype: bool
") Perform;
		virtual Standard_Boolean Perform (const Handle_ShapeProcess_Context & context);
};


%extend ShapeProcess_Operator {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeProcess_Operator(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeProcess_Operator::Handle_ShapeProcess_Operator %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeProcess_Operator;
class Handle_ShapeProcess_Operator : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_ShapeProcess_Operator();
        Handle_ShapeProcess_Operator(const Handle_ShapeProcess_Operator &aHandle);
        Handle_ShapeProcess_Operator(const ShapeProcess_Operator *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeProcess_Operator DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeProcess_Operator {
    ShapeProcess_Operator* _get_reference() {
    return (ShapeProcess_Operator*)$self->Access();
    }
};

%extend Handle_ShapeProcess_Operator {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeProcess_Operator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeProcess_StackItemOfDictionaryOfOperator;
class ShapeProcess_StackItemOfDictionaryOfOperator : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") ShapeProcess_StackItemOfDictionaryOfOperator;
		%feature("autodoc", "	:rtype: None
") ShapeProcess_StackItemOfDictionaryOfOperator;
		 ShapeProcess_StackItemOfDictionaryOfOperator ();
		%feature("compactdefaultargs") ShapeProcess_StackItemOfDictionaryOfOperator;
		%feature("autodoc", "	:param previous:
	:type previous: Handle_ShapeProcess_StackItemOfDictionaryOfOperator &
	:rtype: None
") ShapeProcess_StackItemOfDictionaryOfOperator;
		 ShapeProcess_StackItemOfDictionaryOfOperator (const Handle_ShapeProcess_StackItemOfDictionaryOfOperator & previous);
		%feature("compactdefaultargs") Previous;
		%feature("autodoc", "	:rtype: Handle_ShapeProcess_StackItemOfDictionaryOfOperator
") Previous;
		Handle_ShapeProcess_StackItemOfDictionaryOfOperator Previous ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_ShapeProcess_DictionaryOfOperator
") Value;
		Handle_ShapeProcess_DictionaryOfOperator Value ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param cval:
	:type cval: Handle_ShapeProcess_DictionaryOfOperator &
	:rtype: None
") SetValue;
		void SetValue (const Handle_ShapeProcess_DictionaryOfOperator & cval);
};


%extend ShapeProcess_StackItemOfDictionaryOfOperator {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeProcess_StackItemOfDictionaryOfOperator(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeProcess_StackItemOfDictionaryOfOperator::Handle_ShapeProcess_StackItemOfDictionaryOfOperator %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeProcess_StackItemOfDictionaryOfOperator;
class Handle_ShapeProcess_StackItemOfDictionaryOfOperator : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_ShapeProcess_StackItemOfDictionaryOfOperator();
        Handle_ShapeProcess_StackItemOfDictionaryOfOperator(const Handle_ShapeProcess_StackItemOfDictionaryOfOperator &aHandle);
        Handle_ShapeProcess_StackItemOfDictionaryOfOperator(const ShapeProcess_StackItemOfDictionaryOfOperator *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeProcess_StackItemOfDictionaryOfOperator DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeProcess_StackItemOfDictionaryOfOperator {
    ShapeProcess_StackItemOfDictionaryOfOperator* _get_reference() {
    return (ShapeProcess_StackItemOfDictionaryOfOperator*)$self->Access();
    }
};

%extend Handle_ShapeProcess_StackItemOfDictionaryOfOperator {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeProcess_StackItemOfDictionaryOfOperator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeProcess_ShapeContext;
class ShapeProcess_ShapeContext : public ShapeProcess_Context {
	public:
		%feature("compactdefaultargs") ShapeProcess_ShapeContext;
		%feature("autodoc", "	:param file:
	:type file: char *
	:param seq: default value is ""
	:type seq: char *
	:rtype: None
") ShapeProcess_ShapeContext;
		 ShapeProcess_ShapeContext (const char * file,const char * seq = "");
		%feature("compactdefaultargs") ShapeProcess_ShapeContext;
		%feature("autodoc", "	* Initializes a tool by resource file and shape to be processed

	:param S:
	:type S: TopoDS_Shape &
	:param file:
	:type file: char *
	:param seq: default value is ""
	:type seq: char *
	:rtype: None
") ShapeProcess_ShapeContext;
		 ShapeProcess_ShapeContext (const TopoDS_Shape & S,const char * file,const char * seq = "");
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes tool by a new shape and clears all results

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* Returns shape being processed

	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "	* Returns current result

	:rtype: TopoDS_Shape
") Result;
		const TopoDS_Shape  Result ();
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "	* Returns map of replacements shape -> shape This map is not recursive

	:rtype: TopTools_DataMapOfShapeShape
") Map;
		const TopTools_DataMapOfShapeShape & Map ();
		%feature("compactdefaultargs") Messages;
		%feature("autodoc", "	:rtype: Handle_ShapeExtend_MsgRegistrator
") Messages;
		Handle_ShapeExtend_MsgRegistrator Messages ();
		%feature("compactdefaultargs") Messages;
		%feature("autodoc", "	* Returns messages recorded during shape processing It can be nullified before processing in order to avoid recording messages

	:rtype: Handle_ShapeExtend_MsgRegistrator
") Messages;
		Handle_ShapeExtend_MsgRegistrator Messages ();
		%feature("compactdefaultargs") SetDetalisation;
		%feature("autodoc", "	:param level:
	:type level: TopAbs_ShapeEnum
	:rtype: None
") SetDetalisation;
		void SetDetalisation (const TopAbs_ShapeEnum level);
		%feature("compactdefaultargs") GetDetalisation;
		%feature("autodoc", "	* Set and get value for detalisation level Only shapes of types from TopoDS_COMPOUND and until specified detalisation level will be recorded in maps To cancel mapping, use TopAbs_SHAPE To force full mapping, use TopAbs_VERTEX The default level is TopAbs_FACE

	:rtype: TopAbs_ShapeEnum
") GetDetalisation;
		TopAbs_ShapeEnum GetDetalisation ();
		%feature("compactdefaultargs") SetResult;
		%feature("autodoc", "	* Sets a new result shape NOTE: this method should be used very carefully to keep consistency of modifications It is recommended to use RecordModification() methods with explicit definition of mapping from current result to a new one

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") SetResult;
		void SetResult (const TopoDS_Shape & S);
		%feature("compactdefaultargs") RecordModification;
		%feature("autodoc", "	:param repl:
	:type repl: TopTools_DataMapOfShapeShape &
	:param msg: default value is 0
	:type msg: Handle_ShapeExtend_MsgRegistrator &
	:rtype: None
") RecordModification;
		void RecordModification (const TopTools_DataMapOfShapeShape & repl,const Handle_ShapeExtend_MsgRegistrator & msg = 0);
		%feature("compactdefaultargs") RecordModification;
		%feature("autodoc", "	:param repl:
	:type repl: Handle_ShapeBuild_ReShape &
	:param msg:
	:type msg: Handle_ShapeExtend_MsgRegistrator &
	:rtype: None
") RecordModification;
		void RecordModification (const Handle_ShapeBuild_ReShape & repl,const Handle_ShapeExtend_MsgRegistrator & msg);
		%feature("compactdefaultargs") RecordModification;
		%feature("autodoc", "	:param repl:
	:type repl: Handle_ShapeBuild_ReShape &
	:rtype: None
") RecordModification;
		void RecordModification (const Handle_ShapeBuild_ReShape & repl);
		%feature("compactdefaultargs") RecordModification;
		%feature("autodoc", "	* Records modifications and resets result accordingly NOTE: modification of resulting shape should be explicitly defined in the maps along with modifications of subshapes //! In the last function, sh is the shape on which Modifier was run. It can be different from the whole shape, but in that case result as a whole should be reset later either by call to SetResult(), or by another call to RecordModification() which contains mapping of current result to a new one explicitly

	:param sh:
	:type sh: TopoDS_Shape &
	:param repl:
	:type repl: BRepTools_Modifier &
	:param msg: default value is 0
	:type msg: Handle_ShapeExtend_MsgRegistrator &
	:rtype: None
") RecordModification;
		void RecordModification (const TopoDS_Shape & sh,const BRepTools_Modifier & repl,const Handle_ShapeExtend_MsgRegistrator & msg = 0);
		%feature("compactdefaultargs") AddMessage;
		%feature("autodoc", "	* Record a message for shape S Shape S should be one of subshapes of original shape (or whole one), but not one of intermediate shapes Records only if Message() is not Null

	:param S:
	:type S: TopoDS_Shape &
	:param msg:
	:type msg: Message_Msg &
	:param gravity: default value is Message_Warning
	:type gravity: Message_Gravity
	:rtype: None
") AddMessage;
		void AddMessage (const TopoDS_Shape & S,const Message_Msg & msg,const Message_Gravity gravity = Message_Warning);
		%feature("compactdefaultargs") GetContinuity;
		%feature("autodoc", "	* Get value of parameter as being of the type GeomAbs_Shape Returns False if parameter is not defined or has a wrong type

	:param param:
	:type param: char *
	:param val:
	:type val: GeomAbs_Shape &
	:rtype: bool
") GetContinuity;
		Standard_Boolean GetContinuity (const char * param,GeomAbs_Shape & val);
		%feature("compactdefaultargs") ContinuityVal;
		%feature("autodoc", "	* Get value of parameter as being of the type GeomAbs_Shape If parameter is not defined or does not have expected type, returns default value as specified

	:param param:
	:type param: char *
	:param def:
	:type def: GeomAbs_Shape
	:rtype: GeomAbs_Shape
") ContinuityVal;
		GeomAbs_Shape ContinuityVal (const char * param,const GeomAbs_Shape def);
		%feature("compactdefaultargs") PrintStatistics;
		%feature("autodoc", "	* Prints statistics on Shape Processing onto the current Messenger.

	:rtype: None
") PrintStatistics;
		void PrintStatistics ();
};


%extend ShapeProcess_ShapeContext {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeProcess_ShapeContext(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeProcess_ShapeContext::Handle_ShapeProcess_ShapeContext %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeProcess_ShapeContext;
class Handle_ShapeProcess_ShapeContext : public Handle_ShapeProcess_Context {

    public:
        // constructors
        Handle_ShapeProcess_ShapeContext();
        Handle_ShapeProcess_ShapeContext(const Handle_ShapeProcess_ShapeContext &aHandle);
        Handle_ShapeProcess_ShapeContext(const ShapeProcess_ShapeContext *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeProcess_ShapeContext DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeProcess_ShapeContext {
    ShapeProcess_ShapeContext* _get_reference() {
    return (ShapeProcess_ShapeContext*)$self->Access();
    }
};

%extend Handle_ShapeProcess_ShapeContext {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeProcess_ShapeContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeProcess_UOperator;
class ShapeProcess_UOperator : public ShapeProcess_Operator {
	public:
		%feature("compactdefaultargs") ShapeProcess_UOperator;
		%feature("autodoc", "	* Creates operator with implementation defined as OperFunc (static function)

	:param func:
	:type func: ShapeProcess_OperFunc
	:rtype: None
") ShapeProcess_UOperator;
		 ShapeProcess_UOperator (const ShapeProcess_OperFunc func);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs operation and records changes in the context

	:param context:
	:type context: Handle_ShapeProcess_Context &
	:rtype: bool
") Perform;
		virtual Standard_Boolean Perform (const Handle_ShapeProcess_Context & context);
};


%extend ShapeProcess_UOperator {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeProcess_UOperator(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeProcess_UOperator::Handle_ShapeProcess_UOperator %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeProcess_UOperator;
class Handle_ShapeProcess_UOperator : public Handle_ShapeProcess_Operator {

    public:
        // constructors
        Handle_ShapeProcess_UOperator();
        Handle_ShapeProcess_UOperator(const Handle_ShapeProcess_UOperator &aHandle);
        Handle_ShapeProcess_UOperator(const ShapeProcess_UOperator *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeProcess_UOperator DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeProcess_UOperator {
    ShapeProcess_UOperator* _get_reference() {
    return (ShapeProcess_UOperator*)$self->Access();
    }
};

%extend Handle_ShapeProcess_UOperator {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeProcess_UOperator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
