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
%module (package="OCC") Materials

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


%include Materials_headers.i


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

%rename(materials) Materials;
class Materials {
	public:
		%feature("compactdefaultargs") MaterialFile;
		%feature("autodoc", "	* Sets the location and the name of the file defining the definition of a material, in term of properties.

	:param afile:
	:type afile: char *
	:rtype: void
") MaterialFile;
		static void MaterialFile (const char * afile);
		%feature("compactdefaultargs") MaterialsFile;
		%feature("autodoc", "	* Sets the location and the name of the file defining the dictionary of materials.

	:param afile:
	:type afile: char *
	:rtype: void
") MaterialsFile;
		static void MaterialsFile (const char * afile);
		%feature("compactdefaultargs") MaterialsFile;
		%feature("autodoc", "	* Returns the location and the name of the dictionary file of materials.

	:rtype: char *
") MaterialsFile;
		static char * MaterialsFile ();
		%feature("compactdefaultargs") DictionaryOfMaterials;
		%feature("autodoc", "	* Returns the dictionary of materials.The dictionary is created at the first call to this method, or if the dictionary is not up to date with respect to the file date.

	:rtype: Handle_Materials_MaterialsDictionary
") DictionaryOfMaterials;
		static Handle_Materials_MaterialsDictionary DictionaryOfMaterials ();
		%feature("compactdefaultargs") ExistMaterial;
		%feature("autodoc", "	* True if the materialofname aName exists ...

	:param aName:
	:type aName: char *
	:rtype: bool
") ExistMaterial;
		static Standard_Boolean ExistMaterial (const char * aName);
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "	* Retrieves from the dictionary the object material with <amaterial> as name.

	:param amaterial:
	:type amaterial: char *
	:rtype: Handle_Materials_Material
") Material;
		static Handle_Materials_Material Material (const char * amaterial);
		%feature("compactdefaultargs") NumberOfMaterials;
		%feature("autodoc", "	* Returns the number of materials previously stored in the dictionary.

	:rtype: int
") NumberOfMaterials;
		static Standard_Integer NumberOfMaterials ();
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "	* This method used with the previous one, allows the exploration of all the dictionary. It returns a Material instance.

	:param anindex:
	:type anindex: int
	:rtype: Handle_Materials_Material
") Material;
		static Handle_Materials_Material Material (const Standard_Integer anindex);
};


%nodefaultctor Materials_Color;
class Materials_Color : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Materials_Color;
		%feature("autodoc", "	* Creates an empty instance of Color.

	:rtype: None
") Materials_Color;
		 Materials_Color ();
		%feature("compactdefaultargs") Materials_Color;
		%feature("autodoc", "	* Creates an instance of Color, with <acolor> as color.

	:param acolor:
	:type acolor: Quantity_Color &
	:rtype: None
") Materials_Color;
		 Materials_Color (const Quantity_Color & acolor);
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	* Sets <acolor> into <self>.

	:param acolor:
	:type acolor: Quantity_Color &
	:rtype: None
") Color;
		void Color (const Quantity_Color & acolor);
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	* Returns a Quantity_Color corresponding to <self>.

	:rtype: Quantity_Color
") Color;
		Quantity_Color Color ();
		%feature("compactdefaultargs") Color;
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
		%feature("compactdefaultargs") Color255;
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
		%feature("compactdefaultargs") SetColor;
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
		%feature("compactdefaultargs") SetColor255;
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


%extend Materials_Color {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Materials_Color(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Materials_Color::Handle_Materials_Color %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Materials_FuzzyInstance;
class Materials_FuzzyInstance : public Dynamic_FuzzyClass {
	public:
		%feature("compactdefaultargs") Materials_FuzzyInstance;
		%feature("autodoc", "	:param atype:
	:type atype: char *
	:rtype: None
") Materials_FuzzyInstance;
		 Materials_FuzzyInstance (const char * atype);
		%feature("compactdefaultargs") Materials_FuzzyInstance;
		%feature("autodoc", "	:param afuzzyinstance:
	:type afuzzyinstance: Handle_Materials_FuzzyInstance &
	:rtype: None
") Materials_FuzzyInstance;
		 Materials_FuzzyInstance (const Handle_Materials_FuzzyInstance & afuzzyinstance);
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Type;
		virtual TCollection_AsciiString Type ();
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "	:rtype: Handle_Dynamic_FuzzyClass
") Definition;
		Handle_Dynamic_FuzzyClass Definition ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: bool
	:rtype: void
") Parameter;
		virtual void Parameter (const char * aparameter,const Standard_Boolean avalue);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: int
	:rtype: void
") Parameter;
		virtual void Parameter (const char * aparameter,const Standard_Integer avalue);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: float
	:rtype: void
") Parameter;
		virtual void Parameter (const char * aparameter,const Standard_Real avalue);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:param aparameter:
	:type aparameter: char *
	:param astring:
	:type astring: char *
	:rtype: void
") Parameter;
		virtual void Parameter (const char * aparameter,const char * astring);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:param aparameter:
	:type aparameter: char *
	:param anobject:
	:type anobject: Handle_Standard_Transient &
	:rtype: void
") Parameter;
		virtual void Parameter (const char * aparameter,const Handle_Standard_Transient & anobject);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: bool
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const char * aparameter,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: int &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const char * aparameter,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: float &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const char * aparameter,Standard_Real &OutValue);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param aparameter:
	:type aparameter: char *
	:param avalue:
	:type avalue: TCollection_AsciiString &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const char * aparameter,TCollection_AsciiString & avalue);
		%feature("compactdefaultargs") Value;
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


%extend Materials_FuzzyInstance {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Materials_FuzzyInstance(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Materials_FuzzyInstance::Handle_Materials_FuzzyInstance %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Materials_MaterialDefinition;
class Materials_MaterialDefinition : public Dynamic_FuzzyDefinitionsDictionary {
	public:
		%feature("compactdefaultargs") Materials_MaterialDefinition;
		%feature("autodoc", "	* Creates the exhaustive definition of a material.

	:rtype: None
") Materials_MaterialDefinition;
		 Materials_MaterialDefinition ();
		%feature("compactdefaultargs") Switch;
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


%extend Materials_MaterialDefinition {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Materials_MaterialDefinition(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Materials_MaterialDefinition::Handle_Materials_MaterialDefinition %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Materials_MaterialsDictionary;
class Materials_MaterialsDictionary : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Materials_MaterialsDictionary;
		%feature("autodoc", "	* Returns a MaterialsDictionary object which contains the sequence of all the materials the user wants to consider.

	:rtype: None
") Materials_MaterialsDictionary;
		 Materials_MaterialsDictionary ();
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "	* Retrieves from the dictionary the object material with <amaterial> as name. If <amaterial> does not exist in the dictionary an exeption is raised.

	:param amaterial:
	:type amaterial: char *
	:rtype: Handle_Materials_Material
") Material;
		Handle_Materials_Material Material (const char * amaterial);
		%feature("compactdefaultargs") ExistMaterial;
		%feature("autodoc", "	* True if the materialofname aName exists ...

	:param aName:
	:type aName: char *
	:rtype: bool
") ExistMaterial;
		Standard_Boolean ExistMaterial (const char * aName);
		%feature("compactdefaultargs") NumberOfMaterials;
		%feature("autodoc", "	* Returns the number of materials previously stored in the dictionary.

	:rtype: int
") NumberOfMaterials;
		Standard_Integer NumberOfMaterials ();
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "	* This method used with the previous one, allow the exploration of all the dictionary. It returns a Material instance.

	:param anindex:
	:type anindex: int
	:rtype: Handle_Materials_Material
") Material;
		Handle_Materials_Material Material (const Standard_Integer anindex);
		%feature("compactdefaultargs") UpToDate;
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


%extend Materials_MaterialsDictionary {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Materials_MaterialsDictionary(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Materials_MaterialsDictionary::Handle_Materials_MaterialsDictionary %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Materials_MaterialsSequence;
class Materials_MaterialsSequence : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Materials_MaterialsSequence;
		%feature("autodoc", "	:rtype: None
") Materials_MaterialsSequence;
		 Materials_MaterialsSequence ();
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
	:type anItem: Handle_Materials_Material &
	:rtype: None
") Append;
		void Append (const Handle_Materials_Material & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Materials_MaterialsSequence &
	:rtype: None
") Append;
		void Append (const Handle_Materials_MaterialsSequence & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Materials_Material &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Materials_Material & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Materials_MaterialsSequence &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Materials_MaterialsSequence & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Materials_Material &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Materials_Material & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_Materials_MaterialsSequence &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Materials_MaterialsSequence & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Materials_Material &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Materials_Material & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_Materials_MaterialsSequence &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Materials_MaterialsSequence & aSequence);
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
	:rtype: Handle_Materials_MaterialsSequence
") Split;
		Handle_Materials_MaterialsSequence Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Materials_Material &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Materials_Material & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Materials_Material
") Value;
		Handle_Materials_Material Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Materials_Material
") ChangeValue;
		Handle_Materials_Material ChangeValue (const Standard_Integer anIndex);
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
		%feature("autodoc", "	:rtype: Materials_MtsSequence
") Sequence;
		const Materials_MtsSequence & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: Materials_MtsSequence
") ChangeSequence;
		Materials_MtsSequence & ChangeSequence ();
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "	:rtype: Handle_Materials_MaterialsSequence
") ShallowCopy;
		Handle_Materials_MaterialsSequence ShallowCopy ();
};


%extend Materials_MaterialsSequence {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Materials_MaterialsSequence(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Materials_MaterialsSequence::Handle_Materials_MaterialsSequence %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Materials_MtsSequence;
class Materials_MtsSequence : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Materials_MtsSequence;
		%feature("autodoc", "	:rtype: None
") Materials_MtsSequence;
		 Materials_MtsSequence ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Materials_MtsSequence &
	:rtype: Materials_MtsSequence
") Assign;
		const Materials_MtsSequence & Assign (const Materials_MtsSequence & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Materials_MtsSequence &
	:rtype: Materials_MtsSequence
") operator=;
		const Materials_MtsSequence & operator = (const Materials_MtsSequence & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_Materials_Material &
	:rtype: None
") Append;
		void Append (const Handle_Materials_Material & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Materials_MtsSequence &
	:rtype: None
") Append;
		void Append (Materials_MtsSequence & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_Materials_Material &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Materials_Material & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Materials_MtsSequence &
	:rtype: None
") Prepend;
		void Prepend (Materials_MtsSequence & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Materials_Material &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Materials_Material & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Materials_MtsSequence &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Materials_MtsSequence & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Materials_Material &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Materials_Material & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Materials_MtsSequence &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Materials_MtsSequence & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Materials_Material
") First;
		Handle_Materials_Material First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Materials_Material
") Last;
		Handle_Materials_Material Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Materials_MtsSequence &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Materials_MtsSequence & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Materials_Material
") Value;
		Handle_Materials_Material Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_Materials_Material &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Materials_Material & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Materials_Material
") ChangeValue;
		Handle_Materials_Material ChangeValue (const Standard_Integer Index);
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


%nodefaultctor Materials_SequenceNodeOfMtsSequence;
class Materials_SequenceNodeOfMtsSequence : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Materials_SequenceNodeOfMtsSequence;
		%feature("autodoc", "	:param I:
	:type I: Handle_Materials_Material &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Materials_SequenceNodeOfMtsSequence;
		 Materials_SequenceNodeOfMtsSequence (const Handle_Materials_Material & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Materials_Material
") Value;
		Handle_Materials_Material Value ();
};


%extend Materials_SequenceNodeOfMtsSequence {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Materials_SequenceNodeOfMtsSequence(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Materials_SequenceNodeOfMtsSequence::Handle_Materials_SequenceNodeOfMtsSequence %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor Materials_Material;
class Materials_Material : public Materials_FuzzyInstance {
	public:
		%feature("compactdefaultargs") Materials_Material;
		%feature("autodoc", "	* Creates the material <amaterial>.

	:param amaterial:
	:type amaterial: char *
	:rtype: None
") Materials_Material;
		 Materials_Material (const char * amaterial);
		%feature("compactdefaultargs") Name;
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


%extend Materials_Material {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Materials_Material(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Materials_Material::Handle_Materials_Material %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

