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
%module (package="OCC") PDocStd

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


%include PDocStd_headers.i


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

%nodefaultctor PDocStd_Document;
class PDocStd_Document : public PCDM_Document {
	public:
		%feature("compactdefaultargs") PDocStd_Document;
		%feature("autodoc", "	:rtype: None
") PDocStd_Document;
		 PDocStd_Document ();
		%feature("compactdefaultargs") PDocStd_Document;
		%feature("autodoc", "	:param data:
	:type data: Handle_PDF_Data &
	:rtype: None
") PDocStd_Document;
		 PDocStd_Document (const Handle_PDF_Data & data);
		%feature("compactdefaultargs") SetData;
		%feature("autodoc", "	:param data:
	:type data: Handle_PDF_Data &
	:rtype: None
") SetData;
		void SetData (const Handle_PDF_Data & data);
		%feature("compactdefaultargs") GetData;
		%feature("autodoc", "	:rtype: Handle_PDF_Data
") GetData;
		Handle_PDF_Data GetData ();
		%feature("compactdefaultargs") PDocStd_Document;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDocStd_Document;
		 PDocStd_Document (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDocStd_DocumentmyData;
		%feature("autodoc", "	:rtype: Handle_PDF_Data
") _CSFDB_GetPDocStd_DocumentmyData;
		Handle_PDF_Data _CSFDB_GetPDocStd_DocumentmyData ();
		%feature("compactdefaultargs") _CSFDB_SetPDocStd_DocumentmyData;
		%feature("autodoc", "	:param p:
	:type p: Handle_PDF_Data &
	:rtype: None
") _CSFDB_SetPDocStd_DocumentmyData;
		void _CSFDB_SetPDocStd_DocumentmyData (const Handle_PDF_Data & p);
};


%extend PDocStd_Document {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PDocStd_Document(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PDocStd_Document::Handle_PDocStd_Document %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PDocStd_Document;
class Handle_PDocStd_Document : public Handle_PCDM_Document {

    public:
        // constructors
        Handle_PDocStd_Document();
        Handle_PDocStd_Document(const Handle_PDocStd_Document &aHandle);
        Handle_PDocStd_Document(const PDocStd_Document *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PDocStd_Document DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_PDocStd_Document {
    PDocStd_Document* _get_reference() {
    return (PDocStd_Document*)$self->Access();
    }
};

%extend Handle_PDocStd_Document {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend PDocStd_Document {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PDocStd_XLink;
class PDocStd_XLink : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PDocStd_XLink;
		%feature("autodoc", "	* Returns an empty persistent external reference.

	:rtype: None
") PDocStd_XLink;
		 PDocStd_XLink ();
		%feature("compactdefaultargs") DocumentEntry;
		%feature("autodoc", "	* Sets the field <myDocEntry> with <aDocEntry>.

	:param aDocEntry:
	:type aDocEntry: Handle_PCollection_HAsciiString &
	:rtype: None
") DocumentEntry;
		void DocumentEntry (const Handle_PCollection_HAsciiString & aDocEntry);
		%feature("compactdefaultargs") DocumentEntry;
		%feature("autodoc", "	* Returns the contents of the field <myDocEntry>.

	:rtype: Handle_PCollection_HAsciiString
") DocumentEntry;
		Handle_PCollection_HAsciiString DocumentEntry ();
		%feature("compactdefaultargs") LabelEntry;
		%feature("autodoc", "	* Sets the field <myLabEntry> with <aLabEntry>.

	:param aLabEntry:
	:type aLabEntry: Handle_PCollection_HAsciiString &
	:rtype: None
") LabelEntry;
		void LabelEntry (const Handle_PCollection_HAsciiString & aLabEntry);
		%feature("compactdefaultargs") LabelEntry;
		%feature("autodoc", "	* Returns the contents of the field <myLabEntry>.

	:rtype: Handle_PCollection_HAsciiString
") LabelEntry;
		Handle_PCollection_HAsciiString LabelEntry ();
		%feature("compactdefaultargs") PDocStd_XLink;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PDocStd_XLink;
		 PDocStd_XLink (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPDocStd_XLinkmyDocEntry;
		%feature("autodoc", "	:rtype: Handle_PCollection_HAsciiString
") _CSFDB_GetPDocStd_XLinkmyDocEntry;
		Handle_PCollection_HAsciiString _CSFDB_GetPDocStd_XLinkmyDocEntry ();
		%feature("compactdefaultargs") _CSFDB_SetPDocStd_XLinkmyDocEntry;
		%feature("autodoc", "	:param p:
	:type p: Handle_PCollection_HAsciiString &
	:rtype: None
") _CSFDB_SetPDocStd_XLinkmyDocEntry;
		void _CSFDB_SetPDocStd_XLinkmyDocEntry (const Handle_PCollection_HAsciiString & p);
		%feature("compactdefaultargs") _CSFDB_GetPDocStd_XLinkmyLabEntry;
		%feature("autodoc", "	:rtype: Handle_PCollection_HAsciiString
") _CSFDB_GetPDocStd_XLinkmyLabEntry;
		Handle_PCollection_HAsciiString _CSFDB_GetPDocStd_XLinkmyLabEntry ();
		%feature("compactdefaultargs") _CSFDB_SetPDocStd_XLinkmyLabEntry;
		%feature("autodoc", "	:param p:
	:type p: Handle_PCollection_HAsciiString &
	:rtype: None
") _CSFDB_SetPDocStd_XLinkmyLabEntry;
		void _CSFDB_SetPDocStd_XLinkmyLabEntry (const Handle_PCollection_HAsciiString & p);
};


%extend PDocStd_XLink {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PDocStd_XLink(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PDocStd_XLink::Handle_PDocStd_XLink %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PDocStd_XLink;
class Handle_PDocStd_XLink : public Handle_PDF_Attribute {

    public:
        // constructors
        Handle_PDocStd_XLink();
        Handle_PDocStd_XLink(const Handle_PDocStd_XLink &aHandle);
        Handle_PDocStd_XLink(const PDocStd_XLink *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PDocStd_XLink DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_PDocStd_XLink {
    PDocStd_XLink* _get_reference() {
    return (PDocStd_XLink*)$self->Access();
    }
};

%extend Handle_PDocStd_XLink {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend PDocStd_XLink {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
