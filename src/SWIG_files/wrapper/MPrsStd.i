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
%define MPRSSTDDOCSTRING
"Storage  and Retrieval drivers  for graphic
attributes.  Transient attributes are defined in
package TPrsStd and persistent one are defined in
package PPrsStd
"
%enddef
%module (package="OCC.Core", docstring=MPRSSTDDOCSTRING) MPrsStd

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


%include MPrsStd_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%wrap_handle(MPrsStd_AISPresentationRetrievalDriver)
%wrap_handle(MPrsStd_AISPresentationRetrievalDriver_1)
%wrap_handle(MPrsStd_AISPresentationStorageDriver)
%wrap_handle(MPrsStd_PositionRetrievalDriver)
%wrap_handle(MPrsStd_PositionStorageDriver)

%rename(mprsstd) MPrsStd;
class MPrsStd {
	public:
		%feature("compactdefaultargs") AddStorageDrivers;
		%feature("autodoc", "	* Adds the attribute storage drivers to <aDriverTable>.

	:param aDriverTable:
	:type aDriverTable: Handle_MDF_ASDriverHSequence &
	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: void
") AddStorageDrivers;
		static void AddStorageDrivers (const Handle_MDF_ASDriverHSequence & aDriverTable,const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") AddRetrievalDrivers;
		%feature("autodoc", "	* Adds the attribute retrieval drivers to <aDriverTable>.

	:param aDriverTable:
	:type aDriverTable: Handle_MDF_ARDriverHSequence &
	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: void
") AddRetrievalDrivers;
		static void AddRetrievalDrivers (const Handle_MDF_ARDriverHSequence & aDriverTable,const Handle_CDM_MessageDriver & theMessageDriver);
};


%extend MPrsStd {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MPrsStd_AISPresentationRetrievalDriver;
class MPrsStd_AISPresentationRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MPrsStd_AISPresentationRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MPrsStd_AISPresentationRetrievalDriver;
		 MPrsStd_AISPresentationRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: AISPresentation from PPrsStd.

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


%make_alias(MPrsStd_AISPresentationRetrievalDriver)

%extend MPrsStd_AISPresentationRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MPrsStd_AISPresentationRetrievalDriver_1;
class MPrsStd_AISPresentationRetrievalDriver_1 : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MPrsStd_AISPresentationRetrievalDriver_1;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MPrsStd_AISPresentationRetrievalDriver_1;
		 MPrsStd_AISPresentationRetrievalDriver_1 (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 1.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: AISPresentation from PPrsStd.

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


%make_alias(MPrsStd_AISPresentationRetrievalDriver_1)

%extend MPrsStd_AISPresentationRetrievalDriver_1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MPrsStd_AISPresentationStorageDriver;
class MPrsStd_AISPresentationStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MPrsStd_AISPresentationStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MPrsStd_AISPresentationStorageDriver;
		 MPrsStd_AISPresentationStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: AISPresentation from TPrsStd.

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


%make_alias(MPrsStd_AISPresentationStorageDriver)

%extend MPrsStd_AISPresentationStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MPrsStd_PositionRetrievalDriver;
class MPrsStd_PositionRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MPrsStd_PositionRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MPrsStd_PositionRetrievalDriver;
		 MPrsStd_PositionRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: ColorAttribute from PGraphicAttribute.

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


%make_alias(MPrsStd_PositionRetrievalDriver)

%extend MPrsStd_PositionRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MPrsStd_PositionStorageDriver;
class MPrsStd_PositionStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MPrsStd_PositionStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MPrsStd_PositionStorageDriver;
		 MPrsStd_PositionStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: ColorAttribute from TGraphicAttribute.

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


%make_alias(MPrsStd_PositionStorageDriver)

%extend MPrsStd_PositionStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
