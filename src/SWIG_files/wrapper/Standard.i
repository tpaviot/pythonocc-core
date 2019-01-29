/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)


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
%define STANDARDDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=STANDARDDOCSTRING) Standard

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i
%include ../common/OccHandle.i


%include Standard_headers.i

/* templates */
/* end templates declaration */


/* typedefs */
typedef Standard_Character * Standard_PCharacter;
typedef Standard_ErrorHandler * Standard_PErrorHandler;
typedef GUID Standard_UUID;
typedef std::istream Standard_IStream;
typedef std::stringstream Standard_SStream;
typedef Standard_ExtCharacter * Standard_PExtCharacter;
typedef std::ostream Standard_OStream;
typedef Standard_Byte * Standard_PByte;
typedef int Standard_Integer;
typedef double Standard_Real;
typedef bool Standard_Boolean;
typedef float Standard_ShortReal;
typedef char Standard_Character;
typedef unsigned char Standard_Byte;
typedef void * Standard_Address;
typedef size_t Standard_Size;
typedef std::time_t Standard_Time;
typedef char Standard_Utf8Char;
typedef unsigned char Standard_Utf8UChar;
typedef char16_t Standard_ExtCharacter;
typedef char16_t Standard_Utf16Char;
typedef char32_t Standard_Utf32Char;
typedef wchar_t Standard_WideChar;
typedef const Standard_Character * Standard_CString;
typedef const Standard_ExtCharacter * Standard_ExtString;
typedef pthread_t Standard_ThreadId;
typedef Standard_ErrorHandler::Callback Standard_ErrorHandlerCallback;
/* end typedefs declaration */

/* public enums */
enum Standard_HandlerStatus {
	Standard_HandlerVoid = 0,
	Standard_HandlerJumped = 1,
	Standard_HandlerProcessed = 2,
};

/* end public enums declaration */

%wrap_handle(Standard_Transient)
%wrap_handle(Standard_OutOfMemory)

