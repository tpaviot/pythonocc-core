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
%define BINMXCAFDOCDOCSTRING
""
%enddef
%module (package="OCC.Core", docstring=BINMXCAFDOCDOCSTRING) BinMXCAFDoc

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


%include BinMXCAFDoc_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%wrap_handle(BinMXCAFDoc_AreaDriver)
%wrap_handle(BinMXCAFDoc_CentroidDriver)
%wrap_handle(BinMXCAFDoc_ColorDriver)
%wrap_handle(BinMXCAFDoc_ColorToolDriver)
%wrap_handle(BinMXCAFDoc_DatumDriver)
%wrap_handle(BinMXCAFDoc_DimTolDriver)
%wrap_handle(BinMXCAFDoc_DimTolToolDriver)
%wrap_handle(BinMXCAFDoc_DocumentToolDriver)
%wrap_handle(BinMXCAFDoc_GraphNodeDriver)
%wrap_handle(BinMXCAFDoc_LayerToolDriver)
%wrap_handle(BinMXCAFDoc_LocationDriver)
%wrap_handle(BinMXCAFDoc_MaterialDriver)
%wrap_handle(BinMXCAFDoc_MaterialToolDriver)
%wrap_handle(BinMXCAFDoc_ShapeToolDriver)
%wrap_handle(BinMXCAFDoc_VolumeDriver)

%rename(binmxcafdoc) BinMXCAFDoc;
class BinMXCAFDoc {
	public:
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "	* Adds the attribute drivers to <theDriverTable>.

	:param theDriverTable:
	:type theDriverTable: Handle_BinMDF_ADriverTable &
	:param theMsgDrv:
	:type theMsgDrv: Handle_CDM_MessageDriver &
	:rtype: void
") AddDrivers;
		static void AddDrivers (const Handle_BinMDF_ADriverTable & theDriverTable,const Handle_CDM_MessageDriver & theMsgDrv);
};


%extend BinMXCAFDoc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMXCAFDoc_AreaDriver;
class BinMXCAFDoc_AreaDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMXCAFDoc_AreaDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMXCAFDoc_AreaDriver;
		 BinMXCAFDoc_AreaDriver (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
};


%make_alias(BinMXCAFDoc_AreaDriver)

%extend BinMXCAFDoc_AreaDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMXCAFDoc_CentroidDriver;
class BinMXCAFDoc_CentroidDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMXCAFDoc_CentroidDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMXCAFDoc_CentroidDriver;
		 BinMXCAFDoc_CentroidDriver (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
};


%make_alias(BinMXCAFDoc_CentroidDriver)

%extend BinMXCAFDoc_CentroidDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMXCAFDoc_ColorDriver;
class BinMXCAFDoc_ColorDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMXCAFDoc_ColorDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMXCAFDoc_ColorDriver;
		 BinMXCAFDoc_ColorDriver (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
};


%make_alias(BinMXCAFDoc_ColorDriver)

%extend BinMXCAFDoc_ColorDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMXCAFDoc_ColorToolDriver;
class BinMXCAFDoc_ColorToolDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMXCAFDoc_ColorToolDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMXCAFDoc_ColorToolDriver;
		 BinMXCAFDoc_ColorToolDriver (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
};


%make_alias(BinMXCAFDoc_ColorToolDriver)

%extend BinMXCAFDoc_ColorToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMXCAFDoc_DatumDriver;
class BinMXCAFDoc_DatumDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMXCAFDoc_DatumDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMXCAFDoc_DatumDriver;
		 BinMXCAFDoc_DatumDriver (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
};


%make_alias(BinMXCAFDoc_DatumDriver)

%extend BinMXCAFDoc_DatumDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMXCAFDoc_DimTolDriver;
class BinMXCAFDoc_DimTolDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMXCAFDoc_DimTolDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMXCAFDoc_DimTolDriver;
		 BinMXCAFDoc_DimTolDriver (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
};


%make_alias(BinMXCAFDoc_DimTolDriver)

%extend BinMXCAFDoc_DimTolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMXCAFDoc_DimTolToolDriver;
class BinMXCAFDoc_DimTolToolDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMXCAFDoc_DimTolToolDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMXCAFDoc_DimTolToolDriver;
		 BinMXCAFDoc_DimTolToolDriver (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
};


