/*
Copyright 2008-2022 Thomas Paviot (tpaviot@gmail.com)

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
%define BINLDRIVERSDOCSTRING
"BinLDrivers module, see official documentation at
https://www.opencascade.com/doc/occt-7.7.0/refman/html/package_binldrivers.html"
%enddef
%module (package="OCC.Core", docstring=BINLDRIVERSDOCSTRING) BinLDrivers


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<BinLDrivers_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Message_module.hxx>
#include<BinMDF_module.hxx>
#include<TDocStd_module.hxx>
#include<PCDM_module.hxx>
#include<TCollection_module.hxx>
#include<CDM_module.hxx>
#include<Storage_module.hxx>
#include<Resource_module.hxx>
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
%import PCDM.i
%import TCollection.i
%import CDM.i
%import Storage.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum BinLDrivers_Marker {
	BinLDrivers_ENDATTRLIST = - 1,
	BinLDrivers_ENDLABEL = - 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class BinLDrivers_Marker(IntEnum):
	BinLDrivers_ENDATTRLIST = - 1
	BinLDrivers_ENDLABEL = - 2
BinLDrivers_ENDATTRLIST = BinLDrivers_Marker.BinLDrivers_ENDATTRLIST
BinLDrivers_ENDLABEL = BinLDrivers_Marker.BinLDrivers_ENDLABEL
};
/* end python proxy for enums */

/* handles */
%wrap_handle(BinLDrivers_DocumentRetrievalDriver)
%wrap_handle(BinLDrivers_DocumentStorageDriver)
/* end handles declaration */

/* templates */
%template(BinLDrivers_VectorOfDocumentSection) NCollection_Vector<BinLDrivers_DocumentSection>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Vector<BinLDrivers_DocumentSection> BinLDrivers_VectorOfDocumentSection;
/* end typedefs declaration */

/********************
* class BinLDrivers *
********************/
%rename(binldrivers) BinLDrivers;
class BinLDrivers {
	public:
		/****************** AttributeDrivers ******************/
		/**** md5 signature: a3052842141074dac4fa7742d5b7f7f0 ****/
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "
Parameters
----------
MsgDrv: Message_Messenger

Return
-------
opencascade::handle<BinMDF_ADriverTable>

Description
-----------
Creates a table of the supported drivers' types.
") AttributeDrivers;
		static opencascade::handle<BinMDF_ADriverTable> AttributeDrivers(const opencascade::handle<Message_Messenger> & MsgDrv);

