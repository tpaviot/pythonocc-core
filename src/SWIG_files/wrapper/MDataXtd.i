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
%define MDATAXTDDOCSTRING
"Storage  and Retrieval drivers  for modelling
attributes.  Transient attributes are defined in
package TDataStd and persistent one are defined in
package PDataStd
"
%enddef
%module (package="OCC.Core", docstring=MDATAXTDDOCSTRING) MDataXtd

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


%include MDataXtd_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%wrap_handle(MDataXtd_AxisRetrievalDriver)
%wrap_handle(MDataXtd_AxisStorageDriver)
%wrap_handle(MDataXtd_ConstraintRetrievalDriver)
%wrap_handle(MDataXtd_ConstraintStorageDriver)
%wrap_handle(MDataXtd_GeometryRetrievalDriver)
%wrap_handle(MDataXtd_GeometryStorageDriver)
%wrap_handle(MDataXtd_PatternStdRetrievalDriver)
%wrap_handle(MDataXtd_PatternStdStorageDriver)
%wrap_handle(MDataXtd_PlacementRetrievalDriver)
%wrap_handle(MDataXtd_PlacementStorageDriver)
%wrap_handle(MDataXtd_PlaneRetrievalDriver)
%wrap_handle(MDataXtd_PlaneStorageDriver)
%wrap_handle(MDataXtd_PointRetrievalDriver)
%wrap_handle(MDataXtd_PointStorageDriver)
%wrap_handle(MDataXtd_ShapeRetrievalDriver)
%wrap_handle(MDataXtd_ShapeStorageDriver)

%rename(mdataxtd) MDataXtd;
class MDataXtd {
	public:
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
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	* Method to launch in MgtGeom Delete MDataStd_1.cxx Modify MDataStd_GeometryStorageDriver::Paste

	:param Geometry:
	:type Geometry: Handle_Geom_Geometry &
	:rtype: Handle_PGeom_Geometry
") Translate;
		static Handle_PGeom_Geometry Translate (const Handle_Geom_Geometry & Geometry);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	* Method to lasunch in MgtGeom Delete MDataStd_1.cxx Modify MDataStd_GeometryRetrievalDriver::Paste Translation of TDataXtd enumerations to integer ===============================================

