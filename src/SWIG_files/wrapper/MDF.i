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
%module (package="OCC") MDF

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


%include MDF_headers.i


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

%rename(mdf) MDF;
class MDF {
	public:
		%feature("compactdefaultargs") FromTo;
		%feature("autodoc", "	* Translates a transient <aSource> into a persistent <aTarget>.

	:param aSource:
	:type aSource: Handle_TDF_Data &
	:param aTarget:
	:type aTarget: Handle_PDF_Data &
	:param aDriverTable:
	:type aDriverTable: Handle_MDF_ASDriverTable &
	:param aReloc:
	:type aReloc: Handle_MDF_SRelocationTable &
	:param aVersion: default value is 0
	:type aVersion: int
	:rtype: void
") FromTo;
		static void FromTo (const Handle_TDF_Data & aSource,Handle_PDF_Data & aTarget,const Handle_MDF_ASDriverTable & aDriverTable,const Handle_MDF_SRelocationTable & aReloc,const Standard_Integer aVersion = 0);
		%feature("compactdefaultargs") FromTo;
		%feature("autodoc", "	* Translates a persistent <aSource> into a transient <aTarget>.

	:param aSource:
	:type aSource: Handle_PDF_Data &
	:param aTarget:
	:type aTarget: Handle_TDF_Data &
	:param aDriverTable:
	:type aDriverTable: Handle_MDF_ARDriverTable &
	:param aReloc:
	:type aReloc: Handle_MDF_RRelocationTable &
	:rtype: void
") FromTo;
		static void FromTo (const Handle_PDF_Data & aSource,Handle_TDF_Data & aTarget,const Handle_MDF_ARDriverTable & aDriverTable,const Handle_MDF_RRelocationTable & aReloc);
		%feature("compactdefaultargs") AddStorageDrivers;
		%feature("autodoc", "	* Adds the attribute storage drivers to <aDriverSeq>.

	:param aDriverSeq:
	:type aDriverSeq: Handle_MDF_ASDriverHSequence &
	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: void
") AddStorageDrivers;
		static void AddStorageDrivers (const Handle_MDF_ASDriverHSequence & aDriverSeq,const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") AddRetrievalDrivers;
		%feature("autodoc", "	* Adds the attribute retrieval drivers to <aDriverSeq>.

	:param aDriverSeq:
	:type aDriverSeq: Handle_MDF_ARDriverHSequence &
	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: void
") AddRetrievalDrivers;
		static void AddRetrievalDrivers (const Handle_MDF_ARDriverHSequence & aDriverSeq,const Handle_CDM_MessageDriver & theMessageDriver);
};


%extend MDF {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_ARDriver;
class MDF_ARDriver : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available.

	:rtype: int
") VersionNumber;
		virtual Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type of source object, inheriting from Attribute from PDF.

	:rtype: Handle_Standard_Type
") SourceType;
		virtual Handle_Standard_Type SourceType ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	* Creates a new attribute from PDF.

	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* Translate the contents of <aSource> and put it into <aTarget>, using the relocation table <aRelocTable> to keep the sharings.

	:param aSource:
	:type aSource: Handle_PDF_Attribute &
	:param aTarget:
	:type aTarget: Handle_TDF_Attribute &
	:param aRelocTable:
	:type aRelocTable: Handle_MDF_RRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_PDF_Attribute & aSource,const Handle_TDF_Attribute & aTarget,const Handle_MDF_RRelocationTable & aRelocTable);
		%feature("compactdefaultargs") WriteMessage;
		%feature("autodoc", "	* To send message to Application (if MessageDriver defined)

	:param theMessage:
	:type theMessage: TCollection_ExtendedString &
	:rtype: None
") WriteMessage;
		void WriteMessage (const TCollection_ExtendedString & theMessage);
};


%extend MDF_ARDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDF_ARDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDF_ARDriver::Handle_MDF_ARDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDF_ARDriver;
class Handle_MDF_ARDriver : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_MDF_ARDriver();
        Handle_MDF_ARDriver(const Handle_MDF_ARDriver &aHandle);
        Handle_MDF_ARDriver(const MDF_ARDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDF_ARDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDF_ARDriver {
    MDF_ARDriver* _get_reference() {
    return (MDF_ARDriver*)$self->Access();
    }
};

%extend Handle_MDF_ARDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDF_ARDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_ARDriverHSequence;
class MDF_ARDriverHSequence : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") MDF_ARDriverHSequence;
		%feature("autodoc", "	:rtype: None
") MDF_ARDriverHSequence;
		 MDF_ARDriverHSequence ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_MDF_ARDriver &
	:rtype: None
") Append;
		void Append (const Handle_MDF_ARDriver & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_MDF_ARDriverHSequence &
	:rtype: None
") Append;
		void Append (const Handle_MDF_ARDriverHSequence & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_MDF_ARDriver &
	:rtype: None
") Prepend;
		void Prepend (const Handle_MDF_ARDriver & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_MDF_ARDriverHSequence &
	:rtype: None
") Prepend;
		void Prepend (const Handle_MDF_ARDriverHSequence & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_MDF_ARDriver &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_MDF_ARDriver & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_MDF_ARDriverHSequence &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_MDF_ARDriverHSequence & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_MDF_ARDriver &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_MDF_ARDriver & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_MDF_ARDriverHSequence &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_MDF_ARDriverHSequence & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_MDF_ARDriverHSequence
") Split;
		Handle_MDF_ARDriverHSequence Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_MDF_ARDriver &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_MDF_ARDriver & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_MDF_ARDriver
") Value;
		Handle_MDF_ARDriver Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_MDF_ARDriver
") ChangeValue;
		Handle_MDF_ARDriver ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: MDF_ARDriverSequence
") Sequence;
		const MDF_ARDriverSequence & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: MDF_ARDriverSequence
") ChangeSequence;
		MDF_ARDriverSequence & ChangeSequence ();
};


%extend MDF_ARDriverHSequence {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDF_ARDriverHSequence(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDF_ARDriverHSequence::Handle_MDF_ARDriverHSequence %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDF_ARDriverHSequence;
class Handle_MDF_ARDriverHSequence : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_MDF_ARDriverHSequence();
        Handle_MDF_ARDriverHSequence(const Handle_MDF_ARDriverHSequence &aHandle);
        Handle_MDF_ARDriverHSequence(const MDF_ARDriverHSequence *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDF_ARDriverHSequence DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDF_ARDriverHSequence {
    MDF_ARDriverHSequence* _get_reference() {
    return (MDF_ARDriverHSequence*)$self->Access();
    }
};

%extend Handle_MDF_ARDriverHSequence {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDF_ARDriverHSequence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_ARDriverSequence;
class MDF_ARDriverSequence : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") MDF_ARDriverSequence;
		%feature("autodoc", "	:rtype: None
") MDF_ARDriverSequence;
		 MDF_ARDriverSequence ();
		%feature("compactdefaultargs") MDF_ARDriverSequence;
		%feature("autodoc", "	:param Other:
	:type Other: MDF_ARDriverSequence &
	:rtype: None
") MDF_ARDriverSequence;
		 MDF_ARDriverSequence (const MDF_ARDriverSequence & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: MDF_ARDriverSequence &
	:rtype: MDF_ARDriverSequence
") Assign;
		const MDF_ARDriverSequence & Assign (const MDF_ARDriverSequence & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: MDF_ARDriverSequence &
	:rtype: MDF_ARDriverSequence
") operator =;
		const MDF_ARDriverSequence & operator = (const MDF_ARDriverSequence & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_MDF_ARDriver &
	:rtype: None
") Append;
		void Append (const Handle_MDF_ARDriver & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: MDF_ARDriverSequence &
	:rtype: None
") Append;
		void Append (MDF_ARDriverSequence & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_MDF_ARDriver &
	:rtype: None
") Prepend;
		void Prepend (const Handle_MDF_ARDriver & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: MDF_ARDriverSequence &
	:rtype: None
") Prepend;
		void Prepend (MDF_ARDriverSequence & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_MDF_ARDriver &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_MDF_ARDriver & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: MDF_ARDriverSequence &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,MDF_ARDriverSequence & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_MDF_ARDriver &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_MDF_ARDriver & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: MDF_ARDriverSequence &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,MDF_ARDriverSequence & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_MDF_ARDriver
") First;
		Handle_MDF_ARDriver First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_MDF_ARDriver
") Last;
		Handle_MDF_ARDriver Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: MDF_ARDriverSequence &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,MDF_ARDriverSequence & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_MDF_ARDriver
") Value;
		Handle_MDF_ARDriver Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_MDF_ARDriver &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_MDF_ARDriver & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_MDF_ARDriver
") ChangeValue;
		Handle_MDF_ARDriver ChangeValue (const Standard_Integer Index);
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


%extend MDF_ARDriverSequence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_ARDriverTable;
class MDF_ARDriverTable : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") MDF_ARDriverTable;
		%feature("autodoc", "	:rtype: None
") MDF_ARDriverTable;
		 MDF_ARDriverTable ();
		%feature("compactdefaultargs") SetDriver;
		%feature("autodoc", "	:param anHDriver:
	:type anHDriver: Handle_MDF_ARDriver &
	:rtype: None
") SetDriver;
		void SetDriver (const Handle_MDF_ARDriver & anHDriver);
		%feature("compactdefaultargs") SetDrivers;
		%feature("autodoc", "	:param aDriverHSeq:
	:type aDriverHSeq: Handle_MDF_ARDriverHSequence &
	:rtype: None
") SetDrivers;
		void SetDrivers (const Handle_MDF_ARDriverHSequence & aDriverHSeq);
		%feature("compactdefaultargs") GetDrivers;
		%feature("autodoc", "	:param aVersion: default value is 0
	:type aVersion: int
	:rtype: MDF_TypeARDriverMap
") GetDrivers;
		const MDF_TypeARDriverMap & GetDrivers (const Standard_Integer aVersion = 0);
		%feature("compactdefaultargs") GetDriver;
		%feature("autodoc", "	:param aType:
	:type aType: Handle_Standard_Type &
	:param anHDriver:
	:type anHDriver: Handle_MDF_ARDriver &
	:param aVersion: default value is 0
	:type aVersion: int
	:rtype: bool
") GetDriver;
		Standard_Boolean GetDriver (const Handle_Standard_Type & aType,Handle_MDF_ARDriver & anHDriver,const Standard_Integer aVersion = 0);
};


%extend MDF_ARDriverTable {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDF_ARDriverTable(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDF_ARDriverTable::Handle_MDF_ARDriverTable %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDF_ARDriverTable;
class Handle_MDF_ARDriverTable : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_MDF_ARDriverTable();
        Handle_MDF_ARDriverTable(const Handle_MDF_ARDriverTable &aHandle);
        Handle_MDF_ARDriverTable(const MDF_ARDriverTable *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDF_ARDriverTable DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDF_ARDriverTable {
    MDF_ARDriverTable* _get_reference() {
    return (MDF_ARDriverTable*)$self->Access();
    }
};

%extend Handle_MDF_ARDriverTable {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDF_ARDriverTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_ASDriver;
class MDF_ASDriver : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available.

	:rtype: int
") VersionNumber;
		virtual Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type of source object, inheriting from Attribute from TDF.

	:rtype: Handle_Standard_Type
") SourceType;
		virtual Handle_Standard_Type SourceType ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	* Creates a new attribute from PDF.

	:rtype: Handle_PDF_Attribute
") NewEmpty;
		virtual Handle_PDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* Translate the contents of <aSource> and put it into <aTarget>, using the relocation table <aRelocTable> to keep the sharings.

	:param aSource:
	:type aSource: Handle_TDF_Attribute &
	:param aTarget:
	:type aTarget: Handle_PDF_Attribute &
	:param aRelocTable:
	:type aRelocTable: Handle_MDF_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & aSource,const Handle_PDF_Attribute & aTarget,const Handle_MDF_SRelocationTable & aRelocTable);
		%feature("compactdefaultargs") WriteMessage;
		%feature("autodoc", "	* To send message to Application (if MessageDriver defined)

	:param theMessage:
	:type theMessage: TCollection_ExtendedString &
	:rtype: None
") WriteMessage;
		void WriteMessage (const TCollection_ExtendedString & theMessage);
};


%extend MDF_ASDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDF_ASDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDF_ASDriver::Handle_MDF_ASDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDF_ASDriver;
class Handle_MDF_ASDriver : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_MDF_ASDriver();
        Handle_MDF_ASDriver(const Handle_MDF_ASDriver &aHandle);
        Handle_MDF_ASDriver(const MDF_ASDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDF_ASDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDF_ASDriver {
    MDF_ASDriver* _get_reference() {
    return (MDF_ASDriver*)$self->Access();
    }
};

%extend Handle_MDF_ASDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDF_ASDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_ASDriverHSequence;
class MDF_ASDriverHSequence : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") MDF_ASDriverHSequence;
		%feature("autodoc", "	:rtype: None
") MDF_ASDriverHSequence;
		 MDF_ASDriverHSequence ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_MDF_ASDriver &
	:rtype: None
") Append;
		void Append (const Handle_MDF_ASDriver & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_MDF_ASDriverHSequence &
	:rtype: None
") Append;
		void Append (const Handle_MDF_ASDriverHSequence & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_MDF_ASDriver &
	:rtype: None
") Prepend;
		void Prepend (const Handle_MDF_ASDriver & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_MDF_ASDriverHSequence &
	:rtype: None
") Prepend;
		void Prepend (const Handle_MDF_ASDriverHSequence & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_MDF_ASDriver &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_MDF_ASDriver & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_MDF_ASDriverHSequence &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_MDF_ASDriverHSequence & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_MDF_ASDriver &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_MDF_ASDriver & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_MDF_ASDriverHSequence &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_MDF_ASDriverHSequence & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_MDF_ASDriverHSequence
") Split;
		Handle_MDF_ASDriverHSequence Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_MDF_ASDriver &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_MDF_ASDriver & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_MDF_ASDriver
") Value;
		Handle_MDF_ASDriver Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_MDF_ASDriver
") ChangeValue;
		Handle_MDF_ASDriver ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: MDF_ASDriverSequence
") Sequence;
		const MDF_ASDriverSequence & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: MDF_ASDriverSequence
") ChangeSequence;
		MDF_ASDriverSequence & ChangeSequence ();
};


%extend MDF_ASDriverHSequence {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDF_ASDriverHSequence(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDF_ASDriverHSequence::Handle_MDF_ASDriverHSequence %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDF_ASDriverHSequence;
class Handle_MDF_ASDriverHSequence : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_MDF_ASDriverHSequence();
        Handle_MDF_ASDriverHSequence(const Handle_MDF_ASDriverHSequence &aHandle);
        Handle_MDF_ASDriverHSequence(const MDF_ASDriverHSequence *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDF_ASDriverHSequence DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDF_ASDriverHSequence {
    MDF_ASDriverHSequence* _get_reference() {
    return (MDF_ASDriverHSequence*)$self->Access();
    }
};

%extend Handle_MDF_ASDriverHSequence {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDF_ASDriverHSequence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_ASDriverSequence;
class MDF_ASDriverSequence : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") MDF_ASDriverSequence;
		%feature("autodoc", "	:rtype: None
") MDF_ASDriverSequence;
		 MDF_ASDriverSequence ();
		%feature("compactdefaultargs") MDF_ASDriverSequence;
		%feature("autodoc", "	:param Other:
	:type Other: MDF_ASDriverSequence &
	:rtype: None
") MDF_ASDriverSequence;
		 MDF_ASDriverSequence (const MDF_ASDriverSequence & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: MDF_ASDriverSequence &
	:rtype: MDF_ASDriverSequence
") Assign;
		const MDF_ASDriverSequence & Assign (const MDF_ASDriverSequence & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: MDF_ASDriverSequence &
	:rtype: MDF_ASDriverSequence
") operator =;
		const MDF_ASDriverSequence & operator = (const MDF_ASDriverSequence & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_MDF_ASDriver &
	:rtype: None
") Append;
		void Append (const Handle_MDF_ASDriver & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: MDF_ASDriverSequence &
	:rtype: None
") Append;
		void Append (MDF_ASDriverSequence & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_MDF_ASDriver &
	:rtype: None
") Prepend;
		void Prepend (const Handle_MDF_ASDriver & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: MDF_ASDriverSequence &
	:rtype: None
") Prepend;
		void Prepend (MDF_ASDriverSequence & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_MDF_ASDriver &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_MDF_ASDriver & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: MDF_ASDriverSequence &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,MDF_ASDriverSequence & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_MDF_ASDriver &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_MDF_ASDriver & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: MDF_ASDriverSequence &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,MDF_ASDriverSequence & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_MDF_ASDriver
") First;
		Handle_MDF_ASDriver First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_MDF_ASDriver
") Last;
		Handle_MDF_ASDriver Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: MDF_ASDriverSequence &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,MDF_ASDriverSequence & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_MDF_ASDriver
") Value;
		Handle_MDF_ASDriver Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_MDF_ASDriver &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_MDF_ASDriver & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_MDF_ASDriver
") ChangeValue;
		Handle_MDF_ASDriver ChangeValue (const Standard_Integer Index);
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


%extend MDF_ASDriverSequence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_ASDriverTable;
class MDF_ASDriverTable : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") MDF_ASDriverTable;
		%feature("autodoc", "	:rtype: None
") MDF_ASDriverTable;
		 MDF_ASDriverTable ();
		%feature("compactdefaultargs") SetDriver;
		%feature("autodoc", "	:param anHDriver:
	:type anHDriver: Handle_MDF_ASDriver &
	:rtype: None
") SetDriver;
		void SetDriver (const Handle_MDF_ASDriver & anHDriver);
		%feature("compactdefaultargs") SetDrivers;
		%feature("autodoc", "	:param aDriverHSeq:
	:type aDriverHSeq: Handle_MDF_ASDriverHSequence &
	:rtype: None
") SetDrivers;
		void SetDrivers (const Handle_MDF_ASDriverHSequence & aDriverHSeq);
		%feature("compactdefaultargs") GetDrivers;
		%feature("autodoc", "	:param aVersion: default value is 0
	:type aVersion: int
	:rtype: MDF_TypeASDriverMap
") GetDrivers;
		const MDF_TypeASDriverMap & GetDrivers (const Standard_Integer aVersion = 0);
		%feature("compactdefaultargs") GetDriver;
		%feature("autodoc", "	:param aType:
	:type aType: Handle_Standard_Type &
	:param anHDriver:
	:type anHDriver: Handle_MDF_ASDriver &
	:param aVersion: default value is 0
	:type aVersion: int
	:rtype: bool
") GetDriver;
		Standard_Boolean GetDriver (const Handle_Standard_Type & aType,Handle_MDF_ASDriver & anHDriver,const Standard_Integer aVersion = 0);
};


%extend MDF_ASDriverTable {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDF_ASDriverTable(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDF_ASDriverTable::Handle_MDF_ASDriverTable %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDF_ASDriverTable;
class Handle_MDF_ASDriverTable : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_MDF_ASDriverTable();
        Handle_MDF_ASDriverTable(const Handle_MDF_ASDriverTable &aHandle);
        Handle_MDF_ASDriverTable(const MDF_ASDriverTable *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDF_ASDriverTable DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDF_ASDriverTable {
    MDF_ASDriverTable* _get_reference() {
    return (MDF_ASDriverTable*)$self->Access();
    }
};

%extend Handle_MDF_ASDriverTable {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDF_ASDriverTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_DataMapIteratorOfTypeARDriverMap;
class MDF_DataMapIteratorOfTypeARDriverMap : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") MDF_DataMapIteratorOfTypeARDriverMap;
		%feature("autodoc", "	:rtype: None
") MDF_DataMapIteratorOfTypeARDriverMap;
		 MDF_DataMapIteratorOfTypeARDriverMap ();
		%feature("compactdefaultargs") MDF_DataMapIteratorOfTypeARDriverMap;
		%feature("autodoc", "	:param aMap:
	:type aMap: MDF_TypeARDriverMap &
	:rtype: None
") MDF_DataMapIteratorOfTypeARDriverMap;
		 MDF_DataMapIteratorOfTypeARDriverMap (const MDF_TypeARDriverMap & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: MDF_TypeARDriverMap &
	:rtype: None
") Initialize;
		void Initialize (const MDF_TypeARDriverMap & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
") Key;
		Handle_Standard_Type Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_MDF_ARDriver
") Value;
		Handle_MDF_ARDriver Value ();
};


%extend MDF_DataMapIteratorOfTypeARDriverMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_DataMapIteratorOfTypeASDriverMap;
class MDF_DataMapIteratorOfTypeASDriverMap : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") MDF_DataMapIteratorOfTypeASDriverMap;
		%feature("autodoc", "	:rtype: None
") MDF_DataMapIteratorOfTypeASDriverMap;
		 MDF_DataMapIteratorOfTypeASDriverMap ();
		%feature("compactdefaultargs") MDF_DataMapIteratorOfTypeASDriverMap;
		%feature("autodoc", "	:param aMap:
	:type aMap: MDF_TypeASDriverMap &
	:rtype: None
") MDF_DataMapIteratorOfTypeASDriverMap;
		 MDF_DataMapIteratorOfTypeASDriverMap (const MDF_TypeASDriverMap & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: MDF_TypeASDriverMap &
	:rtype: None
") Initialize;
		void Initialize (const MDF_TypeASDriverMap & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
") Key;
		Handle_Standard_Type Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_MDF_ASDriver
") Value;
		Handle_MDF_ASDriver Value ();
};


%extend MDF_DataMapIteratorOfTypeASDriverMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_DataMapIteratorOfTypeDriverListMapOfARDriverTable;
class MDF_DataMapIteratorOfTypeDriverListMapOfARDriverTable : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") MDF_DataMapIteratorOfTypeDriverListMapOfARDriverTable;
		%feature("autodoc", "	:rtype: None
") MDF_DataMapIteratorOfTypeDriverListMapOfARDriverTable;
		 MDF_DataMapIteratorOfTypeDriverListMapOfARDriverTable ();
		%feature("compactdefaultargs") MDF_DataMapIteratorOfTypeDriverListMapOfARDriverTable;
		%feature("autodoc", "	:param aMap:
	:type aMap: MDF_TypeDriverListMapOfARDriverTable &
	:rtype: None
") MDF_DataMapIteratorOfTypeDriverListMapOfARDriverTable;
		 MDF_DataMapIteratorOfTypeDriverListMapOfARDriverTable (const MDF_TypeDriverListMapOfARDriverTable & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: MDF_TypeDriverListMapOfARDriverTable &
	:rtype: None
") Initialize;
		void Initialize (const MDF_TypeDriverListMapOfARDriverTable & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
") Key;
		Handle_Standard_Type Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: MDF_DriverListOfARDriverTable
") Value;
		const MDF_DriverListOfARDriverTable & Value ();
};


%extend MDF_DataMapIteratorOfTypeDriverListMapOfARDriverTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_DataMapIteratorOfTypeDriverListMapOfASDriverTable;
class MDF_DataMapIteratorOfTypeDriverListMapOfASDriverTable : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") MDF_DataMapIteratorOfTypeDriverListMapOfASDriverTable;
		%feature("autodoc", "	:rtype: None
") MDF_DataMapIteratorOfTypeDriverListMapOfASDriverTable;
		 MDF_DataMapIteratorOfTypeDriverListMapOfASDriverTable ();
		%feature("compactdefaultargs") MDF_DataMapIteratorOfTypeDriverListMapOfASDriverTable;
		%feature("autodoc", "	:param aMap:
	:type aMap: MDF_TypeDriverListMapOfASDriverTable &
	:rtype: None
") MDF_DataMapIteratorOfTypeDriverListMapOfASDriverTable;
		 MDF_DataMapIteratorOfTypeDriverListMapOfASDriverTable (const MDF_TypeDriverListMapOfASDriverTable & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: MDF_TypeDriverListMapOfASDriverTable &
	:rtype: None
") Initialize;
		void Initialize (const MDF_TypeDriverListMapOfASDriverTable & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
") Key;
		Handle_Standard_Type Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: MDF_DriverListOfASDriverTable
") Value;
		const MDF_DriverListOfASDriverTable & Value ();
};


%extend MDF_DataMapIteratorOfTypeDriverListMapOfASDriverTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_DataMapNodeOfTypeARDriverMap;
class MDF_DataMapNodeOfTypeARDriverMap : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") MDF_DataMapNodeOfTypeARDriverMap;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:param I:
	:type I: Handle_MDF_ARDriver &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") MDF_DataMapNodeOfTypeARDriverMap;
		 MDF_DataMapNodeOfTypeARDriverMap (const Handle_Standard_Type & K,const Handle_MDF_ARDriver & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
") Key;
		Handle_Standard_Type Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_MDF_ARDriver
") Value;
		Handle_MDF_ARDriver Value ();
};


%extend MDF_DataMapNodeOfTypeARDriverMap {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDF_DataMapNodeOfTypeARDriverMap(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDF_DataMapNodeOfTypeARDriverMap::Handle_MDF_DataMapNodeOfTypeARDriverMap %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDF_DataMapNodeOfTypeARDriverMap;
class Handle_MDF_DataMapNodeOfTypeARDriverMap : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_MDF_DataMapNodeOfTypeARDriverMap();
        Handle_MDF_DataMapNodeOfTypeARDriverMap(const Handle_MDF_DataMapNodeOfTypeARDriverMap &aHandle);
        Handle_MDF_DataMapNodeOfTypeARDriverMap(const MDF_DataMapNodeOfTypeARDriverMap *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDF_DataMapNodeOfTypeARDriverMap DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDF_DataMapNodeOfTypeARDriverMap {
    MDF_DataMapNodeOfTypeARDriverMap* _get_reference() {
    return (MDF_DataMapNodeOfTypeARDriverMap*)$self->Access();
    }
};

%extend Handle_MDF_DataMapNodeOfTypeARDriverMap {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDF_DataMapNodeOfTypeARDriverMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_DataMapNodeOfTypeASDriverMap;
class MDF_DataMapNodeOfTypeASDriverMap : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") MDF_DataMapNodeOfTypeASDriverMap;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:param I:
	:type I: Handle_MDF_ASDriver &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") MDF_DataMapNodeOfTypeASDriverMap;
		 MDF_DataMapNodeOfTypeASDriverMap (const Handle_Standard_Type & K,const Handle_MDF_ASDriver & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
") Key;
		Handle_Standard_Type Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_MDF_ASDriver
") Value;
		Handle_MDF_ASDriver Value ();
};


%extend MDF_DataMapNodeOfTypeASDriverMap {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDF_DataMapNodeOfTypeASDriverMap(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDF_DataMapNodeOfTypeASDriverMap::Handle_MDF_DataMapNodeOfTypeASDriverMap %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDF_DataMapNodeOfTypeASDriverMap;
class Handle_MDF_DataMapNodeOfTypeASDriverMap : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_MDF_DataMapNodeOfTypeASDriverMap();
        Handle_MDF_DataMapNodeOfTypeASDriverMap(const Handle_MDF_DataMapNodeOfTypeASDriverMap &aHandle);
        Handle_MDF_DataMapNodeOfTypeASDriverMap(const MDF_DataMapNodeOfTypeASDriverMap *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDF_DataMapNodeOfTypeASDriverMap DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDF_DataMapNodeOfTypeASDriverMap {
    MDF_DataMapNodeOfTypeASDriverMap* _get_reference() {
    return (MDF_DataMapNodeOfTypeASDriverMap*)$self->Access();
    }
};

%extend Handle_MDF_DataMapNodeOfTypeASDriverMap {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDF_DataMapNodeOfTypeASDriverMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_DataMapNodeOfTypeDriverListMapOfARDriverTable;
class MDF_DataMapNodeOfTypeDriverListMapOfARDriverTable : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") MDF_DataMapNodeOfTypeDriverListMapOfARDriverTable;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:param I:
	:type I: MDF_DriverListOfARDriverTable &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") MDF_DataMapNodeOfTypeDriverListMapOfARDriverTable;
		 MDF_DataMapNodeOfTypeDriverListMapOfARDriverTable (const Handle_Standard_Type & K,const MDF_DriverListOfARDriverTable & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
") Key;
		Handle_Standard_Type Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: MDF_DriverListOfARDriverTable
") Value;
		MDF_DriverListOfARDriverTable & Value ();
};


%extend MDF_DataMapNodeOfTypeDriverListMapOfARDriverTable {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDF_DataMapNodeOfTypeDriverListMapOfARDriverTable(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDF_DataMapNodeOfTypeDriverListMapOfARDriverTable::Handle_MDF_DataMapNodeOfTypeDriverListMapOfARDriverTable %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDF_DataMapNodeOfTypeDriverListMapOfARDriverTable;
class Handle_MDF_DataMapNodeOfTypeDriverListMapOfARDriverTable : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_MDF_DataMapNodeOfTypeDriverListMapOfARDriverTable();
        Handle_MDF_DataMapNodeOfTypeDriverListMapOfARDriverTable(const Handle_MDF_DataMapNodeOfTypeDriverListMapOfARDriverTable &aHandle);
        Handle_MDF_DataMapNodeOfTypeDriverListMapOfARDriverTable(const MDF_DataMapNodeOfTypeDriverListMapOfARDriverTable *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDF_DataMapNodeOfTypeDriverListMapOfARDriverTable DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDF_DataMapNodeOfTypeDriverListMapOfARDriverTable {
    MDF_DataMapNodeOfTypeDriverListMapOfARDriverTable* _get_reference() {
    return (MDF_DataMapNodeOfTypeDriverListMapOfARDriverTable*)$self->Access();
    }
};

%extend Handle_MDF_DataMapNodeOfTypeDriverListMapOfARDriverTable {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDF_DataMapNodeOfTypeDriverListMapOfARDriverTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_DataMapNodeOfTypeDriverListMapOfASDriverTable;
class MDF_DataMapNodeOfTypeDriverListMapOfASDriverTable : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") MDF_DataMapNodeOfTypeDriverListMapOfASDriverTable;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:param I:
	:type I: MDF_DriverListOfASDriverTable &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") MDF_DataMapNodeOfTypeDriverListMapOfASDriverTable;
		 MDF_DataMapNodeOfTypeDriverListMapOfASDriverTable (const Handle_Standard_Type & K,const MDF_DriverListOfASDriverTable & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
") Key;
		Handle_Standard_Type Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: MDF_DriverListOfASDriverTable
") Value;
		MDF_DriverListOfASDriverTable & Value ();
};


%extend MDF_DataMapNodeOfTypeDriverListMapOfASDriverTable {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDF_DataMapNodeOfTypeDriverListMapOfASDriverTable(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDF_DataMapNodeOfTypeDriverListMapOfASDriverTable::Handle_MDF_DataMapNodeOfTypeDriverListMapOfASDriverTable %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDF_DataMapNodeOfTypeDriverListMapOfASDriverTable;
class Handle_MDF_DataMapNodeOfTypeDriverListMapOfASDriverTable : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_MDF_DataMapNodeOfTypeDriverListMapOfASDriverTable();
        Handle_MDF_DataMapNodeOfTypeDriverListMapOfASDriverTable(const Handle_MDF_DataMapNodeOfTypeDriverListMapOfASDriverTable &aHandle);
        Handle_MDF_DataMapNodeOfTypeDriverListMapOfASDriverTable(const MDF_DataMapNodeOfTypeDriverListMapOfASDriverTable *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDF_DataMapNodeOfTypeDriverListMapOfASDriverTable DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDF_DataMapNodeOfTypeDriverListMapOfASDriverTable {
    MDF_DataMapNodeOfTypeDriverListMapOfASDriverTable* _get_reference() {
    return (MDF_DataMapNodeOfTypeDriverListMapOfASDriverTable*)$self->Access();
    }
};

%extend Handle_MDF_DataMapNodeOfTypeDriverListMapOfASDriverTable {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDF_DataMapNodeOfTypeDriverListMapOfASDriverTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_DriverListOfARDriverTable;
class MDF_DriverListOfARDriverTable {
	public:
		%feature("compactdefaultargs") MDF_DriverListOfARDriverTable;
		%feature("autodoc", "	:rtype: None
") MDF_DriverListOfARDriverTable;
		 MDF_DriverListOfARDriverTable ();
		%feature("compactdefaultargs") MDF_DriverListOfARDriverTable;
		%feature("autodoc", "	:param Other:
	:type Other: MDF_DriverListOfARDriverTable &
	:rtype: None
") MDF_DriverListOfARDriverTable;
		 MDF_DriverListOfARDriverTable (const MDF_DriverListOfARDriverTable & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: MDF_DriverListOfARDriverTable &
	:rtype: None
") Assign;
		void Assign (const MDF_DriverListOfARDriverTable & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: MDF_DriverListOfARDriverTable &
	:rtype: None
") operator =;
		void operator = (const MDF_DriverListOfARDriverTable & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_MDF_ARDriver &
	:rtype: None
") Prepend;
		void Prepend (const Handle_MDF_ARDriver & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_MDF_ARDriver &
	:param theIt:
	:type theIt: MDF_ListIteratorOfDriverListOfARDriverTable &
	:rtype: None
") Prepend;
		void Prepend (const Handle_MDF_ARDriver & I,MDF_ListIteratorOfDriverListOfARDriverTable & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: MDF_DriverListOfARDriverTable &
	:rtype: None
") Prepend;
		void Prepend (MDF_DriverListOfARDriverTable & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_MDF_ARDriver &
	:rtype: None
") Append;
		void Append (const Handle_MDF_ARDriver & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_MDF_ARDriver &
	:param theIt:
	:type theIt: MDF_ListIteratorOfDriverListOfARDriverTable &
	:rtype: None
") Append;
		void Append (const Handle_MDF_ARDriver & I,MDF_ListIteratorOfDriverListOfARDriverTable & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: MDF_DriverListOfARDriverTable &
	:rtype: None
") Append;
		void Append (MDF_DriverListOfARDriverTable & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_MDF_ARDriver
") First;
		Handle_MDF_ARDriver First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_MDF_ARDriver
") Last;
		Handle_MDF_ARDriver Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: MDF_ListIteratorOfDriverListOfARDriverTable &
	:rtype: None
") Remove;
		void Remove (MDF_ListIteratorOfDriverListOfARDriverTable & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: Handle_MDF_ARDriver &
	:param It:
	:type It: MDF_ListIteratorOfDriverListOfARDriverTable &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Handle_MDF_ARDriver & I,MDF_ListIteratorOfDriverListOfARDriverTable & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: MDF_DriverListOfARDriverTable &
	:param It:
	:type It: MDF_ListIteratorOfDriverListOfARDriverTable &
	:rtype: None
") InsertBefore;
		void InsertBefore (MDF_DriverListOfARDriverTable & Other,MDF_ListIteratorOfDriverListOfARDriverTable & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: Handle_MDF_ARDriver &
	:param It:
	:type It: MDF_ListIteratorOfDriverListOfARDriverTable &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Handle_MDF_ARDriver & I,MDF_ListIteratorOfDriverListOfARDriverTable & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: MDF_DriverListOfARDriverTable &
	:param It:
	:type It: MDF_ListIteratorOfDriverListOfARDriverTable &
	:rtype: None
") InsertAfter;
		void InsertAfter (MDF_DriverListOfARDriverTable & Other,MDF_ListIteratorOfDriverListOfARDriverTable & It);
};


%extend MDF_DriverListOfARDriverTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_DriverListOfASDriverTable;
class MDF_DriverListOfASDriverTable {
	public:
		%feature("compactdefaultargs") MDF_DriverListOfASDriverTable;
		%feature("autodoc", "	:rtype: None
") MDF_DriverListOfASDriverTable;
		 MDF_DriverListOfASDriverTable ();
		%feature("compactdefaultargs") MDF_DriverListOfASDriverTable;
		%feature("autodoc", "	:param Other:
	:type Other: MDF_DriverListOfASDriverTable &
	:rtype: None
") MDF_DriverListOfASDriverTable;
		 MDF_DriverListOfASDriverTable (const MDF_DriverListOfASDriverTable & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: MDF_DriverListOfASDriverTable &
	:rtype: None
") Assign;
		void Assign (const MDF_DriverListOfASDriverTable & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: MDF_DriverListOfASDriverTable &
	:rtype: None
") operator =;
		void operator = (const MDF_DriverListOfASDriverTable & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_MDF_ASDriver &
	:rtype: None
") Prepend;
		void Prepend (const Handle_MDF_ASDriver & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_MDF_ASDriver &
	:param theIt:
	:type theIt: MDF_ListIteratorOfDriverListOfASDriverTable &
	:rtype: None
") Prepend;
		void Prepend (const Handle_MDF_ASDriver & I,MDF_ListIteratorOfDriverListOfASDriverTable & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: MDF_DriverListOfASDriverTable &
	:rtype: None
") Prepend;
		void Prepend (MDF_DriverListOfASDriverTable & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_MDF_ASDriver &
	:rtype: None
") Append;
		void Append (const Handle_MDF_ASDriver & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_MDF_ASDriver &
	:param theIt:
	:type theIt: MDF_ListIteratorOfDriverListOfASDriverTable &
	:rtype: None
") Append;
		void Append (const Handle_MDF_ASDriver & I,MDF_ListIteratorOfDriverListOfASDriverTable & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: MDF_DriverListOfASDriverTable &
	:rtype: None
") Append;
		void Append (MDF_DriverListOfASDriverTable & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_MDF_ASDriver
") First;
		Handle_MDF_ASDriver First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_MDF_ASDriver
") Last;
		Handle_MDF_ASDriver Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: MDF_ListIteratorOfDriverListOfASDriverTable &
	:rtype: None
") Remove;
		void Remove (MDF_ListIteratorOfDriverListOfASDriverTable & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: Handle_MDF_ASDriver &
	:param It:
	:type It: MDF_ListIteratorOfDriverListOfASDriverTable &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Handle_MDF_ASDriver & I,MDF_ListIteratorOfDriverListOfASDriverTable & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: MDF_DriverListOfASDriverTable &
	:param It:
	:type It: MDF_ListIteratorOfDriverListOfASDriverTable &
	:rtype: None
") InsertBefore;
		void InsertBefore (MDF_DriverListOfASDriverTable & Other,MDF_ListIteratorOfDriverListOfASDriverTable & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: Handle_MDF_ASDriver &
	:param It:
	:type It: MDF_ListIteratorOfDriverListOfASDriverTable &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Handle_MDF_ASDriver & I,MDF_ListIteratorOfDriverListOfASDriverTable & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: MDF_DriverListOfASDriverTable &
	:param It:
	:type It: MDF_ListIteratorOfDriverListOfASDriverTable &
	:rtype: None
") InsertAfter;
		void InsertAfter (MDF_DriverListOfASDriverTable & Other,MDF_ListIteratorOfDriverListOfASDriverTable & It);
};


%extend MDF_DriverListOfASDriverTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_ListIteratorOfDriverListOfARDriverTable;
class MDF_ListIteratorOfDriverListOfARDriverTable {
	public:
		%feature("compactdefaultargs") MDF_ListIteratorOfDriverListOfARDriverTable;
		%feature("autodoc", "	:rtype: None
") MDF_ListIteratorOfDriverListOfARDriverTable;
		 MDF_ListIteratorOfDriverListOfARDriverTable ();
		%feature("compactdefaultargs") MDF_ListIteratorOfDriverListOfARDriverTable;
		%feature("autodoc", "	:param L:
	:type L: MDF_DriverListOfARDriverTable &
	:rtype: None
") MDF_ListIteratorOfDriverListOfARDriverTable;
		 MDF_ListIteratorOfDriverListOfARDriverTable (const MDF_DriverListOfARDriverTable & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: MDF_DriverListOfARDriverTable &
	:rtype: None
") Initialize;
		void Initialize (const MDF_DriverListOfARDriverTable & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_MDF_ARDriver
") Value;
		Handle_MDF_ARDriver Value ();
};


%extend MDF_ListIteratorOfDriverListOfARDriverTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_ListIteratorOfDriverListOfASDriverTable;
class MDF_ListIteratorOfDriverListOfASDriverTable {
	public:
		%feature("compactdefaultargs") MDF_ListIteratorOfDriverListOfASDriverTable;
		%feature("autodoc", "	:rtype: None
") MDF_ListIteratorOfDriverListOfASDriverTable;
		 MDF_ListIteratorOfDriverListOfASDriverTable ();
		%feature("compactdefaultargs") MDF_ListIteratorOfDriverListOfASDriverTable;
		%feature("autodoc", "	:param L:
	:type L: MDF_DriverListOfASDriverTable &
	:rtype: None
") MDF_ListIteratorOfDriverListOfASDriverTable;
		 MDF_ListIteratorOfDriverListOfASDriverTable (const MDF_DriverListOfASDriverTable & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: MDF_DriverListOfASDriverTable &
	:rtype: None
") Initialize;
		void Initialize (const MDF_DriverListOfASDriverTable & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_MDF_ASDriver
") Value;
		Handle_MDF_ASDriver Value ();
};


%extend MDF_ListIteratorOfDriverListOfASDriverTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_ListNodeOfDriverListOfARDriverTable;
class MDF_ListNodeOfDriverListOfARDriverTable : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") MDF_ListNodeOfDriverListOfARDriverTable;
		%feature("autodoc", "	:param I:
	:type I: Handle_MDF_ARDriver &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") MDF_ListNodeOfDriverListOfARDriverTable;
		 MDF_ListNodeOfDriverListOfARDriverTable (const Handle_MDF_ARDriver & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_MDF_ARDriver
") Value;
		Handle_MDF_ARDriver Value ();
};


%extend MDF_ListNodeOfDriverListOfARDriverTable {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDF_ListNodeOfDriverListOfARDriverTable(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDF_ListNodeOfDriverListOfARDriverTable::Handle_MDF_ListNodeOfDriverListOfARDriverTable %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDF_ListNodeOfDriverListOfARDriverTable;
class Handle_MDF_ListNodeOfDriverListOfARDriverTable : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_MDF_ListNodeOfDriverListOfARDriverTable();
        Handle_MDF_ListNodeOfDriverListOfARDriverTable(const Handle_MDF_ListNodeOfDriverListOfARDriverTable &aHandle);
        Handle_MDF_ListNodeOfDriverListOfARDriverTable(const MDF_ListNodeOfDriverListOfARDriverTable *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDF_ListNodeOfDriverListOfARDriverTable DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDF_ListNodeOfDriverListOfARDriverTable {
    MDF_ListNodeOfDriverListOfARDriverTable* _get_reference() {
    return (MDF_ListNodeOfDriverListOfARDriverTable*)$self->Access();
    }
};

%extend Handle_MDF_ListNodeOfDriverListOfARDriverTable {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDF_ListNodeOfDriverListOfARDriverTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_ListNodeOfDriverListOfASDriverTable;
class MDF_ListNodeOfDriverListOfASDriverTable : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") MDF_ListNodeOfDriverListOfASDriverTable;
		%feature("autodoc", "	:param I:
	:type I: Handle_MDF_ASDriver &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") MDF_ListNodeOfDriverListOfASDriverTable;
		 MDF_ListNodeOfDriverListOfASDriverTable (const Handle_MDF_ASDriver & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_MDF_ASDriver
") Value;
		Handle_MDF_ASDriver Value ();
};


%extend MDF_ListNodeOfDriverListOfASDriverTable {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDF_ListNodeOfDriverListOfASDriverTable(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDF_ListNodeOfDriverListOfASDriverTable::Handle_MDF_ListNodeOfDriverListOfASDriverTable %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDF_ListNodeOfDriverListOfASDriverTable;
class Handle_MDF_ListNodeOfDriverListOfASDriverTable : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_MDF_ListNodeOfDriverListOfASDriverTable();
        Handle_MDF_ListNodeOfDriverListOfASDriverTable(const Handle_MDF_ListNodeOfDriverListOfASDriverTable &aHandle);
        Handle_MDF_ListNodeOfDriverListOfASDriverTable(const MDF_ListNodeOfDriverListOfASDriverTable *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDF_ListNodeOfDriverListOfASDriverTable DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDF_ListNodeOfDriverListOfASDriverTable {
    MDF_ListNodeOfDriverListOfASDriverTable* _get_reference() {
    return (MDF_ListNodeOfDriverListOfASDriverTable*)$self->Access();
    }
};

%extend Handle_MDF_ListNodeOfDriverListOfASDriverTable {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDF_ListNodeOfDriverListOfASDriverTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_RRelocationTable;
class MDF_RRelocationTable : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") MDF_RRelocationTable;
		%feature("autodoc", "	:param theSelfRelocation: default value is Standard_False
	:type theSelfRelocation: bool
	:rtype: None
") MDF_RRelocationTable;
		 MDF_RRelocationTable (const Standard_Boolean theSelfRelocation = Standard_False);
		%feature("compactdefaultargs") SetSelfRelocation;
		%feature("autodoc", "	:param theStatus: default value is Standard_True
	:type theStatus: bool
	:rtype: None
") SetSelfRelocation;
		void SetSelfRelocation (const Standard_Boolean theStatus = Standard_True);
		%feature("compactdefaultargs") IsSelfRelocation;
		%feature("autodoc", "	:rtype: bool
") IsSelfRelocation;
		Standard_Boolean IsSelfRelocation ();
		%feature("compactdefaultargs") SetRelocation;
		%feature("autodoc", "	:param aSourceAttribute:
	:type aSourceAttribute: Handle_PDF_Attribute &
	:param aTargetAttribute:
	:type aTargetAttribute: Handle_TDF_Attribute &
	:rtype: None
") SetRelocation;
		void SetRelocation (const Handle_PDF_Attribute & aSourceAttribute,const Handle_TDF_Attribute & aTargetAttribute);
		%feature("compactdefaultargs") HasRelocation;
		%feature("autodoc", "	:param aSourceAttribute:
	:type aSourceAttribute: Handle_PDF_Attribute &
	:param aTargetAttribute:
	:type aTargetAttribute: Handle_TDF_Attribute &
	:rtype: bool
") HasRelocation;
		Standard_Boolean HasRelocation (const Handle_PDF_Attribute & aSourceAttribute,Handle_TDF_Attribute & aTargetAttribute);
		%feature("compactdefaultargs") SetOtherRelocation;
		%feature("autodoc", "	:param aSource:
	:type aSource: Handle_Standard_Persistent &
	:param aTarget:
	:type aTarget: Handle_Standard_Transient &
	:rtype: None
") SetOtherRelocation;
		void SetOtherRelocation (const Handle_Standard_Persistent & aSource,const Handle_Standard_Transient & aTarget);
		%feature("compactdefaultargs") HasOtherRelocation;
		%feature("autodoc", "	:param aSource:
	:type aSource: Handle_Standard_Persistent &
	:param aTarget:
	:type aTarget: Handle_Standard_Transient &
	:rtype: bool
") HasOtherRelocation;
		Standard_Boolean HasOtherRelocation (const Handle_Standard_Persistent & aSource,Handle_Standard_Transient & aTarget);
		%feature("compactdefaultargs") AttributeTable;
		%feature("autodoc", "	:rtype: PTColStd_PersistentTransientMap
") AttributeTable;
		PTColStd_PersistentTransientMap & AttributeTable ();
		%feature("compactdefaultargs") OtherTable;
		%feature("autodoc", "	:rtype: PTColStd_PersistentTransientMap
") OtherTable;
		PTColStd_PersistentTransientMap & OtherTable ();
};


%extend MDF_RRelocationTable {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDF_RRelocationTable(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDF_RRelocationTable::Handle_MDF_RRelocationTable %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDF_RRelocationTable;
class Handle_MDF_RRelocationTable : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_MDF_RRelocationTable();
        Handle_MDF_RRelocationTable(const Handle_MDF_RRelocationTable &aHandle);
        Handle_MDF_RRelocationTable(const MDF_RRelocationTable *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDF_RRelocationTable DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDF_RRelocationTable {
    MDF_RRelocationTable* _get_reference() {
    return (MDF_RRelocationTable*)$self->Access();
    }
};

%extend Handle_MDF_RRelocationTable {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDF_RRelocationTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_SRelocationTable;
class MDF_SRelocationTable : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") MDF_SRelocationTable;
		%feature("autodoc", "	:param theSelfRelocation: default value is Standard_False
	:type theSelfRelocation: bool
	:rtype: None
") MDF_SRelocationTable;
		 MDF_SRelocationTable (const Standard_Boolean theSelfRelocation = Standard_False);
		%feature("compactdefaultargs") SetSelfRelocation;
		%feature("autodoc", "	:param theStatus: default value is Standard_True
	:type theStatus: bool
	:rtype: None
") SetSelfRelocation;
		void SetSelfRelocation (const Standard_Boolean theStatus = Standard_True);
		%feature("compactdefaultargs") IsSelfRelocation;
		%feature("autodoc", "	:rtype: bool
") IsSelfRelocation;
		Standard_Boolean IsSelfRelocation ();
		%feature("compactdefaultargs") SetRelocation;
		%feature("autodoc", "	:param aSourceAttribute:
	:type aSourceAttribute: Handle_TDF_Attribute &
	:param aTargetAttribute:
	:type aTargetAttribute: Handle_PDF_Attribute &
	:rtype: None
") SetRelocation;
		void SetRelocation (const Handle_TDF_Attribute & aSourceAttribute,const Handle_PDF_Attribute & aTargetAttribute);
		%feature("compactdefaultargs") HasRelocation;
		%feature("autodoc", "	:param aSourceAttribute:
	:type aSourceAttribute: Handle_TDF_Attribute &
	:param aTargetAttribute:
	:type aTargetAttribute: Handle_PDF_Attribute &
	:rtype: bool
") HasRelocation;
		Standard_Boolean HasRelocation (const Handle_TDF_Attribute & aSourceAttribute,Handle_PDF_Attribute & aTargetAttribute);
		%feature("compactdefaultargs") SetOtherRelocation;
		%feature("autodoc", "	:param aSource:
	:type aSource: Handle_Standard_Transient &
	:param aTarget:
	:type aTarget: Handle_Standard_Persistent &
	:rtype: None
") SetOtherRelocation;
		void SetOtherRelocation (const Handle_Standard_Transient & aSource,const Handle_Standard_Persistent & aTarget);
		%feature("compactdefaultargs") HasOtherRelocation;
		%feature("autodoc", "	:param aSource:
	:type aSource: Handle_Standard_Transient &
	:param aTarget:
	:type aTarget: Handle_Standard_Persistent &
	:rtype: bool
") HasOtherRelocation;
		Standard_Boolean HasOtherRelocation (const Handle_Standard_Transient & aSource,Handle_Standard_Persistent & aTarget);
		%feature("compactdefaultargs") AttributeTable;
		%feature("autodoc", "	:rtype: PTColStd_TransientPersistentMap
") AttributeTable;
		PTColStd_TransientPersistentMap & AttributeTable ();
		%feature("compactdefaultargs") OtherTable;
		%feature("autodoc", "	:rtype: PTColStd_TransientPersistentMap
") OtherTable;
		PTColStd_TransientPersistentMap & OtherTable ();
};


%extend MDF_SRelocationTable {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDF_SRelocationTable(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDF_SRelocationTable::Handle_MDF_SRelocationTable %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDF_SRelocationTable;
class Handle_MDF_SRelocationTable : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_MDF_SRelocationTable();
        Handle_MDF_SRelocationTable(const Handle_MDF_SRelocationTable &aHandle);
        Handle_MDF_SRelocationTable(const MDF_SRelocationTable *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDF_SRelocationTable DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDF_SRelocationTable {
    MDF_SRelocationTable* _get_reference() {
    return (MDF_SRelocationTable*)$self->Access();
    }
};

%extend Handle_MDF_SRelocationTable {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDF_SRelocationTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_SequenceNodeOfARDriverSequence;
class MDF_SequenceNodeOfARDriverSequence : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") MDF_SequenceNodeOfARDriverSequence;
		%feature("autodoc", "	:param I:
	:type I: Handle_MDF_ARDriver &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") MDF_SequenceNodeOfARDriverSequence;
		 MDF_SequenceNodeOfARDriverSequence (const Handle_MDF_ARDriver & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_MDF_ARDriver
") Value;
		Handle_MDF_ARDriver Value ();
};


%extend MDF_SequenceNodeOfARDriverSequence {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDF_SequenceNodeOfARDriverSequence(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDF_SequenceNodeOfARDriverSequence::Handle_MDF_SequenceNodeOfARDriverSequence %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDF_SequenceNodeOfARDriverSequence;
class Handle_MDF_SequenceNodeOfARDriverSequence : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_MDF_SequenceNodeOfARDriverSequence();
        Handle_MDF_SequenceNodeOfARDriverSequence(const Handle_MDF_SequenceNodeOfARDriverSequence &aHandle);
        Handle_MDF_SequenceNodeOfARDriverSequence(const MDF_SequenceNodeOfARDriverSequence *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDF_SequenceNodeOfARDriverSequence DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDF_SequenceNodeOfARDriverSequence {
    MDF_SequenceNodeOfARDriverSequence* _get_reference() {
    return (MDF_SequenceNodeOfARDriverSequence*)$self->Access();
    }
};

%extend Handle_MDF_SequenceNodeOfARDriverSequence {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDF_SequenceNodeOfARDriverSequence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_SequenceNodeOfASDriverSequence;
class MDF_SequenceNodeOfASDriverSequence : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") MDF_SequenceNodeOfASDriverSequence;
		%feature("autodoc", "	:param I:
	:type I: Handle_MDF_ASDriver &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") MDF_SequenceNodeOfASDriverSequence;
		 MDF_SequenceNodeOfASDriverSequence (const Handle_MDF_ASDriver & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_MDF_ASDriver
") Value;
		Handle_MDF_ASDriver Value ();
};


%extend MDF_SequenceNodeOfASDriverSequence {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDF_SequenceNodeOfASDriverSequence(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDF_SequenceNodeOfASDriverSequence::Handle_MDF_SequenceNodeOfASDriverSequence %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDF_SequenceNodeOfASDriverSequence;
class Handle_MDF_SequenceNodeOfASDriverSequence : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_MDF_SequenceNodeOfASDriverSequence();
        Handle_MDF_SequenceNodeOfASDriverSequence(const Handle_MDF_SequenceNodeOfASDriverSequence &aHandle);
        Handle_MDF_SequenceNodeOfASDriverSequence(const MDF_SequenceNodeOfASDriverSequence *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDF_SequenceNodeOfASDriverSequence DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDF_SequenceNodeOfASDriverSequence {
    MDF_SequenceNodeOfASDriverSequence* _get_reference() {
    return (MDF_SequenceNodeOfASDriverSequence*)$self->Access();
    }
};

%extend Handle_MDF_SequenceNodeOfASDriverSequence {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDF_SequenceNodeOfASDriverSequence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class MDF_Tool {
	public:
		%feature("compactdefaultargs") WriteLabels;
		%feature("autodoc", "	* Writes the labels with empty attributes.

	:param aSource:
	:type aSource: Handle_TDF_Data &
	:param aTarget:
	:type aTarget: Handle_PDF_Data &
	:param aDriverMap:
	:type aDriverMap: MDF_TypeASDriverMap &
	:param aReloc:
	:type aReloc: Handle_MDF_SRelocationTable &
	:rtype: void
") WriteLabels;
		static void WriteLabels (const Handle_TDF_Data & aSource,const Handle_PDF_Data & aTarget,const MDF_TypeASDriverMap & aDriverMap,const Handle_MDF_SRelocationTable & aReloc);
		%feature("compactdefaultargs") WriteLabels;
		%feature("autodoc", "	* Used for recursivity.

	:param aSourceLab:
	:type aSourceLab: TDF_Label &
	:param theLabels:
	:type theLabels: Handle_PColStd_HArray1OfInteger &
	:param theAttributes:
	:type theAttributes: Handle_PDF_HAttributeArray1 &
	:param aDriverMap:
	:type aDriverMap: MDF_TypeASDriverMap &
	:param aReloc:
	:type aReloc: Handle_MDF_SRelocationTable &
	:param labAlloc:
	:type labAlloc: int &
	:param attAlloc:
	:type attAlloc: int &
	:rtype: void
") WriteLabels;
		static void WriteLabels (const TDF_Label & aSourceLab,const Handle_PColStd_HArray1OfInteger & theLabels,const Handle_PDF_HAttributeArray1 & theAttributes,const MDF_TypeASDriverMap & aDriverMap,const Handle_MDF_SRelocationTable & aReloc,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") WriteAttributes;
		%feature("autodoc", "	* Writes attributes content.

	:param aDriverMap:
	:type aDriverMap: MDF_TypeASDriverMap &
	:param aReloc:
	:type aReloc: Handle_MDF_SRelocationTable &
	:rtype: void
") WriteAttributes;
		static void WriteAttributes (const MDF_TypeASDriverMap & aDriverMap,const Handle_MDF_SRelocationTable & aReloc);
		%feature("compactdefaultargs") ReadLabels;
		%feature("autodoc", "	* Reads the labels abd adds empty attributes to them.

	:param aSource:
	:type aSource: Handle_PDF_Data &
	:param aTarget:
	:type aTarget: Handle_TDF_Data &
	:param aDriverMap:
	:type aDriverMap: MDF_TypeARDriverMap &
	:param aReloc:
	:type aReloc: Handle_MDF_RRelocationTable &
	:rtype: void
") ReadLabels;
		static void ReadLabels (const Handle_PDF_Data & aSource,const Handle_TDF_Data & aTarget,const MDF_TypeARDriverMap & aDriverMap,const Handle_MDF_RRelocationTable & aReloc);
		%feature("compactdefaultargs") ReadLabels;
		%feature("autodoc", "	* Used for recursivity.

	:param anIns:
	:type anIns: TDF_Label &
	:param theLabels:
	:type theLabels: Handle_PColStd_HArray1OfInteger &
	:param theAttributes:
	:type theAttributes: Handle_PDF_HAttributeArray1 &
	:param aDriverMap:
	:type aDriverMap: MDF_TypeARDriverMap &
	:param aReloc:
	:type aReloc: Handle_MDF_RRelocationTable &
	:param labRead:
	:type labRead: int &
	:param attRead:
	:type attRead: int &
	:rtype: void
") ReadLabels;
		static void ReadLabels (TDF_Label & anIns,const Handle_PColStd_HArray1OfInteger & theLabels,const Handle_PDF_HAttributeArray1 & theAttributes,const MDF_TypeARDriverMap & aDriverMap,const Handle_MDF_RRelocationTable & aReloc,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") ReadAttributes;
		%feature("autodoc", "	* Reads attributes content and paste them.

	:param aDriverMap:
	:type aDriverMap: MDF_TypeARDriverMap &
	:param aReloc:
	:type aReloc: Handle_MDF_RRelocationTable &
	:rtype: void
") ReadAttributes;
		static void ReadAttributes (const MDF_TypeARDriverMap & aDriverMap,const Handle_MDF_RRelocationTable & aReloc);
};


%extend MDF_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_TypeARDriverMap;
class MDF_TypeARDriverMap : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") MDF_TypeARDriverMap;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") MDF_TypeARDriverMap;
		 MDF_TypeARDriverMap (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: MDF_TypeARDriverMap &
	:rtype: MDF_TypeARDriverMap
") Assign;
		MDF_TypeARDriverMap & Assign (const MDF_TypeARDriverMap & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: MDF_TypeARDriverMap &
	:rtype: MDF_TypeARDriverMap
") operator =;
		MDF_TypeARDriverMap & operator = (const MDF_TypeARDriverMap & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:param I:
	:type I: Handle_MDF_ARDriver &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Handle_Standard_Type & K,const Handle_MDF_ARDriver & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Handle_Standard_Type & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Handle_Standard_Type & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: Handle_MDF_ARDriver
") Find;
		Handle_MDF_ARDriver Find (const Handle_Standard_Type & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: Handle_MDF_ARDriver
") ChangeFind;
		Handle_MDF_ARDriver ChangeFind (const Handle_Standard_Type & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Handle_Standard_Type & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Handle_Standard_Type & K);
};


%extend MDF_TypeARDriverMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_TypeASDriverMap;
class MDF_TypeASDriverMap : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") MDF_TypeASDriverMap;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") MDF_TypeASDriverMap;
		 MDF_TypeASDriverMap (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: MDF_TypeASDriverMap &
	:rtype: MDF_TypeASDriverMap
") Assign;
		MDF_TypeASDriverMap & Assign (const MDF_TypeASDriverMap & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: MDF_TypeASDriverMap &
	:rtype: MDF_TypeASDriverMap
") operator =;
		MDF_TypeASDriverMap & operator = (const MDF_TypeASDriverMap & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:param I:
	:type I: Handle_MDF_ASDriver &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Handle_Standard_Type & K,const Handle_MDF_ASDriver & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Handle_Standard_Type & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Handle_Standard_Type & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: Handle_MDF_ASDriver
") Find;
		Handle_MDF_ASDriver Find (const Handle_Standard_Type & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: Handle_MDF_ASDriver
") ChangeFind;
		Handle_MDF_ASDriver ChangeFind (const Handle_Standard_Type & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Handle_Standard_Type & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Handle_Standard_Type & K);
};


%extend MDF_TypeASDriverMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_TypeDriverListMapOfARDriverTable;
class MDF_TypeDriverListMapOfARDriverTable : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") MDF_TypeDriverListMapOfARDriverTable;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") MDF_TypeDriverListMapOfARDriverTable;
		 MDF_TypeDriverListMapOfARDriverTable (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: MDF_TypeDriverListMapOfARDriverTable &
	:rtype: MDF_TypeDriverListMapOfARDriverTable
") Assign;
		MDF_TypeDriverListMapOfARDriverTable & Assign (const MDF_TypeDriverListMapOfARDriverTable & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: MDF_TypeDriverListMapOfARDriverTable &
	:rtype: MDF_TypeDriverListMapOfARDriverTable
") operator =;
		MDF_TypeDriverListMapOfARDriverTable & operator = (const MDF_TypeDriverListMapOfARDriverTable & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:param I:
	:type I: MDF_DriverListOfARDriverTable &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Handle_Standard_Type & K,const MDF_DriverListOfARDriverTable & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Handle_Standard_Type & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Handle_Standard_Type & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: MDF_DriverListOfARDriverTable
") Find;
		const MDF_DriverListOfARDriverTable & Find (const Handle_Standard_Type & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: MDF_DriverListOfARDriverTable
") ChangeFind;
		MDF_DriverListOfARDriverTable & ChangeFind (const Handle_Standard_Type & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Handle_Standard_Type & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Handle_Standard_Type & K);
};


%extend MDF_TypeDriverListMapOfARDriverTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_TypeDriverListMapOfASDriverTable;
class MDF_TypeDriverListMapOfASDriverTable : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") MDF_TypeDriverListMapOfASDriverTable;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") MDF_TypeDriverListMapOfASDriverTable;
		 MDF_TypeDriverListMapOfASDriverTable (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: MDF_TypeDriverListMapOfASDriverTable &
	:rtype: MDF_TypeDriverListMapOfASDriverTable
") Assign;
		MDF_TypeDriverListMapOfASDriverTable & Assign (const MDF_TypeDriverListMapOfASDriverTable & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: MDF_TypeDriverListMapOfASDriverTable &
	:rtype: MDF_TypeDriverListMapOfASDriverTable
") operator =;
		MDF_TypeDriverListMapOfASDriverTable & operator = (const MDF_TypeDriverListMapOfASDriverTable & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:param I:
	:type I: MDF_DriverListOfASDriverTable &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Handle_Standard_Type & K,const MDF_DriverListOfASDriverTable & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Handle_Standard_Type & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Handle_Standard_Type & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: MDF_DriverListOfASDriverTable
") Find;
		const MDF_DriverListOfASDriverTable & Find (const Handle_Standard_Type & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: MDF_DriverListOfASDriverTable
") ChangeFind;
		MDF_DriverListOfASDriverTable & ChangeFind (const Handle_Standard_Type & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Handle_Standard_Type & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Handle_Standard_Type & K);
};


%extend MDF_TypeDriverListMapOfASDriverTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_ReferenceRetrievalDriver;
class MDF_ReferenceRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDF_ReferenceRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDF_ReferenceRetrievalDriver;
		 MDF_ReferenceRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Reference from PDF.

	:rtype: Handle_Standard_Type
") SourceType;
		Handle_Standard_Type SourceType ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_PDF_Attribute &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: Handle_MDF_RRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_PDF_Attribute & Source,const Handle_TDF_Attribute & Target,const Handle_MDF_RRelocationTable & RelocTable);
};


%extend MDF_ReferenceRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDF_ReferenceRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDF_ReferenceRetrievalDriver::Handle_MDF_ReferenceRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDF_ReferenceRetrievalDriver;
class Handle_MDF_ReferenceRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDF_ReferenceRetrievalDriver();
        Handle_MDF_ReferenceRetrievalDriver(const Handle_MDF_ReferenceRetrievalDriver &aHandle);
        Handle_MDF_ReferenceRetrievalDriver(const MDF_ReferenceRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDF_ReferenceRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDF_ReferenceRetrievalDriver {
    MDF_ReferenceRetrievalDriver* _get_reference() {
    return (MDF_ReferenceRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDF_ReferenceRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDF_ReferenceRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_ReferenceStorageDriver;
class MDF_ReferenceStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDF_ReferenceStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDF_ReferenceStorageDriver;
		 MDF_ReferenceStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Integer from TDF.

	:rtype: Handle_Standard_Type
") SourceType;
		Handle_Standard_Type SourceType ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_PDF_Attribute
") NewEmpty;
		Handle_PDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: Handle_PDF_Attribute &
	:param RelocTable:
	:type RelocTable: Handle_MDF_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,const Handle_PDF_Attribute & Target,const Handle_MDF_SRelocationTable & RelocTable);
};


%extend MDF_ReferenceStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDF_ReferenceStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDF_ReferenceStorageDriver::Handle_MDF_ReferenceStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDF_ReferenceStorageDriver;
class Handle_MDF_ReferenceStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDF_ReferenceStorageDriver();
        Handle_MDF_ReferenceStorageDriver(const Handle_MDF_ReferenceStorageDriver &aHandle);
        Handle_MDF_ReferenceStorageDriver(const MDF_ReferenceStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDF_ReferenceStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDF_ReferenceStorageDriver {
    MDF_ReferenceStorageDriver* _get_reference() {
    return (MDF_ReferenceStorageDriver*)$self->Access();
    }
};

%extend Handle_MDF_ReferenceStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDF_ReferenceStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_TagSourceRetrievalDriver;
class MDF_TagSourceRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDF_TagSourceRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDF_TagSourceRetrievalDriver;
		 MDF_TagSourceRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: TagSource from PDF.

	:rtype: Handle_Standard_Type
") SourceType;
		Handle_Standard_Type SourceType ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_PDF_Attribute &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: Handle_MDF_RRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_PDF_Attribute & Source,const Handle_TDF_Attribute & Target,const Handle_MDF_RRelocationTable & RelocTable);
};


%extend MDF_TagSourceRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDF_TagSourceRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDF_TagSourceRetrievalDriver::Handle_MDF_TagSourceRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDF_TagSourceRetrievalDriver;
class Handle_MDF_TagSourceRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDF_TagSourceRetrievalDriver();
        Handle_MDF_TagSourceRetrievalDriver(const Handle_MDF_TagSourceRetrievalDriver &aHandle);
        Handle_MDF_TagSourceRetrievalDriver(const MDF_TagSourceRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDF_TagSourceRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDF_TagSourceRetrievalDriver {
    MDF_TagSourceRetrievalDriver* _get_reference() {
    return (MDF_TagSourceRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDF_TagSourceRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDF_TagSourceRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDF_TagSourceStorageDriver;
class MDF_TagSourceStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDF_TagSourceStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDF_TagSourceStorageDriver;
		 MDF_TagSourceStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Integer from TDF.

	:rtype: Handle_Standard_Type
") SourceType;
		Handle_Standard_Type SourceType ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_PDF_Attribute
") NewEmpty;
		Handle_PDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: Handle_PDF_Attribute &
	:param RelocTable:
	:type RelocTable: Handle_MDF_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,const Handle_PDF_Attribute & Target,const Handle_MDF_SRelocationTable & RelocTable);
};


%extend MDF_TagSourceStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDF_TagSourceStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDF_TagSourceStorageDriver::Handle_MDF_TagSourceStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDF_TagSourceStorageDriver;
class Handle_MDF_TagSourceStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDF_TagSourceStorageDriver();
        Handle_MDF_TagSourceStorageDriver(const Handle_MDF_TagSourceStorageDriver &aHandle);
        Handle_MDF_TagSourceStorageDriver(const MDF_TagSourceStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDF_TagSourceStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDF_TagSourceStorageDriver {
    MDF_TagSourceStorageDriver* _get_reference() {
    return (MDF_TagSourceStorageDriver*)$self->Access();
    }
};

%extend Handle_MDF_TagSourceStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDF_TagSourceStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
