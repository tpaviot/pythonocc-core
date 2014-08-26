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
%module Materials

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

%include Materials_required_python_modules.i
%include Materials_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(materials) Materials;
%nodefaultctor Materials;
class Materials {
	public:
		%feature("autodoc", "Args:
	afile(char *)

Returns:
	static void

Sets the  location and the name  of the  file defining  
         the definition of a material, in term of properties.") MaterialFile;
		static void MaterialFile (const char * afile);
		%feature("autodoc", "Args:
	afile(char *)

Returns:
	static void

Sets  the location and  the name of  the file defining  
         the dictionary of materials.") MaterialsFile;
		static void MaterialsFile (const char * afile);
		%feature("autodoc", "Args:
	None
Returns:
	static char *

Returns  the location and the   name of the dictionary  
         file of materials.") MaterialsFile;
		static char * MaterialsFile ();
		%feature("autodoc", "Args:
	None
Returns:
	static Handle_Materials_MaterialsDictionary

Returns  the dictionary of materials.The dictionary is  
         created at  the first call to this  method, or  if the  
         dictionary is not up to date  with respect to the file  
         date.") DictionaryOfMaterials;
		static Handle_Materials_MaterialsDictionary DictionaryOfMaterials ();
		%feature("autodoc", "Args:
	aName(char *)

Returns:
	static Standard_Boolean

True if the materialofname aName exists ...") ExistMaterial;
		static Standard_Boolean ExistMaterial (const char * aName);
		%feature("autodoc", "Args:
	amaterial(char *)

Returns:
	static Handle_Materials_Material

Retrieves from the dictionary the object material with  
         <amaterial> as name.") Material;
		static Handle_Materials_Material Material (const char * amaterial);
		%feature("autodoc", "Args:
	None
Returns:
	static Standard_Integer

Returns  the number of  materials previously stored in  
         the dictionary.") NumberOfMaterials;
		static Standard_Integer NumberOfMaterials ();
		%feature("autodoc", "Args:
	anindex(Standard_Integer)

Returns:
	static Handle_Materials_Material

This method used  with  the previous  one, allows  the  
         exploration of    all the  dictionary.  It   returns a  
         Material instance.") Material;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty instance of Color.") Materials_Color;
		 Materials_Color ();
		%feature("autodoc", "Args:
	acolor(Quantity_Color)

Returns:
	None

Creates an instance of Color, with <acolor> as color.") Materials_Color;
		 Materials_Color (const Quantity_Color & acolor);
		%feature("autodoc", "Args:
	acolor(Quantity_Color)

Returns:
	None

Sets <acolor> into <self>.") Color;
		void Color (const Quantity_Color & acolor);
		%feature("autodoc", "Args:
	None
Returns:
	Quantity_Color

Returns a Quantity_Color corresponding to <self>.") Color;
		Quantity_Color Color ();
		%feature("autodoc", "Args:
	aTypeOfColor(Quantity_TypeOfColor)
	Reel1(Standard_Real)
	Reel2(Standard_Real)
	Reel3(Standard_Real)

Returns:
	None

Get the values ( RGB or HLS )  between 0.0 and 1.0") Color;
		void Color (const Quantity_TypeOfColor aTypeOfColor,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	aTypeOfColor(Quantity_TypeOfColor)
	Reel1(Standard_Real)
	Reel2(Standard_Real)
	Reel3(Standard_Real)

Returns:
	None

Get the values ( RGB or HLS )  between 0.0 and 255.0") Color255;
		void Color255 (const Quantity_TypeOfColor aTypeOfColor,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	aTypeOfColor(Quantity_TypeOfColor)
	Reel1(Standard_Real)
	Reel2(Standard_Real)
	Reel3(Standard_Real)

Returns:
	None

Set the values ( RGB or HLS )  between 0.0 and 1.0") SetColor;
		void SetColor (const Quantity_TypeOfColor aTypeOfColor,const Standard_Real Reel1,const Standard_Real Reel2,const Standard_Real Reel3);
		%feature("autodoc", "Args:
	aTypeOfColor(Quantity_TypeOfColor)
	Reel1(Standard_Real)
	Reel2(Standard_Real)
	Reel3(Standard_Real)

Returns:
	None

Set the values ( RGB or HLS )  between 0.0 and 255.0") SetColor255;
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
		%feature("autodoc", "Args:
	atype(char *)

Returns:
	None

No detailed docstring for this function.") Materials_FuzzyInstance;
		 Materials_FuzzyInstance (const char * atype);
		%feature("autodoc", "Args:
	afuzzyinstance(Handle_Materials_FuzzyInstance)

Returns:
	None

No detailed docstring for this function.") Materials_FuzzyInstance;
		 Materials_FuzzyInstance (const Handle_Materials_FuzzyInstance & afuzzyinstance);
		%feature("autodoc", "Args:
	None
Returns:
	virtual TCollection_AsciiString

No detailed docstring for this function.") Type;
		virtual TCollection_AsciiString Type ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dynamic_FuzzyClass

No detailed docstring for this function.") Definition;
		Handle_Dynamic_FuzzyClass Definition ();
		%feature("autodoc", "Args:
	aparameter(char *)
	avalue(Standard_Boolean)

Returns:
	virtual void

No detailed docstring for this function.") Parameter;
		virtual void Parameter (const char * aparameter,const Standard_Boolean avalue);
		%feature("autodoc", "Args:
	aparameter(char *)
	avalue(Standard_Integer)

Returns:
	virtual void

No detailed docstring for this function.") Parameter;
		virtual void Parameter (const char * aparameter,const Standard_Integer avalue);
		%feature("autodoc", "Args:
	aparameter(char *)
	avalue(Standard_Real)

Returns:
	virtual void

No detailed docstring for this function.") Parameter;
		virtual void Parameter (const char * aparameter,const Standard_Real avalue);
		%feature("autodoc", "Args:
	aparameter(char *)
	astring(char *)

Returns:
	virtual void

No detailed docstring for this function.") Parameter;
		virtual void Parameter (const char * aparameter,const char * astring);
		%feature("autodoc", "Args:
	aparameter(char *)
	anobject(Handle_Standard_Transient)

Returns:
	virtual void

No detailed docstring for this function.") Parameter;
		virtual void Parameter (const char * aparameter,const Handle_Standard_Transient & anobject);
		%feature("autodoc", "Args:
	aparameter(char *)
	avalue(Standard_Boolean)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Value;
		virtual Standard_Boolean Value (const char * aparameter,Standard_Boolean & avalue);
		%feature("autodoc", "Args:
	aparameter(char *)
	avalue(Standard_Integer)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Value;
		virtual Standard_Boolean Value (const char * aparameter,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	aparameter(char *)
	avalue(Standard_Real)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Value;
		virtual Standard_Boolean Value (const char * aparameter,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	aparameter(char *)
	avalue(TCollection_AsciiString)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Value;
		virtual Standard_Boolean Value (const char * aparameter,TCollection_AsciiString & avalue);
		%feature("autodoc", "Args:
	aparameter(char *)
	avalue(Handle_Standard_Transient)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Value;
		virtual Standard_Boolean Value (const char * aparameter,Handle_Standard_Transient & avalue);
		%feature("autodoc", "Args:
	astream(Standard_OStream)

Returns:
	virtual void

No detailed docstring for this function.") Dump;
		virtual void Dump (Standard_OStream & astream);
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates the exhaustive definition of a material.") Materials_MaterialDefinition;
		 Materials_MaterialDefinition ();
		%feature("autodoc", "Args:
	aname(char *)
	atype(char *)
	avalue(char *)

Returns:
	virtual Handle_Dynamic_Parameter

Starting with the identifier of the parameter <aname>,  
         the type  of parameter <atype>  and a  string <avalue>  
         which describes  the values  useful  for  this type of  
         parameters,  creates and returns  a  Parameter  object  
         from Dynamic.") Switch;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Returns a  MaterialsDictionary  object which  contains  
         the sequence of all the   materials the user wants  to  
         consider.") Materials_MaterialsDictionary;
		 Materials_MaterialsDictionary ();
		%feature("autodoc", "Args:
	amaterial(char *)

Returns:
	Handle_Materials_Material

Retrieves from the dictionary the object material with  
         <amaterial> as name.  If <amaterial> does not exist in  
         the dictionary an exeption is raised.") Material;
		Handle_Materials_Material Material (const char * amaterial);
		%feature("autodoc", "Args:
	aName(char *)

Returns:
	Standard_Boolean

True if the materialofname aName exists ...") ExistMaterial;
		Standard_Boolean ExistMaterial (const char * aName);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns  the number of  materials previously stored in  
         the dictionary.") NumberOfMaterials;
		Standard_Integer NumberOfMaterials ();
		%feature("autodoc", "Args:
	anindex(Standard_Integer)

Returns:
	Handle_Materials_Material

This method used  with  the  previous one, allow   the  
         exploration  of   all  the  dictionary.  It  returns a  
         Material instance.") Material;
		Handle_Materials_Material Material (const Standard_Integer anindex);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if there has been no  modification of the  
         file Materials.dat  since the   creation of the dictionary  
         object, false otherwise.") UpToDate;
		Standard_Boolean UpToDate ();
		%feature("autodoc", "Args:
	astream(Standard_OStream)

Returns:
	None

Useful for debugging.") Dump;
		void Dump (Standard_OStream & astream);
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Materials_MaterialsSequence;
		 Materials_MaterialsSequence ();
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
	anItem(Handle_Materials_Material)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Materials_Material & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Materials_MaterialsSequence)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Materials_MaterialsSequence & aSequence);
		%feature("autodoc", "Args:
	anItem(Handle_Materials_Material)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Materials_Material & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Materials_MaterialsSequence)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Materials_MaterialsSequence & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Materials_Material)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Materials_Material & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Materials_MaterialsSequence)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Materials_MaterialsSequence & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Materials_Material)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Materials_Material & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Materials_MaterialsSequence)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Materials_MaterialsSequence & aSequence);
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
	Handle_Materials_MaterialsSequence

No detailed docstring for this function.") Split;
		Handle_Materials_MaterialsSequence Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Materials_Material)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Materials_Material & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Materials_Material

No detailed docstring for this function.") Value;
		const Handle_Materials_Material & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Materials_Material

No detailed docstring for this function.") ChangeValue;
		Handle_Materials_Material & ChangeValue (const Standard_Integer anIndex);
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
	Materials_MtsSequence

No detailed docstring for this function.") Sequence;
		const Materials_MtsSequence & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Materials_MtsSequence

No detailed docstring for this function.") ChangeSequence;
		Materials_MtsSequence & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Materials_MaterialsSequence

No detailed docstring for this function.") ShallowCopy;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Materials_MtsSequence;
		 Materials_MtsSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Materials_MtsSequence)

Returns:
	Materials_MtsSequence

No detailed docstring for this function.") Assign;
		const Materials_MtsSequence & Assign (const Materials_MtsSequence & Other);
		%feature("autodoc", "Args:
	Other(Materials_MtsSequence)

Returns:
	Materials_MtsSequence

No detailed docstring for this function.") operator=;
		const Materials_MtsSequence & operator = (const Materials_MtsSequence & Other);
		%feature("autodoc", "Args:
	T(Handle_Materials_Material)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Materials_Material & T);
		%feature("autodoc", "Args:
	S(Materials_MtsSequence)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Materials_MtsSequence & S);
		%feature("autodoc", "Args:
	T(Handle_Materials_Material)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Materials_Material & T);
		%feature("autodoc", "Args:
	S(Materials_MtsSequence)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Materials_MtsSequence & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Materials_Material)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Materials_Material & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Materials_MtsSequence)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Materials_MtsSequence & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Materials_Material)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Materials_Material & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Materials_MtsSequence)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Materials_MtsSequence & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Materials_Material

No detailed docstring for this function.") First;
		const Handle_Materials_Material & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Materials_Material

No detailed docstring for this function.") Last;
		const Handle_Materials_Material & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Materials_MtsSequence)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Materials_MtsSequence & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Materials_Material

No detailed docstring for this function.") Value;
		const Handle_Materials_Material & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_Materials_Material)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Materials_Material & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Materials_Material

No detailed docstring for this function.") ChangeValue;
		Handle_Materials_Material & ChangeValue (const Standard_Integer Index);
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
		%feature("autodoc", "Args:
	I(Handle_Materials_Material)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Materials_SequenceNodeOfMtsSequence;
		 Materials_SequenceNodeOfMtsSequence (const Handle_Materials_Material & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Materials_Material

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	amaterial(char *)

Returns:
	None

Creates the material <amaterial>.") Materials_Material;
		 Materials_Material (const char * amaterial);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns the name of the material.") Name;
		TCollection_AsciiString Name ();
		%feature("autodoc", "Args:
	astream(Standard_OStream)

Returns:
	virtual void

Useful for debugging.") Dump;
		virtual void Dump (Standard_OStream & astream);
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

