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
%module (package="OCC") Standard

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

%include Standard_headers.i

/* typedefs */
typedef bool Standard_Boolean;
typedef const char * Standard_CString;
typedef Standard_ExtCharacter * Standard_PExtCharacter;
typedef std::time_t Standard_Time;
typedef unsigned char Standard_Byte;
typedef void * Standard_Address;
typedef Standard_Byte * Standard_PByte;
typedef GUID Standard_UUID;
typedef short Standard_ExtCharacter;
typedef double Standard_Real;
typedef Standard_ErrorHandler * Standard_PErrorHandler;
typedef int Standard_Integer;
typedef char Standard_Utf8Char;
typedef Standard_Character * Standard_PCharacter;
typedef pthread_t Standard_ThreadId;
typedef float Standard_ShortReal;
typedef wchar_t Standard_WideChar;
typedef char Standard_Character;
typedef unsigned char Standard_Utf8UChar;
typedef uint32_t Standard_Utf32Char;
typedef Standard_Persistent * Standard_OId;
typedef strstream Standard_SStream;
typedef uint16_t Standard_Utf16Char;
typedef const short * Standard_ExtString;
typedef unsigned __int32 uint32_t;
typedef size_t Standard_Size;
typedef ostream Standard_OStream;
typedef unsigned __int16 uint16_t;
/* end typedefs declaration */

/* public enums */
enum Standard_HandlerStatus {
	Standard_HandlerVoid = 0,
	Standard_HandlerJumped = 1,
	Standard_HandlerProcessed = 2,
};

enum Standard_InternalType {
	Standard_Void = 0,
	Standard_Char = 1,
	Standard_ExtChar = 2,
	Standard_LongInt = 3,
	Standard_Bool = 4,
	Standard_Float = 5,
	Standard_LongDouble = 6,
	Standard_String = 7,
	Standard_EString = 8,
	Standard_EntryAddress = 9,
	Standard_DataAddress = 10,
	Standard_EngineHandle = 11,
	Standard_Long64 = 12,
	Standard_Array = 13,
};

enum Standard_KindOfType {
	Standard_IsUnKnown = 0,
	Standard_IsClass = 1,
	Standard_IsEnumeration = 2,
	Standard_IsPrimitive = 3,
	Standard_IsImported = 4,
	Standard_IsPackage = 5,
};

enum Standard_WayOfLife {
	Standard_IsNothing = 0,
	Standard_IsAddress = 1,
	Standard_IsTransient = 2,
	Standard_IsPersistent = 3,
	Standard_IsNotLoaded = 4,
};

/* end public enums declaration */

