/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
%define TDOCSTDDOCSTRING
"TDocStd module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_tdocstd.html"
%enddef
%module (package="OCC.Core", docstring=TDOCSTDDOCSTRING) TDocStd


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
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<TDocStd_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TDF_module.hxx>
#include<CDF_module.hxx>
#include<TCollection_module.hxx>
#include<PCDM_module.hxx>
#include<CDM_module.hxx>
#include<Message_module.hxx>
#include<TColStd_module.hxx>
#include<Resource_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TDF.i
%import CDF.i
%import TCollection.i
%import PCDM.i
%import CDM.i
%import Message.i
%import TColStd.i
%import Resource.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum TDocStd_FormatVersion {
	TDocStd_FormatVersion_VERSION_2 = 2,
	TDocStd_FormatVersion_VERSION_3 = 3,
	TDocStd_FormatVersion_VERSION_4 = 4,
	TDocStd_FormatVersion_VERSION_5 = 5,
	TDocStd_FormatVersion_VERSION_6 = 6,
	TDocStd_FormatVersion_VERSION_7 = 7,
	TDocStd_FormatVersion_VERSION_8 = 8,
	TDocStd_FormatVersion_VERSION_9 = 9,
	TDocStd_FormatVersion_VERSION_10 = 10,
	TDocStd_FormatVersion_VERSION_11 = 11,
	TDocStd_FormatVersion_VERSION_12 = 12,
	TDocStd_FormatVersion_CURRENT = TDocStd_FormatVersion_VERSION_12,
};

enum  {
	TDocStd_FormatVersion_LOWER = TDocStd_FormatVersion_VERSION_2,
	TDocStd_FormatVersion_UPPER = TDocStd_FormatVersion_VERSION_12,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class TDocStd_FormatVersion(IntEnum):
	TDocStd_FormatVersion_VERSION_2 = 2
	TDocStd_FormatVersion_VERSION_3 = 3
	TDocStd_FormatVersion_VERSION_4 = 4
	TDocStd_FormatVersion_VERSION_5 = 5
	TDocStd_FormatVersion_VERSION_6 = 6
	TDocStd_FormatVersion_VERSION_7 = 7
	TDocStd_FormatVersion_VERSION_8 = 8
	TDocStd_FormatVersion_VERSION_9 = 9
	TDocStd_FormatVersion_VERSION_10 = 10
	TDocStd_FormatVersion_VERSION_11 = 11
	TDocStd_FormatVersion_VERSION_12 = 12
	TDocStd_FormatVersion_CURRENT = TDocStd_FormatVersion_VERSION_12
TDocStd_FormatVersion_VERSION_2 = TDocStd_FormatVersion.TDocStd_FormatVersion_VERSION_2
TDocStd_FormatVersion_VERSION_3 = TDocStd_FormatVersion.TDocStd_FormatVersion_VERSION_3
TDocStd_FormatVersion_VERSION_4 = TDocStd_FormatVersion.TDocStd_FormatVersion_VERSION_4
TDocStd_FormatVersion_VERSION_5 = TDocStd_FormatVersion.TDocStd_FormatVersion_VERSION_5
TDocStd_FormatVersion_VERSION_6 = TDocStd_FormatVersion.TDocStd_FormatVersion_VERSION_6
TDocStd_FormatVersion_VERSION_7 = TDocStd_FormatVersion.TDocStd_FormatVersion_VERSION_7
TDocStd_FormatVersion_VERSION_8 = TDocStd_FormatVersion.TDocStd_FormatVersion_VERSION_8
TDocStd_FormatVersion_VERSION_9 = TDocStd_FormatVersion.TDocStd_FormatVersion_VERSION_9
TDocStd_FormatVersion_VERSION_10 = TDocStd_FormatVersion.TDocStd_FormatVersion_VERSION_10
TDocStd_FormatVersion_VERSION_11 = TDocStd_FormatVersion.TDocStd_FormatVersion_VERSION_11
TDocStd_FormatVersion_VERSION_12 = TDocStd_FormatVersion.TDocStd_FormatVersion_VERSION_12
TDocStd_FormatVersion_CURRENT = TDocStd_FormatVersion.TDocStd_FormatVersion_CURRENT
};
/* end python proxy for enums */

/* handles */
%wrap_handle(TDocStd_Application)
%wrap_handle(TDocStd_ApplicationDelta)
%wrap_handle(TDocStd_CompoundDelta)
%wrap_handle(TDocStd_Document)
%wrap_handle(TDocStd_Modified)
%wrap_handle(TDocStd_MultiTransactionManager)
%wrap_handle(TDocStd_Owner)
%wrap_handle(TDocStd_XLink)
%wrap_handle(TDocStd_XLinkRoot)
/* end handles declaration */

/* templates */
%template(TDocStd_LabelIDMapDataMap) NCollection_DataMap<TDF_Label,TDF_IDMap>;
%template(TDocStd_SequenceOfApplicationDelta) NCollection_Sequence<opencascade::handle<TDocStd_ApplicationDelta>>;

%extend NCollection_Sequence<opencascade::handle<TDocStd_ApplicationDelta>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TDocStd_SequenceOfDocument) NCollection_Sequence<opencascade::handle<TDocStd_Document>>;

%extend NCollection_Sequence<opencascade::handle<TDocStd_Document>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TDF_Label, TDF_IDMap>::Iterator TDocStd_DataMapIteratorOfLabelIDMapDataMap;
typedef NCollection_DataMap<TDF_Label, TDF_IDMap> TDocStd_LabelIDMapDataMap;
typedef NCollection_Sequence<opencascade::handle<TDocStd_ApplicationDelta>> TDocStd_SequenceOfApplicationDelta;
typedef NCollection_Sequence<opencascade::handle<TDocStd_Document>> TDocStd_SequenceOfDocument;
typedef TDocStd_XLink * TDocStd_XLinkPtr;
/* end typedefs declaration */

