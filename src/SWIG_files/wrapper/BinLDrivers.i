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
%module (package="OCC") BinLDrivers

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


%include BinLDrivers_headers.i


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
typedef NCollection_Vector <BinLDrivers_DocumentSection> BinLDrivers_VectorOfDocumentSection;
/* end typedefs declaration */

/* public enums */
enum BinLDrivers_Marker {
	BinLDrivers_ENDATTRLIST = - 1,
	BinLDrivers_ENDLABEL = - 2,
};

/* end public enums declaration */

%rename(binldrivers) BinLDrivers;
class BinLDrivers {
	public:
		%feature("compactdefaultargs") Factory;
		%feature("autodoc", "	:param theGUID:
	:type theGUID: Standard_GUID &
	:rtype: Handle_Standard_Transient
") Factory;
		static Handle_Standard_Transient Factory (const Standard_GUID & theGUID);
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "	* Creates a table of the supported drivers' types

	:param MsgDrv:
	:type MsgDrv: Handle_CDM_MessageDriver &
	:rtype: Handle_BinMDF_ADriverTable
") AttributeDrivers;
		static Handle_BinMDF_ADriverTable AttributeDrivers (const Handle_CDM_MessageDriver & MsgDrv);
		%feature("compactdefaultargs") StorageVersion;
		%feature("autodoc", "	* returns last storage version

	:rtype: TCollection_AsciiString
") StorageVersion;
		static TCollection_AsciiString StorageVersion ();
};


%extend BinLDrivers {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinLDrivers_DocumentRetrievalDriver;
class BinLDrivers_DocumentRetrievalDriver : public PCDM_RetrievalDriver {
	public:
		%feature("compactdefaultargs") BinLDrivers_DocumentRetrievalDriver;
		%feature("autodoc", "	* Constructor

	:rtype: None
") BinLDrivers_DocumentRetrievalDriver;
		 BinLDrivers_DocumentRetrievalDriver ();
		%feature("compactdefaultargs") SchemaName;
		%feature("autodoc", "	* pure virtual method definition

	:rtype: TCollection_ExtendedString
") SchemaName;
		virtual TCollection_ExtendedString SchemaName ();
		%feature("compactdefaultargs") Make;
		%feature("autodoc", "	* pure virtual method definition

	:param PD:
	:type PD: Handle_PCDM_Document &
	:param TD:
	:type TD: Handle_CDM_Document &
	:rtype: void
") Make;
		virtual void Make (const Handle_PCDM_Document & PD,const Handle_CDM_Document & TD);
		%feature("compactdefaultargs") CreateDocument;
		%feature("autodoc", "	* pure virtual method definition

	:rtype: Handle_CDM_Document
") CreateDocument;
		virtual Handle_CDM_Document CreateDocument ();
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "	* retrieves the content of the file into a new Document.

	:param theFileName:
	:type theFileName: TCollection_ExtendedString &
	:param theNewDocument:
	:type theNewDocument: Handle_CDM_Document &
	:param theApplication:
	:type theApplication: Handle_CDM_Application &
	:rtype: void
") Read;
		virtual void Read (const TCollection_ExtendedString & theFileName,const Handle_CDM_Document & theNewDocument,const Handle_CDM_Application & theApplication);
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: Handle_BinMDF_ADriverTable
") AttributeDrivers;
		virtual Handle_BinMDF_ADriverTable AttributeDrivers (const Handle_CDM_MessageDriver & theMsgDriver);
};


%extend BinLDrivers_DocumentRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinLDrivers_DocumentRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinLDrivers_DocumentRetrievalDriver::Handle_BinLDrivers_DocumentRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinLDrivers_DocumentRetrievalDriver;
class Handle_BinLDrivers_DocumentRetrievalDriver : public Handle_PCDM_RetrievalDriver {

    public:
        // constructors
        Handle_BinLDrivers_DocumentRetrievalDriver();
        Handle_BinLDrivers_DocumentRetrievalDriver(const Handle_BinLDrivers_DocumentRetrievalDriver &aHandle);
        Handle_BinLDrivers_DocumentRetrievalDriver(const BinLDrivers_DocumentRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinLDrivers_DocumentRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinLDrivers_DocumentRetrievalDriver {
    BinLDrivers_DocumentRetrievalDriver* _get_reference() {
    return (BinLDrivers_DocumentRetrievalDriver*)$self->Access();
    }
};

%extend Handle_BinLDrivers_DocumentRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinLDrivers_DocumentRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinLDrivers_DocumentSection;
class BinLDrivers_DocumentSection {
	public:
		%feature("compactdefaultargs") BinLDrivers_DocumentSection;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") BinLDrivers_DocumentSection;
		 BinLDrivers_DocumentSection ();
		%feature("compactdefaultargs") BinLDrivers_DocumentSection;
		%feature("autodoc", "	* Constructor

	:param theName:
	:type theName: TCollection_AsciiString &
	:param isPostRead:
	:type isPostRead: bool
	:rtype: None
") BinLDrivers_DocumentSection;
		 BinLDrivers_DocumentSection (const TCollection_AsciiString & theName,const Standard_Boolean isPostRead);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Query the name of the section.

	:rtype: TCollection_AsciiString
") Name;
		const TCollection_AsciiString & Name ();
		%feature("compactdefaultargs") IsPostRead;
		%feature("autodoc", "	* Query the status: if the Section should be read after OCAF; False means that the Section is read before starting to read OCAF data.

	:rtype: bool
") IsPostRead;
		Standard_Boolean IsPostRead ();
		%feature("compactdefaultargs") Offset;
		%feature("autodoc", "	* Query the offset of the section in the persistent file

	:rtype: Standard_Size
") Offset;
		Standard_Size Offset ();
		%feature("compactdefaultargs") SetOffset;
		%feature("autodoc", "	* Set the offset of the section in the persistent file

	:param theOffset:
	:type theOffset: Standard_Size
	:rtype: None
") SetOffset;
		void SetOffset (const Standard_Size theOffset);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* Query the length of the section in the persistent file

	:rtype: Standard_Size
") Length;
		Standard_Size Length ();
		%feature("compactdefaultargs") SetLength;
		%feature("autodoc", "	* Set the length of the section in the persistent file

	:param theLength:
	:type theLength: Standard_Size
	:rtype: None
") SetLength;
		void SetLength (const Standard_Size theLength);

        %feature("autodoc", "1");
        %extend{
            std::string WriteTOCToString() {
            std::stringstream s;
            self->WriteTOC(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* Save Offset and Length data into the Section entry in the Document TOC (list of sections)

	:param theOS:
	:type theOS: Standard_OStream &
	:param theOffset:
	:type theOffset: Standard_Size
	:rtype: None
") Write;
		void Write (Standard_OStream & theOS,const Standard_Size theOffset);
		%feature("compactdefaultargs") ReadTOC;
		%feature("autodoc", "	* Fill a DocumentSection instance from the data that are read from TOC.

	:param theSection:
	:type theSection: BinLDrivers_DocumentSection &
	:param theIS:
	:type theIS: Standard_IStream &
	:rtype: void
") ReadTOC;
		static void ReadTOC (BinLDrivers_DocumentSection & theSection,Standard_IStream & theIS);
};


%extend BinLDrivers_DocumentSection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinLDrivers_DocumentStorageDriver;
class BinLDrivers_DocumentStorageDriver : public PCDM_StorageDriver {
	public:
		%feature("compactdefaultargs") BinLDrivers_DocumentStorageDriver;
		%feature("autodoc", "	* Constructor

	:rtype: None
") BinLDrivers_DocumentStorageDriver;
		 BinLDrivers_DocumentStorageDriver ();
		%feature("compactdefaultargs") SchemaName;
		%feature("autodoc", "	* pure virtual method definition

	:rtype: TCollection_ExtendedString
") SchemaName;
		virtual TCollection_ExtendedString SchemaName ();
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* Write <theDocument> to the binary file <theFileName>

	:param theDocument:
	:type theDocument: Handle_CDM_Document &
	:param theFileName:
	:type theFileName: TCollection_ExtendedString &
	:rtype: void
") Write;
		virtual void Write (const Handle_CDM_Document & theDocument,const TCollection_ExtendedString & theFileName);
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: Handle_BinMDF_ADriverTable
") AttributeDrivers;
		virtual Handle_BinMDF_ADriverTable AttributeDrivers (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") AddSection;
		%feature("autodoc", "	* Create a section that should be written after the OCAF data

	:param theName:
	:type theName: TCollection_AsciiString &
	:param isPostRead: default value is Standard_True
	:type isPostRead: bool
	:rtype: None
") AddSection;
		void AddSection (const TCollection_AsciiString & theName,const Standard_Boolean isPostRead = Standard_True);
};


%extend BinLDrivers_DocumentStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinLDrivers_DocumentStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinLDrivers_DocumentStorageDriver::Handle_BinLDrivers_DocumentStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinLDrivers_DocumentStorageDriver;
class Handle_BinLDrivers_DocumentStorageDriver : public Handle_PCDM_StorageDriver {

    public:
        // constructors
        Handle_BinLDrivers_DocumentStorageDriver();
        Handle_BinLDrivers_DocumentStorageDriver(const Handle_BinLDrivers_DocumentStorageDriver &aHandle);
        Handle_BinLDrivers_DocumentStorageDriver(const BinLDrivers_DocumentStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinLDrivers_DocumentStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinLDrivers_DocumentStorageDriver {
    BinLDrivers_DocumentStorageDriver* _get_reference() {
    return (BinLDrivers_DocumentStorageDriver*)$self->Access();
    }
};

%extend Handle_BinLDrivers_DocumentStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinLDrivers_DocumentStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
