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
%module ShapeProcess

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

%include ShapeProcess_required_python_modules.i
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
		%feature("autodoc", "Args:
	name(char *)
	op(Handle_ShapeProcess_Operator)

Returns:
	static Standard_Boolean

Registers operator to make it visible for Performer") RegisterOperator;
		static Standard_Boolean RegisterOperator (const char * name,const Handle_ShapeProcess_Operator & op);
		%feature("autodoc", "Args:
	name(char *)
	op(Handle_ShapeProcess_Operator)

Returns:
	static Standard_Boolean

Finds operator by its name") FindOperator;
		static Standard_Boolean FindOperator (const char * name,Handle_ShapeProcess_Operator & op);
		%feature("autodoc", "Args:
	context(Handle_ShapeProcess_Context)
	seq(char *)

Returns:
	static Standard_Boolean

Performs a specified sequence of operators on Context  
         Resource file and other data should be already loaded  
         to Context (including description of sequence seq)") Perform;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty tool") ShapeProcess_Context;
		 ShapeProcess_Context ();
		%feature("autodoc", "Args:
	file(char *)
	scope(char *)=

Returns:
	None

Creates a new tool and initialises by name of  
         resource file and (if specified) starting scope  
         Calls method Init()") ShapeProcess_Context;
		 ShapeProcess_Context (const char * file,const char * scope = "");
		%feature("autodoc", "Args:
	file(char *)
	scope(char *)=

Returns:
	Standard_Boolean

Initialises a tool by loading resource file and  
         (if specified) sets starting scope  
         Returns False if resource file not found") Init;
		Standard_Boolean Init (const char * file,const char * scope = "");
		%feature("autodoc", "Args:
	file(char *)

Returns:
	Handle_Resource_Manager

Loading Resource_Manager object if this object not  
         equal internal static Resource_Manager object or  
         internal static Resource_Manager object is null") LoadResourceManager;
		Handle_Resource_Manager LoadResourceManager (const char * file);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Resource_Manager

Returns internal Resource_Manager object") ResourceManager;
		const Handle_Resource_Manager & ResourceManager ();
		%feature("autodoc", "Args:
	scope(char *)

Returns:
	None

Set a new (sub)scope") SetScope;
		void SetScope (const char * scope);
		%feature("autodoc", "Args:
	None
Returns:
	None

Go out of current scope") UnSetScope;
		void UnSetScope ();
		%feature("autodoc", "Args:
	param(char *)

Returns:
	Standard_Boolean

Returns True if parameter is defined in the resource file") IsParamSet;
		Standard_Boolean IsParamSet (const char * param);
		%feature("autodoc", "Args:
	param(char *)
	val(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") GetReal;
		Standard_Boolean GetReal (const char * param,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	param(char *)
	val(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") GetInteger;
		Standard_Boolean GetInteger (const char * param,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	param(char *)
	val(Standard_Boolean)

Returns:
	Standard_Boolean

No detailed docstring for this function.") GetBoolean;
		Standard_Boolean GetBoolean (const char * param,Standard_Boolean & val);
		%feature("autodoc", "Args:
	param(char *)
	val(TCollection_AsciiString)

Returns:
	Standard_Boolean

Get value of parameter as being of specific type  
         Returns False if parameter is not defined or has a wrong type") GetString;
		Standard_Boolean GetString (const char * param,TCollection_AsciiString & val);
		%feature("autodoc", "Args:
	param(char *)
	def(Standard_Real)

Returns:
	Standard_Real

No detailed docstring for this function.") RealVal;
		Standard_Real RealVal (const char * param,const Standard_Real def);
		%feature("autodoc", "Args:
	param(char *)
	def(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") IntegerVal;
		Standard_Integer IntegerVal (const char * param,const Standard_Integer def);
		%feature("autodoc", "Args:
	param(char *)
	def(Standard_Boolean)

Returns:
	Standard_Boolean

No detailed docstring for this function.") BooleanVal;
		Standard_Boolean BooleanVal (const char * param,const Standard_Boolean def);
		%feature("autodoc", "Args:
	param(char *)
	def(char *)

Returns:
	char *

Get value of parameter as being of specific type  
         If parameter is not defined or does not have expected  
         type, returns default value as specified") StringVal;
		char * StringVal (const char * param,const char * def);
		%feature("autodoc", "Args:
	messenger(Handle_Message_Messenger)

Returns:
	None

Sets Messenger used for outputting messages.") SetMessenger;
		void SetMessenger (const Handle_Message_Messenger & messenger);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Message_Messenger

Returns Messenger used for outputting messages.") Messenger;
		Handle_Message_Messenger Messenger ();
		%feature("autodoc", "Args:
	theProgress(Handle_Message_ProgressIndicator)

Returns:
	None

Sets Progress Indicator.") SetProgress;
		void SetProgress (const Handle_Message_ProgressIndicator & theProgress);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Message_ProgressIndicator

Returns Progress Indicator.") Progress;
		Handle_Message_ProgressIndicator Progress ();
		%feature("autodoc", "Args:
	tracelev(Standard_Integer)

Returns:
	None

Sets trace level used for outputting messages  
          - 0: no trace at all  
          - 1: errors  
          - 2: errors and warnings  
          - 3: all messages  
          Default is 1 : Errors traced") SetTraceLevel;
		void SetTraceLevel (const Standard_Integer tracelev);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns trace level used for outputting messages.") TraceLevel;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ShapeProcess_DictionaryOfOperator;
		 ShapeProcess_DictionaryOfOperator ();
		%feature("autodoc", "Args:
	name(char *)
	exact(Standard_Boolean)=Standard_False

Returns:
	Standard_Boolean

No detailed docstring for this function.") HasItem;
		Standard_Boolean HasItem (const char * name,const Standard_Boolean exact = Standard_False);
		%feature("autodoc", "Args:
	name(TCollection_AsciiString)
	exact(Standard_Boolean)=Standard_True

Returns:
	Standard_Boolean

No detailed docstring for this function.") HasItem;
		Standard_Boolean HasItem (const TCollection_AsciiString & name,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "Args:
	name(char *)
	exact(Standard_Boolean)=Standard_True

Returns:
	Handle_ShapeProcess_Operator

No detailed docstring for this function.") Item;
		const Handle_ShapeProcess_Operator & Item (const char * name,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "Args:
	name(TCollection_AsciiString)
	exact(Standard_Boolean)=Standard_True

Returns:
	Handle_ShapeProcess_Operator

No detailed docstring for this function.") Item;
		const Handle_ShapeProcess_Operator & Item (const TCollection_AsciiString & name,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "Args:
	name(char *)
	anitem(Handle_ShapeProcess_Operator)
	exact(Standard_Boolean)=Standard_True

Returns:
	Standard_Boolean

No detailed docstring for this function.") GetItem;
		Standard_Boolean GetItem (const char * name,Handle_ShapeProcess_Operator & anitem,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "Args:
	name(TCollection_AsciiString)
	anitem(Handle_ShapeProcess_Operator)
	exact(Standard_Boolean)=Standard_True

Returns:
	Standard_Boolean

No detailed docstring for this function.") GetItem;
		Standard_Boolean GetItem (const TCollection_AsciiString & name,Handle_ShapeProcess_Operator & anitem,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "Args:
	name(char *)
	anitem(Handle_ShapeProcess_Operator)
	exact(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") SetItem;
		void SetItem (const char * name,const Handle_ShapeProcess_Operator & anitem,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "Args:
	name(TCollection_AsciiString)
	anitem(Handle_ShapeProcess_Operator)
	exact(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") SetItem;
		void SetItem (const TCollection_AsciiString & name,const Handle_ShapeProcess_Operator & anitem,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "Args:
	name(char *)
	isvalued(Standard_Boolean)
	exact(Standard_Boolean)=Standard_True

Returns:
	Handle_ShapeProcess_Operator

No detailed docstring for this function.") NewItem;
		Handle_ShapeProcess_Operator & NewItem (const char * name,Standard_Boolean & isvalued,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "Args:
	name(TCollection_AsciiString)
	isvalued(Standard_Boolean)
	exact(Standard_Boolean)=Standard_True

Returns:
	Handle_ShapeProcess_Operator

No detailed docstring for this function.") NewItem;
		Handle_ShapeProcess_Operator & NewItem (const TCollection_AsciiString & name,Standard_Boolean & isvalued,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "Args:
	name(char *)
	cln(Standard_Boolean)=Standard_True
	exact(Standard_Boolean)=Standard_True

Returns:
	Standard_Boolean

No detailed docstring for this function.") RemoveItem;
		Standard_Boolean RemoveItem (const char * name,const Standard_Boolean cln = Standard_True,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "Args:
	name(TCollection_AsciiString)
	cln(Standard_Boolean)=Standard_True
	exact(Standard_Boolean)=Standard_True

Returns:
	Standard_Boolean

No detailed docstring for this function.") RemoveItem;
		Standard_Boolean RemoveItem (const TCollection_AsciiString & name,const Standard_Boolean cln = Standard_True,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clean;
		void Clean ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeProcess_DictionaryOfOperator

No detailed docstring for this function.") Copy;
		Handle_ShapeProcess_DictionaryOfOperator Copy ();
		%feature("autodoc", "Args:
	acell(Handle_ShapeProcess_DictionaryOfOperator)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Complete;
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
		%feature("autodoc", "Args:
	acell(Handle_ShapeProcess_DictionaryOfOperator)

Returns:
	None

No detailed docstring for this function.") ShapeProcess_IteratorOfDictionaryOfOperator;
		 ShapeProcess_IteratorOfDictionaryOfOperator (const Handle_ShapeProcess_DictionaryOfOperator & acell);
		%feature("autodoc", "Args:
	acell(Handle_ShapeProcess_DictionaryOfOperator)
	basename(char *)

Returns:
	None

No detailed docstring for this function.") ShapeProcess_IteratorOfDictionaryOfOperator;
		 ShapeProcess_IteratorOfDictionaryOfOperator (const Handle_ShapeProcess_DictionaryOfOperator & acell,const char * basename);
		%feature("autodoc", "Args:
	acell(Handle_ShapeProcess_DictionaryOfOperator)
	basename(TCollection_AsciiString)

Returns:
	None

No detailed docstring for this function.") ShapeProcess_IteratorOfDictionaryOfOperator;
		 ShapeProcess_IteratorOfDictionaryOfOperator (const Handle_ShapeProcess_DictionaryOfOperator & acell,const TCollection_AsciiString & basename);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Start;
		void Start ();
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
	Handle_ShapeProcess_Operator

No detailed docstring for this function.") Value;
		const Handle_ShapeProcess_Operator & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

No detailed docstring for this function.") Name;
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
		%feature("autodoc", "Args:
	None
Returns:
	static void

Registers all the operators") Init;
		static void Init ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	context(Handle_ShapeProcess_ShapeContext)
	M(Handle_BRepTools_Modification)
	map(TopTools_DataMapOfShapeShape)

Returns:
	static TopoDS_Shape

Applies BRepTools_Modification to a shape,  
         taking into account sharing of components of compounds.") ApplyModifier;
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
		%feature("autodoc", "Args:
	context(Handle_ShapeProcess_Context)

Returns:
	virtual Standard_Boolean

Performs operation and eventually records  
         changes in the context") Perform;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ShapeProcess_StackItemOfDictionaryOfOperator;
		 ShapeProcess_StackItemOfDictionaryOfOperator ();
		%feature("autodoc", "Args:
	previous(Handle_ShapeProcess_StackItemOfDictionaryOfOperator)

Returns:
	None

No detailed docstring for this function.") ShapeProcess_StackItemOfDictionaryOfOperator;
		 ShapeProcess_StackItemOfDictionaryOfOperator (const Handle_ShapeProcess_StackItemOfDictionaryOfOperator & previous);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeProcess_StackItemOfDictionaryOfOperator

No detailed docstring for this function.") Previous;
		Handle_ShapeProcess_StackItemOfDictionaryOfOperator Previous ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeProcess_DictionaryOfOperator

No detailed docstring for this function.") Value;
		Handle_ShapeProcess_DictionaryOfOperator Value ();
		%feature("autodoc", "Args:
	cval(Handle_ShapeProcess_DictionaryOfOperator)

Returns:
	None

No detailed docstring for this function.") SetValue;
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
		%feature("autodoc", "Args:
	file(char *)
	seq(char *)=

Returns:
	None

No detailed docstring for this function.") ShapeProcess_ShapeContext;
		 ShapeProcess_ShapeContext (const char * file,const char * seq = "");
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	file(char *)
	seq(char *)=

Returns:
	None

Initializes a tool by resource file and shape  
         to be processed") ShapeProcess_ShapeContext;
		 ShapeProcess_ShapeContext (const TopoDS_Shape & S,const char * file,const char * seq = "");
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Initializes tool by a new shape and clears all results") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns shape being processed") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns current result") Result;
		const TopoDS_Shape & Result ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_DataMapOfShapeShape

Returns map of replacements shape -> shape  
         This map is not recursive") Map;
		const TopTools_DataMapOfShapeShape & Map ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeExtend_MsgRegistrator

No detailed docstring for this function.") Messages;
		const Handle_ShapeExtend_MsgRegistrator & Messages ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeExtend_MsgRegistrator

Returns messages recorded during shape processing  
         It can be nullified before processing in order to  
         avoid recording messages") Messages;
		Handle_ShapeExtend_MsgRegistrator & Messages ();
		%feature("autodoc", "Args:
	level(TopAbs_ShapeEnum)

Returns:
	None

No detailed docstring for this function.") SetDetalisation;
		void SetDetalisation (const TopAbs_ShapeEnum level);
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_ShapeEnum

Set and get value for detalisation level  
         Only shapes of types from TopoDS_COMPOUND and until  
         specified detalisation level will be recorded in maps  
         To cancel mapping, use TopAbs_SHAPE  
         To force full mapping, use TopAbs_VERTEX  
         The default level is TopAbs_FACE") GetDetalisation;
		TopAbs_ShapeEnum GetDetalisation ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Sets a new result shape  
         NOTE: this method should be used very carefully  
         to keep consistency of modifications  
         It is recommended to use RecordModification() methods  
         with explicit definition of mapping from current  
         result to a new one") SetResult;
		void SetResult (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	repl(TopTools_DataMapOfShapeShape)

Returns:
	None

No detailed docstring for this function.") RecordModification;
		void RecordModification (const TopTools_DataMapOfShapeShape & repl);
		%feature("autodoc", "Args:
	repl(Handle_ShapeBuild_ReShape)
	msg(Handle_ShapeExtend_MsgRegistrator)

Returns:
	None

No detailed docstring for this function.") RecordModification;
		void RecordModification (const Handle_ShapeBuild_ReShape & repl,const Handle_ShapeExtend_MsgRegistrator & msg);
		%feature("autodoc", "Args:
	repl(Handle_ShapeBuild_ReShape)

Returns:
	None

No detailed docstring for this function.") RecordModification;
		void RecordModification (const Handle_ShapeBuild_ReShape & repl);
		%feature("autodoc", "Args:
	sh(TopoDS_Shape)
	repl(BRepTools_Modifier)

Returns:
	None

Records modifications and resets result accordingly  
         NOTE: modification of resulting shape should be explicitly  
         defined in the maps along with modifications of subshapes  
 
         In the last function, sh is the shape on which Modifier  
         was run. It can be different from the whole shape,  
         but in that case result as a whole should be reset later  
         either by call to SetResult(), or by another call to  
         RecordModification() which contains mapping of current  
         result to a new one explicitly") RecordModification;
		void RecordModification (const TopoDS_Shape & sh,const BRepTools_Modifier & repl);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	msg(Message_Msg)
	gravity(Message_Gravity)=Message_Warning

Returns:
	None

Record a message for shape S  
         Shape S should be one of subshapes of original shape  
         (or whole one), but not one of intermediate shapes  
         Records only if Message() is not Null") AddMessage;
		void AddMessage (const TopoDS_Shape & S,const Message_Msg & msg,const Message_Gravity gravity = Message_Warning);
		%feature("autodoc", "Args:
	param(char *)
	val(GeomAbs_Shape)

Returns:
	Standard_Boolean

Get value of parameter as being of the type GeomAbs_Shape  
         Returns False if parameter is not defined or has a wrong type") GetContinuity;
		Standard_Boolean GetContinuity (const char * param,GeomAbs_Shape & val);
		%feature("autodoc", "Args:
	param(char *)
	def(GeomAbs_Shape)

Returns:
	GeomAbs_Shape

Get value of parameter as being of the type GeomAbs_Shape  
         If parameter is not defined or does not have expected  
         type, returns default value as specified") ContinuityVal;
		GeomAbs_Shape ContinuityVal (const char * param,const GeomAbs_Shape def);
		%feature("autodoc", "Args:
	None
Returns:
	None

Prints statistics on Shape Processing onto the current Messenger.") PrintStatistics;
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
		%feature("autodoc", "Args:
	func(ShapeProcess_OperFunc)

Returns:
	None

Creates operator with implementation defined as  
         OperFunc (static function)") ShapeProcess_UOperator;
		 ShapeProcess_UOperator (const ShapeProcess_OperFunc func);
		%feature("autodoc", "Args:
	context(Handle_ShapeProcess_Context)

Returns:
	virtual Standard_Boolean

Performs operation and records changes in the context") Perform;
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