/****************
* class TDocStd *
****************/
%rename(tdocstd) TDocStd;
class TDocStd {
	public:
		/****** TDocStd::IDList ******/
		/****** md5 signature: 97de0b35f4f6abc04a631c65d32bacc4 ******/
		%feature("compactdefaultargs") IDList;
		%feature("autodoc", "
Parameters
----------
anIDList: TDF_IDList

Return
-------
None

Description
-----------
Specific guid of this package ============================= appends to <anidlist> the list of the attributes ids of this package. caution: <anidlist> is not cleared before use.
") IDList;
		static void IDList(TDF_IDList & anIDList);

};


%extend TDocStd {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TDocStd_Application *
****************************/
class TDocStd_Application : public CDF_Application {
	public:
		/****** TDocStd_Application::TDocStd_Application ******/
		/****** md5 signature: 982d624ff6cdf5e6505f5f02b28e1e9a ******/
		%feature("compactdefaultargs") TDocStd_Application;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs the new instance and registers it in cdm_session.
") TDocStd_Application;
		 TDocStd_Application();

		/****** TDocStd_Application::Close ******/
		/****** md5 signature: bad5f66ca849c7ea92bfcfed7778e138 ******/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "
Parameters
----------
aDoc: TDocStd_Document

Return
-------
None

Description
-----------
Close the given document. the document is not any more handled by the applicative session.
") Close;
		void Close(const opencascade::handle<TDocStd_Document> & aDoc);

		/****** TDocStd_Application::DefineFormat ******/
		/****** md5 signature: 07b8da6e7e82c945f3bf47307b8b5afb ******/
		%feature("compactdefaultargs") DefineFormat;
		%feature("autodoc", "
Parameters
----------
theFormat: str
theDescription: str
theExtension: str
theReader: PCDM_RetrievalDriver
theWriter: PCDM_StorageDriver

Return
-------
None

Description
-----------
Sets up resources and registers read and storage drivers for the specified format. @param theformat - unique name for the format, used to identify it. @param thedescription - textual description of the format. @param theextension - extension of the files in that format. the same extension can be used by several formats. @param thereader - instance of the read driver for the format.  null value is allowed (no possibility to read). @param thewriter - instance of the write driver for the format.  null value is allowed (no possibility to write).
") DefineFormat;
		void DefineFormat(TCollection_AsciiString theFormat, TCollection_AsciiString theDescription, TCollection_AsciiString theExtension, const opencascade::handle<PCDM_RetrievalDriver> & theReader, const opencascade::handle<PCDM_StorageDriver> & theWriter);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** TDocStd_Application::GetDocument ******/
		/****** md5 signature: 15b7beb5a9532b9cd3868298ccdb9245 ******/
		%feature("compactdefaultargs") GetDocument;
		%feature("autodoc", "
Parameters
----------
index: int
aDoc: TDocStd_Document

Return
-------
None

Description
-----------
Constructs the new document adoc. adoc is identified by the index index which is any integer between 1 and n where n is the number of documents returned by nbdocument. example opencascade::handle<tdocstd_application> anapp; if (!caftest::find(a)) return 1; opencascade::handle<tdocstd> adoc; standard_integer nbdoc = anapp->nbdocuments(); for (standard_integer i = 1; i <= nbdoc; i++) { aapp->getdocument(i,adoc);.
") GetDocument;
		void GetDocument(const Standard_Integer index, opencascade::handle<TDocStd_Document> & aDoc);

		/****** TDocStd_Application::InitDocument ******/
		/****** md5 signature: cb8b1250bf5bfec47bac72c3724adc69 ******/
		%feature("compactdefaultargs") InitDocument;
		%feature("autodoc", "
Parameters
----------
aDoc: CDM_Document

Return
-------
None

Description
-----------
Initialize the document adoc for the applicative session. this virtual function is called by newdocument and is to be redefined for each specific application. modified flag (different of disk version) ============= to open/save a document =======================.
") InitDocument;
		virtual void InitDocument(const opencascade::handle<CDM_Document> & aDoc);

		/****** TDocStd_Application::IsDriverLoaded ******/
		/****** md5 signature: ce5001e98f2a57f66a3f7e6514b3374d ******/
		%feature("compactdefaultargs") IsDriverLoaded;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Check if meta data driver was successfully loaded by the application constructor.
") IsDriverLoaded;
		Standard_Boolean IsDriverLoaded();

		/****** TDocStd_Application::IsInSession ******/
		/****** md5 signature: 3d147ee90a50e9855b5c982d010e4c9f ******/
		%feature("compactdefaultargs") IsInSession;
		%feature("autodoc", "
Parameters
----------
path: str

Return
-------
int

Description
-----------
Returns an index for the document found in the path path in this applicative session. if the returned value is 0, the document is not present in the applicative session. this method can be used for the interactive part of an application. for instance, on a call to open, the document to be opened may already be in memory. isinsession checks to see if this is the case. open can be made to depend on the value of the index returned: if isinsession returns 0, the document is opened; if it returns another value, a message is displayed asking the user if he wants to override the version of the document in memory. example: standard_integer insession = a->isinsession(adoc); if (insession > 0) { std::cout << 'document ' << insession << ' is already in session' << std::endl; return 0; }.
") IsInSession;
		Standard_Integer IsInSession(TCollection_ExtendedString path);

		/****** TDocStd_Application::NbDocuments ******/
		/****** md5 signature: 962bf94556b581ec6396ebefd0c99d4c ******/
		%feature("compactdefaultargs") NbDocuments;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of documents handled by the current applicative session.
") NbDocuments;
		Standard_Integer NbDocuments();

		/****** TDocStd_Application::NewDocument ******/
		/****** md5 signature: 286edb8ff55901567cc19085406b6fa3 ******/
		%feature("compactdefaultargs") NewDocument;
		%feature("autodoc", "
Parameters
----------
format: str
aDoc: CDM_Document

Return
-------
None

Description
-----------
Constructs the empty new document adoc. this document will have the format format. if initdocument is redefined for a specific application, the new document is handled by the applicative session.
") NewDocument;
		virtual void NewDocument(TCollection_ExtendedString format, opencascade::handle<CDM_Document> & aDoc);

		/****** TDocStd_Application::NewDocument ******/
		/****** md5 signature: 304cba09d9f9b321dcbffa19f8ee14a3 ******/
		%feature("compactdefaultargs") NewDocument;
		%feature("autodoc", "
Parameters
----------
format: str
aDoc: TDocStd_Document

Return
-------
None

Description
-----------
A non-virtual method taking a tdocstd_documment object as an input. internally it calls a virtual method newdocument() with cdm_document object.
") NewDocument;
		void NewDocument(TCollection_ExtendedString format, opencascade::handle<TDocStd_Document> & aDoc);

		/****** TDocStd_Application::OnAbortTransaction ******/
		/****** md5 signature: 307f163969480bb723f66d714329e2ba ******/
		%feature("compactdefaultargs") OnAbortTransaction;
		%feature("autodoc", "
Parameters
----------
theDoc: TDocStd_Document

Return
-------
None

Description
-----------
Notification that is fired at each aborttransaction event.
") OnAbortTransaction;
		virtual void OnAbortTransaction(const opencascade::handle<TDocStd_Document> & theDoc);

		/****** TDocStd_Application::OnCommitTransaction ******/
		/****** md5 signature: 6e8544a4b1abdfb75243529c55e4c173 ******/
		%feature("compactdefaultargs") OnCommitTransaction;
		%feature("autodoc", "
Parameters
----------
theDoc: TDocStd_Document

Return
-------
None

Description
-----------
Notification that is fired at each committransaction event.
") OnCommitTransaction;
		virtual void OnCommitTransaction(const opencascade::handle<TDocStd_Document> & theDoc);

		/****** TDocStd_Application::OnOpenTransaction ******/
		/****** md5 signature: c63f4a5fcfe6f38088502651361c4ec0 ******/
		%feature("compactdefaultargs") OnOpenTransaction;
		%feature("autodoc", "
Parameters
----------
theDoc: TDocStd_Document

Return
-------
None

Description
-----------
Notification that is fired at each opentransaction event.
") OnOpenTransaction;
		virtual void OnOpenTransaction(const opencascade::handle<TDocStd_Document> & theDoc);

		/****** TDocStd_Application::Open ******/
		/****** md5 signature: d156d2aa3a0dc1286af38a715d227db6 ******/
		%feature("compactdefaultargs") Open;
		%feature("autodoc", "
Parameters
----------
thePath: str
theDoc: TDocStd_Document
theFilter: PCDM_ReaderFilter
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
PCDM_ReaderStatus

Description
-----------
Retrieves the document from specified file. in order not to override a version of the document which is already in memory, this method can be made to depend on the value returned by isinsession. @param[in] thepath file path to open @param[out] thedoc result document @param[in] thefilter optional filter to skip attributes or parts of the retrieved tree @param[in] therange optional progress indicator return reading status.
") Open;
		PCDM_ReaderStatus Open(TCollection_ExtendedString thePath, opencascade::handle<TDocStd_Document> & theDoc, const opencascade::handle<PCDM_ReaderFilter> & theFilter, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** TDocStd_Application::Open ******/
		/****** md5 signature: b45b12c15fac1f822dd6f693c26d27ce ******/
		%feature("compactdefaultargs") Open;
		%feature("autodoc", "
Parameters
----------
thePath: str
theDoc: TDocStd_Document
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
PCDM_ReaderStatus

Description
-----------
Retrieves the document from specified file. in order not to override a version of the document which is already in memory, this method can be made to depend on the value returned by isinsession. @param[in] thepath file path to open @param[out] thedoc result document @param[in] therange optional progress indicator return reading status.
") Open;
		PCDM_ReaderStatus Open(TCollection_ExtendedString thePath, opencascade::handle<TDocStd_Document> & theDoc, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** TDocStd_Application::Open ******/
		/****** md5 signature: 0ef7ff81a9f94d40a9c406ad8408cc09 ******/
		%feature("compactdefaultargs") Open;
		%feature("autodoc", "
Parameters
----------
theIStream: str
theDoc: TDocStd_Document
theFilter: PCDM_ReaderFilter
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
PCDM_ReaderStatus

Description
-----------
Retrieves document from standard stream. @param[in,out] theistream input seekable stream @param[out] thedoc result document @param[in] thefilter optional filter to skip attributes or parts of the retrieved tree @param[in] therange optional progress indicator return reading status.
") Open;
		PCDM_ReaderStatus Open(std::istream & theIStream, opencascade::handle<TDocStd_Document> & theDoc, const opencascade::handle<PCDM_ReaderFilter> & theFilter, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** TDocStd_Application::Open ******/
		/****** md5 signature: 08fc54e2a4001e3e0afb35cd9d37fb13 ******/
		%feature("compactdefaultargs") Open;
		%feature("autodoc", "
Parameters
----------
theIStream: str
theDoc: TDocStd_Document
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
PCDM_ReaderStatus

Description
-----------
Retrieves document from standard stream. @param[in,out] theistream input seekable stream @param[out] thedoc result document @param[in] therange optional progress indicator return reading status.
") Open;
		PCDM_ReaderStatus Open(std::istream & theIStream, opencascade::handle<TDocStd_Document> & theDoc, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** TDocStd_Application::ReadingFormats ******/
		/****** md5 signature: 6dff661583c284b08e2b917089276643 ******/
		%feature("compactdefaultargs") ReadingFormats;
		%feature("autodoc", "
Parameters
----------
theFormats: TColStd_SequenceOfAsciiString

Return
-------
None

Description
-----------
Returns the sequence of reading formats supported by the application. //! @param theformats - sequence of reading formats. output parameter.
") ReadingFormats;
		void ReadingFormats(TColStd_SequenceOfAsciiString & theFormats);

		/****** TDocStd_Application::Resources ******/
		/****** md5 signature: 69ca16cd0321dc8bb777384aea250771 ******/
		%feature("compactdefaultargs") Resources;
		%feature("autodoc", "Return
-------
opencascade::handle<Resource_Manager>

Description
-----------
Returns resource manager defining supported persistent formats. //! default implementation loads resource file with name resourcesname(), unless field myresources is already initialized (either by previous call or in any other way). //! the resource manager should define: //! * format name for each file extension supported: - [extension].fileformat: [format] //! * for each format supported (as returned by formats()), its extension, description string, and (when applicable) guids of storage and retrieval plugins: - [format].description: [description] - [format].fileextension: [extension] - [format].retrievalplugin: [guid] (optional) - [format].storageplugin: [guid] (optional).
") Resources;
		virtual opencascade::handle<Resource_Manager> Resources();

		/****** TDocStd_Application::ResourcesName ******/
		/****** md5 signature: bd72e341abd0de3065c0732583c9ce29 ******/
		%feature("compactdefaultargs") ResourcesName;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the name of the file containing the resources of this application, for support of legacy method of loading formats data from resource files. //! method defineformat() can be used to define all necessary parameters explicitly without actually using resource files. //! in a resource file, the application associates the schema name of the document with the storage and retrieval plug-ins that are to be loaded for each document. on retrieval, the application reads the schema name in the heading of the csf file and loads the plug-in indicated in the resource file. this plug-in instantiates the actual driver for transient-persistent conversion. your application can bring this process into play by defining a class which inherits cdf_application and redefines the function which returns the appropriate resources file. at this point, the function retrieve and the class cdf_store can be called. this allows you to deal with storage and retrieval of - as well as copying and pasting - documents. to implement a class like this, several virtual functions should be redefined. in particular, you must redefine the abstract function resources inherited from the superclass cdm_application. //! default implementation returns empty string.
") ResourcesName;
		virtual Standard_CString ResourcesName();

		/****** TDocStd_Application::Save ******/
		/****** md5 signature: b571dab0fb3d3e07b3e8150d22309a53 ******/
		%feature("compactdefaultargs") Save;
		%feature("autodoc", "
Parameters
----------
theDoc: TDocStd_Document
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
PCDM_StoreStatus

Description
-----------
Save adoc active document. exceptions: standard_notimplemented if the document was not retrieved in the applicative session by using open.
") Save;
		PCDM_StoreStatus Save(const opencascade::handle<TDocStd_Document> & theDoc, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** TDocStd_Application::Save ******/
		/****** md5 signature: 1213906c4542565c92a0f9f505b075d2 ******/
		%feature("compactdefaultargs") Save;
		%feature("autodoc", "
Parameters
----------
theDoc: TDocStd_Document
theStatusMessage: str
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
PCDM_StoreStatus

Description
-----------
Save the document overwriting the previous file.
") Save;
		PCDM_StoreStatus Save(const opencascade::handle<TDocStd_Document> & theDoc, TCollection_ExtendedString & theStatusMessage, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** TDocStd_Application::SaveAs ******/
		/****** md5 signature: 03b44dac86f8e83525110619e00dff85 ******/
		%feature("compactdefaultargs") SaveAs;
		%feature("autodoc", "
Parameters
----------
theDoc: TDocStd_Document
path: str
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
PCDM_StoreStatus

Description
-----------
Save the active document in the file <name> in the path <path> ; o verwrites the file if it already exists.
") SaveAs;
		PCDM_StoreStatus SaveAs(const opencascade::handle<TDocStd_Document> & theDoc, TCollection_ExtendedString path, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** TDocStd_Application::SaveAs ******/
		/****** md5 signature: db53da11f07b421bf2ee6cddab4eae1d ******/
		%feature("compactdefaultargs") SaveAs;
		%feature("autodoc", "
Parameters
----------
theDoc: TDocStd_Document
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
theOStream: Standard_OStream

Description
-----------
Save thedoc to standard seekable stream theostream. the stream should support seek functionality.
") SaveAs;
		PCDM_StoreStatus SaveAs(const opencascade::handle<TDocStd_Document> & theDoc, std::ostream &OutValue, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** TDocStd_Application::SaveAs ******/
		/****** md5 signature: fc9f357e438e352135774e1dd7c1bb0f ******/
		%feature("compactdefaultargs") SaveAs;
		%feature("autodoc", "
Parameters
----------
theDoc: TDocStd_Document
path: str
theStatusMessage: str
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
PCDM_StoreStatus

Description
-----------
Save the active document in the file <name> in the path <path> . overwrite the file if it already exist.
") SaveAs;
		PCDM_StoreStatus SaveAs(const opencascade::handle<TDocStd_Document> & theDoc, TCollection_ExtendedString path, TCollection_ExtendedString & theStatusMessage, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** TDocStd_Application::SaveAs ******/
		/****** md5 signature: 6e4c5f32518d14bdcee71e9747c533a8 ******/
		%feature("compactdefaultargs") SaveAs;
		%feature("autodoc", "
Parameters
----------
theDoc: TDocStd_Document
theStatusMessage: str
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
theOStream: Standard_OStream

Description
-----------
Save thedoc to standard seekable stream theostream. the stream should support seek functionality.
") SaveAs;
		PCDM_StoreStatus SaveAs(const opencascade::handle<TDocStd_Document> & theDoc, std::ostream &OutValue, TCollection_ExtendedString & theStatusMessage, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** TDocStd_Application::WritingFormats ******/
		/****** md5 signature: a5407beb640b0ebe68c0c3306feeeddb ******/
		%feature("compactdefaultargs") WritingFormats;
		%feature("autodoc", "
Parameters
----------
theFormats: TColStd_SequenceOfAsciiString

Return
-------
None

Description
-----------
Returns the sequence of writing formats supported by the application. //! @param theformats - sequence of writing formats. output parameter.
") WritingFormats;
		void WritingFormats(TColStd_SequenceOfAsciiString & theFormats);

};


%make_alias(TDocStd_Application)

%extend TDocStd_Application {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class TDocStd_ApplicationDelta *
*********************************/
class TDocStd_ApplicationDelta : public Standard_Transient {
	public:
		/****** TDocStd_ApplicationDelta::TDocStd_ApplicationDelta ******/
		/****** md5 signature: 1af03601ac541f1768394e2226d37005 ******/
		%feature("compactdefaultargs") TDocStd_ApplicationDelta;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDocStd_ApplicationDelta;
		 TDocStd_ApplicationDelta();

		/****** TDocStd_ApplicationDelta::Dump ******/
		/****** md5 signature: 43df1fb908adbf242957532375689066 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** TDocStd_ApplicationDelta::GetDocuments ******/
		/****** md5 signature: 3949b6234d6a0eb9778487caa2291ad4 ******/
		%feature("compactdefaultargs") GetDocuments;
		%feature("autodoc", "Return
-------
TDocStd_SequenceOfDocument

Description
-----------
No available documentation.
") GetDocuments;
		TDocStd_SequenceOfDocument & GetDocuments();

		/****** TDocStd_ApplicationDelta::GetName ******/
		/****** md5 signature: 3c50eb9eaf9ae32c5f28a54596fff8d5 ******/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
No available documentation.
") GetName;
		const TCollection_ExtendedString & GetName();

		/****** TDocStd_ApplicationDelta::SetName ******/
		/****** md5 signature: 37faf29196bae8c9862db277eec2dc6c ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
None

Description
-----------
No available documentation.
") SetName;
		void SetName(TCollection_ExtendedString theName);

};


%make_alias(TDocStd_ApplicationDelta)

%extend TDocStd_ApplicationDelta {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class TDocStd_CompoundDelta *
******************************/
class TDocStd_CompoundDelta : public TDF_Delta {
	public:
		/****** TDocStd_CompoundDelta::TDocStd_CompoundDelta ******/
		/****** md5 signature: 14b612a73bf23e71f1edade8e46f2a95 ******/
		%feature("compactdefaultargs") TDocStd_CompoundDelta;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a compound delta. validates <self> at <abegintime>. if applied, it restores the tdf_data in the state it was at <anendtime>. reserved to tdf_data.
") TDocStd_CompoundDelta;
		 TDocStd_CompoundDelta();

};


%make_alias(TDocStd_CompoundDelta)

%extend TDocStd_CompoundDelta {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class TDocStd_Context *
************************/
class TDocStd_Context {
	public:
		/****** TDocStd_Context::TDocStd_Context ******/
		/****** md5 signature: 1449415a74cc571f7c089efc80e12c70 ******/
		%feature("compactdefaultargs") TDocStd_Context;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDocStd_Context;
		 TDocStd_Context();

		/****** TDocStd_Context::ModifiedReferences ******/
		/****** md5 signature: 224afee24fa4f6d3b2a9839d9ee6f541 ******/
		%feature("compactdefaultargs") ModifiedReferences;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") ModifiedReferences;
		Standard_Boolean ModifiedReferences();

		/****** TDocStd_Context::SetModifiedReferences ******/
		/****** md5 signature: 240dac990b28a5adfbfe5943cc9dd4c9 ******/
		%feature("compactdefaultargs") SetModifiedReferences;
		%feature("autodoc", "
Parameters
----------
Mod: bool

Return
-------
None

Description
-----------
No available documentation.
") SetModifiedReferences;
		void SetModifiedReferences(const Standard_Boolean Mod);

};


%extend TDocStd_Context {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class TDocStd_Document *
*************************/
class TDocStd_Document : public CDM_Document {
	public:
		/****** TDocStd_Document::TDocStd_Document ******/
		/****** md5 signature: 6c9bc471881d34be3dc6a79830b980f0 ******/
		%feature("compactdefaultargs") TDocStd_Document;
		%feature("autodoc", "
Parameters
----------
astorageformat: str

Return
-------
None

Description
-----------
Constructs a document object defined by the string astorageformat. if a document is created outside of an application using this constructor, it must be managed by a handle. otherwise memory problems could appear: call of tdocstd_owner::getdocument creates a opencascade::handle<tdocstd_document>, so, releasing it will produce a crash.
") TDocStd_Document;
		 TDocStd_Document(TCollection_ExtendedString astorageformat);

		/****** TDocStd_Document::AbortCommand ******/
		/****** md5 signature: d0bb10d25bbdbaf736403be160aab8bb ******/
		%feature("compactdefaultargs") AbortCommand;
		%feature("autodoc", "Return
-------
None

Description
-----------
Abort the command transaction. does nothing if there is no command transaction open.
") AbortCommand;
		void AbortCommand();

		/****** TDocStd_Document::BeforeClose ******/
		/****** md5 signature: 3fa1f940d3408759374f9543388270ef ******/
		%feature("compactdefaultargs") BeforeClose;
		%feature("autodoc", "Return
-------
None

Description
-----------
Prepares document for closing.
") BeforeClose;
		virtual void BeforeClose();

		/****** TDocStd_Document::ChangeStorageFormat ******/
		/****** md5 signature: 3dda94b418a5d0b8874c52229c1c133d ******/
		%feature("compactdefaultargs") ChangeStorageFormat;
		%feature("autodoc", "
Parameters
----------
newStorageFormat: str

Return
-------
None

Description
-----------
Methods for the nested transaction mode.
") ChangeStorageFormat;
		virtual void ChangeStorageFormat(TCollection_ExtendedString newStorageFormat);

		/****** TDocStd_Document::ChangeStorageFormatVersion ******/
		/****** md5 signature: c0a170d4f51e35c0959917fcc2b6dc37 ******/
		%feature("compactdefaultargs") ChangeStorageFormatVersion;
		%feature("autodoc", "
Parameters
----------
theVersion: TDocStd_FormatVersion

Return
-------
None

Description
-----------
Sets version of the format to be used to store the document.
") ChangeStorageFormatVersion;
		void ChangeStorageFormatVersion(const TDocStd_FormatVersion theVersion);

		/****** TDocStd_Document::ClearRedos ******/
		/****** md5 signature: 24ac296ed75c3df1806aa7bb1fddee55 ******/
		%feature("compactdefaultargs") ClearRedos;
		%feature("autodoc", "Return
-------
None

Description
-----------
Remove all stored redos.
") ClearRedos;
		void ClearRedos();

		/****** TDocStd_Document::ClearUndos ******/
		/****** md5 signature: 004129249b8506516f5fdd72a4fb8fd0 ******/
		%feature("compactdefaultargs") ClearUndos;
		%feature("autodoc", "Return
-------
None

Description
-----------
Remove all stored undos and redos.
") ClearUndos;
		void ClearUndos();

		/****** TDocStd_Document::CommitCommand ******/
		/****** md5 signature: faa383479ebff95ab2d1b0ab2a6c6947 ******/
		%feature("compactdefaultargs") CommitCommand;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Commits documents transactions and fills the transaction manager with documents that have been changed during the transaction. if no command transaction is open, nothing is done. returns true if a new delta has been added to myundos.
") CommitCommand;
		Standard_Boolean CommitCommand();

		/****** TDocStd_Document::CurrentStorageFormatVersion ******/
		/****** md5 signature: 41d846be0884fc722f98ab0cecb47e30 ******/
		%feature("compactdefaultargs") CurrentStorageFormatVersion;
		%feature("autodoc", "Return
-------
TDocStd_FormatVersion

Description
-----------
Returns current storage format version of the document.
") CurrentStorageFormatVersion;
		static TDocStd_FormatVersion CurrentStorageFormatVersion();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** TDocStd_Document::EmptyLabelsSavingMode ******/
		/****** md5 signature: ebbf4e01e7bb5a968c5adb29c08e5c61 ******/
		%feature("compactdefaultargs") EmptyLabelsSavingMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns saving mode for empty labels.
") EmptyLabelsSavingMode;
		Standard_Boolean EmptyLabelsSavingMode();

		/****** TDocStd_Document::Get ******/
		/****** md5 signature: 77e2a849942dfb62d55ba8818957eae5 ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
opencascade::handle<TDocStd_Document>

Description
-----------
Will abort any execution, clear fields returns the document which contains <l>. raises an exception if the document is not found.
") Get;
		static opencascade::handle<TDocStd_Document> Get(const TDF_Label & L);

		/****** TDocStd_Document::GetAvailableRedos ******/
		/****** md5 signature: 6d7c07e798e1b111df27b9fd7352d234 ******/
		%feature("compactdefaultargs") GetAvailableRedos;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of redos stored in this document. if this figure is greater than 0, the method redo can be used.
") GetAvailableRedos;
		Standard_Integer GetAvailableRedos();

		/****** TDocStd_Document::GetAvailableUndos ******/
		/****** md5 signature: a9fe7db4eaa69142eaad134d9efb1510 ******/
		%feature("compactdefaultargs") GetAvailableUndos;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of undos stored in this document. if this figure is greater than 0, the method undo can be used.
") GetAvailableUndos;
		Standard_Integer GetAvailableUndos();

		/****** TDocStd_Document::GetData ******/
		/****** md5 signature: 31c5fbe37dd19f7a9a8b8efbf6ab68ed ******/
		%feature("compactdefaultargs") GetData;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Data>

Description
-----------
No available documentation.
") GetData;
		opencascade::handle<TDF_Data> GetData();

		/****** TDocStd_Document::GetModified ******/
		/****** md5 signature: e0b00984d11d90f6ebccba55f2bedac9 ******/
		%feature("compactdefaultargs") GetModified;
		%feature("autodoc", "Return
-------
TDF_LabelMap

Description
-----------
Returns the labels which have been modified in this document.
") GetModified;
		const TDF_LabelMap & GetModified();

		/****** TDocStd_Document::GetName ******/
		/****** md5 signature: fccd7cb624ceb6d77e85524978a24f14 ******/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
Raise if <self> is not saved.
") GetName;
		TCollection_ExtendedString GetName();

		/****** TDocStd_Document::GetPath ******/
		/****** md5 signature: b667548800d72ecbc6ccc6595cff37d2 ******/
		%feature("compactdefaultargs") GetPath;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
Returns the os path of the file, in which one <self> is saved. raise an exception if <self> is not saved.
") GetPath;
		TCollection_ExtendedString GetPath();

		/****** TDocStd_Document::GetRedos ******/
		/****** md5 signature: a17c398f7ad847f1311a76088a19db6a ******/
		%feature("compactdefaultargs") GetRedos;
		%feature("autodoc", "Return
-------
TDF_DeltaList

Description
-----------
No available documentation.
") GetRedos;
		const TDF_DeltaList & GetRedos();

		/****** TDocStd_Document::GetSavedTime ******/
		/****** md5 signature: 4d6497e8e59fc456a92bd8fb1cb73c06 ******/
		%feature("compactdefaultargs") GetSavedTime;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns value of <mysavedtime> to be used later in setsavedtime().
") GetSavedTime;
		Standard_Integer GetSavedTime();

		/****** TDocStd_Document::GetUndoLimit ******/
		/****** md5 signature: 4d03b93f640587c3abcd1bd1d5a774a9 ******/
		%feature("compactdefaultargs") GetUndoLimit;
		%feature("autodoc", "Return
-------
int

Description
-----------
The current limit on the number of undos.
") GetUndoLimit;
		Standard_Integer GetUndoLimit();

		/****** TDocStd_Document::GetUndos ******/
		/****** md5 signature: a92983c53fbaea20c65e729b47250791 ******/
		%feature("compactdefaultargs") GetUndos;
		%feature("autodoc", "Return
-------
TDF_DeltaList

Description
-----------
No available documentation.
") GetUndos;
		const TDF_DeltaList & GetUndos();

		/****** TDocStd_Document::HasOpenCommand ******/
		/****** md5 signature: dd69c57ebd4821e931afe0accf5d3235 ******/
		%feature("compactdefaultargs") HasOpenCommand;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if a command transaction is open in the curret .
") HasOpenCommand;
		Standard_Boolean HasOpenCommand();

		/****** TDocStd_Document::InitDeltaCompaction ******/
		/****** md5 signature: 77faa00b1c44f05079d8166afa89b7e2 ******/
		%feature("compactdefaultargs") InitDeltaCompaction;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Initializes the procedure of delta compaction returns false if there is no delta to compact marks the last delta as a 'from' delta.
") InitDeltaCompaction;
		Standard_Boolean InitDeltaCompaction();

		/****** TDocStd_Document::IsChanged ******/
		/****** md5 signature: c6ef5df821d55ba9601e2f39be013961 ******/
		%feature("compactdefaultargs") IsChanged;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if document differs from the state of last saving. this method have to be called only working in the transaction mode.
") IsChanged;
		Standard_Boolean IsChanged();

		/****** TDocStd_Document::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the main label has no attributes.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** TDocStd_Document::IsNestedTransactionMode ******/
		/****** md5 signature: 1efb73f5e84074596fa47f1cfe63ee41 ******/
		%feature("compactdefaultargs") IsNestedTransactionMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns standard_true if mode is set.
") IsNestedTransactionMode;
		Standard_Boolean IsNestedTransactionMode();

		/****** TDocStd_Document::IsSaved ******/
		/****** md5 signature: a05df8be7169b3a9328ebaa74888756c ******/
		%feature("compactdefaultargs") IsSaved;
		%feature("autodoc", "Return
-------
bool

Description
-----------
The document is saved in a file.
") IsSaved;
		Standard_Boolean IsSaved();

		/****** TDocStd_Document::IsValid ******/
		/****** md5 signature: 2809e700423e4fe6ecd395953f3a2406 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns false if the document has been modified but not recomputed.
") IsValid;
		Standard_Boolean IsValid();

		/****** TDocStd_Document::Main ******/
		/****** md5 signature: d3bdeedf7e55e8ec4190ba1b192424e7 ******/
		%feature("compactdefaultargs") Main;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
Returns the main label in this data framework. by definition, this is the label with the entry 0:1.
") Main;
		TDF_Label Main();

		/****** TDocStd_Document::ModificationMode ******/
		/****** md5 signature: 19d64027addb7f66c90a4e97325ce41b ******/
		%feature("compactdefaultargs") ModificationMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if changes allowed only inside transactions.
") ModificationMode;
		Standard_Boolean ModificationMode();

		/****** TDocStd_Document::NewCommand ******/
		/****** md5 signature: 32f8f9d54085e00883022af8c40334a2 ******/
		%feature("compactdefaultargs") NewCommand;
		%feature("autodoc", "Return
-------
None

Description
-----------
Launches a new command. this command may be undone.
") NewCommand;
		void NewCommand();

		/****** TDocStd_Document::OpenCommand ******/
		/****** md5 signature: a5c155bd5cc75696d479b13cfff2f26e ******/
		%feature("compactdefaultargs") OpenCommand;
		%feature("autodoc", "Return
-------
None

Description
-----------
Opens a new command transaction in this document. you can use hasopencommand to see whether a command is already open. exceptions standard_domainerror if a command is already open in this document.
") OpenCommand;
		void OpenCommand();

		/****** TDocStd_Document::PerformDeltaCompaction ******/
		/****** md5 signature: c672e4672cd7849522ba54bb9983cad3 ******/
		%feature("compactdefaultargs") PerformDeltaCompaction;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Performs the procedure of delta compaction makes all deltas starting from 'from' delta till the last one to be one delta.
") PerformDeltaCompaction;
		Standard_Boolean PerformDeltaCompaction();

		/****** TDocStd_Document::PurgeModified ******/
		/****** md5 signature: 8ea2d8d4e2c5c8c84506ff3ff3412d40 ******/
		%feature("compactdefaultargs") PurgeModified;
		%feature("autodoc", "Return
-------
None

Description
-----------
Remove all modifications. after this call the document becomesagain valid.
") PurgeModified;
		void PurgeModified();

		/****** TDocStd_Document::Recompute ******/
		/****** md5 signature: 6619326e603ccdb36e9cfecd2b36ae53 ******/
		%feature("compactdefaultargs") Recompute;
		%feature("autodoc", "Return
-------
None

Description
-----------
Recompute if the document was not valid and propagate the reccorded modification.
") Recompute;
		void Recompute();

		/****** TDocStd_Document::Redo ******/
		/****** md5 signature: 25a8729b05a3d55e4dea49595855f14b ******/
		%feature("compactdefaultargs") Redo;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Will redo one step, returns false if no redo was done (redos == 0). otherwise, true is returned, and one step in the list of redoes is done again.
") Redo;
		Standard_Boolean Redo();

		/****** TDocStd_Document::RemoveFirstUndo ******/
		/****** md5 signature: 8d230c6a572865285db038c1c0910766 ******/
		%feature("compactdefaultargs") RemoveFirstUndo;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes the first undo in the list of document undos. it is used in the application when the undo limit is exceed.
") RemoveFirstUndo;
		void RemoveFirstUndo();

		/****** TDocStd_Document::SetData ******/
		/****** md5 signature: e5950b55d74da31b1aa3592bd9a5d925 ******/
		%feature("compactdefaultargs") SetData;
		%feature("autodoc", "
Parameters
----------
data: TDF_Data

Return
-------
None

Description
-----------
No available documentation.
") SetData;
		void SetData(const opencascade::handle<TDF_Data> & data);

		/****** TDocStd_Document::SetEmptyLabelsSavingMode ******/
		/****** md5 signature: ee194820db474fc612626ff3eef85f45 ******/
		%feature("compactdefaultargs") SetEmptyLabelsSavingMode;
		%feature("autodoc", "
Parameters
----------
isAllowed: bool

Return
-------
None

Description
-----------
Sets saving mode for empty labels. if standard_true, empty labels will be saved.
") SetEmptyLabelsSavingMode;
		void SetEmptyLabelsSavingMode(const Standard_Boolean isAllowed);

		/****** TDocStd_Document::SetModificationMode ******/
		/****** md5 signature: f670168c2039d1fa00cc4c8fedbbda89 ******/
		%feature("compactdefaultargs") SetModificationMode;
		%feature("autodoc", "
Parameters
----------
theTransactionOnly: bool

Return
-------
None

Description
-----------
If thetransactiononly is true changes is denied outside transactions.
") SetModificationMode;
		void SetModificationMode(const Standard_Boolean theTransactionOnly);

		/****** TDocStd_Document::SetModified ******/
		/****** md5 signature: de33735160e5da48a69bcd5ba99fcfd2 ******/
		%feature("compactdefaultargs") SetModified;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
None

Description
-----------
Notify the label as modified, the document becomes unvalid. returns true if <l> has been notified as modified.
") SetModified;
		void SetModified(const TDF_Label & L);

		/****** TDocStd_Document::SetNestedTransactionMode ******/
		/****** md5 signature: f79f8b65409bf3f9c2580d96405aa86c ******/
		%feature("compactdefaultargs") SetNestedTransactionMode;
		%feature("autodoc", "
Parameters
----------
isAllowed: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Sets nested transaction mode if isallowed == standard_true.
") SetNestedTransactionMode;
		void SetNestedTransactionMode(const Standard_Boolean isAllowed = Standard_True);

		/****** TDocStd_Document::SetSaved ******/
		/****** md5 signature: 014ee06619c79447bd1c1c60537c8358 ******/
		%feature("compactdefaultargs") SetSaved;
		%feature("autodoc", "Return
-------
None

Description
-----------
This method have to be called to show document that it has been saved.
") SetSaved;
		void SetSaved();

		/****** TDocStd_Document::SetSavedTime ******/
		/****** md5 signature: 3372eae5a5d0d58452934202ff83c7cc ******/
		%feature("compactdefaultargs") SetSavedTime;
		%feature("autodoc", "
Parameters
----------
theTime: int

Return
-------
None

Description
-----------
Say to document what it is not saved. use value, returned earlier by getsavedtime().
") SetSavedTime;
		void SetSavedTime(const Standard_Integer theTime);

		/****** TDocStd_Document::SetUndoLimit ******/
		/****** md5 signature: a11fa9e33e71f4e544c1b0655a8f4f2f ******/
		%feature("compactdefaultargs") SetUndoLimit;
		%feature("autodoc", "
Parameters
----------
L: int

Return
-------
None

Description
-----------
Set the limit on the number of undo delta stored 0 will disable undo on the document a negative value means no limit. note that by default undo is disabled. enabling it will take effect with the next call to newcommand. of course this limit is the same for redo.
") SetUndoLimit;
		void SetUndoLimit(const Standard_Integer L);

		/****** TDocStd_Document::StorageFormat ******/
		/****** md5 signature: f4ddc2d3ada784edaf0395475d9df359 ******/
		%feature("compactdefaultargs") StorageFormat;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
No available documentation.
") StorageFormat;
		virtual TCollection_ExtendedString StorageFormat();

		/****** TDocStd_Document::StorageFormatVersion ******/
		/****** md5 signature: b49a4fe8d3ebc03aaa9fc51a5634cc04 ******/
		%feature("compactdefaultargs") StorageFormatVersion;
		%feature("autodoc", "Return
-------
TDocStd_FormatVersion

Description
-----------
Returns version of the format to be used to store the document.
") StorageFormatVersion;
		TDocStd_FormatVersion StorageFormatVersion();

		/****** TDocStd_Document::Undo ******/
		/****** md5 signature: 95113786d46edb519ce9957bac4f72f7 ******/
		%feature("compactdefaultargs") Undo;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Will undo one step, returns false if no undo was done (undos == 0). otherwise, true is returned and one step in the list of undoes is undone.
") Undo;
		Standard_Boolean Undo();

		/****** TDocStd_Document::Update ******/
		/****** md5 signature: 97c07ea29dd5305b368cebf252ceb33b ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
aToDocument: CDM_Document
aReferenceIdentifier: int
aModifContext: Standard_Address

Return
-------
None

Description
-----------
This method update will be called to signal the end of the modified references list. the document should be recomputed and updatefromdocuments should be called. update should returns true in case of success, false otherwise. in case of failure, additional information can be given in errorstring. update the document by propagation ================================== update the document from internal stored modifications. if you want to undoing this operation, please call newcommand before. to change format (advanced programming) ================.
") Update;
		virtual void Update(const opencascade::handle<CDM_Document> & aToDocument, const Standard_Integer aReferenceIdentifier, const Standard_Address aModifContext);

		/****** TDocStd_Document::UpdateReferences ******/
		/****** md5 signature: a48237fc53570334df18734e1672c38a ******/
		%feature("compactdefaultargs") UpdateReferences;
		%feature("autodoc", "
Parameters
----------
aDocEntry: str

Return
-------
None

Description
-----------
Set modifications on labels impacted by external references to the entry. the document becomes invalid and must be recomputed.
") UpdateReferences;
		void UpdateReferences(TCollection_AsciiString aDocEntry);

};


%make_alias(TDocStd_Document)

%extend TDocStd_Document {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class TDocStd_Modified *
*************************/
class TDocStd_Modified : public TDF_Attribute {
	public:
		/****** TDocStd_Modified::TDocStd_Modified ******/
		/****** md5 signature: 7d0015c1a60ffc6e9a01e3d9081f5131 ******/
		%feature("compactdefaultargs") TDocStd_Modified;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDocStd_Modified;
		 TDocStd_Modified();

		/****** TDocStd_Modified::Add ******/
		/****** md5 signature: 86383525d25c987b354e36fad576210c ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
alabel: TDF_Label

Return
-------
bool

Description
-----------
No available documentation.
") Add;
		static Standard_Boolean Add(const TDF_Label & alabel);

		/****** TDocStd_Modified::AddLabel ******/
		/****** md5 signature: dcf184d5ea52ec11f1c30bdbbba1bd57 ******/
		%feature("compactdefaultargs") AddLabel;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
bool

Description
-----------
Add <l> as modified.
") AddLabel;
		Standard_Boolean AddLabel(const TDF_Label & L);

		/****** TDocStd_Modified::Clear ******/
		/****** md5 signature: 9e93a4d4f3d5f8790d097e1fff43e3da ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "
Parameters
----------
access: TDF_Label

Return
-------
None

Description
-----------
Remove all modified labels. becomes empty.
") Clear;
		static void Clear(const TDF_Label & access);

		/****** TDocStd_Modified::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****** TDocStd_Modified::Contains ******/
		/****** md5 signature: 0dd6e3d57c4d3da88b25f8fac0dd5eb4 ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
alabel: TDF_Label

Return
-------
bool

Description
-----------
No available documentation.
") Contains;
		static Standard_Boolean Contains(const TDF_Label & alabel);

		/****** TDocStd_Modified::Dump ******/
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		virtual Standard_OStream & Dump(std::ostream &OutValue);

		/****** TDocStd_Modified::Get ******/
		/****** md5 signature: bd123f000340e7375ce09c289c0daf49 ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "
Parameters
----------
access: TDF_Label

Return
-------
TDF_LabelMap

Description
-----------
If <isempty> raise an exception.
") Get;
		static const TDF_LabelMap & Get(const TDF_Label & access);

		/****** TDocStd_Modified::Get ******/
		/****** md5 signature: 7648f1c097b7b0c852cc4f0bb24dcf2c ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Return
-------
TDF_LabelMap

Description
-----------
Returns modified label map.
") Get;
		const TDF_LabelMap & Get();

		/****** TDocStd_Modified::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Modified methods ================.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDocStd_Modified::ID ******/
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDocStd_Modified::IsEmpty ******/
		/****** md5 signature: 4ea2b484127f0664f85494cb4d8b0352 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "
Parameters
----------
access: TDF_Label

Return
-------
bool

Description
-----------
Api class methods =================.
") IsEmpty;
		static Standard_Boolean IsEmpty(const TDF_Label & access);

		/****** TDocStd_Modified::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** TDocStd_Modified::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDocStd_Modified::Paste ******/
		/****** md5 signature: a6ff306a759c68a191c0262635db980f ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TDocStd_Modified::Remove ******/
		/****** md5 signature: 743b4afbaae6706eb55d9985c7d5b2ba ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
alabel: TDF_Label

Return
-------
bool

Description
-----------
No available documentation.
") Remove;
		static Standard_Boolean Remove(const TDF_Label & alabel);

		/****** TDocStd_Modified::RemoveLabel ******/
		/****** md5 signature: 0dc39faec3559dcae42899b7e5ef40ff ******/
		%feature("compactdefaultargs") RemoveLabel;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
bool

Description
-----------
Remove <l> as modified.
") RemoveLabel;
		Standard_Boolean RemoveLabel(const TDF_Label & L);

		/****** TDocStd_Modified::Restore ******/
		/****** md5 signature: ddeae219d389a1d89eecb3e23c73522a ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
With: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

};


%make_alias(TDocStd_Modified)

%extend TDocStd_Modified {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class TDocStd_MultiTransactionManager *
****************************************/
class TDocStd_MultiTransactionManager : public Standard_Transient {
	public:
		/****** TDocStd_MultiTransactionManager::TDocStd_MultiTransactionManager ******/
		/****** md5 signature: 014071359c4c474be3bcaa4c0ce0ba18 ******/
		%feature("compactdefaultargs") TDocStd_MultiTransactionManager;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") TDocStd_MultiTransactionManager;
		 TDocStd_MultiTransactionManager();

		/****** TDocStd_MultiTransactionManager::AbortCommand ******/
		/****** md5 signature: d0bb10d25bbdbaf736403be160aab8bb ******/
		%feature("compactdefaultargs") AbortCommand;
		%feature("autodoc", "Return
-------
None

Description
-----------
Unsets the flag of started manager transaction and aborts transaction in each document.
") AbortCommand;
		void AbortCommand();

		/****** TDocStd_MultiTransactionManager::AddDocument ******/
		/****** md5 signature: 9a296ac138cd691ef833acb7ad441f83 ******/
		%feature("compactdefaultargs") AddDocument;
		%feature("autodoc", "
Parameters
----------
theDoc: TDocStd_Document

Return
-------
None

Description
-----------
Adds the document to the transaction manager and checks if it has been already added.
") AddDocument;
		void AddDocument(const opencascade::handle<TDocStd_Document> & theDoc);

		/****** TDocStd_MultiTransactionManager::ClearRedos ******/
		/****** md5 signature: 24ac296ed75c3df1806aa7bb1fddee55 ******/
		%feature("compactdefaultargs") ClearRedos;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears redos in the manager and in documents.
") ClearRedos;
		void ClearRedos();

		/****** TDocStd_MultiTransactionManager::ClearUndos ******/
		/****** md5 signature: 004129249b8506516f5fdd72a4fb8fd0 ******/
		%feature("compactdefaultargs") ClearUndos;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears undos in the manager and in documents.
") ClearUndos;
		void ClearUndos();

		/****** TDocStd_MultiTransactionManager::CommitCommand ******/
		/****** md5 signature: faa383479ebff95ab2d1b0ab2a6c6947 ******/
		%feature("compactdefaultargs") CommitCommand;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Commits transaction in all documents and fills the transaction manager with the documents that have been changed during the transaction. returns true if new data has been added to myundos. note: all nested transactions in the documents will be committed.
") CommitCommand;
		Standard_Boolean CommitCommand();

		/****** TDocStd_MultiTransactionManager::CommitCommand ******/
		/****** md5 signature: d693105a187093a1581df589429f5d07 ******/
		%feature("compactdefaultargs") CommitCommand;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
bool

Description
-----------
Makes the same steps as the previous function but defines the name for transaction. returns true if new data has been added to myundos.
") CommitCommand;
		Standard_Boolean CommitCommand(TCollection_ExtendedString theName);

		/****** TDocStd_MultiTransactionManager::Documents ******/
		/****** md5 signature: 65ccd54a293a56a7b15c353e5c466919 ******/
		%feature("compactdefaultargs") Documents;
		%feature("autodoc", "Return
-------
TDocStd_SequenceOfDocument

Description
-----------
Returns the added documents to the transaction manager.
") Documents;
		const TDocStd_SequenceOfDocument & Documents();

		/****** TDocStd_MultiTransactionManager::DumpTransaction ******/
		/****** md5 signature: 4eb314c9880f16b84a5b19db7c403e6c ******/
		%feature("compactdefaultargs") DumpTransaction;
		%feature("autodoc", "
Parameters
----------

Return
-------
theOS: Standard_OStream

Description
-----------
Dumps transactions in undos and redos.
") DumpTransaction;
		void DumpTransaction(std::ostream &OutValue);

		/****** TDocStd_MultiTransactionManager::GetAvailableRedos ******/
		/****** md5 signature: 500cc68e983f9a7d304824d6e36eaecc ******/
		%feature("compactdefaultargs") GetAvailableRedos;
		%feature("autodoc", "Return
-------
TDocStd_SequenceOfApplicationDelta

Description
-----------
Returns available manager redos.
") GetAvailableRedos;
		const TDocStd_SequenceOfApplicationDelta & GetAvailableRedos();

		/****** TDocStd_MultiTransactionManager::GetAvailableUndos ******/
		/****** md5 signature: f40ce0c74bf4312033d043449a41d5ee ******/
		%feature("compactdefaultargs") GetAvailableUndos;
		%feature("autodoc", "Return
-------
TDocStd_SequenceOfApplicationDelta

Description
-----------
Returns available manager undos.
") GetAvailableUndos;
		const TDocStd_SequenceOfApplicationDelta & GetAvailableUndos();

		/****** TDocStd_MultiTransactionManager::GetUndoLimit ******/
		/****** md5 signature: 4d03b93f640587c3abcd1bd1d5a774a9 ******/
		%feature("compactdefaultargs") GetUndoLimit;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns undo limit for the manager.
") GetUndoLimit;
		Standard_Integer GetUndoLimit();

		/****** TDocStd_MultiTransactionManager::HasOpenCommand ******/
		/****** md5 signature: dd69c57ebd4821e931afe0accf5d3235 ******/
		%feature("compactdefaultargs") HasOpenCommand;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if a transaction is opened.
") HasOpenCommand;
		Standard_Boolean HasOpenCommand();

		/****** TDocStd_MultiTransactionManager::IsNestedTransactionMode ******/
		/****** md5 signature: 1efb73f5e84074596fa47f1cfe63ee41 ******/
		%feature("compactdefaultargs") IsNestedTransactionMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns standard_true if nestedtransaction mode is set. methods for protection of changes outside transactions.
") IsNestedTransactionMode;
		Standard_Boolean IsNestedTransactionMode();

		/****** TDocStd_MultiTransactionManager::ModificationMode ******/
		/****** md5 signature: 19d64027addb7f66c90a4e97325ce41b ******/
		%feature("compactdefaultargs") ModificationMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if changes are allowed only inside transactions.
") ModificationMode;
		Standard_Boolean ModificationMode();

		/****** TDocStd_MultiTransactionManager::OpenCommand ******/
		/****** md5 signature: a5c155bd5cc75696d479b13cfff2f26e ******/
		%feature("compactdefaultargs") OpenCommand;
		%feature("autodoc", "Return
-------
None

Description
-----------
Opens transaction in each document and sets the flag that transaction is opened. if there are already opened transactions in the documents, these transactions will be aborted before opening new ones.
") OpenCommand;
		void OpenCommand();

		/****** TDocStd_MultiTransactionManager::Redo ******/
		/****** md5 signature: 55e233ab8e907b54603badc49546603c ******/
		%feature("compactdefaultargs") Redo;
		%feature("autodoc", "Return
-------
None

Description
-----------
Redoes the current transaction of the application. it calls the redo () method of the document being on top of the manager list of redos (list.first()) and moves the list item to the top of the list of manager undos (list.prepend(item)).
") Redo;
		void Redo();

		/****** TDocStd_MultiTransactionManager::RemoveDocument ******/
		/****** md5 signature: ac60ee1ea0f38b322ea5e3e6231dcb3c ******/
		%feature("compactdefaultargs") RemoveDocument;
		%feature("autodoc", "
Parameters
----------
theDoc: TDocStd_Document

Return
-------
None

Description
-----------
Removes the document from the transaction manager.
") RemoveDocument;
		void RemoveDocument(const opencascade::handle<TDocStd_Document> & theDoc);

		/****** TDocStd_MultiTransactionManager::RemoveLastUndo ******/
		/****** md5 signature: 7750535d9082b90d5c689aa99cfe17fb ******/
		%feature("compactdefaultargs") RemoveLastUndo;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes undo information from the list of undos of the manager and all documents which have been modified during the transaction.
") RemoveLastUndo;
		void RemoveLastUndo();

		/****** TDocStd_MultiTransactionManager::SetModificationMode ******/
		/****** md5 signature: f670168c2039d1fa00cc4c8fedbbda89 ******/
		%feature("compactdefaultargs") SetModificationMode;
		%feature("autodoc", "
Parameters
----------
theTransactionOnly: bool

Return
-------
None

Description
-----------
If thetransactiononly is true, denies all changes outside transactions.
") SetModificationMode;
		void SetModificationMode(const Standard_Boolean theTransactionOnly);

		/****** TDocStd_MultiTransactionManager::SetNestedTransactionMode ******/
		/****** md5 signature: f79f8b65409bf3f9c2580d96405aa86c ******/
		%feature("compactdefaultargs") SetNestedTransactionMode;
		%feature("autodoc", "
Parameters
----------
isAllowed: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Sets nested transaction mode if isallowed == standard_true note: field myisnestedtransactionmode exists only for synchronization between several documents and has no effect on transactions of multitransaction manager.
") SetNestedTransactionMode;
		void SetNestedTransactionMode(const Standard_Boolean isAllowed = Standard_True);

		/****** TDocStd_MultiTransactionManager::SetUndoLimit ******/
		/****** md5 signature: fe308b2e19b2d2ca1b0cf0cb35727ef4 ******/
		%feature("compactdefaultargs") SetUndoLimit;
		%feature("autodoc", "
Parameters
----------
theLimit: int

Return
-------
None

Description
-----------
Sets undo limit for the manager and all documents.
") SetUndoLimit;
		void SetUndoLimit(const Standard_Integer theLimit);

		/****** TDocStd_MultiTransactionManager::Undo ******/
		/****** md5 signature: 7971ef9a4384d347502ae08a96db5b7e ******/
		%feature("compactdefaultargs") Undo;
		%feature("autodoc", "Return
-------
None

Description
-----------
Undoes the current transaction of the manager. it calls the undo () method of the document being on top of the manager list of undos (list.first()) and moves the list item to the top of the list of manager redos (list.prepend(item)).
") Undo;
		void Undo();

};


%make_alias(TDocStd_MultiTransactionManager)

%extend TDocStd_MultiTransactionManager {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TDocStd_Owner *
**********************/
class TDocStd_Owner : public TDF_Attribute {
	public:
		/****** TDocStd_Owner::TDocStd_Owner ******/
		/****** md5 signature: 45393edf2f035cbf7267bf47358417b6 ******/
		%feature("compactdefaultargs") TDocStd_Owner;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDocStd_Owner;
		 TDocStd_Owner();

		/****** TDocStd_Owner::Dump ******/
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		virtual Standard_OStream & Dump(std::ostream &OutValue);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** TDocStd_Owner::GetDocument ******/
		/****** md5 signature: 79c1f99856b1ab066d94b2ba86b72e8b ******/
		%feature("compactdefaultargs") GetDocument;
		%feature("autodoc", "
Parameters
----------
ofdata: TDF_Data

Return
-------
opencascade::handle<TDocStd_Document>

Description
-----------
Owner methods ===============.
") GetDocument;
		static opencascade::handle<TDocStd_Document> GetDocument(const opencascade::handle<TDF_Data> & ofdata);

		/****** TDocStd_Owner::GetDocument ******/
		/****** md5 signature: 638e8a64fb8a1b19190e69bfce5a264e ******/
		%feature("compactdefaultargs") GetDocument;
		%feature("autodoc", "Return
-------
opencascade::handle<TDocStd_Document>

Description
-----------
No available documentation.
") GetDocument;
		opencascade::handle<TDocStd_Document> GetDocument();

		/****** TDocStd_Owner::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Class methods =============.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDocStd_Owner::ID ******/
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
No available documentation.
") ID;
		const Standard_GUID & ID();

		/****** TDocStd_Owner::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDocStd_Owner::Paste ******/
		/****** md5 signature: a6ff306a759c68a191c0262635db980f ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TDocStd_Owner::Restore ******/
		/****** md5 signature: ddeae219d389a1d89eecb3e23c73522a ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
With: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****** TDocStd_Owner::SetDocument ******/
		/****** md5 signature: 3140f4f6976eef7ef1608bbacb2422e6 ******/
		%feature("compactdefaultargs") SetDocument;
		%feature("autodoc", "
Parameters
----------
indata: TDF_Data
doc: TDocStd_Document

Return
-------
None

Description
-----------
No available documentation.
") SetDocument;
		static void SetDocument(const opencascade::handle<TDF_Data> & indata, const opencascade::handle<TDocStd_Document> & doc);

		/****** TDocStd_Owner::SetDocument ******/
		/****** md5 signature: 44a6a77a2fcd055a5ba41b8d9ce53168 ******/
		%feature("compactdefaultargs") SetDocument;
		%feature("autodoc", "
Parameters
----------
indata: TDF_Data
doc: TDocStd_Document *

Return
-------
None

Description
-----------
No available documentation.
") SetDocument;
		static void SetDocument(const opencascade::handle<TDF_Data> & indata, TDocStd_Document * doc);

		/****** TDocStd_Owner::SetDocument ******/
		/****** md5 signature: e3d965df1d5bccf3439b56e69912f637 ******/
		%feature("compactdefaultargs") SetDocument;
		%feature("autodoc", "
Parameters
----------
document: TDocStd_Document

Return
-------
None

Description
-----------
No available documentation.
") SetDocument;
		void SetDocument(const opencascade::handle<TDocStd_Document> & document);

		/****** TDocStd_Owner::SetDocument ******/
		/****** md5 signature: ad3e7172f1fb605a9281cd01ed3a5999 ******/
		%feature("compactdefaultargs") SetDocument;
		%feature("autodoc", "
Parameters
----------
document: TDocStd_Document *

Return
-------
None

Description
-----------
No available documentation.
") SetDocument;
		void SetDocument(TDocStd_Document * document);

};


%make_alias(TDocStd_Owner)

%extend TDocStd_Owner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TDocStd_PathParser *
***************************/
class TDocStd_PathParser {
	public:
		/****** TDocStd_PathParser::TDocStd_PathParser ******/
		/****** md5 signature: ffdba541cb7e638d4f0b1b8c9eb824d5 ******/
		%feature("compactdefaultargs") TDocStd_PathParser;
		%feature("autodoc", "
Parameters
----------
path: str

Return
-------
None

Description
-----------
No available documentation.
") TDocStd_PathParser;
		 TDocStd_PathParser(TCollection_ExtendedString path);

		/****** TDocStd_PathParser::Extension ******/
		/****** md5 signature: 358567513bd0af360dd505afd61f845e ******/
		%feature("compactdefaultargs") Extension;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
No available documentation.
") Extension;
		TCollection_ExtendedString Extension();

		/****** TDocStd_PathParser::Length ******/
		/****** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Length;
		Standard_Integer Length();

		/****** TDocStd_PathParser::Name ******/
		/****** md5 signature: a9e55299a1405b3a2863469f1a67f9cd ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
No available documentation.
") Name;
		TCollection_ExtendedString Name();

		/****** TDocStd_PathParser::Parse ******/
		/****** md5 signature: 448d69ccb37cbedc06cb767c3a748df4 ******/
		%feature("compactdefaultargs") Parse;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Parse;
		void Parse();

		/****** TDocStd_PathParser::Path ******/
		/****** md5 signature: f6c1194d39f76de7fb92f5471518f512 ******/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
No available documentation.
") Path;
		TCollection_ExtendedString Path();

		/****** TDocStd_PathParser::Trek ******/
		/****** md5 signature: dd6933d9f25c18af0c1cb48a9bcd51eb ******/
		%feature("compactdefaultargs") Trek;
		%feature("autodoc", "Return
-------
TCollection_ExtendedString

Description
-----------
No available documentation.
") Trek;
		TCollection_ExtendedString Trek();

};


%extend TDocStd_PathParser {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TDocStd_XLink *
**********************/
class TDocStd_XLink : public TDF_Attribute {
	public:
		/****** TDocStd_XLink::TDocStd_XLink ******/
		/****** md5 signature: 39a53e3a8cad74f649a58a099e7cd8d3 ******/
		%feature("compactdefaultargs") TDocStd_XLink;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes fields.
") TDocStd_XLink;
		 TDocStd_XLink();

		/****** TDocStd_XLink::AfterAddition ******/
		/****** md5 signature: c10a57c15d27b9db0d635746de6e11f7 ******/
		%feature("compactdefaultargs") AfterAddition;
		%feature("autodoc", "Return
-------
None

Description
-----------
Updates the xlinkroot attribute by adding <self> to its list.
") AfterAddition;
		void AfterAddition();

		/****** TDocStd_XLink::AfterUndo ******/
		/****** md5 signature: 6a782c706f1e9291f121f77d889ed576 ******/
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "
Parameters
----------
anAttDelta: TDF_AttributeDelta
forceIt: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Something to do after applying <anattdelta>.
") AfterUndo;
		virtual Standard_Boolean AfterUndo(const opencascade::handle<TDF_AttributeDelta> & anAttDelta, const Standard_Boolean forceIt = Standard_False);

		/****** TDocStd_XLink::BackupCopy ******/
		/****** md5 signature: be67c343943ad438128f575f7f5feaa1 ******/
		%feature("compactdefaultargs") BackupCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Returns a null handle. raise always for it is nonsense to use this method.
") BackupCopy;
		opencascade::handle<TDF_Attribute> BackupCopy();

		/****** TDocStd_XLink::BeforeRemoval ******/
		/****** md5 signature: d89eaaf972748732c31cf1a2da2bc4a0 ******/
		%feature("compactdefaultargs") BeforeRemoval;
		%feature("autodoc", "Return
-------
None

Description
-----------
Updates the xlinkroot attribute by removing <self> from its list.
") BeforeRemoval;
		void BeforeRemoval();

		/****** TDocStd_XLink::BeforeUndo ******/
		/****** md5 signature: d409c3f1c759e5fb3727056dd12910e7 ******/
		%feature("compactdefaultargs") BeforeUndo;
		%feature("autodoc", "
Parameters
----------
anAttDelta: TDF_AttributeDelta
forceIt: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Something to do before applying <anattdelta>.
") BeforeUndo;
		virtual Standard_Boolean BeforeUndo(const opencascade::handle<TDF_AttributeDelta> & anAttDelta, const Standard_Boolean forceIt = Standard_False);

		/****** TDocStd_XLink::DocumentEntry ******/
		/****** md5 signature: aed3c77da0189600f213269241abb1a9 ******/
		%feature("compactdefaultargs") DocumentEntry;
		%feature("autodoc", "
Parameters
----------
aDocEntry: str

Return
-------
None

Description
-----------
Sets the name adocentry for the external document in this external link attribute.
") DocumentEntry;
		void DocumentEntry(TCollection_AsciiString aDocEntry);

		/****** TDocStd_XLink::DocumentEntry ******/
		/****** md5 signature: 2e49b1b9cd0559e272eb5e5bc90c96a3 ******/
		%feature("compactdefaultargs") DocumentEntry;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns the contents of the document identified by adocentry. adocentry provides external data to this external link attribute.
") DocumentEntry;
		const TCollection_AsciiString & DocumentEntry();

		/****** TDocStd_XLink::Dump ******/
		/****** md5 signature: f10ae7331e480cfb94f59763803fa51d ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
Dumps the attribute on <astream>.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);

		/****** TDocStd_XLink::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the guid for external links.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDocStd_XLink::ID ******/
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the id of the attribute.
") ID;
		const Standard_GUID & ID();

		/****** TDocStd_XLink::LabelEntry ******/
		/****** md5 signature: 6242bd2f6f23f032bd2a986b8970d960 ******/
		%feature("compactdefaultargs") LabelEntry;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label

Return
-------
None

Description
-----------
Sets the label entry for this external link attribute with the label alabel. alabel pilots the importation of data from the document entry.
") LabelEntry;
		void LabelEntry(const TDF_Label & aLabel);

		/****** TDocStd_XLink::LabelEntry ******/
		/****** md5 signature: 2e987d6addb82a1bee92a0d2d9da7462 ******/
		%feature("compactdefaultargs") LabelEntry;
		%feature("autodoc", "
Parameters
----------
aLabEntry: str

Return
-------
None

Description
-----------
Sets the label entry for this external link attribute as a document identified by alabentry.
") LabelEntry;
		void LabelEntry(TCollection_AsciiString aLabEntry);

		/****** TDocStd_XLink::LabelEntry ******/
		/****** md5 signature: bda75a377517bdf3b65a3a4ff247121d ******/
		%feature("compactdefaultargs") LabelEntry;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns the contents of the field <mylabelentry>.
") LabelEntry;
		const TCollection_AsciiString & LabelEntry();

		/****** TDocStd_XLink::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Returns a null handle.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDocStd_XLink::Paste ******/
		/****** md5 signature: 732eeda7b56fec2b5bb3307d96171353 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
intoAttribute: TDF_Attribute
aRelocationTable: TDF_RelocationTable

Return
-------
None

Description
-----------
Does nothing.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & intoAttribute, const opencascade::handle<TDF_RelocationTable> & aRelocationTable);

		/****** TDocStd_XLink::Restore ******/
		/****** md5 signature: f52dc28ed8fe4be2a44014ebfb6e733e ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
anAttribute: TDF_Attribute

Return
-------
None

Description
-----------
Does nothing.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & anAttribute);

		/****** TDocStd_XLink::Set ******/
		/****** md5 signature: 484316d732c49db0f00ef2f49dd912fd ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
atLabel: TDF_Label

Return
-------
opencascade::handle<TDocStd_XLink>

Description
-----------
Sets an empty external reference, at the label alabel.
") Set;
		static opencascade::handle<TDocStd_XLink> Set(const TDF_Label & atLabel);

		/****** TDocStd_XLink::Update ******/
		/****** md5 signature: de31c7fefef822def367ff590e32e7e1 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Reference>

Description
-----------
Updates the data referenced in this external link attribute.
") Update;
		opencascade::handle<TDF_Reference> Update();

};


%make_alias(TDocStd_XLink)

%extend TDocStd_XLink {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class TDocStd_XLinkIterator *
******************************/
class TDocStd_XLinkIterator {
	public:
		/****** TDocStd_XLinkIterator::TDocStd_XLinkIterator ******/
		/****** md5 signature: 17d0e0c752e4b5e365ef44cb6df64158 ******/
		%feature("compactdefaultargs") TDocStd_XLinkIterator;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns an empty iterator;.
") TDocStd_XLinkIterator;
		 TDocStd_XLinkIterator();

		/****** TDocStd_XLinkIterator::TDocStd_XLinkIterator ******/
		/****** md5 signature: 518fdcba08eeb2b00084a7ff08b98b02 ******/
		%feature("compactdefaultargs") TDocStd_XLinkIterator;
		%feature("autodoc", "
Parameters
----------
D: TDocStd_Document

Return
-------
None

Description
-----------
Creates an iterator on reference of <d>.
") TDocStd_XLinkIterator;
		 TDocStd_XLinkIterator(const opencascade::handle<TDocStd_Document> & D);

		/****** TDocStd_XLinkIterator::Initialize ******/
		/****** md5 signature: 72e60e820ae0694ae8f07fd09bd9aeff ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
D: TDocStd_Document

Return
-------
None

Description
-----------
Restarts an iteration with <d>.
") Initialize;
		void Initialize(const opencascade::handle<TDocStd_Document> & D);

		/****** TDocStd_XLinkIterator::More ******/
		/****** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there is a current item in the iteration.
") More;
		Standard_Boolean More();

		/****** TDocStd_XLinkIterator::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Move to the next item; raises if there is no more item.
") Next;
		void Next();

		/****** TDocStd_XLinkIterator::Value ******/
		/****** md5 signature: 5f4b96c0711ba7f24b3f8859cb074e4f ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
TDocStd_XLinkPtr

Description
-----------
Returns the current item; a null handle if there is none.
") Value;
		TDocStd_XLinkPtr Value();

};


%extend TDocStd_XLinkIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TDocStd_XLinkRoot *
**************************/
%nodefaultctor TDocStd_XLinkRoot;
class TDocStd_XLinkRoot : public TDF_Attribute {
	public:
		/****** TDocStd_XLinkRoot::BackupCopy ******/
		/****** md5 signature: be67c343943ad438128f575f7f5feaa1 ******/
		%feature("compactdefaultargs") BackupCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Returns a null handle.
") BackupCopy;
		opencascade::handle<TDF_Attribute> BackupCopy();

		/****** TDocStd_XLinkRoot::Dump ******/
		/****** md5 signature: f10ae7331e480cfb94f59763803fa51d ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
Dumps the attribute on <astream>.
") Dump;
		Standard_OStream & Dump(std::ostream &OutValue);

		/****** TDocStd_XLinkRoot::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the id: 2a96b61d-ec8b-11d0-bee7-080009dc3333.
") GetID;
		static const Standard_GUID & GetID();

		/****** TDocStd_XLinkRoot::ID ******/
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the id of the attribute.
") ID;
		const Standard_GUID & ID();

		/****** TDocStd_XLinkRoot::Insert ******/
		/****** md5 signature: a80101668d59dec9cb6049e1ad5aa1dc ******/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
anXLinkPtr: TDocStd_XLinkPtr

Return
-------
None

Description
-----------
Inserts <anxlinkptr> at the beginning of the xlink chain.
") Insert;
		static void Insert(const TDocStd_XLinkPtr & anXLinkPtr);

		/****** TDocStd_XLinkRoot::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Returns a null handle.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TDocStd_XLinkRoot::Paste ******/
		/****** md5 signature: 732eeda7b56fec2b5bb3307d96171353 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
intoAttribute: TDF_Attribute
aRelocationTable: TDF_RelocationTable

Return
-------
None

Description
-----------
Does nothing.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & intoAttribute, const opencascade::handle<TDF_RelocationTable> & aRelocationTable);

		/****** TDocStd_XLinkRoot::Remove ******/
		/****** md5 signature: e4a602bdf2acecc2ee81080c6cd72f25 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
anXLinkPtr: TDocStd_XLinkPtr

Return
-------
None

Description
-----------
Removes <anxlinkptr> from the xlink chain, if it exists.
") Remove;
		static void Remove(const TDocStd_XLinkPtr & anXLinkPtr);

		/****** TDocStd_XLinkRoot::Restore ******/
		/****** md5 signature: f52dc28ed8fe4be2a44014ebfb6e733e ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
anAttribute: TDF_Attribute

Return
-------
None

Description
-----------
Does nothing.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & anAttribute);

		/****** TDocStd_XLinkRoot::Set ******/
		/****** md5 signature: f26158934dc78aa70e28353b34d00047 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
aDF: TDF_Data

Return
-------
opencascade::handle<TDocStd_XLinkRoot>

Description
-----------
Sets an empty xlinkroot to root or gets the existing one. only one attribute per tdf_data.
") Set;
		static opencascade::handle<TDocStd_XLinkRoot> Set(const opencascade::handle<TDF_Data> & aDF);

};


%make_alias(TDocStd_XLinkRoot)

%extend TDocStd_XLinkRoot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TDocStd_XLinkTool *
**************************/
class TDocStd_XLinkTool {
	public:
		/****** TDocStd_XLinkTool::TDocStd_XLinkTool ******/
		/****** md5 signature: 62a3035690eb5598ecb230b66226a54d ******/
		%feature("compactdefaultargs") TDocStd_XLinkTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TDocStd_XLinkTool;
		 TDocStd_XLinkTool();

		/****** TDocStd_XLinkTool::Copy ******/
		/****** md5 signature: 40287a29bb62ecf8fd177c44ed29dc25 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "
Parameters
----------
intarget: TDF_Label
fromsource: TDF_Label

Return
-------
None

Description
-----------
Copy the content of <fromsource> under <intarget>. no link is registered. no check is done. example opencascade::handle<tdocstd_document> doc, xdoc; tdf_label l, xl; tdocstd_xlinktool xlinktool; xlinktool.copy(l,xl); exceptions: standard_domainerror if the contents of fromsource are not entirely in the scope of this label, in other words, are not self-contained. !!! ==> warning: if the document manages shapes use the next way: tdocstd_xlinktool xlinktool; xlinktool.copy(l,xl); toptools_datamapofshapeshape m; tnaming::changeshapes(target,m);.
") Copy;
		virtual void Copy(const TDF_Label & intarget, const TDF_Label & fromsource);

		/****** TDocStd_XLinkTool::CopyWithLink ******/
		/****** md5 signature: 1e751ce78167012e15d258327b145ca4 ******/
		%feature("compactdefaultargs") CopyWithLink;
		%feature("autodoc", "
Parameters
----------
intarget: TDF_Label
fromsource: TDF_Label

Return
-------
None

Description
-----------
Copies the content of the label <fromsource> to the label <intarget>. the link is registered with an xlink attribute by <intarget> label. if the content of <fromsource> is not self-contained, and/or <intarget> has already an xlink attribute, an exception is raised.
") CopyWithLink;
		void CopyWithLink(const TDF_Label & intarget, const TDF_Label & fromsource);

		/****** TDocStd_XLinkTool::DataSet ******/
		/****** md5 signature: 23008ec82af3c321329d8aca96ad4c70 ******/
		%feature("compactdefaultargs") DataSet;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_DataSet>

Description
-----------
No available documentation.
") DataSet;
		opencascade::handle<TDF_DataSet> DataSet();

		/****** TDocStd_XLinkTool::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** TDocStd_XLinkTool::RelocationTable ******/
		/****** md5 signature: 671660b65181661cbeabfffeb9205cbd ******/
		%feature("compactdefaultargs") RelocationTable;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_RelocationTable>

Description
-----------
No available documentation.
") RelocationTable;
		opencascade::handle<TDF_RelocationTable> RelocationTable();

		/****** TDocStd_XLinkTool::UpdateLink ******/
		/****** md5 signature: 957825b1452e7ebab5f8e01bf712f434 ******/
		%feature("compactdefaultargs") UpdateLink;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
None

Description
-----------
Update the external reference set at <l>. example opencascade::handle<tdocstd_document> adoc; if (!ocaftest::getdocument(1,adoc)) return 1; opencascade::handle<tdatastd_reference> aref; tdocstd_xlinktool xlinktool; if (!ocaftest::find(adoc,2),tdatastd_reference::getid(),aref) return 1; xlinktool.updatelink(aref->label()); exceptions standard_domainerror if <l> has no xlink attribute.
") UpdateLink;
		void UpdateLink(const TDF_Label & L);

};


%extend TDocStd_XLinkTool {
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
def tdocstd_IDList(*args):
	return tdocstd.IDList(*args)

@deprecated
def TDocStd_Document_CurrentStorageFormatVersion(*args):
	return TDocStd_Document.CurrentStorageFormatVersion(*args)

@deprecated
def TDocStd_Document_Get(*args):
	return TDocStd_Document.Get(*args)

@deprecated
def TDocStd_Modified_Add(*args):
	return TDocStd_Modified.Add(*args)

@deprecated
def TDocStd_Modified_Clear(*args):
	return TDocStd_Modified.Clear(*args)

@deprecated
def TDocStd_Modified_Contains(*args):
	return TDocStd_Modified.Contains(*args)

@deprecated
def TDocStd_Modified_Get(*args):
	return TDocStd_Modified.Get(*args)

@deprecated
def TDocStd_Modified_GetID(*args):
	return TDocStd_Modified.GetID(*args)

@deprecated
def TDocStd_Modified_IsEmpty(*args):
	return TDocStd_Modified.IsEmpty(*args)

@deprecated
def TDocStd_Modified_Remove(*args):
	return TDocStd_Modified.Remove(*args)

@deprecated
def TDocStd_Owner_GetDocument(*args):
	return TDocStd_Owner.GetDocument(*args)

@deprecated
def TDocStd_Owner_GetID(*args):
	return TDocStd_Owner.GetID(*args)

@deprecated
def TDocStd_Owner_SetDocument(*args):
	return TDocStd_Owner.SetDocument(*args)

@deprecated
def TDocStd_Owner_SetDocument(*args):
	return TDocStd_Owner.SetDocument(*args)

@deprecated
def TDocStd_XLink_GetID(*args):
	return TDocStd_XLink.GetID(*args)

@deprecated
def TDocStd_XLink_Set(*args):
	return TDocStd_XLink.Set(*args)

@deprecated
def TDocStd_XLinkRoot_GetID(*args):
	return TDocStd_XLinkRoot.GetID(*args)

@deprecated
def TDocStd_XLinkRoot_Insert(*args):
	return TDocStd_XLinkRoot.Insert(*args)

@deprecated
def TDocStd_XLinkRoot_Remove(*args):
	return TDocStd_XLinkRoot.Remove(*args)

@deprecated
def TDocStd_XLinkRoot_Set(*args):
	return TDocStd_XLinkRoot.Set(*args)

}
