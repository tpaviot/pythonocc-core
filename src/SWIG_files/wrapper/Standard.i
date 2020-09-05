/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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
"Standard module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_standard.html"
%enddef
%module (package="OCC.Core", docstring=STANDARDDOCSTRING) Standard


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


%{
#include<Standard_module.hxx>

//Dependencies
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum Standard_HandlerStatus {
	Standard_HandlerVoid = 0,
	Standard_HandlerJumped = 1,
	Standard_HandlerProcessed = 2,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class Standard_HandlerStatus(IntEnum):
	Standard_HandlerVoid = 0
	Standard_HandlerJumped = 1
	Standard_HandlerProcessed = 2
Standard_HandlerVoid = Standard_HandlerStatus.Standard_HandlerVoid
Standard_HandlerJumped = Standard_HandlerStatus.Standard_HandlerJumped
Standard_HandlerProcessed = Standard_HandlerStatus.Standard_HandlerProcessed
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Standard_Transient)
%wrap_handle(Standard_OutOfMemory)
%wrap_handle(Standard_Persistent)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
typedef void * Standard_Address;
typedef bool Standard_Boolean;
typedef unsigned char Standard_Byte;
typedef const Standard_Character * Standard_CString;
typedef char Standard_Character;
typedef Standard_ErrorHandler::Callback Standard_ErrorHandlerCallback;
typedef char16_t Standard_ExtCharacter;
typedef const Standard_ExtCharacter * Standard_ExtString;
typedef std::istream Standard_IStream;
typedef int Standard_Integer;
typedef std::ostream Standard_OStream;
typedef Standard_Byte * Standard_PByte;
typedef Standard_Character * Standard_PCharacter;
typedef Standard_ErrorHandler * Standard_PErrorHandler;
typedef Standard_ExtCharacter * Standard_PExtCharacter;
typedef double Standard_Real;
typedef std::stringstream Standard_SStream;
typedef float Standard_ShortReal;
typedef size_t Standard_Size;
typedef Standard_Size Standard_ThreadId;
typedef std::time_t Standard_Time;
typedef GUID Standard_UUID;
typedef char16_t Standard_Utf16Char;
typedef char32_t Standard_Utf32Char;
typedef char Standard_Utf8Char;
typedef unsigned char Standard_Utf8UChar;
typedef wchar_t Standard_WideChar;
typedef signed __int16 int16_t;
typedef signed __int32 int32_t;
typedef signed __int64 int64_t;
typedef signed __int8 int8_t;
typedef unsigned __int16 uint16_t;
typedef unsigned __int32 uint32_t;
typedef unsigned __int64 uint64_t;
typedef unsigned __int8 uint8_t;
/* end typedefs declaration */

/*************
* class GUID *
*************/
/*****************
* class Standard *
*****************/
%rename(standard) Standard;
class Standard {
	public:
		/****************** Allocate ******************/
		/**** md5 signature: 10c0da91eb50ef90687a2d94eada1414 ****/
		%feature("compactdefaultargs") Allocate;
		%feature("autodoc", "Allocates memory blocks asize - bytes to allocate.

Parameters
----------
aSize: Standard_Size

Returns
-------
Standard_Address
") Allocate;
		static Standard_Address Allocate(const Standard_Size aSize);

		/****************** AllocateAligned ******************/
		/**** md5 signature: a54b3a9a279a6d719651145508c0e4f9 ****/
		%feature("compactdefaultargs") AllocateAligned;
		%feature("autodoc", "Allocates aligned memory blocks. should be used with cpu instructions which require specific alignment. for example: sse requires 16 bytes, avx requires 32 bytes. @param thesize bytes to allocate @param thealign alignment in bytes.

Parameters
----------
theSize: Standard_Size
theAlign: Standard_Size

Returns
-------
Standard_Address
") AllocateAligned;
		static Standard_Address AllocateAligned(const Standard_Size theSize, const Standard_Size theAlign);

		/****************** Purge ******************/
		/**** md5 signature: 964c9688a284e751f362d44404b428a8 ****/
		%feature("compactdefaultargs") Purge;
		%feature("autodoc", "Deallocates the storage retained on the free list and clears the list. returns non-zero if some memory has been actually freed.

Returns
-------
int
") Purge;
		static Standard_Integer Purge();

		/****************** Reallocate ******************/
		/**** md5 signature: e02f1587334da5138d36de642aadf9d7 ****/
		%feature("compactdefaultargs") Reallocate;
		%feature("autodoc", "Reallocates memory blocks astorage - previously allocated memory block anewsize - new size in bytes.

Parameters
----------
aStorage: Standard_Address
aNewSize: Standard_Size

Returns
-------
Standard_Address
") Reallocate;
		static Standard_Address Reallocate(const Standard_Address aStorage, const Standard_Size aNewSize);

};


%extend Standard {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Free(self):
		pass

	@methodnotwrapped
	def FreeAligned(self):
		pass
	}
};

/***********************************
* class Standard_ArrayStreamBuffer *
***********************************/
class Standard_ArrayStreamBuffer : public std::streambuf {
	public:
		/****************** Standard_ArrayStreamBuffer ******************/
		/**** md5 signature: 72e8fa1633999e17c4113d48c2d43739 ****/
		%feature("compactdefaultargs") Standard_ArrayStreamBuffer;
		%feature("autodoc", "Main constructor. passed pointer is stored as is (memory is not copied nor released with destructor). @param thebegin pointer to the beggining of pre-allocated buffer @param thesize length of pre-allocated buffer.

Parameters
----------
theBegin: char *
theSize: size_t

Returns
-------
None
") Standard_ArrayStreamBuffer;
		 Standard_ArrayStreamBuffer(const char * theBegin, const size_t theSize);

		/****************** Init ******************/
		/**** md5 signature: d18d18891aa5348c727148263a9628cb ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "(re)-initialize the stream. passed pointer is stored as is (memory is not copied nor released with destructor). @param thebegin pointer to the beggining of pre-allocated buffer @param thesize length of pre-allocated buffer.

Parameters
----------
theBegin: char *
theSize: size_t

Returns
-------
None
") Init;
		virtual void Init(const char * theBegin, const size_t theSize);

		/****************** xsgetn ******************/
		/**** md5 signature: 43f5fa4c48aa65a7cd3ea36417590549 ****/
		%feature("compactdefaultargs") xsgetn;
		%feature("autodoc", "Read a bunch of bytes at once.

Parameters
----------
thePtr: char *
theCount: std::streamsize

Returns
-------
std::streamsize
") xsgetn;
		virtual std::streamsize xsgetn(char * thePtr, std::streamsize theCount);

};


%extend Standard_ArrayStreamBuffer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Standard_Condition *
***************************/
class Standard_Condition {
	public:
		/****************** Standard_Condition ******************/
		/**** md5 signature: 86edcc5ec0cdfb051f542bf2f8e73932 ****/
		%feature("compactdefaultargs") Standard_Condition;
		%feature("autodoc", "Default constructor. @param theisset initial flag state.

Parameters
----------
theIsSet: bool

Returns
-------
None
") Standard_Condition;
		 Standard_Condition(bool theIsSet);

		/****************** Check ******************/
		/**** md5 signature: 57f3f5b4239bc567be06341ec16789c7 ****/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Do not wait for signal - just test it state. returns true if get event.

Returns
-------
bool
") Check;
		bool Check();

		/****************** CheckReset ******************/
		/**** md5 signature: 419d3cbf28fb47053f05bc50b9527979 ****/
		%feature("compactdefaultargs") CheckReset;
		%feature("autodoc", "Method perform two steps at-once - reset the event object and returns true if it was in signaling state. returns true if event object was in signaling state.

Returns
-------
bool
") CheckReset;
		bool CheckReset();

		/****************** Reset ******************/
		/**** md5 signature: 7beb446fe26b948f797f8de87e46c23d ****/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Reset event (unset signaling state).

Returns
-------
None
") Reset;
		void Reset();

		/****************** Set ******************/
		/**** md5 signature: 1a3156a57ac62c26f68fc9a5cc67a188 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Set event into signaling state.

Returns
-------
None
") Set;
		void Set();

		/****************** Wait ******************/
		/**** md5 signature: b28e324626a345ee084669a721e91972 ****/
		%feature("compactdefaultargs") Wait;
		%feature("autodoc", "Wait for event (infinity).

Returns
-------
None
") Wait;
		void Wait();

		/****************** Wait ******************/
		/**** md5 signature: e3db043148e08f258771ac9c5c11ece8 ****/
		%feature("compactdefaultargs") Wait;
		%feature("autodoc", "Wait for signal requested time. @param thetimemilliseconds wait limit in milliseconds returns true if get event.

Parameters
----------
theTimeMilliseconds: int

Returns
-------
bool
") Wait;
		bool Wait(int theTimeMilliseconds);

};


%extend Standard_Condition {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def getHandle(self):
		pass
	}
};

/******************************
* class Standard_ErrorHandler *
******************************/
class Standard_ErrorHandler {
	public:
		class Callback {};
		/****************** Standard_ErrorHandler ******************/
		/**** md5 signature: a8c6dc998d98c7fb44e04500e37ae49e ****/
		%feature("compactdefaultargs") Standard_ErrorHandler;
		%feature("autodoc", "Create a errorhandler (to be used with try{}catch(){}). it uses the 'setjmp' and 'longjmp' routines.

Returns
-------
None
") Standard_ErrorHandler;
		 Standard_ErrorHandler();

		/****************** Catches ******************/
		/**** md5 signature: d365a924b1d2ee2e280fbe6bd7aa8ae8 ****/
		%feature("compactdefaultargs") Catches;
		%feature("autodoc", "Returns 'true' if the caught exception has the same type or inherits from 'atype'.

Parameters
----------
aType: Standard_Type

Returns
-------
bool
") Catches;
		Standard_Boolean Catches(const opencascade::handle<Standard_Type> & aType);

		/****************** Destroy ******************/
		/**** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ****/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Unlinks and checks if there is a raised exception.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** Error ******************/
		/**** md5 signature: df37f33da5398b885a804d72f01daa6e ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns the current error.

Returns
-------
opencascade::handle<Standard_Failure>
") Error;
		opencascade::handle<Standard_Failure> Error();

		/****************** IsInTryBlock ******************/
		/**** md5 signature: c19793183a1c3a2e4ed9cccfe2984fd5 ****/
		%feature("compactdefaultargs") IsInTryBlock;
		%feature("autodoc", "Test if the code is currently running in a try block.

Returns
-------
bool
") IsInTryBlock;
		static Standard_Boolean IsInTryBlock();

		/****************** LastCaughtError ******************/
		/**** md5 signature: ab9a6a78f95e9ef9c504fe10b3118b8c ****/
		%feature("compactdefaultargs") LastCaughtError;
		%feature("autodoc", "Returns the caught exception.

Returns
-------
opencascade::handle<Standard_Failure>
") LastCaughtError;
		static opencascade::handle<Standard_Failure> LastCaughtError();

		/****************** Unlink ******************/
		/**** md5 signature: 292a8a7af4c9ec0d13d9cc55ed8c3f9b ****/
		%feature("compactdefaultargs") Unlink;
		%feature("autodoc", "Removes handler from the handlers list.

Returns
-------
None
") Unlink;
		void Unlink();

};


%extend Standard_ErrorHandler {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Label(self):
		pass
	}
};

/**********************
* class Standard_GUID *
**********************/
class Standard_GUID {
	public:
		/****************** Standard_GUID ******************/
		/**** md5 signature: bd47278e877fa95d24363f9cfe93d187 ****/
		%feature("compactdefaultargs") Standard_GUID;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Standard_GUID;
		 Standard_GUID();

		/****************** Standard_GUID ******************/
		/**** md5 signature: 2a30bf614689d2f7c0743ebf3b02c695 ****/
		%feature("compactdefaultargs") Standard_GUID;
		%feature("autodoc", "Build a guid from an ascii string with the following format: length : 36 char '00000000-0000-0000-0000-000000000000'.

Parameters
----------
aGuid: char *

Returns
-------
None
") Standard_GUID;
		 Standard_GUID(const char * aGuid);

		/****************** Standard_GUID ******************/
		/**** md5 signature: 8d0d307d0173ec7d9a9c9cec3e471f21 ****/
		%feature("compactdefaultargs") Standard_GUID;
		%feature("autodoc", "Build a guid from an unicode string with the following format: //! '00000000-0000-0000-0000-000000000000'.

Parameters
----------
aGuid: Standard_ExtString

Returns
-------
None
") Standard_GUID;
		 Standard_GUID(const Standard_ExtString aGuid);

		/****************** Standard_GUID ******************/
		/**** md5 signature: 90d08c9aedbdee233cfe2c752f75ab0d ****/
		%feature("compactdefaultargs") Standard_GUID;
		%feature("autodoc", "No available documentation.

Parameters
----------
a32b: int
a16b1: Standard_ExtCharacter
a16b2: Standard_ExtCharacter
a16b3: Standard_ExtCharacter
a8b1: Standard_Byte
a8b2: Standard_Byte
a8b3: Standard_Byte
a8b4: Standard_Byte
a8b5: Standard_Byte
a8b6: Standard_Byte

Returns
-------
None
") Standard_GUID;
		 Standard_GUID(const Standard_Integer a32b, const Standard_ExtCharacter a16b1, const Standard_ExtCharacter a16b2, const Standard_ExtCharacter a16b3, const Standard_Byte a8b1, const Standard_Byte a8b2, const Standard_Byte a8b3, const Standard_Byte a8b4, const Standard_Byte a8b5, const Standard_Byte a8b6);

		/****************** Standard_GUID ******************/
		/**** md5 signature: d84ec169f70d0973702e9dc75249d278 ****/
		%feature("compactdefaultargs") Standard_GUID;
		%feature("autodoc", "No available documentation.

Parameters
----------
aGuid: Standard_UUID

Returns
-------
None
") Standard_GUID;
		 Standard_GUID(const Standard_UUID & aGuid);

		/****************** Standard_GUID ******************/
		/**** md5 signature: e226b1f99a6fe2de676bd5062d0d32b1 ****/
		%feature("compactdefaultargs") Standard_GUID;
		%feature("autodoc", "No available documentation.

Parameters
----------
aGuid: Standard_GUID

Returns
-------
None
") Standard_GUID;
		 Standard_GUID(const Standard_GUID & aGuid);

		/****************** Assign ******************/
		/**** md5 signature: 9df04502685554ebb980911332a1df4e ****/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "No available documentation.

Parameters
----------
uid: Standard_GUID

Returns
-------
None
") Assign;
		void Assign(const Standard_GUID & uid);

		/****************** Assign ******************/
		/**** md5 signature: ff0c805d2db22ffcd6f2c8c6b5068bcd ****/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "No available documentation.

Parameters
----------
uid: Standard_UUID

Returns
-------
None
") Assign;
		void Assign(const Standard_UUID & uid);

		/****************** CheckGUIDFormat ******************/
		/**** md5 signature: 2bc17afbd1c0c694e26a9eb83af8c0b3 ****/
		%feature("compactdefaultargs") CheckGUIDFormat;
		%feature("autodoc", "Check the format of a guid string. it checks the size, the position of the '-' and the correct size of fields.

Parameters
----------
aGuid: char *

Returns
-------
bool
") CheckGUIDFormat;
		static Standard_Boolean CheckGUIDFormat(const char * aGuid);

		/****************** Hash ******************/
		/**** md5 signature: 2ca4d5ed910085d9b74b734c3ce42e00 ****/
		%feature("compactdefaultargs") Hash;
		%feature("autodoc", "Hash function for guid.

Parameters
----------
Upper: int

Returns
-------
int
") Hash;
		Standard_Integer Hash(const Standard_Integer Upper);

		/****************** HashCode ******************/
		/**** md5 signature: 7ea33f659d5f35ed8ce799bbe4c3a63c ****/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Computes a hash code for the given guid of the standard_integer type, in the range [1, theupperbound] @param theguid the guid which hash code is to be computed @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

Parameters
----------
theGUID: Standard_GUID
theUpperBound: int

Returns
-------
int
") HashCode;
		static Standard_Integer HashCode(const Standard_GUID & theGUID, Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		/**** md5 signature: 1086fb5abd39daacfcf7d55bcaffafcd ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true when the two guid are the same.

Parameters
----------
string1: Standard_GUID
string2: Standard_GUID

Returns
-------
bool
") IsEqual;
		static Standard_Boolean IsEqual(const Standard_GUID & string1, const Standard_GUID & string2);

		/****************** IsNotSame ******************/
		/**** md5 signature: 3b6791d861dce7aeca50422c5b579eb8 ****/
		%feature("compactdefaultargs") IsNotSame;
		%feature("autodoc", "No available documentation.

Parameters
----------
uid: Standard_GUID

Returns
-------
bool
") IsNotSame;
		Standard_Boolean IsNotSame(const Standard_GUID & uid);

		/****************** IsSame ******************/
		/**** md5 signature: 5c5e459d9a23ecee87186c559dacf95e ****/
		%feature("compactdefaultargs") IsSame;
		%feature("autodoc", "No available documentation.

Parameters
----------
uid: Standard_GUID

Returns
-------
bool
") IsSame;
		Standard_Boolean IsSame(const Standard_GUID & uid);


        %feature("autodoc", "1");
        %extend{
            std::string ShallowDumpToString() {
            std::stringstream s;
            self->ShallowDump(s);
            return s.str();}
        };
		/****************** ToCString ******************/
		/**** md5 signature: bf4dad3d25b8e651de1bf421311dfc4f ****/
		%feature("compactdefaultargs") ToCString;
		%feature("autodoc", "Translate the guid into ascii string the astrguid is allocated by user. the guid have the following format: //! '00000000-0000-0000-0000-000000000000'.

Parameters
----------
aStrGuid: Standard_PCharacter

Returns
-------
None
") ToCString;
		void ToCString(const Standard_PCharacter aStrGuid);

		/****************** ToExtString ******************/
		/**** md5 signature: 941da789bbcb785e43f38cb8e2d7a14d ****/
		%feature("compactdefaultargs") ToExtString;
		%feature("autodoc", "Translate the guid into unicode string the astrguid is allocated by user. the guid have the following format: //! '00000000-0000-0000-0000-000000000000'.

Parameters
----------
aStrGuid: Standard_PExtCharacter

Returns
-------
None
") ToExtString;
		void ToExtString(const Standard_PExtCharacter aStrGuid);

		/****************** ToUUID ******************/
		/**** md5 signature: 66354e1a5c9d79fdbd62794717432b59 ****/
		%feature("compactdefaultargs") ToUUID;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_UUID
") ToUUID;
		Standard_UUID ToUUID();


            %extend{
                bool __ne_wrapper__(const Standard_GUID other) {
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

            %extend{
                bool __eq_wrapper__(const Standard_GUID other) {
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

/**************************
* class Standard_MMgrRoot *
**************************/
%nodefaultctor Standard_MMgrRoot;
class Standard_MMgrRoot {
	public:
		/****************** Allocate ******************/
		/**** md5 signature: fe66f55781cceb44453222208f3803c7 ****/
		%feature("compactdefaultargs") Allocate;
		%feature("autodoc", "Allocate specified number of bytes. the actually allocated space should be rounded up to double word size (4 bytes), as this is expected by implementation of some classes in occ (e.g. tcollection_asciistring).

Parameters
----------
theSize: Standard_Size

Returns
-------
Standard_Address
") Allocate;
		virtual Standard_Address Allocate(const Standard_Size theSize);

		/****************** Free ******************/
		/**** md5 signature: 85275be82aa982bcfcbc80e4e601d70c ****/
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "Frees previously allocated memory at specified address.

Parameters
----------
thePtr: Standard_Address

Returns
-------
None
") Free;
		virtual void Free(Standard_Address thePtr);

		/****************** Purge ******************/
		/**** md5 signature: a77f590fdbc3568f77c48d495eb164cd ****/
		%feature("compactdefaultargs") Purge;
		%feature("autodoc", "Purge internally cached unused memory blocks (if any) by releasing them to the operating system. must return non-zero if some memory has been actually released, or zero otherwise. if option isdestroyed is true, this means that memory manager is not expected to be used any more; note however that in general case it is still possible to have calls to that instance of memory manager after this (e.g. to free memory of static objects in occ). thus this option should command the memory manager to release any cached memory to the system and not cache any more, but still remain operable... //! default implementation does nothing and returns 0.

Parameters
----------
isDestroyed: bool,optional
	default value is Standard_False

Returns
-------
int
") Purge;
		virtual Standard_Integer Purge(Standard_Boolean isDestroyed = Standard_False);

		/****************** Reallocate ******************/
		/**** md5 signature: d180b7947abfec2b6c8212f4b462e1ac ****/
		%feature("compactdefaultargs") Reallocate;
		%feature("autodoc", "Reallocate previously allocated memory to contain at least thesize bytes. in case of success, new pointer is returned.

Parameters
----------
thePtr: Standard_Address
theSize: Standard_Size

Returns
-------
Standard_Address
") Reallocate;
		virtual Standard_Address Reallocate(Standard_Address thePtr, const Standard_Size theSize);

};


%extend Standard_MMgrRoot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Standard_ReadBuffer *
****************************/
/********************************
* class Standard_ReadLineBuffer *
********************************/
/*******************************
* class Standard_Static_Assert *
*******************************/
/*************************************
* class Standard_Static_Assert<true> *
*************************************/
class Standard_Static_Assert<true> {
	public:
		/****************** assert_ok ******************/
		/**** md5 signature: 76fafa2a6a4264953b09f0791484ff39 ****/
		%feature("compactdefaultargs") assert_ok;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") assert_ok;
		static void assert_ok();

};


%extend Standard_Static_Assert<true> {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Standard_Transient *
***************************/
class Standard_Transient {
	public:
typedef void base_type;
		/****************** Standard_Transient ******************/
		/**** md5 signature: dd92ecab4695d79cd189c5ef2bdf59de ****/
		%feature("compactdefaultargs") Standard_Transient;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Standard_Transient;
		 Standard_Transient();

		/****************** Standard_Transient ******************/
		/**** md5 signature: 0b27200416df796984d203ab179771be ****/
		%feature("compactdefaultargs") Standard_Transient;
		%feature("autodoc", "Copy constructor -- does nothing.

Parameters
----------
&: Standard_Transient

Returns
-------
None
") Standard_Transient;
		 Standard_Transient(const Standard_Transient &);

		/****************** DecrementRefCounter ******************/
		/**** md5 signature: a89aaf197af2027c94584579bca62fa3 ****/
		%feature("compactdefaultargs") DecrementRefCounter;
		%feature("autodoc", "Decrements the reference counter of this object; returns the decremented value.

Returns
-------
int
") DecrementRefCounter;
		Standard_Integer DecrementRefCounter();

		/****************** Delete ******************/
		/**** md5 signature: ef51856c130170c546ad4993294bfe08 ****/
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "Memory deallocator for transient classes.

Returns
-------
None
") Delete;
		virtual void Delete();

		/****************** DynamicType ******************/
		/**** md5 signature: d370e5c62c05e8a5bdc3f18913bf5f7f ****/
		%feature("compactdefaultargs") DynamicType;
		%feature("autodoc", "Returns a type descriptor about this object.

Returns
-------
opencascade::handle<Standard_Type>
") DynamicType;
		virtual const opencascade::handle<Standard_Type> & DynamicType();

		/****************** GetRefCount ******************/
		/**** md5 signature: 823f634c14521d142c777f76623eccd8 ****/
		%feature("compactdefaultargs") GetRefCount;
		%feature("autodoc", "Get the reference counter of this object.

Returns
-------
int
") GetRefCount;
		Standard_Integer GetRefCount();

		/****************** IncrementRefCounter ******************/
		/**** md5 signature: cb838e11007df4d1d17f859dd4af8576 ****/
		%feature("compactdefaultargs") IncrementRefCounter;
		%feature("autodoc", "Increments the reference counter of this object.

Returns
-------
None
") IncrementRefCounter;
		void IncrementRefCounter();

		/****************** IsInstance ******************/
		/**** md5 signature: ada1e4c621e6203b9a4801e8acf1514f ****/
		%feature("compactdefaultargs") IsInstance;
		%feature("autodoc", "Returns a true value if this is an instance of type.

Parameters
----------
theType: Standard_Type

Returns
-------
bool
") IsInstance;
		Standard_Boolean IsInstance(const opencascade::handle<Standard_Type> & theType);

		/****************** IsInstance ******************/
		/**** md5 signature: 099597629477d4b8f8b1cb3258beea20 ****/
		%feature("compactdefaultargs") IsInstance;
		%feature("autodoc", "Returns a true value if this is an instance of typename.

Parameters
----------
theTypeName: char *

Returns
-------
bool
") IsInstance;
		Standard_Boolean IsInstance(const char * theTypeName);

		/****************** IsKind ******************/
		/**** md5 signature: 09e998fa3503d5957eaed7054ae2afcb ****/
		%feature("compactdefaultargs") IsKind;
		%feature("autodoc", "Returns true if this is an instance of type or an instance of any class that inherits from type. note that multiple inheritance is not supported by occt rtti mechanism.

Parameters
----------
theType: Standard_Type

Returns
-------
bool
") IsKind;
		Standard_Boolean IsKind(const opencascade::handle<Standard_Type> & theType);

		/****************** IsKind ******************/
		/**** md5 signature: 58550aae76d5d8512087a99a5fcbee13 ****/
		%feature("compactdefaultargs") IsKind;
		%feature("autodoc", "Returns true if this is an instance of typename or an instance of any class that inherits from typename. note that multiple inheritance is not supported by occt rtti mechanism.

Parameters
----------
theTypeName: char *

Returns
-------
bool
") IsKind;
		Standard_Boolean IsKind(const char * theTypeName);

		/****************** This ******************/
		/**** md5 signature: 369ed7e5c72c58d7742ea0f5afa5efdd ****/
		%feature("compactdefaultargs") This;
		%feature("autodoc", "Returns non-const pointer to this object (like const_cast). for protection against creating handle to objects allocated in stack or call from constructor, it will raise exception standard_programerror if reference counter is zero.

Returns
-------
Standard_Transient *
") This;
		Standard_Transient * This();

		/****************** get_type_descriptor ******************/
		/**** md5 signature: 6ebd0b429659e35b396f6f75bfc59722 ****/
		%feature("compactdefaultargs") get_type_descriptor;
		%feature("autodoc", "Returns type descriptor of standard_transient class.

Returns
-------
opencascade::handle<Standard_Type>
") get_type_descriptor;
		static const opencascade::handle<Standard_Type> & get_type_descriptor();

		/****************** get_type_name ******************/
		/**** md5 signature: 0a54cf9404a0c6240157b48171ec4352 ****/
		%feature("compactdefaultargs") get_type_name;
		%feature("autodoc", "No available documentation.

Returns
-------
char *
") get_type_name;
		static const char * get_type_name();

};


%make_alias(Standard_Transient)

%extend Standard_Transient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class conditional *
********************/
/**********************************************
* class conditional<false,TypeTrue,TypeFalse> *
**********************************************/
/***********************************
* class direct_base_class_as_tuple *
***********************************/
/***************************************************************************
* class direct_base_class_as_tuple<std::tr2::__reflection_typelist<Ts...>> *
***************************************************************************/
/**************************
* class disable_deduction *
**************************/
/******************
* class enable_if *
******************/
/******************************
* class enable_if<true,_Type> *
******************************/
/***************
* class handle *
***************/
/*********************************
* class has_type<T,std::tuple<>> *
*********************************/
/****************************************
* class has_type<T,std::tuple<T,Ts...>> *
****************************************/
/****************************************
* class has_type<T,std::tuple<U,Ts...>> *
****************************************/
/*****************************
* class is_base_but_not_same *
*****************************/
/***********************************************************************************************************************
* class is_base_but_not_same<T1,T2,typenameopencascade::std::enable_if::type<opencascade::std::is_same::value<T1,T2>>> *
***********************************************************************************************************************/
/*******************
* class is_integer *
*******************/
/**********************
* class type_instance *
**********************/
/****************************
* class type_instance<void> *
****************************/
/*************************
* class Standard_Failure *
*************************/
/*************************
* class Standard_MMgrOpt *
*************************/
class Standard_MMgrOpt : public Standard_MMgrRoot {
	public:
		/****************** Standard_MMgrOpt ******************/
		/**** md5 signature: ad66856cdf9de23e8fbf98fc4dd21bab ****/
		%feature("compactdefaultargs") Standard_MMgrOpt;
		%feature("autodoc", "Constructor. if aclear is true, the allocated emmory will be nullified. for description of other parameters, see description of the class above.

Parameters
----------
aClear: bool,optional
	default value is Standard_True
aMMap: bool,optional
	default value is Standard_True
aCellSize: Standard_Size,optional
	default value is 200
aNbPages: int,optional
	default value is 10000
aThreshold: Standard_Size,optional
	default value is 40000

Returns
-------
None
") Standard_MMgrOpt;
		 Standard_MMgrOpt(const Standard_Boolean aClear = Standard_True, const Standard_Boolean aMMap = Standard_True, const Standard_Size aCellSize = 200, const Standard_Integer aNbPages = 10000, const Standard_Size aThreshold = 40000);

		/****************** Allocate ******************/
		/**** md5 signature: 6442d3c642cfcdb40262dcd5e55ab759 ****/
		%feature("compactdefaultargs") Allocate;
		%feature("autodoc", "Allocate asize bytes; see class description above.

Parameters
----------
aSize: Standard_Size

Returns
-------
Standard_Address
") Allocate;
		virtual Standard_Address Allocate(const Standard_Size aSize);

		/****************** Free ******************/
		/**** md5 signature: 99b92bf95d137ab3f4eb77330f696570 ****/
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "Free previously allocated block. note that block can not all blocks are released to the os by this method (see class description).

Parameters
----------
thePtr: Standard_Address

Returns
-------
None
") Free;
		virtual void Free(Standard_Address thePtr);

		/****************** Purge ******************/
		/**** md5 signature: 2628a66a189bef68740b282a4c5473b1 ****/
		%feature("compactdefaultargs") Purge;
		%feature("autodoc", "Release medium-sized blocks of memory in free lists to the system. returns number of actually freed blocks.

Parameters
----------
isDestroyed: bool

Returns
-------
int
") Purge;
		virtual Standard_Integer Purge(Standard_Boolean isDestroyed);

		/****************** Reallocate ******************/
		/**** md5 signature: 4f35659a2196551b32d4dfcffd290549 ****/
		%feature("compactdefaultargs") Reallocate;
		%feature("autodoc", "Reallocate previously allocated aptr to a new size; new address is returned. in case that aptr is null, the function behaves exactly as allocate.

Parameters
----------
thePtr: Standard_Address
theSize: Standard_Size

Returns
-------
Standard_Address
") Reallocate;
		virtual Standard_Address Reallocate(Standard_Address thePtr, const Standard_Size theSize);

};


%extend Standard_MMgrOpt {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def SetCallBackFunction(self):
		pass
	}
};

/*************************
* class Standard_MMgrRaw *
*************************/
class Standard_MMgrRaw : public Standard_MMgrRoot {
	public:
		/****************** Standard_MMgrRaw ******************/
		/**** md5 signature: f78bd7fece1a72bba3156a68497887ac ****/
		%feature("compactdefaultargs") Standard_MMgrRaw;
		%feature("autodoc", "Constructor; if aclear is true, the memory will be nullified upon allocation.

Parameters
----------
aClear: bool,optional
	default value is Standard_False

Returns
-------
None
") Standard_MMgrRaw;
		 Standard_MMgrRaw(const Standard_Boolean aClear = Standard_False);

		/****************** Allocate ******************/
		/**** md5 signature: 6442d3c642cfcdb40262dcd5e55ab759 ****/
		%feature("compactdefaultargs") Allocate;
		%feature("autodoc", "Allocate asize bytes .

Parameters
----------
aSize: Standard_Size

Returns
-------
Standard_Address
") Allocate;
		virtual Standard_Address Allocate(const Standard_Size aSize);

		/****************** Free ******************/
		/**** md5 signature: 99b92bf95d137ab3f4eb77330f696570 ****/
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "Free allocated memory. the pointer is nullified.

Parameters
----------
thePtr: Standard_Address

Returns
-------
None
") Free;
		virtual void Free(Standard_Address thePtr);

		/****************** Reallocate ******************/
		/**** md5 signature: 4f35659a2196551b32d4dfcffd290549 ****/
		%feature("compactdefaultargs") Reallocate;
		%feature("autodoc", "Reallocate aptr to the size asize. the new pointer is returned.

Parameters
----------
thePtr: Standard_Address
theSize: Standard_Size

Returns
-------
Standard_Address
") Reallocate;
		virtual Standard_Address Reallocate(Standard_Address thePtr, const Standard_Size theSize);

};


%extend Standard_MMgrRaw {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Standard_MMgrTBBalloc *
******************************/
class Standard_MMgrTBBalloc : public Standard_MMgrRoot {
	public:
		/****************** Standard_MMgrTBBalloc ******************/
		/**** md5 signature: 0ba7db7cc2974c9824fe719733bdda15 ****/
		%feature("compactdefaultargs") Standard_MMgrTBBalloc;
		%feature("autodoc", "Constructor; if aclear is true, the memory will be nullified upon allocation.

Parameters
----------
aClear: bool,optional
	default value is Standard_False

Returns
-------
None
") Standard_MMgrTBBalloc;
		 Standard_MMgrTBBalloc(const Standard_Boolean aClear = Standard_False);

		/****************** Allocate ******************/
		/**** md5 signature: 6442d3c642cfcdb40262dcd5e55ab759 ****/
		%feature("compactdefaultargs") Allocate;
		%feature("autodoc", "Allocate asize bytes .

Parameters
----------
aSize: Standard_Size

Returns
-------
Standard_Address
") Allocate;
		virtual Standard_Address Allocate(const Standard_Size aSize);

		/****************** Free ******************/
		/**** md5 signature: 99b92bf95d137ab3f4eb77330f696570 ****/
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "Free allocated memory.

Parameters
----------
thePtr: Standard_Address

Returns
-------
None
") Free;
		virtual void Free(Standard_Address thePtr);

		/****************** Reallocate ******************/
		/**** md5 signature: 4f35659a2196551b32d4dfcffd290549 ****/
		%feature("compactdefaultargs") Reallocate;
		%feature("autodoc", "Reallocate aptr to the size asize. the new pointer is returned.

Parameters
----------
thePtr: Standard_Address
theSize: Standard_Size

Returns
-------
Standard_Address
") Reallocate;
		virtual Standard_Address Reallocate(Standard_Address thePtr, const Standard_Size theSize);

};


%extend Standard_MMgrTBBalloc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Standard_Mutex *
***********************/
/*****************************
* class Standard_OutOfMemory *
*****************************/
class Standard_OutOfMemory : public Standard_ProgramError {
	public:
		/****************** Standard_OutOfMemory ******************/
		/**** md5 signature: ff033c9386be238db1eeeae9cdd548be ****/
		%feature("compactdefaultargs") Standard_OutOfMemory;
		%feature("autodoc", "Constructor is kept public for backward compatibility.

Parameters
----------
theMessage: char *,optional
	default value is 0

Returns
-------
None
") Standard_OutOfMemory;
		 Standard_OutOfMemory(const char * theMessage = 0);

		/****************** GetMessageString ******************/
		/**** md5 signature: 363c8632ad9d571f22bc0c66e7debebf ****/
		%feature("compactdefaultargs") GetMessageString;
		%feature("autodoc", "Returns error message.

Returns
-------
char *
") GetMessageString;
		const char * GetMessageString();

		/****************** NewInstance ******************/
		/**** md5 signature: e32a31c27ebaac0a085850d6c769c71e ****/
		%feature("compactdefaultargs") NewInstance;
		%feature("autodoc", "Returns global instance of exception.

Parameters
----------
theMessage: char *,optional
	default value is ""

Returns
-------
opencascade::handle<Standard_OutOfMemory>
") NewInstance;
		static opencascade::handle<Standard_OutOfMemory> NewInstance(const char * theMessage = "");

		/****************** Raise ******************/
		/**** md5 signature: 52297b82d875f5f61f56970e75bf80a5 ****/
		%feature("compactdefaultargs") Raise;
		%feature("autodoc", "Raises exception with specified message string.

Parameters
----------
theMessage: char *,optional
	default value is ""

Returns
-------
None
") Raise;
		static void Raise(const char * theMessage = "");

		/****************** Raise ******************/
		/**** md5 signature: 978a21c380259eaa0fef27d74b086dae ****/
		%feature("compactdefaultargs") Raise;
		%feature("autodoc", "Raises exception with specified message string.

Parameters
----------
theMessage: Standard_SStream

Returns
-------
None
") Raise;
		static void Raise(Standard_SStream & theMessage);

		/****************** SetMessageString ******************/
		/**** md5 signature: d5bbb32eb858a536bd5764be9d18926b ****/
		%feature("compactdefaultargs") SetMessageString;
		%feature("autodoc", "Sets error message.

Parameters
----------
aMessage: char *

Returns
-------
None
") SetMessageString;
		void SetMessageString(const char * aMessage);

};


%make_alias(Standard_OutOfMemory)

%extend Standard_OutOfMemory {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Standard_Persistent *
****************************/
class Standard_Persistent : public Standard_Transient {
	public:
		/****************** Standard_Persistent ******************/
		/**** md5 signature: 1010220e77e16d238565d1a022df9111 ****/
		%feature("compactdefaultargs") Standard_Persistent;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Standard_Persistent;
		 Standard_Persistent();


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetTypeNum() {
            return (Standard_Integer) $self->TypeNum();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetTypeNum(Standard_Integer value) {
            $self->TypeNum()=value;
            }
        };
};


%make_alias(Standard_Persistent)

%extend Standard_Persistent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Standard_Type *
**********************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class Standard_AncestorIterator:
	pass

@classnotwrapped
class Standard_Static_Assert:
	pass

@classnotwrapped
class Standard_CLocaleSentry:
	pass

@classnotwrapped
class Standard_Type:
	pass

@classnotwrapped
class Standard_Failure:
	pass

@classnotwrapped
class Standard_Mutex:
	pass

@classnotwrapped
class Standard_ReadLineBuffer:
	pass

@classnotwrapped
class Standard_ProgramError:
	pass

@classnotwrapped
class Standard_ReadBuffer:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
