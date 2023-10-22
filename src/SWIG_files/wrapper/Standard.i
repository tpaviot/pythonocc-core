/*
Copyright 2008-2023 Thomas Paviot (tpaviot@gmail.com)

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
https://www.opencascade.com/doc/occt-7.7.0/refman/html/package_standard.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<Standard_module.hxx>

//Dependencies
#include<NCollection_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import NCollection.i

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

/* python proxy classes for enums */
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
%wrap_handle(Standard_Failure)
%wrap_handle(Standard_OutOfMemory)
%wrap_handle(Standard_Persistent)
%wrap_handle(Standard_Type)
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
typedef NCollection_Shared<Standard_Mutex> Standard_HMutex;
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
typedef unsigned int Standard_UInteger;
typedef char16_t Standard_Utf16Char;
typedef char32_t Standard_Utf32Char;
typedef char Standard_Utf8Char;
typedef unsigned char Standard_Utf8UChar;
typedef wchar_t Standard_WideChar;
/* end typedefs declaration */

/*****************
* class Standard *
*****************/
%rename(standard) Standard;
class Standard {
	public:
		/****************** Allocate ******************/
		/**** md5 signature: 10c0da91eb50ef90687a2d94eada1414 ****/
		%feature("compactdefaultargs") Allocate;
		%feature("autodoc", "
Parameters
----------
aSize: Standard_Size

Return
-------
Standard_Address

Description
-----------
Allocates memory blocks asize - bytes to allocate.
") Allocate;
		static Standard_Address Allocate(const Standard_Size aSize);

		/****************** AllocateAligned ******************/
		/**** md5 signature: a54b3a9a279a6d719651145508c0e4f9 ****/
		%feature("compactdefaultargs") AllocateAligned;
		%feature("autodoc", "
Parameters
----------
theSize: Standard_Size
theAlign: Standard_Size

Return
-------
Standard_Address

Description
-----------
Allocates aligned memory blocks. should be used with cpu instructions which require specific alignment. for example: sse requires 16 bytes, avx requires 32 bytes. @param thesize bytes to allocate @param thealign alignment in bytes.
") AllocateAligned;
		static Standard_Address AllocateAligned(const Standard_Size theSize, const Standard_Size theAlign);

		/****************** Purge ******************/
		/**** md5 signature: 964c9688a284e751f362d44404b428a8 ****/
		%feature("compactdefaultargs") Purge;
		%feature("autodoc", "Return
-------
int

Description
-----------
Deallocates the storage retained on the free list and clears the list. returns non-zero if some memory has been actually freed.
") Purge;
		static Standard_Integer Purge();

		/****************** Reallocate ******************/
		/**** md5 signature: e02f1587334da5138d36de642aadf9d7 ****/
		%feature("compactdefaultargs") Reallocate;
		%feature("autodoc", "
Parameters
----------
aStorage: Standard_Address
aNewSize: Standard_Size

Return
-------
Standard_Address

Description
-----------
Reallocates memory blocks astorage - previously allocated memory block anewsize - new size in bytes.
") Reallocate;
		static Standard_Address Reallocate(const Standard_Address aStorage, const Standard_Size aNewSize);

		/****************** StackTrace ******************/
		/**** md5 signature: 11cdd0e88a61817ce1133c83a30be60d ****/
		%feature("compactdefaultargs") StackTrace;
		%feature("autodoc", "
Parameters
----------
theBuffer: char *
theBufferSize: int
theNbTraces: int
theContext: void * (optional, default to NULL)
theNbTopSkip: int (optional, default to 0)

Return
-------
bool

Description
-----------
Appends backtrace to a message buffer. stack information might be incomplete in case of stripped binaries. implementation details: - not implemented for android, ios, qnx and uwp platforms. - on non-windows platform, this function is a wrapper to backtrace() system call. - on windows (win32) platform, the function loads dbghelp.dll dynamically, and no stack will be provided if this or companion libraries (symsrv.dll, srcsrv.dll, etc.) will not be found; .pdb symbols should be provided on windows platform to retrieve a meaningful stack; only x86_64 cpu architecture is currently implemented. @param thebuffer [in] [out] message buffer to extend @param thebuffersize [in] message buffer size @param thenbtraces [in] maximum number of stack traces @param thecontext [in] optional platform-dependent frame context; in case of dbghelp (windows) should be a pointer to context @param thenbtopskip [in] number of traces on top of the stack to skip return true on success.
") StackTrace;
		static Standard_Boolean StackTrace(char * theBuffer, const int theBufferSize, const int theNbTraces, void * theContext = NULL, const int theNbTopSkip = 0);

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
		%feature("autodoc", "
Parameters
----------
theBegin: char *
theSize: size_t

Return
-------
None

Description
-----------
Main constructor. passed pointer is stored as is (memory is not copied nor released with destructor). @param thebegin pointer to the beginning of pre-allocated buffer @param thesize length of pre-allocated buffer.
") Standard_ArrayStreamBuffer;
		 Standard_ArrayStreamBuffer(const char * theBegin, const size_t theSize);

		/****************** Init ******************/
		/**** md5 signature: d18d18891aa5348c727148263a9628cb ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theBegin: char *
theSize: size_t

Return
-------
None

Description
-----------
(re)-initialize the stream. passed pointer is stored as is (memory is not copied nor released with destructor). @param thebegin pointer to the beginning of pre-allocated buffer @param thesize length of pre-allocated buffer.
") Init;
		virtual void Init(const char * theBegin, const size_t theSize);

		/****************** xsgetn ******************/
		/**** md5 signature: 43f5fa4c48aa65a7cd3ea36417590549 ****/
		%feature("compactdefaultargs") xsgetn;
		%feature("autodoc", "
Parameters
----------
thePtr: char *
theCount: std::streamsize

Return
-------
std::streamsize

Description
-----------
Read a bunch of bytes at once.
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
		%feature("autodoc", "
Parameters
----------
theIsSet: bool

Return
-------
None

Description
-----------
Default constructor. @param theisset initial flag state.
") Standard_Condition;
		 Standard_Condition(bool theIsSet);

		/****************** Check ******************/
		/**** md5 signature: 57f3f5b4239bc567be06341ec16789c7 ****/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Do not wait for signal - just test it state. return true if get event.
") Check;
		bool Check();

		/****************** CheckReset ******************/
		/**** md5 signature: 419d3cbf28fb47053f05bc50b9527979 ****/
		%feature("compactdefaultargs") CheckReset;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Method perform two steps at-once - reset the event object and returns true if it was in signaling state. return true if event object was in signaling state.
") CheckReset;
		bool CheckReset();

		/****************** Reset ******************/
		/**** md5 signature: 7beb446fe26b948f797f8de87e46c23d ****/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset event (unset signaling state).
") Reset;
		void Reset();

		/****************** Set ******************/
		/**** md5 signature: 1a3156a57ac62c26f68fc9a5cc67a188 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Return
-------
None

Description
-----------
Set event into signaling state.
") Set;
		void Set();

		/****************** Wait ******************/
		/**** md5 signature: b28e324626a345ee084669a721e91972 ****/
		%feature("compactdefaultargs") Wait;
		%feature("autodoc", "Return
-------
None

Description
-----------
Wait for event (infinity).
") Wait;
		void Wait();

		/****************** Wait ******************/
		/**** md5 signature: e3db043148e08f258771ac9c5c11ece8 ****/
		%feature("compactdefaultargs") Wait;
		%feature("autodoc", "
Parameters
----------
theTimeMilliseconds: int

Return
-------
bool

Description
-----------
Wait for signal requested time. @param thetimemilliseconds wait limit in milliseconds return true if get event.
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
		%feature("autodoc", "Return
-------
None

Description
-----------
Create a errorhandler (to be used with try{}catch(){}). it uses the 'setjmp' and 'longjmp' routines.
") Standard_ErrorHandler;
		 Standard_ErrorHandler();

		/****************** Catches ******************/
		/**** md5 signature: d365a924b1d2ee2e280fbe6bd7aa8ae8 ****/
		%feature("compactdefaultargs") Catches;
		%feature("autodoc", "
Parameters
----------
aType: Standard_Type

Return
-------
bool

Description
-----------
Returns 'true' if the caught exception has the same type or inherits from 'atype'.
") Catches;
		Standard_Boolean Catches(const opencascade::handle<Standard_Type> & aType);

		/****************** Destroy ******************/
		/**** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ****/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Return
-------
None

Description
-----------
Unlinks and checks if there is a raised exception.
") Destroy;
		void Destroy();

		/****************** Error ******************/
		/**** md5 signature: df37f33da5398b885a804d72f01daa6e ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Failure>

Description
-----------
Returns the current error.
") Error;
		opencascade::handle<Standard_Failure> Error();

		/****************** IsInTryBlock ******************/
		/**** md5 signature: c19793183a1c3a2e4ed9cccfe2984fd5 ****/
		%feature("compactdefaultargs") IsInTryBlock;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Test if the code is currently running in a try block.
") IsInTryBlock;
		static Standard_Boolean IsInTryBlock();

		/****************** LastCaughtError ******************/
		/**** md5 signature: ab9a6a78f95e9ef9c504fe10b3118b8c ****/
		%feature("compactdefaultargs") LastCaughtError;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Failure>

Description
-----------
Returns the caught exception.
") LastCaughtError;
		static opencascade::handle<Standard_Failure> LastCaughtError();

		/****************** Unlink ******************/
		/**** md5 signature: 292a8a7af4c9ec0d13d9cc55ed8c3f9b ****/
		%feature("compactdefaultargs") Unlink;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes handler from the handlers list.
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
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Standard_GUID;
		 Standard_GUID();

		/****************** Standard_GUID ******************/
		/**** md5 signature: 2a30bf614689d2f7c0743ebf3b02c695 ****/
		%feature("compactdefaultargs") Standard_GUID;
		%feature("autodoc", "
Parameters
----------
aGuid: str

Return
-------
None

Description
-----------
Build a guid from an ascii string with the following format: length: 36 char '00000000-0000-0000-0000-000000000000'.
") Standard_GUID;
		 Standard_GUID(Standard_CString aGuid);

		/****************** Standard_GUID ******************/
		/**** md5 signature: 8d0d307d0173ec7d9a9c9cec3e471f21 ****/
		%feature("compactdefaultargs") Standard_GUID;
		%feature("autodoc", "
Parameters
----------
aGuid: Standard_ExtString

Return
-------
None

Description
-----------
Build a guid from an unicode string with the following format: //! '00000000-0000-0000-0000-000000000000'.
") Standard_GUID;
		 Standard_GUID(const Standard_ExtString aGuid);

		/****************** Standard_GUID ******************/
		/**** md5 signature: 90d08c9aedbdee233cfe2c752f75ab0d ****/
		%feature("compactdefaultargs") Standard_GUID;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") Standard_GUID;
		 Standard_GUID(const Standard_Integer a32b, const Standard_ExtCharacter a16b1, const Standard_ExtCharacter a16b2, const Standard_ExtCharacter a16b3, const Standard_Byte a8b1, const Standard_Byte a8b2, const Standard_Byte a8b3, const Standard_Byte a8b4, const Standard_Byte a8b5, const Standard_Byte a8b6);

		/****************** Standard_GUID ******************/
		/**** md5 signature: d84ec169f70d0973702e9dc75249d278 ****/
		%feature("compactdefaultargs") Standard_GUID;
		%feature("autodoc", "
Parameters
----------
aGuid: Standard_UUID

Return
-------
None

Description
-----------
No available documentation.
") Standard_GUID;
		 Standard_GUID(const Standard_UUID & aGuid);

		/****************** Standard_GUID ******************/
		/**** md5 signature: e226b1f99a6fe2de676bd5062d0d32b1 ****/
		%feature("compactdefaultargs") Standard_GUID;
		%feature("autodoc", "
Parameters
----------
aGuid: Standard_GUID

Return
-------
None

Description
-----------
No available documentation.
") Standard_GUID;
		 Standard_GUID(const Standard_GUID & aGuid);

		/****************** Assign ******************/
		/**** md5 signature: 9df04502685554ebb980911332a1df4e ****/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "
Parameters
----------
uid: Standard_GUID

Return
-------
None

Description
-----------
No available documentation.
") Assign;
		void Assign(const Standard_GUID & uid);

		/****************** Assign ******************/
		/**** md5 signature: ff0c805d2db22ffcd6f2c8c6b5068bcd ****/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "
Parameters
----------
uid: Standard_UUID

Return
-------
None

Description
-----------
No available documentation.
") Assign;
		void Assign(const Standard_UUID & uid);

		/****************** CheckGUIDFormat ******************/
		/**** md5 signature: 2bc17afbd1c0c694e26a9eb83af8c0b3 ****/
		%feature("compactdefaultargs") CheckGUIDFormat;
		%feature("autodoc", "
Parameters
----------
aGuid: str

Return
-------
bool

Description
-----------
Check the format of a guid string. it checks the size, the position of the '-' and the correct size of fields.
") CheckGUIDFormat;
		static Standard_Boolean CheckGUIDFormat(Standard_CString aGuid);

		/****************** Hash ******************/
		/**** md5 signature: 2ca4d5ed910085d9b74b734c3ce42e00 ****/
		%feature("compactdefaultargs") Hash;
		%feature("autodoc", "
Parameters
----------
Upper: int

Return
-------
int

Description
-----------
Hash function for guid.
") Hash;
		Standard_Integer Hash(const Standard_Integer Upper);

		/****************** HashCode ******************/
		/**** md5 signature: 7ea33f659d5f35ed8ce799bbe4c3a63c ****/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "
Parameters
----------
theGUID: Standard_GUID
theUpperBound: int

Return
-------
int

Description
-----------
Computes a hash code for the given guid of the standard_integer type, in the range [1, theupperbound] @param theguid the guid which hash code is to be computed @param theupperbound the upper bound of the range a computing hash code must be within return a computed hash code, in the range [1, theupperbound].
") HashCode;
		static Standard_Integer HashCode(const Standard_GUID & theGUID, Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		/**** md5 signature: 1086fb5abd39daacfcf7d55bcaffafcd ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
string1: Standard_GUID
string2: Standard_GUID

Return
-------
bool

Description
-----------
Returns true when the two guid are the same.
") IsEqual;
		static Standard_Boolean IsEqual(const Standard_GUID & string1, const Standard_GUID & string2);

		/****************** IsNotSame ******************/
		/**** md5 signature: 3b6791d861dce7aeca50422c5b579eb8 ****/
		%feature("compactdefaultargs") IsNotSame;
		%feature("autodoc", "
Parameters
----------
uid: Standard_GUID

Return
-------
bool

Description
-----------
No available documentation.
") IsNotSame;
		Standard_Boolean IsNotSame(const Standard_GUID & uid);

		/****************** IsSame ******************/
		/**** md5 signature: 5c5e459d9a23ecee87186c559dacf95e ****/
		%feature("compactdefaultargs") IsSame;
		%feature("autodoc", "
Parameters
----------
uid: Standard_GUID

Return
-------
bool

Description
-----------
No available documentation.
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
		%feature("autodoc", "
Parameters
----------
aStrGuid: Standard_PCharacter

Return
-------
None

Description
-----------
Translate the guid into ascii string the astrguid is allocated by user. the guid have the following format: //! '00000000-0000-0000-0000-000000000000'.
") ToCString;
		void ToCString(const Standard_PCharacter aStrGuid);

		/****************** ToExtString ******************/
		/**** md5 signature: 941da789bbcb785e43f38cb8e2d7a14d ****/
		%feature("compactdefaultargs") ToExtString;
		%feature("autodoc", "
Parameters
----------
aStrGuid: Standard_PExtCharacter

Return
-------
None

Description
-----------
Translate the guid into unicode string the astrguid is allocated by user. the guid have the following format: //! '00000000-0000-0000-0000-000000000000'.
") ToExtString;
		void ToExtString(const Standard_PExtCharacter aStrGuid);

		/****************** ToUUID ******************/
		/**** md5 signature: 66354e1a5c9d79fdbd62794717432b59 ****/
		%feature("compactdefaultargs") ToUUID;
		%feature("autodoc", "Return
-------
Standard_UUID

Description
-----------
No available documentation.
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
		%feature("autodoc", "
Parameters
----------
theSize: Standard_Size

Return
-------
Standard_Address

Description
-----------
Allocate specified number of bytes. the actually allocated space should be rounded up to double word size (4 bytes), as this is expected by implementation of some classes in occ (e.g. tcollection_asciistring).
") Allocate;
		virtual Standard_Address Allocate(const Standard_Size theSize);

		/****************** Free ******************/
		/**** md5 signature: 85275be82aa982bcfcbc80e4e601d70c ****/
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "
Parameters
----------
thePtr: Standard_Address

Return
-------
None

Description
-----------
Frees previously allocated memory at specified address.
") Free;
		virtual void Free(Standard_Address thePtr);

		/****************** Purge ******************/
		/**** md5 signature: a77f590fdbc3568f77c48d495eb164cd ****/
		%feature("compactdefaultargs") Purge;
		%feature("autodoc", "
Parameters
----------
isDestroyed: bool (optional, default to Standard_False)

Return
-------
int

Description
-----------
Purge internally cached unused memory blocks (if any) by releasing them to the operating system. must return non-zero if some memory has been actually released, or zero otherwise. if option isdestroyed is true, this means that memory manager is not expected to be used any more; note however that in general case it is still possible to have calls to that instance of memory manager after this (e.g. to free memory of static objects in occ). thus this option should command the memory manager to release any cached memory to the system and not cache any more, but still remain operable... //! default implementation does nothing and returns 0.
") Purge;
		virtual Standard_Integer Purge(Standard_Boolean isDestroyed = Standard_False);

		/****************** Reallocate ******************/
		/**** md5 signature: d180b7947abfec2b6c8212f4b462e1ac ****/
		%feature("compactdefaultargs") Reallocate;
		%feature("autodoc", "
Parameters
----------
thePtr: Standard_Address
theSize: Standard_Size

Return
-------
Standard_Address

Description
-----------
Reallocate previously allocated memory to contain at least thesize bytes. in case of success, new pointer is returned.
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
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
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
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Standard_Transient;
		 Standard_Transient();

		/****************** Standard_Transient ******************/
		/**** md5 signature: 0b27200416df796984d203ab179771be ****/
		%feature("compactdefaultargs") Standard_Transient;
		%feature("autodoc", "
Parameters
----------
&: Standard_Transient

Return
-------
None

Description
-----------
Copy constructor -- does nothing.
") Standard_Transient;
		 Standard_Transient(const Standard_Transient &);

		/****************** DecrementRefCounter ******************/
		/**** md5 signature: a89aaf197af2027c94584579bca62fa3 ****/
		%feature("compactdefaultargs") DecrementRefCounter;
		%feature("autodoc", "Return
-------
int

Description
-----------
Decrements the reference counter of this object; returns the decremented value.
") DecrementRefCounter;
		Standard_Integer DecrementRefCounter();

		/****************** Delete ******************/
		/**** md5 signature: ef51856c130170c546ad4993294bfe08 ****/
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "Return
-------
None

Description
-----------
Memory deallocator for transient classes.
") Delete;
		virtual void Delete();

		/****************** DynamicType ******************/
		/**** md5 signature: d370e5c62c05e8a5bdc3f18913bf5f7f ****/
		%feature("compactdefaultargs") DynamicType;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Returns a type descriptor about this object.
") DynamicType;
		virtual const opencascade::handle<Standard_Type> & DynamicType();

		/****************** GetRefCount ******************/
		/**** md5 signature: 823f634c14521d142c777f76623eccd8 ****/
		%feature("compactdefaultargs") GetRefCount;
		%feature("autodoc", "Return
-------
int

Description
-----------
Get the reference counter of this object.
") GetRefCount;
		Standard_Integer GetRefCount();

		/****************** IncrementRefCounter ******************/
		/**** md5 signature: cb838e11007df4d1d17f859dd4af8576 ****/
		%feature("compactdefaultargs") IncrementRefCounter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Increments the reference counter of this object.
") IncrementRefCounter;
		void IncrementRefCounter();

		/****************** IsInstance ******************/
		/**** md5 signature: ada1e4c621e6203b9a4801e8acf1514f ****/
		%feature("compactdefaultargs") IsInstance;
		%feature("autodoc", "
Parameters
----------
theType: Standard_Type

Return
-------
bool

Description
-----------
Returns a true value if this is an instance of type.
") IsInstance;
		Standard_Boolean IsInstance(const opencascade::handle<Standard_Type> & theType);

		/****************** IsInstance ******************/
		/**** md5 signature: 099597629477d4b8f8b1cb3258beea20 ****/
		%feature("compactdefaultargs") IsInstance;
		%feature("autodoc", "
Parameters
----------
theTypeName: str

Return
-------
bool

Description
-----------
Returns a true value if this is an instance of typename.
") IsInstance;
		Standard_Boolean IsInstance(Standard_CString theTypeName);

		/****************** IsKind ******************/
		/**** md5 signature: 09e998fa3503d5957eaed7054ae2afcb ****/
		%feature("compactdefaultargs") IsKind;
		%feature("autodoc", "
Parameters
----------
theType: Standard_Type

Return
-------
bool

Description
-----------
Returns true if this is an instance of type or an instance of any class that inherits from type. note that multiple inheritance is not supported by occt rtti mechanism.
") IsKind;
		Standard_Boolean IsKind(const opencascade::handle<Standard_Type> & theType);

		/****************** IsKind ******************/
		/**** md5 signature: 58550aae76d5d8512087a99a5fcbee13 ****/
		%feature("compactdefaultargs") IsKind;
		%feature("autodoc", "
Parameters
----------
theTypeName: str

Return
-------
bool

Description
-----------
Returns true if this is an instance of typename or an instance of any class that inherits from typename. note that multiple inheritance is not supported by occt rtti mechanism.
") IsKind;
		Standard_Boolean IsKind(Standard_CString theTypeName);

		/****************** This ******************/
		/**** md5 signature: 369ed7e5c72c58d7742ea0f5afa5efdd ****/
		%feature("compactdefaultargs") This;
		%feature("autodoc", "Return
-------
Standard_Transient *

Description
-----------
Returns non-const pointer to this object (like const_cast). for protection against creating handle to objects allocated in stack or call from constructor, it will raise exception standard_programerror if reference counter is zero.
") This;
		Standard_Transient * This();

		/****************** get_type_descriptor ******************/
		/**** md5 signature: 6ebd0b429659e35b396f6f75bfc59722 ****/
		%feature("compactdefaultargs") get_type_descriptor;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Returns type descriptor of standard_transient class.
") get_type_descriptor;
		static const opencascade::handle<Standard_Type> & get_type_descriptor();

		/****************** get_type_name ******************/
		/**** md5 signature: 0a54cf9404a0c6240157b48171ec4352 ****/
		%feature("compactdefaultargs") get_type_name;
		%feature("autodoc", "Return
-------
char *

Description
-----------
No available documentation.
") get_type_name;
		static const char * get_type_name();

};


%make_alias(Standard_Transient)

%extend Standard_Transient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Standard_UUID *
**********************/
class Standard_UUID {
	public:
		uint32_t Data1;
		uint16_t Data2;
		uint16_t Data3;
		uint8_t Data4[8];
};


%extend Standard_UUID {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class direct_base_class_as_tuple *
***********************************/
/***************************************************************************
* class direct_base_class_as_tuple<std::tr2::__reflection_typelist<Ts...>> *
***************************************************************************/
/**************************
* class disable_deduction *
**************************/
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
class Standard_Failure : public Standard_Transient {
	public:
		class StringRef {};
		/****************** Standard_Failure ******************/
		/**** md5 signature: 28eca828ed422c117208722fa40f1b8f ****/
		%feature("compactdefaultargs") Standard_Failure;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a status object of type 'failure'.
") Standard_Failure;
		 Standard_Failure();

		/****************** Standard_Failure ******************/
		/**** md5 signature: 40dc4b89af78d8e64d2a9c054dd7a60f ****/
		%feature("compactdefaultargs") Standard_Failure;
		%feature("autodoc", "
Parameters
----------
f: Standard_Failure

Return
-------
None

Description
-----------
Copy constructor.
") Standard_Failure;
		 Standard_Failure(const Standard_Failure & f);

		/****************** Standard_Failure ******************/
		/**** md5 signature: bfea0bc1601bd488834fb05fabb35682 ****/
		%feature("compactdefaultargs") Standard_Failure;
		%feature("autodoc", "
Parameters
----------
theDesc: str

Return
-------
None

Description
-----------
Creates a status object of type 'failure'. @param thedesc [in] exception description.
") Standard_Failure;
		 Standard_Failure(Standard_CString theDesc);

		/****************** Standard_Failure ******************/
		/**** md5 signature: 598ccf8efeea31d62c1978fafbb81e3d ****/
		%feature("compactdefaultargs") Standard_Failure;
		%feature("autodoc", "
Parameters
----------
theDesc: str
theStackTrace: str

Return
-------
None

Description
-----------
Creates a status object of type 'failure' with stack trace. @param thedesc [in] exception description @param thestacktrace [in] associated stack trace.
") Standard_Failure;
		 Standard_Failure(Standard_CString theDesc, Standard_CString theStackTrace);

		/****************** DefaultStackTraceLength ******************/
		/**** md5 signature: 12c493f7dd93e3779bfe7abdb3051a3b ****/
		%feature("compactdefaultargs") DefaultStackTraceLength;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the default length of stack trace to be captured by standard_failure constructor; 0 by default meaning no stack trace.
") DefaultStackTraceLength;
		static Standard_Integer DefaultStackTraceLength();

		/****************** GetMessageString ******************/
		/**** md5 signature: 6cf28bba781d197207e850c1ab1a1376 ****/
		%feature("compactdefaultargs") GetMessageString;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns error message.
") GetMessageString;
		virtual Standard_CString GetMessageString();

		/****************** GetStackString ******************/
		/**** md5 signature: 5581b971f0facf6f7621539967764486 ****/
		%feature("compactdefaultargs") GetStackString;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the stack trace string.
") GetStackString;
		virtual Standard_CString GetStackString();

		/****************** Jump ******************/
		/**** md5 signature: e33ef5a1dbf8b90ad71d2447437ae607 ****/
		%feature("compactdefaultargs") Jump;
		%feature("autodoc", "Return
-------
None

Description
-----------
Used to throw cascade exception from c signal handler. on platforms that do not allow throwing c++ exceptions from this handler (e.g. linux), uses longjump to get to the current active signal handler, and only then is converted to c++ exception.
") Jump;
		void Jump();

		/****************** NewInstance ******************/
		/**** md5 signature: 8aca08fb5837ba2ac4dd2d68b9488c2c ****/
		%feature("compactdefaultargs") NewInstance;
		%feature("autodoc", "
Parameters
----------
theMessage: str

Return
-------
opencascade::handle<Standard_Failure>

Description
-----------
Used to construct an instance of the exception object as a handle. shall be used to protect against possible construction of exception object in c stack, which is dangerous since some of methods require that object was allocated dynamically.
") NewInstance;
		static opencascade::handle<Standard_Failure> NewInstance(Standard_CString theMessage);

		/****************** NewInstance ******************/
		/**** md5 signature: 47f811a9539bde6aaf8c4a9a851c69f7 ****/
		%feature("compactdefaultargs") NewInstance;
		%feature("autodoc", "
Parameters
----------
theMessage: str
theStackTrace: str

Return
-------
opencascade::handle<Standard_Failure>

Description
-----------
Used to construct an instance of the exception object as a handle.
") NewInstance;
		static opencascade::handle<Standard_Failure> NewInstance(Standard_CString theMessage, Standard_CString theStackTrace);


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** Raise ******************/
		/**** md5 signature: 91c037d4badacf1008e024b8b4afb779 ****/
		%feature("compactdefaultargs") Raise;
		%feature("autodoc", "
Parameters
----------
aMessage: str (optional, default to "")

Return
-------
None

Description
-----------
Raises an exception of type 'failure' and associates an error message to it. the message can be printed in an exception handler.
") Raise;
		static void Raise(Standard_CString aMessage = "");

		/****************** Raise ******************/
		/**** md5 signature: 03c559f09da27928a7c59a30a5a6ce57 ****/
		%feature("compactdefaultargs") Raise;
		%feature("autodoc", "
Parameters
----------
aReason: Standard_SStream

Return
-------
None

Description
-----------
Raises an exception of type 'failure' and associates an error message to it. the message can be constructed at run-time.
") Raise;
		static void Raise(const Standard_SStream & aReason);

		/****************** Reraise ******************/
		/**** md5 signature: 657c2a99b33e637f9ff1c137fe6e034b ****/
		%feature("compactdefaultargs") Reraise;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Reraise;
		void Reraise();

		/****************** Reraise ******************/
		/**** md5 signature: fdb5d161a9b733854991a035221e32d5 ****/
		%feature("compactdefaultargs") Reraise;
		%feature("autodoc", "
Parameters
----------
aMessage: str

Return
-------
None

Description
-----------
No available documentation.
") Reraise;
		void Reraise(Standard_CString aMessage);

		/****************** Reraise ******************/
		/**** md5 signature: 77af3b338ca71e96bbc8da8476367087 ****/
		%feature("compactdefaultargs") Reraise;
		%feature("autodoc", "
Parameters
----------
aReason: Standard_SStream

Return
-------
None

Description
-----------
Reraises a caught exception and changes its error message.
") Reraise;
		void Reraise(const Standard_SStream & aReason);

		/****************** SetDefaultStackTraceLength ******************/
		/**** md5 signature: 0a05375e4fbc3fd48e63e470f065603f ****/
		%feature("compactdefaultargs") SetDefaultStackTraceLength;
		%feature("autodoc", "
Parameters
----------
theNbStackTraces: int

Return
-------
None

Description
-----------
Sets default length of stack trace to be captured by standard_failure constructor.
") SetDefaultStackTraceLength;
		static void SetDefaultStackTraceLength(Standard_Integer theNbStackTraces);

		/****************** SetMessageString ******************/
		/**** md5 signature: b83b6b6b9d7cb98cd6a3d0dfaa1a4c66 ****/
		%feature("compactdefaultargs") SetMessageString;
		%feature("autodoc", "
Parameters
----------
theMessage: str

Return
-------
None

Description
-----------
Sets error message.
") SetMessageString;
		virtual void SetMessageString(Standard_CString theMessage);

		/****************** SetStackString ******************/
		/**** md5 signature: 0ac982cf92368c8ff9d3ab7dc330defa ****/
		%feature("compactdefaultargs") SetStackString;
		%feature("autodoc", "
Parameters
----------
theStack: str

Return
-------
None

Description
-----------
Sets the stack trace string.
") SetStackString;
		virtual void SetStackString(Standard_CString theStack);

};


%make_alias(Standard_Failure)

%extend Standard_Failure {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Standard_MMgrOpt *
*************************/
class Standard_MMgrOpt : public Standard_MMgrRoot {
	public:
		/****************** Standard_MMgrOpt ******************/
		/**** md5 signature: ad66856cdf9de23e8fbf98fc4dd21bab ****/
		%feature("compactdefaultargs") Standard_MMgrOpt;
		%feature("autodoc", "
Parameters
----------
aClear: bool (optional, default to Standard_True)
aMMap: bool (optional, default to Standard_True)
aCellSize: Standard_Size (optional, default to 200)
aNbPages: int (optional, default to 10000)
aThreshold: Standard_Size (optional, default to 40000)

Return
-------
None

Description
-----------
Constructor. if aclear is true, the allocated emmory will be nullified. for description of other parameters, see description of the class above.
") Standard_MMgrOpt;
		 Standard_MMgrOpt(const Standard_Boolean aClear = Standard_True, const Standard_Boolean aMMap = Standard_True, const Standard_Size aCellSize = 200, const Standard_Integer aNbPages = 10000, const Standard_Size aThreshold = 40000);

		/****************** Allocate ******************/
		/**** md5 signature: 6442d3c642cfcdb40262dcd5e55ab759 ****/
		%feature("compactdefaultargs") Allocate;
		%feature("autodoc", "
Parameters
----------
aSize: Standard_Size

Return
-------
Standard_Address

Description
-----------
Allocate asize bytes; see class description above.
") Allocate;
		virtual Standard_Address Allocate(const Standard_Size aSize);

		/****************** Free ******************/
		/**** md5 signature: 99b92bf95d137ab3f4eb77330f696570 ****/
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "
Parameters
----------
thePtr: Standard_Address

Return
-------
None

Description
-----------
Free previously allocated block. note that block can not all blocks are released to the os by this method (see class description).
") Free;
		virtual void Free(Standard_Address thePtr);

		/****************** Purge ******************/
		/**** md5 signature: 2628a66a189bef68740b282a4c5473b1 ****/
		%feature("compactdefaultargs") Purge;
		%feature("autodoc", "
Parameters
----------
isDestroyed: bool

Return
-------
int

Description
-----------
Release medium-sized blocks of memory in free lists to the system. returns number of actually freed blocks.
") Purge;
		virtual Standard_Integer Purge(Standard_Boolean isDestroyed);

		/****************** Reallocate ******************/
		/**** md5 signature: 4f35659a2196551b32d4dfcffd290549 ****/
		%feature("compactdefaultargs") Reallocate;
		%feature("autodoc", "
Parameters
----------
thePtr: Standard_Address
theSize: Standard_Size

Return
-------
Standard_Address

Description
-----------
Reallocate previously allocated aptr to a new size; new address is returned. in case that aptr is null, the function behaves exactly as allocate.
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
		%feature("autodoc", "
Parameters
----------
aClear: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Constructor; if aclear is true, the memory will be nullified upon allocation.
") Standard_MMgrRaw;
		 Standard_MMgrRaw(const Standard_Boolean aClear = Standard_False);

		/****************** Allocate ******************/
		/**** md5 signature: 6442d3c642cfcdb40262dcd5e55ab759 ****/
		%feature("compactdefaultargs") Allocate;
		%feature("autodoc", "
Parameters
----------
aSize: Standard_Size

Return
-------
Standard_Address

Description
-----------
Allocate asize bytes .
") Allocate;
		virtual Standard_Address Allocate(const Standard_Size aSize);

		/****************** Free ******************/
		/**** md5 signature: 99b92bf95d137ab3f4eb77330f696570 ****/
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "
Parameters
----------
thePtr: Standard_Address

Return
-------
None

Description
-----------
Free allocated memory. the pointer is nullified.
") Free;
		virtual void Free(Standard_Address thePtr);

		/****************** Reallocate ******************/
		/**** md5 signature: 4f35659a2196551b32d4dfcffd290549 ****/
		%feature("compactdefaultargs") Reallocate;
		%feature("autodoc", "
Parameters
----------
thePtr: Standard_Address
theSize: Standard_Size

Return
-------
Standard_Address

Description
-----------
Reallocate aptr to the size asize. the new pointer is returned.
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
		%feature("autodoc", "
Parameters
----------
aClear: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Constructor; if aclear is true, the memory will be nullified upon allocation.
") Standard_MMgrTBBalloc;
		 Standard_MMgrTBBalloc(const Standard_Boolean aClear = Standard_False);

		/****************** Allocate ******************/
		/**** md5 signature: 6442d3c642cfcdb40262dcd5e55ab759 ****/
		%feature("compactdefaultargs") Allocate;
		%feature("autodoc", "
Parameters
----------
aSize: Standard_Size

Return
-------
Standard_Address

Description
-----------
Allocate asize bytes .
") Allocate;
		virtual Standard_Address Allocate(const Standard_Size aSize);

		/****************** Free ******************/
		/**** md5 signature: 99b92bf95d137ab3f4eb77330f696570 ****/
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "
Parameters
----------
thePtr: Standard_Address

Return
-------
None

Description
-----------
Free allocated memory.
") Free;
		virtual void Free(Standard_Address thePtr);

		/****************** Reallocate ******************/
		/**** md5 signature: 4f35659a2196551b32d4dfcffd290549 ****/
		%feature("compactdefaultargs") Reallocate;
		%feature("autodoc", "
Parameters
----------
thePtr: Standard_Address
theSize: Standard_Size

Return
-------
Standard_Address

Description
-----------
Reallocate aptr to the size asize. the new pointer is returned.
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
		%feature("autodoc", "
Parameters
----------
theMessage: str (optional, default to 0)

Return
-------
None

Description
-----------
Constructor is kept public for backward compatibility.
") Standard_OutOfMemory;
		 Standard_OutOfMemory(Standard_CString theMessage = 0);

		/****************** GetMessageString ******************/
		/**** md5 signature: 363c8632ad9d571f22bc0c66e7debebf ****/
		%feature("compactdefaultargs") GetMessageString;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns error message.
") GetMessageString;
		Standard_CString GetMessageString();

		/****************** NewInstance ******************/
		/**** md5 signature: c920a2e02bad464ffbe4c7662f3298ea ****/
		%feature("compactdefaultargs") NewInstance;
		%feature("autodoc", "
Parameters
----------
theMessage: str (optional, default to "")

Return
-------
opencascade::handle<Standard_OutOfMemory>

Description
-----------
Returns global instance of exception.
") NewInstance;
		static opencascade::handle<Standard_OutOfMemory> NewInstance(Standard_CString theMessage = "");

		/****************** NewInstance ******************/
		/**** md5 signature: 6c918de0ecdc1c640cd677eed73b0564 ****/
		%feature("compactdefaultargs") NewInstance;
		%feature("autodoc", "
Parameters
----------
theMessage: str
theStackTrace: str

Return
-------
opencascade::handle<Standard_OutOfMemory>

Description
-----------
Returns global instance of exception.
") NewInstance;
		static opencascade::handle<Standard_OutOfMemory> NewInstance(Standard_CString theMessage, Standard_CString theStackTrace);

		/****************** Raise ******************/
		/**** md5 signature: 52297b82d875f5f61f56970e75bf80a5 ****/
		%feature("compactdefaultargs") Raise;
		%feature("autodoc", "
Parameters
----------
theMessage: str (optional, default to "")

Return
-------
None

Description
-----------
Raises exception with specified message string.
") Raise;
		static void Raise(Standard_CString theMessage = "");

		/****************** Raise ******************/
		/**** md5 signature: 978a21c380259eaa0fef27d74b086dae ****/
		%feature("compactdefaultargs") Raise;
		%feature("autodoc", "
Parameters
----------
theMessage: Standard_SStream

Return
-------
None

Description
-----------
Raises exception with specified message string.
") Raise;
		static void Raise(Standard_SStream & theMessage);

		/****************** SetMessageString ******************/
		/**** md5 signature: d5bbb32eb858a536bd5764be9d18926b ****/
		%feature("compactdefaultargs") SetMessageString;
		%feature("autodoc", "
Parameters
----------
aMessage: str

Return
-------
None

Description
-----------
Sets error message.
") SetMessageString;
		void SetMessageString(Standard_CString aMessage);

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
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
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
%nodefaultctor Standard_Type;
class Standard_Type : public Standard_Transient {
	public:
		/****************** Name ******************/
		/**** md5 signature: dbebb34a777ed2cce75639b98f8c3cbf ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the given name of the class type (get_type_name).
") Name;
		Standard_CString Name();

		/****************** Parent ******************/
		/**** md5 signature: 4c52a6847edce109e140e2343296b76f ****/
		%feature("compactdefaultargs") Parent;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Returns descriptor of the base class in the hierarchy.
") Parent;
		const opencascade::handle<Standard_Type> & Parent();


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** Register ******************/
		/**** md5 signature: 8e6b8df94dcb0fc4b1d9d92877cf9314 ****/
		%feature("compactdefaultargs") Register;
		%feature("autodoc", "
Parameters
----------
theSystemName: char *
theName: char *
theSize: Standard_Size
theParent: Standard_Type

Return
-------
Standard_Type *

Description
-----------
Register a type; returns either new or existing descriptor. //! @param thesystemname name of the class as returned by typeid(class).name() @param thename name of the class to be stored in name field @param thesize size of the class instance @param theparent base class in the transient hierarchy //! note that this function is intended for use by opencascade::type_instance only. .
") Register;
		static Standard_Type * Register(const char * theSystemName, const char * theName, Standard_Size theSize, const opencascade::handle<Standard_Type> & theParent);

		/****************** Size ******************/
		/**** md5 signature: 84043604cd4d694d29fbe523f032e5d8 ****/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return
-------
Standard_Size

Description
-----------
Returns the size of the class instance in bytes.
") Size;
		Standard_Size Size();

		/****************** SubType ******************/
		/**** md5 signature: c3ab17d05fad515519faa56550ba2910 ****/
		%feature("compactdefaultargs") SubType;
		%feature("autodoc", "
Parameters
----------
theOther: Standard_Type

Return
-------
bool

Description
-----------
Returns true if this type is the same as theother, or inherits from theother. note that multiple inheritance is not supported.
") SubType;
		Standard_Boolean SubType(const opencascade::handle<Standard_Type> & theOther);

		/****************** SubType ******************/
		/**** md5 signature: e4908284e5a25023425f29a02b92ebdc ****/
		%feature("compactdefaultargs") SubType;
		%feature("autodoc", "
Parameters
----------
theOther: str

Return
-------
bool

Description
-----------
Returns true if this type is the same as theother, or inherits from theother. note that multiple inheritance is not supported.
") SubType;
		Standard_Boolean SubType(Standard_CString theOther);

		/****************** SystemName ******************/
		/**** md5 signature: 3db3c1797a8dec854871c6caaa05c939 ****/
		%feature("compactdefaultargs") SystemName;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the system type name of the class (typeinfo.name).
") SystemName;
		Standard_CString SystemName();

};


%make_alias(Standard_Type)

%extend Standard_Type {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def standard_Allocate(*args):
	return standard.Allocate(*args)

@deprecated
def standard_AllocateAligned(*args):
	return standard.AllocateAligned(*args)

@deprecated
def standard_Purge(*args):
	return standard.Purge(*args)

@deprecated
def standard_Reallocate(*args):
	return standard.Reallocate(*args)

@deprecated
def standard_StackTrace(*args):
	return standard.StackTrace(*args)

@deprecated
def Standard_ErrorHandler_IsInTryBlock(*args):
	return Standard_ErrorHandler.IsInTryBlock(*args)

@deprecated
def Standard_ErrorHandler_LastCaughtError(*args):
	return Standard_ErrorHandler.LastCaughtError(*args)

@deprecated
def Standard_GUID_CheckGUIDFormat(*args):
	return Standard_GUID.CheckGUIDFormat(*args)

@deprecated
def Standard_GUID_HashCode(*args):
	return Standard_GUID.HashCode(*args)

@deprecated
def Standard_GUID_IsEqual(*args):
	return Standard_GUID.IsEqual(*args)

@deprecated
def Standard_Failure_DefaultStackTraceLength(*args):
	return Standard_Failure.DefaultStackTraceLength(*args)

@deprecated
def Standard_Failure_NewInstance(*args):
	return Standard_Failure.NewInstance(*args)

@deprecated
def Standard_Failure_NewInstance(*args):
	return Standard_Failure.NewInstance(*args)

@deprecated
def Standard_Failure_Raise(*args):
	return Standard_Failure.Raise(*args)

@deprecated
def Standard_Failure_Raise(*args):
	return Standard_Failure.Raise(*args)

@deprecated
def Standard_Failure_SetDefaultStackTraceLength(*args):
	return Standard_Failure.SetDefaultStackTraceLength(*args)

@deprecated
def Standard_OutOfMemory_NewInstance(*args):
	return Standard_OutOfMemory.NewInstance(*args)

@deprecated
def Standard_OutOfMemory_NewInstance(*args):
	return Standard_OutOfMemory.NewInstance(*args)

@deprecated
def Standard_OutOfMemory_Raise(*args):
	return Standard_OutOfMemory.Raise(*args)

@deprecated
def Standard_OutOfMemory_Raise(*args):
	return Standard_OutOfMemory.Raise(*args)

@deprecated
def Standard_Type_Register(*args):
	return Standard_Type.Register(*args)

}