	:param Geometry:
	:type Geometry: Handle_PGeom_Geometry &
	:rtype: Handle_Geom_Geometry
") Translate;
		static Handle_Geom_Geometry Translate (const Handle_PGeom_Geometry & Geometry);
		%feature("compactdefaultargs") ConstraintTypeToInteger;
		%feature("autodoc", "	:param e:
	:type e: TDataXtd_ConstraintEnum
	:rtype: int
") ConstraintTypeToInteger;
		static Standard_Integer ConstraintTypeToInteger (const TDataXtd_ConstraintEnum e);
		%feature("compactdefaultargs") IntegerToConstraintType;
		%feature("autodoc", "	:param i:
	:type i: int
	:rtype: TDataXtd_ConstraintEnum
") IntegerToConstraintType;
		static TDataXtd_ConstraintEnum IntegerToConstraintType (const Standard_Integer i);
		%feature("compactdefaultargs") GeometryTypeToInteger;
		%feature("autodoc", "	:param e:
	:type e: TDataXtd_GeometryEnum
	:rtype: int
") GeometryTypeToInteger;
		static Standard_Integer GeometryTypeToInteger (const TDataXtd_GeometryEnum e);
		%feature("compactdefaultargs") IntegerToGeometryType;
		%feature("autodoc", "	:param i:
	:type i: int
	:rtype: TDataXtd_GeometryEnum
") IntegerToGeometryType;
		static TDataXtd_GeometryEnum IntegerToGeometryType (const Standard_Integer i);
};


%extend MDataXtd {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataXtd_AxisRetrievalDriver;
class MDataXtd_AxisRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataXtd_AxisRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataXtd_AxisRetrievalDriver;
		 MDataXtd_AxisRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Axis from PDataXtd.

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


%make_alias(MDataXtd_AxisRetrievalDriver)

%extend MDataXtd_AxisRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataXtd_AxisStorageDriver;
class MDataXtd_AxisStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataXtd_AxisStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataXtd_AxisStorageDriver;
		 MDataXtd_AxisStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Integer from TDataStd.

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


%make_alias(MDataXtd_AxisStorageDriver)

%extend MDataXtd_AxisStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataXtd_ConstraintRetrievalDriver;
class MDataXtd_ConstraintRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataXtd_ConstraintRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataXtd_ConstraintRetrievalDriver;
		 MDataXtd_ConstraintRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Constraint from PDataXtd.

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


%make_alias(MDataXtd_ConstraintRetrievalDriver)

%extend MDataXtd_ConstraintRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataXtd_ConstraintStorageDriver;
class MDataXtd_ConstraintStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataXtd_ConstraintStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataXtd_ConstraintStorageDriver;
		 MDataXtd_ConstraintStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Integer from TDataStd.

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


%make_alias(MDataXtd_ConstraintStorageDriver)

%extend MDataXtd_ConstraintStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataXtd_GeometryRetrievalDriver;
class MDataXtd_GeometryRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataXtd_GeometryRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataXtd_GeometryRetrievalDriver;
		 MDataXtd_GeometryRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Geometry from PDataXtd.

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


%make_alias(MDataXtd_GeometryRetrievalDriver)

%extend MDataXtd_GeometryRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataXtd_GeometryStorageDriver;
class MDataXtd_GeometryStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataXtd_GeometryStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataXtd_GeometryStorageDriver;
		 MDataXtd_GeometryStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Integer from TDataStd.

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


%make_alias(MDataXtd_GeometryStorageDriver)

%extend MDataXtd_GeometryStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataXtd_PatternStdRetrievalDriver;
class MDataXtd_PatternStdRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataXtd_PatternStdRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataXtd_PatternStdRetrievalDriver;
		 MDataXtd_PatternStdRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: PatternStd from PDataXtd.

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


%make_alias(MDataXtd_PatternStdRetrievalDriver)

%extend MDataXtd_PatternStdRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataXtd_PatternStdStorageDriver;
class MDataXtd_PatternStdStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataXtd_PatternStdStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataXtd_PatternStdStorageDriver;
		 MDataXtd_PatternStdStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Integer from TDataStd.

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


%make_alias(MDataXtd_PatternStdStorageDriver)

%extend MDataXtd_PatternStdStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataXtd_PlacementRetrievalDriver;
class MDataXtd_PlacementRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataXtd_PlacementRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataXtd_PlacementRetrievalDriver;
		 MDataXtd_PlacementRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Placement from PDataXtd.

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


%make_alias(MDataXtd_PlacementRetrievalDriver)

%extend MDataXtd_PlacementRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataXtd_PlacementStorageDriver;
class MDataXtd_PlacementStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataXtd_PlacementStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataXtd_PlacementStorageDriver;
		 MDataXtd_PlacementStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Integer from TDataStd.

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


%make_alias(MDataXtd_PlacementStorageDriver)

%extend MDataXtd_PlacementStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataXtd_PlaneRetrievalDriver;
class MDataXtd_PlaneRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataXtd_PlaneRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataXtd_PlaneRetrievalDriver;
		 MDataXtd_PlaneRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Plane from PDataXtd.

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


%make_alias(MDataXtd_PlaneRetrievalDriver)

%extend MDataXtd_PlaneRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataXtd_PlaneStorageDriver;
class MDataXtd_PlaneStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataXtd_PlaneStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataXtd_PlaneStorageDriver;
		 MDataXtd_PlaneStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Integer from TDataStd.

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


%make_alias(MDataXtd_PlaneStorageDriver)

%extend MDataXtd_PlaneStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataXtd_PointRetrievalDriver;
class MDataXtd_PointRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataXtd_PointRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataXtd_PointRetrievalDriver;
		 MDataXtd_PointRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Point from PDataXtd.

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


%make_alias(MDataXtd_PointRetrievalDriver)

%extend MDataXtd_PointRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataXtd_PointStorageDriver;
class MDataXtd_PointStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataXtd_PointStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataXtd_PointStorageDriver;
		 MDataXtd_PointStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Integer from TDataStd.

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


%make_alias(MDataXtd_PointStorageDriver)

%extend MDataXtd_PointStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataXtd_ShapeRetrievalDriver;
class MDataXtd_ShapeRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataXtd_ShapeRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataXtd_ShapeRetrievalDriver;
		 MDataXtd_ShapeRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Shape from PDataXtd.

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


%make_alias(MDataXtd_ShapeRetrievalDriver)

%extend MDataXtd_ShapeRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataXtd_ShapeStorageDriver;
class MDataXtd_ShapeStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataXtd_ShapeStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataXtd_ShapeStorageDriver;
		 MDataXtd_ShapeStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Integer from TDataStd.

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


%make_alias(MDataXtd_ShapeStorageDriver)

%extend MDataXtd_ShapeStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
