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
%define RWMESHDOCSTRING
"RWMesh module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_rwmesh.html"
%enddef
%module (package="OCC.Core", docstring=RWMESHDOCSTRING) RWMesh


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
#include<RWMesh_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TDF_module.hxx>
#include<TCollection_module.hxx>
#include<TDocStd_module.hxx>
#include<gp_module.hxx>
#include<TColStd_module.hxx>
#include<Message_module.hxx>
#include<TopoDS_module.hxx>
#include<Graphic3d_module.hxx>
#include<XCAFPrs_module.hxx>
#include<Image_module.hxx>
#include<Quantity_module.hxx>
#include<Poly_module.hxx>
#include<OSD_module.hxx>
#include<TopLoc_module.hxx>
#include<Select3D_module.hxx>
#include<Bnd_module.hxx>
#include<XCAFDoc_module.hxx>
#include<TPrsStd_module.hxx>
#include<Geom_module.hxx>
#include<AIS_module.hxx>
#include<V3d_module.hxx>
#include<TDataXtd_module.hxx>
#include<TDataStd_module.hxx>
#include<Media_module.hxx>
#include<CDF_module.hxx>
#include<Aspect_module.hxx>
#include<Prs3d_module.hxx>
#include<TopTools_module.hxx>
#include<TNaming_module.hxx>
#include<StdSelect_module.hxx>
#include<SelectMgr_module.hxx>
#include<PCDM_module.hxx>
#include<TShort_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TDF.i
%import TCollection.i
%import TDocStd.i
%import gp.i
%import TColStd.i
%import Message.i
%import TopoDS.i
%import Graphic3d.i
%import XCAFPrs.i
%import Image.i
%import Quantity.i
%import Poly.i
%import OSD.i
%import TopLoc.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum RWMesh_CafReaderStatusEx {
	RWMesh_CafReaderStatusEx_NONE = 0,
	RWMesh_CafReaderStatusEx_Partial = 1,
};

enum RWMesh_CoordinateSystem {
	RWMesh_CoordinateSystem_Undefined = - 1,
	RWMesh_CoordinateSystem_posYfwd_posZup = 0,
	RWMesh_CoordinateSystem_negZfwd_posYup = 1,
	RWMesh_CoordinateSystem_Blender = RWMesh_CoordinateSystem_posYfwd_posZup,
	RWMesh_CoordinateSystem_glTF = RWMesh_CoordinateSystem_negZfwd_posYup,
	RWMesh_CoordinateSystem_Zup = RWMesh_CoordinateSystem_Blender,
	RWMesh_CoordinateSystem_Yup = RWMesh_CoordinateSystem_glTF,
};

enum RWMesh_NameFormat {
	RWMesh_NameFormat_Empty = 0,
	RWMesh_NameFormat_Product = 1,
	RWMesh_NameFormat_Instance = 2,
	RWMesh_NameFormat_InstanceOrProduct = 3,
	RWMesh_NameFormat_ProductOrInstance = 4,
	RWMesh_NameFormat_ProductAndInstance = 5,
	RWMesh_NameFormat_ProductAndInstanceAndOcaf = 6,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class RWMesh_CafReaderStatusEx(IntEnum):
	RWMesh_CafReaderStatusEx_NONE = 0
	RWMesh_CafReaderStatusEx_Partial = 1
RWMesh_CafReaderStatusEx_NONE = RWMesh_CafReaderStatusEx.RWMesh_CafReaderStatusEx_NONE
RWMesh_CafReaderStatusEx_Partial = RWMesh_CafReaderStatusEx.RWMesh_CafReaderStatusEx_Partial

class RWMesh_CoordinateSystem(IntEnum):
	RWMesh_CoordinateSystem_Undefined = - 1
	RWMesh_CoordinateSystem_posYfwd_posZup = 0
	RWMesh_CoordinateSystem_negZfwd_posYup = 1
	RWMesh_CoordinateSystem_Blender = RWMesh_CoordinateSystem_posYfwd_posZup
	RWMesh_CoordinateSystem_glTF = RWMesh_CoordinateSystem_negZfwd_posYup
	RWMesh_CoordinateSystem_Zup = RWMesh_CoordinateSystem_Blender
	RWMesh_CoordinateSystem_Yup = RWMesh_CoordinateSystem_glTF
RWMesh_CoordinateSystem_Undefined = RWMesh_CoordinateSystem.RWMesh_CoordinateSystem_Undefined
RWMesh_CoordinateSystem_posYfwd_posZup = RWMesh_CoordinateSystem.RWMesh_CoordinateSystem_posYfwd_posZup
RWMesh_CoordinateSystem_negZfwd_posYup = RWMesh_CoordinateSystem.RWMesh_CoordinateSystem_negZfwd_posYup
RWMesh_CoordinateSystem_Blender = RWMesh_CoordinateSystem.RWMesh_CoordinateSystem_Blender
RWMesh_CoordinateSystem_glTF = RWMesh_CoordinateSystem.RWMesh_CoordinateSystem_glTF
RWMesh_CoordinateSystem_Zup = RWMesh_CoordinateSystem.RWMesh_CoordinateSystem_Zup
RWMesh_CoordinateSystem_Yup = RWMesh_CoordinateSystem.RWMesh_CoordinateSystem_Yup

class RWMesh_NameFormat(IntEnum):
	RWMesh_NameFormat_Empty = 0
	RWMesh_NameFormat_Product = 1
	RWMesh_NameFormat_Instance = 2
	RWMesh_NameFormat_InstanceOrProduct = 3
	RWMesh_NameFormat_ProductOrInstance = 4
	RWMesh_NameFormat_ProductAndInstance = 5
	RWMesh_NameFormat_ProductAndInstanceAndOcaf = 6
RWMesh_NameFormat_Empty = RWMesh_NameFormat.RWMesh_NameFormat_Empty
RWMesh_NameFormat_Product = RWMesh_NameFormat.RWMesh_NameFormat_Product
RWMesh_NameFormat_Instance = RWMesh_NameFormat.RWMesh_NameFormat_Instance
RWMesh_NameFormat_InstanceOrProduct = RWMesh_NameFormat.RWMesh_NameFormat_InstanceOrProduct
RWMesh_NameFormat_ProductOrInstance = RWMesh_NameFormat.RWMesh_NameFormat_ProductOrInstance
RWMesh_NameFormat_ProductAndInstance = RWMesh_NameFormat.RWMesh_NameFormat_ProductAndInstance
RWMesh_NameFormat_ProductAndInstanceAndOcaf = RWMesh_NameFormat.RWMesh_NameFormat_ProductAndInstanceAndOcaf
};
/* end python proxy for enums */

/* handles */
%wrap_handle(RWMesh_CafReader)
%wrap_handle(RWMesh_MaterialMap)
%wrap_handle(RWMesh_TriangulationReader)
%wrap_handle(RWMesh_TriangulationSource)
/* end handles declaration */

/* templates */
%template(RWMesh_NodeAttributeMap) NCollection_DataMap<TopoDS_Shape,RWMesh_NodeAttributes,TopTools_ShapeMapHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TopoDS_Shape, RWMesh_NodeAttributes, TopTools_ShapeMapHasher> RWMesh_NodeAttributeMap;
/* end typedefs declaration */

