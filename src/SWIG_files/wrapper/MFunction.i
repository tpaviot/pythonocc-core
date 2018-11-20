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
%define MFUNCTIONDOCSTRING
""
%enddef
%module (package="OCC.Core", docstring=MFUNCTIONDOCSTRING) MFunction

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


%include MFunction_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%wrap_handle(MFunction_FunctionRetrievalDriver)
%wrap_handle(MFunction_FunctionStorageDriver)

%rename(mfunction) MFunction;
class MFunction {
	public:
		%feature("compactdefaultargs") AddStorageDrivers;
		%feature("autodoc", "	* Adds the function storage driver to <aDriverSeq>.

	:param aDriverSeq:
	:type aDriverSeq: Handle_MDF_ASDriverHSequence &
	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: void
") AddStorageDrivers;
		static void AddStorageDrivers (const Handle_MDF_ASDriverHSequence & aDriverSeq,const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") AddRetrievalDrivers;
		%feature("autodoc", "	* Adds the function retrieval driver to <aDriverSeq>.

	:param aDriverSeq:
	:type aDriverSeq: Handle_MDF_ARDriverHSequence &
	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: void
") AddRetrievalDrivers;
		static void AddRetrievalDrivers (const Handle_MDF_ARDriverHSequence & aDriverSeq,const Handle_CDM_MessageDriver & theMessageDriver);
};


%extend MFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MFunction_FunctionRetrievalDriver;
class MFunction_FunctionRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MFunction_FunctionRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MFunction_FunctionRetrievalDriver;
		 MFunction_FunctionRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%make_alias(MFunction_FunctionRetrievalDriver)

%extend MFunction_FunctionRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MFunction_FunctionStorageDriver;
class MFunction_FunctionStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MFunction_FunctionStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MFunction_FunctionStorageDriver;
		 MFunction_FunctionStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%make_alias(MFunction_FunctionStorageDriver)

%extend MFunction_FunctionStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
