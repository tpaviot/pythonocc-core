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
%define DEDOCSTRING
"DE module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_de.html"
%enddef
%module (package="OCC.Core", docstring=DEDOCSTRING) DE


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
#include<DE_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TCollection_module.hxx>
#include<TColStd_module.hxx>
#include<TDocStd_module.hxx>
#include<XSControl_module.hxx>
#include<Message_module.hxx>
#include<TopoDS_module.hxx>
#include<CDF_module.hxx>
#include<TopTools_module.hxx>
#include<Transfer_module.hxx>
#include<TDF_module.hxx>
#include<PCDM_module.hxx>
#include<MoniTool_module.hxx>
#include<Interface_module.hxx>
#include<IFSelect_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TCollection.i
%import TColStd.i
%import TDocStd.i
%import XSControl.i
%import Message.i
%import TopoDS.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(DE_ConfigurationContext)
%wrap_handle(DE_ConfigurationNode)
%wrap_handle(DE_Provider)
%wrap_handle(DE_Wrapper)
/* end handles declaration */

/* templates */
%template(DE_ConfigurationFormatMap) NCollection_DataMap<TCollection_AsciiString,DE_ConfigurationVendorMap>;
%template(DE_ConfigurationVendorMap) NCollection_IndexedDataMap<TCollection_AsciiString,opencascade::handle<DE_ConfigurationNode>>;
%template(DE_ResourceMap) NCollection_DataMap<TCollection_AsciiString,TCollection_AsciiString>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TCollection_AsciiString, DE_ConfigurationVendorMap> DE_ConfigurationFormatMap;
typedef NCollection_IndexedDataMap<TCollection_AsciiString, opencascade::handle<DE_ConfigurationNode>> DE_ConfigurationVendorMap;
typedef NCollection_DataMap<TCollection_AsciiString, TCollection_AsciiString> DE_ResourceMap;
/* end typedefs declaration */

/********************************
* class DE_ConfigurationContext *
********************************/
class DE_ConfigurationContext : public Standard_Transient {
	public:
		/****** DE_ConfigurationContext::DE_ConfigurationContext ******/
		/****** md5 signature: 6f8978b1213ccbf2324cb57020cddb9e ******/
		%feature("compactdefaultargs") DE_ConfigurationContext;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty tool.
") DE_ConfigurationContext;
		 DE_ConfigurationContext();

