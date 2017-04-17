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
%module (package="OCC") PDF

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


%include PDF_headers.i


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
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor PDF_Attribute;
class PDF_Attribute : public Standard_Persistent {
	public:
		%feature("compactdefaultargs") PDF_Attribute;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDF_Attribute;
		 PDF_Attribute (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") PDF_Attribute;
		%feature("autodoc", "	:rtype: None
") PDF_Attribute;
		 PDF_Attribute ();
};


%extend PDF_Attribute {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PDF_Attribute(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PDF_Attribute::Handle_PDF_Attribute %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PDF_Attribute;
class Handle_PDF_Attribute : public Handle_Standard_Persistent {

    public:
        // constructors
        Handle_PDF_Attribute();
        Handle_PDF_Attribute(const Handle_PDF_Attribute &aHandle);
        Handle_PDF_Attribute(const PDF_Attribute *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PDF_Attribute DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_PDF_Attribute {
    PDF_Attribute* _get_reference() {
    return (PDF_Attribute*)$self->Access();
    }
};

%extend Handle_PDF_Attribute {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend PDF_Attribute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDF_Data;
class PDF_Data : public Standard_Persistent {
	public:
		%feature("compactdefaultargs") PDF_Data;
		%feature("autodoc", "	:rtype: None
") PDF_Data;
		 PDF_Data ();
		%feature("compactdefaultargs") PDF_Data;
		%feature("autodoc", "	:param aVersionNumber:
	:type aVersionNumber: int
	:rtype: None
") PDF_Data;
		 PDF_Data (const Standard_Integer aVersionNumber);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the value of the field <myVersion>.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") Labels;
		%feature("autodoc", "	* Sets the field <myLabels> with <theLabels>.

	:param theLabels:
	:type theLabels: Handle_PColStd_HArray1OfInteger &
	:rtype: None
") Labels;
		void Labels (const Handle_PColStd_HArray1OfInteger & theLabels);
		%feature("compactdefaultargs") Labels;
		%feature("autodoc", "	* Returns the value of the field <myLabels>.

	:rtype: Handle_PColStd_HArray1OfInteger
") Labels;
		Handle_PColStd_HArray1OfInteger Labels ();
		%feature("compactdefaultargs") Attributes;
		%feature("autodoc", "	* Sets the field <myAttributes> with <theAttributes>.

	:param theAttributes:
	:type theAttributes: Handle_PDF_HAttributeArray1 &
	:rtype: None
") Attributes;
		void Attributes (const Handle_PDF_HAttributeArray1 & theAttributes);
		%feature("compactdefaultargs") Attributes;
		%feature("autodoc", "	* Returns the value of the field <myAttributes>.

	:rtype: Handle_PDF_HAttributeArray1
") Attributes;
		Handle_PDF_HAttributeArray1 Attributes ();
		%feature("compactdefaultargs") PDF_Data;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDF_Data;
		 PDF_Data (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDF_DatamyVersion;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPDF_DatamyVersion;
		Standard_Integer _CSFDB_GetPDF_DatamyVersion ();
		%feature("compactdefaultargs") _CSFDB_SetPDF_DatamyVersion;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPDF_DatamyVersion;
		void _CSFDB_SetPDF_DatamyVersion (const Standard_Integer p);
		%feature("compactdefaultargs") _CSFDB_GetPDF_DatamyLabels;
		%feature("autodoc", "	:rtype: Handle_PColStd_HArray1OfInteger
") _CSFDB_GetPDF_DatamyLabels;
		Handle_PColStd_HArray1OfInteger _CSFDB_GetPDF_DatamyLabels ();
		%feature("compactdefaultargs") _CSFDB_SetPDF_DatamyLabels;
		%feature("autodoc", "	:param p:
	:type p: Handle_PColStd_HArray1OfInteger &
	:rtype: None
") _CSFDB_SetPDF_DatamyLabels;
		void _CSFDB_SetPDF_DatamyLabels (const Handle_PColStd_HArray1OfInteger & p);
		%feature("compactdefaultargs") _CSFDB_GetPDF_DatamyAttributes;
		%feature("autodoc", "	:rtype: Handle_PDF_HAttributeArray1
") _CSFDB_GetPDF_DatamyAttributes;
		Handle_PDF_HAttributeArray1 _CSFDB_GetPDF_DatamyAttributes ();
		%feature("compactdefaultargs") _CSFDB_SetPDF_DatamyAttributes;
		%feature("autodoc", "	:param p:
	:type p: Handle_PDF_HAttributeArray1 &
	:rtype: None
") _CSFDB_SetPDF_DatamyAttributes;
		void _CSFDB_SetPDF_DatamyAttributes (const Handle_PDF_HAttributeArray1 & p);
};


%extend PDF_Data {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PDF_Data(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PDF_Data::Handle_PDF_Data %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PDF_Data;
class Handle_PDF_Data : public Handle_Standard_Persistent {

    public:
        // constructors
        Handle_PDF_Data();
        Handle_PDF_Data(const Handle_PDF_Data &aHandle);
        Handle_PDF_Data(const PDF_Data *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PDF_Data DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_PDF_Data {
    PDF_Data* _get_reference() {
    return (PDF_Data*)$self->Access();
    }
};

%extend Handle_PDF_Data {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend PDF_Data {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDF_FieldOfHAttributeArray1;
class PDF_FieldOfHAttributeArray1 : public DBC_BaseArray {
	public:
		%feature("compactdefaultargs") PDF_FieldOfHAttributeArray1;
		%feature("autodoc", "	:rtype: None
") PDF_FieldOfHAttributeArray1;
		 PDF_FieldOfHAttributeArray1 ();
		%feature("compactdefaultargs") PDF_FieldOfHAttributeArray1;
		%feature("autodoc", "	:param Size:
	:type Size: int
	:rtype: None
") PDF_FieldOfHAttributeArray1;
		 PDF_FieldOfHAttributeArray1 (const Standard_Integer Size);
		%feature("compactdefaultargs") PDF_FieldOfHAttributeArray1;
		%feature("autodoc", "	:param Varray:
	:type Varray: PDF_FieldOfHAttributeArray1 &
	:rtype: None
") PDF_FieldOfHAttributeArray1;
		 PDF_FieldOfHAttributeArray1 (const PDF_FieldOfHAttributeArray1 & Varray);
		%feature("compactdefaultargs") Resize;
		%feature("autodoc", "	:param Size:
	:type Size: int
	:rtype: None
") Resize;
		void Resize (const Standard_Integer Size);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: PDF_FieldOfHAttributeArray1 &
	:rtype: None
") Assign;
		void Assign (const PDF_FieldOfHAttributeArray1 & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: PDF_FieldOfHAttributeArray1 &
	:rtype: None
") operator =;
		void operator = (const PDF_FieldOfHAttributeArray1 & Other);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_PDF_Attribute &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_PDF_Attribute & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_PDF_Attribute
") Value;
		Handle_PDF_Attribute Value (const Standard_Integer Index);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
};


%extend PDF_FieldOfHAttributeArray1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDF_HAttributeArray1;
class PDF_HAttributeArray1 : public Standard_Persistent {
	public:
		%feature("compactdefaultargs") PDF_HAttributeArray1;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") PDF_HAttributeArray1;
		 PDF_HAttributeArray1 (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") PDF_HAttributeArray1;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_PDF_Attribute &
	:rtype: None
") PDF_HAttributeArray1;
		 PDF_HAttributeArray1 (const Standard_Integer Low,const Standard_Integer Up,const Handle_PDF_Attribute & V);
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
	:type Value: Handle_PDF_Attribute &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_PDF_Attribute & Value);
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_PDF_Attribute
") Value;
		Handle_PDF_Attribute Value (const Standard_Integer Index);
		%feature("compactdefaultargs") PDF_HAttributeArray1;
		%feature("autodoc", "	:rtype: None
") PDF_HAttributeArray1;
		 PDF_HAttributeArray1 ();
		%feature("compactdefaultargs") PDF_HAttributeArray1;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDF_HAttributeArray1;
		 PDF_HAttributeArray1 (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDF_HAttributeArray1LowerBound;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPDF_HAttributeArray1LowerBound;
		Standard_Integer _CSFDB_GetPDF_HAttributeArray1LowerBound ();
		%feature("compactdefaultargs") _CSFDB_SetPDF_HAttributeArray1LowerBound;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPDF_HAttributeArray1LowerBound;
		void _CSFDB_SetPDF_HAttributeArray1LowerBound (const Standard_Integer p);
		%feature("compactdefaultargs") _CSFDB_GetPDF_HAttributeArray1UpperBound;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPDF_HAttributeArray1UpperBound;
		Standard_Integer _CSFDB_GetPDF_HAttributeArray1UpperBound ();
		%feature("compactdefaultargs") _CSFDB_SetPDF_HAttributeArray1UpperBound;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPDF_HAttributeArray1UpperBound;
		void _CSFDB_SetPDF_HAttributeArray1UpperBound (const Standard_Integer p);
		%feature("compactdefaultargs") _CSFDB_GetPDF_HAttributeArray1Data;
		%feature("autodoc", "	:rtype: PDF_FieldOfHAttributeArray1
") _CSFDB_GetPDF_HAttributeArray1Data;
		const PDF_FieldOfHAttributeArray1 & _CSFDB_GetPDF_HAttributeArray1Data ();
};


%extend PDF_HAttributeArray1 {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PDF_HAttributeArray1(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PDF_HAttributeArray1::Handle_PDF_HAttributeArray1 %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PDF_HAttributeArray1;
class Handle_PDF_HAttributeArray1 : public Handle_Standard_Persistent {

    public:
        // constructors
        Handle_PDF_HAttributeArray1();
        Handle_PDF_HAttributeArray1(const Handle_PDF_HAttributeArray1 &aHandle);
        Handle_PDF_HAttributeArray1(const PDF_HAttributeArray1 *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PDF_HAttributeArray1 DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_PDF_HAttributeArray1 {
    PDF_HAttributeArray1* _get_reference() {
    return (PDF_HAttributeArray1*)$self->Access();
    }
};

%extend Handle_PDF_HAttributeArray1 {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend PDF_HAttributeArray1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDF_VArrayNodeOfFieldOfHAttributeArray1;
class PDF_VArrayNodeOfFieldOfHAttributeArray1 : public PStandard_ArrayNode {
	public:
		%feature("compactdefaultargs") PDF_VArrayNodeOfFieldOfHAttributeArray1;
		%feature("autodoc", "	:rtype: None
") PDF_VArrayNodeOfFieldOfHAttributeArray1;
		 PDF_VArrayNodeOfFieldOfHAttributeArray1 ();
		%feature("compactdefaultargs") PDF_VArrayNodeOfFieldOfHAttributeArray1;
		%feature("autodoc", "	:param aValue:
	:type aValue: Handle_PDF_Attribute &
	:rtype: None
") PDF_VArrayNodeOfFieldOfHAttributeArray1;
		 PDF_VArrayNodeOfFieldOfHAttributeArray1 (const Handle_PDF_Attribute & aValue);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param aValue:
	:type aValue: Handle_PDF_Attribute &
	:rtype: None
") SetValue;
		void SetValue (const Handle_PDF_Attribute & aValue);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Standard_Address
") Value;
		Standard_Address Value ();
		%feature("compactdefaultargs") PDF_VArrayNodeOfFieldOfHAttributeArray1;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDF_VArrayNodeOfFieldOfHAttributeArray1;
		 PDF_VArrayNodeOfFieldOfHAttributeArray1 (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDF_VArrayNodeOfFieldOfHAttributeArray1myValue;
		%feature("autodoc", "	:rtype: Handle_PDF_Attribute
") _CSFDB_GetPDF_VArrayNodeOfFieldOfHAttributeArray1myValue;
		Handle_PDF_Attribute _CSFDB_GetPDF_VArrayNodeOfFieldOfHAttributeArray1myValue ();
		%feature("compactdefaultargs") _CSFDB_SetPDF_VArrayNodeOfFieldOfHAttributeArray1myValue;
		%feature("autodoc", "	:param p:
	:type p: Handle_PDF_Attribute &
	:rtype: None
") _CSFDB_SetPDF_VArrayNodeOfFieldOfHAttributeArray1myValue;
		void _CSFDB_SetPDF_VArrayNodeOfFieldOfHAttributeArray1myValue (const Handle_PDF_Attribute & p);
};


%extend PDF_VArrayNodeOfFieldOfHAttributeArray1 {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PDF_VArrayNodeOfFieldOfHAttributeArray1(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PDF_VArrayNodeOfFieldOfHAttributeArray1::Handle_PDF_VArrayNodeOfFieldOfHAttributeArray1 %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PDF_VArrayNodeOfFieldOfHAttributeArray1;
class Handle_PDF_VArrayNodeOfFieldOfHAttributeArray1 : public Handle_PStandard_ArrayNode {

    public:
        // constructors
        Handle_PDF_VArrayNodeOfFieldOfHAttributeArray1();
        Handle_PDF_VArrayNodeOfFieldOfHAttributeArray1(const Handle_PDF_VArrayNodeOfFieldOfHAttributeArray1 &aHandle);
        Handle_PDF_VArrayNodeOfFieldOfHAttributeArray1(const PDF_VArrayNodeOfFieldOfHAttributeArray1 *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PDF_VArrayNodeOfFieldOfHAttributeArray1 DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_PDF_VArrayNodeOfFieldOfHAttributeArray1 {
    PDF_VArrayNodeOfFieldOfHAttributeArray1* _get_reference() {
    return (PDF_VArrayNodeOfFieldOfHAttributeArray1*)$self->Access();
    }
};

%extend Handle_PDF_VArrayNodeOfFieldOfHAttributeArray1 {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend PDF_VArrayNodeOfFieldOfHAttributeArray1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDF_VArrayTNodeOfFieldOfHAttributeArray1;
class PDF_VArrayTNodeOfFieldOfHAttributeArray1 {
	public:
		%feature("compactdefaultargs") PDF_VArrayTNodeOfFieldOfHAttributeArray1;
		%feature("autodoc", "	:rtype: None
") PDF_VArrayTNodeOfFieldOfHAttributeArray1;
		 PDF_VArrayTNodeOfFieldOfHAttributeArray1 ();
		%feature("compactdefaultargs") PDF_VArrayTNodeOfFieldOfHAttributeArray1;
		%feature("autodoc", "	:param aValue:
	:type aValue: Handle_PDF_Attribute &
	:rtype: None
") PDF_VArrayTNodeOfFieldOfHAttributeArray1;
		 PDF_VArrayTNodeOfFieldOfHAttributeArray1 (const Handle_PDF_Attribute & aValue);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param aValue:
	:type aValue: Handle_PDF_Attribute &
	:rtype: None
") SetValue;
		void SetValue (const Handle_PDF_Attribute & aValue);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Standard_Address
") Value;
		Standard_Address Value ();
};


%extend PDF_VArrayTNodeOfFieldOfHAttributeArray1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDF_Reference;
class PDF_Reference : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDF_Reference;
		%feature("autodoc", "	:rtype: None
") PDF_Reference;
		 PDF_Reference ();
		%feature("compactdefaultargs") PDF_Reference;
		%feature("autodoc", "	:param V:
	:type V: Handle_PCollection_HAsciiString &
	:rtype: None
") PDF_Reference;
		 PDF_Reference (const Handle_PCollection_HAsciiString & V);
		%feature("compactdefaultargs") ReferencedLabel;
		%feature("autodoc", "	:rtype: Handle_PCollection_HAsciiString
") ReferencedLabel;
		Handle_PCollection_HAsciiString ReferencedLabel ();
		%feature("compactdefaultargs") ReferencedLabel;
		%feature("autodoc", "	:param V:
	:type V: Handle_PCollection_HAsciiString &
	:rtype: None
") ReferencedLabel;
		void ReferencedLabel (const Handle_PCollection_HAsciiString & V);
		%feature("compactdefaultargs") PDF_Reference;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDF_Reference;
		 PDF_Reference (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDF_ReferencemyValue;
		%feature("autodoc", "	:rtype: Handle_PCollection_HAsciiString
") _CSFDB_GetPDF_ReferencemyValue;
		Handle_PCollection_HAsciiString _CSFDB_GetPDF_ReferencemyValue ();
		%feature("compactdefaultargs") _CSFDB_SetPDF_ReferencemyValue;
		%feature("autodoc", "	:param p:
	:type p: Handle_PCollection_HAsciiString &
	:rtype: None
") _CSFDB_SetPDF_ReferencemyValue;
		void _CSFDB_SetPDF_ReferencemyValue (const Handle_PCollection_HAsciiString & p);
};


%extend PDF_Reference {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PDF_Reference(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PDF_Reference::Handle_PDF_Reference %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PDF_Reference;
class Handle_PDF_Reference : public Handle_PDF_Attribute {

    public:
        // constructors
        Handle_PDF_Reference();
        Handle_PDF_Reference(const Handle_PDF_Reference &aHandle);
        Handle_PDF_Reference(const PDF_Reference *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PDF_Reference DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_PDF_Reference {
    PDF_Reference* _get_reference() {
    return (PDF_Reference*)$self->Access();
    }
};

%extend Handle_PDF_Reference {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend PDF_Reference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDF_TagSource;
class PDF_TagSource : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDF_TagSource;
		%feature("autodoc", "	:rtype: None
") PDF_TagSource;
		 PDF_TagSource ();
		%feature("compactdefaultargs") PDF_TagSource;
		%feature("autodoc", "	:param V:
	:type V: int
	:rtype: None
") PDF_TagSource;
		 PDF_TagSource (const Standard_Integer V);
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
		%feature("compactdefaultargs") PDF_TagSource;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDF_TagSource;
		 PDF_TagSource (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDF_TagSourcemyValue;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPDF_TagSourcemyValue;
		Standard_Integer _CSFDB_GetPDF_TagSourcemyValue ();
		%feature("compactdefaultargs") _CSFDB_SetPDF_TagSourcemyValue;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPDF_TagSourcemyValue;
		void _CSFDB_SetPDF_TagSourcemyValue (const Standard_Integer p);
};


%extend PDF_TagSource {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PDF_TagSource(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PDF_TagSource::Handle_PDF_TagSource %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PDF_TagSource;
class Handle_PDF_TagSource : public Handle_PDF_Attribute {

    public:
        // constructors
        Handle_PDF_TagSource();
        Handle_PDF_TagSource(const Handle_PDF_TagSource &aHandle);
        Handle_PDF_TagSource(const PDF_TagSource *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PDF_TagSource DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_PDF_TagSource {
    PDF_TagSource* _get_reference() {
    return (PDF_TagSource*)$self->Access();
    }
};

%extend Handle_PDF_TagSource {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend PDF_TagSource {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
