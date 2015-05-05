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

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor Dico_DictionaryOfInteger;
class Dico_DictionaryOfInteger : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") Dico_DictionaryOfInteger;
		 Dico_DictionaryOfInteger ();
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
	:rtype: int
") Item;
		const Standard_Integer & Item (const char * name,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: int
") Item;
		const Standard_Integer & Item (const TCollection_AsciiString & name,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "	:param name:
	:type name: char *
	:param anitem:
	:type anitem: Standard_Integer &
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: bool
") GetItem;
		Standard_Boolean GetItem (const char * name,Standard_Integer &OutValue,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:param anitem:
	:type anitem: Standard_Integer &
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: bool
") GetItem;
		Standard_Boolean GetItem (const TCollection_AsciiString & name,Standard_Integer &OutValue,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "	:param name:
	:type name: char *
	:param anitem:
	:type anitem: Standard_Integer &
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: None
") SetItem;
		void SetItem (const char * name,const Standard_Integer & anitem,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:param anitem:
	:type anitem: Standard_Integer &
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: None
") SetItem;
		void SetItem (const TCollection_AsciiString & name,const Standard_Integer & anitem,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "	:param name:
	:type name: char *
	:param isvalued:
	:type isvalued: bool
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: int
") NewItem;
		Standard_Integer & NewItem (const char * name,Standard_Boolean & isvalued,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:param isvalued:
	:type isvalued: bool
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: int
") NewItem;
		Standard_Integer & NewItem (const TCollection_AsciiString & name,Standard_Boolean & isvalued,const Standard_Boolean exact = Standard_True);
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
		%feature("autodoc", "	:rtype: Handle_Dico_DictionaryOfInteger
") Copy;
		Handle_Dico_DictionaryOfInteger Copy ();
		%feature("autodoc", "	:param acell:
	:type acell: Handle_Dico_DictionaryOfInteger &
	:rtype: bool
") Complete;
		Standard_Boolean Complete (Handle_Dico_DictionaryOfInteger & acell);
};


%feature("shadow") Dico_DictionaryOfInteger::~Dico_DictionaryOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dico_DictionaryOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dico_DictionaryOfInteger {
	Handle_Dico_DictionaryOfInteger GetHandle() {
	return *(Handle_Dico_DictionaryOfInteger*) &$self;
	}
};

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
    Dico_DictionaryOfInteger* GetObject() {
    return (Dico_DictionaryOfInteger*)$self->Access();
    }
};
%feature("shadow") Handle_Dico_DictionaryOfInteger::~Handle_Dico_DictionaryOfInteger %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dico_DictionaryOfInteger {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dico_DictionaryOfTransient;
class Dico_DictionaryOfTransient : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") Dico_DictionaryOfTransient;
		 Dico_DictionaryOfTransient ();
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
	:rtype: Handle_Standard_Transient
") Item;
		const Handle_Standard_Transient & Item (const char * name,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: Handle_Standard_Transient
") Item;
		const Handle_Standard_Transient & Item (const TCollection_AsciiString & name,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "	:param name:
	:type name: char *
	:param anitem:
	:type anitem: Handle_Standard_Transient &
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: bool
") GetItem;
		Standard_Boolean GetItem (const char * name,Handle_Standard_Transient & anitem,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:param anitem:
	:type anitem: Handle_Standard_Transient &
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: bool
") GetItem;
		Standard_Boolean GetItem (const TCollection_AsciiString & name,Handle_Standard_Transient & anitem,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "	:param name:
	:type name: char *
	:param anitem:
	:type anitem: Handle_Standard_Transient &
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: None
") SetItem;
		void SetItem (const char * name,const Handle_Standard_Transient & anitem,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:param anitem:
	:type anitem: Handle_Standard_Transient &
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: None
") SetItem;
		void SetItem (const TCollection_AsciiString & name,const Handle_Standard_Transient & anitem,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "	:param name:
	:type name: char *
	:param isvalued:
	:type isvalued: bool
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: Handle_Standard_Transient
") NewItem;
		Handle_Standard_Transient & NewItem (const char * name,Standard_Boolean & isvalued,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "	:param name:
	:type name: TCollection_AsciiString &
	:param isvalued:
	:type isvalued: bool
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: Handle_Standard_Transient
") NewItem;
		Handle_Standard_Transient & NewItem (const TCollection_AsciiString & name,Standard_Boolean & isvalued,const Standard_Boolean exact = Standard_True);
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
		%feature("autodoc", "	:rtype: Handle_Dico_DictionaryOfTransient
") Copy;
		Handle_Dico_DictionaryOfTransient Copy ();
		%feature("autodoc", "	:param acell:
	:type acell: Handle_Dico_DictionaryOfTransient &
	:rtype: bool
") Complete;
		Standard_Boolean Complete (Handle_Dico_DictionaryOfTransient & acell);
};


%feature("shadow") Dico_DictionaryOfTransient::~Dico_DictionaryOfTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dico_DictionaryOfTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dico_DictionaryOfTransient {
	Handle_Dico_DictionaryOfTransient GetHandle() {
	return *(Handle_Dico_DictionaryOfTransient*) &$self;
	}
};

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
    Dico_DictionaryOfTransient* GetObject() {
    return (Dico_DictionaryOfTransient*)$self->Access();
    }
};
%feature("shadow") Handle_Dico_DictionaryOfTransient::~Handle_Dico_DictionaryOfTransient %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dico_DictionaryOfTransient {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dico_IteratorOfDictionaryOfInteger;
class Dico_IteratorOfDictionaryOfInteger {
	public:
		%feature("autodoc", "	:param acell:
	:type acell: Handle_Dico_DictionaryOfInteger &
	:rtype: None
") Dico_IteratorOfDictionaryOfInteger;
		 Dico_IteratorOfDictionaryOfInteger (const Handle_Dico_DictionaryOfInteger & acell);
		%feature("autodoc", "	:param acell:
	:type acell: Handle_Dico_DictionaryOfInteger &
	:param basename:
	:type basename: char *
	:rtype: None
") Dico_IteratorOfDictionaryOfInteger;
		 Dico_IteratorOfDictionaryOfInteger (const Handle_Dico_DictionaryOfInteger & acell,const char * basename);
		%feature("autodoc", "	:param acell:
	:type acell: Handle_Dico_DictionaryOfInteger &
	:param basename:
	:type basename: TCollection_AsciiString &
	:rtype: None
") Dico_IteratorOfDictionaryOfInteger;
		 Dico_IteratorOfDictionaryOfInteger (const Handle_Dico_DictionaryOfInteger & acell,const TCollection_AsciiString & basename);
		%feature("autodoc", "	:rtype: None
") Start;
		void Start ();
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: int
") Value;
		const Standard_Integer & Value ();
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Name;
		TCollection_AsciiString Name ();
};


%feature("shadow") Dico_IteratorOfDictionaryOfInteger::~Dico_IteratorOfDictionaryOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dico_IteratorOfDictionaryOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Dico_IteratorOfDictionaryOfTransient;
class Dico_IteratorOfDictionaryOfTransient {
	public:
		%feature("autodoc", "	:param acell:
	:type acell: Handle_Dico_DictionaryOfTransient &
	:rtype: None
") Dico_IteratorOfDictionaryOfTransient;
		 Dico_IteratorOfDictionaryOfTransient (const Handle_Dico_DictionaryOfTransient & acell);
		%feature("autodoc", "	:param acell:
	:type acell: Handle_Dico_DictionaryOfTransient &
	:param basename:
	:type basename: char *
	:rtype: None
") Dico_IteratorOfDictionaryOfTransient;
		 Dico_IteratorOfDictionaryOfTransient (const Handle_Dico_DictionaryOfTransient & acell,const char * basename);
		%feature("autodoc", "	:param acell:
	:type acell: Handle_Dico_DictionaryOfTransient &
	:param basename:
	:type basename: TCollection_AsciiString &
	:rtype: None
") Dico_IteratorOfDictionaryOfTransient;
		 Dico_IteratorOfDictionaryOfTransient (const Handle_Dico_DictionaryOfTransient & acell,const TCollection_AsciiString & basename);
		%feature("autodoc", "	:rtype: None
") Start;
		void Start ();
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Value;
		const Handle_Standard_Transient & Value ();
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Name;
		TCollection_AsciiString Name ();
};


%feature("shadow") Dico_IteratorOfDictionaryOfTransient::~Dico_IteratorOfDictionaryOfTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dico_IteratorOfDictionaryOfTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Dico_StackItemOfDictionaryOfInteger;
class Dico_StackItemOfDictionaryOfInteger : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") Dico_StackItemOfDictionaryOfInteger;
		 Dico_StackItemOfDictionaryOfInteger ();
		%feature("autodoc", "	:param previous:
	:type previous: Handle_Dico_StackItemOfDictionaryOfInteger &
	:rtype: None
") Dico_StackItemOfDictionaryOfInteger;
		 Dico_StackItemOfDictionaryOfInteger (const Handle_Dico_StackItemOfDictionaryOfInteger & previous);
		%feature("autodoc", "	:rtype: Handle_Dico_StackItemOfDictionaryOfInteger
") Previous;
		Handle_Dico_StackItemOfDictionaryOfInteger Previous ();
		%feature("autodoc", "	:rtype: Handle_Dico_DictionaryOfInteger
") Value;
		Handle_Dico_DictionaryOfInteger Value ();
		%feature("autodoc", "	:param cval:
	:type cval: Handle_Dico_DictionaryOfInteger &
	:rtype: None
") SetValue;
		void SetValue (const Handle_Dico_DictionaryOfInteger & cval);
};


%feature("shadow") Dico_StackItemOfDictionaryOfInteger::~Dico_StackItemOfDictionaryOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dico_StackItemOfDictionaryOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dico_StackItemOfDictionaryOfInteger {
	Handle_Dico_StackItemOfDictionaryOfInteger GetHandle() {
	return *(Handle_Dico_StackItemOfDictionaryOfInteger*) &$self;
	}
};

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
    Dico_StackItemOfDictionaryOfInteger* GetObject() {
    return (Dico_StackItemOfDictionaryOfInteger*)$self->Access();
    }
};
%feature("shadow") Handle_Dico_StackItemOfDictionaryOfInteger::~Handle_Dico_StackItemOfDictionaryOfInteger %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dico_StackItemOfDictionaryOfInteger {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Dico_StackItemOfDictionaryOfTransient;
class Dico_StackItemOfDictionaryOfTransient : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") Dico_StackItemOfDictionaryOfTransient;
		 Dico_StackItemOfDictionaryOfTransient ();
		%feature("autodoc", "	:param previous:
	:type previous: Handle_Dico_StackItemOfDictionaryOfTransient &
	:rtype: None
") Dico_StackItemOfDictionaryOfTransient;
		 Dico_StackItemOfDictionaryOfTransient (const Handle_Dico_StackItemOfDictionaryOfTransient & previous);
		%feature("autodoc", "	:rtype: Handle_Dico_StackItemOfDictionaryOfTransient
") Previous;
		Handle_Dico_StackItemOfDictionaryOfTransient Previous ();
		%feature("autodoc", "	:rtype: Handle_Dico_DictionaryOfTransient
") Value;
		Handle_Dico_DictionaryOfTransient Value ();
		%feature("autodoc", "	:param cval:
	:type cval: Handle_Dico_DictionaryOfTransient &
	:rtype: None
") SetValue;
		void SetValue (const Handle_Dico_DictionaryOfTransient & cval);
};


%feature("shadow") Dico_StackItemOfDictionaryOfTransient::~Dico_StackItemOfDictionaryOfTransient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Dico_StackItemOfDictionaryOfTransient {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Dico_StackItemOfDictionaryOfTransient {
	Handle_Dico_StackItemOfDictionaryOfTransient GetHandle() {
	return *(Handle_Dico_StackItemOfDictionaryOfTransient*) &$self;
	}
};

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
    Dico_StackItemOfDictionaryOfTransient* GetObject() {
    return (Dico_StackItemOfDictionaryOfTransient*)$self->Access();
    }
};
%feature("shadow") Handle_Dico_StackItemOfDictionaryOfTransient::~Handle_Dico_StackItemOfDictionaryOfTransient %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Dico_StackItemOfDictionaryOfTransient {
    void _kill_pointed() {
        delete $self;
    }
};

