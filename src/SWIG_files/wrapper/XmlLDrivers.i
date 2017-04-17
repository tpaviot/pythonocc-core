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
%module (package="OCC") XmlLDrivers

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


%include XmlLDrivers_headers.i


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

%rename(xmlldrivers) XmlLDrivers;
class XmlLDrivers {
	public:
		%feature("compactdefaultargs") Factory;
		%feature("autodoc", "	:param theGUID:
	:type theGUID: Standard_GUID &
	:rtype: Handle_Standard_Transient
") Factory;
		static Handle_Standard_Transient Factory (const Standard_GUID & theGUID);
		%feature("compactdefaultargs") CreationDate;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") CreationDate;
		static TCollection_AsciiString CreationDate ();
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: Handle_XmlMDF_ADriverTable
") AttributeDrivers;
		static Handle_XmlMDF_ADriverTable AttributeDrivers (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") StorageVersion;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") StorageVersion;
		static TCollection_AsciiString StorageVersion ();
};


%extend XmlLDrivers {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlLDrivers_DocumentRetrievalDriver;
class XmlLDrivers_DocumentRetrievalDriver : public PCDM_RetrievalDriver {
	public:
		%feature("compactdefaultargs") XmlLDrivers_DocumentRetrievalDriver;
		%feature("autodoc", "	:rtype: None
") XmlLDrivers_DocumentRetrievalDriver;
		 XmlLDrivers_DocumentRetrievalDriver ();
		%feature("compactdefaultargs") SchemaName;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") SchemaName;
		virtual TCollection_ExtendedString SchemaName ();
		%feature("compactdefaultargs") Make;
		%feature("autodoc", "	:param PD:
	:type PD: Handle_PCDM_Document &
	:param TD:
	:type TD: Handle_CDM_Document &
	:rtype: void
") Make;
		virtual void Make (const Handle_PCDM_Document & PD,const Handle_CDM_Document & TD);
		%feature("compactdefaultargs") CreateDocument;
		%feature("autodoc", "	:rtype: Handle_CDM_Document
") CreateDocument;
		virtual Handle_CDM_Document CreateDocument ();
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "	:param theFileName:
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
	:rtype: Handle_XmlMDF_ADriverTable
") AttributeDrivers;
		virtual Handle_XmlMDF_ADriverTable AttributeDrivers (const Handle_CDM_MessageDriver & theMsgDriver);
};


%extend XmlLDrivers_DocumentRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlLDrivers_DocumentRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlLDrivers_DocumentRetrievalDriver::Handle_XmlLDrivers_DocumentRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlLDrivers_DocumentRetrievalDriver;
class Handle_XmlLDrivers_DocumentRetrievalDriver : public Handle_PCDM_RetrievalDriver {

    public:
        // constructors
        Handle_XmlLDrivers_DocumentRetrievalDriver();
        Handle_XmlLDrivers_DocumentRetrievalDriver(const Handle_XmlLDrivers_DocumentRetrievalDriver &aHandle);
        Handle_XmlLDrivers_DocumentRetrievalDriver(const XmlLDrivers_DocumentRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlLDrivers_DocumentRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlLDrivers_DocumentRetrievalDriver {
    XmlLDrivers_DocumentRetrievalDriver* _get_reference() {
    return (XmlLDrivers_DocumentRetrievalDriver*)$self->Access();
    }
};

%extend Handle_XmlLDrivers_DocumentRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlLDrivers_DocumentRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlLDrivers_DocumentStorageDriver;
class XmlLDrivers_DocumentStorageDriver : public PCDM_StorageDriver {
	public:
		%feature("compactdefaultargs") XmlLDrivers_DocumentStorageDriver;
		%feature("autodoc", "	:param theCopyright:
	:type theCopyright: TCollection_ExtendedString &
	:rtype: None
") XmlLDrivers_DocumentStorageDriver;
		 XmlLDrivers_DocumentStorageDriver (const TCollection_ExtendedString & theCopyright);
		%feature("compactdefaultargs") SchemaName;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") SchemaName;
		virtual TCollection_ExtendedString SchemaName ();
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	:param theDocument:
	:type theDocument: Handle_CDM_Document &
	:param theFileName:
	:type theFileName: TCollection_ExtendedString &
	:rtype: void
") Write;
		virtual void Write (const Handle_CDM_Document & theDocument,const TCollection_ExtendedString & theFileName);
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: Handle_XmlMDF_ADriverTable
") AttributeDrivers;
		virtual Handle_XmlMDF_ADriverTable AttributeDrivers (const Handle_CDM_MessageDriver & theMsgDriver);
};


%extend XmlLDrivers_DocumentStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlLDrivers_DocumentStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlLDrivers_DocumentStorageDriver::Handle_XmlLDrivers_DocumentStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlLDrivers_DocumentStorageDriver;
class Handle_XmlLDrivers_DocumentStorageDriver : public Handle_PCDM_StorageDriver {

    public:
        // constructors
        Handle_XmlLDrivers_DocumentStorageDriver();
        Handle_XmlLDrivers_DocumentStorageDriver(const Handle_XmlLDrivers_DocumentStorageDriver &aHandle);
        Handle_XmlLDrivers_DocumentStorageDriver(const XmlLDrivers_DocumentStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlLDrivers_DocumentStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlLDrivers_DocumentStorageDriver {
    XmlLDrivers_DocumentStorageDriver* _get_reference() {
    return (XmlLDrivers_DocumentStorageDriver*)$self->Access();
    }
};

%extend Handle_XmlLDrivers_DocumentStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlLDrivers_DocumentStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlLDrivers_NamespaceDef;
class XmlLDrivers_NamespaceDef {
	public:
		%feature("compactdefaultargs") XmlLDrivers_NamespaceDef;
		%feature("autodoc", "	:rtype: None
") XmlLDrivers_NamespaceDef;
		 XmlLDrivers_NamespaceDef ();
		%feature("compactdefaultargs") XmlLDrivers_NamespaceDef;
		%feature("autodoc", "	:param thePrefix:
	:type thePrefix: TCollection_AsciiString &
	:param theURI:
	:type theURI: TCollection_AsciiString &
	:rtype: None
") XmlLDrivers_NamespaceDef;
		 XmlLDrivers_NamespaceDef (const TCollection_AsciiString & thePrefix,const TCollection_AsciiString & theURI);
		%feature("compactdefaultargs") Prefix;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Prefix;
		const TCollection_AsciiString & Prefix ();
		%feature("compactdefaultargs") URI;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") URI;
		const TCollection_AsciiString & URI ();
};


%extend XmlLDrivers_NamespaceDef {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlLDrivers_SequenceNodeOfSequenceOfNamespaceDef;
class XmlLDrivers_SequenceNodeOfSequenceOfNamespaceDef : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") XmlLDrivers_SequenceNodeOfSequenceOfNamespaceDef;
		%feature("autodoc", "	:param I:
	:type I: XmlLDrivers_NamespaceDef &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") XmlLDrivers_SequenceNodeOfSequenceOfNamespaceDef;
		 XmlLDrivers_SequenceNodeOfSequenceOfNamespaceDef (const XmlLDrivers_NamespaceDef & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: XmlLDrivers_NamespaceDef
") Value;
		XmlLDrivers_NamespaceDef & Value ();
};


%extend XmlLDrivers_SequenceNodeOfSequenceOfNamespaceDef {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlLDrivers_SequenceNodeOfSequenceOfNamespaceDef(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlLDrivers_SequenceNodeOfSequenceOfNamespaceDef::Handle_XmlLDrivers_SequenceNodeOfSequenceOfNamespaceDef %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlLDrivers_SequenceNodeOfSequenceOfNamespaceDef;
class Handle_XmlLDrivers_SequenceNodeOfSequenceOfNamespaceDef : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_XmlLDrivers_SequenceNodeOfSequenceOfNamespaceDef();
        Handle_XmlLDrivers_SequenceNodeOfSequenceOfNamespaceDef(const Handle_XmlLDrivers_SequenceNodeOfSequenceOfNamespaceDef &aHandle);
        Handle_XmlLDrivers_SequenceNodeOfSequenceOfNamespaceDef(const XmlLDrivers_SequenceNodeOfSequenceOfNamespaceDef *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlLDrivers_SequenceNodeOfSequenceOfNamespaceDef DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlLDrivers_SequenceNodeOfSequenceOfNamespaceDef {
    XmlLDrivers_SequenceNodeOfSequenceOfNamespaceDef* _get_reference() {
    return (XmlLDrivers_SequenceNodeOfSequenceOfNamespaceDef*)$self->Access();
    }
};

%extend Handle_XmlLDrivers_SequenceNodeOfSequenceOfNamespaceDef {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlLDrivers_SequenceNodeOfSequenceOfNamespaceDef {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlLDrivers_SequenceOfNamespaceDef;
class XmlLDrivers_SequenceOfNamespaceDef : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") XmlLDrivers_SequenceOfNamespaceDef;
		%feature("autodoc", "	:rtype: None
") XmlLDrivers_SequenceOfNamespaceDef;
		 XmlLDrivers_SequenceOfNamespaceDef ();
		%feature("compactdefaultargs") XmlLDrivers_SequenceOfNamespaceDef;
		%feature("autodoc", "	:param Other:
	:type Other: XmlLDrivers_SequenceOfNamespaceDef &
	:rtype: None
") XmlLDrivers_SequenceOfNamespaceDef;
		 XmlLDrivers_SequenceOfNamespaceDef (const XmlLDrivers_SequenceOfNamespaceDef & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: XmlLDrivers_SequenceOfNamespaceDef &
	:rtype: XmlLDrivers_SequenceOfNamespaceDef
") Assign;
		const XmlLDrivers_SequenceOfNamespaceDef & Assign (const XmlLDrivers_SequenceOfNamespaceDef & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: XmlLDrivers_SequenceOfNamespaceDef &
	:rtype: XmlLDrivers_SequenceOfNamespaceDef
") operator =;
		const XmlLDrivers_SequenceOfNamespaceDef & operator = (const XmlLDrivers_SequenceOfNamespaceDef & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: XmlLDrivers_NamespaceDef &
	:rtype: None
") Append;
		void Append (const XmlLDrivers_NamespaceDef & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: XmlLDrivers_SequenceOfNamespaceDef &
	:rtype: None
") Append;
		void Append (XmlLDrivers_SequenceOfNamespaceDef & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: XmlLDrivers_NamespaceDef &
	:rtype: None
") Prepend;
		void Prepend (const XmlLDrivers_NamespaceDef & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: XmlLDrivers_SequenceOfNamespaceDef &
	:rtype: None
") Prepend;
		void Prepend (XmlLDrivers_SequenceOfNamespaceDef & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: XmlLDrivers_NamespaceDef &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const XmlLDrivers_NamespaceDef & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: XmlLDrivers_SequenceOfNamespaceDef &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,XmlLDrivers_SequenceOfNamespaceDef & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: XmlLDrivers_NamespaceDef &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const XmlLDrivers_NamespaceDef & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: XmlLDrivers_SequenceOfNamespaceDef &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,XmlLDrivers_SequenceOfNamespaceDef & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: XmlLDrivers_NamespaceDef
") First;
		const XmlLDrivers_NamespaceDef & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: XmlLDrivers_NamespaceDef
") Last;
		const XmlLDrivers_NamespaceDef & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: XmlLDrivers_SequenceOfNamespaceDef &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,XmlLDrivers_SequenceOfNamespaceDef & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: XmlLDrivers_NamespaceDef
") Value;
		const XmlLDrivers_NamespaceDef & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: XmlLDrivers_NamespaceDef &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const XmlLDrivers_NamespaceDef & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: XmlLDrivers_NamespaceDef
") ChangeValue;
		XmlLDrivers_NamespaceDef & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend XmlLDrivers_SequenceOfNamespaceDef {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
