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
		%feature("autodoc", "	:param amode:
	:type amode: char *
	:rtype: Dynamic_ModeEnum
") Mode;
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
		%feature("autodoc", "	* Creates a new empty instance of DynamicClass.

	:param aname:
	:type aname: char *
	:rtype: None
") Dynamic_DynamicClass;
		 Dynamic_DynamicClass (const char * aname);
		%feature("autodoc", "	* Adds another parameter <aparameter> to the sequence of parameter definitions.

	:param aparameter:
	:type aparameter: Handle_Dynamic_Parameter &
	:rtype: None
") Parameter;
		void Parameter (const Handle_Dynamic_Parameter & aparameter);
		%feature("autodoc", "	* Adds another method to the sequence of methods. It has <amethod> as name and <anaddress> as mangled name of the corresponding C++ function which must be called.

	:param amethod:
	:type amethod: char *
	:param anaddress:
	:type anaddress: char *
	:rtype: None
") CompiledMethod;
		void CompiledMethod (const char * amethod,const char * anaddress);
		%feature("autodoc", "	* Adds another method to the sequence of methods. It has <amethod> as name and <afile> as interpreted file.

	:param amethod:
	:type amethod: char *
	:param afile:
	:type afile: char *
	:rtype: None
") InterpretedMethod;
		void InterpretedMethod (const char * amethod,const char * afile);
		%feature("autodoc", "	* Returns a reference to the method object identified by the string <amethod>.

	:param amethod:
	:type amethod: char *
	:rtype: Handle_Dynamic_Method
") Method;
		virtual Handle_Dynamic_Method Method (const char * amethod);
		%feature("autodoc", "	* Returns an instance object of this class.

	:rtype: Handle_Dynamic_DynamicInstance
") Instance;
		virtual Handle_Dynamic_DynamicInstance Instance ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("autodoc", "	* Creates an empty instance of this class.

	:rtype: None
") Dynamic_DynamicInstance;
		 Dynamic_DynamicInstance ();
		%feature("autodoc", "	* Adds <aparameter> to the sequence of parameters of <self>.

	:param aparameter:
	:type aparameter: Handle_Dynamic_Parameter &
	:rtype: None
") Parameter;
		void Parameter (const Handle_Dynamic_Parameter & aparameter);
		%feature("autodoc", "	* Adds all the parameters of <self>, to the sequence of parameters of <aninstance>.

	:param aninstance:
	:type aninstance: Handle_Dynamic_DynamicInstance &
	:rtype: None
") Parameter;
		void Parameter (const Handle_Dynamic_DynamicInstance & aninstance);
		%feature("autodoc", "	* Puts the integer value <avalue> into the parameter object identified by the string <aparameter>.

	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: Standard_Integer
	:rtype: None
") Parameter;
		void Parameter (const char * aparameter,const Standard_Integer avalue);
		%feature("autodoc", "	* Puts the real value <avalue> into the parameter object identified by the string <aparameter>.

	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: float
	:rtype: None
") Parameter;
		void Parameter (const char * aparameter,const Standard_Real avalue);
		%feature("autodoc", "	* Puts the string <avalue> into the parameter object identified by the string <aparameter>.

	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: char *
	:rtype: None
") Parameter;
		void Parameter (const char * aparameter,const char * avalue);
		%feature("autodoc", "	* Puts the dynamic instance <avalue> into the parameter object identified by the string <aparameter>.

	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: Handle_Dynamic_DynamicInstance &
	:rtype: None
") Parameter;
		void Parameter (const char * aparameter,const Handle_Dynamic_DynamicInstance & avalue);
		%feature("autodoc", "	* Searches and returns the parameter object identified by the string <aparameter>.

	:param aparameter:
	:type aparameter: char *
	:rtype: Handle_Dynamic_Parameter
") Parameter;
		Handle_Dynamic_Parameter Parameter (const char * aparameter);
		%feature("autodoc", "	* Sets the reference of the class.

	:param aclass:
	:type aclass: Handle_Dynamic_DynamicClass &
	:rtype: None
") Class;
		void Class (const Handle_Dynamic_DynamicClass & aclass);
		%feature("autodoc", "	* Calls the method identified by the string <amethod>.

	:param amethod:
	:type amethod: char *
	:rtype: None
") Execute;
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
		%feature("autodoc", "	* This deferred method must returns the type of the object. If the instance is of the type FuzzyDefinition the method simply returns the field <thetype>. If the instance is of the type FuzzyInstance the method calls the Type method on the true definition.

	:rtype: TCollection_AsciiString
") Type;
		virtual TCollection_AsciiString Type ();
		%feature("autodoc", "	* Returns the head of the list of parameters. For the FuzzyDefinition class this method returns the head of the exaustive list of parameters defining the object and for the FuzzyInstance it just returns the head of the overloaded values.

	:rtype: Handle_Dynamic_ParameterNode
") FirstParameter;
		Handle_Dynamic_ParameterNode FirstParameter ();
		%feature("autodoc", "	* Returns true if there is a parameter with <aparameter> as name, false otherwise.

	:param aparameter:
	:type aparameter: char *
	:rtype: bool
") Parameter;
		Standard_Boolean Parameter (const char * aparameter);
		%feature("autodoc", "	* Adds another parameter <aparameter> to the sequence of parameters.

	:param aparameter:
	:type aparameter: Handle_Dynamic_Parameter &
	:rtype: None
") Parameter;
		void Parameter (const Handle_Dynamic_Parameter & aparameter);
		%feature("autodoc", "	* Adds to the instance <self> the parameter <aparameter> with the boolean value <avalue>.

	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: bool
	:rtype: void
") Parameter;
		virtual void Parameter (const char * aparameter,const Standard_Boolean avalue);
		%feature("autodoc", "	* Adds to the instance <self> the parameter <aparameter> with the integer value <avalue>.

	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: Standard_Integer
	:rtype: void
") Parameter;
		virtual void Parameter (const char * aparameter,const Standard_Integer avalue);
		%feature("autodoc", "	* Adds to the instance <self> the parameter <aparameter> with the real value <avalue>.

	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: float
	:rtype: void
") Parameter;
		virtual void Parameter (const char * aparameter,const Standard_Real avalue);
		%feature("autodoc", "	* Adds to the instance <self> the parameter <aparameter> with the string <astring>.

	:param aparameter:
	:type aparameter: char *
	:param astring:
	:type astring: char *
	:rtype: void
") Parameter;
		virtual void Parameter (const char * aparameter,const char * astring);
		%feature("autodoc", "	* Adds to the instance <self> the parameter <aparameter> with the object value <anobject>.

	:param aparameter:
	:type aparameter: char *
	:param anobject:
	:type anobject: Handle_Standard_Transient &
	:rtype: void
") Parameter;
		virtual void Parameter (const char * aparameter,const Handle_Standard_Transient & anobject);
		%feature("autodoc", "	* Returns True, if there is a parameter <aparameter> previously stored in the instance <self> and there is the corresponding boolean value in the output argument <avalue>, False otherwise.

	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: bool
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const char * aparameter,Standard_Boolean & avalue);
		%feature("autodoc", "	* Returns True, if there is a parameter <aparameter> previously stored in the instance <self> and there is the corresponding integer value in the output argument <avalue>, False otherwise.

	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: Standard_Integer &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const char * aparameter,Standard_Integer &OutValue);
		%feature("autodoc", "	* Returns True, if there is a parameter <aparameter> previously stored in the instance <self> and there is the corresponding real value in the output argument <avalue>, False otherwise.

	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: float &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const char * aparameter,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns True, if there is a parameter <aparameter> previously stored in the instance <self> and there is the corresponding string in the output argument <avalue>, False otherwise.

	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: TCollection_AsciiString &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const char * aparameter,TCollection_AsciiString & avalue);
		%feature("autodoc", "	* Returns True, if there is a parameter <aparameter> previously stored in the instance <self> and there is the corresponding object value in the output argument <avalue>, False otherwise.

	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: Handle_Standard_Transient &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const char * aparameter,Handle_Standard_Transient & avalue);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("autodoc", "	* Starting with a file named <afilename>, fills the dictionary with all the wishes definitions.

	:param afilename:
	:type afilename: char *
	:rtype: None
") Creates;
		void Creates (const char * afilename);
		%feature("autodoc", "	* This virtual method allows the user to add recognition of its own parameters when reading the file to fill the dictionary.

	:param aname:
	:type aname: char *
	:param atype:
	:type atype: char *
	:param avalue:
	:type avalue: char *
	:rtype: Handle_Dynamic_Parameter
") Switch;
		virtual Handle_Dynamic_Parameter Switch (const char * aname,const char * atype,const char * avalue);
		%feature("autodoc", "	* Returns from the dictionary in the out variable <adefinition> a reference to the right instance of the definition identified by its type <atype>. The method returns true if the definition exist, false otherwise.

	:param atype:
	:type atype: char *
	:param adefinition:
	:type adefinition: Handle_Dynamic_FuzzyClass &
	:rtype: bool
") Definition;
		Standard_Boolean Definition (const char * atype,Handle_Dynamic_FuzzyClass & adefinition);
		%feature("autodoc", "	* Returns true if there has been no modification of the file fuzzyclasses.dat since the creation of the dictionary object, false otherwise.

	:rtype: bool
") UpToDate;
		Standard_Boolean UpToDate ();
		%feature("autodoc", "	* Returns the number of definitions stored in the dictionary.

	:rtype: int
") NumberOfDefinitions;
		Standard_Integer NumberOfDefinitions ();
		%feature("autodoc", "	* Returns a reference on the definition identified by the index <anidex>.

	:param anindex:
	:type anindex: Standard_Integer
	:rtype: Handle_Dynamic_FuzzyClass
") Definition;
		Handle_Dynamic_FuzzyClass Definition (const Standard_Integer anindex);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("autodoc", "	* Returns the type of object which is the name of the function definition.

	:rtype: TCollection_AsciiString
") Type;
		virtual TCollection_AsciiString Type ();
		%feature("autodoc", "	* Returns the first variable node of the Method which contains a variable.

	:rtype: Handle_Dynamic_VariableNode
") FirstVariableNode;
		Handle_Dynamic_VariableNode FirstVariableNode ();
		%feature("autodoc", "	* Returns true if there is a variable with <avariable> as name, false otherwise.

	:param avariable:
	:type avariable: char *
	:rtype: bool
") Variable;
		Standard_Boolean Variable (const char * avariable);
		%feature("autodoc", "	* Adds another variable <avariable> to the sequence of variable definitions.

	:param avariable:
	:type avariable: Handle_Dynamic_Variable &
	:rtype: None
") Variable;
		void Variable (const Handle_Dynamic_Variable & avariable);
		%feature("autodoc", "	* Returns True, if there is a variable <avariable> previously stored in the instance <self> and there is the corresponding parameter value in the output argument <aparameter>, False otherwise.

	:param aname:
	:type aname: char *
	:param aparameter:
	:type aparameter: Handle_Dynamic_Parameter &
	:param amode:
	:type amode: Dynamic_ModeEnum &
	:rtype: bool
") Value;
		Standard_Boolean Value (const char * aname,Handle_Dynamic_Parameter & aparameter,Dynamic_ModeEnum & amode);
		%feature("autodoc", "	* Returns True, if there is a variable named <aname> previously stored in the instance of <self> and returns the corresponding variable in the output argument <avariable>, False otherwise.

	:param aname:
	:type aname: char *
	:param avariable:
	:type avariable: Handle_Dynamic_Variable &
	:rtype: bool
") Value;
		Standard_Boolean Value (const char * aname,Handle_Dynamic_Variable & avariable);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("autodoc", "	* Starting with a file named <afilename>, fills the dictionary with all the wishes definitions.

	:param afilename:
	:type afilename: char *
	:rtype: None
") Creates;
		void Creates (const char * afilename);
		%feature("autodoc", "	* This method sets the new definition <adefinition> in the dictionary. It returns true if the operation is successful, false otherwise.

	:param adefinition:
	:type adefinition: Handle_Dynamic_Method &
	:rtype: bool
") Definition;
		Standard_Boolean Definition (const Handle_Dynamic_Method & adefinition);
		%feature("autodoc", "	* This virtual method allows the user to add recognition of its own parameters when reading the file to fill the dictionary.

	:param aname:
	:type aname: char *
	:param atype:
	:type atype: char *
	:param avalue:
	:type avalue: char *
	:rtype: Handle_Dynamic_Parameter
") Switch;
		Handle_Dynamic_Parameter Switch (const char * aname,const char * atype,const char * avalue);
		%feature("autodoc", "	* Returns from the dictionary in the out variable <adefinition> a reference to the right instance of the definition identified by its type <atype>. The method returns true if the definition exist, false otherwise.

	:param atype:
	:type atype: char *
	:param adefinition:
	:type adefinition: Handle_Dynamic_Method &
	:rtype: bool
") Definition;
		Standard_Boolean Definition (const char * atype,Handle_Dynamic_Method & adefinition);
		%feature("autodoc", "	* Returns true if there has been no modification of the file method-definitions.dat since the creation of the dictionary object, false otherwise.

	:rtype: bool
") UpToDate;
		Standard_Boolean UpToDate ();
		%feature("autodoc", "	* Returns the number of definitions stored in the dictionary.

	:rtype: int
") NumberOfDefinitions;
		Standard_Integer NumberOfDefinitions ();
		%feature("autodoc", "	* Returns a reference on the definition identified by the index <anidex>.

	:param anindex:
	:type anindex: Standard_Integer
	:rtype: Handle_Dynamic_Method
") Definition;
		Handle_Dynamic_Method Definition (const Standard_Integer anindex);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("autodoc", "	* Returns in an AsciiString the name of the parameter.

	:rtype: TCollection_AsciiString
") Name;
		TCollection_AsciiString Name ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("autodoc", "	:rtype: None
") Dynamic_ParameterNode;
		 Dynamic_ParameterNode ();
		%feature("autodoc", "	:param anitem:
	:type anitem: Handle_Dynamic_Parameter &
	:rtype: None
") Dynamic_ParameterNode;
		 Dynamic_ParameterNode (const Handle_Dynamic_Parameter & anitem);
		%feature("autodoc", "	:param anitem:
	:type anitem: Handle_Dynamic_Parameter &
	:rtype: None
") Object;
		void Object (const Handle_Dynamic_Parameter & anitem);
		%feature("autodoc", "	:rtype: Handle_Dynamic_Parameter
") Object;
		Handle_Dynamic_Parameter Object ();
		%feature("autodoc", "	:param anode:
	:type anode: Handle_Dynamic_ParameterNode &
	:rtype: None
") Next;
		void Next (const Handle_Dynamic_ParameterNode & anode);
		%feature("autodoc", "	:rtype: Handle_Dynamic_ParameterNode
") Next;
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
		%feature("autodoc", "	:rtype: None
") Dynamic_SeqOfClasses;
		 Dynamic_SeqOfClasses ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Dynamic_SeqOfClasses &
	:rtype: Dynamic_SeqOfClasses
") Assign;
		const Dynamic_SeqOfClasses & Assign (const Dynamic_SeqOfClasses & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Dynamic_SeqOfClasses &
	:rtype: Dynamic_SeqOfClasses
") operator=;
		const Dynamic_SeqOfClasses & operator = (const Dynamic_SeqOfClasses & Other);
		%feature("autodoc", "	:param T:
	:type T: Handle_Dynamic_DynamicClass &
	:rtype: None
") Append;
		void Append (const Handle_Dynamic_DynamicClass & T);
		%feature("autodoc", "	:param S:
	:type S: Dynamic_SeqOfClasses &
	:rtype: None
") Append;
		void Append (Dynamic_SeqOfClasses & S);
		%feature("autodoc", "	:param T:
	:type T: Handle_Dynamic_DynamicClass &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Dynamic_DynamicClass & T);
		%feature("autodoc", "	:param S:
	:type S: Dynamic_SeqOfClasses &
	:rtype: None
") Prepend;
		void Prepend (Dynamic_SeqOfClasses & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Dynamic_DynamicClass &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Dynamic_DynamicClass & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Dynamic_SeqOfClasses &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Dynamic_SeqOfClasses & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Dynamic_DynamicClass &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Dynamic_DynamicClass & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Dynamic_SeqOfClasses &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Dynamic_SeqOfClasses & S);
		%feature("autodoc", "	:rtype: Handle_Dynamic_DynamicClass
") First;
		const Handle_Dynamic_DynamicClass & First ();
		%feature("autodoc", "	:rtype: Handle_Dynamic_DynamicClass
") Last;
		const Handle_Dynamic_DynamicClass & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Dynamic_SeqOfClasses &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Dynamic_SeqOfClasses & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Dynamic_DynamicClass
") Value;
		const Handle_Dynamic_DynamicClass & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Handle_Dynamic_DynamicClass &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Dynamic_DynamicClass & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Dynamic_DynamicClass
") ChangeValue;
		Handle_Dynamic_DynamicClass & ChangeValue (const Standard_Integer Index);
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
		%feature("autodoc", "	:rtype: None
") Dynamic_SeqOfFuzzyDefinitions;
		 Dynamic_SeqOfFuzzyDefinitions ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Dynamic_SeqOfFuzzyDefinitions &
	:rtype: Dynamic_SeqOfFuzzyDefinitions
") Assign;
		const Dynamic_SeqOfFuzzyDefinitions & Assign (const Dynamic_SeqOfFuzzyDefinitions & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Dynamic_SeqOfFuzzyDefinitions &
	:rtype: Dynamic_SeqOfFuzzyDefinitions
") operator=;
		const Dynamic_SeqOfFuzzyDefinitions & operator = (const Dynamic_SeqOfFuzzyDefinitions & Other);
		%feature("autodoc", "	:param T:
	:type T: Handle_Dynamic_FuzzyDefinition &
	:rtype: None
") Append;
		void Append (const Handle_Dynamic_FuzzyDefinition & T);
		%feature("autodoc", "	:param S:
	:type S: Dynamic_SeqOfFuzzyDefinitions &
	:rtype: None
") Append;
		void Append (Dynamic_SeqOfFuzzyDefinitions & S);
		%feature("autodoc", "	:param T:
	:type T: Handle_Dynamic_FuzzyDefinition &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Dynamic_FuzzyDefinition & T);
		%feature("autodoc", "	:param S:
	:type S: Dynamic_SeqOfFuzzyDefinitions &
	:rtype: None
") Prepend;
		void Prepend (Dynamic_SeqOfFuzzyDefinitions & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Dynamic_FuzzyDefinition &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Dynamic_FuzzyDefinition & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Dynamic_SeqOfFuzzyDefinitions &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Dynamic_SeqOfFuzzyDefinitions & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Dynamic_FuzzyDefinition &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Dynamic_FuzzyDefinition & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Dynamic_SeqOfFuzzyDefinitions &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Dynamic_SeqOfFuzzyDefinitions & S);
		%feature("autodoc", "	:rtype: Handle_Dynamic_FuzzyDefinition
") First;
		const Handle_Dynamic_FuzzyDefinition & First ();
		%feature("autodoc", "	:rtype: Handle_Dynamic_FuzzyDefinition
") Last;
		const Handle_Dynamic_FuzzyDefinition & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Dynamic_SeqOfFuzzyDefinitions &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Dynamic_SeqOfFuzzyDefinitions & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Dynamic_FuzzyDefinition
") Value;
		const Handle_Dynamic_FuzzyDefinition & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Handle_Dynamic_FuzzyDefinition &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Dynamic_FuzzyDefinition & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Dynamic_FuzzyDefinition
") ChangeValue;
		Handle_Dynamic_FuzzyDefinition & ChangeValue (const Standard_Integer Index);
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
		%feature("autodoc", "	:rtype: None
") Dynamic_SeqOfMethodDefinitions;
		 Dynamic_SeqOfMethodDefinitions ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Dynamic_SeqOfMethodDefinitions &
	:rtype: Dynamic_SeqOfMethodDefinitions
") Assign;
		const Dynamic_SeqOfMethodDefinitions & Assign (const Dynamic_SeqOfMethodDefinitions & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Dynamic_SeqOfMethodDefinitions &
	:rtype: Dynamic_SeqOfMethodDefinitions
") operator=;
		const Dynamic_SeqOfMethodDefinitions & operator = (const Dynamic_SeqOfMethodDefinitions & Other);
		%feature("autodoc", "	:param T:
	:type T: Handle_Dynamic_MethodDefinition &
	:rtype: None
") Append;
		void Append (const Handle_Dynamic_MethodDefinition & T);
		%feature("autodoc", "	:param S:
	:type S: Dynamic_SeqOfMethodDefinitions &
	:rtype: None
") Append;
		void Append (Dynamic_SeqOfMethodDefinitions & S);
		%feature("autodoc", "	:param T:
	:type T: Handle_Dynamic_MethodDefinition &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Dynamic_MethodDefinition & T);
		%feature("autodoc", "	:param S:
	:type S: Dynamic_SeqOfMethodDefinitions &
	:rtype: None
") Prepend;
		void Prepend (Dynamic_SeqOfMethodDefinitions & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Dynamic_MethodDefinition &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Dynamic_MethodDefinition & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Dynamic_SeqOfMethodDefinitions &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Dynamic_SeqOfMethodDefinitions & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Dynamic_MethodDefinition &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Dynamic_MethodDefinition & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Dynamic_SeqOfMethodDefinitions &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Dynamic_SeqOfMethodDefinitions & S);
		%feature("autodoc", "	:rtype: Handle_Dynamic_MethodDefinition
") First;
		const Handle_Dynamic_MethodDefinition & First ();
		%feature("autodoc", "	:rtype: Handle_Dynamic_MethodDefinition
") Last;
		const Handle_Dynamic_MethodDefinition & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Dynamic_SeqOfMethodDefinitions &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Dynamic_SeqOfMethodDefinitions & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Dynamic_MethodDefinition
") Value;
		const Handle_Dynamic_MethodDefinition & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Handle_Dynamic_MethodDefinition &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Dynamic_MethodDefinition & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Dynamic_MethodDefinition
") ChangeValue;
		Handle_Dynamic_MethodDefinition & ChangeValue (const Standard_Integer Index);
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
		%feature("autodoc", "	:rtype: None
") Dynamic_SeqOfMethods;
		 Dynamic_SeqOfMethods ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Dynamic_SeqOfMethods &
	:rtype: Dynamic_SeqOfMethods
") Assign;
		const Dynamic_SeqOfMethods & Assign (const Dynamic_SeqOfMethods & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Dynamic_SeqOfMethods &
	:rtype: Dynamic_SeqOfMethods
") operator=;
		const Dynamic_SeqOfMethods & operator = (const Dynamic_SeqOfMethods & Other);
		%feature("autodoc", "	:param T:
	:type T: Handle_Dynamic_Method &
	:rtype: None
") Append;
		void Append (const Handle_Dynamic_Method & T);
		%feature("autodoc", "	:param S:
	:type S: Dynamic_SeqOfMethods &
	:rtype: None
") Append;
		void Append (Dynamic_SeqOfMethods & S);
		%feature("autodoc", "	:param T:
	:type T: Handle_Dynamic_Method &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Dynamic_Method & T);
		%feature("autodoc", "	:param S:
	:type S: Dynamic_SeqOfMethods &
	:rtype: None
") Prepend;
		void Prepend (Dynamic_SeqOfMethods & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Dynamic_Method &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Dynamic_Method & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Dynamic_SeqOfMethods &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Dynamic_SeqOfMethods & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Dynamic_Method &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Dynamic_Method & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Dynamic_SeqOfMethods &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Dynamic_SeqOfMethods & S);
		%feature("autodoc", "	:rtype: Handle_Dynamic_Method
") First;
		const Handle_Dynamic_Method & First ();
		%feature("autodoc", "	:rtype: Handle_Dynamic_Method
") Last;
		const Handle_Dynamic_Method & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Dynamic_SeqOfMethods &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Dynamic_SeqOfMethods & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Dynamic_Method
") Value;
		const Handle_Dynamic_Method & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Handle_Dynamic_Method &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Dynamic_Method & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Dynamic_Method
") ChangeValue;
		Handle_Dynamic_Method & ChangeValue (const Standard_Integer Index);
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
		%feature("autodoc", "	:param I:
	:type I: Handle_Dynamic_DynamicClass &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Dynamic_SequenceNodeOfSeqOfClasses;
		 Dynamic_SequenceNodeOfSeqOfClasses (const Handle_Dynamic_DynamicClass & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Handle_Dynamic_DynamicClass
") Value;
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
		%feature("autodoc", "	:param I:
	:type I: Handle_Dynamic_FuzzyDefinition &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions;
		 Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions (const Handle_Dynamic_FuzzyDefinition & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Handle_Dynamic_FuzzyDefinition
") Value;
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
		%feature("autodoc", "	:param I:
	:type I: Handle_Dynamic_MethodDefinition &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Dynamic_SequenceNodeOfSeqOfMethodDefinitions;
		 Dynamic_SequenceNodeOfSeqOfMethodDefinitions (const Handle_Dynamic_MethodDefinition & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Handle_Dynamic_MethodDefinition
") Value;
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
		%feature("autodoc", "	:param I:
	:type I: Handle_Dynamic_Method &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Dynamic_SequenceNodeOfSeqOfMethods;
		 Dynamic_SequenceNodeOfSeqOfMethods (const Handle_Dynamic_Method & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Handle_Dynamic_Method
") Value;
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
		%feature("autodoc", "	:rtype: None
") Dynamic_SequenceOfClasses;
		 Dynamic_SequenceOfClasses ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Dynamic_DynamicClass &
	:rtype: None
") Append;
		void Append (const Handle_Dynamic_DynamicClass & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Dynamic_SequenceOfClasses &
	:rtype: None
") Append;
		void Append (const Handle_Dynamic_SequenceOfClasses & aSequence);
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Dynamic_DynamicClass &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Dynamic_DynamicClass & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Dynamic_SequenceOfClasses &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Dynamic_SequenceOfClasses & aSequence);
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Dynamic_DynamicClass &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Dynamic_DynamicClass & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_Dynamic_SequenceOfClasses &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Dynamic_SequenceOfClasses & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Dynamic_DynamicClass &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Dynamic_DynamicClass & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_Dynamic_SequenceOfClasses &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Dynamic_SequenceOfClasses & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anOtherIndex:
	:type anOtherIndex: Standard_Integer
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Dynamic_SequenceOfClasses
") Split;
		Handle_Dynamic_SequenceOfClasses Split (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Dynamic_DynamicClass &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Dynamic_DynamicClass & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Dynamic_DynamicClass
") Value;
		const Handle_Dynamic_DynamicClass & Value (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Dynamic_DynamicClass
") ChangeValue;
		Handle_Dynamic_DynamicClass & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: Standard_Integer
	:param toIndex:
	:type toIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "	:rtype: Dynamic_SeqOfClasses
") Sequence;
		const Dynamic_SeqOfClasses & Sequence ();
		%feature("autodoc", "	:rtype: Dynamic_SeqOfClasses
") ChangeSequence;
		Dynamic_SeqOfClasses & ChangeSequence ();
		%feature("autodoc", "	:rtype: Handle_Dynamic_SequenceOfClasses
") ShallowCopy;
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
		%feature("autodoc", "	:rtype: None
") Dynamic_SequenceOfFuzzyDefinitions;
		 Dynamic_SequenceOfFuzzyDefinitions ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Dynamic_FuzzyDefinition &
	:rtype: None
") Append;
		void Append (const Handle_Dynamic_FuzzyDefinition & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Dynamic_SequenceOfFuzzyDefinitions &
	:rtype: None
") Append;
		void Append (const Handle_Dynamic_SequenceOfFuzzyDefinitions & aSequence);
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Dynamic_FuzzyDefinition &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Dynamic_FuzzyDefinition & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Dynamic_SequenceOfFuzzyDefinitions &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Dynamic_SequenceOfFuzzyDefinitions & aSequence);
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Dynamic_FuzzyDefinition &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Dynamic_FuzzyDefinition & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_Dynamic_SequenceOfFuzzyDefinitions &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Dynamic_SequenceOfFuzzyDefinitions & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Dynamic_FuzzyDefinition &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Dynamic_FuzzyDefinition & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_Dynamic_SequenceOfFuzzyDefinitions &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Dynamic_SequenceOfFuzzyDefinitions & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anOtherIndex:
	:type anOtherIndex: Standard_Integer
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Dynamic_SequenceOfFuzzyDefinitions
") Split;
		Handle_Dynamic_SequenceOfFuzzyDefinitions Split (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Dynamic_FuzzyDefinition &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Dynamic_FuzzyDefinition & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Dynamic_FuzzyDefinition
") Value;
		const Handle_Dynamic_FuzzyDefinition & Value (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Dynamic_FuzzyDefinition
") ChangeValue;
		Handle_Dynamic_FuzzyDefinition & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: Standard_Integer
	:param toIndex:
	:type toIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "	:rtype: Dynamic_SeqOfFuzzyDefinitions
") Sequence;
		const Dynamic_SeqOfFuzzyDefinitions & Sequence ();
		%feature("autodoc", "	:rtype: Dynamic_SeqOfFuzzyDefinitions
") ChangeSequence;
		Dynamic_SeqOfFuzzyDefinitions & ChangeSequence ();
		%feature("autodoc", "	:rtype: Handle_Dynamic_SequenceOfFuzzyDefinitions
") ShallowCopy;
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
		%feature("autodoc", "	:rtype: None
") Dynamic_SequenceOfMethodDefinitions;
		 Dynamic_SequenceOfMethodDefinitions ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Dynamic_MethodDefinition &
	:rtype: None
") Append;
		void Append (const Handle_Dynamic_MethodDefinition & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Dynamic_SequenceOfMethodDefinitions &
	:rtype: None
") Append;
		void Append (const Handle_Dynamic_SequenceOfMethodDefinitions & aSequence);
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Dynamic_MethodDefinition &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Dynamic_MethodDefinition & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Dynamic_SequenceOfMethodDefinitions &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Dynamic_SequenceOfMethodDefinitions & aSequence);
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Dynamic_MethodDefinition &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Dynamic_MethodDefinition & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_Dynamic_SequenceOfMethodDefinitions &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Dynamic_SequenceOfMethodDefinitions & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Dynamic_MethodDefinition &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Dynamic_MethodDefinition & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_Dynamic_SequenceOfMethodDefinitions &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Dynamic_SequenceOfMethodDefinitions & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anOtherIndex:
	:type anOtherIndex: Standard_Integer
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Dynamic_SequenceOfMethodDefinitions
") Split;
		Handle_Dynamic_SequenceOfMethodDefinitions Split (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Dynamic_MethodDefinition &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Dynamic_MethodDefinition & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Dynamic_MethodDefinition
") Value;
		const Handle_Dynamic_MethodDefinition & Value (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Dynamic_MethodDefinition
") ChangeValue;
		Handle_Dynamic_MethodDefinition & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: Standard_Integer
	:param toIndex:
	:type toIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "	:rtype: Dynamic_SeqOfMethodDefinitions
") Sequence;
		const Dynamic_SeqOfMethodDefinitions & Sequence ();
		%feature("autodoc", "	:rtype: Dynamic_SeqOfMethodDefinitions
") ChangeSequence;
		Dynamic_SeqOfMethodDefinitions & ChangeSequence ();
		%feature("autodoc", "	:rtype: Handle_Dynamic_SequenceOfMethodDefinitions
") ShallowCopy;
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
		%feature("autodoc", "	:rtype: None
") Dynamic_SequenceOfMethods;
		 Dynamic_SequenceOfMethods ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Dynamic_Method &
	:rtype: None
") Append;
		void Append (const Handle_Dynamic_Method & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Dynamic_SequenceOfMethods &
	:rtype: None
") Append;
		void Append (const Handle_Dynamic_SequenceOfMethods & aSequence);
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Dynamic_Method &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Dynamic_Method & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Dynamic_SequenceOfMethods &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Dynamic_SequenceOfMethods & aSequence);
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Dynamic_Method &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Dynamic_Method & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_Dynamic_SequenceOfMethods &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Dynamic_SequenceOfMethods & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Dynamic_Method &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Dynamic_Method & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_Dynamic_SequenceOfMethods &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Dynamic_SequenceOfMethods & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anOtherIndex:
	:type anOtherIndex: Standard_Integer
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Dynamic_SequenceOfMethods
") Split;
		Handle_Dynamic_SequenceOfMethods Split (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Dynamic_Method &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Dynamic_Method & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Dynamic_Method
") Value;
		const Handle_Dynamic_Method & Value (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Dynamic_Method
") ChangeValue;
		Handle_Dynamic_Method & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: Standard_Integer
	:param toIndex:
	:type toIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "	:rtype: Dynamic_SeqOfMethods
") Sequence;
		const Dynamic_SeqOfMethods & Sequence ();
		%feature("autodoc", "	:rtype: Dynamic_SeqOfMethods
") ChangeSequence;
		Dynamic_SeqOfMethods & ChangeSequence ();
		%feature("autodoc", "	:rtype: Handle_Dynamic_SequenceOfMethods
") ShallowCopy;
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
		%feature("autodoc", "	* Creates and returns an empty instance of this class.

	:rtype: None
") Dynamic_Variable;
		 Dynamic_Variable ();
		%feature("autodoc", "	* Sets the parameter <aparameter> in <self>. This parameter gives the name, the type of value, and if necessary the default value of the variable.

	:param aparameter:
	:type aparameter: Handle_Dynamic_Parameter &
	:rtype: None
") Parameter;
		void Parameter (const Handle_Dynamic_Parameter & aparameter);
		%feature("autodoc", "	* Returns the parameter stored in <self>.

	:rtype: Handle_Dynamic_Parameter
") Parameter;
		Handle_Dynamic_Parameter Parameter ();
		%feature("autodoc", "	* Sets the mode to the variable. the mode is to take in the enumeration IN, OUT, INOUT, INTERNAL, CONSTANT, which describes the type of the variable.

	:param amode:
	:type amode: Dynamic_ModeEnum
	:rtype: None
") Mode;
		void Mode (const Dynamic_ModeEnum amode);
		%feature("autodoc", "	* Returns the mode of the variable.

	:rtype: Dynamic_ModeEnum
") Mode;
		Dynamic_ModeEnum Mode ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("autodoc", "	:rtype: None
") Dynamic_VariableNode;
		 Dynamic_VariableNode ();
		%feature("autodoc", "	:param anitem:
	:type anitem: Handle_Dynamic_Variable &
	:rtype: None
") Dynamic_VariableNode;
		 Dynamic_VariableNode (const Handle_Dynamic_Variable & anitem);
		%feature("autodoc", "	:param anitem:
	:type anitem: Handle_Dynamic_Variable &
	:rtype: None
") Object;
		void Object (const Handle_Dynamic_Variable & anitem);
		%feature("autodoc", "	:rtype: Handle_Dynamic_Variable
") Object;
		Handle_Dynamic_Variable Object ();
		%feature("autodoc", "	:param anode:
	:type anode: Handle_Dynamic_VariableNode &
	:rtype: None
") Next;
		void Next (const Handle_Dynamic_VariableNode & anode);
		%feature("autodoc", "	:rtype: Handle_Dynamic_VariableNode
") Next;
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
		%feature("autodoc", "	* This deferred method must be implemented in the derived classes for setting reference(s) to the corresponding variable(s) which define the signature of the method definition.

	:param avariable:
	:type avariable: Handle_Dynamic_Variable &
	:rtype: void
") Variable;
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
		%feature("autodoc", "	* Creates a boolean parameter with <aparameter> as name.

	:param aparameter:
	:type aparameter: char *
	:rtype: None
") Dynamic_BooleanParameter;
		 Dynamic_BooleanParameter (const char * aparameter);
		%feature("autodoc", "	* Creates a boolean parameter with <aparameter> and <avalue> respectively as name and value.

	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: bool
	:rtype: None
") Dynamic_BooleanParameter;
		 Dynamic_BooleanParameter (const char * aparameter,const Standard_Boolean avalue);
		%feature("autodoc", "	* Creates a boolean parameter with <aparameter> as name and <avalue> as value. <avalue> is a CString with two possible values which are : 'Standard_True' and 'Standard_False'.

	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: char *
	:rtype: None
") Dynamic_BooleanParameter;
		 Dynamic_BooleanParameter (const char * aparameter,const char * avalue);
		%feature("autodoc", "	* Returns the boolean value <thevalue>.

	:rtype: bool
") Value;
		Standard_Boolean Value ();
		%feature("autodoc", "	* Sets the field <thevalue> with the boolean value <avalue>

	:param avalue:
	:type avalue: bool
	:rtype: None
") Value;
		void Value (const Standard_Boolean avalue);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("autodoc", "	* Creates a new instance of this class with <aname> as name.

	:param aname:
	:type aname: char *
	:rtype: None
") Dynamic_DynamicDerivedClass;
		 Dynamic_DynamicDerivedClass (const char * aname);
		%feature("autodoc", "	* Adds another class <aclass> to the sequence of derived classes.

	:param aclass:
	:type aclass: Handle_Dynamic_DynamicClass &
	:rtype: None
") AddClass;
		void AddClass (const Handle_Dynamic_DynamicClass & aclass);
		%feature("autodoc", "	* Starting with the name of a method, this redefined method searches for the right method object in the sequence of methods of the derived class and in all the inherited classes.

	:param amethod:
	:type amethod: char *
	:rtype: Handle_Dynamic_Method
") Method;
		virtual Handle_Dynamic_Method Method (const char * amethod);
		%feature("autodoc", "	* Defines an instance of this class definition.

	:rtype: Handle_Dynamic_DynamicInstance
") Instance;
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
		%feature("autodoc", "	* Creates a FuzzyDefinition with <aname> as type.

	:param aname:
	:type aname: char *
	:rtype: None
") Dynamic_FuzzyDefinition;
		 Dynamic_FuzzyDefinition (const char * aname);
		%feature("autodoc", "	* Returns the type of object.

	:rtype: TCollection_AsciiString
") Type;
		virtual TCollection_AsciiString Type ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("autodoc", "	* Creates an InstanceParameter with <aparameter> as identifier.

	:param aparameter:
	:type aparameter: char *
	:rtype: None
") Dynamic_InstanceParameter;
		 Dynamic_InstanceParameter (const char * aparameter);
		%feature("autodoc", "	* Creates an InstanceParameter with <aparameter> as identifier and <avalue> as initial value.

	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: Handle_Dynamic_DynamicInstance &
	:rtype: None
") Dynamic_InstanceParameter;
		 Dynamic_InstanceParameter (const char * aparameter,const Handle_Dynamic_DynamicInstance & avalue);
		%feature("autodoc", "	* Returns <thevalue>.

	:rtype: Handle_Dynamic_DynamicInstance
") Value;
		Handle_Dynamic_DynamicInstance Value ();
		%feature("autodoc", "	* Sets <avalue> to <thevalue>.

	:param avalue:
	:type avalue: Handle_Dynamic_DynamicInstance &
	:rtype: None
") Value;
		void Value (const Handle_Dynamic_DynamicInstance & avalue);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("autodoc", "	* Creates an IntegerParameter with <aparameter> as identifier.

	:param aparameter:
	:type aparameter: char *
	:rtype: None
") Dynamic_IntegerParameter;
		 Dynamic_IntegerParameter (const char * aparameter);
		%feature("autodoc", "	* Creates an IntegerParameter with <aparameter> as identifier and <avalue> as initial value.

	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: Standard_Integer
	:rtype: None
") Dynamic_IntegerParameter;
		 Dynamic_IntegerParameter (const char * aparameter,const Standard_Integer avalue);
		%feature("autodoc", "	* Returns the integer value <thevalue>.

	:rtype: int
") Value;
		Standard_Integer Value ();
		%feature("autodoc", "	* Sets the field <thevalue> with the integer value <avalue>

	:param avalue:
	:type avalue: Standard_Integer
	:rtype: None
") Value;
		void Value (const Standard_Integer avalue);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("autodoc", "	* Returns the name of the method definition.

	:rtype: TCollection_AsciiString
") Type;
		virtual TCollection_AsciiString Type ();
		%feature("autodoc", "	* Adds a new variable created from the parameter <aparameter>, which defines the name of the variable its type and if necessary its default value, the mode <amode> which precise if it is an in, out, inout, internal or constant variable and the flag <agroup> for accepting a set of homogeneous variables. with the parameter value <aparameter>.

	:param aparameter:
	:type aparameter: Handle_Dynamic_Parameter &
	:param amode:
	:type amode: Dynamic_ModeEnum
	:param agroup: default value is Standard_False
	:type agroup: bool
	:rtype: None
") AddVariable;
		void AddVariable (const Handle_Dynamic_Parameter & aparameter,const Dynamic_ModeEnum amode,const Standard_Boolean agroup = Standard_False);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("autodoc", "	* Creates an ObjectParameter with <aparameter> as name.

	:param aparameter:
	:type aparameter: char *
	:rtype: None
") Dynamic_ObjectParameter;
		 Dynamic_ObjectParameter (const char * aparameter);
		%feature("autodoc", "	* With the name of the Parameter <aparameter> and the object <anobject>, creates an instance of ObjectParameter.

	:param aparameter:
	:type aparameter: char *
	:param anobject:
	:type anobject: Handle_Standard_Transient &
	:rtype: None
") Dynamic_ObjectParameter;
		 Dynamic_ObjectParameter (const char * aparameter,const Handle_Standard_Transient & anobject);
		%feature("autodoc", "	* Returns the value of the parameter which is an object.

	:rtype: Handle_Standard_Transient
") Value;
		Handle_Standard_Transient Value ();
		%feature("autodoc", "	* Sets the object <anobject> in <self>.

	:param anobject:
	:type anobject: Handle_Standard_Transient &
	:rtype: None
") Value;
		void Value (const Handle_Standard_Transient & anobject);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("autodoc", "	* Creates a RealParameter with <aparameter> as name.

	:param aparameter:
	:type aparameter: char *
	:rtype: None
") Dynamic_RealParameter;
		 Dynamic_RealParameter (const char * aparameter);
		%feature("autodoc", "	* With the name of the Parameter <aparameter> and the real <avalue>, creates an instance of RealParameter.

	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: float
	:rtype: None
") Dynamic_RealParameter;
		 Dynamic_RealParameter (const char * aparameter,const Standard_Real avalue);
		%feature("autodoc", "	* Returns the value of the parameter which is a real.

	:rtype: float
") Value;
		Standard_Real Value ();
		%feature("autodoc", "	* Sets the real <avalue> in <self>.

	:param avalue:
	:type avalue: float
	:rtype: None
") Value;
		void Value (const Standard_Real avalue);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("autodoc", "	* Creates a StringParameter with <aparameter> as name.

	:param aparameter:
	:type aparameter: char *
	:rtype: None
") Dynamic_StringParameter;
		 Dynamic_StringParameter (const char * aparameter);
		%feature("autodoc", "	* With the name of the Parameter <aparameter> and the string <astring>, creates an instance of StringParameter.

	:param aparameter:
	:type aparameter: char *
	:param astring:
	:type astring: char *
	:rtype: None
") Dynamic_StringParameter;
		 Dynamic_StringParameter (const char * aparameter,const char * astring);
		%feature("autodoc", "	* Returns the value of the parameter which is an AsciiString.

	:rtype: TCollection_AsciiString
") Value;
		TCollection_AsciiString Value ();
		%feature("autodoc", "	* Sets the string <avalue> in <self>.

	:param avalue:
	:type avalue: char *
	:rtype: None
") Value;
		void Value (const char * avalue);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("autodoc", "	* Creates and Returns a new instance of this class.

	:rtype: None
") Dynamic_VariableGroup;
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
		%feature("autodoc", "	* Creates a compiled method with <aname> as user name and <afunction> as C++ mangled name.

	:param aname:
	:type aname: char *
	:param afunction:
	:type afunction: char *
	:rtype: None
") Dynamic_CompiledMethod;
		 Dynamic_CompiledMethod (const char * aname,const char * afunction);
		%feature("autodoc", "	* Sets the C++ mangled name of the method to the field <thefunction>.

	:param afunction:
	:type afunction: char *
	:rtype: None
") Function;
		void Function (const char * afunction);
		%feature("autodoc", "	* Returns the C++ mangled name of the function.

	:rtype: TCollection_AsciiString
") Function;
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
		%feature("autodoc", "	* Creates a composit method with <aname> as name.

	:param aname:
	:type aname: char *
	:rtype: None
") Dynamic_CompositMethod;
		 Dynamic_CompositMethod (const char * aname);
		%feature("autodoc", "	* Adds <amethod>, which is an elementary or a composit method to <self>.

	:param amethod:
	:type amethod: Handle_Dynamic_Method &
	:rtype: None
") Method;
		void Method (const Handle_Dynamic_Method & amethod);
		%feature("autodoc", "	* Returns the number of methods referenced by the composit method <self>.

	:rtype: int
") NumberOfMethods;
		Standard_Integer NumberOfMethods ();
		%feature("autodoc", "	* Returns the method of range <anindex>.

	:param anindex:
	:type anindex: Standard_Integer
	:rtype: Handle_Dynamic_Method
") Method;
		Handle_Dynamic_Method Method (const Standard_Integer anindex);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
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
		%feature("autodoc", "	* Creates a new empty instance of CompositVariable- Instance.

	:rtype: None
") Dynamic_CompositVariableInstance;
		 Dynamic_CompositVariableInstance ();
		%feature("autodoc", "	* Sets <avariable> into the collection of variable.

	:param avariable:
	:type avariable: Handle_Dynamic_Variable &
	:rtype: void
") Variable;
		virtual void Variable (const Handle_Dynamic_Variable & avariable);
		%feature("autodoc", "	* Returns the first VariableNode useful to explore the list of variables addressed by <self>.

	:rtype: Handle_Dynamic_VariableNode
") FirstVariableNode;
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
		%feature("autodoc", "	* Creates a new InterpretedMethod with <aname> as name and <afile> as file name to be interpreted.

	:param aname:
	:type aname: char *
	:param afile:
	:type afile: char *
	:rtype: None
") Dynamic_InterpretedMethod;
		 Dynamic_InterpretedMethod (const char * aname,const char * afile);
		%feature("autodoc", "	* Sets the the name of the file to be interpreted to <afile>.

	:param afile:
	:type afile: char *
	:rtype: None
") Function;
		void Function (const char * afile);
		%feature("autodoc", "	* Returns the name of the file to be interpreted.

	:rtype: TCollection_AsciiString
") Function;
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
		%feature("autodoc", "	* Returns a new empty instance of this class.

	:rtype: None
") Dynamic_VariableInstance;
		 Dynamic_VariableInstance ();
		%feature("autodoc", "	* Sets the variable <avariable> into the VariableInstance <self>.

	:param avariable:
	:type avariable: Handle_Dynamic_Variable &
	:rtype: void
") Variable;
		virtual void Variable (const Handle_Dynamic_Variable & avariable);
		%feature("autodoc", "	* Returns the variable contained into the VariableInstance <self>.

	:rtype: Handle_Dynamic_Variable
") Variable;
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

