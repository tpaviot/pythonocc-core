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
/* public enums */
enum Standard_HandlerStatus {
	Standard_HandlerVoid = 0,
	Standard_HandlerJumped = 1,
	Standard_HandlerProcessed = 2,
};

/* end public enums declaration */

/* handles */
%wrap_handle(Standard_Transient)
%wrap_handle(Standard_OutOfMemory)
%wrap_handle(Standard_Persistent)
/* end handles declaration */

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
typedef unsigned __int8 uint8_t;
typedef unsigned __int16 uint16_t;
typedef unsigned __int32 uint32_t;
typedef unsigned __int64 uint64_t;
typedef signed __int8 int8_t;
typedef signed __int16 int16_t;
typedef signed __int32 int32_t;
typedef signed __int64 int64_t;
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
typedef Standard_Size Standard_ThreadId;
typedef Standard_ErrorHandler::Callback Standard_ErrorHandlerCallback;
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
		%feature("compactdefaultargs") Allocate;
		%feature("autodoc", "* Allocates memory blocks aSize - bytes to allocate
	:param aSize:
	:type aSize: Standard_Size
	:rtype: Standard_Address") Allocate;
		static Standard_Address Allocate (const Standard_Size aSize);

		/****************** AllocateAligned ******************/
		%feature("compactdefaultargs") AllocateAligned;
		%feature("autodoc", "* Allocates aligned memory blocks. Should be used with CPU instructions which require specific alignment. For example: SSE requires 16 bytes, AVX requires 32 bytes. @param theSize bytes to allocate @param theAlign alignment in bytes
	:param theSize:
	:type theSize: Standard_Size
	:param theAlign:
	:type theAlign: Standard_Size
	:rtype: Standard_Address") AllocateAligned;
		static Standard_Address AllocateAligned (const Standard_Size theSize,const Standard_Size theAlign);

		/****************** Purge ******************/
		%feature("compactdefaultargs") Purge;
		%feature("autodoc", "* Deallocates the storage retained on the free list and clears the list. Returns non-zero if some memory has been actually freed.
	:rtype: int") Purge;
		static Standard_Integer Purge ();

		/****************** Reallocate ******************/
		%feature("compactdefaultargs") Reallocate;
		%feature("autodoc", "* Reallocates memory blocks aStorage - previously allocated memory block aNewSize - new size in bytes
	:param aStorage:
	:type aStorage: Standard_Address
	:param aNewSize:
	:type aNewSize: Standard_Size
	:rtype: Standard_Address") Reallocate;
		static Standard_Address Reallocate (const Standard_Address aStorage,const Standard_Size aNewSize);

};


%extend Standard {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class Standard_ArrayStreamBuffer *
***********************************/
class Standard_ArrayStreamBuffer : public std::streambuf {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* (Re)-initialize the stream. Passed pointer is stored as is (memory is NOT copied nor released with destructor). @param theBegin pointer to the beggining of pre-allocated buffer @param theSize length of pre-allocated buffer
	:param theBegin:
	:type theBegin: char *
	:param theSize:
	:type theSize: size_t
	:rtype: void") Init;
		virtual void Init (const char * theBegin,const size_t theSize);

		/****************** Standard_ArrayStreamBuffer ******************/
		%feature("compactdefaultargs") Standard_ArrayStreamBuffer;
		%feature("autodoc", "* Main constructor. Passed pointer is stored as is (memory is NOT copied nor released with destructor). @param theBegin pointer to the beggining of pre-allocated buffer @param theSize length of pre-allocated buffer
	:param theBegin:
	:type theBegin: char *
	:param theSize:
	:type theSize: size_t
	:rtype: None") Standard_ArrayStreamBuffer;
		 Standard_ArrayStreamBuffer (const char * theBegin,const size_t theSize);

		/****************** xsgetn ******************/
		%feature("compactdefaultargs") xsgetn;
		%feature("autodoc", "* Read a bunch of bytes at once.
	:param thePtr:
	:type thePtr: char *
	:param theCount:
	:type theCount: std::streamsize
	:rtype: std::streamsize") xsgetn;
		virtual std::streamsize xsgetn (char * thePtr,std::streamsize theCount);

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
		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "* Do not wait for signal - just test it state. returns true if get event
	:rtype: bool") Check;
		bool Check ();

		/****************** CheckReset ******************/
		%feature("compactdefaultargs") CheckReset;
		%feature("autodoc", "* Method perform two steps at-once - reset the event object and returns true if it was in signaling state. returns true if event object was in signaling state.
	:rtype: bool") CheckReset;
		bool CheckReset ();

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "* Reset event (unset signaling state)
	:rtype: None") Reset;
		void Reset ();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Set event into signaling state.
	:rtype: None") Set;
		void Set ();

		/****************** Standard_Condition ******************/
		%feature("compactdefaultargs") Standard_Condition;
		%feature("autodoc", "* Default constructor. @param theIsSet Initial flag state
	:param theIsSet:
	:type theIsSet: bool
	:rtype: None") Standard_Condition;
		 Standard_Condition (bool theIsSet);

		/****************** Wait ******************/
		%feature("compactdefaultargs") Wait;
		%feature("autodoc", "* Wait for Event (infinity).
	:rtype: None") Wait;
		void Wait ();

		/****************** Wait ******************/
		%feature("compactdefaultargs") Wait;
		%feature("autodoc", "* Wait for signal requested time. @param theTimeMilliseconds wait limit in milliseconds returns true if get event
	:param theTimeMilliseconds:
	:type theTimeMilliseconds: int
	:rtype: bool") Wait;
		bool Wait (int theTimeMilliseconds);

};


%extend Standard_Condition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Standard_ErrorHandler *
******************************/
class Standard_ErrorHandler {
	public:
		class Callback {};
		/****************** Catches ******************/
		%feature("compactdefaultargs") Catches;
		%feature("autodoc", "* Returns 'True' if the caught exception has the same type or inherits from 'aType'
	:param aType:
	:type aType: Standard_Type
	:rtype: bool") Catches;
		Standard_Boolean Catches (const opencascade::handle<Standard_Type> & aType);

		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "* Unlinks and checks if there is a raised exception.
	:rtype: None") Destroy;
		void Destroy ();

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "* Returns the current Error.
	:rtype: opencascade::handle<Standard_Failure>") Error;
		opencascade::handle<Standard_Failure> Error ();

		/****************** IsInTryBlock ******************/
		%feature("compactdefaultargs") IsInTryBlock;
		%feature("autodoc", "* Test if the code is currently running in a try block
	:rtype: bool") IsInTryBlock;
		static Standard_Boolean IsInTryBlock ();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns label for jump
	:rtype: Standard_JmpBuf") Label;
		Standard_JmpBuf & Label ();

		/****************** LastCaughtError ******************/
		%feature("compactdefaultargs") LastCaughtError;
		%feature("autodoc", "* Returns the caught exception.
	:rtype: opencascade::handle<Standard_Failure>") LastCaughtError;
		static opencascade::handle<Standard_Failure> LastCaughtError ();

		/****************** Standard_ErrorHandler ******************/
		%feature("compactdefaultargs") Standard_ErrorHandler;
		%feature("autodoc", "* Create a ErrorHandler (to be used with try{}catch(){}). It uses the 'setjmp' and 'longjmp' routines.
	:rtype: None") Standard_ErrorHandler;
		 Standard_ErrorHandler ();

		/****************** Unlink ******************/
		%feature("compactdefaultargs") Unlink;
		%feature("autodoc", "* Removes handler from the handlers list
	:rtype: None") Unlink;
		void Unlink ();

};


%extend Standard_ErrorHandler {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Standard_GUID *
**********************/
class Standard_GUID {
	public:
		/****************** Assign ******************/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", ":param uid:
	:type uid: Standard_GUID
	:rtype: None") Assign;
		void Assign (const Standard_GUID & uid);

		/****************** Assign ******************/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", ":param uid:
	:type uid: Standard_UUID
	:rtype: None") Assign;
		void Assign (const Standard_UUID & uid);

		/****************** CheckGUIDFormat ******************/
		%feature("compactdefaultargs") CheckGUIDFormat;
		%feature("autodoc", "* Check the format of a GUID string. It checks the size, the position of the '-' and the correct size of fields.
	:param aGuid:
	:type aGuid: char *
	:rtype: bool") CheckGUIDFormat;
		static Standard_Boolean CheckGUIDFormat (const char * aGuid);

		/****************** Hash ******************/
		%feature("compactdefaultargs") Hash;
		%feature("autodoc", "* Hash function for GUID.
	:param Upper:
	:type Upper: int
	:rtype: int") Hash;
		Standard_Integer Hash (const Standard_Integer Upper);

		/****************** HashCode ******************/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "* Computes a hash code for the given GUID of the Standard_Integer type, in the range [1, theUpperBound] @param theGUID the GUID which hash code is to be computed @param theUpperBound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theUpperBound]
	:param theGUID:
	:type theGUID: Standard_GUID
	:param theUpperBound:
	:type theUpperBound: int
	:rtype: int") HashCode;
		static Standard_Integer HashCode (const Standard_GUID & theGUID,Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "* Returns True when the two GUID are the same.
	:param string1:
	:type string1: Standard_GUID
	:param string2:
	:type string2: Standard_GUID
	:rtype: bool") IsEqual;
		static Standard_Boolean IsEqual (const Standard_GUID & string1,const Standard_GUID & string2);

		/****************** IsNotSame ******************/
		%feature("compactdefaultargs") IsNotSame;
		%feature("autodoc", ":param uid:
	:type uid: Standard_GUID
	:rtype: bool") IsNotSame;
		Standard_Boolean IsNotSame (const Standard_GUID & uid);

		/****************** IsSame ******************/
		%feature("compactdefaultargs") IsSame;
		%feature("autodoc", ":param uid:
	:type uid: Standard_GUID
	:rtype: bool") IsSame;
		Standard_Boolean IsSame (const Standard_GUID & uid);


        %feature("autodoc", "1");
        %extend{
            std::string ShallowDumpToString() {
            std::stringstream s;
            self->ShallowDump(s);
            return s.str();}
        };
        		/****************** Standard_GUID ******************/
		%feature("compactdefaultargs") Standard_GUID;
		%feature("autodoc", ":rtype: None") Standard_GUID;
		 Standard_GUID ();

		/****************** Standard_GUID ******************/
		%feature("compactdefaultargs") Standard_GUID;
		%feature("autodoc", "* build a GUID from an ascii string with the following format: Length : 36 char '00000000-0000-0000-0000-000000000000'
	:param aGuid:
	:type aGuid: char *
	:rtype: None") Standard_GUID;
		 Standard_GUID (const char * aGuid);

		/****************** Standard_GUID ******************/
		%feature("compactdefaultargs") Standard_GUID;
		%feature("autodoc", "* build a GUID from an unicode string with the following format: //! '00000000-0000-0000-0000-000000000000'
	:param aGuid:
	:type aGuid: Standard_ExtString
	:rtype: None") Standard_GUID;
		 Standard_GUID (const Standard_ExtString aGuid);

		/****************** Standard_GUID ******************/
		%feature("compactdefaultargs") Standard_GUID;
		%feature("autodoc", ":param a32b:
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
	:rtype: None") Standard_GUID;
		 Standard_GUID (const Standard_Integer a32b,const Standard_ExtCharacter a16b1,const Standard_ExtCharacter a16b2,const Standard_ExtCharacter a16b3,const Standard_Byte a8b1,const Standard_Byte a8b2,const Standard_Byte a8b3,const Standard_Byte a8b4,const Standard_Byte a8b5,const Standard_Byte a8b6);

		/****************** Standard_GUID ******************/
		%feature("compactdefaultargs") Standard_GUID;
		%feature("autodoc", ":param aGuid:
	:type aGuid: Standard_UUID
	:rtype: None") Standard_GUID;
		 Standard_GUID (const Standard_UUID & aGuid);

		/****************** Standard_GUID ******************/
		%feature("compactdefaultargs") Standard_GUID;
		%feature("autodoc", ":param aGuid:
	:type aGuid: Standard_GUID
	:rtype: None") Standard_GUID;
		 Standard_GUID (const Standard_GUID & aGuid);

		/****************** ToCString ******************/
		%feature("compactdefaultargs") ToCString;
		%feature("autodoc", "* translate the GUID into ascii string the aStrGuid is allocated by user. the guid have the following format: //! '00000000-0000-0000-0000-000000000000'
	:param aStrGuid:
	:type aStrGuid: Standard_PCharacter
	:rtype: None") ToCString;
		void ToCString (const Standard_PCharacter aStrGuid);

		/****************** ToExtString ******************/
		%feature("compactdefaultargs") ToExtString;
		%feature("autodoc", "* translate the GUID into unicode string the aStrGuid is allocated by user. the guid have the following format: //! '00000000-0000-0000-0000-000000000000'
	:param aStrGuid:
	:type aStrGuid: Standard_PExtCharacter
	:rtype: None") ToExtString;
		void ToExtString (const Standard_PExtCharacter aStrGuid);

		/****************** ToUUID ******************/
		%feature("compactdefaultargs") ToUUID;
		%feature("autodoc", ":rtype: Standard_UUID") ToUUID;
		Standard_UUID ToUUID ();

		/****************** operator = ******************/
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", ":param uid:
	:type uid: Standard_GUID
	:rtype: None") operator =;
		void operator = (const Standard_GUID & uid);

		/****************** operator = ******************/
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", ":param uid:
	:type uid: Standard_UUID
	:rtype: None") operator =;
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

/**************************
* class Standard_MMgrRoot *
**************************/
%nodefaultctor Standard_MMgrRoot;
class Standard_MMgrRoot {
	public:
		/****************** Allocate ******************/
		%feature("compactdefaultargs") Allocate;
		%feature("autodoc", "* Allocate specified number of bytes. The actually allocated space should be rounded up to double word size (4 bytes), as this is expected by implementation of some classes in OCC (e.g. TCollection_AsciiString)
	:param theSize:
	:type theSize: Standard_Size
	:rtype: Standard_Address") Allocate;
		virtual Standard_Address Allocate (const Standard_Size theSize);

		/****************** Free ******************/
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "* Frees previously allocated memory at specified address.
	:param thePtr:
	:type thePtr: Standard_Address
	:rtype: void") Free;
		virtual void Free (Standard_Address thePtr);

		/****************** Purge ******************/
		%feature("compactdefaultargs") Purge;
		%feature("autodoc", "* Purge internally cached unused memory blocks (if any) by releasing them to the operating system. Must return non-zero if some memory has been actually released, or zero otherwise. If option isDestroyed is True, this means that memory manager is not expected to be used any more; note however that in general case it is still possible to have calls to that instance of memory manager after this (e.g. to free memory of static objects in OCC). Thus this option should command the memory manager to release any cached memory to the system and not cache any more, but still remain operable... //! Default implementation does nothing and returns 0.
	:param isDestroyed: default value is Standard_False
	:type isDestroyed: bool
	:rtype: int") Purge;
		virtual Standard_Integer Purge (Standard_Boolean isDestroyed = Standard_False);

		/****************** Reallocate ******************/
		%feature("compactdefaultargs") Reallocate;
		%feature("autodoc", "* Reallocate previously allocated memory to contain at least theSize bytes. In case of success, new pointer is returned.
	:param thePtr:
	:type thePtr: Standard_Address
	:param theSize:
	:type theSize: Standard_Size
	:rtype: Standard_Address") Reallocate;
		virtual Standard_Address Reallocate (Standard_Address thePtr,const Standard_Size theSize);

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
		%feature("compactdefaultargs") assert_ok;
		%feature("autodoc", ":rtype: None") assert_ok;
		static void assert_ok ();

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
		/****************** DecrementRefCounter ******************/
		%feature("compactdefaultargs") DecrementRefCounter;
		%feature("autodoc", "* Decrements the reference counter of this object; returns the decremented value
	:rtype: int") DecrementRefCounter;
		Standard_Integer DecrementRefCounter ();

		/****************** Delete ******************/
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "* Memory deallocator for transient classes
	:rtype: void") Delete;
		virtual void Delete ();

		/****************** DynamicType ******************/
		%feature("compactdefaultargs") DynamicType;
		%feature("autodoc", "* Returns a type descriptor about this object.
	:rtype: opencascade::handle<Standard_Type>") DynamicType;
		virtual const opencascade::handle<Standard_Type> & DynamicType ();

		/****************** GetRefCount ******************/
		%feature("compactdefaultargs") GetRefCount;
		%feature("autodoc", "* //!@name Reference counting, for use by handle<> Get the reference counter of this object
	:rtype: int") GetRefCount;
		Standard_Integer GetRefCount ();

		/****************** IncrementRefCounter ******************/
		%feature("compactdefaultargs") IncrementRefCounter;
		%feature("autodoc", "* Increments the reference counter of this object
	:rtype: None") IncrementRefCounter;
		void IncrementRefCounter ();

		/****************** IsInstance ******************/
		%feature("compactdefaultargs") IsInstance;
		%feature("autodoc", "* Returns a true value if this is an instance of Type.
	:param theType:
	:type theType: Standard_Type
	:rtype: bool") IsInstance;
		Standard_Boolean IsInstance (const opencascade::handle<Standard_Type> & theType);

		/****************** IsInstance ******************/
		%feature("compactdefaultargs") IsInstance;
		%feature("autodoc", "* Returns a true value if this is an instance of TypeName.
	:param theTypeName:
	:type theTypeName: char *
	:rtype: bool") IsInstance;
		Standard_Boolean IsInstance (const char * theTypeName);

		/****************** IsKind ******************/
		%feature("compactdefaultargs") IsKind;
		%feature("autodoc", "* Returns true if this is an instance of Type or an instance of any class that inherits from Type. Note that multiple inheritance is not supported by OCCT RTTI mechanism.
	:param theType:
	:type theType: Standard_Type
	:rtype: bool") IsKind;
		Standard_Boolean IsKind (const opencascade::handle<Standard_Type> & theType);

		/****************** IsKind ******************/
		%feature("compactdefaultargs") IsKind;
		%feature("autodoc", "* Returns true if this is an instance of TypeName or an instance of any class that inherits from TypeName. Note that multiple inheritance is not supported by OCCT RTTI mechanism.
	:param theTypeName:
	:type theTypeName: char *
	:rtype: bool") IsKind;
		Standard_Boolean IsKind (const char * theTypeName);

		/****************** Standard_Transient ******************/
		%feature("compactdefaultargs") Standard_Transient;
		%feature("autodoc", "* Empty constructor
	:rtype: None") Standard_Transient;
		 Standard_Transient ();

		/****************** Standard_Transient ******************/
		%feature("compactdefaultargs") Standard_Transient;
		%feature("autodoc", "* Copy constructor -- does nothing
	:param &:
	:type &: Standard_Transient
	:rtype: None") Standard_Transient;
		 Standard_Transient (const Standard_Transient &);

		/****************** This ******************/
		%feature("compactdefaultargs") This;
		%feature("autodoc", "* Returns non-const pointer to this object (like const_cast). For protection against creating handle to objects allocated in stack or call from constructor, it will raise exception Standard_ProgramError if reference counter is zero.
	:rtype: Standard_Transient *") This;
		Standard_Transient * This ();

		/****************** get_type_descriptor ******************/
		%feature("compactdefaultargs") get_type_descriptor;
		%feature("autodoc", "* Returns type descriptor of Standard_Transient class
	:rtype: opencascade::handle<Standard_Type>") get_type_descriptor;
		static const opencascade::handle<Standard_Type> & get_type_descriptor ();

		/****************** get_type_name ******************/
		%feature("compactdefaultargs") get_type_name;
		%feature("autodoc", ":rtype: char *") get_type_name;
		static const char * get_type_name ();

		/****************** operator = ******************/
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "* Assignment operator, needed to avoid copying reference counter
	:param &:
	:type &: Standard_Transient
	:rtype: Standard_Transient") operator =;
		Standard_Transient & operator = (const Standard_Transient &);

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
/***********************************************************************************************************************
* class is_base_but_not_same<T1,T2,typenameopencascade::std::enable_if<opencascade::std::is_same<T1,T2>::value>::type> *
***********************************************************************************************************************/
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
		/****************** Allocate ******************/
		%feature("compactdefaultargs") Allocate;
		%feature("autodoc", "* Allocate aSize bytes; see class description above
	:param aSize:
	:type aSize: Standard_Size
	:rtype: Standard_Address") Allocate;
		virtual Standard_Address Allocate (const Standard_Size aSize);

		/****************** Free ******************/
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "* Free previously allocated block. Note that block can not all blocks are released to the OS by this method (see class description)
	:param thePtr:
	:type thePtr: Standard_Address
	:rtype: void") Free;
		virtual void Free (Standard_Address thePtr);

		/****************** Purge ******************/
		%feature("compactdefaultargs") Purge;
		%feature("autodoc", "* Release medium-sized blocks of memory in free lists to the system. Returns number of actually freed blocks
	:param isDestroyed:
	:type isDestroyed: bool
	:rtype: int") Purge;
		virtual Standard_Integer Purge (Standard_Boolean isDestroyed);

		/****************** Reallocate ******************/
		%feature("compactdefaultargs") Reallocate;
		%feature("autodoc", "* Reallocate previously allocated aPtr to a new size; new address is returned. In case that aPtr is null, the function behaves exactly as Allocate.
	:param thePtr:
	:type thePtr: Standard_Address
	:param theSize:
	:type theSize: Standard_Size
	:rtype: Standard_Address") Reallocate;
		virtual Standard_Address Reallocate (Standard_Address thePtr,const Standard_Size theSize);

		/****************** Standard_MMgrOpt ******************/
		%feature("compactdefaultargs") Standard_MMgrOpt;
		%feature("autodoc", "* Constructor. If aClear is True, the allocated emmory will be nullified. For description of other parameters, see description of the class above.
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
	:rtype: None") Standard_MMgrOpt;
		 Standard_MMgrOpt (const Standard_Boolean aClear = Standard_True,const Standard_Boolean aMMap = Standard_True,const Standard_Size aCellSize = 200,const Standard_Integer aNbPages = 10000,const Standard_Size aThreshold = 40000);

};


%extend Standard_MMgrOpt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Standard_MMgrRaw *
*************************/
class Standard_MMgrRaw : public Standard_MMgrRoot {
	public:
		/****************** Allocate ******************/
		%feature("compactdefaultargs") Allocate;
		%feature("autodoc", "* Allocate aSize bytes
	:param aSize:
	:type aSize: Standard_Size
	:rtype: Standard_Address") Allocate;
		virtual Standard_Address Allocate (const Standard_Size aSize);

		/****************** Free ******************/
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "* Free allocated memory. The pointer is nullified.
	:param thePtr:
	:type thePtr: Standard_Address
	:rtype: void") Free;
		virtual void Free (Standard_Address thePtr);

		/****************** Reallocate ******************/
		%feature("compactdefaultargs") Reallocate;
		%feature("autodoc", "* Reallocate aPtr to the size aSize. The new pointer is returned.
	:param thePtr:
	:type thePtr: Standard_Address
	:param theSize:
	:type theSize: Standard_Size
	:rtype: Standard_Address") Reallocate;
		virtual Standard_Address Reallocate (Standard_Address thePtr,const Standard_Size theSize);

		/****************** Standard_MMgrRaw ******************/
		%feature("compactdefaultargs") Standard_MMgrRaw;
		%feature("autodoc", "* Constructor; if aClear is True, the memory will be nullified upon allocation.
	:param aClear: default value is Standard_False
	:type aClear: bool
	:rtype: None") Standard_MMgrRaw;
		 Standard_MMgrRaw (const Standard_Boolean aClear = Standard_False);

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
		/****************** Allocate ******************/
		%feature("compactdefaultargs") Allocate;
		%feature("autodoc", "* Allocate aSize bytes
	:param aSize:
	:type aSize: Standard_Size
	:rtype: Standard_Address") Allocate;
		virtual Standard_Address Allocate (const Standard_Size aSize);

		/****************** Free ******************/
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "* Free allocated memory
	:param thePtr:
	:type thePtr: Standard_Address
	:rtype: void") Free;
		virtual void Free (Standard_Address thePtr);

		/****************** Reallocate ******************/
		%feature("compactdefaultargs") Reallocate;
		%feature("autodoc", "* Reallocate aPtr to the size aSize. The new pointer is returned.
	:param thePtr:
	:type thePtr: Standard_Address
	:param theSize:
	:type theSize: Standard_Size
	:rtype: Standard_Address") Reallocate;
		virtual Standard_Address Reallocate (Standard_Address thePtr,const Standard_Size theSize);

		/****************** Standard_MMgrTBBalloc ******************/
		%feature("compactdefaultargs") Standard_MMgrTBBalloc;
		%feature("autodoc", "* Constructor; if aClear is True, the memory will be nullified upon allocation.
	:param aClear: default value is Standard_False
	:type aClear: bool
	:rtype: None") Standard_MMgrTBBalloc;
		 Standard_MMgrTBBalloc (const Standard_Boolean aClear = Standard_False);

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
		/****************** GetMessageString ******************/
		%feature("compactdefaultargs") GetMessageString;
		%feature("autodoc", "* Returns error message
	:rtype: char *") GetMessageString;
		const char * GetMessageString ();

		/****************** NewInstance ******************/
		%feature("compactdefaultargs") NewInstance;
		%feature("autodoc", "* Returns global instance of exception
	:param theMessage: default value is ""
	:type theMessage: char *
	:rtype: opencascade::handle<Standard_OutOfMemory>") NewInstance;
		static opencascade::handle<Standard_OutOfMemory> NewInstance (const char * theMessage = "");

		/****************** Raise ******************/
		%feature("compactdefaultargs") Raise;
		%feature("autodoc", "* Raises exception with specified message string
	:param theMessage: default value is ""
	:type theMessage: char *
	:rtype: void") Raise;
		static void Raise (const char * theMessage = "");

		/****************** Raise ******************/
		%feature("compactdefaultargs") Raise;
		%feature("autodoc", "* Raises exception with specified message string
	:param theMessage:
	:type theMessage: Standard_SStream
	:rtype: void") Raise;
		static void Raise (Standard_SStream & theMessage);

		/****************** SetMessageString ******************/
		%feature("compactdefaultargs") SetMessageString;
		%feature("autodoc", "* Sets error message
	:param aMessage:
	:type aMessage: char *
	:rtype: None") SetMessageString;
		void SetMessageString (const char * aMessage);

		/****************** Standard_OutOfMemory ******************/
		%feature("compactdefaultargs") Standard_OutOfMemory;
		%feature("autodoc", "* Constructor is kept public for backward compatibility
	:param theMessage: default value is 0
	:type theMessage: char *
	:rtype: None") Standard_OutOfMemory;
		 Standard_OutOfMemory (const char * theMessage = 0);

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
		%feature("compactdefaultargs") Standard_Persistent;
		%feature("autodoc", ":rtype: None") Standard_Persistent;
		 Standard_Persistent ();


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
/****************************************
* class has_type<T,std::tuple<U,Ts...>> *
****************************************/
/*****************************
* class is_base_but_not_same *
*****************************/
/*******************
* class is_integer *
*******************/
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
