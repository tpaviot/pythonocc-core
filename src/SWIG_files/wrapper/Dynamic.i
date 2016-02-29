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
%module (package="OCC") Dynamic

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


%include Dynamic_headers.i


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
enum Dynamic_ModeEnum {
	Dynamic_IN = 0,
	Dynamic_OUT = 1,
	Dynamic_INOUT = 2,
	Dynamic_INTERNAL = 3,
	Dynamic_CONSTANT = 4,
};

/* end public enums declaration */

%rename(dynamic) Dynamic;
class Dynamic {
	public:
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "	:param amode:
	:type amode: char *
	:rtype: Dynamic_ModeEnum
") Mode;
		static Dynamic_ModeEnum Mode (const char * amode);
};


%nodefaultctor Dynamic_DynamicClass;
class Dynamic_DynamicClass : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Dynamic_DynamicClass;
		%feature("autodoc", "	* Creates a new empty instance of DynamicClass.

	:param aname:
	:type aname: char *
	:rtype: None
") Dynamic_DynamicClass;
		 Dynamic_DynamicClass (const char * aname);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Adds another parameter <aparameter> to the sequence of parameter definitions.

	:param aparameter:
	:type aparameter: Handle_Dynamic_Parameter &
	:rtype: None
") Parameter;
		void Parameter (const Handle_Dynamic_Parameter & aparameter);
		%feature("compactdefaultargs") CompiledMethod;
		%feature("autodoc", "	* Adds another method to the sequence of methods. It has <amethod> as name and <anaddress> as mangled name of the corresponding C++ function which must be called.

	:param amethod:
	:type amethod: char *
	:param anaddress:
	:type anaddress: char *
	:rtype: None
") CompiledMethod;
		void CompiledMethod (const char * amethod,const char * anaddress);
		%feature("compactdefaultargs") InterpretedMethod;
		%feature("autodoc", "	* Adds another method to the sequence of methods. It has <amethod> as name and <afile> as interpreted file.

	:param amethod:
	:type amethod: char *
	:param afile:
	:type afile: char *
	:rtype: None
") InterpretedMethod;
		void InterpretedMethod (const char * amethod,const char * afile);
		%feature("compactdefaultargs") Method;
		%feature("autodoc", "	* Returns a reference to the method object identified by the string <amethod>.

	:param amethod:
	:type amethod: char *
	:rtype: Handle_Dynamic_Method
") Method;
		virtual Handle_Dynamic_Method Method (const char * amethod);
		%feature("compactdefaultargs") Instance;
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


%extend Dynamic_DynamicClass {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_DynamicClass(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_DynamicClass::Handle_Dynamic_DynamicClass %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Dynamic_DynamicInstance;
class Dynamic_DynamicInstance : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Dynamic_DynamicInstance;
		%feature("autodoc", "	* Creates an empty instance of this class.

	:rtype: None
") Dynamic_DynamicInstance;
		 Dynamic_DynamicInstance ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Adds <aparameter> to the sequence of parameters of <self>.

	:param aparameter:
	:type aparameter: Handle_Dynamic_Parameter &
	:rtype: None
") Parameter;
		void Parameter (const Handle_Dynamic_Parameter & aparameter);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Adds all the parameters of <self>, to the sequence of parameters of <aninstance>.

	:param aninstance:
	:type aninstance: Handle_Dynamic_DynamicInstance &
	:rtype: None
") Parameter;
		void Parameter (const Handle_Dynamic_DynamicInstance & aninstance);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Puts the integer value <avalue> into the parameter object identified by the string <aparameter>.

	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: int
	:rtype: None
") Parameter;
		void Parameter (const char * aparameter,const Standard_Integer avalue);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Puts the real value <avalue> into the parameter object identified by the string <aparameter>.

	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: float
	:rtype: None
") Parameter;
		void Parameter (const char * aparameter,const Standard_Real avalue);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Puts the string <avalue> into the parameter object identified by the string <aparameter>.

	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: char *
	:rtype: None
") Parameter;
		void Parameter (const char * aparameter,const char * avalue);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Puts the dynamic instance <avalue> into the parameter object identified by the string <aparameter>.

	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: Handle_Dynamic_DynamicInstance &
	:rtype: None
") Parameter;
		void Parameter (const char * aparameter,const Handle_Dynamic_DynamicInstance & avalue);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Searches and returns the parameter object identified by the string <aparameter>.

	:param aparameter:
	:type aparameter: char *
	:rtype: Handle_Dynamic_Parameter
") Parameter;
		Handle_Dynamic_Parameter Parameter (const char * aparameter);
		%feature("compactdefaultargs") Class;
		%feature("autodoc", "	* Sets the reference of the class.

	:param aclass:
	:type aclass: Handle_Dynamic_DynamicClass &
	:rtype: None
") Class;
		void Class (const Handle_Dynamic_DynamicClass & aclass);
		%feature("compactdefaultargs") Execute;
		%feature("autodoc", "	* Calls the method identified by the string <amethod>.

	:param amethod:
	:type amethod: char *
	:rtype: None
") Execute;
		void Execute (const char * amethod);
};


%extend Dynamic_DynamicInstance {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_DynamicInstance(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_DynamicInstance::Handle_Dynamic_DynamicInstance %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Dynamic_FuzzyClass;
class Dynamic_FuzzyClass : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* This deferred method must returns the type of the object. If the instance is of the type FuzzyDefinition the method simply returns the field <thetype>. If the instance is of the type FuzzyInstance the method calls the Type method on the true definition.

	:rtype: TCollection_AsciiString
") Type;
		virtual TCollection_AsciiString Type ();
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	* Returns the head of the list of parameters. For the FuzzyDefinition class this method returns the head of the exaustive list of parameters defining the object and for the FuzzyInstance it just returns the head of the overloaded values.

	:rtype: Handle_Dynamic_ParameterNode
") FirstParameter;
		Handle_Dynamic_ParameterNode FirstParameter ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Returns true if there is a parameter with <aparameter> as name, false otherwise.

	:param aparameter:
	:type aparameter: char *
	:rtype: bool
") Parameter;
		Standard_Boolean Parameter (const char * aparameter);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Adds another parameter <aparameter> to the sequence of parameters.

	:param aparameter:
	:type aparameter: Handle_Dynamic_Parameter &
	:rtype: None
") Parameter;
		void Parameter (const Handle_Dynamic_Parameter & aparameter);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Adds to the instance <self> the parameter <aparameter> with the boolean value <avalue>.

	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: bool
	:rtype: void
") Parameter;
		virtual void Parameter (const char * aparameter,const Standard_Boolean avalue);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Adds to the instance <self> the parameter <aparameter> with the integer value <avalue>.

	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: int
	:rtype: void
") Parameter;
		virtual void Parameter (const char * aparameter,const Standard_Integer avalue);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Adds to the instance <self> the parameter <aparameter> with the real value <avalue>.

	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: float
	:rtype: void
") Parameter;
		virtual void Parameter (const char * aparameter,const Standard_Real avalue);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Adds to the instance <self> the parameter <aparameter> with the string <astring>.

	:param aparameter:
	:type aparameter: char *
	:param astring:
	:type astring: char *
	:rtype: void
") Parameter;
		virtual void Parameter (const char * aparameter,const char * astring);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Adds to the instance <self> the parameter <aparameter> with the object value <anobject>.

	:param aparameter:
	:type aparameter: char *
	:param anobject:
	:type anobject: Handle_Standard_Transient &
	:rtype: void
") Parameter;
		virtual void Parameter (const char * aparameter,const Handle_Standard_Transient & anobject);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns True, if there is a parameter <aparameter> previously stored in the instance <self> and there is the corresponding boolean value in the output argument <avalue>, False otherwise.

	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: bool
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const char * aparameter,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns True, if there is a parameter <aparameter> previously stored in the instance <self> and there is the corresponding integer value in the output argument <avalue>, False otherwise.

	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: int &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const char * aparameter,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns True, if there is a parameter <aparameter> previously stored in the instance <self> and there is the corresponding real value in the output argument <avalue>, False otherwise.

	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: float &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const char * aparameter,Standard_Real &OutValue);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns True, if there is a parameter <aparameter> previously stored in the instance <self> and there is the corresponding string in the output argument <avalue>, False otherwise.

	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: TCollection_AsciiString &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const char * aparameter,TCollection_AsciiString & avalue);
		%feature("compactdefaultargs") Value;
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


%extend Dynamic_FuzzyClass {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_FuzzyClass(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_FuzzyClass::Handle_Dynamic_FuzzyClass %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Dynamic_FuzzyDefinitionsDictionary;
class Dynamic_FuzzyDefinitionsDictionary : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Creates;
		%feature("autodoc", "	* Starting with a file named <afilename>, fills the dictionary with all the wishes definitions.

	:param afilename:
	:type afilename: char *
	:rtype: None
") Creates;
		void Creates (const char * afilename);
		%feature("compactdefaultargs") Switch;
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
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "	* Returns from the dictionary in the out variable <adefinition> a reference to the right instance of the definition identified by its type <atype>. The method returns true if the definition exist, false otherwise.

	:param atype:
	:type atype: char *
	:param adefinition:
	:type adefinition: Handle_Dynamic_FuzzyClass &
	:rtype: bool
") Definition;
		Standard_Boolean Definition (const char * atype,Handle_Dynamic_FuzzyClass & adefinition);
		%feature("compactdefaultargs") UpToDate;
		%feature("autodoc", "	* Returns true if there has been no modification of the file fuzzyclasses.dat since the creation of the dictionary object, false otherwise.

	:rtype: bool
") UpToDate;
		Standard_Boolean UpToDate ();
		%feature("compactdefaultargs") NumberOfDefinitions;
		%feature("autodoc", "	* Returns the number of definitions stored in the dictionary.

	:rtype: int
") NumberOfDefinitions;
		Standard_Integer NumberOfDefinitions ();
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "	* Returns a reference on the definition identified by the index <anidex>.

	:param anindex:
	:type anindex: int
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


%extend Dynamic_FuzzyDefinitionsDictionary {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_FuzzyDefinitionsDictionary(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_FuzzyDefinitionsDictionary::Handle_Dynamic_FuzzyDefinitionsDictionary %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Dynamic_Method;
class Dynamic_Method : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Returns the type of object which is the name of the function definition.

	:rtype: TCollection_AsciiString
") Type;
		virtual TCollection_AsciiString Type ();
		%feature("compactdefaultargs") FirstVariableNode;
		%feature("autodoc", "	* Returns the first variable node of the Method which contains a variable.

	:rtype: Handle_Dynamic_VariableNode
") FirstVariableNode;
		Handle_Dynamic_VariableNode FirstVariableNode ();
		%feature("compactdefaultargs") Variable;
		%feature("autodoc", "	* Returns true if there is a variable with <avariable> as name, false otherwise.

	:param avariable:
	:type avariable: char *
	:rtype: bool
") Variable;
		Standard_Boolean Variable (const char * avariable);
		%feature("compactdefaultargs") Variable;
		%feature("autodoc", "	* Adds another variable <avariable> to the sequence of variable definitions.

	:param avariable:
	:type avariable: Handle_Dynamic_Variable &
	:rtype: None
") Variable;
		void Variable (const Handle_Dynamic_Variable & avariable);
		%feature("compactdefaultargs") Value;
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
		%feature("compactdefaultargs") Value;
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


%extend Dynamic_Method {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_Method(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_Method::Handle_Dynamic_Method %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Dynamic_MethodDefinitionsDictionary;
class Dynamic_MethodDefinitionsDictionary : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Creates;
		%feature("autodoc", "	* Starting with a file named <afilename>, fills the dictionary with all the wishes definitions.

	:param afilename:
	:type afilename: char *
	:rtype: None
") Creates;
		void Creates (const char * afilename);
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "	* This method sets the new definition <adefinition> in the dictionary. It returns true if the operation is successful, false otherwise.

	:param adefinition:
	:type adefinition: Handle_Dynamic_Method &
	:rtype: bool
") Definition;
		Standard_Boolean Definition (const Handle_Dynamic_Method & adefinition);
		%feature("compactdefaultargs") Switch;
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
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "	* Returns from the dictionary in the out variable <adefinition> a reference to the right instance of the definition identified by its type <atype>. The method returns true if the definition exist, false otherwise.

	:param atype:
	:type atype: char *
	:param adefinition:
	:type adefinition: Handle_Dynamic_Method &
	:rtype: bool
") Definition;
		Standard_Boolean Definition (const char * atype,Handle_Dynamic_Method & adefinition);
		%feature("compactdefaultargs") UpToDate;
		%feature("autodoc", "	* Returns true if there has been no modification of the file method-definitions.dat since the creation of the dictionary object, false otherwise.

	:rtype: bool
") UpToDate;
		Standard_Boolean UpToDate ();
		%feature("compactdefaultargs") NumberOfDefinitions;
		%feature("autodoc", "	* Returns the number of definitions stored in the dictionary.

	:rtype: int
") NumberOfDefinitions;
		Standard_Integer NumberOfDefinitions ();
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "	* Returns a reference on the definition identified by the index <anidex>.

	:param anindex:
	:type anindex: int
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


%extend Dynamic_MethodDefinitionsDictionary {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_MethodDefinitionsDictionary(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_MethodDefinitionsDictionary::Handle_Dynamic_MethodDefinitionsDictionary %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Dynamic_Parameter;
class Dynamic_Parameter : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Name;
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


%extend Dynamic_Parameter {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_Parameter(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_Parameter::Handle_Dynamic_Parameter %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Dynamic_ParameterNode;
class Dynamic_ParameterNode : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Dynamic_ParameterNode;
		%feature("autodoc", "	:rtype: None
") Dynamic_ParameterNode;
		 Dynamic_ParameterNode ();
		%feature("compactdefaultargs") Dynamic_ParameterNode;
		%feature("autodoc", "	:param anitem:
	:type anitem: Handle_Dynamic_Parameter &
	:rtype: None
") Dynamic_ParameterNode;
		 Dynamic_ParameterNode (const Handle_Dynamic_Parameter & anitem);
		%feature("compactdefaultargs") Object;
		%feature("autodoc", "	:param anitem:
	:type anitem: Handle_Dynamic_Parameter &
	:rtype: None
") Object;
		void Object (const Handle_Dynamic_Parameter & anitem);
		%feature("compactdefaultargs") Object;
		%feature("autodoc", "	:rtype: Handle_Dynamic_Parameter
") Object;
		Handle_Dynamic_Parameter Object ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:param anode:
	:type anode: Handle_Dynamic_ParameterNode &
	:rtype: None
") Next;
		void Next (const Handle_Dynamic_ParameterNode & anode);
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: Handle_Dynamic_ParameterNode
") Next;
		Handle_Dynamic_ParameterNode Next ();
};


%extend Dynamic_ParameterNode {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_ParameterNode(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_ParameterNode::Handle_Dynamic_ParameterNode %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Dynamic_SeqOfClasses;
class Dynamic_SeqOfClasses : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Dynamic_SeqOfClasses;
		%feature("autodoc", "	:rtype: None
") Dynamic_SeqOfClasses;
		 Dynamic_SeqOfClasses ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Dynamic_SeqOfClasses &
	:rtype: Dynamic_SeqOfClasses
") Assign;
		const Dynamic_SeqOfClasses & Assign (const Dynamic_SeqOfClasses & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Dynamic_SeqOfClasses &
	:rtype: Dynamic_SeqOfClasses
") operator=;
		const Dynamic_SeqOfClasses & operator = (const Dynamic_SeqOfClasses & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_Dynamic_DynamicClass &
	:rtype: None
") Append;
		void Append (const Handle_Dynamic_DynamicClass & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Dynamic_SeqOfClasses &
	:rtype: None
") Append;
		void Append (Dynamic_SeqOfClasses & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_Dynamic_DynamicClass &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Dynamic_DynamicClass & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Dynamic_SeqOfClasses &
	:rtype: None
") Prepend;
		void Prepend (Dynamic_SeqOfClasses & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Dynamic_DynamicClass &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Dynamic_DynamicClass & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Dynamic_SeqOfClasses &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Dynamic_SeqOfClasses & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Dynamic_DynamicClass &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Dynamic_DynamicClass & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Dynamic_SeqOfClasses &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Dynamic_SeqOfClasses & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Dynamic_DynamicClass
") First;
		Handle_Dynamic_DynamicClass First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Dynamic_DynamicClass
") Last;
		Handle_Dynamic_DynamicClass Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Dynamic_SeqOfClasses &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Dynamic_SeqOfClasses & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Dynamic_DynamicClass
") Value;
		Handle_Dynamic_DynamicClass Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_Dynamic_DynamicClass &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Dynamic_DynamicClass & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Dynamic_DynamicClass
") ChangeValue;
		Handle_Dynamic_DynamicClass ChangeValue (const Standard_Integer Index);
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


%nodefaultctor Dynamic_SeqOfFuzzyDefinitions;
class Dynamic_SeqOfFuzzyDefinitions : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Dynamic_SeqOfFuzzyDefinitions;
		%feature("autodoc", "	:rtype: None
") Dynamic_SeqOfFuzzyDefinitions;
		 Dynamic_SeqOfFuzzyDefinitions ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Dynamic_SeqOfFuzzyDefinitions &
	:rtype: Dynamic_SeqOfFuzzyDefinitions
") Assign;
		const Dynamic_SeqOfFuzzyDefinitions & Assign (const Dynamic_SeqOfFuzzyDefinitions & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Dynamic_SeqOfFuzzyDefinitions &
	:rtype: Dynamic_SeqOfFuzzyDefinitions
") operator=;
		const Dynamic_SeqOfFuzzyDefinitions & operator = (const Dynamic_SeqOfFuzzyDefinitions & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_Dynamic_FuzzyDefinition &
	:rtype: None
") Append;
		void Append (const Handle_Dynamic_FuzzyDefinition & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Dynamic_SeqOfFuzzyDefinitions &
	:rtype: None
") Append;
		void Append (Dynamic_SeqOfFuzzyDefinitions & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_Dynamic_FuzzyDefinition &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Dynamic_FuzzyDefinition & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Dynamic_SeqOfFuzzyDefinitions &
	:rtype: None
") Prepend;
		void Prepend (Dynamic_SeqOfFuzzyDefinitions & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Dynamic_FuzzyDefinition &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Dynamic_FuzzyDefinition & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Dynamic_SeqOfFuzzyDefinitions &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Dynamic_SeqOfFuzzyDefinitions & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Dynamic_FuzzyDefinition &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Dynamic_FuzzyDefinition & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Dynamic_SeqOfFuzzyDefinitions &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Dynamic_SeqOfFuzzyDefinitions & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Dynamic_FuzzyDefinition
") First;
		Handle_Dynamic_FuzzyDefinition First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Dynamic_FuzzyDefinition
") Last;
		Handle_Dynamic_FuzzyDefinition Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Dynamic_SeqOfFuzzyDefinitions &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Dynamic_SeqOfFuzzyDefinitions & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Dynamic_FuzzyDefinition
") Value;
		Handle_Dynamic_FuzzyDefinition Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_Dynamic_FuzzyDefinition &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Dynamic_FuzzyDefinition & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Dynamic_FuzzyDefinition
") ChangeValue;
		Handle_Dynamic_FuzzyDefinition ChangeValue (const Standard_Integer Index);
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


%nodefaultctor Dynamic_SeqOfMethodDefinitions;
class Dynamic_SeqOfMethodDefinitions : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Dynamic_SeqOfMethodDefinitions;
		%feature("autodoc", "	:rtype: None
") Dynamic_SeqOfMethodDefinitions;
		 Dynamic_SeqOfMethodDefinitions ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Dynamic_SeqOfMethodDefinitions &
	:rtype: Dynamic_SeqOfMethodDefinitions
") Assign;
		const Dynamic_SeqOfMethodDefinitions & Assign (const Dynamic_SeqOfMethodDefinitions & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Dynamic_SeqOfMethodDefinitions &
	:rtype: Dynamic_SeqOfMethodDefinitions
") operator=;
		const Dynamic_SeqOfMethodDefinitions & operator = (const Dynamic_SeqOfMethodDefinitions & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_Dynamic_MethodDefinition &
	:rtype: None
") Append;
		void Append (const Handle_Dynamic_MethodDefinition & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Dynamic_SeqOfMethodDefinitions &
	:rtype: None
") Append;
		void Append (Dynamic_SeqOfMethodDefinitions & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_Dynamic_MethodDefinition &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Dynamic_MethodDefinition & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Dynamic_SeqOfMethodDefinitions &
	:rtype: None
") Prepend;
		void Prepend (Dynamic_SeqOfMethodDefinitions & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Dynamic_MethodDefinition &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Dynamic_MethodDefinition & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Dynamic_SeqOfMethodDefinitions &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Dynamic_SeqOfMethodDefinitions & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Dynamic_MethodDefinition &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Dynamic_MethodDefinition & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Dynamic_SeqOfMethodDefinitions &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Dynamic_SeqOfMethodDefinitions & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Dynamic_MethodDefinition
") First;
		Handle_Dynamic_MethodDefinition First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Dynamic_MethodDefinition
") Last;
		Handle_Dynamic_MethodDefinition Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Dynamic_SeqOfMethodDefinitions &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Dynamic_SeqOfMethodDefinitions & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Dynamic_MethodDefinition
") Value;
		Handle_Dynamic_MethodDefinition Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_Dynamic_MethodDefinition &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Dynamic_MethodDefinition & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Dynamic_MethodDefinition
") ChangeValue;
		Handle_Dynamic_MethodDefinition ChangeValue (const Standard_Integer Index);
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


%nodefaultctor Dynamic_SeqOfMethods;
class Dynamic_SeqOfMethods : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Dynamic_SeqOfMethods;
		%feature("autodoc", "	:rtype: None
") Dynamic_SeqOfMethods;
		 Dynamic_SeqOfMethods ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Dynamic_SeqOfMethods &
	:rtype: Dynamic_SeqOfMethods
") Assign;
		const Dynamic_SeqOfMethods & Assign (const Dynamic_SeqOfMethods & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Dynamic_SeqOfMethods &
	:rtype: Dynamic_SeqOfMethods
") operator=;
		const Dynamic_SeqOfMethods & operator = (const Dynamic_SeqOfMethods & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_Dynamic_Method &
	:rtype: None
") Append;
		void Append (const Handle_Dynamic_Method & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Dynamic_SeqOfMethods &
	:rtype: None
") Append;
		void Append (Dynamic_SeqOfMethods & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_Dynamic_Method &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Dynamic_Method & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Dynamic_SeqOfMethods &
	:rtype: None
") Prepend;
		void Prepend (Dynamic_SeqOfMethods & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Dynamic_Method &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Dynamic_Method & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Dynamic_SeqOfMethods &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Dynamic_SeqOfMethods & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Dynamic_Method &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Dynamic_Method & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Dynamic_SeqOfMethods &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Dynamic_SeqOfMethods & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Dynamic_Method
") First;
		Handle_Dynamic_Method First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Dynamic_Method
") Last;
		Handle_Dynamic_Method Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Dynamic_SeqOfMethods &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Dynamic_SeqOfMethods & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Dynamic_Method
") Value;
		Handle_Dynamic_Method Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_Dynamic_Method &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Dynamic_Method & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Dynamic_Method
") ChangeValue;
		Handle_Dynamic_Method ChangeValue (const Standard_Integer Index);
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


%nodefaultctor Dynamic_SequenceNodeOfSeqOfClasses;
class Dynamic_SequenceNodeOfSeqOfClasses : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Dynamic_SequenceNodeOfSeqOfClasses;
		%feature("autodoc", "	:param I:
	:type I: Handle_Dynamic_DynamicClass &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Dynamic_SequenceNodeOfSeqOfClasses;
		 Dynamic_SequenceNodeOfSeqOfClasses (const Handle_Dynamic_DynamicClass & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Dynamic_DynamicClass
") Value;
		Handle_Dynamic_DynamicClass Value ();
};


%extend Dynamic_SequenceNodeOfSeqOfClasses {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_SequenceNodeOfSeqOfClasses(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_SequenceNodeOfSeqOfClasses::Handle_Dynamic_SequenceNodeOfSeqOfClasses %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions;
class Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions;
		%feature("autodoc", "	:param I:
	:type I: Handle_Dynamic_FuzzyDefinition &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions;
		 Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions (const Handle_Dynamic_FuzzyDefinition & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Dynamic_FuzzyDefinition
") Value;
		Handle_Dynamic_FuzzyDefinition Value ();
};


%extend Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions::Handle_Dynamic_SequenceNodeOfSeqOfFuzzyDefinitions %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Dynamic_SequenceNodeOfSeqOfMethodDefinitions;
class Dynamic_SequenceNodeOfSeqOfMethodDefinitions : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Dynamic_SequenceNodeOfSeqOfMethodDefinitions;
		%feature("autodoc", "	:param I:
	:type I: Handle_Dynamic_MethodDefinition &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Dynamic_SequenceNodeOfSeqOfMethodDefinitions;
		 Dynamic_SequenceNodeOfSeqOfMethodDefinitions (const Handle_Dynamic_MethodDefinition & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Dynamic_MethodDefinition
") Value;
		Handle_Dynamic_MethodDefinition Value ();
};


%extend Dynamic_SequenceNodeOfSeqOfMethodDefinitions {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_SequenceNodeOfSeqOfMethodDefinitions(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_SequenceNodeOfSeqOfMethodDefinitions::Handle_Dynamic_SequenceNodeOfSeqOfMethodDefinitions %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Dynamic_SequenceNodeOfSeqOfMethods;
class Dynamic_SequenceNodeOfSeqOfMethods : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Dynamic_SequenceNodeOfSeqOfMethods;
		%feature("autodoc", "	:param I:
	:type I: Handle_Dynamic_Method &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Dynamic_SequenceNodeOfSeqOfMethods;
		 Dynamic_SequenceNodeOfSeqOfMethods (const Handle_Dynamic_Method & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Dynamic_Method
") Value;
		Handle_Dynamic_Method Value ();
};


%extend Dynamic_SequenceNodeOfSeqOfMethods {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_SequenceNodeOfSeqOfMethods(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_SequenceNodeOfSeqOfMethods::Handle_Dynamic_SequenceNodeOfSeqOfMethods %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Dynamic_SequenceOfClasses;
class Dynamic_SequenceOfClasses : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Dynamic_SequenceOfClasses;
		%feature("autodoc", "	:rtype: None
") Dynamic_SequenceOfClasses;
		 Dynamic_SequenceOfClasses ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Dynamic_DynamicClass &
	:rtype: None
") Append;
		void Append (const Handle_Dynamic_DynamicClass & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Dynamic_SequenceOfClasses &
	:rtype: None
") Append;
		void Append (const Handle_Dynamic_SequenceOfClasses & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Dynamic_DynamicClass &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Dynamic_DynamicClass & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Dynamic_SequenceOfClasses &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Dynamic_SequenceOfClasses & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Dynamic_DynamicClass &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Dynamic_DynamicClass & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_Dynamic_SequenceOfClasses &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Dynamic_SequenceOfClasses & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Dynamic_DynamicClass &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Dynamic_DynamicClass & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_Dynamic_SequenceOfClasses &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Dynamic_SequenceOfClasses & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Dynamic_SequenceOfClasses
") Split;
		Handle_Dynamic_SequenceOfClasses Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Dynamic_DynamicClass &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Dynamic_DynamicClass & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Dynamic_DynamicClass
") Value;
		Handle_Dynamic_DynamicClass Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Dynamic_DynamicClass
") ChangeValue;
		Handle_Dynamic_DynamicClass ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: Dynamic_SeqOfClasses
") Sequence;
		const Dynamic_SeqOfClasses & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: Dynamic_SeqOfClasses
") ChangeSequence;
		Dynamic_SeqOfClasses & ChangeSequence ();
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "	:rtype: Handle_Dynamic_SequenceOfClasses
") ShallowCopy;
		Handle_Dynamic_SequenceOfClasses ShallowCopy ();
};


%extend Dynamic_SequenceOfClasses {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_SequenceOfClasses(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_SequenceOfClasses::Handle_Dynamic_SequenceOfClasses %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Dynamic_SequenceOfFuzzyDefinitions;
class Dynamic_SequenceOfFuzzyDefinitions : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Dynamic_SequenceOfFuzzyDefinitions;
		%feature("autodoc", "	:rtype: None
") Dynamic_SequenceOfFuzzyDefinitions;
		 Dynamic_SequenceOfFuzzyDefinitions ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Dynamic_FuzzyDefinition &
	:rtype: None
") Append;
		void Append (const Handle_Dynamic_FuzzyDefinition & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Dynamic_SequenceOfFuzzyDefinitions &
	:rtype: None
") Append;
		void Append (const Handle_Dynamic_SequenceOfFuzzyDefinitions & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Dynamic_FuzzyDefinition &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Dynamic_FuzzyDefinition & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Dynamic_SequenceOfFuzzyDefinitions &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Dynamic_SequenceOfFuzzyDefinitions & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Dynamic_FuzzyDefinition &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Dynamic_FuzzyDefinition & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_Dynamic_SequenceOfFuzzyDefinitions &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Dynamic_SequenceOfFuzzyDefinitions & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Dynamic_FuzzyDefinition &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Dynamic_FuzzyDefinition & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_Dynamic_SequenceOfFuzzyDefinitions &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Dynamic_SequenceOfFuzzyDefinitions & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Dynamic_SequenceOfFuzzyDefinitions
") Split;
		Handle_Dynamic_SequenceOfFuzzyDefinitions Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Dynamic_FuzzyDefinition &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Dynamic_FuzzyDefinition & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Dynamic_FuzzyDefinition
") Value;
		Handle_Dynamic_FuzzyDefinition Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Dynamic_FuzzyDefinition
") ChangeValue;
		Handle_Dynamic_FuzzyDefinition ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: Dynamic_SeqOfFuzzyDefinitions
") Sequence;
		const Dynamic_SeqOfFuzzyDefinitions & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: Dynamic_SeqOfFuzzyDefinitions
") ChangeSequence;
		Dynamic_SeqOfFuzzyDefinitions & ChangeSequence ();
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "	:rtype: Handle_Dynamic_SequenceOfFuzzyDefinitions
") ShallowCopy;
		Handle_Dynamic_SequenceOfFuzzyDefinitions ShallowCopy ();
};


%extend Dynamic_SequenceOfFuzzyDefinitions {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_SequenceOfFuzzyDefinitions(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_SequenceOfFuzzyDefinitions::Handle_Dynamic_SequenceOfFuzzyDefinitions %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Dynamic_SequenceOfMethodDefinitions;
class Dynamic_SequenceOfMethodDefinitions : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Dynamic_SequenceOfMethodDefinitions;
		%feature("autodoc", "	:rtype: None
") Dynamic_SequenceOfMethodDefinitions;
		 Dynamic_SequenceOfMethodDefinitions ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Dynamic_MethodDefinition &
	:rtype: None
") Append;
		void Append (const Handle_Dynamic_MethodDefinition & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Dynamic_SequenceOfMethodDefinitions &
	:rtype: None
") Append;
		void Append (const Handle_Dynamic_SequenceOfMethodDefinitions & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Dynamic_MethodDefinition &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Dynamic_MethodDefinition & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Dynamic_SequenceOfMethodDefinitions &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Dynamic_SequenceOfMethodDefinitions & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Dynamic_MethodDefinition &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Dynamic_MethodDefinition & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_Dynamic_SequenceOfMethodDefinitions &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Dynamic_SequenceOfMethodDefinitions & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Dynamic_MethodDefinition &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Dynamic_MethodDefinition & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_Dynamic_SequenceOfMethodDefinitions &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Dynamic_SequenceOfMethodDefinitions & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Dynamic_SequenceOfMethodDefinitions
") Split;
		Handle_Dynamic_SequenceOfMethodDefinitions Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Dynamic_MethodDefinition &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Dynamic_MethodDefinition & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Dynamic_MethodDefinition
") Value;
		Handle_Dynamic_MethodDefinition Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Dynamic_MethodDefinition
") ChangeValue;
		Handle_Dynamic_MethodDefinition ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: Dynamic_SeqOfMethodDefinitions
") Sequence;
		const Dynamic_SeqOfMethodDefinitions & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: Dynamic_SeqOfMethodDefinitions
") ChangeSequence;
		Dynamic_SeqOfMethodDefinitions & ChangeSequence ();
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "	:rtype: Handle_Dynamic_SequenceOfMethodDefinitions
") ShallowCopy;
		Handle_Dynamic_SequenceOfMethodDefinitions ShallowCopy ();
};


%extend Dynamic_SequenceOfMethodDefinitions {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_SequenceOfMethodDefinitions(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_SequenceOfMethodDefinitions::Handle_Dynamic_SequenceOfMethodDefinitions %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Dynamic_SequenceOfMethods;
class Dynamic_SequenceOfMethods : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Dynamic_SequenceOfMethods;
		%feature("autodoc", "	:rtype: None
") Dynamic_SequenceOfMethods;
		 Dynamic_SequenceOfMethods ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Dynamic_Method &
	:rtype: None
") Append;
		void Append (const Handle_Dynamic_Method & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Dynamic_SequenceOfMethods &
	:rtype: None
") Append;
		void Append (const Handle_Dynamic_SequenceOfMethods & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Dynamic_Method &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Dynamic_Method & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Dynamic_SequenceOfMethods &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Dynamic_SequenceOfMethods & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Dynamic_Method &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Dynamic_Method & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_Dynamic_SequenceOfMethods &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Dynamic_SequenceOfMethods & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Dynamic_Method &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Dynamic_Method & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_Dynamic_SequenceOfMethods &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Dynamic_SequenceOfMethods & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Dynamic_SequenceOfMethods
") Split;
		Handle_Dynamic_SequenceOfMethods Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Dynamic_Method &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Dynamic_Method & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Dynamic_Method
") Value;
		Handle_Dynamic_Method Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Dynamic_Method
") ChangeValue;
		Handle_Dynamic_Method ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: Dynamic_SeqOfMethods
") Sequence;
		const Dynamic_SeqOfMethods & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: Dynamic_SeqOfMethods
") ChangeSequence;
		Dynamic_SeqOfMethods & ChangeSequence ();
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "	:rtype: Handle_Dynamic_SequenceOfMethods
") ShallowCopy;
		Handle_Dynamic_SequenceOfMethods ShallowCopy ();
};


%extend Dynamic_SequenceOfMethods {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_SequenceOfMethods(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_SequenceOfMethods::Handle_Dynamic_SequenceOfMethods %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Dynamic_Variable;
class Dynamic_Variable : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Dynamic_Variable;
		%feature("autodoc", "	* Creates and returns an empty instance of this class.

	:rtype: None
") Dynamic_Variable;
		 Dynamic_Variable ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Sets the parameter <aparameter> in <self>. This parameter gives the name, the type of value, and if necessary the default value of the variable.

	:param aparameter:
	:type aparameter: Handle_Dynamic_Parameter &
	:rtype: None
") Parameter;
		void Parameter (const Handle_Dynamic_Parameter & aparameter);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Returns the parameter stored in <self>.

	:rtype: Handle_Dynamic_Parameter
") Parameter;
		Handle_Dynamic_Parameter Parameter ();
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "	* Sets the mode to the variable. the mode is to take in the enumeration IN, OUT, INOUT, INTERNAL, CONSTANT, which describes the type of the variable.

	:param amode:
	:type amode: Dynamic_ModeEnum
	:rtype: None
") Mode;
		void Mode (const Dynamic_ModeEnum amode);
		%feature("compactdefaultargs") Mode;
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


%extend Dynamic_Variable {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_Variable(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_Variable::Handle_Dynamic_Variable %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Dynamic_VariableNode;
class Dynamic_VariableNode : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Dynamic_VariableNode;
		%feature("autodoc", "	:rtype: None
") Dynamic_VariableNode;
		 Dynamic_VariableNode ();
		%feature("compactdefaultargs") Dynamic_VariableNode;
		%feature("autodoc", "	:param anitem:
	:type anitem: Handle_Dynamic_Variable &
	:rtype: None
") Dynamic_VariableNode;
		 Dynamic_VariableNode (const Handle_Dynamic_Variable & anitem);
		%feature("compactdefaultargs") Object;
		%feature("autodoc", "	:param anitem:
	:type anitem: Handle_Dynamic_Variable &
	:rtype: None
") Object;
		void Object (const Handle_Dynamic_Variable & anitem);
		%feature("compactdefaultargs") Object;
		%feature("autodoc", "	:rtype: Handle_Dynamic_Variable
") Object;
		Handle_Dynamic_Variable Object ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:param anode:
	:type anode: Handle_Dynamic_VariableNode &
	:rtype: None
") Next;
		void Next (const Handle_Dynamic_VariableNode & anode);
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: Handle_Dynamic_VariableNode
") Next;
		Handle_Dynamic_VariableNode Next ();
};


%extend Dynamic_VariableNode {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_VariableNode(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_VariableNode::Handle_Dynamic_VariableNode %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Dynamic_AbstractVariableInstance;
class Dynamic_AbstractVariableInstance : public Dynamic_Variable {
	public:
		%feature("compactdefaultargs") Variable;
		%feature("autodoc", "	* This deferred method must be implemented in the derived classes for setting reference(s) to the corresponding variable(s) which define the signature of the method definition.

	:param avariable:
	:type avariable: Handle_Dynamic_Variable &
	:rtype: void
") Variable;
		virtual void Variable (const Handle_Dynamic_Variable & avariable);
};


%extend Dynamic_AbstractVariableInstance {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_AbstractVariableInstance(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_AbstractVariableInstance::Handle_Dynamic_AbstractVariableInstance %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Dynamic_BooleanParameter;
class Dynamic_BooleanParameter : public Dynamic_Parameter {
	public:
		%feature("compactdefaultargs") Dynamic_BooleanParameter;
		%feature("autodoc", "	* Creates a boolean parameter with <aparameter> as name.

	:param aparameter:
	:type aparameter: char *
	:rtype: None
") Dynamic_BooleanParameter;
		 Dynamic_BooleanParameter (const char * aparameter);
		%feature("compactdefaultargs") Dynamic_BooleanParameter;
		%feature("autodoc", "	* Creates a boolean parameter with <aparameter> and <avalue> respectively as name and value.

	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: bool
	:rtype: None
") Dynamic_BooleanParameter;
		 Dynamic_BooleanParameter (const char * aparameter,const Standard_Boolean avalue);
		%feature("compactdefaultargs") Dynamic_BooleanParameter;
		%feature("autodoc", "	* Creates a boolean parameter with <aparameter> as name and <avalue> as value. <avalue> is a CString with two possible values which are : 'Standard_True' and 'Standard_False'.

	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: char *
	:rtype: None
") Dynamic_BooleanParameter;
		 Dynamic_BooleanParameter (const char * aparameter,const char * avalue);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the boolean value <thevalue>.

	:rtype: bool
") Value;
		Standard_Boolean Value ();
		%feature("compactdefaultargs") Value;
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


%extend Dynamic_BooleanParameter {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_BooleanParameter(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_BooleanParameter::Handle_Dynamic_BooleanParameter %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Dynamic_DynamicDerivedClass;
class Dynamic_DynamicDerivedClass : public Dynamic_DynamicClass {
	public:
		%feature("compactdefaultargs") Dynamic_DynamicDerivedClass;
		%feature("autodoc", "	* Creates a new instance of this class with <aname> as name.

	:param aname:
	:type aname: char *
	:rtype: None
") Dynamic_DynamicDerivedClass;
		 Dynamic_DynamicDerivedClass (const char * aname);
		%feature("compactdefaultargs") AddClass;
		%feature("autodoc", "	* Adds another class <aclass> to the sequence of derived classes.

	:param aclass:
	:type aclass: Handle_Dynamic_DynamicClass &
	:rtype: None
") AddClass;
		void AddClass (const Handle_Dynamic_DynamicClass & aclass);
		%feature("compactdefaultargs") Method;
		%feature("autodoc", "	* Starting with the name of a method, this redefined method searches for the right method object in the sequence of methods of the derived class and in all the inherited classes.

	:param amethod:
	:type amethod: char *
	:rtype: Handle_Dynamic_Method
") Method;
		virtual Handle_Dynamic_Method Method (const char * amethod);
		%feature("compactdefaultargs") Instance;
		%feature("autodoc", "	* Defines an instance of this class definition.

	:rtype: Handle_Dynamic_DynamicInstance
") Instance;
		virtual Handle_Dynamic_DynamicInstance Instance ();
};


%extend Dynamic_DynamicDerivedClass {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_DynamicDerivedClass(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_DynamicDerivedClass::Handle_Dynamic_DynamicDerivedClass %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Dynamic_FuzzyDefinition;
class Dynamic_FuzzyDefinition : public Dynamic_FuzzyClass {
	public:
		%feature("compactdefaultargs") Dynamic_FuzzyDefinition;
		%feature("autodoc", "	* Creates a FuzzyDefinition with <aname> as type.

	:param aname:
	:type aname: char *
	:rtype: None
") Dynamic_FuzzyDefinition;
		 Dynamic_FuzzyDefinition (const char * aname);
		%feature("compactdefaultargs") Type;
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


%extend Dynamic_FuzzyDefinition {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_FuzzyDefinition(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_FuzzyDefinition::Handle_Dynamic_FuzzyDefinition %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Dynamic_InstanceParameter;
class Dynamic_InstanceParameter : public Dynamic_Parameter {
	public:
		%feature("compactdefaultargs") Dynamic_InstanceParameter;
		%feature("autodoc", "	* Creates an InstanceParameter with <aparameter> as identifier.

	:param aparameter:
	:type aparameter: char *
	:rtype: None
") Dynamic_InstanceParameter;
		 Dynamic_InstanceParameter (const char * aparameter);
		%feature("compactdefaultargs") Dynamic_InstanceParameter;
		%feature("autodoc", "	* Creates an InstanceParameter with <aparameter> as identifier and <avalue> as initial value.

	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: Handle_Dynamic_DynamicInstance &
	:rtype: None
") Dynamic_InstanceParameter;
		 Dynamic_InstanceParameter (const char * aparameter,const Handle_Dynamic_DynamicInstance & avalue);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns <thevalue>.

	:rtype: Handle_Dynamic_DynamicInstance
") Value;
		Handle_Dynamic_DynamicInstance Value ();
		%feature("compactdefaultargs") Value;
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


%extend Dynamic_InstanceParameter {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_InstanceParameter(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_InstanceParameter::Handle_Dynamic_InstanceParameter %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Dynamic_IntegerParameter;
class Dynamic_IntegerParameter : public Dynamic_Parameter {
	public:
		%feature("compactdefaultargs") Dynamic_IntegerParameter;
		%feature("autodoc", "	* Creates an IntegerParameter with <aparameter> as identifier.

	:param aparameter:
	:type aparameter: char *
	:rtype: None
") Dynamic_IntegerParameter;
		 Dynamic_IntegerParameter (const char * aparameter);
		%feature("compactdefaultargs") Dynamic_IntegerParameter;
		%feature("autodoc", "	* Creates an IntegerParameter with <aparameter> as identifier and <avalue> as initial value.

	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: int
	:rtype: None
") Dynamic_IntegerParameter;
		 Dynamic_IntegerParameter (const char * aparameter,const Standard_Integer avalue);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the integer value <thevalue>.

	:rtype: int
") Value;
		Standard_Integer Value ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Sets the field <thevalue> with the integer value <avalue>

	:param avalue:
	:type avalue: int
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


%extend Dynamic_IntegerParameter {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_IntegerParameter(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_IntegerParameter::Handle_Dynamic_IntegerParameter %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Dynamic_MethodDefinition;
class Dynamic_MethodDefinition : public Dynamic_Method {
	public:
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Returns the name of the method definition.

	:rtype: TCollection_AsciiString
") Type;
		virtual TCollection_AsciiString Type ();
		%feature("compactdefaultargs") AddVariable;
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


%extend Dynamic_MethodDefinition {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_MethodDefinition(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_MethodDefinition::Handle_Dynamic_MethodDefinition %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Dynamic_ObjectParameter;
class Dynamic_ObjectParameter : public Dynamic_Parameter {
	public:
		%feature("compactdefaultargs") Dynamic_ObjectParameter;
		%feature("autodoc", "	* Creates an ObjectParameter with <aparameter> as name.

	:param aparameter:
	:type aparameter: char *
	:rtype: None
") Dynamic_ObjectParameter;
		 Dynamic_ObjectParameter (const char * aparameter);
		%feature("compactdefaultargs") Dynamic_ObjectParameter;
		%feature("autodoc", "	* With the name of the Parameter <aparameter> and the object <anobject>, creates an instance of ObjectParameter.

	:param aparameter:
	:type aparameter: char *
	:param anobject:
	:type anobject: Handle_Standard_Transient &
	:rtype: None
") Dynamic_ObjectParameter;
		 Dynamic_ObjectParameter (const char * aparameter,const Handle_Standard_Transient & anobject);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the value of the parameter which is an object.

	:rtype: Handle_Standard_Transient
") Value;
		Handle_Standard_Transient Value ();
		%feature("compactdefaultargs") Value;
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


%extend Dynamic_ObjectParameter {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_ObjectParameter(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_ObjectParameter::Handle_Dynamic_ObjectParameter %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Dynamic_RealParameter;
class Dynamic_RealParameter : public Dynamic_Parameter {
	public:
		%feature("compactdefaultargs") Dynamic_RealParameter;
		%feature("autodoc", "	* Creates a RealParameter with <aparameter> as name.

	:param aparameter:
	:type aparameter: char *
	:rtype: None
") Dynamic_RealParameter;
		 Dynamic_RealParameter (const char * aparameter);
		%feature("compactdefaultargs") Dynamic_RealParameter;
		%feature("autodoc", "	* With the name of the Parameter <aparameter> and the real <avalue>, creates an instance of RealParameter.

	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: float
	:rtype: None
") Dynamic_RealParameter;
		 Dynamic_RealParameter (const char * aparameter,const Standard_Real avalue);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the value of the parameter which is a real.

	:rtype: float
") Value;
		Standard_Real Value ();
		%feature("compactdefaultargs") Value;
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


%extend Dynamic_RealParameter {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_RealParameter(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_RealParameter::Handle_Dynamic_RealParameter %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Dynamic_StringParameter;
class Dynamic_StringParameter : public Dynamic_Parameter {
	public:
		%feature("compactdefaultargs") Dynamic_StringParameter;
		%feature("autodoc", "	* Creates a StringParameter with <aparameter> as name.

	:param aparameter:
	:type aparameter: char *
	:rtype: None
") Dynamic_StringParameter;
		 Dynamic_StringParameter (const char * aparameter);
		%feature("compactdefaultargs") Dynamic_StringParameter;
		%feature("autodoc", "	* With the name of the Parameter <aparameter> and the string <astring>, creates an instance of StringParameter.

	:param aparameter:
	:type aparameter: char *
	:param astring:
	:type astring: char *
	:rtype: None
") Dynamic_StringParameter;
		 Dynamic_StringParameter (const char * aparameter,const char * astring);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the value of the parameter which is an AsciiString.

	:rtype: TCollection_AsciiString
") Value;
		TCollection_AsciiString Value ();
		%feature("compactdefaultargs") Value;
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


%extend Dynamic_StringParameter {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_StringParameter(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_StringParameter::Handle_Dynamic_StringParameter %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Dynamic_VariableGroup;
class Dynamic_VariableGroup : public Dynamic_Variable {
	public:
		%feature("compactdefaultargs") Dynamic_VariableGroup;
		%feature("autodoc", "	* Creates and Returns a new instance of this class.

	:rtype: None
") Dynamic_VariableGroup;
		 Dynamic_VariableGroup ();
};


%extend Dynamic_VariableGroup {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_VariableGroup(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_VariableGroup::Handle_Dynamic_VariableGroup %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Dynamic_CompiledMethod;
class Dynamic_CompiledMethod : public Dynamic_MethodDefinition {
	public:
		%feature("compactdefaultargs") Dynamic_CompiledMethod;
		%feature("autodoc", "	* Creates a compiled method with <aname> as user name and <afunction> as C++ mangled name.

	:param aname:
	:type aname: char *
	:param afunction:
	:type afunction: char *
	:rtype: None
") Dynamic_CompiledMethod;
		 Dynamic_CompiledMethod (const char * aname,const char * afunction);
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "	* Sets the C++ mangled name of the method to the field <thefunction>.

	:param afunction:
	:type afunction: char *
	:rtype: None
") Function;
		void Function (const char * afunction);
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "	* Returns the C++ mangled name of the function.

	:rtype: TCollection_AsciiString
") Function;
		TCollection_AsciiString Function ();
};


%extend Dynamic_CompiledMethod {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_CompiledMethod(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_CompiledMethod::Handle_Dynamic_CompiledMethod %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Dynamic_CompositMethod;
class Dynamic_CompositMethod : public Dynamic_MethodDefinition {
	public:
		%feature("compactdefaultargs") Dynamic_CompositMethod;
		%feature("autodoc", "	* Creates a composit method with <aname> as name.

	:param aname:
	:type aname: char *
	:rtype: None
") Dynamic_CompositMethod;
		 Dynamic_CompositMethod (const char * aname);
		%feature("compactdefaultargs") Method;
		%feature("autodoc", "	* Adds <amethod>, which is an elementary or a composit method to <self>.

	:param amethod:
	:type amethod: Handle_Dynamic_Method &
	:rtype: None
") Method;
		void Method (const Handle_Dynamic_Method & amethod);
		%feature("compactdefaultargs") NumberOfMethods;
		%feature("autodoc", "	* Returns the number of methods referenced by the composit method <self>.

	:rtype: int
") NumberOfMethods;
		Standard_Integer NumberOfMethods ();
		%feature("compactdefaultargs") Method;
		%feature("autodoc", "	* Returns the method of range <anindex>.

	:param anindex:
	:type anindex: int
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


%extend Dynamic_CompositMethod {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_CompositMethod(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_CompositMethod::Handle_Dynamic_CompositMethod %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Dynamic_CompositVariableInstance;
class Dynamic_CompositVariableInstance : public Dynamic_AbstractVariableInstance {
	public:
		%feature("compactdefaultargs") Dynamic_CompositVariableInstance;
		%feature("autodoc", "	* Creates a new empty instance of CompositVariable- Instance.

	:rtype: None
") Dynamic_CompositVariableInstance;
		 Dynamic_CompositVariableInstance ();
		%feature("compactdefaultargs") Variable;
		%feature("autodoc", "	* Sets <avariable> into the collection of variable.

	:param avariable:
	:type avariable: Handle_Dynamic_Variable &
	:rtype: void
") Variable;
		virtual void Variable (const Handle_Dynamic_Variable & avariable);
		%feature("compactdefaultargs") FirstVariableNode;
		%feature("autodoc", "	* Returns the first VariableNode useful to explore the list of variables addressed by <self>.

	:rtype: Handle_Dynamic_VariableNode
") FirstVariableNode;
		Handle_Dynamic_VariableNode FirstVariableNode ();
};


%extend Dynamic_CompositVariableInstance {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_CompositVariableInstance(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_CompositVariableInstance::Handle_Dynamic_CompositVariableInstance %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Dynamic_InterpretedMethod;
class Dynamic_InterpretedMethod : public Dynamic_MethodDefinition {
	public:
		%feature("compactdefaultargs") Dynamic_InterpretedMethod;
		%feature("autodoc", "	* Creates a new InterpretedMethod with <aname> as name and <afile> as file name to be interpreted.

	:param aname:
	:type aname: char *
	:param afile:
	:type afile: char *
	:rtype: None
") Dynamic_InterpretedMethod;
		 Dynamic_InterpretedMethod (const char * aname,const char * afile);
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "	* Sets the the name of the file to be interpreted to <afile>.

	:param afile:
	:type afile: char *
	:rtype: None
") Function;
		void Function (const char * afile);
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "	* Returns the name of the file to be interpreted.

	:rtype: TCollection_AsciiString
") Function;
		TCollection_AsciiString Function ();
};


%extend Dynamic_InterpretedMethod {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_InterpretedMethod(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_InterpretedMethod::Handle_Dynamic_InterpretedMethod %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Dynamic_VariableInstance;
class Dynamic_VariableInstance : public Dynamic_AbstractVariableInstance {
	public:
		%feature("compactdefaultargs") Dynamic_VariableInstance;
		%feature("autodoc", "	* Returns a new empty instance of this class.

	:rtype: None
") Dynamic_VariableInstance;
		 Dynamic_VariableInstance ();
		%feature("compactdefaultargs") Variable;
		%feature("autodoc", "	* Sets the variable <avariable> into the VariableInstance <self>.

	:param avariable:
	:type avariable: Handle_Dynamic_Variable &
	:rtype: void
") Variable;
		virtual void Variable (const Handle_Dynamic_Variable & avariable);
		%feature("compactdefaultargs") Variable;
		%feature("autodoc", "	* Returns the variable contained into the VariableInstance <self>.

	:rtype: Handle_Dynamic_Variable
") Variable;
		Handle_Dynamic_Variable Variable ();
};


%extend Dynamic_VariableInstance {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dynamic_VariableInstance(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dynamic_VariableInstance::Handle_Dynamic_VariableInstance %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