/***************
* class RWMesh *
***************/
%rename(rwmesh) RWMesh;
class RWMesh {
	public:
		/****** RWMesh::FormatName ******/
		/****** md5 signature: 8863a8ba0a3c5fdbbac0c46aca3d0e43 ******/
		%feature("compactdefaultargs") FormatName;
		%feature("autodoc", "
Parameters
----------
theFormat: RWMesh_NameFormat
theLabel: TDF_Label
theRefLabel: TDF_Label

Return
-------
TCollection_AsciiString

Description
-----------
Generate name for specified labels. 
Input parameter: theFormat name format to apply 
Input parameter: theLabel instance label 
Input parameter: theRefLabel product label.
") FormatName;
		static TCollection_AsciiString FormatName(RWMesh_NameFormat theFormat, const TDF_Label & theLabel, const TDF_Label & theRefLabel);

		/****** RWMesh::ReadNameAttribute ******/
		/****** md5 signature: aa66f503550211b8a83be1731945c715 ******/
		%feature("compactdefaultargs") ReadNameAttribute;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label

Return
-------
TCollection_AsciiString

Description
-----------
Read name attribute from label.
") ReadNameAttribute;
		static TCollection_AsciiString ReadNameAttribute(const TDF_Label & theLabel);

};


%extend RWMesh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class RWMesh_CafReader *
*************************/
%nodefaultctor RWMesh_CafReader;
class RWMesh_CafReader : public Standard_Transient {
	public:
		class CafDocumentTools {};
		/****** RWMesh_CafReader::CoordinateSystemConverter ******/
		/****** md5 signature: ab88d1bd4b71da58aa0d6253db43d797 ******/
		%feature("compactdefaultargs") CoordinateSystemConverter;
		%feature("autodoc", "Return
-------
RWMesh_CoordinateSystemConverter

Description
-----------
Return coordinate system converter.
") CoordinateSystemConverter;
		const RWMesh_CoordinateSystemConverter & CoordinateSystemConverter();

		/****** RWMesh_CafReader::Document ******/
		/****** md5 signature: f1ea737a8b05f13f2dfa74b0220b3aaf ******/
		%feature("compactdefaultargs") Document;
		%feature("autodoc", "Return
-------
opencascade::handle<TDocStd_Document>

Description
-----------
Return target document.
") Document;
		const opencascade::handle<TDocStd_Document> & Document();

		/****** RWMesh_CafReader::ExternalFiles ******/
		/****** md5 signature: 1100efdc16f5df4da63f3649f3bae2f1 ******/
		%feature("compactdefaultargs") ExternalFiles;
		%feature("autodoc", "Return
-------
NCollection_IndexedMap<TCollection_AsciiString>

Description
-----------
Return the list of complementary files - external references (textures, data, etc.).
") ExternalFiles;
		const NCollection_IndexedMap<TCollection_AsciiString> & ExternalFiles();

		/****** RWMesh_CafReader::ExtraStatus ******/
		/****** md5 signature: 4be6e997d4880e0ab8cc27428c8f0f54 ******/
		%feature("compactdefaultargs") ExtraStatus;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return extended status flags. 
See also: RWMesh_CafReaderStatusEx enumeration.
") ExtraStatus;
		Standard_Integer ExtraStatus();

		/****** RWMesh_CafReader::FileCoordinateSystem ******/
		/****** md5 signature: d72ac3620d44fe58451d339df9438e6a ******/
		%feature("compactdefaultargs") FileCoordinateSystem;
		%feature("autodoc", "Return
-------
gp_Ax3

Description
-----------
Return file origin coordinate system; can be UNDEFINED, which means no conversion will be done.
") FileCoordinateSystem;
		const gp_Ax3 FileCoordinateSystem();

		/****** RWMesh_CafReader::FileLengthUnit ******/
		/****** md5 signature: 14fd56cee1352d70dddb846bfcfdde08 ******/
		%feature("compactdefaultargs") FileLengthUnit;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return the length unit to convert from while reading the file, defined as scale factor for m (meters). Can be undefined (-1.0) if file format is unitless.
") FileLengthUnit;
		Standard_Real FileLengthUnit();

		/****** RWMesh_CafReader::HasFileCoordinateSystem ******/
		/****** md5 signature: da4cd60661aeb88dd4b9cedc5dc152b0 ******/
		%feature("compactdefaultargs") HasFileCoordinateSystem;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if file origin coordinate system has been defined.
") HasFileCoordinateSystem;
		Standard_Boolean HasFileCoordinateSystem();

		/****** RWMesh_CafReader::HasSystemCoordinateSystem ******/
		/****** md5 signature: b112fe205acda6f2c67c5b6f44fb07f7 ******/
		%feature("compactdefaultargs") HasSystemCoordinateSystem;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if system coordinate system has been defined; False by default.
") HasSystemCoordinateSystem;
		Standard_Boolean HasSystemCoordinateSystem();

		/****** RWMesh_CafReader::MemoryLimitMiB ******/
		/****** md5 signature: 253eb601a59ae112d72316a149f20351 ******/
		%feature("compactdefaultargs") MemoryLimitMiB;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return memory usage limit in MiB, -1 by default which means no limit.
") MemoryLimitMiB;
		Standard_Integer MemoryLimitMiB();

		/****** RWMesh_CafReader::Metadata ******/
		/****** md5 signature: e788e4dbc1ee17e53751666b1c7a1403 ******/
		%feature("compactdefaultargs") Metadata;
		%feature("autodoc", "Return
-------
TColStd_IndexedDataMapOfStringString

Description
-----------
Return metadata map.
") Metadata;
		const TColStd_IndexedDataMapOfStringString & Metadata();

		/****** RWMesh_CafReader::Perform ******/
		/****** md5 signature: fb9d26fc55229f4ce3ada0d70bce287b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theFile: str
theProgress: Message_ProgressRange

Return
-------
bool

Description
-----------
Open stream and pass it to Perform method. The Document instance should be set beforehand.
") Perform;
		bool Perform(TCollection_AsciiString theFile, const Message_ProgressRange & theProgress);

		/****** RWMesh_CafReader::Perform ******/
		/****** md5 signature: e74612796e1192fc32457c954904c5a3 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theStream: str
theProgress: Message_ProgressRange
theFile: str (optional, default to "")

Return
-------
bool

Description
-----------
Read the data from specified file.
") Perform;
		bool Perform(std::istream & theStream, const Message_ProgressRange & theProgress, TCollection_AsciiString theFile = "");

		/****** RWMesh_CafReader::ProbeHeader ******/
		/****** md5 signature: 62d0d942adff0fd3f5d25c775b2e2dde ******/
		%feature("compactdefaultargs") ProbeHeader;
		%feature("autodoc", "
Parameters
----------
theFile: str
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Open stream and pass it to ProbeHeader method.
") ProbeHeader;
		Standard_Boolean ProbeHeader(TCollection_AsciiString theFile, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** RWMesh_CafReader::ProbeHeader ******/
		/****** md5 signature: 2c51efd9dc4fbfa64c12b5e56a4545c2 ******/
		%feature("compactdefaultargs") ProbeHeader;
		%feature("autodoc", "
Parameters
----------
theStream: str
theFile: str (optional, default to "")
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Read the header data from specified file without reading entire model. The main purpose is collecting metadata and external references - for copying model into a new location, for example. Can be NOT implemented (unsupported by format / reader).
") ProbeHeader;
		Standard_Boolean ProbeHeader(std::istream & theStream, TCollection_AsciiString theFile = "", const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** RWMesh_CafReader::RootPrefix ******/
		/****** md5 signature: 23690698ed70038f8be604f633be3713 ******/
		%feature("compactdefaultargs") RootPrefix;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Return prefix for generating root labels names.
") RootPrefix;
		const TCollection_AsciiString & RootPrefix();

		/****** RWMesh_CafReader::SetCoordinateSystemConverter ******/
		/****** md5 signature: 8488d2b612c66076826cc33d2ac72536 ******/
		%feature("compactdefaultargs") SetCoordinateSystemConverter;
		%feature("autodoc", "
Parameters
----------
theConverter: RWMesh_CoordinateSystemConverter

Return
-------
None

Description
-----------
Set coordinate system converter.
") SetCoordinateSystemConverter;
		void SetCoordinateSystemConverter(const RWMesh_CoordinateSystemConverter & theConverter);

		/****** RWMesh_CafReader::SetDocument ******/
		/****** md5 signature: fefb63e21ede613b0177b88e9cb03a5f ******/
		%feature("compactdefaultargs") SetDocument;
		%feature("autodoc", "
Parameters
----------
theDoc: TDocStd_Document

Return
-------
None

Description
-----------
Set target document. Set system length unit according to the units of the document.
") SetDocument;
		void SetDocument(const opencascade::handle<TDocStd_Document> & theDoc);

		/****** RWMesh_CafReader::SetFileCoordinateSystem ******/
		/****** md5 signature: 5b98d7175d246de57ccdb9b542ea9abf ******/
		%feature("compactdefaultargs") SetFileCoordinateSystem;
		%feature("autodoc", "
Parameters
----------
theCS: gp_Ax3

Return
-------
None

Description
-----------
Set (override) file origin coordinate system to perform conversion during read.
") SetFileCoordinateSystem;
		void SetFileCoordinateSystem(const gp_Ax3 & theCS);

		/****** RWMesh_CafReader::SetFileCoordinateSystem ******/
		/****** md5 signature: 71f77ac32b577862a6651efd59130fc7 ******/
		%feature("compactdefaultargs") SetFileCoordinateSystem;
		%feature("autodoc", "
Parameters
----------
theCS: RWMesh_CoordinateSystem

Return
-------
None

Description
-----------
Set (override) file origin coordinate system to perform conversion during read.
") SetFileCoordinateSystem;
		void SetFileCoordinateSystem(RWMesh_CoordinateSystem theCS);

		/****** RWMesh_CafReader::SetFileLengthUnit ******/
		/****** md5 signature: 24dc22ac228a82196016ff9b95bad737 ******/
		%feature("compactdefaultargs") SetFileLengthUnit;
		%feature("autodoc", "
Parameters
----------
theUnits: float

Return
-------
None

Description
-----------
Set (override) file length units to convert from while reading the file, defined as scale factor for m (meters).
") SetFileLengthUnit;
		void SetFileLengthUnit(Standard_Real theUnits);

		/****** RWMesh_CafReader::SetFillIncompleteDocument ******/
		/****** md5 signature: c6d0115c05694466da17a9288ba319c3 ******/
		%feature("compactdefaultargs") SetFillIncompleteDocument;
		%feature("autodoc", "
Parameters
----------
theToFillIncomplete: bool

Return
-------
None

Description
-----------
Set flag allowing partially read file content to be put into the XDE document.
") SetFillIncompleteDocument;
		void SetFillIncompleteDocument(Standard_Boolean theToFillIncomplete);

		/****** RWMesh_CafReader::SetMemoryLimitMiB ******/
		/****** md5 signature: 8047ea1bc715ccac147f78824b0ea73a ******/
		%feature("compactdefaultargs") SetMemoryLimitMiB;
		%feature("autodoc", "
Parameters
----------
theLimitMiB: int

Return
-------
None

Description
-----------
Set memory usage limit in MiB; can be ignored by reader implementation!.
") SetMemoryLimitMiB;
		void SetMemoryLimitMiB(Standard_Integer theLimitMiB);

		/****** RWMesh_CafReader::SetRootPrefix ******/
		/****** md5 signature: 657f534b70513a001e6c397bdb5a0325 ******/
		%feature("compactdefaultargs") SetRootPrefix;
		%feature("autodoc", "
Parameters
----------
theRootPrefix: str

Return
-------
None

Description
-----------
Set prefix for generating root labels names.
") SetRootPrefix;
		void SetRootPrefix(TCollection_AsciiString theRootPrefix);

		/****** RWMesh_CafReader::SetSystemCoordinateSystem ******/
		/****** md5 signature: 7c531314d6e79c5583ab16f29a8c9fcd ******/
		%feature("compactdefaultargs") SetSystemCoordinateSystem;
		%feature("autodoc", "
Parameters
----------
theCS: gp_Ax3

Return
-------
None

Description
-----------
Set system origin coordinate system to perform conversion into during read.
") SetSystemCoordinateSystem;
		void SetSystemCoordinateSystem(const gp_Ax3 & theCS);

		/****** RWMesh_CafReader::SetSystemCoordinateSystem ******/
		/****** md5 signature: 133ae23cdde9f78e3a390a09a9d30c98 ******/
		%feature("compactdefaultargs") SetSystemCoordinateSystem;
		%feature("autodoc", "
Parameters
----------
theCS: RWMesh_CoordinateSystem

Return
-------
None

Description
-----------
Set system origin coordinate system to perform conversion into during read.
") SetSystemCoordinateSystem;
		void SetSystemCoordinateSystem(RWMesh_CoordinateSystem theCS);

		/****** RWMesh_CafReader::SetSystemLengthUnit ******/
		/****** md5 signature: 5f3c8fb3e46edd8048ef8a61eaf32fed ******/
		%feature("compactdefaultargs") SetSystemLengthUnit;
		%feature("autodoc", "
Parameters
----------
theUnits: float

Return
-------
None

Description
-----------
Set system length units to convert into while reading the file, defined as scale factor for m (meters).
") SetSystemLengthUnit;
		void SetSystemLengthUnit(Standard_Real theUnits);

		/****** RWMesh_CafReader::SingleShape ******/
		/****** md5 signature: 3346c14111103ab685485d1080bf09aa ******/
		%feature("compactdefaultargs") SingleShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return result as a single shape.
") SingleShape;
		TopoDS_Shape SingleShape();

		/****** RWMesh_CafReader::SystemCoordinateSystem ******/
		/****** md5 signature: ab4cd81dea76d6e81b65de38738c6cac ******/
		%feature("compactdefaultargs") SystemCoordinateSystem;
		%feature("autodoc", "Return
-------
gp_Ax3

Description
-----------
Return system coordinate system; UNDEFINED by default, which means that no conversion will be done.
") SystemCoordinateSystem;
		const gp_Ax3 SystemCoordinateSystem();

		/****** RWMesh_CafReader::SystemLengthUnit ******/
		/****** md5 signature: 649d8789931f8f7ac327c46ab7779ce6 ******/
		%feature("compactdefaultargs") SystemLengthUnit;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return the length unit to convert into while reading the file, defined as scale factor for m (meters); -1.0 by default, which means that NO conversion will be applied.
") SystemLengthUnit;
		Standard_Real SystemLengthUnit();

		/****** RWMesh_CafReader::ToFillIncompleteDocument ******/
		/****** md5 signature: cecf92317828330259cbb2f292c7318f ******/
		%feature("compactdefaultargs") ToFillIncompleteDocument;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Flag indicating if partially read file content should be put into the XDE document, True by default. //! Partial read means unexpected end of file, critical parsing syntax errors in the middle of file, or reached memory limit indicated by performMesh() returning False. Partial read allows importing a model even in case of formal reading failure, so that it will be up to user to decide if processed data has any value. //! In case of partial read (performMesh() returns False, but there are some data that could be put into document), Perform() will return True and result flag will have failure bit set. 
See also: MemoryLimitMiB(), ExtraStatus().
") ToFillIncompleteDocument;
		Standard_Boolean ToFillIncompleteDocument();

};


%make_alias(RWMesh_CafReader)

%extend RWMesh_CafReader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWMesh_CoordinateSystemConverter *
*****************************************/
class RWMesh_CoordinateSystemConverter {
	public:
		/****** RWMesh_CoordinateSystemConverter::RWMesh_CoordinateSystemConverter ******/
		/****** md5 signature: bcb5a19480807e1b0334c5d795c4be59 ******/
		%feature("compactdefaultargs") RWMesh_CoordinateSystemConverter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") RWMesh_CoordinateSystemConverter;
		 RWMesh_CoordinateSystemConverter();

		/****** RWMesh_CoordinateSystemConverter::HasInputCoordinateSystem ******/
		/****** md5 signature: 74c9b0dd8f1c4c5d552747fc4d3ea778 ******/
		%feature("compactdefaultargs") HasInputCoordinateSystem;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if source coordinate system has been set; False by default.
") HasInputCoordinateSystem;
		Standard_Boolean HasInputCoordinateSystem();

		/****** RWMesh_CoordinateSystemConverter::HasOutputCoordinateSystem ******/
		/****** md5 signature: 504c950bf18befad9824436f1fe538e0 ******/
		%feature("compactdefaultargs") HasOutputCoordinateSystem;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if destination coordinate system has been set; False by default.
") HasOutputCoordinateSystem;
		Standard_Boolean HasOutputCoordinateSystem();

		/****** RWMesh_CoordinateSystemConverter::Init ******/
		/****** md5 signature: 2d7f0ece7e5684e591c591cd3a988934 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theInputSystem: gp_Ax3
theInputLengthUnit: float
theOutputSystem: gp_Ax3
theOutputLengthUnit: float

Return
-------
None

Description
-----------
Initialize transformation.
") Init;
		void Init(const gp_Ax3 & theInputSystem, Standard_Real theInputLengthUnit, const gp_Ax3 & theOutputSystem, Standard_Real theOutputLengthUnit);

		/****** RWMesh_CoordinateSystemConverter::InputCoordinateSystem ******/
		/****** md5 signature: 3f7a2866294a453a53ad901a303d263e ******/
		%feature("compactdefaultargs") InputCoordinateSystem;
		%feature("autodoc", "Return
-------
gp_Ax3

Description
-----------
Source coordinate system; UNDEFINED by default.
") InputCoordinateSystem;
		const gp_Ax3 InputCoordinateSystem();

		/****** RWMesh_CoordinateSystemConverter::InputLengthUnit ******/
		/****** md5 signature: e32c18515dffaccbac8950fe43b8f4fa ******/
		%feature("compactdefaultargs") InputLengthUnit;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return source length units, defined as scale factor to m (meters). -1.0 by default, which means that NO conversion will be applied (regardless output length unit).
") InputLengthUnit;
		Standard_Real InputLengthUnit();

		/****** RWMesh_CoordinateSystemConverter::IsEmpty ******/
		/****** md5 signature: d529c07ce9e12eea3222188c82b0e80b ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if there is no transformation (target and current coordinates systems are same).
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** RWMesh_CoordinateSystemConverter::OutputCoordinateSystem ******/
		/****** md5 signature: 68af1e5a34cda818e1f3588e3a079334 ******/
		%feature("compactdefaultargs") OutputCoordinateSystem;
		%feature("autodoc", "Return
-------
gp_Ax3

Description
-----------
Destination coordinate system; UNDEFINED by default.
") OutputCoordinateSystem;
		const gp_Ax3 OutputCoordinateSystem();

		/****** RWMesh_CoordinateSystemConverter::OutputLengthUnit ******/
		/****** md5 signature: 0ae119c03ebef2a4d3b8df1aaeb82d1e ******/
		%feature("compactdefaultargs") OutputLengthUnit;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return destination length units, defined as scale factor to m (meters). -1.0 by default, which means that NO conversion will be applied (regardless input length unit).
") OutputLengthUnit;
		Standard_Real OutputLengthUnit();

		/****** RWMesh_CoordinateSystemConverter::SetInputCoordinateSystem ******/
		/****** md5 signature: db01175e9c17f68ee81a4c63910ceefc ******/
		%feature("compactdefaultargs") SetInputCoordinateSystem;
		%feature("autodoc", "
Parameters
----------
theSysFrom: gp_Ax3

Return
-------
None

Description
-----------
Set source coordinate system.
") SetInputCoordinateSystem;
		void SetInputCoordinateSystem(const gp_Ax3 & theSysFrom);

		/****** RWMesh_CoordinateSystemConverter::SetInputCoordinateSystem ******/
		/****** md5 signature: 74ea6fa24c7089026e44553845424883 ******/
		%feature("compactdefaultargs") SetInputCoordinateSystem;
		%feature("autodoc", "
Parameters
----------
theSysFrom: RWMesh_CoordinateSystem

Return
-------
None

Description
-----------
Set source coordinate system.
") SetInputCoordinateSystem;
		void SetInputCoordinateSystem(RWMesh_CoordinateSystem theSysFrom);

		/****** RWMesh_CoordinateSystemConverter::SetInputLengthUnit ******/
		/****** md5 signature: 8e0d5c594e5311f5a551042dec14a259 ******/
		%feature("compactdefaultargs") SetInputLengthUnit;
		%feature("autodoc", "
Parameters
----------
theInputScale: float

Return
-------
None

Description
-----------
Set source length units as scale factor to m (meters).
") SetInputLengthUnit;
		void SetInputLengthUnit(Standard_Real theInputScale);

		/****** RWMesh_CoordinateSystemConverter::SetOutputCoordinateSystem ******/
		/****** md5 signature: de7d4cbdce52865d84d9834d06c3af01 ******/
		%feature("compactdefaultargs") SetOutputCoordinateSystem;
		%feature("autodoc", "
Parameters
----------
theSysTo: gp_Ax3

Return
-------
None

Description
-----------
Set destination coordinate system.
") SetOutputCoordinateSystem;
		void SetOutputCoordinateSystem(const gp_Ax3 & theSysTo);

		/****** RWMesh_CoordinateSystemConverter::SetOutputCoordinateSystem ******/
		/****** md5 signature: ac5577a94bf7ada0d8b3f89d5c80aa73 ******/
		%feature("compactdefaultargs") SetOutputCoordinateSystem;
		%feature("autodoc", "
Parameters
----------
theSysTo: RWMesh_CoordinateSystem

Return
-------
None

Description
-----------
Set destination coordinate system.
") SetOutputCoordinateSystem;
		void SetOutputCoordinateSystem(RWMesh_CoordinateSystem theSysTo);

		/****** RWMesh_CoordinateSystemConverter::SetOutputLengthUnit ******/
		/****** md5 signature: 9f51cf7920399e3b32715de9cc52e029 ******/
		%feature("compactdefaultargs") SetOutputLengthUnit;
		%feature("autodoc", "
Parameters
----------
theOutputScale: float

Return
-------
None

Description
-----------
Set destination length units as scale factor to m (meters).
") SetOutputLengthUnit;
		void SetOutputLengthUnit(Standard_Real theOutputScale);

		/****** RWMesh_CoordinateSystemConverter::StandardCoordinateSystem ******/
		/****** md5 signature: 21c5c69c0733e85d1bbad7241f970870 ******/
		%feature("compactdefaultargs") StandardCoordinateSystem;
		%feature("autodoc", "
Parameters
----------
theSys: RWMesh_CoordinateSystem

Return
-------
gp_Ax3

Description
-----------
Return a standard coordinate system definition.
") StandardCoordinateSystem;
		static gp_Ax3 StandardCoordinateSystem(RWMesh_CoordinateSystem theSys);

		/****** RWMesh_CoordinateSystemConverter::TransformNormal ******/
		/****** md5 signature: 717ef79ac0a987c4ab6a07db418749d1 ******/
		%feature("compactdefaultargs") TransformNormal;
		%feature("autodoc", "
Parameters
----------
theNorm: Graphic3d_Vec3

Return
-------
None

Description
-----------
Transform normal (e.g. exclude translation/scale part of transformation).
") TransformNormal;
		void TransformNormal(Graphic3d_Vec3 & theNorm);

		/****** RWMesh_CoordinateSystemConverter::TransformPosition ******/
		/****** md5 signature: 54a90bf495fe9cc8bc5bd66216c1c8df ******/
		%feature("compactdefaultargs") TransformPosition;
		%feature("autodoc", "
Parameters
----------
thePos: gp_XYZ

Return
-------
None

Description
-----------
Transform position.
") TransformPosition;
		void TransformPosition(gp_XYZ & thePos);

		/****** RWMesh_CoordinateSystemConverter::TransformTransformation ******/
		/****** md5 signature: 41d1b592a031279063eb96769f2c6a5c ******/
		%feature("compactdefaultargs") TransformTransformation;
		%feature("autodoc", "
Parameters
----------
theTrsf: gp_Trsf

Return
-------
None

Description
-----------
Transform transformation.
") TransformTransformation;
		void TransformTransformation(gp_Trsf & theTrsf);

};


%extend RWMesh_CoordinateSystemConverter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class RWMesh_MaterialMap *
***************************/
%nodefaultctor RWMesh_MaterialMap;
class RWMesh_MaterialMap : public Standard_Transient {
	public:
		/****** RWMesh_MaterialMap::AddMaterial ******/
		/****** md5 signature: 0f9190dda4051c96b8f2a967c00a35dd ******/
		%feature("compactdefaultargs") AddMaterial;
		%feature("autodoc", "
Parameters
----------
theStyle: XCAFPrs_Style

Return
-------
TCollection_AsciiString

Description
-----------
Register material and return its name identifier.
") AddMaterial;
		virtual TCollection_AsciiString AddMaterial(const XCAFPrs_Style & theStyle);

		/****** RWMesh_MaterialMap::CopyTexture ******/
		/****** md5 signature: ee3e4de94e6fb802152cc8dc6e855ea7 ******/
		%feature("compactdefaultargs") CopyTexture;
		%feature("autodoc", "
Parameters
----------
theResTexture: str
theTexture: Image_Texture
theKey: str

Return
-------
bool

Description
-----------
Copy and rename texture file to the new location. @param[out] theResTexture result texture file path (relative to the model) 
Input parameter: theTexture original texture 
Input parameter: theKey material key.
") CopyTexture;
		virtual bool CopyTexture(TCollection_AsciiString & theResTexture, const opencascade::handle<Image_Texture> & theTexture, TCollection_AsciiString theKey);

		/****** RWMesh_MaterialMap::CreateTextureFolder ******/
		/****** md5 signature: 322adae0334fbf2be5b65dfb40347f45 ******/
		%feature("compactdefaultargs") CreateTextureFolder;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Create texture folder 'modelName/textures'; for example: MODEL: Path/ModelName.gltf IMAGES: Path/ModelName/textures/ Warning! Output folder is NOT cleared.
") CreateTextureFolder;
		virtual bool CreateTextureFolder();

		/****** RWMesh_MaterialMap::DefaultStyle ******/
		/****** md5 signature: 0cce26cdd3c825de33af4373c0cf99e8 ******/
		%feature("compactdefaultargs") DefaultStyle;
		%feature("autodoc", "Return
-------
XCAFPrs_Style

Description
-----------
Return default material definition to be used for nodes with only color defined.
") DefaultStyle;
		const XCAFPrs_Style & DefaultStyle();

		/****** RWMesh_MaterialMap::DefineMaterial ******/
		/****** md5 signature: 7f9586f95701241cc6a6b6f7bad25ebf ******/
		%feature("compactdefaultargs") DefineMaterial;
		%feature("autodoc", "
Parameters
----------
theStyle: XCAFPrs_Style
theKey: str
theName: str

Return
-------
None

Description
-----------
Virtual method actually defining the material (e.g. export to the file).
") DefineMaterial;
		virtual void DefineMaterial(const XCAFPrs_Style & theStyle, TCollection_AsciiString theKey, TCollection_AsciiString theName);

		/****** RWMesh_MaterialMap::FindMaterial ******/
		/****** md5 signature: 2f57483d42a6c3ddeac51741c6c32190 ******/
		%feature("compactdefaultargs") FindMaterial;
		%feature("autodoc", "
Parameters
----------
theStyle: XCAFPrs_Style

Return
-------
TCollection_AsciiString

Description
-----------
Find already registered material.
") FindMaterial;
		TCollection_AsciiString FindMaterial(const XCAFPrs_Style & theStyle);

		/****** RWMesh_MaterialMap::IsFailed ******/
		/****** md5 signature: 45d22ff81d4ca76a797a854e31d3557a ******/
		%feature("compactdefaultargs") IsFailed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return failed flag.
") IsFailed;
		bool IsFailed();

		/****** RWMesh_MaterialMap::SetDefaultStyle ******/
		/****** md5 signature: 69b73a5756eee96becb5ddbe7670a837 ******/
		%feature("compactdefaultargs") SetDefaultStyle;
		%feature("autodoc", "
Parameters
----------
theStyle: XCAFPrs_Style

Return
-------
None

Description
-----------
Set default material definition to be used for nodes with only color defined.
") SetDefaultStyle;
		void SetDefaultStyle(const XCAFPrs_Style & theStyle);

};


%make_alias(RWMesh_MaterialMap)

%extend RWMesh_MaterialMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class RWMesh_NodeAttributes *
******************************/
class RWMesh_NodeAttributes {
	public:
};


%extend RWMesh_NodeAttributes {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class RWMesh_ShapeIterator *
*****************************/
%nodefaultctor RWMesh_ShapeIterator;
class RWMesh_ShapeIterator {
	public:
		/****** RWMesh_ShapeIterator::Color ******/
		/****** md5 signature: 3dcb129093b0c22e4d1f5785248243fd ******/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "Return
-------
Quantity_ColorRGBA

Description
-----------
Return shape color.
") Color;
		const Quantity_ColorRGBA & Color();

		/****** RWMesh_ShapeIterator::ElemLower ******/
		/****** md5 signature: 1b94274407d81b29e54618b1e6a126ff ******/
		%feature("compactdefaultargs") ElemLower;
		%feature("autodoc", "Return
-------
int

Description
-----------
Lower element index in current triangulation.
") ElemLower;
		virtual Standard_Integer ElemLower();

		/****** RWMesh_ShapeIterator::ElemUpper ******/
		/****** md5 signature: cda1e2a7235fddd78c035789b3577116 ******/
		%feature("compactdefaultargs") ElemUpper;
		%feature("autodoc", "Return
-------
int

Description
-----------
Upper element index in current triangulation.
") ElemUpper;
		virtual Standard_Integer ElemUpper();

		/****** RWMesh_ShapeIterator::ExploredShape ******/
		/****** md5 signature: c8a47d07240c1a2b5ff731be2f859ced ******/
		%feature("compactdefaultargs") ExploredShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return explored shape.
") ExploredShape;
		const TopoDS_Shape ExploredShape();

		/****** RWMesh_ShapeIterator::HasColor ******/
		/****** md5 signature: 9d4e6cc50a499be7adbd7b5390ea23e4 ******/
		%feature("compactdefaultargs") HasColor;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if shape color is set.
") HasColor;
		bool HasColor();

		/****** RWMesh_ShapeIterator::IsEmpty ******/
		/****** md5 signature: a0e4928adb11d2dc020e274bc93d6a56 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if mesh data is defined.
") IsEmpty;
		virtual bool IsEmpty();

		/****** RWMesh_ShapeIterator::More ******/
		/****** md5 signature: 87713888b708e252f89662d4a834d604 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if iterator points to the valid triangulation.
") More;
		virtual bool More();

		/****** RWMesh_ShapeIterator::NbNodes ******/
		/****** md5 signature: 5907943d11496d21efdf8d6c0b11152f ******/
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return number of nodes for the current shape.
") NbNodes;
		virtual Standard_Integer NbNodes();

		/****** RWMesh_ShapeIterator::Next ******/
		/****** md5 signature: eed509007172061211966fad6d4bcc1a ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Find next value.
") Next;
		virtual void Next();

		/****** RWMesh_ShapeIterator::NodeLower ******/
		/****** md5 signature: a745a8fbc5081d59510a6071d2a8a596 ******/
		%feature("compactdefaultargs") NodeLower;
		%feature("autodoc", "Return
-------
int

Description
-----------
Lower node index in current shape.
") NodeLower;
		virtual Standard_Integer NodeLower();

		/****** RWMesh_ShapeIterator::NodeTransformed ******/
		/****** md5 signature: 81f4327259dabdfc72b3bb97674f28b1 ******/
		%feature("compactdefaultargs") NodeTransformed;
		%feature("autodoc", "
Parameters
----------
theNode: int

Return
-------
gp_Pnt

Description
-----------
Return the node with specified index with applied transformation.
") NodeTransformed;
		gp_Pnt NodeTransformed(const Standard_Integer theNode);

		/****** RWMesh_ShapeIterator::NodeUpper ******/
		/****** md5 signature: a1bb0e86d4530e18e136c8577044d2fe ******/
		%feature("compactdefaultargs") NodeUpper;
		%feature("autodoc", "Return
-------
int

Description
-----------
Upper node index in current shape.
") NodeUpper;
		virtual Standard_Integer NodeUpper();

		/****** RWMesh_ShapeIterator::Shape ******/
		/****** md5 signature: 92d25ecd473e1580d08407c03fee60ae ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return shape.
") Shape;
		virtual const TopoDS_Shape Shape();

		/****** RWMesh_ShapeIterator::Style ******/
		/****** md5 signature: f129121eac5f5881a96faa4e8b3ae71b ******/
		%feature("compactdefaultargs") Style;
		%feature("autodoc", "Return
-------
XCAFPrs_Style

Description
-----------
Return shape material.
") Style;
		const XCAFPrs_Style & Style();

};


%extend RWMesh_ShapeIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWMesh_TriangulationReader *
***********************************/
%nodefaultctor RWMesh_TriangulationReader;
class RWMesh_TriangulationReader : public Standard_Transient {
	public:
		class LoadingStatistic {};
		/****** RWMesh_TriangulationReader::CoordinateSystemConverter ******/
		/****** md5 signature: ab88d1bd4b71da58aa0d6253db43d797 ******/
		%feature("compactdefaultargs") CoordinateSystemConverter;
		%feature("autodoc", "Return
-------
RWMesh_CoordinateSystemConverter

Description
-----------
Returns coordinate system converter using for correct data loading.
") CoordinateSystemConverter;
		const RWMesh_CoordinateSystemConverter & CoordinateSystemConverter();

		/****** RWMesh_TriangulationReader::FileName ******/
		/****** md5 signature: dcea16627fbfa6bf9869d62bc863af8e ******/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns file name for reporting issues.
") FileName;
		const TCollection_AsciiString & FileName();

		/****** RWMesh_TriangulationReader::IsDoublePrecision ******/
		/****** md5 signature: c768d26054fe7836c133ffb1451dd7cd ******/
		%feature("compactdefaultargs") IsDoublePrecision;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns flag to fill in triangulation using double or single precision; False by default.
") IsDoublePrecision;
		bool IsDoublePrecision();

		/****** RWMesh_TriangulationReader::Load ******/
		/****** md5 signature: 6ef3f09c92594cbd8fa638ca01586c5d ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
theSourceMesh: RWMesh_TriangulationSource
theDestMesh: Poly_Triangulation
theFileSystem: OSD_FileSystem

Return
-------
bool

Description
-----------
Loads primitive array.
") Load;
		bool Load(const opencascade::handle<RWMesh_TriangulationSource> & theSourceMesh, const opencascade::handle<Poly_Triangulation> & theDestMesh, const opencascade::handle<OSD_FileSystem> & theFileSystem);

		/****** RWMesh_TriangulationReader::PrintStatistic ******/
		/****** md5 signature: 4491817941f6da0eae292263140d0469 ******/
		%feature("compactdefaultargs") PrintStatistic;
		%feature("autodoc", "Return
-------
None

Description
-----------
Prints loading statistic. This method should be used between StartStatistic() and StopStatistic() calls for correct results.
") PrintStatistic;
		void PrintStatistic();

		/****** RWMesh_TriangulationReader::SetCoordinateSystemConverter ******/
		/****** md5 signature: 8488d2b612c66076826cc33d2ac72536 ******/
		%feature("compactdefaultargs") SetCoordinateSystemConverter;
		%feature("autodoc", "
Parameters
----------
theConverter: RWMesh_CoordinateSystemConverter

Return
-------
None

Description
-----------
Sets coordinate system converter.
") SetCoordinateSystemConverter;
		void SetCoordinateSystemConverter(const RWMesh_CoordinateSystemConverter & theConverter);

		/****** RWMesh_TriangulationReader::SetDoublePrecision ******/
		/****** md5 signature: 2fee9d611d346cc1324a9f63e1c71f99 ******/
		%feature("compactdefaultargs") SetDoublePrecision;
		%feature("autodoc", "
Parameters
----------
theIsDouble: bool

Return
-------
None

Description
-----------
Sets flag to fill in triangulation using double or single precision.
") SetDoublePrecision;
		void SetDoublePrecision(bool theIsDouble);

		/****** RWMesh_TriangulationReader::SetFileName ******/
		/****** md5 signature: 422e5cf48ba6ffc1d4cf82f2fe6d97c2 ******/
		%feature("compactdefaultargs") SetFileName;
		%feature("autodoc", "
Parameters
----------
theFileName: str

Return
-------
None

Description
-----------
Sets file name for reporting issues.
") SetFileName;
		void SetFileName(TCollection_AsciiString theFileName);

		/****** RWMesh_TriangulationReader::SetToPrintDebugMessages ******/
		/****** md5 signature: dcbcbd79fdeab4f6976a1573fd9e5905 ******/
		%feature("compactdefaultargs") SetToPrintDebugMessages;
		%feature("autodoc", "
Parameters
----------
theToPrint: bool

Return
-------
None

Description
-----------
Sets flag to print debug information.
") SetToPrintDebugMessages;
		void SetToPrintDebugMessages(const Standard_Boolean theToPrint);

		/****** RWMesh_TriangulationReader::SetToSkipDegenerates ******/
		/****** md5 signature: 8f2eee3a91d34501a755dd28a3a30824 ******/
		%feature("compactdefaultargs") SetToSkipDegenerates;
		%feature("autodoc", "
Parameters
----------
theToSkip: bool

Return
-------
None

Description
-----------
Sets flag to skip degenerated triangles during mesh loading (only indexes will be checked).
") SetToSkipDegenerates;
		void SetToSkipDegenerates(const Standard_Boolean theToSkip);

		/****** RWMesh_TriangulationReader::StartStatistic ******/
		/****** md5 signature: a4bdfbb69ed74092a59b8aa233aedc5d ******/
		%feature("compactdefaultargs") StartStatistic;
		%feature("autodoc", "Return
-------
None

Description
-----------
Starts and reset internal object that accumulates nodes/triangles statistic during data reading.
") StartStatistic;
		void StartStatistic();

		/****** RWMesh_TriangulationReader::StopStatistic ******/
		/****** md5 signature: e3418ba02f31976af952ec885530e742 ******/
		%feature("compactdefaultargs") StopStatistic;
		%feature("autodoc", "Return
-------
None

Description
-----------
Stops and nullify internal object that accumulates nodes/triangles statistic during data reading.
") StopStatistic;
		void StopStatistic();

		/****** RWMesh_TriangulationReader::ToPrintDebugMessages ******/
		/****** md5 signature: 1ba8100a86ab6979545a37ba8507ce50 ******/
		%feature("compactdefaultargs") ToPrintDebugMessages;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if additional debug information should be print.
") ToPrintDebugMessages;
		Standard_Boolean ToPrintDebugMessages();

		/****** RWMesh_TriangulationReader::ToSkipDegenerates ******/
		/****** md5 signature: 845530fc6fd2f6c43fcb01ed299e2914 ******/
		%feature("compactdefaultargs") ToSkipDegenerates;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if degenerated triangles should be skipped during mesh loading (only indexes will be checked).
") ToSkipDegenerates;
		Standard_Boolean ToSkipDegenerates();

};


%make_alias(RWMesh_TriangulationReader)

%extend RWMesh_TriangulationReader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWMesh_TriangulationSource *
***********************************/
class RWMesh_TriangulationSource : public Poly_Triangulation {
	public:
		/****** RWMesh_TriangulationSource::RWMesh_TriangulationSource ******/
		/****** md5 signature: 4fb10652420e0d188c26defed2334454 ******/
		%feature("compactdefaultargs") RWMesh_TriangulationSource;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") RWMesh_TriangulationSource;
		 RWMesh_TriangulationSource();


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetChangeDegeneratedTriNb() {
            return (Standard_Integer) $self->ChangeDegeneratedTriNb();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetChangeDegeneratedTriNb(Standard_Integer value) {
            $self->ChangeDegeneratedTriNb()=value;
            }
        };
		/****** RWMesh_TriangulationSource::DegeneratedTriNb ******/
		/****** md5 signature: 2a1611183102606c75dc3b897f8870c1 ******/
		%feature("compactdefaultargs") DegeneratedTriNb;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of degenerated triangles collected during data reading. Used for debug statistic purpose.
") DegeneratedTriNb;
		Standard_Integer DegeneratedTriNb();

		/****** RWMesh_TriangulationSource::Edge ******/
		/****** md5 signature: 30b7abc0bac6b2eca6ff6401b3245d11 ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
int

Description
-----------
Returns edge at the given index. 
Input parameter: theIndex edge index within [1, NbEdges()] range 
Return: edge node indices, with each node defined within [1, NbNodes()] range.
") Edge;
		Standard_Integer Edge(Standard_Integer theIndex);

		/****** RWMesh_TriangulationSource::HasGeometry ******/
		/****** md5 signature: 21b6a7b12e0900a6dd35c929545a10c0 ******/
		%feature("compactdefaultargs") HasGeometry;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if triangulation has some geometry.
") HasGeometry;
		virtual Standard_Boolean HasGeometry();

		/****** RWMesh_TriangulationSource::InternalEdges ******/
		/****** md5 signature: e6d1250df13e19360d68822dd5704653 ******/
		%feature("compactdefaultargs") InternalEdges;
		%feature("autodoc", "Return
-------
NCollection_Array1<int>

Description
-----------
Returns an internal array of edges. Edge()/SetEdge() should be used instead in portable code.
") InternalEdges;
		NCollection_Array1<Standard_Integer> & InternalEdges();

		/****** RWMesh_TriangulationSource::NbDeferredNodes ******/
		/****** md5 signature: d15a5896fc85a8c93365e1d85513fbb0 ******/
		%feature("compactdefaultargs") NbDeferredNodes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of nodes for deferred loading. Note: this is estimated values defined in object header, which might be different from actually loaded values (due to broken header or extra mesh processing). Always check triangulation size of actually loaded data in code to avoid out-of-range issues.
") NbDeferredNodes;
		virtual Standard_Integer NbDeferredNodes();

		/****** RWMesh_TriangulationSource::NbDeferredTriangles ******/
		/****** md5 signature: 8c345ed875feecf632ebb9c62ff9481f ******/
		%feature("compactdefaultargs") NbDeferredTriangles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of triangles for deferred loading. Note: this is estimated values defined in object header, which might be different from actually loaded values (due to broken header or extra mesh processing). Always check triangulation size of actually loaded data in code to avoid out-of-range issues.
") NbDeferredTriangles;
		virtual Standard_Integer NbDeferredTriangles();

		/****** RWMesh_TriangulationSource::NbEdges ******/
		/****** md5 signature: 31924aa1f5b2c848f6f0ca402e060038 ******/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of edges for this triangulation.
") NbEdges;
		Standard_Integer NbEdges();

		/****** RWMesh_TriangulationSource::Reader ******/
		/****** md5 signature: 6ae7cdc70d1eaea13f56fb1f778f493a ******/
		%feature("compactdefaultargs") Reader;
		%feature("autodoc", "Return
-------
opencascade::handle<RWMesh_TriangulationReader>

Description
-----------
Returns reader allowing to read data from the buffer.
") Reader;
		const opencascade::handle<RWMesh_TriangulationReader> & Reader();

		/****** RWMesh_TriangulationSource::ResizeEdges ******/
		/****** md5 signature: ba4d4c0de1cadf877c04a0b4e4286646 ******/
		%feature("compactdefaultargs") ResizeEdges;
		%feature("autodoc", "
Parameters
----------
theNbEdges: int
theToCopyOld: bool

Return
-------
None

Description
-----------
Method resizing an internal array of triangles. 
Input parameter: theNbTriangles new number of triangles 
Input parameter: theToCopyOld copy old triangles into the new array.
") ResizeEdges;
		void ResizeEdges(Standard_Integer theNbEdges, Standard_Boolean theToCopyOld);

		/****** RWMesh_TriangulationSource::SetEdge ******/
		/****** md5 signature: 96bada08f67208fa8a620f01dd98ac09 ******/
		%feature("compactdefaultargs") SetEdge;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theEdge: int

Return
-------
None

Description
-----------
Sets an edge. 
Input parameter: theIndex edge index within [1, NbEdges()] range 
Input parameter: theEdge edge node indices, with each node defined within [1, NbNodes()] range.
") SetEdge;
		void SetEdge(Standard_Integer theIndex, Standard_Integer theEdge);

		/****** RWMesh_TriangulationSource::SetNbDeferredNodes ******/
		/****** md5 signature: 613e9c73fcbbe299958e31da2d3bf9b1 ******/
		%feature("compactdefaultargs") SetNbDeferredNodes;
		%feature("autodoc", "
Parameters
----------
theNbNodes: int

Return
-------
None

Description
-----------
Sets number of nodes for deferred loading.
") SetNbDeferredNodes;
		void SetNbDeferredNodes(const Standard_Integer theNbNodes);

		/****** RWMesh_TriangulationSource::SetNbDeferredTriangles ******/
		/****** md5 signature: 4c754aa29da9094529581631690e3ff2 ******/
		%feature("compactdefaultargs") SetNbDeferredTriangles;
		%feature("autodoc", "
Parameters
----------
theNbTris: int

Return
-------
None

Description
-----------
Sets number of triangles for deferred loading.
") SetNbDeferredTriangles;
		void SetNbDeferredTriangles(const Standard_Integer theNbTris);

		/****** RWMesh_TriangulationSource::SetReader ******/
		/****** md5 signature: 9528188554fe70d155ea3d7fb58dcd0f ******/
		%feature("compactdefaultargs") SetReader;
		%feature("autodoc", "
Parameters
----------
theReader: RWMesh_TriangulationReader

Return
-------
None

Description
-----------
Sets reader allowing to read data from the buffer.
") SetReader;
		void SetReader(const opencascade::handle<RWMesh_TriangulationReader> & theReader);

};


%make_alias(RWMesh_TriangulationSource)

%extend RWMesh_TriangulationSource {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class RWMesh_EdgeIterator *
****************************/
class RWMesh_EdgeIterator : public RWMesh_ShapeIterator {
	public:
		/****** RWMesh_EdgeIterator::RWMesh_EdgeIterator ******/
		/****** md5 signature: fc09a00b010e99aa4618492b4a5af24b ******/
		%feature("compactdefaultargs") RWMesh_EdgeIterator;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theLocation: TopLoc_Location
theToMapColors: bool (optional, default to false)
theStyle: XCAFPrs_Style (optional, default to XCAFPrs_Style())

Return
-------
None

Description
-----------
Main constructor. 
Input parameter: theLabel The label of the shape. 
Input parameter: theLocation The location of the shape. 
Input parameter: theToMapColors Flag to indicate if colors should be mapped. 
Input parameter: theStyle The style of the shape.
") RWMesh_EdgeIterator;
		 RWMesh_EdgeIterator(const TDF_Label & theLabel, const TopLoc_Location & theLocation, const Standard_Boolean theToMapColors = false, const XCAFPrs_Style & theStyle = XCAFPrs_Style());

		/****** RWMesh_EdgeIterator::RWMesh_EdgeIterator ******/
		/****** md5 signature: a1755e14795713296674bb289cef3359 ******/
		%feature("compactdefaultargs") RWMesh_EdgeIterator;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theStyle: XCAFPrs_Style (optional, default to XCAFPrs_Style())

Return
-------
None

Description
-----------
Auxiliary constructor. 
Input parameter: theShape The shape to iterate. 
Input parameter: theStyle The style of the shape.
") RWMesh_EdgeIterator;
		 RWMesh_EdgeIterator(const TopoDS_Shape & theShape, const XCAFPrs_Style & theStyle = XCAFPrs_Style());

		/****** RWMesh_EdgeIterator::Edge ******/
		/****** md5 signature: 657c12d9769667081fd960b688690cc0 ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
Return current edge.
") Edge;
		const TopoDS_Edge Edge();

		/****** RWMesh_EdgeIterator::ElemLower ******/
		/****** md5 signature: ac69501e19a0031363cfb834e6ef85e3 ******/
		%feature("compactdefaultargs") ElemLower;
		%feature("autodoc", "Return
-------
int

Description
-----------
Lower element index in current triangulation.
") ElemLower;
		Standard_Integer ElemLower();

		/****** RWMesh_EdgeIterator::ElemUpper ******/
		/****** md5 signature: e013f226a62df5f46ac42ff99fe77aa5 ******/
		%feature("compactdefaultargs") ElemUpper;
		%feature("autodoc", "Return
-------
int

Description
-----------
Upper element index in current triangulation.
") ElemUpper;
		Standard_Integer ElemUpper();

		/****** RWMesh_EdgeIterator::IsEmpty ******/
		/****** md5 signature: fcea9e2c7fadbc4451dad1a4e26a226e ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if geometry data is defined.
") IsEmpty;
		bool IsEmpty();

		/****** RWMesh_EdgeIterator::More ******/
		/****** md5 signature: 7068b42d7e26840d91e66bdebc6e70e2 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if iterator points to the valid triangulation.
") More;
		bool More();

		/****** RWMesh_EdgeIterator::NbNodes ******/
		/****** md5 signature: 93fafeff0582303a7a8474ff0276095d ******/
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return number of nodes for the current edge.
") NbNodes;
		Standard_Integer NbNodes();

		/****** RWMesh_EdgeIterator::Next ******/
		/****** md5 signature: a905a8dfa1a150902436848624e0cb08 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Find next value.
") Next;
		void Next();

		/****** RWMesh_EdgeIterator::NodeLower ******/
		/****** md5 signature: 73ebcbdc2aaa48d106969f7739560283 ******/
		%feature("compactdefaultargs") NodeLower;
		%feature("autodoc", "Return
-------
int

Description
-----------
Lower node index in current triangulation.
") NodeLower;
		Standard_Integer NodeLower();

		/****** RWMesh_EdgeIterator::NodeUpper ******/
		/****** md5 signature: c91e11c7618d147c620cf2f51a9a0b49 ******/
		%feature("compactdefaultargs") NodeUpper;
		%feature("autodoc", "Return
-------
int

Description
-----------
Upper node index in current triangulation.
") NodeUpper;
		Standard_Integer NodeUpper();

		/****** RWMesh_EdgeIterator::Polygon3D ******/
		/****** md5 signature: eef7f9b5c2989862932549cf5224cf04 ******/
		%feature("compactdefaultargs") Polygon3D;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_Polygon3D>

Description
-----------
Return current edge data.
") Polygon3D;
		const opencascade::handle<Poly_Polygon3D> & Polygon3D();

		/****** RWMesh_EdgeIterator::Shape ******/
		/****** md5 signature: 83d1ae7b8f6ade8e3949aaf82c8395b5 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return current edge.
") Shape;
		const TopoDS_Shape Shape();

		/****** RWMesh_EdgeIterator::node ******/
		/****** md5 signature: d95044de7eb552670cadad57100a51ff ******/
		%feature("compactdefaultargs") node;
		%feature("autodoc", "
Parameters
----------
theNode: int

Return
-------
gp_Pnt

Description
-----------
Return the node with specified index with applied transformation.
") node;
		gp_Pnt node(const Standard_Integer theNode);

};


%extend RWMesh_EdgeIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class RWMesh_FaceIterator *
****************************/
class RWMesh_FaceIterator : public RWMesh_ShapeIterator {
	public:
		/****** RWMesh_FaceIterator::RWMesh_FaceIterator ******/
		/****** md5 signature: 9550d252cfb1a226d1292d60d8012ca5 ******/
		%feature("compactdefaultargs") RWMesh_FaceIterator;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theLocation: TopLoc_Location
theToMapColors: bool (optional, default to false)
theStyle: XCAFPrs_Style (optional, default to XCAFPrs_Style())

Return
-------
None

Description
-----------
Main constructor. 
Input parameter: theLabel Label containing the face data 
Input parameter: theLocation Location of the face 
Input parameter: theToMapColors Flag to indicate if colors should be mapped 
Input parameter: theStyle Style information for the face.
") RWMesh_FaceIterator;
		 RWMesh_FaceIterator(const TDF_Label & theLabel, const TopLoc_Location & theLocation, const Standard_Boolean theToMapColors = false, const XCAFPrs_Style & theStyle = XCAFPrs_Style());

		/****** RWMesh_FaceIterator::RWMesh_FaceIterator ******/
		/****** md5 signature: 57b47bb450205e96f4feb877a8606d43 ******/
		%feature("compactdefaultargs") RWMesh_FaceIterator;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theStyle: XCAFPrs_Style (optional, default to XCAFPrs_Style())

Return
-------
None

Description
-----------
Auxiliary constructor. 
Input parameter: theShape Shape containing the face data 
Input parameter: theStyle Style information for the face.
") RWMesh_FaceIterator;
		 RWMesh_FaceIterator(const TopoDS_Shape & theShape, const XCAFPrs_Style & theStyle = XCAFPrs_Style());

		/****** RWMesh_FaceIterator::ElemLower ******/
		/****** md5 signature: ac69501e19a0031363cfb834e6ef85e3 ******/
		%feature("compactdefaultargs") ElemLower;
		%feature("autodoc", "Return
-------
int

Description
-----------
Lower element index in current triangulation.
") ElemLower;
		Standard_Integer ElemLower();

		/****** RWMesh_FaceIterator::ElemUpper ******/
		/****** md5 signature: e013f226a62df5f46ac42ff99fe77aa5 ******/
		%feature("compactdefaultargs") ElemUpper;
		%feature("autodoc", "Return
-------
int

Description
-----------
Upper element index in current triangulation.
") ElemUpper;
		Standard_Integer ElemUpper();

		/****** RWMesh_FaceIterator::Face ******/
		/****** md5 signature: 95406b8d0d556c0537e0768c48713f21 ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Return current face.
") Face;
		const TopoDS_Face Face();

		/****** RWMesh_FaceIterator::FaceColor ******/
		/****** md5 signature: 0f3ba9ec202ff58cbc6c3f9b79597b2e ******/
		%feature("compactdefaultargs") FaceColor;
		%feature("autodoc", "Return
-------
Quantity_ColorRGBA

Description
-----------
Return face color.
") FaceColor;
		const Quantity_ColorRGBA & FaceColor();

		/****** RWMesh_FaceIterator::FaceStyle ******/
		/****** md5 signature: d9c862b92cd1be596d93564678cbc76c ******/
		%feature("compactdefaultargs") FaceStyle;
		%feature("autodoc", "Return
-------
XCAFPrs_Style

Description
-----------
Return face material.
") FaceStyle;
		const XCAFPrs_Style & FaceStyle();

		/****** RWMesh_FaceIterator::HasFaceColor ******/
		/****** md5 signature: 1c6a60391741d362a0f27578bb7017fc ******/
		%feature("compactdefaultargs") HasFaceColor;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if face color is set.
") HasFaceColor;
		bool HasFaceColor();

		/****** RWMesh_FaceIterator::HasNormals ******/
		/****** md5 signature: cebae9ec3e325d610c43710c6d20c302 ******/
		%feature("compactdefaultargs") HasNormals;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if triangulation has defined normals.
") HasNormals;
		bool HasNormals();

		/****** RWMesh_FaceIterator::HasTexCoords ******/
		/****** md5 signature: f5f5a85a7931cb9e0f30d5c5519dc79e ******/
		%feature("compactdefaultargs") HasTexCoords;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if triangulation has defined normals.
") HasTexCoords;
		bool HasTexCoords();

		/****** RWMesh_FaceIterator::IsEmpty ******/
		/****** md5 signature: fcea9e2c7fadbc4451dad1a4e26a226e ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if mesh data is defined.
") IsEmpty;
		bool IsEmpty();

		/****** RWMesh_FaceIterator::IsEmptyMesh ******/
		/****** md5 signature: dca0a5842197db2d84fece9c81db655d ******/
		%feature("compactdefaultargs") IsEmptyMesh;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if mesh data is defined.
") IsEmptyMesh;
		bool IsEmptyMesh();

		/****** RWMesh_FaceIterator::More ******/
		/****** md5 signature: 7068b42d7e26840d91e66bdebc6e70e2 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if iterator points to the valid triangulation.
") More;
		bool More();

		/****** RWMesh_FaceIterator::NbNodes ******/
		/****** md5 signature: 93fafeff0582303a7a8474ff0276095d ******/
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return number of nodes for the current face.
") NbNodes;
		Standard_Integer NbNodes();

		/****** RWMesh_FaceIterator::NbTriangles ******/
		/****** md5 signature: 192b02c351e0888abe52f9e1c6139918 ******/
		%feature("compactdefaultargs") NbTriangles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return number of elements of specific type for the current face.
") NbTriangles;
		Standard_Integer NbTriangles();

		/****** RWMesh_FaceIterator::Next ******/
		/****** md5 signature: a905a8dfa1a150902436848624e0cb08 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Find next value.
") Next;
		void Next();

		/****** RWMesh_FaceIterator::NodeLower ******/
		/****** md5 signature: 73ebcbdc2aaa48d106969f7739560283 ******/
		%feature("compactdefaultargs") NodeLower;
		%feature("autodoc", "Return
-------
int

Description
-----------
Lower node index in current triangulation.
") NodeLower;
		Standard_Integer NodeLower();

		/****** RWMesh_FaceIterator::NodeTexCoord ******/
		/****** md5 signature: 80a58af4175663e02d8df9465dceee98 ******/
		%feature("compactdefaultargs") NodeTexCoord;
		%feature("autodoc", "
Parameters
----------
theNode: int

Return
-------
gp_Pnt2d

Description
-----------
Return texture coordinates for the node.
") NodeTexCoord;
		gp_Pnt2d NodeTexCoord(const Standard_Integer theNode);

		/****** RWMesh_FaceIterator::NodeUpper ******/
		/****** md5 signature: c91e11c7618d147c620cf2f51a9a0b49 ******/
		%feature("compactdefaultargs") NodeUpper;
		%feature("autodoc", "Return
-------
int

Description
-----------
Upper node index in current triangulation.
") NodeUpper;
		Standard_Integer NodeUpper();

		/****** RWMesh_FaceIterator::NormalTransformed ******/
		/****** md5 signature: 74bb2de6b86a11ea27e4a0cd18412b1e ******/
		%feature("compactdefaultargs") NormalTransformed;
		%feature("autodoc", "
Parameters
----------
theNode: int

Return
-------
gp_Dir

Description
-----------
Return normal at specified node index with face transformation applied and face orientation applied.
") NormalTransformed;
		gp_Dir NormalTransformed(Standard_Integer theNode);

		/****** RWMesh_FaceIterator::Shape ******/
		/****** md5 signature: 83d1ae7b8f6ade8e3949aaf82c8395b5 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return current face.
") Shape;
		const TopoDS_Shape Shape();

		/****** RWMesh_FaceIterator::TriangleOriented ******/
		/****** md5 signature: 3e3ba0379e88457ac6cf61dd23f25b99 ******/
		%feature("compactdefaultargs") TriangleOriented;
		%feature("autodoc", "
Parameters
----------
theElemIndex: int

Return
-------
Poly_Triangle

Description
-----------
Return triangle with specified index with applied Face orientation.
") TriangleOriented;
		Poly_Triangle TriangleOriented(Standard_Integer theElemIndex);

		/****** RWMesh_FaceIterator::Triangulation ******/
		/****** md5 signature: 640157cb50c1198f3e4d8cfb1696811e ******/
		%feature("compactdefaultargs") Triangulation;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Return current face triangulation.
") Triangulation;
		const opencascade::handle<Poly_Triangulation> & Triangulation();

		/****** RWMesh_FaceIterator::node ******/
		/****** md5 signature: d95044de7eb552670cadad57100a51ff ******/
		%feature("compactdefaultargs") node;
		%feature("autodoc", "
Parameters
----------
theNode: int

Return
-------
gp_Pnt

Description
-----------
Return the node with specified index with applied transformation.
") node;
		gp_Pnt node(const Standard_Integer theNode);

		/****** RWMesh_FaceIterator::normal ******/
		/****** md5 signature: 38d3d2a1d856561177d7de28baaf5870 ******/
		%feature("compactdefaultargs") normal;
		%feature("autodoc", "
Parameters
----------
theNode: int

Return
-------
gp_Dir

Description
-----------
Return normal at specified node index without face transformation applied.
") normal;
		gp_Dir normal(Standard_Integer theNode);

		/****** RWMesh_FaceIterator::triangle ******/
		/****** md5 signature: 3bb468df958d9e6f86f96995f199fc13 ******/
		%feature("compactdefaultargs") triangle;
		%feature("autodoc", "
Parameters
----------
theElemIndex: int

Return
-------
Poly_Triangle

Description
-----------
Return triangle with specified index.
") triangle;
		Poly_Triangle triangle(Standard_Integer theElemIndex);

};


%extend RWMesh_FaceIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class RWMesh_VertexIterator *
******************************/
class RWMesh_VertexIterator : public RWMesh_ShapeIterator {
	public:
		/****** RWMesh_VertexIterator::RWMesh_VertexIterator ******/
		/****** md5 signature: ffb3b34bb4080c44bc190596f87c868a ******/
		%feature("compactdefaultargs") RWMesh_VertexIterator;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theLocation: TopLoc_Location
theToMapColors: bool (optional, default to false)
theStyle: XCAFPrs_Style (optional, default to XCAFPrs_Style())

Return
-------
None

Description
-----------
Main constructor. 
Input parameter: theLabel The label of the shape. 
Input parameter: theLocation The location of the shape. 
Input parameter: theToMapColors Flag to indicate if colors should be mapped. 
Input parameter: theStyle The style of the shape.
") RWMesh_VertexIterator;
		 RWMesh_VertexIterator(const TDF_Label & theLabel, const TopLoc_Location & theLocation, const Standard_Boolean theToMapColors = false, const XCAFPrs_Style & theStyle = XCAFPrs_Style());

		/****** RWMesh_VertexIterator::RWMesh_VertexIterator ******/
		/****** md5 signature: eadff2969068894c40b29b80dd07cad5 ******/
		%feature("compactdefaultargs") RWMesh_VertexIterator;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theStyle: XCAFPrs_Style (optional, default to XCAFPrs_Style())

Return
-------
None

Description
-----------
Auxiliary constructor. 
Input parameter: theShape The shape to iterate. 
Input parameter: theStyle The style of the shape.
") RWMesh_VertexIterator;
		 RWMesh_VertexIterator(const TopoDS_Shape & theShape, const XCAFPrs_Style & theStyle = XCAFPrs_Style());

		/****** RWMesh_VertexIterator::ElemLower ******/
		/****** md5 signature: ac69501e19a0031363cfb834e6ef85e3 ******/
		%feature("compactdefaultargs") ElemLower;
		%feature("autodoc", "Return
-------
int

Description
-----------
Lower element index in current triangulation.
") ElemLower;
		Standard_Integer ElemLower();

		/****** RWMesh_VertexIterator::ElemUpper ******/
		/****** md5 signature: e013f226a62df5f46ac42ff99fe77aa5 ******/
		%feature("compactdefaultargs") ElemUpper;
		%feature("autodoc", "Return
-------
int

Description
-----------
Upper element index in current triangulation.
") ElemUpper;
		Standard_Integer ElemUpper();

		/****** RWMesh_VertexIterator::IsEmpty ******/
		/****** md5 signature: fcea9e2c7fadbc4451dad1a4e26a226e ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if geometry data is defined.
") IsEmpty;
		bool IsEmpty();

		/****** RWMesh_VertexIterator::More ******/
		/****** md5 signature: 7068b42d7e26840d91e66bdebc6e70e2 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if iterator points to the valid triangulation.
") More;
		bool More();

		/****** RWMesh_VertexIterator::NbNodes ******/
		/****** md5 signature: 93fafeff0582303a7a8474ff0276095d ******/
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return number of nodes for the current edge.
") NbNodes;
		Standard_Integer NbNodes();

		/****** RWMesh_VertexIterator::Next ******/
		/****** md5 signature: a905a8dfa1a150902436848624e0cb08 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Find next value.
") Next;
		void Next();

		/****** RWMesh_VertexIterator::NodeLower ******/
		/****** md5 signature: 73ebcbdc2aaa48d106969f7739560283 ******/
		%feature("compactdefaultargs") NodeLower;
		%feature("autodoc", "Return
-------
int

Description
-----------
Lower node index in current triangulation.
") NodeLower;
		Standard_Integer NodeLower();

		/****** RWMesh_VertexIterator::NodeUpper ******/
		/****** md5 signature: c91e11c7618d147c620cf2f51a9a0b49 ******/
		%feature("compactdefaultargs") NodeUpper;
		%feature("autodoc", "Return
-------
int

Description
-----------
Upper node index in current triangulation.
") NodeUpper;
		Standard_Integer NodeUpper();

		/****** RWMesh_VertexIterator::Point ******/
		/****** md5 signature: 4e742d9ca138939180edee86d3b37a8f ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Return current vertex data.
") Point;
		const gp_Pnt Point();

		/****** RWMesh_VertexIterator::Shape ******/
		/****** md5 signature: 83d1ae7b8f6ade8e3949aaf82c8395b5 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return current vertex.
") Shape;
		const TopoDS_Shape Shape();

		/****** RWMesh_VertexIterator::Vertex ******/
		/****** md5 signature: f6b9d30df043abdbae2c9dffcc672395 ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
Return current edge.
") Vertex;
		const TopoDS_Vertex Vertex();

		/****** RWMesh_VertexIterator::node ******/
		/****** md5 signature: d007284cc4f08a2bcdc3cf7c8abb0219 ******/
		%feature("compactdefaultargs") node;
		%feature("autodoc", "
Parameters
----------
Standard_Integer: 

Return
-------
gp_Pnt

Description
-----------
Return the node with specified index with applied transformation.
") node;
		gp_Pnt node(const Standard_Integer);

};


%extend RWMesh_VertexIterator {
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
def rwmesh_FormatName(*args):
	return rwmesh.FormatName(*args)

@deprecated
def rwmesh_ReadNameAttribute(*args):
	return rwmesh.ReadNameAttribute(*args)

@deprecated
def RWMesh_CoordinateSystemConverter_StandardCoordinateSystem(*args):
	return RWMesh_CoordinateSystemConverter.StandardCoordinateSystem(*args)

}
