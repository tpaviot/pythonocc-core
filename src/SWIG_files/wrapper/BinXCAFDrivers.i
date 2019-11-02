/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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

/*
This file was automatically generated using the pythonocc_generator, see
https://github.com/tpaviot/pythonocc-generator.

This file is platform independant, but was generated under the following
conditions:

- time : 2019-11-03 11:38:46
- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define BINXCAFDRIVERSDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=BINXCAFDRIVERSDOCSTRING) BinXCAFDrivers

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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


%include BinXCAFDrivers_headers.i

/* public enums */
/* end public enums declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/* handles */
%wrap_handle(BinXCAFDrivers_DocumentRetrievalDriver)
%wrap_handle(BinXCAFDrivers_DocumentStorageDriver)
/* end handles declaration */

%rename(binxcafdrivers) BinXCAFDrivers;
%nodefaultctor BinXCAFDrivers;
class BinXCAFDrivers {
	public:
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "	* Creates the table of drivers of types supported

	:param MsgDrv:
	:type MsgDrv: opencascade::handle<Message_Messenger> &
	:rtype: opencascade::handle<BinMDF_ADriverTable>
") AttributeDrivers;
		static opencascade::handle<BinMDF_ADriverTable> AttributeDrivers (const opencascade::handle<Message_Messenger> & MsgDrv);
		%feature("compactdefaultargs") DefineFormat;
		%feature("autodoc", "	* Defines format 'BinXCAF' and registers its read and write drivers in the specified application

	:param theApp:
	:type theApp: opencascade::handle<TDocStd_Application> &
	:rtype: void
") DefineFormat;
		static void DefineFormat (const opencascade::handle<TDocStd_Application> & theApp);
		%feature("compactdefaultargs") Factory;
		%feature("autodoc", "	:param theGUID:
	:type theGUID: Standard_GUID &
	:rtype: opencascade::handle<Standard_Transient>
") Factory;
		static const opencascade::handle<Standard_Transient> & Factory (const Standard_GUID & theGUID);
};


%extend BinXCAFDrivers {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinXCAFDrivers_DocumentRetrievalDriver;
class BinXCAFDrivers_DocumentRetrievalDriver : public BinDrivers_DocumentRetrievalDriver {
	public:
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: opencascade::handle<Message_Messenger> &
	:rtype: opencascade::handle<BinMDF_ADriverTable>
") AttributeDrivers;
		virtual opencascade::handle<BinMDF_ADriverTable> AttributeDrivers (const opencascade::handle<Message_Messenger> & theMsgDriver);
		%feature("compactdefaultargs") BinXCAFDrivers_DocumentRetrievalDriver;
		%feature("autodoc", "	* Constructor

	:rtype: None
") BinXCAFDrivers_DocumentRetrievalDriver;
		 BinXCAFDrivers_DocumentRetrievalDriver ();
};


%make_alias(BinXCAFDrivers_DocumentRetrievalDriver)

%extend BinXCAFDrivers_DocumentRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinXCAFDrivers_DocumentStorageDriver;
class BinXCAFDrivers_DocumentStorageDriver : public BinDrivers_DocumentStorageDriver {
	public:
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: opencascade::handle<Message_Messenger> &
	:rtype: opencascade::handle<BinMDF_ADriverTable>
") AttributeDrivers;
		virtual opencascade::handle<BinMDF_ADriverTable> AttributeDrivers (const opencascade::handle<Message_Messenger> & theMsgDriver);
		%feature("compactdefaultargs") BinXCAFDrivers_DocumentStorageDriver;
		%feature("autodoc", "	* Constructor

	:rtype: None
") BinXCAFDrivers_DocumentStorageDriver;
		 BinXCAFDrivers_DocumentStorageDriver ();
};


%make_alias(BinXCAFDrivers_DocumentStorageDriver)

%extend BinXCAFDrivers_DocumentStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