%rename(standard) Standard;
class Standard {
	public:
		%feature("compactdefaultargs") Allocate;
		%feature("autodoc", "	* Allocates memory blocks aSize - bytes to allocate

	:param aSize:
	:type aSize: Standard_Size
	:rtype: Standard_Address
") Allocate;
		static Standard_Address Allocate (const Standard_Size aSize);
		%feature("compactdefaultargs") AllocateAligned;
		%feature("autodoc", "	* Allocates aligned memory blocks. Should be used with CPU instructions which require specific alignment. For example: SSE requires 16 bytes, AVX requires 32 bytes. @param theSize bytes to allocate @param theAlign alignment in bytes

	:param theSize:
	:type theSize: Standard_Size
	:param theAlign:
	:type theAlign: Standard_Size
	:rtype: Standard_Address
") AllocateAligned;
		static Standard_Address AllocateAligned (const Standard_Size theSize,const Standard_Size theAlign);
		%feature("compactdefaultargs") Purge;
		%feature("autodoc", "	* Deallocates the storage retained on the free list and clears the list. Returns non-zero if some memory has been actually freed.

	:rtype: int
") Purge;
		static Standard_Integer Purge ();
		%feature("compactdefaultargs") Reallocate;
		%feature("autodoc", "	* Reallocates memory blocks aStorage - previously allocated memory block aNewSize - new size in bytes

	:param aStorage:
	:type aStorage: Standard_Address
	:param aNewSize:
	:type aNewSize: Standard_Size
	:rtype: Standard_Address
") Reallocate;
		static Standard_Address Reallocate (const Standard_Address aStorage,const Standard_Size aNewSize);
};


%extend Standard {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Standard_ArrayStreamBuffer;
class Standard_ArrayStreamBuffer : public std::streambuf {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* (Re)-initialize the stream. Passed pointer is stored as is (memory is NOT copied nor released with destructor). @param theBegin pointer to the beggining of pre-allocated buffer @param theSize length of pre-allocated buffer

	:param theBegin:
	:type theBegin: char *
	:param theSize:
	:type theSize: size_t
	:rtype: void
") Init;
		virtual void Init (const char * theBegin,const size_t theSize);
		%feature("compactdefaultargs") Standard_ArrayStreamBuffer;
		%feature("autodoc", "	* Main constructor. Passed pointer is stored as is (memory is NOT copied nor released with destructor). @param theBegin pointer to the beggining of pre-allocated buffer @param theSize length of pre-allocated buffer

	:param theBegin:
	:type theBegin: char *
	:param theSize:
	:type theSize: size_t
	:rtype: None
") Standard_ArrayStreamBuffer;
		 Standard_ArrayStreamBuffer (const char * theBegin,const size_t theSize);
		%feature("compactdefaultargs") xsgetn;
		%feature("autodoc", "	* Read a bunch of bytes at once.

	:param thePtr:
	:type thePtr: char *
	:param theCount:
	:type theCount: std::streamsize
	:rtype: std::streamsize
") xsgetn;
		virtual std::streamsize xsgetn (char * thePtr,std::streamsize theCount);
};


%extend Standard_ArrayStreamBuffer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Standard_ErrorHandler;
class Standard_ErrorHandler {
	public:
		class Callback {};
		%feature("compactdefaultargs") Catches;
		%feature("autodoc", "	* Returns 'True' if the caught exception has the same type or inherits from 'aType'

	:param aType:
	:type aType: Handle_Standard_Type &
	:rtype: bool
") Catches;
		Standard_Boolean Catches (const Handle_Standard_Type & aType);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* Unlinks and checks if there is a raised exception.

	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	* Returns the current Error.

	:rtype: Handle_Standard_Failure
") Error;
		Handle_Standard_Failure Error ();
		%feature("compactdefaultargs") IsInTryBlock;
		%feature("autodoc", "	* Test if the code is currently running in a try block

	:rtype: bool
") IsInTryBlock;
		static Standard_Boolean IsInTryBlock ();
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns label for jump

	:rtype: Standard_JmpBuf
") Label;
		Standard_JmpBuf & Label ();
		%feature("compactdefaultargs") LastCaughtError;
		%feature("autodoc", "	* Returns the caught exception.

	:rtype: Handle_Standard_Failure
") LastCaughtError;
		static Handle_Standard_Failure LastCaughtError ();
		%feature("compactdefaultargs") Standard_ErrorHandler;
		%feature("autodoc", "	* Create a ErrorHandler (to be used with try{}catch(){}). It uses the 'setjmp' and 'longjmp' routines.

	:rtype: None
") Standard_ErrorHandler;
		 Standard_ErrorHandler ();
		%feature("compactdefaultargs") Unlink;
		%feature("autodoc", "	* Removes handler from the handlers list

	:rtype: None
") Unlink;
		void Unlink ();
};


%extend Standard_ErrorHandler {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Standard_GUID;
class Standard_GUID {
	public:
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param uid:
	:type uid: Standard_GUID &
	:rtype: None
") Assign;
		void Assign (const Standard_GUID & uid);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param uid:
	:type uid: Standard_UUID &
	:rtype: None
") Assign;
		void Assign (const Standard_UUID & uid);
		%feature("compactdefaultargs") CheckGUIDFormat;
		%feature("autodoc", "	* Check the format of a GUID string. It checks the size, the position of the '-' and the correct size of fields.

	:param aGuid:
	:type aGuid: char *
	:rtype: bool
") CheckGUIDFormat;
		static Standard_Boolean CheckGUIDFormat (const char * aGuid);
		%feature("compactdefaultargs") Hash;
		%feature("autodoc", "	* Hash function for GUID.

	:param Upper:
	:type Upper: int
	:rtype: int
") Hash;
		Standard_Integer Hash (const Standard_Integer Upper);
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	* H method used by collections.

	:param aguid:
	:type aguid: Standard_GUID &
	:param Upper:
	:type Upper: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const Standard_GUID & aguid,const Standard_Integer Upper);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Returns True when the two GUID are the same.

	:param string1:
	:type string1: Standard_GUID &
	:param string2:
	:type string2: Standard_GUID &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const Standard_GUID & string1,const Standard_GUID & string2);
		%feature("compactdefaultargs") IsNotSame;
		%feature("autodoc", "	:param uid:
	:type uid: Standard_GUID &
	:rtype: bool
") IsNotSame;
		Standard_Boolean IsNotSame (const Standard_GUID & uid);
		%feature("compactdefaultargs") IsSame;
		%feature("autodoc", "	:param uid:
	:type uid: Standard_GUID &
	:rtype: bool
") IsSame;
		Standard_Boolean IsSame (const Standard_GUID & uid);

        %feature("autodoc", "1");
        %extend{
            std::string ShallowDumpToString() {
            std::stringstream s;
            self->ShallowDump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Standard_GUID;
		%feature("autodoc", "	:rtype: None
") Standard_GUID;
		 Standard_GUID ();
		%feature("compactdefaultargs") Standard_GUID;
		%feature("autodoc", "	* build a GUID from an ascii string with the following format: Length : 36 char '00000000-0000-0000-0000-000000000000'

	:param aGuid:
	:type aGuid: char *
	:rtype: None
") Standard_GUID;
		 Standard_GUID (const char * aGuid);
		%feature("compactdefaultargs") Standard_GUID;
		%feature("autodoc", "	* build a GUID from an unicode string with the following format: //! '00000000-0000-0000-0000-000000000000'

	:param aGuid:
	:type aGuid: Standard_ExtString
	:rtype: None
") Standard_GUID;
		 Standard_GUID (const Standard_ExtString aGuid);
		%feature("compactdefaultargs") Standard_GUID;
		%feature("autodoc", "	:param a32b:
	:type a32b: int
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
		%feature("compactdefaultargs") Standard_GUID;
		%feature("autodoc", "	:param aGuid:
	:type aGuid: Standard_UUID &
	:rtype: None
") Standard_GUID;
		 Standard_GUID (const Standard_UUID & aGuid);
		%feature("compactdefaultargs") Standard_GUID;
		%feature("autodoc", "	:param aGuid:
	:type aGuid: Standard_GUID &
	:rtype: None
") Standard_GUID;
		 Standard_GUID (const Standard_GUID & aGuid);
		%feature("compactdefaultargs") ToCString;
		%feature("autodoc", "	* translate the GUID into ascii string the aStrGuid is allocated by user. the guid have the following format: //! '00000000-0000-0000-0000-000000000000'

	:param aStrGuid:
	:type aStrGuid: Standard_PCharacter
	:rtype: None
") ToCString;
		void ToCString (const Standard_PCharacter aStrGuid);
		%feature("compactdefaultargs") ToExtString;
		%feature("autodoc", "	* translate the GUID into unicode string the aStrGuid is allocated by user. the guid have the following format: //! '00000000-0000-0000-0000-000000000000'

	:param aStrGuid:
	:type aStrGuid: Standard_PExtCharacter
	:rtype: None
") ToExtString;
		void ToExtString (const Standard_PExtCharacter aStrGuid);
		%feature("compactdefaultargs") ToUUID;
		%feature("autodoc", "	:rtype: Standard_UUID
") ToUUID;
		Standard_UUID ToUUID ();

        %extend{
            bool __ne_wrapper__(const Standard_GUID  other) {
            if (*self!=other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __ne__(self, right):
            try:
                return self.__ne_wrapper__(right)
            except:
                return True
        }
        		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param uid:
	:type uid: Standard_GUID &
	:rtype: None
") operator =;
		void operator = (const Standard_GUID & uid);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param uid:
	:type uid: Standard_UUID &
	:rtype: None
") operator =;
		void operator = (const Standard_UUID & uid);

        %extend{
            bool __eq_wrapper__(const Standard_GUID  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self, right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        };


%extend Standard_GUID {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Standard_MMgrRoot;
class Standard_MMgrRoot {
	public:
		%feature("compactdefaultargs") Allocate;
		%feature("autodoc", "	* Allocate specified number of bytes. The actually allocated space should be rounded up to double word size (4 bytes), as this is expected by implementation of some classes in OCC (e.g. TCollection_AsciiString)

	:param theSize:
	:type theSize: Standard_Size
	:rtype: Standard_Address
") Allocate;
		virtual Standard_Address Allocate (const Standard_Size theSize);
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "	* Frees previously allocated memory at specified address.

	:param thePtr:
	:type thePtr: Standard_Address
	:rtype: void
") Free;
		virtual void Free (Standard_Address thePtr);
		%feature("compactdefaultargs") Purge;
		%feature("autodoc", "	* Purge internally cached unused memory blocks (if any) by releasing them to the operating system. Must return non-zero if some memory has been actually released, or zero otherwise. If option isDestroyed is True, this means that memory manager is not expected to be used any more; note however that in general case it is still possible to have calls to that instance of memory manager after this (e.g. to free memory of static objects in OCC). Thus this option should command the memory manager to release any cached memory to the system and not cache any more, but still remain operable... //! Default implementation does nothing and returns 0.

	:param isDestroyed: default value is Standard_False
	:type isDestroyed: bool
	:rtype: int
") Purge;
		virtual Standard_Integer Purge (Standard_Boolean isDestroyed = Standard_False);
		%feature("compactdefaultargs") Reallocate;
		%feature("autodoc", "	* Reallocate previously allocated memory to contain at least theSize bytes. In case of success, new pointer is returned.

	:param thePtr:
	:type thePtr: Standard_Address
	:param theSize:
	:type theSize: Standard_Size
	:rtype: Standard_Address
") Reallocate;
		virtual Standard_Address Reallocate (Standard_Address thePtr,const Standard_Size theSize);
};


%extend Standard_MMgrRoot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Standard_Static_Assert<true>;
class Standard_Static_Assert<true> {
	public:
		%feature("compactdefaultargs") assert_ok;
		%feature("autodoc", "	:rtype: void
") assert_ok;
		static void assert_ok ();
};


%extend Standard_Static_Assert<true> {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Standard_Transient;
class Standard_Transient {
	public:
typedef void base_type;
		%feature("compactdefaultargs") DecrementRefCounter;
		%feature("autodoc", "	* Decrements the reference counter of this object; returns the decremented value

	:rtype: int
") DecrementRefCounter;
		Standard_Integer DecrementRefCounter ();
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	* Memory deallocator for transient classes

	:rtype: void
") Delete;
		virtual void Delete ();
		%feature("compactdefaultargs") DynamicType;
		%feature("autodoc", "	* Returns a type descriptor about this object.

	:rtype: opencascade::handle<Standard_Type>
") DynamicType;
		virtual const opencascade::handle<Standard_Type> & DynamicType ();
		%feature("compactdefaultargs") GetRefCount;
		%feature("autodoc", "	* //!@name Reference counting, for use by handle<> Get the reference counter of this object

	:rtype: int
") GetRefCount;
		Standard_Integer GetRefCount ();
		%feature("compactdefaultargs") IncrementRefCounter;
		%feature("autodoc", "	* Increments the reference counter of this object

	:rtype: None
") IncrementRefCounter;
		void IncrementRefCounter ();
		%feature("compactdefaultargs") IsInstance;
		%feature("autodoc", "	* Returns a true value if this is an instance of Type.

	:param theType:
	:type theType: opencascade::handle<Standard_Type> &
	:rtype: bool
") IsInstance;
		Standard_Boolean IsInstance (const opencascade::handle<Standard_Type> & theType);
		%feature("compactdefaultargs") IsInstance;
		%feature("autodoc", "	* Returns a true value if this is an instance of TypeName.

	:param theTypeName:
	:type theTypeName: char *
	:rtype: bool
") IsInstance;
		Standard_Boolean IsInstance (const char * theTypeName);
		%feature("compactdefaultargs") IsKind;
		%feature("autodoc", "	* Returns true if this is an instance of Type or an instance of any class that inherits from Type. Note that multiple inheritance is not supported by OCCT RTTI mechanism.

	:param theType:
	:type theType: opencascade::handle<Standard_Type> &
	:rtype: bool
") IsKind;
		Standard_Boolean IsKind (const opencascade::handle<Standard_Type> & theType);
		%feature("compactdefaultargs") IsKind;
		%feature("autodoc", "	* Returns true if this is an instance of TypeName or an instance of any class that inherits from TypeName. Note that multiple inheritance is not supported by OCCT RTTI mechanism.

	:param theTypeName:
	:type theTypeName: char *
	:rtype: bool
") IsKind;
		Standard_Boolean IsKind (const char * theTypeName);
		%feature("compactdefaultargs") Standard_Transient;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") Standard_Transient;
		 Standard_Transient ();
		%feature("compactdefaultargs") Standard_Transient;
		%feature("autodoc", "	* Copy constructor -- does nothing

	:param &:
	:type &: Standard_Transient
	:rtype: None
") Standard_Transient;
		 Standard_Transient (const Standard_Transient &);
		%feature("compactdefaultargs") This;
		%feature("autodoc", "	* Returns non-const pointer to this object (like const_cast). For protection against creating handle to objects allocated in stack or call from constructor, it will raise exception Standard_ProgramError if reference counter is zero.

	:rtype: Standard_Transient *
") This;
		Standard_Transient * This ();
		%feature("compactdefaultargs") get_type_descriptor;
		%feature("autodoc", "	* Returns type descriptor of Standard_Transient class

	:rtype: opencascade::handle<Standard_Type>
") get_type_descriptor;
		static const opencascade::handle<Standard_Type> & get_type_descriptor ();
		%feature("compactdefaultargs") get_type_name;
		%feature("autodoc", "	:rtype: char *
") get_type_name;
		static const char * get_type_name ();
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	* Assignment operator, needed to avoid copying reference counter

	:param &:
	:type &: Standard_Transient
	:rtype: Standard_Transient
") operator =;
		Standard_Transient & operator = (const Standard_Transient &);
};


%make_alias(Standard_Transient)

%extend Standard_Transient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Standard_MMgrOpt;
class Standard_MMgrOpt : public Standard_MMgrRoot {
	public:
		%feature("compactdefaultargs") Allocate;
		%feature("autodoc", "	* Allocate aSize bytes; see class description above

	:param aSize:
	:type aSize: Standard_Size
	:rtype: Standard_Address
") Allocate;
		virtual Standard_Address Allocate (const Standard_Size aSize);
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "	* Free previously allocated block. Note that block can not all blocks are released to the OS by this method (see class description)

	:param thePtr:
	:type thePtr: Standard_Address
	:rtype: void
") Free;
		virtual void Free (Standard_Address thePtr);
		%feature("compactdefaultargs") Purge;
		%feature("autodoc", "	* Release medium-sized blocks of memory in free lists to the system. Returns number of actually freed blocks

	:param isDestroyed:
	:type isDestroyed: bool
	:rtype: int
") Purge;
		virtual Standard_Integer Purge (Standard_Boolean isDestroyed);
		%feature("compactdefaultargs") Reallocate;
		%feature("autodoc", "	* Reallocate previously allocated aPtr to a new size; new address is returned. In case that aPtr is null, the function behaves exactly as Allocate.

	:param thePtr:
	:type thePtr: Standard_Address
	:param theSize:
	:type theSize: Standard_Size
	:rtype: Standard_Address
") Reallocate;
		virtual Standard_Address Reallocate (Standard_Address thePtr,const Standard_Size theSize);
		%feature("compactdefaultargs") Standard_MMgrOpt;
		%feature("autodoc", "	* Constructor. If aClear is True, the allocated emmory will be nullified. For description of other parameters, see description of the class above.

	:param aClear: default value is Standard_True
	:type aClear: bool
	:param aMMap: default value is Standard_True
	:type aMMap: bool
	:param aCellSize: default value is 200
	:type aCellSize: Standard_Size
	:param aNbPages: default value is 10000
	:type aNbPages: int
	:param aThreshold: default value is 40000
	:type aThreshold: Standard_Size
	:rtype: None
") Standard_MMgrOpt;
		 Standard_MMgrOpt (const Standard_Boolean aClear = Standard_True,const Standard_Boolean aMMap = Standard_True,const Standard_Size aCellSize = 200,const Standard_Integer aNbPages = 10000,const Standard_Size aThreshold = 40000);
};


%extend Standard_MMgrOpt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Standard_MMgrRaw;
class Standard_MMgrRaw : public Standard_MMgrRoot {
	public:
		%feature("compactdefaultargs") Allocate;
		%feature("autodoc", "	* Allocate aSize bytes

	:param aSize:
	:type aSize: Standard_Size
	:rtype: Standard_Address
") Allocate;
		virtual Standard_Address Allocate (const Standard_Size aSize);
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "	* Free allocated memory. The pointer is nullified.

	:param thePtr:
	:type thePtr: Standard_Address
	:rtype: void
") Free;
		virtual void Free (Standard_Address thePtr);
		%feature("compactdefaultargs") Reallocate;
		%feature("autodoc", "	* Reallocate aPtr to the size aSize. The new pointer is returned.

	:param thePtr:
	:type thePtr: Standard_Address
	:param theSize:
	:type theSize: Standard_Size
	:rtype: Standard_Address
") Reallocate;
		virtual Standard_Address Reallocate (Standard_Address thePtr,const Standard_Size theSize);
		%feature("compactdefaultargs") Standard_MMgrRaw;
		%feature("autodoc", "	* Constructor; if aClear is True, the memory will be nullified upon allocation.

	:param aClear: default value is Standard_False
	:type aClear: bool
	:rtype: None
") Standard_MMgrRaw;
		 Standard_MMgrRaw (const Standard_Boolean aClear = Standard_False);
};


%extend Standard_MMgrRaw {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Standard_MMgrTBBalloc;
class Standard_MMgrTBBalloc : public Standard_MMgrRoot {
	public:
		%feature("compactdefaultargs") Allocate;
		%feature("autodoc", "	* Allocate aSize bytes

	:param aSize:
	:type aSize: Standard_Size
	:rtype: Standard_Address
") Allocate;
		virtual Standard_Address Allocate (const Standard_Size aSize);
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "	* Free allocated memory

	:param thePtr:
	:type thePtr: Standard_Address
	:rtype: void
") Free;
		virtual void Free (Standard_Address thePtr);
		%feature("compactdefaultargs") Reallocate;
		%feature("autodoc", "	* Reallocate aPtr to the size aSize. The new pointer is returned.

	:param thePtr:
	:type thePtr: Standard_Address
	:param theSize:
	:type theSize: Standard_Size
	:rtype: Standard_Address
") Reallocate;
		virtual Standard_Address Reallocate (Standard_Address thePtr,const Standard_Size theSize);
		%feature("compactdefaultargs") Standard_MMgrTBBalloc;
		%feature("autodoc", "	* Constructor; if aClear is True, the memory will be nullified upon allocation.

	:param aClear: default value is Standard_False
	:type aClear: bool
	:rtype: None
") Standard_MMgrTBBalloc;
		 Standard_MMgrTBBalloc (const Standard_Boolean aClear = Standard_False);
};


%extend Standard_MMgrTBBalloc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Standard_Mutex;
class Standard_Mutex : public Standard_ErrorHandler::Callback {
	public:
		class Sentry {};
		%feature("compactdefaultargs") Lock;
		%feature("autodoc", "	* Method to lock the mutex; waits until the mutex is released by other threads, locks it and then returns

	:rtype: None
") Lock;
		void Lock ();
		%feature("compactdefaultargs") Standard_Mutex;
		%feature("autodoc", "	* Constructor: creates a mutex object and initializes it. It is strongly recommended that mutexes were created as static objects whenever possible.

	:rtype: None
") Standard_Mutex;
		 Standard_Mutex ();
		%feature("compactdefaultargs") TryLock;
		%feature("autodoc", "	* Method to test the mutex; if the mutex is not hold by other thread, locks it and returns True; otherwise returns False without waiting mutex to be released.

	:rtype: bool
") TryLock;
		Standard_Boolean TryLock ();
		%feature("compactdefaultargs") Unlock;
		%feature("autodoc", "	* Method to unlock the mutex; releases it to other users

	:rtype: None
") Unlock;
		void Unlock ();
};


%extend Standard_Mutex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Standard_OutOfMemory;
class Standard_OutOfMemory : public Standard_ProgramError {
	public:
		%feature("compactdefaultargs") GetMessageString;
		%feature("autodoc", "	* Returns error message

	:rtype: char *
") GetMessageString;
		const char * GetMessageString ();
		%feature("compactdefaultargs") NewInstance;
		%feature("autodoc", "	* Returns global instance of exception

	:param theMessage: default value is ""
	:type theMessage: char *
	:rtype: Handle_Standard_OutOfMemory
") NewInstance;
		static Handle_Standard_OutOfMemory NewInstance (const char * theMessage = "");
		%feature("compactdefaultargs") Raise;
		%feature("autodoc", "	* Raises exception with specified message string

	:param theMessage: default value is ""
	:type theMessage: char *
	:rtype: void
") Raise;
		static void Raise (const char * theMessage = "");
		%feature("compactdefaultargs") Raise;
		%feature("autodoc", "	* Raises exception with specified message string

	:param theMessage:
	:type theMessage: Standard_SStream &
	:rtype: void
") Raise;
		static void Raise (Standard_SStream & theMessage);
		%feature("compactdefaultargs") SetMessageString;
		%feature("autodoc", "	* Sets error message

	:param aMessage:
	:type aMessage: char *
	:rtype: None
") SetMessageString;
		void SetMessageString (const char * aMessage);
		%feature("compactdefaultargs") Standard_OutOfMemory;
		%feature("autodoc", "	* Constructor is kept public for backward compatibility

	:param theMessage: default value is 0
	:type theMessage: char *
	:rtype: None
") Standard_OutOfMemory;
		 Standard_OutOfMemory (const char * theMessage = 0);
};


%make_alias(Standard_OutOfMemory)

%extend Standard_OutOfMemory {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
