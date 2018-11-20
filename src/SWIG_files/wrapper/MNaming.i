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
%define MNAMINGDOCSTRING
"
"
%enddef
%module (package="OCC.Core", docstring=MNAMINGDOCSTRING) MNaming

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


%include MNaming_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%wrap_handle(MNaming_NamedShapeRetrievalDriver)
%wrap_handle(MNaming_NamedShapeStorageDriver)
%wrap_handle(MNaming_NamingRetrievalDriver)
%wrap_handle(MNaming_NamingRetrievalDriver_1)
%wrap_handle(MNaming_NamingRetrievalDriver_2)
%wrap_handle(MNaming_NamingStorageDriver)

%rename(mnaming) MNaming;
class MNaming {
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
};


%extend MNaming {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MNaming_NamedShapeRetrievalDriver;
class MNaming_NamedShapeRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MNaming_NamedShapeRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MNaming_NamedShapeRetrievalDriver;
		 MNaming_NamedShapeRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type NamedShape from PNaming.

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


%make_alias(MNaming_NamedShapeRetrievalDriver)

%extend MNaming_NamedShapeRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MNaming_NamedShapeStorageDriver;
class MNaming_NamedShapeStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MNaming_NamedShapeStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MNaming_NamedShapeStorageDriver;
		 MNaming_NamedShapeStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: NamedShape from PNaming.

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


%make_alias(MNaming_NamedShapeStorageDriver)

%extend MNaming_NamedShapeStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MNaming_NamingRetrievalDriver;
class MNaming_NamingRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MNaming_NamingRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MNaming_NamingRetrievalDriver;
		 MNaming_NamingRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Constraint from PDataStd.

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


%make_alias(MNaming_NamingRetrievalDriver)

%extend MNaming_NamingRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MNaming_NamingRetrievalDriver_1;
class MNaming_NamingRetrievalDriver_1 : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MNaming_NamingRetrievalDriver_1;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MNaming_NamingRetrievalDriver_1;
		 MNaming_NamingRetrievalDriver_1 (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Naming from PNaming.

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


%make_alias(MNaming_NamingRetrievalDriver_1)

%extend MNaming_NamingRetrievalDriver_1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MNaming_NamingRetrievalDriver_2;
class MNaming_NamingRetrievalDriver_2 : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MNaming_NamingRetrievalDriver_2;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MNaming_NamingRetrievalDriver_2;
		 MNaming_NamingRetrievalDriver_2 (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Naming from PNaming.

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


%make_alias(MNaming_NamingRetrievalDriver_2)

%extend MNaming_NamingRetrievalDriver_2 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MNaming_NamingStorageDriver;
class MNaming_NamingStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MNaming_NamingStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MNaming_NamingStorageDriver;
		 MNaming_NamingStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%make_alias(MNaming_NamingStorageDriver)

%extend MNaming_NamingStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
