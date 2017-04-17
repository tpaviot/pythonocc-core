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
%module (package="OCC") BinMDF

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


%include BinMDF_headers.i


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
typedef TColStd_DataMapOfAsciiStringInteger BinMDF_StringIdMap;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(binmdf) BinMDF;
class BinMDF {
	public:
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "	* Adds the attribute storage drivers to <aDriverTable>.

	:param aDriverTable:
	:type aDriverTable: Handle_BinMDF_ADriverTable &
	:param aMsgDrv:
	:type aMsgDrv: Handle_CDM_MessageDriver &
	:rtype: void
") AddDrivers;
		static void AddDrivers (const Handle_BinMDF_ADriverTable & aDriverTable,const Handle_CDM_MessageDriver & aMsgDrv);
};


%extend BinMDF {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDF_ADriver;
class BinMDF_ADriver : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	* Creates a new attribute from TDF.

	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type of source object, inheriting from Attribute from TDF.

	:rtype: Handle_Standard_Type
") SourceType;
		Handle_Standard_Type SourceType ();
		%feature("compactdefaultargs") TypeName;
		%feature("autodoc", "	* Returns the type name of the attribute object

	:rtype: TCollection_AsciiString
") TypeName;
		const TCollection_AsciiString & TypeName ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* Translate the contents of <aSource> and put it into <aTarget>, using the relocation table <aRelocTable> to keep the sharings.

	:param aSource:
	:type aSource: BinObjMgt_Persistent &
	:param aTarget:
	:type aTarget: Handle_TDF_Attribute &
	:param aRelocTable:
	:type aRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & aSource,const Handle_TDF_Attribute & aTarget,BinObjMgt_RRelocationTable & aRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* Translate the contents of <aSource> and put it into <aTarget>, using the relocation table <aRelocTable> to keep the sharings.

	:param aSource:
	:type aSource: Handle_TDF_Attribute &
	:param aTarget:
	:type aTarget: BinObjMgt_Persistent &
	:param aRelocTable:
	:type aRelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & aSource,BinObjMgt_Persistent & aTarget,BinObjMgt_SRelocationTable & aRelocTable);
		%feature("compactdefaultargs") WriteMessage;
		%feature("autodoc", "	* Send message to Application (usually when error occurres)

	:param theMessage:
	:type theMessage: TCollection_ExtendedString &
	:rtype: None
") WriteMessage;
		void WriteMessage (const TCollection_ExtendedString & theMessage);
};


%extend BinMDF_ADriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDF_ADriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDF_ADriver::Handle_BinMDF_ADriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDF_ADriver;
class Handle_BinMDF_ADriver : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_BinMDF_ADriver();
        Handle_BinMDF_ADriver(const Handle_BinMDF_ADriver &aHandle);
        Handle_BinMDF_ADriver(const BinMDF_ADriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDF_ADriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDF_ADriver {
    BinMDF_ADriver* _get_reference() {
    return (BinMDF_ADriver*)$self->Access();
    }
};

%extend Handle_BinMDF_ADriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDF_ADriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDF_ADriverTable;
class BinMDF_ADriverTable : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") BinMDF_ADriverTable;
		%feature("autodoc", "	* Constructor

	:rtype: None
") BinMDF_ADriverTable;
		 BinMDF_ADriverTable ();
		%feature("compactdefaultargs") AddDriver;
		%feature("autodoc", "	* Adds a translation driver <theDriver>.

	:param theDriver:
	:type theDriver: Handle_BinMDF_ADriver &
	:rtype: None
") AddDriver;
		void AddDriver (const Handle_BinMDF_ADriver & theDriver);
		%feature("compactdefaultargs") AssignIds;
		%feature("autodoc", "	* Assigns the IDs to the drivers of the given Types. It uses indices in the map as IDs. Useful in storage procedure.

	:param theTypes:
	:type theTypes: TColStd_IndexedMapOfTransient &
	:rtype: None
") AssignIds;
		void AssignIds (const TColStd_IndexedMapOfTransient & theTypes);
		%feature("compactdefaultargs") AssignIds;
		%feature("autodoc", "	* Assigns the IDs to the drivers of the given Type Names; It uses indices in the sequence as IDs. Useful in retrieval procedure.

	:param theTypeNames:
	:type theTypeNames: TColStd_SequenceOfAsciiString &
	:rtype: None
") AssignIds;
		void AssignIds (const TColStd_SequenceOfAsciiString & theTypeNames);
		%feature("compactdefaultargs") GetDriver;
		%feature("autodoc", "	* Gets a driver <theDriver> according to <theType>. Returns Type ID if the driver was assigned an ID; 0 otherwise.

	:param theType:
	:type theType: Handle_Standard_Type &
	:param theDriver:
	:type theDriver: Handle_BinMDF_ADriver &
	:rtype: int
") GetDriver;
		Standard_Integer GetDriver (const Handle_Standard_Type & theType,Handle_BinMDF_ADriver & theDriver);
		%feature("compactdefaultargs") GetDriver;
		%feature("autodoc", "	* Returns a driver according to <theTypeId>. Returns null handle if a driver is not found

	:param theTypeId:
	:type theTypeId: int
	:rtype: Handle_BinMDF_ADriver
") GetDriver;
		Handle_BinMDF_ADriver GetDriver (const Standard_Integer theTypeId);
};


%extend BinMDF_ADriverTable {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDF_ADriverTable(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDF_ADriverTable::Handle_BinMDF_ADriverTable %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDF_ADriverTable;
class Handle_BinMDF_ADriverTable : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_BinMDF_ADriverTable();
        Handle_BinMDF_ADriverTable(const Handle_BinMDF_ADriverTable &aHandle);
        Handle_BinMDF_ADriverTable(const BinMDF_ADriverTable *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDF_ADriverTable DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDF_ADriverTable {
    BinMDF_ADriverTable* _get_reference() {
    return (BinMDF_ADriverTable*)$self->Access();
    }
};

%extend Handle_BinMDF_ADriverTable {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDF_ADriverTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDF_DataMapIteratorOfTypeADriverMap;
class BinMDF_DataMapIteratorOfTypeADriverMap : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") BinMDF_DataMapIteratorOfTypeADriverMap;
		%feature("autodoc", "	:rtype: None
") BinMDF_DataMapIteratorOfTypeADriverMap;
		 BinMDF_DataMapIteratorOfTypeADriverMap ();
		%feature("compactdefaultargs") BinMDF_DataMapIteratorOfTypeADriverMap;
		%feature("autodoc", "	:param aMap:
	:type aMap: BinMDF_TypeADriverMap &
	:rtype: None
") BinMDF_DataMapIteratorOfTypeADriverMap;
		 BinMDF_DataMapIteratorOfTypeADriverMap (const BinMDF_TypeADriverMap & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: BinMDF_TypeADriverMap &
	:rtype: None
") Initialize;
		void Initialize (const BinMDF_TypeADriverMap & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
") Key;
		Handle_Standard_Type Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_BinMDF_ADriver
") Value;
		Handle_BinMDF_ADriver Value ();
};


%extend BinMDF_DataMapIteratorOfTypeADriverMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDF_DataMapNodeOfTypeADriverMap;
class BinMDF_DataMapNodeOfTypeADriverMap : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BinMDF_DataMapNodeOfTypeADriverMap;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:param I:
	:type I: Handle_BinMDF_ADriver &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") BinMDF_DataMapNodeOfTypeADriverMap;
		 BinMDF_DataMapNodeOfTypeADriverMap (const Handle_Standard_Type & K,const Handle_BinMDF_ADriver & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
") Key;
		Handle_Standard_Type Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_BinMDF_ADriver
") Value;
		Handle_BinMDF_ADriver Value ();
};


%extend BinMDF_DataMapNodeOfTypeADriverMap {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDF_DataMapNodeOfTypeADriverMap(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDF_DataMapNodeOfTypeADriverMap::Handle_BinMDF_DataMapNodeOfTypeADriverMap %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDF_DataMapNodeOfTypeADriverMap;
class Handle_BinMDF_DataMapNodeOfTypeADriverMap : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BinMDF_DataMapNodeOfTypeADriverMap();
        Handle_BinMDF_DataMapNodeOfTypeADriverMap(const Handle_BinMDF_DataMapNodeOfTypeADriverMap &aHandle);
        Handle_BinMDF_DataMapNodeOfTypeADriverMap(const BinMDF_DataMapNodeOfTypeADriverMap *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDF_DataMapNodeOfTypeADriverMap DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDF_DataMapNodeOfTypeADriverMap {
    BinMDF_DataMapNodeOfTypeADriverMap* _get_reference() {
    return (BinMDF_DataMapNodeOfTypeADriverMap*)$self->Access();
    }
};

%extend Handle_BinMDF_DataMapNodeOfTypeADriverMap {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDF_DataMapNodeOfTypeADriverMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDF_DoubleMapIteratorOfTypeIdMap;
class BinMDF_DoubleMapIteratorOfTypeIdMap : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") BinMDF_DoubleMapIteratorOfTypeIdMap;
		%feature("autodoc", "	:rtype: None
") BinMDF_DoubleMapIteratorOfTypeIdMap;
		 BinMDF_DoubleMapIteratorOfTypeIdMap ();
		%feature("compactdefaultargs") BinMDF_DoubleMapIteratorOfTypeIdMap;
		%feature("autodoc", "	:param aMap:
	:type aMap: BinMDF_TypeIdMap &
	:rtype: None
") BinMDF_DoubleMapIteratorOfTypeIdMap;
		 BinMDF_DoubleMapIteratorOfTypeIdMap (const BinMDF_TypeIdMap & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: BinMDF_TypeIdMap &
	:rtype: None
") Initialize;
		void Initialize (const BinMDF_TypeIdMap & aMap);
		%feature("compactdefaultargs") Key1;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
") Key1;
		Handle_Standard_Type Key1 ();
		%feature("compactdefaultargs") Key2;
		%feature("autodoc", "	:rtype: int
") Key2;
		const Standard_Integer & Key2 ();
};


%extend BinMDF_DoubleMapIteratorOfTypeIdMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDF_DoubleMapNodeOfTypeIdMap;
class BinMDF_DoubleMapNodeOfTypeIdMap : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BinMDF_DoubleMapNodeOfTypeIdMap;
		%feature("autodoc", "	:param K1:
	:type K1: Handle_Standard_Type &
	:param K2:
	:type K2: int &
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") BinMDF_DoubleMapNodeOfTypeIdMap;
		 BinMDF_DoubleMapNodeOfTypeIdMap (const Handle_Standard_Type & K1,const Standard_Integer & K2,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("compactdefaultargs") Key1;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
") Key1;
		Handle_Standard_Type Key1 ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey2() {
                return (Standard_Integer) $self->Key2();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey2(Standard_Integer value ) {
                $self->Key2()=value;
                }
            };
            		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
};


%extend BinMDF_DoubleMapNodeOfTypeIdMap {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDF_DoubleMapNodeOfTypeIdMap(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDF_DoubleMapNodeOfTypeIdMap::Handle_BinMDF_DoubleMapNodeOfTypeIdMap %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDF_DoubleMapNodeOfTypeIdMap;
class Handle_BinMDF_DoubleMapNodeOfTypeIdMap : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BinMDF_DoubleMapNodeOfTypeIdMap();
        Handle_BinMDF_DoubleMapNodeOfTypeIdMap(const Handle_BinMDF_DoubleMapNodeOfTypeIdMap &aHandle);
        Handle_BinMDF_DoubleMapNodeOfTypeIdMap(const BinMDF_DoubleMapNodeOfTypeIdMap *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDF_DoubleMapNodeOfTypeIdMap DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDF_DoubleMapNodeOfTypeIdMap {
    BinMDF_DoubleMapNodeOfTypeIdMap* _get_reference() {
    return (BinMDF_DoubleMapNodeOfTypeIdMap*)$self->Access();
    }
};

%extend Handle_BinMDF_DoubleMapNodeOfTypeIdMap {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDF_DoubleMapNodeOfTypeIdMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDF_TypeADriverMap;
class BinMDF_TypeADriverMap : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") BinMDF_TypeADriverMap;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") BinMDF_TypeADriverMap;
		 BinMDF_TypeADriverMap (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BinMDF_TypeADriverMap &
	:rtype: BinMDF_TypeADriverMap
") Assign;
		BinMDF_TypeADriverMap & Assign (const BinMDF_TypeADriverMap & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BinMDF_TypeADriverMap &
	:rtype: BinMDF_TypeADriverMap
") operator =;
		BinMDF_TypeADriverMap & operator = (const BinMDF_TypeADriverMap & Other);
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
	:type I: Handle_BinMDF_ADriver &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Handle_Standard_Type & K,const Handle_BinMDF_ADriver & I);
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
	:rtype: Handle_BinMDF_ADriver
") Find;
		Handle_BinMDF_ADriver Find (const Handle_Standard_Type & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: Handle_BinMDF_ADriver
") ChangeFind;
		Handle_BinMDF_ADriver ChangeFind (const Handle_Standard_Type & K);
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


%extend BinMDF_TypeADriverMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDF_TypeIdMap;
class BinMDF_TypeIdMap : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") BinMDF_TypeIdMap;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") BinMDF_TypeIdMap;
		 BinMDF_TypeIdMap (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BinMDF_TypeIdMap &
	:rtype: BinMDF_TypeIdMap
") Assign;
		BinMDF_TypeIdMap & Assign (const BinMDF_TypeIdMap & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BinMDF_TypeIdMap &
	:rtype: BinMDF_TypeIdMap
") operator =;
		BinMDF_TypeIdMap & operator = (const BinMDF_TypeIdMap & Other);
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
		%feature("autodoc", "	:param K1:
	:type K1: Handle_Standard_Type &
	:param K2:
	:type K2: int &
	:rtype: None
") Bind;
		void Bind (const Handle_Standard_Type & K1,const Standard_Integer & K2);
		%feature("compactdefaultargs") AreBound;
		%feature("autodoc", "	:param K1:
	:type K1: Handle_Standard_Type &
	:param K2:
	:type K2: int &
	:rtype: bool
") AreBound;
		Standard_Boolean AreBound (const Handle_Standard_Type & K1,const Standard_Integer & K2);
		%feature("compactdefaultargs") IsBound1;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: bool
") IsBound1;
		Standard_Boolean IsBound1 (const Handle_Standard_Type & K);
		%feature("compactdefaultargs") IsBound2;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") IsBound2;
		Standard_Boolean IsBound2 (const Standard_Integer & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: int
") Find1;
		const Standard_Integer & Find1 (const Handle_Standard_Type & K);
		%feature("compactdefaultargs") Find2;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Handle_Standard_Type
") Find2;
		Handle_Standard_Type Find2 (const Standard_Integer & K);
		%feature("compactdefaultargs") UnBind1;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: bool
") UnBind1;
		Standard_Boolean UnBind1 (const Handle_Standard_Type & K);
		%feature("compactdefaultargs") UnBind2;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") UnBind2;
		Standard_Boolean UnBind2 (const Standard_Integer & K);
};


%extend BinMDF_TypeIdMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDF_ReferenceDriver;
class BinMDF_ReferenceDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDF_ReferenceDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDF_ReferenceDriver;
		 BinMDF_ReferenceDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%extend BinMDF_ReferenceDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDF_ReferenceDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDF_ReferenceDriver::Handle_BinMDF_ReferenceDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDF_ReferenceDriver;
class Handle_BinMDF_ReferenceDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDF_ReferenceDriver();
        Handle_BinMDF_ReferenceDriver(const Handle_BinMDF_ReferenceDriver &aHandle);
        Handle_BinMDF_ReferenceDriver(const BinMDF_ReferenceDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDF_ReferenceDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDF_ReferenceDriver {
    BinMDF_ReferenceDriver* _get_reference() {
    return (BinMDF_ReferenceDriver*)$self->Access();
    }
};

%extend Handle_BinMDF_ReferenceDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDF_ReferenceDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDF_TagSourceDriver;
class BinMDF_TagSourceDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDF_TagSourceDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDF_TagSourceDriver;
		 BinMDF_TagSourceDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%extend BinMDF_TagSourceDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDF_TagSourceDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDF_TagSourceDriver::Handle_BinMDF_TagSourceDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDF_TagSourceDriver;
class Handle_BinMDF_TagSourceDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDF_TagSourceDriver();
        Handle_BinMDF_TagSourceDriver(const Handle_BinMDF_TagSourceDriver &aHandle);
        Handle_BinMDF_TagSourceDriver(const BinMDF_TagSourceDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDF_TagSourceDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDF_TagSourceDriver {
    BinMDF_TagSourceDriver* _get_reference() {
    return (BinMDF_TagSourceDriver*)$self->Access();
    }
};

%extend Handle_BinMDF_TagSourceDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDF_TagSourceDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
