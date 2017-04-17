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
%module (package="OCC") XmlObjMgt

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


%include XmlObjMgt_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
typedef LDOM_Document XmlObjMgt_Document;
typedef LDOM_Element XmlObjMgt_Element;
typedef LDOMString XmlObjMgt_DOMString;
typedef TColStd_IndexedMapOfTransient XmlObjMgt_SRelocationTable;
typedef TColStd_DataMapOfIntegerTransient XmlObjMgt_RRelocationTable;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(xmlobjmgt) XmlObjMgt;
class XmlObjMgt {
	public:
		%feature("compactdefaultargs") IdString;
		%feature("autodoc", "	* Define the name of XMLattribute 'ID' (to be used everywhere)

	:rtype: XmlObjMgt_DOMString
") IdString;
		static const XmlObjMgt_DOMString & IdString ();
		%feature("compactdefaultargs") SetExtendedString;
		%feature("autodoc", "	* Add attribute <theElement extstring='theString' ...>

	:param theElement:
	:type theElement: XmlObjMgt_Element &
	:param theString:
	:type theString: TCollection_ExtendedString &
	:rtype: bool
") SetExtendedString;
		static Standard_Boolean SetExtendedString (XmlObjMgt_Element & theElement,const TCollection_ExtendedString & theString);
		%feature("compactdefaultargs") GetExtendedString;
		%feature("autodoc", "	* Get attribute <theElement extstring='theString' ...>

	:param theElement:
	:type theElement: XmlObjMgt_Element &
	:param theString:
	:type theString: TCollection_ExtendedString &
	:rtype: bool
") GetExtendedString;
		static Standard_Boolean GetExtendedString (const XmlObjMgt_Element & theElement,TCollection_ExtendedString & theString);
		%feature("compactdefaultargs") GetStringValue;
		%feature("autodoc", "	* Returns the first child text node

	:param theElement:
	:type theElement: XmlObjMgt_Element &
	:rtype: XmlObjMgt_DOMString
") GetStringValue;
		static XmlObjMgt_DOMString GetStringValue (const XmlObjMgt_Element & theElement);
		%feature("compactdefaultargs") SetStringValue;
		%feature("autodoc", "	* Add theData as the last child text node to theElement isClearText(True) avoids analysis of the string and replacement of characters like '<' and '&' during XML file storage. Do NEVER set isClearText unless you have a hell of a reason

	:param theElement:
	:type theElement: XmlObjMgt_Element &
	:param theData:
	:type theData: XmlObjMgt_DOMString &
	:param isClearText: default value is Standard_False
	:type isClearText: bool
	:rtype: void
") SetStringValue;
		static void SetStringValue (XmlObjMgt_Element & theElement,const XmlObjMgt_DOMString & theData,const Standard_Boolean isClearText = Standard_False);
		%feature("compactdefaultargs") GetTagEntryString;
		%feature("autodoc", "	* Convert XPath expression (DOMString) into TagEntry string returns False on Error

	:param theTarget:
	:type theTarget: XmlObjMgt_DOMString &
	:param theTagEntry:
	:type theTagEntry: TCollection_AsciiString &
	:rtype: bool
") GetTagEntryString;
		static Standard_Boolean GetTagEntryString (const XmlObjMgt_DOMString & theTarget,TCollection_AsciiString & theTagEntry);
		%feature("compactdefaultargs") SetTagEntryString;
		%feature("autodoc", "	* Convert XPath expression (DOMString) into TagEntry string returns False on Error

	:param theSource:
	:type theSource: XmlObjMgt_DOMString &
	:param theTagEntry:
	:type theTagEntry: TCollection_AsciiString &
	:rtype: void
") SetTagEntryString;
		static void SetTagEntryString (XmlObjMgt_DOMString & theSource,const TCollection_AsciiString & theTagEntry);
		%feature("compactdefaultargs") FindChildElement;
		%feature("autodoc", "	:param theSource:
	:type theSource: XmlObjMgt_Element &
	:param theObjId:
	:type theObjId: int
	:rtype: XmlObjMgt_Element
") FindChildElement;
		static XmlObjMgt_Element FindChildElement (const XmlObjMgt_Element & theSource,const Standard_Integer theObjId);
		%feature("compactdefaultargs") FindChildByRef;
		%feature("autodoc", "	:param theSource:
	:type theSource: XmlObjMgt_Element &
	:param theRefName:
	:type theRefName: XmlObjMgt_DOMString &
	:rtype: XmlObjMgt_Element
") FindChildByRef;
		static XmlObjMgt_Element FindChildByRef (const XmlObjMgt_Element & theSource,const XmlObjMgt_DOMString & theRefName);
		%feature("compactdefaultargs") FindChildByName;
		%feature("autodoc", "	:param theSource:
	:type theSource: XmlObjMgt_Element &
	:param theName:
	:type theName: XmlObjMgt_DOMString &
	:rtype: XmlObjMgt_Element
") FindChildByName;
		static XmlObjMgt_Element FindChildByName (const XmlObjMgt_Element & theSource,const XmlObjMgt_DOMString & theName);
		%feature("compactdefaultargs") GetInteger;
		%feature("autodoc", "	:param theString:
	:type theString: char * &
	:param theValue:
	:type theValue: int &
	:rtype: bool
") GetInteger;
		static Standard_Boolean GetInteger (const char * & theString,Standard_Integer &OutValue);
		%feature("compactdefaultargs") GetReal;
		%feature("autodoc", "	:param theString:
	:type theString: char * &
	:param theValue:
	:type theValue: float &
	:rtype: bool
") GetReal;
		static Standard_Boolean GetReal (const char * & theString,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetReal;
		%feature("autodoc", "	:param theString:
	:type theString: XmlObjMgt_DOMString &
	:param theValue:
	:type theValue: float &
	:rtype: bool
") GetReal;
		static Standard_Boolean GetReal (const XmlObjMgt_DOMString & theString,Standard_Real &OutValue);
};


%extend XmlObjMgt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlObjMgt_Array1;
class XmlObjMgt_Array1 {
	public:
		%feature("compactdefaultargs") XmlObjMgt_Array1;
		%feature("autodoc", "	* Create an array of lower bound <Low> and upper bound <Up>. Range error is raised when <Up> is less than <Low>.

	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") XmlObjMgt_Array1;
		 XmlObjMgt_Array1 (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") XmlObjMgt_Array1;
		%feature("autodoc", "	* for restoration from DOM_Element which is child of theParent: <theParent ...> <theName ...>

	:param theParent:
	:type theParent: XmlObjMgt_Element &
	:param theName:
	:type theName: XmlObjMgt_DOMString &
	:rtype: None
") XmlObjMgt_Array1;
		 XmlObjMgt_Array1 (const XmlObjMgt_Element & theParent,const XmlObjMgt_DOMString & theName);
		%feature("compactdefaultargs") CreateArrayElement;
		%feature("autodoc", "	* Create DOM_Element representing the array, under 'theParent'

	:param theParent:
	:type theParent: XmlObjMgt_Element &
	:param theName:
	:type theName: XmlObjMgt_DOMString &
	:rtype: None
") CreateArrayElement;
		void CreateArrayElement (XmlObjMgt_Element & theParent,const XmlObjMgt_DOMString & theName);
		%feature("compactdefaultargs") Element;
		%feature("autodoc", "	* Returns the DOM element of <self>.

	:rtype: XmlObjMgt_Element
") Element;
		const XmlObjMgt_Element & Element ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* Returns the number of elements of <self>.

	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	* Returns the lower bound.

	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	* Returns the upper bound.

	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Set the <Index>th element of the array to <Value>.

	:param Index:
	:type Index: int
	:param Value:
	:type Value: XmlObjMgt_Element &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,XmlObjMgt_Element & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the value of <Index>th element of the array.

	:param Index:
	:type Index: int
	:rtype: XmlObjMgt_Element
") Value;
		XmlObjMgt_Element Value (const Standard_Integer Index);
};


%extend XmlObjMgt_Array1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class XmlObjMgt_GP {
	public:
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param aTrsf:
	:type aTrsf: gp_Trsf
	:rtype: XmlObjMgt_DOMString
") Translate;
		static XmlObjMgt_DOMString Translate (const gp_Trsf & aTrsf);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param aMat:
	:type aMat: gp_Mat
	:rtype: XmlObjMgt_DOMString
") Translate;
		static XmlObjMgt_DOMString Translate (const gp_Mat & aMat);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param anXYZ:
	:type anXYZ: gp_XYZ
	:rtype: XmlObjMgt_DOMString
") Translate;
		static XmlObjMgt_DOMString Translate (const gp_XYZ & anXYZ);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param aStr:
	:type aStr: XmlObjMgt_DOMString &
	:param T:
	:type T: gp_Trsf
	:rtype: bool
") Translate;
		static Standard_Boolean Translate (const XmlObjMgt_DOMString & aStr,gp_Trsf & T);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param aStr:
	:type aStr: XmlObjMgt_DOMString &
	:param T:
	:type T: gp_Mat
	:rtype: bool
") Translate;
		static Standard_Boolean Translate (const XmlObjMgt_DOMString & aStr,gp_Mat & T);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param aStr:
	:type aStr: XmlObjMgt_DOMString &
	:param T:
	:type T: gp_XYZ
	:rtype: bool
") Translate;
		static Standard_Boolean Translate (const XmlObjMgt_DOMString & aStr,gp_XYZ & T);
};


%extend XmlObjMgt_GP {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlObjMgt_Persistent;
class XmlObjMgt_Persistent {
	public:
		%feature("compactdefaultargs") XmlObjMgt_Persistent;
		%feature("autodoc", "	* empty constructor

	:rtype: None
") XmlObjMgt_Persistent;
		 XmlObjMgt_Persistent ();
		%feature("compactdefaultargs") XmlObjMgt_Persistent;
		%feature("autodoc", "	* constructor

	:param theElement:
	:type theElement: XmlObjMgt_Element &
	:rtype: None
") XmlObjMgt_Persistent;
		 XmlObjMgt_Persistent (const XmlObjMgt_Element & theElement);
		%feature("compactdefaultargs") XmlObjMgt_Persistent;
		%feature("autodoc", "	* constructor from sub-element of Element referenced by theRef

	:param theElement:
	:type theElement: XmlObjMgt_Element &
	:param theRef:
	:type theRef: XmlObjMgt_DOMString &
	:rtype: None
") XmlObjMgt_Persistent;
		 XmlObjMgt_Persistent (const XmlObjMgt_Element & theElement,const XmlObjMgt_DOMString & theRef);
		%feature("compactdefaultargs") CreateElement;
		%feature("autodoc", "	* myElement := <theType id='theID'/>

	:param theParent:
	:type theParent: XmlObjMgt_Element &
	:param theType:
	:type theType: XmlObjMgt_DOMString &
	:param theID:
	:type theID: int
	:rtype: None
") CreateElement;
		void CreateElement (XmlObjMgt_Element & theParent,const XmlObjMgt_DOMString & theType,const Standard_Integer theID);
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "	:param theId:
	:type theId: int
	:rtype: None
") SetId;
		void SetId (const Standard_Integer theId);
		%feature("compactdefaultargs") Element;
		%feature("autodoc", "	* return myElement

	:rtype: XmlObjMgt_Element
") Element;
		const XmlObjMgt_Element & Element ();
		%feature("compactdefaultargs") operator constXmlObjMgt_Element&;
		%feature("autodoc", "	:rtype: inline
") operator constXmlObjMgt_Element&;
		inline operator constXmlObjMgt_Element& ();
		%feature("compactdefaultargs") Element;
		%feature("autodoc", "	* return myElement

	:rtype: XmlObjMgt_Element
") Element;
		XmlObjMgt_Element & Element ();
		%feature("compactdefaultargs") operator XmlObjMgt_Element&;
		%feature("autodoc", "	:rtype: inline
") operator XmlObjMgt_Element&;
		inline operator XmlObjMgt_Element& ();
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "	:rtype: int
") Id;
		Standard_Integer Id ();
};


%extend XmlObjMgt_Persistent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
