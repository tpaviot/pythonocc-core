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
%define MDATASTDDOCSTRING
"Storage  and Retrieval drivers  for modelling
attributes.  Transient attributes are defined in
package TDataStd and persistent one are defined in
package PDataStd
"
%enddef
%module (package="OCC.Core", docstring=MDATASTDDOCSTRING) MDataStd

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


%include MDataStd_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%wrap_handle(MDataStd_AsciiStringRetrievalDriver)
%wrap_handle(MDataStd_AsciiStringStorageDriver)
%wrap_handle(MDataStd_BooleanArrayRetrievalDriver)
%wrap_handle(MDataStd_BooleanArrayStorageDriver)
%wrap_handle(MDataStd_BooleanListRetrievalDriver)
%wrap_handle(MDataStd_BooleanListStorageDriver)
%wrap_handle(MDataStd_ByteArrayRetrievalDriver)
%wrap_handle(MDataStd_ByteArrayRetrievalDriver_1)
%wrap_handle(MDataStd_ByteArrayStorageDriver)
%wrap_handle(MDataStd_CommentRetrievalDriver)
%wrap_handle(MDataStd_CommentStorageDriver)
%wrap_handle(MDataStd_DirectoryRetrievalDriver)
%wrap_handle(MDataStd_DirectoryStorageDriver)
%wrap_handle(MDataStd_ExpressionRetrievalDriver)
%wrap_handle(MDataStd_ExpressionStorageDriver)
%wrap_handle(MDataStd_ExtStringArrayRetrievalDriver)
%wrap_handle(MDataStd_ExtStringArrayRetrievalDriver_1)
%wrap_handle(MDataStd_ExtStringArrayStorageDriver)
%wrap_handle(MDataStd_ExtStringListRetrievalDriver)
%wrap_handle(MDataStd_ExtStringListStorageDriver)
%wrap_handle(MDataStd_IntPackedMapRetrievalDriver)
%wrap_handle(MDataStd_IntPackedMapRetrievalDriver_1)
%wrap_handle(MDataStd_IntPackedMapStorageDriver)
%wrap_handle(MDataStd_IntegerArrayRetrievalDriver)
%wrap_handle(MDataStd_IntegerArrayRetrievalDriver_1)
%wrap_handle(MDataStd_IntegerArrayStorageDriver)
%wrap_handle(MDataStd_IntegerListRetrievalDriver)
%wrap_handle(MDataStd_IntegerListStorageDriver)
%wrap_handle(MDataStd_IntegerRetrievalDriver)
%wrap_handle(MDataStd_IntegerStorageDriver)
%wrap_handle(MDataStd_NameRetrievalDriver)
%wrap_handle(MDataStd_NameStorageDriver)
%wrap_handle(MDataStd_NamedDataRetrievalDriver)
%wrap_handle(MDataStd_NamedDataStorageDriver)
%wrap_handle(MDataStd_NoteBookRetrievalDriver)
%wrap_handle(MDataStd_NoteBookStorageDriver)
%wrap_handle(MDataStd_RealArrayRetrievalDriver)
%wrap_handle(MDataStd_RealArrayRetrievalDriver_1)
%wrap_handle(MDataStd_RealArrayStorageDriver)
%wrap_handle(MDataStd_RealListRetrievalDriver)
%wrap_handle(MDataStd_RealListStorageDriver)
%wrap_handle(MDataStd_RealRetrievalDriver)
%wrap_handle(MDataStd_RealStorageDriver)
%wrap_handle(MDataStd_ReferenceArrayRetrievalDriver)
%wrap_handle(MDataStd_ReferenceArrayStorageDriver)
%wrap_handle(MDataStd_ReferenceListRetrievalDriver)
%wrap_handle(MDataStd_ReferenceListStorageDriver)
%wrap_handle(MDataStd_RelationRetrievalDriver)
%wrap_handle(MDataStd_RelationStorageDriver)
%wrap_handle(MDataStd_TickRetrievalDriver)
%wrap_handle(MDataStd_TickStorageDriver)
%wrap_handle(MDataStd_TreeNodeRetrievalDriver)
%wrap_handle(MDataStd_TreeNodeStorageDriver)
%wrap_handle(MDataStd_UAttributeRetrievalDriver)
%wrap_handle(MDataStd_UAttributeStorageDriver)
%wrap_handle(MDataStd_VariableRetrievalDriver)
%wrap_handle(MDataStd_VariableStorageDriver)

