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
		%feature("autodoc", "	* Allocates memory blocks aSize - bytes to allocate

	:param aSize:
	:type aSize: Standard_Size
	:rtype: Standard_Address
") Allocate;
		static Standard_Address Allocate (const Standard_Size aSize);
		%feature("autodoc", "	* Reallocates memory blocks aStorage - previously allocated memory block aNewSize - new size in bytes

	:param aStorage:
	:type aStorage: Standard_Address
	:param aNewSize:
	:type aNewSize: Standard_Size
	:rtype: Standard_Address
") Reallocate;
		static Standard_Address Reallocate (const Standard_Address aStorage,const Standard_Size aNewSize);
		%feature("autodoc", "	* Deallocates the storage retained on the free list and clears the list. Returns non-zero if some memory has been actually freed.

	:rtype: int
") Purge;
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
		%feature("autodoc", "	* Create a ErrorHandler (to be used with try{}catch(){}). It uses the 'setjmp' and 'longjmp' routines.

	:rtype: None
") Standard_ErrorHandler;
		 Standard_ErrorHandler ();
		%feature("autodoc", "	* Unlinks and checks if there is a raised exception.

	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	* Removes handler from the handlers list

	:rtype: None
") Unlink;
		void Unlink ();
		%feature("autodoc", "	* Returns 'True' if the caught exception has the same type or inherits from 'aType'

	:param aType:
	:type aType: Handle_Standard_Type &
	:rtype: bool
") Catches;
		Standard_Boolean Catches (const Handle_Standard_Type & aType);
		%feature("autodoc", "	* Returns label for jump

	:rtype: Standard_JmpBuf
") Label;
		Standard_JmpBuf & Label ();
		%feature("autodoc", "	* Returns the current Error.

	:rtype: Handle_Standard_Failure
") Error;
		Handle_Standard_Failure Error ();
		%feature("autodoc", "	* Returns the caught exception.

	:rtype: Handle_Standard_Failure
") LastCaughtError;
		static Handle_Standard_Failure LastCaughtError ();
		%feature("autodoc", "	* Test if the code is currently running in a try block

	:rtype: bool
") IsInTryBlock;
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
		%feature("autodoc", "	* Registers this callback object in the current error handler (if found).

	:rtype: None
") RegisterCallback;
		void RegisterCallback ();
		%feature("autodoc", "	* Unregisters this callback object from the error handler.

	:rtype: None
") UnregisterCallback;
		void UnregisterCallback ();
		%feature("autodoc", "	* The callback function to perform necessary callback action. Called by the exception handler when it is being destroyed but still has this callback registered.

	:rtype: void
") DestroyCallback;
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
		%feature("autodoc", "	:rtype: None
") Standard_GUID;
		 Standard_GUID ();
		%feature("autodoc", "	* build a GUID from an ascii string with the following format: Length : 36 char '00000000-0000-0000-0000-000000000000'

	:param aGuid:
	:type aGuid: char *
	:rtype: None
") Standard_GUID;
		 Standard_GUID (const char * aGuid);
		%feature("autodoc", "	* build a GUID from an unicode string with the following format:  '00000000-0000-0000-0000-000000000000'

	:param aGuid:
	:type aGuid: Standard_ExtString
	:rtype: None
") Standard_GUID;
		 Standard_GUID (const Standard_ExtString aGuid);
		%feature("autodoc", "	:param a32b:
	:type a32b: Standard_Integer
	:param a16b1:
	:type a16b1: Standard_ExtCharacter
	:param a16b2:
	:type a16b2: Standard_ExtCharacter
	:param a16b3:
	:type a16b3: Standard_ExtCharacter
	:param a8b1:
	:type a8b1: Standard_Byte
	:param a8b2:
	:type a8b2: Standard_Byte
	:param a8b3:
	:type a8b3: Standard_Byte
	:param a8b4:
	:type a8b4: Standard_Byte
	:param a8b5:
	:type a8b5: Standard_Byte
	:param a8b6:
	:type a8b6: Standard_Byte
	:rtype: None
") Standard_GUID;
		 Standard_GUID (const Standard_Integer a32b,const Standard_ExtCharacter a16b1,const Standard_ExtCharacter a16b2,const Standard_ExtCharacter a16b3,const Standard_Byte a8b1,const Standard_Byte a8b2,const Standard_Byte a8b3,const Standard_Byte a8b4,const Standard_Byte a8b5,const Standard_Byte a8b6);
		%feature("autodoc", "	:param aGuid:
	:type aGuid: Standard_UUID &
	:rtype: None
") Standard_GUID;
		 Standard_GUID (const Standard_UUID & aGuid);
		%feature("autodoc", "	:param aGuid:
	:type aGuid: Standard_GUID &
	:rtype: None
") Standard_GUID;
		 Standard_GUID (const Standard_GUID & aGuid);
		%feature("autodoc", "	:rtype: Standard_UUID
") ToUUID;
		Standard_UUID ToUUID ();
		%feature("autodoc", "	* translate the GUID into ascii string the aStrGuid is allocated by user. the guid have the following format:  '00000000-0000-0000-0000-000000000000'

	:param aStrGuid:
	:type aStrGuid: Standard_PCharacter
	:rtype: None
") ToCString;
		void ToCString (const Standard_PCharacter aStrGuid);
		%feature("autodoc", "	* translate the GUID into unicode string the aStrGuid is allocated by user. the guid have the following format:  '00000000-0000-0000-0000-000000000000'

	:param aStrGuid:
	:type aStrGuid: Standard_PExtCharacter
	:rtype: None
") ToExtString;
		void ToExtString (const Standard_PExtCharacter aStrGuid);
		%feature("autodoc", "	:param uid:
	:type uid: Standard_GUID &
	:rtype: bool
") IsSame;
		Standard_Boolean IsSame (const Standard_GUID & uid);

        %extend{
            bool __eq_wrapper__(const Standard_GUID  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self,right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        		%feature("autodoc", "	:param uid:
	:type uid: Standard_GUID &
	:rtype: bool
") IsNotSame;
		Standard_Boolean IsNotSame (const Standard_GUID & uid);

        %extend{
            bool __ne_wrapper__(const Standard_GUID  other) {
            if (*self!=other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __ne__(self,right):
            try:
                return self.__ne_wrapper__(right)
            except:
                return True
        }
        		%feature("autodoc", "	:param uid:
	:type uid: Standard_GUID &
	:rtype: None
") Assign;
		void Assign (const Standard_GUID & uid);
		%feature("autodoc", "	:param uid:
	:type uid: Standard_GUID &
	:rtype: None
") operator=;
		void operator = (const Standard_GUID & uid);
		%feature("autodoc", "	:param uid:
	:type uid: Standard_UUID &
	:rtype: None
") Assign;
		void Assign (const Standard_UUID & uid);
		%feature("autodoc", "	:param uid:
	:type uid: Standard_UUID &
	:rtype: None
") operator=;
		void operator = (const Standard_UUID & uid);

        %feature("autodoc", "1");
        %extend{
            std::string ShallowDumpToString() {
            std::stringstream s;
            self->ShallowDump(s);
            return s.str();}
        };
        		%feature("autodoc", "	* Check the format of a GUID string. It checks the size, the position of the '-' and the correct size of fields.

	:param aGuid:
	:type aGuid: char *
	:rtype: bool
") CheckGUIDFormat;
		static Standard_Boolean CheckGUIDFormat (const char * aGuid);
		%feature("autodoc", "	* Hash function for GUID.

	:param Upper:
	:type Upper: Standard_Integer
	:rtype: int
") Hash;
		Standard_Integer Hash (const Standard_Integer Upper);
		%feature("autodoc", "	* H method used by collections.

	:param aguid:
	:type aguid: Standard_GUID &
	:param Upper:
	:type Upper: Standard_Integer
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const Standard_GUID & aguid,const Standard_Integer Upper);
		%feature("autodoc", "	* Returns True when the two GUID are the same.

	:param string1:
	:type string1: Standard_GUID &
	:param string2:
	:type string2: Standard_GUID &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const Standard_GUID & string1,const Standard_GUID & string2);
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetStandard_GUIDmy32b;
		Standard_Integer _CSFDB_GetStandard_GUIDmy32b ();
		%feature("autodoc", "	:param p:
	:type p: Standard_Integer
	:rtype: None
") _CSFDB_SetStandard_GUIDmy32b;
		void _CSFDB_SetStandard_GUIDmy32b (const Standard_Integer p);
		%feature("autodoc", "	:rtype: Standard_ExtCharacter
") _CSFDB_GetStandard_GUIDmy16b1;
		Standard_ExtCharacter _CSFDB_GetStandard_GUIDmy16b1 ();
		%feature("autodoc", "	:param p:
	:type p: Standard_ExtCharacter
	:rtype: None
") _CSFDB_SetStandard_GUIDmy16b1;
		void _CSFDB_SetStandard_GUIDmy16b1 (const Standard_ExtCharacter p);
		%feature("autodoc", "	:rtype: Standard_ExtCharacter
") _CSFDB_GetStandard_GUIDmy16b2;
		Standard_ExtCharacter _CSFDB_GetStandard_GUIDmy16b2 ();
		%feature("autodoc", "	:param p:
	:type p: Standard_ExtCharacter
	:rtype: None
") _CSFDB_SetStandard_GUIDmy16b2;
		void _CSFDB_SetStandard_GUIDmy16b2 (const Standard_ExtCharacter p);
		%feature("autodoc", "	:rtype: Standard_ExtCharacter
") _CSFDB_GetStandard_GUIDmy16b3;
		Standard_ExtCharacter _CSFDB_GetStandard_GUIDmy16b3 ();
		%feature("autodoc", "	:param p:
	:type p: Standard_ExtCharacter
	:rtype: None
") _CSFDB_SetStandard_GUIDmy16b3;
		void _CSFDB_SetStandard_GUIDmy16b3 (const Standard_ExtCharacter p);
		%feature("autodoc", "	:rtype: Standard_Byte
") _CSFDB_GetStandard_GUIDmy8b1;
		Standard_Byte _CSFDB_GetStandard_GUIDmy8b1 ();
		%feature("autodoc", "	:param p:
	:type p: Standard_Byte
	:rtype: None
") _CSFDB_SetStandard_GUIDmy8b1;
		void _CSFDB_SetStandard_GUIDmy8b1 (const Standard_Byte p);
		%feature("autodoc", "	:rtype: Standard_Byte
") _CSFDB_GetStandard_GUIDmy8b2;
		Standard_Byte _CSFDB_GetStandard_GUIDmy8b2 ();
		%feature("autodoc", "	:param p:
	:type p: Standard_Byte
	:rtype: None
") _CSFDB_SetStandard_GUIDmy8b2;
		void _CSFDB_SetStandard_GUIDmy8b2 (const Standard_Byte p);
		%feature("autodoc", "	:rtype: Standard_Byte
") _CSFDB_GetStandard_GUIDmy8b3;
		Standard_Byte _CSFDB_GetStandard_GUIDmy8b3 ();
		%feature("autodoc", "	:param p:
	:type p: Standard_Byte
	:rtype: None
") _CSFDB_SetStandard_GUIDmy8b3;
		void _CSFDB_SetStandard_GUIDmy8b3 (const Standard_Byte p);
		%feature("autodoc", "	:rtype: Standard_Byte
") _CSFDB_GetStandard_GUIDmy8b4;
		Standard_Byte _CSFDB_GetStandard_GUIDmy8b4 ();
		%feature("autodoc", "	:param p:
	:type p: Standard_Byte
	:rtype: None
") _CSFDB_SetStandard_GUIDmy8b4;
		void _CSFDB_SetStandard_GUIDmy8b4 (const Standard_Byte p);
		%feature("autodoc", "	:rtype: Standard_Byte
") _CSFDB_GetStandard_GUIDmy8b5;
		Standard_Byte _CSFDB_GetStandard_GUIDmy8b5 ();
		%feature("autodoc", "	:param p:
	:type p: Standard_Byte
	:rtype: None
") _CSFDB_SetStandard_GUIDmy8b5;
		void _CSFDB_SetStandard_GUIDmy8b5 (const Standard_Byte p);
		%feature("autodoc", "	:rtype: Standard_Byte
") _CSFDB_GetStandard_GUIDmy8b6;
		Standard_Byte _CSFDB_GetStandard_GUIDmy8b6 ();
		%feature("autodoc", "	:param p:
	:type p: Standard_Byte
	:rtype: None
") _CSFDB_SetStandard_GUIDmy8b6;
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
		%feature("autodoc", "	* Allocate specified number of bytes. The actually allocated space should be rounded up to double word size (4 bytes), as this is expected by implementation of some classes in OCC (e.g. TCollection_AsciiString)

	:param theSize:
	:type theSize: Standard_Size
	:rtype: Standard_Address
") Allocate;
		virtual Standard_Address Allocate (const Standard_Size theSize);
		%feature("autodoc", "	* Reallocate previously allocated memory to contain at least theSize bytes. In case of success, new pointer is returned.

	:param thePtr:
	:type thePtr: Standard_Address
	:param theSize:
	:type theSize: Standard_Size
	:rtype: Standard_Address
") Reallocate;
		virtual Standard_Address Reallocate (Standard_Address thePtr,const Standard_Size theSize);
		%feature("autodoc", "	* Frees previously allocated memory at specified address.

	:param thePtr:
	:type thePtr: Standard_Address
	:rtype: void
") Free;
		virtual void Free (Standard_Address thePtr);
		%feature("autodoc", "	* Purge internally cached unused memory blocks (if any) by releasing them to the operating system. Must return non-zero if some memory has been actually released, or zero otherwise. If option isDestroyed is True, this means that memory manager is not expected to be used any more; note however that in general case it is still possible to have calls to that instance of memory manager after this (e.g. to free memory of static objects in OCC). Thus this option should command the memory manager to release any cached memory to the system and not cache any more, but still remain operable... //! Default implementation does nothing and returns 0.

	:param isDestroyed: default value is Standard_False
	:type isDestroyed: bool
	:rtype: int
") Purge;
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
		%feature("autodoc", "	:rtype: void
") assert_ok;
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
		%feature("autodoc", "	:rtype: void
") Delete;
		virtual void Delete ();
		%feature("autodoc", "	* Returns a hashed value denoting <self>. This value is in  the range 1..<Upper>.

	:param Upper:
	:type Upper: Standard_Integer
	:rtype: int
") HashCode;
		virtual Standard_Integer HashCode (const Standard_Integer Upper);

        %extend {
            Standard_Integer __hash__() {
            return $self->HashCode(2147483647);
            }
        };
        		%feature("autodoc", "	* Returns true if the direct contents of <self> and  <Other> are memberwise equal.

	:param Other:
	:type Other: Standard_Storable &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const Standard_Storable & Other);

        %extend{
            bool __eq_wrapper__(const Standard_Storable  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self,right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        		%feature("autodoc", "	* Returns true if the Deep contents of <self> and  <Other> are memberwise equal.

	:param Other:
	:type Other: Standard_Storable &
	:rtype: bool
") IsSimilar;
		Standard_Boolean IsSimilar (const Standard_Storable & Other);

        %feature("autodoc", "1");
        %extend{
            std::string ShallowDumpToString() {
            std::stringstream s;
            self->ShallowDump(s);
            return s.str();}
        };
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
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") Standard_Transient;
		 Standard_Transient ();
		%feature("autodoc", "	* Copy constructor -- does nothing

	:param &:
	:type &: Standard_Transient
	:rtype: None
") Standard_Transient;
		 Standard_Transient (const Standard_Transient &);
		%feature("autodoc", "	* Assignment operator, needed to avoid copying reference counter

	:param &:
	:type &: Standard_Transient
	:rtype: Standard_Transient
") operator=;
		Standard_Transient & operator = (const Standard_Transient &);
		%feature("autodoc", "	* Memory deallocator for transient classes

	:rtype: void
") Delete;
		virtual void Delete ();

        %feature("autodoc", "1");
        %extend{
            std::string ShallowDumpToString() {
            std::stringstream s;
            self->ShallowDump(s);
            return s.str();}
        };
        		%feature("autodoc", "	* Returns a type information object about this object.

	:rtype: Handle_Standard_Type
") DynamicType;
		virtual const Handle_Standard_Type & DynamicType ();
		%feature("autodoc", "	* Returns a true value if this is an instance of Type.

	:param theType:
	:type theType: Handle_Standard_Type &
	:rtype: bool
") IsInstance;
		Standard_Boolean IsInstance (const Handle_Standard_Type & theType);
		%feature("autodoc", "	* Returns a true value if this is an instance of TypeName.

	:param theTypeName:
	:type theTypeName: char *
	:rtype: bool
") IsInstance;
		Standard_Boolean IsInstance (const char * theTypeName);
		%feature("autodoc", "	* Returns true if this is an instance of Type or an instance of any class that inherits from Type. Note that multiple inheritance is not supported by OCCT RTTI mechanism.

	:param theType:
	:type theType: Handle_Standard_Type &
	:rtype: bool
") IsKind;
		Standard_Boolean IsKind (const Handle_Standard_Type & theType);
		%feature("autodoc", "	* Returns true if this is an instance of TypeName or an instance of any class that inherits from TypeName. Note that multiple inheritance is not supported by OCCT RTTI mechanism.

	:param theTypeName:
	:type theTypeName: char *
	:rtype: bool
") IsKind;
		Standard_Boolean IsKind (const char * theTypeName);
		%feature("autodoc", "	* Returns a Handle which references this object. Must never be called to objects created in stack.

	:rtype: Handle_Standard_Transient
") This;
		virtual Handle_Standard_Transient This ();
		%feature("autodoc", "	* Get the reference counter of this object.

	:rtype: int
") GetRefCount;
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
		%feature("autodoc", "	* Constructor. If aClear is True, the allocated emmory will be nullified. For description of other parameters, see description of the class above.

	:param aClear: default value is Standard_True
	:type aClear: bool
	:param aMMap: default value is Standard_True
	:type aMMap: bool
	:param aCellSize: default value is 200
	:type aCellSize: Standard_Size
	:param aNbPages: default value is 10000
	:type aNbPages: Standard_Integer
	:param aThreshold: default value is 40000
	:type aThreshold: Standard_Size
	:rtype: None
") Standard_MMgrOpt;
		 Standard_MMgrOpt (const Standard_Boolean aClear = Standard_True,const Standard_Boolean aMMap = Standard_True,const Standard_Size aCellSize = 200,const Standard_Integer aNbPages = 10000,const Standard_Size aThreshold = 40000);
		%feature("autodoc", "	* Allocate aSize bytes; see class description above

	:param aSize:
	:type aSize: Standard_Size
	:rtype: Standard_Address
") Allocate;
		virtual Standard_Address Allocate (const Standard_Size aSize);
		%feature("autodoc", "	* Reallocate previously allocated aPtr to a new size; new address is returned. In case that aPtr is null, the function behaves exactly as Allocate.

	:param thePtr:
	:type thePtr: Standard_Address
	:param theSize:
	:type theSize: Standard_Size
	:rtype: Standard_Address
") Reallocate;
		virtual Standard_Address Reallocate (Standard_Address thePtr,const Standard_Size theSize);
		%feature("autodoc", "	* Free previously allocated block. Note that block can not all blocks are released to the OS by this method (see class description)

	:param thePtr:
	:type thePtr: Standard_Address
	:rtype: void
") Free;
		virtual void Free (Standard_Address thePtr);
		%feature("autodoc", "	* Release medium-sized blocks of memory in free lists to the system. Returns number of actually freed blocks

	:param isDestroyed:
	:type isDestroyed: bool
	:rtype: int
") Purge;
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
		%feature("autodoc", "	* Constructor; if aClear is True, the memory will be nullified upon allocation.

	:param aClear: default value is Standard_False
	:type aClear: bool
	:rtype: None
") Standard_MMgrRaw;
		 Standard_MMgrRaw (const Standard_Boolean aClear = Standard_False);
		%feature("autodoc", "	* Allocate aSize bytes

	:param aSize:
	:type aSize: Standard_Size
	:rtype: Standard_Address
") Allocate;
		virtual Standard_Address Allocate (const Standard_Size aSize);
		%feature("autodoc", "	* Reallocate aPtr to the size aSize. The new pointer is returned.

	:param thePtr:
	:type thePtr: Standard_Address
	:param theSize:
	:type theSize: Standard_Size
	:rtype: Standard_Address
") Reallocate;
		virtual Standard_Address Reallocate (Standard_Address thePtr,const Standard_Size theSize);
		%feature("autodoc", "	* Free allocated memory. The pointer is nullified.

	:param thePtr:
	:type thePtr: Standard_Address
	:rtype: void
") Free;
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
		%feature("autodoc", "	* Constructor; if aClear is True, the memory will be nullified upon allocation.

	:param aClear: default value is Standard_False
	:type aClear: bool
	:rtype: None
") Standard_MMgrTBBalloc;
		 Standard_MMgrTBBalloc (const Standard_Boolean aClear = Standard_False);
		%feature("autodoc", "	* Allocate aSize bytes

	:param aSize:
	:type aSize: Standard_Size
	:rtype: Standard_Address
") Allocate;
		virtual Standard_Address Allocate (const Standard_Size aSize);
		%feature("autodoc", "	* Reallocate aPtr to the size aSize. The new pointer is returned.

	:param thePtr:
	:type thePtr: Standard_Address
	:param theSize:
	:type theSize: Standard_Size
	:rtype: Standard_Address
") Reallocate;
		virtual Standard_Address Reallocate (Standard_Address thePtr,const Standard_Size theSize);
		%feature("autodoc", "	* Free allocated memory

	:param thePtr:
	:type thePtr: Standard_Address
	:rtype: void
") Free;
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
		%feature("autodoc", "	* Constructor: creates a mutex object and initializes it. It is strongly recommended that mutexes were created as static objects whenever possible.

	:rtype: None
") Standard_Mutex;
		 Standard_Mutex ();
		%feature("autodoc", "	* Method to lock the mutex; waits until the mutex is released by other threads, locks it and then returns

	:rtype: None
") Lock;
		void Lock ();
		%feature("autodoc", "	* Method to test the mutex; if the mutex is not hold by other thread, locks it and returns True; otherwise returns False without waiting mutex to be released.

	:rtype: bool
") TryLock;
		Standard_Boolean TryLock ();
		%feature("autodoc", "	* Method to unlock the mutex; releases it to other users

	:rtype: None
") Unlock;
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
		%feature("autodoc", "	* Returns the type name of <self>.

	:rtype: char *
") Name;
		char * Name ();
		%feature("autodoc", "	* Returns the size of <self> in bytes.

	:rtype: int
") Size;
		Standard_Integer Size ();
		%feature("autodoc", "	* The constructor for a imported type.

	:param aName:
	:type aName: char *
	:param aSize:
	:type aSize: Standard_Integer
	:rtype: None
") Standard_Type;
		 Standard_Type (const char * aName,const Standard_Integer aSize);
		%feature("autodoc", "	* The constructor for a primitive.

	:param aName:
	:type aName: char *
	:param aSize:
	:type aSize: Standard_Integer
	:param aNumberOfParent:
	:type aNumberOfParent: Standard_Integer
	:param aAncestors:
	:type aAncestors: Standard_Address
	:rtype: None
") Standard_Type;
		 Standard_Type (const char * aName,const Standard_Integer aSize,const Standard_Integer aNumberOfParent,const Standard_Address aAncestors);
		%feature("autodoc", "	* The constructor for an enumeration.

	:param aName:
	:type aName: char *
	:param aSize:
	:type aSize: Standard_Integer
	:param aNumberOfElement:
	:type aNumberOfElement: Standard_Integer
	:param aNumberOfParent:
	:type aNumberOfParent: Standard_Integer
	:param anAncestors:
	:type anAncestors: Standard_Address
	:param aElements:
	:type aElements: Standard_Address
	:rtype: None
") Standard_Type;
		 Standard_Type (const char * aName,const Standard_Integer aSize,const Standard_Integer aNumberOfElement,const Standard_Integer aNumberOfParent,const Standard_Address anAncestors,const Standard_Address aElements);
		%feature("autodoc", "	* The constructor for a class.

	:param aName:
	:type aName: char *
	:param aSize:
	:type aSize: Standard_Integer
	:param aNumberOfParent:
	:type aNumberOfParent: Standard_Integer
	:param anAncestors:
	:type anAncestors: Standard_Address
	:param aFields:
	:type aFields: Standard_Address
	:rtype: None
") Standard_Type;
		 Standard_Type (const char * aName,const Standard_Integer aSize,const Standard_Integer aNumberOfParent,const Standard_Address anAncestors,const Standard_Address aFields);
		%feature("autodoc", "	* Returns 'True', if <self> is the same as <aOther>, or inherits from <aOther>. Note that multiple inheritance is not supported.

	:param aOther:
	:type aOther: Handle_Standard_Type &
	:rtype: bool
") SubType;
		Standard_Boolean SubType (const Handle_Standard_Type & aOther);
		%feature("autodoc", "	* Returns 'True', if <self> or one of its ancestors has the name equal to theName. Note that multiple inheritance is not supported.

	:param theName:
	:type theName: char *
	:rtype: bool
") SubType;
		Standard_Boolean SubType (const char * theName);
		%feature("autodoc", "	* Returns 'True', if the type is imported.

	:rtype: bool
") IsImported;
		Standard_Boolean IsImported ();
		%feature("autodoc", "	* Returns 'True', if the type is a primitive.

	:rtype: bool
") IsPrimitive;
		Standard_Boolean IsPrimitive ();
		%feature("autodoc", "	* Returns 'True', if the type is an 'Enumeration'.

	:rtype: bool
") IsEnumeration;
		Standard_Boolean IsEnumeration ();
		%feature("autodoc", "	* Returns 'True', if the type is a 'Class'.

	:rtype: bool
") IsClass;
		Standard_Boolean IsClass ();
		%feature("autodoc", "	* Returns the number of direct parents of the class.

	:rtype: int
") NumberOfParent;
		Standard_Integer NumberOfParent ();
		%feature("autodoc", "	* Returns the number of ancestors of the class.

	:rtype: int
") NumberOfAncestor;
		Standard_Integer NumberOfAncestor ();
		%feature("autodoc", "	* Prints the Information about type.

	:rtype: None
") ShallowDump;
		void ShallowDump ();

        %feature("autodoc", "1");
        %extend{
            std::string ShallowDumpToString() {
            std::stringstream s;
            self->ShallowDump(s);
            return s.str();}
        };
        
        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
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