		/****** DE_ConfigurationContext::BooleanVal ******/
		/****** md5 signature: 39a405c397dbbfd6b8ad8f1477e31469 ******/
		%feature("compactdefaultargs") BooleanVal;
		%feature("autodoc", "
Parameters
----------
theParam: str
theDefValue: bool
theScope: str (optional, default to "")

Return
-------
bool

Description
-----------
Gets value of parameter as being of specific type 
Input parameter: theParam complex parameter name 
Input parameter: theDefValue value by default if param is not found or has wrong type 
Input parameter: theScope base parameter name 
Return: specific type value.
") BooleanVal;
		Standard_Boolean BooleanVal(TCollection_AsciiString theParam, const Standard_Boolean theDefValue, TCollection_AsciiString theScope = "");

		/****** DE_ConfigurationContext::GetBoolean ******/
		/****** md5 signature: 306703583f727555f4b7620b1de3e55e ******/
		%feature("compactdefaultargs") GetBoolean;
		%feature("autodoc", "
Parameters
----------
theParam: str
theScope: str (optional, default to "")

Return
-------
theValue: bool

Description
-----------
Gets value of parameter as being of specific type 
Input parameter: theParam complex parameter name @param[out] theValue value to get by parameter 
Input parameter: theScope base parameter name 
Return: Standard_False if parameter is not defined or has a wrong type.
") GetBoolean;
		Standard_Boolean GetBoolean(TCollection_AsciiString theParam, Standard_Boolean &OutValue, TCollection_AsciiString theScope = "");

		/****** DE_ConfigurationContext::GetInteger ******/
		/****** md5 signature: 88fba8515b9407a97f258d961c684f50 ******/
		%feature("compactdefaultargs") GetInteger;
		%feature("autodoc", "
Parameters
----------
theParam: str
theScope: str (optional, default to "")

Return
-------
theValue: int

Description
-----------
Gets value of parameter as being of specific type 
Input parameter: theParam complex parameter name @param[out] theValue value to get by parameter 
Input parameter: theScope base parameter name 
Return: Standard_False if parameter is not defined or has a wrong type.
") GetInteger;
		Standard_Boolean GetInteger(TCollection_AsciiString theParam, Standard_Integer &OutValue, TCollection_AsciiString theScope = "");

		/****** DE_ConfigurationContext::GetInternalMap ******/
		/****** md5 signature: 8008565a02e4edcec3f31a539c3e3790 ******/
		%feature("compactdefaultargs") GetInternalMap;
		%feature("autodoc", "Return
-------
DE_ResourceMap

Description
-----------
Gets internal resource map 
Return: map with resource value.
") GetInternalMap;
		const DE_ResourceMap & GetInternalMap();

		/****** DE_ConfigurationContext::GetReal ******/
		/****** md5 signature: 5c258f8e0dc09497a133e3fb2aa542ec ******/
		%feature("compactdefaultargs") GetReal;
		%feature("autodoc", "
Parameters
----------
theParam: str
theScope: str (optional, default to "")

Return
-------
theValue: float

Description
-----------
Gets value of parameter as being of specific type 
Input parameter: theParam complex parameter name @param[out] theValue value to get by parameter 
Input parameter: theScope base parameter name 
Return: Standard_False if parameter is not defined or has a wrong type.
") GetReal;
		Standard_Boolean GetReal(TCollection_AsciiString theParam, Standard_Real &OutValue, TCollection_AsciiString theScope = "");

		/****** DE_ConfigurationContext::GetString ******/
		/****** md5 signature: 173aecee56d4aebec31415bb2c10a9d5 ******/
		%feature("compactdefaultargs") GetString;
		%feature("autodoc", "
Parameters
----------
theParam: str
theValue: str
theScope: str (optional, default to "")

Return
-------
bool

Description
-----------
Gets value of parameter as being of specific type 
Input parameter: theParam complex parameter name @param[out] theValue value to get by parameter 
Input parameter: theScope base parameter name 
Return: Standard_False if parameter is not defined or has a wrong type.
") GetString;
		Standard_Boolean GetString(TCollection_AsciiString theParam, TCollection_AsciiString & theValue, TCollection_AsciiString theScope = "");

		/****** DE_ConfigurationContext::GetStringSeq ******/
		/****** md5 signature: 7087b14b95eaad840e609bb71fd8f86f ******/
		%feature("compactdefaultargs") GetStringSeq;
		%feature("autodoc", "
Parameters
----------
theParam: str
theValue: TColStd_ListOfAsciiString
theScope: str (optional, default to "")

Return
-------
bool

Description
-----------
Gets value of parameter as being of specific type 
Input parameter: theParam complex parameter name @param[out] theValue value to get by parameter 
Input parameter: theScope base parameter name 
Return: Standard_False if parameter is not defined or has a wrong type.
") GetStringSeq;
		Standard_Boolean GetStringSeq(TCollection_AsciiString theParam, TColStd_ListOfAsciiString & theValue, TCollection_AsciiString theScope = "");

		/****** DE_ConfigurationContext::IntegerVal ******/
		/****** md5 signature: 2328fede3f47d9dc4e0421406847f927 ******/
		%feature("compactdefaultargs") IntegerVal;
		%feature("autodoc", "
Parameters
----------
theParam: str
theDefValue: int
theScope: str (optional, default to "")

Return
-------
int

Description
-----------
Gets value of parameter as being of specific type 
Input parameter: theParam complex parameter name 
Input parameter: theDefValue value by default if param is not found or has wrong type 
Input parameter: theScope base parameter name 
Return: specific type value.
") IntegerVal;
		Standard_Integer IntegerVal(TCollection_AsciiString theParam, const Standard_Integer theDefValue, TCollection_AsciiString theScope = "");

		/****** DE_ConfigurationContext::IsParamSet ******/
		/****** md5 signature: 514011ad24f2fe71af50c4db2aa4f335 ******/
		%feature("compactdefaultargs") IsParamSet;
		%feature("autodoc", "
Parameters
----------
theParam: str
theScope: str (optional, default to "")

Return
-------
bool

Description
-----------
Checks for existing the parameter name 
Input parameter: theParam complex parameter name 
Input parameter: theScope base parameter name 
Return: Standard_True if parameter is defined in the resource file.
") IsParamSet;
		Standard_Boolean IsParamSet(TCollection_AsciiString theParam, TCollection_AsciiString theScope = "");

		/****** DE_ConfigurationContext::Load ******/
		/****** md5 signature: 4e8a302be9369683c07217887175d412 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
theConfiguration: str

Return
-------
bool

Description
-----------
Import the custom configuration Save all parameters with their values. 
Input parameter: theConfiguration path to configuration file or string value 
Return: true in case of success, false otherwise.
") Load;
		Standard_Boolean Load(TCollection_AsciiString theConfiguration);

		/****** DE_ConfigurationContext::LoadFile ******/
		/****** md5 signature: 18e80d660da0dece9383ef8c96a1925f ******/
		%feature("compactdefaultargs") LoadFile;
		%feature("autodoc", "
Parameters
----------
theFile: str

Return
-------
bool

Description
-----------
Import the resource file. Save all parameters with their values. 
Input parameter: theFile path to the resource file 
Return: true in case of success, false otherwise.
") LoadFile;
		Standard_Boolean LoadFile(TCollection_AsciiString theFile);

		/****** DE_ConfigurationContext::LoadStr ******/
		/****** md5 signature: b4c4f75492d28f07b4e7f36ad6859270 ******/
		%feature("compactdefaultargs") LoadStr;
		%feature("autodoc", "
Parameters
----------
theResource: str

Return
-------
bool

Description
-----------
Import the resource string. Save all parameters with their values. 
Input parameter: theResource string with resource content 
Return: true in case of success, false otherwise.
") LoadStr;
		Standard_Boolean LoadStr(TCollection_AsciiString theResource);

		/****** DE_ConfigurationContext::RealVal ******/
		/****** md5 signature: fb5bc95b5b186eec2c62b384c68e6789 ******/
		%feature("compactdefaultargs") RealVal;
		%feature("autodoc", "
Parameters
----------
theParam: str
theDefValue: float
theScope: str (optional, default to "")

Return
-------
float

Description
-----------
Gets value of parameter as being of specific type 
Input parameter: theParam complex parameter name 
Input parameter: theDefValue value by default if param is not found or has wrong type 
Input parameter: theScope base parameter name 
Return: specific type value.
") RealVal;
		Standard_Real RealVal(TCollection_AsciiString theParam, const Standard_Real theDefValue, TCollection_AsciiString theScope = "");

		/****** DE_ConfigurationContext::StringVal ******/
		/****** md5 signature: 9e1849b2727da98db2b1bf37b408bfab ******/
		%feature("compactdefaultargs") StringVal;
		%feature("autodoc", "
Parameters
----------
theParam: str
theDefValue: str
theScope: str (optional, default to "")

Return
-------
TCollection_AsciiString

Description
-----------
Gets value of parameter as being of specific type 
Input parameter: theParam complex parameter name 
Input parameter: theDefValue value by default if param is not found or has wrong type 
Input parameter: theScope base parameter name 
Return: specific type value.
") StringVal;
		TCollection_AsciiString StringVal(TCollection_AsciiString theParam, TCollection_AsciiString theDefValue, TCollection_AsciiString theScope = "");

};


%make_alias(DE_ConfigurationContext)

%extend DE_ConfigurationContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class DE_ConfigurationNode *
*****************************/
%nodefaultctor DE_ConfigurationNode;
class DE_ConfigurationNode : public Standard_Transient {
	public:
		class DE_SectionGlobal {};
		/****** DE_ConfigurationNode::BuildProvider ******/
		/****** md5 signature: 36ab78b32f0a19a9158d4d9237830452 ******/
		%feature("compactdefaultargs") BuildProvider;
		%feature("autodoc", "Return
-------
opencascade::handle<DE_Provider>

Description
-----------
Creates new provider for the own format 
Return: new created provider.
") BuildProvider;
		virtual opencascade::handle<DE_Provider> BuildProvider();

		/****** DE_ConfigurationNode::CheckContent ******/
		/****** md5 signature: 95f1f32c115dbc98287bae8e93cac461 ******/
		%feature("compactdefaultargs") CheckContent;
		%feature("autodoc", "
Parameters
----------
theBuffer: NCollection_Buffer

Return
-------
bool

Description
-----------
Checks the file content to verify a format 
Input parameter: theBuffer read stream buffer to check content 
Return: Standard_True if file is supported by a current provider.
") CheckContent;
		virtual bool CheckContent(const opencascade::handle<NCollection_Buffer> & theBuffer);

		/****** DE_ConfigurationNode::CheckExtension ******/
		/****** md5 signature: 27100baf59d3bd02b88ea571e16cbcd3 ******/
		%feature("compactdefaultargs") CheckExtension;
		%feature("autodoc", "
Parameters
----------
theExtension: str

Return
-------
bool

Description
-----------
Checks the file extension to verify a format 
Input parameter: theExtension input file extension 
Return: Standard_True if file is supported by a current provider.
") CheckExtension;
		virtual bool CheckExtension(TCollection_AsciiString theExtension);

		/****** DE_ConfigurationNode::Copy ******/
		/****** md5 signature: 04e01affadd9be62ec4a6bf2cb421681 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<DE_ConfigurationNode>

Description
-----------
Copies values of all fields 
Return: new object with the same field values.
") Copy;
		virtual opencascade::handle<DE_ConfigurationNode> Copy();

		/****** DE_ConfigurationNode::CustomActivation ******/
		/****** md5 signature: aefc913885bf6690f801021e14c05c82 ******/
		%feature("compactdefaultargs") CustomActivation;
		%feature("autodoc", "
Parameters
----------
&: TColStd_ListOfAsciiString

Return
-------
None

Description
-----------
Custom function to activate commercial DE component. The input is special sequence of values that described in specific component documentation. Order is important. Each component can have own way of activation. //! The main goal - real-time loading plug-in activation. OpenSource components don't need to have activation process.
") CustomActivation;
		virtual void CustomActivation(const TColStd_ListOfAsciiString &);

		/****** DE_ConfigurationNode::GetExtensions ******/
		/****** md5 signature: 6817e63aa129d8a185e6f5a2ec2a2914 ******/
		%feature("compactdefaultargs") GetExtensions;
		%feature("autodoc", "Return
-------
TColStd_ListOfAsciiString

Description
-----------
Gets list of supported file extensions 
Return: list of extensions.
") GetExtensions;
		virtual TColStd_ListOfAsciiString GetExtensions();

		/****** DE_ConfigurationNode::GetFormat ******/
		/****** md5 signature: 463cfc83b2259fc53dc9328af3a9b59c ******/
		%feature("compactdefaultargs") GetFormat;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Gets CAD format name of associated provider 
Return: provider CAD format.
") GetFormat;
		virtual TCollection_AsciiString GetFormat();

		/****** DE_ConfigurationNode::GetVendor ******/
		/****** md5 signature: ffb781bf88c8a183adbcecdbc3d3b042 ******/
		%feature("compactdefaultargs") GetVendor;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Gets provider's vendor name of associated provider 
Return: provider's vendor name.
") GetVendor;
		virtual TCollection_AsciiString GetVendor();

		/****** DE_ConfigurationNode::IsEnabled ******/
		/****** md5 signature: cf6340b5d1701025377d42db5601a57b ******/
		%feature("compactdefaultargs") IsEnabled;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Gets the provider loading status 
Return: Standard_True if the load is correct.
") IsEnabled;
		Standard_Boolean IsEnabled();

		/****** DE_ConfigurationNode::IsExportSupported ******/
		/****** md5 signature: be38b1e13370efd225253f651dabd3e4 ******/
		%feature("compactdefaultargs") IsExportSupported;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks the export supporting 
Return: Standard_True if export is support.
") IsExportSupported;
		virtual bool IsExportSupported();

		/****** DE_ConfigurationNode::IsImportSupported ******/
		/****** md5 signature: 53c532301573c0465fbcc177f134f054 ******/
		%feature("compactdefaultargs") IsImportSupported;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks the import supporting 
Return: Standard_True if import is support.
") IsImportSupported;
		virtual bool IsImportSupported();

		/****** DE_ConfigurationNode::Load ******/
		/****** md5 signature: 9b5cc764241d5877675334ad8da3c1e3 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
theResourcePath: str (optional, default to "")

Return
-------
bool

Description
-----------
Updates values according the resource file 
Input parameter: theResourcePath file path to resource 
Return: True if Load was successful.
") Load;
		virtual bool Load(TCollection_AsciiString theResourcePath = "");

		/****** DE_ConfigurationNode::Load ******/
		/****** md5 signature: 1322ab703d21119666bf65dd309eecc1 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
theResource: DE_ConfigurationContext

Return
-------
bool

Description
-----------
Updates values according the resource 
Input parameter: theResource input resource to use 
Return: True if Load was successful.
") Load;
		virtual bool Load(const opencascade::handle<DE_ConfigurationContext> & theResource);

		/****** DE_ConfigurationNode::Save ******/
		/****** md5 signature: 300b6c1565eb95b4415a1d3dabc4aceb ******/
		%feature("compactdefaultargs") Save;
		%feature("autodoc", "
Parameters
----------
theResourcePath: str

Return
-------
bool

Description
-----------
Writes configuration to the resource file 
Input parameter: theResourcePath file path to resource 
Return: True if Save was successful.
") Save;
		bool Save(TCollection_AsciiString theResourcePath);

		/****** DE_ConfigurationNode::Save ******/
		/****** md5 signature: f2660a91e37cf35a2de94d1989e1425d ******/
		%feature("compactdefaultargs") Save;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Writes configuration to the string 
Return: result resource string.
") Save;
		virtual TCollection_AsciiString Save();

		/****** DE_ConfigurationNode::SetEnabled ******/
		/****** md5 signature: 08fbab9585baa2c996daa67d3fe8cb2d ******/
		%feature("compactdefaultargs") SetEnabled;
		%feature("autodoc", "
Parameters
----------
theIsLoaded: bool

Return
-------
None

Description
-----------
Sets the provider loading status 
Input parameter: theIsLoaded input load status.
") SetEnabled;
		void SetEnabled(const Standard_Boolean theIsLoaded);

		/****** DE_ConfigurationNode::UpdateLoad ******/
		/****** md5 signature: e4d00b4aa4bb21adbf62beb264cc06cd ******/
		%feature("compactdefaultargs") UpdateLoad;
		%feature("autodoc", "
Parameters
----------
theToImport: bool
theToKeep: bool

Return
-------
bool

Description
-----------
Update loading status. Checking for the ability to read and write. 
Input parameter: theToImport flag to updates for import. Standard_True-import, Standard_False-export 
Input parameter: theToKeep flag to save update result 
Return: Standard_True, if node can be used.
") UpdateLoad;
		virtual bool UpdateLoad(const Standard_Boolean theToImport, const Standard_Boolean theToKeep);

};


%make_alias(DE_ConfigurationNode)

%extend DE_ConfigurationNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class DE_PluginHolder *
************************/
/********************
* class DE_Provider *
********************/
%nodefaultctor DE_Provider;
class DE_Provider : public Standard_Transient {
	public:
		/****** DE_Provider::GetFormat ******/
		/****** md5 signature: 463cfc83b2259fc53dc9328af3a9b59c ******/
		%feature("compactdefaultargs") GetFormat;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Gets CAD format name of associated provider 
Return: provider CAD format.
") GetFormat;
		virtual TCollection_AsciiString GetFormat();

		/****** DE_Provider::GetNode ******/
		/****** md5 signature: 8a3b88dcc8774135ce97bdb944c8228c ******/
		%feature("compactdefaultargs") GetNode;
		%feature("autodoc", "Return
-------
opencascade::handle<DE_ConfigurationNode>

Description
-----------
Gets internal configuration node 
Return: configuration node object.
") GetNode;
		opencascade::handle<DE_ConfigurationNode> GetNode();

		/****** DE_Provider::GetVendor ******/
		/****** md5 signature: ffb781bf88c8a183adbcecdbc3d3b042 ******/
		%feature("compactdefaultargs") GetVendor;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Gets provider's vendor name of associated provider 
Return: provider's vendor name.
") GetVendor;
		virtual TCollection_AsciiString GetVendor();

		/****** DE_Provider::Read ******/
		/****** md5 signature: ffd5e83c299a2aac49b58d0084ab11d6 ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
thePath: str
theDocument: TDocStd_Document
theWS: XSControl_WorkSession
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Reads a CAD file, according internal configuration 
Input parameter: thePath path to the import CAD file @param[out] theDocument document to save result 
Input parameter: theWS current work session 
Input parameter: theProgress progress indicator 
Return: True if Read was successful.
") Read;
		virtual Standard_Boolean Read(TCollection_AsciiString thePath, const opencascade::handle<TDocStd_Document> & theDocument, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DE_Provider::Read ******/
		/****** md5 signature: c1e34bf06baf1ea974ad18b724413618 ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
thePath: str
theDocument: TDocStd_Document
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Reads a CAD file, according internal configuration 
Input parameter: thePath path to the import CAD file @param[out] theDocument document to save result 
Input parameter: theProgress progress indicator 
Return: True if Read was successful.
") Read;
		virtual Standard_Boolean Read(TCollection_AsciiString thePath, const opencascade::handle<TDocStd_Document> & theDocument, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DE_Provider::Read ******/
		/****** md5 signature: 55639ad04662343e547548226928d55b ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
thePath: str
theShape: TopoDS_Shape
theWS: XSControl_WorkSession
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Reads a CAD file, according internal configuration 
Input parameter: thePath path to the import CAD file @param[out] theShape shape to save result 
Input parameter: theWS current work session 
Input parameter: theProgress progress indicator 
Return: True if Read was successful.
") Read;
		virtual Standard_Boolean Read(TCollection_AsciiString thePath, TopoDS_Shape & theShape, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DE_Provider::Read ******/
		/****** md5 signature: dccc17e0a0a544feace2161f02bcc4e6 ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
thePath: str
theShape: TopoDS_Shape
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Reads a CAD file, according internal configuration 
Input parameter: thePath path to the import CAD file @param[out] theShape shape to save result 
Input parameter: theProgress progress indicator 
Return: True if Read was successful.
") Read;
		virtual Standard_Boolean Read(TCollection_AsciiString thePath, TopoDS_Shape & theShape, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DE_Provider::SetNode ******/
		/****** md5 signature: 6357926adf4af2af0332dfba77e7d554 ******/
		%feature("compactdefaultargs") SetNode;
		%feature("autodoc", "
Parameters
----------
theNode: DE_ConfigurationNode

Return
-------
None

Description
-----------
Sets internal configuration node 
Input parameter: theNode configuration node to set.
") SetNode;
		void SetNode(const opencascade::handle<DE_ConfigurationNode> & theNode);

		/****** DE_Provider::Write ******/
		/****** md5 signature: f341356a003498c8128edb7fbe413575 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
thePath: str
theDocument: TDocStd_Document
theWS: XSControl_WorkSession
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Writes a CAD file, according internal configuration 
Input parameter: thePath path to the export CAD file @param[out] theDocument document to export 
Input parameter: theWS current work session 
Input parameter: theProgress progress indicator 
Return: True if Write was successful.
") Write;
		virtual Standard_Boolean Write(TCollection_AsciiString thePath, const opencascade::handle<TDocStd_Document> & theDocument, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DE_Provider::Write ******/
		/****** md5 signature: 2e47d8fb696b938e5600c74ce12da037 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
thePath: str
theDocument: TDocStd_Document
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Writes a CAD file, according internal configuration 
Input parameter: thePath path to the export CAD file @param[out] theDocument document to export 
Input parameter: theProgress progress indicator 
Return: True if Write was successful.
") Write;
		virtual Standard_Boolean Write(TCollection_AsciiString thePath, const opencascade::handle<TDocStd_Document> & theDocument, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DE_Provider::Write ******/
		/****** md5 signature: 368389284ef9549d28132af2ec7852cc ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
thePath: str
theShape: TopoDS_Shape
theWS: XSControl_WorkSession
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Writes a CAD file, according internal configuration 
Input parameter: thePath path to the export CAD file @param[out] theShape shape to export 
Input parameter: theWS current work session 
Input parameter: theProgress progress indicator 
Return: True if Write was successful.
") Write;
		virtual Standard_Boolean Write(TCollection_AsciiString thePath, const TopoDS_Shape & theShape, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DE_Provider::Write ******/
		/****** md5 signature: 73e0be0cefb41c11946f9e840381252b ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
thePath: str
theShape: TopoDS_Shape
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Writes a CAD file, according internal configuration 
Input parameter: thePath path to the export CAD file @param[out] theShape shape to export 
Input parameter: theProgress progress indicator 
Return: True if Write was successful.
") Write;
		virtual Standard_Boolean Write(TCollection_AsciiString thePath, const TopoDS_Shape & theShape, const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%make_alias(DE_Provider)

%extend DE_Provider {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class DE_ShapeFixParameters *
******************************/
/*******************
* class DE_Wrapper *
*******************/
class DE_Wrapper : public Standard_Transient {
	public:
		/****** DE_Wrapper::DE_Wrapper ******/
		/****** md5 signature: cab56560ee66ff0a167a8682110f3c23 ******/
		%feature("compactdefaultargs") DE_Wrapper;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes all field by default.
") DE_Wrapper;
		 DE_Wrapper();

		/****** DE_Wrapper::DE_Wrapper ******/
		/****** md5 signature: 9df7a61d716d7fb9cf09f05b39fff19e ******/
		%feature("compactdefaultargs") DE_Wrapper;
		%feature("autodoc", "
Parameters
----------
theWrapper: DE_Wrapper

Return
-------
None

Description
-----------
Copies values of all fields 
Input parameter: theWrapper object to copy.
") DE_Wrapper;
		 DE_Wrapper(const opencascade::handle<DE_Wrapper> & theWrapper);

		/****** DE_Wrapper::Bind ******/
		/****** md5 signature: 25c481436cdaae1e3ed686394dd61ae2 ******/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "
Parameters
----------
theNode: DE_ConfigurationNode

Return
-------
bool

Description
-----------
Creates new node copy and adds to the map 
Input parameter: theNode input node to copy 
Return: Standard_True if binded.
") Bind;
		Standard_Boolean Bind(const opencascade::handle<DE_ConfigurationNode> & theNode);

		/****** DE_Wrapper::ChangePriority ******/
		/****** md5 signature: e156ca6527dd6624205892852e05b609 ******/
		%feature("compactdefaultargs") ChangePriority;
		%feature("autodoc", "
Parameters
----------
theFormat: str
theVendorPriority: TColStd_ListOfAsciiString
theToDisable: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Changes provider priority to one format if it exists 
Input parameter: theFormat input node CAD format 
Input parameter: theVendorPriority priority of work with vendors 
Input parameter: theToDisable flag for disabling nodes that are not included in the priority.
") ChangePriority;
		void ChangePriority(TCollection_AsciiString theFormat, const TColStd_ListOfAsciiString & theVendorPriority, const Standard_Boolean theToDisable = Standard_False);

		/****** DE_Wrapper::ChangePriority ******/
		/****** md5 signature: 9ae8e808309bf1f6a3804b1ac5811235 ******/
		%feature("compactdefaultargs") ChangePriority;
		%feature("autodoc", "
Parameters
----------
theVendorPriority: TColStd_ListOfAsciiString
theToDisable: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Changes provider priority to all loaded nodes 
Input parameter: theVendorPriority priority of work with vendors 
Input parameter: theToDisable flag for disabling nodes that are not included in the priority.
") ChangePriority;
		void ChangePriority(const TColStd_ListOfAsciiString & theVendorPriority, const Standard_Boolean theToDisable = Standard_False);

		/****** DE_Wrapper::Copy ******/
		/****** md5 signature: eda87f309cc4af4bc0dc983df7323008 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<DE_Wrapper>

Description
-----------
Copies values of all fields 
Return: new object with the same field values.
") Copy;
		virtual opencascade::handle<DE_Wrapper> Copy();

		/****** DE_Wrapper::Find ******/
		/****** md5 signature: 98cf7f9b76f8dd3c2ea6d6377f80054b ******/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "
Parameters
----------
theFormat: str
theVendor: str
theNode: DE_ConfigurationNode

Return
-------
bool

Description
-----------
Finds a node associated with input format and vendor 
Input parameter: theFormat input node CAD format 
Input parameter: theVendor input node vendor name @param[out] theNode output node 
Return: Standard_True if the node is found.
") Find;
		Standard_Boolean Find(TCollection_AsciiString theFormat, TCollection_AsciiString theVendor, opencascade::handle<DE_ConfigurationNode> & theNode);

		/****** DE_Wrapper::FindProvider ******/
		/****** md5 signature: 7de521c2a889b057519978daf75f4f9c ******/
		%feature("compactdefaultargs") FindProvider;
		%feature("autodoc", "
Parameters
----------
thePath: str
theToImport: bool
theProvider: DE_Provider

Return
-------
bool

Description
-----------
Find available provider from the configuration. If there are several providers, choose the one with the highest priority. 
Input parameter: thePath path to the CAD file 
Input parameter: theToImport flag to finds for import. Standard_True-import, Standard_False-export @param[out] theProvider created new provider 
Return: Standard_True if provider found and created.
") FindProvider;
		virtual Standard_Boolean FindProvider(TCollection_AsciiString thePath, const Standard_Boolean theToImport, opencascade::handle<DE_Provider> & theProvider);

		/****** DE_Wrapper::GlobalLoadMutex ******/
		/****** md5 signature: 697f6434ea0d77c8fc11f1d70733107a ******/
		%feature("compactdefaultargs") GlobalLoadMutex;
		%feature("autodoc", "Return
-------
Standard_Mutex

Description
-----------
No available documentation.
") GlobalLoadMutex;
		static Standard_Mutex & GlobalLoadMutex();

		/****** DE_Wrapper::GlobalWrapper ******/
		/****** md5 signature: ace26dd3eb9eb53a4aa43a02d795749b ******/
		%feature("compactdefaultargs") GlobalWrapper;
		%feature("autodoc", "Return
-------
opencascade::handle<DE_Wrapper>

Description
-----------
Gets global configuration singleton. If wrapper is not set, create it by default as base class object. 
Return: point to global configuration.
") GlobalWrapper;
		static const opencascade::handle<DE_Wrapper> & GlobalWrapper();

		/****** DE_Wrapper::KeepUpdates ******/
		/****** md5 signature: 544bb1c1219d5ad8a52415cd9d472045 ******/
		%feature("compactdefaultargs") KeepUpdates;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Gets flag that keeps changes on configuration nodes which are being updated, false by default.
") KeepUpdates;
		Standard_Boolean KeepUpdates();

		/****** DE_Wrapper::Load ******/
		/****** md5 signature: e38468f71a09d1e0264cdd36b0ce0aec ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
theResource: str (optional, default to "")
theIsRecursive: bool (optional, default to Standard_True)

Return
-------
bool

Description
-----------
Updates values according the resource file 
Input parameter: theResource file path to resource or resource value 
Input parameter: theIsRecursive flag to update all nodes 
Return: true if theResource has loaded correctly.
") Load;
		Standard_Boolean Load(TCollection_AsciiString theResource = "", const Standard_Boolean theIsRecursive = Standard_True);

		/****** DE_Wrapper::Load ******/
		/****** md5 signature: d8568a3d1c2509fb6a86ee649f6b430c ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
theResource: DE_ConfigurationContext
theIsRecursive: bool (optional, default to Standard_True)

Return
-------
bool

Description
-----------
Updates values according the resource 
Input parameter: theResource input resource to use 
Input parameter: theIsRecursive flag to update all nodes 
Return: true if theResource has loaded correctly.
") Load;
		Standard_Boolean Load(const opencascade::handle<DE_ConfigurationContext> & theResource, const Standard_Boolean theIsRecursive = Standard_True);

		/****** DE_Wrapper::Nodes ******/
		/****** md5 signature: cd4f7b408a19aecbbaabce1f082f6f4b ******/
		%feature("compactdefaultargs") Nodes;
		%feature("autodoc", "Return
-------
DE_ConfigurationFormatMap

Description
-----------
Gets format map, contains vendor map with nodes 
Return: internal map of formats.
") Nodes;
		const DE_ConfigurationFormatMap & Nodes();

		/****** DE_Wrapper::Read ******/
		/****** md5 signature: 07afd098e3ea845271c66b1665ad0b77 ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
thePath: str
theDocument: TDocStd_Document
theWS: XSControl_WorkSession
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Reads a CAD file, according internal configuration 
Input parameter: thePath path to the import CAD file @param[out] theDocument document to save result 
Input parameter: theWS current work session 
Input parameter: theProgress progress indicator 
Return: true if Read operation has ended correctly.
") Read;
		Standard_Boolean Read(TCollection_AsciiString thePath, const opencascade::handle<TDocStd_Document> & theDocument, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DE_Wrapper::Read ******/
		/****** md5 signature: 6d5a018f6898d40e701b1edd5451a141 ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
thePath: str
theDocument: TDocStd_Document
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Reads a CAD file, according internal configuration 
Input parameter: thePath path to the import CAD file @param[out] theDocument document to save result 
Input parameter: theProgress progress indicator 
Return: true if Read operation has ended correctly.
") Read;
		Standard_Boolean Read(TCollection_AsciiString thePath, const opencascade::handle<TDocStd_Document> & theDocument, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DE_Wrapper::Read ******/
		/****** md5 signature: 33ad960c8c398403758f27e8591bde70 ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
thePath: str
theShape: TopoDS_Shape
theWS: XSControl_WorkSession
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Reads a CAD file, according internal configuration 
Input parameter: thePath path to the import CAD file @param[out] theShape shape to save result 
Input parameter: theWS current work session 
Input parameter: theProgress progress indicator 
Return: true if Read operation has ended correctly.
") Read;
		Standard_Boolean Read(TCollection_AsciiString thePath, TopoDS_Shape & theShape, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DE_Wrapper::Read ******/
		/****** md5 signature: ba650fdec802d5e46b2a5c384d97cdcb ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
thePath: str
theShape: TopoDS_Shape
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Reads a CAD file, according internal configuration 
Input parameter: thePath path to the import CAD file @param[out] theShape shape to save result 
Input parameter: theProgress progress indicator 
Return: true if Read operation has ended correctly.
") Read;
		Standard_Boolean Read(TCollection_AsciiString thePath, TopoDS_Shape & theShape, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DE_Wrapper::Save ******/
		/****** md5 signature: 7d9531bb632f8f4fce109a1374d3bb53 ******/
		%feature("compactdefaultargs") Save;
		%feature("autodoc", "
Parameters
----------
theResourcePath: str
theIsRecursive: bool (optional, default to Standard_True)
theFormats: TColStd_ListOfAsciiString (optional, default to TColStd_ListOfAsciiString())
theVendors: TColStd_ListOfAsciiString (optional, default to TColStd_ListOfAsciiString())

Return
-------
bool

Description
-----------
Writes configuration to the resource file 
Input parameter: theResourcePath file path to resource 
Input parameter: theIsRecursive flag to write values of all nodes 
Input parameter: theFormats list of formats to save. If empty, saves all available 
Input parameter: theVendors list of providers to save. If empty, saves all available 
Return: true if the Configuration has saved correctly.
") Save;
		Standard_Boolean Save(TCollection_AsciiString theResourcePath, const Standard_Boolean theIsRecursive = Standard_True, const TColStd_ListOfAsciiString & theFormats = TColStd_ListOfAsciiString(), const TColStd_ListOfAsciiString & theVendors = TColStd_ListOfAsciiString());

		/****** DE_Wrapper::Save ******/
		/****** md5 signature: 53550bbdecde27c0dd886095bf29bd98 ******/
		%feature("compactdefaultargs") Save;
		%feature("autodoc", "
Parameters
----------
theIsRecursive: bool (optional, default to Standard_True)
theFormats: TColStd_ListOfAsciiString (optional, default to TColStd_ListOfAsciiString())
theVendors: TColStd_ListOfAsciiString (optional, default to TColStd_ListOfAsciiString())

Return
-------
TCollection_AsciiString

Description
-----------
Writes configuration to the string 
Input parameter: theIsRecursive flag to write values of all nodes 
Input parameter: theFormats list of formats to save. If empty, saves all available 
Input parameter: theVendors list of providers to save. If empty, saves all available 
Return: result resource string.
") Save;
		TCollection_AsciiString Save(const Standard_Boolean theIsRecursive = Standard_True, const TColStd_ListOfAsciiString & theFormats = TColStd_ListOfAsciiString(), const TColStd_ListOfAsciiString & theVendors = TColStd_ListOfAsciiString());

		/****** DE_Wrapper::SetGlobalWrapper ******/
		/****** md5 signature: c12f22416c96f19cad70ed542d976aec ******/
		%feature("compactdefaultargs") SetGlobalWrapper;
		%feature("autodoc", "
Parameters
----------
theWrapper: DE_Wrapper

Return
-------
None

Description
-----------
Sets global configuration singleton 
Input parameter: theWrapper object to set as global configuration.
") SetGlobalWrapper;
		static void SetGlobalWrapper(const opencascade::handle<DE_Wrapper> & theWrapper);

		/****** DE_Wrapper::SetKeepUpdates ******/
		/****** md5 signature: 93e00676fa5dea60bfa87b89e1017a3f ******/
		%feature("compactdefaultargs") SetKeepUpdates;
		%feature("autodoc", "
Parameters
----------
theToKeepUpdates: bool

Return
-------
None

Description
-----------
Sets flag that keeps changes on configuration nodes which are being updated, false by default.
") SetKeepUpdates;
		void SetKeepUpdates(const Standard_Boolean theToKeepUpdates);

		/****** DE_Wrapper::UnBind ******/
		/****** md5 signature: a24be7b2a3b0d23c7167000ca320b6d1 ******/
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "
Parameters
----------
theNode: DE_ConfigurationNode

Return
-------
bool

Description
-----------
Removes node with the same type from the map 
Input parameter: theNode input node to remove the same 
Return: Standard_True if removed.
") UnBind;
		Standard_Boolean UnBind(const opencascade::handle<DE_ConfigurationNode> & theNode);

		/****** DE_Wrapper::UpdateLoad ******/
		/****** md5 signature: e6ea8d1aa59c1e0ab1496dac5ec01fcf ******/
		%feature("compactdefaultargs") UpdateLoad;
		%feature("autodoc", "
Parameters
----------
theToForceUpdate: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Updates all registered nodes, all changes will be saved in nodes 
Input parameter: theToForceUpdate flag that turns on/of nodes, according to updated ability to import/export.
") UpdateLoad;
		void UpdateLoad(const Standard_Boolean theToForceUpdate = Standard_False);

		/****** DE_Wrapper::Write ******/
		/****** md5 signature: 854c168c488f764c7b691b8074994e37 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
thePath: str
theDocument: TDocStd_Document
theWS: XSControl_WorkSession
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Writes a CAD file, according internal configuration 
Input parameter: thePath path to the export CAD file @param[out] theDocument document to export 
Input parameter: theWS current work session 
Input parameter: theProgress progress indicator 
Return: true if Write operation has ended correctly.
") Write;
		Standard_Boolean Write(TCollection_AsciiString thePath, const opencascade::handle<TDocStd_Document> & theDocument, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DE_Wrapper::Write ******/
		/****** md5 signature: 43124dc92a954a7ec3b4993ab1810406 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
thePath: str
theDocument: TDocStd_Document
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Writes a CAD file, according internal configuration 
Input parameter: thePath path to the export CAD file @param[out] theDocument document to export 
Input parameter: theProgress progress indicator 
Return: true if Write operation has ended correctly.
") Write;
		Standard_Boolean Write(TCollection_AsciiString thePath, const opencascade::handle<TDocStd_Document> & theDocument, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DE_Wrapper::Write ******/
		/****** md5 signature: 0a31da375f98721ebf0da0ae8fdec42d ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
thePath: str
theShape: TopoDS_Shape
theWS: XSControl_WorkSession
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Writes a CAD file, according internal configuration 
Input parameter: thePath path to the export CAD file @param[out] theShape shape to export 
Input parameter: theWS current work session 
Input parameter: theProgress progress indicator 
Return: true if Write operation has ended correctly.
") Write;
		Standard_Boolean Write(TCollection_AsciiString thePath, const TopoDS_Shape & theShape, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DE_Wrapper::Write ******/
		/****** md5 signature: 6aee5229322f053659fa9a59408599ad ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
thePath: str
theShape: TopoDS_Shape
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Writes a CAD file, according internal configuration 
Input parameter: thePath path to the export CAD file @param[out] theShape shape to export 
Input parameter: theProgress progress indicator 
Return: true if Write operation has ended correctly.
") Write;
		Standard_Boolean Write(TCollection_AsciiString thePath, const TopoDS_Shape & theShape, const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%make_alias(DE_Wrapper)

%extend DE_Wrapper {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class DE_ShapeFixConfigurationNode *
*************************************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class DE_PluginHolder:
	pass

@classnotwrapped
class DE_ShapeFixConfigurationNode:
	pass

@classnotwrapped
class DE_ShapeFixParameters:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def DE_Wrapper_GlobalLoadMutex(*args):
	return DE_Wrapper.GlobalLoadMutex(*args)

@deprecated
def DE_Wrapper_GlobalWrapper(*args):
	return DE_Wrapper.GlobalWrapper(*args)

@deprecated
def DE_Wrapper_SetGlobalWrapper(*args):
	return DE_Wrapper.SetGlobalWrapper(*args)

}