		/****************** DefineFormat ******************/
		/**** md5 signature: 2ae4ef4b935d04445595a5553ed3615b ****/
		%feature("compactdefaultargs") DefineFormat;
		%feature("autodoc", "
Parameters
----------
theApp: TDocStd_Application

Return
-------
None

Description
-----------
Defines format 'binlocaf' and registers its read and write drivers in the specified application.
") DefineFormat;
		static void DefineFormat(const opencascade::handle<TDocStd_Application> & theApp);

		/****************** Factory ******************/
		/**** md5 signature: 9e70ed3bca71e988f9b9e86628ed8ed4 ****/
		%feature("compactdefaultargs") Factory;
		%feature("autodoc", "
Parameters
----------
theGUID: Standard_GUID

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
No available documentation.
") Factory;
		static const opencascade::handle<Standard_Transient> & Factory(const Standard_GUID & theGUID);

};


%extend BinLDrivers {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class BinLDrivers_DocumentRetrievalDriver *
********************************************/
class BinLDrivers_DocumentRetrievalDriver : public PCDM_RetrievalDriver {
	public:
		/****************** BinLDrivers_DocumentRetrievalDriver ******************/
		/**** md5 signature: 6e9f45f3c968879f6eba97c7d8d3db55 ****/
		%feature("compactdefaultargs") BinLDrivers_DocumentRetrievalDriver;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") BinLDrivers_DocumentRetrievalDriver;
		 BinLDrivers_DocumentRetrievalDriver();

		/****************** AttributeDrivers ******************/
		/**** md5 signature: f05b53d6e03fc4c0b1a43a8f6b8dcd60 ****/
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "
Parameters
----------
theMsgDriver: Message_Messenger

Return
-------
opencascade::handle<BinMDF_ADriverTable>

Description
-----------
No available documentation.
") AttributeDrivers;
		virtual opencascade::handle<BinMDF_ADriverTable> AttributeDrivers(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** Read ******************/
		/**** md5 signature: f7b8bb13afb113e0cba89338b8e12a06 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theFileName: str
theNewDocument: CDM_Document
theApplication: CDM_Application
theFilter: PCDM_ReaderFilter (optional, default to opencascade::handle<PCDM_ReaderFilter>())
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Retrieves the content of the file into a new document.
") Read;
		virtual void Read(TCollection_ExtendedString theFileName, const opencascade::handle<CDM_Document> & theNewDocument, const opencascade::handle<CDM_Application> & theApplication, const opencascade::handle<PCDM_ReaderFilter> & theFilter = opencascade::handle<PCDM_ReaderFilter>(), const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%make_alias(BinLDrivers_DocumentRetrievalDriver)

%extend BinLDrivers_DocumentRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BinLDrivers_DocumentSection *
************************************/
class BinLDrivers_DocumentSection {
	public:
		/****************** BinLDrivers_DocumentSection ******************/
		/**** md5 signature: 4df81d4eb430d1816f9561d46f3e2c09 ****/
		%feature("compactdefaultargs") BinLDrivers_DocumentSection;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BinLDrivers_DocumentSection;
		 BinLDrivers_DocumentSection();

		/****************** BinLDrivers_DocumentSection ******************/
		/**** md5 signature: 5df5ec4768b7b05db6c9bd02b54b7460 ****/
		%feature("compactdefaultargs") BinLDrivers_DocumentSection;
		%feature("autodoc", "
Parameters
----------
theName: str
isPostRead: bool

Return
-------
None

Description
-----------
Constructor.
") BinLDrivers_DocumentSection;
		 BinLDrivers_DocumentSection(TCollection_AsciiString theName, const Standard_Boolean isPostRead);

		/****************** IsPostRead ******************/
		/**** md5 signature: f46b74fd06908e5a3c055dc46ad8d664 ****/
		%feature("compactdefaultargs") IsPostRead;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Query the status: if the section should be read after ocaf; false means that the section is read before starting to read ocaf data.
") IsPostRead;
		Standard_Boolean IsPostRead();

		/****************** Length ******************/
		/**** md5 signature: a276bfb2e4981ebb39eafe742d6a95f4 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
uint64_t

Description
-----------
Query the length of the section in the persistent file.
") Length;
		uint64_t Length();

		/****************** Name ******************/
		/**** md5 signature: 8e64a3d42cb69d5f0c279aca58e35ec7 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Query the name of the section.
") Name;
		const TCollection_AsciiString & Name();

		/****************** Offset ******************/
		/**** md5 signature: bf9bc651dd4a129b761429957eb0a0a6 ****/
		%feature("compactdefaultargs") Offset;
		%feature("autodoc", "Return
-------
uint64_t

Description
-----------
Query the offset of the section in the persistent file.
") Offset;
		uint64_t Offset();

		/****************** SetLength ******************/
		/**** md5 signature: 9c89e70c52c75c8f071a4a8b0807f508 ****/
		%feature("compactdefaultargs") SetLength;
		%feature("autodoc", "
Parameters
----------
theLength: uint64_t

Return
-------
None

Description
-----------
Set the length of the section in the persistent file.
") SetLength;
		void SetLength(const uint64_t theLength);

		/****************** SetOffset ******************/
		/**** md5 signature: 611eebeca4349b02d49fcf9ef5e8b099 ****/
		%feature("compactdefaultargs") SetOffset;
		%feature("autodoc", "
Parameters
----------
theOffset: uint64_t

Return
-------
None

Description
-----------
Set the offset of the section in the persistent file.
") SetOffset;
		void SetOffset(const uint64_t theOffset);

};


%extend BinLDrivers_DocumentSection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class BinLDrivers_DocumentStorageDriver *
******************************************/
class BinLDrivers_DocumentStorageDriver : public PCDM_StorageDriver {
	public:
		/****************** BinLDrivers_DocumentStorageDriver ******************/
		/**** md5 signature: adfab2843bd0d5f2537c778fb6521d51 ****/
		%feature("compactdefaultargs") BinLDrivers_DocumentStorageDriver;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") BinLDrivers_DocumentStorageDriver;
		 BinLDrivers_DocumentStorageDriver();

		/****************** AddSection ******************/
		/**** md5 signature: e2d4b6520ba2b320f1fcf33087c443c7 ****/
		%feature("compactdefaultargs") AddSection;
		%feature("autodoc", "
Parameters
----------
theName: str
isPostRead: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Create a section that should be written after the ocaf data.
") AddSection;
		void AddSection(TCollection_AsciiString theName, const Standard_Boolean isPostRead = Standard_True);

		/****************** AttributeDrivers ******************/
		/**** md5 signature: f05b53d6e03fc4c0b1a43a8f6b8dcd60 ****/
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "
Parameters
----------
theMsgDriver: Message_Messenger

Return
-------
opencascade::handle<BinMDF_ADriverTable>

Description
-----------
No available documentation.
") AttributeDrivers;
		virtual opencascade::handle<BinMDF_ADriverTable> AttributeDrivers(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** IsQuickPart ******************/
		/**** md5 signature: 6353ee4c7a025e5e9aa62fb9950e7e78 ****/
		%feature("compactdefaultargs") IsQuickPart;
		%feature("autodoc", "
Parameters
----------
theVersion: int

Return
-------
bool

Description
-----------
Return true if document should be stored in quick mode for partial reading.
") IsQuickPart;
		Standard_Boolean IsQuickPart(const Standard_Integer theVersion);

		/****************** Write ******************/
		/**** md5 signature: 3ba5a4920118cfb01ca7cb6e94265c60 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theDocument: CDM_Document
theFileName: str
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Write <thedocument> to the binary file <thefilename>.
") Write;
		virtual void Write(const opencascade::handle<CDM_Document> & theDocument, TCollection_ExtendedString theFileName, const Message_ProgressRange & theRange = Message_ProgressRange());

};


%make_alias(BinLDrivers_DocumentStorageDriver)

%extend BinLDrivers_DocumentStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def binldrivers_AttributeDrivers(*args):
	return binldrivers.AttributeDrivers(*args)

@deprecated
def binldrivers_DefineFormat(*args):
	return binldrivers.DefineFormat(*args)

@deprecated
def binldrivers_Factory(*args):
	return binldrivers.Factory(*args)

}