%rename(standard) Standard;
%nodefaultctor Standard;
class Standard {
	public:
		%feature("autodoc", "Args:
	aSize(Standard_Size)

Returns:
	static Standard_Address

Allocates memory blocks  
          aSize - bytes to  allocate") Allocate;
		static Standard_Address Allocate (const Standard_Size aSize);
		%feature("autodoc", "Args:
	aStorage(Standard_Address)
	aNewSize(Standard_Size)

Returns:
	static Standard_Address

Reallocates memory blocks  
          aStorage - previously allocated memory block  
          aNewSize - new size in bytes") Reallocate;
		static Standard_Address Reallocate (const Standard_Address aStorage,const Standard_Size aNewSize);
		%feature("autodoc", "Args:
	None
Returns:
	static Standard_Integer

Deallocates the storage retained on the free list  
          and clears the list.  
          Returns non-zero if some memory has been actually freed.") Purge;
		static Standard_Integer Purge ();
};


%feature("shadow") Standard::~Standard %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Standard {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Standard_ErrorHandler;
class Standard_ErrorHandler {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Create a ErrorHandler (to be used with try{}catch(){}).  
          It uses the 'setjmp' and 'longjmp' routines.") Standard_ErrorHandler;
		 Standard_ErrorHandler ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Unlinks and checks if there is a raised exception.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Removes handler from the handlers list") Unlink;
		void Unlink ();
		%feature("autodoc", "Args:
	aType(Handle_Standard_Type)

Returns:
	Standard_Boolean

Returns 'True' if the caught exception has the same type  
         or inherits from 'aType'") Catches;
		Standard_Boolean Catches (const Handle_Standard_Type & aType);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_JmpBuf

Returns label for jump") Label;
		Standard_JmpBuf & Label ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Failure

Returns the current Error.") Error;
		Handle_Standard_Failure Error ();
		%feature("autodoc", "Args:
	None
Returns:
	static Handle_Standard_Failure

Returns the caught exception.") LastCaughtError;
		static Handle_Standard_Failure LastCaughtError ();
		%feature("autodoc", "Args:
	None
Returns:
	static Standard_Boolean

Test if the code is currently running in a try block") IsInTryBlock;
		static Standard_Boolean IsInTryBlock ();
};


%feature("shadow") Standard_ErrorHandler::~Standard_ErrorHandler %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Standard_ErrorHandler {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Standard_ErrorHandlerCallback;
class Standard_ErrorHandlerCallback {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Registers this callback object in the current error handler  
         (if found).") RegisterCallback;
		void RegisterCallback ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Unregisters this callback object from the error handler.") UnregisterCallback;
		void UnregisterCallback ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

The callback function to perform necessary callback action.  
         Called by the exception handler when it is being destroyed but  
         still has this callback registered.") DestroyCallback;
		virtual void DestroyCallback ();
};


%feature("shadow") Standard_ErrorHandlerCallback::~Standard_ErrorHandlerCallback %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Standard_ErrorHandlerCallback {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Standard_GUID;
class Standard_GUID {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Standard_GUID;
		 Standard_GUID ();
		%feature("autodoc", "Args:
	aGuid(char *)

Returns:
	None

build a GUID from an ascii string with the  
         following format:  
         Length : 36 char  
         '00000000-0000-0000-0000-000000000000'") Standard_GUID;
		 Standard_GUID (const char * aGuid);
		%feature("autodoc", "Args:
	aGuid(Standard_ExtString)

Returns:
	None

build a GUID from an unicode string with the  
         following format:  
 
         '00000000-0000-0000-0000-000000000000'") Standard_GUID;
		 Standard_GUID (const Standard_ExtString aGuid);
		%feature("autodoc", "Args:
	a32b(Standard_Integer)
	a16b1(Standard_ExtCharacter)
	a16b2(Standard_ExtCharacter)
	a16b3(Standard_ExtCharacter)
	a8b1(Standard_Byte)
	a8b2(Standard_Byte)
	a8b3(Standard_Byte)
	a8b4(Standard_Byte)
	a8b5(Standard_Byte)
	a8b6(Standard_Byte)

Returns:
	None

No detailed docstring for this function.") Standard_GUID;
		 Standard_GUID (const Standard_Integer a32b,const Standard_ExtCharacter a16b1,const Standard_ExtCharacter a16b2,const Standard_ExtCharacter a16b3,const Standard_Byte a8b1,const Standard_Byte a8b2,const Standard_Byte a8b3,const Standard_Byte a8b4,const Standard_Byte a8b5,const Standard_Byte a8b6);
		%feature("autodoc", "Args:
	aGuid(Standard_UUID)

Returns:
	None

No detailed docstring for this function.") Standard_GUID;
		 Standard_GUID (const Standard_UUID & aGuid);
		%feature("autodoc", "Args:
	aGuid(Standard_GUID)

Returns:
	None

No detailed docstring for this function.") Standard_GUID;
		 Standard_GUID (const Standard_GUID & aGuid);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_UUID

No detailed docstring for this function.") ToUUID;
		Standard_UUID ToUUID ();
		%feature("autodoc", "Args:
	aStrGuid(Standard_PCharacter)

Returns:
	None

translate the GUID into ascii string  
         the aStrGuid is allocated by user.  
         the guid have the following format:  
 
         '00000000-0000-0000-0000-000000000000'") ToCString;
		void ToCString (const Standard_PCharacter aStrGuid);
		%feature("autodoc", "Args:
	aStrGuid(Standard_PExtCharacter)

Returns:
	None

translate the GUID into unicode string  
         the aStrGuid is allocated by user.  
         the guid have the following format:  
 
         '00000000-0000-0000-0000-000000000000'") ToExtString;
		void ToExtString (const Standard_PExtCharacter aStrGuid);
		%feature("autodoc", "Args:
	uid(Standard_GUID)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsSame;
		Standard_Boolean IsSame (const Standard_GUID & uid);
		%feature("autodoc", "Args:
	uid(Standard_GUID)

Returns:
	Standard_Boolean

No detailed docstring for this function.") operator==;
		Standard_Boolean operator == (const Standard_GUID & uid);
		%feature("autodoc", "Args:
	uid(Standard_GUID)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsNotSame;
		Standard_Boolean IsNotSame (const Standard_GUID & uid);
		%feature("autodoc", "Args:
	uid(Standard_GUID)

Returns:
	Standard_Boolean

No detailed docstring for this function.") operator!=;
		Standard_Boolean operator != (const Standard_GUID & uid);
		%feature("autodoc", "Args:
	uid(Standard_GUID)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const Standard_GUID & uid);
		%feature("autodoc", "Args:
	uid(Standard_GUID)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const Standard_GUID & uid);
		%feature("autodoc", "Args:
	uid(Standard_UUID)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const Standard_UUID & uid);
		%feature("autodoc", "Args:
	uid(Standard_UUID)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const Standard_UUID & uid);
		%feature("autodoc", "Args:
	aStream(Standard_OStream)

Returns:
	virtual void

Display the GUID with the following format:  
 
         '00000000-0000-0000-0000-000000000000'") ShallowDump;
		virtual void ShallowDump (Standard_OStream & aStream);
		%feature("autodoc", "Args:
	aGuid(char *)

Returns:
	static Standard_Boolean

Check the format of a GUID string.  
         It checks the size, the position of the '-' and the correct size of fields.") CheckGUIDFormat;
		static Standard_Boolean CheckGUIDFormat (const char * aGuid);
		%feature("autodoc", "Args:
	Upper(Standard_Integer)

Returns:
	Standard_Integer

Hash function for GUID.") Hash;
		Standard_Integer Hash (const Standard_Integer Upper);
		%feature("autodoc", "Args:
	aguid(Standard_GUID)
	Upper(Standard_Integer)

Returns:
	static Standard_Integer

H method used by collections.") HashCode;
		static Standard_Integer HashCode (const Standard_GUID & aguid,const Standard_Integer Upper);
		%feature("autodoc", "Args:
	string1(Standard_GUID)
	string2(Standard_GUID)

Returns:
	static Standard_Boolean

Returns True  when the two GUID are the same.") IsEqual;
		static Standard_Boolean IsEqual (const Standard_GUID & string1,const Standard_GUID & string2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") _CSFDB_GetStandard_GUIDmy32b;
		Standard_Integer _CSFDB_GetStandard_GUIDmy32b ();
		%feature("autodoc", "Args:
	p(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") _CSFDB_SetStandard_GUIDmy32b;
		void _CSFDB_SetStandard_GUIDmy32b (const Standard_Integer p);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ExtCharacter

No detailed docstring for this function.") _CSFDB_GetStandard_GUIDmy16b1;
		Standard_ExtCharacter _CSFDB_GetStandard_GUIDmy16b1 ();
		%feature("autodoc", "Args:
	p(Standard_ExtCharacter)

Returns:
	None

No detailed docstring for this function.") _CSFDB_SetStandard_GUIDmy16b1;
		void _CSFDB_SetStandard_GUIDmy16b1 (const Standard_ExtCharacter p);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ExtCharacter

No detailed docstring for this function.") _CSFDB_GetStandard_GUIDmy16b2;
		Standard_ExtCharacter _CSFDB_GetStandard_GUIDmy16b2 ();
		%feature("autodoc", "Args:
	p(Standard_ExtCharacter)

Returns:
	None

No detailed docstring for this function.") _CSFDB_SetStandard_GUIDmy16b2;
		void _CSFDB_SetStandard_GUIDmy16b2 (const Standard_ExtCharacter p);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ExtCharacter

No detailed docstring for this function.") _CSFDB_GetStandard_GUIDmy16b3;
		Standard_ExtCharacter _CSFDB_GetStandard_GUIDmy16b3 ();
		%feature("autodoc", "Args:
	p(Standard_ExtCharacter)

Returns:
	None

No detailed docstring for this function.") _CSFDB_SetStandard_GUIDmy16b3;
		void _CSFDB_SetStandard_GUIDmy16b3 (const Standard_ExtCharacter p);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Byte

No detailed docstring for this function.") _CSFDB_GetStandard_GUIDmy8b1;
		Standard_Byte _CSFDB_GetStandard_GUIDmy8b1 ();
		%feature("autodoc", "Args:
	p(Standard_Byte)

Returns:
	None

No detailed docstring for this function.") _CSFDB_SetStandard_GUIDmy8b1;
		void _CSFDB_SetStandard_GUIDmy8b1 (const Standard_Byte p);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Byte

No detailed docstring for this function.") _CSFDB_GetStandard_GUIDmy8b2;
		Standard_Byte _CSFDB_GetStandard_GUIDmy8b2 ();
		%feature("autodoc", "Args:
	p(Standard_Byte)

Returns:
	None

No detailed docstring for this function.") _CSFDB_SetStandard_GUIDmy8b2;
		void _CSFDB_SetStandard_GUIDmy8b2 (const Standard_Byte p);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Byte

No detailed docstring for this function.") _CSFDB_GetStandard_GUIDmy8b3;
		Standard_Byte _CSFDB_GetStandard_GUIDmy8b3 ();
		%feature("autodoc", "Args:
	p(Standard_Byte)

Returns:
	None

No detailed docstring for this function.") _CSFDB_SetStandard_GUIDmy8b3;
		void _CSFDB_SetStandard_GUIDmy8b3 (const Standard_Byte p);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Byte

No detailed docstring for this function.") _CSFDB_GetStandard_GUIDmy8b4;
		Standard_Byte _CSFDB_GetStandard_GUIDmy8b4 ();
		%feature("autodoc", "Args:
	p(Standard_Byte)

Returns:
	None

No detailed docstring for this function.") _CSFDB_SetStandard_GUIDmy8b4;
		void _CSFDB_SetStandard_GUIDmy8b4 (const Standard_Byte p);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Byte

No detailed docstring for this function.") _CSFDB_GetStandard_GUIDmy8b5;
		Standard_Byte _CSFDB_GetStandard_GUIDmy8b5 ();
		%feature("autodoc", "Args:
	p(Standard_Byte)

Returns:
	None

No detailed docstring for this function.") _CSFDB_SetStandard_GUIDmy8b5;
		void _CSFDB_SetStandard_GUIDmy8b5 (const Standard_Byte p);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Byte

No detailed docstring for this function.") _CSFDB_GetStandard_GUIDmy8b6;
		Standard_Byte _CSFDB_GetStandard_GUIDmy8b6 ();
		%feature("autodoc", "Args:
	p(Standard_Byte)

Returns:
	None

No detailed docstring for this function.") _CSFDB_SetStandard_GUIDmy8b6;
		void _CSFDB_SetStandard_GUIDmy8b6 (const Standard_Byte p);
};


%feature("shadow") Standard_GUID::~Standard_GUID %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Standard_GUID {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Standard_MMgrRoot;
class Standard_MMgrRoot {
	public:
		%feature("autodoc", "Args:
	theSize(Standard_Size)

Returns:
	virtual Standard_Address

Allocate specified number of bytes.
The actually allocated space should be rounded up to 
double word size (4 bytes), as this is expected by implementation 
of some classes in OCC (e.g. TCollection_AsciiString)") Allocate;
		virtual Standard_Address Allocate (const Standard_Size theSize);
		%feature("autodoc", "Args:
	thePtr(Standard_Address)
	theSize(Standard_Size)

Returns:
	virtual Standard_Address

Reallocate previously allocated memory to contain at least theSize bytes.
In case of success, new pointer is returned.") Reallocate;
		virtual Standard_Address Reallocate (Standard_Address thePtr,const Standard_Size theSize);
		%feature("autodoc", "Args:
	thePtr(Standard_Address)

Returns:
	virtual void

Frees previously allocated memory at specified address.") Free;
		virtual void Free (Standard_Address thePtr);
		%feature("autodoc", "Args:
	isDestroyed(Standard_Boolean)=Standard_False

Returns:
	virtual Standard_Integer

Purge internally cached unused memory blocks (if any) 
by releasing them to the operating system.
Must return non-zero if some memory has been actually released, 
or zero otherwise.

If option isDestroyed is True, this means that memory 
manager is not expected to be used any more; note however 
that in general case it is still possible to have calls to that 
instance of memory manager after this (e.g. to free memory
of static objects in OCC). Thus this option should 
command the memory manager to release any cached memory
to the system and not cache any more, but still remain operable...
//!
Default implementation does nothing and returns 0.") Purge;
		virtual Standard_Integer Purge (Standard_Boolean isDestroyed = Standard_False);
};


%feature("shadow") Standard_MMgrRoot::~Standard_MMgrRoot %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Standard_MMgrRoot {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Standard_Static_Assert<true>;
class Standard_Static_Assert<true> {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	static void

No detailed docstring for this function.") assert_ok;
		static void assert_ok ();
};


%feature("shadow") Standard_Static_Assert<true>::~Standard_Static_Assert<true> %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Standard_Static_Assert<true> {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Standard_Storable;
class Standard_Storable {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Delete;
		virtual void Delete ();
		%feature("autodoc", "Args:
	Upper(Standard_Integer)

Returns:
	virtual Standard_Integer

Returns a hashed value denoting <self>. This value is in  
        the range 1..<Upper>.") HashCode;
		virtual Standard_Integer HashCode (const Standard_Integer Upper);
		%feature("autodoc", "Args:
	Other(Standard_Storable)

Returns:
	Standard_Boolean

Returns true if the direct contents of <self> and  
        <Other> are memberwise equal.") IsEqual;
		Standard_Boolean IsEqual (const Standard_Storable & Other);
		%feature("autodoc", "Args:
	Other(Standard_Storable)

Returns:
	Standard_Boolean

No detailed docstring for this function.") operator==;
		Standard_Boolean operator == (const Standard_Storable & Other);
		%feature("autodoc", "Args:
	Other(Standard_Storable)

Returns:
	Standard_Boolean

Returns true if the Deep contents of <self> and  
        <Other> are memberwise equal.") IsSimilar;
		Standard_Boolean IsSimilar (const Standard_Storable & Other);
		%feature("autodoc", "Args:
	S(Standard_OStream)

Returns:
	virtual void

Prints the contents at the first level of <self> on  
        the stream <s>. The Root version of ShallowDump prints  
        the name of the class <self> is instance of, followed by  
        its memory address.") ShallowDump;
		virtual void ShallowDump (Standard_OStream & S);
};


%feature("shadow") Standard_Storable::~Standard_Storable %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Standard_Storable {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Standard_Transient;
class Standard_Transient {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") Standard_Transient;
		 Standard_Transient ();
		%feature("autodoc", "Args:
	&(Standard_Transient)

Returns:
	None

Copy constructor -- does nothing") Standard_Transient;
		 Standard_Transient (const Standard_Transient &);
		%feature("autodoc", "Args:
	&(Standard_Transient)

Returns:
	Standard_Transient

Assignment operator, needed to avoid copying reference counter") operator=;
		Standard_Transient & operator = (const Standard_Transient &);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Memory deallocator for transient classes") Delete;
		virtual void Delete ();
		%feature("autodoc", "Args:
	&(Standard_OStream)

Returns:
	virtual void

No detailed docstring for this function.") ShallowDump;
		virtual void ShallowDump (Standard_OStream &);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_Standard_Type

Returns a type information object about this object.") DynamicType;
		virtual const Handle_Standard_Type & DynamicType ();
		%feature("autodoc", "Args:
	theType(Handle_Standard_Type)

Returns:
	Standard_Boolean

Returns a true value if this is an instance of Type.") IsInstance;
		Standard_Boolean IsInstance (const Handle_Standard_Type & theType);
		%feature("autodoc", "Args:
	theTypeName(char *)

Returns:
	Standard_Boolean

Returns a true value if this is an instance of TypeName.") IsInstance;
		Standard_Boolean IsInstance (const char * theTypeName);
		%feature("autodoc", "Args:
	theType(Handle_Standard_Type)

Returns:
	Standard_Boolean

Returns true if this is an instance of Type or an
instance of any class that inherits from Type.
Note that multiple inheritance is not supported by OCCT RTTI mechanism.") IsKind;
		Standard_Boolean IsKind (const Handle_Standard_Type & theType);
		%feature("autodoc", "Args:
	theTypeName(char *)

Returns:
	Standard_Boolean

Returns true if this is an instance of TypeName or an
instance of any class that inherits from TypeName.
Note that multiple inheritance is not supported by OCCT RTTI mechanism.") IsKind;
		Standard_Boolean IsKind (const char * theTypeName);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Standard_Transient

Returns a Handle which references this object.
Must never be called to objects created in stack.") This;
		virtual Handle_Standard_Transient This ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Get the reference counter of this object.") GetRefCount;
		Standard_Integer GetRefCount ();
};


%feature("shadow") Standard_Transient::~Standard_Transient %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Standard_Transient {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Standard_Transient {
	Handle_Standard_Transient GetHandle() {
	return *(Handle_Standard_Transient*) &$self;
	}
};

%nodefaultctor Handle_Standard_Transient;
class Handle_Standard_Transient {

    public:
        // constructors
        Handle_Standard_Transient();
        Handle_Standard_Transient(const Handle_Standard_Transient &aHandle);
        Handle_Standard_Transient(const Standard_Transient *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Standard_Transient DownCast(const Handle_Standard_Transient &AnObject);

        %extend{
            bool __eq_wrapper__(const Handle_Standard_Transient &right) {
                if (*self==right) return true;
                else return false;
            }
        }
        %extend{
            bool __eq_wrapper__(const Standard_Transient *right) {
                if (*self==right) return true;
                else return false;
            }
        }
        %extend{
            bool __ne_wrapper__(const Handle_Standard_Transient &right) {
                if (*self!=right) return true;
                else return false;
            }
        }
        %extend{
            bool __ne_wrapper__(const Standard_Transient *right) {
                if (*self!=right) return true;
                else return false;
            }
        }
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();
            }
        }
        %pythoncode {
        def __eq__(self,right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        %pythoncode {
        def __ne__(self,right):
            try:
                return self.__ne_wrapper__(right)
            except:
                return True
        }

};
%extend Handle_Standard_Transient {
    Standard_Transient* GetObject() {
    return (Standard_Transient*)$self->Access();
    }
};
%feature("shadow") Handle_Standard_Transient::~Handle_Standard_Transient %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Standard_Transient {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Standard_MMgrOpt;
class Standard_MMgrOpt : public Standard_MMgrRoot {
	public:
		%feature("autodoc", "Args:
	aClear(Standard_Boolean)=Standard_True
	aMMap(Standard_Boolean)=Standard_True
	aCellSize(Standard_Size)=200
	aNbPages(Standard_Integer)=10000
	aThreshold(Standard_Size)=40000

Returns:
	None

Constructor. If aClear is True, the allocated emmory will be 
nullified. For description of other parameters, see description 
of the class above.") Standard_MMgrOpt;
		 Standard_MMgrOpt (const Standard_Boolean aClear = Standard_True,const Standard_Boolean aMMap = Standard_True,const Standard_Size aCellSize = 200,const Standard_Integer aNbPages = 10000,const Standard_Size aThreshold = 40000);
		%feature("autodoc", "Args:
	aSize(Standard_Size)

Returns:
	virtual Standard_Address

Allocate aSize bytes; see class description above") Allocate;
		virtual Standard_Address Allocate (const Standard_Size aSize);
		%feature("autodoc", "Args:
	thePtr(Standard_Address)
	theSize(Standard_Size)

Returns:
	virtual Standard_Address

Reallocate previously allocated aPtr to a new size; new address is returned.
In case that aPtr is null, the function behaves exactly as Allocate.") Reallocate;
		virtual Standard_Address Reallocate (Standard_Address thePtr,const Standard_Size theSize);
		%feature("autodoc", "Args:
	thePtr(Standard_Address)

Returns:
	virtual void

Free previously allocated block.
Note that block can not all blocks are released to the OS by this 
method (see class description)") Free;
		virtual void Free (Standard_Address thePtr);
		%feature("autodoc", "Args:
	isDestroyed(Standard_Boolean)

Returns:
	virtual Standard_Integer

Release medium-sized blocks of memory in free lists to the system.
Returns number of actually freed blocks") Purge;
		virtual Standard_Integer Purge (Standard_Boolean isDestroyed);
};


%feature("shadow") Standard_MMgrOpt::~Standard_MMgrOpt %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Standard_MMgrOpt {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Standard_MMgrRaw;
class Standard_MMgrRaw : public Standard_MMgrRoot {
	public:
		%feature("autodoc", "Args:
	aClear(Standard_Boolean)=Standard_False

Returns:
	None

Constructor; if aClear is True, the memory will be nullified
upon allocation.") Standard_MMgrRaw;
		 Standard_MMgrRaw (const Standard_Boolean aClear = Standard_False);
		%feature("autodoc", "Args:
	aSize(Standard_Size)

Returns:
	virtual Standard_Address

Allocate aSize bytes") Allocate;
		virtual Standard_Address Allocate (const Standard_Size aSize);
		%feature("autodoc", "Args:
	thePtr(Standard_Address)
	theSize(Standard_Size)

Returns:
	virtual Standard_Address

Reallocate aPtr to the size aSize. 
The new pointer is returned.") Reallocate;
		virtual Standard_Address Reallocate (Standard_Address thePtr,const Standard_Size theSize);
		%feature("autodoc", "Args:
	thePtr(Standard_Address)

Returns:
	virtual void

Free allocated memory. The pointer is nullified.") Free;
		virtual void Free (Standard_Address thePtr);
};


%feature("shadow") Standard_MMgrRaw::~Standard_MMgrRaw %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Standard_MMgrRaw {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Standard_MMgrTBBalloc;
class Standard_MMgrTBBalloc : public Standard_MMgrRoot {
	public:
		%feature("autodoc", "Args:
	aClear(Standard_Boolean)=Standard_False

Returns:
	None

Constructor; if aClear is True, the memory will be nullified
upon allocation.") Standard_MMgrTBBalloc;
		 Standard_MMgrTBBalloc (const Standard_Boolean aClear = Standard_False);
		%feature("autodoc", "Args:
	aSize(Standard_Size)

Returns:
	virtual Standard_Address

Allocate aSize bytes") Allocate;
		virtual Standard_Address Allocate (const Standard_Size aSize);
		%feature("autodoc", "Args:
	thePtr(Standard_Address)
	theSize(Standard_Size)

Returns:
	virtual Standard_Address

Reallocate aPtr to the size aSize. 
The new pointer is returned.") Reallocate;
		virtual Standard_Address Reallocate (Standard_Address thePtr,const Standard_Size theSize);
		%feature("autodoc", "Args:
	thePtr(Standard_Address)

Returns:
	virtual void

Free allocated memory") Free;
		virtual void Free (Standard_Address thePtr);
};


%feature("shadow") Standard_MMgrTBBalloc::~Standard_MMgrTBBalloc %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Standard_MMgrTBBalloc {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Standard_Mutex;
class Standard_Mutex : public Standard_ErrorHandlerCallback {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructor: creates a mutex object and initializes it.
It is strongly recommended that mutexes were created as 
static objects whenever possible.") Standard_Mutex;
		 Standard_Mutex ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Method to lock the mutex; waits until the mutex is released
by other threads, locks it and then returns") Lock;
		void Lock ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Method to test the mutex; if the mutex is not hold by other thread,
locks it and returns True; otherwise returns False without waiting
mutex to be released.") TryLock;
		Standard_Boolean TryLock ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Method to unlock the mutex; releases it to other users") Unlock;
		void Unlock ();
};


%feature("shadow") Standard_Mutex::~Standard_Mutex %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Standard_Mutex {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Standard_Type;
class Standard_Type : public Standard_Transient {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns the type name of <self>.") Name;
		char * Name ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the size of <self> in bytes.") Size;
		Standard_Integer Size ();
		%feature("autodoc", "Args:
	aName(char *)
	aSize(Standard_Integer)

Returns:
	None

The constructor for a imported type.") Standard_Type;
		 Standard_Type (const char * aName,const Standard_Integer aSize);
		%feature("autodoc", "Args:
	aName(char *)
	aSize(Standard_Integer)
	aNumberOfParent(Standard_Integer)
	aAncestors(Standard_Address)

Returns:
	None

The constructor for a primitive.") Standard_Type;
		 Standard_Type (const char * aName,const Standard_Integer aSize,const Standard_Integer aNumberOfParent,const Standard_Address aAncestors);
		%feature("autodoc", "Args:
	aName(char *)
	aSize(Standard_Integer)
	aNumberOfElement(Standard_Integer)
	aNumberOfParent(Standard_Integer)
	anAncestors(Standard_Address)
	aElements(Standard_Address)

Returns:
	None

The constructor for an enumeration.") Standard_Type;
		 Standard_Type (const char * aName,const Standard_Integer aSize,const Standard_Integer aNumberOfElement,const Standard_Integer aNumberOfParent,const Standard_Address anAncestors,const Standard_Address aElements);
		%feature("autodoc", "Args:
	aName(char *)
	aSize(Standard_Integer)
	aNumberOfParent(Standard_Integer)
	anAncestors(Standard_Address)
	aFields(Standard_Address)

Returns:
	None

The constructor for a class.") Standard_Type;
		 Standard_Type (const char * aName,const Standard_Integer aSize,const Standard_Integer aNumberOfParent,const Standard_Address anAncestors,const Standard_Address aFields);
		%feature("autodoc", "Args:
	aOther(Handle_Standard_Type)

Returns:
	Standard_Boolean

Returns 'True', if <self> is the same as <aOther>,  
  or inherits from <aOther>.  
  Note that multiple inheritance is not supported.") SubType;
		Standard_Boolean SubType (const Handle_Standard_Type & aOther);
		%feature("autodoc", "Args:
	theName(char *)

Returns:
	Standard_Boolean

Returns 'True', if <self> or one of its ancestors has the name  
  equal to theName.  
  Note that multiple inheritance is not supported.") SubType;
		Standard_Boolean SubType (const char * theName);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns 'True', if the type is imported.") IsImported;
		Standard_Boolean IsImported ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns 'True', if the type is a primitive.") IsPrimitive;
		Standard_Boolean IsPrimitive ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns 'True', if the type is an 'Enumeration'.") IsEnumeration;
		Standard_Boolean IsEnumeration ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns 'True', if the type is a 'Class'.") IsClass;
		Standard_Boolean IsClass ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of direct parents of the class.") NumberOfParent;
		Standard_Integer NumberOfParent ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of ancestors of the class.") NumberOfAncestor;
		Standard_Integer NumberOfAncestor ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Prints the Information about type.") ShallowDump;
		void ShallowDump ();
		%feature("autodoc", "Args:
	S(Standard_OStream)

Returns:
	None

Prints the Information about type.") ShallowDump;
		void ShallowDump (Standard_OStream & S);
		%feature("autodoc", "Args:
	s(Standard_OStream)

Returns:
	None

Prints on the stream <s> the name of Type.  
 Warning:  
  The operator 'OStream& operator<< (Standard_OStream&,  
                                     Handle_Standard_Type&)'  
  is implemented. (This operator uses the method Print)") Print;
		void Print (Standard_OStream & s);
};


%feature("shadow") Standard_Type::~Standard_Type %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Standard_Type {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Standard_Type {
	Handle_Standard_Type GetHandle() {
	return *(Handle_Standard_Type*) &$self;
	}
};

%nodefaultctor Handle_Standard_Type;
class Handle_Standard_Type : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_Standard_Type();
        Handle_Standard_Type(const Handle_Standard_Type &aHandle);
        Handle_Standard_Type(const Standard_Type *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Standard_Type DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Standard_Type {
    Standard_Type* GetObject() {
    return (Standard_Type*)$self->Access();
    }
};
%feature("shadow") Handle_Standard_Type::~Handle_Standard_Type %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Standard_Type {
    void _kill_pointed() {
        delete $self;
    }
};

