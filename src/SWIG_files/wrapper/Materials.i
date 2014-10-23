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
%module (package="OCC") Materials

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

%include Materials_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(materials) Materials;
%nodefaultctor Materials;
class Materials {
	public:
		%feature("autodoc", "	* Sets the location and the name of the file defining the definition of a material, in term of properties.

	:param afile:
	:type afile: char *
	:rtype: void
") MaterialFile;
		static void MaterialFile (const char * afile);
		%feature("autodoc", "	* Sets the location and the name of the file defining the dictionary of materials.

	:param afile:
	:type afile: char *
	:rtype: void
") MaterialsFile;
		static void MaterialsFile (const char * afile);
		%feature("autodoc", "	* Returns the location and the name of the dictionary file of materials.

	:rtype: char *
") MaterialsFile;
		static char * MaterialsFile ();
		%feature("autodoc", "	* Returns the dictionary of materials.The dictionary is created at the first call to this method, or if the dictionary is not up to date with respect to the file date.

	:rtype: Handle_Materials_MaterialsDictionary
") DictionaryOfMaterials;
		static Handle_Materials_MaterialsDictionary DictionaryOfMaterials ();
		%feature("autodoc", "	* True if the materialofname aName exists ...

	:param aName:
	:type aName: char *
	:rtype: bool
") ExistMaterial;
		static Standard_Boolean ExistMaterial (const char * aName);
		%feature("autodoc", "	* Retrieves from the dictionary the object material with <amaterial> as name.

	:param amaterial:
	:type amaterial: char *
	:rtype: Handle_Materials_Material
") Material;
		static Handle_Materials_Material Material (const char * amaterial);
		%feature("autodoc", "	* Returns the number of materials previously stored in the dictionary.

	:rtype: int
") NumberOfMaterials;
		static Standard_Integer NumberOfMaterials ();
		%feature("autodoc", "	* This method used with the previous one, allows the exploration of all the dictionary. It returns a Material instance.

	:param anindex:
	:type anindex: Standard_Integer
	:rtype: Handle_Materials_Material
") Material;
		static Handle_Materials_Material Material (const Standard_Integer anindex);
};


%feature("shadow") Materials::~Materials %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Materials {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Materials_Color;
class Materials_Color : public Standard_Transient {
	public:
		%feature("autodoc", "	* Creates an empty instance of Color.

	:rtype: None
") Materials_Color;
		 Materials_Color ();
		%feature("autodoc", "	* Creates an instance of Color, with <acolor> as color.

	:param acolor:
	:type acolor: Quantity_Color &
	:rtype: None
") Materials_Color;
		 Materials_Color (const Quantity_Color & acolor);
		%feature("autodoc", "	* Sets <acolor> into <self>.

	:param acolor:
	:type acolor: Quantity_Color &
	:rtype: None
") Color;
		void Color (const Quantity_Color & acolor);
		%feature("autodoc", "	* Returns a Quantity_Color corresponding to <self>.

	:rtype: Quantity_Color
") Color;
		Quantity_Color Color ();
		%feature("autodoc", "	* Get the values ( RGB or HLS ) between 0.0 and 1.0

	:param aTypeOfColor:
	:type aTypeOfColor: Quantity_TypeOfColor
	:param Reel1:
	:type Reel1: float &
	:param Reel2:
	:type Reel2: float &
	:param Reel3:
	:type Reel3: float &
	:rtype: None
") Color;
		void Color (const Quantity_TypeOfColor aTypeOfColor,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Get the values ( RGB or HLS ) between 0.0 and 255.0

	:param aTypeOfColor:
	:type aTypeOfColor: Quantity_TypeOfColor
	:param Reel1:
	:type Reel1: float &
	:param Reel2:
	:type Reel2: float &
	:param Reel3:
	:type Reel3: float &
	:rtype: None
") Color255;
		void Color255 (const Quantity_TypeOfColor aTypeOfColor,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Set the values ( RGB or HLS ) between 0.0 and 1.0

	:param aTypeOfColor:
	:type aTypeOfColor: Quantity_TypeOfColor
	:param Reel1:
	:type Reel1: float
	:param Reel2:
	:type Reel2: float
	:param Reel3:
	:type Reel3: float
	:rtype: None
") SetColor;
		void SetColor (const Quantity_TypeOfColor aTypeOfColor,const Standard_Real Reel1,const Standard_Real Reel2,const Standard_Real Reel3);
		%feature("autodoc", "	* Set the values ( RGB or HLS ) between 0.0 and 255.0

	:param aTypeOfColor:
	:type aTypeOfColor: Quantity_TypeOfColor
	:param Reel1:
	:type Reel1: float
	:param Reel2:
	:type Reel2: float
	:param Reel3:
	:type Reel3: float
	:rtype: None
") SetColor255;
		void SetColor255 (const Quantity_TypeOfColor aTypeOfColor,const Standard_Real Reel1,const Standard_Real Reel2,const Standard_Real Reel3);
};


%feature("shadow") Materials_Color::~Materials_Color %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Materials_Color {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Materials_Color {
	Handle_Materials_Color GetHandle() {
	return *(Handle_Materials_Color*) &$self;
	}
};

%nodefaultctor Handle_Materials_Color;
class Handle_Materials_Color : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_Materials_Color();
        Handle_Materials_Color(const Handle_Materials_Color &aHandle);
        Handle_Materials_Color(const Materials_Color *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Materials_Color DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Materials_Color {
    Materials_Color* GetObject() {
    return (Materials_Color*)$self->Access();
    }
};
%feature("shadow") Handle_Materials_Color::~Handle_Materials_Color %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Materials_Color {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Materials_FuzzyInstance;
class Materials_FuzzyInstance : public Dynamic_FuzzyClass {
	public:
		%feature("autodoc", "	:param atype:
	:type atype: char *
	:rtype: None
") Materials_FuzzyInstance;
		 Materials_FuzzyInstance (const char * atype);
		%feature("autodoc", "	:param afuzzyinstance:
	:type afuzzyinstance: Handle_Materials_FuzzyInstance &
	:rtype: None
") Materials_FuzzyInstance;
		 Materials_FuzzyInstance (const Handle_Materials_FuzzyInstance & afuzzyinstance);
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Type;
		virtual TCollection_AsciiString Type ();
		%feature("autodoc", "	:rtype: Handle_Dynamic_FuzzyClass
") Definition;
		Handle_Dynamic_FuzzyClass Definition ();
		%feature("autodoc", "	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: bool
	:rtype: void
") Parameter;
		virtual void Parameter (const char * aparameter,const Standard_Boolean avalue);
		%feature("autodoc", "	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: Standard_Integer
	:rtype: void
") Parameter;
		virtual void Parameter (const char * aparameter,const Standard_Integer avalue);
		%feature("autodoc", "	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: float
	:rtype: void
") Parameter;
		virtual void Parameter (const char * aparameter,const Standard_Real avalue);
		%feature("autodoc", "	:param aparameter:
	:type aparameter: char *
	:param astring:
	:type astring: char *
	:rtype: void
") Parameter;
		virtual void Parameter (const char * aparameter,const char * astring);
		%feature("autodoc", "	:param aparameter:
	:type aparameter: char *
	:param anobject:
	:type anobject: Handle_Standard_Transient &
	:rtype: void
") Parameter;
		virtual void Parameter (const char * aparameter,const Handle_Standard_Transient & anobject);
		%feature("autodoc", "	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: bool
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const char * aparameter,Standard_Boolean & avalue);
		%feature("autodoc", "	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: Standard_Integer &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const char * aparameter,Standard_Integer &OutValue);
		%feature("autodoc", "	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: float &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const char * aparameter,Standard_Real &OutValue);
		%feature("autodoc", "	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: TCollection_AsciiString &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const char * aparameter,TCollection_AsciiString & avalue);
		%feature("autodoc", "	:param aparameter:
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


%feature("shadow") Materials_FuzzyInstance::~Materials_FuzzyInstance %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Materials_FuzzyInstance {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Materials_FuzzyInstance {
	Handle_Materials_FuzzyInstance GetHandle() {
	return *(Handle_Materials_FuzzyInstance*) &$self;
	}
};

%nodefaultctor Handle_Materials_FuzzyInstance;
class Handle_Materials_FuzzyInstance : public Handle_Dynamic_FuzzyClass {

    public:
        // constructors
        Handle_Materials_FuzzyInstance();
        Handle_Materials_FuzzyInstance(const Handle_Materials_FuzzyInstance &aHandle);
        Handle_Materials_FuzzyInstance(const Materials_FuzzyInstance *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Materials_FuzzyInstance DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Materials_FuzzyInstance {
    Materials_FuzzyInstance* GetObject() {
    return (Materials_FuzzyInstance*)$self->Access();
    }
};
%feature("shadow") Handle_Materials_FuzzyInstance::~Handle_Materials_FuzzyInstance %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Materials_FuzzyInstance {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Materials_MaterialDefinition;
class Materials_MaterialDefinition : public Dynamic_FuzzyDefinitionsDictionary {
	public:
		%feature("autodoc", "	* Creates the exhaustive definition of a material.

	:rtype: None
") Materials_MaterialDefinition;
		 Materials_MaterialDefinition ();
		%feature("autodoc", "	* Starting with the identifier of the parameter <aname>, the type of parameter <atype> and a string <avalue> which describes the values useful for this type of parameters, creates and returns a Parameter object from Dynamic.

	:param aname:
	:type aname: char *
	:param atype:
	:type atype: char *
	:param avalue:
	:type avalue: char *
	:rtype: Handle_Dynamic_Parameter
") Switch;
		virtual Handle_Dynamic_Parameter Switch (const char * aname,const char * atype,const char * avalue);
};


%feature("shadow") Materials_MaterialDefinition::~Materials_MaterialDefinition %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Materials_MaterialDefinition {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Materials_MaterialDefinition {
	Handle_Materials_MaterialDefinition GetHandle() {
	return *(Handle_Materials_MaterialDefinition*) &$self;
	}
};

%nodefaultctor Handle_Materials_MaterialDefinition;
class Handle_Materials_MaterialDefinition : public Handle_Dynamic_FuzzyDefinitionsDictionary {

    public:
        // constructors
        Handle_Materials_MaterialDefinition();
        Handle_Materials_MaterialDefinition(const Handle_Materials_MaterialDefinition &aHandle);
        Handle_Materials_MaterialDefinition(const Materials_MaterialDefinition *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Materials_MaterialDefinition DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Materials_MaterialDefinition {
    Materials_MaterialDefinition* GetObject() {
    return (Materials_MaterialDefinition*)$self->Access();
    }
};
%feature("shadow") Handle_Materials_MaterialDefinition::~Handle_Materials_MaterialDefinition %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Materials_MaterialDefinition {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Materials_MaterialsDictionary;
class Materials_MaterialsDictionary : public Standard_Transient {
	public:
		%feature("autodoc", "	* Returns a MaterialsDictionary object which contains the sequence of all the materials the user wants to consider.

	:rtype: None
") Materials_MaterialsDictionary;
		 Materials_MaterialsDictionary ();
		%feature("autodoc", "	* Retrieves from the dictionary the object material with <amaterial> as name. If <amaterial> does not exist in the dictionary an exeption is raised.

	:param amaterial:
	:type amaterial: char *
	:rtype: Handle_Materials_Material
") Material;
		Handle_Materials_Material Material (const char * amaterial);
		%feature("autodoc", "	* True if the materialofname aName exists ...

	:param aName:
	:type aName: char *
	:rtype: bool
") ExistMaterial;
		Standard_Boolean ExistMaterial (const char * aName);
		%feature("autodoc", "	* Returns the number of materials previously stored in the dictionary.

	:rtype: int
") NumberOfMaterials;
		Standard_Integer NumberOfMaterials ();
		%feature("autodoc", "	* This method used with the previous one, allow the exploration of all the dictionary. It returns a Material instance.

	:param anindex:
	:type anindex: Standard_Integer
	:rtype: Handle_Materials_Material
") Material;
		Handle_Materials_Material Material (const Standard_Integer anindex);
		%feature("autodoc", "	* Returns true if there has been no modification of the file Materials.dat since the creation of the dictionary object, false otherwise.

	:rtype: bool
") UpToDate;
		Standard_Boolean UpToDate ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%feature("shadow") Materials_MaterialsDictionary::~Materials_MaterialsDictionary %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Materials_MaterialsDictionary {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Materials_MaterialsDictionary {
	Handle_Materials_MaterialsDictionary GetHandle() {
	return *(Handle_Materials_MaterialsDictionary*) &$self;
	}
};

%nodefaultctor Handle_Materials_MaterialsDictionary;
class Handle_Materials_MaterialsDictionary : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_Materials_MaterialsDictionary();
        Handle_Materials_MaterialsDictionary(const Handle_Materials_MaterialsDictionary &aHandle);
        Handle_Materials_MaterialsDictionary(const Materials_MaterialsDictionary *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Materials_MaterialsDictionary DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Materials_MaterialsDictionary {
    Materials_MaterialsDictionary* GetObject() {
    return (Materials_MaterialsDictionary*)$self->Access();
    }
};
%feature("shadow") Handle_Materials_MaterialsDictionary::~Handle_Materials_MaterialsDictionary %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Materials_MaterialsDictionary {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Materials_MaterialsSequence;
class Materials_MaterialsSequence : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") Materials_MaterialsSequence;
		 Materials_MaterialsSequence ();
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
	:type anItem: Handle_Materials_Material &
	:rtype: None
") Append;
		void Append (const Handle_Materials_Material & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Materials_MaterialsSequence &
	:rtype: None
") Append;
		void Append (const Handle_Materials_MaterialsSequence & aSequence);
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Materials_Material &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Materials_Material & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Materials_MaterialsSequence &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Materials_MaterialsSequence & aSequence);
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Materials_Material &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Materials_Material & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_Materials_MaterialsSequence &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Materials_MaterialsSequence & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Materials_Material &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Materials_Material & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_Materials_MaterialsSequence &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Materials_MaterialsSequence & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anOtherIndex:
	:type anOtherIndex: Standard_Integer
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Materials_MaterialsSequence
") Split;
		Handle_Materials_MaterialsSequence Split (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Materials_Material &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Materials_Material & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Materials_Material
") Value;
		const Handle_Materials_Material & Value (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Materials_Material
") ChangeValue;
		Handle_Materials_Material & ChangeValue (const Standard_Integer anIndex);
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
		%feature("autodoc", "	:rtype: Materials_MtsSequence
") Sequence;
		const Materials_MtsSequence & Sequence ();
		%feature("autodoc", "	:rtype: Materials_MtsSequence
") ChangeSequence;
		Materials_MtsSequence & ChangeSequence ();
		%feature("autodoc", "	:rtype: Handle_Materials_MaterialsSequence
") ShallowCopy;
		Handle_Materials_MaterialsSequence ShallowCopy ();
};


%feature("shadow") Materials_MaterialsSequence::~Materials_MaterialsSequence %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Materials_MaterialsSequence {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Materials_MaterialsSequence {
	Handle_Materials_MaterialsSequence GetHandle() {
	return *(Handle_Materials_MaterialsSequence*) &$self;
	}
};

%nodefaultctor Handle_Materials_MaterialsSequence;
class Handle_Materials_MaterialsSequence : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Materials_MaterialsSequence();
        Handle_Materials_MaterialsSequence(const Handle_Materials_MaterialsSequence &aHandle);
        Handle_Materials_MaterialsSequence(const Materials_MaterialsSequence *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Materials_MaterialsSequence DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Materials_MaterialsSequence {
    Materials_MaterialsSequence* GetObject() {
    return (Materials_MaterialsSequence*)$self->Access();
    }
};
%feature("shadow") Handle_Materials_MaterialsSequence::~Handle_Materials_MaterialsSequence %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Materials_MaterialsSequence {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Materials_MtsSequence;
class Materials_MtsSequence : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Materials_MtsSequence;
		 Materials_MtsSequence ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Materials_MtsSequence &
	:rtype: Materials_MtsSequence
") Assign;
		const Materials_MtsSequence & Assign (const Materials_MtsSequence & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Materials_MtsSequence &
	:rtype: Materials_MtsSequence
") operator=;
		const Materials_MtsSequence & operator = (const Materials_MtsSequence & Other);
		%feature("autodoc", "	:param T:
	:type T: Handle_Materials_Material &
	:rtype: None
") Append;
		void Append (const Handle_Materials_Material & T);
		%feature("autodoc", "	:param S:
	:type S: Materials_MtsSequence &
	:rtype: None
") Append;
		void Append (Materials_MtsSequence & S);
		%feature("autodoc", "	:param T:
	:type T: Handle_Materials_Material &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Materials_Material & T);
		%feature("autodoc", "	:param S:
	:type S: Materials_MtsSequence &
	:rtype: None
") Prepend;
		void Prepend (Materials_MtsSequence & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Materials_Material &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Materials_Material & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Materials_MtsSequence &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Materials_MtsSequence & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Materials_Material &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Materials_Material & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Materials_MtsSequence &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Materials_MtsSequence & S);
		%feature("autodoc", "	:rtype: Handle_Materials_Material
") First;
		const Handle_Materials_Material & First ();
		%feature("autodoc", "	:rtype: Handle_Materials_Material
") Last;
		const Handle_Materials_Material & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Materials_MtsSequence &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Materials_MtsSequence & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Materials_Material
") Value;
		const Handle_Materials_Material & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Handle_Materials_Material &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Materials_Material & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Materials_Material
") ChangeValue;
		Handle_Materials_Material & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Materials_MtsSequence::~Materials_MtsSequence %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Materials_MtsSequence {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Materials_SequenceNodeOfMtsSequence;
class Materials_SequenceNodeOfMtsSequence : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Handle_Materials_Material &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Materials_SequenceNodeOfMtsSequence;
		 Materials_SequenceNodeOfMtsSequence (const Handle_Materials_Material & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Handle_Materials_Material
") Value;
		Handle_Materials_Material & Value ();
};


%feature("shadow") Materials_SequenceNodeOfMtsSequence::~Materials_SequenceNodeOfMtsSequence %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Materials_SequenceNodeOfMtsSequence {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Materials_SequenceNodeOfMtsSequence {
	Handle_Materials_SequenceNodeOfMtsSequence GetHandle() {
	return *(Handle_Materials_SequenceNodeOfMtsSequence*) &$self;
	}
};

%nodefaultctor Handle_Materials_SequenceNodeOfMtsSequence;
class Handle_Materials_SequenceNodeOfMtsSequence : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Materials_SequenceNodeOfMtsSequence();
        Handle_Materials_SequenceNodeOfMtsSequence(const Handle_Materials_SequenceNodeOfMtsSequence &aHandle);
        Handle_Materials_SequenceNodeOfMtsSequence(const Materials_SequenceNodeOfMtsSequence *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Materials_SequenceNodeOfMtsSequence DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Materials_SequenceNodeOfMtsSequence {
    Materials_SequenceNodeOfMtsSequence* GetObject() {
    return (Materials_SequenceNodeOfMtsSequence*)$self->Access();
    }
};
%feature("shadow") Handle_Materials_SequenceNodeOfMtsSequence::~Handle_Materials_SequenceNodeOfMtsSequence %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Materials_SequenceNodeOfMtsSequence {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Materials_Material;
class Materials_Material : public Materials_FuzzyInstance {
	public:
		%feature("autodoc", "	* Creates the material <amaterial>.

	:param amaterial:
	:type amaterial: char *
	:rtype: None
") Materials_Material;
		 Materials_Material (const char * amaterial);
		%feature("autodoc", "	* Returns the name of the material.

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


%feature("shadow") Materials_Material::~Materials_Material %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Materials_Material {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Materials_Material {
	Handle_Materials_Material GetHandle() {
	return *(Handle_Materials_Material*) &$self;
	}
};

%nodefaultctor Handle_Materials_Material;
class Handle_Materials_Material : public Handle_Materials_FuzzyInstance {

    public:
        // constructors
        Handle_Materials_Material();
        Handle_Materials_Material(const Handle_Materials_Material &aHandle);
        Handle_Materials_Material(const Materials_Material *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Materials_Material DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Materials_Material {
    Materials_Material* GetObject() {
    return (Materials_Material*)$self->Access();
    }
};
%feature("shadow") Handle_Materials_Material::~Handle_Materials_Material %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Materials_Material {
    void _kill_pointed() {
        delete $self;
    }
};