%rename(mdatastd) MDataStd;
class MDataStd {
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
		%feature("autodoc", "	* Adds the attribute retrieval drivers to <aDriverSeq>. Translation of TDataStd enumerations to integer ===============================================

	:param aDriverSeq:
	:type aDriverSeq: Handle_MDF_ARDriverHSequence &
	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: void
") AddRetrievalDrivers;
		static void AddRetrievalDrivers (const Handle_MDF_ARDriverHSequence & aDriverSeq,const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") RealDimensionToInteger;
		%feature("autodoc", "	:param e:
	:type e: TDataStd_RealEnum
	:rtype: int
") RealDimensionToInteger;
		static Standard_Integer RealDimensionToInteger (const TDataStd_RealEnum e);
		%feature("compactdefaultargs") IntegerToRealDimension;
		%feature("autodoc", "	:param i:
	:type i: int
	:rtype: TDataStd_RealEnum
") IntegerToRealDimension;
		static TDataStd_RealEnum IntegerToRealDimension (const Standard_Integer i);
};


%extend MDataStd {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_AsciiStringRetrievalDriver;
class MDataStd_AsciiStringRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_AsciiStringRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_AsciiStringRetrievalDriver;
		 MDataStd_AsciiStringRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: AsciiString from PDataStd.

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


%make_alias(MDataStd_AsciiStringRetrievalDriver)

%extend MDataStd_AsciiStringRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_AsciiStringStorageDriver;
class MDataStd_AsciiStringStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_AsciiStringStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_AsciiStringStorageDriver;
		 MDataStd_AsciiStringStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%make_alias(MDataStd_AsciiStringStorageDriver)

%extend MDataStd_AsciiStringStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_BooleanArrayRetrievalDriver;
class MDataStd_BooleanArrayRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_BooleanArrayRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_BooleanArrayRetrievalDriver;
		 MDataStd_BooleanArrayRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%make_alias(MDataStd_BooleanArrayRetrievalDriver)

%extend MDataStd_BooleanArrayRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_BooleanArrayStorageDriver;
class MDataStd_BooleanArrayStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_BooleanArrayStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_BooleanArrayStorageDriver;
		 MDataStd_BooleanArrayStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%make_alias(MDataStd_BooleanArrayStorageDriver)

%extend MDataStd_BooleanArrayStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_BooleanListRetrievalDriver;
class MDataStd_BooleanListRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_BooleanListRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_BooleanListRetrievalDriver;
		 MDataStd_BooleanListRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%make_alias(MDataStd_BooleanListRetrievalDriver)

%extend MDataStd_BooleanListRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_BooleanListStorageDriver;
class MDataStd_BooleanListStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_BooleanListStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_BooleanListStorageDriver;
		 MDataStd_BooleanListStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%make_alias(MDataStd_BooleanListStorageDriver)

%extend MDataStd_BooleanListStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_ByteArrayRetrievalDriver;
class MDataStd_ByteArrayRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_ByteArrayRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_ByteArrayRetrievalDriver;
		 MDataStd_ByteArrayRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%make_alias(MDataStd_ByteArrayRetrievalDriver)

%extend MDataStd_ByteArrayRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_ByteArrayRetrievalDriver_1;
class MDataStd_ByteArrayRetrievalDriver_1 : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_ByteArrayRetrievalDriver_1;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_ByteArrayRetrievalDriver_1;
		 MDataStd_ByteArrayRetrievalDriver_1 (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%make_alias(MDataStd_ByteArrayRetrievalDriver_1)

%extend MDataStd_ByteArrayRetrievalDriver_1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_ByteArrayStorageDriver;
class MDataStd_ByteArrayStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_ByteArrayStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_ByteArrayStorageDriver;
		 MDataStd_ByteArrayStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%make_alias(MDataStd_ByteArrayStorageDriver)

%extend MDataStd_ByteArrayStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_CommentRetrievalDriver;
class MDataStd_CommentRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_CommentRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_CommentRetrievalDriver;
		 MDataStd_CommentRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Comment from PDataStd.

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


%make_alias(MDataStd_CommentRetrievalDriver)

%extend MDataStd_CommentRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_CommentStorageDriver;
class MDataStd_CommentStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_CommentStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_CommentStorageDriver;
		 MDataStd_CommentStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%make_alias(MDataStd_CommentStorageDriver)

%extend MDataStd_CommentStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_DirectoryRetrievalDriver;
class MDataStd_DirectoryRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_DirectoryRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_DirectoryRetrievalDriver;
		 MDataStd_DirectoryRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Directory from PDataStd.

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


%make_alias(MDataStd_DirectoryRetrievalDriver)

%extend MDataStd_DirectoryRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_DirectoryStorageDriver;
class MDataStd_DirectoryStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_DirectoryStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_DirectoryStorageDriver;
		 MDataStd_DirectoryStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%make_alias(MDataStd_DirectoryStorageDriver)

%extend MDataStd_DirectoryStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_ExpressionRetrievalDriver;
class MDataStd_ExpressionRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_ExpressionRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_ExpressionRetrievalDriver;
		 MDataStd_ExpressionRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Expression from PDataStd.

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


%make_alias(MDataStd_ExpressionRetrievalDriver)

%extend MDataStd_ExpressionRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_ExpressionStorageDriver;
class MDataStd_ExpressionStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_ExpressionStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_ExpressionStorageDriver;
		 MDataStd_ExpressionStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%make_alias(MDataStd_ExpressionStorageDriver)

%extend MDataStd_ExpressionStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_ExtStringArrayRetrievalDriver;
class MDataStd_ExtStringArrayRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_ExtStringArrayRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_ExtStringArrayRetrievalDriver;
		 MDataStd_ExtStringArrayRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: ExtStringArray from PDataStd.

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


%make_alias(MDataStd_ExtStringArrayRetrievalDriver)

%extend MDataStd_ExtStringArrayRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_ExtStringArrayRetrievalDriver_1;
class MDataStd_ExtStringArrayRetrievalDriver_1 : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_ExtStringArrayRetrievalDriver_1;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_ExtStringArrayRetrievalDriver_1;
		 MDataStd_ExtStringArrayRetrievalDriver_1 (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 1.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: ExtStringArray from PDataStd.

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


%make_alias(MDataStd_ExtStringArrayRetrievalDriver_1)

%extend MDataStd_ExtStringArrayRetrievalDriver_1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_ExtStringArrayStorageDriver;
class MDataStd_ExtStringArrayStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_ExtStringArrayStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_ExtStringArrayStorageDriver;
		 MDataStd_ExtStringArrayStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: ExtStringArray from TDataStd.

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


%make_alias(MDataStd_ExtStringArrayStorageDriver)

%extend MDataStd_ExtStringArrayStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_ExtStringListRetrievalDriver;
class MDataStd_ExtStringListRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_ExtStringListRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_ExtStringListRetrievalDriver;
		 MDataStd_ExtStringListRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%make_alias(MDataStd_ExtStringListRetrievalDriver)

%extend MDataStd_ExtStringListRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_ExtStringListStorageDriver;
class MDataStd_ExtStringListStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_ExtStringListStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_ExtStringListStorageDriver;
		 MDataStd_ExtStringListStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%make_alias(MDataStd_ExtStringListStorageDriver)

%extend MDataStd_ExtStringListStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_IntPackedMapRetrievalDriver;
class MDataStd_IntPackedMapRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_IntPackedMapRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_IntPackedMapRetrievalDriver;
		 MDataStd_IntPackedMapRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: IntPackedMap from PDataStd.

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


%make_alias(MDataStd_IntPackedMapRetrievalDriver)

%extend MDataStd_IntPackedMapRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_IntPackedMapRetrievalDriver_1;
class MDataStd_IntPackedMapRetrievalDriver_1 : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_IntPackedMapRetrievalDriver_1;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_IntPackedMapRetrievalDriver_1;
		 MDataStd_IntPackedMapRetrievalDriver_1 (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 1.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: IntPackedMap_1 from PDataStd.

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


%make_alias(MDataStd_IntPackedMapRetrievalDriver_1)

%extend MDataStd_IntPackedMapRetrievalDriver_1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_IntPackedMapStorageDriver;
class MDataStd_IntPackedMapStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_IntPackedMapStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_IntPackedMapStorageDriver;
		 MDataStd_IntPackedMapStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%make_alias(MDataStd_IntPackedMapStorageDriver)

%extend MDataStd_IntPackedMapStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_IntegerArrayRetrievalDriver;
class MDataStd_IntegerArrayRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_IntegerArrayRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_IntegerArrayRetrievalDriver;
		 MDataStd_IntegerArrayRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: IntegerArray from PDataStd.

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


%make_alias(MDataStd_IntegerArrayRetrievalDriver)

%extend MDataStd_IntegerArrayRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_IntegerArrayRetrievalDriver_1;
class MDataStd_IntegerArrayRetrievalDriver_1 : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_IntegerArrayRetrievalDriver_1;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_IntegerArrayRetrievalDriver_1;
		 MDataStd_IntegerArrayRetrievalDriver_1 (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 1.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: IntegerArray from PDataStd.

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


%make_alias(MDataStd_IntegerArrayRetrievalDriver_1)

%extend MDataStd_IntegerArrayRetrievalDriver_1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_IntegerArrayStorageDriver;
class MDataStd_IntegerArrayStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_IntegerArrayStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_IntegerArrayStorageDriver;
		 MDataStd_IntegerArrayStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: IntegerArray from TDataStd.

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


%make_alias(MDataStd_IntegerArrayStorageDriver)

%extend MDataStd_IntegerArrayStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_IntegerListRetrievalDriver;
class MDataStd_IntegerListRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_IntegerListRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_IntegerListRetrievalDriver;
		 MDataStd_IntegerListRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%make_alias(MDataStd_IntegerListRetrievalDriver)

%extend MDataStd_IntegerListRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_IntegerListStorageDriver;
class MDataStd_IntegerListStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_IntegerListStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_IntegerListStorageDriver;
		 MDataStd_IntegerListStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%make_alias(MDataStd_IntegerListStorageDriver)

%extend MDataStd_IntegerListStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_IntegerRetrievalDriver;
class MDataStd_IntegerRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_IntegerRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_IntegerRetrievalDriver;
		 MDataStd_IntegerRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Integer from PDataStd.

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


%make_alias(MDataStd_IntegerRetrievalDriver)

%extend MDataStd_IntegerRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_IntegerStorageDriver;
class MDataStd_IntegerStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_IntegerStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_IntegerStorageDriver;
		 MDataStd_IntegerStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%make_alias(MDataStd_IntegerStorageDriver)

%extend MDataStd_IntegerStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_NameRetrievalDriver;
class MDataStd_NameRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_NameRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_NameRetrievalDriver;
		 MDataStd_NameRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Name from PDataStd.

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


%make_alias(MDataStd_NameRetrievalDriver)

%extend MDataStd_NameRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_NameStorageDriver;
class MDataStd_NameStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_NameStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_NameStorageDriver;
		 MDataStd_NameStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%make_alias(MDataStd_NameStorageDriver)

%extend MDataStd_NameStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_NamedDataRetrievalDriver;
class MDataStd_NamedDataRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_NamedDataRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_NamedDataRetrievalDriver;
		 MDataStd_NamedDataRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%make_alias(MDataStd_NamedDataRetrievalDriver)

%extend MDataStd_NamedDataRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_NamedDataStorageDriver;
class MDataStd_NamedDataStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_NamedDataStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_NamedDataStorageDriver;
		 MDataStd_NamedDataStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%make_alias(MDataStd_NamedDataStorageDriver)

%extend MDataStd_NamedDataStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_NoteBookRetrievalDriver;
class MDataStd_NoteBookRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_NoteBookRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_NoteBookRetrievalDriver;
		 MDataStd_NoteBookRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: NoteBook from PDataStd.

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


%make_alias(MDataStd_NoteBookRetrievalDriver)

%extend MDataStd_NoteBookRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_NoteBookStorageDriver;
class MDataStd_NoteBookStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_NoteBookStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_NoteBookStorageDriver;
		 MDataStd_NoteBookStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%make_alias(MDataStd_NoteBookStorageDriver)

%extend MDataStd_NoteBookStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_RealArrayRetrievalDriver;
class MDataStd_RealArrayRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_RealArrayRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_RealArrayRetrievalDriver;
		 MDataStd_RealArrayRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: RealArray from PDataStd.

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


%make_alias(MDataStd_RealArrayRetrievalDriver)

%extend MDataStd_RealArrayRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_RealArrayRetrievalDriver_1;
class MDataStd_RealArrayRetrievalDriver_1 : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_RealArrayRetrievalDriver_1;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_RealArrayRetrievalDriver_1;
		 MDataStd_RealArrayRetrievalDriver_1 (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 1.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: RealArray from PDataStd.

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


%make_alias(MDataStd_RealArrayRetrievalDriver_1)

%extend MDataStd_RealArrayRetrievalDriver_1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_RealArrayStorageDriver;
class MDataStd_RealArrayStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_RealArrayStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_RealArrayStorageDriver;
		 MDataStd_RealArrayStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: RealArray from TDataStd.

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


%make_alias(MDataStd_RealArrayStorageDriver)

%extend MDataStd_RealArrayStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_RealListRetrievalDriver;
class MDataStd_RealListRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_RealListRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_RealListRetrievalDriver;
		 MDataStd_RealListRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%make_alias(MDataStd_RealListRetrievalDriver)

%extend MDataStd_RealListRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_RealListStorageDriver;
class MDataStd_RealListStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_RealListStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_RealListStorageDriver;
		 MDataStd_RealListStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%make_alias(MDataStd_RealListStorageDriver)

%extend MDataStd_RealListStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_RealRetrievalDriver;
class MDataStd_RealRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_RealRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_RealRetrievalDriver;
		 MDataStd_RealRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Real from PDataStd.

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


%make_alias(MDataStd_RealRetrievalDriver)

%extend MDataStd_RealRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_RealStorageDriver;
class MDataStd_RealStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_RealStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_RealStorageDriver;
		 MDataStd_RealStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Real from TDataStd.

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


%make_alias(MDataStd_RealStorageDriver)

%extend MDataStd_RealStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_ReferenceArrayRetrievalDriver;
class MDataStd_ReferenceArrayRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_ReferenceArrayRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_ReferenceArrayRetrievalDriver;
		 MDataStd_ReferenceArrayRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%make_alias(MDataStd_ReferenceArrayRetrievalDriver)

%extend MDataStd_ReferenceArrayRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_ReferenceArrayStorageDriver;
class MDataStd_ReferenceArrayStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_ReferenceArrayStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_ReferenceArrayStorageDriver;
		 MDataStd_ReferenceArrayStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%make_alias(MDataStd_ReferenceArrayStorageDriver)

%extend MDataStd_ReferenceArrayStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_ReferenceListRetrievalDriver;
class MDataStd_ReferenceListRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_ReferenceListRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_ReferenceListRetrievalDriver;
		 MDataStd_ReferenceListRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%make_alias(MDataStd_ReferenceListRetrievalDriver)

%extend MDataStd_ReferenceListRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_ReferenceListStorageDriver;
class MDataStd_ReferenceListStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_ReferenceListStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_ReferenceListStorageDriver;
		 MDataStd_ReferenceListStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%make_alias(MDataStd_ReferenceListStorageDriver)

%extend MDataStd_ReferenceListStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_RelationRetrievalDriver;
class MDataStd_RelationRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_RelationRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_RelationRetrievalDriver;
		 MDataStd_RelationRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Relation from PDataStd.

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


%make_alias(MDataStd_RelationRetrievalDriver)

%extend MDataStd_RelationRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_RelationStorageDriver;
class MDataStd_RelationStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_RelationStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_RelationStorageDriver;
		 MDataStd_RelationStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%make_alias(MDataStd_RelationStorageDriver)

%extend MDataStd_RelationStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_TickRetrievalDriver;
class MDataStd_TickRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_TickRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_TickRetrievalDriver;
		 MDataStd_TickRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type Tick from PDataStd.

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


%make_alias(MDataStd_TickRetrievalDriver)

%extend MDataStd_TickRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_TickStorageDriver;
class MDataStd_TickStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_TickStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_TickStorageDriver;
		 MDataStd_TickStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type Tick from TDataStd.

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


%make_alias(MDataStd_TickStorageDriver)

%extend MDataStd_TickStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_TreeNodeRetrievalDriver;
class MDataStd_TreeNodeRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_TreeNodeRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_TreeNodeRetrievalDriver;
		 MDataStd_TreeNodeRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%make_alias(MDataStd_TreeNodeRetrievalDriver)

%extend MDataStd_TreeNodeRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_TreeNodeStorageDriver;
class MDataStd_TreeNodeStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_TreeNodeStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_TreeNodeStorageDriver;
		 MDataStd_TreeNodeStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%make_alias(MDataStd_TreeNodeStorageDriver)

%extend MDataStd_TreeNodeStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_UAttributeRetrievalDriver;
class MDataStd_UAttributeRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_UAttributeRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_UAttributeRetrievalDriver;
		 MDataStd_UAttributeRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: UAttribute from PDataStd.

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


%make_alias(MDataStd_UAttributeRetrievalDriver)

%extend MDataStd_UAttributeRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_UAttributeStorageDriver;
class MDataStd_UAttributeStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_UAttributeStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_UAttributeStorageDriver;
		 MDataStd_UAttributeStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: UAttribute from TDataStd.

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


%make_alias(MDataStd_UAttributeStorageDriver)

%extend MDataStd_UAttributeStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_VariableRetrievalDriver;
class MDataStd_VariableRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_VariableRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_VariableRetrievalDriver;
		 MDataStd_VariableRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Variable from PDataStd.

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


%make_alias(MDataStd_VariableRetrievalDriver)

%extend MDataStd_VariableRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_VariableStorageDriver;
class MDataStd_VariableStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_VariableStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_VariableStorageDriver;
		 MDataStd_VariableStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Variable from TDataStd.

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


%make_alias(MDataStd_VariableStorageDriver)

%extend MDataStd_VariableStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
