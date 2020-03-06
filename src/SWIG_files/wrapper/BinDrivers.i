/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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
%define BINDRIVERSDOCSTRING
"BinDrivers module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_bindrivers.html"
%enddef
%module (package="OCC.Core", docstring=BINDRIVERSDOCSTRING) BinDrivers


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


%{
#include<BinDrivers_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Message_module.hxx>
#include<BinMDF_module.hxx>
#include<TDocStd_module.hxx>
#include<TCollection_module.hxx>
#include<BinLDrivers_module.hxx>
#include<Storage_module.hxx>
#include<Resource_module.hxx>
#include<PCDM_module.hxx>
#include<LDOM_module.hxx>
#include<TDF_module.hxx>
#include<CDF_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Message.i
%import BinMDF.i
%import TDocStd.i
%import TCollection.i
%import BinLDrivers.i
%import Storage.i

%pythoncode {
from OCC.Core.Exception import *
};

/* public enums */
enum BinDrivers_Marker {
	BinDrivers_ENDATTRLIST = - 1,
	BinDrivers_ENDLABEL = - 2,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class BinDrivers_Marker:
	BinDrivers_ENDATTRLIST = - 1
	BinDrivers_ENDLABEL = - 2
};
/* end python proxy for enums */

/* handles */
%wrap_handle(BinDrivers_DocumentRetrievalDriver)
%wrap_handle(BinDrivers_DocumentStorageDriver)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*******************
* class BinDrivers *
*******************/
%rename(bindrivers) BinDrivers;
class BinDrivers {
	public:
		/****************** AttributeDrivers ******************/
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "Creates the table of drivers of types supported.

Parameters
----------
MsgDrv: Message_Messenger

Returns
-------
opencascade::handle<BinMDF_ADriverTable>
") AttributeDrivers;
		static opencascade::handle<BinMDF_ADriverTable> AttributeDrivers(const opencascade::handle<Message_Messenger> & MsgDrv);

		/****************** DefineFormat ******************/
		%feature("compactdefaultargs") DefineFormat;
		%feature("autodoc", "Defines format 'binocaf' and registers its read and write drivers in the specified application.

Parameters
----------
theApp: TDocStd_Application

Returns
-------
None
") DefineFormat;
		static void DefineFormat(const opencascade::handle<TDocStd_Application> & theApp);

		/****************** Factory ******************/
		%feature("compactdefaultargs") Factory;
		%feature("autodoc", "No available documentation.

Parameters
----------
theGUID: Standard_GUID

Returns
-------
opencascade::handle<Standard_Transient>
") Factory;
		static const opencascade::handle<Standard_Transient> & Factory(const Standard_GUID & theGUID);

		/****************** StorageVersion ******************/
		%feature("compactdefaultargs") StorageVersion;
		%feature("autodoc", "Returns '1'.

Returns
-------
TCollection_AsciiString
") StorageVersion;
		static TCollection_AsciiString StorageVersion();

};


%extend BinDrivers {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class BinDrivers_DocumentRetrievalDriver *
*******************************************/
class BinDrivers_DocumentRetrievalDriver : public BinLDrivers_DocumentRetrievalDriver {
	public:
		/****************** BinDrivers_DocumentRetrievalDriver ******************/
		%feature("compactdefaultargs") BinDrivers_DocumentRetrievalDriver;
		%feature("autodoc", "Constructor.

Returns
-------
None
") BinDrivers_DocumentRetrievalDriver;
		 BinDrivers_DocumentRetrievalDriver();

		/****************** AttributeDrivers ******************/
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMsgDriver: Message_Messenger

Returns
-------
opencascade::handle<BinMDF_ADriverTable>
") AttributeDrivers;
		virtual opencascade::handle<BinMDF_ADriverTable> AttributeDrivers(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the namedshape driver.

Returns
-------
None
") Clear;
		virtual void Clear();

};


%make_alias(BinDrivers_DocumentRetrievalDriver)

%extend BinDrivers_DocumentRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class BinDrivers_DocumentStorageDriver *
*****************************************/
class BinDrivers_DocumentStorageDriver : public BinLDrivers_DocumentStorageDriver {
	public:
		/****************** BinDrivers_DocumentStorageDriver ******************/
		%feature("compactdefaultargs") BinDrivers_DocumentStorageDriver;
		%feature("autodoc", "Constructor.

Returns
-------
None
") BinDrivers_DocumentStorageDriver;
		 BinDrivers_DocumentStorageDriver();

		/****************** AttributeDrivers ******************/
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMsgDriver: Message_Messenger

Returns
-------
opencascade::handle<BinMDF_ADriverTable>
") AttributeDrivers;
		virtual opencascade::handle<BinMDF_ADriverTable> AttributeDrivers(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** IsWithTriangles ******************/
		%feature("compactdefaultargs") IsWithTriangles;
		%feature("autodoc", "Return true if shape should be stored with triangles.

Returns
-------
bool
") IsWithTriangles;
		Standard_Boolean IsWithTriangles();

		/****************** SetWithTriangles ******************/
		%feature("compactdefaultargs") SetWithTriangles;
		%feature("autodoc", "Set if triangulation should be stored or not.

Parameters
----------
theMessageDriver: Message_Messenger
theWithTriangulation: bool

Returns
-------
None
") SetWithTriangles;
		void SetWithTriangles(const opencascade::handle<Message_Messenger> & theMessageDriver, const Standard_Boolean theWithTriangulation);

};


%make_alias(BinDrivers_DocumentStorageDriver)

%extend BinDrivers_DocumentStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
