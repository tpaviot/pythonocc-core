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
%module (package="OCC") Dynamic

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

%include Dynamic_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum Dynamic_ModeEnum {
	Dynamic_IN = 0,
	Dynamic_OUT = 1,
	Dynamic_INOUT = 2,
	Dynamic_INTERNAL = 3,
	Dynamic_CONSTANT = 4,
};

/* end public enums declaration */

%rename(dynamic) Dynamic;
%nodefaultctor Dynamic;
class Dynamic {
	public:
		%feature("autodoc", "Args:
	amode(char *)

Returns:
	static Dynamic_ModeEnum

No detailed docstring for this function.") Mode;
		static Dynamic_ModeEnum Mode (const char * amode);
};


%feature("shadow") Dynamic::~Dynamic %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Dynamic_DynamicClass;
class Dynamic_DynamicClass : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	aname(char *)

Returns:
	None

Creates a new empty instance of DynamicClass.") Dynamic_DynamicClass;
		 Dynamic_DynamicClass (const char * aname);
		%feature("autodoc", "Args:
	aparameter(Handle_Dynamic_Parameter)

Returns:
	None

Adds another parameter <aparameter> to the sequence of  
         parameter definitions.") Parameter;
		void Parameter (const Handle_Dynamic_Parameter & aparameter);
		%feature("autodoc", "Args:
	amethod(char *)
	anaddress(char *)

Returns:
	None

Adds another method to the sequence of methods. It has  
         <amethod> as name  and <anaddress> as mangled  name of  
         the corresponding C++ function which must be called.") CompiledMethod;
		void CompiledMethod (const char * amethod,const char * anaddress);
		%feature("autodoc", "Args:
	amethod(char *)
	afile(char *)

Returns:
	None

Adds  another method to the  sequence of methods.   It  
         has <amethod> as name and <afile> as interpreted file.") InterpretedMethod;
		void InterpretedMethod (const char * amethod,const char * afile);
		%feature("autodoc", "Args:
	amethod(char *)

Returns:
	virtual Handle_Dynamic_Method

Returns a reference to the method object identified by  
         the string <amethod>.") Method;
		virtual Handle_Dynamic_Method Method (const char * amethod);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Dynamic_DynamicInstance

Returns an instance object of this class.") Instance;
		virtual Handle_Dynamic_DynamicInstance Instance ();
		%feature("autodoc", "Args:
	astream(Standard_OStream)

Returns:
	virtual void

useful for debugging.") Dump;
		virtual void Dump (Standard_OStream & astream);
};


%feature("shadow") Dynamic_DynamicClass::~Dynamic_DynamicClass %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_DynamicClass {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_DynamicClass {
	Handle_Dynamic_DynamicClass GetHandle() {
	return *(Handle_Dynamic_DynamicClass*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_DynamicClass;
class Handle_Dynamic_DynamicClass : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Dynamic_DynamicClass();
        Handle_Dynamic_DynamicClass(const Handle_Dynamic_DynamicClass &aHandle);
        Handle_Dynamic_DynamicClass(const Dynamic_DynamicClass *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_DynamicClass DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_DynamicClass {
    Dynamic_DynamicClass* GetObject() {
    return (Dynamic_DynamicClass*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_DynamicClass::~Handle_Dynamic_DynamicClass %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_DynamicClass {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dynamic_DynamicInstance;
class Dynamic_DynamicInstance : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty instance of this class.") Dynamic_DynamicInstance;
		 Dynamic_DynamicInstance ();
		%feature("autodoc", "Args:
	aparameter(Handle_Dynamic_Parameter)

Returns:
	None

Adds  <aparameter> to  the   sequence of parameters of  
         <self>.") Parameter;
		void Parameter (const Handle_Dynamic_Parameter & aparameter);
		%feature("autodoc", "Args:
	aninstance(Handle_Dynamic_DynamicInstance)

Returns:
	None

Adds all the parameters  of <self>,  to the sequence  of  
         parameters of <aninstance>.") Parameter;
		void Parameter (const Handle_Dynamic_DynamicInstance & aninstance);
		%feature("autodoc", "Args:
	aparameter(char *)
	avalue(Standard_Integer)

Returns:
	None

Puts the integer value <avalue> into the parameter  
         object identified by the string <aparameter>.") Parameter;
		void Parameter (const char * aparameter,const Standard_Integer avalue);
		%feature("autodoc", "Args:
	aparameter(char *)
	avalue(Standard_Real)

Returns:
	None

Puts the real value <avalue> into the parameter  
         object identified by the string <aparameter>.") Parameter;
		void Parameter (const char * aparameter,const Standard_Real avalue);
		%feature("autodoc", "Args:
	aparameter(char *)
	avalue(char *)

Returns:
	None

Puts the string <avalue> into the parameter  
         object identified by the string <aparameter>.") Parameter;
		void Parameter (const char * aparameter,const char * avalue);
		%feature("autodoc", "Args:
	aparameter(char *)
	avalue(Handle_Dynamic_DynamicInstance)

Returns:
	None

Puts the dynamic instance <avalue> into the parameter  
         object identified by the string <aparameter>.") Parameter;
		void Parameter (const char * aparameter,const Handle_Dynamic_DynamicInstance & avalue);
		%feature("autodoc", "Args:
	aparameter(char *)

Returns:
	Handle_Dynamic_Parameter

Searches and returns the parameter object identified  
         by the string <aparameter>.") Parameter;
		Handle_Dynamic_Parameter Parameter (const char * aparameter);
		%feature("autodoc", "Args:
	aclass(Handle_Dynamic_DynamicClass)

Returns:
	None

Sets the reference of the class.") Class;
		void Class (const Handle_Dynamic_DynamicClass & aclass);
		%feature("autodoc", "Args:
	amethod(char *)

Returns:
	None

Calls the method identified by the string <amethod>.") Execute;
		void Execute (const char * amethod);
};


%feature("shadow") Dynamic_DynamicInstance::~Dynamic_DynamicInstance %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_DynamicInstance {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_DynamicInstance {
	Handle_Dynamic_DynamicInstance GetHandle() {
	return *(Handle_Dynamic_DynamicInstance*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_DynamicInstance;
class Handle_Dynamic_DynamicInstance : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Dynamic_DynamicInstance();
        Handle_Dynamic_DynamicInstance(const Handle_Dynamic_DynamicInstance &aHandle);
        Handle_Dynamic_DynamicInstance(const Dynamic_DynamicInstance *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_DynamicInstance DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_DynamicInstance {
    Dynamic_DynamicInstance* GetObject() {
    return (Dynamic_DynamicInstance*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_DynamicInstance::~Handle_Dynamic_DynamicInstance %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_DynamicInstance {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dynamic_FuzzyClass;
class Dynamic_FuzzyClass : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual TCollection_AsciiString

This  deferred method must   returns  the type of  the  
         object. If the instance is of the type FuzzyDefinition  
         the method simply  returns the field <thetype>. If the  
         instance is of the type FuzzyInstance the method calls  
         the Type method on the true definition.") Type;
		virtual TCollection_AsciiString Type ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dynamic_ParameterNode

Returns the  head of the  list of parameters.  For the  
         FuzzyDefinition class  this method returns the head of  
         the exaustive list  of parameters defining the  object  
         and for the FuzzyInstance it  just returns the head of  
         the overloaded values.") FirstParameter;
		Handle_Dynamic_ParameterNode FirstParameter ();
		%feature("autodoc", "Args:
	aparameter(char *)

Returns:
	Standard_Boolean

Returns true if there is a parameter with <aparameter>  
         as name, false otherwise.") Parameter;
		Standard_Boolean Parameter (const char * aparameter);
		%feature("autodoc", "Args:
	aparameter(Handle_Dynamic_Parameter)

Returns:
	None

Adds  another parameter <aparameter> to the sequence of  
         parameters.") Parameter;
		void Parameter (const Handle_Dynamic_Parameter & aparameter);
		%feature("autodoc", "Args:
	aparameter(char *)
	avalue(Standard_Boolean)

Returns:
	virtual void

Adds  to the instance <self>  the parameter <aparameter>  
         with the boolean value <avalue>.") Parameter;
		virtual void Parameter (const char * aparameter,const Standard_Boolean avalue);
		%feature("autodoc", "Args:
	aparameter(char *)
	avalue(Standard_Integer)

Returns:
	virtual void

Adds  to the instance <self>  the parameter <aparameter>  
         with the integer value <avalue>.") Parameter;
		virtual void Parameter (const char * aparameter,const Standard_Integer avalue);
		%feature("autodoc", "Args:
	aparameter(char *)
	avalue(Standard_Real)

Returns:
	virtual void

Adds  to the  instance  <self>  the parameter <aparameter>  
         with the real value <avalue>.") Parameter;
		virtual void Parameter (const char * aparameter,const Standard_Real avalue);
		%feature("autodoc", "Args:
	aparameter(char *)
	astring(char *)

Returns:
	virtual void

Adds  to the  instance  <self>  the parameter <aparameter>  
         with the string <astring>.") Parameter;
		virtual void Parameter (const char * aparameter,const char * astring);
		%feature("autodoc", "Args:
	aparameter(char *)
	anobject(Handle_Standard_Transient)

Returns:
	virtual void

Adds  to the  instance  <self>  the parameter <aparameter>  
         with the object value <anobject>.") Parameter;
		virtual void Parameter (const char * aparameter,const Handle_Standard_Transient & anobject);
		%feature("autodoc", "Args:
	aparameter(char *)
	avalue(Standard_Boolean)

Returns:
	virtual Standard_Boolean

Returns   True, if there   is a parameter <aparameter>  
         previously stored  in the instance   <self> and there is  
         the corresponding boolean value in the output argument  
         <avalue>, False otherwise.") Value;
		virtual Standard_Boolean Value (const char * aparameter,Standard_Boolean & avalue);
		%feature("autodoc", "Args:
	aparameter(char *)
	avalue(Standard_Integer)

Returns:
	virtual Standard_Boolean

Returns True,   if  there is  a   parameter <aparameter>  
         previously stored in  the  instance  <self> and there is  
         the corresponding integer value in the output argument  
         <avalue>, False otherwise.") Value;
		virtual Standard_Boolean Value (const char * aparameter,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	aparameter(char *)
	avalue(Standard_Real)

Returns:
	virtual Standard_Boolean

Returns True,   if  there  is a   parameter <aparameter>  
         previously stored in the  instance <self>  and  there is  
         the corresponding  real value   in the output argument  
         <avalue>, False otherwise.") Value;
		virtual Standard_Boolean Value (const char * aparameter,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	aparameter(char *)
	avalue(TCollection_AsciiString)

Returns:
	virtual Standard_Boolean

Returns True, if  there   is  a parameter   <aparameter>  
         previously stored  in the  instance <self> and  there is  
         the  corresponding  string  in  the  output   argument  
         <avalue>, False otherwise.") Value;
		virtual Standard_Boolean Value (const char * aparameter,TCollection_AsciiString & avalue);
		%feature("autodoc", "Args:
	aparameter(char *)
	avalue(Handle_Standard_Transient)

Returns:
	virtual Standard_Boolean

Returns  True,  if  there is  a   parameter <aparameter>  
         previously stored  in the instance <self> and   there is  
         the corresponding object value  in  the output argument  
         <avalue>, False otherwise.") Value;
		virtual Standard_Boolean Value (const char * aparameter,Handle_Standard_Transient & avalue);
		%feature("autodoc", "Args:
	astream(Standard_OStream)

Returns:
	virtual void

Useful for debugging.") Dump;
		virtual void Dump (Standard_OStream & astream);
};


%feature("shadow") Dynamic_FuzzyClass::~Dynamic_FuzzyClass %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_FuzzyClass {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_FuzzyClass {
	Handle_Dynamic_FuzzyClass GetHandle() {
	return *(Handle_Dynamic_FuzzyClass*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_FuzzyClass;
class Handle_Dynamic_FuzzyClass : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Dynamic_FuzzyClass();
        Handle_Dynamic_FuzzyClass(const Handle_Dynamic_FuzzyClass &aHandle);
        Handle_Dynamic_FuzzyClass(const Dynamic_FuzzyClass *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_FuzzyClass DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_FuzzyClass {
    Dynamic_FuzzyClass* GetObject() {
    return (Dynamic_FuzzyClass*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_FuzzyClass::~Handle_Dynamic_FuzzyClass %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_FuzzyClass {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dynamic_FuzzyDefinitionsDictionary;
class Dynamic_FuzzyDefinitionsDictionary : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	afilename(char *)

Returns:
	None

Starting with   a file named  <afilename>,  fills  the  
         dictionary with all the wishes definitions.") Creates;
		void Creates (const char * afilename);
		%feature("autodoc", "Args:
	aname(char *)
	atype(char *)
	avalue(char *)

Returns:
	virtual Handle_Dynamic_Parameter

This virtual method allows the user to add recognition  
         of its  own  parameters when reading  the file to fill  
         the dictionary.") Switch;
		virtual Handle_Dynamic_Parameter Switch (const char * aname,const char * atype,const char * avalue);
		%feature("autodoc", "Args:
	atype(char *)
	adefinition(Handle_Dynamic_FuzzyClass)

Returns:
	Standard_Boolean

Returns from     the dictionary in  the   out variable  
         <adefinition> a reference to the right instance of the  
         definition identified  by its type <atype>. The method  
         returns true if the definition exist, false otherwise.") Definition;
		Standard_Boolean Definition (const char * atype,Handle_Dynamic_FuzzyClass & adefinition);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if there has been  no modification of the  
         file  fuzzyclasses.dat  since  the   creation  of  the  
         dictionary object, false otherwise.") UpToDate;
		Standard_Boolean UpToDate ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns    the number  of  definitions  stored  in the  
         dictionary.") NumberOfDefinitions;
		Standard_Integer NumberOfDefinitions ();
		%feature("autodoc", "Args:
	anindex(Standard_Integer)

Returns:
	Handle_Dynamic_FuzzyClass

Returns a  reference on the  definition identified  by  
         the index <anidex>.") Definition;
		Handle_Dynamic_FuzzyClass Definition (const Standard_Integer anindex);
		%feature("autodoc", "Args:
	astream(Standard_OStream)

Returns:
	None

Useful for debugging.") Dump;
		void Dump (Standard_OStream & astream);
};


%feature("shadow") Dynamic_FuzzyDefinitionsDictionary::~Dynamic_FuzzyDefinitionsDictionary %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_FuzzyDefinitionsDictionary {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_FuzzyDefinitionsDictionary {
	Handle_Dynamic_FuzzyDefinitionsDictionary GetHandle() {
	return *(Handle_Dynamic_FuzzyDefinitionsDictionary*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_FuzzyDefinitionsDictionary;
class Handle_Dynamic_FuzzyDefinitionsDictionary : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Dynamic_FuzzyDefinitionsDictionary();
        Handle_Dynamic_FuzzyDefinitionsDictionary(const Handle_Dynamic_FuzzyDefinitionsDictionary &aHandle);
        Handle_Dynamic_FuzzyDefinitionsDictionary(const Dynamic_FuzzyDefinitionsDictionary *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_FuzzyDefinitionsDictionary DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_FuzzyDefinitionsDictionary {
    Dynamic_FuzzyDefinitionsDictionary* GetObject() {
    return (Dynamic_FuzzyDefinitionsDictionary*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_FuzzyDefinitionsDictionary::~Handle_Dynamic_FuzzyDefinitionsDictionary %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_FuzzyDefinitionsDictionary {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dynamic_Method;
class Dynamic_Method : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual TCollection_AsciiString

Returns the type  of object which is  the  name of the  
         function definition.") Type;
		virtual TCollection_AsciiString Type ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dynamic_VariableNode

Returns the  first variable node   of the Method which  
         contains a variable.") FirstVariableNode;
		Handle_Dynamic_VariableNode FirstVariableNode ();
		%feature("autodoc", "Args:
	avariable(char *)

Returns:
	Standard_Boolean

Returns true if there is a variable with <avariable>  
         as name, false otherwise.") Variable;
		Standard_Boolean Variable (const char * avariable);
		%feature("autodoc", "Args:
	avariable(Handle_Dynamic_Variable)

Returns:
	None

Adds another  variable <avariable>  to the sequence of  
         variable definitions.") Variable;
		void Variable (const Handle_Dynamic_Variable & avariable);
		%feature("autodoc", "Args:
	aname(char *)
	aparameter(Handle_Dynamic_Parameter)
	amode(Dynamic_ModeEnum)

Returns:
	Standard_Boolean

Returns  True,   if there  is   a variable <avariable>  
         previously  stored in the  instance  <self> and there is  
         the corresponding parameter    value   in the   output  
         argument <aparameter>, False otherwise.") Value;
		Standard_Boolean Value (const char * aname,Handle_Dynamic_Parameter & aparameter,Dynamic_ModeEnum & amode);
		%feature("autodoc", "Args:
	aname(char *)
	avariable(Handle_Dynamic_Variable)

Returns:
	Standard_Boolean

Returns True, if  there  is a variable   named <aname>  
         previously stored in the  instance of <self> and returns  
         the   corresponding variable  in  the output  argument  
         <avariable>, False otherwise.") Value;
		Standard_Boolean Value (const char * aname,Handle_Dynamic_Variable & avariable);
		%feature("autodoc", "Args:
	astream(Standard_OStream)

Returns:
	virtual void

Useful for debugging.") Dump;
		virtual void Dump (Standard_OStream & astream);
};


%feature("shadow") Dynamic_Method::~Dynamic_Method %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_Method {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_Method {
	Handle_Dynamic_Method GetHandle() {
	return *(Handle_Dynamic_Method*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_Method;
class Handle_Dynamic_Method : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Dynamic_Method();
        Handle_Dynamic_Method(const Handle_Dynamic_Method &aHandle);
        Handle_Dynamic_Method(const Dynamic_Method *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_Method DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_Method {
    Dynamic_Method* GetObject() {
    return (Dynamic_Method*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_Method::~Handle_Dynamic_Method %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_Method {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dynamic_MethodDefinitionsDictionary;
class Dynamic_MethodDefinitionsDictionary : public Standard_Transient {
	public:
		%feature("autodoc", "Args:
	afilename(char *)

Returns:
	None

Starting with   a file named  <afilename>,  fills  the  
         dictionary with all the wishes definitions.") Creates;
		void Creates (const char * afilename);
		%feature("autodoc", "Args:
	adefinition(Handle_Dynamic_Method)

Returns:
	Standard_Boolean

This method sets  the new definition  <adefinition> in  
         the dictionary. It   returns true if the operation  is  
         successful, false otherwise.") Definition;
		Standard_Boolean Definition (const Handle_Dynamic_Method & adefinition);
		%feature("autodoc", "Args:
	aname(char *)
	atype(char *)
	avalue(char *)

Returns:
	Handle_Dynamic_Parameter

This virtual method allows the user to add recognition  
         of its  own  parameters when reading  the file to fill  
         the dictionary.") Switch;
		Handle_Dynamic_Parameter Switch (const char * aname,const char * atype,const char * avalue);
		%feature("autodoc", "Args:
	atype(char *)
	adefinition(Handle_Dynamic_Method)

Returns:
	Standard_Boolean

Returns from     the dictionary in  the   out variable  
         <adefinition> a reference to the right instance of the  
         definition identified  by its type <atype>. The method  
         returns true if the definition exist, false otherwise.") Definition;
		Standard_Boolean Definition (const char * atype,Handle_Dynamic_Method & adefinition);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if there has  been no modification of the  
         file  method-definitions.dat since the creation of the  
         dictionary object, false otherwise.") UpToDate;
		Standard_Boolean UpToDate ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns    the number  of  definitions  stored  in the  
         dictionary.") NumberOfDefinitions;
		Standard_Integer NumberOfDefinitions ();
		%feature("autodoc", "Args:
	anindex(Standard_Integer)

Returns:
	Handle_Dynamic_Method

Returns a  reference on the  definition identified  by  
         the index <anidex>.") Definition;
		Handle_Dynamic_Method Definition (const Standard_Integer anindex);
		%feature("autodoc", "Args:
	astream(Standard_OStream)

Returns:
	None

Useful for debugging.") Dump;
		void Dump (Standard_OStream & astream);
};


%feature("shadow") Dynamic_MethodDefinitionsDictionary::~Dynamic_MethodDefinitionsDictionary %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_MethodDefinitionsDictionary {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_MethodDefinitionsDictionary {
	Handle_Dynamic_MethodDefinitionsDictionary GetHandle() {
	return *(Handle_Dynamic_MethodDefinitionsDictionary*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_MethodDefinitionsDictionary;
class Handle_Dynamic_MethodDefinitionsDictionary : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_Dynamic_MethodDefinitionsDictionary();
        Handle_Dynamic_MethodDefinitionsDictionary(const Handle_Dynamic_MethodDefinitionsDictionary &aHandle);
        Handle_Dynamic_MethodDefinitionsDictionary(const Dynamic_MethodDefinitionsDictionary *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_MethodDefinitionsDictionary DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_MethodDefinitionsDictionary {
    Dynamic_MethodDefinitionsDictionary* GetObject() {
    return (Dynamic_MethodDefinitionsDictionary*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_MethodDefinitionsDictionary::~Handle_Dynamic_MethodDefinitionsDictionary %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_MethodDefinitionsDictionary {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dynamic_Parameter;
class Dynamic_Parameter : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns in an AsciiString the name of the parameter.") Name;
		TCollection_AsciiString Name ();
		%feature("autodoc", "Args:
	astream(Standard_OStream)

Returns:
	virtual void

Useful for debugging.") Dump;
		virtual void Dump (Standard_OStream & astream);
};


%feature("shadow") Dynamic_Parameter::~Dynamic_Parameter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_Parameter {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_Parameter {
	Handle_Dynamic_Parameter GetHandle() {
	return *(Handle_Dynamic_Parameter*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_Parameter;
class Handle_Dynamic_Parameter : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Dynamic_Parameter();
        Handle_Dynamic_Parameter(const Handle_Dynamic_Parameter &aHandle);
        Handle_Dynamic_Parameter(const Dynamic_Parameter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_Parameter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_Parameter {
    Dynamic_Parameter* GetObject() {
    return (Dynamic_Parameter*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_Parameter::~Handle_Dynamic_Parameter %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_Parameter {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dynamic_ParameterNode;
class Dynamic_ParameterNode : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dynamic_ParameterNode;
		 Dynamic_ParameterNode ();
		%feature("autodoc", "Args:
	anitem(Handle_Dynamic_Parameter)

Returns:
	None

No detailed docstring for this function.") Dynamic_ParameterNode;
		 Dynamic_ParameterNode (const Handle_Dynamic_Parameter & anitem);
		%feature("autodoc", "Args:
	anitem(Handle_Dynamic_Parameter)

Returns:
	None

No detailed docstring for this function.") Object;
		void Object (const Handle_Dynamic_Parameter & anitem);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dynamic_Parameter

No detailed docstring for this function.") Object;
		Handle_Dynamic_Parameter Object ();
		%feature("autodoc", "Args:
	anode(Handle_Dynamic_ParameterNode)

Returns:
	None

No detailed docstring for this function.") Next;
		void Next (const Handle_Dynamic_ParameterNode & anode);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dynamic_ParameterNode

No detailed docstring for this function.") Next;
		Handle_Dynamic_ParameterNode Next ();
};


%feature("shadow") Dynamic_ParameterNode::~Dynamic_ParameterNode %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_ParameterNode {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_ParameterNode {
	Handle_Dynamic_ParameterNode GetHandle() {
	return *(Handle_Dynamic_ParameterNode*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_ParameterNode;
class Handle_Dynamic_ParameterNode : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Dynamic_ParameterNode();
        Handle_Dynamic_ParameterNode(const Handle_Dynamic_ParameterNode &aHandle);
        Handle_Dynamic_ParameterNode(const Dynamic_ParameterNode *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_ParameterNode DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_ParameterNode {
    Dynamic_ParameterNode* GetObject() {
    return (Dynamic_ParameterNode*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_ParameterNode::~Handle_Dynamic_ParameterNode %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_ParameterNode {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dynamic_SeqOfClasses;
class Dynamic_SeqOfClasses : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dynamic_SeqOfClasses;
		 Dynamic_SeqOfClasses ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Dynamic_SeqOfClasses)

Returns:
	Dynamic_SeqOfClasses

No detailed docstring for this function.") Assign;
		const Dynamic_SeqOfClasses & Assign (const Dynamic_SeqOfClasses & Other);
		%feature("autodoc", "Args:
	Other(Dynamic_SeqOfClasses)

Returns:
	Dynamic_SeqOfClasses

No detailed docstring for this function.") operator=;
		const Dynamic_SeqOfClasses & operator = (const Dynamic_SeqOfClasses & Other);
		%feature("autodoc", "Args:
	T(Handle_Dynamic_DynamicClass)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Dynamic_DynamicClass & T);
		%feature("autodoc", "Args:
	S(Dynamic_SeqOfClasses)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Dynamic_SeqOfClasses & S);
		%feature("autodoc", "Args:
	T(Handle_Dynamic_DynamicClass)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Dynamic_DynamicClass & T);
		%feature("autodoc", "Args:
	S(Dynamic_SeqOfClasses)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Dynamic_SeqOfClasses & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Dynamic_DynamicClass)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Dynamic_DynamicClass & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Dynamic_SeqOfClasses)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Dynamic_SeqOfClasses & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Dynamic_DynamicClass)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Dynamic_DynamicClass & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Dynamic_SeqOfClasses)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Dynamic_SeqOfClasses & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dynamic_DynamicClass

No detailed docstring for this function.") First;
		const Handle_Dynamic_DynamicClass & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dynamic_DynamicClass

No detailed docstring for this function.") Last;
		const Handle_Dynamic_DynamicClass & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Dynamic_SeqOfClasses)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Dynamic_SeqOfClasses & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Dynamic_DynamicClass

No detailed docstring for this function.") Value;
		const Handle_Dynamic_DynamicClass & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_Dynamic_DynamicClass)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Dynamic_DynamicClass & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Dynamic_DynamicClass

No detailed docstring for this function.") ChangeValue;
		Handle_Dynamic_DynamicClass & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Dynamic_SeqOfClasses::~Dynamic_SeqOfClasses %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_SeqOfClasses {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Dynamic_SeqOfFuzzyDefinitions;
class Dynamic_SeqOfFuzzyDefinitions : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dynamic_SeqOfFuzzyDefinitions;
		 Dynamic_SeqOfFuzzyDefinitions ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Dynamic_SeqOfFuzzyDefinitions)

Returns:
	Dynamic_SeqOfFuzzyDefinitions

No detailed docstring for this function.") Assign;
		const Dynamic_SeqOfFuzzyDefinitions & Assign (const Dynamic_SeqOfFuzzyDefinitions & Other);
		%feature("autodoc", "Args:
	Other(Dynamic_SeqOfFuzzyDefinitions)

Returns:
	Dynamic_SeqOfFuzzyDefinitions

No detailed docstring for this function.") operator=;
		const Dynamic_SeqOfFuzzyDefinitions & operator = (const Dynamic_SeqOfFuzzyDefinitions & Other);
		%feature("autodoc", "Args:
	T(Handle_Dynamic_FuzzyDefinition)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Dynamic_FuzzyDefinition & T);
		%feature("autodoc", "Args:
	S(Dynamic_SeqOfFuzzyDefinitions)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Dynamic_SeqOfFuzzyDefinitions & S);
		%feature("autodoc", "Args:
	T(Handle_Dynamic_FuzzyDefinition)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Dynamic_FuzzyDefinition & T);
		%feature("autodoc", "Args:
	S(Dynamic_SeqOfFuzzyDefinitions)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Dynamic_SeqOfFuzzyDefinitions & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Dynamic_FuzzyDefinition)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Dynamic_FuzzyDefinition & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Dynamic_SeqOfFuzzyDefinitions)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Dynamic_SeqOfFuzzyDefinitions & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Dynamic_FuzzyDefinition)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Dynamic_FuzzyDefinition & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Dynamic_SeqOfFuzzyDefinitions)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Dynamic_SeqOfFuzzyDefinitions & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dynamic_FuzzyDefinition

No detailed docstring for this function.") First;
		const Handle_Dynamic_FuzzyDefinition & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dynamic_FuzzyDefinition

No detailed docstring for this function.") Last;
		const Handle_Dynamic_FuzzyDefinition & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Dynamic_SeqOfFuzzyDefinitions)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Dynamic_SeqOfFuzzyDefinitions & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Dynamic_FuzzyDefinition

No detailed docstring for this function.") Value;
		const Handle_Dynamic_FuzzyDefinition & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_Dynamic_FuzzyDefinition)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Dynamic_FuzzyDefinition & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Dynamic_FuzzyDefinition

No detailed docstring for this function.") ChangeValue;
		Handle_Dynamic_FuzzyDefinition & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Dynamic_SeqOfFuzzyDefinitions::~Dynamic_SeqOfFuzzyDefinitions %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_SeqOfFuzzyDefinitions {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Dynamic_SeqOfMethodDefinitions;
class Dynamic_SeqOfMethodDefinitions : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dynamic_SeqOfMethodDefinitions;
		 Dynamic_SeqOfMethodDefinitions ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Dynamic_SeqOfMethodDefinitions)

Returns:
	Dynamic_SeqOfMethodDefinitions

No detailed docstring for this function.") Assign;
		const Dynamic_SeqOfMethodDefinitions & Assign (const Dynamic_SeqOfMethodDefinitions & Other);
		%feature("autodoc", "Args:
	Other(Dynamic_SeqOfMethodDefinitions)

Returns:
	Dynamic_SeqOfMethodDefinitions

No detailed docstring for this function.") operator=;
		const Dynamic_SeqOfMethodDefinitions & operator = (const Dynamic_SeqOfMethodDefinitions & Other);
		%feature("autodoc", "Args:
	T(Handle_Dynamic_MethodDefinition)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Dynamic_MethodDefinition & T);
		%feature("autodoc", "Args:
	S(Dynamic_SeqOfMethodDefinitions)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Dynamic_SeqOfMethodDefinitions & S);
		%feature("autodoc", "Args:
	T(Handle_Dynamic_MethodDefinition)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Dynamic_MethodDefinition & T);
		%feature("autodoc", "Args:
	S(Dynamic_SeqOfMethodDefinitions)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Dynamic_SeqOfMethodDefinitions & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Dynamic_MethodDefinition)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Dynamic_MethodDefinition & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Dynamic_SeqOfMethodDefinitions)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Dynamic_SeqOfMethodDefinitions & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Dynamic_MethodDefinition)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Dynamic_MethodDefinition & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Dynamic_SeqOfMethodDefinitions)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Dynamic_SeqOfMethodDefinitions & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dynamic_MethodDefinition

No detailed docstring for this function.") First;
		const Handle_Dynamic_MethodDefinition & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dynamic_MethodDefinition

No detailed docstring for this function.") Last;
		const Handle_Dynamic_MethodDefinition & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Dynamic_SeqOfMethodDefinitions)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Dynamic_SeqOfMethodDefinitions & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Dynamic_MethodDefinition

No detailed docstring for this function.") Value;
		const Handle_Dynamic_MethodDefinition & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_Dynamic_MethodDefinition)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Dynamic_MethodDefinition & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Dynamic_MethodDefinition

No detailed docstring for this function.") ChangeValue;
		Handle_Dynamic_MethodDefinition & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Dynamic_SeqOfMethodDefinitions::~Dynamic_SeqOfMethodDefinitions %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_SeqOfMethodDefinitions {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Dynamic_SeqOfMethods;
class Dynamic_SeqOfMethods : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dynamic_SeqOfMethods;
		 Dynamic_SeqOfMethods ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Dynamic_SeqOfMethods)

Returns:
	Dynamic_SeqOfMethods

No detailed docstring for this function.") Assign;
		const Dynamic_SeqOfMethods & Assign (const Dynamic_SeqOfMethods & Other);
		%feature("autodoc", "Args:
	Other(Dynamic_SeqOfMethods)

Returns:
	Dynamic_SeqOfMethods

No detailed docstring for this function.") operator=;
		const Dynamic_SeqOfMethods & operator = (const Dynamic_SeqOfMethods & Other);
		%feature("autodoc", "Args:
	T(Handle_Dynamic_Method)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Dynamic_Method & T);
		%feature("autodoc", "Args:
	S(Dynamic_SeqOfMethods)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Dynamic_SeqOfMethods & S);
		%feature("autodoc", "Args:
	T(Handle_Dynamic_Method)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Dynamic_Method & T);
		%feature("autodoc", "Args:
	S(Dynamic_SeqOfMethods)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Dynamic_SeqOfMethods & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Dynamic_Method)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Dynamic_Method & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Dynamic_SeqOfMethods)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Dynamic_SeqOfMethods & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Dynamic_Method)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Dynamic_Method & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Dynamic_SeqOfMethods)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Dynamic_SeqOfMethods & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dynamic_Method

No detailed docstring for this function.") First;
		const Handle_Dynamic_Method & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dynamic_Method

No detailed docstring for this function.") Last;
		const Handle_Dynamic_Method & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Dynamic_SeqOfMethods)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Dynamic_SeqOfMethods & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Dynamic_Method

No detailed docstring for this function.") Value;
		const Handle_Dynamic_Method & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_Dynamic_Method)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Dynamic_Method & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Dynamic_Method

No detailed docstring for this function.") ChangeValue;
		Handle_Dynamic_Method & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Dynamic_SeqOfMethods::~Dynamic_SeqOfMethods %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_SeqOfMethods {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Dynamic_SequenceNodeOfSeqOfClasses;
class Dynamic_SequenceNodeOfSeqOfClasses : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_Dynamic_DynamicClass)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Dynamic_SequenceNodeOfSeqOfClasses;
		 Dynamic_SequenceNodeOfSeqOfClasses (const Handle_Dynamic_DynamicClass & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dynamic_DynamicClass

No detailed docstring for this function.") Value;
		Handle_Dynamic_DynamicClass & Value ();
};


%feature("shadow") Dynamic_SequenceNodeOfSeqOfClasses::~Dynamic_SequenceNodeOfSeqOfClasses %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_SequenceNodeOfSeqOfClasses {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_SequenceNodeOfSeqOfClasses {
	Handle_Dynamic_SequenceNodeOfSeqOfClasses GetHandle() {
	return *(Handle_Dynamic_SequenceNodeOfSeqOfClasses*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_SequenceNodeOfSeqOfClasses;
class Handle_Dynamic_SequenceNodeOfSeqOfClasses : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Dynamic_SequenceNodeOfSeqOfClasses();
        Handle_Dynamic_SequenceNodeOfSeqOfClasses(const Handle_Dynamic_SequenceNodeOfSeqOfClasses &aHandle);
        Handle_Dynamic_SequenceNodeOfSeqOfClasses(const Dynamic_SequenceNodeOfSeqOfClasses *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_SequenceNodeOfSeqOfClasses DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_SequenceNodeOfSeqOfClasses {
    Dynamic_SequenceNodeOfSeqOfClasses* GetObject() {
    return (Dynamic_SequenceNodeOfSeqOfClasses*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_SequenceNodeOfSeqOfClasses::~Handle_Dynamic_SequenceNodeOfSeqOfClasses %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_SequenceNodeOfSeqOfClasses {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions;
class Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_Dynamic_FuzzyDefinition)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions;
		 Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions (const Handle_Dynamic_FuzzyDefinition & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dynamic_FuzzyDefinition

No detailed docstring for this function.") Value;
		Handle_Dynamic_FuzzyDefinition & Value ();
};


%feature("shadow") Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions::~Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions {
	Handle_Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions GetHandle() {
	return *(Handle_Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions;
class Handle_Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions();
        Handle_Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions(const Handle_Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions &aHandle);
        Handle_Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions(const Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions {
    Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions* GetObject() {
    return (Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions::~Handle_Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dynamic_SequenceNodeOfSeqOfMethodDefinitions;
class Dynamic_SequenceNodeOfSeqOfMethodDefinitions : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_Dynamic_MethodDefinition)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Dynamic_SequenceNodeOfSeqOfMethodDefinitions;
		 Dynamic_SequenceNodeOfSeqOfMethodDefinitions (const Handle_Dynamic_MethodDefinition & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dynamic_MethodDefinition

No detailed docstring for this function.") Value;
		Handle_Dynamic_MethodDefinition & Value ();
};


%feature("shadow") Dynamic_SequenceNodeOfSeqOfMethodDefinitions::~Dynamic_SequenceNodeOfSeqOfMethodDefinitions %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_SequenceNodeOfSeqOfMethodDefinitions {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_SequenceNodeOfSeqOfMethodDefinitions {
	Handle_Dynamic_SequenceNodeOfSeqOfMethodDefinitions GetHandle() {
	return *(Handle_Dynamic_SequenceNodeOfSeqOfMethodDefinitions*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_SequenceNodeOfSeqOfMethodDefinitions;
class Handle_Dynamic_SequenceNodeOfSeqOfMethodDefinitions : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Dynamic_SequenceNodeOfSeqOfMethodDefinitions();
        Handle_Dynamic_SequenceNodeOfSeqOfMethodDefinitions(const Handle_Dynamic_SequenceNodeOfSeqOfMethodDefinitions &aHandle);
        Handle_Dynamic_SequenceNodeOfSeqOfMethodDefinitions(const Dynamic_SequenceNodeOfSeqOfMethodDefinitions *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_SequenceNodeOfSeqOfMethodDefinitions DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_SequenceNodeOfSeqOfMethodDefinitions {
    Dynamic_SequenceNodeOfSeqOfMethodDefinitions* GetObject() {
    return (Dynamic_SequenceNodeOfSeqOfMethodDefinitions*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_SequenceNodeOfSeqOfMethodDefinitions::~Handle_Dynamic_SequenceNodeOfSeqOfMethodDefinitions %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_SequenceNodeOfSeqOfMethodDefinitions {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dynamic_SequenceNodeOfSeqOfMethods;
class Dynamic_SequenceNodeOfSeqOfMethods : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_Dynamic_Method)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Dynamic_SequenceNodeOfSeqOfMethods;
		 Dynamic_SequenceNodeOfSeqOfMethods (const Handle_Dynamic_Method & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dynamic_Method

No detailed docstring for this function.") Value;
		Handle_Dynamic_Method & Value ();
};


%feature("shadow") Dynamic_SequenceNodeOfSeqOfMethods::~Dynamic_SequenceNodeOfSeqOfMethods %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_SequenceNodeOfSeqOfMethods {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_SequenceNodeOfSeqOfMethods {
	Handle_Dynamic_SequenceNodeOfSeqOfMethods GetHandle() {
	return *(Handle_Dynamic_SequenceNodeOfSeqOfMethods*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_SequenceNodeOfSeqOfMethods;
class Handle_Dynamic_SequenceNodeOfSeqOfMethods : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Dynamic_SequenceNodeOfSeqOfMethods();
        Handle_Dynamic_SequenceNodeOfSeqOfMethods(const Handle_Dynamic_SequenceNodeOfSeqOfMethods &aHandle);
        Handle_Dynamic_SequenceNodeOfSeqOfMethods(const Dynamic_SequenceNodeOfSeqOfMethods *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_SequenceNodeOfSeqOfMethods DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_SequenceNodeOfSeqOfMethods {
    Dynamic_SequenceNodeOfSeqOfMethods* GetObject() {
    return (Dynamic_SequenceNodeOfSeqOfMethods*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_SequenceNodeOfSeqOfMethods::~Handle_Dynamic_SequenceNodeOfSeqOfMethods %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_SequenceNodeOfSeqOfMethods {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dynamic_SequenceOfClasses;
class Dynamic_SequenceOfClasses : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dynamic_SequenceOfClasses;
		 Dynamic_SequenceOfClasses ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	anItem(Handle_Dynamic_DynamicClass)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Dynamic_DynamicClass & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Dynamic_SequenceOfClasses)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Dynamic_SequenceOfClasses & aSequence);
		%feature("autodoc", "Args:
	anItem(Handle_Dynamic_DynamicClass)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Dynamic_DynamicClass & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Dynamic_SequenceOfClasses)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Dynamic_SequenceOfClasses & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Dynamic_DynamicClass)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Dynamic_DynamicClass & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Dynamic_SequenceOfClasses)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Dynamic_SequenceOfClasses & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Dynamic_DynamicClass)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Dynamic_DynamicClass & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Dynamic_SequenceOfClasses)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Dynamic_SequenceOfClasses & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anOtherIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Dynamic_SequenceOfClasses

No detailed docstring for this function.") Split;
		Handle_Dynamic_SequenceOfClasses Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Dynamic_DynamicClass)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Dynamic_DynamicClass & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Dynamic_DynamicClass

No detailed docstring for this function.") Value;
		const Handle_Dynamic_DynamicClass & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Dynamic_DynamicClass

No detailed docstring for this function.") ChangeValue;
		Handle_Dynamic_DynamicClass & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	fromIndex(Standard_Integer)
	toIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "Args:
	None
Returns:
	Dynamic_SeqOfClasses

No detailed docstring for this function.") Sequence;
		const Dynamic_SeqOfClasses & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Dynamic_SeqOfClasses

No detailed docstring for this function.") ChangeSequence;
		Dynamic_SeqOfClasses & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dynamic_SequenceOfClasses

No detailed docstring for this function.") ShallowCopy;
		Handle_Dynamic_SequenceOfClasses ShallowCopy ();
};


%feature("shadow") Dynamic_SequenceOfClasses::~Dynamic_SequenceOfClasses %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_SequenceOfClasses {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_SequenceOfClasses {
	Handle_Dynamic_SequenceOfClasses GetHandle() {
	return *(Handle_Dynamic_SequenceOfClasses*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_SequenceOfClasses;
class Handle_Dynamic_SequenceOfClasses : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Dynamic_SequenceOfClasses();
        Handle_Dynamic_SequenceOfClasses(const Handle_Dynamic_SequenceOfClasses &aHandle);
        Handle_Dynamic_SequenceOfClasses(const Dynamic_SequenceOfClasses *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_SequenceOfClasses DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_SequenceOfClasses {
    Dynamic_SequenceOfClasses* GetObject() {
    return (Dynamic_SequenceOfClasses*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_SequenceOfClasses::~Handle_Dynamic_SequenceOfClasses %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_SequenceOfClasses {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dynamic_SequenceOfFuzzyDefinitions;
class Dynamic_SequenceOfFuzzyDefinitions : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dynamic_SequenceOfFuzzyDefinitions;
		 Dynamic_SequenceOfFuzzyDefinitions ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	anItem(Handle_Dynamic_FuzzyDefinition)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Dynamic_FuzzyDefinition & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Dynamic_SequenceOfFuzzyDefinitions)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Dynamic_SequenceOfFuzzyDefinitions & aSequence);
		%feature("autodoc", "Args:
	anItem(Handle_Dynamic_FuzzyDefinition)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Dynamic_FuzzyDefinition & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Dynamic_SequenceOfFuzzyDefinitions)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Dynamic_SequenceOfFuzzyDefinitions & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Dynamic_FuzzyDefinition)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Dynamic_FuzzyDefinition & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Dynamic_SequenceOfFuzzyDefinitions)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Dynamic_SequenceOfFuzzyDefinitions & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Dynamic_FuzzyDefinition)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Dynamic_FuzzyDefinition & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Dynamic_SequenceOfFuzzyDefinitions)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Dynamic_SequenceOfFuzzyDefinitions & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anOtherIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Dynamic_SequenceOfFuzzyDefinitions

No detailed docstring for this function.") Split;
		Handle_Dynamic_SequenceOfFuzzyDefinitions Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Dynamic_FuzzyDefinition)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Dynamic_FuzzyDefinition & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Dynamic_FuzzyDefinition

No detailed docstring for this function.") Value;
		const Handle_Dynamic_FuzzyDefinition & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Dynamic_FuzzyDefinition

No detailed docstring for this function.") ChangeValue;
		Handle_Dynamic_FuzzyDefinition & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	fromIndex(Standard_Integer)
	toIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "Args:
	None
Returns:
	Dynamic_SeqOfFuzzyDefinitions

No detailed docstring for this function.") Sequence;
		const Dynamic_SeqOfFuzzyDefinitions & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Dynamic_SeqOfFuzzyDefinitions

No detailed docstring for this function.") ChangeSequence;
		Dynamic_SeqOfFuzzyDefinitions & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dynamic_SequenceOfFuzzyDefinitions

No detailed docstring for this function.") ShallowCopy;
		Handle_Dynamic_SequenceOfFuzzyDefinitions ShallowCopy ();
};


%feature("shadow") Dynamic_SequenceOfFuzzyDefinitions::~Dynamic_SequenceOfFuzzyDefinitions %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_SequenceOfFuzzyDefinitions {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_SequenceOfFuzzyDefinitions {
	Handle_Dynamic_SequenceOfFuzzyDefinitions GetHandle() {
	return *(Handle_Dynamic_SequenceOfFuzzyDefinitions*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_SequenceOfFuzzyDefinitions;
class Handle_Dynamic_SequenceOfFuzzyDefinitions : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Dynamic_SequenceOfFuzzyDefinitions();
        Handle_Dynamic_SequenceOfFuzzyDefinitions(const Handle_Dynamic_SequenceOfFuzzyDefinitions &aHandle);
        Handle_Dynamic_SequenceOfFuzzyDefinitions(const Dynamic_SequenceOfFuzzyDefinitions *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_SequenceOfFuzzyDefinitions DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_SequenceOfFuzzyDefinitions {
    Dynamic_SequenceOfFuzzyDefinitions* GetObject() {
    return (Dynamic_SequenceOfFuzzyDefinitions*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_SequenceOfFuzzyDefinitions::~Handle_Dynamic_SequenceOfFuzzyDefinitions %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_SequenceOfFuzzyDefinitions {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dynamic_SequenceOfMethodDefinitions;
class Dynamic_SequenceOfMethodDefinitions : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dynamic_SequenceOfMethodDefinitions;
		 Dynamic_SequenceOfMethodDefinitions ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	anItem(Handle_Dynamic_MethodDefinition)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Dynamic_MethodDefinition & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Dynamic_SequenceOfMethodDefinitions)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Dynamic_SequenceOfMethodDefinitions & aSequence);
		%feature("autodoc", "Args:
	anItem(Handle_Dynamic_MethodDefinition)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Dynamic_MethodDefinition & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Dynamic_SequenceOfMethodDefinitions)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Dynamic_SequenceOfMethodDefinitions & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Dynamic_MethodDefinition)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Dynamic_MethodDefinition & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Dynamic_SequenceOfMethodDefinitions)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Dynamic_SequenceOfMethodDefinitions & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Dynamic_MethodDefinition)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Dynamic_MethodDefinition & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Dynamic_SequenceOfMethodDefinitions)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Dynamic_SequenceOfMethodDefinitions & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anOtherIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Dynamic_SequenceOfMethodDefinitions

No detailed docstring for this function.") Split;
		Handle_Dynamic_SequenceOfMethodDefinitions Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Dynamic_MethodDefinition)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Dynamic_MethodDefinition & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Dynamic_MethodDefinition

No detailed docstring for this function.") Value;
		const Handle_Dynamic_MethodDefinition & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Dynamic_MethodDefinition

No detailed docstring for this function.") ChangeValue;
		Handle_Dynamic_MethodDefinition & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	fromIndex(Standard_Integer)
	toIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "Args:
	None
Returns:
	Dynamic_SeqOfMethodDefinitions

No detailed docstring for this function.") Sequence;
		const Dynamic_SeqOfMethodDefinitions & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Dynamic_SeqOfMethodDefinitions

No detailed docstring for this function.") ChangeSequence;
		Dynamic_SeqOfMethodDefinitions & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dynamic_SequenceOfMethodDefinitions

No detailed docstring for this function.") ShallowCopy;
		Handle_Dynamic_SequenceOfMethodDefinitions ShallowCopy ();
};


%feature("shadow") Dynamic_SequenceOfMethodDefinitions::~Dynamic_SequenceOfMethodDefinitions %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_SequenceOfMethodDefinitions {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_SequenceOfMethodDefinitions {
	Handle_Dynamic_SequenceOfMethodDefinitions GetHandle() {
	return *(Handle_Dynamic_SequenceOfMethodDefinitions*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_SequenceOfMethodDefinitions;
class Handle_Dynamic_SequenceOfMethodDefinitions : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Dynamic_SequenceOfMethodDefinitions();
        Handle_Dynamic_SequenceOfMethodDefinitions(const Handle_Dynamic_SequenceOfMethodDefinitions &aHandle);
        Handle_Dynamic_SequenceOfMethodDefinitions(const Dynamic_SequenceOfMethodDefinitions *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_SequenceOfMethodDefinitions DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_SequenceOfMethodDefinitions {
    Dynamic_SequenceOfMethodDefinitions* GetObject() {
    return (Dynamic_SequenceOfMethodDefinitions*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_SequenceOfMethodDefinitions::~Handle_Dynamic_SequenceOfMethodDefinitions %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_SequenceOfMethodDefinitions {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dynamic_SequenceOfMethods;
class Dynamic_SequenceOfMethods : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dynamic_SequenceOfMethods;
		 Dynamic_SequenceOfMethods ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	anItem(Handle_Dynamic_Method)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Dynamic_Method & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Dynamic_SequenceOfMethods)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Dynamic_SequenceOfMethods & aSequence);
		%feature("autodoc", "Args:
	anItem(Handle_Dynamic_Method)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Dynamic_Method & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Dynamic_SequenceOfMethods)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Dynamic_SequenceOfMethods & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Dynamic_Method)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Dynamic_Method & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Dynamic_SequenceOfMethods)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Dynamic_SequenceOfMethods & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Dynamic_Method)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Dynamic_Method & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Dynamic_SequenceOfMethods)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Dynamic_SequenceOfMethods & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anOtherIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Dynamic_SequenceOfMethods

No detailed docstring for this function.") Split;
		Handle_Dynamic_SequenceOfMethods Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Dynamic_Method)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Dynamic_Method & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Dynamic_Method

No detailed docstring for this function.") Value;
		const Handle_Dynamic_Method & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Dynamic_Method

No detailed docstring for this function.") ChangeValue;
		Handle_Dynamic_Method & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	fromIndex(Standard_Integer)
	toIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "Args:
	None
Returns:
	Dynamic_SeqOfMethods

No detailed docstring for this function.") Sequence;
		const Dynamic_SeqOfMethods & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Dynamic_SeqOfMethods

No detailed docstring for this function.") ChangeSequence;
		Dynamic_SeqOfMethods & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dynamic_SequenceOfMethods

No detailed docstring for this function.") ShallowCopy;
		Handle_Dynamic_SequenceOfMethods ShallowCopy ();
};


%feature("shadow") Dynamic_SequenceOfMethods::~Dynamic_SequenceOfMethods %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_SequenceOfMethods {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_SequenceOfMethods {
	Handle_Dynamic_SequenceOfMethods GetHandle() {
	return *(Handle_Dynamic_SequenceOfMethods*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_SequenceOfMethods;
class Handle_Dynamic_SequenceOfMethods : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Dynamic_SequenceOfMethods();
        Handle_Dynamic_SequenceOfMethods(const Handle_Dynamic_SequenceOfMethods &aHandle);
        Handle_Dynamic_SequenceOfMethods(const Dynamic_SequenceOfMethods *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_SequenceOfMethods DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_SequenceOfMethods {
    Dynamic_SequenceOfMethods* GetObject() {
    return (Dynamic_SequenceOfMethods*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_SequenceOfMethods::~Handle_Dynamic_SequenceOfMethods %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_SequenceOfMethods {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dynamic_Variable;
class Dynamic_Variable : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates and returns an empty instance of this class.") Dynamic_Variable;
		 Dynamic_Variable ();
		%feature("autodoc", "Args:
	aparameter(Handle_Dynamic_Parameter)

Returns:
	None

Sets  the   parameter  <aparameter>   in  <self>.   This  
         parameter gives the name,  the  type of value, and  if  
         necessary the default value of the variable.") Parameter;
		void Parameter (const Handle_Dynamic_Parameter & aparameter);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dynamic_Parameter

Returns the parameter stored in <self>.") Parameter;
		Handle_Dynamic_Parameter Parameter ();
		%feature("autodoc", "Args:
	amode(Dynamic_ModeEnum)

Returns:
	None

Sets the mode to the variable. the  mode is to take in  
         the enumeration  IN,  OUT, INOUT,  INTERNAL, CONSTANT,  
         which describes the type of the variable.") Mode;
		void Mode (const Dynamic_ModeEnum amode);
		%feature("autodoc", "Args:
	None
Returns:
	Dynamic_ModeEnum

Returns the mode of the variable.") Mode;
		Dynamic_ModeEnum Mode ();
		%feature("autodoc", "Args:
	astream(Standard_OStream)

Returns:
	None

Useful for debugging.") Dump;
		void Dump (Standard_OStream & astream);
};


%feature("shadow") Dynamic_Variable::~Dynamic_Variable %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_Variable {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_Variable {
	Handle_Dynamic_Variable GetHandle() {
	return *(Handle_Dynamic_Variable*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_Variable;
class Handle_Dynamic_Variable : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Dynamic_Variable();
        Handle_Dynamic_Variable(const Handle_Dynamic_Variable &aHandle);
        Handle_Dynamic_Variable(const Dynamic_Variable *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_Variable DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_Variable {
    Dynamic_Variable* GetObject() {
    return (Dynamic_Variable*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_Variable::~Handle_Dynamic_Variable %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_Variable {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dynamic_VariableNode;
class Dynamic_VariableNode : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dynamic_VariableNode;
		 Dynamic_VariableNode ();
		%feature("autodoc", "Args:
	anitem(Handle_Dynamic_Variable)

Returns:
	None

No detailed docstring for this function.") Dynamic_VariableNode;
		 Dynamic_VariableNode (const Handle_Dynamic_Variable & anitem);
		%feature("autodoc", "Args:
	anitem(Handle_Dynamic_Variable)

Returns:
	None

No detailed docstring for this function.") Object;
		void Object (const Handle_Dynamic_Variable & anitem);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dynamic_Variable

No detailed docstring for this function.") Object;
		Handle_Dynamic_Variable Object ();
		%feature("autodoc", "Args:
	anode(Handle_Dynamic_VariableNode)

Returns:
	None

No detailed docstring for this function.") Next;
		void Next (const Handle_Dynamic_VariableNode & anode);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dynamic_VariableNode

No detailed docstring for this function.") Next;
		Handle_Dynamic_VariableNode Next ();
};


%feature("shadow") Dynamic_VariableNode::~Dynamic_VariableNode %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_VariableNode {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_VariableNode {
	Handle_Dynamic_VariableNode GetHandle() {
	return *(Handle_Dynamic_VariableNode*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_VariableNode;
class Handle_Dynamic_VariableNode : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Dynamic_VariableNode();
        Handle_Dynamic_VariableNode(const Handle_Dynamic_VariableNode &aHandle);
        Handle_Dynamic_VariableNode(const Dynamic_VariableNode *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_VariableNode DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_VariableNode {
    Dynamic_VariableNode* GetObject() {
    return (Dynamic_VariableNode*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_VariableNode::~Handle_Dynamic_VariableNode %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_VariableNode {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dynamic_AbstractVariableInstance;
class Dynamic_AbstractVariableInstance : public Dynamic_Variable {
	public:
		%feature("autodoc", "Args:
	avariable(Handle_Dynamic_Variable)

Returns:
	virtual void

This  deferred method must     be implemented in   the  
         derived    classes for  setting    reference(s) to the  
         corresponding variable(s)  which define the  signature  
         of the method definition.") Variable;
		virtual void Variable (const Handle_Dynamic_Variable & avariable);
};


%feature("shadow") Dynamic_AbstractVariableInstance::~Dynamic_AbstractVariableInstance %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_AbstractVariableInstance {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_AbstractVariableInstance {
	Handle_Dynamic_AbstractVariableInstance GetHandle() {
	return *(Handle_Dynamic_AbstractVariableInstance*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_AbstractVariableInstance;
class Handle_Dynamic_AbstractVariableInstance : public Handle_Dynamic_Variable {

    public:
        // constructors
        Handle_Dynamic_AbstractVariableInstance();
        Handle_Dynamic_AbstractVariableInstance(const Handle_Dynamic_AbstractVariableInstance &aHandle);
        Handle_Dynamic_AbstractVariableInstance(const Dynamic_AbstractVariableInstance *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_AbstractVariableInstance DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_AbstractVariableInstance {
    Dynamic_AbstractVariableInstance* GetObject() {
    return (Dynamic_AbstractVariableInstance*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_AbstractVariableInstance::~Handle_Dynamic_AbstractVariableInstance %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_AbstractVariableInstance {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dynamic_BooleanParameter;
class Dynamic_BooleanParameter : public Dynamic_Parameter {
	public:
		%feature("autodoc", "Args:
	aparameter(char *)

Returns:
	None

Creates a boolean parameter with <aparameter> as name.") Dynamic_BooleanParameter;
		 Dynamic_BooleanParameter (const char * aparameter);
		%feature("autodoc", "Args:
	aparameter(char *)
	avalue(Standard_Boolean)

Returns:
	None

Creates a boolean parameter with <aparameter> and <avalue>  
         respectively as name and value.") Dynamic_BooleanParameter;
		 Dynamic_BooleanParameter (const char * aparameter,const Standard_Boolean avalue);
		%feature("autodoc", "Args:
	aparameter(char *)
	avalue(char *)

Returns:
	None

Creates a boolean parameter with <aparameter> as name  
         and <avalue> as value. <avalue> is a CString with two possible  
         values which are : 'Standard_True' and 'Standard_False'.") Dynamic_BooleanParameter;
		 Dynamic_BooleanParameter (const char * aparameter,const char * avalue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the boolean value <thevalue>.") Value;
		Standard_Boolean Value ();
		%feature("autodoc", "Args:
	avalue(Standard_Boolean)

Returns:
	None

Sets the field <thevalue> with the boolean value <avalue>") Value;
		void Value (const Standard_Boolean avalue);
		%feature("autodoc", "Args:
	astream(Standard_OStream)

Returns:
	virtual void

Useful for debugging.") Dump;
		virtual void Dump (Standard_OStream & astream);
};


%feature("shadow") Dynamic_BooleanParameter::~Dynamic_BooleanParameter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_BooleanParameter {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_BooleanParameter {
	Handle_Dynamic_BooleanParameter GetHandle() {
	return *(Handle_Dynamic_BooleanParameter*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_BooleanParameter;
class Handle_Dynamic_BooleanParameter : public Handle_Dynamic_Parameter {

    public:
        // constructors
        Handle_Dynamic_BooleanParameter();
        Handle_Dynamic_BooleanParameter(const Handle_Dynamic_BooleanParameter &aHandle);
        Handle_Dynamic_BooleanParameter(const Dynamic_BooleanParameter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_BooleanParameter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_BooleanParameter {
    Dynamic_BooleanParameter* GetObject() {
    return (Dynamic_BooleanParameter*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_BooleanParameter::~Handle_Dynamic_BooleanParameter %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_BooleanParameter {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dynamic_DynamicDerivedClass;
class Dynamic_DynamicDerivedClass : public Dynamic_DynamicClass {
	public:
		%feature("autodoc", "Args:
	aname(char *)

Returns:
	None

Creates a new instance of this class with <aname> as name.") Dynamic_DynamicDerivedClass;
		 Dynamic_DynamicDerivedClass (const char * aname);
		%feature("autodoc", "Args:
	aclass(Handle_Dynamic_DynamicClass)

Returns:
	None

Adds another class <aclass> to the sequence of derived  
         classes.") AddClass;
		void AddClass (const Handle_Dynamic_DynamicClass & aclass);
		%feature("autodoc", "Args:
	amethod(char *)

Returns:
	virtual Handle_Dynamic_Method

Starting with  the name of  a method,  this  redefined  
         method searches for   the  right method object  in the  
         sequence of methods  of  the derived class and  in all  
         the inherited classes.") Method;
		virtual Handle_Dynamic_Method Method (const char * amethod);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Dynamic_DynamicInstance

Defines an instance of this class definition.") Instance;
		virtual Handle_Dynamic_DynamicInstance Instance ();
};


%feature("shadow") Dynamic_DynamicDerivedClass::~Dynamic_DynamicDerivedClass %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_DynamicDerivedClass {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_DynamicDerivedClass {
	Handle_Dynamic_DynamicDerivedClass GetHandle() {
	return *(Handle_Dynamic_DynamicDerivedClass*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_DynamicDerivedClass;
class Handle_Dynamic_DynamicDerivedClass : public Handle_Dynamic_DynamicClass {

    public:
        // constructors
        Handle_Dynamic_DynamicDerivedClass();
        Handle_Dynamic_DynamicDerivedClass(const Handle_Dynamic_DynamicDerivedClass &aHandle);
        Handle_Dynamic_DynamicDerivedClass(const Dynamic_DynamicDerivedClass *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_DynamicDerivedClass DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_DynamicDerivedClass {
    Dynamic_DynamicDerivedClass* GetObject() {
    return (Dynamic_DynamicDerivedClass*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_DynamicDerivedClass::~Handle_Dynamic_DynamicDerivedClass %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_DynamicDerivedClass {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dynamic_FuzzyDefinition;
class Dynamic_FuzzyDefinition : public Dynamic_FuzzyClass {
	public:
		%feature("autodoc", "Args:
	aname(char *)

Returns:
	None

Creates a FuzzyDefinition with <aname> as type.") Dynamic_FuzzyDefinition;
		 Dynamic_FuzzyDefinition (const char * aname);
		%feature("autodoc", "Args:
	None
Returns:
	virtual TCollection_AsciiString

Returns the type of object.") Type;
		virtual TCollection_AsciiString Type ();
		%feature("autodoc", "Args:
	astream(Standard_OStream)

Returns:
	virtual void

Useful for debugging.") Dump;
		virtual void Dump (Standard_OStream & astream);
};


%feature("shadow") Dynamic_FuzzyDefinition::~Dynamic_FuzzyDefinition %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_FuzzyDefinition {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_FuzzyDefinition {
	Handle_Dynamic_FuzzyDefinition GetHandle() {
	return *(Handle_Dynamic_FuzzyDefinition*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_FuzzyDefinition;
class Handle_Dynamic_FuzzyDefinition : public Handle_Dynamic_FuzzyClass {

    public:
        // constructors
        Handle_Dynamic_FuzzyDefinition();
        Handle_Dynamic_FuzzyDefinition(const Handle_Dynamic_FuzzyDefinition &aHandle);
        Handle_Dynamic_FuzzyDefinition(const Dynamic_FuzzyDefinition *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_FuzzyDefinition DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_FuzzyDefinition {
    Dynamic_FuzzyDefinition* GetObject() {
    return (Dynamic_FuzzyDefinition*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_FuzzyDefinition::~Handle_Dynamic_FuzzyDefinition %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_FuzzyDefinition {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dynamic_InstanceParameter;
class Dynamic_InstanceParameter : public Dynamic_Parameter {
	public:
		%feature("autodoc", "Args:
	aparameter(char *)

Returns:
	None

Creates an   InstanceParameter  with  <aparameter>  as  
         identifier.") Dynamic_InstanceParameter;
		 Dynamic_InstanceParameter (const char * aparameter);
		%feature("autodoc", "Args:
	aparameter(char *)
	avalue(Handle_Dynamic_DynamicInstance)

Returns:
	None

Creates   an  InstanceParameter  with  <aparameter>  as  
         identifier and <avalue> as initial value.") Dynamic_InstanceParameter;
		 Dynamic_InstanceParameter (const char * aparameter,const Handle_Dynamic_DynamicInstance & avalue);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dynamic_DynamicInstance

Returns <thevalue>.") Value;
		Handle_Dynamic_DynamicInstance Value ();
		%feature("autodoc", "Args:
	avalue(Handle_Dynamic_DynamicInstance)

Returns:
	None

Sets <avalue> to <thevalue>.") Value;
		void Value (const Handle_Dynamic_DynamicInstance & avalue);
		%feature("autodoc", "Args:
	astream(Standard_OStream)

Returns:
	virtual void

Useful for debugging.") Dump;
		virtual void Dump (Standard_OStream & astream);
};


%feature("shadow") Dynamic_InstanceParameter::~Dynamic_InstanceParameter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_InstanceParameter {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_InstanceParameter {
	Handle_Dynamic_InstanceParameter GetHandle() {
	return *(Handle_Dynamic_InstanceParameter*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_InstanceParameter;
class Handle_Dynamic_InstanceParameter : public Handle_Dynamic_Parameter {

    public:
        // constructors
        Handle_Dynamic_InstanceParameter();
        Handle_Dynamic_InstanceParameter(const Handle_Dynamic_InstanceParameter &aHandle);
        Handle_Dynamic_InstanceParameter(const Dynamic_InstanceParameter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_InstanceParameter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_InstanceParameter {
    Dynamic_InstanceParameter* GetObject() {
    return (Dynamic_InstanceParameter*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_InstanceParameter::~Handle_Dynamic_InstanceParameter %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_InstanceParameter {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dynamic_IntegerParameter;
class Dynamic_IntegerParameter : public Dynamic_Parameter {
	public:
		%feature("autodoc", "Args:
	aparameter(char *)

Returns:
	None

Creates   an  IntegerParameter  with  <aparameter>  as  
         identifier.") Dynamic_IntegerParameter;
		 Dynamic_IntegerParameter (const char * aparameter);
		%feature("autodoc", "Args:
	aparameter(char *)
	avalue(Standard_Integer)

Returns:
	None

Creates   an  IntegerParameter  with  <aparameter>  as  
         identifier and <avalue> as initial value.") Dynamic_IntegerParameter;
		 Dynamic_IntegerParameter (const char * aparameter,const Standard_Integer avalue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the integer value <thevalue>.") Value;
		Standard_Integer Value ();
		%feature("autodoc", "Args:
	avalue(Standard_Integer)

Returns:
	None

Sets the field <thevalue> with the integer value <avalue>") Value;
		void Value (const Standard_Integer avalue);
		%feature("autodoc", "Args:
	astream(Standard_OStream)

Returns:
	virtual void

Useful for debugging.") Dump;
		virtual void Dump (Standard_OStream & astream);
};


%feature("shadow") Dynamic_IntegerParameter::~Dynamic_IntegerParameter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_IntegerParameter {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_IntegerParameter {
	Handle_Dynamic_IntegerParameter GetHandle() {
	return *(Handle_Dynamic_IntegerParameter*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_IntegerParameter;
class Handle_Dynamic_IntegerParameter : public Handle_Dynamic_Parameter {

    public:
        // constructors
        Handle_Dynamic_IntegerParameter();
        Handle_Dynamic_IntegerParameter(const Handle_Dynamic_IntegerParameter &aHandle);
        Handle_Dynamic_IntegerParameter(const Dynamic_IntegerParameter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_IntegerParameter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_IntegerParameter {
    Dynamic_IntegerParameter* GetObject() {
    return (Dynamic_IntegerParameter*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_IntegerParameter::~Handle_Dynamic_IntegerParameter %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_IntegerParameter {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dynamic_MethodDefinition;
class Dynamic_MethodDefinition : public Dynamic_Method {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual TCollection_AsciiString

Returns the name of the method definition.") Type;
		virtual TCollection_AsciiString Type ();
		%feature("autodoc", "Args:
	aparameter(Handle_Dynamic_Parameter)
	amode(Dynamic_ModeEnum)
	agroup(Standard_Boolean)=Standard_False

Returns:
	None

Adds  a  new  variable   created from    the parameter  
         <aparameter>, which  defines the  name of the variable  
         its type and if necessary its  default value, the mode  
         <amode> which  precise  if it is  an  in,  out, inout,  
         internal or   constant variable and the  flag <agroup>  
         for accepting  a  set of homogeneous variables.   with  
         the parameter value <aparameter>.") AddVariable;
		void AddVariable (const Handle_Dynamic_Parameter & aparameter,const Dynamic_ModeEnum amode,const Standard_Boolean agroup = Standard_False);
		%feature("autodoc", "Args:
	astream(Standard_OStream)

Returns:
	virtual void

Useful for debugging.") Dump;
		virtual void Dump (Standard_OStream & astream);
};


%feature("shadow") Dynamic_MethodDefinition::~Dynamic_MethodDefinition %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_MethodDefinition {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_MethodDefinition {
	Handle_Dynamic_MethodDefinition GetHandle() {
	return *(Handle_Dynamic_MethodDefinition*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_MethodDefinition;
class Handle_Dynamic_MethodDefinition : public Handle_Dynamic_Method {

    public:
        // constructors
        Handle_Dynamic_MethodDefinition();
        Handle_Dynamic_MethodDefinition(const Handle_Dynamic_MethodDefinition &aHandle);
        Handle_Dynamic_MethodDefinition(const Dynamic_MethodDefinition *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_MethodDefinition DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_MethodDefinition {
    Dynamic_MethodDefinition* GetObject() {
    return (Dynamic_MethodDefinition*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_MethodDefinition::~Handle_Dynamic_MethodDefinition %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_MethodDefinition {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dynamic_ObjectParameter;
class Dynamic_ObjectParameter : public Dynamic_Parameter {
	public:
		%feature("autodoc", "Args:
	aparameter(char *)

Returns:
	None

Creates an ObjectParameter with <aparameter> as name.") Dynamic_ObjectParameter;
		 Dynamic_ObjectParameter (const char * aparameter);
		%feature("autodoc", "Args:
	aparameter(char *)
	anobject(Handle_Standard_Transient)

Returns:
	None

With  the name of  the  Parameter <aparameter> and the  
         object  <anobject>,      creates an   instance      of  
         ObjectParameter.") Dynamic_ObjectParameter;
		 Dynamic_ObjectParameter (const char * aparameter,const Handle_Standard_Transient & anobject);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

Returns the value of the parameter which is an object.") Value;
		Handle_Standard_Transient Value ();
		%feature("autodoc", "Args:
	anobject(Handle_Standard_Transient)

Returns:
	None

Sets the object <anobject> in <self>.") Value;
		void Value (const Handle_Standard_Transient & anobject);
		%feature("autodoc", "Args:
	astream(Standard_OStream)

Returns:
	virtual void

Useful for debugging.") Dump;
		virtual void Dump (Standard_OStream & astream);
};


%feature("shadow") Dynamic_ObjectParameter::~Dynamic_ObjectParameter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_ObjectParameter {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_ObjectParameter {
	Handle_Dynamic_ObjectParameter GetHandle() {
	return *(Handle_Dynamic_ObjectParameter*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_ObjectParameter;
class Handle_Dynamic_ObjectParameter : public Handle_Dynamic_Parameter {

    public:
        // constructors
        Handle_Dynamic_ObjectParameter();
        Handle_Dynamic_ObjectParameter(const Handle_Dynamic_ObjectParameter &aHandle);
        Handle_Dynamic_ObjectParameter(const Dynamic_ObjectParameter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_ObjectParameter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_ObjectParameter {
    Dynamic_ObjectParameter* GetObject() {
    return (Dynamic_ObjectParameter*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_ObjectParameter::~Handle_Dynamic_ObjectParameter %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_ObjectParameter {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dynamic_RealParameter;
class Dynamic_RealParameter : public Dynamic_Parameter {
	public:
		%feature("autodoc", "Args:
	aparameter(char *)

Returns:
	None

Creates a RealParameter with <aparameter> as name.") Dynamic_RealParameter;
		 Dynamic_RealParameter (const char * aparameter);
		%feature("autodoc", "Args:
	aparameter(char *)
	avalue(Standard_Real)

Returns:
	None

With  the name  of the Parameter  <aparameter> and the  
         real <avalue>, creates an instance of RealParameter.") Dynamic_RealParameter;
		 Dynamic_RealParameter (const char * aparameter,const Standard_Real avalue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the value of the parameter which is a real.") Value;
		Standard_Real Value ();
		%feature("autodoc", "Args:
	avalue(Standard_Real)

Returns:
	None

Sets the real <avalue> in <self>.") Value;
		void Value (const Standard_Real avalue);
		%feature("autodoc", "Args:
	astream(Standard_OStream)

Returns:
	virtual void

Useful for debugging.") Dump;
		virtual void Dump (Standard_OStream & astream);
};


%feature("shadow") Dynamic_RealParameter::~Dynamic_RealParameter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_RealParameter {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_RealParameter {
	Handle_Dynamic_RealParameter GetHandle() {
	return *(Handle_Dynamic_RealParameter*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_RealParameter;
class Handle_Dynamic_RealParameter : public Handle_Dynamic_Parameter {

    public:
        // constructors
        Handle_Dynamic_RealParameter();
        Handle_Dynamic_RealParameter(const Handle_Dynamic_RealParameter &aHandle);
        Handle_Dynamic_RealParameter(const Dynamic_RealParameter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_RealParameter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_RealParameter {
    Dynamic_RealParameter* GetObject() {
    return (Dynamic_RealParameter*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_RealParameter::~Handle_Dynamic_RealParameter %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_RealParameter {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dynamic_StringParameter;
class Dynamic_StringParameter : public Dynamic_Parameter {
	public:
		%feature("autodoc", "Args:
	aparameter(char *)

Returns:
	None

Creates a StringParameter with <aparameter> as name.") Dynamic_StringParameter;
		 Dynamic_StringParameter (const char * aparameter);
		%feature("autodoc", "Args:
	aparameter(char *)
	astring(char *)

Returns:
	None

With  the name of  the  Parameter <aparameter> and the  
         string    <astring>,   creates    an    instance    of  
         StringParameter.") Dynamic_StringParameter;
		 Dynamic_StringParameter (const char * aparameter,const char * astring);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns the value    of  the parameter which     is an  
         AsciiString.") Value;
		TCollection_AsciiString Value ();
		%feature("autodoc", "Args:
	avalue(char *)

Returns:
	None

Sets the string <avalue> in <self>.") Value;
		void Value (const char * avalue);
		%feature("autodoc", "Args:
	astream(Standard_OStream)

Returns:
	virtual void

Useful for debugging.") Dump;
		virtual void Dump (Standard_OStream & astream);
};


%feature("shadow") Dynamic_StringParameter::~Dynamic_StringParameter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_StringParameter {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_StringParameter {
	Handle_Dynamic_StringParameter GetHandle() {
	return *(Handle_Dynamic_StringParameter*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_StringParameter;
class Handle_Dynamic_StringParameter : public Handle_Dynamic_Parameter {

    public:
        // constructors
        Handle_Dynamic_StringParameter();
        Handle_Dynamic_StringParameter(const Handle_Dynamic_StringParameter &aHandle);
        Handle_Dynamic_StringParameter(const Dynamic_StringParameter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_StringParameter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_StringParameter {
    Dynamic_StringParameter* GetObject() {
    return (Dynamic_StringParameter*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_StringParameter::~Handle_Dynamic_StringParameter %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_StringParameter {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dynamic_VariableGroup;
class Dynamic_VariableGroup : public Dynamic_Variable {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates and Returns a new instance of this class.") Dynamic_VariableGroup;
		 Dynamic_VariableGroup ();
};


%feature("shadow") Dynamic_VariableGroup::~Dynamic_VariableGroup %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_VariableGroup {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_VariableGroup {
	Handle_Dynamic_VariableGroup GetHandle() {
	return *(Handle_Dynamic_VariableGroup*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_VariableGroup;
class Handle_Dynamic_VariableGroup : public Handle_Dynamic_Variable {

    public:
        // constructors
        Handle_Dynamic_VariableGroup();
        Handle_Dynamic_VariableGroup(const Handle_Dynamic_VariableGroup &aHandle);
        Handle_Dynamic_VariableGroup(const Dynamic_VariableGroup *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_VariableGroup DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_VariableGroup {
    Dynamic_VariableGroup* GetObject() {
    return (Dynamic_VariableGroup*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_VariableGroup::~Handle_Dynamic_VariableGroup %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_VariableGroup {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dynamic_CompiledMethod;
class Dynamic_CompiledMethod : public Dynamic_MethodDefinition {
	public:
		%feature("autodoc", "Args:
	aname(char *)
	afunction(char *)

Returns:
	None

Creates  a compiled method   with <aname> as user name  
         and <afunction> as C++ mangled name.") Dynamic_CompiledMethod;
		 Dynamic_CompiledMethod (const char * aname,const char * afunction);
		%feature("autodoc", "Args:
	afunction(char *)

Returns:
	None

Sets the  C++ mangled name  of the method to the field  
         <thefunction>.") Function;
		void Function (const char * afunction);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns the C++ mangled name of the function.") Function;
		TCollection_AsciiString Function ();
};


%feature("shadow") Dynamic_CompiledMethod::~Dynamic_CompiledMethod %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_CompiledMethod {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_CompiledMethod {
	Handle_Dynamic_CompiledMethod GetHandle() {
	return *(Handle_Dynamic_CompiledMethod*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_CompiledMethod;
class Handle_Dynamic_CompiledMethod : public Handle_Dynamic_MethodDefinition {

    public:
        // constructors
        Handle_Dynamic_CompiledMethod();
        Handle_Dynamic_CompiledMethod(const Handle_Dynamic_CompiledMethod &aHandle);
        Handle_Dynamic_CompiledMethod(const Dynamic_CompiledMethod *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_CompiledMethod DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_CompiledMethod {
    Dynamic_CompiledMethod* GetObject() {
    return (Dynamic_CompiledMethod*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_CompiledMethod::~Handle_Dynamic_CompiledMethod %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_CompiledMethod {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dynamic_CompositMethod;
class Dynamic_CompositMethod : public Dynamic_MethodDefinition {
	public:
		%feature("autodoc", "Args:
	aname(char *)

Returns:
	None

Creates a composit method with <aname> as name.") Dynamic_CompositMethod;
		 Dynamic_CompositMethod (const char * aname);
		%feature("autodoc", "Args:
	amethod(Handle_Dynamic_Method)

Returns:
	None

Adds <amethod>, which  is an elementary or  a composit  
         method to <self>.") Method;
		void Method (const Handle_Dynamic_Method & amethod);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the   number  of methods   referenced  by  the  
         composit method <self>.") NumberOfMethods;
		Standard_Integer NumberOfMethods ();
		%feature("autodoc", "Args:
	anindex(Standard_Integer)

Returns:
	Handle_Dynamic_Method

Returns the method of range <anindex>.") Method;
		Handle_Dynamic_Method Method (const Standard_Integer anindex);
		%feature("autodoc", "Args:
	astream(Standard_OStream)

Returns:
	virtual void

Useful for debugging.") Dump;
		virtual void Dump (Standard_OStream & astream);
};


%feature("shadow") Dynamic_CompositMethod::~Dynamic_CompositMethod %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_CompositMethod {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_CompositMethod {
	Handle_Dynamic_CompositMethod GetHandle() {
	return *(Handle_Dynamic_CompositMethod*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_CompositMethod;
class Handle_Dynamic_CompositMethod : public Handle_Dynamic_MethodDefinition {

    public:
        // constructors
        Handle_Dynamic_CompositMethod();
        Handle_Dynamic_CompositMethod(const Handle_Dynamic_CompositMethod &aHandle);
        Handle_Dynamic_CompositMethod(const Dynamic_CompositMethod *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_CompositMethod DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_CompositMethod {
    Dynamic_CompositMethod* GetObject() {
    return (Dynamic_CompositMethod*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_CompositMethod::~Handle_Dynamic_CompositMethod %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_CompositMethod {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dynamic_CompositVariableInstance;
class Dynamic_CompositVariableInstance : public Dynamic_AbstractVariableInstance {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates  a new  empty  instance of   CompositVariable-  
         Instance.") Dynamic_CompositVariableInstance;
		 Dynamic_CompositVariableInstance ();
		%feature("autodoc", "Args:
	avariable(Handle_Dynamic_Variable)

Returns:
	virtual void

Sets <avariable> into the collection of variable.") Variable;
		virtual void Variable (const Handle_Dynamic_Variable & avariable);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dynamic_VariableNode

Returns the first VariableNode  useful to explore  the  
         list of variables addressed by <self>.") FirstVariableNode;
		Handle_Dynamic_VariableNode FirstVariableNode ();
};


%feature("shadow") Dynamic_CompositVariableInstance::~Dynamic_CompositVariableInstance %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_CompositVariableInstance {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_CompositVariableInstance {
	Handle_Dynamic_CompositVariableInstance GetHandle() {
	return *(Handle_Dynamic_CompositVariableInstance*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_CompositVariableInstance;
class Handle_Dynamic_CompositVariableInstance : public Handle_Dynamic_AbstractVariableInstance {

    public:
        // constructors
        Handle_Dynamic_CompositVariableInstance();
        Handle_Dynamic_CompositVariableInstance(const Handle_Dynamic_CompositVariableInstance &aHandle);
        Handle_Dynamic_CompositVariableInstance(const Dynamic_CompositVariableInstance *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_CompositVariableInstance DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_CompositVariableInstance {
    Dynamic_CompositVariableInstance* GetObject() {
    return (Dynamic_CompositVariableInstance*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_CompositVariableInstance::~Handle_Dynamic_CompositVariableInstance %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_CompositVariableInstance {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dynamic_InterpretedMethod;
class Dynamic_InterpretedMethod : public Dynamic_MethodDefinition {
	public:
		%feature("autodoc", "Args:
	aname(char *)
	afile(char *)

Returns:
	None

Creates a new  InterpretedMethod with <aname> as  name  
         and <afile> as file name to be interpreted.") Dynamic_InterpretedMethod;
		 Dynamic_InterpretedMethod (const char * aname,const char * afile);
		%feature("autodoc", "Args:
	afile(char *)

Returns:
	None

Sets the the   name of the  file to  be interpreted to  
         <afile>.") Function;
		void Function (const char * afile);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns the name of the file to be interpreted.") Function;
		TCollection_AsciiString Function ();
};


%feature("shadow") Dynamic_InterpretedMethod::~Dynamic_InterpretedMethod %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_InterpretedMethod {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_InterpretedMethod {
	Handle_Dynamic_InterpretedMethod GetHandle() {
	return *(Handle_Dynamic_InterpretedMethod*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_InterpretedMethod;
class Handle_Dynamic_InterpretedMethod : public Handle_Dynamic_MethodDefinition {

    public:
        // constructors
        Handle_Dynamic_InterpretedMethod();
        Handle_Dynamic_InterpretedMethod(const Handle_Dynamic_InterpretedMethod &aHandle);
        Handle_Dynamic_InterpretedMethod(const Dynamic_InterpretedMethod *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_InterpretedMethod DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_InterpretedMethod {
    Dynamic_InterpretedMethod* GetObject() {
    return (Dynamic_InterpretedMethod*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_InterpretedMethod::~Handle_Dynamic_InterpretedMethod %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_InterpretedMethod {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dynamic_VariableInstance;
class Dynamic_VariableInstance : public Dynamic_AbstractVariableInstance {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Returns a new empty instance of this class.") Dynamic_VariableInstance;
		 Dynamic_VariableInstance ();
		%feature("autodoc", "Args:
	avariable(Handle_Dynamic_Variable)

Returns:
	virtual void

Sets    the    variable  <avariable>     into      the  
         VariableInstance <self>.") Variable;
		virtual void Variable (const Handle_Dynamic_Variable & avariable);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dynamic_Variable

Returns       the      variable contained     into the  
         VariableInstance <self>.") Variable;
		Handle_Dynamic_Variable Variable ();
};


%feature("shadow") Dynamic_VariableInstance::~Dynamic_VariableInstance %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dynamic_VariableInstance {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dynamic_VariableInstance {
	Handle_Dynamic_VariableInstance GetHandle() {
	return *(Handle_Dynamic_VariableInstance*) &$self;
	}
};

%nodefaultctor Handle_Dynamic_VariableInstance;
class Handle_Dynamic_VariableInstance : public Handle_Dynamic_AbstractVariableInstance {

    public:
        // constructors
        Handle_Dynamic_VariableInstance();
        Handle_Dynamic_VariableInstance(const Handle_Dynamic_VariableInstance &aHandle);
        Handle_Dynamic_VariableInstance(const Dynamic_VariableInstance *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dynamic_VariableInstance DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dynamic_VariableInstance {
    Dynamic_VariableInstance* GetObject() {
    return (Dynamic_VariableInstance*)$self->Access();
    }
};
%feature("shadow") Handle_Dynamic_VariableInstance::~Handle_Dynamic_VariableInstance %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dynamic_VariableInstance {
    void _kill_pointed() {
        delete $self;
    }
};

