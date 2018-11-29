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
%define PDATASTDDOCSTRING
"

"
%enddef
%module (package="OCC.Core", docstring=PDATASTDDOCSTRING) PDataStd

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
%include ../common/OccHandle.i


%include PDataStd_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */


%nodefaultctor PDataStd_AsciiString;
class PDataStd_AsciiString : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataStd_AsciiString;
		%feature("autodoc", "	:rtype: None
") PDataStd_AsciiString;
		 PDataStd_AsciiString ();
		%feature("compactdefaultargs") PDataStd_AsciiString;
		%feature("autodoc", "	:param V:
	:type V: Handle_PCollection_HAsciiString &
	:rtype: None
") PDataStd_AsciiString;
		 PDataStd_AsciiString (const Handle_PCollection_HAsciiString & V);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	:rtype: Handle_PCollection_HAsciiString
") Get;
		Handle_PCollection_HAsciiString Get ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param V:
	:type V: Handle_PCollection_HAsciiString &
	:rtype: None
") Set;
		void Set (const Handle_PCollection_HAsciiString & V);
		%feature("compactdefaultargs") PDataStd_AsciiString;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_AsciiString;
		 PDataStd_AsciiString (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_AsciiStringmyValue;
		%feature("autodoc", "	:rtype: Handle_PCollection_HAsciiString
") _CSFDB_GetPDataStd_AsciiStringmyValue;
		Handle_PCollection_HAsciiString _CSFDB_GetPDataStd_AsciiStringmyValue ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_AsciiStringmyValue;
		%feature("autodoc", "	:param p:
	:type p: Handle_PCollection_HAsciiString &
	:rtype: None
") _CSFDB_SetPDataStd_AsciiStringmyValue;
		void _CSFDB_SetPDataStd_AsciiStringmyValue (const Handle_PCollection_HAsciiString & p);
};


%extend PDataStd_AsciiString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_BooleanArray;
class PDataStd_BooleanArray : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataStd_BooleanArray;
		%feature("autodoc", "	:rtype: None
") PDataStd_BooleanArray;
		 PDataStd_BooleanArray ();
		%feature("compactdefaultargs") SetLower;
		%feature("autodoc", "	:param lower:
	:type lower: int
	:rtype: None
") SetLower;
		void SetLower (const Standard_Integer lower);
		%feature("compactdefaultargs") SetUpper;
		%feature("autodoc", "	:param upper:
	:type upper: int
	:rtype: None
") SetUpper;
		void SetUpper (const Standard_Integer upper);
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param values:
	:type values: Handle_PColStd_HArray1OfInteger &
	:rtype: None
") Set;
		void Set (const Handle_PColStd_HArray1OfInteger & values);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	:rtype: Handle_PColStd_HArray1OfInteger
") Get;
		Handle_PColStd_HArray1OfInteger Get ();
		%feature("compactdefaultargs") PDataStd_BooleanArray;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_BooleanArray;
		 PDataStd_BooleanArray (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_BooleanArraymyValues;
		%feature("autodoc", "	:rtype: Handle_PColStd_HArray1OfInteger
") _CSFDB_GetPDataStd_BooleanArraymyValues;
		Handle_PColStd_HArray1OfInteger _CSFDB_GetPDataStd_BooleanArraymyValues ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_BooleanArraymyValues;
		%feature("autodoc", "	:param p:
	:type p: Handle_PColStd_HArray1OfInteger &
	:rtype: None
") _CSFDB_SetPDataStd_BooleanArraymyValues;
		void _CSFDB_SetPDataStd_BooleanArraymyValues (const Handle_PColStd_HArray1OfInteger & p);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_BooleanArraymyLower;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPDataStd_BooleanArraymyLower;
		Standard_Integer _CSFDB_GetPDataStd_BooleanArraymyLower ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_BooleanArraymyLower;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPDataStd_BooleanArraymyLower;
		void _CSFDB_SetPDataStd_BooleanArraymyLower (const Standard_Integer p);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_BooleanArraymyUpper;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPDataStd_BooleanArraymyUpper;
		Standard_Integer _CSFDB_GetPDataStd_BooleanArraymyUpper ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_BooleanArraymyUpper;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPDataStd_BooleanArraymyUpper;
		void _CSFDB_SetPDataStd_BooleanArraymyUpper (const Standard_Integer p);
};


%extend PDataStd_BooleanArray {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_BooleanList;
class PDataStd_BooleanList : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataStd_BooleanList;
		%feature("autodoc", "	:rtype: None
") PDataStd_BooleanList;
		 PDataStd_BooleanList ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:rtype: None
") Init;
		void Init (const Standard_Integer lower,const Standard_Integer upper);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param index:
	:type index: int
	:param value:
	:type value: int
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer index,const Standard_Integer value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param index:
	:type index: int
	:rtype: int
") Value;
		Standard_Integer Value (const Standard_Integer index);
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") PDataStd_BooleanList;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_BooleanList;
		 PDataStd_BooleanList (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_BooleanListmyValue;
		%feature("autodoc", "	:rtype: Handle_PColStd_HArray1OfInteger
") _CSFDB_GetPDataStd_BooleanListmyValue;
		Handle_PColStd_HArray1OfInteger _CSFDB_GetPDataStd_BooleanListmyValue ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_BooleanListmyValue;
		%feature("autodoc", "	:param p:
	:type p: Handle_PColStd_HArray1OfInteger &
	:rtype: None
") _CSFDB_SetPDataStd_BooleanListmyValue;
		void _CSFDB_SetPDataStd_BooleanListmyValue (const Handle_PColStd_HArray1OfInteger & p);
};


%extend PDataStd_BooleanList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_ByteArray;
class PDataStd_ByteArray : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataStd_ByteArray;
		%feature("autodoc", "	:rtype: None
") PDataStd_ByteArray;
		 PDataStd_ByteArray ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param values:
	:type values: Handle_PColStd_HArray1OfInteger &
	:rtype: None
") Set;
		void Set (const Handle_PColStd_HArray1OfInteger & values);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	:rtype: Handle_PColStd_HArray1OfInteger
") Get;
		Handle_PColStd_HArray1OfInteger Get ();
		%feature("compactdefaultargs") PDataStd_ByteArray;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_ByteArray;
		 PDataStd_ByteArray (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_ByteArraymyValues;
		%feature("autodoc", "	:rtype: Handle_PColStd_HArray1OfInteger
") _CSFDB_GetPDataStd_ByteArraymyValues;
		Handle_PColStd_HArray1OfInteger _CSFDB_GetPDataStd_ByteArraymyValues ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_ByteArraymyValues;
		%feature("autodoc", "	:param p:
	:type p: Handle_PColStd_HArray1OfInteger &
	:rtype: None
") _CSFDB_SetPDataStd_ByteArraymyValues;
		void _CSFDB_SetPDataStd_ByteArraymyValues (const Handle_PColStd_HArray1OfInteger & p);
};


%extend PDataStd_ByteArray {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_ByteArray_1;
class PDataStd_ByteArray_1 : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataStd_ByteArray_1;
		%feature("autodoc", "	:rtype: None
") PDataStd_ByteArray_1;
		 PDataStd_ByteArray_1 ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param values:
	:type values: Handle_PColStd_HArray1OfInteger &
	:rtype: None
") Set;
		void Set (const Handle_PColStd_HArray1OfInteger & values);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	:rtype: Handle_PColStd_HArray1OfInteger
") Get;
		Handle_PColStd_HArray1OfInteger Get ();
		%feature("compactdefaultargs") SetDelta;
		%feature("autodoc", "	:param delta:
	:type delta: bool
	:rtype: None
") SetDelta;
		void SetDelta (const Standard_Boolean delta);
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "	:rtype: bool
") GetDelta;
		Standard_Boolean GetDelta ();
		%feature("compactdefaultargs") PDataStd_ByteArray_1;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_ByteArray_1;
		 PDataStd_ByteArray_1 (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_ByteArray_1myValues;
		%feature("autodoc", "	:rtype: Handle_PColStd_HArray1OfInteger
") _CSFDB_GetPDataStd_ByteArray_1myValues;
		Handle_PColStd_HArray1OfInteger _CSFDB_GetPDataStd_ByteArray_1myValues ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_ByteArray_1myValues;
		%feature("autodoc", "	:param p:
	:type p: Handle_PColStd_HArray1OfInteger &
	:rtype: None
") _CSFDB_SetPDataStd_ByteArray_1myValues;
		void _CSFDB_SetPDataStd_ByteArray_1myValues (const Handle_PColStd_HArray1OfInteger & p);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_ByteArray_1myDelta;
		%feature("autodoc", "	:rtype: bool
") _CSFDB_GetPDataStd_ByteArray_1myDelta;
		Standard_Boolean _CSFDB_GetPDataStd_ByteArray_1myDelta ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_ByteArray_1myDelta;
		%feature("autodoc", "	:param p:
	:type p: bool
	:rtype: None
") _CSFDB_SetPDataStd_ByteArray_1myDelta;
		void _CSFDB_SetPDataStd_ByteArray_1myDelta (const Standard_Boolean p);
};


%extend PDataStd_ByteArray_1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_Comment;
class PDataStd_Comment : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataStd_Comment;
		%feature("autodoc", "	:rtype: None
") PDataStd_Comment;
		 PDataStd_Comment ();
		%feature("compactdefaultargs") PDataStd_Comment;
		%feature("autodoc", "	:param V:
	:type V: Handle_PCollection_HExtendedString &
	:rtype: None
") PDataStd_Comment;
		 PDataStd_Comment (const Handle_PCollection_HExtendedString & V);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	:rtype: Handle_PCollection_HExtendedString
") Get;
		Handle_PCollection_HExtendedString Get ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param V:
	:type V: Handle_PCollection_HExtendedString &
	:rtype: None
") Set;
		void Set (const Handle_PCollection_HExtendedString & V);
		%feature("compactdefaultargs") PDataStd_Comment;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_Comment;
		 PDataStd_Comment (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_CommentmyValue;
		%feature("autodoc", "	:rtype: Handle_PCollection_HExtendedString
") _CSFDB_GetPDataStd_CommentmyValue;
		Handle_PCollection_HExtendedString _CSFDB_GetPDataStd_CommentmyValue ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_CommentmyValue;
		%feature("autodoc", "	:param p:
	:type p: Handle_PCollection_HExtendedString &
	:rtype: None
") _CSFDB_SetPDataStd_CommentmyValue;
		void _CSFDB_SetPDataStd_CommentmyValue (const Handle_PCollection_HExtendedString & p);
};


%extend PDataStd_Comment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_Directory;
class PDataStd_Directory : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataStd_Directory;
		%feature("autodoc", "	:rtype: None
") PDataStd_Directory;
		 PDataStd_Directory ();
		%feature("compactdefaultargs") PDataStd_Directory;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_Directory;
		 PDataStd_Directory (const Storage_stCONSTclCOM & a);
};


%extend PDataStd_Directory {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_Expression;
class PDataStd_Expression : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataStd_Expression;
		%feature("autodoc", "	:rtype: None
") PDataStd_Expression;
		 PDataStd_Expression ();
		%feature("compactdefaultargs") PDataStd_Expression;
		%feature("autodoc", "	:param name:
	:type name: Handle_PCollection_HExtendedString &
	:rtype: None
") PDataStd_Expression;
		 PDataStd_Expression (const Handle_PCollection_HExtendedString & name);
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "	:rtype: Handle_PCollection_HExtendedString
") GetName;
		Handle_PCollection_HExtendedString GetName ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param name:
	:type name: Handle_PCollection_HExtendedString &
	:rtype: None
") SetName;
		void SetName (const Handle_PCollection_HExtendedString & name);
		%feature("compactdefaultargs") GetVariables;
		%feature("autodoc", "	:rtype: Handle_PDF_HAttributeArray1
") GetVariables;
		Handle_PDF_HAttributeArray1 GetVariables ();
		%feature("compactdefaultargs") SetVariables;
		%feature("autodoc", "	:param vars:
	:type vars: Handle_PDF_HAttributeArray1 &
	:rtype: None
") SetVariables;
		void SetVariables (const Handle_PDF_HAttributeArray1 & vars);
		%feature("compactdefaultargs") PDataStd_Expression;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_Expression;
		 PDataStd_Expression (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_ExpressionmyName;
		%feature("autodoc", "	:rtype: Handle_PCollection_HExtendedString
") _CSFDB_GetPDataStd_ExpressionmyName;
		Handle_PCollection_HExtendedString _CSFDB_GetPDataStd_ExpressionmyName ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_ExpressionmyName;
		%feature("autodoc", "	:param p:
	:type p: Handle_PCollection_HExtendedString &
	:rtype: None
") _CSFDB_SetPDataStd_ExpressionmyName;
		void _CSFDB_SetPDataStd_ExpressionmyName (const Handle_PCollection_HExtendedString & p);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_ExpressionmyVariables;
		%feature("autodoc", "	:rtype: Handle_PDF_HAttributeArray1
") _CSFDB_GetPDataStd_ExpressionmyVariables;
		Handle_PDF_HAttributeArray1 _CSFDB_GetPDataStd_ExpressionmyVariables ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_ExpressionmyVariables;
		%feature("autodoc", "	:param p:
	:type p: Handle_PDF_HAttributeArray1 &
	:rtype: None
") _CSFDB_SetPDataStd_ExpressionmyVariables;
		void _CSFDB_SetPDataStd_ExpressionmyVariables (const Handle_PDF_HAttributeArray1 & p);
};


%extend PDataStd_Expression {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_ExtStringArray;
class PDataStd_ExtStringArray : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataStd_ExtStringArray;
		%feature("autodoc", "	:rtype: None
") PDataStd_ExtStringArray;
		 PDataStd_ExtStringArray ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:rtype: None
") Init;
		void Init (const Standard_Integer lower,const Standard_Integer upper);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_PCollection_HExtendedString &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_PCollection_HExtendedString & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_PCollection_HExtendedString
") Value;
		Handle_PCollection_HExtendedString Value (const Standard_Integer Index);
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") PDataStd_ExtStringArray;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_ExtStringArray;
		 PDataStd_ExtStringArray (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_ExtStringArraymyValue;
		%feature("autodoc", "	:rtype: Handle_PColStd_HArray1OfExtendedString
") _CSFDB_GetPDataStd_ExtStringArraymyValue;
		Handle_PColStd_HArray1OfExtendedString _CSFDB_GetPDataStd_ExtStringArraymyValue ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_ExtStringArraymyValue;
		%feature("autodoc", "	:param p:
	:type p: Handle_PColStd_HArray1OfExtendedString &
	:rtype: None
") _CSFDB_SetPDataStd_ExtStringArraymyValue;
		void _CSFDB_SetPDataStd_ExtStringArraymyValue (const Handle_PColStd_HArray1OfExtendedString & p);
};


%extend PDataStd_ExtStringArray {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_ExtStringArray_1;
class PDataStd_ExtStringArray_1 : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataStd_ExtStringArray_1;
		%feature("autodoc", "	:rtype: None
") PDataStd_ExtStringArray_1;
		 PDataStd_ExtStringArray_1 ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:rtype: None
") Init;
		void Init (const Standard_Integer lower,const Standard_Integer upper);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_PCollection_HExtendedString &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_PCollection_HExtendedString & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_PCollection_HExtendedString
") Value;
		Handle_PCollection_HExtendedString Value (const Standard_Integer Index);
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetDelta;
		%feature("autodoc", "	:param delta:
	:type delta: bool
	:rtype: None
") SetDelta;
		void SetDelta (const Standard_Boolean delta);
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "	:rtype: bool
") GetDelta;
		Standard_Boolean GetDelta ();
		%feature("compactdefaultargs") PDataStd_ExtStringArray_1;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_ExtStringArray_1;
		 PDataStd_ExtStringArray_1 (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_ExtStringArray_1myValue;
		%feature("autodoc", "	:rtype: Handle_PColStd_HArray1OfExtendedString
") _CSFDB_GetPDataStd_ExtStringArray_1myValue;
		Handle_PColStd_HArray1OfExtendedString _CSFDB_GetPDataStd_ExtStringArray_1myValue ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_ExtStringArray_1myValue;
		%feature("autodoc", "	:param p:
	:type p: Handle_PColStd_HArray1OfExtendedString &
	:rtype: None
") _CSFDB_SetPDataStd_ExtStringArray_1myValue;
		void _CSFDB_SetPDataStd_ExtStringArray_1myValue (const Handle_PColStd_HArray1OfExtendedString & p);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_ExtStringArray_1myDelta;
		%feature("autodoc", "	:rtype: bool
") _CSFDB_GetPDataStd_ExtStringArray_1myDelta;
		Standard_Boolean _CSFDB_GetPDataStd_ExtStringArray_1myDelta ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_ExtStringArray_1myDelta;
		%feature("autodoc", "	:param p:
	:type p: bool
	:rtype: None
") _CSFDB_SetPDataStd_ExtStringArray_1myDelta;
		void _CSFDB_SetPDataStd_ExtStringArray_1myDelta (const Standard_Boolean p);
};


%extend PDataStd_ExtStringArray_1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_ExtStringList;
class PDataStd_ExtStringList : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataStd_ExtStringList;
		%feature("autodoc", "	:rtype: None
") PDataStd_ExtStringList;
		 PDataStd_ExtStringList ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:rtype: None
") Init;
		void Init (const Standard_Integer lower,const Standard_Integer upper);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param index:
	:type index: int
	:param value:
	:type value: Handle_PCollection_HExtendedString &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer index,const Handle_PCollection_HExtendedString & value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param index:
	:type index: int
	:rtype: Handle_PCollection_HExtendedString
") Value;
		Handle_PCollection_HExtendedString Value (const Standard_Integer index);
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") PDataStd_ExtStringList;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_ExtStringList;
		 PDataStd_ExtStringList (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_ExtStringListmyValue;
		%feature("autodoc", "	:rtype: Handle_PColStd_HArray1OfExtendedString
") _CSFDB_GetPDataStd_ExtStringListmyValue;
		Handle_PColStd_HArray1OfExtendedString _CSFDB_GetPDataStd_ExtStringListmyValue ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_ExtStringListmyValue;
		%feature("autodoc", "	:param p:
	:type p: Handle_PColStd_HArray1OfExtendedString &
	:rtype: None
") _CSFDB_SetPDataStd_ExtStringListmyValue;
		void _CSFDB_SetPDataStd_ExtStringListmyValue (const Handle_PColStd_HArray1OfExtendedString & p);
};


%extend PDataStd_ExtStringList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_FieldOfHArray1OfByte;
class PDataStd_FieldOfHArray1OfByte : public DBC_BaseArray {
	public:
		%feature("compactdefaultargs") PDataStd_FieldOfHArray1OfByte;
		%feature("autodoc", "	:rtype: None
") PDataStd_FieldOfHArray1OfByte;
		 PDataStd_FieldOfHArray1OfByte ();
		%feature("compactdefaultargs") PDataStd_FieldOfHArray1OfByte;
		%feature("autodoc", "	:param Size:
	:type Size: int
	:rtype: None
") PDataStd_FieldOfHArray1OfByte;
		 PDataStd_FieldOfHArray1OfByte (const Standard_Integer Size);
		%feature("compactdefaultargs") PDataStd_FieldOfHArray1OfByte;
		%feature("autodoc", "	:param Varray:
	:type Varray: PDataStd_FieldOfHArray1OfByte &
	:rtype: None
") PDataStd_FieldOfHArray1OfByte;
		 PDataStd_FieldOfHArray1OfByte (const PDataStd_FieldOfHArray1OfByte & Varray);
		%feature("compactdefaultargs") Resize;
		%feature("autodoc", "	:param Size:
	:type Size: int
	:rtype: None
") Resize;
		void Resize (const Standard_Integer Size);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: PDataStd_FieldOfHArray1OfByte &
	:rtype: None
") Assign;
		void Assign (const PDataStd_FieldOfHArray1OfByte & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: PDataStd_FieldOfHArray1OfByte &
	:rtype: None
") operator =;
		void operator = (const PDataStd_FieldOfHArray1OfByte & Other);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Standard_Byte &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Byte & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Standard_Byte
") Value;
		Standard_Byte & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
};



%extend PDataStd_FieldOfHArray1OfByte {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend PDataStd_FieldOfHArray1OfByte {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_FieldOfHArray1OfHArray1OfInteger;
class PDataStd_FieldOfHArray1OfHArray1OfInteger : public DBC_BaseArray {
	public:
		%feature("compactdefaultargs") PDataStd_FieldOfHArray1OfHArray1OfInteger;
		%feature("autodoc", "	:rtype: None
") PDataStd_FieldOfHArray1OfHArray1OfInteger;
		 PDataStd_FieldOfHArray1OfHArray1OfInteger ();
		%feature("compactdefaultargs") PDataStd_FieldOfHArray1OfHArray1OfInteger;
		%feature("autodoc", "	:param Size:
	:type Size: int
	:rtype: None
") PDataStd_FieldOfHArray1OfHArray1OfInteger;
		 PDataStd_FieldOfHArray1OfHArray1OfInteger (const Standard_Integer Size);
		%feature("compactdefaultargs") PDataStd_FieldOfHArray1OfHArray1OfInteger;
		%feature("autodoc", "	:param Varray:
	:type Varray: PDataStd_FieldOfHArray1OfHArray1OfInteger &
	:rtype: None
") PDataStd_FieldOfHArray1OfHArray1OfInteger;
		 PDataStd_FieldOfHArray1OfHArray1OfInteger (const PDataStd_FieldOfHArray1OfHArray1OfInteger & Varray);
		%feature("compactdefaultargs") Resize;
		%feature("autodoc", "	:param Size:
	:type Size: int
	:rtype: None
") Resize;
		void Resize (const Standard_Integer Size);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: PDataStd_FieldOfHArray1OfHArray1OfInteger &
	:rtype: None
") Assign;
		void Assign (const PDataStd_FieldOfHArray1OfHArray1OfInteger & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: PDataStd_FieldOfHArray1OfHArray1OfInteger &
	:rtype: None
") operator =;
		void operator = (const PDataStd_FieldOfHArray1OfHArray1OfInteger & Other);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_PColStd_HArray1OfInteger &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_PColStd_HArray1OfInteger & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_PColStd_HArray1OfInteger
") Value;
		Handle_PColStd_HArray1OfInteger Value (const Standard_Integer Index);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
};



%extend PDataStd_FieldOfHArray1OfHArray1OfInteger {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend PDataStd_FieldOfHArray1OfHArray1OfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_FieldOfHArray1OfHArray1OfReal;
class PDataStd_FieldOfHArray1OfHArray1OfReal : public DBC_BaseArray {
	public:
		%feature("compactdefaultargs") PDataStd_FieldOfHArray1OfHArray1OfReal;
		%feature("autodoc", "	:rtype: None
") PDataStd_FieldOfHArray1OfHArray1OfReal;
		 PDataStd_FieldOfHArray1OfHArray1OfReal ();
		%feature("compactdefaultargs") PDataStd_FieldOfHArray1OfHArray1OfReal;
		%feature("autodoc", "	:param Size:
	:type Size: int
	:rtype: None
") PDataStd_FieldOfHArray1OfHArray1OfReal;
		 PDataStd_FieldOfHArray1OfHArray1OfReal (const Standard_Integer Size);
		%feature("compactdefaultargs") PDataStd_FieldOfHArray1OfHArray1OfReal;
		%feature("autodoc", "	:param Varray:
	:type Varray: PDataStd_FieldOfHArray1OfHArray1OfReal &
	:rtype: None
") PDataStd_FieldOfHArray1OfHArray1OfReal;
		 PDataStd_FieldOfHArray1OfHArray1OfReal (const PDataStd_FieldOfHArray1OfHArray1OfReal & Varray);
		%feature("compactdefaultargs") Resize;
		%feature("autodoc", "	:param Size:
	:type Size: int
	:rtype: None
") Resize;
		void Resize (const Standard_Integer Size);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: PDataStd_FieldOfHArray1OfHArray1OfReal &
	:rtype: None
") Assign;
		void Assign (const PDataStd_FieldOfHArray1OfHArray1OfReal & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: PDataStd_FieldOfHArray1OfHArray1OfReal &
	:rtype: None
") operator =;
		void operator = (const PDataStd_FieldOfHArray1OfHArray1OfReal & Other);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_PColStd_HArray1OfReal &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_PColStd_HArray1OfReal & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_PColStd_HArray1OfReal
") Value;
		Handle_PColStd_HArray1OfReal Value (const Standard_Integer Index);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
};



%extend PDataStd_FieldOfHArray1OfHArray1OfReal {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend PDataStd_FieldOfHArray1OfHArray1OfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_FieldOfHArray1OfHAsciiString;
class PDataStd_FieldOfHArray1OfHAsciiString : public DBC_BaseArray {
	public:
		%feature("compactdefaultargs") PDataStd_FieldOfHArray1OfHAsciiString;
		%feature("autodoc", "	:rtype: None
") PDataStd_FieldOfHArray1OfHAsciiString;
		 PDataStd_FieldOfHArray1OfHAsciiString ();
		%feature("compactdefaultargs") PDataStd_FieldOfHArray1OfHAsciiString;
		%feature("autodoc", "	:param Size:
	:type Size: int
	:rtype: None
") PDataStd_FieldOfHArray1OfHAsciiString;
		 PDataStd_FieldOfHArray1OfHAsciiString (const Standard_Integer Size);
		%feature("compactdefaultargs") PDataStd_FieldOfHArray1OfHAsciiString;
		%feature("autodoc", "	:param Varray:
	:type Varray: PDataStd_FieldOfHArray1OfHAsciiString &
	:rtype: None
") PDataStd_FieldOfHArray1OfHAsciiString;
		 PDataStd_FieldOfHArray1OfHAsciiString (const PDataStd_FieldOfHArray1OfHAsciiString & Varray);
		%feature("compactdefaultargs") Resize;
		%feature("autodoc", "	:param Size:
	:type Size: int
	:rtype: None
") Resize;
		void Resize (const Standard_Integer Size);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: PDataStd_FieldOfHArray1OfHAsciiString &
	:rtype: None
") Assign;
		void Assign (const PDataStd_FieldOfHArray1OfHAsciiString & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: PDataStd_FieldOfHArray1OfHAsciiString &
	:rtype: None
") operator =;
		void operator = (const PDataStd_FieldOfHArray1OfHAsciiString & Other);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_PCollection_HAsciiString &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_PCollection_HAsciiString & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_PCollection_HAsciiString
") Value;
		Handle_PCollection_HAsciiString Value (const Standard_Integer Index);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
};



%extend PDataStd_FieldOfHArray1OfHAsciiString {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend PDataStd_FieldOfHArray1OfHAsciiString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_HArray1OfByte;
class PDataStd_HArray1OfByte : public Standard_Persistent {
	public:
		%feature("compactdefaultargs") PDataStd_HArray1OfByte;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") PDataStd_HArray1OfByte;
		 PDataStd_HArray1OfByte (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") PDataStd_HArray1OfByte;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Standard_Byte &
	:rtype: None
") PDataStd_HArray1OfByte;
		 PDataStd_HArray1OfByte (const Standard_Integer Low,const Standard_Integer Up,const Standard_Byte & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Standard_Byte &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Byte & Value);
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Standard_Byte
") Value;
		Standard_Byte Value (const Standard_Integer Index);
		%feature("compactdefaultargs") PDataStd_HArray1OfByte;
		%feature("autodoc", "	:rtype: None
") PDataStd_HArray1OfByte;
		 PDataStd_HArray1OfByte ();
		%feature("compactdefaultargs") PDataStd_HArray1OfByte;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_HArray1OfByte;
		 PDataStd_HArray1OfByte (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_HArray1OfByteLowerBound;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPDataStd_HArray1OfByteLowerBound;
		Standard_Integer _CSFDB_GetPDataStd_HArray1OfByteLowerBound ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_HArray1OfByteLowerBound;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPDataStd_HArray1OfByteLowerBound;
		void _CSFDB_SetPDataStd_HArray1OfByteLowerBound (const Standard_Integer p);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_HArray1OfByteUpperBound;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPDataStd_HArray1OfByteUpperBound;
		Standard_Integer _CSFDB_GetPDataStd_HArray1OfByteUpperBound ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_HArray1OfByteUpperBound;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPDataStd_HArray1OfByteUpperBound;
		void _CSFDB_SetPDataStd_HArray1OfByteUpperBound (const Standard_Integer p);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_HArray1OfByteData;
		%feature("autodoc", "	:rtype: PDataStd_FieldOfHArray1OfByte
") _CSFDB_GetPDataStd_HArray1OfByteData;
		const PDataStd_FieldOfHArray1OfByte & _CSFDB_GetPDataStd_HArray1OfByteData ();
};



%extend PDataStd_HArray1OfByte {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend PDataStd_HArray1OfByte {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_HArray1OfHArray1OfInteger;
class PDataStd_HArray1OfHArray1OfInteger : public Standard_Persistent {
	public:
		%feature("compactdefaultargs") PDataStd_HArray1OfHArray1OfInteger;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") PDataStd_HArray1OfHArray1OfInteger;
		 PDataStd_HArray1OfHArray1OfInteger (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") PDataStd_HArray1OfHArray1OfInteger;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_PColStd_HArray1OfInteger &
	:rtype: None
") PDataStd_HArray1OfHArray1OfInteger;
		 PDataStd_HArray1OfHArray1OfInteger (const Standard_Integer Low,const Standard_Integer Up,const Handle_PColStd_HArray1OfInteger & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_PColStd_HArray1OfInteger &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_PColStd_HArray1OfInteger & Value);
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_PColStd_HArray1OfInteger
") Value;
		Handle_PColStd_HArray1OfInteger Value (const Standard_Integer Index);
		%feature("compactdefaultargs") PDataStd_HArray1OfHArray1OfInteger;
		%feature("autodoc", "	:rtype: None
") PDataStd_HArray1OfHArray1OfInteger;
		 PDataStd_HArray1OfHArray1OfInteger ();
		%feature("compactdefaultargs") PDataStd_HArray1OfHArray1OfInteger;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_HArray1OfHArray1OfInteger;
		 PDataStd_HArray1OfHArray1OfInteger (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_HArray1OfHArray1OfIntegerLowerBound;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPDataStd_HArray1OfHArray1OfIntegerLowerBound;
		Standard_Integer _CSFDB_GetPDataStd_HArray1OfHArray1OfIntegerLowerBound ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_HArray1OfHArray1OfIntegerLowerBound;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPDataStd_HArray1OfHArray1OfIntegerLowerBound;
		void _CSFDB_SetPDataStd_HArray1OfHArray1OfIntegerLowerBound (const Standard_Integer p);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_HArray1OfHArray1OfIntegerUpperBound;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPDataStd_HArray1OfHArray1OfIntegerUpperBound;
		Standard_Integer _CSFDB_GetPDataStd_HArray1OfHArray1OfIntegerUpperBound ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_HArray1OfHArray1OfIntegerUpperBound;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPDataStd_HArray1OfHArray1OfIntegerUpperBound;
		void _CSFDB_SetPDataStd_HArray1OfHArray1OfIntegerUpperBound (const Standard_Integer p);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_HArray1OfHArray1OfIntegerData;
		%feature("autodoc", "	:rtype: PDataStd_FieldOfHArray1OfHArray1OfInteger
") _CSFDB_GetPDataStd_HArray1OfHArray1OfIntegerData;
		const PDataStd_FieldOfHArray1OfHArray1OfInteger & _CSFDB_GetPDataStd_HArray1OfHArray1OfIntegerData ();
};



%extend PDataStd_HArray1OfHArray1OfInteger {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend PDataStd_HArray1OfHArray1OfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_HArray1OfHArray1OfReal;
class PDataStd_HArray1OfHArray1OfReal : public Standard_Persistent {
	public:
		%feature("compactdefaultargs") PDataStd_HArray1OfHArray1OfReal;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") PDataStd_HArray1OfHArray1OfReal;
		 PDataStd_HArray1OfHArray1OfReal (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") PDataStd_HArray1OfHArray1OfReal;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_PColStd_HArray1OfReal &
	:rtype: None
") PDataStd_HArray1OfHArray1OfReal;
		 PDataStd_HArray1OfHArray1OfReal (const Standard_Integer Low,const Standard_Integer Up,const Handle_PColStd_HArray1OfReal & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_PColStd_HArray1OfReal &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_PColStd_HArray1OfReal & Value);
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_PColStd_HArray1OfReal
") Value;
		Handle_PColStd_HArray1OfReal Value (const Standard_Integer Index);
		%feature("compactdefaultargs") PDataStd_HArray1OfHArray1OfReal;
		%feature("autodoc", "	:rtype: None
") PDataStd_HArray1OfHArray1OfReal;
		 PDataStd_HArray1OfHArray1OfReal ();
		%feature("compactdefaultargs") PDataStd_HArray1OfHArray1OfReal;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_HArray1OfHArray1OfReal;
		 PDataStd_HArray1OfHArray1OfReal (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_HArray1OfHArray1OfRealLowerBound;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPDataStd_HArray1OfHArray1OfRealLowerBound;
		Standard_Integer _CSFDB_GetPDataStd_HArray1OfHArray1OfRealLowerBound ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_HArray1OfHArray1OfRealLowerBound;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPDataStd_HArray1OfHArray1OfRealLowerBound;
		void _CSFDB_SetPDataStd_HArray1OfHArray1OfRealLowerBound (const Standard_Integer p);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_HArray1OfHArray1OfRealUpperBound;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPDataStd_HArray1OfHArray1OfRealUpperBound;
		Standard_Integer _CSFDB_GetPDataStd_HArray1OfHArray1OfRealUpperBound ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_HArray1OfHArray1OfRealUpperBound;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPDataStd_HArray1OfHArray1OfRealUpperBound;
		void _CSFDB_SetPDataStd_HArray1OfHArray1OfRealUpperBound (const Standard_Integer p);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_HArray1OfHArray1OfRealData;
		%feature("autodoc", "	:rtype: PDataStd_FieldOfHArray1OfHArray1OfReal
") _CSFDB_GetPDataStd_HArray1OfHArray1OfRealData;
		const PDataStd_FieldOfHArray1OfHArray1OfReal & _CSFDB_GetPDataStd_HArray1OfHArray1OfRealData ();
};



%extend PDataStd_HArray1OfHArray1OfReal {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend PDataStd_HArray1OfHArray1OfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_HArray1OfHAsciiString;
class PDataStd_HArray1OfHAsciiString : public Standard_Persistent {
	public:
		%feature("compactdefaultargs") PDataStd_HArray1OfHAsciiString;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") PDataStd_HArray1OfHAsciiString;
		 PDataStd_HArray1OfHAsciiString (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") PDataStd_HArray1OfHAsciiString;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_PCollection_HAsciiString &
	:rtype: None
") PDataStd_HArray1OfHAsciiString;
		 PDataStd_HArray1OfHAsciiString (const Standard_Integer Low,const Standard_Integer Up,const Handle_PCollection_HAsciiString & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_PCollection_HAsciiString &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_PCollection_HAsciiString & Value);
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_PCollection_HAsciiString
") Value;
		Handle_PCollection_HAsciiString Value (const Standard_Integer Index);
		%feature("compactdefaultargs") PDataStd_HArray1OfHAsciiString;
		%feature("autodoc", "	:rtype: None
") PDataStd_HArray1OfHAsciiString;
		 PDataStd_HArray1OfHAsciiString ();
		%feature("compactdefaultargs") PDataStd_HArray1OfHAsciiString;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_HArray1OfHAsciiString;
		 PDataStd_HArray1OfHAsciiString (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_HArray1OfHAsciiStringLowerBound;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPDataStd_HArray1OfHAsciiStringLowerBound;
		Standard_Integer _CSFDB_GetPDataStd_HArray1OfHAsciiStringLowerBound ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_HArray1OfHAsciiStringLowerBound;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPDataStd_HArray1OfHAsciiStringLowerBound;
		void _CSFDB_SetPDataStd_HArray1OfHAsciiStringLowerBound (const Standard_Integer p);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_HArray1OfHAsciiStringUpperBound;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPDataStd_HArray1OfHAsciiStringUpperBound;
		Standard_Integer _CSFDB_GetPDataStd_HArray1OfHAsciiStringUpperBound ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_HArray1OfHAsciiStringUpperBound;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPDataStd_HArray1OfHAsciiStringUpperBound;
		void _CSFDB_SetPDataStd_HArray1OfHAsciiStringUpperBound (const Standard_Integer p);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_HArray1OfHAsciiStringData;
		%feature("autodoc", "	:rtype: PDataStd_FieldOfHArray1OfHAsciiString
") _CSFDB_GetPDataStd_HArray1OfHAsciiStringData;
		const PDataStd_FieldOfHArray1OfHAsciiString & _CSFDB_GetPDataStd_HArray1OfHAsciiStringData ();
};



%extend PDataStd_HArray1OfHAsciiString {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend PDataStd_HArray1OfHAsciiString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_IntPackedMap;
class PDataStd_IntPackedMap : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataStd_IntPackedMap;
		%feature("autodoc", "	:rtype: None
") PDataStd_IntPackedMap;
		 PDataStd_IntPackedMap ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Inits the internal container if (upper - lower) == 0 and (upper | lower) == 0, the corresponding array is empty (not requested)

	:param theLow:
	:type theLow: int
	:param theUp:
	:type theUp: int
	:rtype: None
") Init;
		void Init (const Standard_Integer theLow,const Standard_Integer theUp);
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Returns true if the internal container is empty

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	* Returns an upper bound of the internal container

	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	* Returns a lower bound of the internal container

	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") GetValue;
		%feature("autodoc", "	:param theIndex:
	:type theIndex: int
	:rtype: int
") GetValue;
		Standard_Integer GetValue (const Standard_Integer theIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param theIndex:
	:type theIndex: int
	:param theValue:
	:type theValue: int
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer theIndex,const Standard_Integer theValue);
		%feature("compactdefaultargs") PDataStd_IntPackedMap;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_IntPackedMap;
		 PDataStd_IntPackedMap (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_IntPackedMapmyIntValues;
		%feature("autodoc", "	:rtype: Handle_PColStd_HArray1OfInteger
") _CSFDB_GetPDataStd_IntPackedMapmyIntValues;
		Handle_PColStd_HArray1OfInteger _CSFDB_GetPDataStd_IntPackedMapmyIntValues ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_IntPackedMapmyIntValues;
		%feature("autodoc", "	:param p:
	:type p: Handle_PColStd_HArray1OfInteger &
	:rtype: None
") _CSFDB_SetPDataStd_IntPackedMapmyIntValues;
		void _CSFDB_SetPDataStd_IntPackedMapmyIntValues (const Handle_PColStd_HArray1OfInteger & p);
};


%extend PDataStd_IntPackedMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_IntPackedMap_1;
class PDataStd_IntPackedMap_1 : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataStd_IntPackedMap_1;
		%feature("autodoc", "	:rtype: None
") PDataStd_IntPackedMap_1;
		 PDataStd_IntPackedMap_1 ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Inits the internal container if (upper - lower) == 0 and (upper | lower) == 0, the corresponding array is empty (not requested)

	:param theLow:
	:type theLow: int
	:param theUp:
	:type theUp: int
	:rtype: None
") Init;
		void Init (const Standard_Integer theLow,const Standard_Integer theUp);
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Returns true if the internal container is empty

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	* Returns an upper bound of the internal container

	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	* Returns a lower bound of the internal container

	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") GetValue;
		%feature("autodoc", "	:param theIndex:
	:type theIndex: int
	:rtype: int
") GetValue;
		Standard_Integer GetValue (const Standard_Integer theIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param theIndex:
	:type theIndex: int
	:param theValue:
	:type theValue: int
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer theIndex,const Standard_Integer theValue);
		%feature("compactdefaultargs") SetDelta;
		%feature("autodoc", "	:param delta:
	:type delta: bool
	:rtype: None
") SetDelta;
		void SetDelta (const Standard_Boolean delta);
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "	:rtype: bool
") GetDelta;
		Standard_Boolean GetDelta ();
		%feature("compactdefaultargs") PDataStd_IntPackedMap_1;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_IntPackedMap_1;
		 PDataStd_IntPackedMap_1 (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_IntPackedMap_1myIntValues;
		%feature("autodoc", "	:rtype: Handle_PColStd_HArray1OfInteger
") _CSFDB_GetPDataStd_IntPackedMap_1myIntValues;
		Handle_PColStd_HArray1OfInteger _CSFDB_GetPDataStd_IntPackedMap_1myIntValues ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_IntPackedMap_1myIntValues;
		%feature("autodoc", "	:param p:
	:type p: Handle_PColStd_HArray1OfInteger &
	:rtype: None
") _CSFDB_SetPDataStd_IntPackedMap_1myIntValues;
		void _CSFDB_SetPDataStd_IntPackedMap_1myIntValues (const Handle_PColStd_HArray1OfInteger & p);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_IntPackedMap_1myDelta;
		%feature("autodoc", "	:rtype: bool
") _CSFDB_GetPDataStd_IntPackedMap_1myDelta;
		Standard_Boolean _CSFDB_GetPDataStd_IntPackedMap_1myDelta ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_IntPackedMap_1myDelta;
		%feature("autodoc", "	:param p:
	:type p: bool
	:rtype: None
") _CSFDB_SetPDataStd_IntPackedMap_1myDelta;
		void _CSFDB_SetPDataStd_IntPackedMap_1myDelta (const Standard_Boolean p);
};


%extend PDataStd_IntPackedMap_1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_Integer;
class PDataStd_Integer : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataStd_Integer;
		%feature("autodoc", "	:rtype: None
") PDataStd_Integer;
		 PDataStd_Integer ();
		%feature("compactdefaultargs") PDataStd_Integer;
		%feature("autodoc", "	:param V:
	:type V: int
	:rtype: None
") PDataStd_Integer;
		 PDataStd_Integer (const Standard_Integer V);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	:rtype: int
") Get;
		Standard_Integer Get ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param V:
	:type V: int
	:rtype: None
") Set;
		void Set (const Standard_Integer V);
		%feature("compactdefaultargs") PDataStd_Integer;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_Integer;
		 PDataStd_Integer (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_IntegermyValue;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPDataStd_IntegermyValue;
		Standard_Integer _CSFDB_GetPDataStd_IntegermyValue ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_IntegermyValue;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPDataStd_IntegermyValue;
		void _CSFDB_SetPDataStd_IntegermyValue (const Standard_Integer p);
};


%extend PDataStd_Integer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_IntegerArray;
class PDataStd_IntegerArray : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataStd_IntegerArray;
		%feature("autodoc", "	:rtype: None
") PDataStd_IntegerArray;
		 PDataStd_IntegerArray ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:rtype: None
") Init;
		void Init (const Standard_Integer lower,const Standard_Integer upper);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: int
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Integer Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: int
") Value;
		Standard_Integer Value (const Standard_Integer Index);
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") PDataStd_IntegerArray;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_IntegerArray;
		 PDataStd_IntegerArray (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_IntegerArraymyValue;
		%feature("autodoc", "	:rtype: Handle_PColStd_HArray1OfInteger
") _CSFDB_GetPDataStd_IntegerArraymyValue;
		Handle_PColStd_HArray1OfInteger _CSFDB_GetPDataStd_IntegerArraymyValue ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_IntegerArraymyValue;
		%feature("autodoc", "	:param p:
	:type p: Handle_PColStd_HArray1OfInteger &
	:rtype: None
") _CSFDB_SetPDataStd_IntegerArraymyValue;
		void _CSFDB_SetPDataStd_IntegerArraymyValue (const Handle_PColStd_HArray1OfInteger & p);
};


%extend PDataStd_IntegerArray {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_IntegerArray_1;
class PDataStd_IntegerArray_1 : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataStd_IntegerArray_1;
		%feature("autodoc", "	:rtype: None
") PDataStd_IntegerArray_1;
		 PDataStd_IntegerArray_1 ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:rtype: None
") Init;
		void Init (const Standard_Integer lower,const Standard_Integer upper);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: int
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Integer Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: int
") Value;
		Standard_Integer Value (const Standard_Integer Index);
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetDelta;
		%feature("autodoc", "	:param delta:
	:type delta: bool
	:rtype: None
") SetDelta;
		void SetDelta (const Standard_Boolean delta);
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "	:rtype: bool
") GetDelta;
		Standard_Boolean GetDelta ();
		%feature("compactdefaultargs") PDataStd_IntegerArray_1;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_IntegerArray_1;
		 PDataStd_IntegerArray_1 (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_IntegerArray_1myValue;
		%feature("autodoc", "	:rtype: Handle_PColStd_HArray1OfInteger
") _CSFDB_GetPDataStd_IntegerArray_1myValue;
		Handle_PColStd_HArray1OfInteger _CSFDB_GetPDataStd_IntegerArray_1myValue ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_IntegerArray_1myValue;
		%feature("autodoc", "	:param p:
	:type p: Handle_PColStd_HArray1OfInteger &
	:rtype: None
") _CSFDB_SetPDataStd_IntegerArray_1myValue;
		void _CSFDB_SetPDataStd_IntegerArray_1myValue (const Handle_PColStd_HArray1OfInteger & p);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_IntegerArray_1myDelta;
		%feature("autodoc", "	:rtype: bool
") _CSFDB_GetPDataStd_IntegerArray_1myDelta;
		Standard_Boolean _CSFDB_GetPDataStd_IntegerArray_1myDelta ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_IntegerArray_1myDelta;
		%feature("autodoc", "	:param p:
	:type p: bool
	:rtype: None
") _CSFDB_SetPDataStd_IntegerArray_1myDelta;
		void _CSFDB_SetPDataStd_IntegerArray_1myDelta (const Standard_Boolean p);
};


%extend PDataStd_IntegerArray_1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_IntegerList;
class PDataStd_IntegerList : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataStd_IntegerList;
		%feature("autodoc", "	:rtype: None
") PDataStd_IntegerList;
		 PDataStd_IntegerList ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:rtype: None
") Init;
		void Init (const Standard_Integer lower,const Standard_Integer upper);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param index:
	:type index: int
	:param value:
	:type value: int
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer index,const Standard_Integer value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param index:
	:type index: int
	:rtype: int
") Value;
		Standard_Integer Value (const Standard_Integer index);
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") PDataStd_IntegerList;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_IntegerList;
		 PDataStd_IntegerList (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_IntegerListmyValue;
		%feature("autodoc", "	:rtype: Handle_PColStd_HArray1OfInteger
") _CSFDB_GetPDataStd_IntegerListmyValue;
		Handle_PColStd_HArray1OfInteger _CSFDB_GetPDataStd_IntegerListmyValue ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_IntegerListmyValue;
		%feature("autodoc", "	:param p:
	:type p: Handle_PColStd_HArray1OfInteger &
	:rtype: None
") _CSFDB_SetPDataStd_IntegerListmyValue;
		void _CSFDB_SetPDataStd_IntegerListmyValue (const Handle_PColStd_HArray1OfInteger & p);
};


%extend PDataStd_IntegerList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_Name;
class PDataStd_Name : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataStd_Name;
		%feature("autodoc", "	:rtype: None
") PDataStd_Name;
		 PDataStd_Name ();
		%feature("compactdefaultargs") PDataStd_Name;
		%feature("autodoc", "	:param V:
	:type V: Handle_PCollection_HExtendedString &
	:rtype: None
") PDataStd_Name;
		 PDataStd_Name (const Handle_PCollection_HExtendedString & V);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	:rtype: Handle_PCollection_HExtendedString
") Get;
		Handle_PCollection_HExtendedString Get ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param V:
	:type V: Handle_PCollection_HExtendedString &
	:rtype: None
") Set;
		void Set (const Handle_PCollection_HExtendedString & V);
		%feature("compactdefaultargs") PDataStd_Name;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_Name;
		 PDataStd_Name (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_NamemyValue;
		%feature("autodoc", "	:rtype: Handle_PCollection_HExtendedString
") _CSFDB_GetPDataStd_NamemyValue;
		Handle_PCollection_HExtendedString _CSFDB_GetPDataStd_NamemyValue ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_NamemyValue;
		%feature("autodoc", "	:param p:
	:type p: Handle_PCollection_HExtendedString &
	:rtype: None
") _CSFDB_SetPDataStd_NamemyValue;
		void _CSFDB_SetPDataStd_NamemyValue (const Handle_PCollection_HExtendedString & p);
};


%extend PDataStd_Name {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_NamedData;
class PDataStd_NamedData : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataStd_NamedData;
		%feature("autodoc", "	:rtype: None
") PDataStd_NamedData;
		 PDataStd_NamedData ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* 6 pairs of (lower, upper) <theDimension> should be initialized if (upper - lower) == 0 and (upper | lower) == 0, the corresponding array is empty (not requested)

	:param theDimension:
	:type theDimension: Handle_TColStd_HArray2OfInteger &
	:rtype: None
") Init;
		void Init (const Handle_TColStd_HArray2OfInteger & theDimension);
		%feature("compactdefaultargs") SetIntDataItem;
		%feature("autodoc", "	:param index:
	:type index: int
	:param key:
	:type key: Handle_PCollection_HExtendedString &
	:param value:
	:type value: int
	:rtype: None
") SetIntDataItem;
		void SetIntDataItem (const Standard_Integer index,const Handle_PCollection_HExtendedString & key,const Standard_Integer value);
		%feature("compactdefaultargs") IntDataItemValue;
		%feature("autodoc", "	:param index:
	:type index: int
	:param key:
	:type key: Handle_PCollection_HExtendedString &
	:rtype: int
") IntDataItemValue;
		Standard_Integer IntDataItemValue (const Standard_Integer index,Handle_PCollection_HExtendedString & key);
		%feature("compactdefaultargs") SetRealDataItem;
		%feature("autodoc", "	:param index:
	:type index: int
	:param key:
	:type key: Handle_PCollection_HExtendedString &
	:param value:
	:type value: float
	:rtype: None
") SetRealDataItem;
		void SetRealDataItem (const Standard_Integer index,const Handle_PCollection_HExtendedString & key,const Standard_Real value);
		%feature("compactdefaultargs") RealDataItemValue;
		%feature("autodoc", "	:param index:
	:type index: int
	:param key:
	:type key: Handle_PCollection_HExtendedString &
	:rtype: float
") RealDataItemValue;
		Standard_Real RealDataItemValue (const Standard_Integer index,Handle_PCollection_HExtendedString & key);
		%feature("compactdefaultargs") SetStrDataItem;
		%feature("autodoc", "	:param index:
	:type index: int
	:param key:
	:type key: Handle_PCollection_HExtendedString &
	:param value:
	:type value: Handle_PCollection_HExtendedString &
	:rtype: None
") SetStrDataItem;
		void SetStrDataItem (const Standard_Integer index,const Handle_PCollection_HExtendedString & key,const Handle_PCollection_HExtendedString & value);
		%feature("compactdefaultargs") StrDataItemValue;
		%feature("autodoc", "	:param index:
	:type index: int
	:param key:
	:type key: Handle_PCollection_HExtendedString &
	:rtype: Handle_PCollection_HExtendedString
") StrDataItemValue;
		Handle_PCollection_HExtendedString StrDataItemValue (const Standard_Integer index,Handle_PCollection_HExtendedString & key);
		%feature("compactdefaultargs") SetByteDataItem;
		%feature("autodoc", "	:param index:
	:type index: int
	:param key:
	:type key: Handle_PCollection_HExtendedString &
	:param value:
	:type value: Standard_Byte
	:rtype: None
") SetByteDataItem;
		void SetByteDataItem (const Standard_Integer index,const Handle_PCollection_HExtendedString & key,const Standard_Byte value);
		%feature("compactdefaultargs") ByteDataItemValue;
		%feature("autodoc", "	:param index:
	:type index: int
	:param key:
	:type key: Handle_PCollection_HExtendedString &
	:rtype: Standard_Byte
") ByteDataItemValue;
		Standard_Byte ByteDataItemValue (const Standard_Integer index,Handle_PCollection_HExtendedString & key);
		%feature("compactdefaultargs") SetArrIntDataItem;
		%feature("autodoc", "	:param index:
	:type index: int
	:param key:
	:type key: Handle_PCollection_HExtendedString &
	:param value:
	:type value: Handle_PColStd_HArray1OfInteger &
	:rtype: None
") SetArrIntDataItem;
		void SetArrIntDataItem (const Standard_Integer index,const Handle_PCollection_HExtendedString & key,const Handle_PColStd_HArray1OfInteger & value);
		%feature("compactdefaultargs") ArrIntDataItemValue;
		%feature("autodoc", "	:param index:
	:type index: int
	:param key:
	:type key: Handle_PCollection_HExtendedString &
	:rtype: Handle_PColStd_HArray1OfInteger
") ArrIntDataItemValue;
		Handle_PColStd_HArray1OfInteger ArrIntDataItemValue (const Standard_Integer index,Handle_PCollection_HExtendedString & key);
		%feature("compactdefaultargs") SetArrRealDataItem;
		%feature("autodoc", "	:param index:
	:type index: int
	:param key:
	:type key: Handle_PCollection_HExtendedString &
	:param value:
	:type value: Handle_PColStd_HArray1OfReal &
	:rtype: None
") SetArrRealDataItem;
		void SetArrRealDataItem (const Standard_Integer index,const Handle_PCollection_HExtendedString & key,const Handle_PColStd_HArray1OfReal & value);
		%feature("compactdefaultargs") ArrRealDataItemValue;
		%feature("autodoc", "	:param index:
	:type index: int
	:param key:
	:type key: Handle_PCollection_HExtendedString &
	:rtype: Handle_PColStd_HArray1OfReal
") ArrRealDataItemValue;
		Handle_PColStd_HArray1OfReal ArrRealDataItemValue (const Standard_Integer index,Handle_PCollection_HExtendedString & key);
		%feature("compactdefaultargs") LowerI;
		%feature("autodoc", "	:rtype: int
") LowerI;
		Standard_Integer LowerI ();
		%feature("compactdefaultargs") UpperI;
		%feature("autodoc", "	:rtype: int
") UpperI;
		Standard_Integer UpperI ();
		%feature("compactdefaultargs") LowerR;
		%feature("autodoc", "	:rtype: int
") LowerR;
		Standard_Integer LowerR ();
		%feature("compactdefaultargs") UpperR;
		%feature("autodoc", "	:rtype: int
") UpperR;
		Standard_Integer UpperR ();
		%feature("compactdefaultargs") LowerS;
		%feature("autodoc", "	:rtype: int
") LowerS;
		Standard_Integer LowerS ();
		%feature("compactdefaultargs") UpperS;
		%feature("autodoc", "	:rtype: int
") UpperS;
		Standard_Integer UpperS ();
		%feature("compactdefaultargs") LowerB;
		%feature("autodoc", "	:rtype: int
") LowerB;
		Standard_Integer LowerB ();
		%feature("compactdefaultargs") UpperB;
		%feature("autodoc", "	:rtype: int
") UpperB;
		Standard_Integer UpperB ();
		%feature("compactdefaultargs") LowerAI;
		%feature("autodoc", "	:rtype: int
") LowerAI;
		Standard_Integer LowerAI ();
		%feature("compactdefaultargs") UpperAI;
		%feature("autodoc", "	:rtype: int
") UpperAI;
		Standard_Integer UpperAI ();
		%feature("compactdefaultargs") LowerAR;
		%feature("autodoc", "	:rtype: int
") LowerAR;
		Standard_Integer LowerAR ();
		%feature("compactdefaultargs") UpperAR;
		%feature("autodoc", "	:rtype: int
") UpperAR;
		Standard_Integer UpperAR ();
		%feature("compactdefaultargs") HasIntegers;
		%feature("autodoc", "	* Returns true if at least one named integer value is kept.

	:rtype: bool
") HasIntegers;
		Standard_Boolean HasIntegers ();
		%feature("compactdefaultargs") HasReals;
		%feature("autodoc", "	* Returns true if at least one named real value is kept.

	:rtype: bool
") HasReals;
		Standard_Boolean HasReals ();
		%feature("compactdefaultargs") HasStrings;
		%feature("autodoc", "	* Returns true if at least one named string value is kept.

	:rtype: bool
") HasStrings;
		Standard_Boolean HasStrings ();
		%feature("compactdefaultargs") HasBytes;
		%feature("autodoc", "	* Returns true if at least one named byte value is kept.

	:rtype: bool
") HasBytes;
		Standard_Boolean HasBytes ();
		%feature("compactdefaultargs") HasArraysOfIntegers;
		%feature("autodoc", "	* Returns true if at least one named array of integer values is kept.

	:rtype: bool
") HasArraysOfIntegers;
		Standard_Boolean HasArraysOfIntegers ();
		%feature("compactdefaultargs") HasArraysOfReals;
		%feature("autodoc", "	* Returns true if at least one named array of real values is kept.

	:rtype: bool
") HasArraysOfReals;
		Standard_Boolean HasArraysOfReals ();
		%feature("compactdefaultargs") PDataStd_NamedData;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_NamedData;
		 PDataStd_NamedData (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_NamedDatamyDimensions;
		%feature("autodoc", "	:rtype: Handle_PColStd_HArray2OfInteger
") _CSFDB_GetPDataStd_NamedDatamyDimensions;
		Handle_PColStd_HArray2OfInteger _CSFDB_GetPDataStd_NamedDatamyDimensions ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_NamedDatamyDimensions;
		%feature("autodoc", "	:param p:
	:type p: Handle_PColStd_HArray2OfInteger &
	:rtype: None
") _CSFDB_SetPDataStd_NamedDatamyDimensions;
		void _CSFDB_SetPDataStd_NamedDatamyDimensions (const Handle_PColStd_HArray2OfInteger & p);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_NamedDatamyIntKeys;
		%feature("autodoc", "	:rtype: Handle_PColStd_HArray1OfExtendedString
") _CSFDB_GetPDataStd_NamedDatamyIntKeys;
		Handle_PColStd_HArray1OfExtendedString _CSFDB_GetPDataStd_NamedDatamyIntKeys ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_NamedDatamyIntKeys;
		%feature("autodoc", "	:param p:
	:type p: Handle_PColStd_HArray1OfExtendedString &
	:rtype: None
") _CSFDB_SetPDataStd_NamedDatamyIntKeys;
		void _CSFDB_SetPDataStd_NamedDatamyIntKeys (const Handle_PColStd_HArray1OfExtendedString & p);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_NamedDatamyIntValues;
		%feature("autodoc", "	:rtype: Handle_PColStd_HArray1OfInteger
") _CSFDB_GetPDataStd_NamedDatamyIntValues;
		Handle_PColStd_HArray1OfInteger _CSFDB_GetPDataStd_NamedDatamyIntValues ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_NamedDatamyIntValues;
		%feature("autodoc", "	:param p:
	:type p: Handle_PColStd_HArray1OfInteger &
	:rtype: None
") _CSFDB_SetPDataStd_NamedDatamyIntValues;
		void _CSFDB_SetPDataStd_NamedDatamyIntValues (const Handle_PColStd_HArray1OfInteger & p);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_NamedDatamyRealKeys;
		%feature("autodoc", "	:rtype: Handle_PColStd_HArray1OfExtendedString
") _CSFDB_GetPDataStd_NamedDatamyRealKeys;
		Handle_PColStd_HArray1OfExtendedString _CSFDB_GetPDataStd_NamedDatamyRealKeys ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_NamedDatamyRealKeys;
		%feature("autodoc", "	:param p:
	:type p: Handle_PColStd_HArray1OfExtendedString &
	:rtype: None
") _CSFDB_SetPDataStd_NamedDatamyRealKeys;
		void _CSFDB_SetPDataStd_NamedDatamyRealKeys (const Handle_PColStd_HArray1OfExtendedString & p);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_NamedDatamyRealValues;
		%feature("autodoc", "	:rtype: Handle_PColStd_HArray1OfReal
") _CSFDB_GetPDataStd_NamedDatamyRealValues;
		Handle_PColStd_HArray1OfReal _CSFDB_GetPDataStd_NamedDatamyRealValues ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_NamedDatamyRealValues;
		%feature("autodoc", "	:param p:
	:type p: Handle_PColStd_HArray1OfReal &
	:rtype: None
") _CSFDB_SetPDataStd_NamedDatamyRealValues;
		void _CSFDB_SetPDataStd_NamedDatamyRealValues (const Handle_PColStd_HArray1OfReal & p);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_NamedDatamyStrKeys;
		%feature("autodoc", "	:rtype: Handle_PColStd_HArray1OfExtendedString
") _CSFDB_GetPDataStd_NamedDatamyStrKeys;
		Handle_PColStd_HArray1OfExtendedString _CSFDB_GetPDataStd_NamedDatamyStrKeys ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_NamedDatamyStrKeys;
		%feature("autodoc", "	:param p:
	:type p: Handle_PColStd_HArray1OfExtendedString &
	:rtype: None
") _CSFDB_SetPDataStd_NamedDatamyStrKeys;
		void _CSFDB_SetPDataStd_NamedDatamyStrKeys (const Handle_PColStd_HArray1OfExtendedString & p);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_NamedDatamyStrValues;
		%feature("autodoc", "	:rtype: Handle_PColStd_HArray1OfExtendedString
") _CSFDB_GetPDataStd_NamedDatamyStrValues;
		Handle_PColStd_HArray1OfExtendedString _CSFDB_GetPDataStd_NamedDatamyStrValues ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_NamedDatamyStrValues;
		%feature("autodoc", "	:param p:
	:type p: Handle_PColStd_HArray1OfExtendedString &
	:rtype: None
") _CSFDB_SetPDataStd_NamedDatamyStrValues;
		void _CSFDB_SetPDataStd_NamedDatamyStrValues (const Handle_PColStd_HArray1OfExtendedString & p);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_NamedDatamyByteKeys;
		%feature("autodoc", "	:rtype: Handle_PColStd_HArray1OfExtendedString
") _CSFDB_GetPDataStd_NamedDatamyByteKeys;
		Handle_PColStd_HArray1OfExtendedString _CSFDB_GetPDataStd_NamedDatamyByteKeys ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_NamedDatamyByteKeys;
		%feature("autodoc", "	:param p:
	:type p: Handle_PColStd_HArray1OfExtendedString &
	:rtype: None
") _CSFDB_SetPDataStd_NamedDatamyByteKeys;
		void _CSFDB_SetPDataStd_NamedDatamyByteKeys (const Handle_PColStd_HArray1OfExtendedString & p);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_NamedDatamyByteValues;
		%feature("autodoc", "	:rtype: Handle_PDataStd_HArray1OfByte
") _CSFDB_GetPDataStd_NamedDatamyByteValues;
		Handle_PDataStd_HArray1OfByte _CSFDB_GetPDataStd_NamedDatamyByteValues ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_NamedDatamyByteValues;
		%feature("autodoc", "	:param p:
	:type p: Handle_PDataStd_HArray1OfByte &
	:rtype: None
") _CSFDB_SetPDataStd_NamedDatamyByteValues;
		void _CSFDB_SetPDataStd_NamedDatamyByteValues (const Handle_PDataStd_HArray1OfByte & p);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_NamedDatamyArrIntKeys;
		%feature("autodoc", "	:rtype: Handle_PColStd_HArray1OfExtendedString
") _CSFDB_GetPDataStd_NamedDatamyArrIntKeys;
		Handle_PColStd_HArray1OfExtendedString _CSFDB_GetPDataStd_NamedDatamyArrIntKeys ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_NamedDatamyArrIntKeys;
		%feature("autodoc", "	:param p:
	:type p: Handle_PColStd_HArray1OfExtendedString &
	:rtype: None
") _CSFDB_SetPDataStd_NamedDatamyArrIntKeys;
		void _CSFDB_SetPDataStd_NamedDatamyArrIntKeys (const Handle_PColStd_HArray1OfExtendedString & p);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_NamedDatamyArrIntValues;
		%feature("autodoc", "	:rtype: Handle_PDataStd_HArray1OfHArray1OfInteger
") _CSFDB_GetPDataStd_NamedDatamyArrIntValues;
		Handle_PDataStd_HArray1OfHArray1OfInteger _CSFDB_GetPDataStd_NamedDatamyArrIntValues ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_NamedDatamyArrIntValues;
		%feature("autodoc", "	:param p:
	:type p: Handle_PDataStd_HArray1OfHArray1OfInteger &
	:rtype: None
") _CSFDB_SetPDataStd_NamedDatamyArrIntValues;
		void _CSFDB_SetPDataStd_NamedDatamyArrIntValues (const Handle_PDataStd_HArray1OfHArray1OfInteger & p);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_NamedDatamyArrRealKeys;
		%feature("autodoc", "	:rtype: Handle_PColStd_HArray1OfExtendedString
") _CSFDB_GetPDataStd_NamedDatamyArrRealKeys;
		Handle_PColStd_HArray1OfExtendedString _CSFDB_GetPDataStd_NamedDatamyArrRealKeys ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_NamedDatamyArrRealKeys;
		%feature("autodoc", "	:param p:
	:type p: Handle_PColStd_HArray1OfExtendedString &
	:rtype: None
") _CSFDB_SetPDataStd_NamedDatamyArrRealKeys;
		void _CSFDB_SetPDataStd_NamedDatamyArrRealKeys (const Handle_PColStd_HArray1OfExtendedString & p);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_NamedDatamyArrRealValues;
		%feature("autodoc", "	:rtype: Handle_PDataStd_HArray1OfHArray1OfReal
") _CSFDB_GetPDataStd_NamedDatamyArrRealValues;
		Handle_PDataStd_HArray1OfHArray1OfReal _CSFDB_GetPDataStd_NamedDatamyArrRealValues ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_NamedDatamyArrRealValues;
		%feature("autodoc", "	:param p:
	:type p: Handle_PDataStd_HArray1OfHArray1OfReal &
	:rtype: None
") _CSFDB_SetPDataStd_NamedDatamyArrRealValues;
		void _CSFDB_SetPDataStd_NamedDatamyArrRealValues (const Handle_PDataStd_HArray1OfHArray1OfReal & p);
};


%extend PDataStd_NamedData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_NoteBook;
class PDataStd_NoteBook : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataStd_NoteBook;
		%feature("autodoc", "	:rtype: None
") PDataStd_NoteBook;
		 PDataStd_NoteBook ();
		%feature("compactdefaultargs") PDataStd_NoteBook;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_NoteBook;
		 PDataStd_NoteBook (const Storage_stCONSTclCOM & a);
};


%extend PDataStd_NoteBook {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_Real;
class PDataStd_Real : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataStd_Real;
		%feature("autodoc", "	:rtype: None
") PDataStd_Real;
		 PDataStd_Real ();
		%feature("compactdefaultargs") PDataStd_Real;
		%feature("autodoc", "	:param Value:
	:type Value: float
	:param Dimension:
	:type Dimension: int
	:rtype: None
") PDataStd_Real;
		 PDataStd_Real (const Standard_Real Value,const Standard_Integer Dimension);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	:rtype: float
") Get;
		Standard_Real Get ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param V:
	:type V: float
	:rtype: None
") Set;
		void Set (const Standard_Real V);
		%feature("compactdefaultargs") SetDimension;
		%feature("autodoc", "	:param DIM:
	:type DIM: int
	:rtype: None
") SetDimension;
		void SetDimension (const Standard_Integer DIM);
		%feature("compactdefaultargs") GetDimension;
		%feature("autodoc", "	:rtype: int
") GetDimension;
		Standard_Integer GetDimension ();
		%feature("compactdefaultargs") PDataStd_Real;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_Real;
		 PDataStd_Real (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_RealmyValue;
		%feature("autodoc", "	:rtype: float
") _CSFDB_GetPDataStd_RealmyValue;
		Standard_Real _CSFDB_GetPDataStd_RealmyValue ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_RealmyValue;
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_SetPDataStd_RealmyValue;
		void _CSFDB_SetPDataStd_RealmyValue (const Standard_Real p);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_RealmyDimension;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPDataStd_RealmyDimension;
		Standard_Integer _CSFDB_GetPDataStd_RealmyDimension ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_RealmyDimension;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPDataStd_RealmyDimension;
		void _CSFDB_SetPDataStd_RealmyDimension (const Standard_Integer p);
};


%extend PDataStd_Real {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_RealArray;
class PDataStd_RealArray : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataStd_RealArray;
		%feature("autodoc", "	:rtype: None
") PDataStd_RealArray;
		 PDataStd_RealArray ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:rtype: None
") Init;
		void Init (const Standard_Integer lower,const Standard_Integer upper);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: float
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Real Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: float
") Value;
		Standard_Real Value (const Standard_Integer Index);
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") PDataStd_RealArray;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_RealArray;
		 PDataStd_RealArray (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_RealArraymyValue;
		%feature("autodoc", "	:rtype: Handle_PColStd_HArray1OfReal
") _CSFDB_GetPDataStd_RealArraymyValue;
		Handle_PColStd_HArray1OfReal _CSFDB_GetPDataStd_RealArraymyValue ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_RealArraymyValue;
		%feature("autodoc", "	:param p:
	:type p: Handle_PColStd_HArray1OfReal &
	:rtype: None
") _CSFDB_SetPDataStd_RealArraymyValue;
		void _CSFDB_SetPDataStd_RealArraymyValue (const Handle_PColStd_HArray1OfReal & p);
};


%extend PDataStd_RealArray {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_RealArray_1;
class PDataStd_RealArray_1 : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataStd_RealArray_1;
		%feature("autodoc", "	:rtype: None
") PDataStd_RealArray_1;
		 PDataStd_RealArray_1 ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:rtype: None
") Init;
		void Init (const Standard_Integer lower,const Standard_Integer upper);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: float
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_Real Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: float
") Value;
		Standard_Real Value (const Standard_Integer Index);
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetDelta;
		%feature("autodoc", "	:param delta:
	:type delta: bool
	:rtype: None
") SetDelta;
		void SetDelta (const Standard_Boolean delta);
		%feature("compactdefaultargs") GetDelta;
		%feature("autodoc", "	:rtype: bool
") GetDelta;
		Standard_Boolean GetDelta ();
		%feature("compactdefaultargs") PDataStd_RealArray_1;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_RealArray_1;
		 PDataStd_RealArray_1 (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_RealArray_1myValue;
		%feature("autodoc", "	:rtype: Handle_PColStd_HArray1OfReal
") _CSFDB_GetPDataStd_RealArray_1myValue;
		Handle_PColStd_HArray1OfReal _CSFDB_GetPDataStd_RealArray_1myValue ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_RealArray_1myValue;
		%feature("autodoc", "	:param p:
	:type p: Handle_PColStd_HArray1OfReal &
	:rtype: None
") _CSFDB_SetPDataStd_RealArray_1myValue;
		void _CSFDB_SetPDataStd_RealArray_1myValue (const Handle_PColStd_HArray1OfReal & p);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_RealArray_1myDelta;
		%feature("autodoc", "	:rtype: bool
") _CSFDB_GetPDataStd_RealArray_1myDelta;
		Standard_Boolean _CSFDB_GetPDataStd_RealArray_1myDelta ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_RealArray_1myDelta;
		%feature("autodoc", "	:param p:
	:type p: bool
	:rtype: None
") _CSFDB_SetPDataStd_RealArray_1myDelta;
		void _CSFDB_SetPDataStd_RealArray_1myDelta (const Standard_Boolean p);
};


%extend PDataStd_RealArray_1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_RealList;
class PDataStd_RealList : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataStd_RealList;
		%feature("autodoc", "	:rtype: None
") PDataStd_RealList;
		 PDataStd_RealList ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:rtype: None
") Init;
		void Init (const Standard_Integer lower,const Standard_Integer upper);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param index:
	:type index: int
	:param value:
	:type value: float
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer index,const Standard_Real value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param index:
	:type index: int
	:rtype: float
") Value;
		Standard_Real Value (const Standard_Integer index);
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") PDataStd_RealList;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_RealList;
		 PDataStd_RealList (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_RealListmyValue;
		%feature("autodoc", "	:rtype: Handle_PColStd_HArray1OfReal
") _CSFDB_GetPDataStd_RealListmyValue;
		Handle_PColStd_HArray1OfReal _CSFDB_GetPDataStd_RealListmyValue ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_RealListmyValue;
		%feature("autodoc", "	:param p:
	:type p: Handle_PColStd_HArray1OfReal &
	:rtype: None
") _CSFDB_SetPDataStd_RealListmyValue;
		void _CSFDB_SetPDataStd_RealListmyValue (const Handle_PColStd_HArray1OfReal & p);
};


%extend PDataStd_RealList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_ReferenceArray;
class PDataStd_ReferenceArray : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataStd_ReferenceArray;
		%feature("autodoc", "	:rtype: None
") PDataStd_ReferenceArray;
		 PDataStd_ReferenceArray ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:rtype: None
") Init;
		void Init (const Standard_Integer lower,const Standard_Integer upper);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param index:
	:type index: int
	:param value:
	:type value: Handle_PCollection_HExtendedString &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer index,const Handle_PCollection_HExtendedString & value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param index:
	:type index: int
	:rtype: Handle_PCollection_HExtendedString
") Value;
		Handle_PCollection_HExtendedString Value (const Standard_Integer index);
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") PDataStd_ReferenceArray;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_ReferenceArray;
		 PDataStd_ReferenceArray (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_ReferenceArraymyValue;
		%feature("autodoc", "	:rtype: Handle_PColStd_HArray1OfExtendedString
") _CSFDB_GetPDataStd_ReferenceArraymyValue;
		Handle_PColStd_HArray1OfExtendedString _CSFDB_GetPDataStd_ReferenceArraymyValue ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_ReferenceArraymyValue;
		%feature("autodoc", "	:param p:
	:type p: Handle_PColStd_HArray1OfExtendedString &
	:rtype: None
") _CSFDB_SetPDataStd_ReferenceArraymyValue;
		void _CSFDB_SetPDataStd_ReferenceArraymyValue (const Handle_PColStd_HArray1OfExtendedString & p);
};


%extend PDataStd_ReferenceArray {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_ReferenceList;
class PDataStd_ReferenceList : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataStd_ReferenceList;
		%feature("autodoc", "	:rtype: None
") PDataStd_ReferenceList;
		 PDataStd_ReferenceList ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param lower:
	:type lower: int
	:param upper:
	:type upper: int
	:rtype: None
") Init;
		void Init (const Standard_Integer lower,const Standard_Integer upper);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param index:
	:type index: int
	:param value:
	:type value: Handle_PCollection_HExtendedString &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer index,const Handle_PCollection_HExtendedString & value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param index:
	:type index: int
	:rtype: Handle_PCollection_HExtendedString
") Value;
		Handle_PCollection_HExtendedString Value (const Standard_Integer index);
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") PDataStd_ReferenceList;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_ReferenceList;
		 PDataStd_ReferenceList (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_ReferenceListmyValue;
		%feature("autodoc", "	:rtype: Handle_PColStd_HArray1OfExtendedString
") _CSFDB_GetPDataStd_ReferenceListmyValue;
		Handle_PColStd_HArray1OfExtendedString _CSFDB_GetPDataStd_ReferenceListmyValue ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_ReferenceListmyValue;
		%feature("autodoc", "	:param p:
	:type p: Handle_PColStd_HArray1OfExtendedString &
	:rtype: None
") _CSFDB_SetPDataStd_ReferenceListmyValue;
		void _CSFDB_SetPDataStd_ReferenceListmyValue (const Handle_PColStd_HArray1OfExtendedString & p);
};


%extend PDataStd_ReferenceList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_Relation;
class PDataStd_Relation : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataStd_Relation;
		%feature("autodoc", "	:rtype: None
") PDataStd_Relation;
		 PDataStd_Relation ();
		%feature("compactdefaultargs") PDataStd_Relation;
		%feature("autodoc", "	:param name:
	:type name: Handle_PCollection_HExtendedString &
	:rtype: None
") PDataStd_Relation;
		 PDataStd_Relation (const Handle_PCollection_HExtendedString & name);
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "	:rtype: Handle_PCollection_HExtendedString
") GetName;
		Handle_PCollection_HExtendedString GetName ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param vars:
	:type vars: Handle_PCollection_HExtendedString &
	:rtype: None
") SetName;
		void SetName (const Handle_PCollection_HExtendedString & vars);
		%feature("compactdefaultargs") GetVariables;
		%feature("autodoc", "	:rtype: Handle_PDF_HAttributeArray1
") GetVariables;
		Handle_PDF_HAttributeArray1 GetVariables ();
		%feature("compactdefaultargs") SetVariables;
		%feature("autodoc", "	:param vars:
	:type vars: Handle_PDF_HAttributeArray1 &
	:rtype: None
") SetVariables;
		void SetVariables (const Handle_PDF_HAttributeArray1 & vars);
		%feature("compactdefaultargs") PDataStd_Relation;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_Relation;
		 PDataStd_Relation (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_RelationmyName;
		%feature("autodoc", "	:rtype: Handle_PCollection_HExtendedString
") _CSFDB_GetPDataStd_RelationmyName;
		Handle_PCollection_HExtendedString _CSFDB_GetPDataStd_RelationmyName ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_RelationmyName;
		%feature("autodoc", "	:param p:
	:type p: Handle_PCollection_HExtendedString &
	:rtype: None
") _CSFDB_SetPDataStd_RelationmyName;
		void _CSFDB_SetPDataStd_RelationmyName (const Handle_PCollection_HExtendedString & p);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_RelationmyVariables;
		%feature("autodoc", "	:rtype: Handle_PDF_HAttributeArray1
") _CSFDB_GetPDataStd_RelationmyVariables;
		Handle_PDF_HAttributeArray1 _CSFDB_GetPDataStd_RelationmyVariables ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_RelationmyVariables;
		%feature("autodoc", "	:param p:
	:type p: Handle_PDF_HAttributeArray1 &
	:rtype: None
") _CSFDB_SetPDataStd_RelationmyVariables;
		void _CSFDB_SetPDataStd_RelationmyVariables (const Handle_PDF_HAttributeArray1 & p);
};


%extend PDataStd_Relation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_Tick;
class PDataStd_Tick : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataStd_Tick;
		%feature("autodoc", "	:rtype: None
") PDataStd_Tick;
		 PDataStd_Tick ();
		%feature("compactdefaultargs") PDataStd_Tick;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_Tick;
		 PDataStd_Tick (const Storage_stCONSTclCOM & a);
};


%extend PDataStd_Tick {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_TreeNode;
class PDataStd_TreeNode : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataStd_TreeNode;
		%feature("autodoc", "	:rtype: None
") PDataStd_TreeNode;
		 PDataStd_TreeNode ();
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_PDataStd_TreeNode
") First;
		Handle_PDataStd_TreeNode First ();
		%feature("compactdefaultargs") SetFirst;
		%feature("autodoc", "	:param F:
	:type F: Handle_PDataStd_TreeNode &
	:rtype: None
") SetFirst;
		void SetFirst (const Handle_PDataStd_TreeNode & F);
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: Handle_PDataStd_TreeNode
") Next;
		Handle_PDataStd_TreeNode Next ();
		%feature("compactdefaultargs") SetNext;
		%feature("autodoc", "	:param F:
	:type F: Handle_PDataStd_TreeNode &
	:rtype: None
") SetNext;
		void SetNext (const Handle_PDataStd_TreeNode & F);
		%feature("compactdefaultargs") SetTreeID;
		%feature("autodoc", "	:param GUID:
	:type GUID: Standard_GUID &
	:rtype: None
") SetTreeID;
		void SetTreeID (const Standard_GUID & GUID);
		%feature("compactdefaultargs") GetTreeID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetTreeID;
		Standard_GUID GetTreeID ();
		%feature("compactdefaultargs") PDataStd_TreeNode;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_TreeNode;
		 PDataStd_TreeNode (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_TreeNodemyFirst;
		%feature("autodoc", "	:rtype: Handle_PDataStd_TreeNode
") _CSFDB_GetPDataStd_TreeNodemyFirst;
		Handle_PDataStd_TreeNode _CSFDB_GetPDataStd_TreeNodemyFirst ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_TreeNodemyFirst;
		%feature("autodoc", "	:param p:
	:type p: Handle_PDataStd_TreeNode &
	:rtype: None
") _CSFDB_SetPDataStd_TreeNodemyFirst;
		void _CSFDB_SetPDataStd_TreeNodemyFirst (const Handle_PDataStd_TreeNode & p);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_TreeNodemyNext;
		%feature("autodoc", "	:rtype: Handle_PDataStd_TreeNode
") _CSFDB_GetPDataStd_TreeNodemyNext;
		Handle_PDataStd_TreeNode _CSFDB_GetPDataStd_TreeNodemyNext ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_TreeNodemyNext;
		%feature("autodoc", "	:param p:
	:type p: Handle_PDataStd_TreeNode &
	:rtype: None
") _CSFDB_SetPDataStd_TreeNodemyNext;
		void _CSFDB_SetPDataStd_TreeNodemyNext (const Handle_PDataStd_TreeNode & p);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_TreeNodemyTreeID;
		%feature("autodoc", "	:rtype: Standard_GUID
") _CSFDB_GetPDataStd_TreeNodemyTreeID;
		const Standard_GUID & _CSFDB_GetPDataStd_TreeNodemyTreeID ();
};


%extend PDataStd_TreeNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_UAttribute;
class PDataStd_UAttribute : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataStd_UAttribute;
		%feature("autodoc", "	:rtype: None
") PDataStd_UAttribute;
		 PDataStd_UAttribute ();
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "	:param guid:
	:type guid: Handle_PCollection_HExtendedString &
	:rtype: None
") SetID;
		void SetID (const Handle_PCollection_HExtendedString & guid);
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Handle_PCollection_HExtendedString
") GetID;
		Handle_PCollection_HExtendedString GetID ();
		%feature("compactdefaultargs") PDataStd_UAttribute;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_UAttribute;
		 PDataStd_UAttribute (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_UAttributemyID;
		%feature("autodoc", "	:rtype: Handle_PCollection_HExtendedString
") _CSFDB_GetPDataStd_UAttributemyID;
		Handle_PCollection_HExtendedString _CSFDB_GetPDataStd_UAttributemyID ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_UAttributemyID;
		%feature("autodoc", "	:param p:
	:type p: Handle_PCollection_HExtendedString &
	:rtype: None
") _CSFDB_SetPDataStd_UAttributemyID;
		void _CSFDB_SetPDataStd_UAttributemyID (const Handle_PCollection_HExtendedString & p);
};


%extend PDataStd_UAttribute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_VArrayNodeOfFieldOfHArray1OfByte;
class PDataStd_VArrayNodeOfFieldOfHArray1OfByte : public PStandard_ArrayNode {
	public:
		%feature("compactdefaultargs") PDataStd_VArrayNodeOfFieldOfHArray1OfByte;
		%feature("autodoc", "	:rtype: None
") PDataStd_VArrayNodeOfFieldOfHArray1OfByte;
		 PDataStd_VArrayNodeOfFieldOfHArray1OfByte ();
		%feature("compactdefaultargs") PDataStd_VArrayNodeOfFieldOfHArray1OfByte;
		%feature("autodoc", "	:param aValue:
	:type aValue: Standard_Byte &
	:rtype: None
") PDataStd_VArrayNodeOfFieldOfHArray1OfByte;
		 PDataStd_VArrayNodeOfFieldOfHArray1OfByte (const Standard_Byte & aValue);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param aValue:
	:type aValue: Standard_Byte &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Byte & aValue);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Standard_Address
") Value;
		Standard_Address Value ();
		%feature("compactdefaultargs") PDataStd_VArrayNodeOfFieldOfHArray1OfByte;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_VArrayNodeOfFieldOfHArray1OfByte;
		 PDataStd_VArrayNodeOfFieldOfHArray1OfByte (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_VArrayNodeOfFieldOfHArray1OfBytemyValue;
		%feature("autodoc", "	:rtype: Standard_Byte
") _CSFDB_GetPDataStd_VArrayNodeOfFieldOfHArray1OfBytemyValue;
		Standard_Byte _CSFDB_GetPDataStd_VArrayNodeOfFieldOfHArray1OfBytemyValue ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_VArrayNodeOfFieldOfHArray1OfBytemyValue;
		%feature("autodoc", "	:param p:
	:type p: Standard_Byte
	:rtype: None
") _CSFDB_SetPDataStd_VArrayNodeOfFieldOfHArray1OfBytemyValue;
		void _CSFDB_SetPDataStd_VArrayNodeOfFieldOfHArray1OfBytemyValue (const Standard_Byte p);
};



%extend PDataStd_VArrayNodeOfFieldOfHArray1OfByte {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend PDataStd_VArrayNodeOfFieldOfHArray1OfByte {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfInteger;
class PDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfInteger : public PStandard_ArrayNode {
	public:
		%feature("compactdefaultargs") PDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfInteger;
		%feature("autodoc", "	:rtype: None
") PDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfInteger;
		 PDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfInteger ();
		%feature("compactdefaultargs") PDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfInteger;
		%feature("autodoc", "	:param aValue:
	:type aValue: Handle_PColStd_HArray1OfInteger &
	:rtype: None
") PDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfInteger;
		 PDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfInteger (const Handle_PColStd_HArray1OfInteger & aValue);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param aValue:
	:type aValue: Handle_PColStd_HArray1OfInteger &
	:rtype: None
") SetValue;
		void SetValue (const Handle_PColStd_HArray1OfInteger & aValue);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Standard_Address
") Value;
		Standard_Address Value ();
		%feature("compactdefaultargs") PDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfInteger;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfInteger;
		 PDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfInteger (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfIntegermyValue;
		%feature("autodoc", "	:rtype: Handle_PColStd_HArray1OfInteger
") _CSFDB_GetPDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfIntegermyValue;
		Handle_PColStd_HArray1OfInteger _CSFDB_GetPDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfIntegermyValue ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfIntegermyValue;
		%feature("autodoc", "	:param p:
	:type p: Handle_PColStd_HArray1OfInteger &
	:rtype: None
") _CSFDB_SetPDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfIntegermyValue;
		void _CSFDB_SetPDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfIntegermyValue (const Handle_PColStd_HArray1OfInteger & p);
};



%extend PDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfInteger {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend PDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfReal;
class PDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfReal : public PStandard_ArrayNode {
	public:
		%feature("compactdefaultargs") PDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfReal;
		%feature("autodoc", "	:rtype: None
") PDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfReal;
		 PDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfReal ();
		%feature("compactdefaultargs") PDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfReal;
		%feature("autodoc", "	:param aValue:
	:type aValue: Handle_PColStd_HArray1OfReal &
	:rtype: None
") PDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfReal;
		 PDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfReal (const Handle_PColStd_HArray1OfReal & aValue);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param aValue:
	:type aValue: Handle_PColStd_HArray1OfReal &
	:rtype: None
") SetValue;
		void SetValue (const Handle_PColStd_HArray1OfReal & aValue);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Standard_Address
") Value;
		Standard_Address Value ();
		%feature("compactdefaultargs") PDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfReal;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfReal;
		 PDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfReal (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfRealmyValue;
		%feature("autodoc", "	:rtype: Handle_PColStd_HArray1OfReal
") _CSFDB_GetPDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfRealmyValue;
		Handle_PColStd_HArray1OfReal _CSFDB_GetPDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfRealmyValue ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfRealmyValue;
		%feature("autodoc", "	:param p:
	:type p: Handle_PColStd_HArray1OfReal &
	:rtype: None
") _CSFDB_SetPDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfRealmyValue;
		void _CSFDB_SetPDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfRealmyValue (const Handle_PColStd_HArray1OfReal & p);
};



%extend PDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfReal {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend PDataStd_VArrayNodeOfFieldOfHArray1OfHArray1OfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_VArrayNodeOfFieldOfHArray1OfHAsciiString;
class PDataStd_VArrayNodeOfFieldOfHArray1OfHAsciiString : public PStandard_ArrayNode {
	public:
		%feature("compactdefaultargs") PDataStd_VArrayNodeOfFieldOfHArray1OfHAsciiString;
		%feature("autodoc", "	:rtype: None
") PDataStd_VArrayNodeOfFieldOfHArray1OfHAsciiString;
		 PDataStd_VArrayNodeOfFieldOfHArray1OfHAsciiString ();
		%feature("compactdefaultargs") PDataStd_VArrayNodeOfFieldOfHArray1OfHAsciiString;
		%feature("autodoc", "	:param aValue:
	:type aValue: Handle_PCollection_HAsciiString &
	:rtype: None
") PDataStd_VArrayNodeOfFieldOfHArray1OfHAsciiString;
		 PDataStd_VArrayNodeOfFieldOfHArray1OfHAsciiString (const Handle_PCollection_HAsciiString & aValue);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param aValue:
	:type aValue: Handle_PCollection_HAsciiString &
	:rtype: None
") SetValue;
		void SetValue (const Handle_PCollection_HAsciiString & aValue);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Standard_Address
") Value;
		Standard_Address Value ();
		%feature("compactdefaultargs") PDataStd_VArrayNodeOfFieldOfHArray1OfHAsciiString;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_VArrayNodeOfFieldOfHArray1OfHAsciiString;
		 PDataStd_VArrayNodeOfFieldOfHArray1OfHAsciiString (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_VArrayNodeOfFieldOfHArray1OfHAsciiStringmyValue;
		%feature("autodoc", "	:rtype: Handle_PCollection_HAsciiString
") _CSFDB_GetPDataStd_VArrayNodeOfFieldOfHArray1OfHAsciiStringmyValue;
		Handle_PCollection_HAsciiString _CSFDB_GetPDataStd_VArrayNodeOfFieldOfHArray1OfHAsciiStringmyValue ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_VArrayNodeOfFieldOfHArray1OfHAsciiStringmyValue;
		%feature("autodoc", "	:param p:
	:type p: Handle_PCollection_HAsciiString &
	:rtype: None
") _CSFDB_SetPDataStd_VArrayNodeOfFieldOfHArray1OfHAsciiStringmyValue;
		void _CSFDB_SetPDataStd_VArrayNodeOfFieldOfHArray1OfHAsciiStringmyValue (const Handle_PCollection_HAsciiString & p);
};



%extend PDataStd_VArrayNodeOfFieldOfHArray1OfHAsciiString {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend PDataStd_VArrayNodeOfFieldOfHArray1OfHAsciiString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_VArrayTNodeOfFieldOfHArray1OfByte;
class PDataStd_VArrayTNodeOfFieldOfHArray1OfByte {
	public:
		%feature("compactdefaultargs") PDataStd_VArrayTNodeOfFieldOfHArray1OfByte;
		%feature("autodoc", "	:rtype: None
") PDataStd_VArrayTNodeOfFieldOfHArray1OfByte;
		 PDataStd_VArrayTNodeOfFieldOfHArray1OfByte ();
		%feature("compactdefaultargs") PDataStd_VArrayTNodeOfFieldOfHArray1OfByte;
		%feature("autodoc", "	:param aValue:
	:type aValue: Standard_Byte &
	:rtype: None
") PDataStd_VArrayTNodeOfFieldOfHArray1OfByte;
		 PDataStd_VArrayTNodeOfFieldOfHArray1OfByte (const Standard_Byte & aValue);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param aValue:
	:type aValue: Standard_Byte &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Byte & aValue);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Standard_Address
") Value;
		Standard_Address Value ();
};



%extend PDataStd_VArrayTNodeOfFieldOfHArray1OfByte {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend PDataStd_VArrayTNodeOfFieldOfHArray1OfByte {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_VArrayTNodeOfFieldOfHArray1OfHArray1OfInteger;
class PDataStd_VArrayTNodeOfFieldOfHArray1OfHArray1OfInteger {
	public:
		%feature("compactdefaultargs") PDataStd_VArrayTNodeOfFieldOfHArray1OfHArray1OfInteger;
		%feature("autodoc", "	:rtype: None
") PDataStd_VArrayTNodeOfFieldOfHArray1OfHArray1OfInteger;
		 PDataStd_VArrayTNodeOfFieldOfHArray1OfHArray1OfInteger ();
		%feature("compactdefaultargs") PDataStd_VArrayTNodeOfFieldOfHArray1OfHArray1OfInteger;
		%feature("autodoc", "	:param aValue:
	:type aValue: Handle_PColStd_HArray1OfInteger &
	:rtype: None
") PDataStd_VArrayTNodeOfFieldOfHArray1OfHArray1OfInteger;
		 PDataStd_VArrayTNodeOfFieldOfHArray1OfHArray1OfInteger (const Handle_PColStd_HArray1OfInteger & aValue);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param aValue:
	:type aValue: Handle_PColStd_HArray1OfInteger &
	:rtype: None
") SetValue;
		void SetValue (const Handle_PColStd_HArray1OfInteger & aValue);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Standard_Address
") Value;
		Standard_Address Value ();
};



%extend PDataStd_VArrayTNodeOfFieldOfHArray1OfHArray1OfInteger {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend PDataStd_VArrayTNodeOfFieldOfHArray1OfHArray1OfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_VArrayTNodeOfFieldOfHArray1OfHArray1OfReal;
class PDataStd_VArrayTNodeOfFieldOfHArray1OfHArray1OfReal {
	public:
		%feature("compactdefaultargs") PDataStd_VArrayTNodeOfFieldOfHArray1OfHArray1OfReal;
		%feature("autodoc", "	:rtype: None
") PDataStd_VArrayTNodeOfFieldOfHArray1OfHArray1OfReal;
		 PDataStd_VArrayTNodeOfFieldOfHArray1OfHArray1OfReal ();
		%feature("compactdefaultargs") PDataStd_VArrayTNodeOfFieldOfHArray1OfHArray1OfReal;
		%feature("autodoc", "	:param aValue:
	:type aValue: Handle_PColStd_HArray1OfReal &
	:rtype: None
") PDataStd_VArrayTNodeOfFieldOfHArray1OfHArray1OfReal;
		 PDataStd_VArrayTNodeOfFieldOfHArray1OfHArray1OfReal (const Handle_PColStd_HArray1OfReal & aValue);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param aValue:
	:type aValue: Handle_PColStd_HArray1OfReal &
	:rtype: None
") SetValue;
		void SetValue (const Handle_PColStd_HArray1OfReal & aValue);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Standard_Address
") Value;
		Standard_Address Value ();
};



%extend PDataStd_VArrayTNodeOfFieldOfHArray1OfHArray1OfReal {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend PDataStd_VArrayTNodeOfFieldOfHArray1OfHArray1OfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_VArrayTNodeOfFieldOfHArray1OfHAsciiString;
class PDataStd_VArrayTNodeOfFieldOfHArray1OfHAsciiString {
	public:
		%feature("compactdefaultargs") PDataStd_VArrayTNodeOfFieldOfHArray1OfHAsciiString;
		%feature("autodoc", "	:rtype: None
") PDataStd_VArrayTNodeOfFieldOfHArray1OfHAsciiString;
		 PDataStd_VArrayTNodeOfFieldOfHArray1OfHAsciiString ();
		%feature("compactdefaultargs") PDataStd_VArrayTNodeOfFieldOfHArray1OfHAsciiString;
		%feature("autodoc", "	:param aValue:
	:type aValue: Handle_PCollection_HAsciiString &
	:rtype: None
") PDataStd_VArrayTNodeOfFieldOfHArray1OfHAsciiString;
		 PDataStd_VArrayTNodeOfFieldOfHArray1OfHAsciiString (const Handle_PCollection_HAsciiString & aValue);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param aValue:
	:type aValue: Handle_PCollection_HAsciiString &
	:rtype: None
") SetValue;
		void SetValue (const Handle_PCollection_HAsciiString & aValue);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Standard_Address
") Value;
		Standard_Address Value ();
};



%extend PDataStd_VArrayTNodeOfFieldOfHArray1OfHAsciiString {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend PDataStd_VArrayTNodeOfFieldOfHArray1OfHAsciiString {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDataStd_Variable;
class PDataStd_Variable : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDataStd_Variable;
		%feature("autodoc", "	:rtype: None
") PDataStd_Variable;
		 PDataStd_Variable ();
		%feature("compactdefaultargs") PDataStd_Variable;
		%feature("autodoc", "	:param constant:
	:type constant: bool
	:rtype: None
") PDataStd_Variable;
		 PDataStd_Variable (const Standard_Boolean constant);
		%feature("compactdefaultargs") Constant;
		%feature("autodoc", "	:param status:
	:type status: bool
	:rtype: None
") Constant;
		void Constant (const Standard_Boolean status);
		%feature("compactdefaultargs") Constant;
		%feature("autodoc", "	:rtype: bool
") Constant;
		Standard_Boolean Constant ();
		%feature("compactdefaultargs") Unit;
		%feature("autodoc", "	:param unit:
	:type unit: Handle_PCollection_HAsciiString &
	:rtype: None
") Unit;
		void Unit (const Handle_PCollection_HAsciiString & unit);
		%feature("compactdefaultargs") Unit;
		%feature("autodoc", "	:rtype: Handle_PCollection_HAsciiString
") Unit;
		Handle_PCollection_HAsciiString Unit ();
		%feature("compactdefaultargs") PDataStd_Variable;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDataStd_Variable;
		 PDataStd_Variable (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_VariableisConstant;
		%feature("autodoc", "	:rtype: bool
") _CSFDB_GetPDataStd_VariableisConstant;
		Standard_Boolean _CSFDB_GetPDataStd_VariableisConstant ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_VariableisConstant;
		%feature("autodoc", "	:param p:
	:type p: bool
	:rtype: None
") _CSFDB_SetPDataStd_VariableisConstant;
		void _CSFDB_SetPDataStd_VariableisConstant (const Standard_Boolean p);
		%feature("compactdefaultargs") _CSFDB_GetPDataStd_VariablemyUnit;
		%feature("autodoc", "	:rtype: Handle_PCollection_HAsciiString
") _CSFDB_GetPDataStd_VariablemyUnit;
		Handle_PCollection_HAsciiString _CSFDB_GetPDataStd_VariablemyUnit ();
		%feature("compactdefaultargs") _CSFDB_SetPDataStd_VariablemyUnit;
		%feature("autodoc", "	:param p:
	:type p: Handle_PCollection_HAsciiString &
	:rtype: None
") _CSFDB_SetPDataStd_VariablemyUnit;
		void _CSFDB_SetPDataStd_VariablemyUnit (const Handle_PCollection_HAsciiString & p);
};


%extend PDataStd_Variable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
