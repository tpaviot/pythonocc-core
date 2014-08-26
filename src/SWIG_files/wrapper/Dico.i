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
%module Dico

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

%include Dico_required_python_modules.i
%include Dico_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor Dico_DictionaryOfInteger;
class Dico_DictionaryOfInteger : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dico_DictionaryOfInteger;
		 Dico_DictionaryOfInteger ();
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
	Standard_Integer

No detailed docstring for this function.") Item;
		const Standard_Integer & Item (const char * name,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "Args:
	name(TCollection_AsciiString)
	exact(Standard_Boolean)=Standard_True

Returns:
	Standard_Integer

No detailed docstring for this function.") Item;
		const Standard_Integer & Item (const TCollection_AsciiString & name,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "Args:
	name(char *)
	anitem(Standard_Integer)
	exact(Standard_Boolean)=Standard_True

Returns:
	Standard_Boolean

No detailed docstring for this function.") GetItem;
		Standard_Boolean GetItem (const char * name,Standard_Integer &OutValue,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "Args:
	name(TCollection_AsciiString)
	anitem(Standard_Integer)
	exact(Standard_Boolean)=Standard_True

Returns:
	Standard_Boolean

No detailed docstring for this function.") GetItem;
		Standard_Boolean GetItem (const TCollection_AsciiString & name,Standard_Integer &OutValue,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "Args:
	name(char *)
	anitem(Standard_Integer)
	exact(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") SetItem;
		void SetItem (const char * name,Standard_Integer &OutValue,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "Args:
	name(TCollection_AsciiString)
	anitem(Standard_Integer)
	exact(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") SetItem;
		void SetItem (const TCollection_AsciiString & name,Standard_Integer &OutValue,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "Args:
	name(char *)
	isvalued(Standard_Boolean)
	exact(Standard_Boolean)=Standard_True

Returns:
	Standard_Integer

No detailed docstring for this function.") NewItem;
		Standard_Integer & NewItem (const char * name,Standard_Boolean & isvalued,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "Args:
	name(TCollection_AsciiString)
	isvalued(Standard_Boolean)
	exact(Standard_Boolean)=Standard_True

Returns:
	Standard_Integer

No detailed docstring for this function.") NewItem;
		Standard_Integer & NewItem (const TCollection_AsciiString & name,Standard_Boolean & isvalued,const Standard_Boolean exact = Standard_True);
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
	Handle_Dico_DictionaryOfInteger

No detailed docstring for this function.") Copy;
		Handle_Dico_DictionaryOfInteger Copy ();
		%feature("autodoc", "Args:
	acell(Handle_Dico_DictionaryOfInteger)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Complete;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dico_DictionaryOfTransient;
		 Dico_DictionaryOfTransient ();
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
	Handle_Standard_Transient

No detailed docstring for this function.") Item;
		const Handle_Standard_Transient & Item (const char * name,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "Args:
	name(TCollection_AsciiString)
	exact(Standard_Boolean)=Standard_True

Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Item;
		const Handle_Standard_Transient & Item (const TCollection_AsciiString & name,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "Args:
	name(char *)
	anitem(Handle_Standard_Transient)
	exact(Standard_Boolean)=Standard_True

Returns:
	Standard_Boolean

No detailed docstring for this function.") GetItem;
		Standard_Boolean GetItem (const char * name,Handle_Standard_Transient & anitem,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "Args:
	name(TCollection_AsciiString)
	anitem(Handle_Standard_Transient)
	exact(Standard_Boolean)=Standard_True

Returns:
	Standard_Boolean

No detailed docstring for this function.") GetItem;
		Standard_Boolean GetItem (const TCollection_AsciiString & name,Handle_Standard_Transient & anitem,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "Args:
	name(char *)
	anitem(Handle_Standard_Transient)
	exact(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") SetItem;
		void SetItem (const char * name,const Handle_Standard_Transient & anitem,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "Args:
	name(TCollection_AsciiString)
	anitem(Handle_Standard_Transient)
	exact(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") SetItem;
		void SetItem (const TCollection_AsciiString & name,const Handle_Standard_Transient & anitem,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "Args:
	name(char *)
	isvalued(Standard_Boolean)
	exact(Standard_Boolean)=Standard_True

Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") NewItem;
		Handle_Standard_Transient & NewItem (const char * name,Standard_Boolean & isvalued,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "Args:
	name(TCollection_AsciiString)
	isvalued(Standard_Boolean)
	exact(Standard_Boolean)=Standard_True

Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") NewItem;
		Handle_Standard_Transient & NewItem (const TCollection_AsciiString & name,Standard_Boolean & isvalued,const Standard_Boolean exact = Standard_True);
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
	Handle_Dico_DictionaryOfTransient

No detailed docstring for this function.") Copy;
		Handle_Dico_DictionaryOfTransient Copy ();
		%feature("autodoc", "Args:
	acell(Handle_Dico_DictionaryOfTransient)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Complete;
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
		%feature("autodoc", "Args:
	acell(Handle_Dico_DictionaryOfInteger)

Returns:
	None

No detailed docstring for this function.") Dico_IteratorOfDictionaryOfInteger;
		 Dico_IteratorOfDictionaryOfInteger (const Handle_Dico_DictionaryOfInteger & acell);
		%feature("autodoc", "Args:
	acell(Handle_Dico_DictionaryOfInteger)
	basename(char *)

Returns:
	None

No detailed docstring for this function.") Dico_IteratorOfDictionaryOfInteger;
		 Dico_IteratorOfDictionaryOfInteger (const Handle_Dico_DictionaryOfInteger & acell,const char * basename);
		%feature("autodoc", "Args:
	acell(Handle_Dico_DictionaryOfInteger)
	basename(TCollection_AsciiString)

Returns:
	None

No detailed docstring for this function.") Dico_IteratorOfDictionaryOfInteger;
		 Dico_IteratorOfDictionaryOfInteger (const Handle_Dico_DictionaryOfInteger & acell,const TCollection_AsciiString & basename);
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
	Standard_Integer

No detailed docstring for this function.") Value;
		const Standard_Integer & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

No detailed docstring for this function.") Name;
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
		%feature("autodoc", "Args:
	acell(Handle_Dico_DictionaryOfTransient)

Returns:
	None

No detailed docstring for this function.") Dico_IteratorOfDictionaryOfTransient;
		 Dico_IteratorOfDictionaryOfTransient (const Handle_Dico_DictionaryOfTransient & acell);
		%feature("autodoc", "Args:
	acell(Handle_Dico_DictionaryOfTransient)
	basename(char *)

Returns:
	None

No detailed docstring for this function.") Dico_IteratorOfDictionaryOfTransient;
		 Dico_IteratorOfDictionaryOfTransient (const Handle_Dico_DictionaryOfTransient & acell,const char * basename);
		%feature("autodoc", "Args:
	acell(Handle_Dico_DictionaryOfTransient)
	basename(TCollection_AsciiString)

Returns:
	None

No detailed docstring for this function.") Dico_IteratorOfDictionaryOfTransient;
		 Dico_IteratorOfDictionaryOfTransient (const Handle_Dico_DictionaryOfTransient & acell,const TCollection_AsciiString & basename);
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
	Handle_Standard_Transient

No detailed docstring for this function.") Value;
		const Handle_Standard_Transient & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

No detailed docstring for this function.") Name;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dico_StackItemOfDictionaryOfInteger;
		 Dico_StackItemOfDictionaryOfInteger ();
		%feature("autodoc", "Args:
	previous(Handle_Dico_StackItemOfDictionaryOfInteger)

Returns:
	None

No detailed docstring for this function.") Dico_StackItemOfDictionaryOfInteger;
		 Dico_StackItemOfDictionaryOfInteger (const Handle_Dico_StackItemOfDictionaryOfInteger & previous);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dico_StackItemOfDictionaryOfInteger

No detailed docstring for this function.") Previous;
		Handle_Dico_StackItemOfDictionaryOfInteger Previous ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dico_DictionaryOfInteger

No detailed docstring for this function.") Value;
		Handle_Dico_DictionaryOfInteger Value ();
		%feature("autodoc", "Args:
	cval(Handle_Dico_DictionaryOfInteger)

Returns:
	None

No detailed docstring for this function.") SetValue;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dico_StackItemOfDictionaryOfTransient;
		 Dico_StackItemOfDictionaryOfTransient ();
		%feature("autodoc", "Args:
	previous(Handle_Dico_StackItemOfDictionaryOfTransient)

Returns:
	None

No detailed docstring for this function.") Dico_StackItemOfDictionaryOfTransient;
		 Dico_StackItemOfDictionaryOfTransient (const Handle_Dico_StackItemOfDictionaryOfTransient & previous);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dico_StackItemOfDictionaryOfTransient

No detailed docstring for this function.") Previous;
		Handle_Dico_StackItemOfDictionaryOfTransient Previous ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dico_DictionaryOfTransient

No detailed docstring for this function.") Value;
		Handle_Dico_DictionaryOfTransient Value ();
		%feature("autodoc", "Args:
	cval(Handle_Dico_DictionaryOfTransient)

Returns:
	None

No detailed docstring for this function.") SetValue;
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