%make_alias(BinMXCAFDoc_DimTolToolDriver)

%extend BinMXCAFDoc_DimTolToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMXCAFDoc_DocumentToolDriver;
class BinMXCAFDoc_DocumentToolDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMXCAFDoc_DocumentToolDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMXCAFDoc_DocumentToolDriver;
		 BinMXCAFDoc_DocumentToolDriver (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
};


%make_alias(BinMXCAFDoc_DocumentToolDriver)

%extend BinMXCAFDoc_DocumentToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMXCAFDoc_GraphNodeDriver;
class BinMXCAFDoc_GraphNodeDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMXCAFDoc_GraphNodeDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMXCAFDoc_GraphNodeDriver;
		 BinMXCAFDoc_GraphNodeDriver (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
};


%make_alias(BinMXCAFDoc_GraphNodeDriver)

%extend BinMXCAFDoc_GraphNodeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMXCAFDoc_LayerToolDriver;
class BinMXCAFDoc_LayerToolDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMXCAFDoc_LayerToolDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMXCAFDoc_LayerToolDriver;
		 BinMXCAFDoc_LayerToolDriver (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
};


%make_alias(BinMXCAFDoc_LayerToolDriver)

%extend BinMXCAFDoc_LayerToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMXCAFDoc_LocationDriver;
class BinMXCAFDoc_LocationDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMXCAFDoc_LocationDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMXCAFDoc_LocationDriver;
		 BinMXCAFDoc_LocationDriver (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theLoc:
	:type theLoc: TopLoc_Location &
	:param theMap:
	:type theMap: BinObjMgt_RRelocationTable &
	:rtype: bool
") Translate;
		Standard_Boolean Translate (const BinObjMgt_Persistent & theSource,TopLoc_Location & theLoc,BinObjMgt_RRelocationTable & theMap);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	* Translate transient location to storable

	:param theLoc:
	:type theLoc: TopLoc_Location &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theMap:
	:type theMap: BinObjMgt_SRelocationTable &
	:rtype: None
") Translate;
		void Translate (const TopLoc_Location & theLoc,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theMap);
		%feature("compactdefaultargs") SetSharedLocations;
		%feature("autodoc", "	:param theLocations:
	:type theLocations: BinTools_LocationSetPtr &
	:rtype: None
") SetSharedLocations;
		void SetSharedLocations (const BinTools_LocationSetPtr & theLocations);
};


%make_alias(BinMXCAFDoc_LocationDriver)

%extend BinMXCAFDoc_LocationDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMXCAFDoc_MaterialDriver;
class BinMXCAFDoc_MaterialDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMXCAFDoc_MaterialDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMXCAFDoc_MaterialDriver;
		 BinMXCAFDoc_MaterialDriver (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
};


%make_alias(BinMXCAFDoc_MaterialDriver)

%extend BinMXCAFDoc_MaterialDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMXCAFDoc_MaterialToolDriver;
class BinMXCAFDoc_MaterialToolDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMXCAFDoc_MaterialToolDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMXCAFDoc_MaterialToolDriver;
		 BinMXCAFDoc_MaterialToolDriver (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
};


%make_alias(BinMXCAFDoc_MaterialToolDriver)

%extend BinMXCAFDoc_MaterialToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMXCAFDoc_ShapeToolDriver;
class BinMXCAFDoc_ShapeToolDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMXCAFDoc_ShapeToolDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMXCAFDoc_ShapeToolDriver;
		 BinMXCAFDoc_ShapeToolDriver (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
};


%make_alias(BinMXCAFDoc_ShapeToolDriver)

%extend BinMXCAFDoc_ShapeToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMXCAFDoc_VolumeDriver;
class BinMXCAFDoc_VolumeDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMXCAFDoc_VolumeDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMXCAFDoc_VolumeDriver;
		 BinMXCAFDoc_VolumeDriver (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
};


%make_alias(BinMXCAFDoc_VolumeDriver)

%extend BinMXCAFDoc_VolumeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
