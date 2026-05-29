/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_de.html"
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
/* end templates declaration */

/* typedefs */
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
		/****** md5 signature: 3b50b99dbf928a94c40892fd3420d490 ******/
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
		bool BooleanVal(TCollection_AsciiString theParam, const bool theDefValue, TCollection_AsciiString theScope = "");

		/****** DE_ConfigurationContext::GetBoolean ******/
		/****** md5 signature: 5d62a90357d97a68563b358b87034f6c ******/
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
Return: false if parameter is not defined or has a wrong type.
") GetBoolean;
		bool GetBoolean(TCollection_AsciiString theParam, Standard_Boolean &OutValue, TCollection_AsciiString theScope = "");

		/****** DE_ConfigurationContext::GetInteger ******/
		/****** md5 signature: e5b46434ed40f25295258afcc29f4cdb ******/
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
Return: false if parameter is not defined or has a wrong type.
") GetInteger;
		bool GetInteger(TCollection_AsciiString theParam, Standard_Integer &OutValue, TCollection_AsciiString theScope = "");

		/****** DE_ConfigurationContext::GetInternalMap ******/
		/****** md5 signature: ec33cc9099c151853aa172a22e287290 ******/
		%feature("compactdefaultargs") GetInternalMap;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TCollection_AsciiString, TCollection_AsciiString>

