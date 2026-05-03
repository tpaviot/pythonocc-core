/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_standard.html"
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
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Standard_Transient)
%wrap_handle(Standard_Persistent)
%wrap_handle(Standard_Type)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
typedef bool Standard_Boolean;
typedef uint8_t Standard_Byte;
typedef char Standard_Character;
typedef Standard_ErrorHandler::Callback Standard_ErrorHandlerCallback;
typedef char16_t Standard_ExtCharacter;
typedef NCollection_Shared<Standard_Mutex> Standard_HMutex;
typedef std::istream Standard_IStream;
typedef int Standard_Integer;
typedef std::ostream Standard_OStream;
typedef double Standard_Real;
typedef std::stringstream Standard_SStream;
typedef float Standard_ShortReal;
typedef size_t Standard_Size;
typedef size_t Standard_ThreadId;
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
/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

		/****** Standard::Allocate ******/
		/****** md5 signature: f215a5bb0ef9361a7d350ad280a8d984 ******/
		%feature("compactdefaultargs") Allocate;
		%feature("autodoc", "
Parameters
----------
theSize: size_t

Return
-------
void *

Description
-----------
Allocates memory blocks theSize - bytes to allocate.
") Allocate;
		static void * Allocate(const size_t theSize);

		/****** Standard::AllocateAligned ******/
		/****** md5 signature: cce00071f662e852041ad1d02dd110a4 ******/
		%feature("compactdefaultargs") AllocateAligned;
		%feature("autodoc", "
Parameters
----------
theSize: size_t
theAlign: size_t

Return
-------
void *

Description
-----------
Allocates aligned memory blocks. Should be used with CPU instructions which require specific alignment. For example: SSE requires 16 bytes, AVX requires 32 bytes. 
Parameter theSize bytes to allocate 
Parameter theAlign alignment in bytes.
") AllocateAligned;
		static void * AllocateAligned(const size_t theSize, const size_t theAlign);

		/****** Standard::AllocateOptimal ******/
		/****** md5 signature: 8ed8d94a75429163607322d4d3d05182 ******/
		%feature("compactdefaultargs") AllocateOptimal;
		%feature("autodoc", "
Parameters
----------
theSize: size_t

Return
-------
void *

Description
-----------
Allocates memory blocks theSize - bytes to allocate.
") AllocateOptimal;
		static void * AllocateOptimal(const size_t theSize);

		/****** Standard::GetAllocatorType ******/
		/****** md5 signature: e9a5a562f8900ba3133563f92652391b ******/
		%feature("compactdefaultargs") GetAllocatorType;
		%feature("autodoc", "Return
-------
Standard::AllocatorType

Description
-----------
Returns default allocator type.
") GetAllocatorType;
		static Standard::AllocatorType GetAllocatorType();

		/****** Standard::Purge ******/
		/****** md5 signature: 6c69b0395cbf27d664ca5ee4af0844f3 ******/
		%feature("compactdefaultargs") Purge;
		%feature("autodoc", "Return
-------
int

Description
-----------
Deallocates the storage retained on the free list and clears the list. Returns non-zero if some memory has been actually freed.
") Purge;
		static int Purge();

		/****** Standard::Reallocate ******/
		/****** md5 signature: 03a4cabba75d297b5521342cea517f41 ******/
		%feature("compactdefaultargs") Reallocate;
		%feature("autodoc", "
Parameters
----------
theStorage: void *
theNewSize: size_t

Return
-------
void *

Description
-----------
Reallocates memory blocks theStorage - previously allocated memory block theNewSize - new size in bytes.
") Reallocate;
		static void * Reallocate(void * const theStorage, const size_t theNewSize);

		/****** Standard::StackTrace ******/
		/****** md5 signature: 0012f3372a670cc870e94a55e4438df5 ******/
		%feature("compactdefaultargs") StackTrace;
		%feature("autodoc", "
Parameters
----------
theBuffer: char *
theBufferSize: int
theNbTraces: int
theContext: void * (optional, default to nullptr)
theNbTopSkip: int (optional, default to 0)

Return
-------
bool

Description
-----------
Appends backtrace to a message buffer. Stack information might be incomplete in case of stripped binaries. Implementation details: - Not implemented for Android, iOS, QNX and UWP platforms. - On non-Windows platform, this function is a wrapper to backtrace() system call. - On Windows (Win32) platform, the function loads DbgHelp.dll dynamically, and no stack will be provided if this or companion libraries (SymSrv.dll, SrcSrv.dll, etc.) will not be found; .pdb symbols should be provided on Windows platform to retrieve a meaningful stack; only x86_64 CPU architecture is currently implemented. 
Input parameter:[out] theBuffer message buffer to extend 
Input parameter: theBufferSize message buffer size 
Input parameter: theNbTraces maximum number of stack traces 
Input parameter: theContext optional platform-dependent frame context; in case of DbgHelp (Windows) should be a pointer to CONTEXT 
Input parameter: theNbTopSkip number of traces on top of the stack to skip 
Return: True on success.
") StackTrace;
		static bool StackTrace(char * theBuffer, const int theBufferSize, const int theNbTraces, void * theContext = nullptr, const int theNbTopSkip = 0);

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
		/****** Standard_ArrayStreamBuffer::Standard_ArrayStreamBuffer ******/
		/****** md5 signature: 72e8fa1633999e17c4113d48c2d43739 ******/
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
Main constructor. Passed pointer is stored as is (memory is NOT copied nor released with destructor). 
Parameter theBegin pointer to the beginning of pre-allocated buffer 
Parameter theSize length of pre-allocated buffer.
") Standard_ArrayStreamBuffer;
		 Standard_ArrayStreamBuffer(const char * theBegin, const size_t theSize);

		/****** Standard_ArrayStreamBuffer::Init ******/
		/****** md5 signature: d18d18891aa5348c727148263a9628cb ******/
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
(Re)-initialize the stream. Passed pointer is stored as is (memory is NOT copied nor released with destructor). 
Parameter theBegin pointer to the beginning of pre-allocated buffer 
Parameter theSize length of pre-allocated buffer.
") Init;
		virtual void Init(const char * theBegin, const size_t theSize);

		/****** Standard_ArrayStreamBuffer::xsgetn ******/
		/****** md5 signature: b267b647f4052c882d96b1f8c28965b8 ******/
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
		std::streamsize xsgetn(char * thePtr, std::streamsize theCount);

};


%extend Standard_ArrayStreamBuffer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Standard_CStringHasher *
*******************************/
class Standard_CStringHasher {
	public:
};


%extend Standard_CStringHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Standard_Condition *
***************************/
class Standard_Condition {
	public:
		/****** Standard_Condition::Standard_Condition ******/
		/****** md5 signature: 4cd571c0f0f7f8b799de87bf6d4f1c13 ******/
		%feature("compactdefaultargs") Standard_Condition;
		%feature("autodoc", "
Parameters
----------
theIsSet: bool (optional, default to false)

Return
-------
None

Description
-----------
Default constructor. 
Parameter theIsSet Initial flag state.
") Standard_Condition;
		 Standard_Condition(bool theIsSet = false);

		/****** Standard_Condition::Check ******/
		/****** md5 signature: 52fd734a22a046cbb88ae0ccca58aa9b ******/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Do not wait for signal - just test it state. 
Return: true if get event.
") Check;
		bool Check();

		/****** Standard_Condition::CheckReset ******/
		/****** md5 signature: 049fae38b8da71f610d2c071fdeabaa3 ******/
		%feature("compactdefaultargs") CheckReset;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Method perform two steps at-once - reset the event object and returns true if it was in signaling state. 
Return: true if event object was in signaling state.
") CheckReset;
		bool CheckReset();

		/****** Standard_Condition::Reset ******/
		/****** md5 signature: e3081050d274769a1cd4a93969da94c6 ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset event (unset signaling state).
") Reset;
		void Reset();

		/****** Standard_Condition::Set ******/
		/****** md5 signature: 181b8e1b82ef7e9d890c3afdd6aa1cdc ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Return
-------
None

Description
-----------
Set event into signaling state.
") Set;
		void Set();

		/****** Standard_Condition::Wait ******/
		/****** md5 signature: 023f5ce92e93d86d318568e61d652c61 ******/
		%feature("compactdefaultargs") Wait;
		%feature("autodoc", "Return
-------
None

Description
-----------
Wait for Event (infinity).
") Wait;
		void Wait();

		/****** Standard_Condition::Wait ******/
		/****** md5 signature: 5096e594d3ade921d37cf10c5a28c1f8 ******/
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
Wait for signal requested time. 
Parameter theTimeMilliseconds wait limit in milliseconds 
Return: true if get event.
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
		/****** Standard_ErrorHandler::Standard_ErrorHandler ******/
		/****** md5 signature: a8c6dc998d98c7fb44e04500e37ae49e ******/
		%feature("compactdefaultargs") Standard_ErrorHandler;
		%feature("autodoc", "Return
-------
None

Description
-----------
Create a ErrorHandler (to be used with try{}catch(){}). It uses the 'setjmp' and 'longjmp' routines.
") Standard_ErrorHandler;
		 Standard_ErrorHandler();

		/****** Standard_ErrorHandler::Destroy ******/
		/****** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ******/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Return
-------
None

Description
-----------
Unlinks and checks if there is a raised exception.
") Destroy;
		void Destroy();

		/****** Standard_ErrorHandler::Error ******/
		/****** md5 signature: bd573e87f5be1f5e40e6892a9e2654be ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Return
-------
std::variant<std::monostate, OSD_SIGBUS, OSD_SIGHUP, OSD_SIGILL, OSD_SIGINT, OSD_SIGKILL, OSD_SIGQUIT, OSD_SIGSEGV, OSD_SIGSYS, OSD_Exception_ACCESS_VIOLATION, OSD_Exception_ARRAY_BOUNDS_EXCEEDED, OSD_Exception_ILLEGAL_INSTRUCTION, OSD_Exception_IN_PAGE_ERROR, OSD_Exception_INT_OVERFLOW, OSD_Exception_INVALID_DISPOSITION, OSD_Exception_NONCONTINUABLE_EXCEPTION, OSD_Exception_PRIV_INSTRUCTION, OSD_Exception_STACK_OVERFLOW, OSD_Exception_STATUS_NO_MEMORY, Standard_DivideByZero, Standard_NumericError, Standard_Overflow, Standard_ProgramError, Standard_Underflow >

Description
-----------
Returns the current Error variant.
") Error;
		std::variant<std::monostate, OSD_SIGBUS, OSD_SIGHUP, OSD_SIGILL, OSD_SIGINT, OSD_SIGKILL, OSD_SIGQUIT, OSD_SIGSEGV, OSD_SIGSYS, OSD_Exception_ACCESS_VIOLATION, OSD_Exception_ARRAY_BOUNDS_EXCEEDED, OSD_Exception_ILLEGAL_INSTRUCTION, OSD_Exception_IN_PAGE_ERROR, OSD_Exception_INT_OVERFLOW, OSD_Exception_INVALID_DISPOSITION, OSD_Exception_NONCONTINUABLE_EXCEPTION, OSD_Exception_PRIV_INSTRUCTION, OSD_Exception_STACK_OVERFLOW, OSD_Exception_STATUS_NO_MEMORY, Standard_DivideByZero, Standard_NumericError, Standard_Overflow, Standard_ProgramError, Standard_Underflow > Error();

		/****** Standard_ErrorHandler::IsInTryBlock ******/
		/****** md5 signature: d134f416b5d62a40034b55a0fa3019c4 ******/
		%feature("compactdefaultargs") IsInTryBlock;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Test if the code is currently running in a try block.
") IsInTryBlock;
		static bool IsInTryBlock();

		/****** Standard_ErrorHandler::Raise ******/
		/****** md5 signature: 0f1cc51fa426098c031419cb18fee3f7 ******/
		%feature("compactdefaultargs") Raise;
		%feature("autodoc", "Return
-------
None

Description
-----------
Throws C++ exception if exception object set, otherwise prints error and terminates program.
") Raise;
		void Raise();

};


%extend Standard_ErrorHandler {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Label(self):
		pass
	}
};

/*************************
* class Standard_Failure *
*************************/
class Standard_Failure : public std::exception {
	public:
		class StringRef {};
		/****** Standard_Failure::Standard_Failure ******/
		/****** md5 signature: 28eca828ed422c117208722fa40f1b8f ******/
		%feature("compactdefaultargs") Standard_Failure;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a status object of type 'Failure'.
") Standard_Failure;
		 Standard_Failure();

		/****** Standard_Failure::Standard_Failure ******/
		/****** md5 signature: 2fec42df706fe9963e3e15a91cbc89fe ******/
		%feature("compactdefaultargs") Standard_Failure;
		%feature("autodoc", "
Parameters
----------
theOther: Standard_Failure

Return
-------
None

Description
-----------
Copy constructor.
") Standard_Failure;
		 Standard_Failure(const Standard_Failure & theOther);

		/****** Standard_Failure::Standard_Failure ******/
		/****** md5 signature: 3e870e9918cd1a5707b1947b78e85498 ******/
		%feature("compactdefaultargs") Standard_Failure;
		%feature("autodoc", "
Parameters
----------
theMessage: char *

Return
-------
None

Description
-----------
Creates a status object of type 'Failure' with message. 
Input parameter: theMessage exception description.
") Standard_Failure;
		 Standard_Failure(const char * theMessage);

		/****** Standard_Failure::Standard_Failure ******/
		/****** md5 signature: c50ba94a18bbfde63f0af247ef99000b ******/
		%feature("compactdefaultargs") Standard_Failure;
		%feature("autodoc", "
Parameters
----------
theMessage: char *
theStackTrace: char *

Return
-------
None

Description
-----------
Creates a status object of type 'Failure' with message and stack trace. 
Input parameter: theMessage exception description 
Input parameter: theStackTrace stack trace string.
") Standard_Failure;
		 Standard_Failure(const char * const theMessage, const char * const theStackTrace);

		/****** Standard_Failure::DefaultStackTraceLength ******/
		/****** md5 signature: fb8300be0c8d3f12660beeebe5a0b0af ******/
		%feature("compactdefaultargs") DefaultStackTraceLength;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the default length of stack trace to be captured by Standard_Failure constructor; 0 by default meaning no stack trace.
") DefaultStackTraceLength;
		static int DefaultStackTraceLength();

		/****** Standard_Failure::ExceptionType ******/
		/****** md5 signature: a6b1a95fd2b6d7c6444b9886a5476af7 ******/
		%feature("compactdefaultargs") ExceptionType;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns the exception type name. Default implementation returns 'Standard_Failure'. Derived classes override this to return their own type name.
") ExceptionType;
		virtual const char * ExceptionType();

		/****** Standard_Failure::GetMessageString ******/
		/****** md5 signature: 8ddbb6aa38a930c7f332f9aa82ed7595 ******/
		%feature("compactdefaultargs") GetMessageString;
		%feature("autodoc", "Return
-------
char *

Description
-----------
No available documentation.
") GetMessageString;
		const char * GetMessageString();

		/****** Standard_Failure::GetStackString ******/
		/****** md5 signature: d22606fcef057a25b2cf6db3446bb29d ******/
		%feature("compactdefaultargs") GetStackString;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns the stack trace string (empty string if not available).
") GetStackString;
		const char * GetStackString();

		/****** Standard_Failure::Print ******/
		/****** md5 signature: 938e58a4c905f64555b1dcca06400750 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
theStream: Standard_OStream

Description
-----------
Prints on the stream @p theStream the exception name followed by the error message. //! Note: there is a short-cut @c operator<< (Standard_OStream&, const Standard_Failure&).
") Print;
		void Print(std::ostream &OutValue);

		/****** Standard_Failure::SetDefaultStackTraceLength ******/
		/****** md5 signature: 3b64a6a9d00bde23e3c90a566ccce983 ******/
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
Sets default length of stack trace to be captured by Standard_Failure constructor.
") SetDefaultStackTraceLength;
		static void SetDefaultStackTraceLength(int theNbStackTraces);

		/****** Standard_Failure::what ******/
		/****** md5 signature: ed49fda67beb49036c3f43cc26d18b0f ******/
		%feature("compactdefaultargs") what;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns error message (implements std::exception interface). Returns empty string '' if no message was set.
") what;
		const char * what();

};


%extend Standard_Failure {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Standard_GUID *
**********************/
class Standard_GUID {
	public:
		/****** Standard_GUID::Standard_GUID ******/
		/****** md5 signature: ae9fa3ec5af1f747bcf22b886486dcf8 ******/
		%feature("compactdefaultargs") Standard_GUID;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a GUID with all zeros.
") Standard_GUID;
		 Standard_GUID();

		/****** Standard_GUID::Standard_GUID ******/
		/****** md5 signature: 8a97b4a08c6d1d26a56d4274a05e38c2 ******/
		%feature("compactdefaultargs") Standard_GUID;
		%feature("autodoc", "
Parameters
----------
aGuid: char *

Return
-------
None

Description
-----------
build a GUID from an ascii string with the following format: Length: 36 char '00000000-0000-0000-0000-000000000000'.
") Standard_GUID;
		 Standard_GUID(const char * const aGuid);

		/****** Standard_GUID::Standard_GUID ******/
		/****** md5 signature: 64e237b6a19b58b23703e4fdba5f8b34 ******/
		%feature("compactdefaultargs") Standard_GUID;
		%feature("autodoc", "
Parameters
----------
aGuid: char16_t *

Return
-------
None

Description
-----------
build a GUID from an unicode string with the following format: //! '00000000-0000-0000-0000-000000000000'.
") Standard_GUID;
		 Standard_GUID(const char16_t * const aGuid);

		/****** Standard_GUID::Standard_GUID ******/
		/****** md5 signature: 26f9499c268b9e94823ca391b4bcd15b ******/
		%feature("compactdefaultargs") Standard_GUID;
		%feature("autodoc", "
Parameters
----------
a32b: int
a16b1: char16_t
a16b2: char16_t
a16b3: char16_t
a8b1: uint8_t
a8b2: uint8_t
a8b3: uint8_t
a8b4: uint8_t
a8b5: uint8_t
a8b6: uint8_t

Return
-------
None

Description
-----------
Creates a GUID from the given components.
") Standard_GUID;
		 Standard_GUID(const int a32b, const char16_t a16b1, const char16_t a16b2, const char16_t a16b3, const uint8_t a8b1, const uint8_t a8b2, const uint8_t a8b3, const uint8_t a8b4, const uint8_t a8b5, const uint8_t a8b6);

		/****** Standard_GUID::Standard_GUID ******/
		/****** md5 signature: 435a715dadffe482f0e9565123ee8d36 ******/
		%feature("compactdefaultargs") Standard_GUID;
		%feature("autodoc", "
Parameters
----------
theUUID: Standard_UUID

Return
-------
None

Description
-----------
Creates a GUID from a Standard_UUID.
") Standard_GUID;
		 Standard_GUID(const Standard_UUID & theUUID);

		/****** Standard_GUID::Standard_GUID ******/
		/****** md5 signature: 911ebfe8fe23b5ec62c750eb0967b2e4 ******/
		%feature("compactdefaultargs") Standard_GUID;
		%feature("autodoc", "
Parameters
----------
theGuid: Standard_GUID

Return
-------
None

Description
-----------
Copy constructor.
") Standard_GUID;
		 Standard_GUID(const Standard_GUID & theGuid);

		/****** Standard_GUID::Assign ******/
		/****** md5 signature: 9024eb2a242a2a3aefc3dad65607b5f7 ******/
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
Assigns uid to this GUID.
") Assign;
		void Assign(const Standard_GUID & uid);

		/****** Standard_GUID::Assign ******/
		/****** md5 signature: 5bcdd94b0b22912e44ac51f2e664e8fd ******/
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
Assigns uid to this GUID.
") Assign;
		void Assign(const Standard_UUID & uid);

		/****** Standard_GUID::CheckGUIDFormat ******/
		/****** md5 signature: 05dba700f11029d7d6020b5af0c93967 ******/
		%feature("compactdefaultargs") CheckGUIDFormat;
		%feature("autodoc", "
Parameters
----------
aGuid: char *

Return
-------
bool

Description
-----------
Check the format of a GUID string. It checks the size, the position of the '-' and the correct size of fields.
") CheckGUIDFormat;
		static bool CheckGUIDFormat(const char * const aGuid);

		/****** Standard_GUID::IsNotSame ******/
		/****** md5 signature: 66158d3355a67bfdc643e7f7cdf4f981 ******/
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
Returns true if this GUID is not equal to uid.
") IsNotSame;
		bool IsNotSame(const Standard_GUID & uid);

		/****** Standard_GUID::IsSame ******/
		/****** md5 signature: d1c73a319bfda7cb5af411e64bc6a58a ******/
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
Returns true if this GUID is equal to uid.
") IsSame;
		bool IsSame(const Standard_GUID & uid);

		/****** Standard_GUID::ShallowDump ******/
		/****** md5 signature: 81ee27b22dec06425d33dc871c4cc32d ******/
		%feature("compactdefaultargs") ShallowDump;
		%feature("autodoc", "
Parameters
----------

Return
-------
aStream: Standard_OStream

Description
-----------
Display the GUID with the following format: //! '00000000-0000-0000-0000-000000000000'.
") ShallowDump;
		void ShallowDump(std::ostream &OutValue);

		/****** Standard_GUID::ToCString ******/
		/****** md5 signature: bf4dad3d25b8e651de1bf421311dfc4f ******/
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
translate the GUID into ascii string the aStrGuid is allocated by user. the guid have the following format: //! '00000000-0000-0000-0000-000000000000'.
") ToCString;
		void ToCString(const Standard_PCharacter aStrGuid);

		/****** Standard_GUID::ToExtString ******/
		/****** md5 signature: 941da789bbcb785e43f38cb8e2d7a14d ******/
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
translate the GUID into unicode string the aStrGuid is allocated by user. the guid have the following format: //! '00000000-0000-0000-0000-000000000000'.
") ToExtString;
		void ToExtString(const Standard_PExtCharacter aStrGuid);

		/****** Standard_GUID::ToUUID ******/
		/****** md5 signature: 258542f0f734663c8d8d8704ff5cd299 ******/
		%feature("compactdefaultargs") ToUUID;
		%feature("autodoc", "Return
-------
Standard_UUID

Description
-----------
Converts to Standard_UUID.
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
		/****** Standard_MMgrRoot::Allocate ******/
		/****** md5 signature: e237d4f1048747d6c3db2cf3b6306aa8 ******/
		%feature("compactdefaultargs") Allocate;
		%feature("autodoc", "
Parameters
----------
theSize: size_t

Return
-------
void *

Description
-----------
Allocate specified number of bytes. The actually allocated space should be rounded up to double word size (4 bytes), as this is expected by implementation of some classes in OCC (e.g. TCollection_AsciiString).
") Allocate;
		virtual void * Allocate(const size_t theSize);

		/****** Standard_MMgrRoot::Free ******/
		/****** md5 signature: d17cccee7e037dcb69509037cc59ccba ******/
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "
Parameters
----------
thePtr: void *

Return
-------
None

Description
-----------
Frees previously allocated memory at specified address.
") Free;
		virtual void Free(void * thePtr);

		/****** Standard_MMgrRoot::Purge ******/
		/****** md5 signature: e5d1513671c28424bb1f312963b8059f ******/
		%feature("compactdefaultargs") Purge;
		%feature("autodoc", "
Parameters
----------
isDestroyed: bool (optional, default to false)

Return
-------
int

Description
-----------
Purge internally cached unused memory blocks (if any) by releasing them to the operating system. Must return non-zero if some memory has been actually released, or zero otherwise. //! If option isDestroyed is True, this means that memory manager is not expected to be used any more; note however that in general case it is still possible to have calls to that instance of memory manager after this (e.g. to free memory of static objects in OCC). Thus this option should command the memory manager to release any cached memory to the system and not cache any more, but still remain operable... //! Default implementation does nothing and returns 0.
") Purge;
		virtual int Purge(bool isDestroyed = false);

		/****** Standard_MMgrRoot::Reallocate ******/
		/****** md5 signature: 51a2a941d1884f5d307b9795c5aafddb ******/
		%feature("compactdefaultargs") Reallocate;
		%feature("autodoc", "
Parameters
----------
thePtr: void *
theSize: size_t

Return
-------
void *

Description
-----------
Reallocate previously allocated memory to contain at least theSize bytes. In case of success, new pointer is returned.
") Reallocate;
		virtual void * Reallocate(void * thePtr, const size_t theSize);

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
/***************************
* class Standard_Transient *
***************************/
class Standard_Transient {
	public:
typedef void base_type;
		/****** Standard_Transient::Standard_Transient ******/
		/****** md5 signature: dd92ecab4695d79cd189c5ef2bdf59de ******/
		%feature("compactdefaultargs") Standard_Transient;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Standard_Transient;
		 Standard_Transient();

		/****** Standard_Transient::Standard_Transient ******/
		/****** md5 signature: 0b27200416df796984d203ab179771be ******/
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

		/****** Standard_Transient::DecrementRefCounter ******/
		/****** md5 signature: 365eb794a506eeaec90ec5196a51da00 ******/
		%feature("compactdefaultargs") DecrementRefCounter;
		%feature("autodoc", "Return
-------
int

Description
-----------
Decrements the reference counter of this object; returns the decremented value. Uses release ordering for the decrement to ensure all writes to the object are visible before the count reaches zero. An acquire fence is added only when the count reaches zero, ensuring proper synchronization before deletion. This is more efficient than using acq_rel for every decrement.
") DecrementRefCounter;
		int DecrementRefCounter();

		/****** Standard_Transient::Delete ******/
		/****** md5 signature: 1033f3d10272190e9265f60bb3fd5e6a ******/
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "Return
-------
None

Description
-----------
Memory deallocator for transient classes.
") Delete;
		virtual void Delete();

		/****** Standard_Transient::DynamicType ******/
		/****** md5 signature: d370e5c62c05e8a5bdc3f18913bf5f7f ******/
		%feature("compactdefaultargs") DynamicType;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Returns a type descriptor about this object.
") DynamicType;
		virtual const opencascade::handle<Standard_Type> & DynamicType();

		/****** Standard_Transient::GetRefCount ******/
		/****** md5 signature: a17cbf94056bce0ac5fe1cd78cc33afa ******/
		%feature("compactdefaultargs") GetRefCount;
		%feature("autodoc", "Return
-------
int

Description
-----------
Get the reference counter of this object.
") GetRefCount;
		int GetRefCount();

		/****** Standard_Transient::IncrementRefCounter ******/
		/****** md5 signature: 750593e1aaf93d2c0f8c8d422e1418c2 ******/
		%feature("compactdefaultargs") IncrementRefCounter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Increments the reference counter of this object. Uses relaxed memory ordering since incrementing only requires atomicity, not synchronization with other memory operations.
") IncrementRefCounter;
		void IncrementRefCounter();

		/****** Standard_Transient::IsInstance ******/
		/****** md5 signature: f01c298d688e1ce9650cbc47e86dd320 ******/
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
Returns a true value if this is an instance of Type.
") IsInstance;
		bool IsInstance(const opencascade::handle<Standard_Type> & theType);

		/****** Standard_Transient::IsInstance ******/
		/****** md5 signature: c78c8220d0b3019ba975df5d2424dbcb ******/
		%feature("compactdefaultargs") IsInstance;
		%feature("autodoc", "
Parameters
----------
theTypeName: char *

Return
-------
bool

Description
-----------
Returns a true value if this is an instance of TypeName.
") IsInstance;
		bool IsInstance(const char * const theTypeName);

		/****** Standard_Transient::IsKind ******/
		/****** md5 signature: 4b7704973ee3493e70a2f82b3fbbd28c ******/
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
Returns true if this is an instance of Type or an instance of any class that inherits from Type. Note that multiple inheritance is not supported by OCCT RTTI mechanism.
") IsKind;
		bool IsKind(const opencascade::handle<Standard_Type> & theType);

		/****** Standard_Transient::IsKind ******/
		/****** md5 signature: b543d4485d4331b6d10666e6c9948308 ******/
		%feature("compactdefaultargs") IsKind;
		%feature("autodoc", "
Parameters
----------
theTypeName: char *

Return
-------
bool

Description
-----------
Returns true if this is an instance of TypeName or an instance of any class that inherits from TypeName. Note that multiple inheritance is not supported by OCCT RTTI mechanism.
") IsKind;
		bool IsKind(const char * const theTypeName);

		/****** Standard_Transient::This ******/
		/****** md5 signature: 369ed7e5c72c58d7742ea0f5afa5efdd ******/
		%feature("compactdefaultargs") This;
		%feature("autodoc", "Return
-------
Standard_Transient *

Description
-----------
Returns non-const pointer to this object (like const_cast). For protection against creating handle to objects allocated in stack or call from constructor, it will raise exception Standard_ProgramError if reference counter is zero.
") This;
		Standard_Transient * This();

		/****** Standard_Transient::get_type_descriptor ******/
		/****** md5 signature: 6ebd0b429659e35b396f6f75bfc59722 ******/
		%feature("compactdefaultargs") get_type_descriptor;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Returns type descriptor of Standard_Transient class.
") get_type_descriptor;
		static const opencascade::handle<Standard_Type> & get_type_descriptor();

		/****** Standard_Transient::get_type_name ******/
		/****** md5 signature: a94e79c0295819f8f00f43f91727e0f3 ******/
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

    def __eq__(self, right):
        if not isinstance(right, Standard_Transient):
            return False
        return self.__eq_wrapper__(right)

    def __ne__(self, right):
        if not isinstance(right, Standard_Transient):
            return True
        return self.__ne_wrapper__(right)
    }
};

%extend Standard_Transient {
    bool __eq_wrapper__(const opencascade::handle<Standard_Transient> & other) {
        if (self==other) return true;
        else return false;
    }
    bool __ne_wrapper__(const opencascade::handle<Standard_Transient> & other) {
        if (self!=other) return true;
        else return false;
    }
    size_t __hash__() {
        return opencascade::hash(self);
    }
};
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
};


%extend Standard_UUID {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class disable_deduction *
**************************/
/***************
* class handle *
***************/
/****************************
* class hash<Standard_GUID> *
****************************/
/****************************************************
* class hash<opencascade::handle<TheTransientType>> *
****************************************************/
/*****************************
* class is_base_but_not_same *
*****************************/
/***********************************************************************************************************************
* class is_base_but_not_same<T1,T2,typenameopencascade::std::enable_if::type<opencascade::std::is_same::value<T1,T2>>> *
***********************************************************************************************************************/
/*******************
* class is_integer *
*******************/
/*************************
* class Standard_MMgrOpt *
*************************/
class Standard_MMgrOpt : public Standard_MMgrRoot {
	public:
		/****** Standard_MMgrOpt::Standard_MMgrOpt ******/
		/****** md5 signature: 398fa3be6d4f0921f64beaa5d582bef7 ******/
		%feature("compactdefaultargs") Standard_MMgrOpt;
		%feature("autodoc", "
Parameters
----------
aClear: bool (optional, default to true)
aMMap: bool (optional, default to true)
aCellSize: size_t (optional, default to 200)
aNbPages: int (optional, default to 10000)
aThreshold: size_t (optional, default to 40000)

Return
-------
None

Description
-----------
Constructor. If aClear is True, the allocated emmory will be nullified. For description of other parameters, see description of the class above.
") Standard_MMgrOpt;
		 Standard_MMgrOpt(const bool aClear = true, const bool aMMap = true, const size_t aCellSize = 200, const int aNbPages = 10000, const size_t aThreshold = 40000);

		/****** Standard_MMgrOpt::Allocate ******/
		/****** md5 signature: 2aae4ad4d4ab4a198d2f5d994643b19b ******/
		%feature("compactdefaultargs") Allocate;
		%feature("autodoc", "
Parameters
----------
aSize: size_t

Return
-------
void *

Description
-----------
Allocate aSize bytes; see class description above.
") Allocate;
		void * Allocate(const size_t aSize);

		/****** Standard_MMgrOpt::Free ******/
		/****** md5 signature: 7af4e560a4221bb4d15e90bd25581702 ******/
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "
Parameters
----------
thePtr: void *

Return
-------
None

Description
-----------
Free previously allocated block. Note that block can not all blocks are released to the OS by this method (see class description).
") Free;
		void Free(void * thePtr);

		/****** Standard_MMgrOpt::Purge ******/
		/****** md5 signature: cecae19f6b12369cebefb42c6e2983d6 ******/
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
Release medium-sized blocks of memory in free lists to the system. Returns number of actually freed blocks.
") Purge;
		int Purge(bool isDestroyed);

		/****** Standard_MMgrOpt::Reallocate ******/
		/****** md5 signature: ed56a3d7a972f19665c2e871e0f9f4f0 ******/
		%feature("compactdefaultargs") Reallocate;
		%feature("autodoc", "
Parameters
----------
thePtr: void *
theSize: size_t

Return
-------
void *

Description
-----------
Reallocate previously allocated aPtr to a new size; new address is returned. In case that aPtr is null, the function behaves exactly as Allocate.
") Reallocate;
		void * Reallocate(void * thePtr, const size_t theSize);

};


%extend Standard_MMgrOpt {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def SetCallBackFunction(self):
		pass
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
		/****** Standard_OutOfMemory::Standard_OutOfMemory ******/
		/****** md5 signature: 21384609791a44592993922aeb08a47b ******/
		%feature("compactdefaultargs") Standard_OutOfMemory;
		%feature("autodoc", "
Parameters
----------
theMessage: char * (optional, default to nullptr)

Return
-------
None

Description
-----------
Constructor is kept public for backward compatibility. 
Parameter theMessage optional error message.
") Standard_OutOfMemory;
		 Standard_OutOfMemory(const char * const theMessage = nullptr);

		/****** Standard_OutOfMemory::ExceptionType ******/
		/****** md5 signature: 14f21a631675376c2776e5a0c4b1afd4 ******/
		%feature("compactdefaultargs") ExceptionType;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns the exception type name.
") ExceptionType;
		const char * ExceptionType();

		/****** Standard_OutOfMemory::SetMessageString ******/
		/****** md5 signature: 73bcf3bc11e4acfe0da7adb99b51b2aa ******/
		%feature("compactdefaultargs") SetMessageString;
		%feature("autodoc", "
Parameters
----------
theMessage: char *

Return
-------
None

Description
-----------
Sets error message. 
Parameter theMessage error message (can be nullptr).
") SetMessageString;
		void SetMessageString(const char * const theMessage);

		/****** Standard_OutOfMemory::what ******/
		/****** md5 signature: ed49fda67beb49036c3f43cc26d18b0f ******/
		%feature("compactdefaultargs") what;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns error message (implements std::exception interface).
") what;
		const char * what();

};


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
		/****** Standard_Persistent::Standard_Persistent ******/
		/****** md5 signature: 1010220e77e16d238565d1a022df9111 ******/
		%feature("compactdefaultargs") Standard_Persistent;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Standard_Persistent;
		 Standard_Persistent();

		/****** Standard_Persistent::TypeNum ******/
		/****** md5 signature: ed89c0e1f49a9a4c35a8b1a392044112 ******/
		%feature("compactdefaultargs") TypeNum;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") TypeNum;
		int & TypeNum();

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
		/****** Standard_Type::Name ******/
		/****** md5 signature: f8ddb87900ed20587ddc7fa88a0b0422 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns the given name of the class type (get_type_name).
") Name;
		const char * Name();

		/****** Standard_Type::Parent ******/
		/****** md5 signature: 4c52a6847edce109e140e2343296b76f ******/
		%feature("compactdefaultargs") Parent;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Returns descriptor of the base class in the hierarchy.
") Parent;
		const opencascade::handle<Standard_Type> & Parent();

		/****** Standard_Type::Print ******/
		/****** md5 signature: 938e58a4c905f64555b1dcca06400750 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
theStream: Standard_OStream

Description
-----------
Prints type (address of descriptor + name) to a stream.
") Print;
		void Print(std::ostream &OutValue);

		/****** Standard_Type::Register ******/
		/****** md5 signature: a3b6c6cfcf83138052ef8de5282462e6 ******/
		%feature("compactdefaultargs") Register;
		%feature("autodoc", "
Parameters
----------
theInfo: std::type_info
theName: char *
theSize: size_t
theParent: Standard_Type

Return
-------
Standard_Type *

Description
-----------
Register a type; returns either new or existing descriptor. //! 
Parameter theInfo object stores system name of the class 
Parameter theName name of the class to be stored in Name field 
Parameter theSize size of the class instance 
Parameter theParent base class in the Transient hierarchy //! Note that this function is intended for use by STANDARD_RTTIEXT macros only.
") Register;
		static Standard_Type * Register(const std::type_info & theInfo, const char * theName, size_t theSize, const opencascade::handle<Standard_Type> & theParent);

		/****** Standard_Type::Size ******/
		/****** md5 signature: cbd8471ac8e6ef120a405ad6c4ba90d1 ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return
-------
size_t

Description
-----------
Returns the size of the class instance in bytes.
") Size;
		size_t Size();

		/****** Standard_Type::SubType ******/
		/****** md5 signature: 96215e29f9689f688889396c85f933cc ******/
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
Returns True if this type is the same as theOther, or inherits from theOther. Note that multiple inheritance is not supported.
") SubType;
		bool SubType(const opencascade::handle<Standard_Type> & theOther);

		/****** Standard_Type::SubType ******/
		/****** md5 signature: 0b630b96635e52c7912e6c136bf69509 ******/
		%feature("compactdefaultargs") SubType;
		%feature("autodoc", "
Parameters
----------
theOther: char *

Return
-------
bool

Description
-----------
Returns True if this type is the same as theOther, or inherits from theOther. Note that multiple inheritance is not supported.
") SubType;
		bool SubType(const char * const theOther);

		/****** Standard_Type::SystemName ******/
		/****** md5 signature: dbf67a1e46414df86e6cf26f7e28f465 ******/
		%feature("compactdefaultargs") SystemName;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns the system type name of the class (typeinfo.name).
") SystemName;
		const char * SystemName();

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
def standard_AllocateOptimal(*args):
	return standard.AllocateOptimal(*args)

@deprecated
def standard_GetAllocatorType(*args):
	return standard.GetAllocatorType(*args)

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
def Standard_Failure_DefaultStackTraceLength(*args):
	return Standard_Failure.DefaultStackTraceLength(*args)

@deprecated
def Standard_Failure_SetDefaultStackTraceLength(*args):
	return Standard_Failure.SetDefaultStackTraceLength(*args)

@deprecated
def Standard_GUID_CheckGUIDFormat(*args):
	return Standard_GUID.CheckGUIDFormat(*args)

@deprecated
def Standard_Type_Register(*args):
	return Standard_Type.Register(*args)

}
