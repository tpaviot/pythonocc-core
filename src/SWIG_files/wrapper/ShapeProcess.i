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
%module (package="OCC") ShapeProcess

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

%include ShapeProcess_headers.i

/* typedefs */
typedef Standard_Boolean ( * ShapeProcess_OperFunc ) ( const Handle_ShapeProcess_Context & context );
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(shapeprocess) ShapeProcess;
%nodefaultctor ShapeProcess;
class ShapeProcess {
	public:
		%feature("autodoc", "	* Registers operator to make it visible for Performer

	:param name:
	:type name: char *
	:param op:
	:type op: Handle_ShapeProcess_Operator &
	:rtype: bool
") RegisterOperator;
		static Standard_Boolean RegisterOperator (const char * name,const Handle_ShapeProcess_Operator & op);
		%feature("autodoc", "	* Finds operator by its name

	:param name:
	:type name: char *
	:param op:
	:type op: Handle_ShapeProcess_Operator &
	:rtype: bool
") FindOperator;
		static Standard_Boolean FindOperator (const char * name,Handle_ShapeProcess_Operator & op);
		%feature("autodoc", "	* Performs a specified sequence of operators on Context Resource file and other data should be already loaded to Context (including description of sequence seq)

	:param context:
	:type context: Handle_ShapeProcess_Context &
	:param seq:
	:type seq: char *
	:rtype: bool
") Perform;
		static Standard_Boolean Perform (const Handle_ShapeProcess_Context & context,const char * seq);
};


%feature("shadow") ShapeProcess::~ShapeProcess %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeProcess {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeProcess_Context;
class ShapeProcess_Context : public MMgt_TShared {
	public:
		%feature("autodoc", "	* Creates an empty tool

	:rtype: None
") ShapeProcess_Context;
		 ShapeProcess_Context ();
		%feature("autodoc", "	* Creates a new tool and initialises by name of resource file and (if specified) starting scope Calls method Init()

	:param file:
	:type file: char *
	:param scope: default value is 
	:type scope: char *
	:rtype: None
") ShapeProcess_Context;
		 ShapeProcess_Context (const char * file,const char * scope = "");
		%feature("autodoc", "	* Initialises a tool by loading resource file and (if specified) sets starting scope Returns False if resource file not found

	:param file:
	:type file: char *
	:param scope: default value is 
	:type scope: char *
	:rtype: bool
") Init;
		Standard_Boolean Init (const char * file,const char * scope = "");
		%feature("autodoc", "	* Loading Resource_Manager object if this object not equal internal static Resource_Manager object or internal static Resource_Manager object is null

	:param file:
	:type file: char *
	:rtype: Handle_Resource_Manager
") LoadResourceManager;
		Handle_Resource_Manager LoadResourceManager (const char * file);
		%feature("autodoc", "	* Returns internal Resource_Manager object

	:rtype: Handle_Resource_Manager
") ResourceManager;
		const Handle_Resource_Manager & ResourceManager ();
		%feature("autodoc", "	* Set a new (sub)scope

	:param scope:
	:type scope: char *
	:rtype: None
") SetScope;
		void SetScope (const char * scope);
		%feature("autodoc", "	* Go out of current scope

	:rtype: None
") UnSetScope;
		void UnSetScope ();
		%feature("autodoc", "	* Returns True if parameter is defined in the resource file

	:param param:
	:type param: char *
	:rtype: bool
") IsParamSet;
		Standard_Boolean IsParamSet (const char * param);
		%feature("autodoc", "	:param param:
	:type param: char *
	:param val:
	:type val: float &
	:rtype: bool
") GetReal;
		Standard_Boolean GetReal (const char * param,Standard_Real &OutValue);
		%feature("autodoc", "	:param param:
	:type param: char *
	:param val:
	:type val: Standard_Integer &
	:rtype: bool
") GetInteger;
		Standard_Boolean GetInteger (const char * param,Standard_Integer &OutValue);
		%feature("autodoc", "	:param param:
	:type param: char *
	:param val:
	:type val: bool
	:rtype: bool
") GetBoolean;
		Standard_Boolean GetBoolean (const char * param,Standard_Boolean & val);
		%feature("autodoc", "	* Get value of parameter as being of specific type Returns False if parameter is not defined or has a wrong type

	:param param:
	:type param: char *
	:param val:
	:type val: TCollection_AsciiString &
	:rtype: bool
") GetString;
		Standard_Boolean GetString (const char * param,TCollection_AsciiString & val);
		%feature("autodoc", "	:param param:
	:type param: char *
	:param def:
	:type def: float
	:rtype: float
") RealVal;
		Standard_Real RealVal (const char * param,const Standard_Real def);
		%feature("autodoc", "	:param param:
	:type param: char *
	:param def:
	:type def: Standard_Integer
	:rtype: int
") IntegerVal;
		Standard_Integer IntegerVal (const char * param,const Standard_Integer def);
		%feature("autodoc", "	:param param:
	:type param: char *
	:param def:
	:type def: bool
	:rtype: bool
") BooleanVal;
		Standard_Boolean BooleanVal (const char * param,const Standard_Boolean def);
		%feature("autodoc", "	* Get value of parameter as being of specific type If parameter is not defined or does not have expected type, returns default value as specified

	:param param:
	:type param: char *
	:param def:
	:type def: char *
	:rtype: char *
") StringVal;
		char * StringVal (const char * param,const char * def);
		%feature("autodoc", "	* Sets Messenger used for outputting messages.

	:param messenger:
	:type messenger: Handle_Message_Messenger &
	:rtype: None
") SetMessenger;
		void SetMessenger (const Handle_Message_Messenger & messenger);
		%feature("autodoc", "	* Returns Messenger used for outputting messages.

	:rtype: Handle_Message_Messenger
") Messenger;
		Handle_Message_Messenger Messenger ();
		%feature("autodoc", "	* Sets Progress Indicator.

	:param theProgress:
	:type theProgress: Handle_Message_ProgressIndicator &
	:rtype: None
") SetProgress;
		void SetProgress (const Handle_Message_ProgressIndicator & theProgress);
		%feature("autodoc", "	* Returns Progress Indicator.

	:rtype: Handle_Message_ProgressIndicator
") Progress;
		Handle_Message_ProgressIndicator Progress ();
		%feature("autodoc", "	* Sets trace level used for outputting messages - 0: no trace at all - 1: errors - 2: errors and warnings - 3: all messages Default is 1 : Errors traced

	:param tracelev:
	:type tracelev: Standard_Integer
	:rtype: None
") SetTraceLevel;
		void SetTraceLevel (const Standard_Integer tracelev);
		%feature("autodoc", "	* Returns trace level used for outputting messages.

	:rtype: int
") TraceLevel;
		Standard_Integer TraceLevel ();
};


%feature("shadow") ShapeProcess_Context::~ShapeProcess_Context %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeProcess_Context {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeProcess_Context {
	Handle_ShapeProcess_Context GetHandle() {
	return *(Handle_ShapeProcess_Context*) &$self;
	}
};

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
    ShapeProcess_Context* GetObject() {
    return (ShapeProcess_Context*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeProcess_Context::~Handle_ShapeProcess_Context %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeProcess_Context {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeProcess_DictionaryOfOperator;
class ShapeProcess_DictionaryOfOperator : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") ShapeProcess_DictionaryOfOperator;
		 ShapeProcess_DictionaryOfOperator ();
		%feature("autodoc", "	:param name:
	:type name: char *
	:param exact: default value is Standard_False
	:type exact: bool
	:rtype: bool
") HasItem;
		Standard_Boolean HasItem (const char * name,const Standard_Boolean exact = Standard_False);
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: bool
") HasItem;
		Standard_Boolean HasItem (const TCollection_AsciiString & name,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "	:param name:
	:type name: char *
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: Handle_ShapeProcess_Operator
") Item;
		const Handle_ShapeProcess_Operator & Item (const char * name,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: Handle_ShapeProcess_Operator
") Item;
		const Handle_ShapeProcess_Operator & Item (const TCollection_AsciiString & name,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "	:param name:
	:type name: char *
	:param anitem:
	:type anitem: Handle_ShapeProcess_Operator &
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: bool
") GetItem;
		Standard_Boolean GetItem (const char * name,Handle_ShapeProcess_Operator & anitem,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:param anitem:
	:type anitem: Handle_ShapeProcess_Operator &
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: bool
") GetItem;
		Standard_Boolean GetItem (const TCollection_AsciiString & name,Handle_ShapeProcess_Operator & anitem,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "	:param name:
	:type name: char *
	:param anitem:
	:type anitem: Handle_ShapeProcess_Operator &
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: None
") SetItem;
		void SetItem (const char * name,const Handle_ShapeProcess_Operator & anitem,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:param anitem:
	:type anitem: Handle_ShapeProcess_Operator &
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: None
") SetItem;
		void SetItem (const TCollection_AsciiString & name,const Handle_ShapeProcess_Operator & anitem,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "	:param name:
	:type name: char *
	:param isvalued:
	:type isvalued: bool
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: Handle_ShapeProcess_Operator
") NewItem;
		Handle_ShapeProcess_Operator & NewItem (const char * name,Standard_Boolean & isvalued,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:param isvalued:
	:type isvalued: bool
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: Handle_ShapeProcess_Operator
") NewItem;
		Handle_ShapeProcess_Operator & NewItem (const TCollection_AsciiString & name,Standard_Boolean & isvalued,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "	:param name:
	:type name: char *
	:param cln: default value is Standard_True
	:type cln: bool
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: bool
") RemoveItem;
		Standard_Boolean RemoveItem (const char * name,const Standard_Boolean cln = Standard_True,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:param cln: default value is Standard_True
	:type cln: bool
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: bool
") RemoveItem;
		Standard_Boolean RemoveItem (const TCollection_AsciiString & name,const Standard_Boolean cln = Standard_True,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "	:rtype: None
") Clean;
		void Clean ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:rtype: Handle_ShapeProcess_DictionaryOfOperator
") Copy;
		Handle_ShapeProcess_DictionaryOfOperator Copy ();
		%feature("autodoc", "	:param acell:
	:type acell: Handle_ShapeProcess_DictionaryOfOperator &
	:rtype: bool
") Complete;
		Standard_Boolean Complete (Handle_ShapeProcess_DictionaryOfOperator & acell);
};


%feature("shadow") ShapeProcess_DictionaryOfOperator::~ShapeProcess_DictionaryOfOperator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeProcess_DictionaryOfOperator {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeProcess_DictionaryOfOperator {
	Handle_ShapeProcess_DictionaryOfOperator GetHandle() {
	return *(Handle_ShapeProcess_DictionaryOfOperator*) &$self;
	}
};

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
    ShapeProcess_DictionaryOfOperator* GetObject() {
    return (ShapeProcess_DictionaryOfOperator*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeProcess_DictionaryOfOperator::~Handle_ShapeProcess_DictionaryOfOperator %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeProcess_DictionaryOfOperator {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeProcess_IteratorOfDictionaryOfOperator;
class ShapeProcess_IteratorOfDictionaryOfOperator {
	public:
		%feature("autodoc", "	:param acell:
	:type acell: Handle_ShapeProcess_DictionaryOfOperator &
	:rtype: None
") ShapeProcess_IteratorOfDictionaryOfOperator;
		 ShapeProcess_IteratorOfDictionaryOfOperator (const Handle_ShapeProcess_DictionaryOfOperator & acell);
		%feature("autodoc", "	:param acell:
	:type acell: Handle_ShapeProcess_DictionaryOfOperator &
	:param basename:
	:type basename: char *
	:rtype: None
") ShapeProcess_IteratorOfDictionaryOfOperator;
		 ShapeProcess_IteratorOfDictionaryOfOperator (const Handle_ShapeProcess_DictionaryOfOperator & acell,const char * basename);
		%feature("autodoc", "	:param acell:
	:type acell: Handle_ShapeProcess_DictionaryOfOperator &
	:param basename:
	:type basename: TCollection_AsciiString &
	:rtype: None
") ShapeProcess_IteratorOfDictionaryOfOperator;
		 ShapeProcess_IteratorOfDictionaryOfOperator (const Handle_ShapeProcess_DictionaryOfOperator & acell,const TCollection_AsciiString & basename);
		%feature("autodoc", "	:rtype: None
") Start;
		void Start ();
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: Handle_ShapeProcess_Operator
") Value;
		const Handle_ShapeProcess_Operator & Value ();
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Name;
		TCollection_AsciiString Name ();
};


%feature("shadow") ShapeProcess_IteratorOfDictionaryOfOperator::~ShapeProcess_IteratorOfDictionaryOfOperator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeProcess_IteratorOfDictionaryOfOperator {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeProcess_OperLibrary;
class ShapeProcess_OperLibrary {
	public:
		%feature("autodoc", "	* Registers all the operators

	:rtype: void
") Init;
		static void Init ();
		%feature("autodoc", "	* Applies BRepTools_Modification to a shape, taking into account sharing of components of compounds.

	:param S:
	:type S: TopoDS_Shape &
	:param context:
	:type context: Handle_ShapeProcess_ShapeContext &
	:param M:
	:type M: Handle_BRepTools_Modification &
	:param map:
	:type map: TopTools_DataMapOfShapeShape &
	:rtype: TopoDS_Shape
") ApplyModifier;
		static TopoDS_Shape ApplyModifier (const TopoDS_Shape & S,const Handle_ShapeProcess_ShapeContext & context,const Handle_BRepTools_Modification & M,TopTools_DataMapOfShapeShape & map);
};


%feature("shadow") ShapeProcess_OperLibrary::~ShapeProcess_OperLibrary %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeProcess_OperLibrary {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeProcess_Operator;
class ShapeProcess_Operator : public MMgt_TShared {
	public:
		%feature("autodoc", "	* Performs operation and eventually records changes in the context

	:param context:
	:type context: Handle_ShapeProcess_Context &
	:rtype: bool
") Perform;
		virtual Standard_Boolean Perform (const Handle_ShapeProcess_Context & context);
};


%feature("shadow") ShapeProcess_Operator::~ShapeProcess_Operator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeProcess_Operator {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeProcess_Operator {
	Handle_ShapeProcess_Operator GetHandle() {
	return *(Handle_ShapeProcess_Operator*) &$self;
	}
};

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
    ShapeProcess_Operator* GetObject() {
    return (ShapeProcess_Operator*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeProcess_Operator::~Handle_ShapeProcess_Operator %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeProcess_Operator {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeProcess_StackItemOfDictionaryOfOperator;
class ShapeProcess_StackItemOfDictionaryOfOperator : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") ShapeProcess_StackItemOfDictionaryOfOperator;
		 ShapeProcess_StackItemOfDictionaryOfOperator ();
		%feature("autodoc", "	:param previous:
	:type previous: Handle_ShapeProcess_StackItemOfDictionaryOfOperator &
	:rtype: None
") ShapeProcess_StackItemOfDictionaryOfOperator;
		 ShapeProcess_StackItemOfDictionaryOfOperator (const Handle_ShapeProcess_StackItemOfDictionaryOfOperator & previous);
		%feature("autodoc", "	:rtype: Handle_ShapeProcess_StackItemOfDictionaryOfOperator
") Previous;
		Handle_ShapeProcess_StackItemOfDictionaryOfOperator Previous ();
		%feature("autodoc", "	:rtype: Handle_ShapeProcess_DictionaryOfOperator
") Value;
		Handle_ShapeProcess_DictionaryOfOperator Value ();
		%feature("autodoc", "	:param cval:
	:type cval: Handle_ShapeProcess_DictionaryOfOperator &
	:rtype: None
") SetValue;
		void SetValue (const Handle_ShapeProcess_DictionaryOfOperator & cval);
};


%feature("shadow") ShapeProcess_StackItemOfDictionaryOfOperator::~ShapeProcess_StackItemOfDictionaryOfOperator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeProcess_StackItemOfDictionaryOfOperator {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeProcess_StackItemOfDictionaryOfOperator {
	Handle_ShapeProcess_StackItemOfDictionaryOfOperator GetHandle() {
	return *(Handle_ShapeProcess_StackItemOfDictionaryOfOperator*) &$self;
	}
};

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
    ShapeProcess_StackItemOfDictionaryOfOperator* GetObject() {
    return (ShapeProcess_StackItemOfDictionaryOfOperator*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeProcess_StackItemOfDictionaryOfOperator::~Handle_ShapeProcess_StackItemOfDictionaryOfOperator %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeProcess_StackItemOfDictionaryOfOperator {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeProcess_ShapeContext;
class ShapeProcess_ShapeContext : public ShapeProcess_Context {
	public:
		%feature("autodoc", "	:param file:
	:type file: char *
	:param seq: default value is 
	:type seq: char *
	:rtype: None
") ShapeProcess_ShapeContext;
		 ShapeProcess_ShapeContext (const char * file,const char * seq = "");
		%feature("autodoc", "	* Initializes a tool by resource file and shape to be processed

	:param S:
	:type S: TopoDS_Shape &
	:param file:
	:type file: char *
	:param seq: default value is 
	:type seq: char *
	:rtype: None
") ShapeProcess_ShapeContext;
		 ShapeProcess_ShapeContext (const TopoDS_Shape & S,const char * file,const char * seq = "");
		%feature("autodoc", "	* Initializes tool by a new shape and clears all results

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "	* Returns shape being processed

	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("autodoc", "	* Returns current result

	:rtype: TopoDS_Shape
") Result;
		const TopoDS_Shape  Result ();
		%feature("autodoc", "	* Returns map of replacements shape -> shape This map is not recursive

	:rtype: TopTools_DataMapOfShapeShape
") Map;
		const TopTools_DataMapOfShapeShape & Map ();
		%feature("autodoc", "	:rtype: Handle_ShapeExtend_MsgRegistrator
") Messages;
		const Handle_ShapeExtend_MsgRegistrator & Messages ();
		%feature("autodoc", "	* Returns messages recorded during shape processing It can be nullified before processing in order to avoid recording messages

	:rtype: Handle_ShapeExtend_MsgRegistrator
") Messages;
		Handle_ShapeExtend_MsgRegistrator & Messages ();
		%feature("autodoc", "	:param level:
	:type level: TopAbs_ShapeEnum
	:rtype: None
") SetDetalisation;
		void SetDetalisation (const TopAbs_ShapeEnum level);
		%feature("autodoc", "	* Set and get value for detalisation level Only shapes of types from TopoDS_COMPOUND and until specified detalisation level will be recorded in maps To cancel mapping, use TopAbs_SHAPE To force full mapping, use TopAbs_VERTEX The default level is TopAbs_FACE

	:rtype: TopAbs_ShapeEnum
") GetDetalisation;
		TopAbs_ShapeEnum GetDetalisation ();
		%feature("autodoc", "	* Sets a new result shape NOTE: this method should be used very carefully to keep consistency of modifications It is recommended to use RecordModification() methods with explicit definition of mapping from current result to a new one

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") SetResult;
		void SetResult (const TopoDS_Shape & S);
		%feature("autodoc", "	:param repl:
	:type repl: TopTools_DataMapOfShapeShape &
	:rtype: None
") RecordModification;
		void RecordModification (const TopTools_DataMapOfShapeShape & repl);
		%feature("autodoc", "	:param repl:
	:type repl: Handle_ShapeBuild_ReShape &
	:param msg:
	:type msg: Handle_ShapeExtend_MsgRegistrator &
	:rtype: None
") RecordModification;
		void RecordModification (const Handle_ShapeBuild_ReShape & repl,const Handle_ShapeExtend_MsgRegistrator & msg);
		%feature("autodoc", "	:param repl:
	:type repl: Handle_ShapeBuild_ReShape &
	:rtype: None
") RecordModification;
		void RecordModification (const Handle_ShapeBuild_ReShape & repl);
		%feature("autodoc", "	* Records modifications and resets result accordingly NOTE: modification of resulting shape should be explicitly defined in the maps along with modifications of subshapes  In the last function, sh is the shape on which Modifier was run. It can be different from the whole shape, but in that case result as a whole should be reset later either by call to SetResult(), or by another call to RecordModification() which contains mapping of current result to a new one explicitly

	:param sh:
	:type sh: TopoDS_Shape &
	:param repl:
	:type repl: BRepTools_Modifier &
	:rtype: None
") RecordModification;
		void RecordModification (const TopoDS_Shape & sh,const BRepTools_Modifier & repl);
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
		%feature("autodoc", "	* Get value of parameter as being of the type GeomAbs_Shape Returns False if parameter is not defined or has a wrong type

	:param param:
	:type param: char *
	:param val:
	:type val: GeomAbs_Shape &
	:rtype: bool
") GetContinuity;
		Standard_Boolean GetContinuity (const char * param,GeomAbs_Shape & val);
		%feature("autodoc", "	* Get value of parameter as being of the type GeomAbs_Shape If parameter is not defined or does not have expected type, returns default value as specified

	:param param:
	:type param: char *
	:param def:
	:type def: GeomAbs_Shape
	:rtype: GeomAbs_Shape
") ContinuityVal;
		GeomAbs_Shape ContinuityVal (const char * param,const GeomAbs_Shape def);
		%feature("autodoc", "	* Prints statistics on Shape Processing onto the current Messenger.

	:rtype: None
") PrintStatistics;
		void PrintStatistics ();
};


%feature("shadow") ShapeProcess_ShapeContext::~ShapeProcess_ShapeContext %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeProcess_ShapeContext {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeProcess_ShapeContext {
	Handle_ShapeProcess_ShapeContext GetHandle() {
	return *(Handle_ShapeProcess_ShapeContext*) &$self;
	}
};

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
    ShapeProcess_ShapeContext* GetObject() {
    return (ShapeProcess_ShapeContext*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeProcess_ShapeContext::~Handle_ShapeProcess_ShapeContext %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeProcess_ShapeContext {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeProcess_UOperator;
class ShapeProcess_UOperator : public ShapeProcess_Operator {
	public:
		%feature("autodoc", "	* Creates operator with implementation defined as OperFunc (static function)

	:param func:
	:type func: ShapeProcess_OperFunc
	:rtype: None
") ShapeProcess_UOperator;
		 ShapeProcess_UOperator (const ShapeProcess_OperFunc func);
		%feature("autodoc", "	* Performs operation and records changes in the context

	:param context:
	:type context: Handle_ShapeProcess_Context &
	:rtype: bool
") Perform;
		virtual Standard_Boolean Perform (const Handle_ShapeProcess_Context & context);
};


%feature("shadow") ShapeProcess_UOperator::~ShapeProcess_UOperator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeProcess_UOperator {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeProcess_UOperator {
	Handle_ShapeProcess_UOperator GetHandle() {
	return *(Handle_ShapeProcess_UOperator*) &$self;
	}
};

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
    ShapeProcess_UOperator* GetObject() {
    return (ShapeProcess_UOperator*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeProcess_UOperator::~Handle_ShapeProcess_UOperator %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeProcess_UOperator {
    void _kill_pointed() {
        delete $self;
    }
};