Description
-----------
Gets internal resource map 
Return: map with resource value.
") GetInternalMap;
		const NCollection_DataMap<TCollection_AsciiString, TCollection_AsciiString> & GetInternalMap();

		/****** DE_ConfigurationContext::GetReal ******/
		/****** md5 signature: 0ab931f3e7180746087a18825b6f5d66 ******/
		%feature("compactdefaultargs") GetReal;
		%feature("autodoc", "
Parameters
----------
theParam: str
theScope: str (optional, default to "")

Return
-------
theValue: double

Description
-----------
Gets value of parameter as being of specific type 
Input parameter: theParam complex parameter name @param[out] theValue value to get by parameter 
Input parameter: theScope base parameter name 
Return: false if parameter is not defined or has a wrong type.
") GetReal;
		bool GetReal(TCollection_AsciiString theParam, Standard_Real &OutValue, TCollection_AsciiString theScope = "");

		/****** DE_ConfigurationContext::GetString ******/
		/****** md5 signature: 335eeb2cd4107292d830e5cedaedc17f ******/
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
Return: false if parameter is not defined or has a wrong type.
") GetString;
		bool GetString(TCollection_AsciiString theParam, TCollection_AsciiString & theValue, TCollection_AsciiString theScope = "");

		/****** DE_ConfigurationContext::GetStringSeq ******/
		/****** md5 signature: 579746131dea3524c5b386031fd02501 ******/
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
Return: false if parameter is not defined or has a wrong type.
") GetStringSeq;
		bool GetStringSeq(TCollection_AsciiString theParam, TColStd_ListOfAsciiString & theValue, TCollection_AsciiString theScope = "");

		/****** DE_ConfigurationContext::IntegerVal ******/
		/****** md5 signature: 6c0c04700038279895d3ad9ad180c58e ******/
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
		int IntegerVal(TCollection_AsciiString theParam, const int theDefValue, TCollection_AsciiString theScope = "");

		/****** DE_ConfigurationContext::IsParamSet ******/
		/****** md5 signature: 209db1ee9e52aa3c101626a2a2b201d4 ******/
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
Return: true if parameter is defined in the resource file.
") IsParamSet;
		bool IsParamSet(TCollection_AsciiString theParam, TCollection_AsciiString theScope = "");

		/****** DE_ConfigurationContext::Load ******/
		/****** md5 signature: c94b8ff44079c6e0599306adce13ed63 ******/
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
		bool Load(TCollection_AsciiString theConfiguration);

		/****** DE_ConfigurationContext::LoadFile ******/
		/****** md5 signature: 8494e7d9078b4143657807704fd044a9 ******/
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
		bool LoadFile(TCollection_AsciiString theFile);

		/****** DE_ConfigurationContext::LoadStr ******/
		/****** md5 signature: eb386ad9229253ce44b354b0cfc882b6 ******/
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
		bool LoadStr(TCollection_AsciiString theResource);

		/****** DE_ConfigurationContext::RealVal ******/
		/****** md5 signature: 1f0e3f36290b7eb8f5f4d4faccf95e28 ******/
		%feature("compactdefaultargs") RealVal;
		%feature("autodoc", "
Parameters
----------
theParam: str
theDefValue: double
theScope: str (optional, default to "")

Return
-------
double

Description
-----------
Gets value of parameter as being of specific type 
Input parameter: theParam complex parameter name 
Input parameter: theDefValue value by default if param is not found or has wrong type 
Input parameter: theScope base parameter name 
Return: specific type value.
") RealVal;
		double RealVal(TCollection_AsciiString theParam, const double theDefValue, TCollection_AsciiString theScope = "");

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
Return: true if file is supported by a current provider.
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
Return: true if file is supported by a current provider.
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
		/****** md5 signature: e7d83441d0dac910d9eea6eadac4b276 ******/
		%feature("compactdefaultargs") CustomActivation;
		%feature("autodoc", "
Parameters
----------
&: NCollection_List<TCollection_AsciiString >

Return
-------
None

Description
-----------
Custom function to activate commercial DE component. The input is special sequence of values that described in specific component documentation. Order is important. Each component can have own way of activation. //! The main goal - real-time loading plug-in activation. OpenSource components don't need to have activation process.
") CustomActivation;
		virtual void CustomActivation(const NCollection_List<TCollection_AsciiString > &);

		/****** DE_ConfigurationNode::GetExtensions ******/
		/****** md5 signature: ab1c965ab573b0547c5dfc052bb957e7 ******/
		%feature("compactdefaultargs") GetExtensions;
		%feature("autodoc", "Return
-------
NCollection_List<TCollection_AsciiString >

Description
-----------
Gets list of supported file extensions 
Return: list of extensions.
") GetExtensions;
		virtual NCollection_List<TCollection_AsciiString > GetExtensions();

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
		/****** md5 signature: 08e6d5dff97c02382ea77da63335995c ******/
		%feature("compactdefaultargs") IsEnabled;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Gets the provider loading status 
Return: true if the load is correct.
") IsEnabled;
		bool IsEnabled();

		/****** DE_ConfigurationNode::IsExportSupported ******/
		/****** md5 signature: be38b1e13370efd225253f651dabd3e4 ******/
		%feature("compactdefaultargs") IsExportSupported;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks for export support. 
Return: true if export is supported.
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
Checks for import support. 
Return: true if import is supported.
") IsImportSupported;
		virtual bool IsImportSupported();

		/****** DE_ConfigurationNode::IsStreamSupported ******/
		/****** md5 signature: cbf6b9c91c68a90405d6de4be26d2f5b ******/
		%feature("compactdefaultargs") IsStreamSupported;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks for stream support. 
Return: true if streams are supported.
") IsStreamSupported;
		virtual bool IsStreamSupported();

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

		/****** DE_ConfigurationNode::Register ******/
		/****** md5 signature: d11d23ed039ccf350bfc59d2f3a72d4a ******/
		%feature("compactdefaultargs") Register;
		%feature("autodoc", "
Parameters
----------
theWrapper: DE_Wrapper

Return
-------
None

Description
-----------
Registers configuration node with the specified wrapper 
Input parameter: theWrapper wrapper to register with.
") Register;
		virtual void Register(const opencascade::handle<DE_Wrapper> & theWrapper);

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
		/****** md5 signature: 6502e0ca451de6d62fb0a9a71e77253e ******/
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
		void SetEnabled(const bool theIsLoaded);

		/****** DE_ConfigurationNode::UnRegister ******/
		/****** md5 signature: fadbccdc54e62748e548897474985978 ******/
		%feature("compactdefaultargs") UnRegister;
		%feature("autodoc", "
Parameters
----------
theWrapper: DE_Wrapper

Return
-------
None

Description
-----------
Unregisters configuration node from the specified wrapper 
Input parameter: theWrapper wrapper to unregister from.
") UnRegister;
		virtual void UnRegister(const opencascade::handle<DE_Wrapper> & theWrapper);

		/****** DE_ConfigurationNode::UpdateLoad ******/
		/****** md5 signature: 6207170936fc290eafc0a8fe260dcf6a ******/
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
Input parameter: theToImport flag to updates for import. true-import, false-export 
Input parameter: theToKeep flag to save update result 
Return: true, if node can be used.
") UpdateLoad;
		virtual bool UpdateLoad(const bool theToImport, const bool theToKeep);

};


%make_alias(DE_ConfigurationNode)

%extend DE_ConfigurationNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class DE_MultiPluginHolder *
*****************************/
/************************
* class DE_PluginHolder *
************************/
/********************
* class DE_Provider *
********************/
%nodefaultctor DE_Provider;
class DE_Provider : public Standard_Transient {
	public:
		class WriteStreamNode {};
		class ReadStreamNode {};
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

};


%make_alias(DE_Provider)

%extend DE_Provider {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Read(self):
		pass

	@methodnotwrapped
	def Write(self):
		pass
	}
};

/******************************
* class DE_ShapeFixParameters *
******************************/
/***************************
* class DE_ValidationUtils *
***************************/
class DE_ValidationUtils {
	public:
		/****** DE_ValidationUtils::CreateContentBuffer ******/
		/****** md5 signature: 35a498b58f421df22e94d04c01f2d4d3 ******/
		%feature("compactdefaultargs") CreateContentBuffer;
		%feature("autodoc", "
Parameters
----------
thePath: str
theBuffer: NCollection_Buffer

Return
-------
bool

Description
-----------
Creates buffer by reading from file stream for content checking 
Input parameter: thePath file path for reading @param[out] theBuffer output buffer with file content 
Return: true if successful, false otherwise.
") CreateContentBuffer;
		static bool CreateContentBuffer(TCollection_AsciiString thePath, opencascade::handle<NCollection_Buffer> & theBuffer);

		/****** DE_ValidationUtils::CreateContentBuffer ******/
		/****** md5 signature: 7642a38254f019072933395b46328496 ******/
		%feature("compactdefaultargs") CreateContentBuffer;
		%feature("autodoc", "
Parameters
----------
theStream: str
theBuffer: NCollection_Buffer

Return
-------
bool

Description
-----------
Creates buffer by reading from input stream for content checking @param[in,out] theStream input stream to read from (position will be restored) @param[out] theBuffer output buffer with stream content 
Return: true if successful, false otherwise.
") CreateContentBuffer;
		static bool CreateContentBuffer(std::istream & theStream, opencascade::handle<NCollection_Buffer> & theBuffer);

		/****** DE_ValidationUtils::ValidateConfigurationNode ******/
		/****** md5 signature: 6b5f502855970e395a690d1072946d39 ******/
		%feature("compactdefaultargs") ValidateConfigurationNode;
		%feature("autodoc", "
Parameters
----------
theNode: DE_ConfigurationNode
theExpectedType: Standard_Type
theContext: str
theIsVerbose: bool (optional, default to true)

Return
-------
bool

Description
-----------
Validates that configuration node is not null and matches expected type 
Input parameter: theNode configuration node to validate 
Input parameter: theExpectedType expected RTTI type 
Input parameter: theContext context string for error messages 
Input parameter: theIsVerbose if true, sends detailed error messages via Message::SendFail 
Return: true if node is valid, false otherwise.
") ValidateConfigurationNode;
		static bool ValidateConfigurationNode(const opencascade::handle<DE_ConfigurationNode> & theNode, const opencascade::handle<Standard_Type> & theExpectedType, TCollection_AsciiString theContext, const bool theIsVerbose = true);

		/****** DE_ValidationUtils::ValidateDocument ******/
		/****** md5 signature: 780e4a5e4400b5eb6bca5c61f19fd903 ******/
		%feature("compactdefaultargs") ValidateDocument;
		%feature("autodoc", "
Parameters
----------
theDocument: TDocStd_Document
theContext: str
theIsVerbose: bool (optional, default to true)

Return
-------
bool

Description
-----------
Validates that TDocStd_Document handle is not null 
Input parameter: theDocument document to validate 
Input parameter: theContext context string for error messages 
Input parameter: theIsVerbose if true, sends detailed error messages via Message::SendFail 
Return: true if document is not null, false otherwise.
") ValidateDocument;
		static bool ValidateDocument(const opencascade::handle<TDocStd_Document> & theDocument, TCollection_AsciiString theContext, const bool theIsVerbose = true);

		/****** DE_ValidationUtils::ValidateFileForReading ******/
		/****** md5 signature: d45d7306fb019d50f9894645d7527e0b ******/
		%feature("compactdefaultargs") ValidateFileForReading;
		%feature("autodoc", "
Parameters
----------
thePath: str
theContext: str
theIsVerbose: bool (optional, default to true)

Return
-------
bool

Description
-----------
Checks if file exists and is readable 
Input parameter: thePath file path to check 
Input parameter: theContext context string for error messages 
Input parameter: theIsVerbose if true, sends detailed error messages via Message::SendFail 
Return: true if file exists and is readable, false otherwise.
") ValidateFileForReading;
		static bool ValidateFileForReading(TCollection_AsciiString thePath, TCollection_AsciiString theContext, const bool theIsVerbose = true);

		/****** DE_ValidationUtils::ValidateFileForWriting ******/
		/****** md5 signature: e5f32fba723c850e9486c9f3639cb137 ******/
		%feature("compactdefaultargs") ValidateFileForWriting;
		%feature("autodoc", "
Parameters
----------
thePath: str
theContext: str
theIsVerbose: bool (optional, default to true)

Return
-------
bool

Description
-----------
Checks if file location is writable (file may or may not exist) 
Input parameter: thePath file path to check 
Input parameter: theContext context string for error messages 
Input parameter: theIsVerbose if true, sends detailed error messages via Message::SendFail 
Return: true if location is writable, false otherwise.
") ValidateFileForWriting;
		static bool ValidateFileForWriting(TCollection_AsciiString thePath, TCollection_AsciiString theContext, const bool theIsVerbose = true);

		/****** DE_ValidationUtils::ValidateReadStreamList ******/
		/****** md5 signature: f585a15a9fe1d4b9fac350663696dd9c ******/
		%feature("compactdefaultargs") ValidateReadStreamList;
		%feature("autodoc", "
Parameters
----------
theStreams: DE_Provider::ReadStreamList
theContext: str
theIsVerbose: bool (optional, default to true)

Return
-------
bool

Description
-----------
Validates read stream list, warns if multiple streams 
Input parameter: theStreams read stream list to validate 
Input parameter: theContext context string for error messages 
Input parameter: theIsVerbose if true, sends detailed error/warning messages 
Return: true if stream list is valid, false otherwise.
") ValidateReadStreamList;
		static bool ValidateReadStreamList(const DE_Provider::ReadStreamList & theStreams, TCollection_AsciiString theContext, const bool theIsVerbose = true);

		/****** DE_ValidationUtils::ValidateWriteStreamList ******/
		/****** md5 signature: aad264886ac6863fc917f0eb97364dcd ******/
		%feature("compactdefaultargs") ValidateWriteStreamList;
		%feature("autodoc", "
Parameters
----------
theStreams: DE_Provider::WriteStreamList
theContext: str
theIsVerbose: bool (optional, default to true)

Return
-------
bool

Description
-----------
Validates write stream list, warns if multiple streams 
Input parameter: theStreams write stream list to validate 
Input parameter: theContext context string for error messages 
Input parameter: theIsVerbose if true, sends detailed error/warning messages 
Return: true if stream list is valid, false otherwise.
") ValidateWriteStreamList;
		static bool ValidateWriteStreamList(DE_Provider::WriteStreamList & theStreams, TCollection_AsciiString theContext, const bool theIsVerbose = true);

		/****** DE_ValidationUtils::WarnLengthUnitNotSupported ******/
		/****** md5 signature: 0665a3a00fc115b549fab64c3287ee39 ******/
		%feature("compactdefaultargs") WarnLengthUnitNotSupported;
		%feature("autodoc", "
Parameters
----------
theLengthUnit: double
theContext: str
theIsVerbose: bool (optional, default to true)

Return
-------
bool

Description
-----------
Sends warning when format doesn't support length unit scaling 
Input parameter: theLengthUnit length unit value to check 
Input parameter: theContext context string for warning messages 
Input parameter: theIsVerbose if true, sends warning messages via Message::SendWarning 
Return: true always (this is just a warning).
") WarnLengthUnitNotSupported;
		static bool WarnLengthUnitNotSupported(const double theLengthUnit, TCollection_AsciiString theContext, const bool theIsVerbose = true);

};


%extend DE_ValidationUtils {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

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
		/****** md5 signature: 213eba6a846c9738c658baabd8abcbb9 ******/
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
Return: true if binded.
") Bind;
		bool Bind(const opencascade::handle<DE_ConfigurationNode> & theNode);

		/****** DE_Wrapper::ChangePriority ******/
		/****** md5 signature: 266c96a9bf8894445611e99a07dd7a09 ******/
		%feature("compactdefaultargs") ChangePriority;
		%feature("autodoc", "
Parameters
----------
theFormat: str
theVendorPriority: TColStd_ListOfAsciiString
theToDisable: bool (optional, default to false)

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
		void ChangePriority(TCollection_AsciiString theFormat, const TColStd_ListOfAsciiString & theVendorPriority, const bool theToDisable = false);

		/****** DE_Wrapper::ChangePriority ******/
		/****** md5 signature: 2ee8ba94b40bf213779d9de6f1eec08a ******/
		%feature("compactdefaultargs") ChangePriority;
		%feature("autodoc", "
Parameters
----------
theVendorPriority: TColStd_ListOfAsciiString
theToDisable: bool (optional, default to false)

Return
-------
None

Description
-----------
Changes provider priority to all loaded nodes 
Input parameter: theVendorPriority priority of work with vendors 
Input parameter: theToDisable flag for disabling nodes that are not included in the priority.
") ChangePriority;
		void ChangePriority(const TColStd_ListOfAsciiString & theVendorPriority, const bool theToDisable = false);

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
		/****** md5 signature: 5dc963a641c4c0b35e1e84c36ecb50a5 ******/
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
Return: true if the node is found.
") Find;
		bool Find(TCollection_AsciiString theFormat, TCollection_AsciiString theVendor, opencascade::handle<DE_ConfigurationNode> & theNode);

		/****** DE_Wrapper::FindProvider ******/
		/****** md5 signature: daa5d58ee148967a7d16eaae786cc36e ******/
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
Input parameter: theToImport flag to finds for import. true-import, false-export @param[out] theProvider created new provider 
Return: true if provider found and created.
") FindProvider;
		virtual bool FindProvider(TCollection_AsciiString thePath, const bool theToImport, opencascade::handle<DE_Provider> & theProvider);

		/****** DE_Wrapper::FindReadProvider ******/
		/****** md5 signature: 629d936eea87b6618c453f900c3868b6 ******/
		%feature("compactdefaultargs") FindReadProvider;
		%feature("autodoc", "
Parameters
----------
thePath: str
theCheckContent: bool
theProvider: DE_Provider

Return
-------
bool

Description
-----------
Find available read provider from the configuration for file-based operations. If there are several providers, choose the one with the highest priority. 
Input parameter: thePath path to the CAD file (for extension and content checking) 
Input parameter: theCheckContent flag to enable content checking via file reading @param[out] theProvider created new provider 
Return: true if provider found and created.
") FindReadProvider;
		virtual bool FindReadProvider(TCollection_AsciiString thePath, const bool theCheckContent, opencascade::handle<DE_Provider> & theProvider);

		/****** DE_Wrapper::FindReadProvider ******/
		/****** md5 signature: d7d9050c8ee23041fb79588e281c8ff6 ******/
		%feature("compactdefaultargs") FindReadProvider;
		%feature("autodoc", "
Parameters
----------
thePath: str
theStream: str
theProvider: DE_Provider

Return
-------
bool

Description
-----------
Find available read provider from the configuration for stream-based operations. If there are several providers, choose the one with the highest priority. 
Input parameter: thePath path to the CAD file (for extension extraction) 
Input parameter: theStream input stream for content checking @param[out] theProvider created new provider 
Return: true if provider found and created.
") FindReadProvider;
		virtual bool FindReadProvider(TCollection_AsciiString thePath, std::istream & theStream, opencascade::handle<DE_Provider> & theProvider);

		/****** DE_Wrapper::FindWriteProvider ******/
		/****** md5 signature: b42ad753e8add8c08ed2e947fcbd2dad ******/
		%feature("compactdefaultargs") FindWriteProvider;
		%feature("autodoc", "
Parameters
----------
thePath: str
theProvider: DE_Provider

Return
-------
bool

Description
-----------
Find available write provider from the configuration. If there are several providers, choose the one with the highest priority. 
Input parameter: thePath path to the CAD file (for extension checking only) @param[out] theProvider created new provider 
Return: true if provider found and created.
") FindWriteProvider;
		virtual bool FindWriteProvider(TCollection_AsciiString thePath, opencascade::handle<DE_Provider> & theProvider);

		/****** DE_Wrapper::GlobalLoadMutex ******/
		/****** md5 signature: 0534776e17602a2e7a1a3ef730b464e3 ******/
		%feature("compactdefaultargs") GlobalLoadMutex;
		%feature("autodoc", "Return
-------
std::mutex

Description
-----------
No available documentation.
") GlobalLoadMutex;
		static std::mutex & GlobalLoadMutex();

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
		/****** md5 signature: 6588937765dda59b05b9fd8b6581ec36 ******/
		%feature("compactdefaultargs") KeepUpdates;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Gets flag that keeps changes on configuration nodes which are being updated, false by default.
") KeepUpdates;
		bool KeepUpdates();

		/****** DE_Wrapper::Load ******/
		/****** md5 signature: b5aafcec166293c0c2d492d526f026f2 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
theResource: str (optional, default to "")
theIsRecursive: bool (optional, default to true)

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
		bool Load(TCollection_AsciiString theResource = "", const bool theIsRecursive = true);

		/****** DE_Wrapper::Load ******/
		/****** md5 signature: 653c24ab8be0b0651185c0d4383f8dfb ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
theResource: DE_ConfigurationContext
theIsRecursive: bool (optional, default to true)

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
		bool Load(const opencascade::handle<DE_ConfigurationContext> & theResource, const bool theIsRecursive = true);

		/****** DE_Wrapper::Nodes ******/
		/****** md5 signature: 4eea0a5d549731d87befbdd02bb34f6c ******/
		%feature("compactdefaultargs") Nodes;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TCollection_AsciiString, NCollection_IndexedDataMap<TCollection_AsciiString, opencascade::handle<DE_ConfigurationNode>>>

Description
-----------
Gets format map, contains vendor map with nodes 
Return: internal map of formats.
") Nodes;
		const NCollection_DataMap<TCollection_AsciiString, NCollection_IndexedDataMap<TCollection_AsciiString, opencascade::handle<DE_ConfigurationNode>>> & Nodes();

		/****** DE_Wrapper::Read ******/
		/****** md5 signature: c53a8a1ffc9c62150825edceada57907 ******/
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
		bool Read(TCollection_AsciiString thePath, const opencascade::handle<TDocStd_Document> & theDocument, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DE_Wrapper::Read ******/
		/****** md5 signature: 4fe320311b9a8d14c6a4fe556d2ad5a0 ******/
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
		bool Read(TCollection_AsciiString thePath, const opencascade::handle<TDocStd_Document> & theDocument, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DE_Wrapper::Read ******/
		/****** md5 signature: 421a1a7565728ad4a634eafa372c2167 ******/
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
		bool Read(TCollection_AsciiString thePath, TopoDS_Shape & theShape, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DE_Wrapper::Read ******/
		/****** md5 signature: d11e49b520c451b3d749a9ab7a8316cc ******/
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
		bool Read(TCollection_AsciiString thePath, TopoDS_Shape & theShape, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DE_Wrapper::Read ******/
		/****** md5 signature: f10a1b62e525dca290f56fe6132f1775 ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theStreams: DE_Provider::ReadStreamList
theDocument: TDocStd_Document
theWS: XSControl_WorkSession
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Reads streams according to internal configuration 
Input parameter: theStreams streams to read from @param[out] theDocument document to save result 
Input parameter: theWS current work session 
Input parameter: theProgress progress indicator 
Return: true if Read operation has ended correctly.
") Read;
		bool Read(DE_Provider::ReadStreamList & theStreams, const opencascade::handle<TDocStd_Document> & theDocument, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DE_Wrapper::Read ******/
		/****** md5 signature: b9c27823239395f87f23a7cda3bf81bc ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theStreams: DE_Provider::ReadStreamList
theDocument: TDocStd_Document
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Reads streams according to internal configuration 
Input parameter: theStreams streams to read from @param[out] theDocument document to save result 
Input parameter: theProgress progress indicator 
Return: true if Read operation has ended correctly.
") Read;
		bool Read(DE_Provider::ReadStreamList & theStreams, const opencascade::handle<TDocStd_Document> & theDocument, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DE_Wrapper::Read ******/
		/****** md5 signature: c4236743c7f2a7a855d1b75287ce24c2 ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theStreams: DE_Provider::ReadStreamList
theShape: TopoDS_Shape
theWS: XSControl_WorkSession
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Reads streams according to internal configuration 
Input parameter: theStreams streams to read from @param[out] theShape shape to save result 
Input parameter: theWS current work session 
Input parameter: theProgress progress indicator 
Return: true if Read operation has ended correctly.
") Read;
		bool Read(DE_Provider::ReadStreamList & theStreams, TopoDS_Shape & theShape, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DE_Wrapper::Read ******/
		/****** md5 signature: d0097eef92b415bcef9e6adce15e5513 ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theStreams: DE_Provider::ReadStreamList
theShape: TopoDS_Shape
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Reads streams according to internal configuration 
Input parameter: theStreams streams to read from @param[out] theShape shape to save result 
Input parameter: theProgress progress indicator 
Return: true if Read operation has ended correctly.
") Read;
		bool Read(DE_Provider::ReadStreamList & theStreams, TopoDS_Shape & theShape, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DE_Wrapper::Save ******/
		/****** md5 signature: ca3247a4f7105d5da37ffb2921b62cea ******/
		%feature("compactdefaultargs") Save;
		%feature("autodoc", "
Parameters
----------
theResourcePath: str
theIsRecursive: bool (optional, default to true)
theFormats: TColStd_ListOfAsciiString (optional, default to NCollection_List<TCollection_AsciiString>())
theVendors: TColStd_ListOfAsciiString (optional, default to NCollection_List<TCollection_AsciiString>())

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
		bool Save(TCollection_AsciiString theResourcePath, const bool theIsRecursive = true, const TColStd_ListOfAsciiString & theFormats = NCollection_List<TCollection_AsciiString>(), const TColStd_ListOfAsciiString & theVendors = NCollection_List<TCollection_AsciiString>());

		/****** DE_Wrapper::Save ******/
		/****** md5 signature: 10dd8f9dc619b58a4753b0622590d007 ******/
		%feature("compactdefaultargs") Save;
		%feature("autodoc", "
Parameters
----------
theIsRecursive: bool (optional, default to true)
theFormats: TColStd_ListOfAsciiString (optional, default to NCollection_List<TCollection_AsciiString>())
theVendors: TColStd_ListOfAsciiString (optional, default to NCollection_List<TCollection_AsciiString>())

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
		TCollection_AsciiString Save(const bool theIsRecursive = true, const TColStd_ListOfAsciiString & theFormats = NCollection_List<TCollection_AsciiString>(), const TColStd_ListOfAsciiString & theVendors = NCollection_List<TCollection_AsciiString>());

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
		/****** md5 signature: 06787d71414622032803c18dc45052ef ******/
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
		void SetKeepUpdates(const bool theToKeepUpdates);

		/****** DE_Wrapper::UnBind ******/
		/****** md5 signature: 0b07b30fe18eea5c81e5c0f4eacc5ff7 ******/
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
Return: true if removed.
") UnBind;
		bool UnBind(const opencascade::handle<DE_ConfigurationNode> & theNode);

		/****** DE_Wrapper::UpdateLoad ******/
		/****** md5 signature: ccf442335bdba37e86fca8c0913d96b7 ******/
		%feature("compactdefaultargs") UpdateLoad;
		%feature("autodoc", "
Parameters
----------
theToForceUpdate: bool (optional, default to false)

Return
-------
None

Description
-----------
Updates all registered nodes, all changes will be saved in nodes 
Input parameter: theToForceUpdate flag that turns on/of nodes, according to updated ability to import/export.
") UpdateLoad;
		void UpdateLoad(const bool theToForceUpdate = false);

		/****** DE_Wrapper::Write ******/
		/****** md5 signature: 63a0331663689b9d3fc9a0161e2508a2 ******/
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
		bool Write(TCollection_AsciiString thePath, const opencascade::handle<TDocStd_Document> & theDocument, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DE_Wrapper::Write ******/
		/****** md5 signature: 1198a04880d11a3a50987163200b3665 ******/
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
		bool Write(TCollection_AsciiString thePath, const opencascade::handle<TDocStd_Document> & theDocument, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DE_Wrapper::Write ******/
		/****** md5 signature: 46dc25c258df56b609bf82bec8e66bb6 ******/
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
		bool Write(TCollection_AsciiString thePath, const TopoDS_Shape & theShape, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DE_Wrapper::Write ******/
		/****** md5 signature: a89dff5e2b9e4f61517870b18305f151 ******/
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
		bool Write(TCollection_AsciiString thePath, const TopoDS_Shape & theShape, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DE_Wrapper::Write ******/
		/****** md5 signature: 3d2b40770de386b9f1c0aacf7888fafc ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theStreams: DE_Provider::WriteStreamList
theDocument: TDocStd_Document
theWS: XSControl_WorkSession
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Writes streams according to internal configuration 
Input parameter: theStreams streams to write to @param[out] theDocument document to export 
Input parameter: theWS current work session 
Input parameter: theProgress progress indicator 
Return: true if Write operation has ended correctly.
") Write;
		bool Write(DE_Provider::WriteStreamList & theStreams, const opencascade::handle<TDocStd_Document> & theDocument, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DE_Wrapper::Write ******/
		/****** md5 signature: ecfde9eb940fa442ed6409658a4069b9 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theStreams: DE_Provider::WriteStreamList
theDocument: TDocStd_Document
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Writes streams according to internal configuration 
Input parameter: theStreams streams to write to @param[out] theDocument document to export 
Input parameter: theProgress progress indicator 
Return: true if Write operation has ended correctly.
") Write;
		bool Write(DE_Provider::WriteStreamList & theStreams, const opencascade::handle<TDocStd_Document> & theDocument, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DE_Wrapper::Write ******/
		/****** md5 signature: 8d2e92922c0fd824964805b16f184f5c ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theStreams: DE_Provider::WriteStreamList
theShape: TopoDS_Shape
theWS: XSControl_WorkSession
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Writes streams according to internal configuration 
Input parameter: theStreams streams to write to @param[out] theShape shape to export 
Input parameter: theWS current work session 
Input parameter: theProgress progress indicator 
Return: true if Write operation has ended correctly.
") Write;
		bool Write(DE_Provider::WriteStreamList & theStreams, const TopoDS_Shape & theShape, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DE_Wrapper::Write ******/
		/****** md5 signature: a54f5d0b3f06a372a0e3bcbe27f96265 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theStreams: DE_Provider::WriteStreamList
theShape: TopoDS_Shape
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Writes streams according to internal configuration 
Input parameter: theStreams streams to write to @param[out] theShape shape to export 
Input parameter: theProgress progress indicator 
Return: true if Write operation has ended correctly.
") Write;
		bool Write(DE_Provider::WriteStreamList & theStreams, const TopoDS_Shape & theShape, const Message_ProgressRange & theProgress = Message_ProgressRange());

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
class DE_MultiPluginHolder:
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
def DE_ValidationUtils_CreateContentBuffer(*args):
	return DE_ValidationUtils.CreateContentBuffer(*args)

@deprecated
def DE_ValidationUtils_CreateContentBuffer(*args):
	return DE_ValidationUtils.CreateContentBuffer(*args)

@deprecated
def DE_ValidationUtils_ValidateConfigurationNode(*args):
	return DE_ValidationUtils.ValidateConfigurationNode(*args)

@deprecated
def DE_ValidationUtils_ValidateDocument(*args):
	return DE_ValidationUtils.ValidateDocument(*args)

@deprecated
def DE_ValidationUtils_ValidateFileForReading(*args):
	return DE_ValidationUtils.ValidateFileForReading(*args)

@deprecated
def DE_ValidationUtils_ValidateFileForWriting(*args):
	return DE_ValidationUtils.ValidateFileForWriting(*args)

@deprecated
def DE_ValidationUtils_ValidateReadStreamList(*args):
	return DE_ValidationUtils.ValidateReadStreamList(*args)

@deprecated
def DE_ValidationUtils_ValidateWriteStreamList(*args):
	return DE_ValidationUtils.ValidateWriteStreamList(*args)

@deprecated
def DE_ValidationUtils_WarnLengthUnitNotSupported(*args):
	return DE_ValidationUtils.WarnLengthUnitNotSupported(*args)

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
