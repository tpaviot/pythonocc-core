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
%module (package="OCC") Dico

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


%include Dico_headers.i


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

%nodefaultctor Dico_DictionaryOfInteger;
class Dico_DictionaryOfInteger : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Dico_DictionaryOfInteger;
		%feature("autodoc", "	:rtype: None
") Dico_DictionaryOfInteger;
		 Dico_DictionaryOfInteger ();
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
	:rtype: int
") Item;
		const Standard_Integer & Item (const char * name,const Standard_Boolean exact = Standard_True);
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: int
") Item;
		const Standard_Integer & Item (const TCollection_AsciiString & name,const Standard_Boolean exact = Standard_True);
		%feature("compactdefaultargs") GetItem;
		%feature("autodoc", "	:param name:
	:type name: char *
	:param anitem:
	:type anitem: int &
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: bool
") GetItem;
		Standard_Boolean GetItem (const char * name,Standard_Integer &OutValue,const Standard_Boolean exact = Standard_True);
		%feature("compactdefaultargs") GetItem;
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:param anitem:
	:type anitem: int &
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: bool
") GetItem;
		Standard_Boolean GetItem (const TCollection_AsciiString & name,Standard_Integer &OutValue,const Standard_Boolean exact = Standard_True);
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "	:param name:
	:type name: char *
	:param anitem:
	:type anitem: int &
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: None
") SetItem;
		void SetItem (const char * name,const Standard_Integer & anitem,const Standard_Boolean exact = Standard_True);
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:param anitem:
	:type anitem: int &
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: None
") SetItem;
		void SetItem (const TCollection_AsciiString & name,const Standard_Integer & anitem,const Standard_Boolean exact = Standard_True);
		%feature("compactdefaultargs") NewItem;
		%feature("autodoc", "	:param name:
	:type name: char *
	:param isvalued:
	:type isvalued: bool
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: int
") NewItem;
		Standard_Integer & NewItem (const char * name,Standard_Boolean &OutValue,const Standard_Boolean exact = Standard_True);
		%feature("compactdefaultargs") NewItem;
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:param isvalued:
	:type isvalued: bool
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: int
") NewItem;
		Standard_Integer & NewItem (const TCollection_AsciiString & name,Standard_Boolean &OutValue,const Standard_Boolean exact = Standard_True);
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
		%feature("autodoc", "	:rtype: Handle_Dico_DictionaryOfInteger
") Copy;
		Handle_Dico_DictionaryOfInteger Copy ();
		%feature("compactdefaultargs") Complete;
		%feature("autodoc", "	:param acell:
	:type acell: Handle_Dico_DictionaryOfInteger &
	:rtype: bool
") Complete;
		Standard_Boolean Complete (Handle_Dico_DictionaryOfInteger & acell);
};


%extend Dico_DictionaryOfInteger {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dico_DictionaryOfInteger(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dico_DictionaryOfInteger::Handle_Dico_DictionaryOfInteger %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Dico_DictionaryOfInteger;
class Handle_Dico_DictionaryOfInteger : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Dico_DictionaryOfInteger();
        Handle_Dico_DictionaryOfInteger(const Handle_Dico_DictionaryOfInteger &aHandle);
        Handle_Dico_DictionaryOfInteger(const Dico_DictionaryOfInteger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dico_DictionaryOfInteger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dico_DictionaryOfInteger {
    Dico_DictionaryOfInteger* _get_reference() {
    return (Dico_DictionaryOfInteger*)$self->Access();
    }
};

%extend Handle_Dico_DictionaryOfInteger {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Dico_DictionaryOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Dico_DictionaryOfTransient;
class Dico_DictionaryOfTransient : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Dico_DictionaryOfTransient;
		%feature("autodoc", "	:rtype: None
") Dico_DictionaryOfTransient;
		 Dico_DictionaryOfTransient ();
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
	:rtype: Handle_Standard_Transient
") Item;
		Handle_Standard_Transient Item (const char * name,const Standard_Boolean exact = Standard_True);
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: Handle_Standard_Transient
") Item;
		Handle_Standard_Transient Item (const TCollection_AsciiString & name,const Standard_Boolean exact = Standard_True);
		%feature("compactdefaultargs") GetItem;
		%feature("autodoc", "	:param name:
	:type name: char *
	:param anitem:
	:type anitem: Handle_Standard_Transient &
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: bool
") GetItem;
		Standard_Boolean GetItem (const char * name,Handle_Standard_Transient & anitem,const Standard_Boolean exact = Standard_True);
		%feature("compactdefaultargs") GetItem;
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:param anitem:
	:type anitem: Handle_Standard_Transient &
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: bool
") GetItem;
		Standard_Boolean GetItem (const TCollection_AsciiString & name,Handle_Standard_Transient & anitem,const Standard_Boolean exact = Standard_True);
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "	:param name:
	:type name: char *
	:param anitem:
	:type anitem: Handle_Standard_Transient &
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: None
") SetItem;
		void SetItem (const char * name,const Handle_Standard_Transient & anitem,const Standard_Boolean exact = Standard_True);
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:param anitem:
	:type anitem: Handle_Standard_Transient &
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: None
") SetItem;
		void SetItem (const TCollection_AsciiString & name,const Handle_Standard_Transient & anitem,const Standard_Boolean exact = Standard_True);
		%feature("compactdefaultargs") NewItem;
		%feature("autodoc", "	:param name:
	:type name: char *
	:param isvalued:
	:type isvalued: bool
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: Handle_Standard_Transient
") NewItem;
		Handle_Standard_Transient NewItem (const char * name,Standard_Boolean &OutValue,const Standard_Boolean exact = Standard_True);
		%feature("compactdefaultargs") NewItem;
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:param isvalued:
	:type isvalued: bool
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: Handle_Standard_Transient
") NewItem;
		Handle_Standard_Transient NewItem (const TCollection_AsciiString & name,Standard_Boolean &OutValue,const Standard_Boolean exact = Standard_True);
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
		%feature("autodoc", "	:rtype: Handle_Dico_DictionaryOfTransient
") Copy;
		Handle_Dico_DictionaryOfTransient Copy ();
		%feature("compactdefaultargs") Complete;
		%feature("autodoc", "	:param acell:
	:type acell: Handle_Dico_DictionaryOfTransient &
	:rtype: bool
") Complete;
		Standard_Boolean Complete (Handle_Dico_DictionaryOfTransient & acell);
};


%extend Dico_DictionaryOfTransient {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dico_DictionaryOfTransient(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dico_DictionaryOfTransient::Handle_Dico_DictionaryOfTransient %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Dico_DictionaryOfTransient;
class Handle_Dico_DictionaryOfTransient : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Dico_DictionaryOfTransient();
        Handle_Dico_DictionaryOfTransient(const Handle_Dico_DictionaryOfTransient &aHandle);
        Handle_Dico_DictionaryOfTransient(const Dico_DictionaryOfTransient *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dico_DictionaryOfTransient DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dico_DictionaryOfTransient {
    Dico_DictionaryOfTransient* _get_reference() {
    return (Dico_DictionaryOfTransient*)$self->Access();
    }
};

%extend Handle_Dico_DictionaryOfTransient {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Dico_DictionaryOfTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Dico_IteratorOfDictionaryOfInteger;
class Dico_IteratorOfDictionaryOfInteger {
	public:
		%feature("compactdefaultargs") Dico_IteratorOfDictionaryOfInteger;
		%feature("autodoc", "	:param acell:
	:type acell: Handle_Dico_DictionaryOfInteger &
	:rtype: None
") Dico_IteratorOfDictionaryOfInteger;
		 Dico_IteratorOfDictionaryOfInteger (const Handle_Dico_DictionaryOfInteger & acell);
		%feature("compactdefaultargs") Dico_IteratorOfDictionaryOfInteger;
		%feature("autodoc", "	:param acell:
	:type acell: Handle_Dico_DictionaryOfInteger &
	:param basename:
	:type basename: char *
	:rtype: None
") Dico_IteratorOfDictionaryOfInteger;
		 Dico_IteratorOfDictionaryOfInteger (const Handle_Dico_DictionaryOfInteger & acell,const char * basename);
		%feature("compactdefaultargs") Dico_IteratorOfDictionaryOfInteger;
		%feature("autodoc", "	:param acell:
	:type acell: Handle_Dico_DictionaryOfInteger &
	:param basename:
	:type basename: TCollection_AsciiString &
	:rtype: None
") Dico_IteratorOfDictionaryOfInteger;
		 Dico_IteratorOfDictionaryOfInteger (const Handle_Dico_DictionaryOfInteger & acell,const TCollection_AsciiString & basename);
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
		%feature("autodoc", "	:rtype: int
") Value;
		const Standard_Integer & Value ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Name;
		TCollection_AsciiString Name ();
};


%extend Dico_IteratorOfDictionaryOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Dico_IteratorOfDictionaryOfTransient;
class Dico_IteratorOfDictionaryOfTransient {
	public:
		%feature("compactdefaultargs") Dico_IteratorOfDictionaryOfTransient;
		%feature("autodoc", "	:param acell:
	:type acell: Handle_Dico_DictionaryOfTransient &
	:rtype: None
") Dico_IteratorOfDictionaryOfTransient;
		 Dico_IteratorOfDictionaryOfTransient (const Handle_Dico_DictionaryOfTransient & acell);
		%feature("compactdefaultargs") Dico_IteratorOfDictionaryOfTransient;
		%feature("autodoc", "	:param acell:
	:type acell: Handle_Dico_DictionaryOfTransient &
	:param basename:
	:type basename: char *
	:rtype: None
") Dico_IteratorOfDictionaryOfTransient;
		 Dico_IteratorOfDictionaryOfTransient (const Handle_Dico_DictionaryOfTransient & acell,const char * basename);
		%feature("compactdefaultargs") Dico_IteratorOfDictionaryOfTransient;
		%feature("autodoc", "	:param acell:
	:type acell: Handle_Dico_DictionaryOfTransient &
	:param basename:
	:type basename: TCollection_AsciiString &
	:rtype: None
") Dico_IteratorOfDictionaryOfTransient;
		 Dico_IteratorOfDictionaryOfTransient (const Handle_Dico_DictionaryOfTransient & acell,const TCollection_AsciiString & basename);
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
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Value;
		Handle_Standard_Transient Value ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Name;
		TCollection_AsciiString Name ();
};


%extend Dico_IteratorOfDictionaryOfTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Dico_StackItemOfDictionaryOfInteger;
class Dico_StackItemOfDictionaryOfInteger : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Dico_StackItemOfDictionaryOfInteger;
		%feature("autodoc", "	:rtype: None
") Dico_StackItemOfDictionaryOfInteger;
		 Dico_StackItemOfDictionaryOfInteger ();
		%feature("compactdefaultargs") Dico_StackItemOfDictionaryOfInteger;
		%feature("autodoc", "	:param previous:
	:type previous: Handle_Dico_StackItemOfDictionaryOfInteger &
	:rtype: None
") Dico_StackItemOfDictionaryOfInteger;
		 Dico_StackItemOfDictionaryOfInteger (const Handle_Dico_StackItemOfDictionaryOfInteger & previous);
		%feature("compactdefaultargs") Previous;
		%feature("autodoc", "	:rtype: Handle_Dico_StackItemOfDictionaryOfInteger
") Previous;
		Handle_Dico_StackItemOfDictionaryOfInteger Previous ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Dico_DictionaryOfInteger
") Value;
		Handle_Dico_DictionaryOfInteger Value ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param cval:
	:type cval: Handle_Dico_DictionaryOfInteger &
	:rtype: None
") SetValue;
		void SetValue (const Handle_Dico_DictionaryOfInteger & cval);
};


%extend Dico_StackItemOfDictionaryOfInteger {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dico_StackItemOfDictionaryOfInteger(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dico_StackItemOfDictionaryOfInteger::Handle_Dico_StackItemOfDictionaryOfInteger %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Dico_StackItemOfDictionaryOfInteger;
class Handle_Dico_StackItemOfDictionaryOfInteger : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Dico_StackItemOfDictionaryOfInteger();
        Handle_Dico_StackItemOfDictionaryOfInteger(const Handle_Dico_StackItemOfDictionaryOfInteger &aHandle);
        Handle_Dico_StackItemOfDictionaryOfInteger(const Dico_StackItemOfDictionaryOfInteger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dico_StackItemOfDictionaryOfInteger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dico_StackItemOfDictionaryOfInteger {
    Dico_StackItemOfDictionaryOfInteger* _get_reference() {
    return (Dico_StackItemOfDictionaryOfInteger*)$self->Access();
    }
};

%extend Handle_Dico_StackItemOfDictionaryOfInteger {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Dico_StackItemOfDictionaryOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Dico_StackItemOfDictionaryOfTransient;
class Dico_StackItemOfDictionaryOfTransient : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Dico_StackItemOfDictionaryOfTransient;
		%feature("autodoc", "	:rtype: None
") Dico_StackItemOfDictionaryOfTransient;
		 Dico_StackItemOfDictionaryOfTransient ();
		%feature("compactdefaultargs") Dico_StackItemOfDictionaryOfTransient;
		%feature("autodoc", "	:param previous:
	:type previous: Handle_Dico_StackItemOfDictionaryOfTransient &
	:rtype: None
") Dico_StackItemOfDictionaryOfTransient;
		 Dico_StackItemOfDictionaryOfTransient (const Handle_Dico_StackItemOfDictionaryOfTransient & previous);
		%feature("compactdefaultargs") Previous;
		%feature("autodoc", "	:rtype: Handle_Dico_StackItemOfDictionaryOfTransient
") Previous;
		Handle_Dico_StackItemOfDictionaryOfTransient Previous ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Dico_DictionaryOfTransient
") Value;
		Handle_Dico_DictionaryOfTransient Value ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param cval:
	:type cval: Handle_Dico_DictionaryOfTransient &
	:rtype: None
") SetValue;
		void SetValue (const Handle_Dico_DictionaryOfTransient & cval);
};


%extend Dico_StackItemOfDictionaryOfTransient {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Dico_StackItemOfDictionaryOfTransient(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Dico_StackItemOfDictionaryOfTransient::Handle_Dico_StackItemOfDictionaryOfTransient %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Dico_StackItemOfDictionaryOfTransient;
class Handle_Dico_StackItemOfDictionaryOfTransient : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Dico_StackItemOfDictionaryOfTransient();
        Handle_Dico_StackItemOfDictionaryOfTransient(const Handle_Dico_StackItemOfDictionaryOfTransient &aHandle);
        Handle_Dico_StackItemOfDictionaryOfTransient(const Dico_StackItemOfDictionaryOfTransient *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Dico_StackItemOfDictionaryOfTransient DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Dico_StackItemOfDictionaryOfTransient {
    Dico_StackItemOfDictionaryOfTransient* _get_reference() {
    return (Dico_StackItemOfDictionaryOfTransient*)$self->Access();
    }
};

%extend Handle_Dico_StackItemOfDictionaryOfTransient {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Dico_StackItemOfDictionaryOfTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
