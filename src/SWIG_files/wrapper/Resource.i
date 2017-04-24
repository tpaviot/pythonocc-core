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
%module (package="OCC") Resource

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


%include Resource_headers.i


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
enum Resource_FormatType {
	Resource_SJIS = 0,
	Resource_EUC = 1,
	Resource_ANSI = 2,
	Resource_GB = 3,
};

/* end public enums declaration */

%nodefaultctor Resource_DataMapIteratorOfDataMapOfAsciiStringAsciiString;
class Resource_DataMapIteratorOfDataMapOfAsciiStringAsciiString : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") Resource_DataMapIteratorOfDataMapOfAsciiStringAsciiString;
		%feature("autodoc", "	:rtype: None
") Resource_DataMapIteratorOfDataMapOfAsciiStringAsciiString;
		 Resource_DataMapIteratorOfDataMapOfAsciiStringAsciiString ();
		%feature("compactdefaultargs") Resource_DataMapIteratorOfDataMapOfAsciiStringAsciiString;
		%feature("autodoc", "	:param aMap:
	:type aMap: Resource_DataMapOfAsciiStringAsciiString &
	:rtype: None
") Resource_DataMapIteratorOfDataMapOfAsciiStringAsciiString;
		 Resource_DataMapIteratorOfDataMapOfAsciiStringAsciiString (const Resource_DataMapOfAsciiStringAsciiString & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: Resource_DataMapOfAsciiStringAsciiString &
	:rtype: None
") Initialize;
		void Initialize (const Resource_DataMapOfAsciiStringAsciiString & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Key;
		const TCollection_AsciiString & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Value;
		const TCollection_AsciiString & Value ();
};


%extend Resource_DataMapIteratorOfDataMapOfAsciiStringAsciiString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Resource_DataMapIteratorOfDataMapOfAsciiStringExtendedString;
class Resource_DataMapIteratorOfDataMapOfAsciiStringExtendedString : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") Resource_DataMapIteratorOfDataMapOfAsciiStringExtendedString;
		%feature("autodoc", "	:rtype: None
") Resource_DataMapIteratorOfDataMapOfAsciiStringExtendedString;
		 Resource_DataMapIteratorOfDataMapOfAsciiStringExtendedString ();
		%feature("compactdefaultargs") Resource_DataMapIteratorOfDataMapOfAsciiStringExtendedString;
		%feature("autodoc", "	:param aMap:
	:type aMap: Resource_DataMapOfAsciiStringExtendedString &
	:rtype: None
") Resource_DataMapIteratorOfDataMapOfAsciiStringExtendedString;
		 Resource_DataMapIteratorOfDataMapOfAsciiStringExtendedString (const Resource_DataMapOfAsciiStringExtendedString & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: Resource_DataMapOfAsciiStringExtendedString &
	:rtype: None
") Initialize;
		void Initialize (const Resource_DataMapOfAsciiStringExtendedString & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Key;
		const TCollection_AsciiString & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Value;
		const TCollection_ExtendedString & Value ();
};


%extend Resource_DataMapIteratorOfDataMapOfAsciiStringExtendedString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Resource_DataMapNodeOfDataMapOfAsciiStringAsciiString;
class Resource_DataMapNodeOfDataMapOfAsciiStringAsciiString : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") Resource_DataMapNodeOfDataMapOfAsciiStringAsciiString;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:param I:
	:type I: TCollection_AsciiString &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") Resource_DataMapNodeOfDataMapOfAsciiStringAsciiString;
		 Resource_DataMapNodeOfDataMapOfAsciiStringAsciiString (const TCollection_AsciiString & K,const TCollection_AsciiString & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Key;
		TCollection_AsciiString & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Value;
		TCollection_AsciiString & Value ();
};


%extend Resource_DataMapNodeOfDataMapOfAsciiStringAsciiString {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Resource_DataMapNodeOfDataMapOfAsciiStringAsciiString(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Resource_DataMapNodeOfDataMapOfAsciiStringAsciiString::Handle_Resource_DataMapNodeOfDataMapOfAsciiStringAsciiString %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Resource_DataMapNodeOfDataMapOfAsciiStringAsciiString;
class Handle_Resource_DataMapNodeOfDataMapOfAsciiStringAsciiString : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_Resource_DataMapNodeOfDataMapOfAsciiStringAsciiString();
        Handle_Resource_DataMapNodeOfDataMapOfAsciiStringAsciiString(const Handle_Resource_DataMapNodeOfDataMapOfAsciiStringAsciiString &aHandle);
        Handle_Resource_DataMapNodeOfDataMapOfAsciiStringAsciiString(const Resource_DataMapNodeOfDataMapOfAsciiStringAsciiString *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Resource_DataMapNodeOfDataMapOfAsciiStringAsciiString DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Resource_DataMapNodeOfDataMapOfAsciiStringAsciiString {
    Resource_DataMapNodeOfDataMapOfAsciiStringAsciiString* _get_reference() {
    return (Resource_DataMapNodeOfDataMapOfAsciiStringAsciiString*)$self->Access();
    }
};

%extend Handle_Resource_DataMapNodeOfDataMapOfAsciiStringAsciiString {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Resource_DataMapNodeOfDataMapOfAsciiStringAsciiString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Resource_DataMapNodeOfDataMapOfAsciiStringExtendedString;
class Resource_DataMapNodeOfDataMapOfAsciiStringExtendedString : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") Resource_DataMapNodeOfDataMapOfAsciiStringExtendedString;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:param I:
	:type I: TCollection_ExtendedString &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") Resource_DataMapNodeOfDataMapOfAsciiStringExtendedString;
		 Resource_DataMapNodeOfDataMapOfAsciiStringExtendedString (const TCollection_AsciiString & K,const TCollection_ExtendedString & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Key;
		TCollection_AsciiString & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Value;
		TCollection_ExtendedString & Value ();
};


%extend Resource_DataMapNodeOfDataMapOfAsciiStringExtendedString {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Resource_DataMapNodeOfDataMapOfAsciiStringExtendedString(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Resource_DataMapNodeOfDataMapOfAsciiStringExtendedString::Handle_Resource_DataMapNodeOfDataMapOfAsciiStringExtendedString %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Resource_DataMapNodeOfDataMapOfAsciiStringExtendedString;
class Handle_Resource_DataMapNodeOfDataMapOfAsciiStringExtendedString : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_Resource_DataMapNodeOfDataMapOfAsciiStringExtendedString();
        Handle_Resource_DataMapNodeOfDataMapOfAsciiStringExtendedString(const Handle_Resource_DataMapNodeOfDataMapOfAsciiStringExtendedString &aHandle);
        Handle_Resource_DataMapNodeOfDataMapOfAsciiStringExtendedString(const Resource_DataMapNodeOfDataMapOfAsciiStringExtendedString *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Resource_DataMapNodeOfDataMapOfAsciiStringExtendedString DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Resource_DataMapNodeOfDataMapOfAsciiStringExtendedString {
    Resource_DataMapNodeOfDataMapOfAsciiStringExtendedString* _get_reference() {
    return (Resource_DataMapNodeOfDataMapOfAsciiStringExtendedString*)$self->Access();
    }
};

%extend Handle_Resource_DataMapNodeOfDataMapOfAsciiStringExtendedString {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Resource_DataMapNodeOfDataMapOfAsciiStringExtendedString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Resource_DataMapOfAsciiStringAsciiString;
class Resource_DataMapOfAsciiStringAsciiString : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") Resource_DataMapOfAsciiStringAsciiString;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") Resource_DataMapOfAsciiStringAsciiString;
		 Resource_DataMapOfAsciiStringAsciiString (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Resource_DataMapOfAsciiStringAsciiString &
	:rtype: Resource_DataMapOfAsciiStringAsciiString
") Assign;
		Resource_DataMapOfAsciiStringAsciiString & Assign (const Resource_DataMapOfAsciiStringAsciiString & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Resource_DataMapOfAsciiStringAsciiString &
	:rtype: Resource_DataMapOfAsciiStringAsciiString
") operator =;
		Resource_DataMapOfAsciiStringAsciiString & operator = (const Resource_DataMapOfAsciiStringAsciiString & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:param I:
	:type I: TCollection_AsciiString &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TCollection_AsciiString & K,const TCollection_AsciiString & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TCollection_AsciiString & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TCollection_AsciiString & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: TCollection_AsciiString
") Find;
		const TCollection_AsciiString & Find (const TCollection_AsciiString & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: TCollection_AsciiString
") ChangeFind;
		TCollection_AsciiString & ChangeFind (const TCollection_AsciiString & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TCollection_AsciiString & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TCollection_AsciiString & K);
};


%extend Resource_DataMapOfAsciiStringAsciiString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Resource_DataMapOfAsciiStringExtendedString;
class Resource_DataMapOfAsciiStringExtendedString : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") Resource_DataMapOfAsciiStringExtendedString;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") Resource_DataMapOfAsciiStringExtendedString;
		 Resource_DataMapOfAsciiStringExtendedString (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Resource_DataMapOfAsciiStringExtendedString &
	:rtype: Resource_DataMapOfAsciiStringExtendedString
") Assign;
		Resource_DataMapOfAsciiStringExtendedString & Assign (const Resource_DataMapOfAsciiStringExtendedString & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Resource_DataMapOfAsciiStringExtendedString &
	:rtype: Resource_DataMapOfAsciiStringExtendedString
") operator =;
		Resource_DataMapOfAsciiStringExtendedString & operator = (const Resource_DataMapOfAsciiStringExtendedString & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:param I:
	:type I: TCollection_ExtendedString &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TCollection_AsciiString & K,const TCollection_ExtendedString & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TCollection_AsciiString & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TCollection_AsciiString & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: TCollection_ExtendedString
") Find;
		const TCollection_ExtendedString & Find (const TCollection_AsciiString & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: TCollection_ExtendedString
") ChangeFind;
		TCollection_ExtendedString & ChangeFind (const TCollection_AsciiString & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TCollection_AsciiString & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TCollection_AsciiString & K);
};


%extend Resource_DataMapOfAsciiStringExtendedString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Resource_LexicalCompare;
class Resource_LexicalCompare {
	public:
		%feature("compactdefaultargs") Resource_LexicalCompare;
		%feature("autodoc", "	:rtype: None
") Resource_LexicalCompare;
		 Resource_LexicalCompare ();
		%feature("compactdefaultargs") IsLower;
		%feature("autodoc", "	* Returns True if <Left> is lower than <Right>.

	:param Left:
	:type Left: TCollection_AsciiString &
	:param Right:
	:type Right: TCollection_AsciiString &
	:rtype: bool
") IsLower;
		Standard_Boolean IsLower (const TCollection_AsciiString & Left,const TCollection_AsciiString & Right);
};


%extend Resource_LexicalCompare {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Resource_Manager;
class Resource_Manager : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Resource_Manager;
		%feature("autodoc", "	* Create a Resource manager. Attempts to find the two following files: $CSF_`aName`Defaults/aName $CSF_`aName`UserDefaults/aName and load them respectively into a reference and a user resource structure. //! If CSF_ResourceVerbose defined, seeked files will be printed. //! FILE SYNTAX The syntax of a resource file is a sequence of resource lines terminated by newline characters or end of file. The syntax of an individual resource line is:

	:param aName:
	:type aName: char *
	:param Verbose: default value is Standard_False
	:type Verbose: bool
	:rtype: None
") Resource_Manager;
		 Resource_Manager (const char * aName,const Standard_Boolean Verbose = Standard_False);
		%feature("compactdefaultargs") Resource_Manager;
		%feature("autodoc", "	:param aName:
	:type aName: char *
	:param aDefaultsDirectory:
	:type aDefaultsDirectory: TCollection_AsciiString &
	:param anUserDefaultsDirectory:
	:type anUserDefaultsDirectory: TCollection_AsciiString &
	:param Verbose: default value is Standard_False
	:type Verbose: bool
	:rtype: None
") Resource_Manager;
		 Resource_Manager (const char * aName,TCollection_AsciiString & aDefaultsDirectory,TCollection_AsciiString & anUserDefaultsDirectory,const Standard_Boolean Verbose = Standard_False);
		%feature("compactdefaultargs") Save;
		%feature("autodoc", "	* Save the user resource structure in the specified file. Creates the file if it does not exist.

	:rtype: bool
") Save;
		Standard_Boolean Save ();
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	* returns True if the Resource does exist.

	:param aResource:
	:type aResource: char *
	:rtype: bool
") Find;
		Standard_Boolean Find (const char * aResource);
		%feature("compactdefaultargs") Integer;
		%feature("autodoc", "	* Gets the value of an integer resource according to its instance and its type.

	:param aResourceName:
	:type aResourceName: char *
	:rtype: int
") Integer;
		virtual Standard_Integer Integer (const char * aResourceName);
		%feature("compactdefaultargs") Real;
		%feature("autodoc", "	* Gets the value of a real resource according to its instance and its type.

	:param aResourceName:
	:type aResourceName: char *
	:rtype: float
") Real;
		virtual Standard_Real Real (const char * aResourceName);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Gets the value of a CString resource according to its instance and its type.

	:param aResourceName:
	:type aResourceName: char *
	:rtype: char *
") Value;
		virtual const char * Value (const char * aResourceName);
		%feature("compactdefaultargs") ExtValue;
		%feature("autodoc", "	* Gets the value of an ExtString resource according to its instance and its type.

	:param aResourceName:
	:type aResourceName: char *
	:rtype: Standard_ExtString
") ExtValue;
		virtual Standard_ExtString ExtValue (const char * aResourceName);
		%feature("compactdefaultargs") SetResource;
		%feature("autodoc", "	* Sets the new value of an integer resource. If the resource does not exist, it is created.

	:param aResourceName:
	:type aResourceName: char *
	:param aValue:
	:type aValue: int
	:rtype: void
") SetResource;
		virtual void SetResource (const char * aResourceName,const Standard_Integer aValue);
		%feature("compactdefaultargs") SetResource;
		%feature("autodoc", "	* Sets the new value of a real resource. If the resource does not exist, it is created.

	:param aResourceName:
	:type aResourceName: char *
	:param aValue:
	:type aValue: float
	:rtype: void
") SetResource;
		virtual void SetResource (const char * aResourceName,const Standard_Real aValue);
		%feature("compactdefaultargs") SetResource;
		%feature("autodoc", "	* Sets the new value of an CString resource. If the resource does not exist, it is created.

	:param aResourceName:
	:type aResourceName: char *
	:param aValue:
	:type aValue: char *
	:rtype: void
") SetResource;
		virtual void SetResource (const char * aResourceName,const char * aValue);
		%feature("compactdefaultargs") SetResource;
		%feature("autodoc", "	* Sets the new value of an ExtString resource. If the resource does not exist, it is created.

	:param aResourceName:
	:type aResourceName: char *
	:param aValue:
	:type aValue: Standard_ExtString
	:rtype: void
") SetResource;
		virtual void SetResource (const char * aResourceName,const Standard_ExtString aValue);
		%feature("compactdefaultargs") GetResourcePath;
		%feature("autodoc", "	* Gets the resource file full path by its name. If corresponding environment variable is not set or file doesn't exist returns empty string.

	:param aPath:
	:type aPath: TCollection_AsciiString &
	:param aName:
	:type aName: char *
	:param isUserDefaults:
	:type isUserDefaults: bool
	:rtype: void
") GetResourcePath;
		static void GetResourcePath (TCollection_AsciiString & aPath,const char * aName,const Standard_Boolean isUserDefaults);
};


%extend Resource_Manager {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Resource_Manager(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Resource_Manager::Handle_Resource_Manager %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Resource_Manager;
class Handle_Resource_Manager : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Resource_Manager();
        Handle_Resource_Manager(const Handle_Resource_Manager &aHandle);
        Handle_Resource_Manager(const Resource_Manager *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Resource_Manager DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Resource_Manager {
    Resource_Manager* _get_reference() {
    return (Resource_Manager*)$self->Access();
    }
};

%extend Handle_Resource_Manager {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Resource_Manager {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class Resource_QuickSortOfArray1 {
	public:
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "	:param TheArray:
	:type TheArray: TColStd_Array1OfAsciiString &
	:param Comp:
	:type Comp: Resource_LexicalCompare &
	:rtype: void
") Sort;
		static void Sort (TColStd_Array1OfAsciiString & TheArray,const Resource_LexicalCompare & Comp);
};


%extend Resource_QuickSortOfArray1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class Resource_Unicode {
	public:
		%feature("compactdefaultargs") ConvertSJISToUnicode;
		%feature("autodoc", "	* Converts non-ASCII CString <fromstr> in SJIS format to Unicode ExtendedString <tostr>.

	:param fromstr:
	:type fromstr: char *
	:param tostr:
	:type tostr: TCollection_ExtendedString &
	:rtype: void
") ConvertSJISToUnicode;
		static void ConvertSJISToUnicode (const char * fromstr,TCollection_ExtendedString & tostr);
		%feature("compactdefaultargs") ConvertEUCToUnicode;
		%feature("autodoc", "	* Converts non-ASCII CString <fromstr> in EUC format to Unicode ExtendedString <tostr>.

	:param fromstr:
	:type fromstr: char *
	:param tostr:
	:type tostr: TCollection_ExtendedString &
	:rtype: void
") ConvertEUCToUnicode;
		static void ConvertEUCToUnicode (const char * fromstr,TCollection_ExtendedString & tostr);
		%feature("compactdefaultargs") ConvertGBToUnicode;
		%feature("autodoc", "	* Converts non-ASCII CString <fromstr> in GB format to Unicode ExtendedString <tostr>.

	:param fromstr:
	:type fromstr: char *
	:param tostr:
	:type tostr: TCollection_ExtendedString &
	:rtype: void
") ConvertGBToUnicode;
		static void ConvertGBToUnicode (const char * fromstr,TCollection_ExtendedString & tostr);
		%feature("compactdefaultargs") ConvertANSIToUnicode;
		%feature("autodoc", "	* Converts non-ASCII CString <fromstr> in ANSI format to Unicode ExtendedString <tostr>.

	:param fromstr:
	:type fromstr: char *
	:param tostr:
	:type tostr: TCollection_ExtendedString &
	:rtype: void
") ConvertANSIToUnicode;
		static void ConvertANSIToUnicode (const char * fromstr,TCollection_ExtendedString & tostr);
		%feature("compactdefaultargs") ConvertUnicodeToSJIS;
		%feature("autodoc", "	* Converts Unicode ExtendedString <fromstr> to non-ASCII CString <tostr> in SJIS format, limited to <maxsize> characters. To translate the whole <fromstr>, use more than twice the length of <fromstr>. Returns true if <maxsize> has not been reached before end of conversion.

	:param fromstr:
	:type fromstr: TCollection_ExtendedString &
	:param tostr:
	:type tostr: Standard_PCharacter &
	:param maxsize:
	:type maxsize: int
	:rtype: bool
") ConvertUnicodeToSJIS;
		static Standard_Boolean ConvertUnicodeToSJIS (const TCollection_ExtendedString & fromstr,Standard_PCharacter & tostr,const Standard_Integer maxsize);
		%feature("compactdefaultargs") ConvertUnicodeToEUC;
		%feature("autodoc", "	* Converts Unicode ExtendedString <fromstr> to non-ASCII CString <tostr> in EUC format, limited to <maxsize> characters. To translate the whole <fromstr>, use more than twice the length of <fromstr>. Returns true if <maxsize> has not been reached before end of conversion.

	:param fromstr:
	:type fromstr: TCollection_ExtendedString &
	:param tostr:
	:type tostr: Standard_PCharacter &
	:param maxsize:
	:type maxsize: int
	:rtype: bool
") ConvertUnicodeToEUC;
		static Standard_Boolean ConvertUnicodeToEUC (const TCollection_ExtendedString & fromstr,Standard_PCharacter & tostr,const Standard_Integer maxsize);
		%feature("compactdefaultargs") ConvertUnicodeToGB;
		%feature("autodoc", "	* Converts Unicode ExtendedString <fromstr> to non-ASCII CString <tostr> in GB format, limited to <maxsize> characters. To translate the whole <fromstr>, use more than twice the length of <fromstr>. Returns true if <maxsize> has not been reached before end of conversion.

	:param fromstr:
	:type fromstr: TCollection_ExtendedString &
	:param tostr:
	:type tostr: Standard_PCharacter &
	:param maxsize:
	:type maxsize: int
	:rtype: bool
") ConvertUnicodeToGB;
		static Standard_Boolean ConvertUnicodeToGB (const TCollection_ExtendedString & fromstr,Standard_PCharacter & tostr,const Standard_Integer maxsize);
		%feature("compactdefaultargs") ConvertUnicodeToANSI;
		%feature("autodoc", "	* Converts Unicode ExtendedString <fromstr> to non-ASCII CString <tostr> in ANSI format, limited to <maxsize> characters. To translate the whole <fromstr>, use more than twice the length of <fromstr>. Returns true if <maxsize> has not been reached before end of conversion.

	:param fromstr:
	:type fromstr: TCollection_ExtendedString &
	:param tostr:
	:type tostr: Standard_PCharacter &
	:param maxsize:
	:type maxsize: int
	:rtype: bool
") ConvertUnicodeToANSI;
		static Standard_Boolean ConvertUnicodeToANSI (const TCollection_ExtendedString & fromstr,Standard_PCharacter & tostr,const Standard_Integer maxsize);
		%feature("compactdefaultargs") SetFormat;
		%feature("autodoc", "	* Defines the current conversion format as typecode. This conversion format will then be used by the functions ConvertFormatToUnicode and ConvertUnicodeToFormat to convert the strings.

	:param typecode:
	:type typecode: Resource_FormatType
	:rtype: void
") SetFormat;
		static void SetFormat (const Resource_FormatType typecode);
		%feature("compactdefaultargs") GetFormat;
		%feature("autodoc", "	* Returns the current conversion format (either ANSI, EUC, GB or SJIS). The current converting format must be defined in advance with the SetFormat function.

	:rtype: Resource_FormatType
") GetFormat;
		static Resource_FormatType GetFormat ();
		%feature("compactdefaultargs") ReadFormat;
		%feature("autodoc", "	* Reads converting format from resource 'FormatType' in Resource Manager 'CharSet'

	:rtype: void
") ReadFormat;
		static void ReadFormat ();
		%feature("compactdefaultargs") ConvertFormatToUnicode;
		%feature("autodoc", "	* Converts the non-ASCII C string fromstr to the Unicode string of extended characters tostr. fromstr is translated according to the format (either ANSI, EUC, GB or SJIS) returned by the function GetFormat.

	:param fromstr:
	:type fromstr: char *
	:param tostr:
	:type tostr: TCollection_ExtendedString &
	:rtype: void
") ConvertFormatToUnicode;
		static void ConvertFormatToUnicode (const char * fromstr,TCollection_ExtendedString & tostr);
		%feature("compactdefaultargs") ConvertUnicodeToFormat;
		%feature("autodoc", "	* Converts the Unicode string of extended characters fromstr to the non-ASCII C string tostr according to the format (either ANSI, EUC, GB or SJIS) returned by the function GetFormat. maxsize limits the size of the string tostr to a maximum number of characters. You need more than twice the length of the string fromstr to complete the conversion. The function returns true if conversion is complete, i.e. the maximum number of characters maxsize is not reached by tostr before the end of conversion of fromstr.

	:param fromstr:
	:type fromstr: TCollection_ExtendedString &
	:param tostr:
	:type tostr: Standard_PCharacter &
	:param maxsize:
	:type maxsize: int
	:rtype: bool
") ConvertUnicodeToFormat;
		static Standard_Boolean ConvertUnicodeToFormat (const TCollection_ExtendedString & fromstr,Standard_PCharacter & tostr,const Standard_Integer maxsize);
};


%extend Resource_Unicode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
